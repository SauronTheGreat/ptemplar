class Group < ActiveRecord::Base
  attr_accessible :title, :body, :name
  has_and_belongs_to_many :ptemplates
  serialize :markup
end
