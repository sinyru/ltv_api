class UpdateDatesController < ApplicationController

  def index
    render json: UpdateDate.find(1)
  end

  def update
    if UpdateDate.find(1).update(update_date_params)
      head :no_content
    else
      render json: @update_date.errors, status: :unprocessable_entity
    end
  end

  def update_date_params
    params.require(:update_date).permit(:start_date, :end_date)
  end
end
