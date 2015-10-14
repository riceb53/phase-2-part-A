require 'faker'

30.times do Item.create(title: Faker::Name.title, description: Faker::Lorem.sentence(3), user_id: rand(0..30))
end

30.times do Bid.create(price: rand(0..500), user_id: rand(0..30), item_id: rand(0..30))

end

30.times do User.create(email: Faker::Internet.email, password: Faker::Internet.password(5))

end
