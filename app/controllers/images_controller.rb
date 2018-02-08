class ImagesController < ApplicationController

  def index
    @images = Image.limit 20
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def create
    upload_file = image_params[:file]
    upload_to_s3 = image_params[:S3]
    image = {}

    if upload_file != nil
      image[:filename] = upload_file.original_filename
      image[:file] = upload_file.read
      image[:S3] = upload_to_s3
    end

    @image = Image.new image

    p @image

    if @image.save
      flash[:success] = "画像を保存しました！"
      p @image
      # redirect_to @image
    else
      flash[:error] = "画像を保存できませんでした.."
    end
  end

  def show_image
    @image = Image.find(params[:id])
    send_data @image.file, :type=>'image/jpeg', :disposition => 'inline'
  end


  private

  def image_params
    params.require(:image).permit :filename, :file, :S3

  end


end
