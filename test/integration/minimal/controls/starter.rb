require 'awspec'
require 'awsecrets'
require 'json'

require_relative 'spec_helper'

# note: Awsecrets is required when running tests by themselves, e.g. `make verify`
Awsecrets.load()

expect_env = "testenv"
expect_app = "testapp"
expect_owner = "platform"

#require 'pry'; binding.pry; #uncomment to jump into the debugger

# retrieve outputs from Terraform state via kitchen-aws attribute helper
starter_instance_id = attribute 'starter.instance_id', {}
starter_instance_arn = attribute 'starter.instance_arn', {}

control 'starter' do

  # imagine 'starter' were a resource in AWS such as an RDS database, we could use
  # awspec to test it like so:
  #
  # For supported AWS resource types, see: https://github.com/k1LoW/awspec/blob/master/doc/resource_types.md
  # 
  # describe "starter #{starter_instance_id}" do
  #   subject { starter(starter_instance_id) } # 'starter' is a made-up resource type; must be replaced
  #
  #   it { should exist }
  #
  #   it { should have_tag('Environment').value(expect_env) }
  #   it { should have_tag('Owner').value(expect_owner) }
  #   it { should have_tag('Application').value(expect_app) }
  #   it { should have_tag('ManagedBy').value('Terraform') }
  # end
  
end
