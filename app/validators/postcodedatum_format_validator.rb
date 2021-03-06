class PostcodedatumFormatValidator < ActiveModel::EachValidator

  POSTCODEDATUM_REGEX = begin
            an_naa_or_ann_naa   = '\A[A-PR-UWYZ]{1}\d{1,2}\s?\d[ABD-HJLNP-UWXYZ]{2}\Z'
            aan_naa_or_aann_naa = '\A[A-PR-UWYZ]{1}[A-HK-Y]{1}\d{1,2}\s?\d[ABD-HJLNP-UWXYZ]{2}\Z'
            ana_naa             = '\A[A-PR-UWYZ]{1}\d[A-HJKSTUW]{1}\s?\d[ABD-HJLNP-UWXYZ]{2}\Z'
            aana_naa            = '\A[A-PR-UWYZ]{1}[A-HK-Y]{1}\d[ABEHMNPRVWXY]{1}\s?\d[ABD-HJLNP-UWXYZ]{2}\Z'
            historic_code="GIR\s?0AA"
            postcode_spec = "#{an_naa_or_ann_naa}|#{aan_naa_or_aann_naa}|#{ana_naa}|#{aana_naa}|#{historic_code}"
            pattern = /#{postcode_spec}/i
          end




      def validate_each(record, attribute, value)

      unless value =~ POSTCODEDATUM_REGEX
                  Postcodedatum.delete_all
                end
      end




end
