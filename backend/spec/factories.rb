FactoryBot.define do

    factory :task do
        sequence(:name) { |n| "Task #{n}"}
        desc { "Description of the task"}
        task_list
    end

    factory :task_list do
        sequence(:name) { |n| "Task List #{n}"}
        board

        factory :task_list_with_tasks do
            transient do 
                count { 5 }
            end

            after(:create) do |task_list, ev|
                create_list(:task, ev.count, task_list: task_list)
            end
        end
    end

    factory :board do
        name { "Board" }
        description { "Descript" }

        factory :board_with_task_list do 
            transient do
                count { 5 }
            end
        
            after(:create) do |board, ev|
                create_list(:task_list, ev.count, board: board)
            end
        end
    end

    factory :user do
        sequence(:username) { |n| "User#{n}"}
        sequence(:email) { |n| "user#{n}@example.com" }
        password {"xxxxxxxxxxxxxxx"}

        # user with many boards, has_many mock data
        factory :user_with_boards do
            transient do
                count { 5 }
            end

            after(:create) do |user, ev|
                create_list(:board, ev.count, users: [user])
            end
        end
    end
end