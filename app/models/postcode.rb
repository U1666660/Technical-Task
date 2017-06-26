class Postcode < ApplicationRecord

validates :postcode, :presence => true, :postcode_format => true

end
