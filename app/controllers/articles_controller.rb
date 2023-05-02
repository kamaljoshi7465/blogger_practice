class ArticlesController < ApplicationController
  include ArticlesHelper 

  def index
    @articles = Article.all
  end

  def show 
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new 
  end

  def create
    @article = Article.create(article_params)
    if @article.save
      redirect_to article_path(@article), notice: "Article '#{@article.title}' Successfully Created!"
    else
       render 'new'
    end
  end 

  def edit 
    @article = Article.find(params[:id])
  end

  def update 
    @article = Article.find(params[:id])
    if @article.update(article_params)
      # flash.notice = "Article '#{@article.title}' Updated!"
      redirect_to article_path, notice: "Article '#{@article.title}' Updated!"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path
  end

  # private 
  # def article_params
  #   params.require(:article).permit(:title, :body, :tag_list)
  # end 

end