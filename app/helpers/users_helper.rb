module UsersHelper
    def posts? (current_user)
        if current_user.posts.count == 0 
            false
        else
            true
        end
    end
    
    def comments? (current_user)
        if current_user.comments.count == 0
            false
        else
            true
        end
    end
end
