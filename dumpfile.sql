--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: games; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.games (
    id integer NOT NULL,
    leagueid integer NOT NULL,
    hometeamid integer NOT NULL,
    awayteamid integer NOT NULL,
    date text NOT NULL,
    name text NOT NULL,
    hometeamscore integer NOT NULL,
    hometeamassists integer NOT NULL,
    hometeamthrees integer NOT NULL,
    hometeamsteals integer NOT NULL,
    hometeamblocks integer NOT NULL,
    awayteamscore integer NOT NULL,
    awayteamassists integer NOT NULL,
    awayteamthrees integer NOT NULL,
    awayteamsteals integer NOT NULL,
    awayteamblocks integer NOT NULL
);


ALTER TABLE public.games OWNER TO postgres;

--
-- Name: games_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.games ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.games_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: knex_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.knex_migrations (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);


ALTER TABLE public.knex_migrations OWNER TO postgres;

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.knex_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.knex_migrations_id_seq OWNER TO postgres;

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.knex_migrations_id_seq OWNED BY public.knex_migrations.id;


--
-- Name: knex_migrations_lock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.knex_migrations_lock (
    index integer NOT NULL,
    is_locked integer
);


ALTER TABLE public.knex_migrations_lock OWNER TO postgres;

--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.knex_migrations_lock_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.knex_migrations_lock_index_seq OWNER TO postgres;

--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.knex_migrations_lock_index_seq OWNED BY public.knex_migrations_lock.index;


--
-- Name: leagues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.leagues (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.leagues OWNER TO postgres;

--
-- Name: leagues_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.leagues ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.leagues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: players; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.players (
    id integer NOT NULL,
    leagueid integer NOT NULL,
    teamid integer NOT NULL,
    role text NOT NULL,
    city text NOT NULL,
    phone text NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.players OWNER TO postgres;

--
-- Name: players_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.players ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.players_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: schemaversion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schemaversion (
    version bigint NOT NULL,
    name text,
    md5 text,
    run_at timestamp with time zone
);


ALTER TABLE public.schemaversion OWNER TO postgres;

--
-- Name: teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teams (
    id integer NOT NULL,
    leagueid integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.teams OWNER TO postgres;

--
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.teams ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: knex_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.knex_migrations ALTER COLUMN id SET DEFAULT nextval('public.knex_migrations_id_seq'::regclass);


--
-- Name: knex_migrations_lock index; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.knex_migrations_lock ALTER COLUMN index SET DEFAULT nextval('public.knex_migrations_lock_index_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.games (id, leagueid, hometeamid, awayteamid, date, name, hometeamscore, hometeamassists, hometeamthrees, hometeamsteals, hometeamblocks, awayteamscore, awayteamassists, awayteamthrees, awayteamsteals, awayteamblocks) FROM stdin;
161	1	1	2	1/1	Game 1	0	0	0	0	0	0	0	0	0	0
162	1	3	4	1/1	Game 1	0	0	0	0	0	0	0	0	0	0
163	1	1	3	1/2	Game 2	0	0	0	0	0	0	0	0	0	0
164	1	2	4	1/2	Game 2	0	0	0	0	0	0	0	0	0	0
165	1	4	1	1/3	Game 3	0	0	0	0	0	0	0	0	0	0
166	1	3	2	1/3	Game 3	0	0	0	0	0	0	0	0	0	0
167	1	2	1	1/4	Game 4	0	0	0	0	0	0	0	0	0	0
168	1	4	3	1/4	Game 4	0	0	0	0	0	0	0	0	0	0
169	2	5	6	1/1	Game 1	0	0	0	0	0	0	0	0	0	0
170	2	7	8	1/1	Game 1	0	0	0	0	0	0	0	0	0	0
171	2	5	7	1/2	Game 2	0	0	0	0	0	0	0	0	0	0
172	2	6	8	1/2	Game 2	0	0	0	0	0	0	0	0	0	0
173	2	8	5	1/3	Game 3	0	0	0	0	0	0	0	0	0	0
174	2	7	6	1/3	Game 3	0	0	0	0	0	0	0	0	0	0
175	2	6	5	1/4	Game 4	0	0	0	0	0	0	0	0	0	0
176	2	8	7	1/4	Game 4	0	0	0	0	0	0	0	0	0	0
177	3	9	10	1/1	Game 1	0	0	0	0	0	0	0	0	0	0
178	3	11	12	1/1	Game 1	0	0	0	0	0	0	0	0	0	0
179	3	9	11	1/2	Game 2	0	0	0	0	0	0	0	0	0	0
180	3	10	12	1/2	Game 2	0	0	0	0	0	0	0	0	0	0
181	3	12	9	1/3	Game 3	0	0	0	0	0	0	0	0	0	0
182	3	11	10	1/3	Game 3	0	0	0	0	0	0	0	0	0	0
183	3	10	9	1/4	Game 4	0	0	0	0	0	0	0	0	0	0
184	3	12	11	1/4	Game 4	0	0	0	0	0	0	0	0	0	0
185	4	13	14	1/1	Game 1	0	0	0	0	0	0	0	0	0	0
186	4	15	16	1/1	Game 1	0	0	0	0	0	0	0	0	0	0
187	4	13	15	1/2	Game 2	0	0	0	0	0	0	0	0	0	0
188	4	14	16	1/2	Game 2	0	0	0	0	0	0	0	0	0	0
189	4	16	13	1/3	Game 3	0	0	0	0	0	0	0	0	0	0
190	4	15	14	1/3	Game 3	0	0	0	0	0	0	0	0	0	0
191	4	14	13	1/4	Game 4	0	0	0	0	0	0	0	0	0	0
192	4	16	15	1/4	Game 4	0	0	0	0	0	0	0	0	0	0
\.


--
-- Data for Name: knex_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.knex_migrations (id, name, batch, migration_time) FROM stdin;
\.


--
-- Data for Name: knex_migrations_lock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.knex_migrations_lock (index, is_locked) FROM stdin;
1	0
\.


--
-- Data for Name: leagues; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.leagues (id, name) FROM stdin;
1	Tater Tots (8-10)
2	Flyers (11-12)
3	Trappers (13-15)
4	Killas (16-18)
5	Tater Tots (8-10)
6	Flyers (11-12)
7	Trappers (13-15)
8	Killas (16-18)
9	Tater Tots (8-10)
10	Flyers (11-12)
11	Trappers (13-15)
12	Killas (16-18)
13	Tater Tots (8-10)
14	Flyers (11-12)
15	Trappers (13-15)
16	Killas (16-18)
\.


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.players (id, leagueid, teamid, role, city, phone, name) FROM stdin;
1	1	1	Player	Bellevue	(298)234-4897	Jimmy Taylor
2	1	1	Player	Redmond	(298)234-2397	Tim Donald
3	1	1	Player	Auburn	(298)634-4897	Brandon Filmore
4	1	1	Player	Bellevue	(292)234-4897	Carl Lozenge
5	1	1	Player	Bellevue	(298)234-4494	Tommy Table
6	1	1	Coach	Bellevue	(298)662-4897	Jim Varmand
7	1	2	Player	Bellevue	(298)234-4897	John Taylor
8	1	2	Player	Redmond	(298)234-4397	Timmy Donald
9	1	2	Player	Auburn	(298)634-4897	Brandino Filmore
10	1	2	Player	Bellevue	(292)334-4897	Carlos Lozenge
11	1	2	Player	Kent	(298)234-4434	Tommy Tom Table
12	1	2	Coach	Issaquah	(298)662-4897	Jimmy R. Vamanos
13	1	3	Player	Bellevue	(298)237-4897	Johnny Taylor
14	1	3	Player	Kirkland	(298)232-4397	Kimmy Donald
15	1	3	Player	Auburn	(298)634-5897	Trent Filmore
16	1	3	Player	Bellevue	(292)233-4897	Farla Lozenge
17	1	3	Player	Tacoma	(298)234-3494	Mickey Table
18	1	3	Coach	Bellevue	(298)669-4897	Terrell Varmand
19	1	4	Player	Seattle	(298)234-4597	Sammy Taylor
20	1	4	Player	Redmond	(298)264-4697	Lorenzo Donald
21	1	4	Player	Auburn	(298)434-4897	Fatima Filmore
22	1	4	Player	Kimberly	(291)234-4897	Aaron Lozenge
23	1	4	Player	Everett	(298)234-8794	Kevin Table
24	1	4	Coach	Bellevue	(298)662-2397	Jorge Varmand
25	2	5	Player	Bellevue	(298)234-4897	Jimmy Taylor
26	2	5	Player	Redmond	(298)234-4397	Tim Donald
27	2	5	Player	Auburn	(298)634-4897	Brandon Filmore
28	2	5	Player	Bellevue	(292)234-4897	Carl Lozenge
29	2	5	Player	Bellevue	(298)234-4494	Tommy Table
30	2	5	Coach	Bellevue	(298)662-4897	Jim Varmand
31	2	6	Player	Bellevue	(298)234-4897	John Taylor
32	2	6	Player	Redmond	(298)234-4397	Timmy Donald
33	2	6	Player	Auburn	(298)634-4897	Brandino Filmore
34	2	6	Player	Bellevue	(292)334-4897	Carlos Lozenge
35	2	6	Player	Kent	(298)234-4434	Tommy Tom Table
36	2	6	Coach	Issaquah	(298)662-4897	Jimmy R. Vamanos
37	2	7	Player	Bellevue	(298)237-4897	Johnny Taylor
38	2	7	Player	Kirkland	(298)232-4397	Kimmy Donald
39	2	7	Player	Auburn	(298)634-5897	Trent Filmore
40	2	7	Player	Bellevue	(292)233-4897	FArla Lozenge
41	2	7	Player	Tacoma	(298)234-3494	Mickey Table
42	2	7	Coach	Bellevue	(298)669-4897	Terrell Varmand
43	2	8	Player	Seattle	(298)234-4597	Sammy Taylor
44	2	8	Player	Redmond	(298)264-4697	Lorenzo Donald
45	2	8	Player	Auburn	(298)434-4897	Fatima Filmore
46	2	8	Player	Kimberly	(291)234-4897	Aaron Lozenge
47	2	8	Player	Everett	(298)234-8794	Kevin Table
48	2	8	Coach	Bellevue	(298)662-2397	Jorge Varmand
49	3	9	Player	Bellevue	(298)234-4897	Jimmy Taylor
50	3	9	Player	Redmond	(298)234-4297	Tim Donald
51	3	9	Player	Auburn	(298)634-4897	Brandon Filmore
52	3	9	Player	Bellevue	(292)234-4897	Carl Lozenge
53	3	9	Player	Bellevue	(298)234-4494	Tommy Table
54	3	9	Coach	Bellevue	(298)662-4897	Jim Varmand
55	3	10	Player	Bellevue	(298)234-4897	John Taylor
56	3	10	Player	Redmond	(298)234-4397	Timmy Donald
57	3	10	Player	Auburn	(298)634-4897	Brandino Filmore
58	3	10	Player	Bellevue	(292)334-4897	Carlos Lozenge
59	3	10	Player	Kent	(298)234-4434	Tommy Tom Table
60	3	10	Coach	Issaquah	(298)662-4897	Jimmy R. Vamanos
61	3	11	Player	Bellevue	(298)237-4897	Johnny Taylor
62	3	11	Player	Kirkland	(298)232-4397	Kimmy Donald
63	3	11	Player	Auburn	(298)634-5897	Trent Filmore
64	3	11	Player	Bellevue	(292)233-4897	FArla Lozenge
65	3	11	Player	Tacoma	(298)234-3494	Mickey Table
66	3	11	Coach	Bellevue	(298)669-4897	Terrell Varmand
67	3	12	Player	Seattle	(298)234-4597	Sammy Taylor
68	3	12	Player	Redmond	(298)264-4697	Lorenzo Donald
69	3	12	Player	Auburn	(298)434-4897	Fatima Filmore
70	3	12	Player	Kimberly	(291)234-4897	Aaron Lozenge
71	3	12	Player	Everett	(298)234-8794	Kevin Table
72	3	12	Coach	Bellevue	(298)662-2397	Jorge Varmand
73	4	13	Player	Bellevue	(298)234-4897	Jimmy Taylor
74	4	13	Player	Redmond	(298)234-4297	Tim Donald
75	4	13	Player	Auburn	(298)634-4897	Brandon Filmore
76	4	13	Player	Bellevue	(292)234-4897	Carl Lozenge
77	4	13	Player	Bellevue	(298)234-4494	Tommy Table
78	4	13	Coach	Bellevue	(298)662-4897	Jim Varmand
79	4	14	Player	Bellevue	(298)234-4897	John Taylor
80	4	14	Player	Redmond	(298)234-4237	Timmy Donald
81	4	14	Player	Auburn	(298)634-4897	Brandino Filmore
82	4	14	Player	Bellevue	(292)334-4897	Carlos Lozenge
83	4	14	Player	Kent	(298)234-4434	Tommy Tom Table
84	4	14	Coach	Issaquah	(298)662-4897	Jimmy R. Vamanos
85	4	15	Player	Bellevue	(298)237-4897	Johnny Taylor
86	4	15	Player	Kirkland	(298)232-4239	Kimmy Donald
87	4	15	Player	Auburn	(298)634-5897	Trent Filmore
88	4	15	Player	Bellevue	(292)233-4897	FArla Lozenge
89	4	15	Player	Tacoma	(298)234-3494	Mickey Table
90	4	15	Coach	Bellevue	(298)669-4897	Terrell Varmand
91	4	16	Player	Seattle	(298)234-4597	Sammy Taylor
92	4	16	Player	Redmond	(298)264-4697	Lorenzo Donald
93	4	16	Player	Auburn	(298)434-4897	Fatima Filmore
94	4	16	Player	Kimberly	(291)234-4897	Aaron Lozenge
95	4	16	Player	Everett	(298)234-8794	Kevin Table
96	4	16	Coach	Bellevue	(298)662-2397	Jorge Varmand
\.


--
-- Data for Name: schemaversion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schemaversion (version, name, md5, run_at) FROM stdin;
0	\N	\N	\N
1	create_leagues	6e9600b4c31558fd5027b941ff474209	2024-10-12 16:22:27.271-05
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teams (id, leagueid, name) FROM stdin;
1	1	Supers
2	1	Importants
3	1	Spangleys
4	1	Terrors
5	2	Mirrors
6	2	Tables
7	2	Times
8	2	Kitties
9	3	Bobs
10	3	Sleeves
11	3	Bears
12	3	Bad Boys
13	4	Trippys
14	4	Snows
15	4	Buyers
16	4	Consumers
\.


--
-- Name: games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.games_id_seq', 192, true);


--
-- Name: knex_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.knex_migrations_id_seq', 1, false);


--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.knex_migrations_lock_index_seq', 1, true);


--
-- Name: leagues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.leagues_id_seq', 16, true);


--
-- Name: players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.players_id_seq', 96, true);


--
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teams_id_seq', 16, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (id);


--
-- Name: knex_migrations_lock knex_migrations_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.knex_migrations_lock
    ADD CONSTRAINT knex_migrations_lock_pkey PRIMARY KEY (index);


--
-- Name: knex_migrations knex_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.knex_migrations
    ADD CONSTRAINT knex_migrations_pkey PRIMARY KEY (id);


--
-- Name: leagues leagues_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leagues
    ADD CONSTRAINT leagues_pkey PRIMARY KEY (id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: schemaversion schemaversion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schemaversion
    ADD CONSTRAINT schemaversion_pkey PRIMARY KEY (version);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- Name: games games_awayteamid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_awayteamid_fkey FOREIGN KEY (awayteamid) REFERENCES public.teams(id) ON DELETE CASCADE;


--
-- Name: games games_hometeamid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_hometeamid_fkey FOREIGN KEY (hometeamid) REFERENCES public.teams(id) ON DELETE CASCADE;


--
-- Name: games games_leagueid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_leagueid_fkey FOREIGN KEY (leagueid) REFERENCES public.leagues(id) ON DELETE CASCADE;


--
-- Name: players players_leagueid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_leagueid_fkey FOREIGN KEY (leagueid) REFERENCES public.leagues(id) ON DELETE CASCADE;


--
-- Name: players players_teamid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_teamid_fkey FOREIGN KEY (teamid) REFERENCES public.teams(id) ON DELETE CASCADE;


--
-- Name: teams teams_leagueid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_leagueid_fkey FOREIGN KEY (leagueid) REFERENCES public.leagues(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

