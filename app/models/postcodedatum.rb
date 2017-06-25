class Postcodedatum < ApplicationRecord

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Postcodedatum.create! row.to_hash
    end
  end

end
