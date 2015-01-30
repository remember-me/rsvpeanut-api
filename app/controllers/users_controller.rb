class UsersController < ApplicationController
  skip_before_filter  :verify_authenticity_token
 
  def create
    @newUser = User.new user_params#params will be first:,last:,email:,password:
    @newUser.save
    respond_to do |format|
      format.json { render :json => @newUser }
    end
  end
  def index
    userList = User.all # restrict access to this
    render json: userList, status: 200
  end
  private
  def user_params    
    params.require(:user).permit(:first, :last, :email, :password)
  end
end
