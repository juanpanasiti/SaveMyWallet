class HomeController < ApplicationController
  def index
    @credit_cards = current_user.credit_cards
    @new_credit_card = current_user.credit_cards.new
  end

  def new_credit_card
    #@credit_card = CreditCard.new
    respond_to do |format|
      format.html
      format.js
    end
  end
end
