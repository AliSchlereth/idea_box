# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

class SeedData

  def create_images
    puts "creating images"
    Image.create!(url: "http://www.hrc.org/files/images/welcoming_schools/general/Mixed_race_family_600.jpg")
    puts "created images"
  end
end

seed = SeedData.new
seed.create_images
