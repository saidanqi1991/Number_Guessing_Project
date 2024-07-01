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

DROP DATABASE users;
--
-- Name: users; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE users WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE users OWNER TO freecodecamp;

\connect users

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
-- Name: users_inf; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users_inf (
    username character varying(22),
    number_of_guesses integer,
    game_number integer NOT NULL
);


ALTER TABLE public.users_inf OWNER TO freecodecamp;

--
-- Name: users_inf_game_number_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_inf_game_number_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_inf_game_number_seq OWNER TO freecodecamp;

--
-- Name: users_inf_game_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_inf_game_number_seq OWNED BY public.users_inf.game_number;


--
-- Name: users_inf game_number; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users_inf ALTER COLUMN game_number SET DEFAULT nextval('public.users_inf_game_number_seq'::regclass);


--
-- Data for Name: users_inf; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users_inf VALUES ('sai', 3, 1);
INSERT INTO public.users_inf VALUES ('user_1719840907438', 147, 2);
INSERT INTO public.users_inf VALUES ('user_1719840907438', 46, 3);
INSERT INTO public.users_inf VALUES ('user_1719840907437', 280, 4);
INSERT INTO public.users_inf VALUES ('user_1719840907437', 669, 5);
INSERT INTO public.users_inf VALUES ('user_1719840907438', 9, 6);
INSERT INTO public.users_inf VALUES ('user_1719840907438', 932, 7);
INSERT INTO public.users_inf VALUES ('user_1719840907438', 573, 8);
INSERT INTO public.users_inf VALUES ('sai', 7, 9);


--
-- Name: users_inf_game_number_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_inf_game_number_seq', 9, true);


--
-- PostgreSQL database dump complete
--

