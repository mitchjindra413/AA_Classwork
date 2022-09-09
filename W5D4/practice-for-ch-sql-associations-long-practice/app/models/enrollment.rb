# == Schema Information
#
# Table name: enrollments
#
#  id         :bigint           not null, primary key
#  course_id  :bigint           not null
#  student_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Enrollment < ApplicationRecord
    belongs_to :user, 
        primary_key: :id, 
        foreign_key: :student_id, 
        class_name: :User 
    # connects enrollment table to user table on enrollment.student_id and users.id
    
    belongs_to :course, 
        primary_key: :id, 
        foreign_key: :course_id, 
        class_name: :Course 
    # connects enrollment table to courses table on enrollment.course_id to courses.id
end
