class VideosController < ApplicationController
	layout 'sidebar', only:  [:index, :my_videos]
	before_action :set_video, only: [:show, :edit, :update, :destroy]
	skip_before_action :authenticate_user!
	before_action :check_auth
	impressionist actions: [:show], unique: [:session_hash]

	def check_auth
	    unless user_signed_in?
	        redirect_to root_url
	        flash[:alert] = "You must be logged in to view this page"
	    end
	end	
	def index
		@videos = []
			if current_user.role == "Admin" || current_user.role =="Super user"
				@videos=Video.all.order(:title)
			else
			User.ranks.each do |v|
				if v == current_user.rank
					@videos += Video.where(rank: v).order(:title) 
					break
				elsif
					@videos += Video.where(rank: v).order(:title)
				end
			end	
		end	

	end

	def new
		@video = Video.new
		@s3_direct_post = S3_BUCKET.presigned_post(key: "videos/#{SecureRandom.uuid}/${filename}",content_type: "video/mp4", success_action_status: 201, acl: :public_read)
	end
	def show
		
	end
	def my_videos
		@videos = current_user.videos.all.order(:title)		
	end

	def edit
		
	end
	def update
		if @video.update(video_params)
			redirect_to my_videos_path
		else
			render action: 'edit'
		end
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
      params.require(:video).permit(:title, :user_id, :genre_id, :video_descrip, :rank, :file_url)
    end
end
