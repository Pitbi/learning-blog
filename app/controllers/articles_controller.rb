class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    id       = params[:id]
    @article = Article.find id
    @back_link_text = "Retour"
  end

  def new
    @article = Article.new
  end

  def create
    article_attributes = params[:article]
    @article = Article.new article_attributes
    @article.save
    flash[:notice] = "Article successfully created!"
    redirect_to articles_path
  end

  def edit
    id = params[:id]
    @article = Article.find id
  end

  def update
    id                 = params[:id]
    article_attributes = params[:article]
    @article = Article.find id
    @article.attributes = article_attributes
    @article.save
    flash[:notice] = "Article successfully updated!"
    redirect_to article_path(@article)
  end

  def destroy
    id                 = params[:id]
    @article = Article.find id
    @article.destroy
    flash[:notice] = "Article successfully removed!"
    redirect_to articles_path
  end
end
