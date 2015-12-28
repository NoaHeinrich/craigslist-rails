class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @category = Category.find(params[:category_id])
    @article = @category.articles.create(article_params)
    redirect_to article_path(@article.id)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def show
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(title: params[:title], body: params[:body], location: params[:location])
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
