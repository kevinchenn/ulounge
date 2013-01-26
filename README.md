params object holds all the parameters passed in a browser request
@cart.line_items.build: p.111

AJAX: http://buckybits.blogspot.com/2011/09/simple-ajax-property-toggle-in-rails-30.html
#Paperclip:
rails plugin install git://github.com/thoughtbot/paperclip.git
rails generate paperclip post photo
https://github.com/thoughtbot/paperclip

#Authentication:
Devise - https://github.com/plataformatec/devise/
https://github.com/plataformatec/devise/wiki

http://stackoverflow.com/questions/3966344/setup-devise-to-only-allow-editing-of-own-records
Sign in/Sign Up links: https://github.com/plataformatec/devise/wiki/How-To:-Add-sign_in,-sign_out,-and-sign_up-links-to-your-layout-template


#Links:
link_to(body, url, html_options = {})
  # url is a String; you can use URL helpers like
  # posts_path

link_to(body, url_options = {}, html_options = {})
  # url_options, except :confirm or :method,
  # is passed to url_for

url_options includes params!!!!!! html_options includes :method!

#Passing parameters to partials:
render :partial => "partial", :locals => { :foo => @foo }
Then it is available in the partial as foo.

#Github Markdown
http://nestacms.com/docs/creating-content/markdown-cheat-sheet

#Partials
http://stackoverflow.com/questions/4402556/rails-confused-about-syntax-for-passing-locals-to-partials
http://stackoverflow.com/questions/6822917/how-can-i-render-a-child-partial-inside-its-parents-partial
http://www.cowboycoded.com/2010/05/14/using-the-collection-parameter-in-a-ruby-on-rails-partial/  ***

#DNS
http://stackoverflow.com/questions/7170664/how-to-configure-heroku-application-dns-to-godaddy-domain

#Changing form field width
http://www.binarywebpark.com/customizing-form-input-field-size-in-rails-using-twitter-bootstrap/