class CreditCardsController < ApplicationController
  before_action :set_credit_card, only: [:edit, :update]

  def new
    @credit_card = CreditCard.new
  end
  def create
    @credit_card = CreditCard.new(credit_card_params)
    @credit_card.user_id = current_user.id
    if @credit_card.save
      redirect_to root_path, notice: 'Tarjeta de Crédito creada.'
    end
  end

  def edit
    #code
  end
  def update
    respond_to do |format|
      if @credit_card.update(credit_card_params)
        format.html { redirect_to root_url, notice: 'Tarjeta de Crédito modificada.' }
      else
        format.html { redirect_to root_url, alert: 'Error!!' }
      end
    end
  end

  protected
  def credit_card_params
    params.require(:credit_card).permit(:user_id, :issuer, :kind, :expiration)
  end
  def set_credit_card
    @credit_card = CreditCard.find(params[:id])
  end
end
