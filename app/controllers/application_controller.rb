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

    def session_user
        binding.pry
        decoded_hash = decoded_token
        if !decoded_hash.empty?
            user_id = decoded_hash[0]['user_id']
            @user = User.find_by(id: user_id)
        else
            nil
        end
    end

    def auth_header
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token, 'my_secret', true, algorithm: 'HS256')
            rescue JWT::DecodeError
                []
            end
        end
    end

end
