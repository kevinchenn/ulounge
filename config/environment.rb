# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Ulounge::Application.initialize!

#Paperclip
Paperclip.options[:command_path] = "/usr/local/bin/"