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
    picture_url text NOT NULL
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
    password_digest text NOT NULL
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
1	2018-04-25
2	2018-04-04
3	2017-05-06
4	2017-05-18
5	2018-02-08
\.


--
-- Data for Name: availability_spaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY availability_spaces (space_id, availability_id) FROM stdin;
1	1
2	2
3	3
3	4
4	5
5	5
6	3
6	4
7	5
\.


--
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY bookings (id, date_from, date_to, confirmed, space_id, user_id) FROM stdin;
1	2018-04-25	2018-04-25	f	1	3
2	2017-05-06	2017-05-06	f	3	3
3	2018-02-08	2018-02-08	f	7	4
\.


--
-- Data for Name: spaces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY spaces (id, name, description, price, picture_url) FROM stdin;
1	Lewis's Joint	Hell HOLE	23	https://www.postojnska-jama.eu/assets/Za-pustolovce/Pivka-in-Crna-jama/_resampled/SetWidth1280-dozivjajski-ogled-2.JPG
2	Leigh-ann's Space	Lovely spot	25	https://fthmb.tqn.com/QWnJgVslALTu-yLO8q_idL94UIk=/960x0/filters:no_upscale()/Hyatt48Lex1-56a5c9053df78cf77289de66.jpg
3	Andy's Space	Hip Joint	60	https://media-cdn.tripadvisor.com/media/photo-s/0f/70/c7/df/absolutum-boutique-hotel.jpg,http://www.telegraph.co.uk/content/dam/Travel/hotels/europe/portugal/madeira/castanheiro-boutique-hotel-funchal-madeira-l-xlarge.jpg 
4	Phil's Space	A private room, with a waterbed and extras available on request	40	https://i.pinimg.com/736x/44/b3/e2/44b3e2a6facbf4d0ac61a300b7bda5e2--luxury-suites-the-dove.jpg
5	Alex's Space	A space for fun 	25	http://rilane.com/images/2016142/cool-space-themed-bedroom.jpg
6	Ed's Space	A outdoor room	£39	http://iruntheinternet.com/lulzdump/images/extreme-sleeping-champion-mountain-bed-12998462411.jpg
7	Jennifer's Space	A wildlife retreat	20	https://www.animalbliss.com/wp-content/uploads/2017/03/Cat-Playroom-1-500x375.png
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY users (id, name, username, password_digest) FROM stdin;
1	Lei	Lei	$2a$10$BYcWjHkEL//J9.X3kM7O5OJkXFdLXKPL9umTQEJf/C4uVyuFRKa7y
2	Sam	SAM	$2a$10$65H42yujTsNveWHJuE2nTOCFQQHZArqAwu3MvFV1NdYlcuPTYD7Re
3	Andy	Andy	$2a$10$uVwiSuRp5t51Iuz.amZLsexfp9wThifCQERGAAP5bhj60oi4xJYQe
4	Tom	Tom	$2a$10$at3mxFYxap5JOmDf/MiwN.NGfJaS0TZ3CVDIBhTR9BlDCp0Tn89nq
\.


--
-- Name: availabilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('availabilities_id_seq', 5, true);


--
-- Name: bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('bookings_id_seq', 3, true);


--
-- Name: spaces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('spaces_id_seq', 7, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('users_id_seq', 4, true);


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
-- Name: unique_users_username; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_users_username ON users USING btree (username);


--
-- PostgreSQL database dump complete
--

