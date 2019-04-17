BoardType = GraphQL::ObjectType.define do
  name 'Board'
  description "Get a user's boards"

  field :id, !types.id,
  field :board_name, !types.string, property: :name
  field :board_desc, !types.string, property: :description
  field :owner, !types.id, property: :user_id
end

QueryType = GraphQL::ObjectType.define do
  name 'Query'
  description 'All queries'

  field :allBoards do
    type types[BoardType]
    description "All boards"
    resolve -> (obj, args, ctx) {Board.all}
  end
  field :board do
    type BoardType
    description "A single board"
    argument :id, !types.id
    resolve -> (obj, args, ctx) { Board.find(args[:id])}
  end
end

Schema = GraphQL::Schema.define do
  query QueryType
end