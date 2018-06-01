require 'rails_helper'

describe Message do

let(:user) {User.create!(email: "test@test.com", password: "testtest")}
let(:room) {Room.create!(name: "General", threads: 1)}
let(:message) {Message.create!(content: "Foobar")}

before do
  room.messages.create!(user: user, content: "Foobar")
end

it "is not valid without user" do
  expect(Message.new(content: "Foobar")).not_to be_valid
end

end
