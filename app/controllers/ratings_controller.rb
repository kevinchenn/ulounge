class RatingsController < ApplicationController
  
  def create
    if current_user
      @post = Post.find_by_id(params[:post_id])
    
      if @rating = current_user.ratings.find_by_post_id(@post.id)
        @rating.update_attributes(params[:rating])
      else   
        @rating = Rating.new(params[:rating])
        @rating.post_id = @post.id
        @rating.user_id = current_user.id
        @rating.save
      end
    end
    
    respond_to do |format|
      format.html { redirect_to new_user_session_path, notice: "Please log in"}
      format.js
    end
  end 
  
  def update
    @post = Post.find_by_id(params[:post_id])
    @rating = current_user.ratings.find_by_post_id(@post.id)
    if @rating.update_attributes(params[:rating])
      respond_to do |format|
        format.html { redirect_to new_user_session_path, notice: "Please log in" }
        format.js
      end
    end
  end
  
  protected
    def authenticate_user
      if current_user.nil?
        redirect_to new_user_session_path, notice: "Please log in"
      else
      end
    end
end
