module ApplicationHelper
    def gravatar_img_url(email)
        standardized_email = email.strip.downcase
        gravatar_hash = Digest::MD5.hexdigest standardized_email
        default_theme = 'retro'
        size = 64
        gravatar_img_url = "https://www.gravatar.com/avatar/#{gravatar_hash}?s=#{size}&d=#{default_theme}"
    end
end
