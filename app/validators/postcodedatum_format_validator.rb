class PostcodedatumFormatValidator < ActiveModel::EachValidator

      def validate_each(record, attribute, value)
          unless value=~ /\A[GIR\s?0AA]|((^([A-PR-UWYZ][0-9][0-9]?)|(^([A-PR-UWYZ][A-HK-Y][0-9][0-9])|^([BR|FY|HA|HD|HG|HR|HS|HX|JE|LD|SM|SR|WC|WN|ZE][0-9])|^([A-PR-UWYZ][A-HK-Y][0-9])|^([AB|LL|SO][0-9][0-9])|^(WC[0-9][A-Z])|(^([A-PR-UWYZ][0-9][A-HJKPSTUW])|^([A-PR-UWYZ][A-HK-Y][0-9][ABEHMNPRVWXY]))))\s[0-9][ABD-HJLNP-UW-Z]{2})\Z/i
            Postcodedatum.delete_all
          end
        end
end
