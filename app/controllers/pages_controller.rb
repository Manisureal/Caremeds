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

  def contactus
  end
end
