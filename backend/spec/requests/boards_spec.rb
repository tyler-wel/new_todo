require 'rails_helper'

num_test_data = 5

RSpec.describe "Boards Request", type: :request do
  describe "GET /api/boards" do
    it "gets all boards on the site" do
      for i in 1..num_test_data do
        create(:board)
      end
      get '/api/boards'
      expect(response).to have_http_status(200)
      expect(json_body.count).to eq(num_test_data)
      expect(json_body[0]["task_lists"].count).to eq(0)
    end

    it "get all boards (include task_lists)" do
      num_childs = 10
      create(:board_with_task_list, count: num_childs)
      get '/api/boards'
      expect(response).to have_http_status(200)
      expect(json_body[0]["task_lists"].count).to eq(num_childs)  
    end
  end
end
