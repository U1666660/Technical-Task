class SingledigFormatValidator < ActiveModel::EachValidator

  SINGLE_DIGIT = begin

    br = '\A([B][R]\d{2})\s*([0-9][ABD-HJLN-UW-Z]{2})\Z'
    fy = '\A([F][Y]\d{2})\s*([0-9][ABD-HJLN-UW-Z]{2})\Z'
    ha = '\A([H][A]\d{2})\s*([0-9][ABD-HJLN-UW-Z]{2})\Z'
    hd = '\A([H][D]\d{2})\s*(\d{1}[ABD-HJLN-UW-Z]{2})\Z'
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

  single_digit = "#{br}|#{fy}|#{ha}|#{hd}|#{hg}|#{hr}|#{hs}|#{hx}|#{je}|#{ld}|#{sm}|#{sr}|#{wc}|#{wn}|#{ze}"
  pattern = /#{single_digit}/i

  end

              def validate_each(record, attribute, value)

                if value =~ SINGLE_DIGIT
                    Postcodedatum.delete_all
                  end

                end



end
