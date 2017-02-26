class AbilitiesController < ApplicationController


  def index
    character = Character.find(session[:character_id])
    if is_spontaneous(character)
      character.load_spontaneous
    end
    @abilities = Ability.all.where(:character_id => session[:character_id])
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
    if Character.find(session[:character_id]).add_ability(@ability)
      redirect_to(abilities_path)
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

  def use_ability
    Ability.find(params[:id]).use_ability
    redirect_to :back
  end

  def refresh_abilities
    Ability.all.each do |a|
      a.refresh_ability
    end
    redirect_to :back
  end
end
