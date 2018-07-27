class NewsBlogsController < ApplicationController
  before_action :set_news_blog, only: [:show, :edit, :update, :destroy]

  def index
    @news_blogs = NewsBlog.all
  end

  def new
    @news_blog = NewsBlog.new
  end

  def create
    @news_blog = NewsBlog.new(news_blog_params)
    if !@news_blog.attachments.attach.blank? == true
      @news_blog.attachments.attach(params[:news_blog][:attachments])
      @news_blog.save
      redirect_to news_blogs_path
      flash[:notice] = "News Blog successfully created!"
    else
      @news_blog.save
      redirect_to news_blogs_path
      flash[:notice] = "News Blog successfully created!"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @news_blog.update(news_blog_params)
      redirect_to news_blogs_path
      flash[:notice] = "News Blog successfully updated!"
    end
  end

  def destroy
    if @news_blog.destroy
      redirect_to news_blogs_path
      flash[:notice] = "News Blog successfully deleted!"
    end
  end

  private

  def set_news_blog
    @news_blog = NewsBlog.find(params[:id])
  end

  def news_blog_params
    params.require(:news_blog).permit(:title, :description, :meta_title, :meta_description, :meta_keywords, attachments: [] )
  end
end
