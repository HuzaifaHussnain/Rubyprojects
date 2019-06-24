class UsersController < ApplicationController
  def index
    # this will act as the very first page of app, allowing to sign in and register
    @login_user =User.new

    @user = User.new


  end

  def new
      # this will be used to create new user i.e register
  end

# create will register the user
  def create
      @user = User.new(signup_params)
      if @user.save
        session[:user_email]=@user.email
        render 'homepage'
      else
        render 'index'
      end

  end




  def login
    # login user
    if request.method == "GET"
      if session[:user_email]
      @user = User.find_by(email: session[:user_email])
      render 'homepage'
    else
      redirect_to users_url
    end
    elsif request.method=='POST'
    @user = User.find_by(email: login_params[:email])
    if @user and @user.valid?(login_params[:password])
      session[:user_email]=@user.email
      render 'homepage'

    else
      @login_user=User.new(params[:params])
      @login_user.errors.add(:email,"email or password incorrect")
      render 'index'
    end
  end
end


def signout
  session[:user_email]=nil
  redirect_to users_url
end

def delete_user
  if session[:user_email]
    User.find_by(email: session[:user_email]).delete

    redirect_to users_url
  else
    redirect_to users_url
end
end


private
  def login_params
    params.require(:login_user).permit(:email, :password)
  end

  def signup_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
