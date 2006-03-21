# ------------------------------------------------------------------------------------------
package CaCORE::CaBIO::Taxon;

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

# create an instance of the Taxon object
# returns: a Taxon object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Taxon\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Taxon intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:TaxonImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cabio.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# scientificName;
	if( defined( $self->getScientificName ) ) {
		$tmpstr = "<scientificName xsi:type=\"xsd:string\">" . $self->getScientificName . "</scientificName>";
	} else {
		$tmpstr = "<scientificName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# ethnicityStrain;
	if( defined( $self->getEthnicityStrain ) ) {
		$tmpstr = "<ethnicityStrain xsi:type=\"xsd:string\">" . $self->getEthnicityStrain . "</ethnicityStrain>";
	} else {
		$tmpstr = "<ethnicityStrain xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# abbreviation;
	if( defined( $self->getAbbreviation ) ) {
		$tmpstr = "<abbreviation xsi:type=\"xsd:string\">" . $self->getAbbreviation . "</abbreviation>";
	} else {
		$tmpstr = "<abbreviation xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# commonName;
	if( defined( $self->getCommonName ) ) {
		$tmpstr = "<commonName xsi:type=\"xsd:string\">" . $self->getCommonName . "</commonName>";
	} else {
		$tmpstr = "<commonName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of Taxon objects
# param: xml doc
# returns: list of Taxon objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @TaxonNodes = $root->getChildNodes;
	my $TaxonLength = $#TaxonNodes;
	#print "total bean count = $TaxonLength\n";
	
	# parse all Taxon nodes
	my @obj_list = ();
	foreach my $TaxonNode (@TaxonNodes) {
		#print "\tTaxon\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $scientificName;
		my $ethnicityStrain;
		my $abbreviation;
		my $commonName;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($TaxonNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "scientificName") {
				$scientificName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "ethnicityStrain") {
				$ethnicityStrain=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "abbreviation") {
				$abbreviation=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "commonName") {
				$commonName=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaBIO::Taxon;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setScientificName($scientificName);
		$newobj->setEthnicityStrain($ethnicityStrain);
		$newobj->setAbbreviation($abbreviation);
		$newobj->setCommonName($commonName);
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

sub getScientificName {
	my $self = shift;
	return $self->{scientificName};
}

sub setScientificName {
	my $self = shift;
	$self->{scientificName} = shift;
}

sub getEthnicityStrain {
	my $self = shift;
	return $self->{ethnicityStrain};
}

sub setEthnicityStrain {
	my $self = shift;
	$self->{ethnicityStrain} = shift;
}

sub getAbbreviation {
	my $self = shift;
	return $self->{abbreviation};
}

sub setAbbreviation {
	my $self = shift;
	$self->{abbreviation} = shift;
}

sub getCommonName {
	my $self = shift;
	return $self->{commonName};
}

sub setCommonName {
	my $self = shift;
	$self->{commonName} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getGeneCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Gene", $self);
	return @results;
}

sub getProteinCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Protein", $self);
	return @results;
}

sub getPathwayCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Pathway", $self);
	return @results;
}

sub getTissueCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Tissue", $self);
	return @results;
}

sub getChromosomeCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Chromosome", $self);
	return @results;
}

sub getCloneCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Clone", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaBIO::Agent;

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

# create an instance of the Agent object
# returns: a Agent object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Agent\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Agent intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:AgentImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cabio.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# isCMAPAgent;
	if( defined( $self->getIsCMAPAgent ) ) {
		$tmpstr = "<isCMAPAgent xsi:type=\"xsd:boolean\">" . $self->getIsCMAPAgent . "</isCMAPAgent>";
	} else {
		$tmpstr = "<isCMAPAgent xsi:type=\"xsd:boolean\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# comment;
	if( defined( $self->getComment ) ) {
		$tmpstr = "<comment xsi:type=\"xsd:string\">" . $self->getComment . "</comment>";
	} else {
		$tmpstr = "<comment xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# source;
	if( defined( $self->getSource ) ) {
		$tmpstr = "<source xsi:type=\"xsd:string\">" . $self->getSource . "</source>";
	} else {
		$tmpstr = "<source xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# NSCNumber;
	if( defined( $self->getNSCNumber ) ) {
		$tmpstr = "<NSCNumber xsi:type=\"xsd:long\">" . $self->getNSCNumber . "</NSCNumber>";
	} else {
		$tmpstr = "<NSCNumber xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# EVSId;
	if( defined( $self->getEVSId ) ) {
		$tmpstr = "<EVSId xsi:type=\"xsd:string\">" . $self->getEVSId . "</EVSId>";
	} else {
		$tmpstr = "<EVSId xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of Agent objects
# param: xml doc
# returns: list of Agent objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @AgentNodes = $root->getChildNodes;
	my $AgentLength = $#AgentNodes;
	#print "total bean count = $AgentLength\n";
	
	# parse all Agent nodes
	my @obj_list = ();
	foreach my $AgentNode (@AgentNodes) {
		#print "\tAgent\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $isCMAPAgent;
		my $comment;
		my $source;
		my $NSCNumber;
		my $name;
		my $EVSId;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($AgentNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "isCMAPAgent") {
				$isCMAPAgent=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "comment") {
				$comment=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "source") {
				$source=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "NSCNumber") {
				$NSCNumber=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "EVSId") {
				$EVSId=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaBIO::Agent;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setIsCMAPAgent($isCMAPAgent);
		$newobj->setComment($comment);
		$newobj->setSource($source);
		$newobj->setNSCNumber($NSCNumber);
		$newobj->setName($name);
		$newobj->setEVSId($EVSId);
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

sub getIsCMAPAgent {
	my $self = shift;
	return $self->{isCMAPAgent};
}

sub setIsCMAPAgent {
	my $self = shift;
	$self->{isCMAPAgent} = shift;
}

sub getComment {
	my $self = shift;
	return $self->{comment};
}

sub setComment {
	my $self = shift;
	$self->{comment} = shift;
}

sub getSource {
	my $self = shift;
	return $self->{source};
}

sub setSource {
	my $self = shift;
	$self->{source} = shift;
}

sub getNSCNumber {
	my $self = shift;
	return $self->{NSCNumber};
}

sub setNSCNumber {
	my $self = shift;
	$self->{NSCNumber} = shift;
}

sub getName {
	my $self = shift;
	return $self->{name};
}

sub setName {
	my $self = shift;
	$self->{name} = shift;
}

sub getEVSId {
	my $self = shift;
	return $self->{EVSId};
}

sub setEVSId {
	my $self = shift;
	$self->{EVSId} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getTargetCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Target", $self);
	return @results;
}

sub getClinicalTrialProtocolCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::ClinicalTrialProtocol", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaBIO::Chromosome;

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

# create an instance of the Chromosome object
# returns: a Chromosome object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Chromosome\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Chromosome intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:ChromosomeImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cabio.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# number;
	if( defined( $self->getNumber ) ) {
		$tmpstr = "<number xsi:type=\"xsd:string\">" . $self->getNumber . "</number>";
	} else {
		$tmpstr = "<number xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of Chromosome objects
# param: xml doc
# returns: list of Chromosome objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @ChromosomeNodes = $root->getChildNodes;
	my $ChromosomeLength = $#ChromosomeNodes;
	#print "total bean count = $ChromosomeLength\n";
	
	# parse all Chromosome nodes
	my @obj_list = ();
	foreach my $ChromosomeNode (@ChromosomeNodes) {
		#print "\tChromosome\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $number;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($ChromosomeNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "number") {
				$number=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaBIO::Chromosome;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setNumber($number);
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

sub getNumber {
	my $self = shift;
	return $self->{number};
}

sub setNumber {
	my $self = shift;
	$self->{number} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getTaxon {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Taxon", $self);
	return $results[0];
}

sub getGeneCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Gene", $self);
	return @results;
}

sub getLocationCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Location", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaBIO::Gene;

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

# create an instance of the Gene object
# returns: a Gene object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Gene\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Gene intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:GeneImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cabio.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# clusterId;
	if( defined( $self->getClusterId ) ) {
		$tmpstr = "<clusterId xsi:type=\"xsd:long\">" . $self->getClusterId . "</clusterId>";
	} else {
		$tmpstr = "<clusterId xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# symbol;
	if( defined( $self->getSymbol ) ) {
		$tmpstr = "<symbol xsi:type=\"xsd:string\">" . $self->getSymbol . "</symbol>";
	} else {
		$tmpstr = "<symbol xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# fullName;
	if( defined( $self->getFullName ) ) {
		$tmpstr = "<fullName xsi:type=\"xsd:string\">" . $self->getFullName . "</fullName>";
	} else {
		$tmpstr = "<fullName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of Gene objects
# param: xml doc
# returns: list of Gene objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @GeneNodes = $root->getChildNodes;
	my $GeneLength = $#GeneNodes;
	#print "total bean count = $GeneLength\n";
	
	# parse all Gene nodes
	my @obj_list = ();
	foreach my $GeneNode (@GeneNodes) {
		#print "\tGene\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $clusterId;
		my $symbol;
		my $fullName;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($GeneNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "clusterId") {
				$clusterId=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "symbol") {
				$symbol=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "fullName") {
				$fullName=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaBIO::Gene;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setClusterId($clusterId);
		$newobj->setSymbol($symbol);
		$newobj->setFullName($fullName);
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

sub getClusterId {
	my $self = shift;
	return $self->{clusterId};
}

sub setClusterId {
	my $self = shift;
	$self->{clusterId} = shift;
}

sub getSymbol {
	my $self = shift;
	return $self->{symbol};
}

sub setSymbol {
	my $self = shift;
	$self->{symbol} = shift;
}

sub getFullName {
	my $self = shift;
	return $self->{fullName};
}

sub setFullName {
	my $self = shift;
	$self->{fullName} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getGeneOntologyCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::GeneOntology", $self);
	return @results;
}

sub getGeneAliasCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::GeneAlias", $self);
	return @results;
}

sub getProteinCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Protein", $self);
	return @results;
}

sub getExpressionFeatureCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::ExpressionFeature", $self);
	return @results;
}

sub getPathwayCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Pathway", $self);
	return @results;
}

sub getOrganOntologyCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::OrganOntology", $self);
	return @results;
}

sub getTaxon {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Taxon", $self);
	return $results[0];
}

sub getLibraryCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Library", $self);
	return @results;
}

sub getGeneRelativeLocationCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::GeneRelativeLocation", $self);
	return @results;
}

sub getChromosome {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Chromosome", $self);
	return $results[0];
}

sub getDatabaseCrossReferenceCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::Common::DatabaseCrossReference", $self);
	return @results;
}

sub getGenericReporterCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::GenericReporter", $self);
	return @results;
}

sub getTargetCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Target", $self);
	return @results;
}

sub getHistopathologyCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Histopathology", $self);
	return @results;
}

sub getLocationCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Location", $self);
	return @results;
}

sub getNucleicAcidSequenceCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::NucleicAcidSequence", $self);
	return @results;
}

sub getHomologousAssociationCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::HomologousAssociation", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaBIO::Vocabulary;

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

# create an instance of the Vocabulary object
# returns: a Vocabulary object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Vocabulary\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Vocabulary intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:VocabularyImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cabio.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# generalTerm;
	if( defined( $self->getGeneralTerm ) ) {
		$tmpstr = "<generalTerm xsi:type=\"xsd:string\">" . $self->getGeneralTerm . "</generalTerm>";
	} else {
		$tmpstr = "<generalTerm xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# coreTerm;
	if( defined( $self->getCoreTerm ) ) {
		$tmpstr = "<coreTerm xsi:type=\"xsd:string\">" . $self->getCoreTerm . "</coreTerm>";
	} else {
		$tmpstr = "<coreTerm xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of Vocabulary objects
# param: xml doc
# returns: list of Vocabulary objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @VocabularyNodes = $root->getChildNodes;
	my $VocabularyLength = $#VocabularyNodes;
	#print "total bean count = $VocabularyLength\n";
	
	# parse all Vocabulary nodes
	my @obj_list = ();
	foreach my $VocabularyNode (@VocabularyNodes) {
		#print "\tVocabulary\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $generalTerm;
		my $coreTerm;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($VocabularyNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "generalTerm") {
				$generalTerm=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "coreTerm") {
				$coreTerm=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaBIO::Vocabulary;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setGeneralTerm($generalTerm);
		$newobj->setCoreTerm($coreTerm);
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

sub getGeneralTerm {
	my $self = shift;
	return $self->{generalTerm};
}

sub setGeneralTerm {
	my $self = shift;
	$self->{generalTerm} = shift;
}

sub getCoreTerm {
	my $self = shift;
	return $self->{coreTerm};
}

sub setCoreTerm {
	my $self = shift;
	$self->{coreTerm} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getAnomalyCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Anomaly", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaBIO::Protocol;

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

# create an instance of the Protocol object
# returns: a Protocol object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Protocol\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Protocol intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:ProtocolImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cabio.nci.nih.gov\">";
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

# parse a given xml, construct a list of Protocol objects
# param: xml doc
# returns: list of Protocol objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @ProtocolNodes = $root->getChildNodes;
	my $ProtocolLength = $#ProtocolNodes;
	#print "total bean count = $ProtocolLength\n";
	
	# parse all Protocol nodes
	my @obj_list = ();
	foreach my $ProtocolNode (@ProtocolNodes) {
		#print "\tProtocol\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $type;
		my $description;
		my $name;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($ProtocolNode->getChildNodes) {
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
			elsif ($childrenNode->getNodeName eq "description") {
				$description=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaBIO::Protocol;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setType($type);
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

sub getType {
	my $self = shift;
	return $self->{type};
}

sub setType {
	my $self = shift;
	$self->{type} = shift;
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

sub getLibraryCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Library", $self);
	return @results;
}

sub getTissueCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Tissue", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaBIO::Tissue;

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

# create an instance of the Tissue object
# returns: a Tissue object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Tissue\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Tissue intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:TissueImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cabio.nci.nih.gov\">";
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

	# cellType;
	if( defined( $self->getCellType ) ) {
		$tmpstr = "<cellType xsi:type=\"xsd:string\">" . $self->getCellType . "</cellType>";
	} else {
		$tmpstr = "<cellType xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# histology;
	if( defined( $self->getHistology ) ) {
		$tmpstr = "<histology xsi:type=\"xsd:string\">" . $self->getHistology . "</histology>";
	} else {
		$tmpstr = "<histology xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# sex;
	if( defined( $self->getSex ) ) {
		$tmpstr = "<sex xsi:type=\"xsd:string\">" . $self->getSex . "</sex>";
	} else {
		$tmpstr = "<sex xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# cellLine;
	if( defined( $self->getCellLine ) ) {
		$tmpstr = "<cellLine xsi:type=\"xsd:string\">" . $self->getCellLine . "</cellLine>";
	} else {
		$tmpstr = "<cellLine xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# supplier;
	if( defined( $self->getSupplier ) ) {
		$tmpstr = "<supplier xsi:type=\"xsd:string\">" . $self->getSupplier . "</supplier>";
	} else {
		$tmpstr = "<supplier xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# developmentalStage;
	if( defined( $self->getDevelopmentalStage ) ) {
		$tmpstr = "<developmentalStage xsi:type=\"xsd:string\">" . $self->getDevelopmentalStage . "</developmentalStage>";
	} else {
		$tmpstr = "<developmentalStage xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# description;
	if( defined( $self->getDescription ) ) {
		$tmpstr = "<description xsi:type=\"xsd:string\">" . $self->getDescription . "</description>";
	} else {
		$tmpstr = "<description xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# organ;
	if( defined( $self->getOrgan ) ) {
		$tmpstr = "<organ xsi:type=\"xsd:string\">" . $self->getOrgan . "</organ>";
	} else {
		$tmpstr = "<organ xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of Tissue objects
# param: xml doc
# returns: list of Tissue objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @TissueNodes = $root->getChildNodes;
	my $TissueLength = $#TissueNodes;
	#print "total bean count = $TissueLength\n";
	
	# parse all Tissue nodes
	my @obj_list = ();
	foreach my $TissueNode (@TissueNodes) {
		#print "\tTissue\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $type;
		my $cellType;
		my $histology;
		my $sex;
		my $cellLine;
		my $supplier;
		my $developmentalStage;
		my $description;
		my $organ;
		my $name;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($TissueNode->getChildNodes) {
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
			elsif ($childrenNode->getNodeName eq "cellType") {
				$cellType=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "histology") {
				$histology=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "sex") {
				$sex=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "cellLine") {
				$cellLine=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "supplier") {
				$supplier=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "developmentalStage") {
				$developmentalStage=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "description") {
				$description=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "organ") {
				$organ=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaBIO::Tissue;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setType($type);
		$newobj->setCellType($cellType);
		$newobj->setHistology($histology);
		$newobj->setSex($sex);
		$newobj->setCellLine($cellLine);
		$newobj->setSupplier($supplier);
		$newobj->setDevelopmentalStage($developmentalStage);
		$newobj->setDescription($description);
		$newobj->setOrgan($organ);
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

sub getType {
	my $self = shift;
	return $self->{type};
}

sub setType {
	my $self = shift;
	$self->{type} = shift;
}

sub getCellType {
	my $self = shift;
	return $self->{cellType};
}

sub setCellType {
	my $self = shift;
	$self->{cellType} = shift;
}

sub getHistology {
	my $self = shift;
	return $self->{histology};
}

sub setHistology {
	my $self = shift;
	$self->{histology} = shift;
}

sub getSex {
	my $self = shift;
	return $self->{sex};
}

sub setSex {
	my $self = shift;
	$self->{sex} = shift;
}

sub getCellLine {
	my $self = shift;
	return $self->{cellLine};
}

sub setCellLine {
	my $self = shift;
	$self->{cellLine} = shift;
}

sub getSupplier {
	my $self = shift;
	return $self->{supplier};
}

sub setSupplier {
	my $self = shift;
	$self->{supplier} = shift;
}

sub getDevelopmentalStage {
	my $self = shift;
	return $self->{developmentalStage};
}

sub setDevelopmentalStage {
	my $self = shift;
	$self->{developmentalStage} = shift;
}

sub getDescription {
	my $self = shift;
	return $self->{description};
}

sub setDescription {
	my $self = shift;
	$self->{description} = shift;
}

sub getOrgan {
	my $self = shift;
	return $self->{organ};
}

sub setOrgan {
	my $self = shift;
	$self->{organ} = shift;
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

sub getProtocol {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Protocol", $self);
	return $results[0];
}

sub getTaxon {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Taxon", $self);
	return $results[0];
}

sub getLibraryCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Library", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaBIO::SNP;

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

# create an instance of the SNP object
# returns: a SNP object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new SNP\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this SNP intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:SNPImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cabio.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# alleleA;
	if( defined( $self->getAlleleA ) ) {
		$tmpstr = "<alleleA xsi:type=\"xsd:string\">" . $self->getAlleleA . "</alleleA>";
	} else {
		$tmpstr = "<alleleA xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# validationStatus;
	if( defined( $self->getValidationStatus ) ) {
		$tmpstr = "<validationStatus xsi:type=\"xsd:string\">" . $self->getValidationStatus . "</validationStatus>";
	} else {
		$tmpstr = "<validationStatus xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# alleleB;
	if( defined( $self->getAlleleB ) ) {
		$tmpstr = "<alleleB xsi:type=\"xsd:string\">" . $self->getAlleleB . "</alleleB>";
	} else {
		$tmpstr = "<alleleB xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# DBSNPID;
	if( defined( $self->getDBSNPID ) ) {
		$tmpstr = "<DBSNPID xsi:type=\"xsd:string\">" . $self->getDBSNPID . "</DBSNPID>";
	} else {
		$tmpstr = "<DBSNPID xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of SNP objects
# param: xml doc
# returns: list of SNP objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @SNPNodes = $root->getChildNodes;
	my $SNPLength = $#SNPNodes;
	#print "total bean count = $SNPLength\n";
	
	# parse all SNP nodes
	my @obj_list = ();
	foreach my $SNPNode (@SNPNodes) {
		#print "\tSNP\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $alleleA;
		my $validationStatus;
		my $alleleB;
		my $DBSNPID;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($SNPNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "alleleA") {
				$alleleA=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "validationStatus") {
				$validationStatus=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "alleleB") {
				$alleleB=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "DBSNPID") {
				$DBSNPID=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaBIO::SNP;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setAlleleA($alleleA);
		$newobj->setValidationStatus($validationStatus);
		$newobj->setAlleleB($alleleB);
		$newobj->setDBSNPID($DBSNPID);
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

sub getAlleleA {
	my $self = shift;
	return $self->{alleleA};
}

sub setAlleleA {
	my $self = shift;
	$self->{alleleA} = shift;
}

sub getValidationStatus {
	my $self = shift;
	return $self->{validationStatus};
}

sub setValidationStatus {
	my $self = shift;
	$self->{validationStatus} = shift;
}

sub getAlleleB {
	my $self = shift;
	return $self->{alleleB};
}

sub setAlleleB {
	my $self = shift;
	$self->{alleleB} = shift;
}

sub getDBSNPID {
	my $self = shift;
	return $self->{DBSNPID};
}

sub setDBSNPID {
	my $self = shift;
	$self->{DBSNPID} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getDatabaseCrossReferenceCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::Common::DatabaseCrossReference", $self);
	return @results;
}

sub getPopulationFrequencyCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::PopulationFrequency", $self);
	return @results;
}

sub getLocationCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Location", $self);
	return @results;
}

sub getGeneRelativeLocationCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::GeneRelativeLocation", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaBIO::GeneAlias;

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

# create an instance of the GeneAlias object
# returns: a GeneAlias object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new GeneAlias\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this GeneAlias intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:GeneAliasImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cabio.nci.nih.gov\">";
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

# parse a given xml, construct a list of GeneAlias objects
# param: xml doc
# returns: list of GeneAlias objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @GeneAliasNodes = $root->getChildNodes;
	my $GeneAliasLength = $#GeneAliasNodes;
	#print "total bean count = $GeneAliasLength\n";
	
	# parse all GeneAlias nodes
	my @obj_list = ();
	foreach my $GeneAliasNode (@GeneAliasNodes) {
		#print "\tGeneAlias\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $name;
		my $type;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($GeneAliasNode->getChildNodes) {
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
		my $newobj = new CaCORE::CaBIO::GeneAlias;
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

sub getGeneCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Gene", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaBIO::Library;

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

# create an instance of the Library object
# returns: a Library object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Library\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Library intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:LibraryImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cabio.nci.nih.gov\">";
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

	# rsite1;
	if( defined( $self->getRsite1 ) ) {
		$tmpstr = "<rsite1 xsi:type=\"xsd:string\">" . $self->getRsite1 . "</rsite1>";
	} else {
		$tmpstr = "<rsite1 xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# creationDate;
	if( defined( $self->getCreationDate ) ) {
		$tmpstr = "<creationDate xsi:type=\"xsd:dateTime\">" . $self->getCreationDate . "</creationDate>";
	} else {
		$tmpstr = "<creationDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# labHost;
	if( defined( $self->getLabHost ) ) {
		$tmpstr = "<labHost xsi:type=\"xsd:string\">" . $self->getLabHost . "</labHost>";
	} else {
		$tmpstr = "<labHost xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# cloneVector;
	if( defined( $self->getCloneVector ) ) {
		$tmpstr = "<cloneVector xsi:type=\"xsd:string\">" . $self->getCloneVector . "</cloneVector>";
	} else {
		$tmpstr = "<cloneVector xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# clonesToDate;
	if( defined( $self->getClonesToDate ) ) {
		$tmpstr = "<clonesToDate xsi:type=\"xsd:long\">" . $self->getClonesToDate . "</clonesToDate>";
	} else {
		$tmpstr = "<clonesToDate xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# sequencesToDate;
	if( defined( $self->getSequencesToDate ) ) {
		$tmpstr = "<sequencesToDate xsi:type=\"xsd:long\">" . $self->getSequencesToDate . "</sequencesToDate>";
	} else {
		$tmpstr = "<sequencesToDate xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# keyword;
	if( defined( $self->getKeyword ) ) {
		$tmpstr = "<keyword xsi:type=\"xsd:string\">" . $self->getKeyword . "</keyword>";
	} else {
		$tmpstr = "<keyword xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# description;
	if( defined( $self->getDescription ) ) {
		$tmpstr = "<description xsi:type=\"xsd:string\">" . $self->getDescription . "</description>";
	} else {
		$tmpstr = "<description xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# cloneProducer;
	if( defined( $self->getCloneProducer ) ) {
		$tmpstr = "<cloneProducer xsi:type=\"xsd:string\">" . $self->getCloneProducer . "</cloneProducer>";
	} else {
		$tmpstr = "<cloneProducer xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# rsite2;
	if( defined( $self->getRsite2 ) ) {
		$tmpstr = "<rsite2 xsi:type=\"xsd:string\">" . $self->getRsite2 . "</rsite2>";
	} else {
		$tmpstr = "<rsite2 xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# cloneVectorType;
	if( defined( $self->getCloneVectorType ) ) {
		$tmpstr = "<cloneVectorType xsi:type=\"xsd:string\">" . $self->getCloneVectorType . "</cloneVectorType>";
	} else {
		$tmpstr = "<cloneVectorType xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# uniGeneId;
	if( defined( $self->getUniGeneId ) ) {
		$tmpstr = "<uniGeneId xsi:type=\"xsd:long\">" . $self->getUniGeneId . "</uniGeneId>";
	} else {
		$tmpstr = "<uniGeneId xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of Library objects
# param: xml doc
# returns: list of Library objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @LibraryNodes = $root->getChildNodes;
	my $LibraryLength = $#LibraryNodes;
	#print "total bean count = $LibraryLength\n";
	
	# parse all Library nodes
	my @obj_list = ();
	foreach my $LibraryNode (@LibraryNodes) {
		#print "\tLibrary\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $type;
		my $rsite1;
		my $creationDate;
		my $labHost;
		my $cloneVector;
		my $clonesToDate;
		my $sequencesToDate;
		my $keyword;
		my $description;
		my $cloneProducer;
		my $rsite2;
		my $cloneVectorType;
		my $uniGeneId;
		my $name;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($LibraryNode->getChildNodes) {
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
			elsif ($childrenNode->getNodeName eq "rsite1") {
				$rsite1=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "creationDate") {
				$creationDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "labHost") {
				$labHost=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "cloneVector") {
				$cloneVector=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "clonesToDate") {
				$clonesToDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "sequencesToDate") {
				$sequencesToDate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "keyword") {
				$keyword=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "description") {
				$description=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "cloneProducer") {
				$cloneProducer=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "rsite2") {
				$rsite2=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "cloneVectorType") {
				$cloneVectorType=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "uniGeneId") {
				$uniGeneId=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaBIO::Library;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setType($type);
		$newobj->setRsite1($rsite1);
		$newobj->setCreationDate($creationDate);
		$newobj->setLabHost($labHost);
		$newobj->setCloneVector($cloneVector);
		$newobj->setClonesToDate($clonesToDate);
		$newobj->setSequencesToDate($sequencesToDate);
		$newobj->setKeyword($keyword);
		$newobj->setDescription($description);
		$newobj->setCloneProducer($cloneProducer);
		$newobj->setRsite2($rsite2);
		$newobj->setCloneVectorType($cloneVectorType);
		$newobj->setUniGeneId($uniGeneId);
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

sub getType {
	my $self = shift;
	return $self->{type};
}

sub setType {
	my $self = shift;
	$self->{type} = shift;
}

sub getRsite1 {
	my $self = shift;
	return $self->{rsite1};
}

sub setRsite1 {
	my $self = shift;
	$self->{rsite1} = shift;
}

sub getCreationDate {
	my $self = shift;
	return $self->{creationDate};
}

sub setCreationDate {
	my $self = shift;
	$self->{creationDate} = shift;
}

sub getLabHost {
	my $self = shift;
	return $self->{labHost};
}

sub setLabHost {
	my $self = shift;
	$self->{labHost} = shift;
}

sub getCloneVector {
	my $self = shift;
	return $self->{cloneVector};
}

sub setCloneVector {
	my $self = shift;
	$self->{cloneVector} = shift;
}

sub getClonesToDate {
	my $self = shift;
	return $self->{clonesToDate};
}

sub setClonesToDate {
	my $self = shift;
	$self->{clonesToDate} = shift;
}

sub getSequencesToDate {
	my $self = shift;
	return $self->{sequencesToDate};
}

sub setSequencesToDate {
	my $self = shift;
	$self->{sequencesToDate} = shift;
}

sub getKeyword {
	my $self = shift;
	return $self->{keyword};
}

sub setKeyword {
	my $self = shift;
	$self->{keyword} = shift;
}

sub getDescription {
	my $self = shift;
	return $self->{description};
}

sub setDescription {
	my $self = shift;
	$self->{description} = shift;
}

sub getCloneProducer {
	my $self = shift;
	return $self->{cloneProducer};
}

sub setCloneProducer {
	my $self = shift;
	$self->{cloneProducer} = shift;
}

sub getRsite2 {
	my $self = shift;
	return $self->{rsite2};
}

sub setRsite2 {
	my $self = shift;
	$self->{rsite2} = shift;
}

sub getCloneVectorType {
	my $self = shift;
	return $self->{cloneVectorType};
}

sub setCloneVectorType {
	my $self = shift;
	$self->{cloneVectorType} = shift;
}

sub getUniGeneId {
	my $self = shift;
	return $self->{uniGeneId};
}

sub setUniGeneId {
	my $self = shift;
	$self->{uniGeneId} = shift;
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

sub getProtocol {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Protocol", $self);
	return $results[0];
}

sub getGeneCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Gene", $self);
	return @results;
}

sub getCloneCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Clone", $self);
	return @results;
}

sub getTissue {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Tissue", $self);
	return $results[0];
}

sub getHistopathologyCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Histopathology", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaBIO::Clone;

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

# create an instance of the Clone object
# returns: a Clone object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Clone\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Clone intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:CloneImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cabio.nci.nih.gov\">";
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

	# insertSize;
	if( defined( $self->getInsertSize ) ) {
		$tmpstr = "<insertSize xsi:type=\"xsd:long\">" . $self->getInsertSize . "</insertSize>";
	} else {
		$tmpstr = "<insertSize xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of Clone objects
# param: xml doc
# returns: list of Clone objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @CloneNodes = $root->getChildNodes;
	my $CloneLength = $#CloneNodes;
	#print "total bean count = $CloneLength\n";
	
	# parse all Clone nodes
	my @obj_list = ();
	foreach my $CloneNode (@CloneNodes) {
		#print "\tClone\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $type;
		my $insertSize;
		my $name;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($CloneNode->getChildNodes) {
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
			elsif ($childrenNode->getNodeName eq "insertSize") {
				$insertSize=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaBIO::Clone;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setType($type);
		$newobj->setInsertSize($insertSize);
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

sub getType {
	my $self = shift;
	return $self->{type};
}

sub setType {
	my $self = shift;
	$self->{type} = shift;
}

sub getInsertSize {
	my $self = shift;
	return $self->{insertSize};
}

sub setInsertSize {
	my $self = shift;
	$self->{insertSize} = shift;
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

sub getTaxonCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Taxon", $self);
	return @results;
}

sub getCloneRelativeLocationCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::CloneRelativeLocation", $self);
	return @results;
}

sub getLibrary {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Library", $self);
	return $results[0];
}

sub getNucleicAcidSequenceCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::NucleicAcidSequence", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaBIO::Target;

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

# create an instance of the Target object
# returns: a Target object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Target\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Target intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:TargetImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cabio.nci.nih.gov\">";
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

# parse a given xml, construct a list of Target objects
# param: xml doc
# returns: list of Target objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @TargetNodes = $root->getChildNodes;
	my $TargetLength = $#TargetNodes;
	#print "total bean count = $TargetLength\n";
	
	# parse all Target nodes
	my @obj_list = ();
	foreach my $TargetNode (@TargetNodes) {
		#print "\tTarget\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $type;
		my $name;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($TargetNode->getChildNodes) {
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
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaBIO::Target;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setType($type);
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

sub getType {
	my $self = shift;
	return $self->{type};
}

sub setType {
	my $self = shift;
	$self->{type} = shift;
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

sub getAgentCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Agent", $self);
	return @results;
}

sub getAnomalyCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Anomaly", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaBIO::Location;

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

# create an instance of the Location object
# returns: a Location object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Location\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Location intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:LocationImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cabio.nci.nih.gov\">";
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

# parse a given xml, construct a list of Location objects
# param: xml doc
# returns: list of Location objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @LocationNodes = $root->getChildNodes;
	my $LocationLength = $#LocationNodes;
	#print "total bean count = $LocationLength\n";
	
	# parse all Location nodes
	my @obj_list = ();
	foreach my $LocationNode (@LocationNodes) {
		#print "\tLocation\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($LocationNode->getChildNodes) {
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
		my $newobj = new CaCORE::CaBIO::Location;
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

sub getSNP {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::SNP", $self);
	return $results[0];
}

sub getGene {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Gene", $self);
	return $results[0];
}

sub getNucleicAcidSequence {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::NucleicAcidSequence", $self);
	return $results[0];
}

sub getChromosome {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Chromosome", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaBIO::CloneRelativeLocation;

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

# create an instance of the CloneRelativeLocation object
# returns: a CloneRelativeLocation object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new CloneRelativeLocation\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this CloneRelativeLocation intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:CloneRelativeLocationImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cabio.nci.nih.gov\">";
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

# parse a given xml, construct a list of CloneRelativeLocation objects
# param: xml doc
# returns: list of CloneRelativeLocation objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @CloneRelativeLocationNodes = $root->getChildNodes;
	my $CloneRelativeLocationLength = $#CloneRelativeLocationNodes;
	#print "total bean count = $CloneRelativeLocationLength\n";
	
	# parse all CloneRelativeLocation nodes
	my @obj_list = ();
	foreach my $CloneRelativeLocationNode (@CloneRelativeLocationNodes) {
		#print "\tCloneRelativeLocation\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $type;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($CloneRelativeLocationNode->getChildNodes) {
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
		my $newobj = new CaCORE::CaBIO::CloneRelativeLocation;
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

sub getClone {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Clone", $self);
	return $results[0];
}

sub getNucleicAcidSequence {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::NucleicAcidSequence", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaBIO::NucleicAcidSequence;

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

# create an instance of the NucleicAcidSequence object
# returns: a NucleicAcidSequence object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new NucleicAcidSequence\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this NucleicAcidSequence intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:NucleicAcidSequenceImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cabio.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# value;
	if( defined( $self->getValue ) ) {
		$tmpstr = "<value xsi:type=\"xsd:string\">" . $self->getValue . "</value>";
	} else {
		$tmpstr = "<value xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# type;
	if( defined( $self->getType ) ) {
		$tmpstr = "<type xsi:type=\"xsd:string\">" . $self->getType . "</type>";
	} else {
		$tmpstr = "<type xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# length;
	if( defined( $self->getLength ) ) {
		$tmpstr = "<length xsi:type=\"xsd:long\">" . $self->getLength . "</length>";
	} else {
		$tmpstr = "<length xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# accessionNumber;
	if( defined( $self->getAccessionNumber ) ) {
		$tmpstr = "<accessionNumber xsi:type=\"xsd:string\">" . $self->getAccessionNumber . "</accessionNumber>";
	} else {
		$tmpstr = "<accessionNumber xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# accessionNumberVersion;
	if( defined( $self->getAccessionNumberVersion ) ) {
		$tmpstr = "<accessionNumberVersion xsi:type=\"xsd:string\">" . $self->getAccessionNumberVersion . "</accessionNumberVersion>";
	} else {
		$tmpstr = "<accessionNumberVersion xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of NucleicAcidSequence objects
# param: xml doc
# returns: list of NucleicAcidSequence objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @NucleicAcidSequenceNodes = $root->getChildNodes;
	my $NucleicAcidSequenceLength = $#NucleicAcidSequenceNodes;
	#print "total bean count = $NucleicAcidSequenceLength\n";
	
	# parse all NucleicAcidSequence nodes
	my @obj_list = ();
	foreach my $NucleicAcidSequenceNode (@NucleicAcidSequenceNodes) {
		#print "\tNucleicAcidSequence\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $value;
		my $type;
		my $length;
		my $accessionNumber;
		my $accessionNumberVersion;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($NucleicAcidSequenceNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "value") {
				$value=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "type") {
				$type=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "length") {
				$length=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "accessionNumber") {
				$accessionNumber=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "accessionNumberVersion") {
				$accessionNumberVersion=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaBIO::NucleicAcidSequence;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setValue($value);
		$newobj->setType($type);
		$newobj->setLength($length);
		$newobj->setAccessionNumber($accessionNumber);
		$newobj->setAccessionNumberVersion($accessionNumberVersion);
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

sub getValue {
	my $self = shift;
	return $self->{value};
}

sub setValue {
	my $self = shift;
	$self->{value} = shift;
}

sub getType {
	my $self = shift;
	return $self->{type};
}

sub setType {
	my $self = shift;
	$self->{type} = shift;
}

sub getLength {
	my $self = shift;
	return $self->{length};
}

sub setLength {
	my $self = shift;
	$self->{length} = shift;
}

sub getAccessionNumber {
	my $self = shift;
	return $self->{accessionNumber};
}

sub setAccessionNumber {
	my $self = shift;
	$self->{accessionNumber} = shift;
}

sub getAccessionNumberVersion {
	my $self = shift;
	return $self->{accessionNumberVersion};
}

sub setAccessionNumberVersion {
	my $self = shift;
	$self->{accessionNumberVersion} = shift;
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

sub getLocation {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Location", $self);
	return $results[0];
}

sub getCloneRelativeLocation {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::CloneRelativeLocation", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaBIO::DiseaseOntology;

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

# create an instance of the DiseaseOntology object
# returns: a DiseaseOntology object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new DiseaseOntology\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this DiseaseOntology intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:DiseaseOntologyImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cabio.nci.nih.gov\">";
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

# parse a given xml, construct a list of DiseaseOntology objects
# param: xml doc
# returns: list of DiseaseOntology objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @DiseaseOntologyNodes = $root->getChildNodes;
	my $DiseaseOntologyLength = $#DiseaseOntologyNodes;
	#print "total bean count = $DiseaseOntologyLength\n";
	
	# parse all DiseaseOntology nodes
	my @obj_list = ();
	foreach my $DiseaseOntologyNode (@DiseaseOntologyNodes) {
		#print "\tDiseaseOntology\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $name;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($DiseaseOntologyNode->getChildNodes) {
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
		my $newobj = new CaCORE::CaBIO::DiseaseOntology;
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

sub getParentDiseaseOntologyRelationshipCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::ParentDiseaseOntologyRelationship", $self);
	return @results;
}

sub getChildDiseaseOntologyRelationshipCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::ChildDiseaseOntologyRelationship", $self);
	return @results;
}

sub getHistopathologyCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Histopathology", $self);
	return @results;
}

sub getClinicalTrialProtocolCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::ClinicalTrialProtocol", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaBIO::ClinicalTrialProtocol;

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

# create an instance of the ClinicalTrialProtocol object
# returns: a ClinicalTrialProtocol object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new ClinicalTrialProtocol\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this ClinicalTrialProtocol intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:ClinicalTrialProtocolImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cabio.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# currentStatus;
	if( defined( $self->getCurrentStatus ) ) {
		$tmpstr = "<currentStatus xsi:type=\"xsd:string\">" . $self->getCurrentStatus . "</currentStatus>";
	} else {
		$tmpstr = "<currentStatus xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# participationType;
	if( defined( $self->getParticipationType ) ) {
		$tmpstr = "<participationType xsi:type=\"xsd:string\">" . $self->getParticipationType . "</participationType>";
	} else {
		$tmpstr = "<participationType xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# treatmentFlag;
	if( defined( $self->getTreatmentFlag ) ) {
		$tmpstr = "<treatmentFlag xsi:type=\"xsd:string\">" . $self->getTreatmentFlag . "</treatmentFlag>";
	} else {
		$tmpstr = "<treatmentFlag xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# leadOrganizationId;
	if( defined( $self->getLeadOrganizationId ) ) {
		$tmpstr = "<leadOrganizationId xsi:type=\"xsd:string\">" . $self->getLeadOrganizationId . "</leadOrganizationId>";
	} else {
		$tmpstr = "<leadOrganizationId xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# NIHAdminCode;
	if( defined( $self->getNIHAdminCode ) ) {
		$tmpstr = "<NIHAdminCode xsi:type=\"xsd:string\">" . $self->getNIHAdminCode . "</NIHAdminCode>";
	} else {
		$tmpstr = "<NIHAdminCode xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# title;
	if( defined( $self->getTitle ) ) {
		$tmpstr = "<title xsi:type=\"xsd:string\">" . $self->getTitle . "</title>";
	} else {
		$tmpstr = "<title xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# PDQIdentifier;
	if( defined( $self->getPDQIdentifier ) ) {
		$tmpstr = "<PDQIdentifier xsi:type=\"xsd:string\">" . $self->getPDQIdentifier . "</PDQIdentifier>";
	} else {
		$tmpstr = "<PDQIdentifier xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# documentNumber;
	if( defined( $self->getDocumentNumber ) ) {
		$tmpstr = "<documentNumber xsi:type=\"xsd:string\">" . $self->getDocumentNumber . "</documentNumber>";
	} else {
		$tmpstr = "<documentNumber xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

	# PIName;
	if( defined( $self->getPIName ) ) {
		$tmpstr = "<PIName xsi:type=\"xsd:string\">" . $self->getPIName . "</PIName>";
	} else {
		$tmpstr = "<PIName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# currentStatusDate;
	if( defined( $self->getCurrentStatusDate ) ) {
		$tmpstr = "<currentStatusDate xsi:type=\"xsd:dateTime\">" . $self->getCurrentStatusDate . "</currentStatusDate>";
	} else {
		$tmpstr = "<currentStatusDate xsi:type=\"xsd:dateTime\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of ClinicalTrialProtocol objects
# param: xml doc
# returns: list of ClinicalTrialProtocol objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @ClinicalTrialProtocolNodes = $root->getChildNodes;
	my $ClinicalTrialProtocolLength = $#ClinicalTrialProtocolNodes;
	#print "total bean count = $ClinicalTrialProtocolLength\n";
	
	# parse all ClinicalTrialProtocol nodes
	my @obj_list = ();
	foreach my $ClinicalTrialProtocolNode (@ClinicalTrialProtocolNodes) {
		#print "\tClinicalTrialProtocol\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $currentStatus;
		my $participationType;
		my $treatmentFlag;
		my $leadOrganizationId;
		my $NIHAdminCode;
		my $title;
		my $PDQIdentifier;
		my $documentNumber;
		my $leadOrganizationName;
		my $phase;
		my $PIName;
		my $currentStatusDate;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($ClinicalTrialProtocolNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "currentStatus") {
				$currentStatus=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "participationType") {
				$participationType=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "treatmentFlag") {
				$treatmentFlag=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "leadOrganizationId") {
				$leadOrganizationId=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "NIHAdminCode") {
				$NIHAdminCode=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "title") {
				$title=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "PDQIdentifier") {
				$PDQIdentifier=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "documentNumber") {
				$documentNumber=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "leadOrganizationName") {
				$leadOrganizationName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "phase") {
				$phase=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "PIName") {
				$PIName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "currentStatusDate") {
				$currentStatusDate=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaBIO::ClinicalTrialProtocol;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setCurrentStatus($currentStatus);
		$newobj->setParticipationType($participationType);
		$newobj->setTreatmentFlag($treatmentFlag);
		$newobj->setLeadOrganizationId($leadOrganizationId);
		$newobj->setNIHAdminCode($NIHAdminCode);
		$newobj->setTitle($title);
		$newobj->setPDQIdentifier($PDQIdentifier);
		$newobj->setDocumentNumber($documentNumber);
		$newobj->setLeadOrganizationName($leadOrganizationName);
		$newobj->setPhase($phase);
		$newobj->setPIName($PIName);
		$newobj->setCurrentStatusDate($currentStatusDate);
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

sub getCurrentStatus {
	my $self = shift;
	return $self->{currentStatus};
}

sub setCurrentStatus {
	my $self = shift;
	$self->{currentStatus} = shift;
}

sub getParticipationType {
	my $self = shift;
	return $self->{participationType};
}

sub setParticipationType {
	my $self = shift;
	$self->{participationType} = shift;
}

sub getTreatmentFlag {
	my $self = shift;
	return $self->{treatmentFlag};
}

sub setTreatmentFlag {
	my $self = shift;
	$self->{treatmentFlag} = shift;
}

sub getLeadOrganizationId {
	my $self = shift;
	return $self->{leadOrganizationId};
}

sub setLeadOrganizationId {
	my $self = shift;
	$self->{leadOrganizationId} = shift;
}

sub getNIHAdminCode {
	my $self = shift;
	return $self->{NIHAdminCode};
}

sub setNIHAdminCode {
	my $self = shift;
	$self->{NIHAdminCode} = shift;
}

sub getTitle {
	my $self = shift;
	return $self->{title};
}

sub setTitle {
	my $self = shift;
	$self->{title} = shift;
}

sub getPDQIdentifier {
	my $self = shift;
	return $self->{PDQIdentifier};
}

sub setPDQIdentifier {
	my $self = shift;
	$self->{PDQIdentifier} = shift;
}

sub getDocumentNumber {
	my $self = shift;
	return $self->{documentNumber};
}

sub setDocumentNumber {
	my $self = shift;
	$self->{documentNumber} = shift;
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

sub getPIName {
	my $self = shift;
	return $self->{PIName};
}

sub setPIName {
	my $self = shift;
	$self->{PIName} = shift;
}

sub getCurrentStatusDate {
	my $self = shift;
	return $self->{currentStatusDate};
}

sub setCurrentStatusDate {
	my $self = shift;
	$self->{currentStatusDate} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getAgentCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Agent", $self);
	return @results;
}

sub getProtocolAssociationCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::ProtocolAssociation", $self);
	return @results;
}

sub getDiseaseOntologyCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::DiseaseOntology", $self);
	return @results;
}

sub getHistopathologyCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Histopathology", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaBIO::ProtocolAssociation;

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

# create an instance of the ProtocolAssociation object
# returns: a ProtocolAssociation object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new ProtocolAssociation\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this ProtocolAssociation intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:ProtocolAssociationImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cabio.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# diseaseSubCategory;
	if( defined( $self->getDiseaseSubCategory ) ) {
		$tmpstr = "<diseaseSubCategory xsi:type=\"xsd:string\">" . $self->getDiseaseSubCategory . "</diseaseSubCategory>";
	} else {
		$tmpstr = "<diseaseSubCategory xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# CTEPNAME;
	if( defined( $self->getCTEPNAME ) ) {
		$tmpstr = "<CTEPNAME xsi:type=\"xsd:string\">" . $self->getCTEPNAME . "</CTEPNAME>";
	} else {
		$tmpstr = "<CTEPNAME xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# IMTCODE;
	if( defined( $self->getIMTCODE ) ) {
		$tmpstr = "<IMTCODE xsi:type=\"xsd:long\">" . $self->getIMTCODE . "</IMTCODE>";
	} else {
		$tmpstr = "<IMTCODE xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# diseaseCategory;
	if( defined( $self->getDiseaseCategory ) ) {
		$tmpstr = "<diseaseCategory xsi:type=\"xsd:string\">" . $self->getDiseaseCategory . "</diseaseCategory>";
	} else {
		$tmpstr = "<diseaseCategory xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of ProtocolAssociation objects
# param: xml doc
# returns: list of ProtocolAssociation objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @ProtocolAssociationNodes = $root->getChildNodes;
	my $ProtocolAssociationLength = $#ProtocolAssociationNodes;
	#print "total bean count = $ProtocolAssociationLength\n";
	
	# parse all ProtocolAssociation nodes
	my @obj_list = ();
	foreach my $ProtocolAssociationNode (@ProtocolAssociationNodes) {
		#print "\tProtocolAssociation\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $diseaseSubCategory;
		my $CTEPNAME;
		my $IMTCODE;
		my $diseaseCategory;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($ProtocolAssociationNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "diseaseSubCategory") {
				$diseaseSubCategory=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "CTEPNAME") {
				$CTEPNAME=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "IMTCODE") {
				$IMTCODE=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "diseaseCategory") {
				$diseaseCategory=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaBIO::ProtocolAssociation;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setDiseaseSubCategory($diseaseSubCategory);
		$newobj->setCTEPNAME($CTEPNAME);
		$newobj->setIMTCODE($IMTCODE);
		$newobj->setDiseaseCategory($diseaseCategory);
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

sub getDiseaseSubCategory {
	my $self = shift;
	return $self->{diseaseSubCategory};
}

sub setDiseaseSubCategory {
	my $self = shift;
	$self->{diseaseSubCategory} = shift;
}

sub getCTEPNAME {
	my $self = shift;
	return $self->{CTEPNAME};
}

sub setCTEPNAME {
	my $self = shift;
	$self->{CTEPNAME} = shift;
}

sub getIMTCODE {
	my $self = shift;
	return $self->{IMTCODE};
}

sub setIMTCODE {
	my $self = shift;
	$self->{IMTCODE} = shift;
}

sub getDiseaseCategory {
	my $self = shift;
	return $self->{diseaseCategory};
}

sub setDiseaseCategory {
	my $self = shift;
	$self->{diseaseCategory} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getDiseaseOntology {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::DiseaseOntology", $self);
	return $results[0];
}

sub getClinicalTrialProtocol {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::ClinicalTrialProtocol", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaBIO::Pathway;

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

# create an instance of the Pathway object
# returns: a Pathway object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Pathway\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Pathway intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:PathwayImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cabio.nci.nih.gov\">";
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

	# diagram;
	if( defined( $self->getDiagram ) ) {
		$tmpstr = "<diagram xsi:type=\"xsd:string\">" . $self->getDiagram . "</diagram>";
	} else {
		$tmpstr = "<diagram xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# displayValue;
	if( defined( $self->getDisplayValue ) ) {
		$tmpstr = "<displayValue xsi:type=\"xsd:string\">" . $self->getDisplayValue . "</displayValue>";
	} else {
		$tmpstr = "<displayValue xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of Pathway objects
# param: xml doc
# returns: list of Pathway objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @PathwayNodes = $root->getChildNodes;
	my $PathwayLength = $#PathwayNodes;
	#print "total bean count = $PathwayLength\n";
	
	# parse all Pathway nodes
	my @obj_list = ();
	foreach my $PathwayNode (@PathwayNodes) {
		#print "\tPathway\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $description;
		my $diagram;
		my $name;
		my $displayValue;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($PathwayNode->getChildNodes) {
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
			elsif ($childrenNode->getNodeName eq "diagram") {
				$diagram=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "displayValue") {
				$displayValue=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaBIO::Pathway;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setDescription($description);
		$newobj->setDiagram($diagram);
		$newobj->setName($name);
		$newobj->setDisplayValue($displayValue);
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

sub getDiagram {
	my $self = shift;
	return $self->{diagram};
}

sub setDiagram {
	my $self = shift;
	$self->{diagram} = shift;
}

sub getName {
	my $self = shift;
	return $self->{name};
}

sub setName {
	my $self = shift;
	$self->{name} = shift;
}

sub getDisplayValue {
	my $self = shift;
	return $self->{displayValue};
}

sub setDisplayValue {
	my $self = shift;
	$self->{displayValue} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getGeneCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Gene", $self);
	return @results;
}

sub getHistopathologyCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Histopathology", $self);
	return @results;
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
package CaCORE::CaBIO::OrganOntology;

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

# create an instance of the OrganOntology object
# returns: a OrganOntology object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new OrganOntology\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this OrganOntology intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:OrganOntologyImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cabio.nci.nih.gov\">";
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

# parse a given xml, construct a list of OrganOntology objects
# param: xml doc
# returns: list of OrganOntology objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @OrganOntologyNodes = $root->getChildNodes;
	my $OrganOntologyLength = $#OrganOntologyNodes;
	#print "total bean count = $OrganOntologyLength\n";
	
	# parse all OrganOntology nodes
	my @obj_list = ();
	foreach my $OrganOntologyNode (@OrganOntologyNodes) {
		#print "\tOrganOntology\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $name;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($OrganOntologyNode->getChildNodes) {
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
		my $newobj = new CaCORE::CaBIO::OrganOntology;
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

sub getParentOrganOntologyRelationshipCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::ParentOrganOntologyRelationship", $self);
	return @results;
}

sub getGeneCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Gene", $self);
	return @results;
}

sub getExpressionFeatureCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaMOD::ExpressionFeature", $self);
	return @results;
}

sub getHistopathologyCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Histopathology", $self);
	return @results;
}

sub getChildOrganOntologyRelationshipCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::ChildOrganOntologyRelationship", $self);
	return @results;
}

sub getAnomalyCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Anomaly", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaBIO::OrganOntologyRelationship;

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

# create an instance of the OrganOntologyRelationship object
# returns: a OrganOntologyRelationship object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new OrganOntologyRelationship\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this OrganOntologyRelationship intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:OrganOntologyRelationshipImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cabio.nci.nih.gov\">";
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

# parse a given xml, construct a list of OrganOntologyRelationship objects
# param: xml doc
# returns: list of OrganOntologyRelationship objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @OrganOntologyRelationshipNodes = $root->getChildNodes;
	my $OrganOntologyRelationshipLength = $#OrganOntologyRelationshipNodes;
	#print "total bean count = $OrganOntologyRelationshipLength\n";
	
	# parse all OrganOntologyRelationship nodes
	my @obj_list = ();
	foreach my $OrganOntologyRelationshipNode (@OrganOntologyRelationshipNodes) {
		#print "\tOrganOntologyRelationship\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $type;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($OrganOntologyRelationshipNode->getChildNodes) {
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
		my $newobj = new CaCORE::CaBIO::OrganOntologyRelationship;
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

sub getChildOrganOntology {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::ChildOrganOntology", $self);
	return $results[0];
}

sub getParentOrganOntology {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::ParentOrganOntology", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaBIO::Histopathology;

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

# create an instance of the Histopathology object
# returns: a Histopathology object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Histopathology\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Histopathology intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:HistopathologyImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cabio.nci.nih.gov\">";
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

	# relationalOperation;
	if( defined( $self->getRelationalOperation ) ) {
		$tmpstr = "<relationalOperation xsi:type=\"xsd:string\">" . $self->getRelationalOperation . "</relationalOperation>";
	} else {
		$tmpstr = "<relationalOperation xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# tumorIncidenceRate;
	if( defined( $self->getTumorIncidenceRate ) ) {
		$tmpstr = "<tumorIncidenceRate xsi:type=\"xsd:float\">" . $self->getTumorIncidenceRate . "</tumorIncidenceRate>";
	} else {
		$tmpstr = "<tumorIncidenceRate xsi:type=\"xsd:float\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# ageOfOnset;
	if( defined( $self->getAgeOfOnset ) ) {
		$tmpstr = "<ageOfOnset xsi:type=\"xsd:string\">" . $self->getAgeOfOnset . "</ageOfOnset>";
	} else {
		$tmpstr = "<ageOfOnset xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# microscopicDescription;
	if( defined( $self->getMicroscopicDescription ) ) {
		$tmpstr = "<microscopicDescription xsi:type=\"xsd:string\">" . $self->getMicroscopicDescription . "</microscopicDescription>";
	} else {
		$tmpstr = "<microscopicDescription xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# grossDescription;
	if( defined( $self->getGrossDescription ) ) {
		$tmpstr = "<grossDescription xsi:type=\"xsd:string\">" . $self->getGrossDescription . "</grossDescription>";
	} else {
		$tmpstr = "<grossDescription xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# survivalInfo;
	if( defined( $self->getSurvivalInfo ) ) {
		$tmpstr = "<survivalInfo xsi:type=\"xsd:string\">" . $self->getSurvivalInfo . "</survivalInfo>";
	} else {
		$tmpstr = "<survivalInfo xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of Histopathology objects
# param: xml doc
# returns: list of Histopathology objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @HistopathologyNodes = $root->getChildNodes;
	my $HistopathologyLength = $#HistopathologyNodes;
	#print "total bean count = $HistopathologyLength\n";
	
	# parse all Histopathology nodes
	my @obj_list = ();
	foreach my $HistopathologyNode (@HistopathologyNodes) {
		#print "\tHistopathology\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $comments;
		my $relationalOperation;
		my $tumorIncidenceRate;
		my $ageOfOnset;
		my $microscopicDescription;
		my $grossDescription;
		my $survivalInfo;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($HistopathologyNode->getChildNodes) {
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
			elsif ($childrenNode->getNodeName eq "relationalOperation") {
				$relationalOperation=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "tumorIncidenceRate") {
				$tumorIncidenceRate=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "ageOfOnset") {
				$ageOfOnset=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "microscopicDescription") {
				$microscopicDescription=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "grossDescription") {
				$grossDescription=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "survivalInfo") {
				$survivalInfo=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaBIO::Histopathology;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setComments($comments);
		$newobj->setRelationalOperation($relationalOperation);
		$newobj->setTumorIncidenceRate($tumorIncidenceRate);
		$newobj->setAgeOfOnset($ageOfOnset);
		$newobj->setMicroscopicDescription($microscopicDescription);
		$newobj->setGrossDescription($grossDescription);
		$newobj->setSurvivalInfo($survivalInfo);
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

sub getRelationalOperation {
	my $self = shift;
	return $self->{relationalOperation};
}

sub setRelationalOperation {
	my $self = shift;
	$self->{relationalOperation} = shift;
}

sub getTumorIncidenceRate {
	my $self = shift;
	return $self->{tumorIncidenceRate};
}

sub setTumorIncidenceRate {
	my $self = shift;
	$self->{tumorIncidenceRate} = shift;
}

sub getAgeOfOnset {
	my $self = shift;
	return $self->{ageOfOnset};
}

sub setAgeOfOnset {
	my $self = shift;
	$self->{ageOfOnset} = shift;
}

sub getMicroscopicDescription {
	my $self = shift;
	return $self->{microscopicDescription};
}

sub setMicroscopicDescription {
	my $self = shift;
	$self->{microscopicDescription} = shift;
}

sub getGrossDescription {
	my $self = shift;
	return $self->{grossDescription};
}

sub setGrossDescription {
	my $self = shift;
	$self->{grossDescription} = shift;
}

sub getSurvivalInfo {
	my $self = shift;
	return $self->{survivalInfo};
}

sub setSurvivalInfo {
	my $self = shift;
	$self->{survivalInfo} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getGeneCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Gene", $self);
	return @results;
}

sub getLibraryCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Library", $self);
	return @results;
}

sub getDiseaseOntology {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::DiseaseOntology", $self);
	return $results[0];
}

sub getOrganOntology {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::OrganOntology", $self);
	return $results[0];
}

sub getClinicalTrialProtocolCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::ClinicalTrialProtocol", $self);
	return @results;
}

sub getAnomalyCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Anomaly", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaBIO::GeneOntology;

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

# create an instance of the GeneOntology object
# returns: a GeneOntology object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new GeneOntology\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this GeneOntology intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:GeneOntologyImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cabio.nci.nih.gov\">";
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

# parse a given xml, construct a list of GeneOntology objects
# param: xml doc
# returns: list of GeneOntology objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @GeneOntologyNodes = $root->getChildNodes;
	my $GeneOntologyLength = $#GeneOntologyNodes;
	#print "total bean count = $GeneOntologyLength\n";
	
	# parse all GeneOntology nodes
	my @obj_list = ();
	foreach my $GeneOntologyNode (@GeneOntologyNodes) {
		#print "\tGeneOntology\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $name;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($GeneOntologyNode->getChildNodes) {
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
		my $newobj = new CaCORE::CaBIO::GeneOntology;
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

sub getChildGeneOntologyRelationshipCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::ChildGeneOntologyRelationship", $self);
	return @results;
}

sub getGeneCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Gene", $self);
	return @results;
}

sub getParentGeneOntologyRelationshipCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::ParentGeneOntologyRelationship", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaBIO::GeneOntologyRelationship;

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

# create an instance of the GeneOntologyRelationship object
# returns: a GeneOntologyRelationship object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new GeneOntologyRelationship\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this GeneOntologyRelationship intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:GeneOntologyRelationshipImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cabio.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# relationshipType;
	if( defined( $self->getRelationshipType ) ) {
		$tmpstr = "<relationshipType xsi:type=\"xsd:string\">" . $self->getRelationshipType . "</relationshipType>";
	} else {
		$tmpstr = "<relationshipType xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of GeneOntologyRelationship objects
# param: xml doc
# returns: list of GeneOntologyRelationship objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @GeneOntologyRelationshipNodes = $root->getChildNodes;
	my $GeneOntologyRelationshipLength = $#GeneOntologyRelationshipNodes;
	#print "total bean count = $GeneOntologyRelationshipLength\n";
	
	# parse all GeneOntologyRelationship nodes
	my @obj_list = ();
	foreach my $GeneOntologyRelationshipNode (@GeneOntologyRelationshipNodes) {
		#print "\tGeneOntologyRelationship\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $relationshipType;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($GeneOntologyRelationshipNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "relationshipType") {
				$relationshipType=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaBIO::GeneOntologyRelationship;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setRelationshipType($relationshipType);
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

sub getRelationshipType {
	my $self = shift;
	return $self->{relationshipType};
}

sub setRelationshipType {
	my $self = shift;
	$self->{relationshipType} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getParentGeneOntology {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::ParentGeneOntology", $self);
	return $results[0];
}

sub getChildGeneOntology {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::ChildGeneOntology", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaBIO::DiseaseOntologyRelationship;

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

# create an instance of the DiseaseOntologyRelationship object
# returns: a DiseaseOntologyRelationship object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new DiseaseOntologyRelationship\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this DiseaseOntologyRelationship intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:DiseaseOntologyRelationshipImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cabio.nci.nih.gov\">";
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

# parse a given xml, construct a list of DiseaseOntologyRelationship objects
# param: xml doc
# returns: list of DiseaseOntologyRelationship objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @DiseaseOntologyRelationshipNodes = $root->getChildNodes;
	my $DiseaseOntologyRelationshipLength = $#DiseaseOntologyRelationshipNodes;
	#print "total bean count = $DiseaseOntologyRelationshipLength\n";
	
	# parse all DiseaseOntologyRelationship nodes
	my @obj_list = ();
	foreach my $DiseaseOntologyRelationshipNode (@DiseaseOntologyRelationshipNodes) {
		#print "\tDiseaseOntologyRelationship\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $type;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($DiseaseOntologyRelationshipNode->getChildNodes) {
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
		my $newobj = new CaCORE::CaBIO::DiseaseOntologyRelationship;
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

sub getChildDiseaseOntology {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::ChildDiseaseOntology", $self);
	return $results[0];
}

sub getParentDiseaseOntology {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::ParentDiseaseOntology", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaBIO::Anomaly;

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

# create an instance of the Anomaly object
# returns: a Anomaly object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Anomaly\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Anomaly intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:AnomalyImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cabio.nci.nih.gov\">";
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

# parse a given xml, construct a list of Anomaly objects
# param: xml doc
# returns: list of Anomaly objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @AnomalyNodes = $root->getChildNodes;
	my $AnomalyLength = $#AnomalyNodes;
	#print "total bean count = $AnomalyLength\n";
	
	# parse all Anomaly nodes
	my @obj_list = ();
	foreach my $AnomalyNode (@AnomalyNodes) {
		#print "\tAnomaly\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $description;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($AnomalyNode->getChildNodes) {
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
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaBIO::Anomaly;
		## begin set attr ##
		$newobj->setId($id);
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

sub getOrganOntologyCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::OrganOntology", $self);
	return @results;
}

sub getHistopathology {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Histopathology", $self);
	return $results[0];
}

sub getVocabularyCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Vocabulary", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaBIO::PopulationFrequency;

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

# create an instance of the PopulationFrequency object
# returns: a PopulationFrequency object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new PopulationFrequency\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this PopulationFrequency intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:PopulationFrequencyImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cabio.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# majorFrequency;
	if( defined( $self->getMajorFrequency ) ) {
		$tmpstr = "<majorFrequency xsi:type=\"xsd:double\">" . $self->getMajorFrequency . "</majorFrequency>";
	} else {
		$tmpstr = "<majorFrequency xsi:type=\"xsd:double\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# type;
	if( defined( $self->getType ) ) {
		$tmpstr = "<type xsi:type=\"xsd:string\">" . $self->getType . "</type>";
	} else {
		$tmpstr = "<type xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# minorAllele;
	if( defined( $self->getMinorAllele ) ) {
		$tmpstr = "<minorAllele xsi:type=\"xsd:string\">" . $self->getMinorAllele . "</minorAllele>";
	} else {
		$tmpstr = "<minorAllele xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# ethnicity;
	if( defined( $self->getEthnicity ) ) {
		$tmpstr = "<ethnicity xsi:type=\"xsd:string\">" . $self->getEthnicity . "</ethnicity>";
	} else {
		$tmpstr = "<ethnicity xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# minorFrequency;
	if( defined( $self->getMinorFrequency ) ) {
		$tmpstr = "<minorFrequency xsi:type=\"xsd:double\">" . $self->getMinorFrequency . "</minorFrequency>";
	} else {
		$tmpstr = "<minorFrequency xsi:type=\"xsd:double\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# majorAllele;
	if( defined( $self->getMajorAllele ) ) {
		$tmpstr = "<majorAllele xsi:type=\"xsd:string\">" . $self->getMajorAllele . "</majorAllele>";
	} else {
		$tmpstr = "<majorAllele xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of PopulationFrequency objects
# param: xml doc
# returns: list of PopulationFrequency objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @PopulationFrequencyNodes = $root->getChildNodes;
	my $PopulationFrequencyLength = $#PopulationFrequencyNodes;
	#print "total bean count = $PopulationFrequencyLength\n";
	
	# parse all PopulationFrequency nodes
	my @obj_list = ();
	foreach my $PopulationFrequencyNode (@PopulationFrequencyNodes) {
		#print "\tPopulationFrequency\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $majorFrequency;
		my $type;
		my $minorAllele;
		my $ethnicity;
		my $minorFrequency;
		my $majorAllele;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($PopulationFrequencyNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "majorFrequency") {
				$majorFrequency=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "type") {
				$type=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "minorAllele") {
				$minorAllele=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "ethnicity") {
				$ethnicity=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "minorFrequency") {
				$minorFrequency=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "majorAllele") {
				$majorAllele=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaBIO::PopulationFrequency;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setMajorFrequency($majorFrequency);
		$newobj->setType($type);
		$newobj->setMinorAllele($minorAllele);
		$newobj->setEthnicity($ethnicity);
		$newobj->setMinorFrequency($minorFrequency);
		$newobj->setMajorAllele($majorAllele);
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

sub getMajorFrequency {
	my $self = shift;
	return $self->{majorFrequency};
}

sub setMajorFrequency {
	my $self = shift;
	$self->{majorFrequency} = shift;
}

sub getType {
	my $self = shift;
	return $self->{type};
}

sub setType {
	my $self = shift;
	$self->{type} = shift;
}

sub getMinorAllele {
	my $self = shift;
	return $self->{minorAllele};
}

sub setMinorAllele {
	my $self = shift;
	$self->{minorAllele} = shift;
}

sub getEthnicity {
	my $self = shift;
	return $self->{ethnicity};
}

sub setEthnicity {
	my $self = shift;
	$self->{ethnicity} = shift;
}

sub getMinorFrequency {
	my $self = shift;
	return $self->{minorFrequency};
}

sub setMinorFrequency {
	my $self = shift;
	$self->{minorFrequency} = shift;
}

sub getMajorAllele {
	my $self = shift;
	return $self->{majorAllele};
}

sub setMajorAllele {
	my $self = shift;
	$self->{majorAllele} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getSNP {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::SNP", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaBIO::ProteinSequence;

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

# create an instance of the ProteinSequence object
# returns: a ProteinSequence object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new ProteinSequence\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this ProteinSequence intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:ProteinSequenceImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cabio.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# checkSum;
	if( defined( $self->getCheckSum ) ) {
		$tmpstr = "<checkSum xsi:type=\"xsd:string\">" . $self->getCheckSum . "</checkSum>";
	} else {
		$tmpstr = "<checkSum xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# value;
	if( defined( $self->getValue ) ) {
		$tmpstr = "<value xsi:type=\"xsd:string\">" . $self->getValue . "</value>";
	} else {
		$tmpstr = "<value xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# molecularWeightInDaltons;
	if( defined( $self->getMolecularWeightInDaltons ) ) {
		$tmpstr = "<molecularWeightInDaltons xsi:type=\"xsd:double\">" . $self->getMolecularWeightInDaltons . "</molecularWeightInDaltons>";
	} else {
		$tmpstr = "<molecularWeightInDaltons xsi:type=\"xsd:double\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# length;
	if( defined( $self->getLength ) ) {
		$tmpstr = "<length xsi:type=\"xsd:long\">" . $self->getLength . "</length>";
	} else {
		$tmpstr = "<length xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of ProteinSequence objects
# param: xml doc
# returns: list of ProteinSequence objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @ProteinSequenceNodes = $root->getChildNodes;
	my $ProteinSequenceLength = $#ProteinSequenceNodes;
	#print "total bean count = $ProteinSequenceLength\n";
	
	# parse all ProteinSequence nodes
	my @obj_list = ();
	foreach my $ProteinSequenceNode (@ProteinSequenceNodes) {
		#print "\tProteinSequence\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $checkSum;
		my $value;
		my $molecularWeightInDaltons;
		my $length;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($ProteinSequenceNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "checkSum") {
				$checkSum=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "value") {
				$value=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "molecularWeightInDaltons") {
				$molecularWeightInDaltons=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "length") {
				$length=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaBIO::ProteinSequence;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setCheckSum($checkSum);
		$newobj->setValue($value);
		$newobj->setMolecularWeightInDaltons($molecularWeightInDaltons);
		$newobj->setLength($length);
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

sub getCheckSum {
	my $self = shift;
	return $self->{checkSum};
}

sub setCheckSum {
	my $self = shift;
	$self->{checkSum} = shift;
}

sub getValue {
	my $self = shift;
	return $self->{value};
}

sub setValue {
	my $self = shift;
	$self->{value} = shift;
}

sub getMolecularWeightInDaltons {
	my $self = shift;
	return $self->{molecularWeightInDaltons};
}

sub setMolecularWeightInDaltons {
	my $self = shift;
	$self->{molecularWeightInDaltons} = shift;
}

sub getLength {
	my $self = shift;
	return $self->{length};
}

sub setLength {
	my $self = shift;
	$self->{length} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getProtein {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Protein", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaBIO::Protein;

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

# create an instance of the Protein object
# returns: a Protein object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Protein\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Protein intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:ProteinImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cabio.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# copyrightStatement;
	if( defined( $self->getCopyrightStatement ) ) {
		$tmpstr = "<copyrightStatement xsi:type=\"xsd:string\">" . $self->getCopyrightStatement . "</copyrightStatement>";
	} else {
		$tmpstr = "<copyrightStatement xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# primaryAccession;
	if( defined( $self->getPrimaryAccession ) ) {
		$tmpstr = "<primaryAccession xsi:type=\"xsd:string\">" . $self->getPrimaryAccession . "</primaryAccession>";
	} else {
		$tmpstr = "<primaryAccession xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# name;
	if( defined( $self->getName ) ) {
		$tmpstr = "<name xsi:type=\"xsd:string\">" . $self->getName . "</name>";
	} else {
		$tmpstr = "<name xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# uniProtCode;
	if( defined( $self->getUniProtCode ) ) {
		$tmpstr = "<uniProtCode xsi:type=\"xsd:string\">" . $self->getUniProtCode . "</uniProtCode>";
	} else {
		$tmpstr = "<uniProtCode xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of Protein objects
# param: xml doc
# returns: list of Protein objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @ProteinNodes = $root->getChildNodes;
	my $ProteinLength = $#ProteinNodes;
	#print "total bean count = $ProteinLength\n";
	
	# parse all Protein nodes
	my @obj_list = ();
	foreach my $ProteinNode (@ProteinNodes) {
		#print "\tProtein\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $copyrightStatement;
		my $primaryAccession;
		my $name;
		my $uniProtCode;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($ProteinNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "copyrightStatement") {
				$copyrightStatement=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "primaryAccession") {
				$primaryAccession=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "uniProtCode") {
				$uniProtCode=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaBIO::Protein;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setCopyrightStatement($copyrightStatement);
		$newobj->setPrimaryAccession($primaryAccession);
		$newobj->setName($name);
		$newobj->setUniProtCode($uniProtCode);
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

sub getCopyrightStatement {
	my $self = shift;
	return $self->{copyrightStatement};
}

sub setCopyrightStatement {
	my $self = shift;
	$self->{copyrightStatement} = shift;
}

sub getPrimaryAccession {
	my $self = shift;
	return $self->{primaryAccession};
}

sub setPrimaryAccession {
	my $self = shift;
	$self->{primaryAccession} = shift;
}

sub getName {
	my $self = shift;
	return $self->{name};
}

sub setName {
	my $self = shift;
	$self->{name} = shift;
}

sub getUniProtCode {
	my $self = shift;
	return $self->{uniProtCode};
}

sub setUniProtCode {
	my $self = shift;
	$self->{uniProtCode} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getTaxonCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Taxon", $self);
	return @results;
}

sub getGeneCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Gene", $self);
	return @results;
}

sub getProteinSequence {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::ProteinSequence", $self);
	return $results[0];
}

sub getProteinAliasCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::ProteinAlias", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaBIO::ProteinAlias;

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

# create an instance of the ProteinAlias object
# returns: a ProteinAlias object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new ProteinAlias\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this ProteinAlias intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:ProteinAliasImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cabio.nci.nih.gov\">";
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

# parse a given xml, construct a list of ProteinAlias objects
# param: xml doc
# returns: list of ProteinAlias objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @ProteinAliasNodes = $root->getChildNodes;
	my $ProteinAliasLength = $#ProteinAliasNodes;
	#print "total bean count = $ProteinAliasLength\n";
	
	# parse all ProteinAlias nodes
	my @obj_list = ();
	foreach my $ProteinAliasNode (@ProteinAliasNodes) {
		#print "\tProteinAlias\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $name;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($ProteinAliasNode->getChildNodes) {
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
		my $newobj = new CaCORE::CaBIO::ProteinAlias;
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

sub getProteinCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Protein", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaBIO::HomologousAssociation;

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

# create an instance of the HomologousAssociation object
# returns: a HomologousAssociation object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new HomologousAssociation\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this HomologousAssociation intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:HomologousAssociationImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cabio.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# similarityPercentage;
	if( defined( $self->getSimilarityPercentage ) ) {
		$tmpstr = "<similarityPercentage xsi:type=\"xsd:float\">" . $self->getSimilarityPercentage . "</similarityPercentage>";
	} else {
		$tmpstr = "<similarityPercentage xsi:type=\"xsd:float\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# homologousId;
	if( defined( $self->getHomologousId ) ) {
		$tmpstr = "<homologousId xsi:type=\"xsd:long\">" . $self->getHomologousId . "</homologousId>";
	} else {
		$tmpstr = "<homologousId xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of HomologousAssociation objects
# param: xml doc
# returns: list of HomologousAssociation objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @HomologousAssociationNodes = $root->getChildNodes;
	my $HomologousAssociationLength = $#HomologousAssociationNodes;
	#print "total bean count = $HomologousAssociationLength\n";
	
	# parse all HomologousAssociation nodes
	my @obj_list = ();
	foreach my $HomologousAssociationNode (@HomologousAssociationNodes) {
		#print "\tHomologousAssociation\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $similarityPercentage;
		my $homologousId;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($HomologousAssociationNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "similarityPercentage") {
				$similarityPercentage=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "homologousId") {
				$homologousId=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaBIO::HomologousAssociation;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setSimilarityPercentage($similarityPercentage);
		$newobj->setHomologousId($homologousId);
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

sub getSimilarityPercentage {
	my $self = shift;
	return $self->{similarityPercentage};
}

sub setSimilarityPercentage {
	my $self = shift;
	$self->{similarityPercentage} = shift;
}

sub getHomologousId {
	my $self = shift;
	return $self->{homologousId};
}

sub setHomologousId {
	my $self = shift;
	$self->{homologousId} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getHomologousGene {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::HomologousGene", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaBIO::PhysicalLocation;

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

# create an instance of the PhysicalLocation object
# returns: a PhysicalLocation object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new PhysicalLocation\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this PhysicalLocation intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:PhysicalLocationImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cabio.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# chromosomalStartPosition;
	if( defined( $self->getChromosomalStartPosition ) ) {
		$tmpstr = "<chromosomalStartPosition xsi:type=\"xsd:long\">" . $self->getChromosomalStartPosition . "</chromosomalStartPosition>";
	} else {
		$tmpstr = "<chromosomalStartPosition xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# chromosomalEndPosition;
	if( defined( $self->getChromosomalEndPosition ) ) {
		$tmpstr = "<chromosomalEndPosition xsi:type=\"xsd:long\">" . $self->getChromosomalEndPosition . "</chromosomalEndPosition>";
	} else {
		$tmpstr = "<chromosomalEndPosition xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of PhysicalLocation objects
# param: xml doc
# returns: list of PhysicalLocation objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @PhysicalLocationNodes = $root->getChildNodes;
	my $PhysicalLocationLength = $#PhysicalLocationNodes;
	#print "total bean count = $PhysicalLocationLength\n";
	
	# parse all PhysicalLocation nodes
	my @obj_list = ();
	foreach my $PhysicalLocationNode (@PhysicalLocationNodes) {
		#print "\tPhysicalLocation\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $chromosomalStartPosition;
		my $chromosomalEndPosition;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($PhysicalLocationNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "chromosomalStartPosition") {
				$chromosomalStartPosition=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "chromosomalEndPosition") {
				$chromosomalEndPosition=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaBIO::PhysicalLocation;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setChromosomalStartPosition($chromosomalStartPosition);
		$newobj->setChromosomalEndPosition($chromosomalEndPosition);
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

sub getChromosomalStartPosition {
	my $self = shift;
	return $self->{chromosomalStartPosition};
}

sub setChromosomalStartPosition {
	my $self = shift;
	$self->{chromosomalStartPosition} = shift;
}

sub getChromosomalEndPosition {
	my $self = shift;
	return $self->{chromosomalEndPosition};
}

sub setChromosomalEndPosition {
	my $self = shift;
	$self->{chromosomalEndPosition} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getCytobandCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::Cytoband", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaBIO::Cytoband;

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

# create an instance of the Cytoband object
# returns: a Cytoband object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Cytoband\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Cytoband intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:CytobandImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cabio.nci.nih.gov\">";
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

# parse a given xml, construct a list of Cytoband objects
# param: xml doc
# returns: list of Cytoband objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @CytobandNodes = $root->getChildNodes;
	my $CytobandLength = $#CytobandNodes;
	#print "total bean count = $CytobandLength\n";
	
	# parse all Cytoband nodes
	my @obj_list = ();
	foreach my $CytobandNode (@CytobandNodes) {
		#print "\tCytoband\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $name;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($CytobandNode->getChildNodes) {
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
		my $newobj = new CaCORE::CaBIO::Cytoband;
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

sub getPhysicalLocation {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::PhysicalLocation", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaBIO::CytogeneticLocation;

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

# create an instance of the CytogeneticLocation object
# returns: a CytogeneticLocation object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new CytogeneticLocation\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this CytogeneticLocation intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:CytogeneticLocationImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cabio.nci.nih.gov\">";
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

# parse a given xml, construct a list of CytogeneticLocation objects
# param: xml doc
# returns: list of CytogeneticLocation objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @CytogeneticLocationNodes = $root->getChildNodes;
	my $CytogeneticLocationLength = $#CytogeneticLocationNodes;
	#print "total bean count = $CytogeneticLocationLength\n";
	
	# parse all CytogeneticLocation nodes
	my @obj_list = ();
	foreach my $CytogeneticLocationNode (@CytogeneticLocationNodes) {
		#print "\tCytogeneticLocation\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($CytogeneticLocationNode->getChildNodes) {
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
		my $newobj = new CaCORE::CaBIO::CytogeneticLocation;
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

sub getStartCytoband {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::StartCytoband", $self);
	return $results[0];
}

sub getEndCytoband {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::EndCytoband", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaBIO::GeneRelativeLocation;

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

# create an instance of the GeneRelativeLocation object
# returns: a GeneRelativeLocation object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new GeneRelativeLocation\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this GeneRelativeLocation intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:GeneRelativeLocationImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cabio.nci.nih.gov\">";
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

# parse a given xml, construct a list of GeneRelativeLocation objects
# param: xml doc
# returns: list of GeneRelativeLocation objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @GeneRelativeLocationNodes = $root->getChildNodes;
	my $GeneRelativeLocationLength = $#GeneRelativeLocationNodes;
	#print "total bean count = $GeneRelativeLocationLength\n";
	
	# parse all GeneRelativeLocation nodes
	my @obj_list = ();
	foreach my $GeneRelativeLocationNode (@GeneRelativeLocationNodes) {
		#print "\tGeneRelativeLocation\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $type;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($GeneRelativeLocationNode->getChildNodes) {
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
		my $newobj = new CaCORE::CaBIO::GeneRelativeLocation;
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
package CaCORE::CaBIO::GenericReporter;

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

# create an instance of the GenericReporter object
# returns: a GenericReporter object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new GenericReporter\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this GenericReporter intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:GenericReporterImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cabio.nci.nih.gov\">";
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

# parse a given xml, construct a list of GenericReporter objects
# param: xml doc
# returns: list of GenericReporter objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @GenericReporterNodes = $root->getChildNodes;
	my $GenericReporterLength = $#GenericReporterNodes;
	#print "total bean count = $GenericReporterLength\n";
	
	# parse all GenericReporter nodes
	my @obj_list = ();
	foreach my $GenericReporterNode (@GenericReporterNodes) {
		#print "\tGenericReporter\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $name;
		my $type;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($GenericReporterNode->getChildNodes) {
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
		my $newobj = new CaCORE::CaBIO::GenericReporter;
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

sub getGenericArrayCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::GenericArray", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::CaBIO::GenericArray;

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

# create an instance of the GenericArray object
# returns: a GenericArray object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new GenericArray\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this GenericArray intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:GenericArrayImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.cabio.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# arrayName;
	if( defined( $self->getArrayName ) ) {
		$tmpstr = "<arrayName xsi:type=\"xsd:string\">" . $self->getArrayName . "</arrayName>";
	} else {
		$tmpstr = "<arrayName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# platform;
	if( defined( $self->getPlatform ) ) {
		$tmpstr = "<platform xsi:type=\"xsd:string\">" . $self->getPlatform . "</platform>";
	} else {
		$tmpstr = "<platform xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of GenericArray objects
# param: xml doc
# returns: list of GenericArray objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @GenericArrayNodes = $root->getChildNodes;
	my $GenericArrayLength = $#GenericArrayNodes;
	#print "total bean count = $GenericArrayLength\n";
	
	# parse all GenericArray nodes
	my @obj_list = ();
	foreach my $GenericArrayNode (@GenericArrayNodes) {
		#print "\tGenericArray\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $arrayName;
		my $platform;
		my $type;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($GenericArrayNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "arrayName") {
				$arrayName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "platform") {
				$platform=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "type") {
				$type=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::CaBIO::GenericArray;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setArrayName($arrayName);
		$newobj->setPlatform($platform);
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

sub getArrayName {
	my $self = shift;
	return $self->{arrayName};
}

sub setArrayName {
	my $self = shift;
	$self->{arrayName} = shift;
}

sub getPlatform {
	my $self = shift;
	return $self->{platform};
}

sub setPlatform {
	my $self = shift;
	$self->{platform} = shift;
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

sub getGenericReporterCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::CaBIO::GenericReporter", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# Below is module documentation for Taxon

=pod

=head1 Taxon

  CaCORE::CaBIO::Taxon - Perl extension for Taxon.

=head2 Abstract

  The CaCORE::CaBIO::bean::Taxon is a Perl object representation of the
  caBIO generic object.

=head2 Description

  An object representing the various names (scientific, common, abbreviated, etc.) for a species associated with a specific instance of a Gene, Chromosome, Pathway, Protein, or Tissue.

=head3 Attributes of Taxon

  The following are all the attributes of the Taxon object and their data types:

	scientificName	string
	ethnicityStrain	string
	abbreviation	string
	commonName	string
	id	long
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of Taxon

  The following are all the objects that are associated with the Taxon:

=for html
<pre>
	<a href="#gene">Gene</a>: 	One to many assoication, use getGeneCollection to get a collection of associated Gene.
	<a href="#protein">Protein</a>: 	One to many assoication, use getProteinCollection to get a collection of associated Protein.
	<a href="#pathway">Pathway</a>: 	One to many assoication, use getPathwayCollection to get a collection of associated Pathway.
	<a href="#tissue">Tissue</a>: 	One to many assoication, use getTissueCollection to get a collection of associated Tissue.
	<a href="#chromosome">Chromosome</a>: 	One to many assoication, use getChromosomeCollection to get a collection of associated Chromosome.
	<a href="#clone">Clone</a>: 	One to many assoication, use getCloneCollection to get a collection of associated Clone.
  End Associations and related methods
<p>

=cut

# Below is module documentation for Agent

=pod

=head1 Agent

  CaCORE::CaBIO::Agent - Perl extension for Agent.

=head2 Abstract

  The CaCORE::CaBIO::bean::Agent is a Perl object representation of the
  caBIO generic object.

=head2 Description

  A therapeutic agent (drug, intervention therapy) used in a clinical trail protocol.

=head3 Attributes of Agent

  The following are all the attributes of the Agent object and their data types:

	isCMAPAgent	boolean
	comment	string
	source	string
	NSCNumber	long
	name	string
	EVSId	string
	id	long
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of Agent

  The following are all the objects that are associated with the Agent:

=for html
<pre>
	<a href="#target">Target</a>: 	One to many assoication, use getTargetCollection to get a collection of associated Target.
	<a href="#clinicaltrialprotocol">ClinicalTrialProtocol</a>: 	One to many assoication, use getClinicalTrialProtocolCollection to get a collection of associated ClinicalTrialProtocol.
  End Associations and related methods
<p>

=cut

# Below is module documentation for Chromosome

=pod

=head1 Chromosome

  CaCORE::CaBIO::Chromosome - Perl extension for Chromosome.

=head2 Abstract

  The CaCORE::CaBIO::bean::Chromosome is a Perl object representation of the
  caBIO generic object.

=head2 Description

  An object representing a specific chromosome for a specific taxon; provides access to all known genes contained in the chromosome and to the taxon.

=head3 Attributes of Chromosome

  The following are all the attributes of the Chromosome object and their data types:

	id	long
	number	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of Chromosome

  The following are all the objects that are associated with the Chromosome:

=for html
<pre>
	<a href="#taxon">Taxon</a>: 	Many to one assoication, use getTaxon to get the associated Taxon.
	<a href="#gene">Gene</a>: 	One to many assoication, use getGeneCollection to get a collection of associated Gene.
	<a href="#location">Location</a>: 	One to many assoication, use getLocationCollection to get a collection of associated Location.
  End Associations and related methods
<p>

=cut

# Below is module documentation for Gene

=pod

=head1 Gene

  CaCORE::CaBIO::Gene - Perl extension for Gene.

=head2 Abstract

  The CaCORE::CaBIO::bean::Gene is a Perl object representation of the
  caBIO generic object.

=head2 Description

  Gene objects are the effective portal to most of the genomic information provided by the caBIO data services; organs, diseases, chromosomes, pathways, sequence data, and expression experiments are among the many objects accessible via a gene.

=head3 Attributes of Gene

  The following are all the attributes of the Gene object and their data types:

	id	long
	clusterId	long
	symbol	string
	fullName	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of Gene

  The following are all the objects that are associated with the Gene:

=for html
<pre>
	<a href="#geneontology">GeneOntology</a>: 	One to many assoication, use getGeneOntologyCollection to get a collection of associated GeneOntology.
	<a href="#genealias">GeneAlias</a>: 	One to many assoication, use getGeneAliasCollection to get a collection of associated GeneAlias.
	<a href="#protein">Protein</a>: 	One to many assoication, use getProteinCollection to get a collection of associated Protein.
	<a href="#expressionfeature">ExpressionFeature</a>: 	One to many assoication, use getExpressionFeatureCollection to get a collection of associated ExpressionFeature.
	<a href="#pathway">Pathway</a>: 	One to many assoication, use getPathwayCollection to get a collection of associated Pathway.
	<a href="#organontology">OrganOntology</a>: 	One to many assoication, use getOrganOntologyCollection to get a collection of associated OrganOntology.
	<a href="#taxon">Taxon</a>: 	Many to one assoication, use getTaxon to get the associated Taxon.
	<a href="#library">Library</a>: 	One to many assoication, use getLibraryCollection to get a collection of associated Library.
	<a href="#generelativelocation">GeneRelativeLocation</a>: 	One to many assoication, use getGeneRelativeLocationCollection to get a collection of associated GeneRelativeLocation.
	<a href="#chromosome">Chromosome</a>: 	Many to one assoication, use getChromosome to get the associated Chromosome.
	<a href="#databasecrossreference">DatabaseCrossReference</a>: 	One to many assoication, use getDatabaseCrossReferenceCollection to get a collection of associated DatabaseCrossReference.
	<a href="#genericreporter">GenericReporter</a>: 	One to many assoication, use getGenericReporterCollection to get a collection of associated GenericReporter.
	<a href="#target">Target</a>: 	One to many assoication, use getTargetCollection to get a collection of associated Target.
	<a href="#histopathology">Histopathology</a>: 	One to many assoication, use getHistopathologyCollection to get a collection of associated Histopathology.
	<a href="#location">Location</a>: 	One to many assoication, use getLocationCollection to get a collection of associated Location.
	<a href="#nucleicacidsequence">NucleicAcidSequence</a>: 	One to many assoication, use getNucleicAcidSequenceCollection to get a collection of associated NucleicAcidSequence.
	<a href="#homologousassociation">HomologousAssociation</a>: 	One to many assoication, use getHomologousAssociationCollection to get a collection of associated HomologousAssociation.
  End Associations and related methods
<p>

=cut

# Below is module documentation for Vocabulary

=pod

=head1 Vocabulary

  CaCORE::CaBIO::Vocabulary - Perl extension for Vocabulary.

=head2 Abstract

  The CaCORE::CaBIO::bean::Vocabulary is a Perl object representation of the
  caBIO generic object.

=head2 Description

  The object describes the vocabulary.

=head3 Attributes of Vocabulary

  The following are all the attributes of the Vocabulary object and their data types:

	generalTerm	string
	coreTerm	string
	id	long
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of Vocabulary

  The following are all the objects that are associated with the Vocabulary:

=for html
<pre>
	<a href="#anomaly">Anomaly</a>: 	One to many assoication, use getAnomalyCollection to get a collection of associated Anomaly.
  End Associations and related methods
<p>

=cut

# Below is module documentation for Protocol

=pod

=head1 Protocol

  CaCORE::CaBIO::Protocol - Perl extension for Protocol.

=head2 Abstract

  The CaCORE::CaBIO::bean::Protocol is a Perl object representation of the
  caBIO generic object.

=head2 Description

  An object representation of the protocol used in assembling a clone library.

=head3 Attributes of Protocol

  The following are all the attributes of the Protocol object and their data types:

	type	string
	description	string
	name	string
	id	long
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of Protocol

  The following are all the objects that are associated with the Protocol:

=for html
<pre>
	<a href="#library">Library</a>: 	One to many assoication, use getLibraryCollection to get a collection of associated Library.
	<a href="#tissue">Tissue</a>: 	One to many assoication, use getTissueCollection to get a collection of associated Tissue.
  End Associations and related methods
<p>

=cut

# Below is module documentation for Tissue

=pod

=head1 Tissue

  CaCORE::CaBIO::Tissue - Perl extension for Tissue.

=head2 Abstract

  The CaCORE::CaBIO::bean::Tissue is a Perl object representation of the
  caBIO generic object.

=head2 Description

  A group of similar cells united to perform a specific function.

=head3 Attributes of Tissue

  The following are all the attributes of the Tissue object and their data types:

	type	string
	cellType	string
	histology	string
	id	long
	sex	string
	cellLine	string
	supplier	string
	developmentalStage	string
	description	string
	organ	string
	name	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of Tissue

  The following are all the objects that are associated with the Tissue:

=for html
<pre>
	<a href="#protocol">Protocol</a>: 	Many to one assoication, use getProtocol to get the associated Protocol.
	<a href="#taxon">Taxon</a>: 	Many to one assoication, use getTaxon to get the associated Taxon.
	<a href="#library">Library</a>: 	One to many assoication, use getLibraryCollection to get a collection of associated Library.
  End Associations and related methods
<p>

=cut

# Below is module documentation for SNP

=pod

=head1 SNP

  CaCORE::CaBIO::SNP - Perl extension for SNP.

=head2 Abstract

  The CaCORE::CaBIO::bean::SNP is a Perl object representation of the
  caBIO generic object.

=head2 Description

  An object representing a Single Nucleotide Polymorphism; provides access to the clones and the trace files from which it was identified, the two most common substitutions at that position, the offset of the SNP in the parent sequence, and a confidence score.

=head3 Attributes of SNP

  The following are all the attributes of the SNP object and their data types:

	alleleA	string
	validationStatus	string
	alleleB	string
	DBSNPID	string
	id	long
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of SNP

  The following are all the objects that are associated with the SNP:

=for html
<pre>
	<a href="#databasecrossreference">DatabaseCrossReference</a>: 	One to many assoication, use getDatabaseCrossReferenceCollection to get a collection of associated DatabaseCrossReference.
	<a href="#populationfrequency">PopulationFrequency</a>: 	One to many assoication, use getPopulationFrequencyCollection to get a collection of associated PopulationFrequency.
	<a href="#location">Location</a>: 	One to many assoication, use getLocationCollection to get a collection of associated Location.
	<a href="#generelativelocation">GeneRelativeLocation</a>: 	One to many assoication, use getGeneRelativeLocationCollection to get a collection of associated GeneRelativeLocation.
  End Associations and related methods
<p>

=cut

# Below is module documentation for GeneAlias

=pod

=head1 GeneAlias

  CaCORE::CaBIO::GeneAlias - Perl extension for GeneAlias.

=head2 Abstract

  The CaCORE::CaBIO::bean::GeneAlias is a Perl object representation of the
  caBIO generic object.

=head2 Description

  This object describes the gene alias.

=head3 Attributes of GeneAlias

  The following are all the attributes of the GeneAlias object and their data types:

	name	string
	type	string
	id	long
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of GeneAlias

  The following are all the objects that are associated with the GeneAlias:

=for html
<pre>
	<a href="#gene">Gene</a>: 	One to many assoication, use getGeneCollection to get a collection of associated Gene.
  End Associations and related methods
<p>

=cut

# Below is module documentation for Library

=pod

=head1 Library

  CaCORE::CaBIO::Library - Perl extension for Library.

=head2 Abstract

  The CaCORE::CaBIO::bean::Library is a Perl object representation of the
  caBIO generic object.

=head2 Description

  An object representing a CGAP library; provides access to information about: the tissue sample and its method of preparation, the library protocol that was used, the clones contained in the library, and the sequence information derived from the library.

=head3 Attributes of Library

  The following are all the attributes of the Library object and their data types:

	type	string
	rsite1	string
	creationDate	dateTime
	labHost	string
	cloneVector	string
	id	long
	clonesToDate	long
	sequencesToDate	long
	keyword	string
	description	string
	cloneProducer	string
	rsite2	string
	cloneVectorType	string
	uniGeneId	long
	name	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of Library

  The following are all the objects that are associated with the Library:

=for html
<pre>
	<a href="#protocol">Protocol</a>: 	Many to one assoication, use getProtocol to get the associated Protocol.
	<a href="#gene">Gene</a>: 	One to many assoication, use getGeneCollection to get a collection of associated Gene.
	<a href="#clone">Clone</a>: 	One to many assoication, use getCloneCollection to get a collection of associated Clone.
	<a href="#tissue">Tissue</a>: 	Many to one assoication, use getTissue to get the associated Tissue.
	<a href="#histopathology">Histopathology</a>: 	One to many assoication, use getHistopathologyCollection to get a collection of associated Histopathology.
  End Associations and related methods
<p>

=cut

# Below is module documentation for Clone

=pod

=head1 Clone

  CaCORE::CaBIO::Clone - Perl extension for Clone.

=head2 Abstract

  The CaCORE::CaBIO::bean::Clone is a Perl object representation of the
  caBIO generic object.

=head2 Description

  An object used to hold information pertaining to I.M.A.G.E. clones; provides access to sequence information, associated trace files, and the clone's library.

=head3 Attributes of Clone

  The following are all the attributes of the Clone object and their data types:

	type	string
	insertSize	long
	name	string
	id	long
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of Clone

  The following are all the objects that are associated with the Clone:

=for html
<pre>
	<a href="#taxon">Taxon</a>: 	One to many assoication, use getTaxonCollection to get a collection of associated Taxon.
	<a href="#clonerelativelocation">CloneRelativeLocation</a>: 	One to many assoication, use getCloneRelativeLocationCollection to get a collection of associated CloneRelativeLocation.
	<a href="#library">Library</a>: 	Many to one assoication, use getLibrary to get the associated Library.
	<a href="#nucleicacidsequence">NucleicAcidSequence</a>: 	One to many assoication, use getNucleicAcidSequenceCollection to get a collection of associated NucleicAcidSequence.
  End Associations and related methods
<p>

=cut

# Below is module documentation for Target

=pod

=head1 Target

  CaCORE::CaBIO::Target - Perl extension for Target.

=head2 Abstract

  The CaCORE::CaBIO::bean::Target is a Perl object representation of the
  caBIO generic object.

=head2 Description

  A gene thought to be at the root of a disease etiology, and which is targeted for therapeutic intervention in a clinical trial.

=head3 Attributes of Target

  The following are all the attributes of the Target object and their data types:

	type	string
	name	string
	id	long
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of Target

  The following are all the objects that are associated with the Target:

=for html
<pre>
	<a href="#gene">Gene</a>: 	One to many assoication, use getGeneCollection to get a collection of associated Gene.
	<a href="#agent">Agent</a>: 	One to many assoication, use getAgentCollection to get a collection of associated Agent.
	<a href="#anomaly">Anomaly</a>: 	One to many assoication, use getAnomalyCollection to get a collection of associated Anomaly.
  End Associations and related methods
<p>

=cut

# Below is module documentation for Location

=pod

=head1 Location

  CaCORE::CaBIO::Location - Perl extension for Location.

=head2 Abstract

  The CaCORE::CaBIO::bean::Location is a Perl object representation of the
  caBIO generic object.

=head2 Description

  

=head3 Attributes of Location

  The following are all the attributes of the Location object and their data types:

	id	long
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of Location

  The following are all the objects that are associated with the Location:

=for html
<pre>
	<a href="#snp">SNP</a>: 	Many to one assoication, use getSNP to get the associated SNP.
	<a href="#gene">Gene</a>: 	Many to one assoication, use getGene to get the associated Gene.
	<a href="#nucleicacidsequence">NucleicAcidSequence</a>: 	Many to one assoication, use getNucleicAcidSequence to get the associated NucleicAcidSequence.
	<a href="#chromosome">Chromosome</a>: 	Many to one assoication, use getChromosome to get the associated Chromosome.
  End Associations and related methods
<p>

=cut

# Below is module documentation for CloneRelativeLocation

=pod

=head1 CloneRelativeLocation

  CaCORE::CaBIO::CloneRelativeLocation - Perl extension for CloneRelativeLocation.

=head2 Abstract

  The CaCORE::CaBIO::bean::CloneRelativeLocation is a Perl object representation of the
  caBIO generic object.

=head2 Description

  

=head3 Attributes of CloneRelativeLocation

  The following are all the attributes of the CloneRelativeLocation object and their data types:

	type	string
	id	long
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of CloneRelativeLocation

  The following are all the objects that are associated with the CloneRelativeLocation:

=for html
<pre>
	<a href="#clone">Clone</a>: 	Many to one assoication, use getClone to get the associated Clone.
	<a href="#nucleicacidsequence">NucleicAcidSequence</a>: 	Many to one assoication, use getNucleicAcidSequence to get the associated NucleicAcidSequence.
  End Associations and related methods
<p>

=cut

# Below is module documentation for NucleicAcidSequence

=pod

=head1 NucleicAcidSequence

  CaCORE::CaBIO::NucleicAcidSequence - Perl extension for NucleicAcidSequence.

=head2 Abstract

  The CaCORE::CaBIO::bean::NucleicAcidSequence is a Perl object representation of the
  caBIO generic object.

=head2 Description

  An object representation of a nucleic acid sequence; provides access to the clones from which it was derived.

=head3 Attributes of NucleicAcidSequence

  The following are all the attributes of the NucleicAcidSequence object and their data types:

	value	string
	type	string
	length	long
	accessionNumber	string
	id	long
	accessionNumberVersion	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of NucleicAcidSequence

  The following are all the objects that are associated with the NucleicAcidSequence:

=for html
<pre>
	<a href="#gene">Gene</a>: 	One to many assoication, use getGeneCollection to get a collection of associated Gene.
	<a href="#databasecrossreference">DatabaseCrossReference</a>: 	One to many assoication, use getDatabaseCrossReferenceCollection to get a collection of associated DatabaseCrossReference.
	<a href="#location">Location</a>: 	Many to one assoication, use getLocation to get the associated Location.
	<a href="#clonerelativelocation">CloneRelativeLocation</a>: 	Many to one assoication, use getCloneRelativeLocation to get the associated CloneRelativeLocation.
  End Associations and related methods
<p>

=cut

# Below is module documentation for DiseaseOntology

=pod

=head1 DiseaseOntology

  CaCORE::CaBIO::DiseaseOntology - Perl extension for DiseaseOntology.

=head2 Abstract

  The CaCORE::CaBIO::bean::DiseaseOntology is a Perl object representation of the
  caBIO generic object.

=head2 Description

  Disease objects specify a disease name and ID; disease objects also provide access to: ontological relations to other diseases; clinical trial protocols treating the disease; and specific histologies associated with instances of the disease.

=head3 Attributes of DiseaseOntology

  The following are all the attributes of the DiseaseOntology object and their data types:

	name	string
	id	long
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of DiseaseOntology

  The following are all the objects that are associated with the DiseaseOntology:

=for html
<pre>
	<a href="#parentdiseaseontologyrelationship">ParentDiseaseOntologyRelationship</a>: 	One to many assoication, use getParentDiseaseOntologyRelationshipCollection to get a collection of associated ParentDiseaseOntologyRelationship.
	<a href="#childdiseaseontologyrelationship">ChildDiseaseOntologyRelationship</a>: 	One to many assoication, use getChildDiseaseOntologyRelationshipCollection to get a collection of associated ChildDiseaseOntologyRelationship.
	<a href="#histopathology">Histopathology</a>: 	One to many assoication, use getHistopathologyCollection to get a collection of associated Histopathology.
	<a href="#clinicaltrialprotocol">ClinicalTrialProtocol</a>: 	One to many assoication, use getClinicalTrialProtocolCollection to get a collection of associated ClinicalTrialProtocol.
  End Associations and related methods
<p>

=cut

# Below is module documentation for ClinicalTrialProtocol

=pod

=head1 ClinicalTrialProtocol

  CaCORE::CaBIO::ClinicalTrialProtocol - Perl extension for ClinicalTrialProtocol.

=head2 Abstract

  The CaCORE::CaBIO::bean::ClinicalTrialProtocol is a Perl object representation of the
  caBIO generic object.

=head2 Description

  The protocol associated with a clinical trial; organizes administrative information about the trial such as Organization ID, participants, phase, etc., and provides access to the administered Agents.

=head3 Attributes of ClinicalTrialProtocol

  The following are all the attributes of the ClinicalTrialProtocol object and their data types:

	currentStatus	string
	participationType	string
	treatmentFlag	string
	leadOrganizationId	string
	NIHAdminCode	string
	title	string
	id	long
	PDQIdentifier	string
	documentNumber	string
	leadOrganizationName	string
	phase	string
	PIName	string
	currentStatusDate	dateTime
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of ClinicalTrialProtocol

  The following are all the objects that are associated with the ClinicalTrialProtocol:

=for html
<pre>
	<a href="#agent">Agent</a>: 	One to many assoication, use getAgentCollection to get a collection of associated Agent.
	<a href="#protocolassociation">ProtocolAssociation</a>: 	One to many assoication, use getProtocolAssociationCollection to get a collection of associated ProtocolAssociation.
	<a href="#diseaseontology">DiseaseOntology</a>: 	One to many assoication, use getDiseaseOntologyCollection to get a collection of associated DiseaseOntology.
	<a href="#histopathology">Histopathology</a>: 	One to many assoication, use getHistopathologyCollection to get a collection of associated Histopathology.
  End Associations and related methods
<p>

=cut

# Below is module documentation for ProtocolAssociation

=pod

=head1 ProtocolAssociation

  CaCORE::CaBIO::ProtocolAssociation - Perl extension for ProtocolAssociation.

=head2 Abstract

  The CaCORE::CaBIO::bean::ProtocolAssociation is a Perl object representation of the
  caBIO generic object.

=head2 Description

  An association class relating between Clinical Trial Protocols to Diseases.

=head3 Attributes of ProtocolAssociation

  The following are all the attributes of the ProtocolAssociation object and their data types:

	diseaseSubCategory	string
	CTEPNAME	string
	IMTCODE	long
	id	long
	diseaseCategory	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of ProtocolAssociation

  The following are all the objects that are associated with the ProtocolAssociation:

=for html
<pre>
	<a href="#diseaseontology">DiseaseOntology</a>: 	Many to one assoication, use getDiseaseOntology to get the associated DiseaseOntology.
	<a href="#clinicaltrialprotocol">ClinicalTrialProtocol</a>: 	Many to one assoication, use getClinicalTrialProtocol to get the associated ClinicalTrialProtocol.
  End Associations and related methods
<p>

=cut

# Below is module documentation for Pathway

=pod

=head1 Pathway

  CaCORE::CaBIO::Pathway - Perl extension for Pathway.

=head2 Abstract

  The CaCORE::CaBIO::bean::Pathway is a Perl object representation of the
  caBIO generic object.

=head2 Description

  An object representation of a molecular/cellular pathway compiled by BioCarta. Pathways are associated with specific Taxon objects, and contain multiple Gene objects, which may be Targets for treatment.

=head3 Attributes of Pathway

  The following are all the attributes of the Pathway object and their data types:

	description	string
	diagram	string
	name	string
	id	long
	displayValue	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of Pathway

  The following are all the objects that are associated with the Pathway:

=for html
<pre>
	<a href="#gene">Gene</a>: 	One to many assoication, use getGeneCollection to get a collection of associated Gene.
	<a href="#histopathology">Histopathology</a>: 	One to many assoication, use getHistopathologyCollection to get a collection of associated Histopathology.
	<a href="#taxon">Taxon</a>: 	Many to one assoication, use getTaxon to get the associated Taxon.
  End Associations and related methods
<p>

=cut

# Below is module documentation for OrganOntology

=pod

=head1 OrganOntology

  CaCORE::CaBIO::OrganOntology - Perl extension for OrganOntology.

=head2 Abstract

  The CaCORE::CaBIO::bean::OrganOntology is a Perl object representation of the
  caBIO generic object.

=head2 Description

  A representation of an organ whose name occurs in a controlled vocabulary; provides access to any Histopathology objects for the organ, and, because it is $quot;ontolog-able,$quot; provides access to its ancestral and descendant terms in the vocabulary.

=head3 Attributes of OrganOntology

  The following are all the attributes of the OrganOntology object and their data types:

	name	string
	id	long
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of OrganOntology

  The following are all the objects that are associated with the OrganOntology:

=for html
<pre>
	<a href="#parentorganontologyrelationship">ParentOrganOntologyRelationship</a>: 	One to many assoication, use getParentOrganOntologyRelationshipCollection to get a collection of associated ParentOrganOntologyRelationship.
	<a href="#gene">Gene</a>: 	One to many assoication, use getGeneCollection to get a collection of associated Gene.
	<a href="#expressionfeature">ExpressionFeature</a>: 	One to many assoication, use getExpressionFeatureCollection to get a collection of associated ExpressionFeature.
	<a href="#histopathology">Histopathology</a>: 	One to many assoication, use getHistopathologyCollection to get a collection of associated Histopathology.
	<a href="#childorganontologyrelationship">ChildOrganOntologyRelationship</a>: 	One to many assoication, use getChildOrganOntologyRelationshipCollection to get a collection of associated ChildOrganOntologyRelationship.
	<a href="#anomaly">Anomaly</a>: 	One to many assoication, use getAnomalyCollection to get a collection of associated Anomaly.
  End Associations and related methods
<p>

=cut

# Below is module documentation for OrganOntologyRelationship

=pod

=head1 OrganOntologyRelationship

  CaCORE::CaBIO::OrganOntologyRelationship - Perl extension for OrganOntologyRelationship.

=head2 Abstract

  The CaCORE::CaBIO::bean::OrganOntologyRelationship is a Perl object representation of the
  caBIO generic object.

=head2 Description

  Organ relationship object describes relationships among organs.

=head3 Attributes of OrganOntologyRelationship

  The following are all the attributes of the OrganOntologyRelationship object and their data types:

	type	string
	id	long
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of OrganOntologyRelationship

  The following are all the objects that are associated with the OrganOntologyRelationship:

=for html
<pre>
	<a href="#childorganontology">ChildOrganOntology</a>: 	Many to one assoication, use getChildOrganOntology to get the associated ChildOrganOntology.
	<a href="#parentorganontology">ParentOrganOntology</a>: 	Many to one assoication, use getParentOrganOntology to get the associated ParentOrganOntology.
  End Associations and related methods
<p>

=cut

# Below is module documentation for Histopathology

=pod

=head1 Histopathology

  CaCORE::CaBIO::Histopathology - Perl extension for Histopathology.

=head2 Abstract

  The CaCORE::CaBIO::bean::Histopathology is a Perl object representation of the
  caBIO generic object.

=head2 Description

  An object representing anatomical changes in a diseased tissue sample associated with an expression experiment; captures the relationship between organ and disease.

=head3 Attributes of Histopathology

  The following are all the attributes of the Histopathology object and their data types:

	comments	string
	relationalOperation	string
	tumorIncidenceRate	float
	ageOfOnset	string
	id	long
	microscopicDescription	string
	grossDescription	string
	survivalInfo	string
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of Histopathology

  The following are all the objects that are associated with the Histopathology:

=for html
<pre>
	<a href="#metastasis">Metastasis</a>: 	One to many assoication, use getMetastasisCollection to get a collection of associated Metastasis.
	<a href="#gene">Gene</a>: 	One to many assoication, use getGeneCollection to get a collection of associated Gene.
	<a href="#library">Library</a>: 	One to many assoication, use getLibraryCollection to get a collection of associated Library.
	<a href="#diseaseontology">DiseaseOntology</a>: 	Many to one assoication, use getDiseaseOntology to get the associated DiseaseOntology.
	<a href="#organontology">OrganOntology</a>: 	Many to one assoication, use getOrganOntology to get the associated OrganOntology.
	<a href="#clinicaltrialprotocol">ClinicalTrialProtocol</a>: 	One to many assoication, use getClinicalTrialProtocolCollection to get a collection of associated ClinicalTrialProtocol.
	<a href="#anomaly">Anomaly</a>: 	One to many assoication, use getAnomalyCollection to get a collection of associated Anomaly.
  End Associations and related methods
<p>

=cut

# Below is module documentation for GeneOntology

=pod

=head1 GeneOntology

  CaCORE::CaBIO::GeneOntology - Perl extension for GeneOntology.

=head2 Abstract

  The CaCORE::CaBIO::bean::GeneOntology is a Perl object representation of the
  caBIO generic object.

=head2 Description

  An object providing entry to a Gene object's position in the Gene Ontology Consortium's controlled vocabularies, as recorded by LocusLink; provides access to gene objects corresponding to the ontological term, as well as to ancestor and descendant terms in the ontology tree.

=head3 Attributes of GeneOntology

  The following are all the attributes of the GeneOntology object and their data types:

	name	string
	id	long
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of GeneOntology

  The following are all the objects that are associated with the GeneOntology:

=for html
<pre>
	<a href="#childgeneontologyrelationship">ChildGeneOntologyRelationship</a>: 	One to many assoication, use getChildGeneOntologyRelationshipCollection to get a collection of associated ChildGeneOntologyRelationship.
	<a href="#gene">Gene</a>: 	One to many assoication, use getGeneCollection to get a collection of associated Gene.
	<a href="#parentgeneontologyrelationship">ParentGeneOntologyRelationship</a>: 	One to many assoication, use getParentGeneOntologyRelationshipCollection to get a collection of associated ParentGeneOntologyRelationship.
  End Associations and related methods
<p>

=cut

# Below is module documentation for GeneOntologyRelationship

=pod

=head1 GeneOntologyRelationship

  CaCORE::CaBIO::GeneOntologyRelationship - Perl extension for GeneOntologyRelationship.

=head2 Abstract

  The CaCORE::CaBIO::bean::GeneOntologyRelationship is a Perl object representation of the
  caBIO generic object.

=head2 Description

  This object specifies GoOntologyrRelationship.

=head3 Attributes of GeneOntologyRelationship

  The following are all the attributes of the GeneOntologyRelationship object and their data types:

	relationshipType	string
	id	long
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of GeneOntologyRelationship

  The following are all the objects that are associated with the GeneOntologyRelationship:

=for html
<pre>
	<a href="#parentgeneontology">ParentGeneOntology</a>: 	Many to one assoication, use getParentGeneOntology to get the associated ParentGeneOntology.
	<a href="#childgeneontology">ChildGeneOntology</a>: 	Many to one assoication, use getChildGeneOntology to get the associated ChildGeneOntology.
  End Associations and related methods
<p>

=cut

# Below is module documentation for DiseaseOntologyRelationship

=pod

=head1 DiseaseOntologyRelationship

  CaCORE::CaBIO::DiseaseOntologyRelationship - Perl extension for DiseaseOntologyRelationship.

=head2 Abstract

  The CaCORE::CaBIO::bean::DiseaseOntologyRelationship is a Perl object representation of the
  caBIO generic object.

=head2 Description

  The diseaser relationship specifies the relationship among diseases.

=head3 Attributes of DiseaseOntologyRelationship

  The following are all the attributes of the DiseaseOntologyRelationship object and their data types:

	type	string
	id	long
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of DiseaseOntologyRelationship

  The following are all the objects that are associated with the DiseaseOntologyRelationship:

=for html
<pre>
	<a href="#childdiseaseontology">ChildDiseaseOntology</a>: 	Many to one assoication, use getChildDiseaseOntology to get the associated ChildDiseaseOntology.
	<a href="#parentdiseaseontology">ParentDiseaseOntology</a>: 	Many to one assoication, use getParentDiseaseOntology to get the associated ParentDiseaseOntology.
  End Associations and related methods
<p>

=cut

# Below is module documentation for Anomaly

=pod

=head1 Anomaly

  CaCORE::CaBIO::Anomaly - Perl extension for Anomaly.

=head2 Abstract

  The CaCORE::CaBIO::bean::Anomaly is a Perl object representation of the
  caBIO generic object.

=head2 Description

  An irregularity in either the expression of a gene or its structure (i.e., a mutation).

=head3 Attributes of Anomaly

  The following are all the attributes of the Anomaly object and their data types:

	description	string
	id	long
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of Anomaly

  The following are all the objects that are associated with the Anomaly:

=for html
<pre>
	<a href="#organontology">OrganOntology</a>: 	One to many assoication, use getOrganOntologyCollection to get a collection of associated OrganOntology.
	<a href="#histopathology">Histopathology</a>: 	Many to one assoication, use getHistopathology to get the associated Histopathology.
	<a href="#vocabulary">Vocabulary</a>: 	One to many assoication, use getVocabularyCollection to get a collection of associated Vocabulary.
  End Associations and related methods
<p>

=cut

# Below is module documentation for PopulationFrequency

=pod

=head1 PopulationFrequency

  CaCORE::CaBIO::PopulationFrequency - Perl extension for PopulationFrequency.

=head2 Abstract

  The CaCORE::CaBIO::bean::PopulationFrequency is a Perl object representation of the
  caBIO generic object.

=head2 Description

  

=head3 Attributes of PopulationFrequency

  The following are all the attributes of the PopulationFrequency object and their data types:

	majorFrequency	double
	type	string
	minorAllele	string
	ethnicity	string
	minorFrequency	double
	majorAllele	string
	id	long
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of PopulationFrequency

  The following are all the objects that are associated with the PopulationFrequency:

=for html
<pre>
	<a href="#snp">SNP</a>: 	Many to one assoication, use getSNP to get the associated SNP.
  End Associations and related methods
<p>

=cut

# Below is module documentation for ProteinSequence

=pod

=head1 ProteinSequence

  CaCORE::CaBIO::ProteinSequence - Perl extension for ProteinSequence.

=head2 Abstract

  The CaCORE::CaBIO::bean::ProteinSequence is a Perl object representation of the
  caBIO generic object.

=head2 Description

  

=head3 Attributes of ProteinSequence

  The following are all the attributes of the ProteinSequence object and their data types:

	checkSum	string
	value	string
	molecularWeightInDaltons	double
	length	long
	id	long
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of ProteinSequence

  The following are all the objects that are associated with the ProteinSequence:

=for html
<pre>
	<a href="#protein">Protein</a>: 	Many to one assoication, use getProtein to get the associated Protein.
  End Associations and related methods
<p>

=cut

# Below is module documentation for Protein

=pod

=head1 Protein

  CaCORE::CaBIO::Protein - Perl extension for Protein.

=head2 Abstract

  The CaCORE::CaBIO::bean::Protein is a Perl object representation of the
  caBIO generic object.

=head2 Description

  

=head3 Attributes of Protein

  The following are all the attributes of the Protein object and their data types:

	copyrightStatement	string
	primaryAccession	string
	name	string
	uniProtCode	string
	id	long
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of Protein

  The following are all the objects that are associated with the Protein:

=for html
<pre>
	<a href="#taxon">Taxon</a>: 	One to many assoication, use getTaxonCollection to get a collection of associated Taxon.
	<a href="#gene">Gene</a>: 	One to many assoication, use getGeneCollection to get a collection of associated Gene.
	<a href="#secondaryaccession">SecondaryAccession</a>: 	One to many assoication, use getSecondaryAccessionCollection to get a collection of associated SecondaryAccession.
	<a href="#keywords">Keywords</a>: 	One to many assoication, use getKeywordsCollection to get a collection of associated Keywords.
	<a href="#proteinsequence">ProteinSequence</a>: 	Many to one assoication, use getProteinSequence to get the associated ProteinSequence.
	<a href="#proteinalias">ProteinAlias</a>: 	One to many assoication, use getProteinAliasCollection to get a collection of associated ProteinAlias.
  End Associations and related methods
<p>

=cut

# Below is module documentation for ProteinAlias

=pod

=head1 ProteinAlias

  CaCORE::CaBIO::ProteinAlias - Perl extension for ProteinAlias.

=head2 Abstract

  The CaCORE::CaBIO::bean::ProteinAlias is a Perl object representation of the
  caBIO generic object.

=head2 Description

  

=head3 Attributes of ProteinAlias

  The following are all the attributes of the ProteinAlias object and their data types:

	name	string
	id	long
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of ProteinAlias

  The following are all the objects that are associated with the ProteinAlias:

=for html
<pre>
	<a href="#protein">Protein</a>: 	One to many assoication, use getProteinCollection to get a collection of associated Protein.
  End Associations and related methods
<p>

=cut

# Below is module documentation for HomologousAssociation

=pod

=head1 HomologousAssociation

  CaCORE::CaBIO::HomologousAssociation - Perl extension for HomologousAssociation.

=head2 Abstract

  The CaCORE::CaBIO::bean::HomologousAssociation is a Perl object representation of the
  caBIO generic object.

=head2 Description

  

=head3 Attributes of HomologousAssociation

  The following are all the attributes of the HomologousAssociation object and their data types:

	similarityPercentage	float
	homologousId	long
	id	long
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of HomologousAssociation

  The following are all the objects that are associated with the HomologousAssociation:

=for html
<pre>
	<a href="#homologousgene">HomologousGene</a>: 	Many to one assoication, use getHomologousGene to get the associated HomologousGene.
  End Associations and related methods
<p>

=cut

# Below is module documentation for PhysicalLocation

=pod

=head1 PhysicalLocation

  CaCORE::CaBIO::PhysicalLocation - Perl extension for PhysicalLocation.

=head2 Abstract

  The CaCORE::CaBIO::bean::PhysicalLocation is a Perl object representation of the
  caBIO generic object.

=head2 Description

  

=head3 Attributes of PhysicalLocation

  The following are all the attributes of the PhysicalLocation object and their data types:

	chromosomalStartPosition	long
	chromosomalEndPosition	long
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of PhysicalLocation

  The following are all the objects that are associated with the PhysicalLocation:

=for html
<pre>
	<a href="#cytoband">Cytoband</a>: 	One to many assoication, use getCytobandCollection to get a collection of associated Cytoband.
  End Associations and related methods
<p>

=cut

# Below is module documentation for Cytoband

=pod

=head1 Cytoband

  CaCORE::CaBIO::Cytoband - Perl extension for Cytoband.

=head2 Abstract

  The CaCORE::CaBIO::bean::Cytoband is a Perl object representation of the
  caBIO generic object.

=head2 Description

  

=head3 Attributes of Cytoband

  The following are all the attributes of the Cytoband object and their data types:

	name	string
	id	long
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of Cytoband

  The following are all the objects that are associated with the Cytoband:

=for html
<pre>
	<a href="#physicallocation">PhysicalLocation</a>: 	Many to one assoication, use getPhysicalLocation to get the associated PhysicalLocation.
  End Associations and related methods
<p>

=cut

# Below is module documentation for CytogeneticLocation

=pod

=head1 CytogeneticLocation

  CaCORE::CaBIO::CytogeneticLocation - Perl extension for CytogeneticLocation.

=head2 Abstract

  The CaCORE::CaBIO::bean::CytogeneticLocation is a Perl object representation of the
  caBIO generic object.

=head2 Description

  

=head3 Attributes of CytogeneticLocation

  The following are all the attributes of the CytogeneticLocation object and their data types:

  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of CytogeneticLocation

  The following are all the objects that are associated with the CytogeneticLocation:

=for html
<pre>
	<a href="#startcytoband">StartCytoband</a>: 	Many to one assoication, use getStartCytoband to get the associated StartCytoband.
	<a href="#endcytoband">EndCytoband</a>: 	Many to one assoication, use getEndCytoband to get the associated EndCytoband.
  End Associations and related methods
<p>

=cut

# Below is module documentation for GeneRelativeLocation

=pod

=head1 GeneRelativeLocation

  CaCORE::CaBIO::GeneRelativeLocation - Perl extension for GeneRelativeLocation.

=head2 Abstract

  The CaCORE::CaBIO::bean::GeneRelativeLocation is a Perl object representation of the
  caBIO generic object.

=head2 Description

  

=head3 Attributes of GeneRelativeLocation

  The following are all the attributes of the GeneRelativeLocation object and their data types:

	type	string
	id	long
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of GeneRelativeLocation

  The following are all the objects that are associated with the GeneRelativeLocation:

=for html
<pre>
  End Associations and related methods
<p>

=cut

# Below is module documentation for GenericReporter

=pod

=head1 GenericReporter

  CaCORE::CaBIO::GenericReporter - Perl extension for GenericReporter.

=head2 Abstract

  The CaCORE::CaBIO::bean::GenericReporter is a Perl object representation of the
  caBIO generic object.

=head2 Description

  

=head3 Attributes of GenericReporter

  The following are all the attributes of the GenericReporter object and their data types:

	name	string
	type	string
	id	long
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of GenericReporter

  The following are all the objects that are associated with the GenericReporter:

=for html
<pre>
	<a href="#genericarray">GenericArray</a>: 	One to many assoication, use getGenericArrayCollection to get a collection of associated GenericArray.
  End Associations and related methods
<p>

=cut

# Below is module documentation for GenericArray

=pod

=head1 GenericArray

  CaCORE::CaBIO::GenericArray - Perl extension for GenericArray.

=head2 Abstract

  The CaCORE::CaBIO::bean::GenericArray is a Perl object representation of the
  caBIO generic object.

=head2 Description

  

=head3 Attributes of GenericArray

  The following are all the attributes of the GenericArray object and their data types:

	arrayName	string
	platform	string
	type	string
	id	long
  End Attributes
  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head3 Associations of GenericArray

  The following are all the objects that are associated with the GenericArray:

=for html
<pre>
	<a href="#genericreporter">GenericReporter</a>: 	One to many assoication, use getGenericReporterCollection to get a collection of associated GenericReporter.
  End Associations and related methods
<p>

=cut

