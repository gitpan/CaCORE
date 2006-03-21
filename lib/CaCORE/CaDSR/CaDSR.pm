# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::Context;

#use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

$VERSION = '3.01';

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

@ISA = qw(CaCORE::DomainObjectI);

our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

# create an instance of the Context object
# returns: a Context object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Context\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Context intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:ContextImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# languageName;
	if( defined( $self->getLanguageName ) ) {
		$tmpstr = "<languageName xsi:type=\"xsd:string\">" . $self->getLanguageName . "</languageName>";
	} else {
		$tmpstr = "<languageName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# version;
	if( defined( $self->getVersion ) ) {
		$tmpstr = "<version xsi:type=\"xsd:float\">" . $self->getVersion . "</version>";
	} else {
		$tmpstr = "<version xsi:type=\"xsd:float\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# description;
	if( defined( $self->getDescription ) ) {
		$tmpstr = "<description xsi:type=\"xsd:string\">" . $self->getDescription . "</description>";
	} else {
		$tmpstr = "<description xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of Context objects
# param: xml doc
# returns: list of Context objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @ContextNodes = $root->getChildNodes;
	my $ContextLength = $#ContextNodes;
	#print "total bean count = $ContextLength\n";
	
	# parse all Context nodes
	my @obj_list = ();
	foreach my $ContextNode (@ContextNodes) {
		#print "\tContext\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $languageName;
		my $modifiedBy;
		my $createdBy;
		my $dateCreated;
		my $version;
		my $dateModified;
		my $description;
		my $name;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($ContextNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "languageName") {
				$languageName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "version") {
				$version=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "description") {
				$description=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::Context;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setLanguageName($languageName);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setCreatedBy($createdBy);
		$newobj->setDateCreated($dateCreated);
		$newobj->setVersion($version);
		$newobj->setDateModified($dateModified);
		$newobj->setDescription($description);
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

sub getLanguageName {
	my $self = shift;
	return $self->{languageName};
}

sub setLanguageName {
	my $self = shift;
	$self->{languageName} = shift;
}

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

sub getVersion {
	my $self = shift;
	return $self->{version};
}

sub setVersion {
	my $self = shift;
	$self->{version} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getDescription {
	my $self = shift;
	return $self->{description};
}

sub setDescription {
	my $self = shift;
	$self->{description} = shift;
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

sub getDefinitionCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::Definition", $self);
	return @results;
}

sub getDesignationCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::Designation", $self);
	return @results;
}

sub getReferenceDocumentCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ReferenceDocument", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::AdministeredComponent;

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

# create an instance of the AdministeredComponent object
# returns: a AdministeredComponent object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new AdministeredComponent\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this AdministeredComponent intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:AdministeredComponentImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# beginDate;
	if( defined( $self->getBeginDate ) ) {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\">" . $self->getBeginDate . "</beginDate>";
	} else {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusName;
	if( defined( $self->getWorkflowStatusName ) ) {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\">" . $self->getWorkflowStatusName . "</workflowStatusName>";
	} else {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# changeNote;
	if( defined( $self->getChangeNote ) ) {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\">" . $self->getChangeNote . "</changeNote>";
	} else {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# origin;
	if( defined( $self->getOrigin ) ) {
		$tmpstr = "<origin xsi:type=\"xsd:string\">" . $self->getOrigin . "</origin>";
	} else {
		$tmpstr = "<origin xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# latestVersionIndicator;
	if( defined( $self->getLatestVersionIndicator ) ) {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\">" . $self->getLatestVersionIndicator . "</latestVersionIndicator>";
	} else {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# longName;
	if( defined( $self->getLongName ) ) {
		$tmpstr = "<longName xsi:type=\"xsd:string\">" . $self->getLongName . "</longName>";
	} else {
		$tmpstr = "<longName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredName;
	if( defined( $self->getPreferredName ) ) {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\">" . $self->getPreferredName . "</preferredName>";
	} else {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredDefinition;
	if( defined( $self->getPreferredDefinition ) ) {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\">" . $self->getPreferredDefinition . "</preferredDefinition>";
	} else {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# publicID;
	if( defined( $self->getPublicID ) ) {
		$tmpstr = "<publicID xsi:type=\"xsd:long\">" . $self->getPublicID . "</publicID>";
	} else {
		$tmpstr = "<publicID xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusDescription;
	if( defined( $self->getWorkflowStatusDescription ) ) {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\">" . $self->getWorkflowStatusDescription . "</workflowStatusDescription>";
	} else {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# version;
	if( defined( $self->getVersion ) ) {
		$tmpstr = "<version xsi:type=\"xsd:float\">" . $self->getVersion . "</version>";
	} else {
		$tmpstr = "<version xsi:type=\"xsd:float\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# unresolvedIssue;
	if( defined( $self->getUnresolvedIssue ) ) {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\">" . $self->getUnresolvedIssue . "</unresolvedIssue>";
	} else {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# registrationStatus;
	if( defined( $self->getRegistrationStatus ) ) {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\">" . $self->getRegistrationStatus . "</registrationStatus>";
	} else {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# endDate;
	if( defined( $self->getEndDate ) ) {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\">" . $self->getEndDate . "</endDate>";
	} else {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# deletedIndicator;
	if( defined( $self->getDeletedIndicator ) ) {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\">" . $self->getDeletedIndicator . "</deletedIndicator>";
	} else {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of AdministeredComponent objects
# param: xml doc
# returns: list of AdministeredComponent objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @AdministeredComponentNodes = $root->getChildNodes;
	my $AdministeredComponentLength = $#AdministeredComponentNodes;
	#print "total bean count = $AdministeredComponentLength\n";
	
	# parse all AdministeredComponent nodes
	my @obj_list = ();
	foreach my $AdministeredComponentNode (@AdministeredComponentNodes) {
		#print "\tAdministeredComponent\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $modifiedBy;
		my $beginDate;
		my $workflowStatusName;
		my $changeNote;
		my $origin;
		my $dateCreated;
		my $latestVersionIndicator;
		my $longName;
		my $preferredName;
		my $preferredDefinition;
		my $publicID;
		my $createdBy;
		my $workflowStatusDescription;
		my $version;
		my $unresolvedIssue;
		my $registrationStatus;
		my $dateModified;
		my $endDate;
		my $deletedIndicator;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($AdministeredComponentNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "beginDate") {
				$beginDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusName") {
				$workflowStatusName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "changeNote") {
				$changeNote=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "origin") {
				$origin=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "latestVersionIndicator") {
				$latestVersionIndicator=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "longName") {
				$longName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredName") {
				$preferredName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredDefinition") {
				$preferredDefinition=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "publicID") {
				$publicID=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusDescription") {
				$workflowStatusDescription=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "version") {
				$version=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "unresolvedIssue") {
				$unresolvedIssue=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "registrationStatus") {
				$registrationStatus=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "endDate") {
				$endDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "deletedIndicator") {
				$deletedIndicator=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::AdministeredComponent;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setBeginDate($beginDate);
		$newobj->setWorkflowStatusName($workflowStatusName);
		$newobj->setChangeNote($changeNote);
		$newobj->setOrigin($origin);
		$newobj->setDateCreated($dateCreated);
		$newobj->setLatestVersionIndicator($latestVersionIndicator);
		$newobj->setLongName($longName);
		$newobj->setPreferredName($preferredName);
		$newobj->setPreferredDefinition($preferredDefinition);
		$newobj->setPublicID($publicID);
		$newobj->setCreatedBy($createdBy);
		$newobj->setWorkflowStatusDescription($workflowStatusDescription);
		$newobj->setVersion($version);
		$newobj->setUnresolvedIssue($unresolvedIssue);
		$newobj->setRegistrationStatus($registrationStatus);
		$newobj->setDateModified($dateModified);
		$newobj->setEndDate($endDate);
		$newobj->setDeletedIndicator($deletedIndicator);
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

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getBeginDate {
	my $self = shift;
	return $self->{beginDate};
}

sub setBeginDate {
	my $self = shift;
	$self->{beginDate} = shift;
}

sub getWorkflowStatusName {
	my $self = shift;
	return $self->{workflowStatusName};
}

sub setWorkflowStatusName {
	my $self = shift;
	$self->{workflowStatusName} = shift;
}

sub getChangeNote {
	my $self = shift;
	return $self->{changeNote};
}

sub setChangeNote {
	my $self = shift;
	$self->{changeNote} = shift;
}

sub getOrigin {
	my $self = shift;
	return $self->{origin};
}

sub setOrigin {
	my $self = shift;
	$self->{origin} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

sub getLatestVersionIndicator {
	my $self = shift;
	return $self->{latestVersionIndicator};
}

sub setLatestVersionIndicator {
	my $self = shift;
	$self->{latestVersionIndicator} = shift;
}

sub getLongName {
	my $self = shift;
	return $self->{longName};
}

sub setLongName {
	my $self = shift;
	$self->{longName} = shift;
}

sub getPreferredName {
	my $self = shift;
	return $self->{preferredName};
}

sub setPreferredName {
	my $self = shift;
	$self->{preferredName} = shift;
}

sub getPreferredDefinition {
	my $self = shift;
	return $self->{preferredDefinition};
}

sub setPreferredDefinition {
	my $self = shift;
	$self->{preferredDefinition} = shift;
}

sub getPublicID {
	my $self = shift;
	return $self->{publicID};
}

sub setPublicID {
	my $self = shift;
	$self->{publicID} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getWorkflowStatusDescription {
	my $self = shift;
	return $self->{workflowStatusDescription};
}

sub setWorkflowStatusDescription {
	my $self = shift;
	$self->{workflowStatusDescription} = shift;
}

sub getVersion {
	my $self = shift;
	return $self->{version};
}

sub setVersion {
	my $self = shift;
	$self->{version} = shift;
}

sub getUnresolvedIssue {
	my $self = shift;
	return $self->{unresolvedIssue};
}

sub setUnresolvedIssue {
	my $self = shift;
	$self->{unresolvedIssue} = shift;
}

sub getRegistrationStatus {
	my $self = shift;
	return $self->{registrationStatus};
}

sub setRegistrationStatus {
	my $self = shift;
	$self->{registrationStatus} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getEndDate {
	my $self = shift;
	return $self->{endDate};
}

sub setEndDate {
	my $self = shift;
	$self->{endDate} = shift;
}

sub getDeletedIndicator {
	my $self = shift;
	return $self->{deletedIndicator};
}

sub setDeletedIndicator {
	my $self = shift;
	$self->{deletedIndicator} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getDefinitionCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::Definition", $self);
	return @results;
}

sub getContext {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::Context", $self);
	return $results[0];
}

sub getDesignationCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::Designation", $self);
	return @results;
}

sub getAdministeredComponentClassSchemeItemCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::AdministeredComponentClassSchemeItem", $self);
	return @results;
}

sub getReferenceDocumentCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ReferenceDocument", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::DerivationType;

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

# create an instance of the DerivationType object
# returns: a DerivationType object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new DerivationType\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this DerivationType intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:DerivationTypeImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# description;
	if( defined( $self->getDescription ) ) {
		$tmpstr = "<description xsi:type=\"xsd:string\">" . $self->getDescription . "</description>";
	} else {
		$tmpstr = "<description xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of DerivationType objects
# param: xml doc
# returns: list of DerivationType objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @DerivationTypeNodes = $root->getChildNodes;
	my $DerivationTypeLength = $#DerivationTypeNodes;
	#print "total bean count = $DerivationTypeLength\n";
	
	# parse all DerivationType nodes
	my @obj_list = ();
	foreach my $DerivationTypeNode (@DerivationTypeNodes) {
		#print "\tDerivationType\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $modifiedBy;
		my $dateModified;
		my $description;
		my $createdBy;
		my $name;
		my $dateCreated;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($DerivationTypeNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "description") {
				$description=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::DerivationType;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setDateModified($dateModified);
		$newobj->setDescription($description);
		$newobj->setCreatedBy($createdBy);
		$newobj->setName($name);
		$newobj->setDateCreated($dateCreated);
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

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getDescription {
	my $self = shift;
	return $self->{description};
}

sub setDescription {
	my $self = shift;
	$self->{description} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getName {
	my $self = shift;
	return $self->{name};
}

sub setName {
	my $self = shift;
	$self->{name} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getConceptDerivationRuleCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ConceptDerivationRule", $self);
	return @results;
}

sub getDerivedDataElementCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::DerivedDataElement", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::ConceptDerivationRule;

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

# create an instance of the ConceptDerivationRule object
# returns: a ConceptDerivationRule object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new ConceptDerivationRule\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this ConceptDerivationRule intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:ConceptDerivationRuleImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of ConceptDerivationRule objects
# param: xml doc
# returns: list of ConceptDerivationRule objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @ConceptDerivationRuleNodes = $root->getChildNodes;
	my $ConceptDerivationRuleLength = $#ConceptDerivationRuleNodes;
	#print "total bean count = $ConceptDerivationRuleLength\n";
	
	# parse all ConceptDerivationRule nodes
	my @obj_list = ();
	foreach my $ConceptDerivationRuleNode (@ConceptDerivationRuleNodes) {
		#print "\tConceptDerivationRule\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $modifiedBy;
		my $createdBy;
		my $dateCreated;
		my $dateModified;
		my $name;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($ConceptDerivationRuleNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::ConceptDerivationRule;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setCreatedBy($createdBy);
		$newobj->setDateCreated($dateCreated);
		$newobj->setDateModified($dateModified);
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

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
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

sub getDerivationType {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::DerivationType", $self);
	return $results[0];
}

sub getQualifierCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::Qualifier", $self);
	return @results;
}

sub getRepresentationCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::Representation", $self);
	return @results;
}

sub getObjectClassCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ObjectClass", $self);
	return @results;
}

sub getPropertyCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::Property", $self);
	return @results;
}

sub getValueMeaningCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ValueMeaning", $self);
	return @results;
}

sub getComponentConceptCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ComponentConcept", $self);
	return @results;
}

sub getConceptualDomainCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ConceptualDomain", $self);
	return @results;
}

sub getValueDomainCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ValueDomain", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::ConceptualDomain;

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

# create an instance of the ConceptualDomain object
# returns: a ConceptualDomain object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new ConceptualDomain\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this ConceptualDomain intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:ConceptualDomainImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# dimensionality;
	if( defined( $self->getDimensionality ) ) {
		$tmpstr = "<dimensionality xsi:type=\"xsd:string\">" . $self->getDimensionality . "</dimensionality>";
	} else {
		$tmpstr = "<dimensionality xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# beginDate;
	if( defined( $self->getBeginDate ) ) {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\">" . $self->getBeginDate . "</beginDate>";
	} else {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusName;
	if( defined( $self->getWorkflowStatusName ) ) {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\">" . $self->getWorkflowStatusName . "</workflowStatusName>";
	} else {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# changeNote;
	if( defined( $self->getChangeNote ) ) {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\">" . $self->getChangeNote . "</changeNote>";
	} else {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# origin;
	if( defined( $self->getOrigin ) ) {
		$tmpstr = "<origin xsi:type=\"xsd:string\">" . $self->getOrigin . "</origin>";
	} else {
		$tmpstr = "<origin xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# latestVersionIndicator;
	if( defined( $self->getLatestVersionIndicator ) ) {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\">" . $self->getLatestVersionIndicator . "</latestVersionIndicator>";
	} else {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# longName;
	if( defined( $self->getLongName ) ) {
		$tmpstr = "<longName xsi:type=\"xsd:string\">" . $self->getLongName . "</longName>";
	} else {
		$tmpstr = "<longName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredName;
	if( defined( $self->getPreferredName ) ) {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\">" . $self->getPreferredName . "</preferredName>";
	} else {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredDefinition;
	if( defined( $self->getPreferredDefinition ) ) {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\">" . $self->getPreferredDefinition . "</preferredDefinition>";
	} else {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# publicID;
	if( defined( $self->getPublicID ) ) {
		$tmpstr = "<publicID xsi:type=\"xsd:long\">" . $self->getPublicID . "</publicID>";
	} else {
		$tmpstr = "<publicID xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusDescription;
	if( defined( $self->getWorkflowStatusDescription ) ) {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\">" . $self->getWorkflowStatusDescription . "</workflowStatusDescription>";
	} else {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# version;
	if( defined( $self->getVersion ) ) {
		$tmpstr = "<version xsi:type=\"xsd:float\">" . $self->getVersion . "</version>";
	} else {
		$tmpstr = "<version xsi:type=\"xsd:float\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# unresolvedIssue;
	if( defined( $self->getUnresolvedIssue ) ) {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\">" . $self->getUnresolvedIssue . "</unresolvedIssue>";
	} else {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# registrationStatus;
	if( defined( $self->getRegistrationStatus ) ) {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\">" . $self->getRegistrationStatus . "</registrationStatus>";
	} else {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# endDate;
	if( defined( $self->getEndDate ) ) {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\">" . $self->getEndDate . "</endDate>";
	} else {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# deletedIndicator;
	if( defined( $self->getDeletedIndicator ) ) {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\">" . $self->getDeletedIndicator . "</deletedIndicator>";
	} else {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of ConceptualDomain objects
# param: xml doc
# returns: list of ConceptualDomain objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @ConceptualDomainNodes = $root->getChildNodes;
	my $ConceptualDomainLength = $#ConceptualDomainNodes;
	#print "total bean count = $ConceptualDomainLength\n";
	
	# parse all ConceptualDomain nodes
	my @obj_list = ();
	foreach my $ConceptualDomainNode (@ConceptualDomainNodes) {
		#print "\tConceptualDomain\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $dimensionality;
		my $modifiedBy;
		my $beginDate;
		my $workflowStatusName;
		my $changeNote;
		my $origin;
		my $dateCreated;
		my $latestVersionIndicator;
		my $longName;
		my $preferredName;
		my $preferredDefinition;
		my $publicID;
		my $createdBy;
		my $workflowStatusDescription;
		my $version;
		my $unresolvedIssue;
		my $registrationStatus;
		my $dateModified;
		my $endDate;
		my $deletedIndicator;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($ConceptualDomainNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dimensionality") {
				$dimensionality=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "beginDate") {
				$beginDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusName") {
				$workflowStatusName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "changeNote") {
				$changeNote=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "origin") {
				$origin=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "latestVersionIndicator") {
				$latestVersionIndicator=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "longName") {
				$longName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredName") {
				$preferredName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredDefinition") {
				$preferredDefinition=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "publicID") {
				$publicID=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusDescription") {
				$workflowStatusDescription=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "version") {
				$version=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "unresolvedIssue") {
				$unresolvedIssue=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "registrationStatus") {
				$registrationStatus=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "endDate") {
				$endDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "deletedIndicator") {
				$deletedIndicator=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::ConceptualDomain;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setDimensionality($dimensionality);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setBeginDate($beginDate);
		$newobj->setWorkflowStatusName($workflowStatusName);
		$newobj->setChangeNote($changeNote);
		$newobj->setOrigin($origin);
		$newobj->setDateCreated($dateCreated);
		$newobj->setLatestVersionIndicator($latestVersionIndicator);
		$newobj->setLongName($longName);
		$newobj->setPreferredName($preferredName);
		$newobj->setPreferredDefinition($preferredDefinition);
		$newobj->setPublicID($publicID);
		$newobj->setCreatedBy($createdBy);
		$newobj->setWorkflowStatusDescription($workflowStatusDescription);
		$newobj->setVersion($version);
		$newobj->setUnresolvedIssue($unresolvedIssue);
		$newobj->setRegistrationStatus($registrationStatus);
		$newobj->setDateModified($dateModified);
		$newobj->setEndDate($endDate);
		$newobj->setDeletedIndicator($deletedIndicator);
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

sub getDimensionality {
	my $self = shift;
	return $self->{dimensionality};
}

sub setDimensionality {
	my $self = shift;
	$self->{dimensionality} = shift;
}

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getBeginDate {
	my $self = shift;
	return $self->{beginDate};
}

sub setBeginDate {
	my $self = shift;
	$self->{beginDate} = shift;
}

sub getWorkflowStatusName {
	my $self = shift;
	return $self->{workflowStatusName};
}

sub setWorkflowStatusName {
	my $self = shift;
	$self->{workflowStatusName} = shift;
}

sub getChangeNote {
	my $self = shift;
	return $self->{changeNote};
}

sub setChangeNote {
	my $self = shift;
	$self->{changeNote} = shift;
}

sub getOrigin {
	my $self = shift;
	return $self->{origin};
}

sub setOrigin {
	my $self = shift;
	$self->{origin} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

sub getLatestVersionIndicator {
	my $self = shift;
	return $self->{latestVersionIndicator};
}

sub setLatestVersionIndicator {
	my $self = shift;
	$self->{latestVersionIndicator} = shift;
}

sub getLongName {
	my $self = shift;
	return $self->{longName};
}

sub setLongName {
	my $self = shift;
	$self->{longName} = shift;
}

sub getPreferredName {
	my $self = shift;
	return $self->{preferredName};
}

sub setPreferredName {
	my $self = shift;
	$self->{preferredName} = shift;
}

sub getPreferredDefinition {
	my $self = shift;
	return $self->{preferredDefinition};
}

sub setPreferredDefinition {
	my $self = shift;
	$self->{preferredDefinition} = shift;
}

sub getPublicID {
	my $self = shift;
	return $self->{publicID};
}

sub setPublicID {
	my $self = shift;
	$self->{publicID} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getWorkflowStatusDescription {
	my $self = shift;
	return $self->{workflowStatusDescription};
}

sub setWorkflowStatusDescription {
	my $self = shift;
	$self->{workflowStatusDescription} = shift;
}

sub getVersion {
	my $self = shift;
	return $self->{version};
}

sub setVersion {
	my $self = shift;
	$self->{version} = shift;
}

sub getUnresolvedIssue {
	my $self = shift;
	return $self->{unresolvedIssue};
}

sub setUnresolvedIssue {
	my $self = shift;
	$self->{unresolvedIssue} = shift;
}

sub getRegistrationStatus {
	my $self = shift;
	return $self->{registrationStatus};
}

sub setRegistrationStatus {
	my $self = shift;
	$self->{registrationStatus} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getEndDate {
	my $self = shift;
	return $self->{endDate};
}

sub setEndDate {
	my $self = shift;
	$self->{endDate} = shift;
}

sub getDeletedIndicator {
	my $self = shift;
	return $self->{deletedIndicator};
}

sub setDeletedIndicator {
	my $self = shift;
	$self->{deletedIndicator} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getDataElementConceptCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::DataElementConcept", $self);
	return @results;
}

sub getValueMeaningCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ValueMeaning", $self);
	return @results;
}

sub getConceptDerivationRule {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ConceptDerivationRule", $self);
	return $results[0];
}

sub getValueDomainCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ValueDomain", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::ObjectClass;

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

# create an instance of the ObjectClass object
# returns: a ObjectClass object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new ObjectClass\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this ObjectClass intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:ObjectClassImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# definitionSource;
	if( defined( $self->getDefinitionSource ) ) {
		$tmpstr = "<definitionSource xsi:type=\"xsd:string\">" . $self->getDefinitionSource . "</definitionSource>";
	} else {
		$tmpstr = "<definitionSource xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# beginDate;
	if( defined( $self->getBeginDate ) ) {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\">" . $self->getBeginDate . "</beginDate>";
	} else {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusName;
	if( defined( $self->getWorkflowStatusName ) ) {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\">" . $self->getWorkflowStatusName . "</workflowStatusName>";
	} else {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# changeNote;
	if( defined( $self->getChangeNote ) ) {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\">" . $self->getChangeNote . "</changeNote>";
	} else {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# origin;
	if( defined( $self->getOrigin ) ) {
		$tmpstr = "<origin xsi:type=\"xsd:string\">" . $self->getOrigin . "</origin>";
	} else {
		$tmpstr = "<origin xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# latestVersionIndicator;
	if( defined( $self->getLatestVersionIndicator ) ) {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\">" . $self->getLatestVersionIndicator . "</latestVersionIndicator>";
	} else {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# longName;
	if( defined( $self->getLongName ) ) {
		$tmpstr = "<longName xsi:type=\"xsd:string\">" . $self->getLongName . "</longName>";
	} else {
		$tmpstr = "<longName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredName;
	if( defined( $self->getPreferredName ) ) {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\">" . $self->getPreferredName . "</preferredName>";
	} else {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredDefinition;
	if( defined( $self->getPreferredDefinition ) ) {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\">" . $self->getPreferredDefinition . "</preferredDefinition>";
	} else {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# publicID;
	if( defined( $self->getPublicID ) ) {
		$tmpstr = "<publicID xsi:type=\"xsd:long\">" . $self->getPublicID . "</publicID>";
	} else {
		$tmpstr = "<publicID xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusDescription;
	if( defined( $self->getWorkflowStatusDescription ) ) {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\">" . $self->getWorkflowStatusDescription . "</workflowStatusDescription>";
	} else {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# version;
	if( defined( $self->getVersion ) ) {
		$tmpstr = "<version xsi:type=\"xsd:float\">" . $self->getVersion . "</version>";
	} else {
		$tmpstr = "<version xsi:type=\"xsd:float\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# unresolvedIssue;
	if( defined( $self->getUnresolvedIssue ) ) {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\">" . $self->getUnresolvedIssue . "</unresolvedIssue>";
	} else {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# registrationStatus;
	if( defined( $self->getRegistrationStatus ) ) {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\">" . $self->getRegistrationStatus . "</registrationStatus>";
	} else {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# endDate;
	if( defined( $self->getEndDate ) ) {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\">" . $self->getEndDate . "</endDate>";
	} else {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# deletedIndicator;
	if( defined( $self->getDeletedIndicator ) ) {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\">" . $self->getDeletedIndicator . "</deletedIndicator>";
	} else {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of ObjectClass objects
# param: xml doc
# returns: list of ObjectClass objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @ObjectClassNodes = $root->getChildNodes;
	my $ObjectClassLength = $#ObjectClassNodes;
	#print "total bean count = $ObjectClassLength\n";
	
	# parse all ObjectClass nodes
	my @obj_list = ();
	foreach my $ObjectClassNode (@ObjectClassNodes) {
		#print "\tObjectClass\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $definitionSource;
		my $modifiedBy;
		my $beginDate;
		my $workflowStatusName;
		my $changeNote;
		my $origin;
		my $dateCreated;
		my $latestVersionIndicator;
		my $longName;
		my $preferredName;
		my $preferredDefinition;
		my $publicID;
		my $createdBy;
		my $workflowStatusDescription;
		my $version;
		my $unresolvedIssue;
		my $registrationStatus;
		my $dateModified;
		my $endDate;
		my $deletedIndicator;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($ObjectClassNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "definitionSource") {
				$definitionSource=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "beginDate") {
				$beginDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusName") {
				$workflowStatusName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "changeNote") {
				$changeNote=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "origin") {
				$origin=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "latestVersionIndicator") {
				$latestVersionIndicator=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "longName") {
				$longName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredName") {
				$preferredName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredDefinition") {
				$preferredDefinition=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "publicID") {
				$publicID=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusDescription") {
				$workflowStatusDescription=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "version") {
				$version=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "unresolvedIssue") {
				$unresolvedIssue=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "registrationStatus") {
				$registrationStatus=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "endDate") {
				$endDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "deletedIndicator") {
				$deletedIndicator=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::ObjectClass;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setDefinitionSource($definitionSource);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setBeginDate($beginDate);
		$newobj->setWorkflowStatusName($workflowStatusName);
		$newobj->setChangeNote($changeNote);
		$newobj->setOrigin($origin);
		$newobj->setDateCreated($dateCreated);
		$newobj->setLatestVersionIndicator($latestVersionIndicator);
		$newobj->setLongName($longName);
		$newobj->setPreferredName($preferredName);
		$newobj->setPreferredDefinition($preferredDefinition);
		$newobj->setPublicID($publicID);
		$newobj->setCreatedBy($createdBy);
		$newobj->setWorkflowStatusDescription($workflowStatusDescription);
		$newobj->setVersion($version);
		$newobj->setUnresolvedIssue($unresolvedIssue);
		$newobj->setRegistrationStatus($registrationStatus);
		$newobj->setDateModified($dateModified);
		$newobj->setEndDate($endDate);
		$newobj->setDeletedIndicator($deletedIndicator);
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

sub getDefinitionSource {
	my $self = shift;
	return $self->{definitionSource};
}

sub setDefinitionSource {
	my $self = shift;
	$self->{definitionSource} = shift;
}

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getBeginDate {
	my $self = shift;
	return $self->{beginDate};
}

sub setBeginDate {
	my $self = shift;
	$self->{beginDate} = shift;
}

sub getWorkflowStatusName {
	my $self = shift;
	return $self->{workflowStatusName};
}

sub setWorkflowStatusName {
	my $self = shift;
	$self->{workflowStatusName} = shift;
}

sub getChangeNote {
	my $self = shift;
	return $self->{changeNote};
}

sub setChangeNote {
	my $self = shift;
	$self->{changeNote} = shift;
}

sub getOrigin {
	my $self = shift;
	return $self->{origin};
}

sub setOrigin {
	my $self = shift;
	$self->{origin} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

sub getLatestVersionIndicator {
	my $self = shift;
	return $self->{latestVersionIndicator};
}

sub setLatestVersionIndicator {
	my $self = shift;
	$self->{latestVersionIndicator} = shift;
}

sub getLongName {
	my $self = shift;
	return $self->{longName};
}

sub setLongName {
	my $self = shift;
	$self->{longName} = shift;
}

sub getPreferredName {
	my $self = shift;
	return $self->{preferredName};
}

sub setPreferredName {
	my $self = shift;
	$self->{preferredName} = shift;
}

sub getPreferredDefinition {
	my $self = shift;
	return $self->{preferredDefinition};
}

sub setPreferredDefinition {
	my $self = shift;
	$self->{preferredDefinition} = shift;
}

sub getPublicID {
	my $self = shift;
	return $self->{publicID};
}

sub setPublicID {
	my $self = shift;
	$self->{publicID} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getWorkflowStatusDescription {
	my $self = shift;
	return $self->{workflowStatusDescription};
}

sub setWorkflowStatusDescription {
	my $self = shift;
	$self->{workflowStatusDescription} = shift;
}

sub getVersion {
	my $self = shift;
	return $self->{version};
}

sub setVersion {
	my $self = shift;
	$self->{version} = shift;
}

sub getUnresolvedIssue {
	my $self = shift;
	return $self->{unresolvedIssue};
}

sub setUnresolvedIssue {
	my $self = shift;
	$self->{unresolvedIssue} = shift;
}

sub getRegistrationStatus {
	my $self = shift;
	return $self->{registrationStatus};
}

sub setRegistrationStatus {
	my $self = shift;
	$self->{registrationStatus} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getEndDate {
	my $self = shift;
	return $self->{endDate};
}

sub setEndDate {
	my $self = shift;
	$self->{endDate} = shift;
}

sub getDeletedIndicator {
	my $self = shift;
	return $self->{deletedIndicator};
}

sub setDeletedIndicator {
	my $self = shift;
	$self->{deletedIndicator} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getDataElementConceptCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::DataElementConcept", $self);
	return @results;
}

sub getSourcObjectClassRelationshipCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::SourcObjectClassRelationship", $self);
	return @results;
}

sub getConceptDerivationRule {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ConceptDerivationRule", $self);
	return $results[0];
}

sub getTargetObjectClassRelationshipCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::TargetObjectClassRelationship", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::Qualifier;

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

# create an instance of the Qualifier object
# returns: a Qualifier object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Qualifier\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Qualifier intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:QualifierImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# comments;
	if( defined( $self->getComments ) ) {
		$tmpstr = "<comments xsi:type=\"xsd:string\">" . $self->getComments . "</comments>";
	} else {
		$tmpstr = "<comments xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# description;
	if( defined( $self->getDescription ) ) {
		$tmpstr = "<description xsi:type=\"xsd:string\">" . $self->getDescription . "</description>";
	} else {
		$tmpstr = "<description xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of Qualifier objects
# param: xml doc
# returns: list of Qualifier objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @QualifierNodes = $root->getChildNodes;
	my $QualifierLength = $#QualifierNodes;
	#print "total bean count = $QualifierLength\n";
	
	# parse all Qualifier nodes
	my @obj_list = ();
	foreach my $QualifierNode (@QualifierNodes) {
		#print "\tQualifier\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $comments;
		my $modifiedBy;
		my $createdBy;
		my $dateCreated;
		my $dateModified;
		my $description;
		my $name;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($QualifierNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "comments") {
				$comments=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "description") {
				$description=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::Qualifier;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setComments($comments);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setCreatedBy($createdBy);
		$newobj->setDateCreated($dateCreated);
		$newobj->setDateModified($dateModified);
		$newobj->setDescription($description);
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

sub getComments {
	my $self = shift;
	return $self->{comments};
}

sub setComments {
	my $self = shift;
	$self->{comments} = shift;
}

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getDescription {
	my $self = shift;
	return $self->{description};
}

sub setDescription {
	my $self = shift;
	$self->{description} = shift;
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

sub getDECPropertyCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::DECProperty", $self);
	return @results;
}

sub getVDRepresentationCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::VDRepresentation", $self);
	return @results;
}

sub getDECObjectClassCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::DECObjectClass", $self);
	return @results;
}

sub getConceptDerivationRule {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ConceptDerivationRule", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::Property;

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

# create an instance of the Property object
# returns: a Property object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Property\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Property intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:PropertyImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# definitionSource;
	if( defined( $self->getDefinitionSource ) ) {
		$tmpstr = "<definitionSource xsi:type=\"xsd:string\">" . $self->getDefinitionSource . "</definitionSource>";
	} else {
		$tmpstr = "<definitionSource xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# beginDate;
	if( defined( $self->getBeginDate ) ) {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\">" . $self->getBeginDate . "</beginDate>";
	} else {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusName;
	if( defined( $self->getWorkflowStatusName ) ) {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\">" . $self->getWorkflowStatusName . "</workflowStatusName>";
	} else {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# changeNote;
	if( defined( $self->getChangeNote ) ) {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\">" . $self->getChangeNote . "</changeNote>";
	} else {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# origin;
	if( defined( $self->getOrigin ) ) {
		$tmpstr = "<origin xsi:type=\"xsd:string\">" . $self->getOrigin . "</origin>";
	} else {
		$tmpstr = "<origin xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# latestVersionIndicator;
	if( defined( $self->getLatestVersionIndicator ) ) {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\">" . $self->getLatestVersionIndicator . "</latestVersionIndicator>";
	} else {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# longName;
	if( defined( $self->getLongName ) ) {
		$tmpstr = "<longName xsi:type=\"xsd:string\">" . $self->getLongName . "</longName>";
	} else {
		$tmpstr = "<longName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredName;
	if( defined( $self->getPreferredName ) ) {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\">" . $self->getPreferredName . "</preferredName>";
	} else {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredDefinition;
	if( defined( $self->getPreferredDefinition ) ) {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\">" . $self->getPreferredDefinition . "</preferredDefinition>";
	} else {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# publicID;
	if( defined( $self->getPublicID ) ) {
		$tmpstr = "<publicID xsi:type=\"xsd:long\">" . $self->getPublicID . "</publicID>";
	} else {
		$tmpstr = "<publicID xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusDescription;
	if( defined( $self->getWorkflowStatusDescription ) ) {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\">" . $self->getWorkflowStatusDescription . "</workflowStatusDescription>";
	} else {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# version;
	if( defined( $self->getVersion ) ) {
		$tmpstr = "<version xsi:type=\"xsd:float\">" . $self->getVersion . "</version>";
	} else {
		$tmpstr = "<version xsi:type=\"xsd:float\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# unresolvedIssue;
	if( defined( $self->getUnresolvedIssue ) ) {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\">" . $self->getUnresolvedIssue . "</unresolvedIssue>";
	} else {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# registrationStatus;
	if( defined( $self->getRegistrationStatus ) ) {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\">" . $self->getRegistrationStatus . "</registrationStatus>";
	} else {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# endDate;
	if( defined( $self->getEndDate ) ) {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\">" . $self->getEndDate . "</endDate>";
	} else {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# deletedIndicator;
	if( defined( $self->getDeletedIndicator ) ) {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\">" . $self->getDeletedIndicator . "</deletedIndicator>";
	} else {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of Property objects
# param: xml doc
# returns: list of Property objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @PropertyNodes = $root->getChildNodes;
	my $PropertyLength = $#PropertyNodes;
	#print "total bean count = $PropertyLength\n";
	
	# parse all Property nodes
	my @obj_list = ();
	foreach my $PropertyNode (@PropertyNodes) {
		#print "\tProperty\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $definitionSource;
		my $modifiedBy;
		my $beginDate;
		my $workflowStatusName;
		my $changeNote;
		my $origin;
		my $dateCreated;
		my $latestVersionIndicator;
		my $longName;
		my $preferredName;
		my $preferredDefinition;
		my $publicID;
		my $createdBy;
		my $workflowStatusDescription;
		my $version;
		my $unresolvedIssue;
		my $registrationStatus;
		my $dateModified;
		my $endDate;
		my $deletedIndicator;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($PropertyNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "definitionSource") {
				$definitionSource=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "beginDate") {
				$beginDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusName") {
				$workflowStatusName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "changeNote") {
				$changeNote=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "origin") {
				$origin=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "latestVersionIndicator") {
				$latestVersionIndicator=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "longName") {
				$longName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredName") {
				$preferredName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredDefinition") {
				$preferredDefinition=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "publicID") {
				$publicID=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusDescription") {
				$workflowStatusDescription=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "version") {
				$version=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "unresolvedIssue") {
				$unresolvedIssue=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "registrationStatus") {
				$registrationStatus=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "endDate") {
				$endDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "deletedIndicator") {
				$deletedIndicator=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::Property;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setDefinitionSource($definitionSource);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setBeginDate($beginDate);
		$newobj->setWorkflowStatusName($workflowStatusName);
		$newobj->setChangeNote($changeNote);
		$newobj->setOrigin($origin);
		$newobj->setDateCreated($dateCreated);
		$newobj->setLatestVersionIndicator($latestVersionIndicator);
		$newobj->setLongName($longName);
		$newobj->setPreferredName($preferredName);
		$newobj->setPreferredDefinition($preferredDefinition);
		$newobj->setPublicID($publicID);
		$newobj->setCreatedBy($createdBy);
		$newobj->setWorkflowStatusDescription($workflowStatusDescription);
		$newobj->setVersion($version);
		$newobj->setUnresolvedIssue($unresolvedIssue);
		$newobj->setRegistrationStatus($registrationStatus);
		$newobj->setDateModified($dateModified);
		$newobj->setEndDate($endDate);
		$newobj->setDeletedIndicator($deletedIndicator);
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

sub getDefinitionSource {
	my $self = shift;
	return $self->{definitionSource};
}

sub setDefinitionSource {
	my $self = shift;
	$self->{definitionSource} = shift;
}

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getBeginDate {
	my $self = shift;
	return $self->{beginDate};
}

sub setBeginDate {
	my $self = shift;
	$self->{beginDate} = shift;
}

sub getWorkflowStatusName {
	my $self = shift;
	return $self->{workflowStatusName};
}

sub setWorkflowStatusName {
	my $self = shift;
	$self->{workflowStatusName} = shift;
}

sub getChangeNote {
	my $self = shift;
	return $self->{changeNote};
}

sub setChangeNote {
	my $self = shift;
	$self->{changeNote} = shift;
}

sub getOrigin {
	my $self = shift;
	return $self->{origin};
}

sub setOrigin {
	my $self = shift;
	$self->{origin} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

sub getLatestVersionIndicator {
	my $self = shift;
	return $self->{latestVersionIndicator};
}

sub setLatestVersionIndicator {
	my $self = shift;
	$self->{latestVersionIndicator} = shift;
}

sub getLongName {
	my $self = shift;
	return $self->{longName};
}

sub setLongName {
	my $self = shift;
	$self->{longName} = shift;
}

sub getPreferredName {
	my $self = shift;
	return $self->{preferredName};
}

sub setPreferredName {
	my $self = shift;
	$self->{preferredName} = shift;
}

sub getPreferredDefinition {
	my $self = shift;
	return $self->{preferredDefinition};
}

sub setPreferredDefinition {
	my $self = shift;
	$self->{preferredDefinition} = shift;
}

sub getPublicID {
	my $self = shift;
	return $self->{publicID};
}

sub setPublicID {
	my $self = shift;
	$self->{publicID} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getWorkflowStatusDescription {
	my $self = shift;
	return $self->{workflowStatusDescription};
}

sub setWorkflowStatusDescription {
	my $self = shift;
	$self->{workflowStatusDescription} = shift;
}

sub getVersion {
	my $self = shift;
	return $self->{version};
}

sub setVersion {
	my $self = shift;
	$self->{version} = shift;
}

sub getUnresolvedIssue {
	my $self = shift;
	return $self->{unresolvedIssue};
}

sub setUnresolvedIssue {
	my $self = shift;
	$self->{unresolvedIssue} = shift;
}

sub getRegistrationStatus {
	my $self = shift;
	return $self->{registrationStatus};
}

sub setRegistrationStatus {
	my $self = shift;
	$self->{registrationStatus} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getEndDate {
	my $self = shift;
	return $self->{endDate};
}

sub setEndDate {
	my $self = shift;
	$self->{endDate} = shift;
}

sub getDeletedIndicator {
	my $self = shift;
	return $self->{deletedIndicator};
}

sub setDeletedIndicator {
	my $self = shift;
	$self->{deletedIndicator} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getDataElementConceptCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::DataElementConcept", $self);
	return @results;
}

sub getConceptDerivationRule {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ConceptDerivationRule", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::DataElementConcept;

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

# create an instance of the DataElementConcept object
# returns: a DataElementConcept object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new DataElementConcept\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this DataElementConcept intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:DataElementConceptImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# beginDate;
	if( defined( $self->getBeginDate ) ) {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\">" . $self->getBeginDate . "</beginDate>";
	} else {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusName;
	if( defined( $self->getWorkflowStatusName ) ) {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\">" . $self->getWorkflowStatusName . "</workflowStatusName>";
	} else {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# changeNote;
	if( defined( $self->getChangeNote ) ) {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\">" . $self->getChangeNote . "</changeNote>";
	} else {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# origin;
	if( defined( $self->getOrigin ) ) {
		$tmpstr = "<origin xsi:type=\"xsd:string\">" . $self->getOrigin . "</origin>";
	} else {
		$tmpstr = "<origin xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# latestVersionIndicator;
	if( defined( $self->getLatestVersionIndicator ) ) {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\">" . $self->getLatestVersionIndicator . "</latestVersionIndicator>";
	} else {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# longName;
	if( defined( $self->getLongName ) ) {
		$tmpstr = "<longName xsi:type=\"xsd:string\">" . $self->getLongName . "</longName>";
	} else {
		$tmpstr = "<longName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredName;
	if( defined( $self->getPreferredName ) ) {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\">" . $self->getPreferredName . "</preferredName>";
	} else {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredDefinition;
	if( defined( $self->getPreferredDefinition ) ) {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\">" . $self->getPreferredDefinition . "</preferredDefinition>";
	} else {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# publicID;
	if( defined( $self->getPublicID ) ) {
		$tmpstr = "<publicID xsi:type=\"xsd:long\">" . $self->getPublicID . "</publicID>";
	} else {
		$tmpstr = "<publicID xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusDescription;
	if( defined( $self->getWorkflowStatusDescription ) ) {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\">" . $self->getWorkflowStatusDescription . "</workflowStatusDescription>";
	} else {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# version;
	if( defined( $self->getVersion ) ) {
		$tmpstr = "<version xsi:type=\"xsd:float\">" . $self->getVersion . "</version>";
	} else {
		$tmpstr = "<version xsi:type=\"xsd:float\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# unresolvedIssue;
	if( defined( $self->getUnresolvedIssue ) ) {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\">" . $self->getUnresolvedIssue . "</unresolvedIssue>";
	} else {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# registrationStatus;
	if( defined( $self->getRegistrationStatus ) ) {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\">" . $self->getRegistrationStatus . "</registrationStatus>";
	} else {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# endDate;
	if( defined( $self->getEndDate ) ) {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\">" . $self->getEndDate . "</endDate>";
	} else {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# deletedIndicator;
	if( defined( $self->getDeletedIndicator ) ) {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\">" . $self->getDeletedIndicator . "</deletedIndicator>";
	} else {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of DataElementConcept objects
# param: xml doc
# returns: list of DataElementConcept objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @DataElementConceptNodes = $root->getChildNodes;
	my $DataElementConceptLength = $#DataElementConceptNodes;
	#print "total bean count = $DataElementConceptLength\n";
	
	# parse all DataElementConcept nodes
	my @obj_list = ();
	foreach my $DataElementConceptNode (@DataElementConceptNodes) {
		#print "\tDataElementConcept\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $modifiedBy;
		my $beginDate;
		my $workflowStatusName;
		my $changeNote;
		my $origin;
		my $dateCreated;
		my $latestVersionIndicator;
		my $longName;
		my $preferredName;
		my $preferredDefinition;
		my $publicID;
		my $createdBy;
		my $workflowStatusDescription;
		my $version;
		my $unresolvedIssue;
		my $registrationStatus;
		my $dateModified;
		my $endDate;
		my $deletedIndicator;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($DataElementConceptNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "beginDate") {
				$beginDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusName") {
				$workflowStatusName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "changeNote") {
				$changeNote=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "origin") {
				$origin=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "latestVersionIndicator") {
				$latestVersionIndicator=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "longName") {
				$longName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredName") {
				$preferredName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredDefinition") {
				$preferredDefinition=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "publicID") {
				$publicID=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusDescription") {
				$workflowStatusDescription=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "version") {
				$version=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "unresolvedIssue") {
				$unresolvedIssue=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "registrationStatus") {
				$registrationStatus=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "endDate") {
				$endDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "deletedIndicator") {
				$deletedIndicator=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::DataElementConcept;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setBeginDate($beginDate);
		$newobj->setWorkflowStatusName($workflowStatusName);
		$newobj->setChangeNote($changeNote);
		$newobj->setOrigin($origin);
		$newobj->setDateCreated($dateCreated);
		$newobj->setLatestVersionIndicator($latestVersionIndicator);
		$newobj->setLongName($longName);
		$newobj->setPreferredName($preferredName);
		$newobj->setPreferredDefinition($preferredDefinition);
		$newobj->setPublicID($publicID);
		$newobj->setCreatedBy($createdBy);
		$newobj->setWorkflowStatusDescription($workflowStatusDescription);
		$newobj->setVersion($version);
		$newobj->setUnresolvedIssue($unresolvedIssue);
		$newobj->setRegistrationStatus($registrationStatus);
		$newobj->setDateModified($dateModified);
		$newobj->setEndDate($endDate);
		$newobj->setDeletedIndicator($deletedIndicator);
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

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getBeginDate {
	my $self = shift;
	return $self->{beginDate};
}

sub setBeginDate {
	my $self = shift;
	$self->{beginDate} = shift;
}

sub getWorkflowStatusName {
	my $self = shift;
	return $self->{workflowStatusName};
}

sub setWorkflowStatusName {
	my $self = shift;
	$self->{workflowStatusName} = shift;
}

sub getChangeNote {
	my $self = shift;
	return $self->{changeNote};
}

sub setChangeNote {
	my $self = shift;
	$self->{changeNote} = shift;
}

sub getOrigin {
	my $self = shift;
	return $self->{origin};
}

sub setOrigin {
	my $self = shift;
	$self->{origin} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

sub getLatestVersionIndicator {
	my $self = shift;
	return $self->{latestVersionIndicator};
}

sub setLatestVersionIndicator {
	my $self = shift;
	$self->{latestVersionIndicator} = shift;
}

sub getLongName {
	my $self = shift;
	return $self->{longName};
}

sub setLongName {
	my $self = shift;
	$self->{longName} = shift;
}

sub getPreferredName {
	my $self = shift;
	return $self->{preferredName};
}

sub setPreferredName {
	my $self = shift;
	$self->{preferredName} = shift;
}

sub getPreferredDefinition {
	my $self = shift;
	return $self->{preferredDefinition};
}

sub setPreferredDefinition {
	my $self = shift;
	$self->{preferredDefinition} = shift;
}

sub getPublicID {
	my $self = shift;
	return $self->{publicID};
}

sub setPublicID {
	my $self = shift;
	$self->{publicID} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getWorkflowStatusDescription {
	my $self = shift;
	return $self->{workflowStatusDescription};
}

sub setWorkflowStatusDescription {
	my $self = shift;
	$self->{workflowStatusDescription} = shift;
}

sub getVersion {
	my $self = shift;
	return $self->{version};
}

sub setVersion {
	my $self = shift;
	$self->{version} = shift;
}

sub getUnresolvedIssue {
	my $self = shift;
	return $self->{unresolvedIssue};
}

sub setUnresolvedIssue {
	my $self = shift;
	$self->{unresolvedIssue} = shift;
}

sub getRegistrationStatus {
	my $self = shift;
	return $self->{registrationStatus};
}

sub setRegistrationStatus {
	my $self = shift;
	$self->{registrationStatus} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getEndDate {
	my $self = shift;
	return $self->{endDate};
}

sub setEndDate {
	my $self = shift;
	$self->{endDate} = shift;
}

sub getDeletedIndicator {
	my $self = shift;
	return $self->{deletedIndicator};
}

sub setDeletedIndicator {
	my $self = shift;
	$self->{deletedIndicator} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getObjectClass {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ObjectClass", $self);
	return $results[0];
}

sub getConceptualDomain {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ConceptualDomain", $self);
	return $results[0];
}

sub getPropertyQualifier {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::PropertyQualifier", $self);
	return $results[0];
}

sub getParentDataElementConceptRelationshipCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ParentDataElementConceptRelationship", $self);
	return @results;
}

sub getDataElementCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::DataElement", $self);
	return @results;
}

sub getProperty {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::Property", $self);
	return $results[0];
}

sub getChildDataElementConceptRelationshipCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ChildDataElementConceptRelationship", $self);
	return @results;
}

sub getObjectClassQualifier {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ObjectClassQualifier", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::Representation;

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

# create an instance of the Representation object
# returns: a Representation object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Representation\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Representation intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:RepresentationImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# definitionSource;
	if( defined( $self->getDefinitionSource ) ) {
		$tmpstr = "<definitionSource xsi:type=\"xsd:string\">" . $self->getDefinitionSource . "</definitionSource>";
	} else {
		$tmpstr = "<definitionSource xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# beginDate;
	if( defined( $self->getBeginDate ) ) {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\">" . $self->getBeginDate . "</beginDate>";
	} else {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusName;
	if( defined( $self->getWorkflowStatusName ) ) {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\">" . $self->getWorkflowStatusName . "</workflowStatusName>";
	} else {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# changeNote;
	if( defined( $self->getChangeNote ) ) {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\">" . $self->getChangeNote . "</changeNote>";
	} else {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# origin;
	if( defined( $self->getOrigin ) ) {
		$tmpstr = "<origin xsi:type=\"xsd:string\">" . $self->getOrigin . "</origin>";
	} else {
		$tmpstr = "<origin xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# latestVersionIndicator;
	if( defined( $self->getLatestVersionIndicator ) ) {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\">" . $self->getLatestVersionIndicator . "</latestVersionIndicator>";
	} else {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# longName;
	if( defined( $self->getLongName ) ) {
		$tmpstr = "<longName xsi:type=\"xsd:string\">" . $self->getLongName . "</longName>";
	} else {
		$tmpstr = "<longName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredName;
	if( defined( $self->getPreferredName ) ) {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\">" . $self->getPreferredName . "</preferredName>";
	} else {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredDefinition;
	if( defined( $self->getPreferredDefinition ) ) {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\">" . $self->getPreferredDefinition . "</preferredDefinition>";
	} else {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# publicID;
	if( defined( $self->getPublicID ) ) {
		$tmpstr = "<publicID xsi:type=\"xsd:long\">" . $self->getPublicID . "</publicID>";
	} else {
		$tmpstr = "<publicID xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusDescription;
	if( defined( $self->getWorkflowStatusDescription ) ) {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\">" . $self->getWorkflowStatusDescription . "</workflowStatusDescription>";
	} else {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# version;
	if( defined( $self->getVersion ) ) {
		$tmpstr = "<version xsi:type=\"xsd:float\">" . $self->getVersion . "</version>";
	} else {
		$tmpstr = "<version xsi:type=\"xsd:float\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# unresolvedIssue;
	if( defined( $self->getUnresolvedIssue ) ) {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\">" . $self->getUnresolvedIssue . "</unresolvedIssue>";
	} else {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# registrationStatus;
	if( defined( $self->getRegistrationStatus ) ) {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\">" . $self->getRegistrationStatus . "</registrationStatus>";
	} else {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# endDate;
	if( defined( $self->getEndDate ) ) {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\">" . $self->getEndDate . "</endDate>";
	} else {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# deletedIndicator;
	if( defined( $self->getDeletedIndicator ) ) {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\">" . $self->getDeletedIndicator . "</deletedIndicator>";
	} else {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of Representation objects
# param: xml doc
# returns: list of Representation objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @RepresentationNodes = $root->getChildNodes;
	my $RepresentationLength = $#RepresentationNodes;
	#print "total bean count = $RepresentationLength\n";
	
	# parse all Representation nodes
	my @obj_list = ();
	foreach my $RepresentationNode (@RepresentationNodes) {
		#print "\tRepresentation\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $definitionSource;
		my $modifiedBy;
		my $beginDate;
		my $workflowStatusName;
		my $changeNote;
		my $origin;
		my $dateCreated;
		my $latestVersionIndicator;
		my $longName;
		my $preferredName;
		my $preferredDefinition;
		my $publicID;
		my $createdBy;
		my $workflowStatusDescription;
		my $version;
		my $unresolvedIssue;
		my $registrationStatus;
		my $dateModified;
		my $endDate;
		my $deletedIndicator;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($RepresentationNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "definitionSource") {
				$definitionSource=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "beginDate") {
				$beginDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusName") {
				$workflowStatusName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "changeNote") {
				$changeNote=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "origin") {
				$origin=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "latestVersionIndicator") {
				$latestVersionIndicator=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "longName") {
				$longName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredName") {
				$preferredName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredDefinition") {
				$preferredDefinition=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "publicID") {
				$publicID=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusDescription") {
				$workflowStatusDescription=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "version") {
				$version=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "unresolvedIssue") {
				$unresolvedIssue=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "registrationStatus") {
				$registrationStatus=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "endDate") {
				$endDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "deletedIndicator") {
				$deletedIndicator=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::Representation;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setDefinitionSource($definitionSource);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setBeginDate($beginDate);
		$newobj->setWorkflowStatusName($workflowStatusName);
		$newobj->setChangeNote($changeNote);
		$newobj->setOrigin($origin);
		$newobj->setDateCreated($dateCreated);
		$newobj->setLatestVersionIndicator($latestVersionIndicator);
		$newobj->setLongName($longName);
		$newobj->setPreferredName($preferredName);
		$newobj->setPreferredDefinition($preferredDefinition);
		$newobj->setPublicID($publicID);
		$newobj->setCreatedBy($createdBy);
		$newobj->setWorkflowStatusDescription($workflowStatusDescription);
		$newobj->setVersion($version);
		$newobj->setUnresolvedIssue($unresolvedIssue);
		$newobj->setRegistrationStatus($registrationStatus);
		$newobj->setDateModified($dateModified);
		$newobj->setEndDate($endDate);
		$newobj->setDeletedIndicator($deletedIndicator);
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

sub getDefinitionSource {
	my $self = shift;
	return $self->{definitionSource};
}

sub setDefinitionSource {
	my $self = shift;
	$self->{definitionSource} = shift;
}

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getBeginDate {
	my $self = shift;
	return $self->{beginDate};
}

sub setBeginDate {
	my $self = shift;
	$self->{beginDate} = shift;
}

sub getWorkflowStatusName {
	my $self = shift;
	return $self->{workflowStatusName};
}

sub setWorkflowStatusName {
	my $self = shift;
	$self->{workflowStatusName} = shift;
}

sub getChangeNote {
	my $self = shift;
	return $self->{changeNote};
}

sub setChangeNote {
	my $self = shift;
	$self->{changeNote} = shift;
}

sub getOrigin {
	my $self = shift;
	return $self->{origin};
}

sub setOrigin {
	my $self = shift;
	$self->{origin} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

sub getLatestVersionIndicator {
	my $self = shift;
	return $self->{latestVersionIndicator};
}

sub setLatestVersionIndicator {
	my $self = shift;
	$self->{latestVersionIndicator} = shift;
}

sub getLongName {
	my $self = shift;
	return $self->{longName};
}

sub setLongName {
	my $self = shift;
	$self->{longName} = shift;
}

sub getPreferredName {
	my $self = shift;
	return $self->{preferredName};
}

sub setPreferredName {
	my $self = shift;
	$self->{preferredName} = shift;
}

sub getPreferredDefinition {
	my $self = shift;
	return $self->{preferredDefinition};
}

sub setPreferredDefinition {
	my $self = shift;
	$self->{preferredDefinition} = shift;
}

sub getPublicID {
	my $self = shift;
	return $self->{publicID};
}

sub setPublicID {
	my $self = shift;
	$self->{publicID} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getWorkflowStatusDescription {
	my $self = shift;
	return $self->{workflowStatusDescription};
}

sub setWorkflowStatusDescription {
	my $self = shift;
	$self->{workflowStatusDescription} = shift;
}

sub getVersion {
	my $self = shift;
	return $self->{version};
}

sub setVersion {
	my $self = shift;
	$self->{version} = shift;
}

sub getUnresolvedIssue {
	my $self = shift;
	return $self->{unresolvedIssue};
}

sub setUnresolvedIssue {
	my $self = shift;
	$self->{unresolvedIssue} = shift;
}

sub getRegistrationStatus {
	my $self = shift;
	return $self->{registrationStatus};
}

sub setRegistrationStatus {
	my $self = shift;
	$self->{registrationStatus} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getEndDate {
	my $self = shift;
	return $self->{endDate};
}

sub setEndDate {
	my $self = shift;
	$self->{endDate} = shift;
}

sub getDeletedIndicator {
	my $self = shift;
	return $self->{deletedIndicator};
}

sub setDeletedIndicator {
	my $self = shift;
	$self->{deletedIndicator} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getConceptDerivationRule {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ConceptDerivationRule", $self);
	return $results[0];
}

sub getValueDomainCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ValueDomain", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::ValueDomain;

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

# create an instance of the ValueDomain object
# returns: a ValueDomain object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new ValueDomain\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this ValueDomain intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:ValueDomainImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# datatypeName;
	if( defined( $self->getDatatypeName ) ) {
		$tmpstr = "<datatypeName xsi:type=\"xsd:string\">" . $self->getDatatypeName . "</datatypeName>";
	} else {
		$tmpstr = "<datatypeName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# decimalPlace;
	if( defined( $self->getDecimalPlace ) ) {
		$tmpstr = "<decimalPlace xsi:type=\"xsd:int\">" . $self->getDecimalPlace . "</decimalPlace>";
	} else {
		$tmpstr = "<decimalPlace xsi:type=\"xsd:int\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# highValueNumber;
	if( defined( $self->getHighValueNumber ) ) {
		$tmpstr = "<highValueNumber xsi:type=\"xsd:string\">" . $self->getHighValueNumber . "</highValueNumber>";
	} else {
		$tmpstr = "<highValueNumber xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# minimumLengthNumber;
	if( defined( $self->getMinimumLengthNumber ) ) {
		$tmpstr = "<minimumLengthNumber xsi:type=\"xsd:int\">" . $self->getMinimumLengthNumber . "</minimumLengthNumber>";
	} else {
		$tmpstr = "<minimumLengthNumber xsi:type=\"xsd:int\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# formatName;
	if( defined( $self->getFormatName ) ) {
		$tmpstr = "<formatName xsi:type=\"xsd:string\">" . $self->getFormatName . "</formatName>";
	} else {
		$tmpstr = "<formatName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# lowValueNumber;
	if( defined( $self->getLowValueNumber ) ) {
		$tmpstr = "<lowValueNumber xsi:type=\"xsd:string\">" . $self->getLowValueNumber . "</lowValueNumber>";
	} else {
		$tmpstr = "<lowValueNumber xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# characterSetName;
	if( defined( $self->getCharacterSetName ) ) {
		$tmpstr = "<characterSetName xsi:type=\"xsd:string\">" . $self->getCharacterSetName . "</characterSetName>";
	} else {
		$tmpstr = "<characterSetName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# UOMName;
	if( defined( $self->getUOMName ) ) {
		$tmpstr = "<UOMName xsi:type=\"xsd:string\">" . $self->getUOMName . "</UOMName>";
	} else {
		$tmpstr = "<UOMName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# maximumLengthNumber;
	if( defined( $self->getMaximumLengthNumber ) ) {
		$tmpstr = "<maximumLengthNumber xsi:type=\"xsd:int\">" . $self->getMaximumLengthNumber . "</maximumLengthNumber>";
	} else {
		$tmpstr = "<maximumLengthNumber xsi:type=\"xsd:int\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# beginDate;
	if( defined( $self->getBeginDate ) ) {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\">" . $self->getBeginDate . "</beginDate>";
	} else {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusName;
	if( defined( $self->getWorkflowStatusName ) ) {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\">" . $self->getWorkflowStatusName . "</workflowStatusName>";
	} else {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# changeNote;
	if( defined( $self->getChangeNote ) ) {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\">" . $self->getChangeNote . "</changeNote>";
	} else {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# origin;
	if( defined( $self->getOrigin ) ) {
		$tmpstr = "<origin xsi:type=\"xsd:string\">" . $self->getOrigin . "</origin>";
	} else {
		$tmpstr = "<origin xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# latestVersionIndicator;
	if( defined( $self->getLatestVersionIndicator ) ) {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\">" . $self->getLatestVersionIndicator . "</latestVersionIndicator>";
	} else {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# longName;
	if( defined( $self->getLongName ) ) {
		$tmpstr = "<longName xsi:type=\"xsd:string\">" . $self->getLongName . "</longName>";
	} else {
		$tmpstr = "<longName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredName;
	if( defined( $self->getPreferredName ) ) {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\">" . $self->getPreferredName . "</preferredName>";
	} else {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredDefinition;
	if( defined( $self->getPreferredDefinition ) ) {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\">" . $self->getPreferredDefinition . "</preferredDefinition>";
	} else {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# publicID;
	if( defined( $self->getPublicID ) ) {
		$tmpstr = "<publicID xsi:type=\"xsd:long\">" . $self->getPublicID . "</publicID>";
	} else {
		$tmpstr = "<publicID xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusDescription;
	if( defined( $self->getWorkflowStatusDescription ) ) {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\">" . $self->getWorkflowStatusDescription . "</workflowStatusDescription>";
	} else {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# version;
	if( defined( $self->getVersion ) ) {
		$tmpstr = "<version xsi:type=\"xsd:float\">" . $self->getVersion . "</version>";
	} else {
		$tmpstr = "<version xsi:type=\"xsd:float\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# unresolvedIssue;
	if( defined( $self->getUnresolvedIssue ) ) {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\">" . $self->getUnresolvedIssue . "</unresolvedIssue>";
	} else {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# registrationStatus;
	if( defined( $self->getRegistrationStatus ) ) {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\">" . $self->getRegistrationStatus . "</registrationStatus>";
	} else {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# endDate;
	if( defined( $self->getEndDate ) ) {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\">" . $self->getEndDate . "</endDate>";
	} else {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# deletedIndicator;
	if( defined( $self->getDeletedIndicator ) ) {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\">" . $self->getDeletedIndicator . "</deletedIndicator>";
	} else {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of ValueDomain objects
# param: xml doc
# returns: list of ValueDomain objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @ValueDomainNodes = $root->getChildNodes;
	my $ValueDomainLength = $#ValueDomainNodes;
	#print "total bean count = $ValueDomainLength\n";
	
	# parse all ValueDomain nodes
	my @obj_list = ();
	foreach my $ValueDomainNode (@ValueDomainNodes) {
		#print "\tValueDomain\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $datatypeName;
		my $decimalPlace;
		my $highValueNumber;
		my $minimumLengthNumber;
		my $formatName;
		my $lowValueNumber;
		my $characterSetName;
		my $UOMName;
		my $maximumLengthNumber;
		my $modifiedBy;
		my $beginDate;
		my $workflowStatusName;
		my $changeNote;
		my $origin;
		my $dateCreated;
		my $latestVersionIndicator;
		my $longName;
		my $preferredName;
		my $preferredDefinition;
		my $publicID;
		my $createdBy;
		my $workflowStatusDescription;
		my $version;
		my $unresolvedIssue;
		my $registrationStatus;
		my $dateModified;
		my $endDate;
		my $deletedIndicator;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($ValueDomainNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "datatypeName") {
				$datatypeName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "decimalPlace") {
				$decimalPlace=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "highValueNumber") {
				$highValueNumber=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "minimumLengthNumber") {
				$minimumLengthNumber=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "formatName") {
				$formatName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "lowValueNumber") {
				$lowValueNumber=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "characterSetName") {
				$characterSetName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "UOMName") {
				$UOMName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "maximumLengthNumber") {
				$maximumLengthNumber=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "beginDate") {
				$beginDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusName") {
				$workflowStatusName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "changeNote") {
				$changeNote=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "origin") {
				$origin=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "latestVersionIndicator") {
				$latestVersionIndicator=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "longName") {
				$longName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredName") {
				$preferredName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredDefinition") {
				$preferredDefinition=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "publicID") {
				$publicID=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusDescription") {
				$workflowStatusDescription=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "version") {
				$version=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "unresolvedIssue") {
				$unresolvedIssue=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "registrationStatus") {
				$registrationStatus=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "endDate") {
				$endDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "deletedIndicator") {
				$deletedIndicator=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::ValueDomain;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setDatatypeName($datatypeName);
		$newobj->setDecimalPlace($decimalPlace);
		$newobj->setHighValueNumber($highValueNumber);
		$newobj->setMinimumLengthNumber($minimumLengthNumber);
		$newobj->setFormatName($formatName);
		$newobj->setLowValueNumber($lowValueNumber);
		$newobj->setCharacterSetName($characterSetName);
		$newobj->setUOMName($UOMName);
		$newobj->setMaximumLengthNumber($maximumLengthNumber);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setBeginDate($beginDate);
		$newobj->setWorkflowStatusName($workflowStatusName);
		$newobj->setChangeNote($changeNote);
		$newobj->setOrigin($origin);
		$newobj->setDateCreated($dateCreated);
		$newobj->setLatestVersionIndicator($latestVersionIndicator);
		$newobj->setLongName($longName);
		$newobj->setPreferredName($preferredName);
		$newobj->setPreferredDefinition($preferredDefinition);
		$newobj->setPublicID($publicID);
		$newobj->setCreatedBy($createdBy);
		$newobj->setWorkflowStatusDescription($workflowStatusDescription);
		$newobj->setVersion($version);
		$newobj->setUnresolvedIssue($unresolvedIssue);
		$newobj->setRegistrationStatus($registrationStatus);
		$newobj->setDateModified($dateModified);
		$newobj->setEndDate($endDate);
		$newobj->setDeletedIndicator($deletedIndicator);
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

sub getDatatypeName {
	my $self = shift;
	return $self->{datatypeName};
}

sub setDatatypeName {
	my $self = shift;
	$self->{datatypeName} = shift;
}

sub getDecimalPlace {
	my $self = shift;
	return $self->{decimalPlace};
}

sub setDecimalPlace {
	my $self = shift;
	$self->{decimalPlace} = shift;
}

sub getHighValueNumber {
	my $self = shift;
	return $self->{highValueNumber};
}

sub setHighValueNumber {
	my $self = shift;
	$self->{highValueNumber} = shift;
}

sub getMinimumLengthNumber {
	my $self = shift;
	return $self->{minimumLengthNumber};
}

sub setMinimumLengthNumber {
	my $self = shift;
	$self->{minimumLengthNumber} = shift;
}

sub getFormatName {
	my $self = shift;
	return $self->{formatName};
}

sub setFormatName {
	my $self = shift;
	$self->{formatName} = shift;
}

sub getLowValueNumber {
	my $self = shift;
	return $self->{lowValueNumber};
}

sub setLowValueNumber {
	my $self = shift;
	$self->{lowValueNumber} = shift;
}

sub getCharacterSetName {
	my $self = shift;
	return $self->{characterSetName};
}

sub setCharacterSetName {
	my $self = shift;
	$self->{characterSetName} = shift;
}

sub getUOMName {
	my $self = shift;
	return $self->{UOMName};
}

sub setUOMName {
	my $self = shift;
	$self->{UOMName} = shift;
}

sub getMaximumLengthNumber {
	my $self = shift;
	return $self->{maximumLengthNumber};
}

sub setMaximumLengthNumber {
	my $self = shift;
	$self->{maximumLengthNumber} = shift;
}

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getBeginDate {
	my $self = shift;
	return $self->{beginDate};
}

sub setBeginDate {
	my $self = shift;
	$self->{beginDate} = shift;
}

sub getWorkflowStatusName {
	my $self = shift;
	return $self->{workflowStatusName};
}

sub setWorkflowStatusName {
	my $self = shift;
	$self->{workflowStatusName} = shift;
}

sub getChangeNote {
	my $self = shift;
	return $self->{changeNote};
}

sub setChangeNote {
	my $self = shift;
	$self->{changeNote} = shift;
}

sub getOrigin {
	my $self = shift;
	return $self->{origin};
}

sub setOrigin {
	my $self = shift;
	$self->{origin} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

sub getLatestVersionIndicator {
	my $self = shift;
	return $self->{latestVersionIndicator};
}

sub setLatestVersionIndicator {
	my $self = shift;
	$self->{latestVersionIndicator} = shift;
}

sub getLongName {
	my $self = shift;
	return $self->{longName};
}

sub setLongName {
	my $self = shift;
	$self->{longName} = shift;
}

sub getPreferredName {
	my $self = shift;
	return $self->{preferredName};
}

sub setPreferredName {
	my $self = shift;
	$self->{preferredName} = shift;
}

sub getPreferredDefinition {
	my $self = shift;
	return $self->{preferredDefinition};
}

sub setPreferredDefinition {
	my $self = shift;
	$self->{preferredDefinition} = shift;
}

sub getPublicID {
	my $self = shift;
	return $self->{publicID};
}

sub setPublicID {
	my $self = shift;
	$self->{publicID} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getWorkflowStatusDescription {
	my $self = shift;
	return $self->{workflowStatusDescription};
}

sub setWorkflowStatusDescription {
	my $self = shift;
	$self->{workflowStatusDescription} = shift;
}

sub getVersion {
	my $self = shift;
	return $self->{version};
}

sub setVersion {
	my $self = shift;
	$self->{version} = shift;
}

sub getUnresolvedIssue {
	my $self = shift;
	return $self->{unresolvedIssue};
}

sub setUnresolvedIssue {
	my $self = shift;
	$self->{unresolvedIssue} = shift;
}

sub getRegistrationStatus {
	my $self = shift;
	return $self->{registrationStatus};
}

sub setRegistrationStatus {
	my $self = shift;
	$self->{registrationStatus} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getEndDate {
	my $self = shift;
	return $self->{endDate};
}

sub setEndDate {
	my $self = shift;
	$self->{endDate} = shift;
}

sub getDeletedIndicator {
	my $self = shift;
	return $self->{deletedIndicator};
}

sub setDeletedIndicator {
	my $self = shift;
	$self->{deletedIndicator} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getConceptualDomain {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ConceptualDomain", $self);
	return $results[0];
}

sub getChildValueDomainRelationshipCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ChildValueDomainRelationship", $self);
	return @results;
}

sub getRepresention {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::Represention", $self);
	return $results[0];
}

sub getDataElementCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::DataElement", $self);
	return @results;
}

sub getParentValueDomainRelationshipCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ParentValueDomainRelationship", $self);
	return @results;
}

sub getQuestionCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::Question", $self);
	return @results;
}

sub getQualifier {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::Qualifier", $self);
	return $results[0];
}

sub getConceptDerivationRule {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ConceptDerivationRule", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::DerivedDataElement;

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

# create an instance of the DerivedDataElement object
# returns: a DerivedDataElement object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new DerivedDataElement\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this DerivedDataElement intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:DerivedDataElementImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# concatenationCharacter;
	if( defined( $self->getConcatenationCharacter ) ) {
		$tmpstr = "<concatenationCharacter xsi:type=\"xsd:string\">" . $self->getConcatenationCharacter . "</concatenationCharacter>";
	} else {
		$tmpstr = "<concatenationCharacter xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# rule;
	if( defined( $self->getRule ) ) {
		$tmpstr = "<rule xsi:type=\"xsd:string\">" . $self->getRule . "</rule>";
	} else {
		$tmpstr = "<rule xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# methods;
	if( defined( $self->getMethods ) ) {
		$tmpstr = "<methods xsi:type=\"xsd:string\">" . $self->getMethods . "</methods>";
	} else {
		$tmpstr = "<methods xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of DerivedDataElement objects
# param: xml doc
# returns: list of DerivedDataElement objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @DerivedDataElementNodes = $root->getChildNodes;
	my $DerivedDataElementLength = $#DerivedDataElementNodes;
	#print "total bean count = $DerivedDataElementLength\n";
	
	# parse all DerivedDataElement nodes
	my @obj_list = ();
	foreach my $DerivedDataElementNode (@DerivedDataElementNodes) {
		#print "\tDerivedDataElement\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $modifiedBy;
		my $concatenationCharacter;
		my $rule;
		my $dateModified;
		my $methods;
		my $createdBy;
		my $dateCreated;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($DerivedDataElementNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "concatenationCharacter") {
				$concatenationCharacter=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "rule") {
				$rule=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "methods") {
				$methods=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::DerivedDataElement;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setConcatenationCharacter($concatenationCharacter);
		$newobj->setRule($rule);
		$newobj->setDateModified($dateModified);
		$newobj->setMethods($methods);
		$newobj->setCreatedBy($createdBy);
		$newobj->setDateCreated($dateCreated);
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

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getConcatenationCharacter {
	my $self = shift;
	return $self->{concatenationCharacter};
}

sub setConcatenationCharacter {
	my $self = shift;
	$self->{concatenationCharacter} = shift;
}

sub getRule {
	my $self = shift;
	return $self->{rule};
}

sub setRule {
	my $self = shift;
	$self->{rule} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getMethods {
	my $self = shift;
	return $self->{methods};
}

sub setMethods {
	my $self = shift;
	$self->{methods} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getDerivationType {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::DerivationType", $self);
	return $results[0];
}

sub getDataElementDerivationCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::DataElementDerivation", $self);
	return @results;
}

sub getDataElement {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::DataElement", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::DataElement;

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

# create an instance of the DataElement object
# returns: a DataElement object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new DataElement\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this DataElement intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:DataElementImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# beginDate;
	if( defined( $self->getBeginDate ) ) {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\">" . $self->getBeginDate . "</beginDate>";
	} else {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusName;
	if( defined( $self->getWorkflowStatusName ) ) {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\">" . $self->getWorkflowStatusName . "</workflowStatusName>";
	} else {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# changeNote;
	if( defined( $self->getChangeNote ) ) {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\">" . $self->getChangeNote . "</changeNote>";
	} else {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# origin;
	if( defined( $self->getOrigin ) ) {
		$tmpstr = "<origin xsi:type=\"xsd:string\">" . $self->getOrigin . "</origin>";
	} else {
		$tmpstr = "<origin xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# latestVersionIndicator;
	if( defined( $self->getLatestVersionIndicator ) ) {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\">" . $self->getLatestVersionIndicator . "</latestVersionIndicator>";
	} else {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# longName;
	if( defined( $self->getLongName ) ) {
		$tmpstr = "<longName xsi:type=\"xsd:string\">" . $self->getLongName . "</longName>";
	} else {
		$tmpstr = "<longName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredName;
	if( defined( $self->getPreferredName ) ) {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\">" . $self->getPreferredName . "</preferredName>";
	} else {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredDefinition;
	if( defined( $self->getPreferredDefinition ) ) {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\">" . $self->getPreferredDefinition . "</preferredDefinition>";
	} else {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# publicID;
	if( defined( $self->getPublicID ) ) {
		$tmpstr = "<publicID xsi:type=\"xsd:long\">" . $self->getPublicID . "</publicID>";
	} else {
		$tmpstr = "<publicID xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusDescription;
	if( defined( $self->getWorkflowStatusDescription ) ) {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\">" . $self->getWorkflowStatusDescription . "</workflowStatusDescription>";
	} else {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# version;
	if( defined( $self->getVersion ) ) {
		$tmpstr = "<version xsi:type=\"xsd:float\">" . $self->getVersion . "</version>";
	} else {
		$tmpstr = "<version xsi:type=\"xsd:float\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# unresolvedIssue;
	if( defined( $self->getUnresolvedIssue ) ) {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\">" . $self->getUnresolvedIssue . "</unresolvedIssue>";
	} else {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# registrationStatus;
	if( defined( $self->getRegistrationStatus ) ) {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\">" . $self->getRegistrationStatus . "</registrationStatus>";
	} else {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# endDate;
	if( defined( $self->getEndDate ) ) {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\">" . $self->getEndDate . "</endDate>";
	} else {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# deletedIndicator;
	if( defined( $self->getDeletedIndicator ) ) {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\">" . $self->getDeletedIndicator . "</deletedIndicator>";
	} else {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of DataElement objects
# param: xml doc
# returns: list of DataElement objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @DataElementNodes = $root->getChildNodes;
	my $DataElementLength = $#DataElementNodes;
	#print "total bean count = $DataElementLength\n";
	
	# parse all DataElement nodes
	my @obj_list = ();
	foreach my $DataElementNode (@DataElementNodes) {
		#print "\tDataElement\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $modifiedBy;
		my $beginDate;
		my $workflowStatusName;
		my $changeNote;
		my $origin;
		my $dateCreated;
		my $latestVersionIndicator;
		my $longName;
		my $preferredName;
		my $preferredDefinition;
		my $publicID;
		my $createdBy;
		my $workflowStatusDescription;
		my $version;
		my $unresolvedIssue;
		my $registrationStatus;
		my $dateModified;
		my $endDate;
		my $deletedIndicator;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($DataElementNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "beginDate") {
				$beginDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusName") {
				$workflowStatusName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "changeNote") {
				$changeNote=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "origin") {
				$origin=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "latestVersionIndicator") {
				$latestVersionIndicator=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "longName") {
				$longName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredName") {
				$preferredName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredDefinition") {
				$preferredDefinition=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "publicID") {
				$publicID=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusDescription") {
				$workflowStatusDescription=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "version") {
				$version=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "unresolvedIssue") {
				$unresolvedIssue=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "registrationStatus") {
				$registrationStatus=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "endDate") {
				$endDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "deletedIndicator") {
				$deletedIndicator=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::DataElement;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setBeginDate($beginDate);
		$newobj->setWorkflowStatusName($workflowStatusName);
		$newobj->setChangeNote($changeNote);
		$newobj->setOrigin($origin);
		$newobj->setDateCreated($dateCreated);
		$newobj->setLatestVersionIndicator($latestVersionIndicator);
		$newobj->setLongName($longName);
		$newobj->setPreferredName($preferredName);
		$newobj->setPreferredDefinition($preferredDefinition);
		$newobj->setPublicID($publicID);
		$newobj->setCreatedBy($createdBy);
		$newobj->setWorkflowStatusDescription($workflowStatusDescription);
		$newobj->setVersion($version);
		$newobj->setUnresolvedIssue($unresolvedIssue);
		$newobj->setRegistrationStatus($registrationStatus);
		$newobj->setDateModified($dateModified);
		$newobj->setEndDate($endDate);
		$newobj->setDeletedIndicator($deletedIndicator);
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

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getBeginDate {
	my $self = shift;
	return $self->{beginDate};
}

sub setBeginDate {
	my $self = shift;
	$self->{beginDate} = shift;
}

sub getWorkflowStatusName {
	my $self = shift;
	return $self->{workflowStatusName};
}

sub setWorkflowStatusName {
	my $self = shift;
	$self->{workflowStatusName} = shift;
}

sub getChangeNote {
	my $self = shift;
	return $self->{changeNote};
}

sub setChangeNote {
	my $self = shift;
	$self->{changeNote} = shift;
}

sub getOrigin {
	my $self = shift;
	return $self->{origin};
}

sub setOrigin {
	my $self = shift;
	$self->{origin} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

sub getLatestVersionIndicator {
	my $self = shift;
	return $self->{latestVersionIndicator};
}

sub setLatestVersionIndicator {
	my $self = shift;
	$self->{latestVersionIndicator} = shift;
}

sub getLongName {
	my $self = shift;
	return $self->{longName};
}

sub setLongName {
	my $self = shift;
	$self->{longName} = shift;
}

sub getPreferredName {
	my $self = shift;
	return $self->{preferredName};
}

sub setPreferredName {
	my $self = shift;
	$self->{preferredName} = shift;
}

sub getPreferredDefinition {
	my $self = shift;
	return $self->{preferredDefinition};
}

sub setPreferredDefinition {
	my $self = shift;
	$self->{preferredDefinition} = shift;
}

sub getPublicID {
	my $self = shift;
	return $self->{publicID};
}

sub setPublicID {
	my $self = shift;
	$self->{publicID} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getWorkflowStatusDescription {
	my $self = shift;
	return $self->{workflowStatusDescription};
}

sub setWorkflowStatusDescription {
	my $self = shift;
	$self->{workflowStatusDescription} = shift;
}

sub getVersion {
	my $self = shift;
	return $self->{version};
}

sub setVersion {
	my $self = shift;
	$self->{version} = shift;
}

sub getUnresolvedIssue {
	my $self = shift;
	return $self->{unresolvedIssue};
}

sub setUnresolvedIssue {
	my $self = shift;
	$self->{unresolvedIssue} = shift;
}

sub getRegistrationStatus {
	my $self = shift;
	return $self->{registrationStatus};
}

sub setRegistrationStatus {
	my $self = shift;
	$self->{registrationStatus} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getEndDate {
	my $self = shift;
	return $self->{endDate};
}

sub setEndDate {
	my $self = shift;
	$self->{endDate} = shift;
}

sub getDeletedIndicator {
	my $self = shift;
	return $self->{deletedIndicator};
}

sub setDeletedIndicator {
	my $self = shift;
	$self->{deletedIndicator} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getDataElementDerivationCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::DataElementDerivation", $self);
	return @results;
}

sub getValueDomain {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ValueDomain", $self);
	return $results[0];
}

sub getDataElementConcept {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::DataElementConcept", $self);
	return $results[0];
}

sub getChildDataElementRelationshipsCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ChildDataElementRelationships", $self);
	return @results;
}

sub getDerivedDataElement {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::DerivedDataElement", $self);
	return $results[0];
}

sub getQuestionCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::Question", $self);
	return @results;
}

sub getParentDataElementRelationshipsCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ParentDataElementRelationships", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::ClassificationScheme;

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

# create an instance of the ClassificationScheme object
# returns: a ClassificationScheme object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new ClassificationScheme\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this ClassificationScheme intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:ClassificationSchemeImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# labelTypeFlag;
	if( defined( $self->getLabelTypeFlag ) ) {
		$tmpstr = "<labelTypeFlag xsi:type=\"xsd:string\">" . $self->getLabelTypeFlag . "</labelTypeFlag>";
	} else {
		$tmpstr = "<labelTypeFlag xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# type;
	if( defined( $self->getType ) ) {
		$tmpstr = "<type xsi:type=\"xsd:string\">" . $self->getType . "</type>";
	} else {
		$tmpstr = "<type xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# beginDate;
	if( defined( $self->getBeginDate ) ) {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\">" . $self->getBeginDate . "</beginDate>";
	} else {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusName;
	if( defined( $self->getWorkflowStatusName ) ) {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\">" . $self->getWorkflowStatusName . "</workflowStatusName>";
	} else {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# changeNote;
	if( defined( $self->getChangeNote ) ) {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\">" . $self->getChangeNote . "</changeNote>";
	} else {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# origin;
	if( defined( $self->getOrigin ) ) {
		$tmpstr = "<origin xsi:type=\"xsd:string\">" . $self->getOrigin . "</origin>";
	} else {
		$tmpstr = "<origin xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# latestVersionIndicator;
	if( defined( $self->getLatestVersionIndicator ) ) {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\">" . $self->getLatestVersionIndicator . "</latestVersionIndicator>";
	} else {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# longName;
	if( defined( $self->getLongName ) ) {
		$tmpstr = "<longName xsi:type=\"xsd:string\">" . $self->getLongName . "</longName>";
	} else {
		$tmpstr = "<longName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredName;
	if( defined( $self->getPreferredName ) ) {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\">" . $self->getPreferredName . "</preferredName>";
	} else {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredDefinition;
	if( defined( $self->getPreferredDefinition ) ) {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\">" . $self->getPreferredDefinition . "</preferredDefinition>";
	} else {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# publicID;
	if( defined( $self->getPublicID ) ) {
		$tmpstr = "<publicID xsi:type=\"xsd:long\">" . $self->getPublicID . "</publicID>";
	} else {
		$tmpstr = "<publicID xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusDescription;
	if( defined( $self->getWorkflowStatusDescription ) ) {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\">" . $self->getWorkflowStatusDescription . "</workflowStatusDescription>";
	} else {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# version;
	if( defined( $self->getVersion ) ) {
		$tmpstr = "<version xsi:type=\"xsd:float\">" . $self->getVersion . "</version>";
	} else {
		$tmpstr = "<version xsi:type=\"xsd:float\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# unresolvedIssue;
	if( defined( $self->getUnresolvedIssue ) ) {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\">" . $self->getUnresolvedIssue . "</unresolvedIssue>";
	} else {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# registrationStatus;
	if( defined( $self->getRegistrationStatus ) ) {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\">" . $self->getRegistrationStatus . "</registrationStatus>";
	} else {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# endDate;
	if( defined( $self->getEndDate ) ) {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\">" . $self->getEndDate . "</endDate>";
	} else {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# deletedIndicator;
	if( defined( $self->getDeletedIndicator ) ) {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\">" . $self->getDeletedIndicator . "</deletedIndicator>";
	} else {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of ClassificationScheme objects
# param: xml doc
# returns: list of ClassificationScheme objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @ClassificationSchemeNodes = $root->getChildNodes;
	my $ClassificationSchemeLength = $#ClassificationSchemeNodes;
	#print "total bean count = $ClassificationSchemeLength\n";
	
	# parse all ClassificationScheme nodes
	my @obj_list = ();
	foreach my $ClassificationSchemeNode (@ClassificationSchemeNodes) {
		#print "\tClassificationScheme\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $labelTypeFlag;
		my $type;
		my $modifiedBy;
		my $beginDate;
		my $workflowStatusName;
		my $changeNote;
		my $origin;
		my $dateCreated;
		my $latestVersionIndicator;
		my $longName;
		my $preferredName;
		my $preferredDefinition;
		my $publicID;
		my $createdBy;
		my $workflowStatusDescription;
		my $version;
		my $unresolvedIssue;
		my $registrationStatus;
		my $dateModified;
		my $endDate;
		my $deletedIndicator;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($ClassificationSchemeNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "labelTypeFlag") {
				$labelTypeFlag=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "type") {
				$type=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "beginDate") {
				$beginDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusName") {
				$workflowStatusName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "changeNote") {
				$changeNote=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "origin") {
				$origin=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "latestVersionIndicator") {
				$latestVersionIndicator=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "longName") {
				$longName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredName") {
				$preferredName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredDefinition") {
				$preferredDefinition=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "publicID") {
				$publicID=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusDescription") {
				$workflowStatusDescription=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "version") {
				$version=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "unresolvedIssue") {
				$unresolvedIssue=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "registrationStatus") {
				$registrationStatus=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "endDate") {
				$endDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "deletedIndicator") {
				$deletedIndicator=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::ClassificationScheme;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setLabelTypeFlag($labelTypeFlag);
		$newobj->setType($type);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setBeginDate($beginDate);
		$newobj->setWorkflowStatusName($workflowStatusName);
		$newobj->setChangeNote($changeNote);
		$newobj->setOrigin($origin);
		$newobj->setDateCreated($dateCreated);
		$newobj->setLatestVersionIndicator($latestVersionIndicator);
		$newobj->setLongName($longName);
		$newobj->setPreferredName($preferredName);
		$newobj->setPreferredDefinition($preferredDefinition);
		$newobj->setPublicID($publicID);
		$newobj->setCreatedBy($createdBy);
		$newobj->setWorkflowStatusDescription($workflowStatusDescription);
		$newobj->setVersion($version);
		$newobj->setUnresolvedIssue($unresolvedIssue);
		$newobj->setRegistrationStatus($registrationStatus);
		$newobj->setDateModified($dateModified);
		$newobj->setEndDate($endDate);
		$newobj->setDeletedIndicator($deletedIndicator);
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

sub getLabelTypeFlag {
	my $self = shift;
	return $self->{labelTypeFlag};
}

sub setLabelTypeFlag {
	my $self = shift;
	$self->{labelTypeFlag} = shift;
}

sub getType {
	my $self = shift;
	return $self->{type};
}

sub setType {
	my $self = shift;
	$self->{type} = shift;
}

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getBeginDate {
	my $self = shift;
	return $self->{beginDate};
}

sub setBeginDate {
	my $self = shift;
	$self->{beginDate} = shift;
}

sub getWorkflowStatusName {
	my $self = shift;
	return $self->{workflowStatusName};
}

sub setWorkflowStatusName {
	my $self = shift;
	$self->{workflowStatusName} = shift;
}

sub getChangeNote {
	my $self = shift;
	return $self->{changeNote};
}

sub setChangeNote {
	my $self = shift;
	$self->{changeNote} = shift;
}

sub getOrigin {
	my $self = shift;
	return $self->{origin};
}

sub setOrigin {
	my $self = shift;
	$self->{origin} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

sub getLatestVersionIndicator {
	my $self = shift;
	return $self->{latestVersionIndicator};
}

sub setLatestVersionIndicator {
	my $self = shift;
	$self->{latestVersionIndicator} = shift;
}

sub getLongName {
	my $self = shift;
	return $self->{longName};
}

sub setLongName {
	my $self = shift;
	$self->{longName} = shift;
}

sub getPreferredName {
	my $self = shift;
	return $self->{preferredName};
}

sub setPreferredName {
	my $self = shift;
	$self->{preferredName} = shift;
}

sub getPreferredDefinition {
	my $self = shift;
	return $self->{preferredDefinition};
}

sub setPreferredDefinition {
	my $self = shift;
	$self->{preferredDefinition} = shift;
}

sub getPublicID {
	my $self = shift;
	return $self->{publicID};
}

sub setPublicID {
	my $self = shift;
	$self->{publicID} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getWorkflowStatusDescription {
	my $self = shift;
	return $self->{workflowStatusDescription};
}

sub setWorkflowStatusDescription {
	my $self = shift;
	$self->{workflowStatusDescription} = shift;
}

sub getVersion {
	my $self = shift;
	return $self->{version};
}

sub setVersion {
	my $self = shift;
	$self->{version} = shift;
}

sub getUnresolvedIssue {
	my $self = shift;
	return $self->{unresolvedIssue};
}

sub setUnresolvedIssue {
	my $self = shift;
	$self->{unresolvedIssue} = shift;
}

sub getRegistrationStatus {
	my $self = shift;
	return $self->{registrationStatus};
}

sub setRegistrationStatus {
	my $self = shift;
	$self->{registrationStatus} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getEndDate {
	my $self = shift;
	return $self->{endDate};
}

sub setEndDate {
	my $self = shift;
	$self->{endDate} = shift;
}

sub getDeletedIndicator {
	my $self = shift;
	return $self->{deletedIndicator};
}

sub setDeletedIndicator {
	my $self = shift;
	$self->{deletedIndicator} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getClassSchemeClassSchemeItemCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ClassSchemeClassSchemeItem", $self);
	return @results;
}

sub getChildClassificationSchemeRelationshipCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ChildClassificationSchemeRelationship", $self);
	return @results;
}

sub getParentClassificationSchemeRelationshipCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ParentClassificationSchemeRelationship", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::ClassificationSchemeItem;

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

# create an instance of the ClassificationSchemeItem object
# returns: a ClassificationSchemeItem object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new ClassificationSchemeItem\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this ClassificationSchemeItem intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:ClassificationSchemeItemImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# comments;
	if( defined( $self->getComments ) ) {
		$tmpstr = "<comments xsi:type=\"xsd:string\">" . $self->getComments . "</comments>";
	} else {
		$tmpstr = "<comments xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# type;
	if( defined( $self->getType ) ) {
		$tmpstr = "<type xsi:type=\"xsd:string\">" . $self->getType . "</type>";
	} else {
		$tmpstr = "<type xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# description;
	if( defined( $self->getDescription ) ) {
		$tmpstr = "<description xsi:type=\"xsd:string\">" . $self->getDescription . "</description>";
	} else {
		$tmpstr = "<description xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of ClassificationSchemeItem objects
# param: xml doc
# returns: list of ClassificationSchemeItem objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @ClassificationSchemeItemNodes = $root->getChildNodes;
	my $ClassificationSchemeItemLength = $#ClassificationSchemeItemNodes;
	#print "total bean count = $ClassificationSchemeItemLength\n";
	
	# parse all ClassificationSchemeItem nodes
	my @obj_list = ();
	foreach my $ClassificationSchemeItemNode (@ClassificationSchemeItemNodes) {
		#print "\tClassificationSchemeItem\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $comments;
		my $modifiedBy;
		my $type;
		my $createdBy;
		my $dateCreated;
		my $dateModified;
		my $description;
		my $name;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($ClassificationSchemeItemNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "comments") {
				$comments=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "type") {
				$type=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "description") {
				$description=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::ClassificationSchemeItem;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setComments($comments);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setType($type);
		$newobj->setCreatedBy($createdBy);
		$newobj->setDateCreated($dateCreated);
		$newobj->setDateModified($dateModified);
		$newobj->setDescription($description);
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

sub getComments {
	my $self = shift;
	return $self->{comments};
}

sub setComments {
	my $self = shift;
	$self->{comments} = shift;
}

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getType {
	my $self = shift;
	return $self->{type};
}

sub setType {
	my $self = shift;
	$self->{type} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getDescription {
	my $self = shift;
	return $self->{description};
}

sub setDescription {
	my $self = shift;
	$self->{description} = shift;
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

sub getChildClassificationSchemeItemRelationshipCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ChildClassificationSchemeItemRelationship", $self);
	return @results;
}

sub getParentClassificationSchemeItemRelationshipCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ParentClassificationSchemeItemRelationship", $self);
	return @results;
}

sub getClassSchemeClassSchemeItemCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ClassSchemeClassSchemeItem", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::ValueMeaning;

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

# create an instance of the ValueMeaning object
# returns: a ValueMeaning object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new ValueMeaning\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this ValueMeaning intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:ValueMeaningImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# comments;
	if( defined( $self->getComments ) ) {
		$tmpstr = "<comments xsi:type=\"xsd:string\">" . $self->getComments . "</comments>";
	} else {
		$tmpstr = "<comments xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# beginDate;
	if( defined( $self->getBeginDate ) ) {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\">" . $self->getBeginDate . "</beginDate>";
	} else {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# shortMeaning;
	if( defined( $self->getShortMeaning ) ) {
		$tmpstr = "<shortMeaning xsi:type=\"xsd:string\">" . $self->getShortMeaning . "</shortMeaning>";
	} else {
		$tmpstr = "<shortMeaning xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# description;
	if( defined( $self->getDescription ) ) {
		$tmpstr = "<description xsi:type=\"xsd:string\">" . $self->getDescription . "</description>";
	} else {
		$tmpstr = "<description xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# endDate;
	if( defined( $self->getEndDate ) ) {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\">" . $self->getEndDate . "</endDate>";
	} else {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of ValueMeaning objects
# param: xml doc
# returns: list of ValueMeaning objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @ValueMeaningNodes = $root->getChildNodes;
	my $ValueMeaningLength = $#ValueMeaningNodes;
	#print "total bean count = $ValueMeaningLength\n";
	
	# parse all ValueMeaning nodes
	my @obj_list = ();
	foreach my $ValueMeaningNode (@ValueMeaningNodes) {
		#print "\tValueMeaning\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $comments;
		my $modifiedBy;
		my $beginDate;
		my $shortMeaning;
		my $createdBy;
		my $dateCreated;
		my $dateModified;
		my $description;
		my $endDate;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($ValueMeaningNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "comments") {
				$comments=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "beginDate") {
				$beginDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "shortMeaning") {
				$shortMeaning=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "description") {
				$description=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "endDate") {
				$endDate=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::ValueMeaning;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setComments($comments);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setBeginDate($beginDate);
		$newobj->setShortMeaning($shortMeaning);
		$newobj->setCreatedBy($createdBy);
		$newobj->setDateCreated($dateCreated);
		$newobj->setDateModified($dateModified);
		$newobj->setDescription($description);
		$newobj->setEndDate($endDate);
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

sub getComments {
	my $self = shift;
	return $self->{comments};
}

sub setComments {
	my $self = shift;
	$self->{comments} = shift;
}

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getBeginDate {
	my $self = shift;
	return $self->{beginDate};
}

sub setBeginDate {
	my $self = shift;
	$self->{beginDate} = shift;
}

sub getShortMeaning {
	my $self = shift;
	return $self->{shortMeaning};
}

sub setShortMeaning {
	my $self = shift;
	$self->{shortMeaning} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getDescription {
	my $self = shift;
	return $self->{description};
}

sub setDescription {
	my $self = shift;
	$self->{description} = shift;
}

sub getEndDate {
	my $self = shift;
	return $self->{endDate};
}

sub setEndDate {
	my $self = shift;
	$self->{endDate} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getPermissableValueCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::PermissableValue", $self);
	return @results;
}

sub getConceptualDomainCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ConceptualDomain", $self);
	return @results;
}

sub getConceptDerivationRule {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ConceptDerivationRule", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::PermissibleValue;

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

# create an instance of the PermissibleValue object
# returns: a PermissibleValue object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new PermissibleValue\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this PermissibleValue intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:PermissibleValueImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# lowValueNumber;
	if( defined( $self->getLowValueNumber ) ) {
		$tmpstr = "<lowValueNumber xsi:type=\"xsd:long\">" . $self->getLowValueNumber . "</lowValueNumber>";
	} else {
		$tmpstr = "<lowValueNumber xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# value;
	if( defined( $self->getValue ) ) {
		$tmpstr = "<value xsi:type=\"xsd:string\">" . $self->getValue . "</value>";
	} else {
		$tmpstr = "<value xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# highValueNumber;
	if( defined( $self->getHighValueNumber ) ) {
		$tmpstr = "<highValueNumber xsi:type=\"xsd:long\">" . $self->getHighValueNumber . "</highValueNumber>";
	} else {
		$tmpstr = "<highValueNumber xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of PermissibleValue objects
# param: xml doc
# returns: list of PermissibleValue objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @PermissibleValueNodes = $root->getChildNodes;
	my $PermissibleValueLength = $#PermissibleValueNodes;
	#print "total bean count = $PermissibleValueLength\n";
	
	# parse all PermissibleValue nodes
	my @obj_list = ();
	foreach my $PermissibleValueNode (@PermissibleValueNodes) {
		#print "\tPermissibleValue\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $lowValueNumber;
		my $value;
		my $modifiedBy;
		my $highValueNumber;
		my $dateModified;
		my $createdBy;
		my $dateCreated;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($PermissibleValueNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "lowValueNumber") {
				$lowValueNumber=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "value") {
				$value=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "highValueNumber") {
				$highValueNumber=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::PermissibleValue;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setLowValueNumber($lowValueNumber);
		$newobj->setValue($value);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setHighValueNumber($highValueNumber);
		$newobj->setDateModified($dateModified);
		$newobj->setCreatedBy($createdBy);
		$newobj->setDateCreated($dateCreated);
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

sub getLowValueNumber {
	my $self = shift;
	return $self->{lowValueNumber};
}

sub setLowValueNumber {
	my $self = shift;
	$self->{lowValueNumber} = shift;
}

sub getValue {
	my $self = shift;
	return $self->{value};
}

sub setValue {
	my $self = shift;
	$self->{value} = shift;
}

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getHighValueNumber {
	my $self = shift;
	return $self->{highValueNumber};
}

sub setHighValueNumber {
	my $self = shift;
	$self->{highValueNumber} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getValueMeaning {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ValueMeaning", $self);
	return $results[0];
}

sub getValueDomainPermissibleValueCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ValueDomainPermissibleValue", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::ReferenceDocument;

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

# create an instance of the ReferenceDocument object
# returns: a ReferenceDocument object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new ReferenceDocument\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this ReferenceDocument intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:ReferenceDocumentImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# languageName;
	if( defined( $self->getLanguageName ) ) {
		$tmpstr = "<languageName xsi:type=\"xsd:string\">" . $self->getLanguageName . "</languageName>";
	} else {
		$tmpstr = "<languageName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# displayOrder;
	if( defined( $self->getDisplayOrder ) ) {
		$tmpstr = "<displayOrder xsi:type=\"xsd:long\">" . $self->getDisplayOrder . "</displayOrder>";
	} else {
		$tmpstr = "<displayOrder xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# type;
	if( defined( $self->getType ) ) {
		$tmpstr = "<type xsi:type=\"xsd:string\">" . $self->getType . "</type>";
	} else {
		$tmpstr = "<type xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# organizationId;
	if( defined( $self->getOrganizationId ) ) {
		$tmpstr = "<organizationId xsi:type=\"xsd:string\">" . $self->getOrganizationId . "</organizationId>";
	} else {
		$tmpstr = "<organizationId xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# rdtlName;
	if( defined( $self->getRdtlName ) ) {
		$tmpstr = "<rdtlName xsi:type=\"xsd:string\">" . $self->getRdtlName . "</rdtlName>";
	} else {
		$tmpstr = "<rdtlName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# URL;
	if( defined( $self->getURL ) ) {
		$tmpstr = "<URL xsi:type=\"xsd:string\">" . $self->getURL . "</URL>";
	} else {
		$tmpstr = "<URL xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# doctext;
	if( defined( $self->getDoctext ) ) {
		$tmpstr = "<doctext xsi:type=\"xsd:string\">" . $self->getDoctext . "</doctext>";
	} else {
		$tmpstr = "<doctext xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of ReferenceDocument objects
# param: xml doc
# returns: list of ReferenceDocument objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @ReferenceDocumentNodes = $root->getChildNodes;
	my $ReferenceDocumentLength = $#ReferenceDocumentNodes;
	#print "total bean count = $ReferenceDocumentLength\n";
	
	# parse all ReferenceDocument nodes
	my @obj_list = ();
	foreach my $ReferenceDocumentNode (@ReferenceDocumentNodes) {
		#print "\tReferenceDocument\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $languageName;
		my $modifiedBy;
		my $displayOrder;
		my $type;
		my $organizationId;
		my $createdBy;
		my $dateCreated;
		my $rdtlName;
		my $dateModified;
		my $URL;
		my $doctext;
		my $name;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($ReferenceDocumentNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "languageName") {
				$languageName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "displayOrder") {
				$displayOrder=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "type") {
				$type=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "organizationId") {
				$organizationId=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "rdtlName") {
				$rdtlName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "URL") {
				$URL=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "doctext") {
				$doctext=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::ReferenceDocument;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setLanguageName($languageName);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setDisplayOrder($displayOrder);
		$newobj->setType($type);
		$newobj->setOrganizationId($organizationId);
		$newobj->setCreatedBy($createdBy);
		$newobj->setDateCreated($dateCreated);
		$newobj->setRdtlName($rdtlName);
		$newobj->setDateModified($dateModified);
		$newobj->setURL($URL);
		$newobj->setDoctext($doctext);
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

sub getLanguageName {
	my $self = shift;
	return $self->{languageName};
}

sub setLanguageName {
	my $self = shift;
	$self->{languageName} = shift;
}

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getDisplayOrder {
	my $self = shift;
	return $self->{displayOrder};
}

sub setDisplayOrder {
	my $self = shift;
	$self->{displayOrder} = shift;
}

sub getType {
	my $self = shift;
	return $self->{type};
}

sub setType {
	my $self = shift;
	$self->{type} = shift;
}

sub getOrganizationId {
	my $self = shift;
	return $self->{organizationId};
}

sub setOrganizationId {
	my $self = shift;
	$self->{organizationId} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

sub getRdtlName {
	my $self = shift;
	return $self->{rdtlName};
}

sub setRdtlName {
	my $self = shift;
	$self->{rdtlName} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getURL {
	my $self = shift;
	return $self->{URL};
}

sub setURL {
	my $self = shift;
	$self->{URL} = shift;
}

sub getDoctext {
	my $self = shift;
	return $self->{doctext};
}

sub setDoctext {
	my $self = shift;
	$self->{doctext} = shift;
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

sub getContext {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::Context", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::ProtocolFormsTemplate;

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

# create an instance of the ProtocolFormsTemplate object
# returns: a ProtocolFormsTemplate object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new ProtocolFormsTemplate\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this ProtocolFormsTemplate intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:ProtocolFormsTemplateImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# displayName;
	if( defined( $self->getDisplayName ) ) {
		$tmpstr = "<displayName xsi:type=\"xsd:string\">" . $self->getDisplayName . "</displayName>";
	} else {
		$tmpstr = "<displayName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# beginDate;
	if( defined( $self->getBeginDate ) ) {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\">" . $self->getBeginDate . "</beginDate>";
	} else {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusName;
	if( defined( $self->getWorkflowStatusName ) ) {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\">" . $self->getWorkflowStatusName . "</workflowStatusName>";
	} else {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# changeNote;
	if( defined( $self->getChangeNote ) ) {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\">" . $self->getChangeNote . "</changeNote>";
	} else {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# origin;
	if( defined( $self->getOrigin ) ) {
		$tmpstr = "<origin xsi:type=\"xsd:string\">" . $self->getOrigin . "</origin>";
	} else {
		$tmpstr = "<origin xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# latestVersionIndicator;
	if( defined( $self->getLatestVersionIndicator ) ) {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\">" . $self->getLatestVersionIndicator . "</latestVersionIndicator>";
	} else {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# longName;
	if( defined( $self->getLongName ) ) {
		$tmpstr = "<longName xsi:type=\"xsd:string\">" . $self->getLongName . "</longName>";
	} else {
		$tmpstr = "<longName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredName;
	if( defined( $self->getPreferredName ) ) {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\">" . $self->getPreferredName . "</preferredName>";
	} else {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredDefinition;
	if( defined( $self->getPreferredDefinition ) ) {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\">" . $self->getPreferredDefinition . "</preferredDefinition>";
	} else {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# publicID;
	if( defined( $self->getPublicID ) ) {
		$tmpstr = "<publicID xsi:type=\"xsd:long\">" . $self->getPublicID . "</publicID>";
	} else {
		$tmpstr = "<publicID xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusDescription;
	if( defined( $self->getWorkflowStatusDescription ) ) {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\">" . $self->getWorkflowStatusDescription . "</workflowStatusDescription>";
	} else {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# version;
	if( defined( $self->getVersion ) ) {
		$tmpstr = "<version xsi:type=\"xsd:float\">" . $self->getVersion . "</version>";
	} else {
		$tmpstr = "<version xsi:type=\"xsd:float\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# unresolvedIssue;
	if( defined( $self->getUnresolvedIssue ) ) {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\">" . $self->getUnresolvedIssue . "</unresolvedIssue>";
	} else {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# registrationStatus;
	if( defined( $self->getRegistrationStatus ) ) {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\">" . $self->getRegistrationStatus . "</registrationStatus>";
	} else {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# endDate;
	if( defined( $self->getEndDate ) ) {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\">" . $self->getEndDate . "</endDate>";
	} else {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# deletedIndicator;
	if( defined( $self->getDeletedIndicator ) ) {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\">" . $self->getDeletedIndicator . "</deletedIndicator>";
	} else {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of ProtocolFormsTemplate objects
# param: xml doc
# returns: list of ProtocolFormsTemplate objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @ProtocolFormsTemplateNodes = $root->getChildNodes;
	my $ProtocolFormsTemplateLength = $#ProtocolFormsTemplateNodes;
	#print "total bean count = $ProtocolFormsTemplateLength\n";
	
	# parse all ProtocolFormsTemplate nodes
	my @obj_list = ();
	foreach my $ProtocolFormsTemplateNode (@ProtocolFormsTemplateNodes) {
		#print "\tProtocolFormsTemplate\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $displayName;
		my $modifiedBy;
		my $beginDate;
		my $workflowStatusName;
		my $changeNote;
		my $origin;
		my $dateCreated;
		my $latestVersionIndicator;
		my $longName;
		my $preferredName;
		my $preferredDefinition;
		my $publicID;
		my $createdBy;
		my $workflowStatusDescription;
		my $version;
		my $unresolvedIssue;
		my $registrationStatus;
		my $dateModified;
		my $endDate;
		my $deletedIndicator;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($ProtocolFormsTemplateNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "displayName") {
				$displayName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "beginDate") {
				$beginDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusName") {
				$workflowStatusName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "changeNote") {
				$changeNote=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "origin") {
				$origin=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "latestVersionIndicator") {
				$latestVersionIndicator=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "longName") {
				$longName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredName") {
				$preferredName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredDefinition") {
				$preferredDefinition=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "publicID") {
				$publicID=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusDescription") {
				$workflowStatusDescription=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "version") {
				$version=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "unresolvedIssue") {
				$unresolvedIssue=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "registrationStatus") {
				$registrationStatus=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "endDate") {
				$endDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "deletedIndicator") {
				$deletedIndicator=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::ProtocolFormsTemplate;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setDisplayName($displayName);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setBeginDate($beginDate);
		$newobj->setWorkflowStatusName($workflowStatusName);
		$newobj->setChangeNote($changeNote);
		$newobj->setOrigin($origin);
		$newobj->setDateCreated($dateCreated);
		$newobj->setLatestVersionIndicator($latestVersionIndicator);
		$newobj->setLongName($longName);
		$newobj->setPreferredName($preferredName);
		$newobj->setPreferredDefinition($preferredDefinition);
		$newobj->setPublicID($publicID);
		$newobj->setCreatedBy($createdBy);
		$newobj->setWorkflowStatusDescription($workflowStatusDescription);
		$newobj->setVersion($version);
		$newobj->setUnresolvedIssue($unresolvedIssue);
		$newobj->setRegistrationStatus($registrationStatus);
		$newobj->setDateModified($dateModified);
		$newobj->setEndDate($endDate);
		$newobj->setDeletedIndicator($deletedIndicator);
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

sub getDisplayName {
	my $self = shift;
	return $self->{displayName};
}

sub setDisplayName {
	my $self = shift;
	$self->{displayName} = shift;
}

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getBeginDate {
	my $self = shift;
	return $self->{beginDate};
}

sub setBeginDate {
	my $self = shift;
	$self->{beginDate} = shift;
}

sub getWorkflowStatusName {
	my $self = shift;
	return $self->{workflowStatusName};
}

sub setWorkflowStatusName {
	my $self = shift;
	$self->{workflowStatusName} = shift;
}

sub getChangeNote {
	my $self = shift;
	return $self->{changeNote};
}

sub setChangeNote {
	my $self = shift;
	$self->{changeNote} = shift;
}

sub getOrigin {
	my $self = shift;
	return $self->{origin};
}

sub setOrigin {
	my $self = shift;
	$self->{origin} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

sub getLatestVersionIndicator {
	my $self = shift;
	return $self->{latestVersionIndicator};
}

sub setLatestVersionIndicator {
	my $self = shift;
	$self->{latestVersionIndicator} = shift;
}

sub getLongName {
	my $self = shift;
	return $self->{longName};
}

sub setLongName {
	my $self = shift;
	$self->{longName} = shift;
}

sub getPreferredName {
	my $self = shift;
	return $self->{preferredName};
}

sub setPreferredName {
	my $self = shift;
	$self->{preferredName} = shift;
}

sub getPreferredDefinition {
	my $self = shift;
	return $self->{preferredDefinition};
}

sub setPreferredDefinition {
	my $self = shift;
	$self->{preferredDefinition} = shift;
}

sub getPublicID {
	my $self = shift;
	return $self->{publicID};
}

sub setPublicID {
	my $self = shift;
	$self->{publicID} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getWorkflowStatusDescription {
	my $self = shift;
	return $self->{workflowStatusDescription};
}

sub setWorkflowStatusDescription {
	my $self = shift;
	$self->{workflowStatusDescription} = shift;
}

sub getVersion {
	my $self = shift;
	return $self->{version};
}

sub setVersion {
	my $self = shift;
	$self->{version} = shift;
}

sub getUnresolvedIssue {
	my $self = shift;
	return $self->{unresolvedIssue};
}

sub setUnresolvedIssue {
	my $self = shift;
	$self->{unresolvedIssue} = shift;
}

sub getRegistrationStatus {
	my $self = shift;
	return $self->{registrationStatus};
}

sub setRegistrationStatus {
	my $self = shift;
	$self->{registrationStatus} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getEndDate {
	my $self = shift;
	return $self->{endDate};
}

sub setEndDate {
	my $self = shift;
	$self->{endDate} = shift;
}

sub getDeletedIndicator {
	my $self = shift;
	return $self->{deletedIndicator};
}

sub setDeletedIndicator {
	my $self = shift;
	$self->{deletedIndicator} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getInstructionCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::Instruction", $self);
	return @results;
}

sub getModuleCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::Module", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::ProtocolFormsSet;

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

# create an instance of the ProtocolFormsSet object
# returns: a ProtocolFormsSet object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new ProtocolFormsSet\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this ProtocolFormsSet intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:ProtocolFormsSetImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# reviewedDate;
	if( defined( $self->getReviewedDate ) ) {
		$tmpstr = "<reviewedDate xsi:type=\"xsd:dateTime\">" . $self->getReviewedDate . "</reviewedDate>";
	} else {
		$tmpstr = "<reviewedDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# approvedDate;
	if( defined( $self->getApprovedDate ) ) {
		$tmpstr = "<approvedDate xsi:type=\"xsd:dateTime\">" . $self->getApprovedDate . "</approvedDate>";
	} else {
		$tmpstr = "<approvedDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# changeType;
	if( defined( $self->getChangeType ) ) {
		$tmpstr = "<changeType xsi:type=\"xsd:string\">" . $self->getChangeType . "</changeType>";
	} else {
		$tmpstr = "<changeType xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# leadOrganizationName;
	if( defined( $self->getLeadOrganizationName ) ) {
		$tmpstr = "<leadOrganizationName xsi:type=\"xsd:string\">" . $self->getLeadOrganizationName . "</leadOrganizationName>";
	} else {
		$tmpstr = "<leadOrganizationName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# phase;
	if( defined( $self->getPhase ) ) {
		$tmpstr = "<phase xsi:type=\"xsd:string\">" . $self->getPhase . "</phase>";
	} else {
		$tmpstr = "<phase xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# type;
	if( defined( $self->getType ) ) {
		$tmpstr = "<type xsi:type=\"xsd:string\">" . $self->getType . "</type>";
	} else {
		$tmpstr = "<type xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# reviewedBy;
	if( defined( $self->getReviewedBy ) ) {
		$tmpstr = "<reviewedBy xsi:type=\"xsd:string\">" . $self->getReviewedBy . "</reviewedBy>";
	} else {
		$tmpstr = "<reviewedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# protocolId;
	if( defined( $self->getProtocolId ) ) {
		$tmpstr = "<protocolId xsi:type=\"xsd:string\">" . $self->getProtocolId . "</protocolId>";
	} else {
		$tmpstr = "<protocolId xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# approvedBy;
	if( defined( $self->getApprovedBy ) ) {
		$tmpstr = "<approvedBy xsi:type=\"xsd:string\">" . $self->getApprovedBy . "</approvedBy>";
	} else {
		$tmpstr = "<approvedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# changeNumber;
	if( defined( $self->getChangeNumber ) ) {
		$tmpstr = "<changeNumber xsi:type=\"xsd:string\">" . $self->getChangeNumber . "</changeNumber>";
	} else {
		$tmpstr = "<changeNumber xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# beginDate;
	if( defined( $self->getBeginDate ) ) {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\">" . $self->getBeginDate . "</beginDate>";
	} else {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusName;
	if( defined( $self->getWorkflowStatusName ) ) {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\">" . $self->getWorkflowStatusName . "</workflowStatusName>";
	} else {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# changeNote;
	if( defined( $self->getChangeNote ) ) {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\">" . $self->getChangeNote . "</changeNote>";
	} else {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# origin;
	if( defined( $self->getOrigin ) ) {
		$tmpstr = "<origin xsi:type=\"xsd:string\">" . $self->getOrigin . "</origin>";
	} else {
		$tmpstr = "<origin xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# latestVersionIndicator;
	if( defined( $self->getLatestVersionIndicator ) ) {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\">" . $self->getLatestVersionIndicator . "</latestVersionIndicator>";
	} else {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# longName;
	if( defined( $self->getLongName ) ) {
		$tmpstr = "<longName xsi:type=\"xsd:string\">" . $self->getLongName . "</longName>";
	} else {
		$tmpstr = "<longName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredName;
	if( defined( $self->getPreferredName ) ) {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\">" . $self->getPreferredName . "</preferredName>";
	} else {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredDefinition;
	if( defined( $self->getPreferredDefinition ) ) {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\">" . $self->getPreferredDefinition . "</preferredDefinition>";
	} else {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# publicID;
	if( defined( $self->getPublicID ) ) {
		$tmpstr = "<publicID xsi:type=\"xsd:long\">" . $self->getPublicID . "</publicID>";
	} else {
		$tmpstr = "<publicID xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusDescription;
	if( defined( $self->getWorkflowStatusDescription ) ) {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\">" . $self->getWorkflowStatusDescription . "</workflowStatusDescription>";
	} else {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# version;
	if( defined( $self->getVersion ) ) {
		$tmpstr = "<version xsi:type=\"xsd:float\">" . $self->getVersion . "</version>";
	} else {
		$tmpstr = "<version xsi:type=\"xsd:float\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# unresolvedIssue;
	if( defined( $self->getUnresolvedIssue ) ) {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\">" . $self->getUnresolvedIssue . "</unresolvedIssue>";
	} else {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# registrationStatus;
	if( defined( $self->getRegistrationStatus ) ) {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\">" . $self->getRegistrationStatus . "</registrationStatus>";
	} else {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# endDate;
	if( defined( $self->getEndDate ) ) {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\">" . $self->getEndDate . "</endDate>";
	} else {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# deletedIndicator;
	if( defined( $self->getDeletedIndicator ) ) {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\">" . $self->getDeletedIndicator . "</deletedIndicator>";
	} else {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of ProtocolFormsSet objects
# param: xml doc
# returns: list of ProtocolFormsSet objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @ProtocolFormsSetNodes = $root->getChildNodes;
	my $ProtocolFormsSetLength = $#ProtocolFormsSetNodes;
	#print "total bean count = $ProtocolFormsSetLength\n";
	
	# parse all ProtocolFormsSet nodes
	my @obj_list = ();
	foreach my $ProtocolFormsSetNode (@ProtocolFormsSetNodes) {
		#print "\tProtocolFormsSet\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $reviewedDate;
		my $approvedDate;
		my $changeType;
		my $leadOrganizationName;
		my $phase;
		my $type;
		my $reviewedBy;
		my $protocolId;
		my $approvedBy;
		my $changeNumber;
		my $modifiedBy;
		my $beginDate;
		my $workflowStatusName;
		my $changeNote;
		my $origin;
		my $dateCreated;
		my $latestVersionIndicator;
		my $longName;
		my $preferredName;
		my $preferredDefinition;
		my $publicID;
		my $createdBy;
		my $workflowStatusDescription;
		my $version;
		my $unresolvedIssue;
		my $registrationStatus;
		my $dateModified;
		my $endDate;
		my $deletedIndicator;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($ProtocolFormsSetNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "reviewedDate") {
				$reviewedDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "approvedDate") {
				$approvedDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "changeType") {
				$changeType=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "leadOrganizationName") {
				$leadOrganizationName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "phase") {
				$phase=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "type") {
				$type=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "reviewedBy") {
				$reviewedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "protocolId") {
				$protocolId=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "approvedBy") {
				$approvedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "changeNumber") {
				$changeNumber=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "beginDate") {
				$beginDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusName") {
				$workflowStatusName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "changeNote") {
				$changeNote=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "origin") {
				$origin=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "latestVersionIndicator") {
				$latestVersionIndicator=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "longName") {
				$longName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredName") {
				$preferredName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredDefinition") {
				$preferredDefinition=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "publicID") {
				$publicID=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusDescription") {
				$workflowStatusDescription=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "version") {
				$version=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "unresolvedIssue") {
				$unresolvedIssue=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "registrationStatus") {
				$registrationStatus=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "endDate") {
				$endDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "deletedIndicator") {
				$deletedIndicator=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::ProtocolFormsSet;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setReviewedDate($reviewedDate);
		$newobj->setApprovedDate($approvedDate);
		$newobj->setChangeType($changeType);
		$newobj->setLeadOrganizationName($leadOrganizationName);
		$newobj->setPhase($phase);
		$newobj->setType($type);
		$newobj->setReviewedBy($reviewedBy);
		$newobj->setProtocolId($protocolId);
		$newobj->setApprovedBy($approvedBy);
		$newobj->setChangeNumber($changeNumber);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setBeginDate($beginDate);
		$newobj->setWorkflowStatusName($workflowStatusName);
		$newobj->setChangeNote($changeNote);
		$newobj->setOrigin($origin);
		$newobj->setDateCreated($dateCreated);
		$newobj->setLatestVersionIndicator($latestVersionIndicator);
		$newobj->setLongName($longName);
		$newobj->setPreferredName($preferredName);
		$newobj->setPreferredDefinition($preferredDefinition);
		$newobj->setPublicID($publicID);
		$newobj->setCreatedBy($createdBy);
		$newobj->setWorkflowStatusDescription($workflowStatusDescription);
		$newobj->setVersion($version);
		$newobj->setUnresolvedIssue($unresolvedIssue);
		$newobj->setRegistrationStatus($registrationStatus);
		$newobj->setDateModified($dateModified);
		$newobj->setEndDate($endDate);
		$newobj->setDeletedIndicator($deletedIndicator);
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

sub getReviewedDate {
	my $self = shift;
	return $self->{reviewedDate};
}

sub setReviewedDate {
	my $self = shift;
	$self->{reviewedDate} = shift;
}

sub getApprovedDate {
	my $self = shift;
	return $self->{approvedDate};
}

sub setApprovedDate {
	my $self = shift;
	$self->{approvedDate} = shift;
}

sub getChangeType {
	my $self = shift;
	return $self->{changeType};
}

sub setChangeType {
	my $self = shift;
	$self->{changeType} = shift;
}

sub getLeadOrganizationName {
	my $self = shift;
	return $self->{leadOrganizationName};
}

sub setLeadOrganizationName {
	my $self = shift;
	$self->{leadOrganizationName} = shift;
}

sub getPhase {
	my $self = shift;
	return $self->{phase};
}

sub setPhase {
	my $self = shift;
	$self->{phase} = shift;
}

sub getType {
	my $self = shift;
	return $self->{type};
}

sub setType {
	my $self = shift;
	$self->{type} = shift;
}

sub getReviewedBy {
	my $self = shift;
	return $self->{reviewedBy};
}

sub setReviewedBy {
	my $self = shift;
	$self->{reviewedBy} = shift;
}

sub getProtocolId {
	my $self = shift;
	return $self->{protocolId};
}

sub setProtocolId {
	my $self = shift;
	$self->{protocolId} = shift;
}

sub getApprovedBy {
	my $self = shift;
	return $self->{approvedBy};
}

sub setApprovedBy {
	my $self = shift;
	$self->{approvedBy} = shift;
}

sub getChangeNumber {
	my $self = shift;
	return $self->{changeNumber};
}

sub setChangeNumber {
	my $self = shift;
	$self->{changeNumber} = shift;
}

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getBeginDate {
	my $self = shift;
	return $self->{beginDate};
}

sub setBeginDate {
	my $self = shift;
	$self->{beginDate} = shift;
}

sub getWorkflowStatusName {
	my $self = shift;
	return $self->{workflowStatusName};
}

sub setWorkflowStatusName {
	my $self = shift;
	$self->{workflowStatusName} = shift;
}

sub getChangeNote {
	my $self = shift;
	return $self->{changeNote};
}

sub setChangeNote {
	my $self = shift;
	$self->{changeNote} = shift;
}

sub getOrigin {
	my $self = shift;
	return $self->{origin};
}

sub setOrigin {
	my $self = shift;
	$self->{origin} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

sub getLatestVersionIndicator {
	my $self = shift;
	return $self->{latestVersionIndicator};
}

sub setLatestVersionIndicator {
	my $self = shift;
	$self->{latestVersionIndicator} = shift;
}

sub getLongName {
	my $self = shift;
	return $self->{longName};
}

sub setLongName {
	my $self = shift;
	$self->{longName} = shift;
}

sub getPreferredName {
	my $self = shift;
	return $self->{preferredName};
}

sub setPreferredName {
	my $self = shift;
	$self->{preferredName} = shift;
}

sub getPreferredDefinition {
	my $self = shift;
	return $self->{preferredDefinition};
}

sub setPreferredDefinition {
	my $self = shift;
	$self->{preferredDefinition} = shift;
}

sub getPublicID {
	my $self = shift;
	return $self->{publicID};
}

sub setPublicID {
	my $self = shift;
	$self->{publicID} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getWorkflowStatusDescription {
	my $self = shift;
	return $self->{workflowStatusDescription};
}

sub setWorkflowStatusDescription {
	my $self = shift;
	$self->{workflowStatusDescription} = shift;
}

sub getVersion {
	my $self = shift;
	return $self->{version};
}

sub setVersion {
	my $self = shift;
	$self->{version} = shift;
}

sub getUnresolvedIssue {
	my $self = shift;
	return $self->{unresolvedIssue};
}

sub setUnresolvedIssue {
	my $self = shift;
	$self->{unresolvedIssue} = shift;
}

sub getRegistrationStatus {
	my $self = shift;
	return $self->{registrationStatus};
}

sub setRegistrationStatus {
	my $self = shift;
	$self->{registrationStatus} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getEndDate {
	my $self = shift;
	return $self->{endDate};
}

sub setEndDate {
	my $self = shift;
	$self->{endDate} = shift;
}

sub getDeletedIndicator {
	my $self = shift;
	return $self->{deletedIndicator};
}

sub setDeletedIndicator {
	my $self = shift;
	$self->{deletedIndicator} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getCaseReportFormCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::CaseReportForm", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::CaseReportForm;

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

# create an instance of the CaseReportForm object
# returns: a CaseReportForm object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new CaseReportForm\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this CaseReportForm intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:CaseReportFormImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# displayName;
	if( defined( $self->getDisplayName ) ) {
		$tmpstr = "<displayName xsi:type=\"xsd:string\">" . $self->getDisplayName . "</displayName>";
	} else {
		$tmpstr = "<displayName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# beginDate;
	if( defined( $self->getBeginDate ) ) {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\">" . $self->getBeginDate . "</beginDate>";
	} else {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusName;
	if( defined( $self->getWorkflowStatusName ) ) {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\">" . $self->getWorkflowStatusName . "</workflowStatusName>";
	} else {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# changeNote;
	if( defined( $self->getChangeNote ) ) {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\">" . $self->getChangeNote . "</changeNote>";
	} else {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# origin;
	if( defined( $self->getOrigin ) ) {
		$tmpstr = "<origin xsi:type=\"xsd:string\">" . $self->getOrigin . "</origin>";
	} else {
		$tmpstr = "<origin xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# latestVersionIndicator;
	if( defined( $self->getLatestVersionIndicator ) ) {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\">" . $self->getLatestVersionIndicator . "</latestVersionIndicator>";
	} else {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# longName;
	if( defined( $self->getLongName ) ) {
		$tmpstr = "<longName xsi:type=\"xsd:string\">" . $self->getLongName . "</longName>";
	} else {
		$tmpstr = "<longName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredName;
	if( defined( $self->getPreferredName ) ) {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\">" . $self->getPreferredName . "</preferredName>";
	} else {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredDefinition;
	if( defined( $self->getPreferredDefinition ) ) {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\">" . $self->getPreferredDefinition . "</preferredDefinition>";
	} else {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# publicID;
	if( defined( $self->getPublicID ) ) {
		$tmpstr = "<publicID xsi:type=\"xsd:long\">" . $self->getPublicID . "</publicID>";
	} else {
		$tmpstr = "<publicID xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusDescription;
	if( defined( $self->getWorkflowStatusDescription ) ) {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\">" . $self->getWorkflowStatusDescription . "</workflowStatusDescription>";
	} else {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# version;
	if( defined( $self->getVersion ) ) {
		$tmpstr = "<version xsi:type=\"xsd:float\">" . $self->getVersion . "</version>";
	} else {
		$tmpstr = "<version xsi:type=\"xsd:float\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# unresolvedIssue;
	if( defined( $self->getUnresolvedIssue ) ) {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\">" . $self->getUnresolvedIssue . "</unresolvedIssue>";
	} else {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# registrationStatus;
	if( defined( $self->getRegistrationStatus ) ) {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\">" . $self->getRegistrationStatus . "</registrationStatus>";
	} else {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# endDate;
	if( defined( $self->getEndDate ) ) {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\">" . $self->getEndDate . "</endDate>";
	} else {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# deletedIndicator;
	if( defined( $self->getDeletedIndicator ) ) {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\">" . $self->getDeletedIndicator . "</deletedIndicator>";
	} else {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of CaseReportForm objects
# param: xml doc
# returns: list of CaseReportForm objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @CaseReportFormNodes = $root->getChildNodes;
	my $CaseReportFormLength = $#CaseReportFormNodes;
	#print "total bean count = $CaseReportFormLength\n";
	
	# parse all CaseReportForm nodes
	my @obj_list = ();
	foreach my $CaseReportFormNode (@CaseReportFormNodes) {
		#print "\tCaseReportForm\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $displayName;
		my $modifiedBy;
		my $beginDate;
		my $workflowStatusName;
		my $changeNote;
		my $origin;
		my $dateCreated;
		my $latestVersionIndicator;
		my $longName;
		my $preferredName;
		my $preferredDefinition;
		my $publicID;
		my $createdBy;
		my $workflowStatusDescription;
		my $version;
		my $unresolvedIssue;
		my $registrationStatus;
		my $dateModified;
		my $endDate;
		my $deletedIndicator;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($CaseReportFormNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "displayName") {
				$displayName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "beginDate") {
				$beginDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusName") {
				$workflowStatusName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "changeNote") {
				$changeNote=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "origin") {
				$origin=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "latestVersionIndicator") {
				$latestVersionIndicator=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "longName") {
				$longName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredName") {
				$preferredName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredDefinition") {
				$preferredDefinition=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "publicID") {
				$publicID=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusDescription") {
				$workflowStatusDescription=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "version") {
				$version=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "unresolvedIssue") {
				$unresolvedIssue=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "registrationStatus") {
				$registrationStatus=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "endDate") {
				$endDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "deletedIndicator") {
				$deletedIndicator=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::CaseReportForm;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setDisplayName($displayName);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setBeginDate($beginDate);
		$newobj->setWorkflowStatusName($workflowStatusName);
		$newobj->setChangeNote($changeNote);
		$newobj->setOrigin($origin);
		$newobj->setDateCreated($dateCreated);
		$newobj->setLatestVersionIndicator($latestVersionIndicator);
		$newobj->setLongName($longName);
		$newobj->setPreferredName($preferredName);
		$newobj->setPreferredDefinition($preferredDefinition);
		$newobj->setPublicID($publicID);
		$newobj->setCreatedBy($createdBy);
		$newobj->setWorkflowStatusDescription($workflowStatusDescription);
		$newobj->setVersion($version);
		$newobj->setUnresolvedIssue($unresolvedIssue);
		$newobj->setRegistrationStatus($registrationStatus);
		$newobj->setDateModified($dateModified);
		$newobj->setEndDate($endDate);
		$newobj->setDeletedIndicator($deletedIndicator);
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

sub getDisplayName {
	my $self = shift;
	return $self->{displayName};
}

sub setDisplayName {
	my $self = shift;
	$self->{displayName} = shift;
}

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getBeginDate {
	my $self = shift;
	return $self->{beginDate};
}

sub setBeginDate {
	my $self = shift;
	$self->{beginDate} = shift;
}

sub getWorkflowStatusName {
	my $self = shift;
	return $self->{workflowStatusName};
}

sub setWorkflowStatusName {
	my $self = shift;
	$self->{workflowStatusName} = shift;
}

sub getChangeNote {
	my $self = shift;
	return $self->{changeNote};
}

sub setChangeNote {
	my $self = shift;
	$self->{changeNote} = shift;
}

sub getOrigin {
	my $self = shift;
	return $self->{origin};
}

sub setOrigin {
	my $self = shift;
	$self->{origin} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

sub getLatestVersionIndicator {
	my $self = shift;
	return $self->{latestVersionIndicator};
}

sub setLatestVersionIndicator {
	my $self = shift;
	$self->{latestVersionIndicator} = shift;
}

sub getLongName {
	my $self = shift;
	return $self->{longName};
}

sub setLongName {
	my $self = shift;
	$self->{longName} = shift;
}

sub getPreferredName {
	my $self = shift;
	return $self->{preferredName};
}

sub setPreferredName {
	my $self = shift;
	$self->{preferredName} = shift;
}

sub getPreferredDefinition {
	my $self = shift;
	return $self->{preferredDefinition};
}

sub setPreferredDefinition {
	my $self = shift;
	$self->{preferredDefinition} = shift;
}

sub getPublicID {
	my $self = shift;
	return $self->{publicID};
}

sub setPublicID {
	my $self = shift;
	$self->{publicID} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getWorkflowStatusDescription {
	my $self = shift;
	return $self->{workflowStatusDescription};
}

sub setWorkflowStatusDescription {
	my $self = shift;
	$self->{workflowStatusDescription} = shift;
}

sub getVersion {
	my $self = shift;
	return $self->{version};
}

sub setVersion {
	my $self = shift;
	$self->{version} = shift;
}

sub getUnresolvedIssue {
	my $self = shift;
	return $self->{unresolvedIssue};
}

sub setUnresolvedIssue {
	my $self = shift;
	$self->{unresolvedIssue} = shift;
}

sub getRegistrationStatus {
	my $self = shift;
	return $self->{registrationStatus};
}

sub setRegistrationStatus {
	my $self = shift;
	$self->{registrationStatus} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getEndDate {
	my $self = shift;
	return $self->{endDate};
}

sub setEndDate {
	my $self = shift;
	$self->{endDate} = shift;
}

sub getDeletedIndicator {
	my $self = shift;
	return $self->{deletedIndicator};
}

sub setDeletedIndicator {
	my $self = shift;
	$self->{deletedIndicator} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getInstructionCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::Instruction", $self);
	return @results;
}

sub getProtocolFormsSet {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ProtocolFormsSet", $self);
	return $results[0];
}

sub getModuleCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::Module", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::Module;

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

# create an instance of the Module object
# returns: a Module object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Module\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Module intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:ModuleImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# displayOrder;
	if( defined( $self->getDisplayOrder ) ) {
		$tmpstr = "<displayOrder xsi:type=\"xsd:int\">" . $self->getDisplayOrder . "</displayOrder>";
	} else {
		$tmpstr = "<displayOrder xsi:type=\"xsd:int\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# beginDate;
	if( defined( $self->getBeginDate ) ) {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\">" . $self->getBeginDate . "</beginDate>";
	} else {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusName;
	if( defined( $self->getWorkflowStatusName ) ) {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\">" . $self->getWorkflowStatusName . "</workflowStatusName>";
	} else {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# changeNote;
	if( defined( $self->getChangeNote ) ) {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\">" . $self->getChangeNote . "</changeNote>";
	} else {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# origin;
	if( defined( $self->getOrigin ) ) {
		$tmpstr = "<origin xsi:type=\"xsd:string\">" . $self->getOrigin . "</origin>";
	} else {
		$tmpstr = "<origin xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# latestVersionIndicator;
	if( defined( $self->getLatestVersionIndicator ) ) {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\">" . $self->getLatestVersionIndicator . "</latestVersionIndicator>";
	} else {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# longName;
	if( defined( $self->getLongName ) ) {
		$tmpstr = "<longName xsi:type=\"xsd:string\">" . $self->getLongName . "</longName>";
	} else {
		$tmpstr = "<longName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredName;
	if( defined( $self->getPreferredName ) ) {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\">" . $self->getPreferredName . "</preferredName>";
	} else {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredDefinition;
	if( defined( $self->getPreferredDefinition ) ) {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\">" . $self->getPreferredDefinition . "</preferredDefinition>";
	} else {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# publicID;
	if( defined( $self->getPublicID ) ) {
		$tmpstr = "<publicID xsi:type=\"xsd:long\">" . $self->getPublicID . "</publicID>";
	} else {
		$tmpstr = "<publicID xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusDescription;
	if( defined( $self->getWorkflowStatusDescription ) ) {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\">" . $self->getWorkflowStatusDescription . "</workflowStatusDescription>";
	} else {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# version;
	if( defined( $self->getVersion ) ) {
		$tmpstr = "<version xsi:type=\"xsd:float\">" . $self->getVersion . "</version>";
	} else {
		$tmpstr = "<version xsi:type=\"xsd:float\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# unresolvedIssue;
	if( defined( $self->getUnresolvedIssue ) ) {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\">" . $self->getUnresolvedIssue . "</unresolvedIssue>";
	} else {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# registrationStatus;
	if( defined( $self->getRegistrationStatus ) ) {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\">" . $self->getRegistrationStatus . "</registrationStatus>";
	} else {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# endDate;
	if( defined( $self->getEndDate ) ) {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\">" . $self->getEndDate . "</endDate>";
	} else {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# deletedIndicator;
	if( defined( $self->getDeletedIndicator ) ) {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\">" . $self->getDeletedIndicator . "</deletedIndicator>";
	} else {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of Module objects
# param: xml doc
# returns: list of Module objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @ModuleNodes = $root->getChildNodes;
	my $ModuleLength = $#ModuleNodes;
	#print "total bean count = $ModuleLength\n";
	
	# parse all Module nodes
	my @obj_list = ();
	foreach my $ModuleNode (@ModuleNodes) {
		#print "\tModule\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $displayOrder;
		my $modifiedBy;
		my $beginDate;
		my $workflowStatusName;
		my $changeNote;
		my $origin;
		my $dateCreated;
		my $latestVersionIndicator;
		my $longName;
		my $preferredName;
		my $preferredDefinition;
		my $publicID;
		my $createdBy;
		my $workflowStatusDescription;
		my $version;
		my $unresolvedIssue;
		my $registrationStatus;
		my $dateModified;
		my $endDate;
		my $deletedIndicator;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($ModuleNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "displayOrder") {
				$displayOrder=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "beginDate") {
				$beginDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusName") {
				$workflowStatusName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "changeNote") {
				$changeNote=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "origin") {
				$origin=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "latestVersionIndicator") {
				$latestVersionIndicator=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "longName") {
				$longName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredName") {
				$preferredName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredDefinition") {
				$preferredDefinition=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "publicID") {
				$publicID=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusDescription") {
				$workflowStatusDescription=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "version") {
				$version=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "unresolvedIssue") {
				$unresolvedIssue=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "registrationStatus") {
				$registrationStatus=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "endDate") {
				$endDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "deletedIndicator") {
				$deletedIndicator=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::Module;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setDisplayOrder($displayOrder);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setBeginDate($beginDate);
		$newobj->setWorkflowStatusName($workflowStatusName);
		$newobj->setChangeNote($changeNote);
		$newobj->setOrigin($origin);
		$newobj->setDateCreated($dateCreated);
		$newobj->setLatestVersionIndicator($latestVersionIndicator);
		$newobj->setLongName($longName);
		$newobj->setPreferredName($preferredName);
		$newobj->setPreferredDefinition($preferredDefinition);
		$newobj->setPublicID($publicID);
		$newobj->setCreatedBy($createdBy);
		$newobj->setWorkflowStatusDescription($workflowStatusDescription);
		$newobj->setVersion($version);
		$newobj->setUnresolvedIssue($unresolvedIssue);
		$newobj->setRegistrationStatus($registrationStatus);
		$newobj->setDateModified($dateModified);
		$newobj->setEndDate($endDate);
		$newobj->setDeletedIndicator($deletedIndicator);
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

sub getDisplayOrder {
	my $self = shift;
	return $self->{displayOrder};
}

sub setDisplayOrder {
	my $self = shift;
	$self->{displayOrder} = shift;
}

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getBeginDate {
	my $self = shift;
	return $self->{beginDate};
}

sub setBeginDate {
	my $self = shift;
	$self->{beginDate} = shift;
}

sub getWorkflowStatusName {
	my $self = shift;
	return $self->{workflowStatusName};
}

sub setWorkflowStatusName {
	my $self = shift;
	$self->{workflowStatusName} = shift;
}

sub getChangeNote {
	my $self = shift;
	return $self->{changeNote};
}

sub setChangeNote {
	my $self = shift;
	$self->{changeNote} = shift;
}

sub getOrigin {
	my $self = shift;
	return $self->{origin};
}

sub setOrigin {
	my $self = shift;
	$self->{origin} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

sub getLatestVersionIndicator {
	my $self = shift;
	return $self->{latestVersionIndicator};
}

sub setLatestVersionIndicator {
	my $self = shift;
	$self->{latestVersionIndicator} = shift;
}

sub getLongName {
	my $self = shift;
	return $self->{longName};
}

sub setLongName {
	my $self = shift;
	$self->{longName} = shift;
}

sub getPreferredName {
	my $self = shift;
	return $self->{preferredName};
}

sub setPreferredName {
	my $self = shift;
	$self->{preferredName} = shift;
}

sub getPreferredDefinition {
	my $self = shift;
	return $self->{preferredDefinition};
}

sub setPreferredDefinition {
	my $self = shift;
	$self->{preferredDefinition} = shift;
}

sub getPublicID {
	my $self = shift;
	return $self->{publicID};
}

sub setPublicID {
	my $self = shift;
	$self->{publicID} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getWorkflowStatusDescription {
	my $self = shift;
	return $self->{workflowStatusDescription};
}

sub setWorkflowStatusDescription {
	my $self = shift;
	$self->{workflowStatusDescription} = shift;
}

sub getVersion {
	my $self = shift;
	return $self->{version};
}

sub setVersion {
	my $self = shift;
	$self->{version} = shift;
}

sub getUnresolvedIssue {
	my $self = shift;
	return $self->{unresolvedIssue};
}

sub setUnresolvedIssue {
	my $self = shift;
	$self->{unresolvedIssue} = shift;
}

sub getRegistrationStatus {
	my $self = shift;
	return $self->{registrationStatus};
}

sub setRegistrationStatus {
	my $self = shift;
	$self->{registrationStatus} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getEndDate {
	my $self = shift;
	return $self->{endDate};
}

sub setEndDate {
	my $self = shift;
	$self->{endDate} = shift;
}

sub getDeletedIndicator {
	my $self = shift;
	return $self->{deletedIndicator};
}

sub setDeletedIndicator {
	my $self = shift;
	$self->{deletedIndicator} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getInstructionCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::Instruction", $self);
	return @results;
}

sub getCaseReportForm {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::CaseReportForm", $self);
	return $results[0];
}

sub getProtocolFormsTemplate {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ProtocolFormsTemplate", $self);
	return $results[0];
}

sub getQuestionCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::Question", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::Question;

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

# create an instance of the Question object
# returns: a Question object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Question\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Question intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:QuestionImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# displayOrder;
	if( defined( $self->getDisplayOrder ) ) {
		$tmpstr = "<displayOrder xsi:type=\"xsd:int\">" . $self->getDisplayOrder . "</displayOrder>";
	} else {
		$tmpstr = "<displayOrder xsi:type=\"xsd:int\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# beginDate;
	if( defined( $self->getBeginDate ) ) {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\">" . $self->getBeginDate . "</beginDate>";
	} else {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusName;
	if( defined( $self->getWorkflowStatusName ) ) {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\">" . $self->getWorkflowStatusName . "</workflowStatusName>";
	} else {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# changeNote;
	if( defined( $self->getChangeNote ) ) {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\">" . $self->getChangeNote . "</changeNote>";
	} else {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# origin;
	if( defined( $self->getOrigin ) ) {
		$tmpstr = "<origin xsi:type=\"xsd:string\">" . $self->getOrigin . "</origin>";
	} else {
		$tmpstr = "<origin xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# latestVersionIndicator;
	if( defined( $self->getLatestVersionIndicator ) ) {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\">" . $self->getLatestVersionIndicator . "</latestVersionIndicator>";
	} else {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# longName;
	if( defined( $self->getLongName ) ) {
		$tmpstr = "<longName xsi:type=\"xsd:string\">" . $self->getLongName . "</longName>";
	} else {
		$tmpstr = "<longName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredName;
	if( defined( $self->getPreferredName ) ) {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\">" . $self->getPreferredName . "</preferredName>";
	} else {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredDefinition;
	if( defined( $self->getPreferredDefinition ) ) {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\">" . $self->getPreferredDefinition . "</preferredDefinition>";
	} else {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# publicID;
	if( defined( $self->getPublicID ) ) {
		$tmpstr = "<publicID xsi:type=\"xsd:long\">" . $self->getPublicID . "</publicID>";
	} else {
		$tmpstr = "<publicID xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusDescription;
	if( defined( $self->getWorkflowStatusDescription ) ) {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\">" . $self->getWorkflowStatusDescription . "</workflowStatusDescription>";
	} else {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# version;
	if( defined( $self->getVersion ) ) {
		$tmpstr = "<version xsi:type=\"xsd:float\">" . $self->getVersion . "</version>";
	} else {
		$tmpstr = "<version xsi:type=\"xsd:float\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# unresolvedIssue;
	if( defined( $self->getUnresolvedIssue ) ) {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\">" . $self->getUnresolvedIssue . "</unresolvedIssue>";
	} else {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# registrationStatus;
	if( defined( $self->getRegistrationStatus ) ) {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\">" . $self->getRegistrationStatus . "</registrationStatus>";
	} else {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# endDate;
	if( defined( $self->getEndDate ) ) {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\">" . $self->getEndDate . "</endDate>";
	} else {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# deletedIndicator;
	if( defined( $self->getDeletedIndicator ) ) {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\">" . $self->getDeletedIndicator . "</deletedIndicator>";
	} else {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of Question objects
# param: xml doc
# returns: list of Question objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @QuestionNodes = $root->getChildNodes;
	my $QuestionLength = $#QuestionNodes;
	#print "total bean count = $QuestionLength\n";
	
	# parse all Question nodes
	my @obj_list = ();
	foreach my $QuestionNode (@QuestionNodes) {
		#print "\tQuestion\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $displayOrder;
		my $modifiedBy;
		my $beginDate;
		my $workflowStatusName;
		my $changeNote;
		my $origin;
		my $dateCreated;
		my $latestVersionIndicator;
		my $longName;
		my $preferredName;
		my $preferredDefinition;
		my $publicID;
		my $createdBy;
		my $workflowStatusDescription;
		my $version;
		my $unresolvedIssue;
		my $registrationStatus;
		my $dateModified;
		my $endDate;
		my $deletedIndicator;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($QuestionNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "displayOrder") {
				$displayOrder=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "beginDate") {
				$beginDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusName") {
				$workflowStatusName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "changeNote") {
				$changeNote=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "origin") {
				$origin=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "latestVersionIndicator") {
				$latestVersionIndicator=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "longName") {
				$longName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredName") {
				$preferredName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredDefinition") {
				$preferredDefinition=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "publicID") {
				$publicID=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusDescription") {
				$workflowStatusDescription=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "version") {
				$version=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "unresolvedIssue") {
				$unresolvedIssue=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "registrationStatus") {
				$registrationStatus=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "endDate") {
				$endDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "deletedIndicator") {
				$deletedIndicator=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::Question;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setDisplayOrder($displayOrder);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setBeginDate($beginDate);
		$newobj->setWorkflowStatusName($workflowStatusName);
		$newobj->setChangeNote($changeNote);
		$newobj->setOrigin($origin);
		$newobj->setDateCreated($dateCreated);
		$newobj->setLatestVersionIndicator($latestVersionIndicator);
		$newobj->setLongName($longName);
		$newobj->setPreferredName($preferredName);
		$newobj->setPreferredDefinition($preferredDefinition);
		$newobj->setPublicID($publicID);
		$newobj->setCreatedBy($createdBy);
		$newobj->setWorkflowStatusDescription($workflowStatusDescription);
		$newobj->setVersion($version);
		$newobj->setUnresolvedIssue($unresolvedIssue);
		$newobj->setRegistrationStatus($registrationStatus);
		$newobj->setDateModified($dateModified);
		$newobj->setEndDate($endDate);
		$newobj->setDeletedIndicator($deletedIndicator);
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

sub getDisplayOrder {
	my $self = shift;
	return $self->{displayOrder};
}

sub setDisplayOrder {
	my $self = shift;
	$self->{displayOrder} = shift;
}

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getBeginDate {
	my $self = shift;
	return $self->{beginDate};
}

sub setBeginDate {
	my $self = shift;
	$self->{beginDate} = shift;
}

sub getWorkflowStatusName {
	my $self = shift;
	return $self->{workflowStatusName};
}

sub setWorkflowStatusName {
	my $self = shift;
	$self->{workflowStatusName} = shift;
}

sub getChangeNote {
	my $self = shift;
	return $self->{changeNote};
}

sub setChangeNote {
	my $self = shift;
	$self->{changeNote} = shift;
}

sub getOrigin {
	my $self = shift;
	return $self->{origin};
}

sub setOrigin {
	my $self = shift;
	$self->{origin} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

sub getLatestVersionIndicator {
	my $self = shift;
	return $self->{latestVersionIndicator};
}

sub setLatestVersionIndicator {
	my $self = shift;
	$self->{latestVersionIndicator} = shift;
}

sub getLongName {
	my $self = shift;
	return $self->{longName};
}

sub setLongName {
	my $self = shift;
	$self->{longName} = shift;
}

sub getPreferredName {
	my $self = shift;
	return $self->{preferredName};
}

sub setPreferredName {
	my $self = shift;
	$self->{preferredName} = shift;
}

sub getPreferredDefinition {
	my $self = shift;
	return $self->{preferredDefinition};
}

sub setPreferredDefinition {
	my $self = shift;
	$self->{preferredDefinition} = shift;
}

sub getPublicID {
	my $self = shift;
	return $self->{publicID};
}

sub setPublicID {
	my $self = shift;
	$self->{publicID} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getWorkflowStatusDescription {
	my $self = shift;
	return $self->{workflowStatusDescription};
}

sub setWorkflowStatusDescription {
	my $self = shift;
	$self->{workflowStatusDescription} = shift;
}

sub getVersion {
	my $self = shift;
	return $self->{version};
}

sub setVersion {
	my $self = shift;
	$self->{version} = shift;
}

sub getUnresolvedIssue {
	my $self = shift;
	return $self->{unresolvedIssue};
}

sub setUnresolvedIssue {
	my $self = shift;
	$self->{unresolvedIssue} = shift;
}

sub getRegistrationStatus {
	my $self = shift;
	return $self->{registrationStatus};
}

sub setRegistrationStatus {
	my $self = shift;
	$self->{registrationStatus} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getEndDate {
	my $self = shift;
	return $self->{endDate};
}

sub setEndDate {
	my $self = shift;
	$self->{endDate} = shift;
}

sub getDeletedIndicator {
	my $self = shift;
	return $self->{deletedIndicator};
}

sub setDeletedIndicator {
	my $self = shift;
	$self->{deletedIndicator} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getValueDomain {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ValueDomain", $self);
	return $results[0];
}

sub getInstructionCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::Instruction", $self);
	return @results;
}

sub getValidValueCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ValidValue", $self);
	return @results;
}

sub getDataElement {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::DataElement", $self);
	return $results[0];
}

sub getModule {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::Module", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::EnumeratedValueDomain;

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

# create an instance of the EnumeratedValueDomain object
# returns: a EnumeratedValueDomain object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new EnumeratedValueDomain\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this EnumeratedValueDomain intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:EnumeratedValueDomainImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# datatypeName;
	if( defined( $self->getDatatypeName ) ) {
		$tmpstr = "<datatypeName xsi:type=\"xsd:string\">" . $self->getDatatypeName . "</datatypeName>";
	} else {
		$tmpstr = "<datatypeName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# decimalPlace;
	if( defined( $self->getDecimalPlace ) ) {
		$tmpstr = "<decimalPlace xsi:type=\"xsd:int\">" . $self->getDecimalPlace . "</decimalPlace>";
	} else {
		$tmpstr = "<decimalPlace xsi:type=\"xsd:int\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# highValueNumber;
	if( defined( $self->getHighValueNumber ) ) {
		$tmpstr = "<highValueNumber xsi:type=\"xsd:string\">" . $self->getHighValueNumber . "</highValueNumber>";
	} else {
		$tmpstr = "<highValueNumber xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# minimumLengthNumber;
	if( defined( $self->getMinimumLengthNumber ) ) {
		$tmpstr = "<minimumLengthNumber xsi:type=\"xsd:int\">" . $self->getMinimumLengthNumber . "</minimumLengthNumber>";
	} else {
		$tmpstr = "<minimumLengthNumber xsi:type=\"xsd:int\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# formatName;
	if( defined( $self->getFormatName ) ) {
		$tmpstr = "<formatName xsi:type=\"xsd:string\">" . $self->getFormatName . "</formatName>";
	} else {
		$tmpstr = "<formatName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# lowValueNumber;
	if( defined( $self->getLowValueNumber ) ) {
		$tmpstr = "<lowValueNumber xsi:type=\"xsd:string\">" . $self->getLowValueNumber . "</lowValueNumber>";
	} else {
		$tmpstr = "<lowValueNumber xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# characterSetName;
	if( defined( $self->getCharacterSetName ) ) {
		$tmpstr = "<characterSetName xsi:type=\"xsd:string\">" . $self->getCharacterSetName . "</characterSetName>";
	} else {
		$tmpstr = "<characterSetName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# UOMName;
	if( defined( $self->getUOMName ) ) {
		$tmpstr = "<UOMName xsi:type=\"xsd:string\">" . $self->getUOMName . "</UOMName>";
	} else {
		$tmpstr = "<UOMName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# maximumLengthNumber;
	if( defined( $self->getMaximumLengthNumber ) ) {
		$tmpstr = "<maximumLengthNumber xsi:type=\"xsd:int\">" . $self->getMaximumLengthNumber . "</maximumLengthNumber>";
	} else {
		$tmpstr = "<maximumLengthNumber xsi:type=\"xsd:int\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# beginDate;
	if( defined( $self->getBeginDate ) ) {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\">" . $self->getBeginDate . "</beginDate>";
	} else {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusName;
	if( defined( $self->getWorkflowStatusName ) ) {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\">" . $self->getWorkflowStatusName . "</workflowStatusName>";
	} else {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# changeNote;
	if( defined( $self->getChangeNote ) ) {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\">" . $self->getChangeNote . "</changeNote>";
	} else {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# origin;
	if( defined( $self->getOrigin ) ) {
		$tmpstr = "<origin xsi:type=\"xsd:string\">" . $self->getOrigin . "</origin>";
	} else {
		$tmpstr = "<origin xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# latestVersionIndicator;
	if( defined( $self->getLatestVersionIndicator ) ) {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\">" . $self->getLatestVersionIndicator . "</latestVersionIndicator>";
	} else {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# longName;
	if( defined( $self->getLongName ) ) {
		$tmpstr = "<longName xsi:type=\"xsd:string\">" . $self->getLongName . "</longName>";
	} else {
		$tmpstr = "<longName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredName;
	if( defined( $self->getPreferredName ) ) {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\">" . $self->getPreferredName . "</preferredName>";
	} else {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredDefinition;
	if( defined( $self->getPreferredDefinition ) ) {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\">" . $self->getPreferredDefinition . "</preferredDefinition>";
	} else {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# publicID;
	if( defined( $self->getPublicID ) ) {
		$tmpstr = "<publicID xsi:type=\"xsd:long\">" . $self->getPublicID . "</publicID>";
	} else {
		$tmpstr = "<publicID xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusDescription;
	if( defined( $self->getWorkflowStatusDescription ) ) {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\">" . $self->getWorkflowStatusDescription . "</workflowStatusDescription>";
	} else {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# version;
	if( defined( $self->getVersion ) ) {
		$tmpstr = "<version xsi:type=\"xsd:float\">" . $self->getVersion . "</version>";
	} else {
		$tmpstr = "<version xsi:type=\"xsd:float\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# unresolvedIssue;
	if( defined( $self->getUnresolvedIssue ) ) {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\">" . $self->getUnresolvedIssue . "</unresolvedIssue>";
	} else {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# registrationStatus;
	if( defined( $self->getRegistrationStatus ) ) {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\">" . $self->getRegistrationStatus . "</registrationStatus>";
	} else {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# endDate;
	if( defined( $self->getEndDate ) ) {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\">" . $self->getEndDate . "</endDate>";
	} else {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# deletedIndicator;
	if( defined( $self->getDeletedIndicator ) ) {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\">" . $self->getDeletedIndicator . "</deletedIndicator>";
	} else {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of EnumeratedValueDomain objects
# param: xml doc
# returns: list of EnumeratedValueDomain objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @EnumeratedValueDomainNodes = $root->getChildNodes;
	my $EnumeratedValueDomainLength = $#EnumeratedValueDomainNodes;
	#print "total bean count = $EnumeratedValueDomainLength\n";
	
	# parse all EnumeratedValueDomain nodes
	my @obj_list = ();
	foreach my $EnumeratedValueDomainNode (@EnumeratedValueDomainNodes) {
		#print "\tEnumeratedValueDomain\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $datatypeName;
		my $decimalPlace;
		my $highValueNumber;
		my $minimumLengthNumber;
		my $formatName;
		my $lowValueNumber;
		my $characterSetName;
		my $UOMName;
		my $maximumLengthNumber;
		my $modifiedBy;
		my $beginDate;
		my $workflowStatusName;
		my $changeNote;
		my $origin;
		my $dateCreated;
		my $latestVersionIndicator;
		my $longName;
		my $preferredName;
		my $preferredDefinition;
		my $publicID;
		my $createdBy;
		my $workflowStatusDescription;
		my $version;
		my $unresolvedIssue;
		my $registrationStatus;
		my $dateModified;
		my $endDate;
		my $deletedIndicator;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($EnumeratedValueDomainNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "datatypeName") {
				$datatypeName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "decimalPlace") {
				$decimalPlace=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "highValueNumber") {
				$highValueNumber=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "minimumLengthNumber") {
				$minimumLengthNumber=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "formatName") {
				$formatName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "lowValueNumber") {
				$lowValueNumber=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "characterSetName") {
				$characterSetName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "UOMName") {
				$UOMName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "maximumLengthNumber") {
				$maximumLengthNumber=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "beginDate") {
				$beginDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusName") {
				$workflowStatusName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "changeNote") {
				$changeNote=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "origin") {
				$origin=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "latestVersionIndicator") {
				$latestVersionIndicator=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "longName") {
				$longName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredName") {
				$preferredName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredDefinition") {
				$preferredDefinition=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "publicID") {
				$publicID=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusDescription") {
				$workflowStatusDescription=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "version") {
				$version=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "unresolvedIssue") {
				$unresolvedIssue=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "registrationStatus") {
				$registrationStatus=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "endDate") {
				$endDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "deletedIndicator") {
				$deletedIndicator=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::EnumeratedValueDomain;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setDatatypeName($datatypeName);
		$newobj->setDecimalPlace($decimalPlace);
		$newobj->setHighValueNumber($highValueNumber);
		$newobj->setMinimumLengthNumber($minimumLengthNumber);
		$newobj->setFormatName($formatName);
		$newobj->setLowValueNumber($lowValueNumber);
		$newobj->setCharacterSetName($characterSetName);
		$newobj->setUOMName($UOMName);
		$newobj->setMaximumLengthNumber($maximumLengthNumber);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setBeginDate($beginDate);
		$newobj->setWorkflowStatusName($workflowStatusName);
		$newobj->setChangeNote($changeNote);
		$newobj->setOrigin($origin);
		$newobj->setDateCreated($dateCreated);
		$newobj->setLatestVersionIndicator($latestVersionIndicator);
		$newobj->setLongName($longName);
		$newobj->setPreferredName($preferredName);
		$newobj->setPreferredDefinition($preferredDefinition);
		$newobj->setPublicID($publicID);
		$newobj->setCreatedBy($createdBy);
		$newobj->setWorkflowStatusDescription($workflowStatusDescription);
		$newobj->setVersion($version);
		$newobj->setUnresolvedIssue($unresolvedIssue);
		$newobj->setRegistrationStatus($registrationStatus);
		$newobj->setDateModified($dateModified);
		$newobj->setEndDate($endDate);
		$newobj->setDeletedIndicator($deletedIndicator);
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

sub getDatatypeName {
	my $self = shift;
	return $self->{datatypeName};
}

sub setDatatypeName {
	my $self = shift;
	$self->{datatypeName} = shift;
}

sub getDecimalPlace {
	my $self = shift;
	return $self->{decimalPlace};
}

sub setDecimalPlace {
	my $self = shift;
	$self->{decimalPlace} = shift;
}

sub getHighValueNumber {
	my $self = shift;
	return $self->{highValueNumber};
}

sub setHighValueNumber {
	my $self = shift;
	$self->{highValueNumber} = shift;
}

sub getMinimumLengthNumber {
	my $self = shift;
	return $self->{minimumLengthNumber};
}

sub setMinimumLengthNumber {
	my $self = shift;
	$self->{minimumLengthNumber} = shift;
}

sub getFormatName {
	my $self = shift;
	return $self->{formatName};
}

sub setFormatName {
	my $self = shift;
	$self->{formatName} = shift;
}

sub getLowValueNumber {
	my $self = shift;
	return $self->{lowValueNumber};
}

sub setLowValueNumber {
	my $self = shift;
	$self->{lowValueNumber} = shift;
}

sub getCharacterSetName {
	my $self = shift;
	return $self->{characterSetName};
}

sub setCharacterSetName {
	my $self = shift;
	$self->{characterSetName} = shift;
}

sub getUOMName {
	my $self = shift;
	return $self->{UOMName};
}

sub setUOMName {
	my $self = shift;
	$self->{UOMName} = shift;
}

sub getMaximumLengthNumber {
	my $self = shift;
	return $self->{maximumLengthNumber};
}

sub setMaximumLengthNumber {
	my $self = shift;
	$self->{maximumLengthNumber} = shift;
}

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getBeginDate {
	my $self = shift;
	return $self->{beginDate};
}

sub setBeginDate {
	my $self = shift;
	$self->{beginDate} = shift;
}

sub getWorkflowStatusName {
	my $self = shift;
	return $self->{workflowStatusName};
}

sub setWorkflowStatusName {
	my $self = shift;
	$self->{workflowStatusName} = shift;
}

sub getChangeNote {
	my $self = shift;
	return $self->{changeNote};
}

sub setChangeNote {
	my $self = shift;
	$self->{changeNote} = shift;
}

sub getOrigin {
	my $self = shift;
	return $self->{origin};
}

sub setOrigin {
	my $self = shift;
	$self->{origin} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

sub getLatestVersionIndicator {
	my $self = shift;
	return $self->{latestVersionIndicator};
}

sub setLatestVersionIndicator {
	my $self = shift;
	$self->{latestVersionIndicator} = shift;
}

sub getLongName {
	my $self = shift;
	return $self->{longName};
}

sub setLongName {
	my $self = shift;
	$self->{longName} = shift;
}

sub getPreferredName {
	my $self = shift;
	return $self->{preferredName};
}

sub setPreferredName {
	my $self = shift;
	$self->{preferredName} = shift;
}

sub getPreferredDefinition {
	my $self = shift;
	return $self->{preferredDefinition};
}

sub setPreferredDefinition {
	my $self = shift;
	$self->{preferredDefinition} = shift;
}

sub getPublicID {
	my $self = shift;
	return $self->{publicID};
}

sub setPublicID {
	my $self = shift;
	$self->{publicID} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getWorkflowStatusDescription {
	my $self = shift;
	return $self->{workflowStatusDescription};
}

sub setWorkflowStatusDescription {
	my $self = shift;
	$self->{workflowStatusDescription} = shift;
}

sub getVersion {
	my $self = shift;
	return $self->{version};
}

sub setVersion {
	my $self = shift;
	$self->{version} = shift;
}

sub getUnresolvedIssue {
	my $self = shift;
	return $self->{unresolvedIssue};
}

sub setUnresolvedIssue {
	my $self = shift;
	$self->{unresolvedIssue} = shift;
}

sub getRegistrationStatus {
	my $self = shift;
	return $self->{registrationStatus};
}

sub setRegistrationStatus {
	my $self = shift;
	$self->{registrationStatus} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getEndDate {
	my $self = shift;
	return $self->{endDate};
}

sub setEndDate {
	my $self = shift;
	$self->{endDate} = shift;
}

sub getDeletedIndicator {
	my $self = shift;
	return $self->{deletedIndicator};
}

sub setDeletedIndicator {
	my $self = shift;
	$self->{deletedIndicator} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getValueDomainPermissibleValueCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ValueDomainPermissibleValue", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::Concept;

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

# create an instance of the Concept object
# returns: a Concept object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Concept\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Concept intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:ConceptImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# definitionSource;
	if( defined( $self->getDefinitionSource ) ) {
		$tmpstr = "<definitionSource xsi:type=\"xsd:string\">" . $self->getDefinitionSource . "</definitionSource>";
	} else {
		$tmpstr = "<definitionSource xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# evsSource;
	if( defined( $self->getEvsSource ) ) {
		$tmpstr = "<evsSource xsi:type=\"xsd:string\">" . $self->getEvsSource . "</evsSource>";
	} else {
		$tmpstr = "<evsSource xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# beginDate;
	if( defined( $self->getBeginDate ) ) {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\">" . $self->getBeginDate . "</beginDate>";
	} else {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusName;
	if( defined( $self->getWorkflowStatusName ) ) {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\">" . $self->getWorkflowStatusName . "</workflowStatusName>";
	} else {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# changeNote;
	if( defined( $self->getChangeNote ) ) {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\">" . $self->getChangeNote . "</changeNote>";
	} else {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# origin;
	if( defined( $self->getOrigin ) ) {
		$tmpstr = "<origin xsi:type=\"xsd:string\">" . $self->getOrigin . "</origin>";
	} else {
		$tmpstr = "<origin xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# latestVersionIndicator;
	if( defined( $self->getLatestVersionIndicator ) ) {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\">" . $self->getLatestVersionIndicator . "</latestVersionIndicator>";
	} else {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# longName;
	if( defined( $self->getLongName ) ) {
		$tmpstr = "<longName xsi:type=\"xsd:string\">" . $self->getLongName . "</longName>";
	} else {
		$tmpstr = "<longName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredName;
	if( defined( $self->getPreferredName ) ) {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\">" . $self->getPreferredName . "</preferredName>";
	} else {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredDefinition;
	if( defined( $self->getPreferredDefinition ) ) {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\">" . $self->getPreferredDefinition . "</preferredDefinition>";
	} else {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# publicID;
	if( defined( $self->getPublicID ) ) {
		$tmpstr = "<publicID xsi:type=\"xsd:long\">" . $self->getPublicID . "</publicID>";
	} else {
		$tmpstr = "<publicID xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusDescription;
	if( defined( $self->getWorkflowStatusDescription ) ) {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\">" . $self->getWorkflowStatusDescription . "</workflowStatusDescription>";
	} else {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# version;
	if( defined( $self->getVersion ) ) {
		$tmpstr = "<version xsi:type=\"xsd:float\">" . $self->getVersion . "</version>";
	} else {
		$tmpstr = "<version xsi:type=\"xsd:float\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# unresolvedIssue;
	if( defined( $self->getUnresolvedIssue ) ) {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\">" . $self->getUnresolvedIssue . "</unresolvedIssue>";
	} else {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# registrationStatus;
	if( defined( $self->getRegistrationStatus ) ) {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\">" . $self->getRegistrationStatus . "</registrationStatus>";
	} else {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# endDate;
	if( defined( $self->getEndDate ) ) {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\">" . $self->getEndDate . "</endDate>";
	} else {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# deletedIndicator;
	if( defined( $self->getDeletedIndicator ) ) {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\">" . $self->getDeletedIndicator . "</deletedIndicator>";
	} else {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of Concept objects
# param: xml doc
# returns: list of Concept objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @ConceptNodes = $root->getChildNodes;
	my $ConceptLength = $#ConceptNodes;
	#print "total bean count = $ConceptLength\n";
	
	# parse all Concept nodes
	my @obj_list = ();
	foreach my $ConceptNode (@ConceptNodes) {
		#print "\tConcept\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $definitionSource;
		my $evsSource;
		my $modifiedBy;
		my $beginDate;
		my $workflowStatusName;
		my $changeNote;
		my $origin;
		my $dateCreated;
		my $latestVersionIndicator;
		my $longName;
		my $preferredName;
		my $preferredDefinition;
		my $publicID;
		my $createdBy;
		my $workflowStatusDescription;
		my $version;
		my $unresolvedIssue;
		my $registrationStatus;
		my $dateModified;
		my $endDate;
		my $deletedIndicator;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($ConceptNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "definitionSource") {
				$definitionSource=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "evsSource") {
				$evsSource=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "beginDate") {
				$beginDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusName") {
				$workflowStatusName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "changeNote") {
				$changeNote=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "origin") {
				$origin=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "latestVersionIndicator") {
				$latestVersionIndicator=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "longName") {
				$longName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredName") {
				$preferredName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredDefinition") {
				$preferredDefinition=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "publicID") {
				$publicID=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusDescription") {
				$workflowStatusDescription=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "version") {
				$version=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "unresolvedIssue") {
				$unresolvedIssue=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "registrationStatus") {
				$registrationStatus=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "endDate") {
				$endDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "deletedIndicator") {
				$deletedIndicator=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::Concept;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setDefinitionSource($definitionSource);
		$newobj->setEvsSource($evsSource);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setBeginDate($beginDate);
		$newobj->setWorkflowStatusName($workflowStatusName);
		$newobj->setChangeNote($changeNote);
		$newobj->setOrigin($origin);
		$newobj->setDateCreated($dateCreated);
		$newobj->setLatestVersionIndicator($latestVersionIndicator);
		$newobj->setLongName($longName);
		$newobj->setPreferredName($preferredName);
		$newobj->setPreferredDefinition($preferredDefinition);
		$newobj->setPublicID($publicID);
		$newobj->setCreatedBy($createdBy);
		$newobj->setWorkflowStatusDescription($workflowStatusDescription);
		$newobj->setVersion($version);
		$newobj->setUnresolvedIssue($unresolvedIssue);
		$newobj->setRegistrationStatus($registrationStatus);
		$newobj->setDateModified($dateModified);
		$newobj->setEndDate($endDate);
		$newobj->setDeletedIndicator($deletedIndicator);
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

sub getDefinitionSource {
	my $self = shift;
	return $self->{definitionSource};
}

sub setDefinitionSource {
	my $self = shift;
	$self->{definitionSource} = shift;
}

sub getEvsSource {
	my $self = shift;
	return $self->{evsSource};
}

sub setEvsSource {
	my $self = shift;
	$self->{evsSource} = shift;
}

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getBeginDate {
	my $self = shift;
	return $self->{beginDate};
}

sub setBeginDate {
	my $self = shift;
	$self->{beginDate} = shift;
}

sub getWorkflowStatusName {
	my $self = shift;
	return $self->{workflowStatusName};
}

sub setWorkflowStatusName {
	my $self = shift;
	$self->{workflowStatusName} = shift;
}

sub getChangeNote {
	my $self = shift;
	return $self->{changeNote};
}

sub setChangeNote {
	my $self = shift;
	$self->{changeNote} = shift;
}

sub getOrigin {
	my $self = shift;
	return $self->{origin};
}

sub setOrigin {
	my $self = shift;
	$self->{origin} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

sub getLatestVersionIndicator {
	my $self = shift;
	return $self->{latestVersionIndicator};
}

sub setLatestVersionIndicator {
	my $self = shift;
	$self->{latestVersionIndicator} = shift;
}

sub getLongName {
	my $self = shift;
	return $self->{longName};
}

sub setLongName {
	my $self = shift;
	$self->{longName} = shift;
}

sub getPreferredName {
	my $self = shift;
	return $self->{preferredName};
}

sub setPreferredName {
	my $self = shift;
	$self->{preferredName} = shift;
}

sub getPreferredDefinition {
	my $self = shift;
	return $self->{preferredDefinition};
}

sub setPreferredDefinition {
	my $self = shift;
	$self->{preferredDefinition} = shift;
}

sub getPublicID {
	my $self = shift;
	return $self->{publicID};
}

sub setPublicID {
	my $self = shift;
	$self->{publicID} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getWorkflowStatusDescription {
	my $self = shift;
	return $self->{workflowStatusDescription};
}

sub setWorkflowStatusDescription {
	my $self = shift;
	$self->{workflowStatusDescription} = shift;
}

sub getVersion {
	my $self = shift;
	return $self->{version};
}

sub setVersion {
	my $self = shift;
	$self->{version} = shift;
}

sub getUnresolvedIssue {
	my $self = shift;
	return $self->{unresolvedIssue};
}

sub setUnresolvedIssue {
	my $self = shift;
	$self->{unresolvedIssue} = shift;
}

sub getRegistrationStatus {
	my $self = shift;
	return $self->{registrationStatus};
}

sub setRegistrationStatus {
	my $self = shift;
	$self->{registrationStatus} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getEndDate {
	my $self = shift;
	return $self->{endDate};
}

sub setEndDate {
	my $self = shift;
	$self->{endDate} = shift;
}

sub getDeletedIndicator {
	my $self = shift;
	return $self->{deletedIndicator};
}

sub setDeletedIndicator {
	my $self = shift;
	$self->{deletedIndicator} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getValueDomainPermissibleValueCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ValueDomainPermissibleValue", $self);
	return @results;
}

sub getComponentConceptCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ComponentConcept", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::ValueDomainPermissibleValue;

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

# create an instance of the ValueDomainPermissibleValue object
# returns: a ValueDomainPermissibleValue object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new ValueDomainPermissibleValue\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this ValueDomainPermissibleValue intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:ValueDomainPermissibleValueImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# beginDate;
	if( defined( $self->getBeginDate ) ) {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\">" . $self->getBeginDate . "</beginDate>";
	} else {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# origin;
	if( defined( $self->getOrigin ) ) {
		$tmpstr = "<origin xsi:type=\"xsd:string\">" . $self->getOrigin . "</origin>";
	} else {
		$tmpstr = "<origin xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# endDate;
	if( defined( $self->getEndDate ) ) {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\">" . $self->getEndDate . "</endDate>";
	} else {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of ValueDomainPermissibleValue objects
# param: xml doc
# returns: list of ValueDomainPermissibleValue objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @ValueDomainPermissibleValueNodes = $root->getChildNodes;
	my $ValueDomainPermissibleValueLength = $#ValueDomainPermissibleValueNodes;
	#print "total bean count = $ValueDomainPermissibleValueLength\n";
	
	# parse all ValueDomainPermissibleValue nodes
	my @obj_list = ();
	foreach my $ValueDomainPermissibleValueNode (@ValueDomainPermissibleValueNodes) {
		#print "\tValueDomainPermissibleValue\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $modifiedBy;
		my $beginDate;
		my $createdBy;
		my $origin;
		my $dateCreated;
		my $dateModified;
		my $endDate;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($ValueDomainPermissibleValueNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "beginDate") {
				$beginDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "origin") {
				$origin=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "endDate") {
				$endDate=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::ValueDomainPermissibleValue;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setBeginDate($beginDate);
		$newobj->setCreatedBy($createdBy);
		$newobj->setOrigin($origin);
		$newobj->setDateCreated($dateCreated);
		$newobj->setDateModified($dateModified);
		$newobj->setEndDate($endDate);
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

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getBeginDate {
	my $self = shift;
	return $self->{beginDate};
}

sub setBeginDate {
	my $self = shift;
	$self->{beginDate} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getOrigin {
	my $self = shift;
	return $self->{origin};
}

sub setOrigin {
	my $self = shift;
	$self->{origin} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getEndDate {
	my $self = shift;
	return $self->{endDate};
}

sub setEndDate {
	my $self = shift;
	$self->{endDate} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getEnumeratedValueDomain {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::EnumeratedValueDomain", $self);
	return $results[0];
}

sub getConcept {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::Concept", $self);
	return $results[0];
}

sub getPermissibleValue {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::PermissibleValue", $self);
	return $results[0];
}

sub getValidValueCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ValidValue", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::ValidValue;

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

# create an instance of the ValidValue object
# returns: a ValidValue object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new ValidValue\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this ValidValue intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:ValidValueImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# displayOrder;
	if( defined( $self->getDisplayOrder ) ) {
		$tmpstr = "<displayOrder xsi:type=\"xsd:int\">" . $self->getDisplayOrder . "</displayOrder>";
	} else {
		$tmpstr = "<displayOrder xsi:type=\"xsd:int\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# beginDate;
	if( defined( $self->getBeginDate ) ) {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\">" . $self->getBeginDate . "</beginDate>";
	} else {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusName;
	if( defined( $self->getWorkflowStatusName ) ) {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\">" . $self->getWorkflowStatusName . "</workflowStatusName>";
	} else {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# changeNote;
	if( defined( $self->getChangeNote ) ) {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\">" . $self->getChangeNote . "</changeNote>";
	} else {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# origin;
	if( defined( $self->getOrigin ) ) {
		$tmpstr = "<origin xsi:type=\"xsd:string\">" . $self->getOrigin . "</origin>";
	} else {
		$tmpstr = "<origin xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# latestVersionIndicator;
	if( defined( $self->getLatestVersionIndicator ) ) {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\">" . $self->getLatestVersionIndicator . "</latestVersionIndicator>";
	} else {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# longName;
	if( defined( $self->getLongName ) ) {
		$tmpstr = "<longName xsi:type=\"xsd:string\">" . $self->getLongName . "</longName>";
	} else {
		$tmpstr = "<longName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredName;
	if( defined( $self->getPreferredName ) ) {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\">" . $self->getPreferredName . "</preferredName>";
	} else {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredDefinition;
	if( defined( $self->getPreferredDefinition ) ) {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\">" . $self->getPreferredDefinition . "</preferredDefinition>";
	} else {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# publicID;
	if( defined( $self->getPublicID ) ) {
		$tmpstr = "<publicID xsi:type=\"xsd:long\">" . $self->getPublicID . "</publicID>";
	} else {
		$tmpstr = "<publicID xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusDescription;
	if( defined( $self->getWorkflowStatusDescription ) ) {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\">" . $self->getWorkflowStatusDescription . "</workflowStatusDescription>";
	} else {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# version;
	if( defined( $self->getVersion ) ) {
		$tmpstr = "<version xsi:type=\"xsd:float\">" . $self->getVersion . "</version>";
	} else {
		$tmpstr = "<version xsi:type=\"xsd:float\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# unresolvedIssue;
	if( defined( $self->getUnresolvedIssue ) ) {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\">" . $self->getUnresolvedIssue . "</unresolvedIssue>";
	} else {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# registrationStatus;
	if( defined( $self->getRegistrationStatus ) ) {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\">" . $self->getRegistrationStatus . "</registrationStatus>";
	} else {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# endDate;
	if( defined( $self->getEndDate ) ) {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\">" . $self->getEndDate . "</endDate>";
	} else {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# deletedIndicator;
	if( defined( $self->getDeletedIndicator ) ) {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\">" . $self->getDeletedIndicator . "</deletedIndicator>";
	} else {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of ValidValue objects
# param: xml doc
# returns: list of ValidValue objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @ValidValueNodes = $root->getChildNodes;
	my $ValidValueLength = $#ValidValueNodes;
	#print "total bean count = $ValidValueLength\n";
	
	# parse all ValidValue nodes
	my @obj_list = ();
	foreach my $ValidValueNode (@ValidValueNodes) {
		#print "\tValidValue\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $displayOrder;
		my $modifiedBy;
		my $beginDate;
		my $workflowStatusName;
		my $changeNote;
		my $origin;
		my $dateCreated;
		my $latestVersionIndicator;
		my $longName;
		my $preferredName;
		my $preferredDefinition;
		my $publicID;
		my $createdBy;
		my $workflowStatusDescription;
		my $version;
		my $unresolvedIssue;
		my $registrationStatus;
		my $dateModified;
		my $endDate;
		my $deletedIndicator;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($ValidValueNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "displayOrder") {
				$displayOrder=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "beginDate") {
				$beginDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusName") {
				$workflowStatusName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "changeNote") {
				$changeNote=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "origin") {
				$origin=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "latestVersionIndicator") {
				$latestVersionIndicator=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "longName") {
				$longName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredName") {
				$preferredName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredDefinition") {
				$preferredDefinition=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "publicID") {
				$publicID=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusDescription") {
				$workflowStatusDescription=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "version") {
				$version=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "unresolvedIssue") {
				$unresolvedIssue=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "registrationStatus") {
				$registrationStatus=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "endDate") {
				$endDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "deletedIndicator") {
				$deletedIndicator=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::ValidValue;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setDisplayOrder($displayOrder);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setBeginDate($beginDate);
		$newobj->setWorkflowStatusName($workflowStatusName);
		$newobj->setChangeNote($changeNote);
		$newobj->setOrigin($origin);
		$newobj->setDateCreated($dateCreated);
		$newobj->setLatestVersionIndicator($latestVersionIndicator);
		$newobj->setLongName($longName);
		$newobj->setPreferredName($preferredName);
		$newobj->setPreferredDefinition($preferredDefinition);
		$newobj->setPublicID($publicID);
		$newobj->setCreatedBy($createdBy);
		$newobj->setWorkflowStatusDescription($workflowStatusDescription);
		$newobj->setVersion($version);
		$newobj->setUnresolvedIssue($unresolvedIssue);
		$newobj->setRegistrationStatus($registrationStatus);
		$newobj->setDateModified($dateModified);
		$newobj->setEndDate($endDate);
		$newobj->setDeletedIndicator($deletedIndicator);
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

sub getDisplayOrder {
	my $self = shift;
	return $self->{displayOrder};
}

sub setDisplayOrder {
	my $self = shift;
	$self->{displayOrder} = shift;
}

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getBeginDate {
	my $self = shift;
	return $self->{beginDate};
}

sub setBeginDate {
	my $self = shift;
	$self->{beginDate} = shift;
}

sub getWorkflowStatusName {
	my $self = shift;
	return $self->{workflowStatusName};
}

sub setWorkflowStatusName {
	my $self = shift;
	$self->{workflowStatusName} = shift;
}

sub getChangeNote {
	my $self = shift;
	return $self->{changeNote};
}

sub setChangeNote {
	my $self = shift;
	$self->{changeNote} = shift;
}

sub getOrigin {
	my $self = shift;
	return $self->{origin};
}

sub setOrigin {
	my $self = shift;
	$self->{origin} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

sub getLatestVersionIndicator {
	my $self = shift;
	return $self->{latestVersionIndicator};
}

sub setLatestVersionIndicator {
	my $self = shift;
	$self->{latestVersionIndicator} = shift;
}

sub getLongName {
	my $self = shift;
	return $self->{longName};
}

sub setLongName {
	my $self = shift;
	$self->{longName} = shift;
}

sub getPreferredName {
	my $self = shift;
	return $self->{preferredName};
}

sub setPreferredName {
	my $self = shift;
	$self->{preferredName} = shift;
}

sub getPreferredDefinition {
	my $self = shift;
	return $self->{preferredDefinition};
}

sub setPreferredDefinition {
	my $self = shift;
	$self->{preferredDefinition} = shift;
}

sub getPublicID {
	my $self = shift;
	return $self->{publicID};
}

sub setPublicID {
	my $self = shift;
	$self->{publicID} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getWorkflowStatusDescription {
	my $self = shift;
	return $self->{workflowStatusDescription};
}

sub setWorkflowStatusDescription {
	my $self = shift;
	$self->{workflowStatusDescription} = shift;
}

sub getVersion {
	my $self = shift;
	return $self->{version};
}

sub setVersion {
	my $self = shift;
	$self->{version} = shift;
}

sub getUnresolvedIssue {
	my $self = shift;
	return $self->{unresolvedIssue};
}

sub setUnresolvedIssue {
	my $self = shift;
	$self->{unresolvedIssue} = shift;
}

sub getRegistrationStatus {
	my $self = shift;
	return $self->{registrationStatus};
}

sub setRegistrationStatus {
	my $self = shift;
	$self->{registrationStatus} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getEndDate {
	my $self = shift;
	return $self->{endDate};
}

sub setEndDate {
	my $self = shift;
	$self->{endDate} = shift;
}

sub getDeletedIndicator {
	my $self = shift;
	return $self->{deletedIndicator};
}

sub setDeletedIndicator {
	my $self = shift;
	$self->{deletedIndicator} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getInstructionCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::Instruction", $self);
	return @results;
}

sub getValueDomainPermissibleValue {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ValueDomainPermissibleValue", $self);
	return $results[0];
}

sub getQuestion {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::Question", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::Designation;

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

# create an instance of the Designation object
# returns: a Designation object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Designation\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Designation intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:DesignationImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# languageName;
	if( defined( $self->getLanguageName ) ) {
		$tmpstr = "<languageName xsi:type=\"xsd:string\">" . $self->getLanguageName . "</languageName>";
	} else {
		$tmpstr = "<languageName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# type;
	if( defined( $self->getType ) ) {
		$tmpstr = "<type xsi:type=\"xsd:string\">" . $self->getType . "</type>";
	} else {
		$tmpstr = "<type xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of Designation objects
# param: xml doc
# returns: list of Designation objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @DesignationNodes = $root->getChildNodes;
	my $DesignationLength = $#DesignationNodes;
	#print "total bean count = $DesignationLength\n";
	
	# parse all Designation nodes
	my @obj_list = ();
	foreach my $DesignationNode (@DesignationNodes) {
		#print "\tDesignation\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $languageName;
		my $modifiedBy;
		my $type;
		my $dateModified;
		my $createdBy;
		my $name;
		my $dateCreated;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($DesignationNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "languageName") {
				$languageName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "type") {
				$type=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::Designation;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setLanguageName($languageName);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setType($type);
		$newobj->setDateModified($dateModified);
		$newobj->setCreatedBy($createdBy);
		$newobj->setName($name);
		$newobj->setDateCreated($dateCreated);
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

sub getLanguageName {
	my $self = shift;
	return $self->{languageName};
}

sub setLanguageName {
	my $self = shift;
	$self->{languageName} = shift;
}

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getType {
	my $self = shift;
	return $self->{type};
}

sub setType {
	my $self = shift;
	$self->{type} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getName {
	my $self = shift;
	return $self->{name};
}

sub setName {
	my $self = shift;
	$self->{name} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getContext {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::Context", $self);
	return $results[0];
}

sub getDesignationClassSchemeItemCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::DesignationClassSchemeItem", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::NonenumeratedValueDomain;

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

# create an instance of the NonenumeratedValueDomain object
# returns: a NonenumeratedValueDomain object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new NonenumeratedValueDomain\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this NonenumeratedValueDomain intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:NonenumeratedValueDomainImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# datatypeName;
	if( defined( $self->getDatatypeName ) ) {
		$tmpstr = "<datatypeName xsi:type=\"xsd:string\">" . $self->getDatatypeName . "</datatypeName>";
	} else {
		$tmpstr = "<datatypeName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# decimalPlace;
	if( defined( $self->getDecimalPlace ) ) {
		$tmpstr = "<decimalPlace xsi:type=\"xsd:int\">" . $self->getDecimalPlace . "</decimalPlace>";
	} else {
		$tmpstr = "<decimalPlace xsi:type=\"xsd:int\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# highValueNumber;
	if( defined( $self->getHighValueNumber ) ) {
		$tmpstr = "<highValueNumber xsi:type=\"xsd:string\">" . $self->getHighValueNumber . "</highValueNumber>";
	} else {
		$tmpstr = "<highValueNumber xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# minimumLengthNumber;
	if( defined( $self->getMinimumLengthNumber ) ) {
		$tmpstr = "<minimumLengthNumber xsi:type=\"xsd:int\">" . $self->getMinimumLengthNumber . "</minimumLengthNumber>";
	} else {
		$tmpstr = "<minimumLengthNumber xsi:type=\"xsd:int\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# formatName;
	if( defined( $self->getFormatName ) ) {
		$tmpstr = "<formatName xsi:type=\"xsd:string\">" . $self->getFormatName . "</formatName>";
	} else {
		$tmpstr = "<formatName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# lowValueNumber;
	if( defined( $self->getLowValueNumber ) ) {
		$tmpstr = "<lowValueNumber xsi:type=\"xsd:string\">" . $self->getLowValueNumber . "</lowValueNumber>";
	} else {
		$tmpstr = "<lowValueNumber xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# characterSetName;
	if( defined( $self->getCharacterSetName ) ) {
		$tmpstr = "<characterSetName xsi:type=\"xsd:string\">" . $self->getCharacterSetName . "</characterSetName>";
	} else {
		$tmpstr = "<characterSetName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# UOMName;
	if( defined( $self->getUOMName ) ) {
		$tmpstr = "<UOMName xsi:type=\"xsd:string\">" . $self->getUOMName . "</UOMName>";
	} else {
		$tmpstr = "<UOMName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# maximumLengthNumber;
	if( defined( $self->getMaximumLengthNumber ) ) {
		$tmpstr = "<maximumLengthNumber xsi:type=\"xsd:int\">" . $self->getMaximumLengthNumber . "</maximumLengthNumber>";
	} else {
		$tmpstr = "<maximumLengthNumber xsi:type=\"xsd:int\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# beginDate;
	if( defined( $self->getBeginDate ) ) {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\">" . $self->getBeginDate . "</beginDate>";
	} else {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusName;
	if( defined( $self->getWorkflowStatusName ) ) {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\">" . $self->getWorkflowStatusName . "</workflowStatusName>";
	} else {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# changeNote;
	if( defined( $self->getChangeNote ) ) {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\">" . $self->getChangeNote . "</changeNote>";
	} else {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# origin;
	if( defined( $self->getOrigin ) ) {
		$tmpstr = "<origin xsi:type=\"xsd:string\">" . $self->getOrigin . "</origin>";
	} else {
		$tmpstr = "<origin xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# latestVersionIndicator;
	if( defined( $self->getLatestVersionIndicator ) ) {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\">" . $self->getLatestVersionIndicator . "</latestVersionIndicator>";
	} else {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# longName;
	if( defined( $self->getLongName ) ) {
		$tmpstr = "<longName xsi:type=\"xsd:string\">" . $self->getLongName . "</longName>";
	} else {
		$tmpstr = "<longName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredName;
	if( defined( $self->getPreferredName ) ) {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\">" . $self->getPreferredName . "</preferredName>";
	} else {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredDefinition;
	if( defined( $self->getPreferredDefinition ) ) {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\">" . $self->getPreferredDefinition . "</preferredDefinition>";
	} else {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# publicID;
	if( defined( $self->getPublicID ) ) {
		$tmpstr = "<publicID xsi:type=\"xsd:long\">" . $self->getPublicID . "</publicID>";
	} else {
		$tmpstr = "<publicID xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusDescription;
	if( defined( $self->getWorkflowStatusDescription ) ) {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\">" . $self->getWorkflowStatusDescription . "</workflowStatusDescription>";
	} else {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# version;
	if( defined( $self->getVersion ) ) {
		$tmpstr = "<version xsi:type=\"xsd:float\">" . $self->getVersion . "</version>";
	} else {
		$tmpstr = "<version xsi:type=\"xsd:float\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# unresolvedIssue;
	if( defined( $self->getUnresolvedIssue ) ) {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\">" . $self->getUnresolvedIssue . "</unresolvedIssue>";
	} else {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# registrationStatus;
	if( defined( $self->getRegistrationStatus ) ) {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\">" . $self->getRegistrationStatus . "</registrationStatus>";
	} else {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# endDate;
	if( defined( $self->getEndDate ) ) {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\">" . $self->getEndDate . "</endDate>";
	} else {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# deletedIndicator;
	if( defined( $self->getDeletedIndicator ) ) {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\">" . $self->getDeletedIndicator . "</deletedIndicator>";
	} else {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of NonenumeratedValueDomain objects
# param: xml doc
# returns: list of NonenumeratedValueDomain objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @NonenumeratedValueDomainNodes = $root->getChildNodes;
	my $NonenumeratedValueDomainLength = $#NonenumeratedValueDomainNodes;
	#print "total bean count = $NonenumeratedValueDomainLength\n";
	
	# parse all NonenumeratedValueDomain nodes
	my @obj_list = ();
	foreach my $NonenumeratedValueDomainNode (@NonenumeratedValueDomainNodes) {
		#print "\tNonenumeratedValueDomain\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $datatypeName;
		my $decimalPlace;
		my $highValueNumber;
		my $minimumLengthNumber;
		my $formatName;
		my $lowValueNumber;
		my $characterSetName;
		my $UOMName;
		my $maximumLengthNumber;
		my $modifiedBy;
		my $beginDate;
		my $workflowStatusName;
		my $changeNote;
		my $origin;
		my $dateCreated;
		my $latestVersionIndicator;
		my $longName;
		my $preferredName;
		my $preferredDefinition;
		my $publicID;
		my $createdBy;
		my $workflowStatusDescription;
		my $version;
		my $unresolvedIssue;
		my $registrationStatus;
		my $dateModified;
		my $endDate;
		my $deletedIndicator;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($NonenumeratedValueDomainNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "datatypeName") {
				$datatypeName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "decimalPlace") {
				$decimalPlace=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "highValueNumber") {
				$highValueNumber=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "minimumLengthNumber") {
				$minimumLengthNumber=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "formatName") {
				$formatName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "lowValueNumber") {
				$lowValueNumber=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "characterSetName") {
				$characterSetName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "UOMName") {
				$UOMName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "maximumLengthNumber") {
				$maximumLengthNumber=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "beginDate") {
				$beginDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusName") {
				$workflowStatusName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "changeNote") {
				$changeNote=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "origin") {
				$origin=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "latestVersionIndicator") {
				$latestVersionIndicator=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "longName") {
				$longName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredName") {
				$preferredName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredDefinition") {
				$preferredDefinition=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "publicID") {
				$publicID=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusDescription") {
				$workflowStatusDescription=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "version") {
				$version=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "unresolvedIssue") {
				$unresolvedIssue=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "registrationStatus") {
				$registrationStatus=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "endDate") {
				$endDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "deletedIndicator") {
				$deletedIndicator=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::NonenumeratedValueDomain;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setDatatypeName($datatypeName);
		$newobj->setDecimalPlace($decimalPlace);
		$newobj->setHighValueNumber($highValueNumber);
		$newobj->setMinimumLengthNumber($minimumLengthNumber);
		$newobj->setFormatName($formatName);
		$newobj->setLowValueNumber($lowValueNumber);
		$newobj->setCharacterSetName($characterSetName);
		$newobj->setUOMName($UOMName);
		$newobj->setMaximumLengthNumber($maximumLengthNumber);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setBeginDate($beginDate);
		$newobj->setWorkflowStatusName($workflowStatusName);
		$newobj->setChangeNote($changeNote);
		$newobj->setOrigin($origin);
		$newobj->setDateCreated($dateCreated);
		$newobj->setLatestVersionIndicator($latestVersionIndicator);
		$newobj->setLongName($longName);
		$newobj->setPreferredName($preferredName);
		$newobj->setPreferredDefinition($preferredDefinition);
		$newobj->setPublicID($publicID);
		$newobj->setCreatedBy($createdBy);
		$newobj->setWorkflowStatusDescription($workflowStatusDescription);
		$newobj->setVersion($version);
		$newobj->setUnresolvedIssue($unresolvedIssue);
		$newobj->setRegistrationStatus($registrationStatus);
		$newobj->setDateModified($dateModified);
		$newobj->setEndDate($endDate);
		$newobj->setDeletedIndicator($deletedIndicator);
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

sub getDatatypeName {
	my $self = shift;
	return $self->{datatypeName};
}

sub setDatatypeName {
	my $self = shift;
	$self->{datatypeName} = shift;
}

sub getDecimalPlace {
	my $self = shift;
	return $self->{decimalPlace};
}

sub setDecimalPlace {
	my $self = shift;
	$self->{decimalPlace} = shift;
}

sub getHighValueNumber {
	my $self = shift;
	return $self->{highValueNumber};
}

sub setHighValueNumber {
	my $self = shift;
	$self->{highValueNumber} = shift;
}

sub getMinimumLengthNumber {
	my $self = shift;
	return $self->{minimumLengthNumber};
}

sub setMinimumLengthNumber {
	my $self = shift;
	$self->{minimumLengthNumber} = shift;
}

sub getFormatName {
	my $self = shift;
	return $self->{formatName};
}

sub setFormatName {
	my $self = shift;
	$self->{formatName} = shift;
}

sub getLowValueNumber {
	my $self = shift;
	return $self->{lowValueNumber};
}

sub setLowValueNumber {
	my $self = shift;
	$self->{lowValueNumber} = shift;
}

sub getCharacterSetName {
	my $self = shift;
	return $self->{characterSetName};
}

sub setCharacterSetName {
	my $self = shift;
	$self->{characterSetName} = shift;
}

sub getUOMName {
	my $self = shift;
	return $self->{UOMName};
}

sub setUOMName {
	my $self = shift;
	$self->{UOMName} = shift;
}

sub getMaximumLengthNumber {
	my $self = shift;
	return $self->{maximumLengthNumber};
}

sub setMaximumLengthNumber {
	my $self = shift;
	$self->{maximumLengthNumber} = shift;
}

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getBeginDate {
	my $self = shift;
	return $self->{beginDate};
}

sub setBeginDate {
	my $self = shift;
	$self->{beginDate} = shift;
}

sub getWorkflowStatusName {
	my $self = shift;
	return $self->{workflowStatusName};
}

sub setWorkflowStatusName {
	my $self = shift;
	$self->{workflowStatusName} = shift;
}

sub getChangeNote {
	my $self = shift;
	return $self->{changeNote};
}

sub setChangeNote {
	my $self = shift;
	$self->{changeNote} = shift;
}

sub getOrigin {
	my $self = shift;
	return $self->{origin};
}

sub setOrigin {
	my $self = shift;
	$self->{origin} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

sub getLatestVersionIndicator {
	my $self = shift;
	return $self->{latestVersionIndicator};
}

sub setLatestVersionIndicator {
	my $self = shift;
	$self->{latestVersionIndicator} = shift;
}

sub getLongName {
	my $self = shift;
	return $self->{longName};
}

sub setLongName {
	my $self = shift;
	$self->{longName} = shift;
}

sub getPreferredName {
	my $self = shift;
	return $self->{preferredName};
}

sub setPreferredName {
	my $self = shift;
	$self->{preferredName} = shift;
}

sub getPreferredDefinition {
	my $self = shift;
	return $self->{preferredDefinition};
}

sub setPreferredDefinition {
	my $self = shift;
	$self->{preferredDefinition} = shift;
}

sub getPublicID {
	my $self = shift;
	return $self->{publicID};
}

sub setPublicID {
	my $self = shift;
	$self->{publicID} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getWorkflowStatusDescription {
	my $self = shift;
	return $self->{workflowStatusDescription};
}

sub setWorkflowStatusDescription {
	my $self = shift;
	$self->{workflowStatusDescription} = shift;
}

sub getVersion {
	my $self = shift;
	return $self->{version};
}

sub setVersion {
	my $self = shift;
	$self->{version} = shift;
}

sub getUnresolvedIssue {
	my $self = shift;
	return $self->{unresolvedIssue};
}

sub setUnresolvedIssue {
	my $self = shift;
	$self->{unresolvedIssue} = shift;
}

sub getRegistrationStatus {
	my $self = shift;
	return $self->{registrationStatus};
}

sub setRegistrationStatus {
	my $self = shift;
	$self->{registrationStatus} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getEndDate {
	my $self = shift;
	return $self->{endDate};
}

sub setEndDate {
	my $self = shift;
	$self->{endDate} = shift;
}

sub getDeletedIndicator {
	my $self = shift;
	return $self->{deletedIndicator};
}

sub setDeletedIndicator {
	my $self = shift;
	$self->{deletedIndicator} = shift;
}

## end getters and setters ##

## begin bean association methods ##

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::DataElementConceptRelationship;

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

# create an instance of the DataElementConceptRelationship object
# returns: a DataElementConceptRelationship object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new DataElementConceptRelationship\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this DataElementConceptRelationship intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:DataElementConceptRelationshipImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# description;
	if( defined( $self->getDescription ) ) {
		$tmpstr = "<description xsi:type=\"xsd:string\">" . $self->getDescription . "</description>";
	} else {
		$tmpstr = "<description xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of DataElementConceptRelationship objects
# param: xml doc
# returns: list of DataElementConceptRelationship objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @DataElementConceptRelationshipNodes = $root->getChildNodes;
	my $DataElementConceptRelationshipLength = $#DataElementConceptRelationshipNodes;
	#print "total bean count = $DataElementConceptRelationshipLength\n";
	
	# parse all DataElementConceptRelationship nodes
	my @obj_list = ();
	foreach my $DataElementConceptRelationshipNode (@DataElementConceptRelationshipNodes) {
		#print "\tDataElementConceptRelationship\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $modifiedBy;
		my $dateModified;
		my $description;
		my $createdBy;
		my $name;
		my $dateCreated;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($DataElementConceptRelationshipNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "description") {
				$description=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::DataElementConceptRelationship;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setDateModified($dateModified);
		$newobj->setDescription($description);
		$newobj->setCreatedBy($createdBy);
		$newobj->setName($name);
		$newobj->setDateCreated($dateCreated);
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

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getDescription {
	my $self = shift;
	return $self->{description};
}

sub setDescription {
	my $self = shift;
	$self->{description} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getName {
	my $self = shift;
	return $self->{name};
}

sub setName {
	my $self = shift;
	$self->{name} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getParentDataElementConcept {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ParentDataElementConcept", $self);
	return $results[0];
}

sub getChildDataElementConcept {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ChildDataElementConcept", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::ClassSchemeClassSchemeItem;

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

# create an instance of the ClassSchemeClassSchemeItem object
# returns: a ClassSchemeClassSchemeItem object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new ClassSchemeClassSchemeItem\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this ClassSchemeClassSchemeItem intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:ClassSchemeClassSchemeItemImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# displayOrder;
	if( defined( $self->getDisplayOrder ) ) {
		$tmpstr = "<displayOrder xsi:type=\"xsd:int\">" . $self->getDisplayOrder . "</displayOrder>";
	} else {
		$tmpstr = "<displayOrder xsi:type=\"xsd:int\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of ClassSchemeClassSchemeItem objects
# param: xml doc
# returns: list of ClassSchemeClassSchemeItem objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @ClassSchemeClassSchemeItemNodes = $root->getChildNodes;
	my $ClassSchemeClassSchemeItemLength = $#ClassSchemeClassSchemeItemNodes;
	#print "total bean count = $ClassSchemeClassSchemeItemLength\n";
	
	# parse all ClassSchemeClassSchemeItem nodes
	my @obj_list = ();
	foreach my $ClassSchemeClassSchemeItemNode (@ClassSchemeClassSchemeItemNodes) {
		#print "\tClassSchemeClassSchemeItem\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $modifiedBy;
		my $displayOrder;
		my $createdBy;
		my $dateCreated;
		my $dateModified;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($ClassSchemeClassSchemeItemNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "displayOrder") {
				$displayOrder=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::ClassSchemeClassSchemeItem;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setDisplayOrder($displayOrder);
		$newobj->setCreatedBy($createdBy);
		$newobj->setDateCreated($dateCreated);
		$newobj->setDateModified($dateModified);
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

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getDisplayOrder {
	my $self = shift;
	return $self->{displayOrder};
}

sub setDisplayOrder {
	my $self = shift;
	$self->{displayOrder} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getParentClassSchemeClassSchemeItem {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ParentClassSchemeClassSchemeItem", $self);
	return $results[0];
}

sub getClassificationScheme {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ClassificationScheme", $self);
	return $results[0];
}

sub getDefinitionClassSchemeItemCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::DefinitionClassSchemeItem", $self);
	return @results;
}

sub getAdministeredComponentClassSchemeItemCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::AdministeredComponentClassSchemeItem", $self);
	return @results;
}

sub getDesignationClassSchemeItemCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::DesignationClassSchemeItem", $self);
	return @results;
}

sub getChildClassSchemeClassSchemeItemCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ChildClassSchemeClassSchemeItem", $self);
	return @results;
}

sub getClassificationSchemeItem {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ClassificationSchemeItem", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::DataElementDerivation;

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

# create an instance of the DataElementDerivation object
# returns: a DataElementDerivation object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new DataElementDerivation\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this DataElementDerivation intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:DataElementDerivationImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# displayOrder;
	if( defined( $self->getDisplayOrder ) ) {
		$tmpstr = "<displayOrder xsi:type=\"xsd:int\">" . $self->getDisplayOrder . "</displayOrder>";
	} else {
		$tmpstr = "<displayOrder xsi:type=\"xsd:int\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of DataElementDerivation objects
# param: xml doc
# returns: list of DataElementDerivation objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @DataElementDerivationNodes = $root->getChildNodes;
	my $DataElementDerivationLength = $#DataElementDerivationNodes;
	#print "total bean count = $DataElementDerivationLength\n";
	
	# parse all DataElementDerivation nodes
	my @obj_list = ();
	foreach my $DataElementDerivationNode (@DataElementDerivationNodes) {
		#print "\tDataElementDerivation\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $modifiedBy;
		my $displayOrder;
		my $dateModified;
		my $createdBy;
		my $dateCreated;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($DataElementDerivationNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "displayOrder") {
				$displayOrder=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::DataElementDerivation;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setDisplayOrder($displayOrder);
		$newobj->setDateModified($dateModified);
		$newobj->setCreatedBy($createdBy);
		$newobj->setDateCreated($dateCreated);
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

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getDisplayOrder {
	my $self = shift;
	return $self->{displayOrder};
}

sub setDisplayOrder {
	my $self = shift;
	$self->{displayOrder} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getDataElement {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::DataElement", $self);
	return $results[0];
}

sub getDerivedDataElement {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::DerivedDataElement", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::AdministeredComponentClassSchemeItem;

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

# create an instance of the AdministeredComponentClassSchemeItem object
# returns: a AdministeredComponentClassSchemeItem object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new AdministeredComponentClassSchemeItem\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this AdministeredComponentClassSchemeItem intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:AdministeredComponentClassSchemeItemImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of AdministeredComponentClassSchemeItem objects
# param: xml doc
# returns: list of AdministeredComponentClassSchemeItem objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @AdministeredComponentClassSchemeItemNodes = $root->getChildNodes;
	my $AdministeredComponentClassSchemeItemLength = $#AdministeredComponentClassSchemeItemNodes;
	#print "total bean count = $AdministeredComponentClassSchemeItemLength\n";
	
	# parse all AdministeredComponentClassSchemeItem nodes
	my @obj_list = ();
	foreach my $AdministeredComponentClassSchemeItemNode (@AdministeredComponentClassSchemeItemNodes) {
		#print "\tAdministeredComponentClassSchemeItem\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $modifiedBy;
		my $dateModified;
		my $createdBy;
		my $dateCreated;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($AdministeredComponentClassSchemeItemNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::AdministeredComponentClassSchemeItem;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setDateModified($dateModified);
		$newobj->setCreatedBy($createdBy);
		$newobj->setDateCreated($dateCreated);
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

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getClassSchemeClassSchemeItem {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ClassSchemeClassSchemeItem", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::Instruction;

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

# create an instance of the Instruction object
# returns: a Instruction object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Instruction\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Instruction intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:InstructionImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
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

	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# beginDate;
	if( defined( $self->getBeginDate ) ) {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\">" . $self->getBeginDate . "</beginDate>";
	} else {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusName;
	if( defined( $self->getWorkflowStatusName ) ) {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\">" . $self->getWorkflowStatusName . "</workflowStatusName>";
	} else {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# changeNote;
	if( defined( $self->getChangeNote ) ) {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\">" . $self->getChangeNote . "</changeNote>";
	} else {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# origin;
	if( defined( $self->getOrigin ) ) {
		$tmpstr = "<origin xsi:type=\"xsd:string\">" . $self->getOrigin . "</origin>";
	} else {
		$tmpstr = "<origin xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# latestVersionIndicator;
	if( defined( $self->getLatestVersionIndicator ) ) {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\">" . $self->getLatestVersionIndicator . "</latestVersionIndicator>";
	} else {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# longName;
	if( defined( $self->getLongName ) ) {
		$tmpstr = "<longName xsi:type=\"xsd:string\">" . $self->getLongName . "</longName>";
	} else {
		$tmpstr = "<longName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredName;
	if( defined( $self->getPreferredName ) ) {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\">" . $self->getPreferredName . "</preferredName>";
	} else {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredDefinition;
	if( defined( $self->getPreferredDefinition ) ) {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\">" . $self->getPreferredDefinition . "</preferredDefinition>";
	} else {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# publicID;
	if( defined( $self->getPublicID ) ) {
		$tmpstr = "<publicID xsi:type=\"xsd:long\">" . $self->getPublicID . "</publicID>";
	} else {
		$tmpstr = "<publicID xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusDescription;
	if( defined( $self->getWorkflowStatusDescription ) ) {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\">" . $self->getWorkflowStatusDescription . "</workflowStatusDescription>";
	} else {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# version;
	if( defined( $self->getVersion ) ) {
		$tmpstr = "<version xsi:type=\"xsd:float\">" . $self->getVersion . "</version>";
	} else {
		$tmpstr = "<version xsi:type=\"xsd:float\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# unresolvedIssue;
	if( defined( $self->getUnresolvedIssue ) ) {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\">" . $self->getUnresolvedIssue . "</unresolvedIssue>";
	} else {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# registrationStatus;
	if( defined( $self->getRegistrationStatus ) ) {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\">" . $self->getRegistrationStatus . "</registrationStatus>";
	} else {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# endDate;
	if( defined( $self->getEndDate ) ) {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\">" . $self->getEndDate . "</endDate>";
	} else {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# deletedIndicator;
	if( defined( $self->getDeletedIndicator ) ) {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\">" . $self->getDeletedIndicator . "</deletedIndicator>";
	} else {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of Instruction objects
# param: xml doc
# returns: list of Instruction objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @InstructionNodes = $root->getChildNodes;
	my $InstructionLength = $#InstructionNodes;
	#print "total bean count = $InstructionLength\n";
	
	# parse all Instruction nodes
	my @obj_list = ();
	foreach my $InstructionNode (@InstructionNodes) {
		#print "\tInstruction\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $type;
		my $modifiedBy;
		my $beginDate;
		my $workflowStatusName;
		my $changeNote;
		my $origin;
		my $dateCreated;
		my $latestVersionIndicator;
		my $longName;
		my $preferredName;
		my $preferredDefinition;
		my $publicID;
		my $createdBy;
		my $workflowStatusDescription;
		my $version;
		my $unresolvedIssue;
		my $registrationStatus;
		my $dateModified;
		my $endDate;
		my $deletedIndicator;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($InstructionNode->getChildNodes) {
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
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "beginDate") {
				$beginDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusName") {
				$workflowStatusName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "changeNote") {
				$changeNote=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "origin") {
				$origin=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "latestVersionIndicator") {
				$latestVersionIndicator=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "longName") {
				$longName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredName") {
				$preferredName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredDefinition") {
				$preferredDefinition=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "publicID") {
				$publicID=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusDescription") {
				$workflowStatusDescription=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "version") {
				$version=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "unresolvedIssue") {
				$unresolvedIssue=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "registrationStatus") {
				$registrationStatus=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "endDate") {
				$endDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "deletedIndicator") {
				$deletedIndicator=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::Instruction;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setType($type);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setBeginDate($beginDate);
		$newobj->setWorkflowStatusName($workflowStatusName);
		$newobj->setChangeNote($changeNote);
		$newobj->setOrigin($origin);
		$newobj->setDateCreated($dateCreated);
		$newobj->setLatestVersionIndicator($latestVersionIndicator);
		$newobj->setLongName($longName);
		$newobj->setPreferredName($preferredName);
		$newobj->setPreferredDefinition($preferredDefinition);
		$newobj->setPublicID($publicID);
		$newobj->setCreatedBy($createdBy);
		$newobj->setWorkflowStatusDescription($workflowStatusDescription);
		$newobj->setVersion($version);
		$newobj->setUnresolvedIssue($unresolvedIssue);
		$newobj->setRegistrationStatus($registrationStatus);
		$newobj->setDateModified($dateModified);
		$newobj->setEndDate($endDate);
		$newobj->setDeletedIndicator($deletedIndicator);
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

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getBeginDate {
	my $self = shift;
	return $self->{beginDate};
}

sub setBeginDate {
	my $self = shift;
	$self->{beginDate} = shift;
}

sub getWorkflowStatusName {
	my $self = shift;
	return $self->{workflowStatusName};
}

sub setWorkflowStatusName {
	my $self = shift;
	$self->{workflowStatusName} = shift;
}

sub getChangeNote {
	my $self = shift;
	return $self->{changeNote};
}

sub setChangeNote {
	my $self = shift;
	$self->{changeNote} = shift;
}

sub getOrigin {
	my $self = shift;
	return $self->{origin};
}

sub setOrigin {
	my $self = shift;
	$self->{origin} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

sub getLatestVersionIndicator {
	my $self = shift;
	return $self->{latestVersionIndicator};
}

sub setLatestVersionIndicator {
	my $self = shift;
	$self->{latestVersionIndicator} = shift;
}

sub getLongName {
	my $self = shift;
	return $self->{longName};
}

sub setLongName {
	my $self = shift;
	$self->{longName} = shift;
}

sub getPreferredName {
	my $self = shift;
	return $self->{preferredName};
}

sub setPreferredName {
	my $self = shift;
	$self->{preferredName} = shift;
}

sub getPreferredDefinition {
	my $self = shift;
	return $self->{preferredDefinition};
}

sub setPreferredDefinition {
	my $self = shift;
	$self->{preferredDefinition} = shift;
}

sub getPublicID {
	my $self = shift;
	return $self->{publicID};
}

sub setPublicID {
	my $self = shift;
	$self->{publicID} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getWorkflowStatusDescription {
	my $self = shift;
	return $self->{workflowStatusDescription};
}

sub setWorkflowStatusDescription {
	my $self = shift;
	$self->{workflowStatusDescription} = shift;
}

sub getVersion {
	my $self = shift;
	return $self->{version};
}

sub setVersion {
	my $self = shift;
	$self->{version} = shift;
}

sub getUnresolvedIssue {
	my $self = shift;
	return $self->{unresolvedIssue};
}

sub setUnresolvedIssue {
	my $self = shift;
	$self->{unresolvedIssue} = shift;
}

sub getRegistrationStatus {
	my $self = shift;
	return $self->{registrationStatus};
}

sub setRegistrationStatus {
	my $self = shift;
	$self->{registrationStatus} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getEndDate {
	my $self = shift;
	return $self->{endDate};
}

sub setEndDate {
	my $self = shift;
	$self->{endDate} = shift;
}

sub getDeletedIndicator {
	my $self = shift;
	return $self->{deletedIndicator};
}

sub setDeletedIndicator {
	my $self = shift;
	$self->{deletedIndicator} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getValidValue {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ValidValue", $self);
	return $results[0];
}

sub getCaseReportForm {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::CaseReportForm", $self);
	return $results[0];
}

sub getProtocolFormsTemplate {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ProtocolFormsTemplate", $self);
	return $results[0];
}

sub getModule {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::Module", $self);
	return $results[0];
}

sub getQuestion {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::Question", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::DataElementRelationship;

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

# create an instance of the DataElementRelationship object
# returns: a DataElementRelationship object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new DataElementRelationship\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this DataElementRelationship intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:DataElementRelationshipImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of DataElementRelationship objects
# param: xml doc
# returns: list of DataElementRelationship objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @DataElementRelationshipNodes = $root->getChildNodes;
	my $DataElementRelationshipLength = $#DataElementRelationshipNodes;
	#print "total bean count = $DataElementRelationshipLength\n";
	
	# parse all DataElementRelationship nodes
	my @obj_list = ();
	foreach my $DataElementRelationshipNode (@DataElementRelationshipNodes) {
		#print "\tDataElementRelationship\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $modifiedBy;
		my $dateModified;
		my $createdBy;
		my $name;
		my $dateCreated;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($DataElementRelationshipNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::DataElementRelationship;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setDateModified($dateModified);
		$newobj->setCreatedBy($createdBy);
		$newobj->setName($name);
		$newobj->setDateCreated($dateCreated);
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

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getName {
	my $self = shift;
	return $self->{name};
}

sub setName {
	my $self = shift;
	$self->{name} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getParentDataElement {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ParentDataElement", $self);
	return $results[0];
}

sub getChildDataElement {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ChildDataElement", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::ValueDomainRelationship;

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

# create an instance of the ValueDomainRelationship object
# returns: a ValueDomainRelationship object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new ValueDomainRelationship\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this ValueDomainRelationship intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:ValueDomainRelationshipImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of ValueDomainRelationship objects
# param: xml doc
# returns: list of ValueDomainRelationship objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @ValueDomainRelationshipNodes = $root->getChildNodes;
	my $ValueDomainRelationshipLength = $#ValueDomainRelationshipNodes;
	#print "total bean count = $ValueDomainRelationshipLength\n";
	
	# parse all ValueDomainRelationship nodes
	my @obj_list = ();
	foreach my $ValueDomainRelationshipNode (@ValueDomainRelationshipNodes) {
		#print "\tValueDomainRelationship\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $modifiedBy;
		my $dateModified;
		my $createdBy;
		my $name;
		my $dateCreated;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($ValueDomainRelationshipNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::ValueDomainRelationship;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setDateModified($dateModified);
		$newobj->setCreatedBy($createdBy);
		$newobj->setName($name);
		$newobj->setDateCreated($dateCreated);
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

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getName {
	my $self = shift;
	return $self->{name};
}

sub setName {
	my $self = shift;
	$self->{name} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getParentValueDomain {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ParentValueDomain", $self);
	return $results[0];
}

sub getChildValueDomain {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ChildValueDomain", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::ClassificationSchemeRelationship;

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

# create an instance of the ClassificationSchemeRelationship object
# returns: a ClassificationSchemeRelationship object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new ClassificationSchemeRelationship\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this ClassificationSchemeRelationship intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:ClassificationSchemeRelationshipImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# displayOrder;
	if( defined( $self->getDisplayOrder ) ) {
		$tmpstr = "<displayOrder xsi:type=\"xsd:int\">" . $self->getDisplayOrder . "</displayOrder>";
	} else {
		$tmpstr = "<displayOrder xsi:type=\"xsd:int\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of ClassificationSchemeRelationship objects
# param: xml doc
# returns: list of ClassificationSchemeRelationship objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @ClassificationSchemeRelationshipNodes = $root->getChildNodes;
	my $ClassificationSchemeRelationshipLength = $#ClassificationSchemeRelationshipNodes;
	#print "total bean count = $ClassificationSchemeRelationshipLength\n";
	
	# parse all ClassificationSchemeRelationship nodes
	my @obj_list = ();
	foreach my $ClassificationSchemeRelationshipNode (@ClassificationSchemeRelationshipNodes) {
		#print "\tClassificationSchemeRelationship\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $modifiedBy;
		my $displayOrder;
		my $dateModified;
		my $createdBy;
		my $name;
		my $dateCreated;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($ClassificationSchemeRelationshipNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "displayOrder") {
				$displayOrder=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::ClassificationSchemeRelationship;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setDisplayOrder($displayOrder);
		$newobj->setDateModified($dateModified);
		$newobj->setCreatedBy($createdBy);
		$newobj->setName($name);
		$newobj->setDateCreated($dateCreated);
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

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getDisplayOrder {
	my $self = shift;
	return $self->{displayOrder};
}

sub setDisplayOrder {
	my $self = shift;
	$self->{displayOrder} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getName {
	my $self = shift;
	return $self->{name};
}

sub setName {
	my $self = shift;
	$self->{name} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getChildClassificationScheme {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ChildClassificationScheme", $self);
	return $results[0];
}

sub getParentClassificationScheme {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ParentClassificationScheme", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::ClassificationSchemeItemRelationship;

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

# create an instance of the ClassificationSchemeItemRelationship object
# returns: a ClassificationSchemeItemRelationship object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new ClassificationSchemeItemRelationship\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this ClassificationSchemeItemRelationship intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:ClassificationSchemeItemRelationshipImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of ClassificationSchemeItemRelationship objects
# param: xml doc
# returns: list of ClassificationSchemeItemRelationship objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @ClassificationSchemeItemRelationshipNodes = $root->getChildNodes;
	my $ClassificationSchemeItemRelationshipLength = $#ClassificationSchemeItemRelationshipNodes;
	#print "total bean count = $ClassificationSchemeItemRelationshipLength\n";
	
	# parse all ClassificationSchemeItemRelationship nodes
	my @obj_list = ();
	foreach my $ClassificationSchemeItemRelationshipNode (@ClassificationSchemeItemRelationshipNodes) {
		#print "\tClassificationSchemeItemRelationship\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $modifiedBy;
		my $dateModified;
		my $createdBy;
		my $name;
		my $dateCreated;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($ClassificationSchemeItemRelationshipNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::ClassificationSchemeItemRelationship;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setDateModified($dateModified);
		$newobj->setCreatedBy($createdBy);
		$newobj->setName($name);
		$newobj->setDateCreated($dateCreated);
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

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getName {
	my $self = shift;
	return $self->{name};
}

sub setName {
	my $self = shift;
	$self->{name} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getChildClassificationSchemeItem {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ChildClassificationSchemeItem", $self);
	return $results[0];
}

sub getParentClassificationSchemeItem {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ParentClassificationSchemeItem", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::ObjectClassRelationship;

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

# create an instance of the ObjectClassRelationship object
# returns: a ObjectClassRelationship object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new ObjectClassRelationship\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this ObjectClassRelationship intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:ObjectClassRelationshipImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# targetHighMultiplicity;
	if( defined( $self->getTargetHighMultiplicity ) ) {
		$tmpstr = "<targetHighMultiplicity xsi:type=\"xsd:int\">" . $self->getTargetHighMultiplicity . "</targetHighMultiplicity>";
	} else {
		$tmpstr = "<targetHighMultiplicity xsi:type=\"xsd:int\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# targetRole;
	if( defined( $self->getTargetRole ) ) {
		$tmpstr = "<targetRole xsi:type=\"xsd:string\">" . $self->getTargetRole . "</targetRole>";
	} else {
		$tmpstr = "<targetRole xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# sourceHighMultiplicity;
	if( defined( $self->getSourceHighMultiplicity ) ) {
		$tmpstr = "<sourceHighMultiplicity xsi:type=\"xsd:int\">" . $self->getSourceHighMultiplicity . "</sourceHighMultiplicity>";
	} else {
		$tmpstr = "<sourceHighMultiplicity xsi:type=\"xsd:int\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# sourceRole;
	if( defined( $self->getSourceRole ) ) {
		$tmpstr = "<sourceRole xsi:type=\"xsd:string\">" . $self->getSourceRole . "</sourceRole>";
	} else {
		$tmpstr = "<sourceRole xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# direction;
	if( defined( $self->getDirection ) ) {
		$tmpstr = "<direction xsi:type=\"xsd:string\">" . $self->getDirection . "</direction>";
	} else {
		$tmpstr = "<direction xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# sourceLowMultiplicity;
	if( defined( $self->getSourceLowMultiplicity ) ) {
		$tmpstr = "<sourceLowMultiplicity xsi:type=\"xsd:int\">" . $self->getSourceLowMultiplicity . "</sourceLowMultiplicity>";
	} else {
		$tmpstr = "<sourceLowMultiplicity xsi:type=\"xsd:int\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# targetLowMultiplicity;
	if( defined( $self->getTargetLowMultiplicity ) ) {
		$tmpstr = "<targetLowMultiplicity xsi:type=\"xsd:int\">" . $self->getTargetLowMultiplicity . "</targetLowMultiplicity>";
	} else {
		$tmpstr = "<targetLowMultiplicity xsi:type=\"xsd:int\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# beginDate;
	if( defined( $self->getBeginDate ) ) {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\">" . $self->getBeginDate . "</beginDate>";
	} else {
		$tmpstr = "<beginDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusName;
	if( defined( $self->getWorkflowStatusName ) ) {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\">" . $self->getWorkflowStatusName . "</workflowStatusName>";
	} else {
		$tmpstr = "<workflowStatusName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# changeNote;
	if( defined( $self->getChangeNote ) ) {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\">" . $self->getChangeNote . "</changeNote>";
	} else {
		$tmpstr = "<changeNote xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# origin;
	if( defined( $self->getOrigin ) ) {
		$tmpstr = "<origin xsi:type=\"xsd:string\">" . $self->getOrigin . "</origin>";
	} else {
		$tmpstr = "<origin xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# latestVersionIndicator;
	if( defined( $self->getLatestVersionIndicator ) ) {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\">" . $self->getLatestVersionIndicator . "</latestVersionIndicator>";
	} else {
		$tmpstr = "<latestVersionIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# longName;
	if( defined( $self->getLongName ) ) {
		$tmpstr = "<longName xsi:type=\"xsd:string\">" . $self->getLongName . "</longName>";
	} else {
		$tmpstr = "<longName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredName;
	if( defined( $self->getPreferredName ) ) {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\">" . $self->getPreferredName . "</preferredName>";
	} else {
		$tmpstr = "<preferredName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# preferredDefinition;
	if( defined( $self->getPreferredDefinition ) ) {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\">" . $self->getPreferredDefinition . "</preferredDefinition>";
	} else {
		$tmpstr = "<preferredDefinition xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# publicID;
	if( defined( $self->getPublicID ) ) {
		$tmpstr = "<publicID xsi:type=\"xsd:long\">" . $self->getPublicID . "</publicID>";
	} else {
		$tmpstr = "<publicID xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# workflowStatusDescription;
	if( defined( $self->getWorkflowStatusDescription ) ) {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\">" . $self->getWorkflowStatusDescription . "</workflowStatusDescription>";
	} else {
		$tmpstr = "<workflowStatusDescription xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# version;
	if( defined( $self->getVersion ) ) {
		$tmpstr = "<version xsi:type=\"xsd:float\">" . $self->getVersion . "</version>";
	} else {
		$tmpstr = "<version xsi:type=\"xsd:float\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# unresolvedIssue;
	if( defined( $self->getUnresolvedIssue ) ) {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\">" . $self->getUnresolvedIssue . "</unresolvedIssue>";
	} else {
		$tmpstr = "<unresolvedIssue xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# registrationStatus;
	if( defined( $self->getRegistrationStatus ) ) {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\">" . $self->getRegistrationStatus . "</registrationStatus>";
	} else {
		$tmpstr = "<registrationStatus xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# endDate;
	if( defined( $self->getEndDate ) ) {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\">" . $self->getEndDate . "</endDate>";
	} else {
		$tmpstr = "<endDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# deletedIndicator;
	if( defined( $self->getDeletedIndicator ) ) {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\">" . $self->getDeletedIndicator . "</deletedIndicator>";
	} else {
		$tmpstr = "<deletedIndicator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of ObjectClassRelationship objects
# param: xml doc
# returns: list of ObjectClassRelationship objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @ObjectClassRelationshipNodes = $root->getChildNodes;
	my $ObjectClassRelationshipLength = $#ObjectClassRelationshipNodes;
	#print "total bean count = $ObjectClassRelationshipLength\n";
	
	# parse all ObjectClassRelationship nodes
	my @obj_list = ();
	foreach my $ObjectClassRelationshipNode (@ObjectClassRelationshipNodes) {
		#print "\tObjectClassRelationship\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $targetHighMultiplicity;
		my $targetRole;
		my $name;
		my $sourceHighMultiplicity;
		my $sourceRole;
		my $direction;
		my $sourceLowMultiplicity;
		my $targetLowMultiplicity;
		my $modifiedBy;
		my $beginDate;
		my $workflowStatusName;
		my $changeNote;
		my $origin;
		my $dateCreated;
		my $latestVersionIndicator;
		my $longName;
		my $preferredName;
		my $preferredDefinition;
		my $publicID;
		my $createdBy;
		my $workflowStatusDescription;
		my $version;
		my $unresolvedIssue;
		my $registrationStatus;
		my $dateModified;
		my $endDate;
		my $deletedIndicator;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($ObjectClassRelationshipNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "targetHighMultiplicity") {
				$targetHighMultiplicity=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "targetRole") {
				$targetRole=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "sourceHighMultiplicity") {
				$sourceHighMultiplicity=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "sourceRole") {
				$sourceRole=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "direction") {
				$direction=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "sourceLowMultiplicity") {
				$sourceLowMultiplicity=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "targetLowMultiplicity") {
				$targetLowMultiplicity=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "beginDate") {
				$beginDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusName") {
				$workflowStatusName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "changeNote") {
				$changeNote=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "origin") {
				$origin=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "latestVersionIndicator") {
				$latestVersionIndicator=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "longName") {
				$longName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredName") {
				$preferredName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "preferredDefinition") {
				$preferredDefinition=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "publicID") {
				$publicID=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "workflowStatusDescription") {
				$workflowStatusDescription=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "version") {
				$version=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "unresolvedIssue") {
				$unresolvedIssue=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "registrationStatus") {
				$registrationStatus=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "endDate") {
				$endDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "deletedIndicator") {
				$deletedIndicator=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::ObjectClassRelationship;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setTargetHighMultiplicity($targetHighMultiplicity);
		$newobj->setTargetRole($targetRole);
		$newobj->setName($name);
		$newobj->setSourceHighMultiplicity($sourceHighMultiplicity);
		$newobj->setSourceRole($sourceRole);
		$newobj->setDirection($direction);
		$newobj->setSourceLowMultiplicity($sourceLowMultiplicity);
		$newobj->setTargetLowMultiplicity($targetLowMultiplicity);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setBeginDate($beginDate);
		$newobj->setWorkflowStatusName($workflowStatusName);
		$newobj->setChangeNote($changeNote);
		$newobj->setOrigin($origin);
		$newobj->setDateCreated($dateCreated);
		$newobj->setLatestVersionIndicator($latestVersionIndicator);
		$newobj->setLongName($longName);
		$newobj->setPreferredName($preferredName);
		$newobj->setPreferredDefinition($preferredDefinition);
		$newobj->setPublicID($publicID);
		$newobj->setCreatedBy($createdBy);
		$newobj->setWorkflowStatusDescription($workflowStatusDescription);
		$newobj->setVersion($version);
		$newobj->setUnresolvedIssue($unresolvedIssue);
		$newobj->setRegistrationStatus($registrationStatus);
		$newobj->setDateModified($dateModified);
		$newobj->setEndDate($endDate);
		$newobj->setDeletedIndicator($deletedIndicator);
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

sub getTargetHighMultiplicity {
	my $self = shift;
	return $self->{targetHighMultiplicity};
}

sub setTargetHighMultiplicity {
	my $self = shift;
	$self->{targetHighMultiplicity} = shift;
}

sub getTargetRole {
	my $self = shift;
	return $self->{targetRole};
}

sub setTargetRole {
	my $self = shift;
	$self->{targetRole} = shift;
}

sub getName {
	my $self = shift;
	return $self->{name};
}

sub setName {
	my $self = shift;
	$self->{name} = shift;
}

sub getSourceHighMultiplicity {
	my $self = shift;
	return $self->{sourceHighMultiplicity};
}

sub setSourceHighMultiplicity {
	my $self = shift;
	$self->{sourceHighMultiplicity} = shift;
}

sub getSourceRole {
	my $self = shift;
	return $self->{sourceRole};
}

sub setSourceRole {
	my $self = shift;
	$self->{sourceRole} = shift;
}

sub getDirection {
	my $self = shift;
	return $self->{direction};
}

sub setDirection {
	my $self = shift;
	$self->{direction} = shift;
}

sub getSourceLowMultiplicity {
	my $self = shift;
	return $self->{sourceLowMultiplicity};
}

sub setSourceLowMultiplicity {
	my $self = shift;
	$self->{sourceLowMultiplicity} = shift;
}

sub getTargetLowMultiplicity {
	my $self = shift;
	return $self->{targetLowMultiplicity};
}

sub setTargetLowMultiplicity {
	my $self = shift;
	$self->{targetLowMultiplicity} = shift;
}

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getBeginDate {
	my $self = shift;
	return $self->{beginDate};
}

sub setBeginDate {
	my $self = shift;
	$self->{beginDate} = shift;
}

sub getWorkflowStatusName {
	my $self = shift;
	return $self->{workflowStatusName};
}

sub setWorkflowStatusName {
	my $self = shift;
	$self->{workflowStatusName} = shift;
}

sub getChangeNote {
	my $self = shift;
	return $self->{changeNote};
}

sub setChangeNote {
	my $self = shift;
	$self->{changeNote} = shift;
}

sub getOrigin {
	my $self = shift;
	return $self->{origin};
}

sub setOrigin {
	my $self = shift;
	$self->{origin} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

sub getLatestVersionIndicator {
	my $self = shift;
	return $self->{latestVersionIndicator};
}

sub setLatestVersionIndicator {
	my $self = shift;
	$self->{latestVersionIndicator} = shift;
}

sub getLongName {
	my $self = shift;
	return $self->{longName};
}

sub setLongName {
	my $self = shift;
	$self->{longName} = shift;
}

sub getPreferredName {
	my $self = shift;
	return $self->{preferredName};
}

sub setPreferredName {
	my $self = shift;
	$self->{preferredName} = shift;
}

sub getPreferredDefinition {
	my $self = shift;
	return $self->{preferredDefinition};
}

sub setPreferredDefinition {
	my $self = shift;
	$self->{preferredDefinition} = shift;
}

sub getPublicID {
	my $self = shift;
	return $self->{publicID};
}

sub setPublicID {
	my $self = shift;
	$self->{publicID} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getWorkflowStatusDescription {
	my $self = shift;
	return $self->{workflowStatusDescription};
}

sub setWorkflowStatusDescription {
	my $self = shift;
	$self->{workflowStatusDescription} = shift;
}

sub getVersion {
	my $self = shift;
	return $self->{version};
}

sub setVersion {
	my $self = shift;
	$self->{version} = shift;
}

sub getUnresolvedIssue {
	my $self = shift;
	return $self->{unresolvedIssue};
}

sub setUnresolvedIssue {
	my $self = shift;
	$self->{unresolvedIssue} = shift;
}

sub getRegistrationStatus {
	my $self = shift;
	return $self->{registrationStatus};
}

sub setRegistrationStatus {
	my $self = shift;
	$self->{registrationStatus} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getEndDate {
	my $self = shift;
	return $self->{endDate};
}

sub setEndDate {
	my $self = shift;
	$self->{endDate} = shift;
}

sub getDeletedIndicator {
	my $self = shift;
	return $self->{deletedIndicator};
}

sub setDeletedIndicator {
	my $self = shift;
	$self->{deletedIndicator} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getSourceObjectClass {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::SourceObjectClass", $self);
	return $results[0];
}

sub getTargetObjectClass {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::TargetObjectClass", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::ComponentConcept;

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

# create an instance of the ComponentConcept object
# returns: a ComponentConcept object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new ComponentConcept\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this ComponentConcept intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:ComponentConceptImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# displayOrder;
	if( defined( $self->getDisplayOrder ) ) {
		$tmpstr = "<displayOrder xsi:type=\"xsd:int\">" . $self->getDisplayOrder . "</displayOrder>";
	} else {
		$tmpstr = "<displayOrder xsi:type=\"xsd:int\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# primaryFlag;
	if( defined( $self->getPrimaryFlag ) ) {
		$tmpstr = "<primaryFlag xsi:type=\"xsd:string\">" . $self->getPrimaryFlag . "</primaryFlag>";
	} else {
		$tmpstr = "<primaryFlag xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of ComponentConcept objects
# param: xml doc
# returns: list of ComponentConcept objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @ComponentConceptNodes = $root->getChildNodes;
	my $ComponentConceptLength = $#ComponentConceptNodes;
	#print "total bean count = $ComponentConceptLength\n";
	
	# parse all ComponentConcept nodes
	my @obj_list = ();
	foreach my $ComponentConceptNode (@ComponentConceptNodes) {
		#print "\tComponentConcept\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $displayOrder;
		my $primaryFlag;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($ComponentConceptNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "displayOrder") {
				$displayOrder=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "primaryFlag") {
				$primaryFlag=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::ComponentConcept;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setDisplayOrder($displayOrder);
		$newobj->setPrimaryFlag($primaryFlag);
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

sub getDisplayOrder {
	my $self = shift;
	return $self->{displayOrder};
}

sub setDisplayOrder {
	my $self = shift;
	$self->{displayOrder} = shift;
}

sub getPrimaryFlag {
	my $self = shift;
	return $self->{primaryFlag};
}

sub setPrimaryFlag {
	my $self = shift;
	$self->{primaryFlag} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getDerivationRule {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::DerivationRule", $self);
	return $results[0];
}

sub getConcept {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::Concept", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::Definition;

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

# create an instance of the Definition object
# returns: a Definition object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Definition\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Definition intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:DefinitionImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# languageName;
	if( defined( $self->getLanguageName ) ) {
		$tmpstr = "<languageName xsi:type=\"xsd:string\">" . $self->getLanguageName . "</languageName>";
	} else {
		$tmpstr = "<languageName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# text;
	if( defined( $self->getText ) ) {
		$tmpstr = "<text xsi:type=\"xsd:string\">" . $self->getText . "</text>";
	} else {
		$tmpstr = "<text xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# type;
	if( defined( $self->getType ) ) {
		$tmpstr = "<type xsi:type=\"xsd:string\">" . $self->getType . "</type>";
	} else {
		$tmpstr = "<type xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of Definition objects
# param: xml doc
# returns: list of Definition objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @DefinitionNodes = $root->getChildNodes;
	my $DefinitionLength = $#DefinitionNodes;
	#print "total bean count = $DefinitionLength\n";
	
	# parse all Definition nodes
	my @obj_list = ();
	foreach my $DefinitionNode (@DefinitionNodes) {
		#print "\tDefinition\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $languageName;
		my $modifiedBy;
		my $text;
		my $type;
		my $dateModified;
		my $createdBy;
		my $dateCreated;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($DefinitionNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "languageName") {
				$languageName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "text") {
				$text=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "type") {
				$type=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::Definition;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setLanguageName($languageName);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setText($text);
		$newobj->setType($type);
		$newobj->setDateModified($dateModified);
		$newobj->setCreatedBy($createdBy);
		$newobj->setDateCreated($dateCreated);
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

sub getLanguageName {
	my $self = shift;
	return $self->{languageName};
}

sub setLanguageName {
	my $self = shift;
	$self->{languageName} = shift;
}

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getText {
	my $self = shift;
	return $self->{text};
}

sub setText {
	my $self = shift;
	$self->{text} = shift;
}

sub getType {
	my $self = shift;
	return $self->{type};
}

sub setType {
	my $self = shift;
	$self->{type} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getDefinitionClassSchemeItemCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::DefinitionClassSchemeItem", $self);
	return @results;
}

sub getContext {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::Context", $self);
	return $results[0];
}

sub getAdministeredComponent {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::AdministeredComponent", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::DesignationClassSchemeItem;

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

# create an instance of the DesignationClassSchemeItem object
# returns: a DesignationClassSchemeItem object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new DesignationClassSchemeItem\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this DesignationClassSchemeItem intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:DesignationClassSchemeItemImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of DesignationClassSchemeItem objects
# param: xml doc
# returns: list of DesignationClassSchemeItem objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @DesignationClassSchemeItemNodes = $root->getChildNodes;
	my $DesignationClassSchemeItemLength = $#DesignationClassSchemeItemNodes;
	#print "total bean count = $DesignationClassSchemeItemLength\n";
	
	# parse all DesignationClassSchemeItem nodes
	my @obj_list = ();
	foreach my $DesignationClassSchemeItemNode (@DesignationClassSchemeItemNodes) {
		#print "\tDesignationClassSchemeItem\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $modifiedBy;
		my $dateModified;
		my $createdBy;
		my $dateCreated;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($DesignationClassSchemeItemNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::DesignationClassSchemeItem;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setDateModified($dateModified);
		$newobj->setCreatedBy($createdBy);
		$newobj->setDateCreated($dateCreated);
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

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getDesignation {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::Designation", $self);
	return $results[0];
}

sub getClassSchemeClassSchemeItem {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ClassSchemeClassSchemeItem", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaDSR::DefinitionClassSchemeItem;

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

# create an instance of the DefinitionClassSchemeItem object
# returns: a DefinitionClassSchemeItem object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new DefinitionClassSchemeItem\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this DefinitionClassSchemeItem intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:DefinitionClassSchemeItemImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cadsr.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# modifiedBy;
	if( defined( $self->getModifiedBy ) ) {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\">" . $self->getModifiedBy . "</modifiedBy>";
	} else {
		$tmpstr = "<modifiedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateModified;
	if( defined( $self->getDateModified ) ) {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\">" . $self->getDateModified . "</dateModified>";
	} else {
		$tmpstr = "<dateModified xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# createdBy;
	if( defined( $self->getCreatedBy ) ) {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\">" . $self->getCreatedBy . "</createdBy>";
	} else {
		$tmpstr = "<createdBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# dateCreated;
	if( defined( $self->getDateCreated ) ) {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\">" . $self->getDateCreated . "</dateCreated>";
	} else {
		$tmpstr = "<dateCreated xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of DefinitionClassSchemeItem objects
# param: xml doc
# returns: list of DefinitionClassSchemeItem objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @DefinitionClassSchemeItemNodes = $root->getChildNodes;
	my $DefinitionClassSchemeItemLength = $#DefinitionClassSchemeItemNodes;
	#print "total bean count = $DefinitionClassSchemeItemLength\n";
	
	# parse all DefinitionClassSchemeItem nodes
	my @obj_list = ();
	foreach my $DefinitionClassSchemeItemNode (@DefinitionClassSchemeItemNodes) {
		#print "\tDefinitionClassSchemeItem\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $modifiedBy;
		my $dateModified;
		my $createdBy;
		my $dateCreated;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($DefinitionClassSchemeItemNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedBy") {
				$modifiedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateModified") {
				$dateModified=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "createdBy") {
				$createdBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dateCreated") {
				$dateCreated=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaDSR::DefinitionClassSchemeItem;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setModifiedBy($modifiedBy);
		$newobj->setDateModified($dateModified);
		$newobj->setCreatedBy($createdBy);
		$newobj->setDateCreated($dateCreated);
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

sub getModifiedBy {
	my $self = shift;
	return $self->{modifiedBy};
}

sub setModifiedBy {
	my $self = shift;
	$self->{modifiedBy} = shift;
}

sub getDateModified {
	my $self = shift;
	return $self->{dateModified};
}

sub setDateModified {
	my $self = shift;
	$self->{dateModified} = shift;
}

sub getCreatedBy {
	my $self = shift;
	return $self->{createdBy};
}

sub setCreatedBy {
	my $self = shift;
	$self->{createdBy} = shift;
}

sub getDateCreated {
	my $self = shift;
	return $self->{dateCreated};
}

sub setDateCreated {
	my $self = shift;
	$self->{dateCreated} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getClassSchemeClassSchemeItem {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::ClassSchemeClassSchemeItem", $self);
	return $results[0];
}

sub getDefinition {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaDSR::Definition", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# Below is module documentation for Context

=pod

=head1 Context

  CaCORE::CaDSR::Context - Perl extension for Context.

=head2 Abstract

  The CaCORE::CaDSR::bean::Context is a Perl object representation of the
  caBIO generic object.

=head2 Description

  A designation or description of the application environment or discipline in which a name is applied or from which it originates.

=head3 Attributes of Context

  The following are all the attributes of the Context object and their data types:

	languageName	string
	modifiedBy	string
	createdBy	string
	dateCreated	dateTime
	id	string
	version	float
	dateModified	dateTime
	description	string
	name	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of Context

  The following are all the objects that are associated with the Context:

=for html
<pre>
	<a href="#definition">Definition</a>: 	One to many assoication, use getDefinitionCollection to get a collection of associated Definition.
	<a href="#designation">Designation</a>: 	One to many assoication, use getDesignationCollection to get a collection of associated Designation.
	<a href="#referencedocument">ReferenceDocument</a>: 	One to many assoication, use getReferenceDocumentCollection to get a collection of associated ReferenceDocument.
  End Associations and related methods
<p>

=cut

# Below is module documentation for AdministeredComponent

=pod

=head1 AdministeredComponent

  CaCORE::CaDSR::AdministeredComponent - Perl extension for AdministeredComponent.

=head2 Abstract

  The CaCORE::CaDSR::bean::AdministeredComponent is a Perl object representation of the
  caBIO generic object.

=head2 Description

  A component for which attributes (or characteristics) are collected; Data Elements are one type of administered component. Other administered components have relationships to data elements as well as each other.

=head3 Attributes of AdministeredComponent

  The following are all the attributes of the AdministeredComponent object and their data types:

	modifiedBy	string
	beginDate	dateTime
	workflowStatusName	string
	changeNote	string
	origin	string
	dateCreated	dateTime
	id	string
	latestVersionIndicator	string
	longName	string
	preferredName	string
	preferredDefinition	string
	publicID	long
	createdBy	string
	workflowStatusDescription	string
	version	float
	unresolvedIssue	string
	registrationStatus	string
	dateModified	dateTime
	endDate	dateTime
	deletedIndicator	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of AdministeredComponent

  The following are all the objects that are associated with the AdministeredComponent:

=for html
<pre>
	<a href="#definition">Definition</a>: 	One to many assoication, use getDefinitionCollection to get a collection of associated Definition.
	<a href="#context">Context</a>: 	Many to one assoication, use getContext to get the associated Context.
	<a href="#designation">Designation</a>: 	One to many assoication, use getDesignationCollection to get a collection of associated Designation.
	<a href="#administeredcomponentclassschemeitem">AdministeredComponentClassSchemeItem</a>: 	One to many assoication, use getAdministeredComponentClassSchemeItemCollection to get a collection of associated AdministeredComponentClassSchemeItem.
	<a href="#referencedocument">ReferenceDocument</a>: 	One to many assoication, use getReferenceDocumentCollection to get a collection of associated ReferenceDocument.
  End Associations and related methods
<p>

=cut

# Below is module documentation for DerivationType

=pod

=head1 DerivationType

  CaCORE::CaDSR::DerivationType - Perl extension for DerivationType.

=head2 Abstract

  The CaCORE::CaDSR::bean::DerivationType is a Perl object representation of the
  caBIO generic object.

=head2 Description

  The type of Derived Data Element that is being created. For example a Data Element that is derived/created by subtracting two dates represented by other data elements would be a Calculated Representation Type.   Types include: Calculated, Complex Recode, Compound, Concatenation, Object Class, and Simple Recode.

=head3 Attributes of DerivationType

  The following are all the attributes of the DerivationType object and their data types:

	modifiedBy	string
	dateModified	dateTime
	description	string
	createdBy	string
	name	string
	dateCreated	dateTime
	id	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of DerivationType

  The following are all the objects that are associated with the DerivationType:

=for html
<pre>
	<a href="#conceptderivationrule">ConceptDerivationRule</a>: 	One to many assoication, use getConceptDerivationRuleCollection to get a collection of associated ConceptDerivationRule.
	<a href="#deriveddataelement">DerivedDataElement</a>: 	One to many assoication, use getDerivedDataElementCollection to get a collection of associated DerivedDataElement.
  End Associations and related methods
<p>

=cut

# Below is module documentation for ConceptDerivationRule

=pod

=head1 ConceptDerivationRule

  CaCORE::CaDSR::ConceptDerivationRule - Perl extension for ConceptDerivationRule.

=head2 Abstract

  The CaCORE::CaDSR::bean::ConceptDerivationRule is a Perl object representation of the
  caBIO generic object.

=head2 Description

  The derivation rule between one or more concepts. 

=head3 Attributes of ConceptDerivationRule

  The following are all the attributes of the ConceptDerivationRule object and their data types:

	modifiedBy	string
	createdBy	string
	dateCreated	dateTime
	id	string
	dateModified	dateTime
	name	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of ConceptDerivationRule

  The following are all the objects that are associated with the ConceptDerivationRule:

=for html
<pre>
	<a href="#derivationtype">DerivationType</a>: 	Many to one assoication, use getDerivationType to get the associated DerivationType.
	<a href="#qualifier">Qualifier</a>: 	One to many assoication, use getQualifierCollection to get a collection of associated Qualifier.
	<a href="#representation">Representation</a>: 	One to many assoication, use getRepresentationCollection to get a collection of associated Representation.
	<a href="#objectclass">ObjectClass</a>: 	One to many assoication, use getObjectClassCollection to get a collection of associated ObjectClass.
	<a href="#property">Property</a>: 	One to many assoication, use getPropertyCollection to get a collection of associated Property.
	<a href="#valuemeaning">ValueMeaning</a>: 	One to many assoication, use getValueMeaningCollection to get a collection of associated ValueMeaning.
	<a href="#componentconcept">ComponentConcept</a>: 	One to many assoication, use getComponentConceptCollection to get a collection of associated ComponentConcept.
	<a href="#conceptualdomain">ConceptualDomain</a>: 	One to many assoication, use getConceptualDomainCollection to get a collection of associated ConceptualDomain.
	<a href="#valuedomain">ValueDomain</a>: 	One to many assoication, use getValueDomainCollection to get a collection of associated ValueDomain.
  End Associations and related methods
<p>

=cut

# Below is module documentation for ConceptualDomain

=pod

=head1 ConceptualDomain

  CaCORE::CaDSR::ConceptualDomain - Perl extension for ConceptualDomain.

=head2 Abstract

  The CaCORE::CaDSR::bean::ConceptualDomain is a Perl object representation of the
  caBIO generic object.

=head2 Description

  The set of all possible Valid Value meanings of a Data Element Concept expressed without representation.

=head3 Attributes of ConceptualDomain

  The following are all the attributes of the ConceptualDomain object and their data types:

	dimensionality	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of ConceptualDomain

  The following are all the objects that are associated with the ConceptualDomain:

=for html
<pre>
	<a href="#dataelementconcept">DataElementConcept</a>: 	One to many assoication, use getDataElementConceptCollection to get a collection of associated DataElementConcept.
	<a href="#valuemeaning">ValueMeaning</a>: 	One to many assoication, use getValueMeaningCollection to get a collection of associated ValueMeaning.
	<a href="#conceptderivationrule">ConceptDerivationRule</a>: 	Many to one assoication, use getConceptDerivationRule to get the associated ConceptDerivationRule.
	<a href="#valuedomain">ValueDomain</a>: 	One to many assoication, use getValueDomainCollection to get a collection of associated ValueDomain.
  End Associations and related methods
<p>

=cut

# Below is module documentation for ObjectClass

=pod

=head1 ObjectClass

  CaCORE::CaDSR::ObjectClass - Perl extension for ObjectClass.

=head2 Abstract

  The CaCORE::CaDSR::bean::ObjectClass is a Perl object representation of the
  caBIO generic object.

=head2 Description

  A set of ideas, abstractions, or things in the real world that can be identified with explicit boundaries and meaning and whose properties and behavior follow the same rules.

=head3 Attributes of ObjectClass

  The following are all the attributes of the ObjectClass object and their data types:

	definitionSource	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of ObjectClass

  The following are all the objects that are associated with the ObjectClass:

=for html
<pre>
	<a href="#dataelementconcept">DataElementConcept</a>: 	One to many assoication, use getDataElementConceptCollection to get a collection of associated DataElementConcept.
	<a href="#sourcobjectclassrelationship">SourcObjectClassRelationship</a>: 	One to many assoication, use getSourcObjectClassRelationshipCollection to get a collection of associated SourcObjectClassRelationship.
	<a href="#conceptderivationrule">ConceptDerivationRule</a>: 	Many to one assoication, use getConceptDerivationRule to get the associated ConceptDerivationRule.
	<a href="#targetobjectclassrelationship">TargetObjectClassRelationship</a>: 	One to many assoication, use getTargetObjectClassRelationshipCollection to get a collection of associated TargetObjectClassRelationship.
  End Associations and related methods
<p>

=cut

# Below is module documentation for Qualifier

=pod

=head1 Qualifier

  CaCORE::CaDSR::Qualifier - Perl extension for Qualifier.

=head2 Abstract

  The CaCORE::CaDSR::bean::Qualifier is a Perl object representation of the
  caBIO generic object.

=head2 Description

  A term that helps define and render a concept unique. Criteria that further defines or describes a specific aspect (object class, property, representation) of a Data Element Concept or a Value Domain.

=head3 Attributes of Qualifier

  The following are all the attributes of the Qualifier object and their data types:

	comments	string
	modifiedBy	string
	createdBy	string
	dateCreated	dateTime
	id	string
	dateModified	dateTime
	description	string
	name	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of Qualifier

  The following are all the objects that are associated with the Qualifier:

=for html
<pre>
	<a href="#decproperty">DECProperty</a>: 	One to many assoication, use getDECPropertyCollection to get a collection of associated DECProperty.
	<a href="#vdrepresentation">VDRepresentation</a>: 	One to many assoication, use getVDRepresentationCollection to get a collection of associated VDRepresentation.
	<a href="#decobjectclass">DECObjectClass</a>: 	One to many assoication, use getDECObjectClassCollection to get a collection of associated DECObjectClass.
	<a href="#conceptderivationrule">ConceptDerivationRule</a>: 	Many to one assoication, use getConceptDerivationRule to get the associated ConceptDerivationRule.
  End Associations and related methods
<p>

=cut

# Below is module documentation for Property

=pod

=head1 Property

  CaCORE::CaDSR::Property - Perl extension for Property.

=head2 Abstract

  The CaCORE::CaDSR::bean::Property is a Perl object representation of the
  caBIO generic object.

=head2 Description

  A characteristic common to all members of an Object Class.  It may be any feature that humans naturally use to distinguish one individual object from another.  It is conceptual and thus has no particular associated means of representation by which propert

=head3 Attributes of Property

  The following are all the attributes of the Property object and their data types:

	definitionSource	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of Property

  The following are all the objects that are associated with the Property:

=for html
<pre>
	<a href="#dataelementconcept">DataElementConcept</a>: 	One to many assoication, use getDataElementConceptCollection to get a collection of associated DataElementConcept.
	<a href="#conceptderivationrule">ConceptDerivationRule</a>: 	Many to one assoication, use getConceptDerivationRule to get the associated ConceptDerivationRule.
  End Associations and related methods
<p>

=cut

# Below is module documentation for DataElementConcept

=pod

=head1 DataElementConcept

  CaCORE::CaDSR::DataElementConcept - Perl extension for DataElementConcept.

=head2 Abstract

  The CaCORE::CaDSR::bean::DataElementConcept is a Perl object representation of the
  caBIO generic object.

=head2 Description

  A concept that can be represented in the form of a data element, described independently of any particular representation.

=head3 Attributes of DataElementConcept

  The following are all the attributes of the DataElementConcept object and their data types:

  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of DataElementConcept

  The following are all the objects that are associated with the DataElementConcept:

=for html
<pre>
	<a href="#objectclass">ObjectClass</a>: 	Many to one assoication, use getObjectClass to get the associated ObjectClass.
	<a href="#conceptualdomain">ConceptualDomain</a>: 	Many to one assoication, use getConceptualDomain to get the associated ConceptualDomain.
	<a href="#propertyqualifier">PropertyQualifier</a>: 	Many to one assoication, use getPropertyQualifier to get the associated PropertyQualifier.
	<a href="#parentdataelementconceptrelationship">ParentDataElementConceptRelationship</a>: 	One to many assoication, use getParentDataElementConceptRelationshipCollection to get a collection of associated ParentDataElementConceptRelationship.
	<a href="#dataelement">DataElement</a>: 	One to many assoication, use getDataElementCollection to get a collection of associated DataElement.
	<a href="#property">Property</a>: 	Many to one assoication, use getProperty to get the associated Property.
	<a href="#childdataelementconceptrelationship">ChildDataElementConceptRelationship</a>: 	One to many assoication, use getChildDataElementConceptRelationshipCollection to get a collection of associated ChildDataElementConceptRelationship.
	<a href="#objectclassqualifier">ObjectClassQualifier</a>: 	Many to one assoication, use getObjectClassQualifier to get the associated ObjectClassQualifier.
  End Associations and related methods
<p>

=cut

# Below is module documentation for Representation

=pod

=head1 Representation

  CaCORE::CaDSR::Representation - Perl extension for Representation.

=head2 Abstract

  The CaCORE::CaDSR::bean::Representation is a Perl object representation of the
  caBIO generic object.

=head2 Description

  Mechanism by which the functional and/or presentational category of an item maybe conveyed to a user. Component of a Data Element Name that describes how data are represented (i.e. the combination of a Value Domain, data type, and if necessary a unit of measure or a character set.)  The Representation occupies the last position in the Data Element name (i.e. rightmost).   Examples: Code - A system of valid symbols that substitute for specified values e.g. alpha, numeric, symbols and/or combinations. Count ? Non-monetary numeric value arrived at by counting. Currency ? Monetary representation. Date ? Calendar representation e.g. YYYY-MM-DD Graphic ? Diagrams, graphs, mathematical curves, or the like ? usually a vector image. Icon ? A sign or representation that stands for its object by virtue of a resemblance or analogy to it. Picture ? A visual representation of a person, object, or scene ? usually a raster image. Quantity ? A continuous number such as the linear dimensions, capacity/amount (non-monetary) of an object. Text ? A text field that is usually unformatted. Time ? Time of day or duration e.g. HH:MM:SS.SSSS.

=head3 Attributes of Representation

  The following are all the attributes of the Representation object and their data types:

	definitionSource	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of Representation

  The following are all the objects that are associated with the Representation:

=for html
<pre>
	<a href="#conceptderivationrule">ConceptDerivationRule</a>: 	Many to one assoication, use getConceptDerivationRule to get the associated ConceptDerivationRule.
	<a href="#valuedomain">ValueDomain</a>: 	One to many assoication, use getValueDomainCollection to get a collection of associated ValueDomain.
  End Associations and related methods
<p>

=cut

# Below is module documentation for ValueDomain

=pod

=head1 ValueDomain

  CaCORE::CaDSR::ValueDomain - Perl extension for ValueDomain.

=head2 Abstract

  The CaCORE::CaDSR::bean::ValueDomain is a Perl object representation of the
  caBIO generic object.

=head2 Description

  A set of permissible values for a data element.

=head3 Attributes of ValueDomain

  The following are all the attributes of the ValueDomain object and their data types:

	datatypeName	string
	decimalPlace	int
	highValueNumber	string
	minimumLengthNumber	int
	formatName	string
	lowValueNumber	string
	characterSetName	string
	UOMName	string
	maximumLengthNumber	int
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of ValueDomain

  The following are all the objects that are associated with the ValueDomain:

=for html
<pre>
	<a href="#conceptualdomain">ConceptualDomain</a>: 	Many to one assoication, use getConceptualDomain to get the associated ConceptualDomain.
	<a href="#childvaluedomainrelationship">ChildValueDomainRelationship</a>: 	One to many assoication, use getChildValueDomainRelationshipCollection to get a collection of associated ChildValueDomainRelationship.
	<a href="#represention">Represention</a>: 	Many to one assoication, use getRepresention to get the associated Represention.
	<a href="#dataelement">DataElement</a>: 	One to many assoication, use getDataElementCollection to get a collection of associated DataElement.
	<a href="#parentvaluedomainrelationship">ParentValueDomainRelationship</a>: 	One to many assoication, use getParentValueDomainRelationshipCollection to get a collection of associated ParentValueDomainRelationship.
	<a href="#question">Question</a>: 	One to many assoication, use getQuestionCollection to get a collection of associated Question.
	<a href="#qualifier">Qualifier</a>: 	Many to one assoication, use getQualifier to get the associated Qualifier.
	<a href="#conceptderivationrule">ConceptDerivationRule</a>: 	Many to one assoication, use getConceptDerivationRule to get the associated ConceptDerivationRule.
  End Associations and related methods
<p>

=cut

# Below is module documentation for DerivedDataElement

=pod

=head1 DerivedDataElement

  CaCORE::CaDSR::DerivedDataElement - Perl extension for DerivedDataElement.

=head2 Abstract

  The CaCORE::CaDSR::bean::DerivedDataElement is a Perl object representation of the
  caBIO generic object.

=head2 Description

  The Data Element that is derived from one or more data elements. ISO DEF: the relationship among a Data Element which is derived, the rule controlling its derivation, and the Data Element(s) from which it is derived.

=head3 Attributes of DerivedDataElement

  The following are all the attributes of the DerivedDataElement object and their data types:

	modifiedBy	string
	concatenationCharacter	string
	rule	string
	dateModified	dateTime
	methods	string
	createdBy	string
	dateCreated	dateTime
	id	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of DerivedDataElement

  The following are all the objects that are associated with the DerivedDataElement:

=for html
<pre>
	<a href="#derivationtype">DerivationType</a>: 	Many to one assoication, use getDerivationType to get the associated DerivationType.
	<a href="#dataelementderivation">DataElementDerivation</a>: 	One to many assoication, use getDataElementDerivationCollection to get a collection of associated DataElementDerivation.
	<a href="#dataelement">DataElement</a>: 	Many to one assoication, use getDataElement to get the associated DataElement.
  End Associations and related methods
<p>

=cut

# Below is module documentation for DataElement

=pod

=head1 DataElement

  CaCORE::CaDSR::DataElement - Perl extension for DataElement.

=head2 Abstract

  The CaCORE::CaDSR::bean::DataElement is a Perl object representation of the
  caBIO generic object.

=head2 Description

  A unit of data for which the definition, identification, representation and permissible values are specified by means of a set of attributes.

=head3 Attributes of DataElement

  The following are all the attributes of the DataElement object and their data types:

  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of DataElement

  The following are all the objects that are associated with the DataElement:

=for html
<pre>
	<a href="#dataelementderivation">DataElementDerivation</a>: 	One to many assoication, use getDataElementDerivationCollection to get a collection of associated DataElementDerivation.
	<a href="#valuedomain">ValueDomain</a>: 	Many to one assoication, use getValueDomain to get the associated ValueDomain.
	<a href="#dataelementconcept">DataElementConcept</a>: 	Many to one assoication, use getDataElementConcept to get the associated DataElementConcept.
	<a href="#childdataelementrelationships">ChildDataElementRelationships</a>: 	One to many assoication, use getChildDataElementRelationshipsCollection to get a collection of associated ChildDataElementRelationships.
	<a href="#deriveddataelement">DerivedDataElement</a>: 	Many to one assoication, use getDerivedDataElement to get the associated DerivedDataElement.
	<a href="#question">Question</a>: 	One to many assoication, use getQuestionCollection to get a collection of associated Question.
	<a href="#parentdataelementrelationships">ParentDataElementRelationships</a>: 	One to many assoication, use getParentDataElementRelationshipsCollection to get a collection of associated ParentDataElementRelationships.
  End Associations and related methods
<p>

=cut

# Below is module documentation for ClassificationScheme

=pod

=head1 ClassificationScheme

  CaCORE::CaDSR::ClassificationScheme - Perl extension for ClassificationScheme.

=head2 Abstract

  The CaCORE::CaDSR::bean::ClassificationScheme is a Perl object representation of the
  caBIO generic object.

=head2 Description

  An arrangement or division of objects into groups based on characteristics that the objects have in common, e.g., origin, composition, structure, application, function, etc.  Adds information not easily included in definitions, helps organize the registry and facilitates access to the registry.  ISO DEF: the descriptive information for an arrangement or division of objects into groups based on characterisitics, which the objects have in common.

=head3 Attributes of ClassificationScheme

  The following are all the attributes of the ClassificationScheme object and their data types:

	labelTypeFlag	string
	type	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of ClassificationScheme

  The following are all the objects that are associated with the ClassificationScheme:

=for html
<pre>
	<a href="#classschemeclassschemeitem">ClassSchemeClassSchemeItem</a>: 	One to many assoication, use getClassSchemeClassSchemeItemCollection to get a collection of associated ClassSchemeClassSchemeItem.
	<a href="#childclassificationschemerelationship">ChildClassificationSchemeRelationship</a>: 	One to many assoication, use getChildClassificationSchemeRelationshipCollection to get a collection of associated ChildClassificationSchemeRelationship.
	<a href="#parentclassificationschemerelationship">ParentClassificationSchemeRelationship</a>: 	One to many assoication, use getParentClassificationSchemeRelationshipCollection to get a collection of associated ParentClassificationSchemeRelationship.
  End Associations and related methods
<p>

=cut

# Below is module documentation for ClassificationSchemeItem

=pod

=head1 ClassificationSchemeItem

  CaCORE::CaDSR::ClassificationSchemeItem - Perl extension for ClassificationSchemeItem.

=head2 Abstract

  The CaCORE::CaDSR::bean::ClassificationSchemeItem is a Perl object representation of the
  caBIO generic object.

=head2 Description

  A component of content in a Classification Scheme. This may be a node in a taxonomy or ontology or a term in a thesaurus, etc.

=head3 Attributes of ClassificationSchemeItem

  The following are all the attributes of the ClassificationSchemeItem object and their data types:

	comments	string
	modifiedBy	string
	type	string
	createdBy	string
	dateCreated	dateTime
	id	string
	dateModified	dateTime
	description	string
	name	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of ClassificationSchemeItem

  The following are all the objects that are associated with the ClassificationSchemeItem:

=for html
<pre>
	<a href="#childclassificationschemeitemrelationship">ChildClassificationSchemeItemRelationship</a>: 	One to many assoication, use getChildClassificationSchemeItemRelationshipCollection to get a collection of associated ChildClassificationSchemeItemRelationship.
	<a href="#parentclassificationschemeitemrelationship">ParentClassificationSchemeItemRelationship</a>: 	One to many assoication, use getParentClassificationSchemeItemRelationshipCollection to get a collection of associated ParentClassificationSchemeItemRelationship.
	<a href="#classschemeclassschemeitem">ClassSchemeClassSchemeItem</a>: 	One to many assoication, use getClassSchemeClassSchemeItemCollection to get a collection of associated ClassSchemeClassSchemeItem.
  End Associations and related methods
<p>

=cut

# Below is module documentation for ValueMeaning

=pod

=head1 ValueMeaning

  CaCORE::CaDSR::ValueMeaning - Perl extension for ValueMeaning.

=head2 Abstract

  The CaCORE::CaDSR::bean::ValueMeaning is a Perl object representation of the
  caBIO generic object.

=head2 Description

  The significance associated with an allowable/permissible value.

=head3 Attributes of ValueMeaning

  The following are all the attributes of the ValueMeaning object and their data types:

	comments	string
	modifiedBy	string
	beginDate	dateTime
	shortMeaning	string
	createdBy	string
	dateCreated	dateTime
	id	string
	dateModified	dateTime
	description	string
	endDate	dateTime
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of ValueMeaning

  The following are all the objects that are associated with the ValueMeaning:

=for html
<pre>
	<a href="#permissablevalue">PermissableValue</a>: 	One to many assoication, use getPermissableValueCollection to get a collection of associated PermissableValue.
	<a href="#conceptualdomain">ConceptualDomain</a>: 	One to many assoication, use getConceptualDomainCollection to get a collection of associated ConceptualDomain.
	<a href="#conceptderivationrule">ConceptDerivationRule</a>: 	Many to one assoication, use getConceptDerivationRule to get the associated ConceptDerivationRule.
  End Associations and related methods
<p>

=cut

# Below is module documentation for PermissibleValue

=pod

=head1 PermissibleValue

  CaCORE::CaDSR::PermissibleValue - Perl extension for PermissibleValue.

=head2 Abstract

  The CaCORE::CaDSR::bean::PermissibleValue is a Perl object representation of the
  caBIO generic object.

=head2 Description

  The exact names, codes and text that can be stored in a data field in an information management system.  ISO DEF: An expression of a value meaning in a specific value domain.

=head3 Attributes of PermissibleValue

  The following are all the attributes of the PermissibleValue object and their data types:

	lowValueNumber	long
	value	string
	modifiedBy	string
	highValueNumber	long
	dateModified	dateTime
	createdBy	string
	dateCreated	dateTime
	id	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of PermissibleValue

  The following are all the objects that are associated with the PermissibleValue:

=for html
<pre>
	<a href="#valuemeaning">ValueMeaning</a>: 	Many to one assoication, use getValueMeaning to get the associated ValueMeaning.
	<a href="#valuedomainpermissiblevalue">ValueDomainPermissibleValue</a>: 	One to many assoication, use getValueDomainPermissibleValueCollection to get a collection of associated ValueDomainPermissibleValue.
  End Associations and related methods
<p>

=cut

# Below is module documentation for ReferenceDocument

=pod

=head1 ReferenceDocument

  CaCORE::CaDSR::ReferenceDocument - Perl extension for ReferenceDocument.

=head2 Abstract

  The CaCORE::CaDSR::bean::ReferenceDocument is a Perl object representation of the
  caBIO generic object.

=head2 Description

  A place to document additional information about Administered Components that is not readily stored elsewhere.

=head3 Attributes of ReferenceDocument

  The following are all the attributes of the ReferenceDocument object and their data types:

	languageName	string
	modifiedBy	string
	displayOrder	long
	type	string
	organizationId	string
	createdBy	string
	dateCreated	dateTime
	id	string
	rdtlName	string
	dateModified	dateTime
	URL	string
	doctext	string
	name	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of ReferenceDocument

  The following are all the objects that are associated with the ReferenceDocument:

=for html
<pre>
	<a href="#context">Context</a>: 	Many to one assoication, use getContext to get the associated Context.
  End Associations and related methods
<p>

=cut

# Below is module documentation for ProtocolFormsTemplate

=pod

=head1 ProtocolFormsTemplate

  CaCORE::CaDSR::ProtocolFormsTemplate - Perl extension for ProtocolFormsTemplate.

=head2 Abstract

  The CaCORE::CaDSR::bean::ProtocolFormsTemplate is a Perl object representation of the
  caBIO generic object.

=head2 Description

  The collection of components (modules, questions and valid values) comprising a template Case Report Form. A template form is not associated with any particular clinical trial.

=head3 Attributes of ProtocolFormsTemplate

  The following are all the attributes of the ProtocolFormsTemplate object and their data types:

	displayName	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of ProtocolFormsTemplate

  The following are all the objects that are associated with the ProtocolFormsTemplate:

=for html
<pre>
	<a href="#instruction">Instruction</a>: 	One to many assoication, use getInstructionCollection to get a collection of associated Instruction.
	<a href="#module">Module</a>: 	One to many assoication, use getModuleCollection to get a collection of associated Module.
  End Associations and related methods
<p>

=cut

# Below is module documentation for ProtocolFormsSet

=pod

=head1 ProtocolFormsSet

  CaCORE::CaDSR::ProtocolFormsSet - Perl extension for ProtocolFormsSet.

=head2 Abstract

  The CaCORE::CaDSR::bean::ProtocolFormsSet is a Perl object representation of the
  caBIO generic object.

=head2 Description

  Identification of a Clinical Trial Protocol document and its collection of Case Report Forms (CRFs).   Note: Protocols will be uniquely identified within each of the 3 areas of caCORE - caBIO, SPORES and caDSR-  using  the following three attributes: Protocol ID, Protocol Version and Context Name. This class will serve as a 'hook' across the three caCORE domains allowing a user to navigate across databases.

=head3 Attributes of ProtocolFormsSet

  The following are all the attributes of the ProtocolFormsSet object and their data types:

	reviewedDate	dateTime
	approvedDate	dateTime
	changeType	string
	leadOrganizationName	string
	phase	string
	type	string
	reviewedBy	string
	protocolId	string
	approvedBy	string
	changeNumber	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of ProtocolFormsSet

  The following are all the objects that are associated with the ProtocolFormsSet:

=for html
<pre>
	<a href="#casereportform">CaseReportForm</a>: 	One to many assoication, use getCaseReportFormCollection to get a collection of associated CaseReportForm.
  End Associations and related methods
<p>

=cut

# Below is module documentation for CaseReportForm

=pod

=head1 CaseReportForm

  CaCORE::CaDSR::CaseReportForm - Perl extension for CaseReportForm.

=head2 Abstract

  The CaCORE::CaDSR::bean::CaseReportForm is a Perl object representation of the
  caBIO generic object.

=head2 Description

  A questionnaire that documents all the patient data stipulated in the protocol and used by clinicians to record information about patient's visits while on the clinical trial.

=head3 Attributes of CaseReportForm

  The following are all the attributes of the CaseReportForm object and their data types:

	displayName	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of CaseReportForm

  The following are all the objects that are associated with the CaseReportForm:

=for html
<pre>
	<a href="#instruction">Instruction</a>: 	One to many assoication, use getInstructionCollection to get a collection of associated Instruction.
	<a href="#protocolformsset">ProtocolFormsSet</a>: 	Many to one assoication, use getProtocolFormsSet to get the associated ProtocolFormsSet.
	<a href="#module">Module</a>: 	One to many assoication, use getModuleCollection to get a collection of associated Module.
  End Associations and related methods
<p>

=cut

# Below is module documentation for Module

=pod

=head1 Module

  CaCORE::CaDSR::Module - Perl extension for Module.

=head2 Abstract

  The CaCORE::CaDSR::bean::Module is a Perl object representation of the
  caBIO generic object.

=head2 Description

  A collection of data elements, or Common Data Elements, logically grouped on a case report form.

=head3 Attributes of Module

  The following are all the attributes of the Module object and their data types:

	displayOrder	int
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of Module

  The following are all the objects that are associated with the Module:

=for html
<pre>
	<a href="#instruction">Instruction</a>: 	One to many assoication, use getInstructionCollection to get a collection of associated Instruction.
	<a href="#casereportform">CaseReportForm</a>: 	Many to one assoication, use getCaseReportForm to get the associated CaseReportForm.
	<a href="#protocolformstemplate">ProtocolFormsTemplate</a>: 	Many to one assoication, use getProtocolFormsTemplate to get the associated ProtocolFormsTemplate.
	<a href="#question">Question</a>: 	One to many assoication, use getQuestionCollection to get a collection of associated Question.
  End Associations and related methods
<p>

=cut

# Below is module documentation for Question

=pod

=head1 Question

  CaCORE::CaDSR::Question - Perl extension for Question.

=head2 Abstract

  The CaCORE::CaDSR::bean::Question is a Perl object representation of the
  caBIO generic object.

=head2 Description

  The actual text of the data element as specified on a Case Report Form of a Protocol.

=head3 Attributes of Question

  The following are all the attributes of the Question object and their data types:

	displayOrder	int
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of Question

  The following are all the objects that are associated with the Question:

=for html
<pre>
	<a href="#valuedomain">ValueDomain</a>: 	Many to one assoication, use getValueDomain to get the associated ValueDomain.
	<a href="#instruction">Instruction</a>: 	One to many assoication, use getInstructionCollection to get a collection of associated Instruction.
	<a href="#validvalue">ValidValue</a>: 	One to many assoication, use getValidValueCollection to get a collection of associated ValidValue.
	<a href="#dataelement">DataElement</a>: 	Many to one assoication, use getDataElement to get the associated DataElement.
	<a href="#module">Module</a>: 	Many to one assoication, use getModule to get the associated Module.
  End Associations and related methods
<p>

=cut

# Below is module documentation for EnumeratedValueDomain

=pod

=head1 EnumeratedValueDomain

  CaCORE::CaDSR::EnumeratedValueDomain - Perl extension for EnumeratedValueDomain.

=head2 Abstract

  The CaCORE::CaDSR::bean::EnumeratedValueDomain is a Perl object representation of the
  caBIO generic object.

=head2 Description

  

=head3 Attributes of EnumeratedValueDomain

  The following are all the attributes of the EnumeratedValueDomain object and their data types:

  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of EnumeratedValueDomain

  The following are all the objects that are associated with the EnumeratedValueDomain:

=for html
<pre>
	<a href="#valuedomainpermissiblevalue">ValueDomainPermissibleValue</a>: 	One to many assoication, use getValueDomainPermissibleValueCollection to get a collection of associated ValueDomainPermissibleValue.
  End Associations and related methods
<p>

=cut

# Below is module documentation for Concept

=pod

=head1 Concept

  CaCORE::CaDSR::Concept - Perl extension for Concept.

=head2 Abstract

  The CaCORE::CaDSR::bean::Concept is a Perl object representation of the
  caBIO generic object.

=head2 Description

  The concept for an administered component

=head3 Attributes of Concept

  The following are all the attributes of the Concept object and their data types:

	definitionSource	string
	evsSource	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of Concept

  The following are all the objects that are associated with the Concept:

=for html
<pre>
	<a href="#valuedomainpermissiblevalue">ValueDomainPermissibleValue</a>: 	One to many assoication, use getValueDomainPermissibleValueCollection to get a collection of associated ValueDomainPermissibleValue.
	<a href="#componentconcept">ComponentConcept</a>: 	One to many assoication, use getComponentConceptCollection to get a collection of associated ComponentConcept.
  End Associations and related methods
<p>

=cut

# Below is module documentation for ValueDomainPermissibleValue

=pod

=head1 ValueDomainPermissibleValue

  CaCORE::CaDSR::ValueDomainPermissibleValue - Perl extension for ValueDomainPermissibleValue.

=head2 Abstract

  The CaCORE::CaDSR::bean::ValueDomainPermissibleValue is a Perl object representation of the
  caBIO generic object.

=head2 Description

  This captures the many-to-many relationship between value domain and permissible values and allows to associate a value domain to a permissible value.

=head3 Attributes of ValueDomainPermissibleValue

  The following are all the attributes of the ValueDomainPermissibleValue object and their data types:

	modifiedBy	string
	beginDate	dateTime
	createdBy	string
	origin	string
	dateCreated	dateTime
	id	string
	dateModified	dateTime
	endDate	dateTime
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of ValueDomainPermissibleValue

  The following are all the objects that are associated with the ValueDomainPermissibleValue:

=for html
<pre>
	<a href="#enumeratedvaluedomain">EnumeratedValueDomain</a>: 	Many to one assoication, use getEnumeratedValueDomain to get the associated EnumeratedValueDomain.
	<a href="#concept">Concept</a>: 	Many to one assoication, use getConcept to get the associated Concept.
	<a href="#permissiblevalue">PermissibleValue</a>: 	Many to one assoication, use getPermissibleValue to get the associated PermissibleValue.
	<a href="#validvalue">ValidValue</a>: 	One to many assoication, use getValidValueCollection to get a collection of associated ValidValue.
  End Associations and related methods
<p>

=cut

# Below is module documentation for ValidValue

=pod

=head1 ValidValue

  CaCORE::CaDSR::ValidValue - Perl extension for ValidValue.

=head2 Abstract

  The CaCORE::CaDSR::bean::ValidValue is a Perl object representation of the
  caBIO generic object.

=head2 Description

  The allowable values for a given data element (question) on a Case Report Form.

=head3 Attributes of ValidValue

  The following are all the attributes of the ValidValue object and their data types:

	displayOrder	int
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of ValidValue

  The following are all the objects that are associated with the ValidValue:

=for html
<pre>
	<a href="#instruction">Instruction</a>: 	One to many assoication, use getInstructionCollection to get a collection of associated Instruction.
	<a href="#valuedomainpermissiblevalue">ValueDomainPermissibleValue</a>: 	Many to one assoication, use getValueDomainPermissibleValue to get the associated ValueDomainPermissibleValue.
	<a href="#question">Question</a>: 	Many to one assoication, use getQuestion to get the associated Question.
  End Associations and related methods
<p>

=cut

# Below is module documentation for Designation

=pod

=head1 Designation

  CaCORE::CaDSR::Designation - Perl extension for Designation.

=head2 Abstract

  The CaCORE::CaDSR::bean::Designation is a Perl object representation of the
  caBIO generic object.

=head2 Description

  A name by which an Administered Component is known in a specific Context. Also a placeholder to track the usage of Administered Components by different Contexts.

=head3 Attributes of Designation

  The following are all the attributes of the Designation object and their data types:

	languageName	string
	modifiedBy	string
	type	string
	dateModified	dateTime
	createdBy	string
	name	string
	dateCreated	dateTime
	id	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of Designation

  The following are all the objects that are associated with the Designation:

=for html
<pre>
	<a href="#context">Context</a>: 	Many to one assoication, use getContext to get the associated Context.
	<a href="#designationclassschemeitem">DesignationClassSchemeItem</a>: 	One to many assoication, use getDesignationClassSchemeItemCollection to get a collection of associated DesignationClassSchemeItem.
  End Associations and related methods
<p>

=cut

# Below is module documentation for NonenumeratedValueDomain

=pod

=head1 NonenumeratedValueDomain

  CaCORE::CaDSR::NonenumeratedValueDomain - Perl extension for NonenumeratedValueDomain.

=head2 Abstract

  The CaCORE::CaDSR::bean::NonenumeratedValueDomain is a Perl object representation of the
  caBIO generic object.

=head2 Description

  A value domain not expressed as a list of all permissible values.

=head3 Attributes of NonenumeratedValueDomain

  The following are all the attributes of the NonenumeratedValueDomain object and their data types:

  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of NonenumeratedValueDomain

  The following are all the objects that are associated with the NonenumeratedValueDomain:

=for html
<pre>
  End Associations and related methods
<p>

=cut

# Below is module documentation for DataElementConceptRelationship

=pod

=head1 DataElementConceptRelationship

  CaCORE::CaDSR::DataElementConceptRelationship - Perl extension for DataElementConceptRelationship.

=head2 Abstract

  The CaCORE::CaDSR::bean::DataElementConceptRelationship is a Perl object representation of the
  caBIO generic object.

=head2 Description

  A description of the affiliation between two occurrences of Data Element Concepts.

=head3 Attributes of DataElementConceptRelationship

  The following are all the attributes of the DataElementConceptRelationship object and their data types:

	modifiedBy	string
	dateModified	dateTime
	description	string
	createdBy	string
	name	string
	dateCreated	dateTime
	id	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of DataElementConceptRelationship

  The following are all the objects that are associated with the DataElementConceptRelationship:

=for html
<pre>
	<a href="#parentdataelementconcept">ParentDataElementConcept</a>: 	Many to one assoication, use getParentDataElementConcept to get the associated ParentDataElementConcept.
	<a href="#childdataelementconcept">ChildDataElementConcept</a>: 	Many to one assoication, use getChildDataElementConcept to get the associated ChildDataElementConcept.
  End Associations and related methods
<p>

=cut

# Below is module documentation for ClassSchemeClassSchemeItem

=pod

=head1 ClassSchemeClassSchemeItem

  CaCORE::CaDSR::ClassSchemeClassSchemeItem - Perl extension for ClassSchemeClassSchemeItem.

=head2 Abstract

  The CaCORE::CaDSR::bean::ClassSchemeClassSchemeItem is a Perl object representation of the
  caBIO generic object.

=head2 Description

  Information pertaining to the association between Classification Schemes and Classification Scheme Items.  This information is used to get all Classification Scheme Items that belong to a particular Classification Scheme as well as the information about t

=head3 Attributes of ClassSchemeClassSchemeItem

  The following are all the attributes of the ClassSchemeClassSchemeItem object and their data types:

	modifiedBy	string
	displayOrder	int
	createdBy	string
	dateCreated	dateTime
	id	string
	dateModified	dateTime
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of ClassSchemeClassSchemeItem

  The following are all the objects that are associated with the ClassSchemeClassSchemeItem:

=for html
<pre>
	<a href="#parentclassschemeclassschemeitem">ParentClassSchemeClassSchemeItem</a>: 	Many to one assoication, use getParentClassSchemeClassSchemeItem to get the associated ParentClassSchemeClassSchemeItem.
	<a href="#classificationscheme">ClassificationScheme</a>: 	Many to one assoication, use getClassificationScheme to get the associated ClassificationScheme.
	<a href="#definitionclassschemeitem">DefinitionClassSchemeItem</a>: 	One to many assoication, use getDefinitionClassSchemeItemCollection to get a collection of associated DefinitionClassSchemeItem.
	<a href="#administeredcomponentclassschemeitem">AdministeredComponentClassSchemeItem</a>: 	One to many assoication, use getAdministeredComponentClassSchemeItemCollection to get a collection of associated AdministeredComponentClassSchemeItem.
	<a href="#designationclassschemeitem">DesignationClassSchemeItem</a>: 	One to many assoication, use getDesignationClassSchemeItemCollection to get a collection of associated DesignationClassSchemeItem.
	<a href="#childclassschemeclassschemeitem">ChildClassSchemeClassSchemeItem</a>: 	One to many assoication, use getChildClassSchemeClassSchemeItemCollection to get a collection of associated ChildClassSchemeClassSchemeItem.
	<a href="#classificationschemeitem">ClassificationSchemeItem</a>: 	Many to one assoication, use getClassificationSchemeItem to get the associated ClassificationSchemeItem.
  End Associations and related methods
<p>

=cut

# Below is module documentation for DataElementDerivation

=pod

=head1 DataElementDerivation

  CaCORE::CaDSR::DataElementDerivation - Perl extension for DataElementDerivation.

=head2 Abstract

  The CaCORE::CaDSR::bean::DataElementDerivation is a Perl object representation of the
  caBIO generic object.

=head2 Description

  The data element component(s) used for a derived data element.

=head3 Attributes of DataElementDerivation

  The following are all the attributes of the DataElementDerivation object and their data types:

	modifiedBy	string
	displayOrder	int
	dateModified	dateTime
	createdBy	string
	dateCreated	dateTime
	id	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of DataElementDerivation

  The following are all the objects that are associated with the DataElementDerivation:

=for html
<pre>
	<a href="#dataelement">DataElement</a>: 	Many to one assoication, use getDataElement to get the associated DataElement.
	<a href="#deriveddataelement">DerivedDataElement</a>: 	Many to one assoication, use getDerivedDataElement to get the associated DerivedDataElement.
  End Associations and related methods
<p>

=cut

# Below is module documentation for AdministeredComponentClassSchemeItem

=pod

=head1 AdministeredComponentClassSchemeItem

  CaCORE::CaDSR::AdministeredComponentClassSchemeItem - Perl extension for AdministeredComponentClassSchemeItem.

=head2 Abstract

  The CaCORE::CaDSR::bean::AdministeredComponentClassSchemeItem is a Perl object representation of the
  caBIO generic object.

=head2 Description

  A class that serves to allow many to many relationships between Administered Component and ClassSchemeClassSchemeItem, providing uniqueness to the CS/CSI pairing to an AC.

=head3 Attributes of AdministeredComponentClassSchemeItem

  The following are all the attributes of the AdministeredComponentClassSchemeItem object and their data types:

	modifiedBy	string
	dateModified	dateTime
	createdBy	string
	dateCreated	dateTime
	id	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of AdministeredComponentClassSchemeItem

  The following are all the objects that are associated with the AdministeredComponentClassSchemeItem:

=for html
<pre>
	<a href="#classschemeclassschemeitem">ClassSchemeClassSchemeItem</a>: 	Many to one assoication, use getClassSchemeClassSchemeItem to get the associated ClassSchemeClassSchemeItem.
  End Associations and related methods
<p>

=cut

# Below is module documentation for Instruction

=pod

=head1 Instruction

  CaCORE::CaDSR::Instruction - Perl extension for Instruction.

=head2 Abstract

  The CaCORE::CaDSR::bean::Instruction is a Perl object representation of the
  caBIO generic object.

=head2 Description

  Instruction for a Form, Module, Question or Valid Value on a Form

=head3 Attributes of Instruction

  The following are all the attributes of the Instruction object and their data types:

	type	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of Instruction

  The following are all the objects that are associated with the Instruction:

=for html
<pre>
	<a href="#validvalue">ValidValue</a>: 	Many to one assoication, use getValidValue to get the associated ValidValue.
	<a href="#casereportform">CaseReportForm</a>: 	Many to one assoication, use getCaseReportForm to get the associated CaseReportForm.
	<a href="#protocolformstemplate">ProtocolFormsTemplate</a>: 	Many to one assoication, use getProtocolFormsTemplate to get the associated ProtocolFormsTemplate.
	<a href="#module">Module</a>: 	Many to one assoication, use getModule to get the associated Module.
	<a href="#question">Question</a>: 	Many to one assoication, use getQuestion to get the associated Question.
  End Associations and related methods
<p>

=cut

# Below is module documentation for DataElementRelationship

=pod

=head1 DataElementRelationship

  CaCORE::CaDSR::DataElementRelationship - Perl extension for DataElementRelationship.

=head2 Abstract

  The CaCORE::CaDSR::bean::DataElementRelationship is a Perl object representation of the
  caBIO generic object.

=head2 Description

  The affiliation between two occurrences of Data Elements.

=head3 Attributes of DataElementRelationship

  The following are all the attributes of the DataElementRelationship object and their data types:

	modifiedBy	string
	dateModified	dateTime
	createdBy	string
	name	string
	dateCreated	dateTime
	id	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of DataElementRelationship

  The following are all the objects that are associated with the DataElementRelationship:

=for html
<pre>
	<a href="#parentdataelement">ParentDataElement</a>: 	Many to one assoication, use getParentDataElement to get the associated ParentDataElement.
	<a href="#childdataelement">ChildDataElement</a>: 	Many to one assoication, use getChildDataElement to get the associated ChildDataElement.
  End Associations and related methods
<p>

=cut

# Below is module documentation for ValueDomainRelationship

=pod

=head1 ValueDomainRelationship

  CaCORE::CaDSR::ValueDomainRelationship - Perl extension for ValueDomainRelationship.

=head2 Abstract

  The CaCORE::CaDSR::bean::ValueDomainRelationship is a Perl object representation of the
  caBIO generic object.

=head2 Description

  The affiliation between two occurrences of Value Domains.

=head3 Attributes of ValueDomainRelationship

  The following are all the attributes of the ValueDomainRelationship object and their data types:

	modifiedBy	string
	dateModified	dateTime
	createdBy	string
	name	string
	dateCreated	dateTime
	id	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of ValueDomainRelationship

  The following are all the objects that are associated with the ValueDomainRelationship:

=for html
<pre>
	<a href="#parentvaluedomain">ParentValueDomain</a>: 	Many to one assoication, use getParentValueDomain to get the associated ParentValueDomain.
	<a href="#childvaluedomain">ChildValueDomain</a>: 	Many to one assoication, use getChildValueDomain to get the associated ChildValueDomain.
  End Associations and related methods
<p>

=cut

# Below is module documentation for ClassificationSchemeRelationship

=pod

=head1 ClassificationSchemeRelationship

  CaCORE::CaDSR::ClassificationSchemeRelationship - Perl extension for ClassificationSchemeRelationship.

=head2 Abstract

  The CaCORE::CaDSR::bean::ClassificationSchemeRelationship is a Perl object representation of the
  caBIO generic object.

=head2 Description

  The affiliation between two occurrences of Classification Schemes.

=head3 Attributes of ClassificationSchemeRelationship

  The following are all the attributes of the ClassificationSchemeRelationship object and their data types:

	modifiedBy	string
	displayOrder	int
	dateModified	dateTime
	createdBy	string
	name	string
	dateCreated	dateTime
	id	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of ClassificationSchemeRelationship

  The following are all the objects that are associated with the ClassificationSchemeRelationship:

=for html
<pre>
	<a href="#childclassificationscheme">ChildClassificationScheme</a>: 	Many to one assoication, use getChildClassificationScheme to get the associated ChildClassificationScheme.
	<a href="#parentclassificationscheme">ParentClassificationScheme</a>: 	Many to one assoication, use getParentClassificationScheme to get the associated ParentClassificationScheme.
  End Associations and related methods
<p>

=cut

# Below is module documentation for ClassificationSchemeItemRelationship

=pod

=head1 ClassificationSchemeItemRelationship

  CaCORE::CaDSR::ClassificationSchemeItemRelationship - Perl extension for ClassificationSchemeItemRelationship.

=head2 Abstract

  The CaCORE::CaDSR::bean::ClassificationSchemeItemRelationship is a Perl object representation of the
  caBIO generic object.

=head2 Description

  The affiliation between two occurrences of Classification Scheme Items.

=head3 Attributes of ClassificationSchemeItemRelationship

  The following are all the attributes of the ClassificationSchemeItemRelationship object and their data types:

	modifiedBy	string
	dateModified	dateTime
	createdBy	string
	name	string
	dateCreated	dateTime
	id	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of ClassificationSchemeItemRelationship

  The following are all the objects that are associated with the ClassificationSchemeItemRelationship:

=for html
<pre>
	<a href="#childclassificationschemeitem">ChildClassificationSchemeItem</a>: 	Many to one assoication, use getChildClassificationSchemeItem to get the associated ChildClassificationSchemeItem.
	<a href="#parentclassificationschemeitem">ParentClassificationSchemeItem</a>: 	Many to one assoication, use getParentClassificationSchemeItem to get the associated ParentClassificationSchemeItem.
  End Associations and related methods
<p>

=cut

# Below is module documentation for ObjectClassRelationship

=pod

=head1 ObjectClassRelationship

  CaCORE::CaDSR::ObjectClassRelationship - Perl extension for ObjectClassRelationship.

=head2 Abstract

  The CaCORE::CaDSR::bean::ObjectClassRelationship is a Perl object representation of the
  caBIO generic object.

=head2 Description

  A description of the affiliation between two occurrences of Object  Classes

=head3 Attributes of ObjectClassRelationship

  The following are all the attributes of the ObjectClassRelationship object and their data types:

	targetHighMultiplicity	int
	targetRole	string
	name	string
	sourceHighMultiplicity	int
	sourceRole	string
	direction	string
	sourceLowMultiplicity	int
	targetLowMultiplicity	int
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of ObjectClassRelationship

  The following are all the objects that are associated with the ObjectClassRelationship:

=for html
<pre>
	<a href="#sourceobjectclass">SourceObjectClass</a>: 	Many to one assoication, use getSourceObjectClass to get the associated SourceObjectClass.
	<a href="#targetobjectclass">TargetObjectClass</a>: 	Many to one assoication, use getTargetObjectClass to get the associated TargetObjectClass.
  End Associations and related methods
<p>

=cut

# Below is module documentation for ComponentConcept

=pod

=head1 ComponentConcept

  CaCORE::CaDSR::ComponentConcept - Perl extension for ComponentConcept.

=head2 Abstract

  The CaCORE::CaDSR::bean::ComponentConcept is a Perl object representation of the
  caBIO generic object.

=head2 Description

  The concept component(s) used for a concept derivation

=head3 Attributes of ComponentConcept

  The following are all the attributes of the ComponentConcept object and their data types:

	displayOrder	int
	primaryFlag	string
	id	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of ComponentConcept

  The following are all the objects that are associated with the ComponentConcept:

=for html
<pre>
	<a href="#derivationrule">DerivationRule</a>: 	Many to one assoication, use getDerivationRule to get the associated DerivationRule.
	<a href="#concept">Concept</a>: 	Many to one assoication, use getConcept to get the associated Concept.
  End Associations and related methods
<p>

=cut

# Below is module documentation for Definition

=pod

=head1 Definition

  CaCORE::CaDSR::Definition - Perl extension for Definition.

=head2 Abstract

  The CaCORE::CaDSR::bean::Definition is a Perl object representation of the
  caBIO generic object.

=head2 Description

  A defintion for an Administered Component  in a specific Context.

=head3 Attributes of Definition

  The following are all the attributes of the Definition object and their data types:

	languageName	string
	modifiedBy	string
	text	string
	type	string
	dateModified	dateTime
	createdBy	string
	dateCreated	dateTime
	id	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of Definition

  The following are all the objects that are associated with the Definition:

=for html
<pre>
	<a href="#definitionclassschemeitem">DefinitionClassSchemeItem</a>: 	One to many assoication, use getDefinitionClassSchemeItemCollection to get a collection of associated DefinitionClassSchemeItem.
	<a href="#context">Context</a>: 	Many to one assoication, use getContext to get the associated Context.
	<a href="#administeredcomponent">AdministeredComponent</a>: 	Many to one assoication, use getAdministeredComponent to get the associated AdministeredComponent.
  End Associations and related methods
<p>

=cut

# Below is module documentation for DesignationClassSchemeItem

=pod

=head1 DesignationClassSchemeItem

  CaCORE::CaDSR::DesignationClassSchemeItem - Perl extension for DesignationClassSchemeItem.

=head2 Abstract

  The CaCORE::CaDSR::bean::DesignationClassSchemeItem is a Perl object representation of the
  caBIO generic object.

=head2 Description

  A class that serves to allow many to many relationships between Designation and ClassSchemeClassSchemeItem, providing uniqueness to the CS/CSI pairing to an Designation.

=head3 Attributes of DesignationClassSchemeItem

  The following are all the attributes of the DesignationClassSchemeItem object and their data types:

	modifiedBy	string
	dateModified	dateTime
	createdBy	string
	dateCreated	dateTime
	id	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of DesignationClassSchemeItem

  The following are all the objects that are associated with the DesignationClassSchemeItem:

=for html
<pre>
	<a href="#designation">Designation</a>: 	Many to one assoication, use getDesignation to get the associated Designation.
	<a href="#classschemeclassschemeitem">ClassSchemeClassSchemeItem</a>: 	Many to one assoication, use getClassSchemeClassSchemeItem to get the associated ClassSchemeClassSchemeItem.
  End Associations and related methods
<p>

=cut

# Below is module documentation for DefinitionClassSchemeItem

=pod

=head1 DefinitionClassSchemeItem

  CaCORE::CaDSR::DefinitionClassSchemeItem - Perl extension for DefinitionClassSchemeItem.

=head2 Abstract

  The CaCORE::CaDSR::bean::DefinitionClassSchemeItem is a Perl object representation of the
  caBIO generic object.

=head2 Description

  

=head3 Attributes of DefinitionClassSchemeItem

  The following are all the attributes of the DefinitionClassSchemeItem object and their data types:

	modifiedBy	string
	dateModified	dateTime
	createdBy	string
	dateCreated	dateTime
	id	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of DefinitionClassSchemeItem

  The following are all the objects that are associated with the DefinitionClassSchemeItem:

=for html
<pre>
	<a href="#classschemeclassschemeitem">ClassSchemeClassSchemeItem</a>: 	Many to one assoication, use getClassSchemeClassSchemeItem to get the associated ClassSchemeClassSchemeItem.
	<a href="#definition">Definition</a>: 	Many to one assoication, use getDefinition to get the associated Definition.
  End Associations and related methods
<p>

=cut

