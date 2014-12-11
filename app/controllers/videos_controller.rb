class VideosController < ApplicationController
	before_action :set_video, only: [:show, :destroy]
	def index
		@videos = Video.all	
	end

	def new
		@video = Video.new
	end
	def show
		
	end

	def create
		@video = Video.new(video_params)		
		

		if @video.save
		#obj = AWS::S3.new.buckets['dojo-tube'].objects[@video.title].write('/public/videos/#@video.title.txt')		
			redirect_to videos_path, {message: "video successfully uploaded"}
		else
			render action: 'new'
		end
	end

	def destroy
		@video.destroy
		redirect_to root_url
	end

	private
    def set_video
      @video = Video.find(params[:id])
    end   

    def video_params
      params.require(:video).permit(:title, :uploader, :category_id, :video_descrip, :rank, :file)
    end
end
