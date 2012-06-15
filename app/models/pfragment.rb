class Pfragment < ActiveRecord::Base
  attr_accessible :markup, :name

  def self.getJQuery(pcontent_id, pbehavior_id)
    selector="#"+pcontent_id.to_s
    "$('"+selector+"').next()"+".delay("+(Pbehavior.find(pbehavior_id).delay.to_i*1000).to_s+")"+Pfragment.find(Pbehavior.find(pbehavior_id).pfragment_id).markup+";"


  end
end
