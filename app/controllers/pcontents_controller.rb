class PcontentsController < ApplicationController

  Excluded_parameter_list=["utf8", "authenticity_token", "commit", "action", "controller", "psection_id", "pslide_id"]
  # GET /pcontents/new
  # GET /pcontents/new.json
  def new
    @pcontent = Pcontent.new
    6.times { @pcontent.photos.build }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pcontent }
    end
  end

  # GET /pcontents/1/edit
  def edit
    @pcontent = Pcontent.find(params[:id])
    6.times { @pcontent.photos.build }

  end

  # POST /pcontents
  # POST /pcontents.json
  def create
    @pcontent = Pcontent.new(params[:pcontent])

    markup_hash=Hash.new
    markup_hash["DAT"]=params[:pcontent][:markup]

    @pcontent.markup=markup_hash

    respond_to do |format|
      if @pcontent.save
        format.html { redirect_to @pcontent.pslide, notice: 'Pcontent was successfully created.' }
        format.json { render json: @pcontent, status: :created, location: @pcontent }
      else
        format.html { render action: "new" }
        format.json { render json: @pcontent.errors, status: :unprocessable_entity }
      end
    end
  end


  def update

    @pcontent = Pcontent.find(params[:id])

    respond_to do |format|
      if @pcontent.update_attributes(params[:pcontent])
        format.html { redirect_to @pcontent.pslide, notice: 'Slide was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pcontent.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @pcontent = Pcontent.find(params[:id])
    @pcontent.destroy

    respond_to do |format|
      format.html { redirect_to @pcontent.pslide }
      format.json { head :no_content }
    end
  end

  def update_font

    @pcontent=Pcontent.find(params[:pcontent_id])
    markup_hash=@pcontent.markup
    font_data=markup_hash["FON"] ||="-|255|255|255|-|-"
    font_data_array=font_data.split("|")
    font_data_array[0]=params[:font_size]
    font_data_array[4]=params[:font_weight]
    font_data_array[5]=params[:font_family]
    markup_hash["FON"]=font_data_array.join("|")

    #markup_hash["FON"]="#{params[:font_size]}|255|255|255|#{params[:font_weight]}|#{params[:font_family]}"
    @pcontent.markup=markup_hash
    @pcontent.save!
    redirect_to @pcontent.pslide

  end


end