require 'spec_helper'

describe 'testing the demoqa registration page' do

  before(:all) do
    @driver = SeleniumDemoReg.new
    @driver.access_registration_form
    #at first hard code the inputs and then try to generate e.g a random number to test different radio buttons/drop down options etc.
  end

  context 'positive paths for the registration form and register' do

    it 'should land on the registration for page' do
      expect(@driver.current_url).to eq 'http://demoqa.com/registration/'
    end

    it 'should accept a first name' do
      first_name = @driver.set_first_name_field("Marty")
      expect(@driver.get_first_name_field_value).to eq(first_name)
    end

    it 'should accept a last name' do
      last_name = @driver.set_last_name_field("McFly")
      expect(@driver.get_last_name_field_value).to eq(last_name)
    end

    it 'should accept a marital status selection of Single, Married, or Divorced' do
      @driver.select_marital_option(1)
    end

    it 'should accept a hobby status selection of Dance, Reading, or Cricket' do
      @driver.select_hobby_option(0)
    end

    it 'should have a country default of Afghanistan' do
      @driver.get_selected_country
    end

    #I added another test for the drop down list
    it 'should have a drop-down list of countries for the user to click' do
      @driver.country_dropdown_list_select("Lebanon")
    end

    it 'accept a new DOB' do
      @driver.dob_month_list_select(6)
      @driver.dob_day_list_select(13)
      @driver.dob_year_list_select(1993)
    end

    it 'should accept a valid phone number' do
      @driver.set_phone_number_field("07784521996")
    end

    it 'should accept a username' do
      @driver.set_user_name_field("MrRock'n'Roll")
    end

    it 'should accept an email address' do
      email = @driver.set_email_field("martymcfly@hotmail.co.uk")
    end

    it 'should accept a about yourself text' do
      @driver.set_about_yourself_field("Hello world!")
    end

    it 'should accept a profile picture' do

    end

    it 'should accept a password' do
      @password = "Ilovetimetravel123"
      @driver.set_password_field(@password)
    end

    it 'should accept a password confirmation' do
      @driver.set_confirmation_password_field(@password)
    end

    it 'should submit the form' do
      @driver.click_submit
    end

    it 'should check that the user has successfully registered' do
      #driver.find_element(:id,'Element').displayed?
    end
  end
end
