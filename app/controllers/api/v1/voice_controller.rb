class Api::V1::VoiceController < ApplicationController
    before_action :set_voice, only: %i[:destroy]

    # GET /voices
    def index
        @voices = Voice.all
        if @voices
            render json: { message: 'Voices fetched successfully', data: @voices }, status: :ok
        else
            render json: { message: 'No voices found', errors: @voices.errors.full_messages }, status: :not_found
        end
    end

    def create
        @voice = Voice.new(voice_params)
        if @voice.save
            render json: { message: 'Voice created successfully', data: @voice }, status: :created
        else
            render json: { message: 'Failed to create voice', errors: @voice.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        if @voice.destroy
            render json: { message: 'Voice deleted successfully', data: @voice }, status: :ok
        else
            render json: { message: 'Failed to delete voice', errors: @voice.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
        if @voice.update(voice_params)
            render json: { message: 'Voice updated successfully', data: @voice }, status: :ok
        else
            render json: { message: 'Failed to update voice', errors: @voice.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def set_voice
        @voice = Voice.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
        render json: { status: 404, error: e.message }, status: :not_found
    end

    def voice_params
        params.require(:voice).permit(:user_id, :file_name, :voice_file, :date)
    end
end
