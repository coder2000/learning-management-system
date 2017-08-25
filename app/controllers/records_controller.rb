# Records controller
class RecordsController < ApplicationController
  before_action :admin?
  before_action :record, except: [:create]

  def create
    authorize current_user.repositories.new, :create?
    @repository = current_user.repositories.find(params[:repository_id])
    @record = @repository.records.create!(data)
  end

  def destroy
    authorize @record, :delete?
    if @record
      @record.remove_record_file!
      @record.delete
      redirect_to repository_path(params[:repository_id]),
                  notice: 'Video deleted'
    end
  end

  def show; end

  private

  def record
    @record = Record.find(params[:id])
  end

  def data
    params.require(:record).permit(:record_file)
  end
end
