require "rails_helper"

describe Category do
  describe "Validations" do
    it "is invalid without a name" do
      category = Category.new()

      expect(category).to_not be_valid
    end

    it "is valid with a name" do
      category = Category.new(name: "Name")

      expect(category).to be_valid
    end

    it "is invalid if name already exists" do
      category1 = Category.create(name: "Name")
      category2 = Category.new(name: "Name")

      expect(category1).to be_valid
      expect(category2).to_not be_valid
    end
  end
end
