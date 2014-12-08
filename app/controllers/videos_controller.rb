class VideosController < ApplicationController
	before_action :set_video, only: [:destroy]
	def new
		@video = Video.new
	end

	def create
		@video = Video.new(video_params)
		if @video.save
			redirect_to root_url, {message: "video successfully uploaded"}
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
      params.require(:video).permit(:title)
    end
end
