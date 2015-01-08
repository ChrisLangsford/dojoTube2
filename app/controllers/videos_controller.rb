class VideosController < ApplicationController
	before_action :set_video, only: [:show, :destroy]
	def index
		@videos = []
			if current_user.role == "Admin" || current_user.role =="Super user"
				@videos=Video.all
			else
			User.ranks.each do |v|
				if v == current_user.rank
					@videos += Video.where(rank: v) 
					break
				elsif
					@videos += Video.where(rank: v)
				end
			end	
		end	

	end

	def new
		@video = Video.new
		@s3_direct_post = S3_BUCKET.presigned_post(key: "videos/#{SecureRandom.uuid}/${filename}", success_action_status: 201, acl: :public_read)
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
      params.require(:video).permit(:title, :uploader, :category_id, :video_descrip, :rank, :file_url)
    end
end
