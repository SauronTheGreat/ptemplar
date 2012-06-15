class Pslide < ActiveRecord::Base
  attr_accessible :markup, :pbehavior_id, :ptemplate_id, :user_id
  load "lib/MarkupDataExtractor.rb"
  include MarkupDataExtractor
  serialize :markup

  has_many :pcontents, :dependent => :destroy


  belongs_to :ptemplate
  has_many :presentations_pslides, :dependent => :destroy
  has_and_belongs_to_many :presentations

  before_create :get_parent_markup

  def construct_jquery_code
    final_jquery=""
    self.pcontents.each do |pcontent|
        Pbehavior.find_all_by_prev_pcontent_id(pcontent.id).each do |pbehavior|
          if pbehavior.pfragment_id==5
            parameter="var bezier_params = {
              start: {
                  x: #{pbehavior.start_xpos},
                  y: #{pbehavior.start_ypos},

              },
              end: {
                  x: #{pbehavior.end_xpos},
                  y: #{pbehavior.end_ypos},

              }
          }           ;"


            final_jquery=final_jquery+parameter
          end


          final_jquery=final_jquery+"$('#"+pbehavior.pcontent.id.to_s+"').next().hide();"
          final_jquery=final_jquery+"$('#"+pcontent.id.to_s+"').next()."+Pevent.find(pbehavior.pevent_id).name.downcase+"(function(){#{Pfragment.getJQuery(pbehavior.pcontent_id, pbehavior.id)}});"



      end
      Pbehavior.find_all_by_prev_pcontent_id_and_pcontent_id(nil,pcontent.id).each do |pbehavior|
        final_jquery=final_jquery+"$('#"+pbehavior.pcontent.id.to_s+"').next().hide();"
        final_jquery=final_jquery+Pfragment.getJQuery(pbehavior.pcontent_id, pbehavior.id)
      end
    end




    markup_hash=self.markup
    markup_hash["JS"]=final_jquery
    self.markup=markup_hash
    self.save!


  end


  def get_parent_markup
    self.markup=self.markup.merge(Ptemplate.find(self.ptemplate_id).markup)


  end

end
