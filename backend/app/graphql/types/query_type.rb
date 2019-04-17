module Types
  class QueryType < Types::BaseObject

    field :boards, [BoardType] 
    field :board, BoardType do
      argument :id, ID, required: true, as: :id
    end

    def boards
      Board.all
    end

    def board(id:)
      Board.find(id)
    end
  end
end
