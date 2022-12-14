# Import API specifics
use "awscc_base"

resource_name :aws_cloudfront_distribution
provides :aws_cloudfront_distribution, target_mode: true, platform: "aws"

description <<~DESCRIPTION
  Resource Type definition for AWS::CloudFront::Distribution
DESCRIPTION

property :name, String,
         name_property: true,
         description: "Name of the resource, not desired state"

property :distribution_config, Hash,
         required: true,
         callbacks: {
           "Subproperty `Aliases` is not a Array" => lambda { |v| v[:Aliases].is_a? Array },
           "Subproperty `CNAMEs` is not a Array" => lambda { |v| v[:CNAMEs].is_a? Array },
           "Subproperty `CacheBehaviors` is not a Array" => lambda { |v| v[:CacheBehaviors].is_a? Array },
           "Subproperty `Comment` is not a String" => lambda { |v| v[:Comment].is_a? String },
           "Subproperty `ContinuousDeploymentPolicyId` is not a String" => lambda { |v| v[:ContinuousDeploymentPolicyId].is_a? String },
           "Subproperty `CustomErrorResponses` is not a Array" => lambda { |v| v[:CustomErrorResponses].is_a? Array },
           "Subproperty `DefaultRootObject` is not a String" => lambda { |v| v[:DefaultRootObject].is_a? String },
           "Subproperty `Enabled` is not a Boolean" => lambda { |v| v[:Enabled].is_a? Boolean },
           "Subproperty `HttpVersion` is not a String" => lambda { |v| v[:HttpVersion].is_a? String },
           "Subproperty `IPV6Enabled` is not a Boolean" => lambda { |v| v[:IPV6Enabled].is_a? Boolean },
           "Subproperty `Origins` is not a Array" => lambda { |v| v[:Origins].is_a? Array },
           "Subproperty `PriceClass` is not a String" => lambda { |v| v[:PriceClass].is_a? String },
           "Subproperty `Staging` is not a Boolean" => lambda { |v| v[:Staging].is_a? Boolean },
           "Subproperty `WebACLId` is not a String" => lambda { |v| v[:WebACLId].is_a? String },
         },
         description: ""

property :tags, Array,
         callbacks: {
           "tags is not a Array" => lambda { |v| v.is_a? Array },
         },
         description: ""

# API URLs and mappings
rest_api_collection "/AWS::CloudFront::Distribution"
rest_api_document "/AWS::CloudFront::Distribution"

rest_property_map({
  distribution_config: "DistributionConfig",
  tags:                "Tags",
})

