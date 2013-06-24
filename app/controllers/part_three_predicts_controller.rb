# coding: utf-8
class PartThreePredictsController < ApplicationController
  # GET /part_three_predicts
  # GET /part_three_predicts.json
  def index
    @part_three_predicts = PartThreePredict.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @part_three_predicts }
    end
  end

  def overlook
    @users = User.order("total_point DESC")
    @pthp = PartThreePredict.order("user_id")
    respond_to do |format|
      format.html # overlook.html.erb
    end
  end

  def initall
    PartThreePredict.destroy_all
    users = User.all
    users.each do |u|
      pthp = u.build_part_three_predict
      pthp.team_a = ""
      pthp.team_b = ""
      pthp.team_c = ""
      pthp.save
    end
    redirect_to part_three_predicts_path
  end

  # GET /part_three_predicts/1
  # GET /part_three_predicts/1.json
  def show
    @part_three_predict = PartThreePredict.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @part_three_predict }
    end
  end

  # GET /part_three_predicts/new
  # GET /part_three_predicts/new.json
  def new
    @part_three_predict = PartThreePredict.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @part_three_predict }
    end
  end

  # GET /part_three_predicts/1/edit
  def edit
    @options = {'(予想せよ)' => '', 'ブラジル' => 'brazil', 'ウルグアイ' => 'uruguay', 'スペイン' => 'spain', 'イタリア' => 'italia'} 
    @part_three_predict = PartThreePredict.find(params[:id])
  end

  # POST /part_three_predicts
  # POST /part_three_predicts.json
  def create
    @part_three_predict = PartThreePredict.new(params[:part_three_predict])

    respond_to do |format|
      if @part_three_predict.save
        format.html { redirect_to @part_three_predict, notice: 'Part three predict was successfully created.' }
        format.json { render json: @part_three_predict, status: :created, location: @part_three_predict }
      else
        format.html { render action: "new" }
        format.json { render json: @part_three_predict.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /part_three_predicts/1
  # PUT /part_three_predicts/1.json
  def update
    @part_three_predict = PartThreePredict.find(params[:id])
    @part_three_predict.update_attributes(params[:part_three_predict])
    News.regist(User.find(current_user.id).name + "さんが予想パート３を更新しました！")
    redirect_to edit_part_three_predict_path(@part_three_predict.id), :notice => 'あなたの予想を更新しました。'

=begin
    respond_to do |format|
      if @part_three_predict.update_attributes(params[:part_three_predict])
        format.html { redirect_to @part_three_predict, notice: 'Part three predict was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @part_three_predict.errors, status: :unprocessable_entity }
      end
    end
=end
  end

  # DELETE /part_three_predicts/1
  # DELETE /part_three_predicts/1.json
  def destroy
    @part_three_predict = PartThreePredict.find(params[:id])
    @part_three_predict.destroy

    respond_to do |format|
      format.html { redirect_to part_three_predicts_url }
      format.json { head :no_content }
    end
  end
end
