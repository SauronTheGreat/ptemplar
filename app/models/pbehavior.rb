class Pbehavior < ActiveRecord::Base
  attr_accessible :markup, :pcontent_id, :pevent_id, :pfragment_id ,:prev_pcontent_id,:delay
  belongs_to :pcontent
  include MarkupDataExtractor
  serialize :markup



end
