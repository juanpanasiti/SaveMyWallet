class HomeController < ApplicationController
  def index
    @credit_cards = current_user.credit_cards
    @payments = Payment.all
    @purchases = Purchase.no_charged
  end

  def new_credit_card
    #@credit_card = CreditCard.new
    respond_to do |format|
      format.html
      format.js
    end
  end
end
