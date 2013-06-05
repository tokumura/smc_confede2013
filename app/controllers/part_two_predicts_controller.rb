# coding: utf-8
class PartTwoPredictsController < ApplicationController
  # GET /part_two_predicts
  # GET /part_two_predicts.json
  def index
    @part_two_predicts = PartTwoPredict.find_all_by_user_id(current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @part_two_predicts }
    end
  end

  def init
    PartTwoPredict.destroy_all(["user_id = ?", current_user.id.to_s])
    user = User.find(current_user.id)
    pop = user.build_part_two_predict
    pop.team_a = ""
    pop.team_b = ""
    pop.team_c = ""
    pop.team_d = ""
    pop.save
    redirect_to part_two_predicts_path
  end

  def initall
    PartTwoPredict.destroy_all
    users = User.all
    users.each do |u|
      pop = u.build_part_two_predict
      pop.team_a = ""
      pop.team_b = ""
      pop.team_c = ""
      pop.team_d = ""
      pop.save
    end
    redirect_to part_two_predicts_path
  end

  # GET /part_two_predicts/1
  # GET /part_two_predicts/1.json
  def show
    @part_two_predict = PartTwoPredict.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @part_two_predict }
    end
  end

  # GET /part_two_predicts/new
  # GET /part_two_predicts/new.json
  def new
    @part_two_predict = PartTwoPredict.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @part_two_predict }
    end
  end

  # GET /part_two_predicts/1/edit
  def edit
    @option_a = {'(予想せよ)' => '', 'ブラジル' => 'brazil', '日本' => 'japan', 'メキシコ' => 'mexico', 'イタリア' => 'italia'} 
    @option_b = {'(予想せよ)' => '', 'スペイン' => 'spain', 'ウルグアイ' => 'uruguay', 'タヒチ' => 'tahichi', 'ナイジェリア' => 'nigeria'} 
    @part_two_predict = PartTwoPredict.find(params[:id])
  end

  # POST /part_two_predicts
  # POST /part_two_predicts.json
  def create
    @part_two_predict = PartTwoPredict.new(params[:part_two_predict])

    respond_to do |format|
      if @part_two_predict.save
        format.html { redirect_to @part_two_predict, notice: 'Part two predict was successfully created.' }
        format.json { render json: @part_two_predict, status: :created, location: @part_two_predict }
      else
        format.html { render action: "new" }
        format.json { render json: @part_two_predict.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /part_two_predicts/1
  # PUT /part_two_predicts/1.json
  def update
    @part_two_predict = PartTwoPredict.find(params[:id])
    @part_two_predict.update_attributes(params[:part_two_predict])
    redirect_to edit_part_two_predict_path(@part_two_predict.id)
  end

  # DELETE /part_two_predicts/1
  # DELETE /part_two_predicts/1.json
  def destroy
    @part_two_predict = PartTwoPredict.find(params[:id])
    @part_two_predict.destroy

    respond_to do |format|
      format.html { redirect_to part_two_predicts_url }
      format.json { head :no_content }
    end
  end
end
