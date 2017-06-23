class PostcodeDatum < ApplicationRecord


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      PostcodeDatum.create! row.to_hash
    end
  end


  POSTCODE_REGEX = begin
        an_naa_or_ann_naa   = '^[A-PR-UWYZ]{1}\d{1,2}\s?\d[ABD-HJLNP-UWXYZ]{2}$'
        aan_naa_or_aann_naa = '^[A-PR-UWYZ]{1}[A-HK-Y]{1}\d{1,2}\s?\d[ABD-HJLNP-UWXYZ]{2}$'
        ana_naa             = '^[A-PR-UWYZ]{1}\d[A-HJKSTUW]{1}\s?\d[ABD-HJLNP-UWXYZ]{2}$'
        aana_naa            = '^[A-PR-UWYZ]{1}[A-HK-Y]{1}\d[ABEHMNPRVWXY]{1}\s?\d[ABD-HJLNP-UWXYZ]{2}$'
        historic_code="GIR\s?0AA"
        postcode_spec = "#{an_naa_or_ann_naa}|#{aan_naa_or_aann_naa}|#{ana_naa}|#{aana_naa}|#{historic_code}"
        pattern = /#{postcode_spec}/i
      end


         def validate_each(record, attribute, value)
             unless POSTCODE_REGEX.match value
               record.errors.add(attribute, "#{value} is not a valid post code")
             end
           end





end