class PrintWorkAdminController < ApplicationController
  def index
    @print_works = PrintWork.all
  end

  def destroy
    @print_work = PrintWork.find(params[:id])
    @print_work.destroy

    respond_to do |format|
      format.html { redirect_to print_work_admin_index_path }
      format.json { head :no_content }
    end
  end

  def update
    @print_work = PrintWork.find(params[:id])

    respond_to do |format|
      if @print_work.update_state(params[:print_work])
        format.html { redirect_to print_work_admin_index_path, notice: 'Print work was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @print_work.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @print_work = PrintWork.find(params[:id])
  end
end
