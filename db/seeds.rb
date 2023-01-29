150_000.times do |i|
  User.create!(first_name: Faker::Name.name, email: Faker::Internet.email)
  p "#{i} users created"
end

User.limit(500).update_all(email: 'rafal@grubykodzi.pl')
