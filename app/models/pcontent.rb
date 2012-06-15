class Pcontent < ActiveRecord::Base
  attr_accessible :markup, :psection_id, :pslide_id ,:passets_attributes
  load "lib/MarkupDataExtractor.rb"
  include MarkupDataExtractor
  belongs_to :pslide
  belongs_to :psection
  has_many :pbehaviors,:dependent => :destroy


  serialize :markup


  has_many :passets, :dependent => :destroy
  accepts_nested_attributes_for :passets, :reject_if => lambda { |a| a[:media_passet].blank? }, :allow_destroy => true

  before_create :get_parent_markup

  def get_parent_markup
    self.markup=self.markup.merge(Psection.find(self.psection_id).markup)
  end

end
