class StaticPagesController < ApplicationController
  def index
    @bmi_user = bmi_cal
    @bmi_result = result_bmi
  end
end
