class MeasurementsController < ApplicationController
  respond_to :json
  before_filter :find_keg

  def index
    respond_with(@keg.measurements)
  end

  def show
    measurement = @keg.measurements.find(params[:id])
    respond_with([@keg, measurement])
  end

  def create
    measurement_params = params[:measurement].except(:sampled_at, :keg_id)
    measurement = @keg.measurements.create(measurement_params)
    respond_with(@keg, measurement)
  end

  private

  def find_keg
    @keg = Keg.find(params[:keg_id])
  end
end
