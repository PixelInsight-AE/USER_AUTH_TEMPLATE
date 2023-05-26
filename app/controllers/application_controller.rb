class ApplicationController < ActionController::API
  use Rack::Attack
  def encode_token(payload)
    JWT.encode(payload, ENV['SECRET_KEY'])
  end
  

  

  def decode_token
    # Bearer <token>
    auth_header = request.headers['Authorization']
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, ENV['SECRET_KEY'], true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def authorized_user
    decoded_token = decode_token()
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end
  #in future controllers use this method to check if user is logged in and has access to the route
  def authorize
    render json: {message: "Please log in"}, status: :unauthorized unless authorized_user
  end


end
