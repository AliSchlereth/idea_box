require 'rails_helper'

describe User do
  describe "Validation" do
    it "is invalid without name" do
      user = User.new()

      expect(user).to_not be_valid
    end

    it "is valid with a name" do
      user = User.new(name: "Name")

      expect(user).to be_valid
    end
  end

  describe "Relationships" do
    it "has many ideas" do
      user = User.new(name: "Name")
      expect(user).to respond_to(:ideas)
    end
  end


end
