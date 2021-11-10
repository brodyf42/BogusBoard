module PostsHelper
    def comment_preview_limit
        3
    end

    def excess_comment_count(post)
        post.comments.count - comment_preview_limit
    end
end
