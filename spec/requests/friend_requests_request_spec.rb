require 'rails_helper'

RSpec.describe "FriendRequests", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/friend_requests/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/friend_requests/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/friend_requests/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/friend_requests/update"
      expect(response).to have_http_status(:success)
    end
  end

end
