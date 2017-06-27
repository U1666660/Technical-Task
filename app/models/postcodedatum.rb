class Postcodedatum < ApplicationRecord



validates :postcode, :presence => true, :doubledig_format => true, :singledig_format => true,  :postcodedatum_format => true


  def self.import(file)
    CSV.foreach(file.path, headers: true ) do |row|
      Postcodedatum.create! row.to_hash
    end
  end


  def self.to_csv
    attributes = %w{row_id postcode}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |postcodedatum|
        csv << postcodedatum.attributes.values_at(*attributes)

      end
      end
  end


end
