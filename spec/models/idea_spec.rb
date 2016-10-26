require 'rails_helper'

describe Idea do
  describe "Validations" do
    it "is invalid without a name" do
      user = create(:user)
      cat = create(:category)
      idea = user.ideas.new(category: cat)

      expect(idea).to_not be_valid
    end

    it "is valid with a name" do
      user = create(:user)
      cat = create(:category)
      idea = user.ideas.create(name: "Name", category: cat)

      expect(idea).to be_valid
    end

    it "is invalid if name already exists" do
      user = create(:user)
      cat = create(:category)
      idea1 = user.ideas.create(name: "Name", category: cat)
      idea2 = user.ideas.new(name: "Name", category: cat)

      expect(idea1).to be_valid
      expect(idea2).to_not be_valid
    end
  end

  describe "Relationships" do
    it "belongs to user " do
      user = create(:user)
      cat = create(:category)
      idea = user.ideas.new(name: "Name", category: cat)

      expect(idea).to respond_to(:user)
    end

    it "belongs to category" do
      user = create(:user)
      cat = create(:category)
      idea = user.ideas.new(name: "Name", category: cat)

      expect(idea).to respond_to(:category)
    end

    it "has many ideas_images" do
      user = create(:user)
      cat = create(:category)
      idea = user.ideas.new(name: "Name", category: cat)

      expect(idea).to respond_to(:ideas_images)
    end

    it "has many images" do
      user = create(:user)
      cat = create(:category)
      idea = user.ideas.new(name: "Name", category: cat)

      expect(idea).to respond_to(:images)
    end


  end

end
