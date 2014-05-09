class User < ActiveRecord::Base

  # Use built-in rails support for password protection
  has_secure_password

  # relationships
  has_many :villages
  has_many :activities
  has_many :village_activities

  # Scopes
  # -----------------------------
  scope :alphabetical, -> { order("last_name, first_name") }
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  # validations
  validates :username, presence: true, uniqueness: { case_sensitive: false}
  validates_presence_of :password, on: :create 
  validates_presence_of :password_confirmation, on: :create 
  validates_confirmation_of :password, message: "does not match"
  validates_length_of :password, minimum: 4, message: "must be at least 4 characters long", allow_blank: true

  def proper_name
    first_name + " " + last_name
  end
  
  def name
    last_name + ", " + first_name
  end

  # for use in authorizing with CanCan

  def self.authenticate(username,password)
    find_by_username(username).try(:authenticate, password)
  end
  
  def role?(authorized_role)
    return false if role.nil?
    role.downcase.to_sym == authorized_role
  end

end