class ArticlesController < ApplicationController
  before_action :signed_in_user, except: [:index, :show]
  def new
    @article = Article.new
  end

  def index
    @articles = Article.all
  end

  def edit
    @article = Article.find(params[:id])
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = current_user.articles.build(article_params)

    if  @article.save
      flash.now[:success] = "文章已创建"
      redirect_to @article
    else
      redirect_to root_path
    end
  end
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
