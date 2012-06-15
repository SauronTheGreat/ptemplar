class Passet < ActiveRecord::Base
  attr_accessible :caption, :markup, :media_passet, :pcontent_id


  has_attached_file :media_passet,

                    #:convert_options => { :original => "-quality 10" }
                    # after_media_passet_post_process :red_quality


                    :styles => {

                        :original => {
                            :geometry => "256x256<",
                            :processors => [:qresize]

                            #  :geometry=>"600x600",
                            # :quality => 10
                        }
                    }
  #:convert_options=>{:quality=>"-quality 10 "}


  belongs_to :pcontent

  def set_size


    ori_img =Paperclip::Geometry.from_file(self.media_passet.queued_for_write[:original].path)
    #  ori_img=self.media_passet.to_file
    # debugger
    "#{ori_img.width.to_i}x#{ori_img.height.to_i}"

  end
end
