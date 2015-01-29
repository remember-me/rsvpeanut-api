class UsersController < ApplicationController
  def create
    @newUser = stuff(params)#needs to be fleshed out when user creation finished
  end
  def index
    userList = User.all # restrict access to this
    render json: userList, status: 200
  end
end
