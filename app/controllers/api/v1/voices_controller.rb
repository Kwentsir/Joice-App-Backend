class Api::V1::VoicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_voice, only: %i[show destroy update]

  # GET /voices
  def index
   p "current_user #{current_user}"
   @voices = current_user.voices.all
   render json: { message: 'Voices fetched successfully', data: @voices }, status: :ok
  end

  def create
    @voice = current_user.voices.new(voice_params)
    if @voice.save
      render json: { message: 'Voice created successfully', data: @voice }, status: :created
    else
      render json: { message: 'Failed to create voice', errors: @voice.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  
  def show
    voice = Voice.find_by(id: params[:id])
    if voice.present?
      render json: { status: :ok, message: 'Voice found', data: voice }, status: :ok
    else
      render json: { status: :not_found, message: 'Voice not found'}, status: :not_found
    end
  end

  def destroy
    @voice.destroy
      render json: { message: 'Voice deleted successfully', data: @voice }, status: :ok
  end

  def update
    if @voice.update(voice_params)
      render json: { message: 'Voice updated successfully', data: @voice }, status: :ok
    else
      render json: { message: 'Failed to update voice', errors: @voice.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

  def set_voice
    @voice = current_user.voices.find(params[:id])
  end

  def voice_params
    params.require(:voice).permit(:file_name, :voice_file, :date)
  end
end
