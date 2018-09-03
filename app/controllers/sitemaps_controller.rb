class SitemapsController < ApplicationController

  def index
    @host = "#{request.protocol}#{request.host}"
    @news_blogs = NewsBlog.all
  end
end
