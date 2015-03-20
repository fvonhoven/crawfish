class FinderScreen < PM::TableScreen
  title @selected_seafood.to_s
  refreshable
  searchable placeholder: ("Search" + @selected_seafood.to_s)
  row_height :auto, estimated: 44
  attr_accessor :selected_seafood


  def on_load
    mp @selected_seafood
    @tasks = []
    #load_async
  end

  def table_data
    [{
      cells: @tasks.map do |task|
        {
          title: task.title,
          subtitle: task.description,
          action: :edit_task,
          arguments: { task: task }
        }
      end
    }]
  end

  # def on_refresh
  #   load_async
  # end

  # def load_async
  #   # Assuming we're loading tasks from some cloud service
  #   Task.async_load do |tasks|
  #     @tasks = tasks
  #     stop_refreshing
  #     update_table_data
  #   end
  # end
end