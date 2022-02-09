class Project < ApplicationRecord
  has_many :tasks
  belongs_to :user


  def badge_color
    case status
    when 'not-started'
      'outline-secondary mb-xs'
    when 'in-progress'
      'outline-info mb-xs'
    when 'complete'
      'outline-success mb-xs'
    end
  end

  def status
    return 'not-started' if tasks.none?
    if tasks.all? { |task| task.complete? }
      'complete'
    elsif tasks.any? { |task| task.in_progress? || task.complete? }
      'in-progress'
    else
    'not-started'
    end
  end

  def percent_complete
    return 0 if tasks.none?
    ((total_complete.to_f / total_tasks) * 100).round
  end

  def total_complete
    tasks.select { |task| task.complete? }.count
  end

  def total_tasks
    tasks.count
  end

end
