class UsersController < ApplicationController
rescue_from ActiveRacord::RecordInvalid, with: :render_unprocessable_entity

    def create
        user = User.create!(user_params)
        render json: user, status: :created
    end

    private

    def user_params
        params.permit(:username, :password, :image_url, :bio)
    end

    def render_unprocessable_entity(invalid)
        render json: { error: invalid.record.errors }, status: :unprocessable_entity
    end

end
