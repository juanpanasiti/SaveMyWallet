class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:edit, :update, :delete, :set_payments, :delete_payments]
  before_action :options_for_select, only: [:new, :create, :edit, :update]
  def index
    @purchases = Purchase.all
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.save
      redirect_to purchases_path, notice: 'Compra agregada.'
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to purchases_path, notice: 'Compra actualizada.' }
      else
        format.html { render :edit }
      end
    end
  end

  def delete
  end

  def set_payments
    if Payment.add_payments(@purchase)
      redirect_to root_path, notice: 'Pagos agregados'
    else
      redirect_to root_path, alert: 'Ocurrieron errores'
    end
  end

  def delete_payments
    redirect_to root_path, alert: 'no se borró nada!'
  end

  protected
  def purchase_params
    params.require(:purchase).permit(:item_name, :credit_card_id, :amount, :fees, :first_payment)
  end
  def set_purchase
    @purchase = Purchase.find(params[:id])
  end
  def options_for_select
    @credit_cards_options = CreditCard.get_all
  end
end
