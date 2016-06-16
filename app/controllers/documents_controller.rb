class DocumentsController < ApplicationController
  def create
    params[:files].each do |f|
      @document = current_user.files.create!(files: f)
      respond_to do |format|
        format.js {@document}
      end
    end
  end
  def index
  end

  private

  def data
    params.require(:document).permit(files:[])
  end
end
