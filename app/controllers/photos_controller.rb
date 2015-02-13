class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def create
    @photo = Photo.new
    @photo.name = params[:fname]
    @photo.photo_url = params[:key]
    @photo.save
  end
end
