class PostcodeFormatValidator < ActiveModel::EachValidator

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



      if value=~ /^([A-PR-UWYZ][0-9]?)\s*([0-9][ABD-HJLN-UW-Z]{1})$/i
          record.errors[attribute] << (options[:message] || "Incorrect inward code length")
      end

      if value=~ /^([A-PR-UWYZ][A-HK-Y0-9][A-HJKS-UW0-9]?[A-HJKS-UW0-9]?)\S*([0-9][ABD-HJLN-UW-Z]{2})$/i
          record.errors[attribute] << (options[:message] || "No space")
      end


      if value=~ /^([Q][A-HK-Y0-9][A-HJKS-UW0-9]?[A-HJKS-UW0-9]?)\s*([0-9][ABD-HJLN-UW-Z]{2})$/i
          record.errors[attribute] << (options[:message] || "'Q' in first postion")
      end

      if value=~ /^([V][A-HK-Y0-9][A-HJKS-UW0-9]?[A-HJKS-UW0-9]?)\s*([0-9][ABD-HJLN-UW-Z]{2})$/i
          record.errors[attribute] << (options[:message] || "'V' in first postion")
      end

      if value=~ /^([X][A-HK-Y0-9][A-HJKS-UW0-9]?[A-HJKS-UW0-9]?)\s*([0-9][ABD-HJLN-UW-Z]{2})$/i
          record.errors[attribute] << (options[:message] || "'X' in first postion")
      end

      if value=~ /^([A-PR-UWYZ][I][A-HJKS-UW0-9]?[A-HJKS-UW0-9]?)\s*([0-9][ABD-HJLN-UW-Z]{2})$/i
          record.errors[attribute] << (options[:message] || "'I' in second postion")
      end

      if value=~ /^([A-PR-UWYZ][J][A-HJKS-UW0-9]?[A-HJKS-UW0-9]?)\s*([0-9][ABD-HJLN-UW-Z]{2})$/i
          record.errors[attribute] << (options[:message] || "'J' in second postion")
      end

      if value=~ /^([A-PR-UWYZ][Z][A-HJKS-UW0-9]?[A-HJKS-UW0-9]?)\s*([0-9][ABD-HJLN-UW-Z]{2})$/i
          record.errors[attribute] << (options[:message] || "'Z' in second postion")
      end

      if value=~ /^([A-PR-UWYZ]{1}[0-9]{1}[Q])\s*([0-9][ABD-HJLN-UW-Z]{2})$/i
          record.errors[attribute] << (options[:message] || "'Q' in third postion with 'A9A' structure")
      end


      if value=~ /^[A-PR-UWYZ]{1}[A-HK-Y]{1}\d[C]{1}\s*\d[ABD-HJLNP-UWXYZ]{2}$/i
          record.errors[attribute] << (options[:message] || "'C' in fourth postion with 'AA9A' structure")
      end



      if value=~ /^[A-PR-UWYZ][A-HK-Y][0-9](?!(BR|FY|HA|HD|HG|HR|HS|HX|JE|LD|SM|SR|WC|WN|ZE)[0-9])[0-9]\s*\d[ABD-HJLNP-UWXYZ]{2}$/i
          record.errors[attribute] << (options[:message] || "Area with only single digit districts")

      end

      if value=~ /^[A-PR-UWYZ][A-HK-Y](?!AB|LL|SO)[0-9]\s*\d[ABD-HJLNP-UWXYZ]{2}$/i
          record.errors[attribute] << (options[:message] || "Area with only double digit districts")
        end

              unless value=~ POSTCODE_REGEX
              end



end







end
