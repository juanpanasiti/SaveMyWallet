class PaymentsController < ApplicationController
  before_action :set_payment, only: [:pay, :unpay, :edit, :update]
  def pay
    if @payment.pay
      redirect_to root_url, notice: "Cuota pagada!"
    else
      redirect_to root_url, alert: "Error!!"
    end
  end #pay

  def unpay
    if @payment.unpay
      redirect_to root_url, alert: "Pago cancelado!"
    else
      redirect_to root_url, alert: "Error!!"
    end
  end #unpay

  def edit
    #code
  end

  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to root_url, notice: 'Monto de cuota modificado.' }
      else
        format.html { redirect_to root_url, alert: 'Error!!' }
      end
    end
  end

  protected
  def set_payment
    @payment = Payment.find(params[:id])
  end
  def payment_params
    params.require(:payment).permit(:amount)
  end
end
