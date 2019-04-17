class BoardSerializer < ActiveModel::Serializer

  attributes :id, :name, :description, :user_id

  def id
    object.id.to_s
  end

  def name
    object.name.to_s
  end
  

end