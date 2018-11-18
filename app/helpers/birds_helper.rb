module BirdsHelper
  def options_for_species
    Species.pluck(:species_name,:id)
  end
end