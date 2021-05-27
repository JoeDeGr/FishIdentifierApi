class ApplicationController < ActionController::API
    # def require_login
    #     binding.pry
    #       return head(:forbidden) unless session.include? :user_id
    #   end
    
    #   def current_user
    #       user = (User.find(session[:user_id]) || User.new)
    #   end

    def encode_token(payload)
        JWT.encode(payload, 'my_secret_garden')
    end
end
