class ProblemValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
          unless value=~
            record.errors[attribute] << (options[:message] || "#{value} is not a valid UK postcode")
          end
  end



end
