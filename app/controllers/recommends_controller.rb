class RecommendsController < ApplicationController

  def index
    @recommend_photos = Photo.order('score DESC').limit(18)
  end
end
