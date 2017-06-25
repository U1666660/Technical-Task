class Postcode < ApplicationRecord

validates :postcode, :postcode_format => true

end
