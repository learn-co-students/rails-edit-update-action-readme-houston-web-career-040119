class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = current_article
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new
    @article.title = params[:title]
    @article.description = params[:description]
    @article.save
    redirect_to article_path(@article)
  end

  # add edit and update methods here
  def edit
    @article = current_article
  end

  def update
    @article = current_article
    @article.update(title: params[:article][:title], description: params[:article][:description])
    redirect_to article_path(@article)
  end

  def current_article
    Article.find(params[:id])
  end

end
