module RecordsHelper
  def link_to_record(record, method=:get, &block)
    case method

    when :delete
      link_to repository_record_path(record.repository.id, record.id), data: { confirm: "Are you sure you want to delete this video", method: method } do
        yield
      end
    else:get
      link_to repository_record_path(record.repository.id, record.id) do
        yield
      end
    end

  end

end
