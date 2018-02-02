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

  def self.search(str)
    if !str.blank? || !str.empty?
      students = self.all.select do |student|
        student.name.downcase.include?(str)
      end
      students
    else
      self.all
    end
  end
end
