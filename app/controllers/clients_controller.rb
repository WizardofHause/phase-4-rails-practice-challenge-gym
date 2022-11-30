class ClientsController < ApplicationController

    before_action :set_client, only: [:show, :update, :destroy]
    
    def index
        render json: Client.all, status: :ok
    end

    def show
        render json: @client, status: :ok
    end

    def create
        client = Client.create!(client_params)
        render json: client, status: :created
    end

    def update
        @client.update!(client_params)
        render json: @client, status: :accepted
    end

    private

    def client_params
        params.permit(:name, :age)
    end

    def set_client
        @client = Client.find(params[:id])
    end

end
