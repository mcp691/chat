require 'rails_helper'

describe Room do

let(:user) {User.create!(email: "test@test.com", password: "testtest")}
let(:room) {Room.create!(name: "General", threads: 1)}


it "is not valid without a name" do
  expect(Room.new(threads: 1)).not_to be_valid
end

end
