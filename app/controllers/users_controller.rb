class UsersController < ApplicationController
  # remove this when Devise is set up.
  skip_before_filter  :verify_authenticity_token
  # remove this when Devise is set up.

  #creates new user in the database
  def create
    @newUser = User.new user_params
    @newUser.save
    respond_to do |format|
      format.json { render :json =>{ :user => @newUser } }
    end
  end
  #shows all users in the database.
  def index
    @allUser = User.all 
    
      render :json =>{ :user => @allUser}
  end
  # shows single user.
  def show
    @singleUser = User.find user_params
    respond_to do |format|
      format.json {render :json =>{ :user => @singleUser}}
    end
  end
  private
  #private params for strong params.
  def user_params    
    params.require(:user).permit(:first, :last, :email, :password)
  end
  def login_params    
    params.require(:user).permit(:email, :password)
  end
end
