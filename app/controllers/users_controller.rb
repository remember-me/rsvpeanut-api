class UsersController < ApplicationController
  def create
    @newUser = stuff(params)#params will be first:,last:,email:,password:
  end
  def index
    userList = User.all # restrict access to this
    render json: userList, status: 200
  end
end
