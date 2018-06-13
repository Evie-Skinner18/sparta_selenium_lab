require 'selenium-webdriver'

class SeleniumQaToolsForm

  def initialize
    @practice_form_url = 'http://toolsqa.com/automation-practice-form'
    @first_name_field = 'firstname'
    @last_name_field = 'lastname'
    @sex_button = 'sex-1'
    @chrome_driver = Selenium::WebDriver.for :chrome
    sleep 35
  end

#method to open up the webpage
  def visit_practice_form
    @chrome_driver.get(@practice_form_url)
  end

#gets the element you want and feeds in text as an argument into the input box which is our element
  def input_firstname_field(text)
    @chrome_driver.find_element(:name, @first_name_field).send_keys(text)
  end

#check that the value you're automating into the input box is actually being fed in. Puts it to the terminal
  def get_first_name_text
    puts @chrome_driver.find_element(:name, @first_name_field)['value']
  end

  def input_lastname_field(text)
    @chrome_driver.find_element(:name, @last_name_field).send_keys(text)
  end

  def get_last_name_text
    puts @chrome_driver.find_element(:name, @last_name_field)['value']
  end

  def fill_sex_radio_button
    @chrome_driver.find_element(:id, @sex_button).click
    puts "Radio button clicked!"
  end

  # def method_name
  #
  # end

end

test = SeleniumQaToolsForm.new

#call the method to open the web page
test.visit_practice_form

#call the method to send the automated text to the input fields named 'firstname'
test.input_firstname_field("Evie")
test.get_first_name_text

#and for 'lastname'
test.input_lastname_field("Skinner")
test.get_last_name_text
test.fill_sex_radio_button
