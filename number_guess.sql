--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    player_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.players_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_player_id_seq OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.players_player_id_seq OWNED BY public.players.player_id;


--
-- Name: players player_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN player_id SET DEFAULT nextval('public.players_player_id_seq'::regclass);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (68, 'user_1727098434545', 2, 431);
INSERT INTO public.players VALUES (80, 'user_1727098809071', 2, 221);
INSERT INTO public.players VALUES (67, 'user_1727098434546', 5, 138);
INSERT INTO public.players VALUES (79, 'user_1727098809072', 5, 15);
INSERT INTO public.players VALUES (66, 'Test', 2, 11);
INSERT INTO public.players VALUES (70, 'user_1727098475345', 2, 534);
INSERT INTO public.players VALUES (69, 'user_1727098475346', 5, 390);
INSERT INTO public.players VALUES (82, 'user_1727098958172', 2, 140);
INSERT INTO public.players VALUES (72, 'user_1727098503105', 2, 80);
INSERT INTO public.players VALUES (81, 'user_1727098958173', 5, 200);
INSERT INTO public.players VALUES (71, 'user_1727098503106', 5, 327);
INSERT INTO public.players VALUES (74, 'user_1727098608408', 2, 84);
INSERT INTO public.players VALUES (84, 'user_1727098996739', 2, 295);
INSERT INTO public.players VALUES (73, 'user_1727098608409', 5, 10);
INSERT INTO public.players VALUES (76, 'user_1727098653878', 2, 52);
INSERT INTO public.players VALUES (83, 'user_1727098996740', 5, 12);
INSERT INTO public.players VALUES (75, 'user_1727098653879', 5, 327);
INSERT INTO public.players VALUES (78, 'user_1727098693855', 2, 519);
INSERT INTO public.players VALUES (86, 'user_1727099033349', 2, 21);
INSERT INTO public.players VALUES (77, 'user_1727098693856', 5, 174);
INSERT INTO public.players VALUES (85, 'user_1727099033350', 5, 11);


--
-- Name: players_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_player_id_seq', 86, true);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (player_id);


--
-- Name: players players_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

