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
    userList = User.all # restrict access to this
    render json: userList, status: 200
  end
  def show
    singleUser = User.find(params[:id])
    render json: singleUser, status: 200
  end
  private
  def user_params    
    params.require(:user).permit(:first, :last, :email, :password)
  end
end
