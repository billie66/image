class PhotosController < ApplicationController
  def index
  end

  def create
    # TODO save the photo, you can use a active_record object
    photo                 = {}

    photo[:id]            = 1
    photo[:file_size]     = params[:fsize]
    photo[:image]         = 'http://image.qiniudn.com/' + params[:key]
    photo[:imageInfo]     = params[:imageInfo]
    photo[:custom_fields] = params[:custom_fields]
    photo[:xyz]           = params[:xyz]

    render json: photo
  end
end
