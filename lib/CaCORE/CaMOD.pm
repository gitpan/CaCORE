# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::Conditionality;

use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##

$VERSION = '3.092';

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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":Conditionality\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# conditionedBy;
	if( defined( $self->getConditionedBy ) ) {
		$tmpstr = "<conditionedBy xsi:type=\"xsd:string\">" . $self->getConditionedBy . "</conditionedBy>";
	} else {
		$tmpstr = "<conditionedBy xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# description;
	if( defined( $self->getDescription ) ) {
		$tmpstr = "<description xsi:type=\"xsd:string\">" . $self->getDescription . "</description>";
	} else {
		$tmpstr = "<description xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of Conditionality objects
# param: xml doc
# returns: list of Conditionality objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of Conditionality objects
# param: xml node
# returns: a list of Conditionality objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one Conditionality object
# param: xml node
# returns: one Conditionality object
sub fromWSXMLNode {
	my $ConditionalityNode = $_[1];
	
	## begin ELEMENT_NODE children ##
		my $conditionedBy;
		my $description;
		my $id;
	## end ELEMENT_NODE children ##

	# get all children for this node
	for my $childrenNode ($ConditionalityNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		if( ! defined($childrenNode->getFirstChild) ){ next; };
		my $textNode = $childrenNode->getFirstChild;
		## begin iterate ELEMENT_NODE ##
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "conditionedBy") {
				$conditionedBy=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "description") {
				$description=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
		## end iterate ELEMENT_NODE ##
	    }
	}
	my $newobj = new CaCORE::CaMOD::Conditionality;
	## begin set attr ##
		$newobj->setConditionedBy($conditionedBy);
		$newobj->setDescription($description);
		$newobj->setId($id);
	## end set attr ##
	
	return $newobj;
}

## begin getters and setters ##

sub getConditionedBy {
	my $self = shift;
	return $self->{conditionedBy};
}

sub setConditionedBy {
	my $self = shift;
	$self->{conditionedBy} = shift;
}

sub getDescription {
	my $self = shift;
	return $self->{description};
}

sub setDescription {
	my $self = shift;
	$self->{description} = shift;
}

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
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::Nomenclature;

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":Nomenclature\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of Nomenclature objects
# param: xml doc
# returns: list of Nomenclature objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of Nomenclature objects
# param: xml node
# returns: a list of Nomenclature objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one Nomenclature object
# param: xml node
# returns: one Nomenclature object
sub fromWSXMLNode {
	my $NomenclatureNode = $_[1];
	
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
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "id") {
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
	
	return $newobj;
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

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":GenotypeSummary\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# genotype;
	if( defined( $self->getGenotype ) ) {
		$tmpstr = "<genotype xsi:type=\"xsd:string\">" . $self->getGenotype . "</genotype>";
	} else {
		$tmpstr = "<genotype xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# summary;
	if( defined( $self->getSummary ) ) {
		$tmpstr = "<summary xsi:type=\"xsd:string\">" . $self->getSummary . "</summary>";
	} else {
		$tmpstr = "<summary xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of GenotypeSummary objects
# param: xml doc
# returns: list of GenotypeSummary objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of GenotypeSummary objects
# param: xml node
# returns: a list of GenotypeSummary objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one GenotypeSummary object
# param: xml node
# returns: one GenotypeSummary object
sub fromWSXMLNode {
	my $GenotypeSummaryNode = $_[1];
	
	## begin ELEMENT_NODE children ##
		my $genotype;
		my $id;
		my $summary;
	## end ELEMENT_NODE children ##

	# get all children for this node
	for my $childrenNode ($GenotypeSummaryNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		if( ! defined($childrenNode->getFirstChild) ){ next; };
		my $textNode = $childrenNode->getFirstChild;
		## begin iterate ELEMENT_NODE ##
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "genotype") {
				$genotype=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "summary") {
				$summary=$textNode->getNodeValue;
			}
		## end iterate ELEMENT_NODE ##
	    }
	}
	my $newobj = new CaCORE::CaMOD::GenotypeSummary;
	## begin set attr ##
		$newobj->setGenotype($genotype);
		$newobj->setId($id);
		$newobj->setSummary($summary);
	## end set attr ##
	
	return $newobj;
}

## begin getters and setters ##

sub getGenotype {
	my $self = shift;
	return $self->{genotype};
}

sub setGenotype {
	my $self = shift;
	$self->{genotype} = shift;
}

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
package CaCORE::CaMOD::Availability;

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":Availability\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# enteredDate;
	if( defined( $self->getEnteredDate ) ) {
		$tmpstr = "<enteredDate xsi:type=\"xsd:dateTime\">" . $self->getEnteredDate . "</enteredDate>";
	} else {
		$tmpstr = "<enteredDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# modifiedDate;
	if( defined( $self->getModifiedDate ) ) {
		$tmpstr = "<modifiedDate xsi:type=\"xsd:dateTime\">" . $self->getModifiedDate . "</modifiedDate>";
	} else {
		$tmpstr = "<modifiedDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# releaseDate;
	if( defined( $self->getReleaseDate ) ) {
		$tmpstr = "<releaseDate xsi:type=\"xsd:dateTime\">" . $self->getReleaseDate . "</releaseDate>";
	} else {
		$tmpstr = "<releaseDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# visibleTo;
	if( defined( $self->getVisibleTo ) ) {
		$tmpstr = "<visibleTo xsi:type=\"xsd:string\">" . $self->getVisibleTo . "</visibleTo>";
	} else {
		$tmpstr = "<visibleTo xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of Availability objects
# param: xml doc
# returns: list of Availability objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of Availability objects
# param: xml node
# returns: a list of Availability objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one Availability object
# param: xml node
# returns: one Availability object
sub fromWSXMLNode {
	my $AvailabilityNode = $_[1];
	
	## begin ELEMENT_NODE children ##
		my $enteredDate;
		my $id;
		my $modifiedDate;
		my $releaseDate;
		my $visibleTo;
	## end ELEMENT_NODE children ##

	# get all children for this node
	for my $childrenNode ($AvailabilityNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		if( ! defined($childrenNode->getFirstChild) ){ next; };
		my $textNode = $childrenNode->getFirstChild;
		## begin iterate ELEMENT_NODE ##
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "enteredDate") {
				$enteredDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modifiedDate") {
				$modifiedDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "releaseDate") {
				$releaseDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "visibleTo") {
				$visibleTo=$textNode->getNodeValue;
			}
		## end iterate ELEMENT_NODE ##
	    }
	}
	my $newobj = new CaCORE::CaMOD::Availability;
	## begin set attr ##
		$newobj->setEnteredDate($enteredDate);
		$newobj->setId($id);
		$newobj->setModifiedDate($modifiedDate);
		$newobj->setReleaseDate($releaseDate);
		$newobj->setVisibleTo($visibleTo);
	## end set attr ##
	
	return $newobj;
}

## begin getters and setters ##

sub getEnteredDate {
	my $self = shift;
	return $self->{enteredDate};
}

sub setEnteredDate {
	my $self = shift;
	$self->{enteredDate} = shift;
}

sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getModifiedDate {
	my $self = shift;
	return $self->{modifiedDate};
}

sub setModifiedDate {
	my $self = shift;
	$self->{modifiedDate} = shift;
}

sub getReleaseDate {
	my $self = shift;
	return $self->{releaseDate};
}

sub setReleaseDate {
	my $self = shift;
	$self->{releaseDate} = shift;
}

sub getVisibleTo {
	my $self = shift;
	return $self->{visibleTo};
}

sub setVisibleTo {
	my $self = shift;
	$self->{visibleTo} = shift;
}

## end getters and setters ##

## begin bean association methods ##

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::Image;

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":Image\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# description;
	if( defined( $self->getDescription ) ) {
		$tmpstr = "<description xsi:type=\"xsd:string\">" . $self->getDescription . "</description>";
	} else {
		$tmpstr = "<description xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# staining;
	if( defined( $self->getStaining ) ) {
		$tmpstr = "<staining xsi:type=\"xsd:string\">" . $self->getStaining . "</staining>";
	} else {
		$tmpstr = "<staining xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# title;
	if( defined( $self->getTitle ) ) {
		$tmpstr = "<title xsi:type=\"xsd:string\">" . $self->getTitle . "</title>";
	} else {
		$tmpstr = "<title xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of Image objects
# param: xml doc
# returns: list of Image objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of Image objects
# param: xml node
# returns: a list of Image objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one Image object
# param: xml node
# returns: one Image object
sub fromWSXMLNode {
	my $ImageNode = $_[1];
	
	## begin ELEMENT_NODE children ##
		my $description;
		my $id;
		my $staining;
		my $title;
	## end ELEMENT_NODE children ##

	# get all children for this node
	for my $childrenNode ($ImageNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		if( ! defined($childrenNode->getFirstChild) ){ next; };
		my $textNode = $childrenNode->getFirstChild;
		## begin iterate ELEMENT_NODE ##
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "description") {
				$description=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "staining") {
				$staining=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "title") {
				$title=$textNode->getNodeValue;
			}
		## end iterate ELEMENT_NODE ##
	    }
	}
	my $newobj = new CaCORE::CaMOD::Image;
	## begin set attr ##
		$newobj->setDescription($description);
		$newobj->setId($id);
		$newobj->setStaining($staining);
		$newobj->setTitle($title);
	## end set attr ##
	
	return $newobj;
}

## begin getters and setters ##

sub getDescription {
	my $self = shift;
	return $self->{description};
}

sub setDescription {
	my $self = shift;
	$self->{description} = shift;
}

sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getStaining {
	my $self = shift;
	return $self->{staining};
}

sub setStaining {
	my $self = shift;
	$self->{staining} = shift;
}

sub getTitle {
	my $self = shift;
	return $self->{title};
}

sub setTitle {
	my $self = shift;
	$self->{title} = shift;
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

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":EngineeredGene\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# cabioId;
	if( defined( $self->getCabioId ) ) {
		$tmpstr = "<cabioId xsi:type=\"xsd:long\">" . $self->getCabioId . "</cabioId>";
	} else {
		$tmpstr = "<cabioId xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of EngineeredGene objects
# param: xml doc
# returns: list of EngineeredGene objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of EngineeredGene objects
# param: xml node
# returns: a list of EngineeredGene objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one EngineeredGene object
# param: xml node
# returns: one EngineeredGene object
sub fromWSXMLNode {
	my $EngineeredGeneNode = $_[1];
	
	## begin ELEMENT_NODE children ##
		my $cabioId;
		my $id;
		my $name;
	## end ELEMENT_NODE children ##

	# get all children for this node
	for my $childrenNode ($EngineeredGeneNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		if( ! defined($childrenNode->getFirstChild) ){ next; };
		my $textNode = $childrenNode->getFirstChild;
		## begin iterate ELEMENT_NODE ##
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "cabioId") {
				$cabioId=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
		## end iterate ELEMENT_NODE ##
	    }
	}
	my $newobj = new CaCORE::CaMOD::EngineeredGene;
	## begin set attr ##
		$newobj->setCabioId($cabioId);
		$newobj->setId($id);
		$newobj->setName($name);
	## end set attr ##
	
	return $newobj;
}

## begin getters and setters ##

sub getCabioId {
	my $self = shift;
	return $self->{cabioId};
}

sub setCabioId {
	my $self = shift;
	$self->{cabioId} = shift;
}

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

sub getConditionality {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::Conditionality", $self);
	return $results[0];
}

sub getDatabaseCrossReferenceCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::Common::DatabaseCrossReference", $self);
	return @results;
}

sub getExpressionFeatureCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::ExpressionFeature", $self);
	return @results;
}

sub getGeneCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Gene", $self);
	return @results;
}

sub getGenotypeSummary {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::GenotypeSummary", $self);
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
package CaCORE::CaMOD::ApprovalStatus;

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":ApprovalStatus\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of ApprovalStatus objects
# param: xml doc
# returns: list of ApprovalStatus objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of ApprovalStatus objects
# param: xml node
# returns: a list of ApprovalStatus objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one ApprovalStatus object
# param: xml node
# returns: one ApprovalStatus object
sub fromWSXMLNode {
	my $ApprovalStatusNode = $_[1];
	
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
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "id") {
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
	
	return $newobj;
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
package CaCORE::CaMOD::AbstractCancerModel;

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":AbstractCancerModel\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# experimentDesign;
	if( defined( $self->getExperimentDesign ) ) {
		$tmpstr = "<experimentDesign xsi:type=\"xsd:string\">" . $self->getExperimentDesign . "</experimentDesign>";
	} else {
		$tmpstr = "<experimentDesign xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# modelDescriptor;
	if( defined( $self->getModelDescriptor ) ) {
		$tmpstr = "<modelDescriptor xsi:type=\"xsd:string\">" . $self->getModelDescriptor . "</modelDescriptor>";
	} else {
		$tmpstr = "<modelDescriptor xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of AbstractCancerModel objects
# param: xml doc
# returns: list of AbstractCancerModel objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of AbstractCancerModel objects
# param: xml node
# returns: a list of AbstractCancerModel objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one AbstractCancerModel object
# param: xml node
# returns: one AbstractCancerModel object
sub fromWSXMLNode {
	my $AbstractCancerModelNode = $_[1];
	
	## begin ELEMENT_NODE children ##
		my $experimentDesign;
		my $id;
		my $modelDescriptor;
	## end ELEMENT_NODE children ##

	# get all children for this node
	for my $childrenNode ($AbstractCancerModelNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		if( ! defined($childrenNode->getFirstChild) ){ next; };
		my $textNode = $childrenNode->getFirstChild;
		## begin iterate ELEMENT_NODE ##
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "experimentDesign") {
				$experimentDesign=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modelDescriptor") {
				$modelDescriptor=$textNode->getNodeValue;
			}
		## end iterate ELEMENT_NODE ##
	    }
	}
	my $newobj = new CaCORE::CaMOD::AbstractCancerModel;
	## begin set attr ##
		$newobj->setExperimentDesign($experimentDesign);
		$newobj->setId($id);
		$newobj->setModelDescriptor($modelDescriptor);
	## end set attr ##
	
	return $newobj;
}

## begin getters and setters ##

sub getExperimentDesign {
	my $self = shift;
	return $self->{experimentDesign};
}

sub setExperimentDesign {
	my $self = shift;
	$self->{experimentDesign} = shift;
}

sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
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

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":TumorCode\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# code;
	if( defined( $self->getCode ) ) {
		$tmpstr = "<code xsi:type=\"xsd:string\">" . $self->getCode . "</code>";
	} else {
		$tmpstr = "<code xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# description;
	if( defined( $self->getDescription ) ) {
		$tmpstr = "<description xsi:type=\"xsd:string\">" . $self->getDescription . "</description>";
	} else {
		$tmpstr = "<description xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of TumorCode objects
# param: xml doc
# returns: list of TumorCode objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of TumorCode objects
# param: xml node
# returns: a list of TumorCode objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one TumorCode object
# param: xml node
# returns: one TumorCode object
sub fromWSXMLNode {
	my $TumorCodeNode = $_[1];
	
	## begin ELEMENT_NODE children ##
		my $code;
		my $description;
		my $id;
	## end ELEMENT_NODE children ##

	# get all children for this node
	for my $childrenNode ($TumorCodeNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		if( ! defined($childrenNode->getFirstChild) ){ next; };
		my $textNode = $childrenNode->getFirstChild;
		## begin iterate ELEMENT_NODE ##
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "code") {
				$code=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "description") {
				$description=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
		## end iterate ELEMENT_NODE ##
	    }
	}
	my $newobj = new CaCORE::CaMOD::TumorCode;
	## begin set attr ##
		$newobj->setCode($code);
		$newobj->setDescription($description);
		$newobj->setId($id);
	## end set attr ##
	
	return $newobj;
}

## begin getters and setters ##

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
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::Xenograft;

use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##


@ISA = qw(CaCORE::CaMOD::AbstractCancerModel);
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":Xenograft\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# administrativeSite;
	if( defined( $self->getAdministrativeSite ) ) {
		$tmpstr = "<administrativeSite xsi:type=\"xsd:string\">" . $self->getAdministrativeSite . "</administrativeSite>";
	} else {
		$tmpstr = "<administrativeSite xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# geneticManipulation;
	if( defined( $self->getGeneticManipulation ) ) {
		$tmpstr = "<geneticManipulation xsi:type=\"xsd:string\">" . $self->getGeneticManipulation . "</geneticManipulation>";
	} else {
		$tmpstr = "<geneticManipulation xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# modificationDescription;
	if( defined( $self->getModificationDescription ) ) {
		$tmpstr = "<modificationDescription xsi:type=\"xsd:string\">" . $self->getModificationDescription . "</modificationDescription>";
	} else {
		$tmpstr = "<modificationDescription xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# parentalCellLineName;
	if( defined( $self->getParentalCellLineName ) ) {
		$tmpstr = "<parentalCellLineName xsi:type=\"xsd:string\">" . $self->getParentalCellLineName . "</parentalCellLineName>";
	} else {
		$tmpstr = "<parentalCellLineName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# type;
	if( defined( $self->getType ) ) {
		$tmpstr = "<type xsi:type=\"xsd:string\">" . $self->getType . "</type>";
	} else {
		$tmpstr = "<type xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# experimentDesign;
	if( defined( $self->getExperimentDesign ) ) {
		$tmpstr = "<experimentDesign xsi:type=\"xsd:string\">" . $self->getExperimentDesign . "</experimentDesign>";
	} else {
		$tmpstr = "<experimentDesign xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# modelDescriptor;
	if( defined( $self->getModelDescriptor ) ) {
		$tmpstr = "<modelDescriptor xsi:type=\"xsd:string\">" . $self->getModelDescriptor . "</modelDescriptor>";
	} else {
		$tmpstr = "<modelDescriptor xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of Xenograft objects
# param: xml doc
# returns: list of Xenograft objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of Xenograft objects
# param: xml node
# returns: a list of Xenograft objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one Xenograft object
# param: xml node
# returns: one Xenograft object
sub fromWSXMLNode {
	my $XenograftNode = $_[1];
	
	## begin ELEMENT_NODE children ##
		my $administrativeSite;
		my $geneticManipulation;
		my $modificationDescription;
		my $name;
		my $parentalCellLineName;
		my $type;
		my $experimentDesign;
		my $id;
		my $modelDescriptor;
	## end ELEMENT_NODE children ##

	# get all children for this node
	for my $childrenNode ($XenograftNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		if( ! defined($childrenNode->getFirstChild) ){ next; };
		my $textNode = $childrenNode->getFirstChild;
		## begin iterate ELEMENT_NODE ##
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "administrativeSite") {
				$administrativeSite=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "geneticManipulation") {
				$geneticManipulation=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modificationDescription") {
				$modificationDescription=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "parentalCellLineName") {
				$parentalCellLineName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "type") {
				$type=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "experimentDesign") {
				$experimentDesign=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modelDescriptor") {
				$modelDescriptor=$textNode->getNodeValue;
			}
		## end iterate ELEMENT_NODE ##
	    }
	}
	my $newobj = new CaCORE::CaMOD::Xenograft;
	## begin set attr ##
		$newobj->setAdministrativeSite($administrativeSite);
		$newobj->setGeneticManipulation($geneticManipulation);
		$newobj->setModificationDescription($modificationDescription);
		$newobj->setName($name);
		$newobj->setParentalCellLineName($parentalCellLineName);
		$newobj->setType($type);
		$newobj->setExperimentDesign($experimentDesign);
		$newobj->setId($id);
		$newobj->setModelDescriptor($modelDescriptor);
	## end set attr ##
	
	return $newobj;
}

## begin getters and setters ##

sub getAdministrativeSite {
	my $self = shift;
	return $self->{administrativeSite};
}

sub setAdministrativeSite {
	my $self = shift;
	$self->{administrativeSite} = shift;
}

sub getGeneticManipulation {
	my $self = shift;
	return $self->{geneticManipulation};
}

sub setGeneticManipulation {
	my $self = shift;
	$self->{geneticManipulation} = shift;
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

sub getParentalCellLineName {
	my $self = shift;
	return $self->{parentalCellLineName};
}

sub setParentalCellLineName {
	my $self = shift;
	$self->{parentalCellLineName} = shift;
}

sub getType {
	my $self = shift;
	return $self->{type};
}

sub setType {
	my $self = shift;
	$self->{type} = shift;
}

sub getExperimentDesign {
	my $self = shift;
	return $self->{experimentDesign};
}

sub setExperimentDesign {
	my $self = shift;
	$self->{experimentDesign} = shift;
}

sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
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

sub getHostTaxon {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Taxon", $self);
	return $results[0];
}

sub getInvivoResultCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::InvivoResult", $self);
	return @results;
}

sub getOriginTaxon {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Taxon", $self);
	return $results[0];
}

sub getTumorCode {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::TumorCode", $self);
	return $results[0];
}

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
package CaCORE::CaMOD::TreatmentSchedule;

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":TreatmentSchedule\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# dosage;
	if( defined( $self->getDosage ) ) {
		$tmpstr = "<dosage xsi:type=\"xsd:string\">" . $self->getDosage . "</dosage>";
	} else {
		$tmpstr = "<dosage xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# regimen;
	if( defined( $self->getRegimen ) ) {
		$tmpstr = "<regimen xsi:type=\"xsd:string\">" . $self->getRegimen . "</regimen>";
	} else {
		$tmpstr = "<regimen xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of TreatmentSchedule objects
# param: xml doc
# returns: list of TreatmentSchedule objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of TreatmentSchedule objects
# param: xml node
# returns: a list of TreatmentSchedule objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one TreatmentSchedule object
# param: xml node
# returns: one TreatmentSchedule object
sub fromWSXMLNode {
	my $TreatmentScheduleNode = $_[1];
	
	## begin ELEMENT_NODE children ##
		my $dosage;
		my $id;
		my $regimen;
	## end ELEMENT_NODE children ##

	# get all children for this node
	for my $childrenNode ($TreatmentScheduleNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		if( ! defined($childrenNode->getFirstChild) ){ next; };
		my $textNode = $childrenNode->getFirstChild;
		## begin iterate ELEMENT_NODE ##
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "dosage") {
				$dosage=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "regimen") {
				$regimen=$textNode->getNodeValue;
			}
		## end iterate ELEMENT_NODE ##
	    }
	}
	my $newobj = new CaCORE::CaMOD::TreatmentSchedule;
	## begin set attr ##
		$newobj->setDosage($dosage);
		$newobj->setId($id);
		$newobj->setRegimen($regimen);
	## end set attr ##
	
	return $newobj;
}

## begin getters and setters ##

sub getDosage {
	my $self = shift;
	return $self->{dosage};
}

sub setDosage {
	my $self = shift;
	$self->{dosage} = shift;
}

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

## end getters and setters ##

## begin bean association methods ##

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::IntegrationType;

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":IntegrationType\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of IntegrationType objects
# param: xml doc
# returns: list of IntegrationType objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of IntegrationType objects
# param: xml node
# returns: a list of IntegrationType objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one IntegrationType object
# param: xml node
# returns: one IntegrationType object
sub fromWSXMLNode {
	my $IntegrationTypeNode = $_[1];
	
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
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "id") {
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
	
	return $newobj;
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

use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##


@ISA = qw(CaCORE::CaMOD::EngineeredGene);
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":Transgene\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# engineeredGeneId;
	if( defined( $self->getEngineeredGeneId ) ) {
		$tmpstr = "<engineeredGeneId xsi:type=\"xsd:long\">" . $self->getEngineeredGeneId . "</engineeredGeneId>";
	} else {
		$tmpstr = "<engineeredGeneId xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# locationOfIntegration;
	if( defined( $self->getLocationOfIntegration ) ) {
		$tmpstr = "<locationOfIntegration xsi:type=\"xsd:string\">" . $self->getLocationOfIntegration . "</locationOfIntegration>";
	} else {
		$tmpstr = "<locationOfIntegration xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# cabioId;
	if( defined( $self->getCabioId ) ) {
		$tmpstr = "<cabioId xsi:type=\"xsd:long\">" . $self->getCabioId . "</cabioId>";
	} else {
		$tmpstr = "<cabioId xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of Transgene objects
# param: xml doc
# returns: list of Transgene objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of Transgene objects
# param: xml node
# returns: a list of Transgene objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one Transgene object
# param: xml node
# returns: one Transgene object
sub fromWSXMLNode {
	my $TransgeneNode = $_[1];
	
	## begin ELEMENT_NODE children ##
		my $engineeredGeneId;
		my $locationOfIntegration;
		my $cabioId;
		my $id;
		my $name;
	## end ELEMENT_NODE children ##

	# get all children for this node
	for my $childrenNode ($TransgeneNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		if( ! defined($childrenNode->getFirstChild) ){ next; };
		my $textNode = $childrenNode->getFirstChild;
		## begin iterate ELEMENT_NODE ##
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "engineeredGeneId") {
				$engineeredGeneId=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "locationOfIntegration") {
				$locationOfIntegration=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "cabioId") {
				$cabioId=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
		## end iterate ELEMENT_NODE ##
	    }
	}
	my $newobj = new CaCORE::CaMOD::Transgene;
	## begin set attr ##
		$newobj->setEngineeredGeneId($engineeredGeneId);
		$newobj->setLocationOfIntegration($locationOfIntegration);
		$newobj->setCabioId($cabioId);
		$newobj->setId($id);
		$newobj->setName($name);
	## end set attr ##
	
	return $newobj;
}

## begin getters and setters ##

sub getEngineeredGeneId {
	my $self = shift;
	return $self->{engineeredGeneId};
}

sub setEngineeredGeneId {
	my $self = shift;
	$self->{engineeredGeneId} = shift;
}

sub getLocationOfIntegration {
	my $self = shift;
	return $self->{locationOfIntegration};
}

sub setLocationOfIntegration {
	my $self = shift;
	$self->{locationOfIntegration} = shift;
}

sub getCabioId {
	my $self = shift;
	return $self->{cabioId};
}

sub setCabioId {
	my $self = shift;
	$self->{cabioId} = shift;
}

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

sub getIntegrationType {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::IntegrationType", $self);
	return $results[0];
}

sub getRegulatoryElementCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::RegulatoryElement", $self);
	return @results;
}

sub getConditionality {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::Conditionality", $self);
	return $results[0];
}

sub getDatabaseCrossReferenceCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::Common::DatabaseCrossReference", $self);
	return @results;
}

sub getExpressionFeatureCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::ExpressionFeature", $self);
	return @results;
}

sub getGeneCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Gene", $self);
	return @results;
}

sub getGenotypeSummary {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::GenotypeSummary", $self);
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
package CaCORE::CaMOD::Therapy;

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":Therapy\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# comments;
	if( defined( $self->getComments ) ) {
		$tmpstr = "<comments xsi:type=\"xsd:string\">" . $self->getComments . "</comments>";
	} else {
		$tmpstr = "<comments xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# experiment;
	if( defined( $self->getExperiment ) ) {
		$tmpstr = "<experiment xsi:type=\"xsd:string\">" . $self->getExperiment . "</experiment>";
	} else {
		$tmpstr = "<experiment xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# results;
	if( defined( $self->getResults ) ) {
		$tmpstr = "<results xsi:type=\"xsd:string\">" . $self->getResults . "</results>";
	} else {
		$tmpstr = "<results xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of Therapy objects
# param: xml doc
# returns: list of Therapy objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of Therapy objects
# param: xml node
# returns: a list of Therapy objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one Therapy object
# param: xml node
# returns: one Therapy object
sub fromWSXMLNode {
	my $TherapyNode = $_[1];
	
	## begin ELEMENT_NODE children ##
		my $comments;
		my $experiment;
		my $id;
		my $results;
	## end ELEMENT_NODE children ##

	# get all children for this node
	for my $childrenNode ($TherapyNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		if( ! defined($childrenNode->getFirstChild) ){ next; };
		my $textNode = $childrenNode->getFirstChild;
		## begin iterate ELEMENT_NODE ##
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "comments") {
				$comments=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "experiment") {
				$experiment=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "results") {
				$results=$textNode->getNodeValue;
			}
		## end iterate ELEMENT_NODE ##
	    }
	}
	my $newobj = new CaCORE::CaMOD::Therapy;
	## begin set attr ##
		$newobj->setComments($comments);
		$newobj->setExperiment($experiment);
		$newobj->setId($id);
		$newobj->setResults($results);
	## end set attr ##
	
	return $newobj;
}

## begin getters and setters ##

sub getComments {
	my $self = shift;
	return $self->{comments};
}

sub setComments {
	my $self = shift;
	$self->{comments} = shift;
}

sub getExperiment {
	my $self = shift;
	return $self->{experiment};
}

sub setExperiment {
	my $self = shift;
	$self->{experiment} = shift;
}

sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
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
package CaCORE::CaMOD::YeastModel;

use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##


@ISA = qw(CaCORE::CaMOD::AbstractCancerModel);
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":YeastModel\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# experimentDesign;
	if( defined( $self->getExperimentDesign ) ) {
		$tmpstr = "<experimentDesign xsi:type=\"xsd:string\">" . $self->getExperimentDesign . "</experimentDesign>";
	} else {
		$tmpstr = "<experimentDesign xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# modelDescriptor;
	if( defined( $self->getModelDescriptor ) ) {
		$tmpstr = "<modelDescriptor xsi:type=\"xsd:string\">" . $self->getModelDescriptor . "</modelDescriptor>";
	} else {
		$tmpstr = "<modelDescriptor xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of YeastModel objects
# param: xml doc
# returns: list of YeastModel objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of YeastModel objects
# param: xml node
# returns: a list of YeastModel objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one YeastModel object
# param: xml node
# returns: one YeastModel object
sub fromWSXMLNode {
	my $YeastModelNode = $_[1];
	
	## begin ELEMENT_NODE children ##
		my $experimentDesign;
		my $id;
		my $modelDescriptor;
	## end ELEMENT_NODE children ##

	# get all children for this node
	for my $childrenNode ($YeastModelNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		if( ! defined($childrenNode->getFirstChild) ){ next; };
		my $textNode = $childrenNode->getFirstChild;
		## begin iterate ELEMENT_NODE ##
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "experimentDesign") {
				$experimentDesign=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modelDescriptor") {
				$modelDescriptor=$textNode->getNodeValue;
			}
		## end iterate ELEMENT_NODE ##
	    }
	}
	my $newobj = new CaCORE::CaMOD::YeastModel;
	## begin set attr ##
		$newobj->setExperimentDesign($experimentDesign);
		$newobj->setId($id);
		$newobj->setModelDescriptor($modelDescriptor);
	## end set attr ##
	
	return $newobj;
}

## begin getters and setters ##

sub getExperimentDesign {
	my $self = shift;
	return $self->{experimentDesign};
}

sub setExperimentDesign {
	my $self = shift;
	$self->{experimentDesign} = shift;
}

sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
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

sub getScreeningResultCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::ScreeningResult", $self);
	return @results;
}

sub getTargetedModificationCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::TargetedModification", $self);
	return @results;
}

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
package CaCORE::CaMOD::TargetedModification;

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":TargetedModification\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# blastocystName;
	if( defined( $self->getBlastocystName ) ) {
		$tmpstr = "<blastocystName xsi:type=\"xsd:string\">" . $self->getBlastocystName . "</blastocystName>";
	} else {
		$tmpstr = "<blastocystName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# esCellLineName;
	if( defined( $self->getEsCellLineName ) ) {
		$tmpstr = "<esCellLineName xsi:type=\"xsd:string\">" . $self->getEsCellLineName . "</esCellLineName>";
	} else {
		$tmpstr = "<esCellLineName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of TargetedModification objects
# param: xml doc
# returns: list of TargetedModification objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of TargetedModification objects
# param: xml node
# returns: a list of TargetedModification objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one TargetedModification object
# param: xml node
# returns: one TargetedModification object
sub fromWSXMLNode {
	my $TargetedModificationNode = $_[1];
	
	## begin ELEMENT_NODE children ##
		my $blastocystName;
		my $esCellLineName;
		my $id;
	## end ELEMENT_NODE children ##

	# get all children for this node
	for my $childrenNode ($TargetedModificationNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		if( ! defined($childrenNode->getFirstChild) ){ next; };
		my $textNode = $childrenNode->getFirstChild;
		## begin iterate ELEMENT_NODE ##
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "blastocystName") {
				$blastocystName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "esCellLineName") {
				$esCellLineName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
		## end iterate ELEMENT_NODE ##
	    }
	}
	my $newobj = new CaCORE::CaMOD::TargetedModification;
	## begin set attr ##
		$newobj->setBlastocystName($blastocystName);
		$newobj->setEsCellLineName($esCellLineName);
		$newobj->setId($id);
	## end set attr ##
	
	return $newobj;
}

## begin getters and setters ##

sub getBlastocystName {
	my $self = shift;
	return $self->{blastocystName};
}

sub setBlastocystName {
	my $self = shift;
	$self->{blastocystName} = shift;
}

sub getEsCellLineName {
	my $self = shift;
	return $self->{esCellLineName};
}

sub setEsCellLineName {
	my $self = shift;
	$self->{esCellLineName} = shift;
}

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

sub getEngineeredGene {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::EngineeredGene", $self);
	return $results[0];
}

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

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::SexDistribution;

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":SexDistribution\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# type;
	if( defined( $self->getType ) ) {
		$tmpstr = "<type xsi:type=\"xsd:string\">" . $self->getType . "</type>";
	} else {
		$tmpstr = "<type xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of SexDistribution objects
# param: xml doc
# returns: list of SexDistribution objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of SexDistribution objects
# param: xml node
# returns: a list of SexDistribution objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one SexDistribution object
# param: xml node
# returns: one SexDistribution object
sub fromWSXMLNode {
	my $SexDistributionNode = $_[1];
	
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
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "id") {
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
	
	return $newobj;
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

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":SegmentType\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of SegmentType objects
# param: xml doc
# returns: list of SegmentType objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of SegmentType objects
# param: xml node
# returns: a list of SegmentType objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one SegmentType object
# param: xml node
# returns: one SegmentType object
sub fromWSXMLNode {
	my $SegmentTypeNode = $_[1];
	
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
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "id") {
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
	
	return $newobj;
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

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":Role\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of Role objects
# param: xml doc
# returns: list of Role objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of Role objects
# param: xml node
# returns: a list of Role objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one Role object
# param: xml node
# returns: one Role object
sub fromWSXMLNode {
	my $RoleNode = $_[1];
	
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
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "id") {
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
	
	return $newobj;
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

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":RepositoryInfo\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# inTheRepository;
	if( defined( $self->getInTheRepository ) ) {
		$tmpstr = "<inTheRepository xsi:type=\"xsd:long\">" . $self->getInTheRepository . "</inTheRepository>";
	} else {
		$tmpstr = "<inTheRepository xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# sentEmailContent;
	if( defined( $self->getSentEmailContent ) ) {
		$tmpstr = "<sentEmailContent xsi:type=\"xsd:string\">" . $self->getSentEmailContent . "</sentEmailContent>";
	} else {
		$tmpstr = "<sentEmailContent xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# suggestSubmission;
	if( defined( $self->getSuggestSubmission ) ) {
		$tmpstr = "<suggestSubmission xsi:type=\"xsd:long\">" . $self->getSuggestSubmission . "</suggestSubmission>";
	} else {
		$tmpstr = "<suggestSubmission xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of RepositoryInfo objects
# param: xml doc
# returns: list of RepositoryInfo objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of RepositoryInfo objects
# param: xml node
# returns: a list of RepositoryInfo objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one RepositoryInfo object
# param: xml node
# returns: one RepositoryInfo object
sub fromWSXMLNode {
	my $RepositoryInfoNode = $_[1];
	
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
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "id") {
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
	
	return $newobj;
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

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":RegulatoryElementType\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of RegulatoryElementType objects
# param: xml doc
# returns: list of RegulatoryElementType objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of RegulatoryElementType objects
# param: xml node
# returns: a list of RegulatoryElementType objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one RegulatoryElementType object
# param: xml node
# returns: one RegulatoryElementType object
sub fromWSXMLNode {
	my $RegulatoryElementTypeNode = $_[1];
	
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
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "id") {
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
	
	return $newobj;
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

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":RegulatoryElement\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of RegulatoryElement objects
# param: xml doc
# returns: list of RegulatoryElement objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of RegulatoryElement objects
# param: xml node
# returns: a list of RegulatoryElement objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one RegulatoryElement object
# param: xml node
# returns: one RegulatoryElement object
sub fromWSXMLNode {
	my $RegulatoryElementNode = $_[1];
	
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
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "id") {
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
	
	return $newobj;
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

sub getRegulatoryElementType {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::RegulatoryElementType", $self);
	return $results[0];
}

sub getTaxon {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Taxon", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::PublicationStatus;

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":PublicationStatus\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of PublicationStatus objects
# param: xml doc
# returns: list of PublicationStatus objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of PublicationStatus objects
# param: xml node
# returns: a list of PublicationStatus objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one PublicationStatus object
# param: xml node
# returns: one PublicationStatus object
sub fromWSXMLNode {
	my $PublicationStatusNode = $_[1];
	
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
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "id") {
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
	
	return $newobj;
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

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":Publication\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# authors;
	if( defined( $self->getAuthors ) ) {
		$tmpstr = "<authors xsi:type=\"xsd:string\">" . $self->getAuthors . "</authors>";
	} else {
		$tmpstr = "<authors xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# endPage;
	if( defined( $self->getEndPage ) ) {
		$tmpstr = "<endPage xsi:type=\"xsd:long\">" . $self->getEndPage . "</endPage>";
	} else {
		$tmpstr = "<endPage xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# journal;
	if( defined( $self->getJournal ) ) {
		$tmpstr = "<journal xsi:type=\"xsd:string\">" . $self->getJournal . "</journal>";
	} else {
		$tmpstr = "<journal xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# pmid;
	if( defined( $self->getPmid ) ) {
		$tmpstr = "<pmid xsi:type=\"xsd:long\">" . $self->getPmid . "</pmid>";
	} else {
		$tmpstr = "<pmid xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# startPage;
	if( defined( $self->getStartPage ) ) {
		$tmpstr = "<startPage xsi:type=\"xsd:long\">" . $self->getStartPage . "</startPage>";
	} else {
		$tmpstr = "<startPage xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# title;
	if( defined( $self->getTitle ) ) {
		$tmpstr = "<title xsi:type=\"xsd:string\">" . $self->getTitle . "</title>";
	} else {
		$tmpstr = "<title xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# volume;
	if( defined( $self->getVolume ) ) {
		$tmpstr = "<volume xsi:type=\"xsd:string\">" . $self->getVolume . "</volume>";
	} else {
		$tmpstr = "<volume xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# year;
	if( defined( $self->getYear ) ) {
		$tmpstr = "<year xsi:type=\"xsd:long\">" . $self->getYear . "</year>";
	} else {
		$tmpstr = "<year xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of Publication objects
# param: xml doc
# returns: list of Publication objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of Publication objects
# param: xml node
# returns: a list of Publication objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one Publication object
# param: xml node
# returns: one Publication object
sub fromWSXMLNode {
	my $PublicationNode = $_[1];
	
	## begin ELEMENT_NODE children ##
		my $authors;
		my $endPage;
		my $id;
		my $journal;
		my $pmid;
		my $startPage;
		my $title;
		my $volume;
		my $year;
	## end ELEMENT_NODE children ##

	# get all children for this node
	for my $childrenNode ($PublicationNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		if( ! defined($childrenNode->getFirstChild) ){ next; };
		my $textNode = $childrenNode->getFirstChild;
		## begin iterate ELEMENT_NODE ##
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "authors") {
				$authors=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "endPage") {
				$endPage=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "journal") {
				$journal=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "pmid") {
				$pmid=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "startPage") {
				$startPage=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "title") {
				$title=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "volume") {
				$volume=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "year") {
				$year=$textNode->getNodeValue;
			}
		## end iterate ELEMENT_NODE ##
	    }
	}
	my $newobj = new CaCORE::CaMOD::Publication;
	## begin set attr ##
		$newobj->setAuthors($authors);
		$newobj->setEndPage($endPage);
		$newobj->setId($id);
		$newobj->setJournal($journal);
		$newobj->setPmid($pmid);
		$newobj->setStartPage($startPage);
		$newobj->setTitle($title);
		$newobj->setVolume($volume);
		$newobj->setYear($year);
	## end set attr ##
	
	return $newobj;
}

## begin getters and setters ##

sub getAuthors {
	my $self = shift;
	return $self->{authors};
}

sub setAuthors {
	my $self = shift;
	$self->{authors} = shift;
}

sub getEndPage {
	my $self = shift;
	return $self->{endPage};
}

sub setEndPage {
	my $self = shift;
	$self->{endPage} = shift;
}

sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getJournal {
	my $self = shift;
	return $self->{journal};
}

sub setJournal {
	my $self = shift;
	$self->{journal} = shift;
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

sub getTitle {
	my $self = shift;
	return $self->{title};
}

sub setTitle {
	my $self = shift;
	$self->{title} = shift;
}

sub getVolume {
	my $self = shift;
	return $self->{volume};
}

sub setVolume {
	my $self = shift;
	$self->{volume} = shift;
}

sub getYear {
	my $self = shift;
	return $self->{year};
}

sub setYear {
	my $self = shift;
	$self->{year} = shift;
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

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":Promoter\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of Promoter objects
# param: xml doc
# returns: list of Promoter objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of Promoter objects
# param: xml node
# returns: a list of Promoter objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one Promoter object
# param: xml node
# returns: one Promoter object
sub fromWSXMLNode {
	my $PromoterNode = $_[1];
	
	## begin ELEMENT_NODE children ##
		my $id;
	## end ELEMENT_NODE children ##

	# get all children for this node
	for my $childrenNode ($PromoterNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		if( ! defined($childrenNode->getFirstChild) ){ next; };
		my $textNode = $childrenNode->getFirstChild;
		## begin iterate ELEMENT_NODE ##
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
		## end iterate ELEMENT_NODE ##
	    }
	}
	my $newobj = new CaCORE::CaMOD::Promoter;
	## begin set attr ##
		$newobj->setId($id);
	## end set attr ##
	
	return $newobj;
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

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":Phenotype\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# breedingNotes;
	if( defined( $self->getBreedingNotes ) ) {
		$tmpstr = "<breedingNotes xsi:type=\"xsd:string\">" . $self->getBreedingNotes . "</breedingNotes>";
	} else {
		$tmpstr = "<breedingNotes xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# description;
	if( defined( $self->getDescription ) ) {
		$tmpstr = "<description xsi:type=\"xsd:string\">" . $self->getDescription . "</description>";
	} else {
		$tmpstr = "<description xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of Phenotype objects
# param: xml doc
# returns: list of Phenotype objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of Phenotype objects
# param: xml node
# returns: a list of Phenotype objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one Phenotype object
# param: xml node
# returns: one Phenotype object
sub fromWSXMLNode {
	my $PhenotypeNode = $_[1];
	
	## begin ELEMENT_NODE children ##
		my $breedingNotes;
		my $description;
		my $id;
	## end ELEMENT_NODE children ##

	# get all children for this node
	for my $childrenNode ($PhenotypeNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		if( ! defined($childrenNode->getFirstChild) ){ next; };
		my $textNode = $childrenNode->getFirstChild;
		## begin iterate ELEMENT_NODE ##
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "breedingNotes") {
				$breedingNotes=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "description") {
				$description=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
		## end iterate ELEMENT_NODE ##
	    }
	}
	my $newobj = new CaCORE::CaMOD::Phenotype;
	## begin set attr ##
		$newobj->setBreedingNotes($breedingNotes);
		$newobj->setDescription($description);
		$newobj->setId($id);
	## end set attr ##
	
	return $newobj;
}

## begin getters and setters ##

sub getBreedingNotes {
	my $self = shift;
	return $self->{breedingNotes};
}

sub setBreedingNotes {
	my $self = shift;
	$self->{breedingNotes} = shift;
}

sub getDescription {
	my $self = shift;
	return $self->{description};
}

sub setDescription {
	my $self = shift;
	$self->{description} = shift;
}

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

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":Party\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of Party objects
# param: xml doc
# returns: list of Party objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of Party objects
# param: xml node
# returns: a list of Party objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one Party object
# param: xml node
# returns: one Party object
sub fromWSXMLNode {
	my $PartyNode = $_[1];
	
	## begin ELEMENT_NODE children ##
		my $id;
	## end ELEMENT_NODE children ##

	# get all children for this node
	for my $childrenNode ($PartyNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		if( ! defined($childrenNode->getFirstChild) ){ next; };
		my $textNode = $childrenNode->getFirstChild;
		## begin iterate ELEMENT_NODE ##
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
		## end iterate ELEMENT_NODE ##
	    }
	}
	my $newobj = new CaCORE::CaMOD::Party;
	## begin set attr ##
		$newobj->setId($id);
	## end set attr ##
	
	return $newobj;
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

sub getContactInfoCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::ContactInfo", $self);
	return @results;
}

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
package CaCORE::CaMOD::Person;

use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##


@ISA = qw(CaCORE::CaMOD::Party);
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":Person\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# firstName;
	if( defined( $self->getFirstName ) ) {
		$tmpstr = "<firstName xsi:type=\"xsd:string\">" . $self->getFirstName . "</firstName>";
	} else {
		$tmpstr = "<firstName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# lastName;
	if( defined( $self->getLastName ) ) {
		$tmpstr = "<lastName xsi:type=\"xsd:string\">" . $self->getLastName . "</lastName>";
	} else {
		$tmpstr = "<lastName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# partyId;
	if( defined( $self->getPartyId ) ) {
		$tmpstr = "<partyId xsi:type=\"xsd:long\">" . $self->getPartyId . "</partyId>";
	} else {
		$tmpstr = "<partyId xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of Person objects
# param: xml doc
# returns: list of Person objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of Person objects
# param: xml node
# returns: a list of Person objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one Person object
# param: xml node
# returns: one Person object
sub fromWSXMLNode {
	my $PersonNode = $_[1];
	
	## begin ELEMENT_NODE children ##
		my $firstName;
		my $lastName;
		my $partyId;
		my $id;
	## end ELEMENT_NODE children ##

	# get all children for this node
	for my $childrenNode ($PersonNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		if( ! defined($childrenNode->getFirstChild) ){ next; };
		my $textNode = $childrenNode->getFirstChild;
		## begin iterate ELEMENT_NODE ##
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "firstName") {
				$firstName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "lastName") {
				$lastName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "partyId") {
				$partyId=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
		## end iterate ELEMENT_NODE ##
	    }
	}
	my $newobj = new CaCORE::CaMOD::Person;
	## begin set attr ##
		$newobj->setFirstName($firstName);
		$newobj->setLastName($lastName);
		$newobj->setPartyId($partyId);
		$newobj->setId($id);
	## end set attr ##
	
	return $newobj;
}

## begin getters and setters ##

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

sub getPartyId {
	my $self = shift;
	return $self->{partyId};
}

sub setPartyId {
	my $self = shift;
	$self->{partyId} = shift;
}

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

sub getContactInfoCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::ContactInfo", $self);
	return @results;
}

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
package CaCORE::CaMOD::PartyRole;

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":PartyRole\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of PartyRole objects
# param: xml doc
# returns: list of PartyRole objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of PartyRole objects
# param: xml node
# returns: a list of PartyRole objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one PartyRole object
# param: xml node
# returns: one PartyRole object
sub fromWSXMLNode {
	my $PartyRoleNode = $_[1];
	
	## begin ELEMENT_NODE children ##
		my $id;
	## end ELEMENT_NODE children ##

	# get all children for this node
	for my $childrenNode ($PartyRoleNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		if( ! defined($childrenNode->getFirstChild) ){ next; };
		my $textNode = $childrenNode->getFirstChild;
		## begin iterate ELEMENT_NODE ##
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
		## end iterate ELEMENT_NODE ##
	    }
	}
	my $newobj = new CaCORE::CaMOD::PartyRole;
	## begin set attr ##
		$newobj->setId($id);
	## end set attr ##
	
	return $newobj;
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

sub getRole {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::Role", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::Organization;

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":Organization\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# partyId;
	if( defined( $self->getPartyId ) ) {
		$tmpstr = "<partyId xsi:type=\"xsd:long\">" . $self->getPartyId . "</partyId>";
	} else {
		$tmpstr = "<partyId xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of Organization objects
# param: xml doc
# returns: list of Organization objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of Organization objects
# param: xml node
# returns: a list of Organization objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one Organization object
# param: xml node
# returns: one Organization object
sub fromWSXMLNode {
	my $OrganizationNode = $_[1];
	
	## begin ELEMENT_NODE children ##
		my $id;
		my $name;
		my $partyId;
	## end ELEMENT_NODE children ##

	# get all children for this node
	for my $childrenNode ($OrganizationNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		if( ! defined($childrenNode->getFirstChild) ){ next; };
		my $textNode = $childrenNode->getFirstChild;
		## begin iterate ELEMENT_NODE ##
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "partyId") {
				$partyId=$textNode->getNodeValue;
			}
		## end iterate ELEMENT_NODE ##
	    }
	}
	my $newobj = new CaCORE::CaMOD::Organization;
	## begin set attr ##
		$newobj->setId($id);
		$newobj->setName($name);
		$newobj->setPartyId($partyId);
	## end set attr ##
	
	return $newobj;
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

sub getPartyId {
	my $self = shift;
	return $self->{partyId};
}

sub setPartyId {
	my $self = shift;
	$self->{partyId} = shift;
}

## end getters and setters ##

## begin bean association methods ##

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::MicroArrayData;

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":MicroArrayData\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# experimentId;
	if( defined( $self->getExperimentId ) ) {
		$tmpstr = "<experimentId xsi:type=\"xsd:long\">" . $self->getExperimentId . "</experimentId>";
	} else {
		$tmpstr = "<experimentId xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# experimentName;
	if( defined( $self->getExperimentName ) ) {
		$tmpstr = "<experimentName xsi:type=\"xsd:string\">" . $self->getExperimentName . "</experimentName>";
	} else {
		$tmpstr = "<experimentName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of MicroArrayData objects
# param: xml doc
# returns: list of MicroArrayData objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of MicroArrayData objects
# param: xml node
# returns: a list of MicroArrayData objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one MicroArrayData object
# param: xml node
# returns: one MicroArrayData object
sub fromWSXMLNode {
	my $MicroArrayDataNode = $_[1];
	
	## begin ELEMENT_NODE children ##
		my $experimentId;
		my $experimentName;
		my $id;
	## end ELEMENT_NODE children ##

	# get all children for this node
	for my $childrenNode ($MicroArrayDataNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		if( ! defined($childrenNode->getFirstChild) ){ next; };
		my $textNode = $childrenNode->getFirstChild;
		## begin iterate ELEMENT_NODE ##
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "experimentId") {
				$experimentId=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "experimentName") {
				$experimentName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
		## end iterate ELEMENT_NODE ##
	    }
	}
	my $newobj = new CaCORE::CaMOD::MicroArrayData;
	## begin set attr ##
		$newobj->setExperimentId($experimentId);
		$newobj->setExperimentName($experimentName);
		$newobj->setId($id);
	## end set attr ##
	
	return $newobj;
}

## begin getters and setters ##

sub getExperimentId {
	my $self = shift;
	return $self->{experimentId};
}

sub setExperimentId {
	my $self = shift;
	$self->{experimentId} = shift;
}

sub getExperimentName {
	my $self = shift;
	return $self->{experimentName};
}

sub setExperimentName {
	my $self = shift;
	$self->{experimentName} = shift;
}

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

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":JaxInfo\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# jaxStockNo;
	if( defined( $self->getJaxStockNo ) ) {
		$tmpstr = "<jaxStockNo xsi:type=\"xsd:long\">" . $self->getJaxStockNo . "</jaxStockNo>";
	} else {
		$tmpstr = "<jaxStockNo xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of JaxInfo objects
# param: xml doc
# returns: list of JaxInfo objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of JaxInfo objects
# param: xml node
# returns: a list of JaxInfo objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one JaxInfo object
# param: xml node
# returns: one JaxInfo object
sub fromWSXMLNode {
	my $JaxInfoNode = $_[1];
	
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
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "id") {
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
	
	return $newobj;
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

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":EnvironmentalFactor\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# type;
	if( defined( $self->getType ) ) {
		$tmpstr = "<type xsi:type=\"xsd:string\">" . $self->getType . "</type>";
	} else {
		$tmpstr = "<type xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of EnvironmentalFactor objects
# param: xml doc
# returns: list of EnvironmentalFactor objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of EnvironmentalFactor objects
# param: xml node
# returns: a list of EnvironmentalFactor objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one EnvironmentalFactor object
# param: xml node
# returns: one EnvironmentalFactor object
sub fromWSXMLNode {
	my $EnvironmentalFactorNode = $_[1];
	
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
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "id") {
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
	
	return $newobj;
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

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":InducedMutation\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of InducedMutation objects
# param: xml doc
# returns: list of InducedMutation objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of InducedMutation objects
# param: xml node
# returns: a list of InducedMutation objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one InducedMutation object
# param: xml node
# returns: one InducedMutation object
sub fromWSXMLNode {
	my $InducedMutationNode = $_[1];
	
	## begin ELEMENT_NODE children ##
		my $id;
	## end ELEMENT_NODE children ##

	# get all children for this node
	for my $childrenNode ($InducedMutationNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		if( ! defined($childrenNode->getFirstChild) ){ next; };
		my $textNode = $childrenNode->getFirstChild;
		## begin iterate ELEMENT_NODE ##
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
		## end iterate ELEMENT_NODE ##
	    }
	}
	my $newobj = new CaCORE::CaMOD::InducedMutation;
	## begin set attr ##
		$newobj->setId($id);
	## end set attr ##
	
	return $newobj;
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

sub getEngineeredGeneCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::EngineeredGene", $self);
	return @results;
}

sub getEnvironmentalFactor {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::EnvironmentalFactor", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::GenomicSegment;

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":GenomicSegment\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# cloneDesignator;
	if( defined( $self->getCloneDesignator ) ) {
		$tmpstr = "<cloneDesignator xsi:type=\"xsd:string\">" . $self->getCloneDesignator . "</cloneDesignator>";
	} else {
		$tmpstr = "<cloneDesignator xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# locationOfIntegration;
	if( defined( $self->getLocationOfIntegration ) ) {
		$tmpstr = "<locationOfIntegration xsi:type=\"xsd:string\">" . $self->getLocationOfIntegration . "</locationOfIntegration>";
	} else {
		$tmpstr = "<locationOfIntegration xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# segmentSize;
	if( defined( $self->getSegmentSize ) ) {
		$tmpstr = "<segmentSize xsi:type=\"xsd:string\">" . $self->getSegmentSize . "</segmentSize>";
	} else {
		$tmpstr = "<segmentSize xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of GenomicSegment objects
# param: xml doc
# returns: list of GenomicSegment objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of GenomicSegment objects
# param: xml node
# returns: a list of GenomicSegment objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one GenomicSegment object
# param: xml node
# returns: one GenomicSegment object
sub fromWSXMLNode {
	my $GenomicSegmentNode = $_[1];
	
	## begin ELEMENT_NODE children ##
		my $cloneDesignator;
		my $id;
		my $locationOfIntegration;
		my $segmentSize;
	## end ELEMENT_NODE children ##

	# get all children for this node
	for my $childrenNode ($GenomicSegmentNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		if( ! defined($childrenNode->getFirstChild) ){ next; };
		my $textNode = $childrenNode->getFirstChild;
		## begin iterate ELEMENT_NODE ##
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "cloneDesignator") {
				$cloneDesignator=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "locationOfIntegration") {
				$locationOfIntegration=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "segmentSize") {
				$segmentSize=$textNode->getNodeValue;
			}
		## end iterate ELEMENT_NODE ##
	    }
	}
	my $newobj = new CaCORE::CaMOD::GenomicSegment;
	## begin set attr ##
		$newobj->setCloneDesignator($cloneDesignator);
		$newobj->setId($id);
		$newobj->setLocationOfIntegration($locationOfIntegration);
		$newobj->setSegmentSize($segmentSize);
	## end set attr ##
	
	return $newobj;
}

## begin getters and setters ##

sub getCloneDesignator {
	my $self = shift;
	return $self->{cloneDesignator};
}

sub setCloneDesignator {
	my $self = shift;
	$self->{cloneDesignator} = shift;
}

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

## end getters and setters ##

## begin bean association methods ##

sub getEngineeredGeneCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::EngineeredGene", $self);
	return @results;
}

sub getSegmentType {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::SegmentType", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::GeneticAlteration;

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":GeneticAlteration\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# methodOfObservation;
	if( defined( $self->getMethodOfObservation ) ) {
		$tmpstr = "<methodOfObservation xsi:type=\"xsd:string\">" . $self->getMethodOfObservation . "</methodOfObservation>";
	} else {
		$tmpstr = "<methodOfObservation xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# observation;
	if( defined( $self->getObservation ) ) {
		$tmpstr = "<observation xsi:type=\"xsd:string\">" . $self->getObservation . "</observation>";
	} else {
		$tmpstr = "<observation xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of GeneticAlteration objects
# param: xml doc
# returns: list of GeneticAlteration objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of GeneticAlteration objects
# param: xml node
# returns: a list of GeneticAlteration objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one GeneticAlteration object
# param: xml node
# returns: one GeneticAlteration object
sub fromWSXMLNode {
	my $GeneticAlterationNode = $_[1];
	
	## begin ELEMENT_NODE children ##
		my $id;
		my $methodOfObservation;
		my $observation;
	## end ELEMENT_NODE children ##

	# get all children for this node
	for my $childrenNode ($GeneticAlterationNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		if( ! defined($childrenNode->getFirstChild) ){ next; };
		my $textNode = $childrenNode->getFirstChild;
		## begin iterate ELEMENT_NODE ##
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "methodOfObservation") {
				$methodOfObservation=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "observation") {
				$observation=$textNode->getNodeValue;
			}
		## end iterate ELEMENT_NODE ##
	    }
	}
	my $newobj = new CaCORE::CaMOD::GeneticAlteration;
	## begin set attr ##
		$newobj->setId($id);
		$newobj->setMethodOfObservation($methodOfObservation);
		$newobj->setObservation($observation);
	## end set attr ##
	
	return $newobj;
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

sub getMethodOfObservation {
	my $self = shift;
	return $self->{methodOfObservation};
}

sub setMethodOfObservation {
	my $self = shift;
	$self->{methodOfObservation} = shift;
}

sub getObservation {
	my $self = shift;
	return $self->{observation};
}

sub setObservation {
	my $self = shift;
	$self->{observation} = shift;
}

## end getters and setters ##

## begin bean association methods ##

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::GeneFunction;

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":GeneFunction\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# function;
	if( defined( $self->getFunction ) ) {
		$tmpstr = "<function xsi:type=\"xsd:string\">" . $self->getFunction . "</function>";
	} else {
		$tmpstr = "<function xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of GeneFunction objects
# param: xml doc
# returns: list of GeneFunction objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of GeneFunction objects
# param: xml node
# returns: a list of GeneFunction objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one GeneFunction object
# param: xml node
# returns: one GeneFunction object
sub fromWSXMLNode {
	my $GeneFunctionNode = $_[1];
	
	## begin ELEMENT_NODE children ##
		my $function;
		my $id;
	## end ELEMENT_NODE children ##

	# get all children for this node
	for my $childrenNode ($GeneFunctionNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		if( ! defined($childrenNode->getFirstChild) ){ next; };
		my $textNode = $childrenNode->getFirstChild;
		## begin iterate ELEMENT_NODE ##
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "function") {
				$function=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
		## end iterate ELEMENT_NODE ##
	    }
	}
	my $newobj = new CaCORE::CaMOD::GeneFunction;
	## begin set attr ##
		$newobj->setFunction($function);
		$newobj->setId($id);
	## end set attr ##
	
	return $newobj;
}

## begin getters and setters ##

sub getFunction {
	my $self = shift;
	return $self->{function};
}

sub setFunction {
	my $self = shift;
	$self->{function} = shift;
}

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

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":GeneDelivery\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# viralVector;
	if( defined( $self->getViralVector ) ) {
		$tmpstr = "<viralVector xsi:type=\"xsd:string\">" . $self->getViralVector . "</viralVector>";
	} else {
		$tmpstr = "<viralVector xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of GeneDelivery objects
# param: xml doc
# returns: list of GeneDelivery objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of GeneDelivery objects
# param: xml node
# returns: a list of GeneDelivery objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one GeneDelivery object
# param: xml node
# returns: one GeneDelivery object
sub fromWSXMLNode {
	my $GeneDeliveryNode = $_[1];
	
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
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "id") {
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
	
	return $newobj;
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

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":ContactInfo\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# city;
	if( defined( $self->getCity ) ) {
		$tmpstr = "<city xsi:type=\"xsd:string\">" . $self->getCity . "</city>";
	} else {
		$tmpstr = "<city xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# email;
	if( defined( $self->getEmail ) ) {
		$tmpstr = "<email xsi:type=\"xsd:string\">" . $self->getEmail . "</email>";
	} else {
		$tmpstr = "<email xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# faxNumber;
	if( defined( $self->getFaxNumber ) ) {
		$tmpstr = "<faxNumber xsi:type=\"xsd:string\">" . $self->getFaxNumber . "</faxNumber>";
	} else {
		$tmpstr = "<faxNumber xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# institute;
	if( defined( $self->getInstitute ) ) {
		$tmpstr = "<institute xsi:type=\"xsd:string\">" . $self->getInstitute . "</institute>";
	} else {
		$tmpstr = "<institute xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# labName;
	if( defined( $self->getLabName ) ) {
		$tmpstr = "<labName xsi:type=\"xsd:string\">" . $self->getLabName . "</labName>";
	} else {
		$tmpstr = "<labName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# phoneNumber;
	if( defined( $self->getPhoneNumber ) ) {
		$tmpstr = "<phoneNumber xsi:type=\"xsd:string\">" . $self->getPhoneNumber . "</phoneNumber>";
	} else {
		$tmpstr = "<phoneNumber xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# state;
	if( defined( $self->getState ) ) {
		$tmpstr = "<state xsi:type=\"xsd:string\">" . $self->getState . "</state>";
	} else {
		$tmpstr = "<state xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# street;
	if( defined( $self->getStreet ) ) {
		$tmpstr = "<street xsi:type=\"xsd:string\">" . $self->getStreet . "</street>";
	} else {
		$tmpstr = "<street xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# zipCode;
	if( defined( $self->getZipCode ) ) {
		$tmpstr = "<zipCode xsi:type=\"xsd:string\">" . $self->getZipCode . "</zipCode>";
	} else {
		$tmpstr = "<zipCode xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of ContactInfo objects
# param: xml doc
# returns: list of ContactInfo objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of ContactInfo objects
# param: xml node
# returns: a list of ContactInfo objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one ContactInfo object
# param: xml node
# returns: one ContactInfo object
sub fromWSXMLNode {
	my $ContactInfoNode = $_[1];
	
	## begin ELEMENT_NODE children ##
		my $city;
		my $email;
		my $faxNumber;
		my $id;
		my $institute;
		my $labName;
		my $phoneNumber;
		my $state;
		my $street;
		my $zipCode;
	## end ELEMENT_NODE children ##

	# get all children for this node
	for my $childrenNode ($ContactInfoNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		if( ! defined($childrenNode->getFirstChild) ){ next; };
		my $textNode = $childrenNode->getFirstChild;
		## begin iterate ELEMENT_NODE ##
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "city") {
				$city=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "email") {
				$email=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "faxNumber") {
				$faxNumber=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "institute") {
				$institute=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "labName") {
				$labName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "phoneNumber") {
				$phoneNumber=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "state") {
				$state=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "street") {
				$street=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "zipCode") {
				$zipCode=$textNode->getNodeValue;
			}
		## end iterate ELEMENT_NODE ##
	    }
	}
	my $newobj = new CaCORE::CaMOD::ContactInfo;
	## begin set attr ##
		$newobj->setCity($city);
		$newobj->setEmail($email);
		$newobj->setFaxNumber($faxNumber);
		$newobj->setId($id);
		$newobj->setInstitute($institute);
		$newobj->setLabName($labName);
		$newobj->setPhoneNumber($phoneNumber);
		$newobj->setState($state);
		$newobj->setStreet($street);
		$newobj->setZipCode($zipCode);
	## end set attr ##
	
	return $newobj;
}

## begin getters and setters ##

sub getCity {
	my $self = shift;
	return $self->{city};
}

sub setCity {
	my $self = shift;
	$self->{city} = shift;
}

sub getEmail {
	my $self = shift;
	return $self->{email};
}

sub setEmail {
	my $self = shift;
	$self->{email} = shift;
}

sub getFaxNumber {
	my $self = shift;
	return $self->{faxNumber};
}

sub setFaxNumber {
	my $self = shift;
	$self->{faxNumber} = shift;
}

sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getInstitute {
	my $self = shift;
	return $self->{institute};
}

sub setInstitute {
	my $self = shift;
	$self->{institute} = shift;
}

sub getLabName {
	my $self = shift;
	return $self->{labName};
}

sub setLabName {
	my $self = shift;
	$self->{labName} = shift;
}

sub getPhoneNumber {
	my $self = shift;
	return $self->{phoneNumber};
}

sub setPhoneNumber {
	my $self = shift;
	$self->{phoneNumber} = shift;
}

sub getState {
	my $self = shift;
	return $self->{state};
}

sub setState {
	my $self = shift;
	$self->{state} = shift;
}

sub getStreet {
	my $self = shift;
	return $self->{street};
}

sub setStreet {
	my $self = shift;
	$self->{street} = shift;
}

sub getZipCode {
	my $self = shift;
	return $self->{zipCode};
}

sub setZipCode {
	my $self = shift;
	$self->{zipCode} = shift;
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

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":CellLine\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# comments;
	if( defined( $self->getComments ) ) {
		$tmpstr = "<comments xsi:type=\"xsd:string\">" . $self->getComments . "</comments>";
	} else {
		$tmpstr = "<comments xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# experiment;
	if( defined( $self->getExperiment ) ) {
		$tmpstr = "<experiment xsi:type=\"xsd:string\">" . $self->getExperiment . "</experiment>";
	} else {
		$tmpstr = "<experiment xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# results;
	if( defined( $self->getResults ) ) {
		$tmpstr = "<results xsi:type=\"xsd:string\">" . $self->getResults . "</results>";
	} else {
		$tmpstr = "<results xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of CellLine objects
# param: xml doc
# returns: list of CellLine objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of CellLine objects
# param: xml node
# returns: a list of CellLine objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one CellLine object
# param: xml node
# returns: one CellLine object
sub fromWSXMLNode {
	my $CellLineNode = $_[1];
	
	## begin ELEMENT_NODE children ##
		my $comments;
		my $experiment;
		my $id;
		my $name;
		my $results;
	## end ELEMENT_NODE children ##

	# get all children for this node
	for my $childrenNode ($CellLineNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		if( ! defined($childrenNode->getFirstChild) ){ next; };
		my $textNode = $childrenNode->getFirstChild;
		## begin iterate ELEMENT_NODE ##
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "comments") {
				$comments=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "experiment") {
				$experiment=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
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
		$newobj->setComments($comments);
		$newobj->setExperiment($experiment);
		$newobj->setId($id);
		$newobj->setName($name);
		$newobj->setResults($results);
	## end set attr ##
	
	return $newobj;
}

## begin getters and setters ##

sub getComments {
	my $self = shift;
	return $self->{comments};
}

sub setComments {
	my $self = shift;
	$self->{comments} = shift;
}

sub getExperiment {
	my $self = shift;
	return $self->{experiment};
}

sub setExperiment {
	my $self = shift;
	$self->{experiment} = shift;
}

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

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":CarcinogenicIntervention\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of CarcinogenicIntervention objects
# param: xml doc
# returns: list of CarcinogenicIntervention objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of CarcinogenicIntervention objects
# param: xml node
# returns: a list of CarcinogenicIntervention objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one CarcinogenicIntervention object
# param: xml node
# returns: one CarcinogenicIntervention object
sub fromWSXMLNode {
	my $CarcinogenicInterventionNode = $_[1];
	
	## begin ELEMENT_NODE children ##
		my $id;
	## end ELEMENT_NODE children ##

	# get all children for this node
	for my $childrenNode ($CarcinogenicInterventionNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		if( ! defined($childrenNode->getFirstChild) ){ next; };
		my $textNode = $childrenNode->getFirstChild;
		## begin iterate ELEMENT_NODE ##
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
		## end iterate ELEMENT_NODE ##
	    }
	}
	my $newobj = new CaCORE::CaMOD::CarcinogenicIntervention;
	## begin set attr ##
		$newobj->setId($id);
	## end set attr ##
	
	return $newobj;
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

use 5.005;
#use strict;
use warnings;

require Exporter;

use XML::DOM;

## begin import objects ##
use CaCORE::ApplicationService;
## end import objects ##


@ISA = qw(CaCORE::CaMOD::AbstractCancerModel);
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":AnimalModel\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# url;
	if( defined( $self->getUrl ) ) {
		$tmpstr = "<url xsi:type=\"xsd:string\">" . $self->getUrl . "</url>";
	} else {
		$tmpstr = "<url xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# experimentDesign;
	if( defined( $self->getExperimentDesign ) ) {
		$tmpstr = "<experimentDesign xsi:type=\"xsd:string\">" . $self->getExperimentDesign . "</experimentDesign>";
	} else {
		$tmpstr = "<experimentDesign xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# modelDescriptor;
	if( defined( $self->getModelDescriptor ) ) {
		$tmpstr = "<modelDescriptor xsi:type=\"xsd:string\">" . $self->getModelDescriptor . "</modelDescriptor>";
	} else {
		$tmpstr = "<modelDescriptor xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of AnimalModel objects
# param: xml doc
# returns: list of AnimalModel objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of AnimalModel objects
# param: xml node
# returns: a list of AnimalModel objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one AnimalModel object
# param: xml node
# returns: one AnimalModel object
sub fromWSXMLNode {
	my $AnimalModelNode = $_[1];
	
	## begin ELEMENT_NODE children ##
		my $url;
		my $experimentDesign;
		my $id;
		my $modelDescriptor;
	## end ELEMENT_NODE children ##

	# get all children for this node
	for my $childrenNode ($AnimalModelNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		if( ! defined($childrenNode->getFirstChild) ){ next; };
		my $textNode = $childrenNode->getFirstChild;
		## begin iterate ELEMENT_NODE ##
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "url") {
				$url=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "experimentDesign") {
				$experimentDesign=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "modelDescriptor") {
				$modelDescriptor=$textNode->getNodeValue;
			}
		## end iterate ELEMENT_NODE ##
	    }
	}
	my $newobj = new CaCORE::CaMOD::AnimalModel;
	## begin set attr ##
		$newobj->setUrl($url);
		$newobj->setExperimentDesign($experimentDesign);
		$newobj->setId($id);
		$newobj->setModelDescriptor($modelDescriptor);
	## end set attr ##
	
	return $newobj;
}

## begin getters and setters ##

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

sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
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

sub getCarcinogenicInterventionCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::CarcinogenicIntervention", $self);
	return @results;
}

sub getCellLineCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::CellLine", $self);
	return @results;
}

sub getGenomicSegmentCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::GenomicSegment", $self);
	return @results;
}

sub getHistopathologyCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Histopathology", $self);
	return @results;
}

sub getImageCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::Image", $self);
	return @results;
}

sub getInducedMutationCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::InducedMutation", $self);
	return @results;
}

sub getJaxInfo {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::JaxInfo", $self);
	return $results[0];
}

sub getMicroArrayDataCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::MicroArrayData", $self);
	return @results;
}

sub getPartyRoleCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::PartyRole", $self);
	return @results;
}

sub getPhenotype {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::Phenotype", $self);
	return $results[0];
}

sub getRepositoryInfo {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::RepositoryInfo", $self);
	return $results[0];
}

sub getTargetedModificationCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::TargetedModification", $self);
	return @results;
}

sub getTherapyCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::Therapy", $self);
	return @results;
}

sub getTransgeneCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::Transgene", $self);
	return @results;
}

sub getXenograftCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::Xenograft", $self);
	return @results;
}

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
package CaCORE::CaMOD::EndpointCode;

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":EndpointCode\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# code;
	if( defined( $self->getCode ) ) {
		$tmpstr = "<code xsi:type=\"xsd:string\">" . $self->getCode . "</code>";
	} else {
		$tmpstr = "<code xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# description;
	if( defined( $self->getDescription ) ) {
		$tmpstr = "<description xsi:type=\"xsd:string\">" . $self->getDescription . "</description>";
	} else {
		$tmpstr = "<description xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of EndpointCode objects
# param: xml doc
# returns: list of EndpointCode objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of EndpointCode objects
# param: xml node
# returns: a list of EndpointCode objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one EndpointCode object
# param: xml node
# returns: one EndpointCode object
sub fromWSXMLNode {
	my $EndpointCodeNode = $_[1];
	
	## begin ELEMENT_NODE children ##
		my $code;
		my $description;
		my $id;
	## end ELEMENT_NODE children ##

	# get all children for this node
	for my $childrenNode ($EndpointCodeNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		if( ! defined($childrenNode->getFirstChild) ){ next; };
		my $textNode = $childrenNode->getFirstChild;
		## begin iterate ELEMENT_NODE ##
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "code") {
				$code=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "description") {
				$description=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
		## end iterate ELEMENT_NODE ##
	    }
	}
	my $newobj = new CaCORE::CaMOD::EndpointCode;
	## begin set attr ##
		$newobj->setCode($code);
		$newobj->setDescription($description);
		$newobj->setId($id);
	## end set attr ##
	
	return $newobj;
}

## begin getters and setters ##

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
# ------------------------------------------------------------------------------------------
package CaCORE::CaMOD::ScreeningResult;

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":ScreeningResult\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# aveinh;
	if( defined( $self->getAveinh ) ) {
		$tmpstr = "<aveinh xsi:type=\"xsd:float\">" . $self->getAveinh . "</aveinh>";
	} else {
		$tmpstr = "<aveinh xsi:type=\"xsd:float\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# diffinh;
	if( defined( $self->getDiffinh ) ) {
		$tmpstr = "<diffinh xsi:type=\"xsd:float\">" . $self->getDiffinh . "</diffinh>";
	} else {
		$tmpstr = "<diffinh xsi:type=\"xsd:float\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# inhibitionRate;
	if( defined( $self->getInhibitionRate ) ) {
		$tmpstr = "<inhibitionRate xsi:type=\"xsd:float\">" . $self->getInhibitionRate . "</inhibitionRate>";
	} else {
		$tmpstr = "<inhibitionRate xsi:type=\"xsd:float\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# stage;
	if( defined( $self->getStage ) ) {
		$tmpstr = "<stage xsi:type=\"xsd:string\">" . $self->getStage . "</stage>";
	} else {
		$tmpstr = "<stage xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of ScreeningResult objects
# param: xml doc
# returns: list of ScreeningResult objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of ScreeningResult objects
# param: xml node
# returns: a list of ScreeningResult objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one ScreeningResult object
# param: xml node
# returns: one ScreeningResult object
sub fromWSXMLNode {
	my $ScreeningResultNode = $_[1];
	
	## begin ELEMENT_NODE children ##
		my $aveinh;
		my $diffinh;
		my $id;
		my $inhibitionRate;
		my $stage;
	## end ELEMENT_NODE children ##

	# get all children for this node
	for my $childrenNode ($ScreeningResultNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		if( ! defined($childrenNode->getFirstChild) ){ next; };
		my $textNode = $childrenNode->getFirstChild;
		## begin iterate ELEMENT_NODE ##
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "aveinh") {
				$aveinh=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "diffinh") {
				$diffinh=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "inhibitionRate") {
				$inhibitionRate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "stage") {
				$stage=$textNode->getNodeValue;
			}
		## end iterate ELEMENT_NODE ##
	    }
	}
	my $newobj = new CaCORE::CaMOD::ScreeningResult;
	## begin set attr ##
		$newobj->setAveinh($aveinh);
		$newobj->setDiffinh($diffinh);
		$newobj->setId($id);
		$newobj->setInhibitionRate($inhibitionRate);
		$newobj->setStage($stage);
	## end set attr ##
	
	return $newobj;
}

## begin getters and setters ##

sub getAveinh {
	my $self = shift;
	return $self->{aveinh};
}

sub setAveinh {
	my $self = shift;
	$self->{aveinh} = shift;
}

sub getDiffinh {
	my $self = shift;
	return $self->{diffinh};
}

sub setDiffinh {
	my $self = shift;
	$self->{diffinh} = shift;
}

sub getId {
	my $self = shift;
	return $self->{id};
}

sub setId {
	my $self = shift;
	$self->{id} = shift;
}

sub getInhibitionRate {
	my $self = shift;
	return $self->{inhibitionRate};
}

sub setInhibitionRate {
	my $self = shift;
	$self->{inhibitionRate} = shift;
}

sub getStage {
	my $self = shift;
	return $self->{stage};
}

sub setStage {
	my $self = shift;
	$self->{stage} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getAgent {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Agent", $self);
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
package CaCORE::CaMOD::InvivoResult;

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":InvivoResult\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# evaluationDay;
	if( defined( $self->getEvaluationDay ) ) {
		$tmpstr = "<evaluationDay xsi:type=\"xsd:string\">" . $self->getEvaluationDay . "</evaluationDay>";
	} else {
		$tmpstr = "<evaluationDay xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# toxicityEvalDay;
	if( defined( $self->getToxicityEvalDay ) ) {
		$tmpstr = "<toxicityEvalDay xsi:type=\"xsd:string\">" . $self->getToxicityEvalDay . "</toxicityEvalDay>";
	} else {
		$tmpstr = "<toxicityEvalDay xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# toxicitySurvivors;
	if( defined( $self->getToxicitySurvivors ) ) {
		$tmpstr = "<toxicitySurvivors xsi:type=\"xsd:string\">" . $self->getToxicitySurvivors . "</toxicitySurvivors>";
	} else {
		$tmpstr = "<toxicitySurvivors xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of InvivoResult objects
# param: xml doc
# returns: list of InvivoResult objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of InvivoResult objects
# param: xml node
# returns: a list of InvivoResult objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one InvivoResult object
# param: xml node
# returns: one InvivoResult object
sub fromWSXMLNode {
	my $InvivoResultNode = $_[1];
	
	## begin ELEMENT_NODE children ##
		my $evaluationDay;
		my $id;
		my $toxicityEvalDay;
		my $toxicitySurvivors;
	## end ELEMENT_NODE children ##

	# get all children for this node
	for my $childrenNode ($InvivoResultNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		if( ! defined($childrenNode->getFirstChild) ){ next; };
		my $textNode = $childrenNode->getFirstChild;
		## begin iterate ELEMENT_NODE ##
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "evaluationDay") {
				$evaluationDay=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "toxicityEvalDay") {
				$toxicityEvalDay=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "toxicitySurvivors") {
				$toxicitySurvivors=$textNode->getNodeValue;
			}
		## end iterate ELEMENT_NODE ##
	    }
	}
	my $newobj = new CaCORE::CaMOD::InvivoResult;
	## begin set attr ##
		$newobj->setEvaluationDay($evaluationDay);
		$newobj->setId($id);
		$newobj->setToxicityEvalDay($toxicityEvalDay);
		$newobj->setToxicitySurvivors($toxicitySurvivors);
	## end set attr ##
	
	return $newobj;
}

## begin getters and setters ##

sub getEvaluationDay {
	my $self = shift;
	return $self->{evaluationDay};
}

sub setEvaluationDay {
	my $self = shift;
	$self->{evaluationDay} = shift;
}

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
package CaCORE::CaMOD::ModificationType;

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":ModificationType\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of ModificationType objects
# param: xml doc
# returns: list of ModificationType objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of ModificationType objects
# param: xml node
# returns: a list of ModificationType objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one ModificationType object
# param: xml node
# returns: one ModificationType object
sub fromWSXMLNode {
	my $ModificationTypeNode = $_[1];
	
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
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "id") {
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
	
	return $newobj;
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

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":ExpressionFeature\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of ExpressionFeature objects
# param: xml doc
# returns: list of ExpressionFeature objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of ExpressionFeature objects
# param: xml node
# returns: a list of ExpressionFeature objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one ExpressionFeature object
# param: xml node
# returns: one ExpressionFeature object
sub fromWSXMLNode {
	my $ExpressionFeatureNode = $_[1];
	
	## begin ELEMENT_NODE children ##
		my $id;
	## end ELEMENT_NODE children ##

	# get all children for this node
	for my $childrenNode ($ExpressionFeatureNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		if( ! defined($childrenNode->getFirstChild) ){ next; };
		my $textNode = $childrenNode->getFirstChild;
		## begin iterate ELEMENT_NODE ##
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
		## end iterate ELEMENT_NODE ##
	    }
	}
	my $newobj = new CaCORE::CaMOD::ExpressionFeature;
	## begin set attr ##
		$newobj->setId($id);
	## end set attr ##
	
	return $newobj;
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

use 5.005;
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
	my $result = shift;
	my $assigned_id = shift;
	my $current_id = shift;
	my $l = shift;
	my %worklist = %$l;
	
	# prefix portion of the xml
	$result .= "<multiRef id=\"id" . $assigned_id ."\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns" . $current_id . ":CancerModel\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns" . $current_id . "=\"urn:ws.domain.camod.nci.nih.gov\">";
	my $tmpstr = "";
	$current_id ++;
	
	## begin attribute to XML ##
	# id;
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$result .= $tmpstr;

	## end attribute to XML ##
	
	## begin association to XML ##
	## end association to XML ##
	
	# add trailing close tags
	$result .= "</multiRef>";
	
	return ($result, $current_id, %worklist);
}

# parse a given webservice response xml, construct a list of CancerModel objects
# param: xml doc
# returns: list of CancerModel objects
sub fromWebserviceXML {
	my $self = shift;
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse(shift);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	return $self->fromWSXMLListNode($root);
}

# parse a given xml node, construct a list of CancerModel objects
# param: xml node
# returns: a list of CancerModel objects
sub fromWSXMLListNode {
	my $self = shift;
	my $listNode = shift;
	my @obj_list = ();
	
	# get all children for this node
	for my $childrenNode ($listNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		my $newobj = $self->fromWSXMLNode($childrenNode);
		push @obj_list, $newobj;
	    }
	}
	
	return @obj_list;
}

# parse a given xml node, construct one CancerModel object
# param: xml node
# returns: one CancerModel object
sub fromWSXMLNode {
	my $CancerModelNode = $_[1];
	
	## begin ELEMENT_NODE children ##
		my $id;
	## end ELEMENT_NODE children ##

	# get all children for this node
	for my $childrenNode ($CancerModelNode->getChildNodes) {
	    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
		if( ! defined($childrenNode->getFirstChild) ){ next; };
		my $textNode = $childrenNode->getFirstChild;
		## begin iterate ELEMENT_NODE ##
		if (0) {
			# do nothing, just a place holder for "if" component
		}
			elsif ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
		## end iterate ELEMENT_NODE ##
	    }
	}
	my $newobj = new CaCORE::CaMOD::CancerModel;
	## begin set attr ##
		$newobj->setId($id);
	## end set attr ##
	
	return $newobj;
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
# Below is module documentation for AbstractCancerModel

=pod

=head1 AbstractCancerModel

CaCORE::CaMOD::AbstractCancerModel - Perl extension for AbstractCancerModel.

=head2 ABSTRACT

The CaCORE::CaMOD::AbstractCancerModel is a Perl object representation of the
CaCORE AbstractCancerModel object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION



=head2 ATTRIBUTES of AbstractCancerModel

The following are all the attributes of the AbstractCancerModel object and their data types:

=over 4

=item experimentDesign

data type: C<string>

=item id

data type: C<long>

=item modelDescriptor

data type: C<string>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of AbstractCancerModel

The following are all the objects that are associated with the AbstractCancerModel:

=over 4

=item Collection of L</ApprovalStatus>:

Many to one assoication, use C<getApprovalStatus> to get the associated ApprovalStatus.

=item Collection of L</Availability>:

Many to one assoication, use C<getAvailability> to get the associated Availability.

=item Instance of L</Publication>:

One to many assoication, use C<getPublicationCollection> to get a collection of associated Publication.


=back

=cut

# Below is module documentation for AnimalModel

=pod

=head1 AnimalModel

CaCORE::CaMOD::AnimalModel - Perl extension for AnimalModel.

=head2 ABSTRACT

The CaCORE::CaMOD::AnimalModel is a Perl object representation of the
CaCORE AnimalModel object.

AnimalModel extends from domain object L<"AbstractCancerModel">.

=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

An animal model which develops cancer or can be used to generate a model that develops cancer.

=head2 ATTRIBUTES of AnimalModel

The following are all the attributes of the AnimalModel object and their data types:

=over 4

=item url

data type: C<string>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of AnimalModel

The following are all the objects that are associated with the AnimalModel:

=over 4

=item Instance of L</CarcinogenicIntervention>:

One to many assoication, use C<getCarcinogenicInterventionCollection> to get a collection of associated CarcinogenicIntervention.

=item Instance of L</CellLine>:

One to many assoication, use C<getCellLineCollection> to get a collection of associated CellLine.

=item Instance of L</GenomicSegment>:

One to many assoication, use C<getGenomicSegmentCollection> to get a collection of associated GenomicSegment.

=item Instance of L</Histopathology>:

One to many assoication, use C<getHistopathologyCollection> to get a collection of associated Histopathology.

=item Instance of L</Image>:

One to many assoication, use C<getImageCollection> to get a collection of associated Image.

=item Instance of L</InducedMutation>:

One to many assoication, use C<getInducedMutationCollection> to get a collection of associated InducedMutation.

=item Collection of L</JaxInfo>:

Many to one assoication, use C<getJaxInfo> to get the associated JaxInfo.

=item Instance of L</MicroArrayData>:

One to many assoication, use C<getMicroArrayDataCollection> to get a collection of associated MicroArrayData.

=item Instance of L</PartyRole>:

One to many assoication, use C<getPartyRoleCollection> to get a collection of associated PartyRole.

=item Collection of L</Phenotype>:

Many to one assoication, use C<getPhenotype> to get the associated Phenotype.

=item Collection of L</RepositoryInfo>:

Many to one assoication, use C<getRepositoryInfo> to get the associated RepositoryInfo.

=item Instance of L</TargetedModification>:

One to many assoication, use C<getTargetedModificationCollection> to get a collection of associated TargetedModification.

=item Instance of L</Therapy>:

One to many assoication, use C<getTherapyCollection> to get a collection of associated Therapy.

=item Instance of L</Transgene>:

One to many assoication, use C<getTransgeneCollection> to get a collection of associated Transgene.

=item Instance of L</Xenograft>:

One to many assoication, use C<getXenograftCollection> to get a collection of associated Xenograft.


=back

=cut

# Below is module documentation for ApprovalStatus

=pod

=head1 ApprovalStatus

CaCORE::CaMOD::ApprovalStatus - Perl extension for ApprovalStatus.

=head2 ABSTRACT

The CaCORE::CaMOD::ApprovalStatus is a Perl object representation of the
CaCORE ApprovalStatus object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION



=head2 ATTRIBUTES of ApprovalStatus

The following are all the attributes of the ApprovalStatus object and their data types:

=over 4

=item id

data type: C<long>

=item name

data type: C<string>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of ApprovalStatus

The following are all the objects that are associated with the ApprovalStatus:

=over 4


=back

=cut

# Below is module documentation for Availability

=pod

=head1 Availability

CaCORE::CaMOD::Availability - Perl extension for Availability.

=head2 ABSTRACT

The CaCORE::CaMOD::Availability is a Perl object representation of the
CaCORE Availability object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

Dates on which a animal model record was entered, modified or release to the intended viewing audience.

=head2 ATTRIBUTES of Availability

The following are all the attributes of the Availability object and their data types:

=over 4

=item enteredDate

data type: C<dateTime>

=item id

data type: C<long>

=item modifiedDate

data type: C<dateTime>

=item releaseDate

data type: C<dateTime>

=item visibleTo

data type: C<string>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of Availability

The following are all the objects that are associated with the Availability:

=over 4


=back

=cut

# Below is module documentation for CancerModel

=pod

=head1 CancerModel

CaCORE::CaMOD::CancerModel - Perl extension for CancerModel.

=head2 ABSTRACT

The CaCORE::CaMOD::CancerModel is a Perl object representation of the
CaCORE CancerModel object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION



=head2 ATTRIBUTES of CancerModel

The following are all the attributes of the CancerModel object and their data types:

=over 4

=item id

data type: C<long>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of CancerModel

The following are all the objects that are associated with the CancerModel:

=over 4


=back

=cut

# Below is module documentation for CarcinogenicIntervention

=pod

=head1 CarcinogenicIntervention

CaCORE::CaMOD::CarcinogenicIntervention - Perl extension for CarcinogenicIntervention.

=head2 ABSTRACT

The CaCORE::CaMOD::CarcinogenicIntervention is a Perl object representation of the
CaCORE CarcinogenicIntervention object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

Treatment or procedure that the animal model was exposed to in order to initiate or support the development of neoplastic lesions.

=head2 ATTRIBUTES of CarcinogenicIntervention

The following are all the attributes of the CarcinogenicIntervention object and their data types:

=over 4

=item id

data type: C<long>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of CarcinogenicIntervention

The following are all the objects that are associated with the CarcinogenicIntervention:

=over 4

=item Collection of L</EnvironmentalFactor>:

Many to one assoication, use C<getEnvironmentalFactor> to get the associated EnvironmentalFactor.

=item Collection of L</TreatmentSchedule>:

Many to one assoication, use C<getTreatmentSchedule> to get the associated TreatmentSchedule.


=back

=cut

# Below is module documentation for CellLine

=pod

=head1 CellLine

CaCORE::CaMOD::CellLine - Perl extension for CellLine.

=head2 ABSTRACT

The CaCORE::CaMOD::CellLine is a Perl object representation of the
CaCORE CellLine object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

Cell lines generated from the animal model.

=head2 ATTRIBUTES of CellLine

The following are all the attributes of the CellLine object and their data types:

=over 4

=item comments

data type: C<string>

=item experiment

data type: C<string>

=item id

data type: C<long>

=item name

data type: C<string>

=item results

data type: C<string>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of CellLine

The following are all the objects that are associated with the CellLine:

=over 4

=item Instance of L</Publication>:

One to many assoication, use C<getPublicationCollection> to get a collection of associated Publication.


=back

=cut

# Below is module documentation for Conditionality

=pod

=head1 Conditionality

CaCORE::CaMOD::Conditionality - Perl extension for Conditionality.

=head2 ABSTRACT

The CaCORE::CaMOD::Conditionality is a Perl object representation of the
CaCORE Conditionality object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

Indicates if a transgene or targeted modification is done conditionally (time or tissue specific).

=head2 ATTRIBUTES of Conditionality

The following are all the attributes of the Conditionality object and their data types:

=over 4

=item conditionedBy

data type: C<string>

=item description

data type: C<string>

=item id

data type: C<long>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of Conditionality

The following are all the objects that are associated with the Conditionality:

=over 4


=back

=cut

# Below is module documentation for ContactInfo

=pod

=head1 ContactInfo

CaCORE::CaMOD::ContactInfo - Perl extension for ContactInfo.

=head2 ABSTRACT

The CaCORE::CaMOD::ContactInfo is a Perl object representation of the
CaCORE ContactInfo object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

Information regarding the person who submitted the data.

=head2 ATTRIBUTES of ContactInfo

The following are all the attributes of the ContactInfo object and their data types:

=over 4

=item city

data type: C<string>

=item email

data type: C<string>

=item faxNumber

data type: C<string>

=item id

data type: C<long>

=item institute

data type: C<string>

=item labName

data type: C<string>

=item phoneNumber

data type: C<string>

=item state

data type: C<string>

=item street

data type: C<string>

=item zipCode

data type: C<string>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of ContactInfo

The following are all the objects that are associated with the ContactInfo:

=over 4

=item Instance of L</Party>:

One to many assoication, use C<getPartyCollection> to get a collection of associated Party.


=back

=cut

# Below is module documentation for EndpointCode

=pod

=head1 EndpointCode

CaCORE::CaMOD::EndpointCode - Perl extension for EndpointCode.

=head2 ABSTRACT

The CaCORE::CaMOD::EndpointCode is a Perl object representation of the
CaCORE EndpointCode object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

A endpoint code captures the parameter for measuring success of anti-drug screen test; mean tumor weightm median survival time, etc.

=head2 ATTRIBUTES of EndpointCode

The following are all the attributes of the EndpointCode object and their data types:

=over 4

=item code

data type: C<string>

=item description

data type: C<string>

=item id

data type: C<long>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of EndpointCode

The following are all the objects that are associated with the EndpointCode:

=over 4


=back

=cut

# Below is module documentation for EngineeredGene

=pod

=head1 EngineeredGene

CaCORE::CaMOD::EngineeredGene - Perl extension for EngineeredGene.

=head2 ABSTRACT

The CaCORE::CaMOD::EngineeredGene is a Perl object representation of the
CaCORE EngineeredGene object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

Manipulated Gene introduced in the animal model.

=head2 ATTRIBUTES of EngineeredGene

The following are all the attributes of the EngineeredGene object and their data types:

=over 4

=item cabioId

data type: C<long>

=item id

data type: C<long>

=item name

data type: C<string>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of EngineeredGene

The following are all the objects that are associated with the EngineeredGene:

=over 4

=item Collection of L</Conditionality>:

Many to one assoication, use C<getConditionality> to get the associated Conditionality.

=item Instance of L</DatabaseCrossReference>:

One to many assoication, use C<getDatabaseCrossReferenceCollection> to get a collection of associated DatabaseCrossReference.

=item Instance of L</ExpressionFeature>:

One to many assoication, use C<getExpressionFeatureCollection> to get a collection of associated ExpressionFeature.

=item Instance of L</Gene>:

One to many assoication, use C<getGeneCollection> to get a collection of associated Gene.

=item Collection of L</GenotypeSummary>:

Many to one assoication, use C<getGenotypeSummary> to get the associated GenotypeSummary.

=item Collection of L</Image>:

Many to one assoication, use C<getImage> to get the associated Image.


=back

=cut

# Below is module documentation for EnvironmentalFactor

=pod

=head1 EnvironmentalFactor

CaCORE::CaMOD::EnvironmentalFactor - Perl extension for EnvironmentalFactor.

=head2 ABSTRACT

The CaCORE::CaMOD::EnvironmentalFactor is a Perl object representation of the
CaCORE EnvironmentalFactor object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

Chemical, radiation, hormone treatment or other environmental factor that initiates or supports development of neoplasias.

=head2 ATTRIBUTES of EnvironmentalFactor

The following are all the attributes of the EnvironmentalFactor object and their data types:

=over 4

=item id

data type: C<long>

=item name

data type: C<string>

=item type

data type: C<string>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of EnvironmentalFactor

The following are all the objects that are associated with the EnvironmentalFactor:

=over 4

=item Instance of L</InducedMutation>:

One to many assoication, use C<getInducedMutationCollection> to get a collection of associated InducedMutation.


=back

=cut

# Below is module documentation for ExpressionFeature

=pod

=head1 ExpressionFeature

CaCORE::CaMOD::ExpressionFeature - Perl extension for ExpressionFeature.

=head2 ABSTRACT

The CaCORE::CaMOD::ExpressionFeature is a Perl object representation of the
CaCORE ExpressionFeature object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

The expression feature object describes expression pattern of the engineered gene in the cancer model.

=head2 ATTRIBUTES of ExpressionFeature

The following are all the attributes of the ExpressionFeature object and their data types:

=over 4

=item id

data type: C<long>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of ExpressionFeature

The following are all the objects that are associated with the ExpressionFeature:

=over 4

=item Instance of L</OrganOntology>:

One to many assoication, use C<getOrganOntologyCollection> to get a collection of associated OrganOntology.


=back

=cut

# Below is module documentation for GeneDelivery

=pod

=head1 GeneDelivery

CaCORE::CaMOD::GeneDelivery - Perl extension for GeneDelivery.

=head2 ABSTRACT

The CaCORE::CaMOD::GeneDelivery is a Perl object representation of the
CaCORE GeneDelivery object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

Gene is delivered to specific organs or specific receptors within the animal model. using viral vectors

=head2 ATTRIBUTES of GeneDelivery

The following are all the attributes of the GeneDelivery object and their data types:

=over 4

=item id

data type: C<long>

=item viralVector

data type: C<string>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of GeneDelivery

The following are all the objects that are associated with the GeneDelivery:

=over 4

=item Collection of L</EngineeredGene>:

Many to one assoication, use C<getEngineeredGene> to get the associated EngineeredGene.


=back

=cut

# Below is module documentation for GeneFunction

=pod

=head1 GeneFunction

CaCORE::CaMOD::GeneFunction - Perl extension for GeneFunction.

=head2 ABSTRACT

The CaCORE::CaMOD::GeneFunction is a Perl object representation of the
CaCORE GeneFunction object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

Functions of the engineered genes.

=head2 ATTRIBUTES of GeneFunction

The following are all the attributes of the GeneFunction object and their data types:

=over 4

=item function

data type: C<string>

=item id

data type: C<long>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of GeneFunction

The following are all the objects that are associated with the GeneFunction:

=over 4

=item Collection of L</EngineeredGene>:

Many to one assoication, use C<getEngineeredGene> to get the associated EngineeredGene.


=back

=cut

# Below is module documentation for GeneticAlteration

=pod

=head1 GeneticAlteration

CaCORE::CaMOD::GeneticAlteration - Perl extension for GeneticAlteration.

=head2 ABSTRACT

The CaCORE::CaMOD::GeneticAlteration is a Perl object representation of the
CaCORE GeneticAlteration object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

Genetic alterations found in the neoplastic lesions of the animal model. These alterations are not made intentionally.

=head2 ATTRIBUTES of GeneticAlteration

The following are all the attributes of the GeneticAlteration object and their data types:

=over 4

=item id

data type: C<long>

=item methodOfObservation

data type: C<string>

=item observation

data type: C<string>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of GeneticAlteration

The following are all the objects that are associated with the GeneticAlteration:

=over 4


=back

=cut

# Below is module documentation for GenomicSegment

=pod

=head1 GenomicSegment

CaCORE::CaMOD::GenomicSegment - Perl extension for GenomicSegment.

=head2 ABSTRACT

The CaCORE::CaMOD::GenomicSegment is a Perl object representation of the
CaCORE GenomicSegment object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

Genomic segment extracted from a library e.g. BAC or YAC library to be used in the genetic manipulation of the animal model.

=head2 ATTRIBUTES of GenomicSegment

The following are all the attributes of the GenomicSegment object and their data types:

=over 4

=item cloneDesignator

data type: C<string>

=item id

data type: C<long>

=item locationOfIntegration

data type: C<string>

=item segmentSize

data type: C<string>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of GenomicSegment

The following are all the objects that are associated with the GenomicSegment:

=over 4

=item Instance of L</EngineeredGene>:

One to many assoication, use C<getEngineeredGeneCollection> to get a collection of associated EngineeredGene.

=item Collection of L</SegmentType>:

Many to one assoication, use C<getSegmentType> to get the associated SegmentType.


=back

=cut

# Below is module documentation for GenotypeSummary

=pod

=head1 GenotypeSummary

CaCORE::CaMOD::GenotypeSummary - Perl extension for GenotypeSummary.

=head2 ABSTRACT

The CaCORE::CaMOD::GenotypeSummary is a Perl object representation of the
CaCORE GenotypeSummary object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

Listing of the genetic changes made deliberately in order to generate the animal model.

=head2 ATTRIBUTES of GenotypeSummary

The following are all the attributes of the GenotypeSummary object and their data types:

=over 4

=item genotype

data type: C<string>

=item id

data type: C<long>

=item summary

data type: C<string>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of GenotypeSummary

The following are all the objects that are associated with the GenotypeSummary:

=over 4

=item Collection of L</Nomenclature>:

Many to one assoication, use C<getNomenclature> to get the associated Nomenclature.


=back

=cut

# Below is module documentation for Image

=pod

=head1 Image

CaCORE::CaMOD::Image - Perl extension for Image.

=head2 ABSTRACT

The CaCORE::CaMOD::Image is a Perl object representation of the
CaCORE Image object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

Images related to the animal model e.g. histology images, blots, and graphics.

=head2 ATTRIBUTES of Image

The following are all the attributes of the Image object and their data types:

=over 4

=item description

data type: C<string>

=item id

data type: C<long>

=item staining

data type: C<string>

=item title

data type: C<string>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of Image

The following are all the objects that are associated with the Image:

=over 4

=item Collection of L</Availability>:

Many to one assoication, use C<getAvailability> to get the associated Availability.


=back

=cut

# Below is module documentation for InducedMutation

=pod

=head1 InducedMutation

CaCORE::CaMOD::InducedMutation - Perl extension for InducedMutation.

=head2 ABSTRACT

The CaCORE::CaMOD::InducedMutation is a Perl object representation of the
CaCORE InducedMutation object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

Induced mutations are defined as mutations triggered by radiation, chemicals or other means. Progeny of the treated animal inherits the mutation.

=head2 ATTRIBUTES of InducedMutation

The following are all the attributes of the InducedMutation object and their data types:

=over 4

=item id

data type: C<long>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of InducedMutation

The following are all the objects that are associated with the InducedMutation:

=over 4

=item Instance of L</EngineeredGene>:

One to many assoication, use C<getEngineeredGeneCollection> to get a collection of associated EngineeredGene.

=item Collection of L</EnvironmentalFactor>:

Many to one assoication, use C<getEnvironmentalFactor> to get the associated EnvironmentalFactor.


=back

=cut

# Below is module documentation for IntegrationType

=pod

=head1 IntegrationType

CaCORE::CaMOD::IntegrationType - Perl extension for IntegrationType.

=head2 ABSTRACT

The CaCORE::CaMOD::IntegrationType is a Perl object representation of the
CaCORE IntegrationType object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

Location of the integration of the engineered gene e.g. random or targeted.

=head2 ATTRIBUTES of IntegrationType

The following are all the attributes of the IntegrationType object and their data types:

=over 4

=item id

data type: C<long>

=item name

data type: C<string>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of IntegrationType

The following are all the objects that are associated with the IntegrationType:

=over 4

=item Instance of L</GenomicSegment>:

One to many assoication, use C<getGenomicSegmentCollection> to get a collection of associated GenomicSegment.

=item Instance of L</Transgene>:

One to many assoication, use C<getTransgeneCollection> to get a collection of associated Transgene.


=back

=cut

# Below is module documentation for InvivoResult

=pod

=head1 InvivoResult

CaCORE::CaMOD::InvivoResult - Perl extension for InvivoResult.

=head2 ABSTRACT

The CaCORE::CaMOD::InvivoResult is a Perl object representation of the
CaCORE InvivoResult object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

An Invivo Result captures the results of anti-tumor drug screening.

=head2 ATTRIBUTES of InvivoResult

The following are all the attributes of the InvivoResult object and their data types:

=over 4

=item evaluationDay

data type: C<string>

=item id

data type: C<long>

=item toxicityEvalDay

data type: C<string>

=item toxicitySurvivors

data type: C<string>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of InvivoResult

The following are all the objects that are associated with the InvivoResult:

=over 4

=item Collection of L</Agent>:

Many to one assoication, use C<getAgent> to get the associated Agent.

=item Collection of L</EndpointCode>:

Many to one assoication, use C<getEndpointCode> to get the associated EndpointCode.

=item Collection of L</TreatmentSchedule>:

Many to one assoication, use C<getTreatmentSchedule> to get the associated TreatmentSchedule.


=back

=cut

# Below is module documentation for JaxInfo

=pod

=head1 JaxInfo

CaCORE::CaMOD::JaxInfo - Perl extension for JaxInfo.

=head2 ABSTRACT

The CaCORE::CaMOD::JaxInfo is a Perl object representation of the
CaCORE JaxInfo object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

Identification number (stock number) of strain at the Jackson Laboratory, number can be used for ordering the strain; http://www.jax.org.

=head2 ATTRIBUTES of JaxInfo

The following are all the attributes of the JaxInfo object and their data types:

=over 4

=item id

data type: C<long>

=item jaxStockNo

data type: C<long>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of JaxInfo

The following are all the objects that are associated with the JaxInfo:

=over 4


=back

=cut

# Below is module documentation for MicroArrayData

=pod

=head1 MicroArrayData

CaCORE::CaMOD::MicroArrayData - Perl extension for MicroArrayData.

=head2 ABSTRACT

The CaCORE::CaMOD::MicroArrayData is a Perl object representation of the
CaCORE MicroArrayData object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

Data of microarray experiments generated from the animal model.

=head2 ATTRIBUTES of MicroArrayData

The following are all the attributes of the MicroArrayData object and their data types:

=over 4

=item experimentId

data type: C<long>

=item experimentName

data type: C<string>

=item id

data type: C<long>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of MicroArrayData

The following are all the objects that are associated with the MicroArrayData:

=over 4

=item Collection of L</Availability>:

Many to one assoication, use C<getAvailability> to get the associated Availability.


=back

=cut

# Below is module documentation for ModificationType

=pod

=head1 ModificationType

CaCORE::CaMOD::ModificationType - Perl extension for ModificationType.

=head2 ABSTRACT

The CaCORE::CaMOD::ModificationType is a Perl object representation of the
CaCORE ModificationType object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION



=head2 ATTRIBUTES of ModificationType

The following are all the attributes of the ModificationType object and their data types:

=over 4

=item id

data type: C<long>

=item name

data type: C<string>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of ModificationType

The following are all the objects that are associated with the ModificationType:

=over 4

=item Instance of L</TargetedModification>:

One to many assoication, use C<getTargetedModificationCollection> to get a collection of associated TargetedModification.


=back

=cut

# Below is module documentation for Nomenclature

=pod

=head1 Nomenclature

CaCORE::CaMOD::Nomenclature - Perl extension for Nomenclature.

=head2 ABSTRACT

The CaCORE::CaMOD::Nomenclature is a Perl object representation of the
CaCORE Nomenclature object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

Official nomenclature name for mouse and rat models.

=head2 ATTRIBUTES of Nomenclature

The following are all the attributes of the Nomenclature object and their data types:

=over 4

=item id

data type: C<long>

=item name

data type: C<string>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of Nomenclature

The following are all the objects that are associated with the Nomenclature:

=over 4


=back

=cut

# Below is module documentation for Organization

=pod

=head1 Organization

CaCORE::CaMOD::Organization - Perl extension for Organization.

=head2 ABSTRACT

The CaCORE::CaMOD::Organization is a Perl object representation of the
CaCORE Organization object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

Organizational unit like a laboratory, institute or consortium.

=head2 ATTRIBUTES of Organization

The following are all the attributes of the Organization object and their data types:

=over 4

=item id

data type: C<long>

=item name

data type: C<string>

=item partyId

data type: C<long>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of Organization

The following are all the objects that are associated with the Organization:

=over 4


=back

=cut

# Below is module documentation for Party

=pod

=head1 Party

CaCORE::CaMOD::Party - Perl extension for Party.

=head2 ABSTRACT

The CaCORE::CaMOD::Party is a Perl object representation of the
CaCORE Party object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

Entity that has access to the data, either a person or an organization.

=head2 ATTRIBUTES of Party

The following are all the attributes of the Party object and their data types:

=over 4

=item id

data type: C<long>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of Party

The following are all the objects that are associated with the Party:

=over 4

=item Instance of L</ContactInfo>:

One to many assoication, use C<getContactInfoCollection> to get a collection of associated ContactInfo.

=item Instance of L</PartyRole>:

One to many assoication, use C<getPartyRoleCollection> to get a collection of associated PartyRole.


=back

=cut

# Below is module documentation for PartyRole

=pod

=head1 PartyRole

CaCORE::CaMOD::PartyRole - Perl extension for PartyRole.

=head2 ABSTRACT

The CaCORE::CaMOD::PartyRole is a Perl object representation of the
CaCORE PartyRole object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

Object connects the party (organization or person) with the animal model.

=head2 ATTRIBUTES of PartyRole

The following are all the attributes of the PartyRole object and their data types:

=over 4

=item id

data type: C<long>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of PartyRole

The following are all the objects that are associated with the PartyRole:

=over 4

=item Instance of L</AnimalModel>:

One to many assoication, use C<getAnimalModelCollection> to get a collection of associated AnimalModel.

=item Collection of L</Party>:

Many to one assoication, use C<getParty> to get the associated Party.

=item Collection of L</Role>:

Many to one assoication, use C<getRole> to get the associated Role.


=back

=cut

# Below is module documentation for Person

=pod

=head1 Person

CaCORE::CaMOD::Person - Perl extension for Person.

=head2 ABSTRACT

The CaCORE::CaMOD::Person is a Perl object representation of the
CaCORE Person object.

Person extends from domain object L<"Party">.

=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

Person's first and last name and the connection to the party.

=head2 ATTRIBUTES of Person

The following are all the attributes of the Person object and their data types:

=over 4

=item firstName

data type: C<string>

=item lastName

data type: C<string>

=item partyId

data type: C<long>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of Person

The following are all the objects that are associated with the Person:

=over 4


=back

=cut

# Below is module documentation for Phenotype

=pod

=head1 Phenotype

CaCORE::CaMOD::Phenotype - Perl extension for Phenotype.

=head2 ABSTRACT

The CaCORE::CaMOD::Phenotype is a Perl object representation of the
CaCORE Phenotype object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

Phenotype displayed by the animal model such as neoplastic lesions, other diseases, behavioral problem.

=head2 ATTRIBUTES of Phenotype

The following are all the attributes of the Phenotype object and their data types:

=over 4

=item breedingNotes

data type: C<string>

=item description

data type: C<string>

=item id

data type: C<long>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of Phenotype

The following are all the objects that are associated with the Phenotype:

=over 4

=item Collection of L</SexDistribution>:

Many to one assoication, use C<getSexDistribution> to get the associated SexDistribution.


=back

=cut

# Below is module documentation for Promoter

=pod

=head1 Promoter

CaCORE::CaMOD::Promoter - Perl extension for Promoter.

=head2 ABSTRACT

The CaCORE::CaMOD::Promoter is a Perl object representation of the
CaCORE Promoter object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

Promoter is a subcategory of the regulatory element.

=head2 ATTRIBUTES of Promoter

The following are all the attributes of the Promoter object and their data types:

=over 4

=item id

data type: C<long>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of Promoter

The following are all the objects that are associated with the Promoter:

=over 4

=item Collection of L</Gene>:

Many to one assoication, use C<getGene> to get the associated Gene.

=item Collection of L</RegulatoryElement>:

Many to one assoication, use C<getRegulatoryElement> to get the associated RegulatoryElement.


=back

=cut

# Below is module documentation for Publication

=pod

=head1 Publication

CaCORE::CaMOD::Publication - Perl extension for Publication.

=head2 ABSTRACT

The CaCORE::CaMOD::Publication is a Perl object representation of the
CaCORE Publication object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

Publications describing the animal model itself or experiments in which the animal model was used.

=head2 ATTRIBUTES of Publication

The following are all the attributes of the Publication object and their data types:

=over 4

=item authors

data type: C<string>

=item endPage

data type: C<long>

=item id

data type: C<long>

=item journal

data type: C<string>

=item pmid

data type: C<long>

=item startPage

data type: C<long>

=item title

data type: C<string>

=item volume

data type: C<string>

=item year

data type: C<long>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of Publication

The following are all the objects that are associated with the Publication:

=over 4

=item Collection of L</PublicationStatus>:

Many to one assoication, use C<getPublicationStatus> to get the associated PublicationStatus.


=back

=cut

# Below is module documentation for PublicationStatus

=pod

=head1 PublicationStatus

CaCORE::CaMOD::PublicationStatus - Perl extension for PublicationStatus.

=head2 ABSTRACT

The CaCORE::CaMOD::PublicationStatus is a Perl object representation of the
CaCORE PublicationStatus object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

Status of the publication e.g. published, submitted.

=head2 ATTRIBUTES of PublicationStatus

The following are all the attributes of the PublicationStatus object and their data types:

=over 4

=item id

data type: C<long>

=item name

data type: C<string>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of PublicationStatus

The following are all the objects that are associated with the PublicationStatus:

=over 4


=back

=cut

# Below is module documentation for RegulatoryElement

=pod

=head1 RegulatoryElement

CaCORE::CaMOD::RegulatoryElement - Perl extension for RegulatoryElement.

=head2 ABSTRACT

The CaCORE::CaMOD::RegulatoryElement is a Perl object representation of the
CaCORE RegulatoryElement object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

A regulatory element controls the expression of a gene and/or and engineered gene.

=head2 ATTRIBUTES of RegulatoryElement

The following are all the attributes of the RegulatoryElement object and their data types:

=over 4

=item id

data type: C<long>

=item name

data type: C<string>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of RegulatoryElement

The following are all the objects that are associated with the RegulatoryElement:

=over 4

=item Instance of L</Promoter>:

One to many assoication, use C<getPromoterCollection> to get a collection of associated Promoter.

=item Collection of L</RegulatoryElementType>:

Many to one assoication, use C<getRegulatoryElementType> to get the associated RegulatoryElementType.

=item Collection of L</Taxon>:

Many to one assoication, use C<getTaxon> to get the associated Taxon.


=back

=cut

# Below is module documentation for RegulatoryElementType

=pod

=head1 RegulatoryElementType

CaCORE::CaMOD::RegulatoryElementType - Perl extension for RegulatoryElementType.

=head2 ABSTRACT

The CaCORE::CaMOD::RegulatoryElementType is a Perl object representation of the
CaCORE RegulatoryElementType object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

Type of the regulatory element e.g. promoter, polyA signal.

=head2 ATTRIBUTES of RegulatoryElementType

The following are all the attributes of the RegulatoryElementType object and their data types:

=over 4

=item id

data type: C<long>

=item name

data type: C<string>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of RegulatoryElementType

The following are all the objects that are associated with the RegulatoryElementType:

=over 4


=back

=cut

# Below is module documentation for RepositoryInfo

=pod

=head1 RepositoryInfo

CaCORE::CaMOD::RepositoryInfo - Perl extension for RepositoryInfo.

=head2 ABSTRACT

The CaCORE::CaMOD::RepositoryInfo is a Perl object representation of the
CaCORE RepositoryInfo object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

Some animal models are distributed by the MMHCC mouse repository. Object contains information about the availability of a particular model from the repository. A submitter of data to the cancer models database can also indicate if their model should be submitted to the repository.

=head2 ATTRIBUTES of RepositoryInfo

The following are all the attributes of the RepositoryInfo object and their data types:

=over 4

=item id

data type: C<long>

=item inTheRepository

data type: C<long>

=item sentEmailContent

data type: C<string>

=item suggestSubmission

data type: C<long>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of RepositoryInfo

The following are all the objects that are associated with the RepositoryInfo:

=over 4


=back

=cut

# Below is module documentation for Role

=pod

=head1 Role

CaCORE::CaMOD::Role - Perl extension for Role.

=head2 ABSTRACT

The CaCORE::CaMOD::Role is a Perl object representation of the
CaCORE Role object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

Defines a relationship between two concepts. 

=head2 ATTRIBUTES of Role

The following are all the attributes of the Role object and their data types:

=over 4

=item id

data type: C<long>

=item name

data type: C<string>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of Role

The following are all the objects that are associated with the Role:

=over 4

=item Instance of L</PartyRole>:

One to many assoication, use C<getPartyRoleCollection> to get a collection of associated PartyRole.


=back

=cut

# Below is module documentation for ScreeningResult

=pod

=head1 ScreeningResult

CaCORE::CaMOD::ScreeningResult - Perl extension for ScreeningResult.

=head2 ABSTRACT

The CaCORE::CaMOD::ScreeningResult is a Perl object representation of the
CaCORE ScreeningResult object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

A Screening Result captures the results of the tens of thousands of compounds screened for their ability to inhibit the growth of selected yeast strains altered in DNA damage repair or cell cycle control.

=head2 ATTRIBUTES of ScreeningResult

The following are all the attributes of the ScreeningResult object and their data types:

=over 4

=item aveinh

data type: C<float>

=item diffinh

data type: C<float>

=item id

data type: C<long>

=item inhibitionRate

data type: C<float>

=item stage

data type: C<string>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of ScreeningResult

The following are all the objects that are associated with the ScreeningResult:

=over 4

=item Collection of L</Agent>:

Many to one assoication, use C<getAgent> to get the associated Agent.

=item Collection of L</TreatmentSchedule>:

Many to one assoication, use C<getTreatmentSchedule> to get the associated TreatmentSchedule.


=back

=cut

# Below is module documentation for SegmentType

=pod

=head1 SegmentType

CaCORE::CaMOD::SegmentType - Perl extension for SegmentType.

=head2 ABSTRACT

The CaCORE::CaMOD::SegmentType is a Perl object representation of the
CaCORE SegmentType object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

specifies the type of library that the genomic segment was retrieved from such as BAC or YAC.

=head2 ATTRIBUTES of SegmentType

The following are all the attributes of the SegmentType object and their data types:

=over 4

=item id

data type: C<long>

=item name

data type: C<string>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of SegmentType

The following are all the objects that are associated with the SegmentType:

=over 4


=back

=cut

# Below is module documentation for SexDistribution

=pod

=head1 SexDistribution

CaCORE::CaMOD::SexDistribution - Perl extension for SexDistribution.

=head2 ABSTRACT

The CaCORE::CaMOD::SexDistribution is a Perl object representation of the
CaCORE SexDistribution object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

Object indicated if the phenotype was observed in both sexes or only in one.

=head2 ATTRIBUTES of SexDistribution

The following are all the attributes of the SexDistribution object and their data types:

=over 4

=item id

data type: C<long>

=item type

data type: C<string>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of SexDistribution

The following are all the objects that are associated with the SexDistribution:

=over 4


=back

=cut

# Below is module documentation for TargetedModification

=pod

=head1 TargetedModification

CaCORE::CaMOD::TargetedModification - Perl extension for TargetedModification.

=head2 ABSTRACT

The CaCORE::CaMOD::TargetedModification is a Perl object representation of the
CaCORE TargetedModification object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

Modification targeted to a specific gene or a specific part of the gene to either suppress the function of the gene or insert marker sequences like loxP sites.

=head2 ATTRIBUTES of TargetedModification

The following are all the attributes of the TargetedModification object and their data types:

=over 4

=item blastocystName

data type: C<string>

=item esCellLineName

data type: C<string>

=item id

data type: C<long>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of TargetedModification

The following are all the objects that are associated with the TargetedModification:

=over 4

=item Collection of L</EngineeredGene>:

Many to one assoication, use C<getEngineeredGene> to get the associated EngineeredGene.

=item Instance of L</ModificationType>:

One to many assoication, use C<getModificationTypeCollection> to get a collection of associated ModificationType.

=item Collection of L</YeastModel>:

Many to one assoication, use C<getYeastModel> to get the associated YeastModel.


=back

=cut

# Below is module documentation for Therapy

=pod

=head1 Therapy

CaCORE::CaMOD::Therapy - Perl extension for Therapy.

=head2 ABSTRACT

The CaCORE::CaMOD::Therapy is a Perl object representation of the
CaCORE Therapy object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

Pre-clinical trials experiment conducted on the animal model with the goal to reduce cancer burden.

=head2 ATTRIBUTES of Therapy

The following are all the attributes of the Therapy object and their data types:

=over 4

=item comments

data type: C<string>

=item experiment

data type: C<string>

=item id

data type: C<long>

=item results

data type: C<string>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of Therapy

The following are all the objects that are associated with the Therapy:

=over 4

=item Collection of L</Agent>:

Many to one assoication, use C<getAgent> to get the associated Agent.

=item Instance of L</Publication>:

One to many assoication, use C<getPublicationCollection> to get a collection of associated Publication.

=item Collection of L</TreatmentSchedule>:

Many to one assoication, use C<getTreatmentSchedule> to get the associated TreatmentSchedule.


=back

=cut

# Below is module documentation for Transgene

=pod

=head1 Transgene

CaCORE::CaMOD::Transgene - Perl extension for Transgene.

=head2 ABSTRACT

The CaCORE::CaMOD::Transgene is a Perl object representation of the
CaCORE Transgene object.

Transgene extends from domain object L<"EngineeredGene">.

=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

A transgene is an engineered gene consisting at least of a regulatory element and a coding sequence; regulatory element and coding sequence can come from different species.

=head2 ATTRIBUTES of Transgene

The following are all the attributes of the Transgene object and their data types:

=over 4

=item engineeredGeneId

data type: C<long>

=item locationOfIntegration

data type: C<string>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of Transgene

The following are all the objects that are associated with the Transgene:

=over 4

=item Collection of L</IntegrationType>:

Many to one assoication, use C<getIntegrationType> to get the associated IntegrationType.

=item Instance of L</RegulatoryElement>:

One to many assoication, use C<getRegulatoryElementCollection> to get a collection of associated RegulatoryElement.


=back

=cut

# Below is module documentation for TreatmentSchedule

=pod

=head1 TreatmentSchedule

CaCORE::CaMOD::TreatmentSchedule - Perl extension for TreatmentSchedule.

=head2 ABSTRACT

The CaCORE::CaMOD::TreatmentSchedule is a Perl object representation of the
CaCORE TreatmentSchedule object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

Treatment schedule for the pre-clinical trial / therapeutic experiment describing the dosages of the drug and the times of the treatment.

=head2 ATTRIBUTES of TreatmentSchedule

The following are all the attributes of the TreatmentSchedule object and their data types:

=over 4

=item dosage

data type: C<string>

=item id

data type: C<long>

=item regimen

data type: C<string>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of TreatmentSchedule

The following are all the objects that are associated with the TreatmentSchedule:

=over 4


=back

=cut

# Below is module documentation for TumorCode

=pod

=head1 TumorCode

CaCORE::CaMOD::TumorCode - Perl extension for TumorCode.

=head2 ABSTRACT

The CaCORE::CaMOD::TumorCode is a Perl object representation of the
CaCORE TumorCode object.


=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

A tumor code captures the tumor type and origin species used for a drug screen test.

=head2 ATTRIBUTES of TumorCode

The following are all the attributes of the TumorCode object and their data types:

=over 4

=item code

data type: C<string>

=item description

data type: C<string>

=item id

data type: C<long>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of TumorCode

The following are all the objects that are associated with the TumorCode:

=over 4


=back

=cut

# Below is module documentation for Xenograft

=pod

=head1 Xenograft

CaCORE::CaMOD::Xenograft - Perl extension for Xenograft.

=head2 ABSTRACT

The CaCORE::CaMOD::Xenograft is a Perl object representation of the
CaCORE Xenograft object.

Xenograft extends from domain object L<"AbstractCancerModel">.

=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

This object describes to xenografts (implanting tissue or cell lines from a different species) and allografts (implanting tissue or cell lines form the same species). The grafts are transplanted in immuno-compromised animals where they grow and, depending on the graft material, form tumors.

=head2 ATTRIBUTES of Xenograft

The following are all the attributes of the Xenograft object and their data types:

=over 4

=item administrativeSite

data type: C<string>

=item geneticManipulation

data type: C<string>

=item modificationDescription

data type: C<string>

=item name

data type: C<string>

=item parentalCellLineName

data type: C<string>

=item type

data type: C<string>


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of Xenograft

The following are all the objects that are associated with the Xenograft:

=over 4

=item Collection of L</HostTaxon>:

Many to one assoication, use C<getHostTaxon> to get the associated HostTaxon.

=item Instance of L</InvivoResult>:

One to many assoication, use C<getInvivoResultCollection> to get a collection of associated InvivoResult.

=item Collection of L</OriginTaxon>:

Many to one assoication, use C<getOriginTaxon> to get the associated OriginTaxon.

=item Collection of L</TumorCode>:

Many to one assoication, use C<getTumorCode> to get the associated TumorCode.


=back

=cut

# Below is module documentation for YeastModel

=pod

=head1 YeastModel

CaCORE::CaMOD::YeastModel - Perl extension for YeastModel.

=head2 ABSTRACT

The CaCORE::CaMOD::YeastModel is a Perl object representation of the
CaCORE YeastModel object.

YeastModel extends from domain object L<"AbstractCancerModel">.

=head2 SYNOPSIS

See L<CaCORE::ApplicationService>.

=head2 DESCRIPTION

A yeast model captures the yeast strains altered in the NCI Yeast Anticancer Drug Screen.

=head2 ATTRIBUTES of YeastModel

The following are all the attributes of the YeastModel object and their data types:

=over 4


=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 ASSOCIATIONS of YeastModel

The following are all the objects that are associated with the YeastModel:

=over 4

=item Instance of L</ScreeningResult>:

One to many assoication, use C<getScreeningResultCollection> to get a collection of associated ScreeningResult.

=item Instance of L</TargetedModification>:

One to many assoication, use C<getTargetedModificationCollection> to get a collection of associated TargetedModification.


=back

=cut


=pod

=head1 SUPPORT

Please do not contact author directly. Send email to ncicb@pop.nci.nih.gov to request
support or report a bug.

=head1 AUTHOR

Shan Jiang <jiangs@mail.nih.gov>

=head1 COPYRIGHT AND LICENSE

The CaCORE Software License, Version 1.0

  Copyright 2001-2005 SAIC. This software was developed in conjunction with the
  National Cancer Institute, and so to the extent government employees are co-authors,
  any rights in such works shall be subject to Title 17 of the United States Code,
  section 105. Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:

  1. Redistributions of source code must retain the above copyright notice, this list
     of conditions and the disclaimer of Article 5, below. Redistributions in binary 
     form must reproduce the above copyright notice, this list of conditions and the
     disclaimer of Article 5 in the documentation and/or other materials provided with
     the distribution.
   
  2. The end-user documentation included with the redistribution, if any, must include
     the following acknowledgment: "This product includes software developed by SAIC and
     the National Cancer Institute." If no such end-user documentation is to be included,
     this acknowledgment shall appear in the software itself, wherever such third-party
     acknowledgments normally appear.
   
  3. The names "The National Cancer Institute", "NCI" and "SAIC" must not be used to
     endorse or promote products derived from this software. This license does not
     authorize the licensee to use any trademarks owned by either NCI or SAIC.
   
  4. This license does not authorize or prohibit the incorporation of this software into
     any third party proprietary programs. Licensee is expressly made responsible for
     obtaining any permission required to incorporate this software into third party
     proprietary programs and for informing licensee's end-users of their obligation
     to secure any required permissions before incorporating this software into third
     party proprietary software programs.
   
  5. THIS SOFTWARE IS PROVIDED "AS IS," AND ANY EXPRESSED OR IMPLIED WARRANTIES, (INCLUDING,
     BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT AND
     FITNESS FOR A PARTICULAR PURPOSE) ARE DISCLAIMED. IN NO EVENT SHALL THE NATIONAL
     CANCER INSTITUTE, SAIC, OR THEIR AFFILIATES BE LIABLE FOR ANY DIRECT, INDIRECT,
     INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
     TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
     BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
     CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
     ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. 

=cut


