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

  def plus
    @prepared_spell = PreparedSpell.find(params[:id])
    character = Character.find(session[:character_id])
    if character.has_slots_left(@prepared_spell.level)
      @prepared_spell.update(:uses => @prepared_spell.uses+1)
    end
    redirect_to :back
  end

  def minus
    @prepared_spell = PreparedSpell.find(params[:id])
    @prepared_spell.update(:uses => @prepared_spell.uses-1)
    if @prepared_spell.uses <= 0
      character = Character.find(session[:character_id])
      character.remove_prepared_spell(@prepared_spell)
      @prepared_spell.destroy
    end
    redirect_to :back
  end
end
