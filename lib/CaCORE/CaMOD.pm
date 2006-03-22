# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::ApprovalStatus;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

$VERSION = '3.012';

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the ApprovalStatus object
# returns: a ApprovalStatus object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new ApprovalStatus\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this ApprovalStatus intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:ApprovalStatusImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of ApprovalStatus objects
# param: xml doc
# returns: list of ApprovalStatus objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @ApprovalStatusNodes = $root->getChildNodes;
	my $ApprovalStatusLength = $#ApprovalStatusNodes;
	#print "total bean count = $ApprovalStatusLength\n";
	
	# parse all ApprovalStatus nodes
	my @obj_list = ();
	foreach my $ApprovalStatusNode (@ApprovalStatusNodes) {
		#print "\tApprovalStatus\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $name;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($ApprovalStatusNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::ApprovalStatus;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setName($name);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getName {
	my $self = shift;
	return $self->{name};
}

sub setName {
	my $self = shift;
	$self->{name} = shift;
}

## end getters and setters ##

## begin bean association methods ##

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::Availability;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the Availability object
# returns: a Availability object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Availability\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Availability intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:AvailabilityImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# enteredDate;
	if( defined( $self->getEnteredDate ) ) {
		$tmpstr = "<enteredDate xsi:type=\"xsd:dateTime\">" . $self->getEnteredDate . "</enteredDate>";
	} else {
		$tmpstr = "<enteredDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# visibleTo;
	if( defined( $self->getVisibleTo ) ) {
		$tmpstr = "<visibleTo xsi:type=\"xsd:string\">" . $self->getVisibleTo . "</visibleTo>";
	} else {
		$tmpstr = "<visibleTo xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# releaseDate;
	if( defined( $self->getReleaseDate ) ) {
		$tmpstr = "<releaseDate xsi:type=\"xsd:dateTime\">" . $self->getReleaseDate . "</releaseDate>";
	} else {
		$tmpstr = "<releaseDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# modifiedDate;
	if( defined( $self->getModifiedDate ) ) {
		$tmpstr = "<modifiedDate xsi:type=\"xsd:dateTime\">" . $self->getModifiedDate . "</modifiedDate>";
	} else {
		$tmpstr = "<modifiedDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of Availability objects
# param: xml doc
# returns: list of Availability objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @AvailabilityNodes = $root->getChildNodes;
	my $AvailabilityLength = $#AvailabilityNodes;
	#print "total bean count = $AvailabilityLength\n";
	
	# parse all Availability nodes
	my @obj_list = ();
	foreach my $AvailabilityNode (@AvailabilityNodes) {
		#print "\tAvailability\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $enteredDate;
		my $visibleTo;
		my $releaseDate;
		my $modifiedDate;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($AvailabilityNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "enteredDate") {
				$enteredDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "visibleTo") {
				$visibleTo=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "releaseDate") {
				$releaseDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedDate") {
				$modifiedDate=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::Availability;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setEnteredDate($enteredDate);
		$newobj->setVisibleTo($visibleTo);
		$newobj->setReleaseDate($releaseDate);
		$newobj->setModifiedDate($modifiedDate);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getEnteredDate {
	my $self = shift;
	return $self->{enteredDate};
}

sub setEnteredDate {
	my $self = shift;
	$self->{enteredDate} = shift;
}

sub getVisibleTo {
	my $self = shift;
	return $self->{visibleTo};
}

sub setVisibleTo {
	my $self = shift;
	$self->{visibleTo} = shift;
}

sub getReleaseDate {
	my $self = shift;
	return $self->{releaseDate};
}

sub setReleaseDate {
	my $self = shift;
	$self->{releaseDate} = shift;
}

sub getModifiedDate {
	my $self = shift;
	return $self->{modifiedDate};
}

sub setModifiedDate {
	my $self = shift;
	$self->{modifiedDate} = shift;
}

## end getters and setters ##

## begin bean association methods ##

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::AbstractCancerModel;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the AbstractCancerModel object
# returns: a AbstractCancerModel object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new AbstractCancerModel\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this AbstractCancerModel intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:AbstractCancerModelImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# experimentDesign;
	if( defined( $self->getExperimentDesign ) ) {
		$tmpstr = "<experimentDesign xsi:type=\"xsd:string\">" . $self->getExperimentDesign . "</experimentDesign>";
	} else {
		$tmpstr = "<experimentDesign xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# modelDescriptor;
	if( defined( $self->getModelDescriptor ) ) {
		$tmpstr = "<modelDescriptor xsi:type=\"xsd:string\">" . $self->getModelDescriptor . "</modelDescriptor>";
	} else {
		$tmpstr = "<modelDescriptor xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of AbstractCancerModel objects
# param: xml doc
# returns: list of AbstractCancerModel objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @AbstractCancerModelNodes = $root->getChildNodes;
	my $AbstractCancerModelLength = $#AbstractCancerModelNodes;
	#print "total bean count = $AbstractCancerModelLength\n";
	
	# parse all AbstractCancerModel nodes
	my @obj_list = ();
	foreach my $AbstractCancerModelNode (@AbstractCancerModelNodes) {
		#print "\tAbstractCancerModel\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $experimentDesign;
		my $modelDescriptor;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($AbstractCancerModelNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "experimentDesign") {
				$experimentDesign=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modelDescriptor") {
				$modelDescriptor=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::AbstractCancerModel;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setExperimentDesign($experimentDesign);
		$newobj->setModelDescriptor($modelDescriptor);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getExperimentDesign {
	my $self = shift;
	return $self->{experimentDesign};
}

sub setExperimentDesign {
	my $self = shift;
	$self->{experimentDesign} = shift;
}

sub getModelDescriptor {
	my $self = shift;
	return $self->{modelDescriptor};
}

sub setModelDescriptor {
	my $self = shift;
	$self->{modelDescriptor} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getApprovalStatus {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::ApprovalStatus", $self);
	return $results[0];
}

sub getAvailability {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::Availability", $self);
	return $results[0];
}

sub getPartyRoleCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::PartyRole", $self);
	return @results;
}

sub getPublicationCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::Publication", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::TumorCode;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the TumorCode object
# returns: a TumorCode object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new TumorCode\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this TumorCode intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:TumorCodeImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# code;
	if( defined( $self->getCode ) ) {
		$tmpstr = "<code xsi:type=\"xsd:string\">" . $self->getCode . "</code>";
	} else {
		$tmpstr = "<code xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# description;
	if( defined( $self->getDescription ) ) {
		$tmpstr = "<description xsi:type=\"xsd:string\">" . $self->getDescription . "</description>";
	} else {
		$tmpstr = "<description xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of TumorCode objects
# param: xml doc
# returns: list of TumorCode objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @TumorCodeNodes = $root->getChildNodes;
	my $TumorCodeLength = $#TumorCodeNodes;
	#print "total bean count = $TumorCodeLength\n";
	
	# parse all TumorCode nodes
	my @obj_list = ();
	foreach my $TumorCodeNode (@TumorCodeNodes) {
		#print "\tTumorCode\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $code;
		my $description;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($TumorCodeNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "code") {
				$code=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "description") {
				$description=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::TumorCode;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setCode($code);
		$newobj->setDescription($description);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getCode {
	my $self = shift;
	return $self->{code};
}

sub setCode {
	my $self = shift;
	$self->{code} = shift;
}

sub getDescription {
	my $self = shift;
	return $self->{description};
}

sub setDescription {
	my $self = shift;
	$self->{description} = shift;
}

## end getters and setters ##

## begin bean association methods ##

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::Xenograft;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the Xenograft object
# returns: a Xenograft object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Xenograft\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Xenograft intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:XenograftImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# geneticManipulation;
	if( defined( $self->getGeneticManipulation ) ) {
		$tmpstr = "<geneticManipulation xsi:type=\"xsd:string\">" . $self->getGeneticManipulation . "</geneticManipulation>";
	} else {
		$tmpstr = "<geneticManipulation xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# administrativeSite;
	if( defined( $self->getAdministrativeSite ) ) {
		$tmpstr = "<administrativeSite xsi:type=\"xsd:string\">" . $self->getAdministrativeSite . "</administrativeSite>";
	} else {
		$tmpstr = "<administrativeSite xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# type;
	if( defined( $self->getType ) ) {
		$tmpstr = "<type xsi:type=\"xsd:string\">" . $self->getType . "</type>";
	} else {
		$tmpstr = "<type xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# parentalCellLineName;
	if( defined( $self->getParentalCellLineName ) ) {
		$tmpstr = "<parentalCellLineName xsi:type=\"xsd:string\">" . $self->getParentalCellLineName . "</parentalCellLineName>";
	} else {
		$tmpstr = "<parentalCellLineName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# modificationDescription;
	if( defined( $self->getModificationDescription ) ) {
		$tmpstr = "<modificationDescription xsi:type=\"xsd:string\">" . $self->getModificationDescription . "</modificationDescription>";
	} else {
		$tmpstr = "<modificationDescription xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# experimentDesign;
	if( defined( $self->getExperimentDesign ) ) {
		$tmpstr = "<experimentDesign xsi:type=\"xsd:string\">" . $self->getExperimentDesign . "</experimentDesign>";
	} else {
		$tmpstr = "<experimentDesign xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# modelDescriptor;
	if( defined( $self->getModelDescriptor ) ) {
		$tmpstr = "<modelDescriptor xsi:type=\"xsd:string\">" . $self->getModelDescriptor . "</modelDescriptor>";
	} else {
		$tmpstr = "<modelDescriptor xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of Xenograft objects
# param: xml doc
# returns: list of Xenograft objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @XenograftNodes = $root->getChildNodes;
	my $XenograftLength = $#XenograftNodes;
	#print "total bean count = $XenograftLength\n";
	
	# parse all Xenograft nodes
	my @obj_list = ();
	foreach my $XenograftNode (@XenograftNodes) {
		#print "\tXenograft\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $geneticManipulation;
		my $administrativeSite;
		my $type;
		my $parentalCellLineName;
		my $modificationDescription;
		my $name;
		my $experimentDesign;
		my $modelDescriptor;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($XenograftNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "geneticManipulation") {
				$geneticManipulation=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "administrativeSite") {
				$administrativeSite=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "type") {
				$type=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "parentalCellLineName") {
				$parentalCellLineName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modificationDescription") {
				$modificationDescription=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "experimentDesign") {
				$experimentDesign=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modelDescriptor") {
				$modelDescriptor=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::Xenograft;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setGeneticManipulation($geneticManipulation);
		$newobj->setAdministrativeSite($administrativeSite);
		$newobj->setType($type);
		$newobj->setParentalCellLineName($parentalCellLineName);
		$newobj->setModificationDescription($modificationDescription);
		$newobj->setName($name);
		$newobj->setExperimentDesign($experimentDesign);
		$newobj->setModelDescriptor($modelDescriptor);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getGeneticManipulation {
	my $self = shift;
	return $self->{geneticManipulation};
}

sub setGeneticManipulation {
	my $self = shift;
	$self->{geneticManipulation} = shift;
}

sub getAdministrativeSite {
	my $self = shift;
	return $self->{administrativeSite};
}

sub setAdministrativeSite {
	my $self = shift;
	$self->{administrativeSite} = shift;
}

sub getType {
	my $self = shift;
	return $self->{type};
}

sub setType {
	my $self = shift;
	$self->{type} = shift;
}

sub getParentalCellLineName {
	my $self = shift;
	return $self->{parentalCellLineName};
}

sub setParentalCellLineName {
	my $self = shift;
	$self->{parentalCellLineName} = shift;
}

sub getModificationDescription {
	my $self = shift;
	return $self->{modificationDescription};
}

sub setModificationDescription {
	my $self = shift;
	$self->{modificationDescription} = shift;
}

sub getName {
	my $self = shift;
	return $self->{name};
}

sub setName {
	my $self = shift;
	$self->{name} = shift;
}

sub getExperimentDesign {
	my $self = shift;
	return $self->{experimentDesign};
}

sub setExperimentDesign {
	my $self = shift;
	$self->{experimentDesign} = shift;
}

sub getModelDescriptor {
	my $self = shift;
	return $self->{modelDescriptor};
}

sub setModelDescriptor {
	my $self = shift;
	$self->{modelDescriptor} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getInvivoResultCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::InvivoResult", $self);
	return @results;
}

sub getTumorCode {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::TumorCode", $self);
	return $results[0];
}

sub getOriginTaxon {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::OriginTaxon", $self);
	return $results[0];
}

sub getHostTaxon {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::HostTaxon", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::TreatmentSchedule;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the TreatmentSchedule object
# returns: a TreatmentSchedule object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new TreatmentSchedule\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this TreatmentSchedule intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:TreatmentScheduleImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# regimen;
	if( defined( $self->getRegimen ) ) {
		$tmpstr = "<regimen xsi:type=\"xsd:string\">" . $self->getRegimen . "</regimen>";
	} else {
		$tmpstr = "<regimen xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dosage;
	if( defined( $self->getDosage ) ) {
		$tmpstr = "<dosage xsi:type=\"xsd:string\">" . $self->getDosage . "</dosage>";
	} else {
		$tmpstr = "<dosage xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of TreatmentSchedule objects
# param: xml doc
# returns: list of TreatmentSchedule objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @TreatmentScheduleNodes = $root->getChildNodes;
	my $TreatmentScheduleLength = $#TreatmentScheduleNodes;
	#print "total bean count = $TreatmentScheduleLength\n";
	
	# parse all TreatmentSchedule nodes
	my @obj_list = ();
	foreach my $TreatmentScheduleNode (@TreatmentScheduleNodes) {
		#print "\tTreatmentSchedule\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $regimen;
		my $dosage;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($TreatmentScheduleNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "regimen") {
				$regimen=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dosage") {
				$dosage=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::TreatmentSchedule;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setRegimen($regimen);
		$newobj->setDosage($dosage);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getRegimen {
	my $self = shift;
	return $self->{regimen};
}

sub setRegimen {
	my $self = shift;
	$self->{regimen} = shift;
}

sub getDosage {
	my $self = shift;
	return $self->{dosage};
}

sub setDosage {
	my $self = shift;
	$self->{dosage} = shift;
}

## end getters and setters ##

## begin bean association methods ##

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::Nomenclature;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the Nomenclature object
# returns: a Nomenclature object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Nomenclature\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Nomenclature intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:NomenclatureImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of Nomenclature objects
# param: xml doc
# returns: list of Nomenclature objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @NomenclatureNodes = $root->getChildNodes;
	my $NomenclatureLength = $#NomenclatureNodes;
	#print "total bean count = $NomenclatureLength\n";
	
	# parse all Nomenclature nodes
	my @obj_list = ();
	foreach my $NomenclatureNode (@NomenclatureNodes) {
		#print "\tNomenclature\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $name;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($NomenclatureNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::Nomenclature;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setName($name);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getName {
	my $self = shift;
	return $self->{name};
}

sub setName {
	my $self = shift;
	$self->{name} = shift;
}

## end getters and setters ##

## begin bean association methods ##

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::GenotypeSummary;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the GenotypeSummary object
# returns: a GenotypeSummary object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new GenotypeSummary\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this GenotypeSummary intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:GenotypeSummaryImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# summary;
	if( defined( $self->getSummary ) ) {
		$tmpstr = "<summary xsi:type=\"xsd:string\">" . $self->getSummary . "</summary>";
	} else {
		$tmpstr = "<summary xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# genotype;
	if( defined( $self->getGenotype ) ) {
		$tmpstr = "<genotype xsi:type=\"xsd:string\">" . $self->getGenotype . "</genotype>";
	} else {
		$tmpstr = "<genotype xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of GenotypeSummary objects
# param: xml doc
# returns: list of GenotypeSummary objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @GenotypeSummaryNodes = $root->getChildNodes;
	my $GenotypeSummaryLength = $#GenotypeSummaryNodes;
	#print "total bean count = $GenotypeSummaryLength\n";
	
	# parse all GenotypeSummary nodes
	my @obj_list = ();
	foreach my $GenotypeSummaryNode (@GenotypeSummaryNodes) {
		#print "\tGenotypeSummary\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $summary;
		my $genotype;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($GenotypeSummaryNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "summary") {
				$summary=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "genotype") {
				$genotype=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::GenotypeSummary;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setSummary($summary);
		$newobj->setGenotype($genotype);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getSummary {
	my $self = shift;
	return $self->{summary};
}

sub setSummary {
	my $self = shift;
	$self->{summary} = shift;
}

sub getGenotype {
	my $self = shift;
	return $self->{genotype};
}

sub setGenotype {
	my $self = shift;
	$self->{genotype} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getNomenclature {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::Nomenclature", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::Conditionality;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the Conditionality object
# returns: a Conditionality object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Conditionality\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Conditionality intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:ConditionalityImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# description;
	if( defined( $self->getDescription ) ) {
		$tmpstr = "<description xsi:type=\"xsd:string\">" . $self->getDescription . "</description>";
	} else {
		$tmpstr = "<description xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# conditionedBy;
	if( defined( $self->getConditionedBy ) ) {
		$tmpstr = "<conditionedBy xsi:type=\"xsd:string\">" . $self->getConditionedBy . "</conditionedBy>";
	} else {
		$tmpstr = "<conditionedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of Conditionality objects
# param: xml doc
# returns: list of Conditionality objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @ConditionalityNodes = $root->getChildNodes;
	my $ConditionalityLength = $#ConditionalityNodes;
	#print "total bean count = $ConditionalityLength\n";
	
	# parse all Conditionality nodes
	my @obj_list = ();
	foreach my $ConditionalityNode (@ConditionalityNodes) {
		#print "\tConditionality\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $description;
		my $conditionedBy;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($ConditionalityNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "description") {
				$description=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "conditionedBy") {
				$conditionedBy=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::Conditionality;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setDescription($description);
		$newobj->setConditionedBy($conditionedBy);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getDescription {
	my $self = shift;
	return $self->{description};
}

sub setDescription {
	my $self = shift;
	$self->{description} = shift;
}

sub getConditionedBy {
	my $self = shift;
	return $self->{conditionedBy};
}

sub setConditionedBy {
	my $self = shift;
	$self->{conditionedBy} = shift;
}

## end getters and setters ##

## begin bean association methods ##

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::Image;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the Image object
# returns: a Image object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Image\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Image intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:ImageImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# description;
	if( defined( $self->getDescription ) ) {
		$tmpstr = "<description xsi:type=\"xsd:string\">" . $self->getDescription . "</description>";
	} else {
		$tmpstr = "<description xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# title;
	if( defined( $self->getTitle ) ) {
		$tmpstr = "<title xsi:type=\"xsd:string\">" . $self->getTitle . "</title>";
	} else {
		$tmpstr = "<title xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# staining;
	if( defined( $self->getStaining ) ) {
		$tmpstr = "<staining xsi:type=\"xsd:string\">" . $self->getStaining . "</staining>";
	} else {
		$tmpstr = "<staining xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of Image objects
# param: xml doc
# returns: list of Image objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @ImageNodes = $root->getChildNodes;
	my $ImageLength = $#ImageNodes;
	#print "total bean count = $ImageLength\n";
	
	# parse all Image nodes
	my @obj_list = ();
	foreach my $ImageNode (@ImageNodes) {
		#print "\tImage\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $description;
		my $title;
		my $staining;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($ImageNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "description") {
				$description=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "title") {
				$title=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "staining") {
				$staining=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::Image;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setDescription($description);
		$newobj->setTitle($title);
		$newobj->setStaining($staining);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getDescription {
	my $self = shift;
	return $self->{description};
}

sub setDescription {
	my $self = shift;
	$self->{description} = shift;
}

sub getTitle {
	my $self = shift;
	return $self->{title};
}

sub setTitle {
	my $self = shift;
	$self->{title} = shift;
}

sub getStaining {
	my $self = shift;
	return $self->{staining};
}

sub setStaining {
	my $self = shift;
	$self->{staining} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getAvailability {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::Availability", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::EngineeredGene;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the EngineeredGene object
# returns: a EngineeredGene object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new EngineeredGene\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this EngineeredGene intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:EngineeredGeneImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# cabioId;
	if( defined( $self->getCabioId ) ) {
		$tmpstr = "<cabioId xsi:type=\"xsd:long\">" . $self->getCabioId . "</cabioId>";
	} else {
		$tmpstr = "<cabioId xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of EngineeredGene objects
# param: xml doc
# returns: list of EngineeredGene objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @EngineeredGeneNodes = $root->getChildNodes;
	my $EngineeredGeneLength = $#EngineeredGeneNodes;
	#print "total bean count = $EngineeredGeneLength\n";
	
	# parse all EngineeredGene nodes
	my @obj_list = ();
	foreach my $EngineeredGeneNode (@EngineeredGeneNodes) {
		#print "\tEngineeredGene\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $cabioId;
		my $name;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($EngineeredGeneNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "cabioId") {
				$cabioId=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::EngineeredGene;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setCabioId($cabioId);
		$newobj->setName($name);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getCabioId {
	my $self = shift;
	return $self->{cabioId};
}

sub setCabioId {
	my $self = shift;
	$self->{cabioId} = shift;
}

sub getName {
	my $self = shift;
	return $self->{name};
}

sub setName {
	my $self = shift;
	$self->{name} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getGeneCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Gene", $self);
	return @results;
}

sub getDatabaseCrossReferenceCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::Common::DatabaseCrossReference", $self);
	return @results;
}

sub getGenotypeSummary {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::GenotypeSummary", $self);
	return $results[0];
}

sub getExpressionFeatureCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::ExpressionFeature", $self);
	return @results;
}

sub getConditionality {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::Conditionality", $self);
	return $results[0];
}

sub getImage {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::Image", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::IntegrationType;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the IntegrationType object
# returns: a IntegrationType object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new IntegrationType\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this IntegrationType intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:IntegrationTypeImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of IntegrationType objects
# param: xml doc
# returns: list of IntegrationType objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @IntegrationTypeNodes = $root->getChildNodes;
	my $IntegrationTypeLength = $#IntegrationTypeNodes;
	#print "total bean count = $IntegrationTypeLength\n";
	
	# parse all IntegrationType nodes
	my @obj_list = ();
	foreach my $IntegrationTypeNode (@IntegrationTypeNodes) {
		#print "\tIntegrationType\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $name;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($IntegrationTypeNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::IntegrationType;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setName($name);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getName {
	my $self = shift;
	return $self->{name};
}

sub setName {
	my $self = shift;
	$self->{name} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getGenomicSegmentCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::GenomicSegment", $self);
	return @results;
}

sub getTransgeneCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::Transgene", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::Transgene;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the Transgene object
# returns: a Transgene object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Transgene\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Transgene intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:TransgeneImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# locationOfIntegration;
	if( defined( $self->getLocationOfIntegration ) ) {
		$tmpstr = "<locationOfIntegration xsi:type=\"xsd:string\">" . $self->getLocationOfIntegration . "</locationOfIntegration>";
	} else {
		$tmpstr = "<locationOfIntegration xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# engineeredGeneId;
	if( defined( $self->getEngineeredGeneId ) ) {
		$tmpstr = "<engineeredGeneId xsi:type=\"xsd:long\">" . $self->getEngineeredGeneId . "</engineeredGeneId>";
	} else {
		$tmpstr = "<engineeredGeneId xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# cabioId;
	if( defined( $self->getCabioId ) ) {
		$tmpstr = "<cabioId xsi:type=\"xsd:long\">" . $self->getCabioId . "</cabioId>";
	} else {
		$tmpstr = "<cabioId xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of Transgene objects
# param: xml doc
# returns: list of Transgene objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @TransgeneNodes = $root->getChildNodes;
	my $TransgeneLength = $#TransgeneNodes;
	#print "total bean count = $TransgeneLength\n";
	
	# parse all Transgene nodes
	my @obj_list = ();
	foreach my $TransgeneNode (@TransgeneNodes) {
		#print "\tTransgene\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $locationOfIntegration;
		my $engineeredGeneId;
		my $cabioId;
		my $name;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($TransgeneNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "locationOfIntegration") {
				$locationOfIntegration=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "engineeredGeneId") {
				$engineeredGeneId=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "cabioId") {
				$cabioId=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::Transgene;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setLocationOfIntegration($locationOfIntegration);
		$newobj->setEngineeredGeneId($engineeredGeneId);
		$newobj->setCabioId($cabioId);
		$newobj->setName($name);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getLocationOfIntegration {
	my $self = shift;
	return $self->{locationOfIntegration};
}

sub setLocationOfIntegration {
	my $self = shift;
	$self->{locationOfIntegration} = shift;
}

sub getEngineeredGeneId {
	my $self = shift;
	return $self->{engineeredGeneId};
}

sub setEngineeredGeneId {
	my $self = shift;
	$self->{engineeredGeneId} = shift;
}

sub getCabioId {
	my $self = shift;
	return $self->{cabioId};
}

sub setCabioId {
	my $self = shift;
	$self->{cabioId} = shift;
}

sub getName {
	my $self = shift;
	return $self->{name};
}

sub setName {
	my $self = shift;
	$self->{name} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getRegulatoryElementCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::RegulatoryElement", $self);
	return @results;
}

sub getIntegrationType {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::IntegrationType", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::Therapy;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the Therapy object
# returns: a Therapy object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Therapy\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Therapy intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:TherapyImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# experiment;
	if( defined( $self->getExperiment ) ) {
		$tmpstr = "<experiment xsi:type=\"xsd:string\">" . $self->getExperiment . "</experiment>";
	} else {
		$tmpstr = "<experiment xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# comments;
	if( defined( $self->getComments ) ) {
		$tmpstr = "<comments xsi:type=\"xsd:string\">" . $self->getComments . "</comments>";
	} else {
		$tmpstr = "<comments xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# results;
	if( defined( $self->getResults ) ) {
		$tmpstr = "<results xsi:type=\"xsd:string\">" . $self->getResults . "</results>";
	} else {
		$tmpstr = "<results xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of Therapy objects
# param: xml doc
# returns: list of Therapy objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @TherapyNodes = $root->getChildNodes;
	my $TherapyLength = $#TherapyNodes;
	#print "total bean count = $TherapyLength\n";
	
	# parse all Therapy nodes
	my @obj_list = ();
	foreach my $TherapyNode (@TherapyNodes) {
		#print "\tTherapy\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $experiment;
		my $comments;
		my $results;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($TherapyNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "experiment") {
				$experiment=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "comments") {
				$comments=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "results") {
				$results=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::Therapy;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setExperiment($experiment);
		$newobj->setComments($comments);
		$newobj->setResults($results);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getExperiment {
	my $self = shift;
	return $self->{experiment};
}

sub setExperiment {
	my $self = shift;
	$self->{experiment} = shift;
}

sub getComments {
	my $self = shift;
	return $self->{comments};
}

sub setComments {
	my $self = shift;
	$self->{comments} = shift;
}

sub getResults {
	my $self = shift;
	return $self->{results};
}

sub setResults {
	my $self = shift;
	$self->{results} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getTreatmentSchedule {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::TreatmentSchedule", $self);
	return $results[0];
}

sub getAgent {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Agent", $self);
	return $results[0];
}

sub getPublicationCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::Publication", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::YeastModel;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the YeastModel object
# returns: a YeastModel object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new YeastModel\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this YeastModel intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:YeastModelImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# experimentDesign;
	if( defined( $self->getExperimentDesign ) ) {
		$tmpstr = "<experimentDesign xsi:type=\"xsd:string\">" . $self->getExperimentDesign . "</experimentDesign>";
	} else {
		$tmpstr = "<experimentDesign xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# modelDescriptor;
	if( defined( $self->getModelDescriptor ) ) {
		$tmpstr = "<modelDescriptor xsi:type=\"xsd:string\">" . $self->getModelDescriptor . "</modelDescriptor>";
	} else {
		$tmpstr = "<modelDescriptor xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of YeastModel objects
# param: xml doc
# returns: list of YeastModel objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @YeastModelNodes = $root->getChildNodes;
	my $YeastModelLength = $#YeastModelNodes;
	#print "total bean count = $YeastModelLength\n";
	
	# parse all YeastModel nodes
	my @obj_list = ();
	foreach my $YeastModelNode (@YeastModelNodes) {
		#print "\tYeastModel\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $experimentDesign;
		my $modelDescriptor;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($YeastModelNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "experimentDesign") {
				$experimentDesign=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modelDescriptor") {
				$modelDescriptor=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::YeastModel;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setExperimentDesign($experimentDesign);
		$newobj->setModelDescriptor($modelDescriptor);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getExperimentDesign {
	my $self = shift;
	return $self->{experimentDesign};
}

sub setExperimentDesign {
	my $self = shift;
	$self->{experimentDesign} = shift;
}

sub getModelDescriptor {
	my $self = shift;
	return $self->{modelDescriptor};
}

sub setModelDescriptor {
	my $self = shift;
	$self->{modelDescriptor} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getTargetedModificationCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::TargetedModification", $self);
	return @results;
}

sub getScreeningResultCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::ScreeningResult", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::TargetedModification;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the TargetedModification object
# returns: a TargetedModification object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new TargetedModification\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this TargetedModification intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:TargetedModificationImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# esCellLineName;
	if( defined( $self->getEsCellLineName ) ) {
		$tmpstr = "<esCellLineName xsi:type=\"xsd:string\">" . $self->getEsCellLineName . "</esCellLineName>";
	} else {
		$tmpstr = "<esCellLineName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# blastocystName;
	if( defined( $self->getBlastocystName ) ) {
		$tmpstr = "<blastocystName xsi:type=\"xsd:string\">" . $self->getBlastocystName . "</blastocystName>";
	} else {
		$tmpstr = "<blastocystName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of TargetedModification objects
# param: xml doc
# returns: list of TargetedModification objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @TargetedModificationNodes = $root->getChildNodes;
	my $TargetedModificationLength = $#TargetedModificationNodes;
	#print "total bean count = $TargetedModificationLength\n";
	
	# parse all TargetedModification nodes
	my @obj_list = ();
	foreach my $TargetedModificationNode (@TargetedModificationNodes) {
		#print "\tTargetedModification\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $esCellLineName;
		my $blastocystName;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($TargetedModificationNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "esCellLineName") {
				$esCellLineName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "blastocystName") {
				$blastocystName=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::TargetedModification;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setEsCellLineName($esCellLineName);
		$newobj->setBlastocystName($blastocystName);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getEsCellLineName {
	my $self = shift;
	return $self->{esCellLineName};
}

sub setEsCellLineName {
	my $self = shift;
	$self->{esCellLineName} = shift;
}

sub getBlastocystName {
	my $self = shift;
	return $self->{blastocystName};
}

sub setBlastocystName {
	my $self = shift;
	$self->{blastocystName} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getModificationTypeCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::ModificationType", $self);
	return @results;
}

sub getYeastModel {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::YeastModel", $self);
	return $results[0];
}

sub getEngineeredGene {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::EngineeredGene", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::SexDistribution;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the SexDistribution object
# returns: a SexDistribution object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new SexDistribution\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this SexDistribution intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:SexDistributionImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# type;
	if( defined( $self->getType ) ) {
		$tmpstr = "<type xsi:type=\"xsd:string\">" . $self->getType . "</type>";
	} else {
		$tmpstr = "<type xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of SexDistribution objects
# param: xml doc
# returns: list of SexDistribution objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @SexDistributionNodes = $root->getChildNodes;
	my $SexDistributionLength = $#SexDistributionNodes;
	#print "total bean count = $SexDistributionLength\n";
	
	# parse all SexDistribution nodes
	my @obj_list = ();
	foreach my $SexDistributionNode (@SexDistributionNodes) {
		#print "\tSexDistribution\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $type;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($SexDistributionNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "type") {
				$type=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::SexDistribution;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setType($type);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getType {
	my $self = shift;
	return $self->{type};
}

sub setType {
	my $self = shift;
	$self->{type} = shift;
}

## end getters and setters ##

## begin bean association methods ##

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::SegmentType;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the SegmentType object
# returns: a SegmentType object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new SegmentType\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this SegmentType intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:SegmentTypeImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of SegmentType objects
# param: xml doc
# returns: list of SegmentType objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @SegmentTypeNodes = $root->getChildNodes;
	my $SegmentTypeLength = $#SegmentTypeNodes;
	#print "total bean count = $SegmentTypeLength\n";
	
	# parse all SegmentType nodes
	my @obj_list = ();
	foreach my $SegmentTypeNode (@SegmentTypeNodes) {
		#print "\tSegmentType\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $name;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($SegmentTypeNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::SegmentType;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setName($name);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getName {
	my $self = shift;
	return $self->{name};
}

sub setName {
	my $self = shift;
	$self->{name} = shift;
}

## end getters and setters ##

## begin bean association methods ##

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::Role;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the Role object
# returns: a Role object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Role\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Role intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:RoleImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of Role objects
# param: xml doc
# returns: list of Role objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @RoleNodes = $root->getChildNodes;
	my $RoleLength = $#RoleNodes;
	#print "total bean count = $RoleLength\n";
	
	# parse all Role nodes
	my @obj_list = ();
	foreach my $RoleNode (@RoleNodes) {
		#print "\tRole\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $name;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($RoleNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::Role;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setName($name);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getName {
	my $self = shift;
	return $self->{name};
}

sub setName {
	my $self = shift;
	$self->{name} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getPartyRoleCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::PartyRole", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::RepositoryInfo;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the RepositoryInfo object
# returns: a RepositoryInfo object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new RepositoryInfo\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this RepositoryInfo intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:RepositoryInfoImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# inTheRepository;
	if( defined( $self->getInTheRepository ) ) {
		$tmpstr = "<inTheRepository xsi:type=\"xsd:long\">" . $self->getInTheRepository . "</inTheRepository>";
	} else {
		$tmpstr = "<inTheRepository xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# sentEmailContent;
	if( defined( $self->getSentEmailContent ) ) {
		$tmpstr = "<sentEmailContent xsi:type=\"xsd:string\">" . $self->getSentEmailContent . "</sentEmailContent>";
	} else {
		$tmpstr = "<sentEmailContent xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# suggestSubmission;
	if( defined( $self->getSuggestSubmission ) ) {
		$tmpstr = "<suggestSubmission xsi:type=\"xsd:long\">" . $self->getSuggestSubmission . "</suggestSubmission>";
	} else {
		$tmpstr = "<suggestSubmission xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of RepositoryInfo objects
# param: xml doc
# returns: list of RepositoryInfo objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @RepositoryInfoNodes = $root->getChildNodes;
	my $RepositoryInfoLength = $#RepositoryInfoNodes;
	#print "total bean count = $RepositoryInfoLength\n";
	
	# parse all RepositoryInfo nodes
	my @obj_list = ();
	foreach my $RepositoryInfoNode (@RepositoryInfoNodes) {
		#print "\tRepositoryInfo\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $inTheRepository;
		my $sentEmailContent;
		my $suggestSubmission;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($RepositoryInfoNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "inTheRepository") {
				$inTheRepository=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "sentEmailContent") {
				$sentEmailContent=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "suggestSubmission") {
				$suggestSubmission=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::RepositoryInfo;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setInTheRepository($inTheRepository);
		$newobj->setSentEmailContent($sentEmailContent);
		$newobj->setSuggestSubmission($suggestSubmission);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getInTheRepository {
	my $self = shift;
	return $self->{inTheRepository};
}

sub setInTheRepository {
	my $self = shift;
	$self->{inTheRepository} = shift;
}

sub getSentEmailContent {
	my $self = shift;
	return $self->{sentEmailContent};
}

sub setSentEmailContent {
	my $self = shift;
	$self->{sentEmailContent} = shift;
}

sub getSuggestSubmission {
	my $self = shift;
	return $self->{suggestSubmission};
}

sub setSuggestSubmission {
	my $self = shift;
	$self->{suggestSubmission} = shift;
}

## end getters and setters ##

## begin bean association methods ##

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::RegulatoryElementType;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the RegulatoryElementType object
# returns: a RegulatoryElementType object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new RegulatoryElementType\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this RegulatoryElementType intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:RegulatoryElementTypeImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of RegulatoryElementType objects
# param: xml doc
# returns: list of RegulatoryElementType objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @RegulatoryElementTypeNodes = $root->getChildNodes;
	my $RegulatoryElementTypeLength = $#RegulatoryElementTypeNodes;
	#print "total bean count = $RegulatoryElementTypeLength\n";
	
	# parse all RegulatoryElementType nodes
	my @obj_list = ();
	foreach my $RegulatoryElementTypeNode (@RegulatoryElementTypeNodes) {
		#print "\tRegulatoryElementType\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $name;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($RegulatoryElementTypeNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::RegulatoryElementType;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setName($name);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getName {
	my $self = shift;
	return $self->{name};
}

sub setName {
	my $self = shift;
	$self->{name} = shift;
}

## end getters and setters ##

## begin bean association methods ##

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::RegulatoryElement;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the RegulatoryElement object
# returns: a RegulatoryElement object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new RegulatoryElement\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this RegulatoryElement intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:RegulatoryElementImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of RegulatoryElement objects
# param: xml doc
# returns: list of RegulatoryElement objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @RegulatoryElementNodes = $root->getChildNodes;
	my $RegulatoryElementLength = $#RegulatoryElementNodes;
	#print "total bean count = $RegulatoryElementLength\n";
	
	# parse all RegulatoryElement nodes
	my @obj_list = ();
	foreach my $RegulatoryElementNode (@RegulatoryElementNodes) {
		#print "\tRegulatoryElement\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $name;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($RegulatoryElementNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::RegulatoryElement;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setName($name);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getName {
	my $self = shift;
	return $self->{name};
}

sub setName {
	my $self = shift;
	$self->{name} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getPromoterCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::Promoter", $self);
	return @results;
}

sub getTaxon {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Taxon", $self);
	return $results[0];
}

sub getRegulatoryElementType {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::RegulatoryElementType", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::PublicationStatus;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the PublicationStatus object
# returns: a PublicationStatus object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new PublicationStatus\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this PublicationStatus intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:PublicationStatusImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of PublicationStatus objects
# param: xml doc
# returns: list of PublicationStatus objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @PublicationStatusNodes = $root->getChildNodes;
	my $PublicationStatusLength = $#PublicationStatusNodes;
	#print "total bean count = $PublicationStatusLength\n";
	
	# parse all PublicationStatus nodes
	my @obj_list = ();
	foreach my $PublicationStatusNode (@PublicationStatusNodes) {
		#print "\tPublicationStatus\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $name;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($PublicationStatusNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::PublicationStatus;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setName($name);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getName {
	my $self = shift;
	return $self->{name};
}

sub setName {
	my $self = shift;
	$self->{name} = shift;
}

## end getters and setters ##

## begin bean association methods ##

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::Publication;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the Publication object
# returns: a Publication object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Publication\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Publication intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:PublicationImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# volume;
	if( defined( $self->getVolume ) ) {
		$tmpstr = "<volume xsi:type=\"xsd:string\">" . $self->getVolume . "</volume>";
	} else {
		$tmpstr = "<volume xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# endPage;
	if( defined( $self->getEndPage ) ) {
		$tmpstr = "<endPage xsi:type=\"xsd:long\">" . $self->getEndPage . "</endPage>";
	} else {
		$tmpstr = "<endPage xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# year;
	if( defined( $self->getYear ) ) {
		$tmpstr = "<year xsi:type=\"xsd:long\">" . $self->getYear . "</year>";
	} else {
		$tmpstr = "<year xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# title;
	if( defined( $self->getTitle ) ) {
		$tmpstr = "<title xsi:type=\"xsd:string\">" . $self->getTitle . "</title>";
	} else {
		$tmpstr = "<title xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# pmid;
	if( defined( $self->getPmid ) ) {
		$tmpstr = "<pmid xsi:type=\"xsd:long\">" . $self->getPmid . "</pmid>";
	} else {
		$tmpstr = "<pmid xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# startPage;
	if( defined( $self->getStartPage ) ) {
		$tmpstr = "<startPage xsi:type=\"xsd:long\">" . $self->getStartPage . "</startPage>";
	} else {
		$tmpstr = "<startPage xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# journal;
	if( defined( $self->getJournal ) ) {
		$tmpstr = "<journal xsi:type=\"xsd:string\">" . $self->getJournal . "</journal>";
	} else {
		$tmpstr = "<journal xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# authors;
	if( defined( $self->getAuthors ) ) {
		$tmpstr = "<authors xsi:type=\"xsd:string\">" . $self->getAuthors . "</authors>";
	} else {
		$tmpstr = "<authors xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of Publication objects
# param: xml doc
# returns: list of Publication objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @PublicationNodes = $root->getChildNodes;
	my $PublicationLength = $#PublicationNodes;
	#print "total bean count = $PublicationLength\n";
	
	# parse all Publication nodes
	my @obj_list = ();
	foreach my $PublicationNode (@PublicationNodes) {
		#print "\tPublication\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $volume;
		my $endPage;
		my $year;
		my $title;
		my $pmid;
		my $startPage;
		my $journal;
		my $authors;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($PublicationNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "volume") {
				$volume=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "endPage") {
				$endPage=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "year") {
				$year=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "title") {
				$title=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "pmid") {
				$pmid=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "startPage") {
				$startPage=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "journal") {
				$journal=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "authors") {
				$authors=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::Publication;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setVolume($volume);
		$newobj->setEndPage($endPage);
		$newobj->setYear($year);
		$newobj->setTitle($title);
		$newobj->setPmid($pmid);
		$newobj->setStartPage($startPage);
		$newobj->setJournal($journal);
		$newobj->setAuthors($authors);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getVolume {
	my $self = shift;
	return $self->{volume};
}

sub setVolume {
	my $self = shift;
	$self->{volume} = shift;
}

sub getEndPage {
	my $self = shift;
	return $self->{endPage};
}

sub setEndPage {
	my $self = shift;
	$self->{endPage} = shift;
}

sub getYear {
	my $self = shift;
	return $self->{year};
}

sub setYear {
	my $self = shift;
	$self->{year} = shift;
}

sub getTitle {
	my $self = shift;
	return $self->{title};
}

sub setTitle {
	my $self = shift;
	$self->{title} = shift;
}

sub getPmid {
	my $self = shift;
	return $self->{pmid};
}

sub setPmid {
	my $self = shift;
	$self->{pmid} = shift;
}

sub getStartPage {
	my $self = shift;
	return $self->{startPage};
}

sub setStartPage {
	my $self = shift;
	$self->{startPage} = shift;
}

sub getJournal {
	my $self = shift;
	return $self->{journal};
}

sub setJournal {
	my $self = shift;
	$self->{journal} = shift;
}

sub getAuthors {
	my $self = shift;
	return $self->{authors};
}

sub setAuthors {
	my $self = shift;
	$self->{authors} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getPublicationStatus {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::PublicationStatus", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::Promoter;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the Promoter object
# returns: a Promoter object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Promoter\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Promoter intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:PromoterImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of Promoter objects
# param: xml doc
# returns: list of Promoter objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @PromoterNodes = $root->getChildNodes;
	my $PromoterLength = $#PromoterNodes;
	#print "total bean count = $PromoterLength\n";
	
	# parse all Promoter nodes
	my @obj_list = ();
	foreach my $PromoterNode (@PromoterNodes) {
		#print "\tPromoter\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($PromoterNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::Promoter;
		## begin set attr ##
		$newobj->setId($id);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getGene {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Gene", $self);
	return $results[0];
}

sub getRegulatoryElement {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::RegulatoryElement", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::Phenotype;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the Phenotype object
# returns: a Phenotype object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Phenotype\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Phenotype intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:PhenotypeImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# description;
	if( defined( $self->getDescription ) ) {
		$tmpstr = "<description xsi:type=\"xsd:string\">" . $self->getDescription . "</description>";
	} else {
		$tmpstr = "<description xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# breedingNotes;
	if( defined( $self->getBreedingNotes ) ) {
		$tmpstr = "<breedingNotes xsi:type=\"xsd:string\">" . $self->getBreedingNotes . "</breedingNotes>";
	} else {
		$tmpstr = "<breedingNotes xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of Phenotype objects
# param: xml doc
# returns: list of Phenotype objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @PhenotypeNodes = $root->getChildNodes;
	my $PhenotypeLength = $#PhenotypeNodes;
	#print "total bean count = $PhenotypeLength\n";
	
	# parse all Phenotype nodes
	my @obj_list = ();
	foreach my $PhenotypeNode (@PhenotypeNodes) {
		#print "\tPhenotype\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $description;
		my $breedingNotes;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($PhenotypeNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "description") {
				$description=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "breedingNotes") {
				$breedingNotes=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::Phenotype;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setDescription($description);
		$newobj->setBreedingNotes($breedingNotes);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getDescription {
	my $self = shift;
	return $self->{description};
}

sub setDescription {
	my $self = shift;
	$self->{description} = shift;
}

sub getBreedingNotes {
	my $self = shift;
	return $self->{breedingNotes};
}

sub setBreedingNotes {
	my $self = shift;
	$self->{breedingNotes} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getSexDistribution {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::SexDistribution", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::Party;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the Party object
# returns: a Party object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Party\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Party intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:PartyImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of Party objects
# param: xml doc
# returns: list of Party objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @PartyNodes = $root->getChildNodes;
	my $PartyLength = $#PartyNodes;
	#print "total bean count = $PartyLength\n";
	
	# parse all Party nodes
	my @obj_list = ();
	foreach my $PartyNode (@PartyNodes) {
		#print "\tParty\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($PartyNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::Party;
		## begin set attr ##
		$newobj->setId($id);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getPartyRoleCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::PartyRole", $self);
	return @results;
}

sub getContactInfoCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::ContactInfo", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::Person;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the Person object
# returns: a Person object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Person\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Person intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:PersonImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# partyId;
	if( defined( $self->getPartyId ) ) {
		$tmpstr = "<partyId xsi:type=\"xsd:long\">" . $self->getPartyId . "</partyId>";
	} else {
		$tmpstr = "<partyId xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# firstName;
	if( defined( $self->getFirstName ) ) {
		$tmpstr = "<firstName xsi:type=\"xsd:string\">" . $self->getFirstName . "</firstName>";
	} else {
		$tmpstr = "<firstName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# lastName;
	if( defined( $self->getLastName ) ) {
		$tmpstr = "<lastName xsi:type=\"xsd:string\">" . $self->getLastName . "</lastName>";
	} else {
		$tmpstr = "<lastName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of Person objects
# param: xml doc
# returns: list of Person objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @PersonNodes = $root->getChildNodes;
	my $PersonLength = $#PersonNodes;
	#print "total bean count = $PersonLength\n";
	
	# parse all Person nodes
	my @obj_list = ();
	foreach my $PersonNode (@PersonNodes) {
		#print "\tPerson\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $partyId;
		my $firstName;
		my $lastName;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($PersonNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "partyId") {
				$partyId=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "firstName") {
				$firstName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "lastName") {
				$lastName=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::Person;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setPartyId($partyId);
		$newobj->setFirstName($firstName);
		$newobj->setLastName($lastName);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getPartyId {
	my $self = shift;
	return $self->{partyId};
}

sub setPartyId {
	my $self = shift;
	$self->{partyId} = shift;
}

sub getFirstName {
	my $self = shift;
	return $self->{firstName};
}

sub setFirstName {
	my $self = shift;
	$self->{firstName} = shift;
}

sub getLastName {
	my $self = shift;
	return $self->{lastName};
}

sub setLastName {
	my $self = shift;
	$self->{lastName} = shift;
}

## end getters and setters ##

## begin bean association methods ##

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::PartyRole;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the PartyRole object
# returns: a PartyRole object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new PartyRole\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this PartyRole intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:PartyRoleImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of PartyRole objects
# param: xml doc
# returns: list of PartyRole objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @PartyRoleNodes = $root->getChildNodes;
	my $PartyRoleLength = $#PartyRoleNodes;
	#print "total bean count = $PartyRoleLength\n";
	
	# parse all PartyRole nodes
	my @obj_list = ();
	foreach my $PartyRoleNode (@PartyRoleNodes) {
		#print "\tPartyRole\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($PartyRoleNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::PartyRole;
		## begin set attr ##
		$newobj->setId($id);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getRole {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::Role", $self);
	return $results[0];
}

sub getAnimalModelCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::AnimalModel", $self);
	return @results;
}

sub getParty {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::Party", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::Organization;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the Organization object
# returns: a Organization object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Organization\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Organization intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:OrganizationImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# partyId;
	if( defined( $self->getPartyId ) ) {
		$tmpstr = "<partyId xsi:type=\"xsd:long\">" . $self->getPartyId . "</partyId>";
	} else {
		$tmpstr = "<partyId xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of Organization objects
# param: xml doc
# returns: list of Organization objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @OrganizationNodes = $root->getChildNodes;
	my $OrganizationLength = $#OrganizationNodes;
	#print "total bean count = $OrganizationLength\n";
	
	# parse all Organization nodes
	my @obj_list = ();
	foreach my $OrganizationNode (@OrganizationNodes) {
		#print "\tOrganization\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $partyId;
		my $name;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($OrganizationNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "partyId") {
				$partyId=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::Organization;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setPartyId($partyId);
		$newobj->setName($name);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getPartyId {
	my $self = shift;
	return $self->{partyId};
}

sub setPartyId {
	my $self = shift;
	$self->{partyId} = shift;
}

sub getName {
	my $self = shift;
	return $self->{name};
}

sub setName {
	my $self = shift;
	$self->{name} = shift;
}

## end getters and setters ##

## begin bean association methods ##

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::MicroArrayData;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the MicroArrayData object
# returns: a MicroArrayData object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new MicroArrayData\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this MicroArrayData intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:MicroArrayDataImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# experimentName;
	if( defined( $self->getExperimentName ) ) {
		$tmpstr = "<experimentName xsi:type=\"xsd:string\">" . $self->getExperimentName . "</experimentName>";
	} else {
		$tmpstr = "<experimentName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# experimentId;
	if( defined( $self->getExperimentId ) ) {
		$tmpstr = "<experimentId xsi:type=\"xsd:long\">" . $self->getExperimentId . "</experimentId>";
	} else {
		$tmpstr = "<experimentId xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of MicroArrayData objects
# param: xml doc
# returns: list of MicroArrayData objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @MicroArrayDataNodes = $root->getChildNodes;
	my $MicroArrayDataLength = $#MicroArrayDataNodes;
	#print "total bean count = $MicroArrayDataLength\n";
	
	# parse all MicroArrayData nodes
	my @obj_list = ();
	foreach my $MicroArrayDataNode (@MicroArrayDataNodes) {
		#print "\tMicroArrayData\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $experimentName;
		my $experimentId;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($MicroArrayDataNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "experimentName") {
				$experimentName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "experimentId") {
				$experimentId=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::MicroArrayData;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setExperimentName($experimentName);
		$newobj->setExperimentId($experimentId);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getExperimentName {
	my $self = shift;
	return $self->{experimentName};
}

sub setExperimentName {
	my $self = shift;
	$self->{experimentName} = shift;
}

sub getExperimentId {
	my $self = shift;
	return $self->{experimentId};
}

sub setExperimentId {
	my $self = shift;
	$self->{experimentId} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getAvailability {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::Availability", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::JaxInfo;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the JaxInfo object
# returns: a JaxInfo object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new JaxInfo\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this JaxInfo intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:JaxInfoImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# jaxStockNo;
	if( defined( $self->getJaxStockNo ) ) {
		$tmpstr = "<jaxStockNo xsi:type=\"xsd:long\">" . $self->getJaxStockNo . "</jaxStockNo>";
	} else {
		$tmpstr = "<jaxStockNo xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of JaxInfo objects
# param: xml doc
# returns: list of JaxInfo objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @JaxInfoNodes = $root->getChildNodes;
	my $JaxInfoLength = $#JaxInfoNodes;
	#print "total bean count = $JaxInfoLength\n";
	
	# parse all JaxInfo nodes
	my @obj_list = ();
	foreach my $JaxInfoNode (@JaxInfoNodes) {
		#print "\tJaxInfo\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $jaxStockNo;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($JaxInfoNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "jaxStockNo") {
				$jaxStockNo=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::JaxInfo;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setJaxStockNo($jaxStockNo);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getJaxStockNo {
	my $self = shift;
	return $self->{jaxStockNo};
}

sub setJaxStockNo {
	my $self = shift;
	$self->{jaxStockNo} = shift;
}

## end getters and setters ##

## begin bean association methods ##

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::EnvironmentalFactor;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the EnvironmentalFactor object
# returns: a EnvironmentalFactor object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new EnvironmentalFactor\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this EnvironmentalFactor intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:EnvironmentalFactorImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# type;
	if( defined( $self->getType ) ) {
		$tmpstr = "<type xsi:type=\"xsd:string\">" . $self->getType . "</type>";
	} else {
		$tmpstr = "<type xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of EnvironmentalFactor objects
# param: xml doc
# returns: list of EnvironmentalFactor objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @EnvironmentalFactorNodes = $root->getChildNodes;
	my $EnvironmentalFactorLength = $#EnvironmentalFactorNodes;
	#print "total bean count = $EnvironmentalFactorLength\n";
	
	# parse all EnvironmentalFactor nodes
	my @obj_list = ();
	foreach my $EnvironmentalFactorNode (@EnvironmentalFactorNodes) {
		#print "\tEnvironmentalFactor\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $name;
		my $type;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($EnvironmentalFactorNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "type") {
				$type=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::EnvironmentalFactor;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setName($name);
		$newobj->setType($type);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getName {
	my $self = shift;
	return $self->{name};
}

sub setName {
	my $self = shift;
	$self->{name} = shift;
}

sub getType {
	my $self = shift;
	return $self->{type};
}

sub setType {
	my $self = shift;
	$self->{type} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getInducedMutationCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::InducedMutation", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::InducedMutation;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the InducedMutation object
# returns: a InducedMutation object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new InducedMutation\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this InducedMutation intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:InducedMutationImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of InducedMutation objects
# param: xml doc
# returns: list of InducedMutation objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @InducedMutationNodes = $root->getChildNodes;
	my $InducedMutationLength = $#InducedMutationNodes;
	#print "total bean count = $InducedMutationLength\n";
	
	# parse all InducedMutation nodes
	my @obj_list = ();
	foreach my $InducedMutationNode (@InducedMutationNodes) {
		#print "\tInducedMutation\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($InducedMutationNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::InducedMutation;
		## begin set attr ##
		$newobj->setId($id);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getEnvironmentalFactor {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::EnvironmentalFactor", $self);
	return $results[0];
}

sub getEngineeredGeneCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::EngineeredGene", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::GenomicSegment;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the GenomicSegment object
# returns: a GenomicSegment object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new GenomicSegment\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this GenomicSegment intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:GenomicSegmentImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# locationOfIntegration;
	if( defined( $self->getLocationOfIntegration ) ) {
		$tmpstr = "<locationOfIntegration xsi:type=\"xsd:string\">" . $self->getLocationOfIntegration . "</locationOfIntegration>";
	} else {
		$tmpstr = "<locationOfIntegration xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# segmentSize;
	if( defined( $self->getSegmentSize ) ) {
		$tmpstr = "<segmentSize xsi:type=\"xsd:string\">" . $self->getSegmentSize . "</segmentSize>";
	} else {
		$tmpstr = "<segmentSize xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# cloneDesignator;
	if( defined( $self->getCloneDesignator ) ) {
		$tmpstr = "<cloneDesignator xsi:type=\"xsd:string\">" . $self->getCloneDesignator . "</cloneDesignator>";
	} else {
		$tmpstr = "<cloneDesignator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of GenomicSegment objects
# param: xml doc
# returns: list of GenomicSegment objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @GenomicSegmentNodes = $root->getChildNodes;
	my $GenomicSegmentLength = $#GenomicSegmentNodes;
	#print "total bean count = $GenomicSegmentLength\n";
	
	# parse all GenomicSegment nodes
	my @obj_list = ();
	foreach my $GenomicSegmentNode (@GenomicSegmentNodes) {
		#print "\tGenomicSegment\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $locationOfIntegration;
		my $segmentSize;
		my $cloneDesignator;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($GenomicSegmentNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "locationOfIntegration") {
				$locationOfIntegration=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "segmentSize") {
				$segmentSize=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "cloneDesignator") {
				$cloneDesignator=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::GenomicSegment;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setLocationOfIntegration($locationOfIntegration);
		$newobj->setSegmentSize($segmentSize);
		$newobj->setCloneDesignator($cloneDesignator);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getLocationOfIntegration {
	my $self = shift;
	return $self->{locationOfIntegration};
}

sub setLocationOfIntegration {
	my $self = shift;
	$self->{locationOfIntegration} = shift;
}

sub getSegmentSize {
	my $self = shift;
	return $self->{segmentSize};
}

sub setSegmentSize {
	my $self = shift;
	$self->{segmentSize} = shift;
}

sub getCloneDesignator {
	my $self = shift;
	return $self->{cloneDesignator};
}

sub setCloneDesignator {
	my $self = shift;
	$self->{cloneDesignator} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getSegmentType {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::SegmentType", $self);
	return $results[0];
}

sub getEngineeredGeneCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::EngineeredGene", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::GeneticAlteration;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the GeneticAlteration object
# returns: a GeneticAlteration object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new GeneticAlteration\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this GeneticAlteration intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:GeneticAlterationImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# observation;
	if( defined( $self->getObservation ) ) {
		$tmpstr = "<observation xsi:type=\"xsd:string\">" . $self->getObservation . "</observation>";
	} else {
		$tmpstr = "<observation xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# methodOfObservation;
	if( defined( $self->getMethodOfObservation ) ) {
		$tmpstr = "<methodOfObservation xsi:type=\"xsd:string\">" . $self->getMethodOfObservation . "</methodOfObservation>";
	} else {
		$tmpstr = "<methodOfObservation xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of GeneticAlteration objects
# param: xml doc
# returns: list of GeneticAlteration objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @GeneticAlterationNodes = $root->getChildNodes;
	my $GeneticAlterationLength = $#GeneticAlterationNodes;
	#print "total bean count = $GeneticAlterationLength\n";
	
	# parse all GeneticAlteration nodes
	my @obj_list = ();
	foreach my $GeneticAlterationNode (@GeneticAlterationNodes) {
		#print "\tGeneticAlteration\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $observation;
		my $methodOfObservation;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($GeneticAlterationNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "observation") {
				$observation=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "methodOfObservation") {
				$methodOfObservation=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::GeneticAlteration;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setObservation($observation);
		$newobj->setMethodOfObservation($methodOfObservation);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getObservation {
	my $self = shift;
	return $self->{observation};
}

sub setObservation {
	my $self = shift;
	$self->{observation} = shift;
}

sub getMethodOfObservation {
	my $self = shift;
	return $self->{methodOfObservation};
}

sub setMethodOfObservation {
	my $self = shift;
	$self->{methodOfObservation} = shift;
}

## end getters and setters ##

## begin bean association methods ##

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::GeneFunction;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the GeneFunction object
# returns: a GeneFunction object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new GeneFunction\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this GeneFunction intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:GeneFunctionImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# function;
	if( defined( $self->getFunction ) ) {
		$tmpstr = "<function xsi:type=\"xsd:string\">" . $self->getFunction . "</function>";
	} else {
		$tmpstr = "<function xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of GeneFunction objects
# param: xml doc
# returns: list of GeneFunction objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @GeneFunctionNodes = $root->getChildNodes;
	my $GeneFunctionLength = $#GeneFunctionNodes;
	#print "total bean count = $GeneFunctionLength\n";
	
	# parse all GeneFunction nodes
	my @obj_list = ();
	foreach my $GeneFunctionNode (@GeneFunctionNodes) {
		#print "\tGeneFunction\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $function;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($GeneFunctionNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "function") {
				$function=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::GeneFunction;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setFunction($function);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getFunction {
	my $self = shift;
	return $self->{function};
}

sub setFunction {
	my $self = shift;
	$self->{function} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getEngineeredGene {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::EngineeredGene", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::GeneDelivery;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the GeneDelivery object
# returns: a GeneDelivery object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new GeneDelivery\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this GeneDelivery intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:GeneDeliveryImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# viralVector;
	if( defined( $self->getViralVector ) ) {
		$tmpstr = "<viralVector xsi:type=\"xsd:string\">" . $self->getViralVector . "</viralVector>";
	} else {
		$tmpstr = "<viralVector xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of GeneDelivery objects
# param: xml doc
# returns: list of GeneDelivery objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @GeneDeliveryNodes = $root->getChildNodes;
	my $GeneDeliveryLength = $#GeneDeliveryNodes;
	#print "total bean count = $GeneDeliveryLength\n";
	
	# parse all GeneDelivery nodes
	my @obj_list = ();
	foreach my $GeneDeliveryNode (@GeneDeliveryNodes) {
		#print "\tGeneDelivery\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $viralVector;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($GeneDeliveryNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "viralVector") {
				$viralVector=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::GeneDelivery;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setViralVector($viralVector);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getViralVector {
	my $self = shift;
	return $self->{viralVector};
}

sub setViralVector {
	my $self = shift;
	$self->{viralVector} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getEngineeredGene {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::EngineeredGene", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::ContactInfo;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the ContactInfo object
# returns: a ContactInfo object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new ContactInfo\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this ContactInfo intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:ContactInfoImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# faxNumber;
	if( defined( $self->getFaxNumber ) ) {
		$tmpstr = "<faxNumber xsi:type=\"xsd:string\">" . $self->getFaxNumber . "</faxNumber>";
	} else {
		$tmpstr = "<faxNumber xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# zipCode;
	if( defined( $self->getZipCode ) ) {
		$tmpstr = "<zipCode xsi:type=\"xsd:string\">" . $self->getZipCode . "</zipCode>";
	} else {
		$tmpstr = "<zipCode xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# street;
	if( defined( $self->getStreet ) ) {
		$tmpstr = "<street xsi:type=\"xsd:string\">" . $self->getStreet . "</street>";
	} else {
		$tmpstr = "<street xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# institute;
	if( defined( $self->getInstitute ) ) {
		$tmpstr = "<institute xsi:type=\"xsd:string\">" . $self->getInstitute . "</institute>";
	} else {
		$tmpstr = "<institute xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# state;
	if( defined( $self->getState ) ) {
		$tmpstr = "<state xsi:type=\"xsd:string\">" . $self->getState . "</state>";
	} else {
		$tmpstr = "<state xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# email;
	if( defined( $self->getEmail ) ) {
		$tmpstr = "<email xsi:type=\"xsd:string\">" . $self->getEmail . "</email>";
	} else {
		$tmpstr = "<email xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# phoneNumber;
	if( defined( $self->getPhoneNumber ) ) {
		$tmpstr = "<phoneNumber xsi:type=\"xsd:string\">" . $self->getPhoneNumber . "</phoneNumber>";
	} else {
		$tmpstr = "<phoneNumber xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# labName;
	if( defined( $self->getLabName ) ) {
		$tmpstr = "<labName xsi:type=\"xsd:string\">" . $self->getLabName . "</labName>";
	} else {
		$tmpstr = "<labName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# city;
	if( defined( $self->getCity ) ) {
		$tmpstr = "<city xsi:type=\"xsd:string\">" . $self->getCity . "</city>";
	} else {
		$tmpstr = "<city xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of ContactInfo objects
# param: xml doc
# returns: list of ContactInfo objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @ContactInfoNodes = $root->getChildNodes;
	my $ContactInfoLength = $#ContactInfoNodes;
	#print "total bean count = $ContactInfoLength\n";
	
	# parse all ContactInfo nodes
	my @obj_list = ();
	foreach my $ContactInfoNode (@ContactInfoNodes) {
		#print "\tContactInfo\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $faxNumber;
		my $zipCode;
		my $street;
		my $institute;
		my $state;
		my $email;
		my $phoneNumber;
		my $labName;
		my $city;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($ContactInfoNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "faxNumber") {
				$faxNumber=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "zipCode") {
				$zipCode=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "street") {
				$street=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "institute") {
				$institute=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "state") {
				$state=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "email") {
				$email=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "phoneNumber") {
				$phoneNumber=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "labName") {
				$labName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "city") {
				$city=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::ContactInfo;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setFaxNumber($faxNumber);
		$newobj->setZipCode($zipCode);
		$newobj->setStreet($street);
		$newobj->setInstitute($institute);
		$newobj->setState($state);
		$newobj->setEmail($email);
		$newobj->setPhoneNumber($phoneNumber);
		$newobj->setLabName($labName);
		$newobj->setCity($city);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getFaxNumber {
	my $self = shift;
	return $self->{faxNumber};
}

sub setFaxNumber {
	my $self = shift;
	$self->{faxNumber} = shift;
}

sub getZipCode {
	my $self = shift;
	return $self->{zipCode};
}

sub setZipCode {
	my $self = shift;
	$self->{zipCode} = shift;
}

sub getStreet {
	my $self = shift;
	return $self->{street};
}

sub setStreet {
	my $self = shift;
	$self->{street} = shift;
}

sub getInstitute {
	my $self = shift;
	return $self->{institute};
}

sub setInstitute {
	my $self = shift;
	$self->{institute} = shift;
}

sub getState {
	my $self = shift;
	return $self->{state};
}

sub setState {
	my $self = shift;
	$self->{state} = shift;
}

sub getEmail {
	my $self = shift;
	return $self->{email};
}

sub setEmail {
	my $self = shift;
	$self->{email} = shift;
}

sub getPhoneNumber {
	my $self = shift;
	return $self->{phoneNumber};
}

sub setPhoneNumber {
	my $self = shift;
	$self->{phoneNumber} = shift;
}

sub getLabName {
	my $self = shift;
	return $self->{labName};
}

sub setLabName {
	my $self = shift;
	$self->{labName} = shift;
}

sub getCity {
	my $self = shift;
	return $self->{city};
}

sub setCity {
	my $self = shift;
	$self->{city} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getPartyCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::Party", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::CellLine;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the CellLine object
# returns: a CellLine object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new CellLine\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this CellLine intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:CellLineImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# experiment;
	if( defined( $self->getExperiment ) ) {
		$tmpstr = "<experiment xsi:type=\"xsd:string\">" . $self->getExperiment . "</experiment>";
	} else {
		$tmpstr = "<experiment xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# comments;
	if( defined( $self->getComments ) ) {
		$tmpstr = "<comments xsi:type=\"xsd:string\">" . $self->getComments . "</comments>";
	} else {
		$tmpstr = "<comments xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# results;
	if( defined( $self->getResults ) ) {
		$tmpstr = "<results xsi:type=\"xsd:string\">" . $self->getResults . "</results>";
	} else {
		$tmpstr = "<results xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of CellLine objects
# param: xml doc
# returns: list of CellLine objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @CellLineNodes = $root->getChildNodes;
	my $CellLineLength = $#CellLineNodes;
	#print "total bean count = $CellLineLength\n";
	
	# parse all CellLine nodes
	my @obj_list = ();
	foreach my $CellLineNode (@CellLineNodes) {
		#print "\tCellLine\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $experiment;
		my $comments;
		my $name;
		my $results;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($CellLineNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "experiment") {
				$experiment=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "comments") {
				$comments=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "results") {
				$results=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::CellLine;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setExperiment($experiment);
		$newobj->setComments($comments);
		$newobj->setName($name);
		$newobj->setResults($results);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getExperiment {
	my $self = shift;
	return $self->{experiment};
}

sub setExperiment {
	my $self = shift;
	$self->{experiment} = shift;
}

sub getComments {
	my $self = shift;
	return $self->{comments};
}

sub setComments {
	my $self = shift;
	$self->{comments} = shift;
}

sub getName {
	my $self = shift;
	return $self->{name};
}

sub setName {
	my $self = shift;
	$self->{name} = shift;
}

sub getResults {
	my $self = shift;
	return $self->{results};
}

sub setResults {
	my $self = shift;
	$self->{results} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getPublicationCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::Publication", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::CarcinogenicIntervention;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the CarcinogenicIntervention object
# returns: a CarcinogenicIntervention object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new CarcinogenicIntervention\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this CarcinogenicIntervention intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:CarcinogenicInterventionImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of CarcinogenicIntervention objects
# param: xml doc
# returns: list of CarcinogenicIntervention objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @CarcinogenicInterventionNodes = $root->getChildNodes;
	my $CarcinogenicInterventionLength = $#CarcinogenicInterventionNodes;
	#print "total bean count = $CarcinogenicInterventionLength\n";
	
	# parse all CarcinogenicIntervention nodes
	my @obj_list = ();
	foreach my $CarcinogenicInterventionNode (@CarcinogenicInterventionNodes) {
		#print "\tCarcinogenicIntervention\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($CarcinogenicInterventionNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::CarcinogenicIntervention;
		## begin set attr ##
		$newobj->setId($id);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getEnvironmentalFactor {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::EnvironmentalFactor", $self);
	return $results[0];
}

sub getTreatmentSchedule {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::TreatmentSchedule", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::AnimalModel;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the AnimalModel object
# returns: a AnimalModel object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new AnimalModel\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this AnimalModel intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:AnimalModelImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# url;
	if( defined( $self->getUrl ) ) {
		$tmpstr = "<url xsi:type=\"xsd:string\">" . $self->getUrl . "</url>";
	} else {
		$tmpstr = "<url xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# experimentDesign;
	if( defined( $self->getExperimentDesign ) ) {
		$tmpstr = "<experimentDesign xsi:type=\"xsd:string\">" . $self->getExperimentDesign . "</experimentDesign>";
	} else {
		$tmpstr = "<experimentDesign xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# modelDescriptor;
	if( defined( $self->getModelDescriptor ) ) {
		$tmpstr = "<modelDescriptor xsi:type=\"xsd:string\">" . $self->getModelDescriptor . "</modelDescriptor>";
	} else {
		$tmpstr = "<modelDescriptor xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of AnimalModel objects
# param: xml doc
# returns: list of AnimalModel objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @AnimalModelNodes = $root->getChildNodes;
	my $AnimalModelLength = $#AnimalModelNodes;
	#print "total bean count = $AnimalModelLength\n";
	
	# parse all AnimalModel nodes
	my @obj_list = ();
	foreach my $AnimalModelNode (@AnimalModelNodes) {
		#print "\tAnimalModel\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $url;
		my $experimentDesign;
		my $modelDescriptor;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($AnimalModelNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "url") {
				$url=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "experimentDesign") {
				$experimentDesign=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modelDescriptor") {
				$modelDescriptor=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::AnimalModel;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setUrl($url);
		$newobj->setExperimentDesign($experimentDesign);
		$newobj->setModelDescriptor($modelDescriptor);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getUrl {
	my $self = shift;
	return $self->{url};
}

sub setUrl {
	my $self = shift;
	$self->{url} = shift;
}

sub getExperimentDesign {
	my $self = shift;
	return $self->{experimentDesign};
}

sub setExperimentDesign {
	my $self = shift;
	$self->{experimentDesign} = shift;
}

sub getModelDescriptor {
	my $self = shift;
	return $self->{modelDescriptor};
}

sub setModelDescriptor {
	my $self = shift;
	$self->{modelDescriptor} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getPhenotype {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::Phenotype", $self);
	return $results[0];
}

sub getCarcinogenicInterventionCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::CarcinogenicIntervention", $self);
	return @results;
}

sub getTherapyCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::Therapy", $self);
	return @results;
}

sub getImageCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::Image", $self);
	return @results;
}

sub getXenograftCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::Xenograft", $self);
	return @results;
}

sub getMicroArrayDataCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::MicroArrayData", $self);
	return @results;
}

sub getTargetedModificationCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::TargetedModification", $self);
	return @results;
}

sub getGenomicSegmentCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::GenomicSegment", $self);
	return @results;
}

sub getRepositoryInfo {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::RepositoryInfo", $self);
	return $results[0];
}

sub getHistopathologyCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Histopathology", $self);
	return @results;
}

sub getCellLineCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::CellLine", $self);
	return @results;
}

sub getTransgeneCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::Transgene", $self);
	return @results;
}

sub getJaxInfo {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::JaxInfo", $self);
	return $results[0];
}

sub getInducedMutationCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::InducedMutation", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::EndpointCode;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the EndpointCode object
# returns: a EndpointCode object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new EndpointCode\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this EndpointCode intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:EndpointCodeImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# code;
	if( defined( $self->getCode ) ) {
		$tmpstr = "<code xsi:type=\"xsd:string\">" . $self->getCode . "</code>";
	} else {
		$tmpstr = "<code xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# description;
	if( defined( $self->getDescription ) ) {
		$tmpstr = "<description xsi:type=\"xsd:string\">" . $self->getDescription . "</description>";
	} else {
		$tmpstr = "<description xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of EndpointCode objects
# param: xml doc
# returns: list of EndpointCode objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @EndpointCodeNodes = $root->getChildNodes;
	my $EndpointCodeLength = $#EndpointCodeNodes;
	#print "total bean count = $EndpointCodeLength\n";
	
	# parse all EndpointCode nodes
	my @obj_list = ();
	foreach my $EndpointCodeNode (@EndpointCodeNodes) {
		#print "\tEndpointCode\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $code;
		my $description;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($EndpointCodeNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "code") {
				$code=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "description") {
				$description=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::EndpointCode;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setCode($code);
		$newobj->setDescription($description);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getCode {
	my $self = shift;
	return $self->{code};
}

sub setCode {
	my $self = shift;
	$self->{code} = shift;
}

sub getDescription {
	my $self = shift;
	return $self->{description};
}

sub setDescription {
	my $self = shift;
	$self->{description} = shift;
}

## end getters and setters ##

## begin bean association methods ##

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::ScreeningResult;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the ScreeningResult object
# returns: a ScreeningResult object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new ScreeningResult\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this ScreeningResult intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:ScreeningResultImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# diffinh;
	if( defined( $self->getDiffinh ) ) {
		$tmpstr = "<diffinh xsi:type=\"xsd:float\">" . $self->getDiffinh . "</diffinh>";
	} else {
		$tmpstr = "<diffinh xsi:type=\"xsd:float\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# aveinh;
	if( defined( $self->getAveinh ) ) {
		$tmpstr = "<aveinh xsi:type=\"xsd:float\">" . $self->getAveinh . "</aveinh>";
	} else {
		$tmpstr = "<aveinh xsi:type=\"xsd:float\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# stage;
	if( defined( $self->getStage ) ) {
		$tmpstr = "<stage xsi:type=\"xsd:string\">" . $self->getStage . "</stage>";
	} else {
		$tmpstr = "<stage xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# inhibitionRate;
	if( defined( $self->getInhibitionRate ) ) {
		$tmpstr = "<inhibitionRate xsi:type=\"xsd:float\">" . $self->getInhibitionRate . "</inhibitionRate>";
	} else {
		$tmpstr = "<inhibitionRate xsi:type=\"xsd:float\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of ScreeningResult objects
# param: xml doc
# returns: list of ScreeningResult objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @ScreeningResultNodes = $root->getChildNodes;
	my $ScreeningResultLength = $#ScreeningResultNodes;
	#print "total bean count = $ScreeningResultLength\n";
	
	# parse all ScreeningResult nodes
	my @obj_list = ();
	foreach my $ScreeningResultNode (@ScreeningResultNodes) {
		#print "\tScreeningResult\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $diffinh;
		my $aveinh;
		my $stage;
		my $inhibitionRate;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($ScreeningResultNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "diffinh") {
				$diffinh=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "aveinh") {
				$aveinh=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "stage") {
				$stage=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "inhibitionRate") {
				$inhibitionRate=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::ScreeningResult;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setDiffinh($diffinh);
		$newobj->setAveinh($aveinh);
		$newobj->setStage($stage);
		$newobj->setInhibitionRate($inhibitionRate);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getDiffinh {
	my $self = shift;
	return $self->{diffinh};
}

sub setDiffinh {
	my $self = shift;
	$self->{diffinh} = shift;
}

sub getAveinh {
	my $self = shift;
	return $self->{aveinh};
}

sub setAveinh {
	my $self = shift;
	$self->{aveinh} = shift;
}

sub getStage {
	my $self = shift;
	return $self->{stage};
}

sub setStage {
	my $self = shift;
	$self->{stage} = shift;
}

sub getInhibitionRate {
	my $self = shift;
	return $self->{inhibitionRate};
}

sub setInhibitionRate {
	my $self = shift;
	$self->{inhibitionRate} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getTreatmentSchedule {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::TreatmentSchedule", $self);
	return $results[0];
}

sub getAgent {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Agent", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::InvivoResult;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the InvivoResult object
# returns: a InvivoResult object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new InvivoResult\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this InvivoResult intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:InvivoResultImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# toxicityEvalDay;
	if( defined( $self->getToxicityEvalDay ) ) {
		$tmpstr = "<toxicityEvalDay xsi:type=\"xsd:string\">" . $self->getToxicityEvalDay . "</toxicityEvalDay>";
	} else {
		$tmpstr = "<toxicityEvalDay xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# evaluationDay;
	if( defined( $self->getEvaluationDay ) ) {
		$tmpstr = "<evaluationDay xsi:type=\"xsd:string\">" . $self->getEvaluationDay . "</evaluationDay>";
	} else {
		$tmpstr = "<evaluationDay xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# toxicitySurvivors;
	if( defined( $self->getToxicitySurvivors ) ) {
		$tmpstr = "<toxicitySurvivors xsi:type=\"xsd:string\">" . $self->getToxicitySurvivors . "</toxicitySurvivors>";
	} else {
		$tmpstr = "<toxicitySurvivors xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of InvivoResult objects
# param: xml doc
# returns: list of InvivoResult objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @InvivoResultNodes = $root->getChildNodes;
	my $InvivoResultLength = $#InvivoResultNodes;
	#print "total bean count = $InvivoResultLength\n";
	
	# parse all InvivoResult nodes
	my @obj_list = ();
	foreach my $InvivoResultNode (@InvivoResultNodes) {
		#print "\tInvivoResult\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $toxicityEvalDay;
		my $evaluationDay;
		my $toxicitySurvivors;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($InvivoResultNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "toxicityEvalDay") {
				$toxicityEvalDay=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "evaluationDay") {
				$evaluationDay=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "toxicitySurvivors") {
				$toxicitySurvivors=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::InvivoResult;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setToxicityEvalDay($toxicityEvalDay);
		$newobj->setEvaluationDay($evaluationDay);
		$newobj->setToxicitySurvivors($toxicitySurvivors);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getToxicityEvalDay {
	my $self = shift;
	return $self->{toxicityEvalDay};
}

sub setToxicityEvalDay {
	my $self = shift;
	$self->{toxicityEvalDay} = shift;
}

sub getEvaluationDay {
	my $self = shift;
	return $self->{evaluationDay};
}

sub setEvaluationDay {
	my $self = shift;
	$self->{evaluationDay} = shift;
}

sub getToxicitySurvivors {
	my $self = shift;
	return $self->{toxicitySurvivors};
}

sub setToxicitySurvivors {
	my $self = shift;
	$self->{toxicitySurvivors} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getTreatmentSchedule {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::TreatmentSchedule", $self);
	return $results[0];
}

sub getAgent {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Agent", $self);
	return $results[0];
}

sub getEndpointCode {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::EndpointCode", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::ModificationType;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the ModificationType object
# returns: a ModificationType object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new ModificationType\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this ModificationType intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:ModificationTypeImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of ModificationType objects
# param: xml doc
# returns: list of ModificationType objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @ModificationTypeNodes = $root->getChildNodes;
	my $ModificationTypeLength = $#ModificationTypeNodes;
	#print "total bean count = $ModificationTypeLength\n";
	
	# parse all ModificationType nodes
	my @obj_list = ();
	foreach my $ModificationTypeNode (@ModificationTypeNodes) {
		#print "\tModificationType\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $name;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($ModificationTypeNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::ModificationType;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setName($name);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getName {
	my $self = shift;
	return $self->{name};
}

sub setName {
	my $self = shift;
	$self->{name} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getTargetedModificationCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::TargetedModification", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::ExpressionFeature;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the ExpressionFeature object
# returns: a ExpressionFeature object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new ExpressionFeature\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this ExpressionFeature intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:ExpressionFeatureImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of ExpressionFeature objects
# param: xml doc
# returns: list of ExpressionFeature objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @ExpressionFeatureNodes = $root->getChildNodes;
	my $ExpressionFeatureLength = $#ExpressionFeatureNodes;
	#print "total bean count = $ExpressionFeatureLength\n";
	
	# parse all ExpressionFeature nodes
	my @obj_list = ();
	foreach my $ExpressionFeatureNode (@ExpressionFeatureNodes) {
		#print "\tExpressionFeature\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($ExpressionFeatureNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::ExpressionFeature;
		## begin set attr ##
		$newobj->setId($id);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getOrganOntologyCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::OrganOntology", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::CancerModel;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the CancerModel object
# returns: a CancerModel object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new CancerModel\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this CancerModel intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:CancerModelImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	## end attribute to XML ##
	
	## for now, no need to set association objects since they should all be set to nil. -- tested and works 08/13/2005
	
	## for now, set singleton assoication as nil object
	## begin singleton association to XML
	## end singleton association to XML
	
	## for now, set plural assoication as empty array
	## begin plural association to XML
	## end plural association to XML
	
	# add trailing close tags
	$str = $str . "</multiRef>";
	
	return $str;
}

# parse a given xml, construct a list of CancerModel objects
# param: xml doc
# returns: list of CancerModel objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @CancerModelNodes = $root->getChildNodes;
	my $CancerModelLength = $#CancerModelNodes;
	#print "total bean count = $CancerModelLength\n";
	
	# parse all CancerModel nodes
	my @obj_list = ();
	foreach my $CancerModelNode (@CancerModelNodes) {
		#print "\tCancerModel\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($CancerModelNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaMOD::CancerModel;
		## begin set attr ##
		$newobj->setId($id);
		## end set attr ##
		push @obj_list, $newobj;
	}
	
	return @obj_list;
}

## begin getters and setters ##
sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

## end getters and setters ##

## begin bean association methods ##

## end bean association methods ##

1;
#end
# Below is module documentation for ApprovalStatus

=pod

=head1 ApprovalStatus

CaCORE::CaMOD::ApprovalStatus - Perl extension for ApprovalStatus.

=head2 Abstract

The CaCORE::CaMOD::ApprovalStatus is a Perl object representation of the
caBIO ApprovalStatus object.

=head2 Description



=head2 Attributes of ApprovalStatus

The following are all the attributes of the ApprovalStatus object and their data types:

=over 4

=item name

data type: C<string>

=item id

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of ApprovalStatus

The following are all the objects that are associated with the ApprovalStatus:

=over 4

  End Associations and related methods

=back

=cut

# Below is module documentation for Availability

=pod

=head1 Availability

CaCORE::CaMOD::Availability - Perl extension for Availability.

=head2 Abstract

The CaCORE::CaMOD::Availability is a Perl object representation of the
caBIO Availability object.

=head2 Description

Dates on which a animal model record was entered, modified or release to the intended viewing audience.

=head2 Attributes of Availability

The following are all the attributes of the Availability object and their data types:

=over 4

=item enteredDate

data type: C<dateTime>

=item visibleTo

data type: C<string>

=item id

data type: C<long>

=item releaseDate

data type: C<dateTime>

=item modifiedDate

data type: C<dateTime>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of Availability

The following are all the objects that are associated with the Availability:

=over 4

  End Associations and related methods

=back

=cut

# Below is module documentation for AbstractCancerModel

=pod

=head1 AbstractCancerModel

CaCORE::CaMOD::AbstractCancerModel - Perl extension for AbstractCancerModel.

=head2 Abstract

The CaCORE::CaMOD::AbstractCancerModel is a Perl object representation of the
caBIO AbstractCancerModel object.

=head2 Description



=head2 Attributes of AbstractCancerModel

The following are all the attributes of the AbstractCancerModel object and their data types:

=over 4

=item experimentDesign

data type: C<string>

=item modelDescriptor

data type: C<string>

=item id

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of AbstractCancerModel

The following are all the objects that are associated with the AbstractCancerModel:

=over 4

=item L<"ApprovalStatus">: 	

Many to one assoication, use C<getApprovalStatus> to get the associated ApprovalStatus.

=item L<"Availability">: 	

Many to one assoication, use C<getAvailability> to get the associated Availability.

=item L<"PartyRole">: 	

One to many assoication, use C<getPartyRoleCollection> to get a collection of associated PartyRole.

=item L<"Publication">: 	

One to many assoication, use C<getPublicationCollection> to get a collection of associated Publication.

  End Associations and related methods

=back

=cut

# Below is module documentation for TumorCode

=pod

=head1 TumorCode

CaCORE::CaMOD::TumorCode - Perl extension for TumorCode.

=head2 Abstract

The CaCORE::CaMOD::TumorCode is a Perl object representation of the
caBIO TumorCode object.

=head2 Description

A tumor code captures the tumor type and origin species used for a drug screen test.

=head2 Attributes of TumorCode

The following are all the attributes of the TumorCode object and their data types:

=over 4

=item code

data type: C<string>

=item description

data type: C<string>

=item id

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of TumorCode

The following are all the objects that are associated with the TumorCode:

=over 4

  End Associations and related methods

=back

=cut

# Below is module documentation for Xenograft

=pod

=head1 Xenograft

CaCORE::CaMOD::Xenograft - Perl extension for Xenograft.

=head2 Abstract

The CaCORE::CaMOD::Xenograft is a Perl object representation of the
caBIO Xenograft object.

=head2 Description

This object describes to xenografts (implanting tissue or cell lines from a different species) and allografts (implanting tissue or cell lines form the same species). The grafts are transplanted in immuno-compromised animals where they grow and, depending on the graft material, form tumors.

=head2 Attributes of Xenograft

The following are all the attributes of the Xenograft object and their data types:

=over 4

=item geneticManipulation

data type: C<string>

=item administrativeSite

data type: C<string>

=item type

data type: C<string>

=item parentalCellLineName

data type: C<string>

=item modificationDescription

data type: C<string>

=item name

data type: C<string>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of Xenograft

The following are all the objects that are associated with the Xenograft:

=over 4

=item L<"InvivoResult">: 	

One to many assoication, use C<getInvivoResultCollection> to get a collection of associated InvivoResult.

=item L<"TumorCode">: 	

Many to one assoication, use C<getTumorCode> to get the associated TumorCode.

=item L<"OriginTaxon">: 	

Many to one assoication, use C<getOriginTaxon> to get the associated OriginTaxon.

=item L<"HostTaxon">: 	

Many to one assoication, use C<getHostTaxon> to get the associated HostTaxon.

  End Associations and related methods

=back

=cut

# Below is module documentation for TreatmentSchedule

=pod

=head1 TreatmentSchedule

CaCORE::CaMOD::TreatmentSchedule - Perl extension for TreatmentSchedule.

=head2 Abstract

The CaCORE::CaMOD::TreatmentSchedule is a Perl object representation of the
caBIO TreatmentSchedule object.

=head2 Description

Treatment schedule for the pre-clinical trial / therapeutic experiment describing the dosages of the drug and the times of the treatment.

=head2 Attributes of TreatmentSchedule

The following are all the attributes of the TreatmentSchedule object and their data types:

=over 4

=item regimen

data type: C<string>

=item dosage

data type: C<string>

=item id

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of TreatmentSchedule

The following are all the objects that are associated with the TreatmentSchedule:

=over 4

  End Associations and related methods

=back

=cut

# Below is module documentation for Nomenclature

=pod

=head1 Nomenclature

CaCORE::CaMOD::Nomenclature - Perl extension for Nomenclature.

=head2 Abstract

The CaCORE::CaMOD::Nomenclature is a Perl object representation of the
caBIO Nomenclature object.

=head2 Description

Official nomenclature name for mouse and rat models.

=head2 Attributes of Nomenclature

The following are all the attributes of the Nomenclature object and their data types:

=over 4

=item name

data type: C<string>

=item id

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of Nomenclature

The following are all the objects that are associated with the Nomenclature:

=over 4

  End Associations and related methods

=back

=cut

# Below is module documentation for GenotypeSummary

=pod

=head1 GenotypeSummary

CaCORE::CaMOD::GenotypeSummary - Perl extension for GenotypeSummary.

=head2 Abstract

The CaCORE::CaMOD::GenotypeSummary is a Perl object representation of the
caBIO GenotypeSummary object.

=head2 Description

Listing of the genetic changes made deliberately in order to generate the animal model.

=head2 Attributes of GenotypeSummary

The following are all the attributes of the GenotypeSummary object and their data types:

=over 4

=item summary

data type: C<string>

=item genotype

data type: C<string>

=item id

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of GenotypeSummary

The following are all the objects that are associated with the GenotypeSummary:

=over 4

=item L<"Nomenclature">: 	

Many to one assoication, use C<getNomenclature> to get the associated Nomenclature.

  End Associations and related methods

=back

=cut

# Below is module documentation for Conditionality

=pod

=head1 Conditionality

CaCORE::CaMOD::Conditionality - Perl extension for Conditionality.

=head2 Abstract

The CaCORE::CaMOD::Conditionality is a Perl object representation of the
caBIO Conditionality object.

=head2 Description

Indicates if a transgene or targeted modification is done conditionally (time or tissue specific).

=head2 Attributes of Conditionality

The following are all the attributes of the Conditionality object and their data types:

=over 4

=item description

data type: C<string>

=item conditionedBy

data type: C<string>

=item id

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of Conditionality

The following are all the objects that are associated with the Conditionality:

=over 4

  End Associations and related methods

=back

=cut

# Below is module documentation for Image

=pod

=head1 Image

CaCORE::CaMOD::Image - Perl extension for Image.

=head2 Abstract

The CaCORE::CaMOD::Image is a Perl object representation of the
caBIO Image object.

=head2 Description

Images related to the animal model e.g. histology images, blots, and graphics.

=head2 Attributes of Image

The following are all the attributes of the Image object and their data types:

=over 4

=item description

data type: C<string>

=item title

data type: C<string>

=item id

data type: C<long>

=item staining

data type: C<string>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of Image

The following are all the objects that are associated with the Image:

=over 4

=item L<"Availability">: 	

Many to one assoication, use C<getAvailability> to get the associated Availability.

  End Associations and related methods

=back

=cut

# Below is module documentation for EngineeredGene

=pod

=head1 EngineeredGene

CaCORE::CaMOD::EngineeredGene - Perl extension for EngineeredGene.

=head2 Abstract

The CaCORE::CaMOD::EngineeredGene is a Perl object representation of the
caBIO EngineeredGene object.

=head2 Description

Manipulated Gene introduced in the animal model.

=head2 Attributes of EngineeredGene

The following are all the attributes of the EngineeredGene object and their data types:

=over 4

=item cabioId

data type: C<long>

=item name

data type: C<string>

=item id

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of EngineeredGene

The following are all the objects that are associated with the EngineeredGene:

=over 4

=item L<"Gene">: 	

One to many assoication, use C<getGeneCollection> to get a collection of associated Gene.

=item L<"DatabaseCrossReference">: 	

One to many assoication, use C<getDatabaseCrossReferenceCollection> to get a collection of associated DatabaseCrossReference.

=item L<"GenotypeSummary">: 	

Many to one assoication, use C<getGenotypeSummary> to get the associated GenotypeSummary.

=item L<"ExpressionFeature">: 	

One to many assoication, use C<getExpressionFeatureCollection> to get a collection of associated ExpressionFeature.

=item L<"Conditionality">: 	

Many to one assoication, use C<getConditionality> to get the associated Conditionality.

=item L<"Image">: 	

Many to one assoication, use C<getImage> to get the associated Image.

  End Associations and related methods

=back

=cut

# Below is module documentation for IntegrationType

=pod

=head1 IntegrationType

CaCORE::CaMOD::IntegrationType - Perl extension for IntegrationType.

=head2 Abstract

The CaCORE::CaMOD::IntegrationType is a Perl object representation of the
caBIO IntegrationType object.

=head2 Description

Location of the integration of the engineered gene e.g. random or targeted.

=head2 Attributes of IntegrationType

The following are all the attributes of the IntegrationType object and their data types:

=over 4

=item name

data type: C<string>

=item id

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of IntegrationType

The following are all the objects that are associated with the IntegrationType:

=over 4

=item L<"GenomicSegment">: 	

One to many assoication, use C<getGenomicSegmentCollection> to get a collection of associated GenomicSegment.

=item L<"Transgene">: 	

One to many assoication, use C<getTransgeneCollection> to get a collection of associated Transgene.

  End Associations and related methods

=back

=cut

# Below is module documentation for Transgene

=pod

=head1 Transgene

CaCORE::CaMOD::Transgene - Perl extension for Transgene.

=head2 Abstract

The CaCORE::CaMOD::Transgene is a Perl object representation of the
caBIO Transgene object.

=head2 Description

A transgene is an engineered gene consisting at least of a regulatory element and a coding sequence; regulatory element and coding sequence can come from different species.

=head2 Attributes of Transgene

The following are all the attributes of the Transgene object and their data types:

=over 4

=item locationOfIntegration

data type: C<string>

=item engineeredGeneId

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of Transgene

The following are all the objects that are associated with the Transgene:

=over 4

=item L<"RegulatoryElement">: 	

One to many assoication, use C<getRegulatoryElementCollection> to get a collection of associated RegulatoryElement.

=item L<"IntegrationType">: 	

Many to one assoication, use C<getIntegrationType> to get the associated IntegrationType.

  End Associations and related methods

=back

=cut

# Below is module documentation for Therapy

=pod

=head1 Therapy

CaCORE::CaMOD::Therapy - Perl extension for Therapy.

=head2 Abstract

The CaCORE::CaMOD::Therapy is a Perl object representation of the
caBIO Therapy object.

=head2 Description

Pre-clinical trials experiment conducted on the animal model with the goal to reduce cancer burden.

=head2 Attributes of Therapy

The following are all the attributes of the Therapy object and their data types:

=over 4

=item experiment

data type: C<string>

=item comments

data type: C<string>

=item id

data type: C<long>

=item results

data type: C<string>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of Therapy

The following are all the objects that are associated with the Therapy:

=over 4

=item L<"TreatmentSchedule">: 	

Many to one assoication, use C<getTreatmentSchedule> to get the associated TreatmentSchedule.

=item L<"Agent">: 	

Many to one assoication, use C<getAgent> to get the associated Agent.

=item L<"Publication">: 	

One to many assoication, use C<getPublicationCollection> to get a collection of associated Publication.

  End Associations and related methods

=back

=cut

# Below is module documentation for YeastModel

=pod

=head1 YeastModel

CaCORE::CaMOD::YeastModel - Perl extension for YeastModel.

=head2 Abstract

The CaCORE::CaMOD::YeastModel is a Perl object representation of the
caBIO YeastModel object.

=head2 Description

A yeast model captures the yeast strains altered in the NCI Yeast Anticancer Drug Screen.

=head2 Attributes of YeastModel

The following are all the attributes of the YeastModel object and their data types:

=over 4

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of YeastModel

The following are all the objects that are associated with the YeastModel:

=over 4

=item L<"TargetedModification">: 	

One to many assoication, use C<getTargetedModificationCollection> to get a collection of associated TargetedModification.

=item L<"ScreeningResult">: 	

One to many assoication, use C<getScreeningResultCollection> to get a collection of associated ScreeningResult.

  End Associations and related methods

=back

=cut

# Below is module documentation for TargetedModification

=pod

=head1 TargetedModification

CaCORE::CaMOD::TargetedModification - Perl extension for TargetedModification.

=head2 Abstract

The CaCORE::CaMOD::TargetedModification is a Perl object representation of the
caBIO TargetedModification object.

=head2 Description

Modification targeted to a specific gene or a specific part of the gene to either suppress the function of the gene or insert marker sequences like loxP sites.

=head2 Attributes of TargetedModification

The following are all the attributes of the TargetedModification object and their data types:

=over 4

=item esCellLineName

data type: C<string>

=item blastocystName

data type: C<string>

=item id

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of TargetedModification

The following are all the objects that are associated with the TargetedModification:

=over 4

=item L<"ModificationType">: 	

One to many assoication, use C<getModificationTypeCollection> to get a collection of associated ModificationType.

=item L<"YeastModel">: 	

Many to one assoication, use C<getYeastModel> to get the associated YeastModel.

=item L<"EngineeredGene">: 	

Many to one assoication, use C<getEngineeredGene> to get the associated EngineeredGene.

  End Associations and related methods

=back

=cut

# Below is module documentation for SexDistribution

=pod

=head1 SexDistribution

CaCORE::CaMOD::SexDistribution - Perl extension for SexDistribution.

=head2 Abstract

The CaCORE::CaMOD::SexDistribution is a Perl object representation of the
caBIO SexDistribution object.

=head2 Description

Object indicated if the phenotype was observed in both sexes or only in one.

=head2 Attributes of SexDistribution

The following are all the attributes of the SexDistribution object and their data types:

=over 4

=item type

data type: C<string>

=item id

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of SexDistribution

The following are all the objects that are associated with the SexDistribution:

=over 4

  End Associations and related methods

=back

=cut

# Below is module documentation for SegmentType

=pod

=head1 SegmentType

CaCORE::CaMOD::SegmentType - Perl extension for SegmentType.

=head2 Abstract

The CaCORE::CaMOD::SegmentType is a Perl object representation of the
caBIO SegmentType object.

=head2 Description

specifies the type of library that the genomic segment was retrieved from such as BAC or YAC.

=head2 Attributes of SegmentType

The following are all the attributes of the SegmentType object and their data types:

=over 4

=item name

data type: C<string>

=item id

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of SegmentType

The following are all the objects that are associated with the SegmentType:

=over 4

  End Associations and related methods

=back

=cut

# Below is module documentation for Role

=pod

=head1 Role

CaCORE::CaMOD::Role - Perl extension for Role.

=head2 Abstract

The CaCORE::CaMOD::Role is a Perl object representation of the
caBIO Role object.

=head2 Description

Role that a person or organization plays e.g. public user, reviewer.

=head2 Attributes of Role

The following are all the attributes of the Role object and their data types:

=over 4

=item name

data type: C<string>

=item id

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of Role

The following are all the objects that are associated with the Role:

=over 4

=item L<"PartyRole">: 	

One to many assoication, use C<getPartyRoleCollection> to get a collection of associated PartyRole.

  End Associations and related methods

=back

=cut

# Below is module documentation for RepositoryInfo

=pod

=head1 RepositoryInfo

CaCORE::CaMOD::RepositoryInfo - Perl extension for RepositoryInfo.

=head2 Abstract

The CaCORE::CaMOD::RepositoryInfo is a Perl object representation of the
caBIO RepositoryInfo object.

=head2 Description

Some animal models are distributed by the MMHCC mouse repository. Object contains information about the availability of a particular model from the repository. A submitter of data to the cancer models database can also indicate if their model should be submitted to the repository.

=head2 Attributes of RepositoryInfo

The following are all the attributes of the RepositoryInfo object and their data types:

=over 4

=item inTheRepository

data type: C<long>

=item sentEmailContent

data type: C<string>

=item id

data type: C<long>

=item suggestSubmission

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of RepositoryInfo

The following are all the objects that are associated with the RepositoryInfo:

=over 4

  End Associations and related methods

=back

=cut

# Below is module documentation for RegulatoryElementType

=pod

=head1 RegulatoryElementType

CaCORE::CaMOD::RegulatoryElementType - Perl extension for RegulatoryElementType.

=head2 Abstract

The CaCORE::CaMOD::RegulatoryElementType is a Perl object representation of the
caBIO RegulatoryElementType object.

=head2 Description

Type of the regulatory element e.g. promoter, polyA signal.

=head2 Attributes of RegulatoryElementType

The following are all the attributes of the RegulatoryElementType object and their data types:

=over 4

=item name

data type: C<string>

=item id

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of RegulatoryElementType

The following are all the objects that are associated with the RegulatoryElementType:

=over 4

  End Associations and related methods

=back

=cut

# Below is module documentation for RegulatoryElement

=pod

=head1 RegulatoryElement

CaCORE::CaMOD::RegulatoryElement - Perl extension for RegulatoryElement.

=head2 Abstract

The CaCORE::CaMOD::RegulatoryElement is a Perl object representation of the
caBIO RegulatoryElement object.

=head2 Description

A regulatory element controls the expression of a gene and/or and engineered gene.

=head2 Attributes of RegulatoryElement

The following are all the attributes of the RegulatoryElement object and their data types:

=over 4

=item name

data type: C<string>

=item id

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of RegulatoryElement

The following are all the objects that are associated with the RegulatoryElement:

=over 4

=item L<"Promoter">: 	

One to many assoication, use C<getPromoterCollection> to get a collection of associated Promoter.

=item L<"Taxon">: 	

Many to one assoication, use C<getTaxon> to get the associated Taxon.

=item L<"RegulatoryElementType">: 	

Many to one assoication, use C<getRegulatoryElementType> to get the associated RegulatoryElementType.

  End Associations and related methods

=back

=cut

# Below is module documentation for PublicationStatus

=pod

=head1 PublicationStatus

CaCORE::CaMOD::PublicationStatus - Perl extension for PublicationStatus.

=head2 Abstract

The CaCORE::CaMOD::PublicationStatus is a Perl object representation of the
caBIO PublicationStatus object.

=head2 Description

Status of the publication e.g. published, submitted.

=head2 Attributes of PublicationStatus

The following are all the attributes of the PublicationStatus object and their data types:

=over 4

=item name

data type: C<string>

=item id

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of PublicationStatus

The following are all the objects that are associated with the PublicationStatus:

=over 4

  End Associations and related methods

=back

=cut

# Below is module documentation for Publication

=pod

=head1 Publication

CaCORE::CaMOD::Publication - Perl extension for Publication.

=head2 Abstract

The CaCORE::CaMOD::Publication is a Perl object representation of the
caBIO Publication object.

=head2 Description

Publications describing the animal model itself or experiments in which the animal model was used.

=head2 Attributes of Publication

The following are all the attributes of the Publication object and their data types:

=over 4

=item volume

data type: C<string>

=item endPage

data type: C<long>

=item year

data type: C<long>

=item title

data type: C<string>

=item pmid

data type: C<long>

=item startPage

data type: C<long>

=item journal

data type: C<string>

=item authors

data type: C<string>

=item id

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of Publication

The following are all the objects that are associated with the Publication:

=over 4

=item L<"PublicationStatus">: 	

Many to one assoication, use C<getPublicationStatus> to get the associated PublicationStatus.

  End Associations and related methods

=back

=cut

# Below is module documentation for Promoter

=pod

=head1 Promoter

CaCORE::CaMOD::Promoter - Perl extension for Promoter.

=head2 Abstract

The CaCORE::CaMOD::Promoter is a Perl object representation of the
caBIO Promoter object.

=head2 Description

Promoter is a subcategory of the regulatory element.

=head2 Attributes of Promoter

The following are all the attributes of the Promoter object and their data types:

=over 4

=item id

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of Promoter

The following are all the objects that are associated with the Promoter:

=over 4

=item L<"Gene">: 	

Many to one assoication, use C<getGene> to get the associated Gene.

=item L<"RegulatoryElement">: 	

Many to one assoication, use C<getRegulatoryElement> to get the associated RegulatoryElement.

  End Associations and related methods

=back

=cut

# Below is module documentation for Phenotype

=pod

=head1 Phenotype

CaCORE::CaMOD::Phenotype - Perl extension for Phenotype.

=head2 Abstract

The CaCORE::CaMOD::Phenotype is a Perl object representation of the
caBIO Phenotype object.

=head2 Description

Phenotype displayed by the animal model such as neoplastic lesions, other diseases, behavioral problem.

=head2 Attributes of Phenotype

The following are all the attributes of the Phenotype object and their data types:

=over 4

=item description

data type: C<string>

=item breedingNotes

data type: C<string>

=item id

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of Phenotype

The following are all the objects that are associated with the Phenotype:

=over 4

=item L<"SexDistribution">: 	

Many to one assoication, use C<getSexDistribution> to get the associated SexDistribution.

  End Associations and related methods

=back

=cut

# Below is module documentation for Party

=pod

=head1 Party

CaCORE::CaMOD::Party - Perl extension for Party.

=head2 Abstract

The CaCORE::CaMOD::Party is a Perl object representation of the
caBIO Party object.

=head2 Description

Entity that has access to the data, either a person or an organization.

=head2 Attributes of Party

The following are all the attributes of the Party object and their data types:

=over 4

=item id

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of Party

The following are all the objects that are associated with the Party:

=over 4

=item L<"PartyRole">: 	

One to many assoication, use C<getPartyRoleCollection> to get a collection of associated PartyRole.

=item L<"ContactInfo">: 	

One to many assoication, use C<getContactInfoCollection> to get a collection of associated ContactInfo.

  End Associations and related methods

=back

=cut

# Below is module documentation for Person

=pod

=head1 Person

CaCORE::CaMOD::Person - Perl extension for Person.

=head2 Abstract

The CaCORE::CaMOD::Person is a Perl object representation of the
caBIO Person object.

=head2 Description

Person's first and last name and the connection to the party.

=head2 Attributes of Person

The following are all the attributes of the Person object and their data types:

=over 4

=item partyId

data type: C<long>

=item firstName

data type: C<string>

=item lastName

data type: C<string>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of Person

The following are all the objects that are associated with the Person:

=over 4

  End Associations and related methods

=back

=cut

# Below is module documentation for PartyRole

=pod

=head1 PartyRole

CaCORE::CaMOD::PartyRole - Perl extension for PartyRole.

=head2 Abstract

The CaCORE::CaMOD::PartyRole is a Perl object representation of the
caBIO PartyRole object.

=head2 Description

Object connects the party (organization or person) with the animal model.

=head2 Attributes of PartyRole

The following are all the attributes of the PartyRole object and their data types:

=over 4

=item id

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of PartyRole

The following are all the objects that are associated with the PartyRole:

=over 4

=item L<"Role">: 	

Many to one assoication, use C<getRole> to get the associated Role.

=item L<"AnimalModel">: 	

One to many assoication, use C<getAnimalModelCollection> to get a collection of associated AnimalModel.

=item L<"Party">: 	

Many to one assoication, use C<getParty> to get the associated Party.

  End Associations and related methods

=back

=cut

# Below is module documentation for Organization

=pod

=head1 Organization

CaCORE::CaMOD::Organization - Perl extension for Organization.

=head2 Abstract

The CaCORE::CaMOD::Organization is a Perl object representation of the
caBIO Organization object.

=head2 Description

Organizational unit like a laboratory, institute or consortium.

=head2 Attributes of Organization

The following are all the attributes of the Organization object and their data types:

=over 4

=item partyId

data type: C<long>

=item name

data type: C<string>

=item id

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of Organization

The following are all the objects that are associated with the Organization:

=over 4

  End Associations and related methods

=back

=cut

# Below is module documentation for MicroArrayData

=pod

=head1 MicroArrayData

CaCORE::CaMOD::MicroArrayData - Perl extension for MicroArrayData.

=head2 Abstract

The CaCORE::CaMOD::MicroArrayData is a Perl object representation of the
caBIO MicroArrayData object.

=head2 Description

Data of microarray experiments generated from the animal model.

=head2 Attributes of MicroArrayData

The following are all the attributes of the MicroArrayData object and their data types:

=over 4

=item experimentName

data type: C<string>

=item id

data type: C<long>

=item experimentId

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of MicroArrayData

The following are all the objects that are associated with the MicroArrayData:

=over 4

=item L<"Availability">: 	

Many to one assoication, use C<getAvailability> to get the associated Availability.

  End Associations and related methods

=back

=cut

# Below is module documentation for JaxInfo

=pod

=head1 JaxInfo

CaCORE::CaMOD::JaxInfo - Perl extension for JaxInfo.

=head2 Abstract

The CaCORE::CaMOD::JaxInfo is a Perl object representation of the
caBIO JaxInfo object.

=head2 Description

Identification number (stock number) of strain at the Jackson Laboratory, number can be used for ordering the strain; http://www.jax.org.

=head2 Attributes of JaxInfo

The following are all the attributes of the JaxInfo object and their data types:

=over 4

=item jaxStockNo

data type: C<long>

=item id

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of JaxInfo

The following are all the objects that are associated with the JaxInfo:

=over 4

  End Associations and related methods

=back

=cut

# Below is module documentation for EnvironmentalFactor

=pod

=head1 EnvironmentalFactor

CaCORE::CaMOD::EnvironmentalFactor - Perl extension for EnvironmentalFactor.

=head2 Abstract

The CaCORE::CaMOD::EnvironmentalFactor is a Perl object representation of the
caBIO EnvironmentalFactor object.

=head2 Description

Chemical, radiation, hormone treatment or other environmental factor that initiates or supports development of neoplasias.

=head2 Attributes of EnvironmentalFactor

The following are all the attributes of the EnvironmentalFactor object and their data types:

=over 4

=item name

data type: C<string>

=item type

data type: C<string>

=item id

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of EnvironmentalFactor

The following are all the objects that are associated with the EnvironmentalFactor:

=over 4

=item L<"InducedMutation">: 	

One to many assoication, use C<getInducedMutationCollection> to get a collection of associated InducedMutation.

  End Associations and related methods

=back

=cut

# Below is module documentation for InducedMutation

=pod

=head1 InducedMutation

CaCORE::CaMOD::InducedMutation - Perl extension for InducedMutation.

=head2 Abstract

The CaCORE::CaMOD::InducedMutation is a Perl object representation of the
caBIO InducedMutation object.

=head2 Description

Induced mutations are defined as mutations triggered by radiation, chemicals or other means. Progeny of the treated animal inherits the mutation.

=head2 Attributes of InducedMutation

The following are all the attributes of the InducedMutation object and their data types:

=over 4

=item id

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of InducedMutation

The following are all the objects that are associated with the InducedMutation:

=over 4

=item L<"EnvironmentalFactor">: 	

Many to one assoication, use C<getEnvironmentalFactor> to get the associated EnvironmentalFactor.

=item L<"EngineeredGene">: 	

One to many assoication, use C<getEngineeredGeneCollection> to get a collection of associated EngineeredGene.

  End Associations and related methods

=back

=cut

# Below is module documentation for GenomicSegment

=pod

=head1 GenomicSegment

CaCORE::CaMOD::GenomicSegment - Perl extension for GenomicSegment.

=head2 Abstract

The CaCORE::CaMOD::GenomicSegment is a Perl object representation of the
caBIO GenomicSegment object.

=head2 Description

Genomic segment extracted from a library e.g. BAC or YAC library to be used in the genetic manipulation of the animal model.

=head2 Attributes of GenomicSegment

The following are all the attributes of the GenomicSegment object and their data types:

=over 4

=item locationOfIntegration

data type: C<string>

=item segmentSize

data type: C<string>

=item id

data type: C<long>

=item cloneDesignator

data type: C<string>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of GenomicSegment

The following are all the objects that are associated with the GenomicSegment:

=over 4

=item L<"SegmentType">: 	

Many to one assoication, use C<getSegmentType> to get the associated SegmentType.

=item L<"EngineeredGene">: 	

One to many assoication, use C<getEngineeredGeneCollection> to get a collection of associated EngineeredGene.

  End Associations and related methods

=back

=cut

# Below is module documentation for GeneticAlteration

=pod

=head1 GeneticAlteration

CaCORE::CaMOD::GeneticAlteration - Perl extension for GeneticAlteration.

=head2 Abstract

The CaCORE::CaMOD::GeneticAlteration is a Perl object representation of the
caBIO GeneticAlteration object.

=head2 Description

Genetic alterations found in the neoplastic lesions of the animal model. These alterations are not made intentionally.

=head2 Attributes of GeneticAlteration

The following are all the attributes of the GeneticAlteration object and their data types:

=over 4

=item observation

data type: C<string>

=item methodOfObservation

data type: C<string>

=item id

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of GeneticAlteration

The following are all the objects that are associated with the GeneticAlteration:

=over 4

  End Associations and related methods

=back

=cut

# Below is module documentation for GeneFunction

=pod

=head1 GeneFunction

CaCORE::CaMOD::GeneFunction - Perl extension for GeneFunction.

=head2 Abstract

The CaCORE::CaMOD::GeneFunction is a Perl object representation of the
caBIO GeneFunction object.

=head2 Description

Functions of the engineered genes.

=head2 Attributes of GeneFunction

The following are all the attributes of the GeneFunction object and their data types:

=over 4

=item function

data type: C<string>

=item id

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of GeneFunction

The following are all the objects that are associated with the GeneFunction:

=over 4

=item L<"EngineeredGene">: 	

Many to one assoication, use C<getEngineeredGene> to get the associated EngineeredGene.

  End Associations and related methods

=back

=cut

# Below is module documentation for GeneDelivery

=pod

=head1 GeneDelivery

CaCORE::CaMOD::GeneDelivery - Perl extension for GeneDelivery.

=head2 Abstract

The CaCORE::CaMOD::GeneDelivery is a Perl object representation of the
caBIO GeneDelivery object.

=head2 Description

Gene is delivered to specific organs or specific receptors within the animal model. using viral vectors

=head2 Attributes of GeneDelivery

The following are all the attributes of the GeneDelivery object and their data types:

=over 4

=item viralVector

data type: C<string>

=item id

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of GeneDelivery

The following are all the objects that are associated with the GeneDelivery:

=over 4

=item L<"EngineeredGene">: 	

Many to one assoication, use C<getEngineeredGene> to get the associated EngineeredGene.

  End Associations and related methods

=back

=cut

# Below is module documentation for ContactInfo

=pod

=head1 ContactInfo

CaCORE::CaMOD::ContactInfo - Perl extension for ContactInfo.

=head2 Abstract

The CaCORE::CaMOD::ContactInfo is a Perl object representation of the
caBIO ContactInfo object.

=head2 Description

Information regarding the person who submitted the data.

=head2 Attributes of ContactInfo

The following are all the attributes of the ContactInfo object and their data types:

=over 4

=item faxNumber

data type: C<string>

=item zipCode

data type: C<string>

=item street

data type: C<string>

=item institute

data type: C<string>

=item state

data type: C<string>

=item email

data type: C<string>

=item phoneNumber

data type: C<string>

=item labName

data type: C<string>

=item id

data type: C<long>

=item city

data type: C<string>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of ContactInfo

The following are all the objects that are associated with the ContactInfo:

=over 4

=item L<"Party">: 	

One to many assoication, use C<getPartyCollection> to get a collection of associated Party.

  End Associations and related methods

=back

=cut

# Below is module documentation for CellLine

=pod

=head1 CellLine

CaCORE::CaMOD::CellLine - Perl extension for CellLine.

=head2 Abstract

The CaCORE::CaMOD::CellLine is a Perl object representation of the
caBIO CellLine object.

=head2 Description

Cell lines generated from the animal model.

=head2 Attributes of CellLine

The following are all the attributes of the CellLine object and their data types:

=over 4

=item experiment

data type: C<string>

=item comments

data type: C<string>

=item name

data type: C<string>

=item results

data type: C<string>

=item id

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of CellLine

The following are all the objects that are associated with the CellLine:

=over 4

=item L<"Publication">: 	

One to many assoication, use C<getPublicationCollection> to get a collection of associated Publication.

  End Associations and related methods

=back

=cut

# Below is module documentation for CarcinogenicIntervention

=pod

=head1 CarcinogenicIntervention

CaCORE::CaMOD::CarcinogenicIntervention - Perl extension for CarcinogenicIntervention.

=head2 Abstract

The CaCORE::CaMOD::CarcinogenicIntervention is a Perl object representation of the
caBIO CarcinogenicIntervention object.

=head2 Description

Treatment or procedure that the animal model was exposed to in order to initiate or support the development of neoplastic lesions.

=head2 Attributes of CarcinogenicIntervention

The following are all the attributes of the CarcinogenicIntervention object and their data types:

=over 4

=item id

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of CarcinogenicIntervention

The following are all the objects that are associated with the CarcinogenicIntervention:

=over 4

=item L<"EnvironmentalFactor">: 	

Many to one assoication, use C<getEnvironmentalFactor> to get the associated EnvironmentalFactor.

=item L<"TreatmentSchedule">: 	

Many to one assoication, use C<getTreatmentSchedule> to get the associated TreatmentSchedule.

  End Associations and related methods

=back

=cut

# Below is module documentation for AnimalModel

=pod

=head1 AnimalModel

CaCORE::CaMOD::AnimalModel - Perl extension for AnimalModel.

=head2 Abstract

The CaCORE::CaMOD::AnimalModel is a Perl object representation of the
caBIO AnimalModel object.

=head2 Description

An animal model which develops cancer or can be used to generate a model that develops cancer.

=head2 Attributes of AnimalModel

The following are all the attributes of the AnimalModel object and their data types:

=over 4

=item url

data type: C<string>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of AnimalModel

The following are all the objects that are associated with the AnimalModel:

=over 4

=item L<"Phenotype">: 	

Many to one assoication, use C<getPhenotype> to get the associated Phenotype.

=item L<"CarcinogenicIntervention">: 	

One to many assoication, use C<getCarcinogenicInterventionCollection> to get a collection of associated CarcinogenicIntervention.

=item L<"Therapy">: 	

One to many assoication, use C<getTherapyCollection> to get a collection of associated Therapy.

=item L<"Image">: 	

One to many assoication, use C<getImageCollection> to get a collection of associated Image.

=item L<"Xenograft">: 	

One to many assoication, use C<getXenograftCollection> to get a collection of associated Xenograft.

=item L<"MicroArrayData">: 	

One to many assoication, use C<getMicroArrayDataCollection> to get a collection of associated MicroArrayData.

=item L<"TargetedModification">: 	

One to many assoication, use C<getTargetedModificationCollection> to get a collection of associated TargetedModification.

=item L<"GenomicSegment">: 	

One to many assoication, use C<getGenomicSegmentCollection> to get a collection of associated GenomicSegment.

=item L<"RepositoryInfo">: 	

Many to one assoication, use C<getRepositoryInfo> to get the associated RepositoryInfo.

=item L<"Histopathology">: 	

One to many assoication, use C<getHistopathologyCollection> to get a collection of associated Histopathology.

=item L<"CellLine">: 	

One to many assoication, use C<getCellLineCollection> to get a collection of associated CellLine.

=item L<"Transgene">: 	

One to many assoication, use C<getTransgeneCollection> to get a collection of associated Transgene.

=item L<"JaxInfo">: 	

Many to one assoication, use C<getJaxInfo> to get the associated JaxInfo.

=item L<"InducedMutation">: 	

One to many assoication, use C<getInducedMutationCollection> to get a collection of associated InducedMutation.

  End Associations and related methods

=back

=cut

# Below is module documentation for EndpointCode

=pod

=head1 EndpointCode

CaCORE::CaMOD::EndpointCode - Perl extension for EndpointCode.

=head2 Abstract

The CaCORE::CaMOD::EndpointCode is a Perl object representation of the
caBIO EndpointCode object.

=head2 Description

A endpoint code captures the parameter for measuring success of anti-drug screen test; mean tumor weightm median survival time, etc.

=head2 Attributes of EndpointCode

The following are all the attributes of the EndpointCode object and their data types:

=over 4

=item code

data type: C<string>

=item description

data type: C<string>

=item id

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of EndpointCode

The following are all the objects that are associated with the EndpointCode:

=over 4

  End Associations and related methods

=back

=cut

# Below is module documentation for ScreeningResult

=pod

=head1 ScreeningResult

CaCORE::CaMOD::ScreeningResult - Perl extension for ScreeningResult.

=head2 Abstract

The CaCORE::CaMOD::ScreeningResult is a Perl object representation of the
caBIO ScreeningResult object.

=head2 Description

A Screening Result captures the results of the tens of thousands of compounds screened for their ability to inhibit the growth of selected yeast strains altered in DNA damage repair or cell cycle control.

=head2 Attributes of ScreeningResult

The following are all the attributes of the ScreeningResult object and their data types:

=over 4

=item diffinh

data type: C<float>

=item aveinh

data type: C<float>

=item stage

data type: C<string>

=item id

data type: C<long>

=item inhibitionRate

data type: C<float>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of ScreeningResult

The following are all the objects that are associated with the ScreeningResult:

=over 4

=item L<"TreatmentSchedule">: 	

Many to one assoication, use C<getTreatmentSchedule> to get the associated TreatmentSchedule.

=item L<"Agent">: 	

Many to one assoication, use C<getAgent> to get the associated Agent.

  End Associations and related methods

=back

=cut

# Below is module documentation for InvivoResult

=pod

=head1 InvivoResult

CaCORE::CaMOD::InvivoResult - Perl extension for InvivoResult.

=head2 Abstract

The CaCORE::CaMOD::InvivoResult is a Perl object representation of the
caBIO InvivoResult object.

=head2 Description

An Invivo Result captures the results of anti-tumor drug screening.

=head2 Attributes of InvivoResult

The following are all the attributes of the InvivoResult object and their data types:

=over 4

=item toxicityEvalDay

data type: C<string>

=item evaluationDay

data type: C<string>

=item toxicitySurvivors

data type: C<string>

=item id

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of InvivoResult

The following are all the objects that are associated with the InvivoResult:

=over 4

=item L<"TreatmentSchedule">: 	

Many to one assoication, use C<getTreatmentSchedule> to get the associated TreatmentSchedule.

=item L<"Agent">: 	

Many to one assoication, use C<getAgent> to get the associated Agent.

=item L<"EndpointCode">: 	

Many to one assoication, use C<getEndpointCode> to get the associated EndpointCode.

  End Associations and related methods

=back

=cut

# Below is module documentation for ModificationType

=pod

=head1 ModificationType

CaCORE::CaMOD::ModificationType - Perl extension for ModificationType.

=head2 Abstract

The CaCORE::CaMOD::ModificationType is a Perl object representation of the
caBIO ModificationType object.

=head2 Description



=head2 Attributes of ModificationType

The following are all the attributes of the ModificationType object and their data types:

=over 4

=item name

data type: C<string>

=item id

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of ModificationType

The following are all the objects that are associated with the ModificationType:

=over 4

=item L<"TargetedModification">: 	

One to many assoication, use C<getTargetedModificationCollection> to get a collection of associated TargetedModification.

  End Associations and related methods

=back

=cut

# Below is module documentation for ExpressionFeature

=pod

=head1 ExpressionFeature

CaCORE::CaMOD::ExpressionFeature - Perl extension for ExpressionFeature.

=head2 Abstract

The CaCORE::CaMOD::ExpressionFeature is a Perl object representation of the
caBIO ExpressionFeature object.

=head2 Description

The expression feature object describes expression pattern of the engineered gene in the cancer model.

=head2 Attributes of ExpressionFeature

The following are all the attributes of the ExpressionFeature object and their data types:

=over 4

=item id

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of ExpressionFeature

The following are all the objects that are associated with the ExpressionFeature:

=over 4

=item L<"OrganOntology">: 	

One to many assoication, use C<getOrganOntologyCollection> to get a collection of associated OrganOntology.

  End Associations and related methods

=back

=cut

# Below is module documentation for CancerModel

=pod

=head1 CancerModel

CaCORE::CaMOD::CancerModel - Perl extension for CancerModel.

=head2 Abstract

The CaCORE::CaMOD::CancerModel is a Perl object representation of the
caBIO CancerModel object.

=head2 Description



=head2 Attributes of CancerModel

The following are all the attributes of the CancerModel object and their data types:

=over 4

=item id

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of CancerModel

The following are all the objects that are associated with the CancerModel:

=over 4

  End Associations and related methods

=back

=cut

