# coding: utf-8
class InformationController < ApplicationController
  # GET /information
  # GET /information.json
  def index
    @information = Information.find(:all, :order => 'created_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @information }
    end
  end

  # GET /information/1
  # GET /information/1.json
  def show
    @information = Information.find(params[:id])
    @comments = Comment.find(:all, :conditions => { :information_id => @information.id }, :order => 'created_at ASC')
    @comment = @information.comments.build
    @comment.comment_user_id = current_user.id

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @information }
    end
  end

  # GET /information/new
  # GET /information/new.json
  def new
    @information = Information.new
    @information.informant = current_user.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @information }
    end
  end

  # GET /information/1/edit
  def edit
    @information = Information.find(params[:id])
  end

  # POST /information
  # POST /information.json
  def create
    @information = Information.new(params[:information])
    if @information.save
      News.regist(User.find(current_user.id).name + "さんが新しい話題 '" + @information.title[0..10] + "...' を登録しました！")
      redirect_to information_index_path
    else
    end
=begin
    respond_to do |format|
      if @information.save
        redirect_to information_index_path
        format.html { redirect_to @information, notice: 'Information was successfully created.' }
        format.json { render json: @information, status: :created, location: @information }
      else
        format.html { render action: "new" }
        format.json { render json: @information.errors, status: :unprocessable_entity }
      end
    end
=end
  end

  # PUT /information/1
  # PUT /information/1.json
  def update
    @information = Information.find(params[:id])
    if @information.update_attributes(params[:information])
      redirect_to information_index_path
    else
    end

=begin
    respond_to do |format|
      if @information.update_attributes(params[:information])
        redirect_to information_index_path
        format.html { redirect_to @information, notice: 'Information was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @information.errors, status: :unprocessable_entity }
      end
    end
=end
  end

  # DELETE /information/1
  # DELETE /information/1.json
  def destroy
    @information = Information.find(params[:id])
    @information.destroy

    respond_to do |format|
      format.html { redirect_to information_index_url }
      format.json { head :no_content }
    end
  end
end
