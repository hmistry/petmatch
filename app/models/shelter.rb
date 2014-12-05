class Shelter
  include Mongoid::Document
  # ["country", "longitude", "name", "phone", "state", "address2", "email", "city", "zip", "fax", "latitude", "id", "address1"]

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

end
