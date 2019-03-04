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

  def name_equals(name)
    name.downcase == self.name.downcase
  end

  def self.search(name)
    binding.pry
    if !name.present?
      self.all
    else
      self.all.select { |s| s.name_equals(name) }
    end
  end


end
