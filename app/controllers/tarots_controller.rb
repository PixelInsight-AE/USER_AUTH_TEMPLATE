module Api
  class TarotsController < ApplicationController
    
    before_action :set_tarot, only: %i[ show update destroy ]

    # GET /tarots
    def index
      @tarots = Tarot.all

      render json: @tarots
    end

    # GET /tarots/1
    def show
      render json: @tarot
    end

    # POST /tarots
    def create
      @tarot = Tarot.new(tarot_params)

      if @tarot.save
        render json: @tarot, status: :created, location: @tarot
      else
        render json: @tarot.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /tarots/1
    def update
      if @tarot.update(tarot_params)
        render json: @tarot
      else
        render json: @tarot.errors, status: :unprocessable_entity
      end
    end

    # DELETE /tarots/1
    def destroy
      @tarot.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_tarot
        @tarot = @user.tarots.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def tarot_params
        params.fetch(:tarot).permit(:name, :image_url, :description, :meaning_up, :meaning_rev, :astrology, :element, :numerology, :user_thoughts, :user_feeling, :major_minor)
      end
  end
end