
require 'selenium-webdriver'
require_relative '../generator/generator.rb'

class SeleniumDemoReg

  # page_url
  PAGE_URL = 'http://demoqa.com/registration/'
  # Page field
  FIRST_NAME_FIELD =  'name_3_firstname'
  LAST_NAME_FIELD =  'name_3_lastname'
  MARITAL_STATUS =  'radio_4[]'
  HOBBY_STATUS =  "checkbox_5[]"
  COUNTRY_DROP_DOWN_LIST =  'dropdown_7'
  DOB_MONTH_DROPDOWN_LIST =  'mm_date_8'
  DOB_DAY_DROPDOWN_LIST =  'dd_date_8'
  DOB_YEAR_DROPDOWN_LIST =  'yy_date_8'
  PHONE_NUMBER_FIELDS =  'phone_9'
  USERNAME_FIELD =  'username'
  EMAIL_FIELD =  'email_1'
  PROFILE_PICTURE_BUTTON =  'profile_pic_10'
  DESCRIPTION_FIELD =  'description'
  PASSWORD_FIELD = 'password_2'
  CONFIRM_PASSWORD_FIELD = 'confirm_password_password_2'
  SUBMIT_BUTTON = 'pie_submit'
  REGISTRATION_CONFIRMATION = 'piereg_message'

  def initialize
    # set up driver
    @chrome_driver = Selenium::WebDriver.for :chrome

    #set up random generator
    @random_data = RandomFormValues.new

  end

  def access_registration_form
    @chrome_driver.get(PAGE_URL)
  end

  def current_url
    @chrome_driver.current_url
  end

  # first name field management - Difficulty Easy

  def set_first_name_field
    first_name = @random_data.generate_first_name
    @chrome_driver.find_element(:id, FIRST_NAME_FIELD).send_keys(first_name)
  end

  def get_first_name_field_value
    @first_name_value = @chrome_driver.find_element(:id, FIRST_NAME_FIELD)['value']
  end

  def first_name_field_displayed
  end

  # last name field management - Difficulty Easy

  def set_last_name_field(last_name)
    last_name = @random_data.generate_last_name
    @chrome_driver.find_element(:id, LAST_NAME_FIELD).send_keys(last_name)
  end

  def get_last_name_field_value
    @last_name_value = @chrome_driver.find_element(:id, LAST_NAME_FIELD)['value']
  end

  def last_name_field_displayed
  end

  # Marital option management - Difficulty Medium

  def select_marital_option(marital_status)
    # Consider something like a case statement and check the selenium selected? method
    @marital_option = @chrome_driver.find_element(:name, MARITAL_STATUS.gsub(" ", "#{marital_status}")).click
  end

  # hobby option management - Difficulty Medium

  def select_hobby_option(hobby)
    # Consider something like a case statement and check the selenium selected? method
    @hobby  = @chrome_driver.find_element(:name, HOBBY_STATUS.gsub(" ", "#{hobby}")).click

  end

  # Select Country - Difficulty HARD

  # Look online how to handle option lists with Selenium in Ruby - you need to get used to solving problems
  # If you are spending too long see if anyone else has been successful
  # If no solution then a run through will happen once finished

  def get_selected_country
    @dropdown_list = @chrome_driver.find_element(:id, COUNTRY_DROP_DOWN_LIST)
    @options = @dropdown_list.find_elements(tag_name: 'option')
    @options[0].selected?
    p @options[0]['value']
  end

  def country_dropdown_list_select(country)
    @dropdown_list = @chrome_driver.find_element(:id, COUNTRY_DROP_DOWN_LIST).send_keys(country)
  end

  # DOB management - Difficulty HARD

  # Look online how to handle option lists with Selenium in Ruby - you need to get used to solving problems
  # If you are spending too long see if anyone else has been successful
  # If no solution then a run through will happen once finished

  def dob_month_list_select(month_value)
    @month_dropdown_list = @chrome_driver.find_element(:id, DOB_MONTH_DROPDOWN_LIST).send_keys(month_value)
  end

  def dob_day_list_select(day_value)
    @day_dropdown_list = @chrome_driver.find_element(:id, DOB_DAY_DROPDOWN_LIST).send_keys(day_value)
  end

  def dob_year_list_select(year_value)
    @year_dropdown_list = @chrome_driver.find_element(:id, DOB_YEAR_DROPDOWN_LIST).send_keys(year_value)
  end

  # Phone number field management - Difficulty Easy

  def set_phone_number_field(phone_number)
    @chrome_driver.find_element(:id, PHONE_NUMBER_FIELDS).send_keys(phone_number)
  end

  def get_phone_number_field_value
    @phone_number_value = @chrome_driver.find_element(:id, PHONE_NUMBER_FIELDS)['value']
  end

  #  username field management - Difficulty Easy

  def set_user_name_field(user_name)
    @chrome_driver.find_element(:id, USERNAME_FIELD).send_keys(user_name)
  end

  def get_user_name_field_value
  end

  # Email field management - Difficulty Easy

  def set_email_field(email)
    @chrome_driver.find_element(:id, EMAIL_FIELD).send_keys(email)
  end

  def get_email_field_value
  end

  #profile pic
  def set_profile_pic(file)
    file_name = File.join(Dir.pwd, file)
    @profile_pic = @chrome_driver.find_element(:id, PROFILE_PICTURE_BUTTON)
    @profile_pic.send_keys(file_name)
    @profile_button = @profile_pic.click
  end
  # about yourself / description field - Difficulty Easy

  def set_about_yourself_field(details)
    @chrome_driver.find_element(:id, DESCRIPTION_FIELD).send_keys(details)
  end

  def get_about_yourself_value
  end

  # Password management - Difficulty Easy

  def set_password_field(password)
    @chrome_driver.find_element(:id, PASSWORD_FIELD).send_keys(password)
  end

  def get_password_value
  end

  def set_confirmation_password_field(password)
    @chrome_driver.find_element(:id, CONFIRM_PASSWORD_FIELD).send_keys(password)
  end

  def get_confirmation_password_value
    @confirmation_value = @chrome_driver.find_element(:id, CONFIRM_PASSWORD_FIELD)['value']
  end

  # registration confirmation - Difficulty Easy

  def click_submit
    @chrome_driver.find_element(:name, SUBMIT_BUTTON).submit
  end

  def check_registration_successful
    @chrome_driver.find_element(:class, REGISTRATION_CONFIRMATION).displayed?
  end
end
