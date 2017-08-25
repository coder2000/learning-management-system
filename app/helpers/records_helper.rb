# Records Helper
module RecordsHelper
  def link_to_record(record, method = :get)
    case method

    when :delete
      link_to repository_record_path(record.repository.id, record.id),
              data: { confirm: 'Are you sure you want to delete this video',
                      method: method } do
        yield
      end
    else
      link_to repository_record_path(record.repository.id, record.id),
              target: '_blank' do
        yield
      end
    end
  end
end
