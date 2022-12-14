# Import API specifics
use "awscc_base"

resource_name :aws_ec2_transitgateway_multicast_group_source
provides :aws_ec2_transitgateway_multicast_group_source, target_mode: true, platform: "aws"

description <<~DESCRIPTION
  The AWS::EC2::TransitGatewayMulticastGroupSource registers and deregisters members and sources (network interfaces) with the transit gateway multicast group
DESCRIPTION

property :name, String,
         name_property: true,
         description: "Name of the resource, not desired state"

property :group_ip_address, String,
         required: true,
         callbacks: {
           "group_ip_address is not a String" => lambda { |v| v.is_a? String },
         },
         description: <<~'DESCRIPTION'
           The IP address assigned to the transit gateway multicast group.
         DESCRIPTION

property :network_interface_id, String,
         required: true,
         callbacks: {
           "network_interface_id is not a String" => lambda { |v| v.is_a? String },
         },
         description: <<~'DESCRIPTION'
           The ID of the transit gateway attachment.
         DESCRIPTION

property :transitgateway_multicast_domain_id, String,
         required: true,
         callbacks: {
           "transitgateway_multicast_domain_id is not a String" => lambda { |v| v.is_a? String },
         },
         description: <<~'DESCRIPTION'
           The ID of the transit gateway multicast domain.
         DESCRIPTION

# API URLs and mappings
rest_api_collection "/AWS::EC2::TransitGatewayMulticastGroupSource"
rest_api_document "/AWS::EC2::TransitGatewayMulticastGroupSource"

rest_property_map({
  group_ip_address:                   "GroupIpAddress",
  network_interface_id:               "NetworkInterfaceId",
  transitgateway_multicast_domain_id: "TransitGatewayMulticastDomainId",
})

rest_post_only_properties %i{
  group_ip_address network_interface_id transitgateway_multicast_domain_id
}
