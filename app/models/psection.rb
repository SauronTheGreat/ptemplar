class Psection < ActiveRecord::Base

  #we are using load in develpment mode to catch all changes
  #remember to change to require in production mode for better performance
  load 'lib/MarkupDataExtractor.rb'
  include MarkupDataExtractor


  attr_accessible :markup, :ptemplate_id, :pwidget_id
  serialize :markup, Hash

  #relations
  belongs_to :ptemplate
  belongs_to :pwidget
  has_many :pcontents,:dependent => :destroy
end
