--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: availabilities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE availabilities (
    id integer NOT NULL,
    date date NOT NULL
);


--
-- Name: availabilities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE availabilities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: availabilities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE availabilities_id_seq OWNED BY availabilities.id;


--
-- Name: availability_spaces; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE availability_spaces (
    space_id integer NOT NULL,
    availability_id integer NOT NULL
);


--
-- Name: bookings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE bookings (
    id integer NOT NULL,
    date_from date NOT NULL,
    date_to date NOT NULL,
    confirmed boolean DEFAULT false,
    space_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE bookings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE bookings_id_seq OWNED BY bookings.id;


--
-- Name: spaces; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE spaces (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    price text NOT NULL,
    picture_url text NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: spaces_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spaces_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spaces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spaces_id_seq OWNED BY spaces.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    id integer NOT NULL,
    name text NOT NULL,
    username text NOT NULL,
    password_digest text NOT NULL,
    email_address character varying(50) NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: availabilities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY availabilities ALTER COLUMN id SET DEFAULT nextval('availabilities_id_seq'::regclass);


--
-- Name: bookings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY bookings ALTER COLUMN id SET DEFAULT nextval('bookings_id_seq'::regclass);


--
-- Name: spaces id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spaces ALTER COLUMN id SET DEFAULT nextval('spaces_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: availabilities; Type: TABLE DATA; Schema: public; Owner: -
--

COPY availabilities (id, date) FROM stdin;
1	2018-02-08
2	2019-09-08
3	2018-05-07
4	2017-06-06
5	2018-12-20
\.


--
-- Data for Name: availability_spaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY availability_spaces (space_id, availability_id) FROM stdin;
1	1
2	1
3	2
3	3
4	4
5	5
\.


--
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY bookings (id, date_from, date_to, confirmed, space_id, user_id) FROM stdin;
1	2018-02-08	2018-02-08	f	1	1
\.


--
-- Data for Name: spaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY spaces (id, name, description, price, picture_url, user_id) FROM stdin;
1	Leigh-ann's Space	A lovely place	£50	https://s-media-cache-ak0.pinimg.com/originals/23/2c/23/232c23d70134ebdfb0db704349df078c.jpg	1
2	Phil's Space	A romantic space	£60	https://i.amz.mshcdn.com/CxMvChJQKIW_5d99MzUbNz2iXxs=/1200x627/2016%2F02%2F09%2Fb5%2Fcupidroom.77f37.jpg	1
3	Alex's Space	A warm welcoming space, a home from home	£70	http://4.bp.blogspot.com/-Bbf1U776K-A/TwyDxW-fIHI/AAAAAAAAAAU/VOutHa0FwF0/s1600/white2.jpg	1
4	Lewis' Joint	A no frills city space	£20	http://richglare.com/wp-content/uploads/2014/02/lobby_odean-tower.jpeg	1
5	Ed's Space	A outdoor room	£100	http://iruntheinternet.com/lulzdump/images/extreme-sleeping-champion-mountain-bed-12998462411.jpg	1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY users (id, name, username, password_digest, email_address) FROM stdin;
1	L Gant	Lei	$2a$10$eM/NN2n0CaCjmoQHEGH.ie4jVaEzti/wfZDq8JQY6vZgZDlLbf61u	leighann.gant@gmail.com
2	Simon	Simon123	$2a$10$FCGOK/SieTPZnYC236PUoOdA4wvJWev.2y8Q8YKILnD98bl.d0Xp.	leigh_gant@hotmail.com
3	Simon	SImOn123	$2a$10$mxPzHKD4hN3JAmOK5lm97OII7XDu8l63ccSY17EbebQ7gq6pbTELS	123@test.com
\.


--
-- Name: availabilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('availabilities_id_seq', 5, true);


--
-- Name: bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('bookings_id_seq', 1, true);


--
-- Name: spaces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('spaces_id_seq', 5, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- Name: availabilities availabilities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY availabilities
    ADD CONSTRAINT availabilities_pkey PRIMARY KEY (id);


--
-- Name: availability_spaces availability_spaces_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY availability_spaces
    ADD CONSTRAINT availability_spaces_pkey PRIMARY KEY (space_id, availability_id);


--
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (id);


--
-- Name: spaces spaces_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY spaces
    ADD CONSTRAINT spaces_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_bookings_space; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bookings_space ON bookings USING btree (space_id);


--
-- Name: index_bookings_user; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bookings_user ON bookings USING btree (user_id);


--
-- Name: unique_users_email_address; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_users_email_address ON users USING btree (email_address);


--
-- Name: unique_users_username; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_users_username ON users USING btree (username);


--
-- Name: availability_spaces availability_spaces_availability_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY availability_spaces
    ADD CONSTRAINT availability_spaces_availability_fk FOREIGN KEY (availability_id) REFERENCES availabilities(id);


--
-- Name: availability_spaces availability_spaces_space_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY availability_spaces
    ADD CONSTRAINT availability_spaces_space_fk FOREIGN KEY (space_id) REFERENCES spaces(id);


--
-- Name: bookings bookings_space_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bookings
    ADD CONSTRAINT bookings_space_fk FOREIGN KEY (space_id) REFERENCES spaces(id);


--
-- Name: bookings bookings_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bookings
    ADD CONSTRAINT bookings_user_fk FOREIGN KEY (user_id) REFERENCES users(id);


--
-- PostgreSQL database dump complete
--
