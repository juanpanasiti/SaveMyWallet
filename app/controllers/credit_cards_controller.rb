class CreditCardsController < ApplicationController
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

  protected
  def credit_card_params
    params.require(:credit_card).permit(:user_id, :issuer, :kind, :expiration)
  end
end
