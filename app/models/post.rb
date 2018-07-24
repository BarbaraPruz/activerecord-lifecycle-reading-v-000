class Post < ActiveRecord::Base

  belongs_to :author
  validate :is_title_case

  # New Code!!
  before_validation :make_title_case
  # example: before_save :email_author_about_post  private
  # also: before_create ...

  def is_title_case
    if title.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:title, "Title must be in title case")
    end
  end

  def make_title_case
    self.title = self.title.titlecase
  end


end
