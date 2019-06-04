require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "has a valid factory" do
    expect(build(:comment)).to be_valid
  end

  it "is invalid without a contributor_name" do
    comment = Comment.new(
      contributor_name: nil
    )
    comment.valid?
    expect(comment.errors[:contributor_name]).to include("can't be blank")
  end

  it "is invalid with a contributer_name that has more than 30 characters" do
    comment = Comment.new(
      contributor_name: "1234567890123456789012345678901"
    )
    comment.valid?
    expect(comment.errors[:contributor_name]).to include("is too long (maximum is 30 characters)")
  end

  it "is invalid without content" do
    comment = Comment.new(
      content: nil
    )
    comment.valid?
    expect(comment.errors[:content]).to include("can't be blank")
  end

  it "is invalid with content that has more than 255 characters" do
    comment = Comment.new(
      content: "1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456"
    )
    comment.valid?
    expect(comment.errors[:content]).to include("is too long (maximum is 255 characters)")
  end
end
