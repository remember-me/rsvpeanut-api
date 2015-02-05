class Session < ActiveRecord::Base
  belongs_to :user
  def create
    render 'new'
  end
  def new

  end
  def destroy

  end
end
