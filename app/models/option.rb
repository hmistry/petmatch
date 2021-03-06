class Option
  include Mongoid::Document

  field :name, type: String

  has_and_belongs_to_many :pets

  validates :name, presence: true
end
