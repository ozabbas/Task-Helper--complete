class Task < ApplicationRecord
  belongs_to :project
  validates :status, inclusion: { in: ['not-started', 'in-progress', 'complete'] }
  STATUS_OPTIONS = [
    ['Not started', 'not-started'],
    ['In progress', 'in-progress'],
    ['Complete', 'complete']
  ]

  def badge_color
    case status
    when 'not-started'
      'outline-secondary'
    when 'in-progress'
      'outline-info'
    when 'complete'
      'outline-success'
    end
  end

    def complete?
      status =='complete'
    end
    
    def in_progress?
      status == 'in-progress'
    end

    def not_started?
      status == 'not-started'
    end
  end
