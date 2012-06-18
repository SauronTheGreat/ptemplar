class PslidesController < ApplicationController
  # GET /pslides
  # GET /pslides.json
  def index
    @pslides = Pslide.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pslides }
    end
  end

  # GET /pslides/1
  # GET /pslides/1.json
  def show
    @presentation = Presentation.find_by_name(params[:prez_id])
    @pslide = Pslide.find(params[:id])
    @pcontent=Array.new
    @pbehavior=Pbehavior.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pslide }
    end
  end

  # GET /pslides/new
  # GET /pslides/new.json
  def new
    @pslide = Pslide.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pslide }
    end
  end

  # GET /pslides/1/edit
  def edit

    @pcontent=Pcontent.find(params[:id])
    @section=Section.find(@pcontent.section_id)
    @pslide = Pslide.find(@pcontent.pslide_id)
  end

  # POST /pslides
  # POST /pslides.json
  def create

    @pslide = Pslide.new(params[:pslide])
    markup_hash=Hash.new
    @pslide.markup=markup_hash

    respond_to do |format|
      if @pslide.save
        if params[:prez_id]
          @prez = Presentation.find(params[:prez_id])
          @prezpslide=PresentationsPslide.new
          if @lastsno=PresentationsPslide.find_last_by_presentation_id(@prez.id)
            @sno=@lastsno.sequence_number.to_i + 1
          else
            @sno=1
          end

          @prezpslide.presentation_id=@prez.id
          @prezpslide.pslide_id=@pslide.id
          @prezpslide.sequence_number=@sno
          @prezpslide.save

          format.html { redirect_to "/#{@prez.name}/pslides/#{@pslide.id}", notice: 'Pslide was successfully created.' }
          format.json { render json: @pslide, status: :created, location: @pslide }
        else
          format.html { redirect_to @pslide, notice: 'Pslide was successfully created.' }
          format.json { render json: @pslide, status: :created, location: @pslide }
        end
      else
        format.html { render view_presentation_path(@prez), notice: 'Pick a Ptemplate the next time' }
        format.json { render json: @pslide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pslides/1
  # PUT /pslides/1.json
  def update
    @pslide = Pslide.find(params[:id])

    respond_to do |format|
      if @pslide.update_attributes(params[:pslide])
        format.html { redirect_to @pslide, notice: 'Pslide was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pslide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pslides/1
  # DELETE /pslides/1.json
  def destroy
    @pslide = Pslide.find(params[:id])
    @pslide.destroy

    respond_to do |format|
      format.html { redirect_to homepage_path }
      format.json { head :no_content }
    end
  end

  def save_colors

    @pslide=Pslide.find(params[:pslide][0])
    markup_hash=@pslide.markup
    bcolor=params[:slcol][0][:background].split(",").map { |x| x.scan(/\d+/) }

    markup_hash["BKG"]="-|#{bcolor[0][0]}|#{bcolor[1][0]}|#{bcolor[2][0]}|#{params[:slcol][0][:opacity]}"

    #   @pslide.pbackground=params[:slcol][0][:background] + "|" + params[:slcol][0][:opacity]
    @pslide.markup=markup_hash
    @pslide.save!

    @no_of_records=params[:fields].count

    @no_of_records.times do |i|
      @pcontent=Pcontent.find(params[:fields][i][:pcontent_id])
      markup_hash=@pcontent.markup
      bcolor=params[:fields][i][:background_color].split(",").map { |x| x.scan(/\d+/) }
      markup_hash["BKG"]="-|#{bcolor[0][0]}|#{bcolor[1][0]}|#{bcolor[2][0]}|#{params[:fields][i][:background_opacity]}"
      fcolor=params[:fields][i][:font_color].split(",").map { |x| x.scan(/\d+/) }
      markup_hash["FON"]="#{params[:fields][i][:font_size]}|#{fcolor[0][0]}|#{fcolor[1][0]}|#{fcolor[2][0]}|#{params[:fields][i][:font_weight]}|#{params[:fields][i][:font_family]}"
      @pcontent.markup=markup_hash
      @pcontent.save!
    end
    render :nothing => true
  end

  def save_html_data

    @pslide = Pslide.find(params[:id])
    @pslide.construct_jquery_code
    @pslide_html= render_to_string(:layout => false)
    markup_hash=@pslide.markup
    markup_hash["DAT"]=@pslide_html
    @pslide.markup=markup_hash
    @pslide.save!
    @kit = IMGKit.new(@pslide_html)
    f=File.open("#{Rails.public_path}/pslide_Images/slide_#{@pslide.id}.jpg", "w")
    file=@kit.to_file("#{Rails.public_path}/pslide_Images/slide_#{@pslide.id}.jpg")
    system "cp #{Rails.public_path}/pslide_Images/slide_#{@pslide.id}.jpg #{Rails.root}/assets/pSlide_Images/pSlide_Images/slide_#{@pslide.id}.jpg "

    #TODO:move this code to a separate function
    ################################this is the code to save jquery for the plside from behaviors########################################

    render :text=>@pslide_html
    return

 #   redirect_to @pslide


  end

  def add_to_bank

    @pslide = Pslide.find(params[:pslide_id])
    @pslide.name=params[:name]
    if @pslide.in_bank?
      @pslide.in_bank=false
      class_data="btn btn-inverse design_button"
      text_data="Add In Bank"
    else

      @pslide.in_bank=true
      class_data="btn btn-danger design_button"
      text_data="Remove From Bank"
    end

    @pslide.save
    if params[:name].nil?
      render :text => "hello"
    else
      redirect_to @pslide
    end
    #render :text => "#{class_data}|#{text_data}"

  end

  def extract_psections
    #render :text => params
    #return
    # pslide=Pslide.find(params[:pslide_id])
    ptemplate=Ptemplate.find(params[:ptemplate_id])
    psections=ptemplate.psections
    current_psection=Psection.find(params[:current_psection_id])
    current_ptemplate=current_psection.ptemplate
    psections.each do |psection|
      p=Psection.new
      height_scale_ratio=current_psection.height/600.to_f
      width_scale_ratio= current_psection.width/960.to_f
      height=psection.height*height_scale_ratio
      width=psection.width*width_scale_ratio
      xpos=(psection.xpos*width_scale_ratio)+current_psection.xpos
      ypos=(psection.ypos*height_scale_ratio)+current_psection.ypos


      markup_hash=Hash.new
      markup_hash["DIM"]="#{xpos}|#{ypos}|#{height}|#{width}"
      p.markup=markup_hash
      p.ptemplate_id=current_ptemplate.id
      p.pwidget_id=psection.pwidget.id
      p.save!


    end

    redirect_to customize_ptemplate_path(current_ptemplate)


  end

  def get_animate_data
    # in this method, the view is same as
    #Pslide#show except you see no pcontents.....you have to click on start and end positions...

    #find the pcontent for which positions are being recorded
    @pbehavior=Pbehavior.find(params[:id])
    @pcontent=@pbehavior.pcontent
    @pslide=@pcontent.pslide


  end

  def capture_animate_data

     @pbehavior=Pbehavior.find(params[:pbehavior_id])
     @pcontent=@pbehavior.pcontent
     @pslide=@pcontent.pslide
     markup_hash=@pbehavior.markup
     markup_hash["JS"]="#{params[:start_xpos]}|#{params[:start_ypos]}|#{params[:end_xpos]}|#{params[:end_ypos]}"
     @pbehavior.markup=markup_hash
     @pbehavior.save!
     redirect_to @pslide


  end

  def search_category

      ids=params[:data].split("a")
      @ptemplates=Ptemplate.all
      ids.each do |id|
        @ptemplates=@ptemplates & Pwidget.find(id).ptemplates

      end

      @pslide=Pslide.new

    end

  def search_by_group
      names=params[:data].split("*")
      @ptemplates=Ptemplate.all
      names.each do |name1|
        @ptemplates=@ptemplates & Group.find_by_name(name1).ptemplates
        #render :text => "asadas"
      end
      @pslide=Pslide.new
  end

end
