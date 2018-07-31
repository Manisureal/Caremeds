class PagesController < ApplicationController
  def home
  end

  def pharmacy
  end

  def careproviders
  end

  def faqs
  end

  def news
    @news_blogs = NewsBlog.all
  end

  def news_show
    @news_blog = NewsBlog.find(params[:id])
    respond_to do |format|
      format.js { render layout: false}
    end
  end

  def contactus
  end
end
