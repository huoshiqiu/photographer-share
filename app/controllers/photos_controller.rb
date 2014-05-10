class PhotosController < ApplicationController
  before_action :authenticate_user!

  def create
    photo = current_user.photos.new photo_params

    if photo.save
      flash[:notice] = '图片创建成功'
    else
      flash[:error] = '图片创建失败'
    end

    redirect_to current_user
  end

  def update
    photo = current_user.photos.find(params[:photo_id])

    if photo.update_attributes photo_params
      #judge if user check fix_services
      if params[:photo][:tags]
        photo.tags.destroy_all
        params[:photo][:tags].each_key do |pt|
          photo.tags.concat(Tag.find(pt))
        end
      end
      flash[:notice] = '图片更新成功'
    else
      flash[:error] = '图片更新失败'
    end

    redirect_to current_user
  end

  def destroy
    photo = current_user.photos.find(params[:id])

    if photo.destroy
      flash[:notice] = '图片删除成功'
    else
      flash[:error] = '图片删除失败'
    end

    redirect_to current_user
  end

  private
  def photo_params
    params.require(:photo).permit(:image_uid, :description)
  end
end
