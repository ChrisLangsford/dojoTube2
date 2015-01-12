module ApplicationHelper
	def avatar_url(user, size)
		gravatar_id= Digest::MD5::hexdigest(user)
		"http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=identicon"		
	end
end
