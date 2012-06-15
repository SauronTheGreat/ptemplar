class Ptemplate < ActiveRecord::Base
  load "lib/MarkupDataExtractor.rb"
  include MarkupDataExtractor
  attr_accessible :markup, :name
  has_many :psections,:dependent => :destroy
  serialize :markup

end
