class WeightsController < ApplicationController
  def index
    @weights = Weight.order(:recorded_on)
    @dates = @weights.pluck(:recorded_on).compact.map { |d| d.strftime("%m/%d") }
    @weight_values = @weights.pluck(:weight)
    @fat_rate_values = @weights.pluck(:fat_rate)
  end

  def new
    @weight = Weight.new
  end

  def create
    @weight = Weight.find_or_initialize_by(recorded_on: weight_params[:recorded_on])
    @weight.assign_attributes(weight_params)

    if @weight.save
      redirect_to weights_path, notice: "記録を保存しました（既存データは上書きされます）"
    else
      redirect_to weights_path, alert: "保存に失敗しました"
    end
  end


  private

  def weight_params
    params.require(:weight).permit(:recorded_on, :weight, :fat_rate)
  end
end
