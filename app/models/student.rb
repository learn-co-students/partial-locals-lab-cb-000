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

  def self.search(search)
    if search
      # name = name.downcase
      # students_with_name = []
      # self.all.each do |student|
      #   if student.name.downcase.include?(name)
      #     students_with_name << student
      #   end
      # end
      # students_with_name
      self.where('name LIKE ?', "%#{search}%").all
    else
      self.all
    end
  end
end
