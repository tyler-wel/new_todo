QueryType = GraphQL::ObjectType.define do
  name 'Query'
  description 'optional'
  field :hello do
    type types.String
    resolve -> (obj, args, ctx) { 'Hello GraphQL' }
  end
end

Schema = GraphQL::Schema.define do
  query QueryType
end