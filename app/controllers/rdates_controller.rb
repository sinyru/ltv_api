class RdatesController < ApplicationController
  def index
    render json: Rdate.last
  end

  def create
    @rdate = Rdate.create(rdate_params)

    if @rdate.save
      render json: @rdate, status: :created
    else
      render json: @rdate.errors, status: :unprocessable_entity
    end
  end

  def rdate_params
    params.require(:rdate).permit(:start_date)
  end
end
