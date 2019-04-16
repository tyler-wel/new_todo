require 'rails_helper'

RSpec.describe Board, type: :model do
  it { should have_and_belong_to_many(:users) } 

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
end
