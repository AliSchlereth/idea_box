require 'rails_helper'

describe User do
  describe "Validation" do
    it "is invalid without name" do
      user = User.new(password: "pass", email: "email")

      expect(user).to_not be_valid
    end

    it "is invalid without an email" do
      user = User.new(name: "Name", password: "pass")

      expect(user).to_not be_valid
    end

    it "is invalid without a password" do
      user = User.new(name: "Name", email: "email")

      expect(user).to_not be_valid
    end

    it "is valid with a name" do
      user = User.new(name: "Name", password: "pass", email: "email")

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
