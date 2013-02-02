class RatingsController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    @post = Post.find_by_id(params[:post_id])
    @rating = Rating.new(params[:rating])
    @rating.post_id = @post.id
    @rating.user_id = current_user.id
    if @rating.save
      respond_to do |format|
        format.html { redirect_to post_path(@post), :notice => "Your rating has been saved"}
        format.js
      end
    end
  end 
  
  def update
    @post = Post.find_by_id(params[:post_id])
    @rating = current_user.ratings.find_by_post_id(@post.id)
    if @rating.update_attributes(params[:rating])
      respond_to do |format|
        format.html { redirect_to post_path(@post), :notice => "Your rating has been updated" }
        format.js
      end
    end
  end
end
