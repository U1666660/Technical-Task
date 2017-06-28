class Faildatum < ApplicationRecord

validates :postcode, :presence => true, :faildatum_format => true



    def self.import(file)
      CSV.foreach(file.path, headers: true ) do |row|
        Faildatum.create! row.to_hash
      end
    end


    def self.to_csv
      attributes = %w{row_id postcode}

      CSV.generate(headers: true) do |csv|
        csv << attributes

        all.each do |faildatum|
          csv << faildatum.attributes.values_at(*attributes)

        end
        end
    end



end
