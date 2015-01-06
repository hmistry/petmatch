class Shelter
  include Mongoid::Document

  field :name, type: String
  field :phone, type: String
  field :email, type: String
  field :address1, type: String
  field :address2, type: String
  field :city, type: String
  field :state, type: String
  field :zip, type: String
  field :country, type: String
  field :id_pf, type: String

  has_many :pets

  validates :name, :city, :state, :zip, :country, :id_pf, presence: true

  default_scope -> { order(state: :asc, city: :asc, name: :asc) }

  def address
    return "#{address1}, #{address2}" if address2 && !address2.empty?
    "#{address1}"
  end
end
