class Ptemplate < ActiveRecord::Base
  load "lib/MarkupDataExtractor.rb"
  include MarkupDataExtractor
  attr_accessible :markup, :name
  has_many :psections,:dependent => :destroy
  has_and_belongs_to_many :pwidgets
  has_and_belongs_to_many :groups
  serialize :markup

end
