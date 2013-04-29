class UserFormsController < ApplicationController
  # GET /user_forms
  # GET /user_forms.json
  def index
    @user_forms = UserForm.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_forms }
    end
  end

  # GET /user_forms/1
  # GET /user_forms/1.json
  def show
    @user_form = UserForm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_form }
    end
  end

  # GET /user_forms/new
  # GET /user_forms/new.json
  def new
    @user_form = UserForm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_form }
    end
  end

  # GET /user_forms/1/edit
  def edit
    @user_form = UserForm.find(params[:id])
  end

  # POST /user_forms
  # POST /user_forms.json
  def create
    @user_form = UserForm.new(params[:user_form])

    respond_to do |format|
      if @user_form.save
        format.html { redirect_to @user_form, notice: 'User form was successfully created.' }
        format.json { render json: @user_form, status: :created, location: @user_form }
      else
        format.html { render action: "new" }
        format.json { render json: @user_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_forms/1
  # PUT /user_forms/1.json
  def update
    @user_form = UserForm.find(params[:id])

    respond_to do |format|
      if @user_form.update_attributes(params[:user_form])
        format.html { redirect_to @user_form, notice: 'User form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_forms/1
  # DELETE /user_forms/1.json
  def destroy
    @user_form = UserForm.find(params[:id])
    @user_form.destroy

    respond_to do |format|
      format.html { redirect_to user_forms_url }
      format.json { head :no_content }
    end
  end
end
