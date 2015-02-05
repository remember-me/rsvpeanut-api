class UsersController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  #need to set up devise for handling user sessions here. 
  def create
    @newUser = User.new user_params
    @newUser.save
    respond_to do |format|
      format.json { render :json =>{ :user => @newUser } }
    end
  end
  def index
    @singleUser = User.find login_params
    respond_to do |format|
      format.json {render :json =>{ :user => @singleUser}}
    end
  end
  def show
    @singleUser = User.find user_params
    respond_to do |format|
      format.json {render :json =>{ :user => @singleUser}}
    end
  end
  private
  def user_params    
    params.require(:user).permit(:first, :last, :email, :password)
  end
  def login_params    
    params.require(:user).permit(:email, :password)
  end
end
