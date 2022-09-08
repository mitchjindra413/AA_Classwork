PRAGMA foreign_keys = ON;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

CREATE TABLE questions(
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    asst_author INTEGER NOT NULL,

    FOREIGN KEY (asst_author) REFERENCES users(id)
);

CREATE TABLE question_follows(
    id INTEGER PRIMARY KEY,
    questions INTEGER NOT NULL,
    users INTEGER NOT NULL,

    FOREIGN KEY (questions) REFERENCES questions(id),
    FOREIGN KEY (users) REFERENCES users(id)
);

CREATE TABLE replies(
    id INTEGER PRIMARY KEY,
    subj_ques INTEGER NOT NULL,
    parent_reply INTEGER,
    user INTEGER NOT NULL,
    body TEXT NOT NULL,

    FOREIGN KEY (subj_ques) REFERENCES questions(id),
    FOREIGN KEY (parent_reply) REFERENCES replies(id),
    FOREIGN KEY (user) REFERENCES users(id)
);

CREATE TABLE question_likes(
    id INTEGER PRIMARY KEY,
    liked_question INTEGER,
    liking_user INTEGER,

    FOREIGN KEY (liked_question) REFERENCES questions(id),
    FOREIGN KEY (liking_user) REFERENCES users(id)
);

INSERT INTO 
    users (fname, lname)
VALUES 
    ('Bill', 'Nye'),
    ('Nye', 'Bill'),
    ('Joe', 'DaMagio'),
    ('2', 'PAC');

INSERT INTO 
    questions (title, body, asst_author)
VALUES 
    ('title', 'body', 1),
    ('why?', 'not', 2),
    ('who?', 'cares',1);

INSERT INTO 
    question_follows (questions, users)
VALUES 
    (1, 1),
    (2, 2),
    (3, 1);
    
INSERT INTO 
    replies (subj_ques, parent_reply, user, body)
VALUES 
    (2,null, 2, 'abcdefg'),
    (2,1,2,'I didn''t write this');

INSERT INTO 
    question_likes (liked_question, liking_user)
VALUES 
    (2,2),
    (3,1);



