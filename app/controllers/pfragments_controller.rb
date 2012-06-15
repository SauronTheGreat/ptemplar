class PfragmentsController < ApplicationController
  # GET /pfragments
  # GET /pfragments.json
  def index
    @pfragments = Pfragment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pfragments }
    end
  end

  # GET /pfragments/1
  # GET /pfragments/1.json
  def show
    @pfragment = Pfragment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pfragment }
    end
  end

  # GET /pfragments/new
  # GET /pfragments/new.json
  def new
    @pfragment = Pfragment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pfragment }
    end
  end

  # GET /pfragments/1/edit
  def edit
    @pfragment = Pfragment.find(params[:id])
  end

  # POST /pfragments
  # POST /pfragments.json
  def create
    @pfragment = Pfragment.new(params[:pfragment])

    respond_to do |format|
      if @pfragment.save
        format.html { redirect_to @pfragment, notice: 'Pfragment was successfully created.' }
        format.json { render json: @pfragment, status: :created, location: @pfragment }
      else
        format.html { render action: "new" }
        format.json { render json: @pfragment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pfragments/1
  # PUT /pfragments/1.json
  def update
    @pfragment = Pfragment.find(params[:id])

    respond_to do |format|
      if @pfragment.update_attributes(params[:pfragment])
        format.html { redirect_to @pfragment, notice: 'Pfragment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pfragment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pfragments/1
  # DELETE /pfragments/1.json
  def destroy
    @pfragment = Pfragment.find(params[:id])
    @pfragment.destroy

    respond_to do |format|
      format.html { redirect_to pfragments_url }
      format.json { head :no_content }
    end
  end
end
