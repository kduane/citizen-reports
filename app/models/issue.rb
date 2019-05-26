class Issue < ApplicationRecord
  validates :title, presence: true
  valitates :body, presence: true
  belongs_to :locality

  after_save :new_vote, :calculate_rating

  def new_vote
    vote = Vote.new(score, self.rating)
    vote.save
  end

  def calculate_rating
    issuevotes = Comment.where(issue_id: issue_id)
    total_score = 0
    issuevotes.each do |vote|
      total_score += vote.rating
    end
    issue.rating = (total_score / (issuevotes.length == 0 ? 1 : issuevotes.length)).to_i
    issue.save
  end

end
