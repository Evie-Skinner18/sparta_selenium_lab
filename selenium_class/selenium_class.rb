require 'selenium-webdriver'

class SeleniumQaToolsForm

  def initialize
    @practice_form_url = 'http://toolsqa.com/automation-practice-form'
    @first_name_field = 'firstname'
    @last_name_field = 'lastname'
    @sex_button = 'sex-'
    @years_exp_button = 'exp-'
    @date_field = 'datepicker'
    @profession = 'profession-'
    @tool = 'tool-'
    @button = 'submit'
    @chrome_driver = Selenium::WebDriver.for :chrome
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
    @chrome_driver.find_element(:id, 'sex-1').click
    puts "Sex radio button clicked!"
  end

  def fill_experience_radio_button
    @chrome_driver.find_element(:id, 'exp-4').click
    puts "Exp radio button clicked!"
  end

  def input_datepicker_field(text)
    @chrome_driver.find_element(:id, @date_field).send_keys(text)
  end

  def get_date_text
    puts @chrome_driver.find_element(:id, @date_field)['value']
  end

  def fill_profession_checkbox
    @chrome_driver.find_element(:id, 'profession-0').click
    puts "Profession  box ticked!"
  end

  def fill_tool_checkbox
    @chrome_driver.find_element(:id, 'tool-1').click
    puts "Tool box ticked!"
  end

  def select_dropdown_menu(continent)
    #select the dropdown list
    @dropdown_list = @chrome_driver.find_element(:id, 'continents')
    #Get all the options from the dropdown
    @options = @dropdown_list.find_elements(tag_name: 'option')
    #Loop through all the options and find dropdown value by text
    @options.each {|option| option.click if option.text == "#{continent}"}
    puts "The #{continent} option has been selected"
  end

  def select_command(command)
    @command_list = @chrome_driver.find_element(:id, 'selenium_commands')
    @options = @command_list.find_elements(tag_name: 'option')
    @options.each {|option| option.click if option.text == "#{command}"}
    puts "The #{command} command has been selected"
  end

  def click_button
    @chrome_driver.find_element(:id, @button).click
    puts "Submit button clicked"
  end
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
test.fill_experience_radio_button

test.input_datepicker_field("23/06/2018")
test.get_date_text

test.fill_profession_checkbox
test.fill_tool_checkbox

test.select_dropdown_menu("Africa")
test.select_command("Switch command")
test.click_button

sleep 10
