require 'json'
require 'rspec/expectations'

require_relative 'spec_helper'

#require 'pry'; binding.pry; #uncomment to jump into the debugger

# retrieve outputs from Terraform state via kitchen-aws attribute helper
tf_state_json = json(attribute 'terraform_state', {})
testing_suffix_hex = attribute 'testing_suffix_hex', {}
starter_instance_id = attribute 'starter.instance_id', {}
starter_instance_arn = attribute 'starter.instance_arn', {}

puts "testing_suffix_hex: #{testing_suffix_hex}"

logical_name = "starter"
env = "testenv"
app = "testapp"
org = "myorg"
owner = "platform"

expected_fq_name_base = "#{org}-#{env}-#{logical_name}"

control 'terraform_state' do
  describe 'the Terraform state file' do
    subject { tf_state_json.terraform_version }

    it('is accessible') { is_expected.to match(/\d+\.\d+\.\d+/) }
  end


  describe 'the Terraform state file' do
    #require 'pry'; binding.pry; #uncomment to jump into the debugger

    # describe outputs
    describe 'outputs' do
      describe('Starter Resource Identifiers') do
        describe('id') do
          subject { starter_instance_id }
          # example: starter-mJ6Vsw
          it { is_expected.to match(/#{logical_name}-[\w]+/) }
        end
        describe('arn') do
          subject { starter_instance_arn }
          # example: arn:aws:starter:us-west-2::starter-mJ6Vsw
          it { is_expected.to match(/arn:aws:starter:[-\w]+::#{logical_name}-[\w]+/) }
        end
      end
    end
  end

end
