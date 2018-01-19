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
    if str != ""
      # Student.find(:all, :conditions => ['keywords LIKE ?', '%rob%'])
      Student.where("name like ?", "%#{str}%")

      # Student.find_by(name: str)
    else
      Student.all
    end
  end
end
