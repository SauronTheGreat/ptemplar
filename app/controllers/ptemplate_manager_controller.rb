class PtemplateManagerController < ApplicationController



  def index
    @ptemplates=Ptemplate.all
  end

  def create_new_ptemplate
    @ptemplate=Ptemplate.new
    count=Ptemplate.all.count
    @ptemplate.name="#{current_user.email.split("@")[0]}_ptemplate_#{count}"
    @markup=Hash.new
    @ptemplate.markup=@markup

    @ptemplate.save!
    redirect_to customize_ptemplate_path(@ptemplate)
  end

  def save_ptemplate
    @ptemplate=Ptemplate.find(params[:ptemplate_id])
    @ptemplate.name=params[:name]
    @ptemplate.save!
    if params[:from_index]=="1"
      redirect_to ptemplates_path
    else
      redirect_to customize_ptemplate_path(@ptemplate)
    end
  end

  def customize_ptemplate
    @widgets=Pwidget.all
    @ptemplate=Ptemplate.find(params[:id])
    @photo=Passet.new

  end


  def save_sections
    @ptemplate=Ptemplate.find(params[:ptemplate][0])

    #we now save background color info for the ptemplate...
    markup_hash=@ptemplate.markup
    bcolor=params[:bkg_color][0].split(",").map { |x| x.scan(/\d+/) }
    markup_hash["BKG"]="-|#{bcolor[0][0]}|#{bcolor[1][0]}|#{bcolor[2][0]}|#{params[:opacity][0]}"
    @ptemplate.markup=markup_hash

    @ptemplate.save!

    @ptemplate.psections.each do |section|
      section.destroy
    end
    @no_of_records=params[:fields].count
    @no_of_records.times do |i|
      @section=Psection.new
      @section.ptemplate_id=@ptemplate.id
      @section.pwidget_id=params[:fields][i][:widget_id]
      #we now create markup hash for dimension
      markup_hash=Hash.new
      markup_hash["DIM"]= "#{params[:fields][i][:xpos]}|#{params[:fields][i][:ypos]}|#{params[:fields][i][:height]}|#{params[:fields][i][:width]}"

      background_color=params[:fields][i][:background_color].split(",").map { |x| x.scan(/\d+/) }
      markup_hash["BKG"]="-|#{background_color[0][0]}|#{background_color[1][0]}|#{background_color[2][0]}|#{params[:fields][i][:background_opacity]}"
      if params[:fields][i][:font_color]
      font_color=params[:fields][i][:font_color].split(",").map { |x| x.scan(/\d+/) }
      markup_hash["FON"]="#{params[:fields][i][:font_size]}|#{font_color[0][0]}|#{font_color[1][0]}|#{font_color[2][0]}|#{params[:fields][i][:font_opacity]}|#{params[:fields][i][:font_family]}|#{params[:fields][i][:font_weight]}"
      end

      @section.markup=markup_hash
      @section.save!
    end

    #kit = IMGKit.new(html, :quality => 50)
    #kit = IMGKit.new(File.new('/path/to/html'))
    #kit.stylesheets << '/assets'
    #img = kit.to_img
    #file = kit.to_file('/tryout.jpg')

  end

  def update_ptemplate_font


    @psection=Psection.find(params[:psection_id])
    markup_hash=@psection.markup
    font_color=params[:font_color].split(",").map { |x| x.scan(/\d+/) }
    background_color=params[:background_color].split(",").map { |x| x.scan(/\d+/) }

    markup_hash["FON"]="#{params[:font_size]}|#{font_color[0][0]}|#{font_color[1][0]}|#{font_color[2][0]}|#{params[:font_opacity]}|#{params[:font_family]}|#{params[:font_weight]}"
    markup_hash["BKG"]="-|#{background_color[0][0]}|#{background_color[1][0]}|#{background_color[2][0]}|#{params[:background_opacity]}"
    @psection.markup=markup_hash


    @psection.save!


    redirect_to(customize_ptemplate_path(@psection.ptemplate))


  end



  def delete_ptemplate
    @ptemplate=Ptemplate.find(params[:id])
    @ptemplate.destroy
    redirect_to ptemplates_path, :notice => "You no more have to worry !!"
  end

  def delete_all_ptemplates
    Ptemplate.destroy_all
    redirect_to ptemplates_path, :notice => "Why not start a fresh ??"
  end

  def use_background_image
    #render :text=>params
    #return
    @ptemplate=Ptemplate.find(params[:ptemplate_id])

    @photo=Passet.new(params[:passet])
    @photo.save!
    markup_hash=@ptemplate.markup
    tmp_hash=markup_hash["BKG"].split("|")
    tmp_hash[0]=@photo.media_passet.url.to_s
    markup_hash["BKG"]=tmp_hash.join("|")
    @ptemplate.markup=markup_hash
    @ptemplate.uses_background_image=true
    @ptemplate.save!
    redirect_to customize_ptemplate_path(@ptemplate)
  end

  def remove_background_image
    @ptemplate=Ptemplate.find(params[:ptemplate_id])
    markup_hash=@ptemplate.markup
    tmp_hash=markup_hash["BKG"].split("|")
    tmp_hash[0]="-"
    markup_hash["BKG"]=tmp_hash.join("|")
    @ptemplate.markup=markup_hash
    @ptemplate.uses_background_image=false
    @ptemplate.save!
    redirect_to customize_ptemplate_path(@ptemplate)
  end


end
