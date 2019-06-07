require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  let(:valid_attributes) { attributes_for(:comment) }

  let(:invalid_attributes) { attributes_for(:comment, {contributor_name: "a"*31})}

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Comment" do
        expect {
          post :create, params: {comment: valid_attributes}
        }.to change(Comment, :count).by(1)
      end

      it "renders a JSON response with the new comment" do
        post :create, params: {comment: valid_attributes}
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(comment_url(Comment.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new comment" do

        post :create, params: {comment: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested comment" do
      comment = Comment.create! valid_attributes
      expect {
        delete :destroy, params: {id: comment.to_param}
      }.to change(Comment, :count).by(-1)
    end
  end

end
