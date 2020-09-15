class ArticlesController < ApplicationController
  before_action :require_login, except: %i[index show]
  before_action :redirect_home_unless_author, only: %i[edit destroy]

  include ArticlesHelper

  def index
    @articles = Article.all
  end

  def show
    article_id = params[:id]
    @article   = Article.find(article_id)

    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.author_id = current_user.id
    @article.save

    flash.notice = "Article '#{@article.title}' Created!"

    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    flash.notice = "Article '#{@article.title}' Deleted!"
    redirect_to articles_url
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' Updated!"

    redirect_to article_path(@article)
  end

  def redirect_home_unless_author
    article_id = params[:id]
    @article   = Article.find(article_id)

    flash.notice = "'#{current_user.username}' Does Not Have Permissions To Edit Article: '#{@article.title}'!"

    redirect_to article_path(@article) unless article_author_logged_in?
  end
end
