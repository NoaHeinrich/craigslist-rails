class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @category = Category.find(params[:category_id])
    @article = @category.articles.create(article_params)
    @article.randomKey
    @article.save
    flash[:message] = "To edit your post you will need this url: http://localhost:3000/articles/#{@article.id}/edit?key=#{@article.key}"
    redirect_to article_path(@article.id)
  end

  def edit
    @article = Article.find(params[:id])
    @categories = Category.all
    if params[:key] != @article.key
      flash[:message] = "This url does not match"
      redirect_to "/"
    end

  end

  def show
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to article_path(@article.id)
  end

  def destroy
    @article = Article.find(params[:id])
    @category = @article.category
    @article.destroy
    redirect_to category_path(@category.id)
  end


  private

  def article_params
    params.require(:article).permit(:title, :location, :body)
  end
end
