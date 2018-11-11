module UsersHelper
  def avatar_for(user, options = { size: 300 })
  	size = options[:size]
  	if user.avatar?
  		image_tag user.avatar.url(:thumb), class: 'avatar_image'
  	else
  		image_tag "anon.jpg", class: 'avatar_image'
  	end
  end
end
