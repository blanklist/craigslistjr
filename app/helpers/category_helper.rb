helpers do
  def category
    @category = Category.find(params[:category_id])
  end

  def article
    @article = Article.find(params[:id])
  end
end