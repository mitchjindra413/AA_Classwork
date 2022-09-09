# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    has_many :enrollments, 
        primary_key: :id, 
        foreign_key: :student_id,
        class_name: :Enrollment
    # connects user table to enrollment table on user.id to enrollment.student_id
    
    has_many :enrolled_courses,
        through: :enrollments,
        source: :course
    # connects user table to course table through "has_many enrollments" and "belongs_to course"
        #gives courses the student is in
end
