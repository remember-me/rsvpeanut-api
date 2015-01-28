class UsersController < ApplicationController
  def index
    userList = User.all # restrict access to this
    render json: userList, status: 200
  end
end
