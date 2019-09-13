require 'rails_helper'

num_test_data = 5

RSpec.describe "Users Requests", type: :request do
  describe "GET /api/users" do

    it "gets all users, no boards" do
      for i in 1..num_test_data do
        create(:user)
      end
      get '/api/users'
      expect(response).to have_http_status(200)
      expect(json_body.count).to eq(5)
    end

    it "get all users, including boards" do 
      num_childs = 10
      create(:user_with_boards, count: num_childs)
      get '/api/users'
      expect(json_body[0]["boards"].count).to eq(num_childs)
    end
  end
end
