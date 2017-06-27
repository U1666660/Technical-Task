class DoubledigFormatValidator < ActiveModel::EachValidator

  DOUBLE_DIGIT = begin

    ab = '\A([A][B]\d{1})\s*([0-9][ABD-HJLN-UW-Z]{2})\Z'
    ll = '\A([L][L]\d{1})\s*([0-9][ABD-HJLN-UW-Z]{2})\Z'
    so = '\A[SO][0-9]{2}[ABD-HJLN-UW-Z]{2}\Z'


  double_digit = "#{ab}|#{ll}|#{so}"
  pattern = /#{double_digit}/i

  end

  def validate_each(record, attribute, value)
  if value =~ DOUBLE_DIGIT
        Postcodedatum.delete_all
      end

  end




end
