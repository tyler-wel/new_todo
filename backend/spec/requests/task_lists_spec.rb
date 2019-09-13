require 'rails_helper'

num_test_data = 5

RSpec.describe "TaskLists", type: :request do
  describe "GET /task_lists" do
    it "get all tasks lists" do
      for i in 1..num_test_data do
        create(:task_list)
      end
      get '/api/task_lists'
      expect(response).to have_http_status(200)
      expect(json_body.count).to eq(num_test_data)
      # p json_body
    end

    it "gets task list with some tasks" do
      num_childs = 2
      create(:task_list_with_tasks, count: num_childs)
      get '/api/task_lists'
      expect(response).to have_http_status(200)
      expect(json_body[0]["tasks"].count).to eq(num_childs)
      p json_body
    end
  end
end
