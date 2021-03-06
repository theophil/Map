class User < ActiveRecord::Base

  # Use built-in rails support for password protection
  has_secure_password
  
  has_many :village_activities

  # Scopes
  # -----------------------------
  scope :alphabetical, -> { order("last_name, first_name") }
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  # Validations
  # -----------------------------
  # make sure required fields are present
  validates_presence_of :first_name, :last_name, :email  
  validates_uniqueness_of :email, allow_blank: true
  validates_format_of :email, :with => /\A[\w]([^@\s,;]+)@(([a-z0-9.-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, :message => "is not a valid format", :allow_blank => true
  validates_presence_of :password, on: :create 
  validates_presence_of :password_confirmation, on: :create 
  validates_confirmation_of :password, message: "does not match"
  validates_length_of :password, minimum: 4, message: "must be at least 4 characters long", allow_blank: true
  validates :role, inclusion: { in: %w[admin], message: "is not a recognized role in system" }

  def proper_name
    first_name + " " + last_name
  end
  
  def name
    last_name + ", " + first_name
  end

  # for use in authorizing with CanCan
  ROLES = [['Administrator', :admin]]

  def role?(authorized_role)
    return false if role.nil?
    role.downcase.to_sym == authorized_role
  end

  # login by email address
  def self.authenticate(email, password)
    find_by_email(email).try(:authenticate, password)
  end

end