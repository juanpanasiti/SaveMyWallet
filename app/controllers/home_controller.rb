class HomeController < ApplicationController
  def index
    @credit_cards = current_user.credit_cards
    @purchases = current_user.purchases.no_charged
    @payments = current_user.payments
    @months_resume = Purchase.months_resume
  end

  def new_credit_card
    #@credit_card = CreditCard.new
    respond_to do |format|
      format.html
      format.js
    end
  end
end
