--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12rc1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: odev2; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE odev2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';


ALTER DATABASE odev2 OWNER TO postgres;

\connect odev2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Answers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Answers" (
    answerid integer NOT NULL,
    questionid integer NOT NULL,
    userid integer NOT NULL,
    score integer,
    creationdate timestamp without time zone,
    voteid integer,
    commentid integer,
    txt text NOT NULL
);


ALTER TABLE public."Answers" OWNER TO postgres;

--
-- Name: BadgeType; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."BadgeType" (
    typeid integer NOT NULL,
    typename text
);


ALTER TABLE public."BadgeType" OWNER TO postgres;

--
-- Name: Badges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Badges" (
    badgeid integer NOT NULL,
    badgename text,
    creationdate timestamp without time zone,
    userid integer NOT NULL,
    typeid integer
);


ALTER TABLE public."Badges" OWNER TO postgres;

--
-- Name: Blogs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Blogs" (
    blogid integer NOT NULL,
    txt text,
    userid integer
);


ALTER TABLE public."Blogs" OWNER TO postgres;

--
-- Name: Chat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Chat" (
    chatid integer NOT NULL,
    userid integer NOT NULL,
    text character varying(600),
    roomid integer
);


ALTER TABLE public."Chat" OWNER TO postgres;

--
-- Name: Comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Comments" (
    commentid integer NOT NULL,
    answerid integer NOT NULL,
    userid integer NOT NULL,
    txt character varying(600),
    creationdate timestamp without time zone,
    voteid integer
);


ALTER TABLE public."Comments" OWNER TO postgres;

--
-- Name: EditHistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."EditHistory" (
    id integer NOT NULL,
    url text,
    userid integer,
    typeid integer
);


ALTER TABLE public."EditHistory" OWNER TO postgres;

--
-- Name: EditHistoryType; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."EditHistoryType" (
    "typeId" integer NOT NULL,
    isanswer boolean,
    isstudent boolean,
    iscomment boolean
);


ALTER TABLE public."EditHistoryType" OWNER TO postgres;

--
-- Name: Feedback; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Feedback" (
    feedbackid integer NOT NULL,
    creationdate timestamp without time zone,
    voteid integer,
    questionid integer
);


ALTER TABLE public."Feedback" OWNER TO postgres;

--
-- Name: Graduate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Graduate" (
    id integer NOT NULL,
    grad_job text
);


ALTER TABLE public."Graduate" OWNER TO postgres;

--
-- Name: QuestionType; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."QuestionType" (
    id integer NOT NULL,
    typename text
);


ALTER TABLE public."QuestionType" OWNER TO postgres;

--
-- Name: Questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Questions" (
    id integer NOT NULL,
    creationdate timestamp without time zone,
    closedate timestamp without time zone,
    "createdBy" integer NOT NULL,
    lastediteddate timestamp without time zone,
    score integer,
    title character varying(300),
    answercount integer,
    questioncount integer,
    typeid integer,
    voteid integer,
    txt text,
    answerid integer,
    tagid integer
);


ALTER TABLE public."Questions" OWNER TO postgres;

--
-- Name: RoleType; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RoleType" (
    typeid integer NOT NULL,
    typename text
);


ALTER TABLE public."RoleType" OWNER TO postgres;

--
-- Name: Roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Roles" (
    roleid integer NOT NULL,
    typeid integer,
    questionid integer,
    userid integer
);


ALTER TABLE public."Roles" OWNER TO postgres;

--
-- Name: Rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Rooms" (
    roomid integer NOT NULL,
    userid integer NOT NULL,
    txt character varying(600),
    voteid integer
);


ALTER TABLE public."Rooms" OWNER TO postgres;

--
-- Name: SearchHistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SearchHistory" (
    searchid integer NOT NULL,
    txt text,
    url text,
    questionid integer
);


ALTER TABLE public."SearchHistory" OWNER TO postgres;

--
-- Name: Student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Student" (
    id integer NOT NULL,
    "Uni_name" text,
    stu_type integer
);


ALTER TABLE public."Student" OWNER TO postgres;

--
-- Name: TagType; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TagType" (
    typeid integer NOT NULL,
    typename text
);


ALTER TABLE public."TagType" OWNER TO postgres;

--
-- Name: Tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tags" (
    tagid integer NOT NULL,
    typeid integer,
    creationdate timestamp without time zone,
    userid integer NOT NULL,
    questionid integer
);


ALTER TABLE public."Tags" OWNER TO postgres;

--
-- Name: Users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Users" (
    id integer NOT NULL,
    email text,
    reputation integer,
    image bytea,
    lastseen timestamp without time zone,
    profileviews integer,
    merbershipdate timestamp without time zone,
    displayname character varying(300),
    about text,
    roleid integer,
    is_stu integer,
    is_tec integer
);


ALTER TABLE public."Users" OWNER TO postgres;

--
-- Name: Technical; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Technical" (
    id integer,
    technical_job text,
    edu_status text
)
INHERITS (public."Users");


ALTER TABLE public."Technical" OWNER TO postgres;

--
-- Name: UnderGrad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UnderGrad" (
    id integer NOT NULL,
    und_years text
);


ALTER TABLE public."UnderGrad" OWNER TO postgres;

--
-- Name: VoteType; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."VoteType" (
    typeid integer NOT NULL,
    typename text
);


ALTER TABLE public."VoteType" OWNER TO postgres;

--
-- Name: Votes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Votes" (
    voteid integer NOT NULL,
    creationdate timestamp without time zone,
    votetype integer,
    questionid integer,
    userid integer
);


ALTER TABLE public."Votes" OWNER TO postgres;

--
-- Data for Name: Answers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Answers" (answerid, questionid, userid, score, creationdate, voteid, commentid, txt) VALUES (1, 1, 1, 400, '2011-01-01 00:00:00', 600, 1, 'You can modify the PolicyKit permissions to allow the users to access the aptdaemon backend that Software Centre uses.');
INSERT INTO public."Answers" (answerid, questionid, userid, score, creationdate, voteid, commentid, txt) VALUES (2, 2, 2, 100, '2013-01-01 00:00:00', 400, 2, 'See man pklocalauthority which documents how to set local permissions on PolicyKit actions. Putting the following into /etc/polkit-1/localauthority/50-local.d/10-allow-users-to-install.pkla will allow any user logged in to the local machine to install packages after typing their own password (even when they''re not in the admin group) and to update the package cache without typing any password.');


--
-- Data for Name: BadgeType; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."BadgeType" (typeid, typename) VALUES (1, 'Question badge');
INSERT INTO public."BadgeType" (typeid, typename) VALUES (2, 'answer badge
');
INSERT INTO public."BadgeType" (typeid, typename) VALUES (3, NULL);


--
-- Data for Name: Badges; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Badges" (badgeid, badgename, creationdate, userid, typeid) VALUES (1, 'informed
', '2011-01-01 00:00:00', 1, 1);
INSERT INTO public."Badges" (badgeid, badgename, creationdate, userid, typeid) VALUES (2, '  Altruist', '2011-01-01 00:00:00', 2, 2);
INSERT INTO public."Badges" (badgeid, badgename, creationdate, userid, typeid) VALUES (3, '  Curious', '2011-01-01 00:00:00', 2, 2);


--
-- Data for Name: Blogs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Blogs" (blogid, txt, userid) VALUES (1, 'This Week #StackOverflowKnows About Infinity, Internet-Speak, and Password…', 1);
INSERT INTO public."Blogs" (blogid, txt, userid) VALUES (2, 'New post notices: Improving feedback on Stack Overflow questions', 2);
INSERT INTO public."Blogs" (blogid, txt, userid) VALUES (3, 'Requesting reopening specific question incorrectly closed as a duplicate of…', 2);


--
-- Data for Name: Chat; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Chat" (chatid, userid, text, roomid) VALUES (1, 1, 'hi guys my names sam', 2);
INSERT INTO public."Chat" (chatid, userid, text, roomid) VALUES (2, 2, 'any one here??', 1);


--
-- Data for Name: Comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Comments" (commentid, answerid, userid, txt, creationdate, voteid) VALUES (1, 1, 1, 'i dont know why i asked that even !!', '2011-01-01 00:00:00', 1);
INSERT INTO public."Comments" (commentid, answerid, userid, txt, creationdate, voteid) VALUES (2, 2, 2, 'It''s important to note that Fedora also backed it out after the sky fell down on them. ', '2015-01-01 00:00:00', 2);


--
-- Data for Name: EditHistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."EditHistory" (id, url, userid, typeid) VALUES (1, 'https://askubuntu.com/posts/3/edit', 1, 1);
INSERT INTO public."EditHistory" (id, url, userid, typeid) VALUES (2, 'https://askubuntu.com/questions/1/how-to-get-the-your-battery-is-broken-message-to-go-away', 1, 1);
INSERT INTO public."EditHistory" (id, url, userid, typeid) VALUES (3, 'https://askubuntu.com/questions/76543/how-do-i-disable-gdm-and-graphical-user-selection', 2, 2);


--
-- Data for Name: EditHistoryType; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."EditHistoryType" ("typeId", isanswer, isstudent, iscomment) VALUES (1, true, NULL, false);
INSERT INTO public."EditHistoryType" ("typeId", isanswer, isstudent, iscomment) VALUES (2, NULL, true, NULL);
INSERT INTO public."EditHistoryType" ("typeId", isanswer, isstudent, iscomment) VALUES (3, NULL, NULL, true);


--
-- Data for Name: Feedback; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Feedback" (feedbackid, creationdate, voteid, questionid) VALUES (1, NULL, 300, 1);
INSERT INTO public."Feedback" (feedbackid, creationdate, voteid, questionid) VALUES (2, NULL, 20, 2);


--
-- Data for Name: Graduate; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Graduate" (id, grad_job) VALUES (1, 'research');
INSERT INTO public."Graduate" (id, grad_job) VALUES (2, 'engineer');
INSERT INTO public."Graduate" (id, grad_job) VALUES (3, 'doktor');
INSERT INTO public."Graduate" (id, grad_job) VALUES (4, 'farmer');


--
-- Data for Name: QuestionType; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."QuestionType" (id, typename) VALUES (1, 'answered');
INSERT INTO public."QuestionType" (id, typename) VALUES (2, 'active');
INSERT INTO public."QuestionType" (id, typename) VALUES (3, 'closed');


--
-- Data for Name: Questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Questions" (id, creationdate, closedate, "createdBy", lastediteddate, score, title, answercount, questioncount, typeid, voteid, txt, answerid, tagid) VALUES (1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'what is shell', NULL, NULL);
INSERT INTO public."Questions" (id, creationdate, closedate, "createdBy", lastediteddate, score, title, answercount, questioncount, typeid, voteid, txt, answerid, tagid) VALUES (2, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'why i am here', NULL, NULL);
INSERT INTO public."Questions" (id, creationdate, closedate, "createdBy", lastediteddate, score, title, answercount, questioncount, typeid, voteid, txt, answerid, tagid) VALUES (3, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'what is shell', NULL, NULL);


--
-- Data for Name: RoleType; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."RoleType" (typeid, typename) VALUES (1, 'admin
');
INSERT INTO public."RoleType" (typeid, typename) VALUES (2, 'user');


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Roles" (roleid, typeid, questionid, userid) VALUES (1, 1, 1, 1);
INSERT INTO public."Roles" (roleid, typeid, questionid, userid) VALUES (2, 2, 2, 2);


--
-- Data for Name: Rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Rooms" (roomid, userid, txt, voteid) VALUES (1, 1, 'ubuntu', 500);
INSERT INTO public."Rooms" (roomid, userid, txt, voteid) VALUES (2, 2, 'kali', 700);


--
-- Data for Name: SearchHistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."SearchHistory" (searchid, txt, url, questionid) VALUES (1, 'what is ubuntu', NULL, 1);
INSERT INTO public."SearchHistory" (searchid, txt, url, questionid) VALUES (2, 'why i am here', NULL, 2);


--
-- Data for Name: Student; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: TagType; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."TagType" (typeid, typename) VALUES (1, 'nvidia');
INSERT INTO public."TagType" (typeid, typename) VALUES (2, 'touchpad');


--
-- Data for Name: Tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Tags" (tagid, typeid, creationdate, userid, questionid) VALUES (1, 1, NULL, 1, 2);
INSERT INTO public."Tags" (tagid, typeid, creationdate, userid, questionid) VALUES (2, 2, NULL, 2, 1);


--
-- Data for Name: Technical; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: UnderGrad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."UnderGrad" (id, und_years) VALUES (1, '3');
INSERT INTO public."UnderGrad" (id, und_years) VALUES (2, '2');


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Users" (id, email, reputation, image, lastseen, profileviews, merbershipdate, displayname, about, roleid, is_stu, is_tec) VALUES (1, 'mira@gmail.com', 433, NULL, NULL, NULL, NULL, 'mira_k', NULL, 1, NULL, NULL);
INSERT INTO public."Users" (id, email, reputation, image, lastseen, profileviews, merbershipdate, displayname, about, roleid, is_stu, is_tec) VALUES (2, 'mina@gmail.com', 271, NULL, NULL, NULL, NULL, 'minaaaa', NULL, 2, NULL, NULL);
INSERT INTO public."Users" (id, email, reputation, image, lastseen, profileviews, merbershipdate, displayname, about, roleid, is_stu, is_tec) VALUES (3, 'lara@gmail.com', 333, NULL, NULL, NULL, NULL, 'laaaara', NULL, 2, NULL, NULL);


--
-- Data for Name: VoteType; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."VoteType" (typeid, typename) VALUES (1, 'UpVote');
INSERT INTO public."VoteType" (typeid, typename) VALUES (2, 'DownVote');


--
-- Data for Name: Votes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Votes" (voteid, creationdate, votetype, questionid, userid) VALUES (1, '2005-01-01 00:00:00', 1, 1, 2);
INSERT INTO public."Votes" (voteid, creationdate, votetype, questionid, userid) VALUES (2, '2008-01-01 00:00:00', 2, 1, 1);


--
-- Name: Answers Answers_answerid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Answers"
    ADD CONSTRAINT "Answers_answerid_key" UNIQUE (answerid);


--
-- Name: Answers Answers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Answers"
    ADD CONSTRAINT "Answers_pkey" PRIMARY KEY (questionid, answerid, userid);


--
-- Name: BadgeType BadgeType_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BadgeType"
    ADD CONSTRAINT "BadgeType_pkey" PRIMARY KEY (typeid);


--
-- Name: Badges Badges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Badges"
    ADD CONSTRAINT "Badges_pkey" PRIMARY KEY (badgeid);


--
-- Name: Blogs Blogs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Blogs"
    ADD CONSTRAINT "Blogs_pkey" PRIMARY KEY (blogid);


--
-- Name: Chat Chat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Chat"
    ADD CONSTRAINT "Chat_pkey" PRIMARY KEY (chatid, userid);


--
-- Name: Comments Comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Comments"
    ADD CONSTRAINT "Comments_pkey" PRIMARY KEY (commentid, answerid, userid);


--
-- Name: EditHistoryType EditHistoryType_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EditHistoryType"
    ADD CONSTRAINT "EditHistoryType_pkey" PRIMARY KEY ("typeId");


--
-- Name: EditHistory EditHistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EditHistory"
    ADD CONSTRAINT "EditHistory_pkey" PRIMARY KEY (id);


--
-- Name: Feedback Feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Feedback"
    ADD CONSTRAINT "Feedback_pkey" PRIMARY KEY (feedbackid);


--
-- Name: Graduate Graduate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Graduate"
    ADD CONSTRAINT "Graduate_pkey" PRIMARY KEY (id);


--
-- Name: QuestionType QuestionType_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."QuestionType"
    ADD CONSTRAINT "QuestionType_pkey" PRIMARY KEY (id);


--
-- Name: Questions Questions_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Questions"
    ADD CONSTRAINT "Questions_id_key" UNIQUE (id);


--
-- Name: RoleType RoleType_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RoleType"
    ADD CONSTRAINT "RoleType_pkey" PRIMARY KEY (typeid);


--
-- Name: Roles Roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_pkey" PRIMARY KEY (roleid);


--
-- Name: Rooms Rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rooms"
    ADD CONSTRAINT "Rooms_pkey" PRIMARY KEY (roomid, userid);


--
-- Name: Rooms Rooms_roomid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rooms"
    ADD CONSTRAINT "Rooms_roomid_key" UNIQUE (roomid);


--
-- Name: SearchHistory SearchHistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SearchHistory"
    ADD CONSTRAINT "SearchHistory_pkey" PRIMARY KEY (searchid);


--
-- Name: Student Student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_pkey" PRIMARY KEY (id);


--
-- Name: TagType TagType_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TagType"
    ADD CONSTRAINT "TagType_pkey" PRIMARY KEY (typeid);


--
-- Name: Tags Tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tags"
    ADD CONSTRAINT "Tags_pkey" PRIMARY KEY (tagid);


--
-- Name: UnderGrad UnderGrad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UnderGrad"
    ADD CONSTRAINT "UnderGrad_pkey" PRIMARY KEY (id);


--
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- Name: VoteType VoteType_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."VoteType"
    ADD CONSTRAINT "VoteType_pkey" PRIMARY KEY (typeid);


--
-- Name: Votes Votes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Votes"
    ADD CONSTRAINT "Votes_pkey" PRIMARY KEY (voteid);


--
-- Name: Answers unique_Answers_answerid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Answers"
    ADD CONSTRAINT "unique_Answers_answerid" UNIQUE (answerid);


--
-- Name: fki_is_stu; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_is_stu ON public."Users" USING btree (is_stu);


--
-- Name: fki_userid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_userid ON public."Tags" USING btree (userid);


--
-- Name: Badges Badges_typeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Badges"
    ADD CONSTRAINT "Badges_typeid_fkey" FOREIGN KEY (typeid) REFERENCES public."BadgeType"(typeid);


--
-- Name: Badges Badges_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Badges"
    ADD CONSTRAINT "Badges_userid_fkey" FOREIGN KEY (userid) REFERENCES public."Users"(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Blogs Blogs_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Blogs"
    ADD CONSTRAINT "Blogs_userid_fkey" FOREIGN KEY (userid) REFERENCES public."Users"(id);


--
-- Name: Blogs Blogs_userid_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Blogs"
    ADD CONSTRAINT "Blogs_userid_fkey1" FOREIGN KEY (userid) REFERENCES public."Users"(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Chat Chat_roomid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Chat"
    ADD CONSTRAINT "Chat_roomid_fkey" FOREIGN KEY (roomid) REFERENCES public."Rooms"(roomid);


--
-- Name: Chat Chat_roomid_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Chat"
    ADD CONSTRAINT "Chat_roomid_fkey1" FOREIGN KEY (roomid) REFERENCES public."Rooms"(roomid) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Chat Chat_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Chat"
    ADD CONSTRAINT "Chat_userid_fkey" FOREIGN KEY (userid) REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Comments Comments_answerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Comments"
    ADD CONSTRAINT "Comments_answerid_fkey" FOREIGN KEY (answerid) REFERENCES public."Answers"(answerid);


--
-- Name: Comments Comments_voteid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Comments"
    ADD CONSTRAINT "Comments_voteid_fkey" FOREIGN KEY (voteid) REFERENCES public."Votes"(voteid);


--
-- Name: EditHistory EditHistory_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EditHistory"
    ADD CONSTRAINT "EditHistory_userid_fkey" FOREIGN KEY (userid) REFERENCES public."Users"(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Feedback Feedback_questionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Feedback"
    ADD CONSTRAINT "Feedback_questionid_fkey" FOREIGN KEY (questionid) REFERENCES public."Questions"(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Questions Questions_createdBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Questions"
    ADD CONSTRAINT "Questions_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES public."Users"(id);


--
-- Name: Questions Questions_typeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Questions"
    ADD CONSTRAINT "Questions_typeid_fkey" FOREIGN KEY (typeid) REFERENCES public."QuestionType"(id);


--
-- Name: Questions Questions_voteid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Questions"
    ADD CONSTRAINT "Questions_voteid_fkey" FOREIGN KEY (voteid) REFERENCES public."Votes"(voteid);


--
-- Name: SearchHistory SearchHistory_questionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SearchHistory"
    ADD CONSTRAINT "SearchHistory_questionid_fkey" FOREIGN KEY (questionid) REFERENCES public."Questions"(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Student Student_stu_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_stu_type_fkey" FOREIGN KEY (stu_type) REFERENCES public."Graduate"(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Student Student_stu_type_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_stu_type_fkey1" FOREIGN KEY (stu_type) REFERENCES public."UnderGrad"(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: TagType TagType_typeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TagType"
    ADD CONSTRAINT "TagType_typeid_fkey" FOREIGN KEY (typeid) REFERENCES public."Tags"(tagid);


--
-- Name: TagType TagType_typeid_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TagType"
    ADD CONSTRAINT "TagType_typeid_fkey1" FOREIGN KEY (typeid) REFERENCES public."Tags"(tagid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Tags Tags_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tags"
    ADD CONSTRAINT "Tags_userid_fkey" FOREIGN KEY (userid) REFERENCES public."Users"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Users Users_is_stu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_is_stu_fkey" FOREIGN KEY (is_stu) REFERENCES public."Student"(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Users Users_roleid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_roleid_fkey" FOREIGN KEY (roleid) REFERENCES public."Roles"(roleid);


--
-- Name: Votes Votes_VoteType_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Votes"
    ADD CONSTRAINT "Votes_VoteType_fkey" FOREIGN KEY (votetype) REFERENCES public."VoteType"(typeid);


--
-- Name: EditHistory lnk_EditHistory_typeid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EditHistory"
    ADD CONSTRAINT "lnk_EditHistory_typeid" FOREIGN KEY (typeid) REFERENCES public."EditHistoryType"("typeId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Questions lnk_Questions_typeid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Questions"
    ADD CONSTRAINT "lnk_Questions_typeid" FOREIGN KEY (typeid) REFERENCES public."QuestionType"(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Tags lnk_Tags_typeid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tags"
    ADD CONSTRAINT "lnk_Tags_typeid" FOREIGN KEY (typeid) REFERENCES public."TagType"(typeid) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

