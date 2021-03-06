class ArticlesController < ApplicationController
  include ArticlesHelper

     
     before_action :require_login, except: [:index, :show]

def index
   @article = Article.all
   
end
def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id
end
def new
    @article = Article.new
end
def create
   @article = Article.new(article_params)
   flash.notice = "Article '#(@article.title)' created!"
   @article.save


  redirect_to article_path(@article)
end
def destroy
  @article = Article.destroy(params[:id])
   flash.notice = "Article '#(@article.title)' deleted!"
  
    redirect_to article_path
end
def edit
  @article = Article.find(params[:id])
end

def update
   @article = Article.find(params[:id])
   @article.update(article_params)
   

  flash.notice = "Article '#(@article.title)' updated!"  

  redirect_to article_path(@article)
end
end


