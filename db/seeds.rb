require 'faker'

pos_categories = ['housing', 'jobs', 'for_sale', 'discussion']

pos_categories.each do |cat|
  category = Category.new( {name: cat} )
  category.save!
end


20.times do
  article_props = { title: Faker::Lorem.word, description: Faker::Lorem.sentence, price: rand(1..3000), category_id: rand(1..4) }

  article = Article.new(article_props)
  article.save!
end