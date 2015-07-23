
User.destroy_all
user_info = [
  {
    email: "brianna.woods19@example.com",
    image_url: "https://randomuser.me/api/portraits/med/women/69.jpg"
  },
  {
    email: "randy.baker89@example.com",
    image_url: "https://randomuser.me/api/portraits/med/men/28.jpg"
  },
  {
    email: "isaac.gonzalez65@example.com",
    image_url: "https://randomuser.me/api/portraits/med/men/10.jpg"
  }
]

user_info.each do |user|
  User.create!(user)
end
puts "There are now #{User.count} users in the database."

Photo.destroy_all
photo_info = [
  {
    :source => "http://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Lake_Bondhus_Norway_2862.jpg/1280px-Lake_Bondhus_Norway_2862.jpg",
    :caption => "Lake Bondhus"
  },
  {
    :source => "http://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Lanzarote_5_Luc_Viatour.jpg/1280px-Lanzarote_5_Luc_Viatour.jpg",
    :caption => "Cueva de los Verdes"
  },
  {
    :source => "http://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Fire_breathing_2_Luc_Viatour.jpg/1280px-Fire_breathing_2_Luc_Viatour.jpg",
    :caption => "Jaipur"
  },
  {
    :source => "http://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/Ніжний_ранковий_світло.jpg/1280px-Ніжний_ранковий_світло.jpg",
    :caption => "Sviati Hory"
  },
  {
    :source => "http://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Mostar_Old_Town_Panorama_2007.jpg/1280px-Mostar_Old_Town_Panorama_2007.jpg",
    :caption => "Mostar"
  },
  {
    :source => "http://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/Elakala_Waterfalls_Swirling_Pool_Mossy_Rocks.jpg/1280px-Elakala_Waterfalls_Swirling_Pool_Mossy_Rocks.jpg",
    :caption => "Elakala"
  },
  {
    :source => "http://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Biandintz_eta_zaldiak_-_modified2.jpg/1280px-Biandintz_eta_zaldiak_-_modified2.jpg",
    :caption => "Biandintz"
  }
]

photo_info.each do |photo_hash|
  p = Photo.new
  p.source = photo_hash[:source]
  p.caption = photo_hash[:caption]
  rand_num = rand(User.count)
  p.user_id = User.offset(rand_num).first.id
  p.save
end
puts "There are now #{Photo.count} photos in the database."
