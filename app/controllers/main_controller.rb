require "csv"

class MainController < ApplicationController
  def scrape_spells
    Spell.all.each do |s|
      s.destroy
    end

    headers = CSV.open('spell_full.csv', 'r') { |csv| csv.first }
    index_hash = Hash.new
    for i in 26..40 do
      index_hash[i] = headers[i]
    end
    for i in 78..87 do
      index_hash[i] = headers[i]
    end


    CSV.foreach("spell_full.csv", {:force_quotes => true, :headers => true}) do |row|
      spell_attributes = Hash.new
      spell_attributes[:name] = row[0]
      index_hash.each do |i, c|
        unless row[i][1] <=> "null"
          spell_attributes[c] = row[i]
        end
      end
      spell = Spell.new(spell_attributes)
      spell.warpriest = spell.cleric
      spell.save
    end
    redirect_to(root_path)
  end
end
