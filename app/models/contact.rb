class Contact < ApplicationRecord
  
  belongs_to :user, optional: true 
  has_many :contact_groups
  has_many :groups, through: :contact_groups

  validates :name, presence: true
  validates :phone_number, presence: true

end
