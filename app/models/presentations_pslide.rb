class PresentationsPslide < ActiveRecord::Base
  attr_accessible :presentation_id, :pslide_id, :sequence_number
  belongs_to :presentation
  belongs_to :pslide
end
