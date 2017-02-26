class PreparedSpellsController < ApplicationController
  def index
    character = Character.find(session[:character_id])
    @spells_allowed = spells_per_day(character)
    @spells = get_spells(@spells_allowed)
  end

  def new
    @prepared_spell = PreparedSpell.new
    character = Character.find(session[:character_id])
    @all_spells = Spell.all.where(character.char_class.to_sym => params[:level]).order('name ASC')
    @spells_allowed = spells_per_day(character)
    @spells = get_spells(@spells_allowed)
  end

  def create
    character = Character.find(session[:character_id])
    spell = Spell.find(params[:spell_id])
    prepared_spell = PreparedSpell.new(:name => spell.name, :uses => 1, :level => spell.attributes[character.char_class])
    if character.add_prepared_spell(prepared_spell)
      redirect_to(prepared_spells_path)
    else
      render('new')
    end
  end

  def get_spells(spells_allowed)
    spells = Hash.new
    for i in 0..spells_allowed.length
      unless spells_allowed[i].nil?
        spells[i]=PreparedSpell.all.where(:level => i).order('name ASC')
      end
    end
    spells
  end

end
