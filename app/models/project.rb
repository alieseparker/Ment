class Project < ActiveRecord::Base
  has_many :assignments
  has_many :users, through: :assignments

  validates :title, presence: true
  validates :body, presence: true

  class NilUser
    def email
      'None'
    end

    def participants
      ['None']
    end

    def count
      0
    end
  end

  def creator
    User.find(assignments.where(role: 'creator')[0].user_id)
  rescue
    NilUser.new
  end

  def participants
    participating_users participating_assignments
  rescue
    NilUser.new
  end

  private

  def participating_assignments
    assignments_results = []

    assignments.where(role: 'participant').each do |assign|
      assignments_results << assign
    end
  end

  def participating_users(assignment_results)
    results = []

    assignment_results.each do |record|
      results << User.find(record.user_id)
    end

    results
  end
end
