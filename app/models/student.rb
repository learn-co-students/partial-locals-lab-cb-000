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

  def self.search(t)
    arr = []
    if t == ''
      return Student.all
    else
      Student.all.each do |student|
        if student.name.downcase.start_with? t
          arr << student
        end
      end
    end
    arr
  end

end
