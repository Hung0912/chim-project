module UsersHelper
	def avatar_for user
		gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
		gravatar_url = "anon.jpg"
		image_tag(user.avatar, alt: user.user_name, class: "gravatar")
	end
	def image_tag(source, options={})
		source = "anon.jpg" if source.blank?
		super(source, options)
	end
end
