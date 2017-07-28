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

  def self.search(student_name)
 array = []
    if student_name.present?
      self.where("name like ?", "%#{student_name}%")
=begin
      self.all.each do |student|
          if student.name.downcase.include?(student_name.downcase)
             array << student
           end
      end
array
=end
    else
  self.all
    end



end

end
