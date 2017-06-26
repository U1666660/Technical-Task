class ProblemValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
          unless value=~
            record.errors[attribute] << (options[:message] || "#{value} is not a valid UK postcode")
          end
  end



end





=================================================================================================

class PostcodedatumFormatValidator < ActiveModel::EachValidator

  POSTCODEDATUM_REGEX = begin
        an_naa_or_ann_naa   = '^[A-PR-UWYZ]{1}\d{1,2}\S*\d[ABD-HJLNP-UWXYZ]{2}$'
        aan_naa_or_aann_naa = '^[A-PR-UWYZ]{1}[A-HK-Y]{1}\d{1,2}\S*\d[ABD-HJLNP-UWXYZ]{2}$'
        ana_naa             = '^[A-PR-UWYZ]{1}\d[A-HJKSTUW]{1}\S*\d[ABD-HJLNP-UWXYZ]{2}$'
        aana_naa            = '^[A-PR-UWYZ]{1}[A-HK-Y]{1}\d[ABEHMNPRVWXY]{1}\S*\d[ABD-HJLNP-UWXYZ]{2}$'
        historic_code="GIR\S*0AA"
        postcode_spec = "#{an_naa_or_ann_naa}|#{aan_naa_or_aann_naa}|#{ana_naa}|#{aana_naa}|#{historic_code}"
        pattern = /#{postcode_spec}/i
      end

      def validate_each(record, attribute, value)
          unless value=~ POSTCODEDATUM_REGEX
            Postcodedatum.delete_all
          end
        end

end

=================================================================================================


br = '^([B][R]\d{1})\s*([0-9][ABD-HJLN-UW-Z]{2})$'
fy = '^([F][Y]\d{1})\s*([0-9][ABD-HJLN-UW-Z]{2})$'
ha = '^([H][A]\d{1})\s*([0-9][ABD-HJLN-UW-Z]{2})$'
hd = '^([H][D]\d{1})\s*([0-9][ABD-HJLN-UW-Z]{2})$'
hg = '^([H][G]\d{1})\s*([0-9][ABD-HJLN-UW-Z]{2})$'
hr = '^([H][R]\d{1})\s*([0-9][ABD-HJLN-UW-Z]{2})$'
hs = '^([H][S]\d{1})\s*([0-9][ABD-HJLN-UW-Z]{2})$'
hx = '^([H][X]\d{1})\s*([0-9][ABD-HJLN-UW-Z]{2})$'
je = '^([J][E]\d{1})\s*([0-9][ABD-HJLN-UW-Z]{2})$'
ld = '^([L][D]\d{1})\s*([0-9][ABD-HJLN-UW-Z]{2})$'
sm = '^([S][M]\d{1})\s*([0-9][ABD-HJLN-UW-Z]{2})$'
sr = '^([S][R]\d{1})\s*([0-9][ABD-HJLN-UW-Z]{2})$'
wc = '^([W][C]\d{1})\s*([0-9][ABD-HJLN-UW-Z]{2})$'
wn = '^([W][N]\d{1})\s*([0-9][ABD-HJLN-UW-Z]{2})$'
ze = '^([Z][E]\d{1})\s*([0-9][ABD-HJLN-UW-Z]{2})$'

ab = '^([A][B]\d{2})\s*([0-9][ABD-HJLN-UW-Z]{2})$'
ll = '^([L][L]\d{2})\s*([0-9][ABD-HJLN-UW-Z]{2})$'
so = '^([S][O]\d{2})\s*([0-9][ABD-HJLN-UW-Z]{2})$'
|#{br}|#{fy}|#{ha}|#{hd}|#{hg}|#{hr}|#{hs}|#{hx}|#{je}|#{ld}|#{sm}|#{sr}|#{wc}|#{wn}|#{ze}|#{ab}|#{ll}|#{so}

=======================================================================================

postcodedata = '\[GIR\s?0AA]|^(([A-PR-UWYZ]{1}\d{1,2}?)|^([A-PR-UWYZ]{1}[A-HK-Y]{1}\d{1}(?!(BR|FY|HA|HD|HG|HR|HS|HX|JE|LD|SM|SR|WC|WN|ZE)\d{2}))|^([A-PR-UWYZ]{1}[A-HK-Y]{1}(?!AB|LL|SO)\d{1})|^([W][C]\d{1}[A-Z])|^([A-PR-UWYZ][0-9][A-HJKPSTUW])|^([A-PR-UWYZ][A-HK-Y][0-9][ABEHMNPRVWXY])\s[0-9][ABD-HJLNP-UW-Z]{2})$'

    postcode_spec = "#{'\[GIR\s?0AA]|^(([A-PR-UWYZ]{1}\d{1,2}?)|^([A-PR-UWYZ]{1}[A-HK-Y]{1}\d{1}(?!(BR|FY|HA|HD|HG|HR|HS|HX|JE|LD|SM|SR|WC|WN|ZE)\d{2}))|^([A-PR-UWYZ]{1}[A-HK-Y]{1}(?!AB|LL|SO)\d{1})|^([W][C]\d{1}[A-Z])|^([A-PR-UWYZ][0-9][A-HJKPSTUW])|^([A-PR-UWYZ][A-HK-Y][0-9][ABEHMNPRVWXY])\s[0-9][ABD-HJLNP-UW-Z]{2})$'}"
    pattern = /#{"#{'\[GIR\s?0AA]|^(([A-PR-UWYZ]{1}\d{1,2}?)|^([A-PR-UWYZ]{1}[A-HK-Y]{1}\d{1}(?!(BR|FY|HA|HD|HG|HR|HS|HX|JE|LD|SM|SR|WC|WN|ZE)\d{2}))|^([A-PR-UWYZ]{1}[A-HK-Y]{1}(?!AB|LL|SO)\d{1})|^([W][C]\d{1}[A-Z])|^([A-PR-UWYZ][0-9][A-HJKPSTUW])|^([A-PR-UWYZ][A-HK-Y][0-9][ABEHMNPRVWXY])\s[0-9][ABD-HJLNP-UW-Z]{2})$'}"}/i
