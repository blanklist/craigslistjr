require 'faker'

pos_categories = ['housing', 'jobs', 'for_sale', 'discussion']

pos_categories.each do |cat|
  category = Category.new( {name: cat} )
  category.save!
end

pos_users = ["Mike", "Susan", "Larry", "Annabel"]

pos_users.each do |name|
  user = User.new ( {username: name} )
  user[:email] = Faker::Internet.safe_email(name)
  user[:hashed_password] = "password"
  user.save!
end

20.times do
  article_props = { title: Faker::Lorem.word, description: Faker::Lorem.paragraph, price: rand(1..3000), category_id: rand(1..4), user_id: rand(1..4) }

  article = Article.new(article_props)
  article.save!
end



