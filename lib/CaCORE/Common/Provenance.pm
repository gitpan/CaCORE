# ------------------------------------------------------------------------------------------
package CaCORE::Common::Provenance::SourceReference;

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

# create an instance of the SourceReference object
# returns: a SourceReference object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new SourceReference\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this SourceReference intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:SourceReferenceImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.provenance.common.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# sourceReferenceType;
	if( defined( $self->getSourceReferenceType ) ) {
		$tmpstr = "<sourceReferenceType xsi:type=\"xsd:string\">" . $self->getSourceReferenceType . "</sourceReferenceType>";
	} else {
		$tmpstr = "<sourceReferenceType xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# reference;
	if( defined( $self->getReference ) ) {
		$tmpstr = "<reference xsi:type=\"xsd:string\">" . $self->getReference . "</reference>";
	} else {
		$tmpstr = "<reference xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of SourceReference objects
# param: xml doc
# returns: list of SourceReference objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @SourceReferenceNodes = $root->getChildNodes;
	my $SourceReferenceLength = $#SourceReferenceNodes;
	#print "total bean count = $SourceReferenceLength\n";
	
	# parse all SourceReference nodes
	my @obj_list = ();
	foreach my $SourceReferenceNode (@SourceReferenceNodes) {
		#print "\tSourceReference\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $sourceReferenceType;
		my $reference;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($SourceReferenceNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "sourceReferenceType") {
				$sourceReferenceType=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "reference") {
				$reference=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::Common::Provenance::SourceReference;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setSourceReferenceType($sourceReferenceType);
		$newobj->setReference($reference);
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

sub getSourceReferenceType {
	my $self = shift;
	return $self->{sourceReferenceType};
}

sub setSourceReferenceType {
	my $self = shift;
	$self->{sourceReferenceType} = shift;
}

sub getReference {
	my $self = shift;
	return $self->{reference};
}

sub setReference {
	my $self = shift;
	$self->{reference} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getProvenanceCollection {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::Common::Provenance::Provenance", $self);
	return @results;
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::Common::Provenance::Source;

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

# create an instance of the Source object
# returns: a Source object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Source\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Source intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:SourceImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.provenance.common.nci.nih.gov\">";
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

# parse a given xml, construct a list of Source objects
# param: xml doc
# returns: list of Source objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @SourceNodes = $root->getChildNodes;
	my $SourceLength = $#SourceNodes;
	#print "total bean count = $SourceLength\n";
	
	# parse all Source nodes
	my @obj_list = ();
	foreach my $SourceNode (@SourceNodes) {
		#print "\tSource\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $name;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($SourceNode->getChildNodes) {
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
		my $newobj = new CaCORE::Common::Provenance::Source;
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
package CaCORE::Common::Provenance::Provenance;

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

# create an instance of the Provenance object
# returns: a Provenance object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new Provenance\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this Provenance intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:ProvenanceImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.provenance.common.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# transformation;
	if( defined( $self->getTransformation ) ) {
		$tmpstr = "<transformation xsi:type=\"xsd:string\">" . $self->getTransformation . "</transformation>";
	} else {
		$tmpstr = "<transformation xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# evidenceCode;
	if( defined( $self->getEvidenceCode ) ) {
		$tmpstr = "<evidenceCode xsi:type=\"xsd:string\">" . $self->getEvidenceCode . "</evidenceCode>";
	} else {
		$tmpstr = "<evidenceCode xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of Provenance objects
# param: xml doc
# returns: list of Provenance objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @ProvenanceNodes = $root->getChildNodes;
	my $ProvenanceLength = $#ProvenanceNodes;
	#print "total bean count = $ProvenanceLength\n";
	
	# parse all Provenance nodes
	my @obj_list = ();
	foreach my $ProvenanceNode (@ProvenanceNodes) {
		#print "\tProvenance\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $transformation;
		my $evidenceCode;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($ProvenanceNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "transformation") {
				$transformation=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "evidenceCode") {
				$evidenceCode=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::Common::Provenance::Provenance;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setTransformation($transformation);
		$newobj->setEvidenceCode($evidenceCode);
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

sub getTransformation {
	my $self = shift;
	return $self->{transformation};
}

sub setTransformation {
	my $self = shift;
	$self->{transformation} = shift;
}

sub getEvidenceCode {
	my $self = shift;
	return $self->{evidenceCode};
}

sub setEvidenceCode {
	my $self = shift;
	$self->{evidenceCode} = shift;
}

## end getters and setters ##

## begin bean association methods ##

sub getSourceReference {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::Common::Provenance::SourceReference", $self);
	return $results[0];
}

sub getOriginalSource {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::Common::Provenance::OriginalSource", $self);
	return $results[0];
}

sub getImmediateSource {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::Common::Provenance::ImmediateSource", $self);
	return $results[0];
}

sub getSupplyingSource {
	my $self = shift;
	my $appSvc = CaCORE::ApplicationService->instance();
	my @results = $appSvc->queryObject("CaCORE::Common::Provenance::SupplyingSource", $self);
	return $results[0];
}

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::Common::Provenance::URLSourceReference;

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

# create an instance of the URLSourceReference object
# returns: a URLSourceReference object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new URLSourceReference\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this URLSourceReference intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:URLSourceReferenceImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.provenance.common.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# sourceURL;
	if( defined( $self->getSourceURL ) ) {
		$tmpstr = "<sourceURL xsi:type=\"xsd:string\">" . $self->getSourceURL . "</sourceURL>";
	} else {
		$tmpstr = "<sourceURL xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# sourceReferenceType;
	if( defined( $self->getSourceReferenceType ) ) {
		$tmpstr = "<sourceReferenceType xsi:type=\"xsd:string\">" . $self->getSourceReferenceType . "</sourceReferenceType>";
	} else {
		$tmpstr = "<sourceReferenceType xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# reference;
	if( defined( $self->getReference ) ) {
		$tmpstr = "<reference xsi:type=\"xsd:string\">" . $self->getReference . "</reference>";
	} else {
		$tmpstr = "<reference xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of URLSourceReference objects
# param: xml doc
# returns: list of URLSourceReference objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @URLSourceReferenceNodes = $root->getChildNodes;
	my $URLSourceReferenceLength = $#URLSourceReferenceNodes;
	#print "total bean count = $URLSourceReferenceLength\n";
	
	# parse all URLSourceReference nodes
	my @obj_list = ();
	foreach my $URLSourceReferenceNode (@URLSourceReferenceNodes) {
		#print "\tURLSourceReference\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $sourceURL;
		my $sourceReferenceType;
		my $reference;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($URLSourceReferenceNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "sourceURL") {
				$sourceURL=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "sourceReferenceType") {
				$sourceReferenceType=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "reference") {
				$reference=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::Common::Provenance::URLSourceReference;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setSourceURL($sourceURL);
		$newobj->setSourceReferenceType($sourceReferenceType);
		$newobj->setReference($reference);
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

sub getSourceURL {
	my $self = shift;
	return $self->{sourceURL};
}

sub setSourceURL {
	my $self = shift;
	$self->{sourceURL} = shift;
}

sub getSourceReferenceType {
	my $self = shift;
	return $self->{sourceReferenceType};
}

sub setSourceReferenceType {
	my $self = shift;
	$self->{sourceReferenceType} = shift;
}

sub getReference {
	my $self = shift;
	return $self->{reference};
}

sub setReference {
	my $self = shift;
	$self->{reference} = shift;
}

## end getters and setters ##

## begin bean association methods ##

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::Common::Provenance::PublicationSource;

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

# create an instance of the PublicationSource object
# returns: a PublicationSource object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new PublicationSource\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this PublicationSource intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:PublicationSourceImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.provenance.common.nci.nih.gov\">";
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
		$tmpstr = "<volume xsi:type=\"xsd:int\">" . $self->getVolume . "</volume>";
	} else {
		$tmpstr = "<volume xsi:type=\"xsd:int\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# endPage;
	if( defined( $self->getEndPage ) ) {
		$tmpstr = "<endPage xsi:type=\"xsd:int\">" . $self->getEndPage . "</endPage>";
	} else {
		$tmpstr = "<endPage xsi:type=\"xsd:int\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# year;
	if( defined( $self->getYear ) ) {
		$tmpstr = "<year xsi:type=\"xsd:int\">" . $self->getYear . "</year>";
	} else {
		$tmpstr = "<year xsi:type=\"xsd:int\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# title;
	if( defined( $self->getTitle ) ) {
		$tmpstr = "<title xsi:type=\"xsd:string\">" . $self->getTitle . "</title>";
	} else {
		$tmpstr = "<title xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# startPage;
	if( defined( $self->getStartPage ) ) {
		$tmpstr = "<startPage xsi:type=\"xsd:int\">" . $self->getStartPage . "</startPage>";
	} else {
		$tmpstr = "<startPage xsi:type=\"xsd:int\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# authors;
	if( defined( $self->getAuthors ) ) {
		$tmpstr = "<authors xsi:type=\"xsd:string\">" . $self->getAuthors . "</authors>";
	} else {
		$tmpstr = "<authors xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of PublicationSource objects
# param: xml doc
# returns: list of PublicationSource objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @PublicationSourceNodes = $root->getChildNodes;
	my $PublicationSourceLength = $#PublicationSourceNodes;
	#print "total bean count = $PublicationSourceLength\n";
	
	# parse all PublicationSource nodes
	my @obj_list = ();
	foreach my $PublicationSourceNode (@PublicationSourceNodes) {
		#print "\tPublicationSource\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $volume;
		my $endPage;
		my $year;
		my $title;
		my $startPage;
		my $authors;
		my $name;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($PublicationSourceNode->getChildNodes) {
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
			elsif ($childrenNode->getNodeName eq "startPage") {
				$startPage=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "authors") {
				$authors=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::Common::Provenance::PublicationSource;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setVolume($volume);
		$newobj->setEndPage($endPage);
		$newobj->setYear($year);
		$newobj->setTitle($title);
		$newobj->setStartPage($startPage);
		$newobj->setAuthors($authors);
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

sub getStartPage {
	my $self = shift;
	return $self->{startPage};
}

sub setStartPage {
	my $self = shift;
	$self->{startPage} = shift;
}

sub getAuthors {
	my $self = shift;
	return $self->{authors};
}

sub setAuthors {
	my $self = shift;
	$self->{authors} = shift;
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
package CaCORE::Common::Provenance::ResearchInstitutionSource;

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

# create an instance of the ResearchInstitutionSource object
# returns: a ResearchInstitutionSource object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new ResearchInstitutionSource\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this ResearchInstitutionSource intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:ResearchInstitutionSourceImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.provenance.common.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# institutionPersons;
	if( defined( $self->getInstitutionPersons ) ) {
		$tmpstr = "<institutionPersons xsi:type=\"xsd:string\">" . $self->getInstitutionPersons . "</institutionPersons>";
	} else {
		$tmpstr = "<institutionPersons xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# institutionAddress;
	if( defined( $self->getInstitutionAddress ) ) {
		$tmpstr = "<institutionAddress xsi:type=\"xsd:string\">" . $self->getInstitutionAddress . "</institutionAddress>";
	} else {
		$tmpstr = "<institutionAddress xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# institutionDepartment;
	if( defined( $self->getInstitutionDepartment ) ) {
		$tmpstr = "<institutionDepartment xsi:type=\"xsd:string\">" . $self->getInstitutionDepartment . "</institutionDepartment>";
	} else {
		$tmpstr = "<institutionDepartment xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# institutionName;
	if( defined( $self->getInstitutionName ) ) {
		$tmpstr = "<institutionName xsi:type=\"xsd:string\">" . $self->getInstitutionName . "</institutionName>";
	} else {
		$tmpstr = "<institutionName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of ResearchInstitutionSource objects
# param: xml doc
# returns: list of ResearchInstitutionSource objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @ResearchInstitutionSourceNodes = $root->getChildNodes;
	my $ResearchInstitutionSourceLength = $#ResearchInstitutionSourceNodes;
	#print "total bean count = $ResearchInstitutionSourceLength\n";
	
	# parse all ResearchInstitutionSource nodes
	my @obj_list = ();
	foreach my $ResearchInstitutionSourceNode (@ResearchInstitutionSourceNodes) {
		#print "\tResearchInstitutionSource\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $institutionPersons;
		my $institutionAddress;
		my $institutionDepartment;
		my $institutionName;
		my $name;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($ResearchInstitutionSourceNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "institutionPersons") {
				$institutionPersons=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "institutionAddress") {
				$institutionAddress=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "institutionDepartment") {
				$institutionDepartment=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "institutionName") {
				$institutionName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::Common::Provenance::ResearchInstitutionSource;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setInstitutionPersons($institutionPersons);
		$newobj->setInstitutionAddress($institutionAddress);
		$newobj->setInstitutionDepartment($institutionDepartment);
		$newobj->setInstitutionName($institutionName);
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

sub getInstitutionPersons {
	my $self = shift;
	return $self->{institutionPersons};
}

sub setInstitutionPersons {
	my $self = shift;
	$self->{institutionPersons} = shift;
}

sub getInstitutionAddress {
	my $self = shift;
	return $self->{institutionAddress};
}

sub setInstitutionAddress {
	my $self = shift;
	$self->{institutionAddress} = shift;
}

sub getInstitutionDepartment {
	my $self = shift;
	return $self->{institutionDepartment};
}

sub setInstitutionDepartment {
	my $self = shift;
	$self->{institutionDepartment} = shift;
}

sub getInstitutionName {
	my $self = shift;
	return $self->{institutionName};
}

sub setInstitutionName {
	my $self = shift;
	$self->{institutionName} = shift;
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
package CaCORE::Common::Provenance::WebServicesSourceReference;

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

# create an instance of the WebServicesSourceReference object
# returns: a WebServicesSourceReference object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new WebServicesSourceReference\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this WebServicesSourceReference intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:WebServicesSourceReferenceImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.provenance.common.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# request;
	if( defined( $self->getRequest ) ) {
		$tmpstr = "<request xsi:type=\"xsd:string\">" . $self->getRequest . "</request>";
	} else {
		$tmpstr = "<request xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# sourceReferenceType;
	if( defined( $self->getSourceReferenceType ) ) {
		$tmpstr = "<sourceReferenceType xsi:type=\"xsd:string\">" . $self->getSourceReferenceType . "</sourceReferenceType>";
	} else {
		$tmpstr = "<sourceReferenceType xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# reference;
	if( defined( $self->getReference ) ) {
		$tmpstr = "<reference xsi:type=\"xsd:string\">" . $self->getReference . "</reference>";
	} else {
		$tmpstr = "<reference xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of WebServicesSourceReference objects
# param: xml doc
# returns: list of WebServicesSourceReference objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @WebServicesSourceReferenceNodes = $root->getChildNodes;
	my $WebServicesSourceReferenceLength = $#WebServicesSourceReferenceNodes;
	#print "total bean count = $WebServicesSourceReferenceLength\n";
	
	# parse all WebServicesSourceReference nodes
	my @obj_list = ();
	foreach my $WebServicesSourceReferenceNode (@WebServicesSourceReferenceNodes) {
		#print "\tWebServicesSourceReference\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $request;
		my $sourceReferenceType;
		my $reference;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($WebServicesSourceReferenceNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "request") {
				$request=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "sourceReferenceType") {
				$sourceReferenceType=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "reference") {
				$reference=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::Common::Provenance::WebServicesSourceReference;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setRequest($request);
		$newobj->setSourceReferenceType($sourceReferenceType);
		$newobj->setReference($reference);
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

sub getRequest {
	my $self = shift;
	return $self->{request};
}

sub setRequest {
	my $self = shift;
	$self->{request} = shift;
}

sub getSourceReferenceType {
	my $self = shift;
	return $self->{sourceReferenceType};
}

sub setSourceReferenceType {
	my $self = shift;
	$self->{sourceReferenceType} = shift;
}

sub getReference {
	my $self = shift;
	return $self->{reference};
}

sub setReference {
	my $self = shift;
	$self->{reference} = shift;
}

## end getters and setters ##

## begin bean association methods ##

## end bean association methods ##

1;
#end
# ------------------------------------------------------------------------------------------
package CaCORE::Common::Provenance::InternetSource;

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

# create an instance of the InternetSource object
# returns: a InternetSource object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new InternetSource\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this InternetSource intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:InternetSourceImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.provenance.common.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# ownerInstitution;
	if( defined( $self->getOwnerInstitution ) ) {
		$tmpstr = "<ownerInstitution xsi:type=\"xsd:string\">" . $self->getOwnerInstitution . "</ownerInstitution>";
	} else {
		$tmpstr = "<ownerInstitution xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# sourceURI;
	if( defined( $self->getSourceURI ) ) {
		$tmpstr = "<sourceURI xsi:type=\"xsd:string\">" . $self->getSourceURI . "</sourceURI>";
	} else {
		$tmpstr = "<sourceURI xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# ownerPersons;
	if( defined( $self->getOwnerPersons ) ) {
		$tmpstr = "<ownerPersons xsi:type=\"xsd:string\">" . $self->getOwnerPersons . "</ownerPersons>";
	} else {
		$tmpstr = "<ownerPersons xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of InternetSource objects
# param: xml doc
# returns: list of InternetSource objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @InternetSourceNodes = $root->getChildNodes;
	my $InternetSourceLength = $#InternetSourceNodes;
	#print "total bean count = $InternetSourceLength\n";
	
	# parse all InternetSource nodes
	my @obj_list = ();
	foreach my $InternetSourceNode (@InternetSourceNodes) {
		#print "\tInternetSource\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $ownerInstitution;
		my $sourceURI;
		my $ownerPersons;
		my $name;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($InternetSourceNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "ownerInstitution") {
				$ownerInstitution=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "sourceURI") {
				$sourceURI=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "ownerPersons") {
				$ownerPersons=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "name") {
				$name=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::Common::Provenance::InternetSource;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setOwnerInstitution($ownerInstitution);
		$newobj->setSourceURI($sourceURI);
		$newobj->setOwnerPersons($ownerPersons);
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

sub getOwnerInstitution {
	my $self = shift;
	return $self->{ownerInstitution};
}

sub setOwnerInstitution {
	my $self = shift;
	$self->{ownerInstitution} = shift;
}

sub getSourceURI {
	my $self = shift;
	return $self->{sourceURI};
}

sub setSourceURI {
	my $self = shift;
	$self->{sourceURI} = shift;
}

sub getOwnerPersons {
	my $self = shift;
	return $self->{ownerPersons};
}

sub setOwnerPersons {
	my $self = shift;
	$self->{ownerPersons} = shift;
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
# Below is module documentation for SourceReference

=pod

=head1 SourceReference

CaCORE::Common::Provenance::SourceReference - Perl extension for SourceReference.

=head2 Abstract

The CaCORE::Common::Provenance::SourceReference is a Perl object representation of the
caBIO SourceReference object.

=head2 Description

A reference (an electronic reference, publication citation, etc.) to the untransformed data at a source.

=head2 Attributes of SourceReference

The following are all the attributes of the SourceReference object and their data types:

=over 4

=item sourceReferenceType

data type: C<string>

=item id

data type: C<long>

=item reference

data type: C<string>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of SourceReference

The following are all the objects that are associated with the SourceReference:

=over 4

=item L<"Provenance">: 	

One to many assoication, use C<getProvenanceCollection> to get a collection of associated Provenance.

  End Associations and related methods

=back

=cut

# Below is module documentation for Source

=pod

=head1 Source

CaCORE::Common::Provenance::Source - Perl extension for Source.

=head2 Abstract

The CaCORE::Common::Provenance::Source is a Perl object representation of the
caBIO Source object.

=head2 Description

An abstract class representing a source. Will be subclassed into a variety of specialized classes.

=head2 Attributes of Source

The following are all the attributes of the Source object and their data types:

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

=head2 Associations of Source

The following are all the objects that are associated with the Source:

=over 4

  End Associations and related methods

=back

=cut

# Below is module documentation for Provenance

=pod

=head1 Provenance

CaCORE::Common::Provenance::Provenance - Perl extension for Provenance.

=head2 Abstract

The CaCORE::Common::Provenance::Provenance is a Perl object representation of the
caBIO Provenance object.

=head2 Description

A record describing the source of an assertion (datum) contained in an object.

=head2 Attributes of Provenance

The following are all the attributes of the Provenance object and their data types:

=over 4

=item transformation

data type: C<string>

=item evidenceCode

data type: C<string>

=item id

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of Provenance

The following are all the objects that are associated with the Provenance:

=over 4

=item L<"SourceReference">: 	

Many to one assoication, use C<getSourceReference> to get the associated SourceReference.

=item L<"OriginalSource">: 	

Many to one assoication, use C<getOriginalSource> to get the associated OriginalSource.

=item L<"ImmediateSource">: 	

Many to one assoication, use C<getImmediateSource> to get the associated ImmediateSource.

=item L<"SupplyingSource">: 	

Many to one assoication, use C<getSupplyingSource> to get the associated SupplyingSource.

  End Associations and related methods

=back

=cut

# Below is module documentation for URLSourceReference

=pod

=head1 URLSourceReference

CaCORE::Common::Provenance::URLSourceReference - Perl extension for URLSourceReference.

=head2 Abstract

The CaCORE::Common::Provenance::URLSourceReference is a Perl object representation of the
caBIO URLSourceReference object.

=head2 Description

An implementation of the abstract SourceReference that contains a URL to the original information.

=head2 Attributes of URLSourceReference

The following are all the attributes of the URLSourceReference object and their data types:

=over 4

=item sourceURL

data type: C<string>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of URLSourceReference

The following are all the objects that are associated with the URLSourceReference:

=over 4

  End Associations and related methods

=back

=cut

# Below is module documentation for PublicationSource

=pod

=head1 PublicationSource

CaCORE::Common::Provenance::PublicationSource - Perl extension for PublicationSource.

=head2 Abstract

The CaCORE::Common::Provenance::PublicationSource is a Perl object representation of the
caBIO PublicationSource object.

=head2 Description

An implementing subclass of Source. Describes a source for which an electronic online version is not available, but for which a printed version of the data is available.

=head2 Attributes of PublicationSource

The following are all the attributes of the PublicationSource object and their data types:

=over 4

=item volume

data type: C<int>

=item endPage

data type: C<int>

=item year

data type: C<int>

=item title

data type: C<string>

=item startPage

data type: C<int>

=item authors

data type: C<string>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of PublicationSource

The following are all the objects that are associated with the PublicationSource:

=over 4

  End Associations and related methods

=back

=cut

# Below is module documentation for ResearchInstitutionSource

=pod

=head1 ResearchInstitutionSource

CaCORE::Common::Provenance::ResearchInstitutionSource - Perl extension for ResearchInstitutionSource.

=head2 Abstract

The CaCORE::Common::Provenance::ResearchInstitutionSource is a Perl object representation of the
caBIO ResearchInstitutionSource object.

=head2 Description

An implementing subclass of Source that describes a research institution (commercial, academic, or government). This is used for information with attribution, but that lack an online electronic format.

=head2 Attributes of ResearchInstitutionSource

The following are all the attributes of the ResearchInstitutionSource object and their data types:

=over 4

=item institutionPersons

data type: C<string>

=item institutionAddress

data type: C<string>

=item institutionDepartment

data type: C<string>

=item institutionName

data type: C<string>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of ResearchInstitutionSource

The following are all the objects that are associated with the ResearchInstitutionSource:

=over 4

  End Associations and related methods

=back

=cut

# Below is module documentation for WebServicesSourceReference

=pod

=head1 WebServicesSourceReference

CaCORE::Common::Provenance::WebServicesSourceReference - Perl extension for WebServicesSourceReference.

=head2 Abstract

The CaCORE::Common::Provenance::WebServicesSourceReference is a Perl object representation of the
caBIO WebServicesSourceReference object.

=head2 Description



=head2 Attributes of WebServicesSourceReference

The following are all the attributes of the WebServicesSourceReference object and their data types:

=over 4

=item request

data type: C<string>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of WebServicesSourceReference

The following are all the objects that are associated with the WebServicesSourceReference:

=over 4

  End Associations and related methods

=back

=cut

# Below is module documentation for InternetSource

=pod

=head1 InternetSource

CaCORE::Common::Provenance::InternetSource - Perl extension for InternetSource.

=head2 Abstract

The CaCORE::Common::Provenance::InternetSource is a Perl object representation of the
caBIO InternetSource object.

=head2 Description



=head2 Attributes of InternetSource

The following are all the attributes of the InternetSource object and their data types:

=over 4

=item ownerInstitution

data type: C<string>

=item sourceURI

data type: C<string>

=item ownerPersons

data type: C<string>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of InternetSource

The following are all the objects that are associated with the InternetSource:

=over 4

  End Associations and related methods

=back

=cut

