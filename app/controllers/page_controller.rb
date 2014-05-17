class PageController < ApplicationController
  def home
    @photos = Photo.all
    @tags = Tag.all

  end
end
