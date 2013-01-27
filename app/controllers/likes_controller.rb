class LikesController < ApplicationController
  before_filter :authenticate_user!
  
#  def create
#    @like = Like.create(:post_id => params[:post_id], :user_id => params[:user_id])
 #   @post = @like.post
  #  respond_to do |format|
   #   format.js {@current_post = @post}
  #  end
#  end

#  def destroy
#    like = Like.find(params[:id]).destroy
#    @post = like.post
#    respond_to do |format|
#      format.html { redirect_to lounge_url(@post.lounge) }
#    end
#  end
 
end
