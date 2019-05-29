require 'rails_helper'

RSpec.describe Comment, type: :model do
  # 投稿者名、内容があれば有効な状態であること
  it "is valid with a contributor_name and content" do
    comment = Comment.new(
      contributor_name: "Tester Name",
      content: "Test Content"
    )
    expect(comment).to be_valid
  end

  # 投稿者名がなければ無効な状態であること
  it "is invalid without a contributor_name" do
    comment = Comment.new(
      contributor_name: nil
    )
    comment.valid?
    expect(comment.errors[:contributor_name]).to include("can't be blank")
  end

  # 内容がなければ無効な状態であること
  it "is invalid without content" do
    comment = Comment.new(
      content: nil
    )
    comment.valid?
    expect(comment.errors[:content]).to include("can't be blank")
  end
end
