class PresentationsPslidesController < ApplicationController
  # GET /presentation_pslides
  # GET /presentation_pslides.json
  def index
    @presentation_pslides = PresentationsPslide.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @presentation_pslides }
    end
  end

  # GET /presentation_pslides/1
  # GET /presentation_pslides/1.json
  def show
    @presentation_pslide = PresentationsPslide.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @presentation_pslide }
    end
  end

  # GET /presentation_pslides/new
  # GET /presentation_pslides/new.json
  def new
    @presentation_pslide = PresentationsPslide.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @presentation_pslide }
    end
  end

  # GET /presentation_pslides/1/edit
  def edit
    @presentation_pslide = PresentationsPslide.find(params[:id])
  end

  # POST /presentation_pslides
  # POST /presentation_pslides.json
  def create

    @presentation_pslide = PresentationsPslide.new(params[:presentations_pslide])

    respond_to do |format|
      if @presentation_pslide.save
        format.html { redirect_to view_presentation_path(@presentation_pslide.presentation.id), notice: 'PresentationPslide was successfully created.' }
        format.json { render json: @presentation_pslide, status: :created, location: @presentation_pslide }
      else
        format.html { render action: "new" }
        format.json { render json: @presentation_pslide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /presentation_pslides/1
  # PUT /presentation_pslides/1.json
  def update
    @presentation_pslide = PresentationsPslide.find(params[:id])

    respond_to do |format|
      if @presentation_pslide.update_attributes(params[:presentations_pslide])
        format.html { redirect_to view_presentation_pslide_path(@presentation_pslide), notice: 'PresentationPslide was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @presentation_pslide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presentation_pslides/1
  # DELETE /presentation_pslides/1.json
  def destroy
    @presentation_pslide = PresentationsPslide.find(params[:id])
    @presentation_pslide.destroy

    respond_to do |format|
      format.html { redirect_to homepage_path }
      format.json { head :no_content }
    end
  end



end
