# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(string)
    if !string.blank?
      results = searcher(string)
      results ? results : "No results were found."
    else
      self.all
    end
  end

  private

  def self.searcher(string)
    self.all.select do |student|
      student.name.downcase.include?(string)
    end
  end

end
