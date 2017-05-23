class CharactersController < ApplicationController
  def index
    @characters = Character.all.where(:user_id => session[:user_id])
    session[:character_id] = nil
  end

  def show
    @character = Character.find(params[:id])
  end

  def new
    @character = Character.new
  end

  def create
    user = User.find(session[:user_id])
    @character = Character.new(character_params)
    if user.characters << @character
      redirect_to(characters_path)
    else
      render('new')
    end
  end

  def edit
    @character = Character.find(params[:id])
  end

  def update
    @character = Character.find(params[:id])
    if @character.update(character_params)
      redirect_to(characters_path)
    else
      render('edit')
    end
  end

  def delete
    @character = Character.find(params[:id])
  end

  def destroy
    @character = Character.find(params[:id])
    @character.abilities.each do |a|
      a.destroy
    end
    @character.destroy
    redirect_to(characters_path)
  end

  def character_params
    params.require(:character).permit(:name,:char_class, :level, :spellcasting_score)
  end

  def load_character
    session[:character_id] = params[:id]
    redirect_to(abilities_path)
  end
end
