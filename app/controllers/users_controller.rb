class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new()
  end

  def create

    @user = User.new(post_params)
    #redirect_to(:action => 'index')
    if @user.save

      flash[:notice] = "User created successfully"
      redirect_to(:action => 'index')
      #redirec_to @post
    else
      
      flash[:notice] = "Fail"

      #@subjects = Subject.order('position ASC')
      #@page_count = Page.count +1
      render('new')
    end


  end

  def edit
  end

  def delete
  end
  
  def post_params
    params.require(:user).permit(:username, :first_name)
  end

end
