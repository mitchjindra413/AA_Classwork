# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string           not null
#  prereq_id     :bigint
#  instructor_id :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord
    has_many :enrollments,
        primary_key: :id,
        foreign_key: :course_id, 
        class_name: :Enrollment
        # connects courses table to enrollment table on course_id
    
    has_many :enrolled_users, 
        through: :enrollments,
        source: :user 
        #gives us users enrolled in the course
    
    has_one :prerequisite, 
        primary_key: :prereq_id, 
        foreign_key: :id, 
        class_name: :Course
        # Self join to give us the prereq
    
    belongs_to :instructor,
        primary_key: :id,
        foreign_key: :instructor_id,
        class_name: :User
end
