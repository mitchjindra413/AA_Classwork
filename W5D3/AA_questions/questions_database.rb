require 'sqlite3'
require 'singleton'

class QuestionsDBConnection < SQLite3:: Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class Users
    attr_accessor :id, :fname, :lname

    def self.find_by_id(id)
        user = QuestionsDBConnection.instance.execute(<<-SQL, id)
            SELECT *
            FROM users
            WHERE id = ?
        SQL
        Users.new(user.first)
    end

    def self.find_by_name(fname, lname)
        user = QuestionsDBConnection.instance.execute(<<-SQL, fname, lname)
            SELECT *
            FROM users
            WHERE fname = ? AND lname = ?
        SQL
        Users.new(user.first)
    end

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end

    def authored_questions
        user = QuestionsDBConnection.instance.execute(<<-SQL, self.id)
            SELECT *
            FROM questions
            WHERE asst_author = ?
        SQL
        user 
    end

    def authored_replies
        user = QuestionsDBConnection.instance.execute(<<-SQL, self.id)
            SELECT *
            FROM replies
            WHERE user = ?
        SQL
        user 
    end

    def followed_questions 
        Question_Follows.followers_for_user_id(self.id)
    end

    def liked_questions
        Questions_Likes.liked_questions_for_user_id(self.id)
    end

    def average_karma
        swagmoney = QuestionsDBConnection.instance.execute(<<-SQL, self.id)
            SELECT COUNT(question_likes.liked_question) / CAST(COUNT(DISTINCT(questions.id)) AS FLOAT) AS 'Average Karma'
            FROM questions
            LEFT JOIN question_likes ON questions.id = question_likes.liked_question
            WHERE asst_author = ?
            GROUP BY asst_author
        SQL
    end

    def save
        QuestionsDBConnection.instance.execute(<<-SQL, self)
        if self.id IS NULL 
            INSERT INTO users (fname, lname)
            VALUES
                (self.fname, self.lname)
        else
            UPDATE users
            SET 
            fname = self.fname, lname = self.lname
            WHERE
            id = self.id
        end
        SQL
    end

end

class Questions
    attr_accessor :id, :title, :body, :asst_author

    def self.find_by_id(id)
        question = QuestionsDBConnection.instance.execute(<<-SQL, id)
            SELECT *
            FROM questions 
            WHERE id = ?
        SQL
        Questions.new(question.first)
    end

    def self.find_by_title(title)
        question = QuestionsDBConnection.instance.execute(<<-SQL, title)
            SELECT *
            FROM questions
            WHERE title = ? 
        SQL
        Questions.new(question.first)
    end

    def self.find_by_asst_author(asst_author)
        question = QuestionsDBConnection.instance.execute(<<-SQL, asst_author)
            SELECT *
            FROM questions
            WHERE asst_author = ? 
        SQL
        Questions.new(question.first)
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @asst_author = options['asst_author']
    end

    def replies
        user = QuestionsDBConnection.instance.execute(<<-SQL, self.id)
            SELECT *
            FROM replies
            WHERE id = ?
        SQL
        user 
    end

    def followers
        Question_Follows.followers_for_question_id(self.id)
    end

    def self.most_followed(n = 1)
        Question_Follows.most_followed_questions(n)
    end

    def likers
        Questions_Likes.likers_for_question_id(self.id)
    end

    def num_likes
        Questions_Likes.num_likes_for_question_id(self.id)
    end

    def self.most_liked(n)
        Questions_Likes.most_liked_questions(n)
    end
end

class Question_Follows
    attr_accessor :id, :questions, :users 

    def self.find_by_id(id)
        question = QuestionsDBConnection.instance.execute(<<-SQL, id)
            SELECT *
            FROM question_follows
            WHERE id = ?
        SQL
        Question_Follows.new(question.first)
    end

    def self.followers_for_question_id(id)
        question = QuestionsDBConnection.instance.execute(<<-SQL, id)
            SELECT users.id, fname, lname
            FROM question_follows
            JOIN users ON users.id = question_follows.users
            WHERE question_follows.id = ?
        SQL
        question.map do |value|
            Users.new(value)
        end
    end

    def self.followers_for_user_id(id)
        question = QuestionsDBConnection.instance.execute(<<-SQL, id)
            SELECT questions.id, questions.title, questions.asst_author
            FROM question_follows
            JOIN users ON users.id = question_follows.users
            JOIN questions ON questions.id = question_follows.questions
            WHERE question_follows.id = ?
        SQL
        question.map do |value|
            Questions.new(value)
        end
    end

    def self.most_followed_questions(n)
        QuestionsDBConnection.instance.execute(<<-SQL, n)
        SELECT questions
        FROM question_follows
        GROUP BY question_follows.questions
        ORDER BY COUNT(question_follows.questions) DESC 
        LIMIT ? 
        SQL
    end

    def initialize(options)
        @id = options['id']
        @questions = options['questions']
        @users = options['users']
    end

end

class Replies
    attr_accessor :id, :subj_ques, :parent_reply, :user, :body 
    
    def self.find_by_id(id)
        reply = QuestionsDBConnection.instance.execute(<<-SQL, id)
            SELECT *
            FROM replies
            WHERE id = ?
        SQL
        Replies.new(reply.first)
    end

    def self.find_by_subj_ques(subj_ques)
        reply = QuestionsDBConnection.instance.execute(<<-SQL, subj_ques)
            SELECT *
            FROM replies
            WHERE subj_ques = ?
        SQL
        Replies.new(reply.first)
    end

    def self.find_by_user(user)
        reply = QuestionsDBConnection.instance.execute(<<-SQL, user)
            SELECT *
            FROM replies
            WHERE user = ?
        SQL
        Replies.new(reply.first)
    end

    def initialize(options)
        @id = options['id']
        @subj_ques = options['subj_ques']
        @parent_reply = options['parent_reply']
        @user = options['user']
        @body = options['body']
    end

    def child_replies
        reply = QuestionsDBConnection.instance.execute(<<-SQL, self.id)
            SELECT *
            FROM replies
            WHERE parent_reply = ?
        SQL
        reply
    end

end

class Questions_Likes
    attr_accessor :id, :liked_question, :liking_user
    
    def self.find_by_id(id)
        like = QuestionsDBConnection.instance.execute(<<-SQL, id)
            SELECT *
            FROM question_likes
            WHERE id = ?
        SQL
        Questions_Likes.new(like.first)
    end

    def initialize(options)
        @id = options['id']
        @liked_question = options['liked_question']
        @liking_user = options['liking_user']
    end

    def self.likers_for_question_id(id)
        likers = QuestionsDBConnection.instance.execute(<<-SQL, id)
            SELECT users.fname, users.lname
            FROM question_likes
            JOIN users ON users.id = question_likes.liking_user
            WHERE liked_question = ?
        SQL
    end

    def self.num_likes_for_question_id(id)
        QuestionsDBConnection.instance.execute(<<-SQL, id)
            SELECT COUNT(*) AS 'Number of likes'
            FROM question_likes 
            WHERE liked_question = ?
            GROUP BY liked_question
        SQL
    end

    def self.liked_questions_for_user_id(id)
        like = QuestionsDBConnection.instance.execute(<<-SQL, id)
            SELECT COUNT(*) AS 'Nobody likes you'
            FROM question_likes
            WHERE liking_user = ?
            GROUP BY liking_user
        SQL
    end

    def self.most_liked_questions(n)
        QuestionsDBConnection.instance.execute(<<-SQL, n)
            SELECT COUNT(*) AS 'Number of likes'
            FROM question_likes 
            GROUP BY liked_question
            ORDER BY 'Number of likes' DESC
            LIMIT ?
        SQL
    end



end