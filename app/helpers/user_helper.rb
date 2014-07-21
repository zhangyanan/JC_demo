module UserHelper
  def user_avatar_tag(user,options = {})
    options[:style] ||= :small
    style = case options[:style].to_s
              when "small" then "30*30"
              when "normal" then "100*100"
              when "large" then "240*240"
              when "tiny" then "20*20"
              else options[:style].to_s
            end
    link_to image_tag(user.avatar(style)),user
  end
end
