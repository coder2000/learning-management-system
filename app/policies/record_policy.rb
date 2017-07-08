class RecordPolicy < ApplicationPolicy

  def permitted_attributes_for_create
    [:record_file]
  end
end

