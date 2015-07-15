class PhotosController < ApplicationController
  def show
    @photo = Photo.find(params['id'])
  end

  def new_form
  end

  def create_row
    @photo = Photo.new
    @photo.caption = params['the_caption']
    @photo.source = params['the_source']
    @photo.save

    redirect_to "/photos/#{@photo.id}"
  end
end
