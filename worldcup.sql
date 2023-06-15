--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(50) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (91, 2018, 'Final', 197, 198, 4, 2);
INSERT INTO public.games VALUES (92, 2018, 'Third Place', 199, 200, 2, 0);
INSERT INTO public.games VALUES (93, 2018, 'Semi-Final', 198, 200, 2, 1);
INSERT INTO public.games VALUES (94, 2018, 'Semi-Final', 197, 199, 1, 0);
INSERT INTO public.games VALUES (95, 2018, 'Quarter-Final', 198, 201, 3, 2);
INSERT INTO public.games VALUES (96, 2018, 'Quarter-Final', 200, 202, 2, 0);
INSERT INTO public.games VALUES (97, 2018, 'Quarter-Final', 199, 203, 2, 1);
INSERT INTO public.games VALUES (98, 2018, 'Quarter-Final', 197, 204, 2, 0);
INSERT INTO public.games VALUES (99, 2018, 'Eighth-Final', 200, 205, 2, 1);
INSERT INTO public.games VALUES (100, 2018, 'Eighth-Final', 202, 206, 1, 0);
INSERT INTO public.games VALUES (101, 2018, 'Eighth-Final', 199, 207, 3, 2);
INSERT INTO public.games VALUES (102, 2018, 'Eighth-Final', 203, 208, 2, 0);
INSERT INTO public.games VALUES (103, 2018, 'Eighth-Final', 198, 209, 2, 1);
INSERT INTO public.games VALUES (104, 2018, 'Eighth-Final', 201, 210, 2, 1);
INSERT INTO public.games VALUES (105, 2018, 'Eighth-Final', 204, 211, 2, 1);
INSERT INTO public.games VALUES (106, 2018, 'Eighth-Final', 197, 212, 4, 3);
INSERT INTO public.games VALUES (107, 2014, 'Final', 213, 212, 1, 0);
INSERT INTO public.games VALUES (108, 2014, 'Third Place', 214, 203, 3, 0);
INSERT INTO public.games VALUES (109, 2014, 'Semi-Final', 212, 214, 1, 0);
INSERT INTO public.games VALUES (110, 2014, 'Semi-Final', 213, 203, 7, 1);
INSERT INTO public.games VALUES (111, 2014, 'Quarter-Final', 214, 215, 1, 0);
INSERT INTO public.games VALUES (112, 2014, 'Quarter-Final', 212, 199, 1, 0);
INSERT INTO public.games VALUES (113, 2014, 'Quarter-Final', 203, 205, 2, 1);
INSERT INTO public.games VALUES (114, 2014, 'Quarter-Final', 213, 197, 1, 0);
INSERT INTO public.games VALUES (115, 2014, 'Eighth-Final', 203, 216, 2, 1);
INSERT INTO public.games VALUES (116, 2014, 'Eighth-Final', 205, 204, 2, 0);
INSERT INTO public.games VALUES (117, 2014, 'Eighth-Final', 197, 217, 2, 0);
INSERT INTO public.games VALUES (118, 2014, 'Eighth-Final', 213, 218, 2, 1);
INSERT INTO public.games VALUES (119, 2014, 'Eighth-Final', 214, 208, 2, 1);
INSERT INTO public.games VALUES (120, 2014, 'Eighth-Final', 215, 219, 2, 1);
INSERT INTO public.games VALUES (121, 2014, 'Eighth-Final', 212, 206, 1, 0);
INSERT INTO public.games VALUES (122, 2014, 'Eighth-Final', 199, 220, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (197, 'France');
INSERT INTO public.teams VALUES (198, 'Croatia');
INSERT INTO public.teams VALUES (199, 'Belgium');
INSERT INTO public.teams VALUES (200, 'England');
INSERT INTO public.teams VALUES (201, 'Russia');
INSERT INTO public.teams VALUES (202, 'Sweden');
INSERT INTO public.teams VALUES (203, 'Brazil');
INSERT INTO public.teams VALUES (204, 'Uruguay');
INSERT INTO public.teams VALUES (205, 'Colombia');
INSERT INTO public.teams VALUES (206, 'Switzerland');
INSERT INTO public.teams VALUES (207, 'Japan');
INSERT INTO public.teams VALUES (208, 'Mexico');
INSERT INTO public.teams VALUES (209, 'Denmark');
INSERT INTO public.teams VALUES (210, 'Spain');
INSERT INTO public.teams VALUES (211, 'Portugal');
INSERT INTO public.teams VALUES (212, 'Argentina');
INSERT INTO public.teams VALUES (213, 'Germany');
INSERT INTO public.teams VALUES (214, 'Netherlands');
INSERT INTO public.teams VALUES (215, 'Costa Rica');
INSERT INTO public.teams VALUES (216, 'Chile');
INSERT INTO public.teams VALUES (217, 'Nigeria');
INSERT INTO public.teams VALUES (218, 'Algeria');
INSERT INTO public.teams VALUES (219, 'Greece');
INSERT INTO public.teams VALUES (220, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 122, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 220, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

