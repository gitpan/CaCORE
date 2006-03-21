

##########################################################################################
package CaCORE::ApplicationService;
##########################################################################################

BEGIN {
	use LWP::UserAgent;
	use HTTP::Request::Common;
}


$VERSION = '3.0';

# These are default values
my $default_proxy = "http://cabio.nci.nih.gov/cacore30/ws/caCOREService";

# CPAN namespace mapping to Java package mapping
my %cpan2java;
$cpan2java{"CaCORE::Common::Provenance"} = "gov.nih.nci.common.provenance.domain";
$cpan2java{"CaCORE::Common"} = "gov.nih.nci.common.domain";
$cpan2java{"CaCORE::CaDSR"} = "gov.nih.nci.cadsr.domain";
$cpan2java{"CaCORE::CaMOD"} = "gov.nih.nci.camod.domain";
$cpan2java{"CaCORE::CaBIO"} = "gov.nih.nci.cabio.domain";

# CPAN namespace mapping to webservice
my %cpan2ws;
$cpan2ws{"CaCORE::Common::Provenance"} = "urn:ws.domain.provenance.common.nci.nih.gov";
$cpan2ws{"CaCORE::Common"} = "urn:ws.domain.common.nci.nih.gov";
$cpan2ws{"CaCORE::CaDSR"} = "urn:ws.domain.cadsr.nci.nih.gov";
$cpan2ws{"CaCORE::CaMOD"} = "urn:ws.domain.camod.nci.nih.gov";
$cpan2ws{"CaCORE::CaBIO"} = "urn:ws.domain.cabio.nci.nih.gov";


# instance()
# Module constructor.  Creates an singleton ApplicationService instance 
# if one doesn't already exist.  The instance reference is stored in the
# _instance variable of the $class package.
#
# Returns a reference to the existing, or a newly created singleton
# object.  If the _new_instance() method returns an undefined value
# then the constructer is deemed to have failed.
sub instance {
    my $class = shift;

    # get a reference to the _instance variable in the $class package 
    no strict 'refs';
    my $instance = \${ "$class\::_instance" };

    defined $$instance
	? $$instance
	: ($$instance = $class->_new_instance(@_));
}

# _new_instance(...)
# Simple constructor
sub _new_instance {
    my $class  = shift;
    my $self = {};
    bless $self, $class;
    # set the proxy, if not available, use default
    if( $#_ >= 0 ){ $self->{proxy} = shift;}
    else{ $self->{proxy} = $default_proxy; }
    return $self;
}

# construct a SOAP request to the caCORE server
sub queryObject {
	my $self = shift;
	my $pTgt = shift;
	my $pSrc = shift;

	my $proxy = $self->{proxy};
	my $uri='caCOREService';
	my $action = "$uri/queryObject";
	
	my $userAgent = LWP::UserAgent->new(agent => 'PerlSOAP');
	
	my $msg_prefix = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"><soapenv:Body>";
	my $msg_suffix = "<multiRef id=\"id_anyArray\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" soapenc:arrayType=\"xsd:anyType[0]\" xsi:type=\"soapenc:Array\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\"/></soapenv:Body></soapenv:Envelope>";
	my $api_body_prefix = "<ns1:queryObject soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns1=\"caCoreWebService\"><arg1 xsi:type=\"xsd:string\">";
	
	# param 1: the navigational path
	# translate the domain object to the Java fully qualified name
	my @pathlets = split(",", $pTgt);
	my $javapath = "";
	# use these next 2 vars to contruct an instance of return object type, final target is first object in path
	my $firstpkgname = "";
	my $firstobjname = "";
	foreach my $pathlet (@pathlets) {
		$pathlet =~ s/ //g; # remove whitespace
		# todo: add package name # not needed for now, require user to provide full name
		my $objname = $pathlet;
		$objname =~ s/^.*:://;
		my $pkgname = $pathlet;
		$pkgname =~ s/::${objname}//;
		if( $javapath eq "" ){
			$javapath .= $cpan2java{$pkgname} . "." . $objname ;
		} else {
			$javapath .= "," . $cpan2java{$pkgname} . "." . $objname ;
		}
		if( $firstpkgname eq "" ){ $firstpkgname = $pkgname; }
		if( $firstobjname eq "" ){ $firstobjname = $objname; }
	}
	
	#my $arg1_body = "gov.nih.nci.cabio.domain.ws.ChromosomeImpl";
	my $arg1_body = $javapath;
	
	my $api_body_suffix = "</arg1><arg2 href=\"#id0\"/></ns1:queryObject>";
	
	# param 2: the WSDL xml representation of the domain object
	my $arg2_body = $pSrc->toWebserviceXML;

	my $message = $msg_prefix . $api_body_prefix . $arg1_body . $api_body_suffix . $arg2_body . $msg_suffix;
	#print"Request:\n$message\n";
	
	my $response = $userAgent->request(POST $proxy,
			Content_Type => 'text/xml',
			SOAPAction => $action,
			Content => $message);
	
	print $response->error_as_HTML unless $response->is_success;
	#print $response->as_string;
	
	# construct a object of target instance
	my $fac = CaCORE::DomainObjectFac->instance;
	my $doi = $fac->create($firstpkgname, $firstobjname);
	return $doi->fromWebserviceXML($response->content);
}

# construct a SOAP request to the caCORE server
sub query {
	my $self = shift;
	my $pTgt = shift;
	my $pSrc = shift;
	my $start = shift;
	my $size = shift;

	my $proxy = $self->{proxy};
	my $uri='caCOREService';
	my $action = "$uri/query";
	
	my $userAgent = LWP::UserAgent->new(agent => 'PerlSOAP');
	
	my $msg_prefix = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"><soapenv:Body>";
	my $msg_suffix = "<multiRef id=\"id_anyArray\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" soapenc:arrayType=\"xsd:anyType[0]\" xsi:type=\"soapenc:Array\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\"/></soapenv:Body></soapenv:Envelope>";
	my $api_body_prefix = "<ns1:query soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns1=\"caCoreWebService\"><arg1 xsi:type=\"xsd:string\">";
	
	# param 1: the navigational path
	# translate the domain object to the Java fully qualified name
	my @pathlets = split(",", $pTgt);
	my $javapath = "";
	# use these next 2 vars to contruct an instance of return object type, final target is first object in path
	my $firstpkgname = "";
	my $firstobjname = "";
	foreach my $pathlet (@pathlets) {
		$pathlet =~ s/ //g; # remove whitespace
		# todo: add package name # not needed for now, require user to provide full name
		my $objname = $pathlet;
		$objname =~ s/^.*:://;
		my $pkgname = $pathlet;
		$pkgname =~ s/::${objname}//;
		if( $javapath eq "" ){
			$javapath .= $cpan2java{$pkgname} . "." . $objname ;
		} else {
			$javapath .= "," . $cpan2java{$pkgname} . "." . $objname ;
		}
		if( $firstpkgname eq "" ){ $firstpkgname = $pkgname; }
		if( $firstobjname eq "" ){ $firstobjname = $objname; }
	}
	
	#my $arg1_body = "gov.nih.nci.cabio.domain.ws.ChromosomeImpl";
	my $arg1_body = $javapath;
	
	# param 3: start inex
	my $arg3 = "<arg3 xsi:type=\"xsd:int\">" . $start . "</arg3>";
	
	# param 4: requested resultset size
	my $arg4 = "<arg4 xsi:type=\"xsd:int\">" . $size . "</arg4>";
	
	my $api_body_suffix = "</arg1><arg2 href=\"#id0\"/>" . $arg3 . $arg4 . "</ns1:query>";
	
	# param 2 definition: the WSDL xml representation of the domain object
	my $arg2_body = $pSrc->toWebserviceXML;
	
	my $message = $msg_prefix . $api_body_prefix . $arg1_body . $api_body_suffix . $arg2_body . $msg_suffix;
	#print"Request:\n$message\n";
	
	my $response = $userAgent->request(POST $proxy,
			Content_Type => 'text/xml',
			SOAPAction => $action,
			Content => $message);
	
	print $response->error_as_HTML unless $response->is_success;
	#print $response->as_string;
	
	# construct a object of target instance
	my $fac = CaCORE::DomainObjectFac->instance;
	my $doi = $fac->create($firstpkgname, $firstobjname);
	return $doi->fromWebserviceXML($response->content);
}


##########################################################################################
package CaCORE::DomainObjectI;
##########################################################################################
# common interface for all domain objects

# This allows declaration	use CaCORE::Util::DomainObjectI ':all';
our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	toWebserviceXML
	fromWebserviceXML	
);

@ISA = qw(Exporter);

# create an xml string based on my attributes
sub toWebserviceXML() {
}

# populate my own attributs given a webservice result
sub fromWebserviceXML() {
}


##########################################################################################
package CaCORE::DomainObjectFac;
##########################################################################################
# factory pattern for creating domain objects

# This allows declaration	use caCORE::util::DomainObjectI ':all';
our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	toWebserviceXML
	fromWebserviceXML	
);

use CaCORE::ApplicationService;
use CaCORE::Common;
use CaCORE::Common::Provenance;
use CaCORE::CaBIO;
use CaCORE::CaMOD;
use CaCORE::CaDSR;

@ISA = qw(Exporter);

# instance()
# Module constructor.  Creates an singleton ApplicationService instance 
# if one doesn't already exist.  The instance reference is stored in the
# _instance variable of the $class package.
#
# Returns a reference to the existing, or a newly created singleton
# object.  If the _new_instance() method returns an undefined value
# then the constructer is deemed to have failed.
sub instance {
    my $class = shift;

    # get a reference to the _instance variable in the $class package 
    no strict 'refs';
    my $instance = \${ "$class\::_instance" };

    defined $$instance
	? $$instance
	: ($$instance = $class->_new_instance(@_));
}

# _new_instance(...)
# Simple constructor
sub _new_instance {
    my $class  = shift;
    bless {}, $class;
}

# create an instance of a DomainObjectI
# param 1: package name
# param 2: domain object name
# returns: an instance of the domain object
sub create {
	my ($self, $pkgname, $objname) = @_;
	my $newobj;
	#print "pkg=".$pkgname." obj=".$objname."\n";
	
	if( 1 == 2 ) { }
	## begin DOMAIN OBJECT creator ##
	elsif ($pkgname eq "CaCORE::Common::Provenance" && $objname eq "SourceReference") {
		$newobj = new CaCORE::Common::Provenance::SourceReference;
	}
	elsif ($pkgname eq "CaCORE::Common::Provenance" && $objname eq "Source") {
		$newobj = new CaCORE::Common::Provenance::Source;
	}
	elsif ($pkgname eq "CaCORE::Common::Provenance" && $objname eq "Provenance") {
		$newobj = new CaCORE::Common::Provenance::Provenance;
	}
	elsif ($pkgname eq "CaCORE::Common::Provenance" && $objname eq "URLSourceReference") {
		$newobj = new CaCORE::Common::Provenance::URLSourceReference;
	}
	elsif ($pkgname eq "CaCORE::Common::Provenance" && $objname eq "PublicationSource") {
		$newobj = new CaCORE::Common::Provenance::PublicationSource;
	}
	elsif ($pkgname eq "CaCORE::Common::Provenance" && $objname eq "ResearchInstitutionSource") {
		$newobj = new CaCORE::Common::Provenance::ResearchInstitutionSource;
	}
	elsif ($pkgname eq "CaCORE::Common::Provenance" && $objname eq "WebServicesSourceReference") {
		$newobj = new CaCORE::Common::Provenance::WebServicesSourceReference;
	}
	elsif ($pkgname eq "CaCORE::Common::Provenance" && $objname eq "InternetSource") {
		$newobj = new CaCORE::Common::Provenance::InternetSource;
	}
	elsif ($pkgname eq "CaCORE::Common" && $objname eq "DatabaseCrossReference") {
		$newobj = new CaCORE::Common::DatabaseCrossReference;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "Context") {
		$newobj = new CaCORE::CaDSR::Context;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "AdministeredComponent") {
		$newobj = new CaCORE::CaDSR::AdministeredComponent;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "DerivationType") {
		$newobj = new CaCORE::CaDSR::DerivationType;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "ConceptDerivationRule") {
		$newobj = new CaCORE::CaDSR::ConceptDerivationRule;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "ConceptualDomain") {
		$newobj = new CaCORE::CaDSR::ConceptualDomain;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "ObjectClass") {
		$newobj = new CaCORE::CaDSR::ObjectClass;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "Qualifier") {
		$newobj = new CaCORE::CaDSR::Qualifier;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "Property") {
		$newobj = new CaCORE::CaDSR::Property;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "DataElementConcept") {
		$newobj = new CaCORE::CaDSR::DataElementConcept;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "Representation") {
		$newobj = new CaCORE::CaDSR::Representation;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "ValueDomain") {
		$newobj = new CaCORE::CaDSR::ValueDomain;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "DerivedDataElement") {
		$newobj = new CaCORE::CaDSR::DerivedDataElement;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "DataElement") {
		$newobj = new CaCORE::CaDSR::DataElement;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "ClassificationScheme") {
		$newobj = new CaCORE::CaDSR::ClassificationScheme;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "ClassificationSchemeItem") {
		$newobj = new CaCORE::CaDSR::ClassificationSchemeItem;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "ValueMeaning") {
		$newobj = new CaCORE::CaDSR::ValueMeaning;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "PermissibleValue") {
		$newobj = new CaCORE::CaDSR::PermissibleValue;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "ReferenceDocument") {
		$newobj = new CaCORE::CaDSR::ReferenceDocument;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "ProtocolFormsTemplate") {
		$newobj = new CaCORE::CaDSR::ProtocolFormsTemplate;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "ProtocolFormsSet") {
		$newobj = new CaCORE::CaDSR::ProtocolFormsSet;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "CaseReportForm") {
		$newobj = new CaCORE::CaDSR::CaseReportForm;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "Module") {
		$newobj = new CaCORE::CaDSR::Module;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "Question") {
		$newobj = new CaCORE::CaDSR::Question;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "EnumeratedValueDomain") {
		$newobj = new CaCORE::CaDSR::EnumeratedValueDomain;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "Concept") {
		$newobj = new CaCORE::CaDSR::Concept;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "ValueDomainPermissibleValue") {
		$newobj = new CaCORE::CaDSR::ValueDomainPermissibleValue;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "ValidValue") {
		$newobj = new CaCORE::CaDSR::ValidValue;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "Designation") {
		$newobj = new CaCORE::CaDSR::Designation;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "NonenumeratedValueDomain") {
		$newobj = new CaCORE::CaDSR::NonenumeratedValueDomain;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "DataElementConceptRelationship") {
		$newobj = new CaCORE::CaDSR::DataElementConceptRelationship;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "ClassSchemeClassSchemeItem") {
		$newobj = new CaCORE::CaDSR::ClassSchemeClassSchemeItem;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "DataElementDerivation") {
		$newobj = new CaCORE::CaDSR::DataElementDerivation;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "AdministeredComponentClassSchemeItem") {
		$newobj = new CaCORE::CaDSR::AdministeredComponentClassSchemeItem;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "Instruction") {
		$newobj = new CaCORE::CaDSR::Instruction;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "DataElementRelationship") {
		$newobj = new CaCORE::CaDSR::DataElementRelationship;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "ValueDomainRelationship") {
		$newobj = new CaCORE::CaDSR::ValueDomainRelationship;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "ClassificationSchemeRelationship") {
		$newobj = new CaCORE::CaDSR::ClassificationSchemeRelationship;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "ClassificationSchemeItemRelationship") {
		$newobj = new CaCORE::CaDSR::ClassificationSchemeItemRelationship;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "ObjectClassRelationship") {
		$newobj = new CaCORE::CaDSR::ObjectClassRelationship;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "ComponentConcept") {
		$newobj = new CaCORE::CaDSR::ComponentConcept;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "Definition") {
		$newobj = new CaCORE::CaDSR::Definition;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "DesignationClassSchemeItem") {
		$newobj = new CaCORE::CaDSR::DesignationClassSchemeItem;
	}
	elsif ($pkgname eq "CaCORE::CaDSR" && $objname eq "DefinitionClassSchemeItem") {
		$newobj = new CaCORE::CaDSR::DefinitionClassSchemeItem;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "ApprovalStatus") {
		$newobj = new CaCORE::CaMOD::ApprovalStatus;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "Availability") {
		$newobj = new CaCORE::CaMOD::Availability;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "AbstractCancerModel") {
		$newobj = new CaCORE::CaMOD::AbstractCancerModel;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "TumorCode") {
		$newobj = new CaCORE::CaMOD::TumorCode;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "Xenograft") {
		$newobj = new CaCORE::CaMOD::Xenograft;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "TreatmentSchedule") {
		$newobj = new CaCORE::CaMOD::TreatmentSchedule;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "Nomenclature") {
		$newobj = new CaCORE::CaMOD::Nomenclature;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "GenotypeSummary") {
		$newobj = new CaCORE::CaMOD::GenotypeSummary;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "Conditionality") {
		$newobj = new CaCORE::CaMOD::Conditionality;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "Image") {
		$newobj = new CaCORE::CaMOD::Image;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "EngineeredGene") {
		$newobj = new CaCORE::CaMOD::EngineeredGene;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "IntegrationType") {
		$newobj = new CaCORE::CaMOD::IntegrationType;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "Transgene") {
		$newobj = new CaCORE::CaMOD::Transgene;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "Therapy") {
		$newobj = new CaCORE::CaMOD::Therapy;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "YeastModel") {
		$newobj = new CaCORE::CaMOD::YeastModel;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "TargetedModification") {
		$newobj = new CaCORE::CaMOD::TargetedModification;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "SexDistribution") {
		$newobj = new CaCORE::CaMOD::SexDistribution;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "SegmentType") {
		$newobj = new CaCORE::CaMOD::SegmentType;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "Role") {
		$newobj = new CaCORE::CaMOD::Role;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "RepositoryInfo") {
		$newobj = new CaCORE::CaMOD::RepositoryInfo;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "RegulatoryElementType") {
		$newobj = new CaCORE::CaMOD::RegulatoryElementType;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "RegulatoryElement") {
		$newobj = new CaCORE::CaMOD::RegulatoryElement;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "PublicationStatus") {
		$newobj = new CaCORE::CaMOD::PublicationStatus;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "Publication") {
		$newobj = new CaCORE::CaMOD::Publication;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "Promoter") {
		$newobj = new CaCORE::CaMOD::Promoter;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "Phenotype") {
		$newobj = new CaCORE::CaMOD::Phenotype;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "Party") {
		$newobj = new CaCORE::CaMOD::Party;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "Person") {
		$newobj = new CaCORE::CaMOD::Person;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "PartyRole") {
		$newobj = new CaCORE::CaMOD::PartyRole;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "Organization") {
		$newobj = new CaCORE::CaMOD::Organization;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "MicroArrayData") {
		$newobj = new CaCORE::CaMOD::MicroArrayData;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "JaxInfo") {
		$newobj = new CaCORE::CaMOD::JaxInfo;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "EnvironmentalFactor") {
		$newobj = new CaCORE::CaMOD::EnvironmentalFactor;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "InducedMutation") {
		$newobj = new CaCORE::CaMOD::InducedMutation;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "GenomicSegment") {
		$newobj = new CaCORE::CaMOD::GenomicSegment;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "GeneticAlteration") {
		$newobj = new CaCORE::CaMOD::GeneticAlteration;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "GeneFunction") {
		$newobj = new CaCORE::CaMOD::GeneFunction;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "GeneDelivery") {
		$newobj = new CaCORE::CaMOD::GeneDelivery;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "ContactInfo") {
		$newobj = new CaCORE::CaMOD::ContactInfo;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "CellLine") {
		$newobj = new CaCORE::CaMOD::CellLine;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "CarcinogenicIntervention") {
		$newobj = new CaCORE::CaMOD::CarcinogenicIntervention;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "AnimalModel") {
		$newobj = new CaCORE::CaMOD::AnimalModel;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "EndpointCode") {
		$newobj = new CaCORE::CaMOD::EndpointCode;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "ScreeningResult") {
		$newobj = new CaCORE::CaMOD::ScreeningResult;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "InvivoResult") {
		$newobj = new CaCORE::CaMOD::InvivoResult;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "ModificationType") {
		$newobj = new CaCORE::CaMOD::ModificationType;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "ExpressionFeature") {
		$newobj = new CaCORE::CaMOD::ExpressionFeature;
	}
	elsif ($pkgname eq "CaCORE::CaMOD" && $objname eq "CancerModel") {
		$newobj = new CaCORE::CaMOD::CancerModel;
	}
	elsif ($pkgname eq "CaCORE::CaBIO" && $objname eq "Taxon") {
		$newobj = new CaCORE::CaBIO::Taxon;
	}
	elsif ($pkgname eq "CaCORE::CaBIO" && $objname eq "Agent") {
		$newobj = new CaCORE::CaBIO::Agent;
	}
	elsif ($pkgname eq "CaCORE::CaBIO" && $objname eq "Chromosome") {
		$newobj = new CaCORE::CaBIO::Chromosome;
	}
	elsif ($pkgname eq "CaCORE::CaBIO" && $objname eq "Gene") {
		$newobj = new CaCORE::CaBIO::Gene;
	}
	elsif ($pkgname eq "CaCORE::CaBIO" && $objname eq "Vocabulary") {
		$newobj = new CaCORE::CaBIO::Vocabulary;
	}
	elsif ($pkgname eq "CaCORE::CaBIO" && $objname eq "Protocol") {
		$newobj = new CaCORE::CaBIO::Protocol;
	}
	elsif ($pkgname eq "CaCORE::CaBIO" && $objname eq "Tissue") {
		$newobj = new CaCORE::CaBIO::Tissue;
	}
	elsif ($pkgname eq "CaCORE::CaBIO" && $objname eq "SNP") {
		$newobj = new CaCORE::CaBIO::SNP;
	}
	elsif ($pkgname eq "CaCORE::CaBIO" && $objname eq "GeneAlias") {
		$newobj = new CaCORE::CaBIO::GeneAlias;
	}
	elsif ($pkgname eq "CaCORE::CaBIO" && $objname eq "Library") {
		$newobj = new CaCORE::CaBIO::Library;
	}
	elsif ($pkgname eq "CaCORE::CaBIO" && $objname eq "Clone") {
		$newobj = new CaCORE::CaBIO::Clone;
	}
	elsif ($pkgname eq "CaCORE::CaBIO" && $objname eq "Target") {
		$newobj = new CaCORE::CaBIO::Target;
	}
	elsif ($pkgname eq "CaCORE::CaBIO" && $objname eq "Location") {
		$newobj = new CaCORE::CaBIO::Location;
	}
	elsif ($pkgname eq "CaCORE::CaBIO" && $objname eq "CloneRelativeLocation") {
		$newobj = new CaCORE::CaBIO::CloneRelativeLocation;
	}
	elsif ($pkgname eq "CaCORE::CaBIO" && $objname eq "NucleicAcidSequence") {
		$newobj = new CaCORE::CaBIO::NucleicAcidSequence;
	}
	elsif ($pkgname eq "CaCORE::CaBIO" && $objname eq "DiseaseOntology") {
		$newobj = new CaCORE::CaBIO::DiseaseOntology;
	}
	elsif ($pkgname eq "CaCORE::CaBIO" && $objname eq "ClinicalTrialProtocol") {
		$newobj = new CaCORE::CaBIO::ClinicalTrialProtocol;
	}
	elsif ($pkgname eq "CaCORE::CaBIO" && $objname eq "ProtocolAssociation") {
		$newobj = new CaCORE::CaBIO::ProtocolAssociation;
	}
	elsif ($pkgname eq "CaCORE::CaBIO" && $objname eq "Pathway") {
		$newobj = new CaCORE::CaBIO::Pathway;
	}
	elsif ($pkgname eq "CaCORE::CaBIO" && $objname eq "OrganOntology") {
		$newobj = new CaCORE::CaBIO::OrganOntology;
	}
	elsif ($pkgname eq "CaCORE::CaBIO" && $objname eq "OrganOntologyRelationship") {
		$newobj = new CaCORE::CaBIO::OrganOntologyRelationship;
	}
	elsif ($pkgname eq "CaCORE::CaBIO" && $objname eq "Histopathology") {
		$newobj = new CaCORE::CaBIO::Histopathology;
	}
	elsif ($pkgname eq "CaCORE::CaBIO" && $objname eq "GeneOntology") {
		$newobj = new CaCORE::CaBIO::GeneOntology;
	}
	elsif ($pkgname eq "CaCORE::CaBIO" && $objname eq "GeneOntologyRelationship") {
		$newobj = new CaCORE::CaBIO::GeneOntologyRelationship;
	}
	elsif ($pkgname eq "CaCORE::CaBIO" && $objname eq "DiseaseOntologyRelationship") {
		$newobj = new CaCORE::CaBIO::DiseaseOntologyRelationship;
	}
	elsif ($pkgname eq "CaCORE::CaBIO" && $objname eq "Anomaly") {
		$newobj = new CaCORE::CaBIO::Anomaly;
	}
	elsif ($pkgname eq "CaCORE::CaBIO" && $objname eq "PopulationFrequency") {
		$newobj = new CaCORE::CaBIO::PopulationFrequency;
	}
	elsif ($pkgname eq "CaCORE::CaBIO" && $objname eq "ProteinSequence") {
		$newobj = new CaCORE::CaBIO::ProteinSequence;
	}
	elsif ($pkgname eq "CaCORE::CaBIO" && $objname eq "Protein") {
		$newobj = new CaCORE::CaBIO::Protein;
	}
	elsif ($pkgname eq "CaCORE::CaBIO" && $objname eq "ProteinAlias") {
		$newobj = new CaCORE::CaBIO::ProteinAlias;
	}
	elsif ($pkgname eq "CaCORE::CaBIO" && $objname eq "HomologousAssociation") {
		$newobj = new CaCORE::CaBIO::HomologousAssociation;
	}
	elsif ($pkgname eq "CaCORE::CaBIO" && $objname eq "PhysicalLocation") {
		$newobj = new CaCORE::CaBIO::PhysicalLocation;
	}
	elsif ($pkgname eq "CaCORE::CaBIO" && $objname eq "Cytoband") {
		$newobj = new CaCORE::CaBIO::Cytoband;
	}
	elsif ($pkgname eq "CaCORE::CaBIO" && $objname eq "CytogeneticLocation") {
		$newobj = new CaCORE::CaBIO::CytogeneticLocation;
	}
	elsif ($pkgname eq "CaCORE::CaBIO" && $objname eq "GeneRelativeLocation") {
		$newobj = new CaCORE::CaBIO::GeneRelativeLocation;
	}
	elsif ($pkgname eq "CaCORE::CaBIO" && $objname eq "GenericReporter") {
		$newobj = new CaCORE::CaBIO::GenericReporter;
	}
	elsif ($pkgname eq "CaCORE::CaBIO" && $objname eq "GenericArray") {
		$newobj = new CaCORE::CaBIO::GenericArray;
	}
	## end DOMAIN OBJECT creator ##

	return $newobj;
}

1;

__END__

# Below is module documentation for ApplicationService

=head1 ApplicationService

  CaCORE::ApplicationService is a utility class that encapsulates webservice invocation to caCORE server. ApplicationService object follows the Singleton pattern, in that each program will ONLY contain one instance of such class. The URL being passed to the instance method is the service endpoint of the caCORE webservice. If no such URL is provided in the program, it will default to the caCORE production server, "http://cabio.nci.nih.gov/cacore30/ws/caCOREService". The ApplicationService class exposes two methods: queryObject and query for search. The ApplicationService is the fundamental class that all other search methods utilizes.

=head2 Synopsis

  my $appsvc = CaCORE::ApplicationService->instance("http://cabio.nci.nih.gov/cacore30/ws/caCOREService");
  my $gene = new CaCORE::CaBIO::Gene;
  $gene->setSymbol("NAT2");
  my @chromos = $appsvc->queryObject("CaCORE::CaBIO::Chromosome", $gene);


=head2 Operations

  The following methods are supported in CaCORE::ApplicationService:
  
  instance(url): returns the ApplicationService instance. "url" is the service endpoint to a caCORE server. Example url: "http://cabio.nci.nih.gov/cacore30/ws/caCOREService".
  queryObject(targetPath, sourceObject): invoke caCORE server to search for domain objects. This method returns at most 1000 objects because caCORE webservice automatically trims the result set to 1000 if actual result set is greater than 1000.
  query(targetPath, sourceObject, startIndex, requestSize): invoke caCORE server to search for domain objects. Allows for specifying the return result set. 
  
  Description of parameters used in the above functions:
  
  url: the service endpoint to a caCORE server. Example url: "http://cabio.nci.nih.gov/cacore30/ws/caCOREService".
  targetPath: can be either a fully qualified target object name, such as "CaCORE::CaBIO::Gene"; or a series of comma separated fully qualified object names indicating a navigational path, such as "CaCORE::CaBIO::Taxon,CaCORE::CaBIO::Chromosome". This navigational path specifies the relationship to traverse when retrieving the target objects. 
  sourceObject: is the search criteria that specifies the search starting point. 
  startIndex (for method "query" only): allows for control of the starting index of the result set. When presented, requestSize must also be present. 
  requestSize (for method "query" only): defines the requested size. Server trims the return result to the requested size before returns. If the result set is smaller than the requested size, the result set is returned without trimming. 

=head2 Description

=head3 Search via ApplicationService->queryObject()

  This following example retrieves all Chromosomes whose associated genes have a symbol of "NAT2" using the direct and basic search function of ApplicationService->queryObject(). This queryObject() function encapsulates the webservice invocation to the caCORE server, and converts the returned XML into list of Chromosome objects. Parameter 1 indicates target class, Chromosome, to be retrieved. Parameter 2 indicates search criteria. In this case, is the gene associated with the chromosome. 

  use CaCORE::ApplicationService;
  use CaCORE::CaBIO;
  my $gene = new CaCORE::CaBIO::Gene;
  $gene->setSymbol("NAT2");
  my $appsvc = CaCORE::ApplicationService->instance("http://cabio.nci.nih.gov/cacore30/ws/caCOREService");
  my @chromos = $appsvc->queryObject("CaCORE::CaBIO::Chromosome", $gene);

=head3 Nested Search

  The first parameter in the search method can be constructed as a "navigation path" that reflects how these objects are related to the target object. This example retrieves all the Taxons related to the Chromosomes that are related to a Gene object: 

  my @taxons = $appsvc->queryObject("CaCORE::CaBIO::Taxon,CaCORE::CaBIO::Chromosome", $gene);
  foreach my $tx (@taxons){
    print "id= " . $tx->getId . " scientificName=" . $tx->getScientificName ."\n";
  }

=head3 Result Set Control

  Depending on the search criteria, a search may yield a large result set, which cause slower response time and increase the likelihood of failure. A throttle mechanism is provided by:

  ApplicationService->query(targetClassName, knownSourceObject, startingIndex, requestedSize)

  In the following example:
  Parameter 1 indicates name of the target object, Gene, to be retrieved
  Parameter 2 indicates search criteria. In this case, is the chromosome associated with the genes.
  Parameter 3 indicates the requested start index, 10
  Parameter 4 indicates the requested size, 20

  my @geneSet = $appsvc->query("CaCORE::CaBIO::Gene", $chromo1, 10, 20);

  This will retrieve related Gene objects from a Chromosome object, the result set starts from index number 10, and contains up to 20 Gene objects.

=head3 Limitations

  By default, when calling ApplicationService->queryObject, the caCORE server automatically trim the resultset to 1000 objects if the there more than 1000. So in reality, if you want to retrieve anything beyond 1000, you must use ApplicationService->query.

=cut
