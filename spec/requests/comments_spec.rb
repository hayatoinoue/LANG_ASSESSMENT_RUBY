require 'rails_helper'

RSpec.describe "Comments", type: :request do
  describe "POST /comments" do
    it "create a comment" do
      headers = { "CONTENT_TYPE" => "application/json" }
      post comments_path, :params => '{"content": "MyContent", "contributor_name": "MyName"}', :headers => headers
      expect(response).to have_http_status(:created)
    end
  end

  describe "GET /comments" do
    it "ok" do
      get comments_path
      expect(response).to have_http_status(:ok)
    end
  end
end
