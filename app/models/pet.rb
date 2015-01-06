class Pet
  include Mongoid::Document

  GENDERS = %w(M F U)
  SIZES = %w(S M L XL)
  STATUSES = %w(A H P X)
  AGES = %w(Baby Young Adult Senior)
  MIX = %w(yes no)

  field :id_pf, type: String
  field :shelter_pet_id_pf, type: String
  field :name, type: String
  field :contact, type: String
  field :status, type: String
  field :description, type: String
  field :sex, type: String
  field :age, type: String
  field :size, type: String
  field :mix, type: String
  field :image_url, type: String

  belongs_to :shelter
  belongs_to :animal

  has_and_belongs_to_many :options
  has_and_belongs_to_many :breeds

  validates :shelter, :name,  presence: true

  validates :mix, inclusion: MIX
  validates :sex, inclusion: GENDERS
  validates :age, inclusion: AGES
  validates :status, inclusion: STATUSES
  validates :size, inclusion: SIZES

  def sex_description
    case sex
    when 'M'
      'Male'
    when 'F'
      'Female'
    else
      'Unknown'
    end
  end

  def mix_description
    case mix
    when 'yes'
      'Mix'
    else
      'Pure'
    end
  end

  def status_description
    case status
    when 'A'
      'Adoptable'
    when 'H'
      'On Hold'
    when 'P'
      'Pending'
    else
      'Adopted'
    end
  end

  def size_description
    case size
    when 'S'
      'Small'
    when 'M'
      'Medium'
    when 'L'
      'Large'
    else
      'Extra Large'
    end
  end
end
