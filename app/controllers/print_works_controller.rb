class PrintWorksController < ApplicationController
  before_filter :get_user

  # GET /print_works
  # GET /print_works.json
  def index
    @print_works = @user.print_works
    # @print_works = PrintWork.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @print_works }
    end
  end

  # GET /print_works/1
  # GET /print_works/1.json
  def show
    @print_work = @user.print_works.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @print_work }
    end
  end

  # GET /print_works/new
  # GET /print_works/new.json
  def new
    @print_work = @user.print_works.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @print_work }
    end
  end

  # GET /print_works/1/edit
  def edit
    @print_work = @user.print_works.find(params[:id])
  end

  # POST /print_works
  # POST /print_works.json
  def create
    @print_work = @user.print_works.new(params[:print_work])
    # @print_work.user = current_user

    respond_to do |format|
      if @print_work.save
        format.html { redirect_to @print_work, notice: 'Print work was successfully created.' }
        format.json { render json: @print_work, status: :created, location: @print_work }
      else
        format.html { render action: "new" }
        format.json { render json: @print_work.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /print_works/1
  # PUT /print_works/1.json
  def update
    @print_work = @user.print_works.find(params[:id])

    respond_to do |format|
      if @print_work.update_attributes(params[:print_work])
        format.html { redirect_to @print_work, notice: 'Print work was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @print_work.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /print_works/1
  # DELETE /print_works/1.json
  def destroy
    @print_work = @user.print_works.find(params[:id])
    @print_work.destroy

    respond_to do |format|
      format.html { redirect_to print_works_url }
      format.json { head :no_content }
    end
  end

  private

  def get_user
    @user = current_user
  end
end
