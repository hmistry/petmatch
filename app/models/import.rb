class Import
  include Mongoid::Document

  field :zipcode, type: Integer

  validates :zipcode, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 99999 }
end
