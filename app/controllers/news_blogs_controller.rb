class NewsBlogsController < ApplicationController
  def index
    @news_blog = NewsBlog.all
  end

  def new
    @news_blog = NewsBlog.new
  end

  def create
    @news_blog = NewsBlog.new(news_blog_params)
    if !@news_blog.attachments.attach.blank? == true
      @news_blog.attachments.attach(params[:news_blog][:attachments])
      @news_blog.save
      redirect_to news_blog_path
      flash[:notice] = "News Blog successfully created!"
    else
      @news_blog.save
      redirect_to news_blog_path
      flash[:notice] = "News Blog successfully created!"
    end
  end

  def show
    @news_blog = NewsBlog.find(params[:id])
  end

  def edit
    @news_blog = NewsBlog.find(params[:id])
  end

  def update
    @news_blog = NewsBlog.find(params[:id])
    if @news_blog.update(news_blog_params)
      flash[:notice] = "News Blog successfully updated!"
    end
  end

  def destroy
    @news_blog = NewsBlog.find(params[:id])
    if @news_blog.destroy
      redirect_to news_blog_path
      flash[:notice] = "News Blog successfully deleted!"
  end

  private

  def news_blog_params
    params.require(:news_blog).permit(:title, :description, attachments: [])
  end
end
