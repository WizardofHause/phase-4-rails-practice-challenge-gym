class GymsController < ApplicationController

    before_action :set_gym, only: [:show, :update, :destroy]

    def index
        render json: Gym.all, status: :ok
    end
    
    def show
        render json: @gym, status: :ok
    end

    def update
        @gym.update!(gym_params)
        render json: @gym, status: :accepted
    end

    def destroy
        @gym.memberships.destroy_all
        @gym.destroy
        render json: {}
    end

    private

    def gym_params
        params.permit(:name, :address)
    end

    def set_gym
        @gym = Gym.find(params[:id])
    end

end
