# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


(1..20).each do |i|
  if i < 10
    User.create(name: "#{i}用户#{i}", email: "#{i}user#{i}@example.com",
             password: 'password', phone: "1590000111#{i}")
  else
    User.create(name: "#{i}用户#{i}", email: "#{i}user#{i}@example.com",
      password: 'password', phone: "159222211#{i}1")
  end

end

['life', 'nature', 'fashion', 'persion', 'animal', 'builing',
  'time', 'season', 'culture'].map do |tag_name|
  Tag.create(name: tag_name)
end

Admin.create(email: 'huoshiqiu@example.com', password: 'password')

(1..20).map do |i|
  j = i + 1
  follower_user = User.find(i)
  while j <= 20 do
    followed_user = User.find(j)
    Relationship.create(followed_id: followed_user.id, follower_id: follower_user.id)
    j += 1
  end
end
