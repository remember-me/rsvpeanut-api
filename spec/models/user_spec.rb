RSpec.describe User, :type => :model do
  fixtures :users
  xit "has a username" do
    user = User.create(username: "Spenser", password: "hello")
    expect(user.username).to eq("Spenser")
    expect(user.id).to eq(1)
  end
  it "fixtures test" do
    user = users(:Fred)
    user = User.create(username: user.username, password: user.password)
    expect(users(:Fred).username).to eq("Fred")
  end
end


# context "with 2 or more comments" do
#     it "orders them in reverse chronologically" do
#       post = Post.create!
#       comment1 = post.comments.create!(:body => "first comment")
#       comment2 = post.comments.create!(:body => "second comment")
#       expect(post.reload.comments).to eq([comment2, comment1])
#     end
#   end