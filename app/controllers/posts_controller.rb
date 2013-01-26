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
    #@username = @user.username
    @user_id = @post.user_id 
    @comment = Comment.new

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

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

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
    @post =  @lounge.posts.build(params[:post]) #Post.new(params[:post])
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
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
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
