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

  def Student::search(student_name)
    if student_name.blank?
      Student.all
    else
      Student.all.map{|student| student if student.name.downcase.include?(student_name.strip.downcase)}.compact
    end
  end
end
