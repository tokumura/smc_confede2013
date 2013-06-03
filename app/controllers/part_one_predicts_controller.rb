class PartOnePredictsController < ApplicationController
  # GET /part_one_predicts
  # GET /part_one_predicts.json
  def index
    @matches = Match.all
    @part_one_predicts = PartOnePredict.find_all_by_user_id(current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @part_one_predicts }
    end
  end

  def init
    PartOnePredict.destroy_all
    users = User.all
    users.each do |u|
      (1..12).each_with_index do |i, j|
        pop = u.part_one_predict.build
        pop.game_no = i
        pop.save
      end
    end
    redirect_to part_one_predicts_path
  end

  # GET /part_one_predicts/1
  # GET /part_one_predicts/1.json
  def show
    @part_one_predict = PartOnePredict.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @part_one_predict }
    end
  end

  # GET /part_one_predicts/new
  # GET /part_one_predicts/new.json
  def new
    @part_one_predict = PartOnePredict.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @part_one_predict }
    end
  end

  # GET /part_one_predicts/1/edit
  def edit
    @part_one_predict = PartOnePredict.find(params[:id])
  end

  # POST /part_one_predicts
  # POST /part_one_predicts.json
  def create
    @part_one_predict = PartOnePredict.new(params[:part_one_predict])

    respond_to do |format|
      if @part_one_predict.save
        format.html { redirect_to @part_one_predict, notice: 'Part one predict was successfully created.' }
        format.json { render json: @part_one_predict, status: :created, location: @part_one_predict }
      else
        format.html { render action: "new" }
        format.json { render json: @part_one_predict.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /part_one_predicts/1
  # PUT /part_one_predicts/1.json
  def update
    @part_one_predict = PartOnePredict.find(params[:id])

    respond_to do |format|
      if @part_one_predict.update_attributes(params[:part_one_predict])
        format.html { redirect_to @part_one_predict, notice: 'Part one predict was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @part_one_predict.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /part_one_predicts/1
  # DELETE /part_one_predicts/1.json
  def destroy
    @part_one_predict = PartOnePredict.find(params[:id])
    @part_one_predict.destroy

    respond_to do |format|
      format.html { redirect_to part_one_predicts_url }
      format.json { head :no_content }
    end
  end
end
