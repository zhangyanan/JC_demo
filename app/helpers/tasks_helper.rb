module TasksHelper
  def open_count
    Task.where("state = ?",CommonActiveRecord::ENABLED).count
  end
  def close_count
    Task.all.count - open_count
  end
  def all_count
    Task.all.count
  end
end
