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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(100) NOT NULL,
    diameter_km double precision NOT NULL,
    discovery_year integer,
    is_potentially_hazardous boolean
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer NOT NULL,
    mass numeric(10,2),
    description text,
    has_life boolean,
    is_spherical boolean
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
    distance_from_earth integer NOT NULL,
    age_in_millions_of_years integer,
    mass numeric(10,2),
    description text,
    has_life boolean,
    is_spherical boolean,
    planet_id integer
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
    distance_from_earth integer NOT NULL,
    age_in_millions_of_years integer,
    mass numeric(10,2),
    description text,
    has_life boolean,
    is_spherical boolean,
    star_id integer
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer NOT NULL,
    mass numeric(10,2),
    description text,
    has_life boolean,
    is_spherical boolean,
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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'asteroid1', 5.345, 1986, false);
INSERT INTO public.asteroid VALUES (2, 'asteroid2', 5.345, 1986, false);
INSERT INTO public.asteroid VALUES (3, 'asteroid3', 5.345, 1986, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 2330, 2, 1.23, 'Very big', true, true);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 45330, 26, 1.23, 'Very cold', true, false);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool Galaxy', 65330, 6, 2.23, 'Like a refrigerator', false, false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 25330, 6, 6.23, 'Too much sun', false, true);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel Galalxy', 29330, 0, 4.23, 'Too much fun', false, true);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 20, 5, 14.23, 'Too much dust', false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon1', 5, 20, 14.23, 'Too much dust', false, false, 1);
INSERT INTO public.moon VALUES (2, 'moon2', 5, 20, 14.23, 'Too much dust', false, false, 2);
INSERT INTO public.moon VALUES (3, 'moon3', 5, 20, 14.23, 'Too much dust', false, false, 3);
INSERT INTO public.moon VALUES (4, 'moon4', 5, 20, 14.23, 'Too much dust', false, false, 3);
INSERT INTO public.moon VALUES (5, 'moon5', 5, 20, 14.23, 'Too much dust', false, false, 5);
INSERT INTO public.moon VALUES (6, 'moon6', 5, 20, 14.23, 'Too much dust', false, false, 2);
INSERT INTO public.moon VALUES (7, 'moon7', 5, 20, 14.23, 'Too much dust', false, false, 1);
INSERT INTO public.moon VALUES (8, 'moon8', 5, 20, 14.23, 'Too much dust', false, false, 1);
INSERT INTO public.moon VALUES (9, 'moon9', 5, 20, 14.23, 'Too much dust', false, false, 2);
INSERT INTO public.moon VALUES (10, 'moon10', 5, 20, 14.23, 'Too much dust', false, false, 2);
INSERT INTO public.moon VALUES (11, 'moon11', 5, 20, 14.23, 'Too much dust', false, false, 3);
INSERT INTO public.moon VALUES (12, 'moon12', 5, 20, 14.23, 'Too much dust', false, false, 3);
INSERT INTO public.moon VALUES (13, 'moon13', 5, 20, 14.23, 'Too much dust', false, false, 3);
INSERT INTO public.moon VALUES (14, 'moon14', 5, 20, 14.23, 'Too much dust', false, false, 3);
INSERT INTO public.moon VALUES (15, 'moon15', 5, 20, 14.23, 'Too much dust', false, false, 3);
INSERT INTO public.moon VALUES (16, 'moon16', 5, 20, 14.23, 'Too much dust', false, false, 3);
INSERT INTO public.moon VALUES (17, 'moon17', 5, 20, 14.23, 'Too much dust', false, false, 3);
INSERT INTO public.moon VALUES (18, 'moon18', 5, 20, 14.23, 'Too much dust', false, false, 3);
INSERT INTO public.moon VALUES (19, 'moon19', 5, 20, 14.23, 'Too much dust', false, false, 3);
INSERT INTO public.moon VALUES (20, 'moon20', 5, 20, 14.23, 'Too much dust', false, false, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Planet1', 5, 20, 14.23, 'Too much dust', false, false, 1);
INSERT INTO public.planet VALUES (2, 'Planet2', 5, 20, 14.23, 'Too much dust', false, false, 2);
INSERT INTO public.planet VALUES (3, 'Planet3', 5, 20, 14.23, 'Too much dust', false, false, 2);
INSERT INTO public.planet VALUES (4, 'Planet4', 5, 20, 14.23, 'Too much dust', false, false, 3);
INSERT INTO public.planet VALUES (5, 'Planet5', 5, 20, 14.23, 'Too much dust', false, false, 5);
INSERT INTO public.planet VALUES (6, 'Planet6', 5, 20, 14.23, 'Too much dust', false, false, 5);
INSERT INTO public.planet VALUES (7, 'Planet7', 5, 20, 14.23, 'Too much dust', false, false, 5);
INSERT INTO public.planet VALUES (8, 'Planet8', 5, 20, 14.23, 'Too much dust', false, false, 2);
INSERT INTO public.planet VALUES (9, 'Planet9', 5, 20, 14.23, 'Too much dust', false, false, 2);
INSERT INTO public.planet VALUES (10, 'Planet10', 5, 20, 14.23, 'Too much dust', false, false, 2);
INSERT INTO public.planet VALUES (11, 'Planet11', 5, 20, 14.23, 'Too much dust', false, false, 2);
INSERT INTO public.planet VALUES (12, 'Planet12', 5, 20, 14.23, 'Too much dust', false, false, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Centaurus A', 20, 5, 14.23, 'Too much dust', false, false, 1);
INSERT INTO public.star VALUES (2, 'Star2', 20, 5, 14.23, 'Too much dust', false, false, 2);
INSERT INTO public.star VALUES (3, 'Star3', 20, 5, 14.23, 'Too much dust', false, false, 2);
INSERT INTO public.star VALUES (4, 'Star4', 20, 5, 14.23, 'Too much dust', false, false, 3);
INSERT INTO public.star VALUES (5, 'Star5', 20, 5, 14.23, 'Too much dust', false, false, 3);
INSERT INTO public.star VALUES (6, 'Star6', 20, 5, 14.23, 'Too much dust', false, false, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: asteroid asteroid_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_unique_name UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

