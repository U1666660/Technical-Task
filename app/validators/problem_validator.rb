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
=======================================================================================================================
def validate_each(record, attribute, value)

      if value=~ /\A[GIR\s?0AA]\Z|((\A([A-PR-UWYZ][0-9][0-9]?)|(\A([A-PR-UWYZ][A-HK-Y][0-9](?!(BR|FY|HA|HD|HG|HR|HS|HX|JE|LD|SM|SR|WC|WN|ZE)[0-9])[0-9])|\A([A-PR-UWYZ][A-HK-Y](?!AB|LL|SO)[0-9])|\A(WC[0-9][A-Z])|(\A([A-PR-UWYZ][0-9][A-HJKPSTUW])|\A([A-PR-UWYZ][A-HK-Y][0-9][ABEHMNPRVWXY]))))\s[0-9][ABD-HJLNP-UW-Z]{2})\Z/i
                  Faildatum.delete_all
                end
      end
===============================================================================================================================

class TestFormatValidator < ActiveModel::EachValidator

POSTCODE_SPEC = begin

br = '\A([B][R]\d{2})\s*([0-9][ABD-HJLN-UW-Z]{2})\Z'
fy = '\A([F][Y]\d{2})\s*([0-9][ABD-HJLN-UW-Z]{2})\Z'
ha = '\A([H][A]\d{2})\s*([0-9][ABD-HJLN-UW-Z]{2})\Z'
hd = '\A([H][D]\d{2})\s*([0-9][ABD-HJLN-UW-Z]{2})\Z'
hg = '\A([H][G]\d{2})\s*([0-9][ABD-HJLN-UW-Z]{2})\Z'
hr = '\A([H][R]\d{2})\s*([0-9][ABD-HJLN-UW-Z]{2})\Z'
hs = '\A([H][S]\d{2})\s*([0-9][ABD-HJLN-UW-Z]{2})\Z'
hx = '\A([H][X]\d{2})\s*([0-9][ABD-HJLN-UW-Z]{2})\Z'
je = '\A([J][E]\d{2})\s*([0-9][ABD-HJLN-UW-Z]{2})\Z'
ld = '\A([L][D]\d{2})\s*([0-9][ABD-HJLN-UW-Z]{2})\Z'
sm = '\A([S][M]\d{2})\s*([0-9][ABD-HJLN-UW-Z]{2})\Z'
sr = '\A([S][R]\d{2})\s*([0-9][ABD-HJLN-UW-Z]{2})\Z'
wc = '\A([W][C]\d{2})\s*([0-9][ABD-HJLN-UW-Z]{2})\Z'
wn = '\A([W][N]\d{2})\s*([0-9][ABD-HJLN-UW-Z]{2})\Z'
ze = '\A([Z][E]\d{2})\s*([0-9][ABD-HJLN-UW-Z]{2})\Z'
ab = '\A([A][B]\d{1})\s*([0-9][ABD-HJLN-UW-Z]{2})\Z'
ll = '\A([L][L]\d{1})\s*([0-9][ABD-HJLN-UW-Z]{2})\Z'
so = '\A([S][O]\d{1})\s*([0-9][ABD-HJLN-UW-Z]{2})\Z'
junk = '\D+\W$'
noletter = '\d+\W$'
letter = '\A[a-zA-Z ]+\Z'
number = '\A[0-9 ]+\Z'
length = '\A([A-PR-UWYZ][0-9]?)\s*([0-9][ABD-HJLN-UW-Z]{1})\Z'
nospece = '\A([A-PR-UWYZ][A-HK-Y0-9][A-HJKS-UW0-9]?[A-HJKS-UW0-9]?)\S*([0-9][ABD-HJLN-UW-Z]{2})\Z'
q = '\A([Q][A-HK-Y0-9][A-HJKS-UW0-9]?[A-HJKS-UW0-9]?)\s*([0-9][ABD-HJLN-UW-Z]{2})\Z'
v = '\A([V][A-HK-Y0-9][A-HJKS-UW0-9]?[A-HJKS-UW0-9]?)\s*([0-9][ABD-HJLN-UW-Z]{2})\Z'
x = '\A([X][A-HK-Y0-9][A-HJKS-UW0-9]?[A-HJKS-UW0-9]?)\s*([0-9][ABD-HJLN-UW-Z]{2})\Z'
i = '\A([A-PR-UWYZ][I][A-HJKS-UW0-9]?[A-HJKS-UW0-9]?)\s*([0-9][ABD-HJLN-UW-Z]{2})\Z'
j = '\A([A-PR-UWYZ][J][A-HJKS-UW0-9]?[A-HJKS-UW0-9]?)\s*([0-9][ABD-HJLN-UW-Z]{2})\Z'
z = '\A([A-PR-UWYZ][Z][A-HJKS-UW0-9]?[A-HJKS-UW0-9]?)\s*([0-9][ABD-HJLN-UW-Z]{2})\Z'
a9a_q = '\A([A-PR-UWYZ]{1}[0-9]{1}[Q])\s*([0-9][ABD-HJLN-UW-Z]{2})\Z'
aa9a_c = '\A[A-PR-UWYZ]{1}[A-HK-Y]{1}\d[C]{1}\s*\d[ABD-HJLNP-UWXYZ]{2}\Z'


postcode = "#{br}|#{fy}|#{ha}|#{hd}|#{hg}|#{hr}|#{hs}|#{hx}|#{je}|#{ld}|#{sm}|#{sr}|#{wc}|#{wn}|#{ze}|#{ab}&#{ll}|#{so}|#{junk}|#{noletter}|#{letter}|#{length}|#{nospece}|#{q}|#{v}|#{x}|#{i}|#{j}|#{z}|#{a9a_q}|#{aa9a_c}"
pattern = /#{postcode}/i

end

  def validate_each(record, attribute, value)


        if value =! /\A[GIR\s?0AA]\Z|\A([A-PR-UWYZ][A-HK-Y0-9][A-HJKS-UW0-9]?[A-HJKS-UW0-9]?)\s*([0-9][ABD-HJLN-UW-Z]{2})\Z/
          Faildatum.new
        end


  end




end
