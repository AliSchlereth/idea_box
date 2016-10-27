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

    it "saves to the databse with password confirmation" do
      user = User.new(name: "Name", password: "pass", email: "email", password_confirmation: "pass")
      status = user.save

      expect(status).to be_truthy
    end
  end

  describe "Relationships" do
    it "has many ideas" do
      user = User.new(name: "Name")
      expect(user).to respond_to(:ideas)
    end
  end

  describe "Role" do
    it "can return admin" do
      user = User.create(name: "Name Role", email: "role@email", password: "pass", password_confirmation: "pass", role: 1)

      expect(user.role).to eq("admin")
      expect(user.admin?).to be_truthy
    end

    it "can return default" do
      user = User.create(name: "Name Role", email: "role@email", password: "pass", password_confirmation: "pass", role: 0)

      expect(user.role).to eq("default")
      expect(user.admin?).to_not be_truthy
    end
  end


end
