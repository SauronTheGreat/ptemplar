class Presentation < ActiveRecord::Base
  attr_accessible :name, :user_id ,:markup
  has_many :presentations_pslides,:dependent => :destroy
  has_and_belongs_to_many :pslides
end
