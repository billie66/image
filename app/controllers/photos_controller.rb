class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def create
    @photo = Photo.new
    @photo.name = params[:fname]
    primitive_url = 'http://7u2lgh.com1.z0.glb.clouddn.com/' + params[:key]
    # generate a temporary download url for accessing resources saved in a private bucket
    # @download_url = Qiniu::Auth.authorize_download_url(primitive_url)
    # @photo.photo_url = download_url
    @photo.photo_url = primitive_url
    @photo.save
  end
end
