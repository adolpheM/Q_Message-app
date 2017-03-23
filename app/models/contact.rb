class Contact < ApplicationRecord
  
  belongs_to :user, optional: true 
  has_many :contact_groups
  has_many :groups, through: :contact_groups

end
