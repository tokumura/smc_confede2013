class PartTwoResultsController < ApplicationController
  # GET /part_two_results
  # GET /part_two_results.json
  def index
    @part_two_results = PartTwoResult.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @part_two_results }
    end
  end

  # GET /part_two_results/1
  # GET /part_two_results/1.json
  def show
    @part_two_result = PartTwoResult.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @part_two_result }
    end
  end

  # GET /part_two_results/new
  # GET /part_two_results/new.json
  def new
    @part_two_result = PartTwoResult.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @part_two_result }
    end
  end

  # GET /part_two_results/1/edit
  def edit
    @part_two_result = PartTwoResult.find(params[:id])
  end

  # POST /part_two_results
  # POST /part_two_results.json
  def create
    @part_two_result = PartTwoResult.new(params[:part_two_result])

    respond_to do |format|
      if @part_two_result.save
        format.html { redirect_to @part_two_result, notice: 'Part two result was successfully created.' }
        format.json { render json: @part_two_result, status: :created, location: @part_two_result }
      else
        format.html { render action: "new" }
        format.json { render json: @part_two_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /part_two_results/1
  # PUT /part_two_results/1.json
  def update
    @part_two_result = PartTwoResult.find(params[:id])

    respond_to do |format|
      if @part_two_result.update_attributes(params[:part_two_result])
        format.html { redirect_to @part_two_result, notice: 'Part two result was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @part_two_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /part_two_results/1
  # DELETE /part_two_results/1.json
  def destroy
    @part_two_result = PartTwoResult.find(params[:id])
    @part_two_result.destroy

    respond_to do |format|
      format.html { redirect_to part_two_results_url }
      format.json { head :no_content }
    end
  end
end
