class DosesController < ApplicationController
  def new
  	@cocktail = Cocktail.find(params[:cocktail_id])
  	@dose = Dose.new
  end

  def create
  	@cocktail = Cocktail.find(params[:cocktail_id])
	@dose = @cocktail.doses.new(dose_params)
	has_been_saved = @dose.save
    if has_been_saved
	  redirect_to cocktail_path(id: @cocktail.id)
	else
	  render :new
	end
  end

  def destroy
  	@dose = Dose.find(params[:id])
	@dose.destroy
	redirect_to cocktails_path
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end