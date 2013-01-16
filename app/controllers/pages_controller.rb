class PagesController < ApplicationController
  def lounge_list
    @lounges = Lounge.all
  end
end
