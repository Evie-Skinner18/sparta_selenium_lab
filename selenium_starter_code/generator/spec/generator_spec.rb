require 'spec_helper'

describe 'Welcome to the unit tests for the Random Generators!' do

  before(:all) do
    @form_data_generator = RandomFormValues.new
    @random_postcode = RandomPostcodeGenerator.new
  end

  context 'I am testing to check that the form data generator is returning its random information correctly'

    it 'should return a first name in a string' do
      expect(@form_data_generator.generate_first_name).to be_a(String)
    end









  end #end of context

# end #end of describe
