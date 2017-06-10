get '/categories' do
  @categories = Category.all
  erb :'categories/index'
end

get '/categories/:category_id/articles' do
  @category = Category.find_by(params[:id])
  @articles = @category.articles
  erb :'articles/index'
end

# get '/categories/:category_id/articles/:id' do

#   erb :'articles/show'
# end