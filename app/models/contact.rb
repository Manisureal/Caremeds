class Contact
  include ActiveModel::Model
  # attr_accessor :name, :email, :body
  attr_accessor :first_name, :last_name, :phone, :email, :body
  validates :first_name, :last_name, :phone, :email, :body, presence: true
end
