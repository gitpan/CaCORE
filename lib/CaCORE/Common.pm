# ------------------------------------------------------------------------------------------
package CaCORE::Common::DatabaseCrossReference;

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

# create an instance of the DatabaseCrossReference object
# returns: a DatabaseCrossReference object
sub new {
	my $class = shift;
	my $self = {};
	bless($self, $class);
	#print "new DatabaseCrossReference\n";
	return $self;
}

# Construct the specific section of the WSDL request corresponding
# to this DatabaseCrossReference intance
# returns: XML in string format
sub toWebserviceXML {
	my $self = shift;
	
	# prefix portion of the xml
	my $str = "<multiRef id=\"id0\" soapenc:root=\"0\" soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xsi:type=\"ns2:DatabaseCrossReferenceImpl\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:ns2=\"urn:ws.domain.common.nci.nih.gov\">";
	my $tmpstr = "";
	
	## begin attribute to XML ##
	# id
	if( defined( $self->getId ) ) {
		$tmpstr = "<id xsi:type=\"xsd:long\">" . $self->getId . "</id>";
	} else {
		$tmpstr = "<id xsi:type=\"xsd:long\" xsi:nil=\"true\" />";
	}
	$str = $str . $tmpstr;
	
	# dataSourceName;
	if( defined( $self->getDataSourceName ) ) {
		$tmpstr = "<dataSourceName xsi:type=\"xsd:string\">" . $self->getDataSourceName . "</dataSourceName>";
	} else {
		$tmpstr = "<dataSourceName xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# summary;
	if( defined( $self->getSummary ) ) {
		$tmpstr = "<summary xsi:type=\"xsd:string\">" . $self->getSummary . "</summary>";
	} else {
		$tmpstr = "<summary xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# crossReferenceId;
	if( defined( $self->getCrossReferenceId ) ) {
		$tmpstr = "<crossReferenceId xsi:type=\"xsd:string\">" . $self->getCrossReferenceId . "</crossReferenceId>";
	} else {
		$tmpstr = "<crossReferenceId xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# type;
	if( defined( $self->getType ) ) {
		$tmpstr = "<type xsi:type=\"xsd:string\">" . $self->getType . "</type>";
	} else {
		$tmpstr = "<type xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
	}
	$str .= $tmpstr;

	# sourceType;
	if( defined( $self->getSourceType ) ) {
		$tmpstr = "<sourceType xsi:type=\"xsd:string\">" . $self->getSourceType . "</sourceType>";
	} else {
		$tmpstr = "<sourceType xsi:type=\"xsd:string\" xsi:nil=\"true\" />";
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

# parse a given xml, construct a list of DatabaseCrossReference objects
# param: xml doc
# returns: list of DatabaseCrossReference objects
sub fromWebserviceXML {
	my $parser = new XML::DOM::Parser;
	my $docnode = $parser->parse($_[1]);
	my $root = $docnode->getFirstChild->getFirstChild->getFirstChild->getFirstChild;
	
	my @DatabaseCrossReferenceNodes = $root->getChildNodes;
	my $DatabaseCrossReferenceLength = $#DatabaseCrossReferenceNodes;
	#print "total bean count = $DatabaseCrossReferenceLength\n";
	
	# parse all DatabaseCrossReference nodes
	my @obj_list = ();
	foreach my $DatabaseCrossReferenceNode (@DatabaseCrossReferenceNodes) {
		#print "\tDatabaseCrossReference\n";
		
		## begin ELEMENT_NODE children ##
		my $id;
		my $dataSourceName;
		my $summary;
		my $crossReferenceId;
		my $type;
		my $sourceType;
		## end ELEMENT_NODE children ##

		# get all children for this node
		for my $childrenNode ($DatabaseCrossReferenceNode->getChildNodes) {
		    if ($childrenNode->getNodeType == XML::DOM::ELEMENT_NODE()) {
			if( ! defined($childrenNode->getFirstChild) ){ next; };
			my $textNode = $childrenNode->getFirstChild;
			## begin iterate ELEMENT_NODE ##
			if ($childrenNode->getNodeName eq "id") {
				$id=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "dataSourceName") {
				$dataSourceName=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "summary") {
				$summary=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "crossReferenceId") {
				$crossReferenceId=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "type") {
				$type=$textNode->getNodeValue;
			}
			elsif ($childrenNode->getNodeName eq "sourceType") {
				$sourceType=$textNode->getNodeValue;
			}
			## end iterate ELEMENT_NODE ##
		    }
		}
		my $newobj = new CaCORE::Common::DatabaseCrossReference;
		## begin set attr ##
		$newobj->setId($id);
		$newobj->setDataSourceName($dataSourceName);
		$newobj->setSummary($summary);
		$newobj->setCrossReferenceId($crossReferenceId);
		$newobj->setType($type);
		$newobj->setSourceType($sourceType);
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

sub getDataSourceName {
	my $self = shift;
	return $self->{dataSourceName};
}

sub setDataSourceName {
	my $self = shift;
	$self->{dataSourceName} = shift;
}

sub getSummary {
	my $self = shift;
	return $self->{summary};
}

sub setSummary {
	my $self = shift;
	$self->{summary} = shift;
}

sub getCrossReferenceId {
	my $self = shift;
	return $self->{crossReferenceId};
}

sub setCrossReferenceId {
	my $self = shift;
	$self->{crossReferenceId} = shift;
}

sub getType {
	my $self = shift;
	return $self->{type};
}

sub setType {
	my $self = shift;
	$self->{type} = shift;
}

sub getSourceType {
	my $self = shift;
	return $self->{sourceType};
}

sub setSourceType {
	my $self = shift;
	$self->{sourceType} = shift;
}

## end getters and setters ##

## begin bean association methods ##

## end bean association methods ##

1;
#end
# Below is module documentation for DatabaseCrossReference

=pod

=head1 DatabaseCrossReference

CaCORE::Common::DatabaseCrossReference - Perl extension for DatabaseCrossReference.

=head2 Abstract

The CaCORE::Common::DatabaseCrossReference is a Perl object representation of the
caBIO DatabaseCrossReference object.

=head2 Description



=head2 Attributes of DatabaseCrossReference

The following are all the attributes of the DatabaseCrossReference object and their data types:

=over 4

=item dataSourceName

data type: C<string>

=item summary

data type: C<string>

=item crossReferenceId

data type: C<string>

=item type

data type: C<string>

=item sourceType

data type: C<string>

=item id

data type: C<long>

  End Attributes

=back

  Note: Although you can also use the corresponding setter methods to set the
  attribute values, it is not recommended to do so unless you absolutely have
  to change the object's attributes.

=head2 Associations of DatabaseCrossReference

The following are all the objects that are associated with the DatabaseCrossReference:

=over 4

  End Associations and related methods

=back

=cut

