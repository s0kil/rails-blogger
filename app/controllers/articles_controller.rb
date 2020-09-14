class ArticlesController < ApplicationController
  include ArticlesHelper

  def index
    @articles = Article.all
  end

  def show
    article_id = params[:id]
    @article   = Article.find(article_id)

    @comment            = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    # @article = Article.new(params[:article])
    # if @article.save
    #   flash[:success] = "Article successfully created"
    #   redirect_to @article
    # else
    #   flash[:error] = "Something went wrong"
    #   render 'new'
    # end
    @article = Article.new(article_params)
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


end
