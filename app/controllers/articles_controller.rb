class ArticlesController < ApplicationController


  before_action :authenticate_user!, except: [:index, :show]

  def index
    @articles = Article.all
    @total_comments = Comment.count
    @total_articles = Article.select{ |art| art.user == current_user}.size
  end

  def show_user_articles
    @total_articles = Article.select{ |art| art.user == current_user}.size
    @articles = current_user.articles
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user=current_user

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end

end
