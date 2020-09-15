module ArticlesHelper
  def article_params
    params.require(:article).permit(:title, :body, :tag_list, :image)
  end

  def article_author_logged_in?
    logged_in? && @article.author_id == current_user.id
  end
end
