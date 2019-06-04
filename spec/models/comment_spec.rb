require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "has a valid factory" do
    expect(build(:comment)).to be_valid
  end

  it "is invalid without a contributor_name" do
    comment = build(:comment, contributor_name: nil)
    comment.valid?
    expect(comment.errors[:contributor_name]).to include("can't be blank")
  end

  it "is valid with a contributer_name that has less than 31 characters" do
    expect(build(:comment, contributor_name: "a"*30)).to be_valid
  end

  it "is invalid with a contributer_name that has more than 30 characters" do
    comment = build(:comment, contributor_name: "a"*31)
    comment.valid?
    expect(comment.errors[:contributor_name]).to include("is too long (maximum is 30 characters)")
  end

  it "is invalid without content" do
    comment = build(:comment, content: nil)
    comment.valid?
    expect(comment.errors[:content]).to include("can't be blank")
  end

  it "is valid with content that has less than 256 characters" do
    expect(build(:comment, content: "a"*255)).to be_valid
  end

  it "is invalid with content that has more than 255 characters" do
    comment = build(:comment, content: "a"*256)
    comment.valid?
    expect(comment.errors[:content]).to include("is too long (maximum is 255 characters)")
  end
end
