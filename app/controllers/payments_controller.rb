class PaymentsController < ApplicationController
  before_action :set_payment, only: [:pay]
  def pay
    if @payment.pay
      redirect_to root_url, notice: "Cuota pagada!"
    else
      redirect_to root_url, alert: "Error!!"
    end
  end

  protected
  def set_payment
    @payment = Payment.find(params[:id])
  end
end
