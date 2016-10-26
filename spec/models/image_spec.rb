require 'rails_helper'

describe Image do
  describe "Validations" do
    it "is invalid without a url" do
      image = Image.new()

      expect(image).to_not be_valid
    end

    it "is valid with a url" do
      image = Image.new(url: "http://thing.com")

      expect(image).to be_valid
    end
  end

  describe "Relationships" do
    it "has many ideas_images" do
      image = Image.new(url: "http://thing.com")

      expect(image).to respond_to(:ideas_images)
    end

    it "has many ideas" do
      image = Image.new(url: "http://thing.com")

      expect(image).to respond_to(:ideas)
    end
  end
end
