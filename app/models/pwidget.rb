class Pwidget < ActiveRecord::Base
  attr_accessible :builder, :name
  has_many :psections
  has_and_belongs_to_many :ptemplates
end
