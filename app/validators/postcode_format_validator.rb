class PostcodeFormatValidator < ActiveModel::EachValidator

POSTCODE_REGEX = begin
        an_naa_or_ann_naa   = '^[A-PR-UWYZ]{1}\d{1,2}\s?\d[ABD-HJLNP-UWXYZ]{2}$'
        aan_naa_or_aann_naa = '^[A-PR-UWYZ]{1}[A-HK-Y]{1}\d{1,2}\s?\d[ABD-HJLNP-UWXYZ]{2}$'
        ana_naa             = '^[A-PR-UWYZ]{1}\d[A-HJKPSTUW]{1}\s?\d[ABD-HJLNP-UWXYZ]{2}$'
        aana_naa            = '^[A-PR-UWYZ]{1}[A-HK-Y]{1}\d[ABEHMNPRVWXY]{1}\s?\d[ABD-HJLNP-UWXYZ]{2}$'
        historic_code="GIR\s?0AA"
        postcode_spec = "#{an_naa_or_ann_naa}|#{aan_naa_or_aann_naa}|#{ana_naa}|#{aana_naa}|#{historic_code}"
        pattern = /#{postcode_spec}/i
      end


SINGLE_DIGIT = begin

br = '^([B][R]\d{2})\s*([0-9][ABD-HJLN-UW-Z]{2})$'
fy = '^([F][Y]\d{2})\s*([0-9][ABD-HJLN-UW-Z]{2})$'
ha = '^([H][A]\d{2})\s*([0-9][ABD-HJLN-UW-Z]{2})$'
hd = '^([H][D]\d{2})\s*([0-9][ABD-HJLN-UW-Z]{2})$'
hg = '^([H][G]\d{2})\s*([0-9][ABD-HJLN-UW-Z]{2})$'
hr = '^([H][R]\d{2})\s*([0-9][ABD-HJLN-UW-Z]{2})$'
hs = '^([H][S]\d{2})\s*([0-9][ABD-HJLN-UW-Z]{2})$'
hx = '^([H][X]\d{2})\s*([0-9][ABD-HJLN-UW-Z]{2})$'
je = '^([J][E]\d{2})\s*([0-9][ABD-HJLN-UW-Z]{2})$'
ld = '^([L][D]\d{2})\s*([0-9][ABD-HJLN-UW-Z]{2})$'
sm = '^([S][M]\d{2})\s*([0-9][ABD-HJLN-UW-Z]{2})$'
sr = '^([S][R]\d{2})\s*([0-9][ABD-HJLN-UW-Z]{2})$'
wc = '^([W][C]\d{2})\s*([0-9][ABD-HJLN-UW-Z]{2})$'
wn = '^([W][N]\d{2})\s*([0-9][ABD-HJLN-UW-Z]{2})$'
ze = '^([Z][E]\d{2})\s*([0-9][ABD-HJLN-UW-Z]{2})$'

single_digit = "#{br}|#{fy}|#{ha}|#{hd}|#{hg}|#{hr}|#{hs}|#{hx}|#{je}|#{ld}|#{sm}|#{sr}|#{wc}|#{wn}|#{ze}"
pattern = /#{single_digit}/i

end


DOUBLE_DIGIT = begin

ab = '^([A][B]\d{1})\s*([0-9][ABD-HJLN-UW-Z]{2})$'
ll = '^([L][L]\d{1})\s*([0-9][ABD-HJLN-UW-Z]{2})$'
so = '^([S][O]\d{1})\s*([0-9][ABD-HJLN-UW-Z]{2})$'


double_digit = "#{ab}|#{ll}|#{so}"
pattern = /#{double_digit}/i

end

THIRD_POSITION = begin

i = '^([A-PR-UWYZ]{1}[0-9]{1}[I])\s*([0-9][ABD-HJLN-UW-Z]{2})$'
l = '^([A-PR-UWYZ]{1}[0-9]{1}[L])\s*([0-9][ABD-HJLN-UW-Z]{2})$'
m = '^([A-PR-UWYZ]{1}[0-9]{1}[M])\s*([0-9][ABD-HJLN-UW-Z]{2})$'
n = '^([A-PR-UWYZ]{1}[0-9]{1}[N])\s*([0-9][ABD-HJLN-UW-Z]{2})$'
o = '^([A-PR-UWYZ]{1}[0-9]{1}[O])\s*([0-9][ABD-HJLN-UW-Z]{2})$'
q = '^([A-PR-UWYZ]{1}[0-9]{1}[Q])\s*([0-9][ABD-HJLN-UW-Z]{2})$'
r = '^([A-PR-UWYZ]{1}[0-9]{1}[R])\s*([0-9][ABD-HJLN-UW-Z]{2})$'
v = '^([A-PR-UWYZ]{1}[0-9]{1}[V])\s*([0-9][ABD-HJLN-UW-Z]{2})$'
y = '^([A-PR-UWYZ]{1}[0-9]{1}[Y])\s*([0-9][ABD-HJLN-UW-Z]{2})$'
x = '^([A-PR-UWYZ]{1}[0-9]{1}[X])\s*([0-9][ABD-HJLN-UW-Z]{2})$'
z = '^([A-PR-UWYZ]{1}[0-9]{1}[Z])\s*([0-9][ABD-HJLN-UW-Z]{2})$'

third_position = "#{i}|#{l}|#{m}|#{n}|#{o}|#{q}|#{r}|#{v}|#{y}|#{x}|#{z}"
pattern = /#{third_position}/i

end

FOURTH_POSTION = begin

c = '^[A-PR-UWYZ]{1}[A-HK-Y]{1}\d[C]{1}\s*\d[ABD-HJLNP-UWXYZ]{2}$'
d = '^[A-PR-UWYZ]{1}[A-HK-Y]{1}\d[D]{1}\s*\d[ABD-HJLNP-UWXYZ]{2}$'
f = '^[A-PR-UWYZ]{1}[A-HK-Y]{1}\d[F]{1}\s*\d[ABD-HJLNP-UWXYZ]{2}$'
g = '^[A-PR-UWYZ]{1}[A-HK-Y]{1}\d[G]{1}\s*\d[ABD-HJLNP-UWXYZ]{2}$'
i = '^[A-PR-UWYZ]{1}[A-HK-Y]{1}\d[I]{1}\s*\d[ABD-HJLNP-UWXYZ]{2}$'
j = '^[A-PR-UWYZ]{1}[A-HK-Y]{1}\d[J]{1}\s*\d[ABD-HJLNP-UWXYZ]{2}$'
k = '^[A-PR-UWYZ]{1}[A-HK-Y]{1}\d[K]{1}\s*\d[ABD-HJLNP-UWXYZ]{2}$'
l = '^[A-PR-UWYZ]{1}[A-HK-Y]{1}\d[L]{1}\s*\d[ABD-HJLNP-UWXYZ]{2}$'
o = '^[A-PR-UWYZ]{1}[A-HK-Y]{1}\d[O]{1}\s*\d[ABD-HJLNP-UWXYZ]{2}$'
q = '^[A-PR-UWYZ]{1}[A-HK-Y]{1}\d[Q]{1}\s*\d[ABD-HJLNP-UWXYZ]{2}$'
s = '^[A-PR-UWYZ]{1}[A-HK-Y]{1}\d[S]{1}\s*\d[ABD-HJLNP-UWXYZ]{2}$'
t = '^[A-PR-UWYZ]{1}[A-HK-Y]{1}\d[T]{1}\s*\d[ABD-HJLNP-UWXYZ]{2}$'
u = '^[A-PR-UWYZ]{1}[A-HK-Y]{1}\d[U]{1}\s*\d[ABD-HJLNP-UWXYZ]{2}$'
z = '^[A-PR-UWYZ]{1}[A-HK-Y]{1}\d[Z]{1}\s*\d[ABD-HJLNP-UWXYZ]{2}$'

fourth_position = "#{c}|#{d}|#{f}|#{g}|#{i}|#{j}|#{k}|#{l}|#{o}|#{q}|#{s}|#{t}|#{u}|#{z}"
pattern = /#{fourth_position}/i

end


def validate_each(record, attribute, value)

      if value =~ /\D+\W$/i
          record.errors[attribute] << (options[:message] || "Junk")
      end

      if value =~ /\d+\W$/i
          record.errors[attribute] << (options[:message] || "Junk")
      end

      if value =~ /\A[a-zA-Z ]+\z/i
          record.errors[attribute] << (options[:message] || "Invalid")
      end


      if value =~ /\A[0-9 ]+\z/i
          record.errors[attribute] << (options[:message] || "Invalid")
      end



      if value =~ /^([A-PR-UWYZ][0-9]?)\s*([0-9][ABD-HJLN-UW-Z]{1})$/i
          record.errors[attribute] << (options[:message] || "Incorrect inward code length")
      end

      if value =~ /^([A-PR-UWYZ][A-HK-Y0-9][A-HJKS-UW0-9]?[A-HJKS-UW0-9]?)\S*([0-9][ABD-HJLN-UW-Z]{2})$/i
          record.errors[attribute] << (options[:message] || "No space")
      end


      if value =~ /^([Q][A-HK-Y0-9][A-HJKS-UW0-9]?[A-HJKS-UW0-9]?)\s*([0-9][ABD-HJLN-UW-Z]{2})$/i
          record.errors[attribute] << (options[:message] || "'Q' in first postion")
      end

      if value =~ /^([V][A-HK-Y0-9][A-HJKS-UW0-9]?[A-HJKS-UW0-9]?)\s*([0-9][ABD-HJLN-UW-Z]{2})$/i
          record.errors[attribute] << (options[:message] || "'V' in first postion")
      end

      if value =~ /^([X][A-HK-Y0-9][A-HJKS-UW0-9]?[A-HJKS-UW0-9]?)\s*([0-9][ABD-HJLN-UW-Z]{2})$/i
          record.errors[attribute] << (options[:message] || "'X' in first postion")
      end

      if value =~ /^([A-PR-UWYZ][I][A-HJKS-UW0-9]?[A-HJKS-UW0-9]?)\s*([0-9][ABD-HJLN-UW-Z]{2})$/i
          record.errors[attribute] << (options[:message] || "'I' in second postion")
      end

      if value =~ /^([A-PR-UWYZ][J][A-HJKS-UW0-9]?[A-HJKS-UW0-9]?)\s*([0-9][ABD-HJLN-UW-Z]{2})$/i
          record.errors[attribute] << (options[:message] || "'J' in second postion")
      end

      if value =~ /^([A-PR-UWYZ][Z][A-HJKS-UW0-9]?[A-HJKS-UW0-9]?)\s*([0-9][ABD-HJLN-UW-Z]{2})$/i
          record.errors[attribute] << (options[:message] || "'Z' in second postion")
      end

      if value =~ /^([A-PR-UWYZ]{1}[0-9]{1}[Q])\s*([0-9][ABD-HJLN-UW-Z]{2})$/i
          record.errors[attribute] << (options[:message] || "'Q' in third postion with 'A9A' structure")
      end


      if value =~ /^[A-PR-UWYZ]{1}[A-HK-Y]{1}\d[C]{1}\s*\d[ABD-HJLNP-UWXYZ]{2}$/i
          record.errors[attribute] << (options[:message] || "'C' in fourth postion with 'AA9A' structure")
      end

      if value=~ THIRD_POSITION
        record.errors[attribute] << (options[:message] || "#{value} third postion error! 'A9A' structure only allow ABCDEFGHJKPSTUW in the third position.")
        end

        if value=~ FOURTH_POSTION
          record.errors[attribute] << (options[:message] || "#{value} fourth postion error! 'AA9A' structure only allow ABEHMNPRVWXY in the fourth position.")
          end


      if value =~ SINGLE_DIGIT
          record.errors[attribute] << (options[:message] || "Area with only single digit districts")

      end

      if value =~ DOUBLE_DIGIT
          record.errors[attribute] << (options[:message] || "Area with only double digit districts")
        end

        unless value=~ POSTCODE_REGEX
          return false
          save
        end


end



end
