require 'selenium-webdriver'

#create a chrome webdriver which will mimic the chrome browser for us and do
#The mthod .for is inside the API slenium webdriver. We are storing all the methods of the API in this varaible chromedriver
chrome_driver = Selenium::WebDriver.for :chrome


#Open the webpage that you pass as an argument to the Selenium method. It will open the wepage and then automatically close it
chrome_driver.get("http://toolsqa.com/automation-practice-form")

#Go and inspect the HTML elements on the page and check that e.g this element, <name> firstname is being correctlry displayed.
#If it's not correct, Selenium returns an error in the terminal.
chrome_driver.find_element(:name, 'firstname').displayed?

#This finds the element of name firstname and sends some automated text input into the input box. Cool!
chrome_driver.find_element(:name, 'firstname').send_keys('hello!!!!')
chrome_driver.find_element(:name, 'lastname').send_keys('BLEUUHHFHFHH!!!!')


#This makes the page stay open for 10 seconds before closing by itself. Sleep is a bit like console.log
sleep 2
