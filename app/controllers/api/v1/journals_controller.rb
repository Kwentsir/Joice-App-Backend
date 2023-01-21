class Api::V1::JournalsController < ApplicationController
  before_action :set_journal, only: %i[destroy]

  # GET /journals
  def index
    @journals = Journal.all
    if @journals
      render json: { message: 'Journals fetched successfully', data: @journals }, status: :ok
    else
      render json: { message: 'No journals found', errors: @journals.errors.full_messages }, status: :not_found
    end
  end

  def create
    @journal = Journal.new(journal_params)
    if @journal.save
      render json: { message: 'Journal created successfully', data: @journal }, status: :created
    else
      render json: { message: 'Failed to create journal', errors: @journal.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    if @journal.destroy
      render json: { message: 'Journal deleted successfully', data: @journal }, status: :ok
    else
      render json: { message: 'Failed to delete journal', errors: @journal.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    if @journal.update(journal_params)
      render json: { message: 'Journal updated successfully', data: @journal }, status: :ok
    else
      render json: { message: 'Failed to update journal', errors: @journal.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def set_journal
    @journal = Journal.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    render json: { status: 404, error: e.message }, status: :not_found
  end

  def journal_params
    params.require(:journal).permit(:user_id, :voice_id, :file_name, :transcribed_text, :date)
  end
end
