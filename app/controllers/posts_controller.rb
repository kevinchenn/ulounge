class PostsController < ApplicationController
  
  before_filter :authenticate_user!, :only => [:new]
  before_filter :authenticate_admin!, :only => [:index]
  before_filter :authenticate_creator_or_admin, :only => [:edit, :destroy]
  
  #current user :only=> edit  ... helper
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
    @lounge = @post.lounge
    @user_id = @post.user_id 
    @comment = Comment.new
    
    @genres = [@post.electronic, @post.hiphop, @post.rock, @post.pop, @post.indie]
    @genre_names = ["Electronic", "Hip Hop", "Rock", "Pop", "Indie"]
    @genre_count = 0
    @genres.each do |g|
      if g
        @genre_count +=1
      end
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
    @lounge = Lounge.find(params[:lounge_id])
    @counter = 0    
    
    8.times do
      track = @post.tracks.build
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end
  
#  def add_link
#    #@post = Post.find(params[:id])
#    track = @post.tracks.build
#    respond_to do |format|
#      format.js
#    end
#  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @lounge = Lounge.find(@post.lounge_id)
    @user_id = @post.user_id
    @user = User.find(@post.user_id)
  end

  # POST /posts
  # POST /posts.json
  def create
    @user = current_user
    @lounge = Lounge.find(params[:post][:lounge_id])
    @post = Post.new(params[:post])
    @post.user_id = @user.id
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    @lounge = Lounge.find(@post.lounge_id)

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to :controller=>'posts',:action=>'show',:id=>@post.id }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
  
  def like
    @like = CommentLike.create(:comment_id => params[:comment_id], :user_id => params[:user_id])
    @comment = @like.comment
    @post = @comment.post
    respond_to do |format|
      format.js {}
    end
  end
  
  def unlike
    like = CommentLike.find(params[:comment_like_id]).destroy
    @comment = like.comment
    @post = @comment.post
    respond_to do |format|
      format.js {}
    end
  end
  
  #Determines who can edit
  protected
    def authenticate_creator_or_admin
      if current_admin
        #none
      elsif current_user.nil?
        redirect_to new_user_session_path, notice: "Please log in" 
      elsif !(current_user.id ==  Post.find(params[:id]).user_id)
        redirect_to new_user_session_path, notice: "Please log in"
      end
    end
end
