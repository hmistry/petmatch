class Breed
  include Mongoid::Document

  field :type, type: String

  belongs_to :animal

  has_and_belongs_to_many :pets

  validates :type, :animal, presence: true
end
