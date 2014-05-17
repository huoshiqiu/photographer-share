class TagsController < ApplicationController

  def index
    # binding.pry
    @tag = Tag.where(name: params[:tag_name]).first
    if @tag.nil?
      @tag_name = params[:name].to_s
    else
      @special_tag_photos = @tag.photos
    end

  end
end
