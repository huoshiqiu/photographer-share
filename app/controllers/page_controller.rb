class PageController < ApplicationController
  def home
    @last_updated_photos = Photo.order('updated_at DESC').limit(10)
    @tags = Tag.all

  end
end
