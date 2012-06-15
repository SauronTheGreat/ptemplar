class PwidgetsController < ApplicationController
  # GET /pwidgets
  # GET /pwidgets.json
  def index
    @pwidgets = Pwidget.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pwidgets }
    end
  end

  # GET /pwidgets/1
  # GET /pwidgets/1.json
  def show
    @pwidget = Pwidget.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pwidget }
    end
  end

  # GET /pwidgets/new
  # GET /pwidgets/new.json
  def new
    @pwidget = Pwidget.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pwidget }
    end
  end

  # GET /pwidgets/1/edit
  def edit
    @pwidget = Pwidget.find(params[:id])
  end

  # POST /pwidgets
  # POST /pwidgets.json
  def create
    @pwidget = Pwidget.new(params[:pwidget])

    respond_to do |format|
      if @pwidget.save
        format.html { redirect_to @pwidget, notice: 'Pwidget was successfully created.' }
        format.json { render json: @pwidget, status: :created, location: @pwidget }
      else
        format.html { render action: "new" }
        format.json { render json: @pwidget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pwidgets/1
  # PUT /pwidgets/1.json
  def update
    @pwidget = Pwidget.find(params[:id])

    respond_to do |format|
      if @pwidget.update_attributes(params[:pwidget])
        format.html { redirect_to @pwidget, notice: 'Pwidget was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pwidget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pwidgets/1
  # DELETE /pwidgets/1.json
  def destroy
    @pwidget = Pwidget.find(params[:id])
    @pwidget.destroy

    respond_to do |format|
      format.html { redirect_to pwidgets_url }
      format.json { head :no_content }
    end
  end
end
