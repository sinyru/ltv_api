class MonthReportsController < ApplicationController

  def index
      render json: MonthReport.all
  end

  def create

    @month_report = MonthReport.create(month_report_params)
    if @month_report.save
      render json: @month_report, status: :created
    else
      render json: @month_report.errors, status: :unprocessable_entity
    end

  end

  def month_report_params
    params.require(:month_report).permit(:order_counts, :sample_counts, :six_counts,
      :twelve_counts, :twenty_four_counts, :subscriber_counts, :date_range)
  end

end
