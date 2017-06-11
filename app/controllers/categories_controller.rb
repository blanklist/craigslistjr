#Index - Category
get '/categories' do
  @categories = Category.all
  erb :'categories/index'
end

#Index - Article
get '/categories/:category_id/articles' do
  @category = Category.find(params[:category_id])
  @articles = @category.articles
  erb :'articles/index'
end

#New
get '/categories/:category_id/articles/new' do
  @category = Category.find(params[:category_id])
  erb :'articles/new'
end

#Create
post '/categories/:category_id/articles' do
  p params
  @category = Category.find(params[:category_id])
  @article = Article.new(params[:article])
  if @article.save!
    redirect "/categories/#{@category.id}/articles"
  else
    @errors = @articles.errors.full_messages
    erb :'articles/new'
  end

end

#Show
get '/categories/:category_id/articles/:id' do
  @category = Category.find(params[:category_id])
  @article = Article.find(params[:id])
  @user = @article.user.username
  erb :'articles/show'
end

#Edit
get '/categories/:category_id/articles/:id/edit' do
  @category = Category.find(params[:category_id])
  @article = Article.find(params[:id])
  erb :'articles/edit'
end

patch '/categories/:category_id/articles/:id' do
  @category = Category.find(params[:category_id])
  @article = Article.find(params[:id])
  @article.update(params[:article])
  redirect "/categories/#{@category.id}/articles/#{@article.id}"
end