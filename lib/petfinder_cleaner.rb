module Petfinder

  class Cleaner
    def initialize
      @keys_ren = []
      @keys_del = []
    end

    def clean_all(arr)
      [*arr].each { |h| clean(h) }
    end

    def clean(hash)
      rename_keys(hash)
      delete_keys(hash)
      clean_values(hash)
    end

    def rename_keys(hash)
      @keys_ren.each { |k| hash[k[:new]] = hash[k[:old]] }
    end

    def delete_keys(hash)
      @keys_del.each { |k| hash.delete(k) }
    end

    def clean_values(hash)
      hash.keys.each do |k|
        if hash[k].empty?
          hash[k] = nil
        else
          hash[k] = hash[k]["$t"]
        end
      end
    end
  end

  class ShelterCleaner < Cleaner
    def initialize
      @keys_ren = [{old: "id", new: "id_pf"}]
      @keys_del = %w(id fax latitude longitude)
    end
  end

  class PetCleaner < Cleaner
    # ["options", "breeds", "shelterPetId", "status", "name", "contact", "description", "sex", "age", "size", "mix", "shelterId", "lastUpdate", "media", "animal", "id_pf"]
    def initialize
      @keys_ren = [{old: "id", new: "id_pf"}, {old: "shelterPetId", new: "shelter_pet_id_pf"}, {old: "shelterId", new: "shelter_id_pf"}]
      @keys_del = %w(id shelterPetId shelterId options breeds status description sex age size mix lastUpdate media animal)
    end
  end

end
