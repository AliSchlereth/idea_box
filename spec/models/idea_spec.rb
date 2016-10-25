require 'rails_helper'

describe Idea do
  describe "Validations" do
    it "is invalid without a name" do
      user = create(:user)
      idea = user.ideas.new()

      expect(idea).to_not be_valid
    end

    it "is valid with a name" do
      user = create(:user)
      idea = user.ideas.create(name: "Name")

      expect(idea).to be_valid
    end

    it "is invalid if name already exists" do
      user = create(:user)
      idea1 = user.ideas.create(name: "Name")
      idea2 = user.ideas.new(name: "Name")

      expect(idea1).to be_valid
      expect(idea2).to_not be_valid
    end
  end

end
