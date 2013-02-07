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

#Nested Forms
http://railscasts.com/episodes/196-nested-model-form-part-1
http://railscasts.com/episodes/197-nested-model-form-part-2

#Bootstrap Dropdown
http://twitter.github.com/bootstrap/javascript.html#dropdowns

#Yahoo Web Player
http://webplayer.yahoo.com/docs/how-to-set-up/#how-to-change-theme
mediaplayer.yahoo.com/api

#Star Rating
https://github.com/RichGuk/jquery-star-rating-rails
http://eighty-b.tumblr.com/post/1569674815/creating-an-ajaxified-star-rating-system-in-rails-3

#Make Heroku Faster
http://www.stormconsultancy.co.uk/blog/development/6-ways-to-get-more-bang-for-your-heroku-buck-while-making-your-rails-site-super-snappy/

http://blog.firmhouse.com/complete-guide-to-serving-your-rails-assets-over-s3-with-asset_sync

#Carrierwave - Image uploading
https://github.com/jnicklas/carrierwave
https://github.com/jnicklas/carrierwave/wiki/How-to%3A-Make-Carrierwave-work-on-Heroku
##Carrierwave Direct - Uploads images directly to S3
https://github.com/dwilkie/carrierwave_direct
https://github.com/dwilkie/carrierwave_direct_example