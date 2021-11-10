module ApplicationHelper
    def gravatar_img_url(email)
        standardized_email = email.strip.downcase
        gravatar_hash = Digest::MD5.hexdigest standardized_email
        default_theme = 'retro'
        gravatar_img_url = "https://www.gravatar.com/avatar/#{gravatar_hash}?d=#{default_theme}"
    end
end
