# Import API specifics
use "awscc_base"

resource_name :aws_globalaccelerator_endpoint_group
provides :aws_globalaccelerator_endpoint_group, target_mode: true, platform: "aws"

description <<~DESCRIPTION
  Resource Type definition for AWS::GlobalAccelerator::EndpointGroup
DESCRIPTION

property :name, String,
         name_property: true,
         description: "Name of the resource, not desired state"

property :endpoint_configurations, Array,
         callbacks: {
           "endpoint_configurations is not a Array" => lambda { |v| v.is_a? Array },
         },
         description: <<~'DESCRIPTION'
           The list of endpoint objects.
         DESCRIPTION

property :endpoint_group_region, String,
         required: true,
         callbacks: {
           "endpoint_group_region is not a String" => lambda { |v| v.is_a? String },
         },
         description: <<~'DESCRIPTION'
           The name of the AWS Region where the endpoint group is located
         DESCRIPTION

property :health_check_interval_seconds, Integer,
         callbacks: {
           "health_check_interval_seconds is not a Integer" => lambda { |v| v.is_a? Integer },
         },
         description: <<~'DESCRIPTION'
           The time in seconds between each health check for an endpoint. Must be a value of 10 or 30
         DESCRIPTION

property :health_check_path, String,
         callbacks: {
           "health_check_path is not a String" => lambda { |v| v.is_a? String },
         },
         description: <<~'DESCRIPTION'

         DESCRIPTION

property :health_check_port, Integer,
         callbacks: {
           "health_check_port is not a Integer" => lambda { |v| v.is_a? Integer },
         },
         description: <<~'DESCRIPTION'
           The port that AWS Global Accelerator uses to check the health of endpoints in this endpoint group.
         DESCRIPTION

property :health_check_protocol, String,
         callbacks: {
           "health_check_protocol is not a String" => lambda { |v| v.is_a? String },
           "health_check_protocolis not one of `TCP`, `HTTP`, `HTTPS`" => lambda { |v| %w{TCP HTTP HTTPS}.include? v },
         },
         description: <<~'DESCRIPTION'
           The protocol that AWS Global Accelerator uses to check the health of endpoints in this endpoint group.
         DESCRIPTION

property :listener_arn, String,
         required: true,
         callbacks: {
           "listener_arn is not a String" => lambda { |v| v.is_a? String },
         },
         description: <<~'DESCRIPTION'
           The Amazon Resource Name (ARN) of the listener
         DESCRIPTION

property :port_overrides, Array,
         callbacks: {
           "port_overrides is not a Array" => lambda { |v| v.is_a? Array },
         },
         description: ""

property :threshold_count, Integer,
         callbacks: {
           "threshold_count is not a Integer" => lambda { |v| v.is_a? Integer },
         },
         description: <<~'DESCRIPTION'
           The number of consecutive health checks required to set the state of the endpoint to unhealthy.
         DESCRIPTION

property :traffic_dial_percentage, Number,
         callbacks: {
           "traffic_dial_percentage is not a Number" => lambda { |v| v.is_a? Number },
         },
         description: <<~'DESCRIPTION'
           The percentage of traffic to sent to an AWS Region
         DESCRIPTION

# API URLs and mappings
rest_api_collection "/AWS::GlobalAccelerator::EndpointGroup"
rest_api_document "/AWS::GlobalAccelerator::EndpointGroup"

rest_property_map({
  endpoint_configurations:       "EndpointConfigurations",
  endpoint_group_region:         "EndpointGroupRegion",
  health_check_interval_seconds: "HealthCheckIntervalSeconds",
  health_check_path:             "HealthCheckPath",
  health_check_port:             "HealthCheckPort",
  health_check_protocol:         "HealthCheckProtocol",
  listener_arn:                  "ListenerArn",
  port_overrides:                "PortOverrides",
  threshold_count:               "ThresholdCount",
  traffic_dial_percentage:       "TrafficDialPercentage",
})

rest_post_only_properties %i{
  endpoint_group_region listener_arn
}
