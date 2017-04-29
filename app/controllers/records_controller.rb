class RecordsController < ApplicationController
  before_filter :admin?
  before_filter :record, except: [:create]

  def create
    @repository = current_user.repositories.find( params[:repository_id] )
    @record = @repository.records.create!(data)
  end

  def destroy
    if @record
      @record.remove_record_file!
      @record.delete
      redirect_to repository_path(params[:repository_id]), notice: "Video deleted"
    end
  end

  private

  def record
    @record = Record.find(params[:id])
  end

  def data
    params.require(:record).permit(:record_file)
  end
end
