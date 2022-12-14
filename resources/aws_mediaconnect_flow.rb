# Import API specifics
use "awscc_base"

resource_name :aws_mediaconnect_flow
provides :aws_mediaconnect_flow, target_mode: true, platform: "aws"

description <<~DESCRIPTION
  Resource schema for AWS::MediaConnect::Flow
DESCRIPTION

property :name, String,
         name_property: true,
         description: "Name of the resource, not desired state"

property :availability_zone, String,
         callbacks: {
           "availability_zone is not a String" => lambda { |v| v.is_a? String },
         },
         description: <<~'DESCRIPTION'
           The Availability Zone that you want to create the flow in. These options are limited to the Availability Zones within the current AWS.
         DESCRIPTION

property :name, String,
         name_property: true,
         required: true,
         callbacks: {
           "name is not a String" => lambda { |v| v.is_a? String },
         },
         description: <<~'DESCRIPTION'
           The name of the flow.
         DESCRIPTION

property :source, Hash,
         required: true,
         callbacks: {
           "Subproperty `SourceArn` is not a String" => lambda { |v| v[:SourceArn].is_a? String },
           "Subproperty `SourceArn`is not a valid ARN" => lambda { |v| v[:SourceArn] =~ Regexp.new("^arn:aws(?:-cn|-us-gov)?:([^:]*:){3,}") },
           "Subproperty `Description` is not a String" => lambda { |v| v[:Description].is_a? String },
           "Subproperty `EntitlementArn` is not a String" => lambda { |v| v[:EntitlementArn].is_a? String },
           "Subproperty `EntitlementArn`is not a valid ARN" => lambda { |v| v[:EntitlementArn] =~ Regexp.new("^arn:aws(?:-cn|-us-gov)?:([^:]*:){3,}") },
           "Subproperty `IngestIp` is not a String" => lambda { |v| v[:IngestIp].is_a? String },
           "Subproperty `IngestPort` is not a Integer" => lambda { |v| v[:IngestPort].is_a? Integer },
           "Subproperty `MaxBitrate` is not a Integer" => lambda { |v| v[:MaxBitrate].is_a? Integer },
           "Subproperty `MaxLatency` is not a Integer" => lambda { |v| v[:MaxLatency].is_a? Integer },
           "Subproperty `MinLatency` is not a Integer" => lambda { |v| v[:MinLatency].is_a? Integer },
           "Subproperty `Name` is not a String" => lambda { |v| v[:Name].is_a? String },
           "Subproperty `Protocol` is not a String" => lambda { |v| v[:Protocol].is_a? String },
           "Subproperty `Protocol`is not one of `zixi-push`, `rtp-fec`, `rtp`, `rist`, `fujitsu-qos`, `srt-listener`, `srt-caller`" => lambda { |v| %w{zixi-push rtp-fec rtp rist fujitsu-qos srt-listener srt-caller}.include? v[:Protocol] },
           "Subproperty `SenderIpAddress` is not a String" => lambda { |v| v[:SenderIpAddress].is_a? String },
           "Subproperty `SenderControlPort` is not a Integer" => lambda { |v| v[:SenderControlPort].is_a? Integer },
           "Subproperty `StreamId` is not a String" => lambda { |v| v[:StreamId].is_a? String },
           "Subproperty `SourceIngestPort` is not a String" => lambda { |v| v[:SourceIngestPort].is_a? String },
           "Subproperty `SourceListenerAddress` is not a String" => lambda { |v| v[:SourceListenerAddress].is_a? String },
           "Subproperty `SourceListenerPort` is not a Integer" => lambda { |v| v[:SourceListenerPort].is_a? Integer },
           "Subproperty `VpcInterfaceName` is not a String" => lambda { |v| v[:VpcInterfaceName].is_a? String },
           "Subproperty `WhitelistCidr` is not a String" => lambda { |v| v[:WhitelistCidr].is_a? String },
         },
         description: <<~'DESCRIPTION'
           The source of the flow.
         DESCRIPTION

property :source_failover_config, Hash,
         callbacks: {
           "Subproperty `State` is not a String" => lambda { |v| v[:State].is_a? String },
           "Subproperty `State`is not one of `ENABLED`, `DISABLED`" => lambda { |v| %w{ENABLED DISABLED}.include? v[:State] },
           "Subproperty `RecoveryWindow` is not a Integer" => lambda { |v| v[:RecoveryWindow].is_a? Integer },
           "Subproperty `FailoverMode` is not a String" => lambda { |v| v[:FailoverMode].is_a? String },
           "Subproperty `FailoverMode`is not one of `MERGE`, `FAILOVER`" => lambda { |v| %w{MERGE FAILOVER}.include? v[:FailoverMode] },
           "Subproperty `SourcePriority` is not a Object" => lambda { |v| v[:SourcePriority].is_a? Object },
         },
         description: <<~'DESCRIPTION'
           The source failover config of the flow.
         DESCRIPTION

# API URLs and mappings
rest_api_collection "/AWS::MediaConnect::Flow"
rest_api_document "/AWS::MediaConnect::Flow"

rest_property_map({
  availability_zone:      "AvailabilityZone",
  name:                   "Name",
  source:                 "Source",
  source_failover_config: "SourceFailoverConfig",
})

rest_post_only_properties %i{
  availability_zone name source/name
}
