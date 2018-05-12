class TaxesController < ApplicationController
  before_action :set_tax, only: [:edit, :update, :destroy]
  before_action :options_for_select, only: [:new, :create, :edit, :update]
  def index
    @taxes = current_user.taxes.all
  end

  def new
    @tax = Tax.new
  end
  def create
    @tax = current_user.taxes.new(tax_params)
    if @tax.save
      redirect_to taxes_path, flash: { notice: "Impuesto o factura agregada." }
    else
      render :new
    end
  end

  def edit
    #code
  end
  def update
    respond_to do |format|
      if @tax.update(tax_params)
        format.html { redirect_to taxes_path, notice: 'Factura actualizada.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    if @tax.destroy
      redirect_to taxes_url, flash: { alert: "Factura eliminada" }
    end
  end

  protected
  def set_tax
    @tax = Tax.find(params[:id])
  end

  def tax_params
    params.require(:tax).permit(:name, :amount, :user_id, :status, :exp_date, :note)
  end

  def options_for_select
    @status_options = Tax.get_status_options
  end
end
