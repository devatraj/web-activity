class BlockedsController < ApplicationController
  before_action :set_blocked, only: %i[ show update destroy ]

  # GET /blockeds
  def index
    @blockeds = Blocked.all

    render json: @blockeds
  end

  # GET /blockeds/1
  def show
    render json: @blocked
  end

  # POST /blockeds
  def create
    @blocked = Blocked.new(blocked_params)

    if @blocked.save
      render json: @blocked, status: :created, location: @blocked
    else
      render json: @blocked.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /blockeds/1
  def update
    if @blocked.update(blocked_params)
      render json: @blocked
    else
      render json: @blocked.errors, status: :unprocessable_entity
    end
  end

  # DELETE /blockeds/1
  def destroy
    @blocked.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blocked
      @blocked = Blocked.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blocked_params
      params.require(:blocked).permit(:name, :completed)
    end
end
