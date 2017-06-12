#Index - Category
get '/categories' do
  @categories = Category.all
  erb :'categories/index'
end

#Index - Article
get '/categories/:category_id/articles' do
  category
  @articles = @category.articles
  erb :'articles/index'
end

#New
get '/categories/:category_id/articles/new' do
  category
  erb :'articles/new'
end

#Create
post '/categories/:category_id/articles' do
  p params
  category
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
  category
  article
  @user = @article.user.username
  erb :'articles/show'
end

#Edit
get '/categories/:category_id/articles/:id/edit' do
  category
  article
  erb :'articles/edit'
end

def edit_article
  category
  article
  @article.update(params[:article])
  redirect "/categories/#{@category.id}/articles/#{@article.id}"
end

patch '/categories/:category_id/articles/:id' do
  edit_article
end

put '/categories/:category_id/articles/:id' do
  edit_article
end

#DELETE
delete '/categories/:category_id/articles/:id' do
  category
  @article = @category.articles.find(params[:id])
  @article.destroy
  redirect "/categories/#{@category.id}/articles"
end