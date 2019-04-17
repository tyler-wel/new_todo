BoardType = GraphQL::ObjectType.define do
  name 'Board'
  description "Get a user's boards"

  field :id, !types.ID
  field :board_name, !types.String, property: :name
  field :board_desc, !types.String, property: :description
  field :owner_id, !types.ID, property: :user_id
  field :owner, !types.ID do
    type !types.String
    description 'The owner of the board'
    resolve -> (obj, args, ctx) { User.find(obj.user_id).name}
  end
end

QueryType = GraphQL::ObjectType.define do
  name 'Query'
  description 'All queries'

  field :boards do
    type types[BoardType]
    description "All boards"
    resolve -> (obj, args, ctx) {Board.all}
  end
  field :board do
    type BoardType
    description "A single board"
    argument :id, !types.ID
    resolve -> (obj, args, ctx) { Board.find(args[:id])}
  end
end

Schema = GraphQL::Schema.define do
  query QueryType
end