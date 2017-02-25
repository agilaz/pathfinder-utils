class AbilitiesController < ApplicationController
  def index
    @abilities = Ability.all
  end

  def show
    @ability = Ability.find(params[:id])
  end

  def new
    @ability = Ability.new
  end

  def create
    this_param = ability_params
    this_param[:uses_left] = this_param[:max_uses]
    @ability = Ability.new(this_param)
    if @ability.save
      redirect_to(ability_path)
    else
      render('new')
    end
  end


  def edit
    @ability = Ability.find(params[:id])
  end

  def update
    #TODO add check for uses_left > max_uses
    @ability = Ability.find(params[:id])
    if @ability.update_attributes(ability_params)
      redirect_to(abilities_path)
    else
      render('edit')
    end
  end

  def delete
    @ability = Ability.find(params[:id])
  end

  def destroy
    Ability.find(params[:id]).destroy
    redirect_to(abilities_path)
  end

  def ability_params
    params.require(:ability).permit(:name, :max_uses)
  end
end
