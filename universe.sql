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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years numeric(8,3),
    year_of_discovery integer,
    messier_number integer,
    description text,
    has_life boolean,
    is_visible boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years numeric(5,2),
    year_of_discovery integer,
    messier_number integer,
    description text,
    has_life boolean,
    is_visible boolean,
    planet_id integer NOT NULL,
    is_spherical boolean,
    was_visited boolean,
    radius_in_km numeric(5,1),
    average_temperature_in_celsius numeric(3,1),
    gravity numeric(3,1),
    minimum_temperature_in_celsius numeric(3,1),
    maximum_temperature_in_celsius numeric(3,1),
    volume_related_to_earth numeric(10,5),
    mass_related_to_earth numeric(10,5),
    perigee_in_km integer,
    apogee_in_km integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years numeric(5,2),
    year_of_discovery integer,
    messier_number integer,
    description text,
    has_life boolean,
    is_visible boolean,
    star_id integer NOT NULL,
    is_spherical boolean,
    planet_types_id integer NOT NULL,
    has_moon boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_type_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years numeric(5,2),
    year_of_discovery integer,
    messier_number integer,
    description text,
    is_massive boolean,
    is_visible boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13610.000, NULL, 24, 'Galaxy where planet earth lies', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 23315.230, 965, 31, 'TA barred spiral galaxy with diameter of about 220.000 ly, approximately 2.5 million ly from Earth and the nearest large galaxy to the Milky Way', false, true);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 59412.780, 1265, 51, 'One of the brightest galaxies in our night sky, visible with simple binoculars. It is a spiral galaxy located in the constellation Canes Venatici', false, false);
INSERT INTO public.galaxy VALUES (5, 'G982', 19432.780, 7365, 57, NULL, false, false);
INSERT INTO public.galaxy VALUES (6, 'G983', 28432.780, 7865, 59, NULL, false, false);
INSERT INTO public.galaxy VALUES (7, 'G187', 432.780, 865, 60, NULL, false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The moon', 483.32, 1919, 121, 'Earth  moon', false, true, 1, true, true, 1923.0, 58.0, 2.4, -30.0, 90.0, 0.11000, 0.01000, 1902, 9990);
INSERT INTO public.moon VALUES (2, 'G290', 43.10, 1999, 122, 'Mars  moon', false, false, 2, true, false, 1901.0, 5.3, -15.0, 70.0, 0.1, 0.21839, 1922.00000, 8990, NULL);
INSERT INTO public.moon VALUES (3, 'G512', 44.10, 2011, 123, 'G239  moon', false, false, 3, true, false, 1992.0, 80.0, 50.0, 99.0, 10.0, 20.00000, 19902.00000, 998990, NULL);
INSERT INTO public.moon VALUES (4, 'Hare Ylk', NULL, NULL, 125, NULL, false, false, 4, true, false, 1992.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Yogre Malik', NULL, NULL, 126, NULL, false, false, 7, true, false, 1992.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Faulkner Moon', NULL, NULL, 127, NULL, false, false, 12, true, false, 1992.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Vanguard  Moon', NULL, NULL, 128, NULL, false, false, 10, true, false, 1992.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Bandityk  Moon', NULL, NULL, 328, NULL, false, false, 8, true, false, 1992.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Kratoos  Moon', NULL, NULL, 25, NULL, false, false, 7, true, false, 1992.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Arceus  Moon', NULL, NULL, 34, NULL, false, false, 8, true, false, 1992.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Katu  Moon', NULL, NULL, 6, NULL, false, false, 3, true, false, 1992.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Nydes  Moon', NULL, NULL, 9, NULL, false, false, 4, true, false, 1992.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Lukky  Moon', NULL, NULL, 49, NULL, false, false, 5, true, false, 1992.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Aryynna  Moon', NULL, NULL, 58, NULL, false, false, 6, true, false, 1992.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Bibbry  Moon', NULL, NULL, 32, NULL, false, false, 2, true, false, 1992.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Samstyw  Moon', NULL, NULL, 412, NULL, false, false, 3, true, false, 1992.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Silver  Moon', NULL, NULL, 78, NULL, false, false, 4, true, false, 1992.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Goolduk  Moon', NULL, NULL, 23, NULL, false, false, 5, true, false, 1992.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Pitryor  Moon', NULL, NULL, 53, NULL, false, false, 6, true, false, 1992.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Cbulldog  Moon', NULL, NULL, 63, NULL, false, false, 10, true, false, 1992.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 124.32, NULL, 87, 'Most famous planet of all', true, true, 1, true, 1, true);
INSERT INTO public.planet VALUES (2, 'Mars', 524.32, 1023, 82, 'Red planet', false, true, 1, true, 1, true);
INSERT INTO public.planet VALUES (3, 'G239', 4.32, 1989, 101, 'Dwarf new planet', false, false, 2, false, 4, false);
INSERT INTO public.planet VALUES (4, 'Jupyter', 524.32, 1023, 99, NULL, false, true, 1, true, 1, true);
INSERT INTO public.planet VALUES (5, 'Saturn', 24.32, 123, 109, NULL, false, true, 1, true, 1, true);
INSERT INTO public.planet VALUES (6, 'Mercury', 624.32, 7123, 111, NULL, false, true, 1, true, 1, true);
INSERT INTO public.planet VALUES (7, 'Venus', 324.32, 6123, 112, NULL, false, true, 1, true, 1, true);
INSERT INTO public.planet VALUES (8, 'Pluto', 294.32, 4123, 113, NULL, false, true, 1, true, 1, true);
INSERT INTO public.planet VALUES (9, 'G111', 564.32, 1423, 114, NULL, false, true, 2, true, 4, true);
INSERT INTO public.planet VALUES (10, 'G551', 133.32, 3213, 115, NULL, false, true, 2, true, 3, true);
INSERT INTO public.planet VALUES (11, 'G26', 783.32, 8913, 118, NULL, false, true, 3, true, 2, false);
INSERT INTO public.planet VALUES (12, 'Fobyrnault', 553.32, 8213, 124, NULL, false, true, 6, true, 4, false);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Terrestrial', 'Rocky world outside our solar system');
INSERT INTO public.planet_types VALUES (2, 'Gas Giant', 'A giant planet composed mainly of gas');
INSERT INTO public.planet_types VALUES (3, 'Super Earth', 'A potentially rocky world, larger than Earth');
INSERT INTO public.planet_types VALUES (4, 'Neptune like', 'Gaseous world around size of Neptune');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sun', 912.32, NULL, 13, 'Most famous star of all', true, true, 1);
INSERT INTO public.star VALUES (2, 'andestella', 127.32, 1823, 3, NULL, false, false, 2);
INSERT INTO public.star VALUES (3, 'whirstella', 386.32, 1423, 8, 'Star located in Whirlpool galaxy', true, false, 3);
INSERT INTO public.star VALUES (4, 'godestella', 677.32, 9023, 99, NULL, false, false, 3);
INSERT INTO public.star VALUES (5, 'woesskkla', 111.32, 7723, 29, NULL, false, false, 5);
INSERT INTO public.star VALUES (6, 'queen star', 678.32, 8921, 33, NULL, false, false, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_type_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_messier_number_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_messier_number_key UNIQUE (messier_number);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_messier_number_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_messier_number_key UNIQUE (messier_number);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_messier_number_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_messier_number_key UNIQUE (messier_number);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_types planet_types__name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types__name_key UNIQUE (name);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: star star_messier_number_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_messier_number_key UNIQUE (messier_number);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: planet planet_planet_types_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_types_fkey FOREIGN KEY (planet_types_id) REFERENCES public.planet_types(planet_types_id);


--
-- Name: planet planet_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

