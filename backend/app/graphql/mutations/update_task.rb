module Mutations
  class UpdateTask < BaseMutation
    
    # arguments passed to the 'resolved' method
    argument :task_id, ID, required: true
    argument :parent_id, ID, required: false

    # return type from the mutation
    type Types::TaskType

    def resolve(task_id: nil, parent_id: nil)
      task = Task.find(task_id)
      puts task
      if task 
        puts task.task_list_id
        puts parent_id
        task.task_list_id = parent_id
        puts task.task_list_id
      end
      task.save()
      task
    end

  end
end