class PbehaviorsController < ApplicationController
  # GET /pbehaviors
  # GET /pbehaviors.json
  def index
    @pbehaviors = Pbehavior.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pbehaviors }
    end
  end

  # GET /pbehaviors/1
  # GET /pbehaviors/1.json
  def show
    @pbehavior = Pbehavior.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pbehavior }
    end
  end

  # GET /pbehaviors/new
  # GET /pbehaviors/new.json
  def new
    @pbehavior = Pbehavior.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pbehavior }
    end
  end

  # GET /pbehaviors/1/edit
  def edit
    @pbehavior = Pbehavior.find(params[:id])
  end

  # POST /pbehaviors
  # POST /pbehaviors.json
  def create


    @pbehavior = Pbehavior.new(params[:pbehavior])

    @pbehavior.markup=Hash.new

    respond_to do |format|
      if @pbehavior.save
        #format.html { redirect_to Pcontent.find(@pbehavior.pcontent_id).pslide, notice: 'Pbehavior was successfully created.' }
        if params[:animate]=="true"
         format.html{ redirect_to get_animate_data_path(@pbehavior.id)}
        else
        format.html { redirect_to @pbehavior.pcontent.pslide, notice: 'Pbehavior was successfully created.' }
        format.json { render json: @pbehavior, status: :created, location: @pbehavior }
        end
      else
        format.html { render action: "new" }
        format.json { render json: @pbehavior.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pbehaviors/1
  # PUT /pbehaviors/1.json
  def update
    @pbehavior = Pbehavior.find(params[:id])

    respond_to do |format|
      if @pbehavior.update_attributes(params[:pbehavior])
        format.html { redirect_to @pbehavior, notice: 'Pbehavior was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pbehavior.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pbehaviors/1
  # DELETE /pbehaviors/1.json
  def destroy
    @pbehavior = Pbehavior.find(params[:id])
    @pbehavior.destroy

    respond_to do |format|
      format.html { redirect_to pbehaviors_url }
      format.json { head :no_content }
    end
  end
end
