class PostsController < ApplicationController
  def index
  	@posts = Post.all

  end

  def show
  	@post = Post.find(params[:id])
  end

  def new
    @users = User.order('username ASC')
  end

  def create
  	@post = Post.new(post_params)
  	#redirect_to(:action => 'index')
  	if @post.save

      flash[:notice] = "Post created successfully"
      redirect_to(:action => 'new')
      #redirec_to @post
    else
      
      flash[:notice] = "Fail"

      #@subjects = Subject.order('position ASC')
      #@page_count = Page.count +1
      render('new')
    end

  	#To know what are we sending
  	#render plain: params[:post].inspect
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)

      flash[:notice] = "Post updated successfully"
      redirect_to(:action => 'show', :id => @post.id)

    else
      #@subjects = Subject.order('position ASC')
      #@page_count = Page.count
      render('edit')
    end

  end

 private 

	 def post_params
	 	params.require(:post).permit(:title, :body, :user_id)
	 end
end
