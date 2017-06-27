class Postcode < ApplicationRecord

validates :postcode, :presence => true, length: { minimum: 5 }, :postcode_format => true

end
