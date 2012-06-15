class PeventsController < ApplicationController
  # GET /pevents
  # GET /pevents.json
  def index
    @pevents = Pevent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pevents }
    end
  end

  # GET /pevents/1
  # GET /pevents/1.json
  def show
    @pevent = Pevent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pevent }
    end
  end

  # GET /pevents/new
  # GET /pevents/new.json
  def new
    @pevent = Pevent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pevent }
    end
  end

  # GET /pevents/1/edit
  def edit
    @pevent = Pevent.find(params[:id])
  end

  # POST /pevents
  # POST /pevents.json
  def create
    @pevent = Pevent.new(params[:pevent])

    respond_to do |format|
      if @pevent.save
        format.html { redirect_to @pevent, notice: 'Pevent was successfully created.' }
        format.json { render json: @pevent, status: :created, location: @pevent }
      else
        format.html { render action: "new" }
        format.json { render json: @pevent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pevents/1
  # PUT /pevents/1.json
  def update
    @pevent = Pevent.find(params[:id])

    respond_to do |format|
      if @pevent.update_attributes(params[:pevent])
        format.html { redirect_to @pevent, notice: 'Pevent was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pevent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pevents/1
  # DELETE /pevents/1.json
  def destroy
    @pevent = Pevent.find(params[:id])
    @pevent.destroy

    respond_to do |format|
      format.html { redirect_to pevents_url }
      format.json { head :no_content }
    end
  end
end
