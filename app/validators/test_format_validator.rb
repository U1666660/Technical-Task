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
      return false unless value =~  POSTCODE_SPEC

      end

end
