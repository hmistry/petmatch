class Import
  include Mongoid::Document

  field :zipcode, type: Integer

  validates :zipcode, presence: true
end
