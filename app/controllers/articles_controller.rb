class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    article_id = params[:id]
    @article = Article.find(article_id)
  end

end
