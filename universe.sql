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
    name character varying NOT NULL,
    nasa_code character varying,
    age_in_millions_rounded integer,
    lightyears_from_earth numeric,
    width_in_lightyears integer,
    notes text,
    has_life boolean,
    has_possible_living_planets boolean,
    year_discovered integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    nasa_code character varying,
    age_in_thousands_rounded integer,
    diameter_in_1000_kms numeric,
    notes text,
    has_gas_or_water boolean,
    has_photos boolean,
    year_discovered integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    nebula_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    nasa_code character varying,
    age_in_thousands_rounded integer,
    diameter_in_1000_kms numeric,
    notes text,
    has_close_planets boolean,
    has_photos boolean,
    year_discovered integer
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebula_id_seq OWNER TO freecodecamp;

--
-- Name: nebula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebula_id_seq OWNED BY public.nebula.nebula_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying NOT NULL,
    nasa_code character varying,
    age_in_thousands_rounded integer,
    diameter_in_1000_kms numeric,
    notes text,
    has_life boolean,
    has_photos boolean,
    number_of_rings integer,
    year_discovered integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    nasa_code character varying,
    age_in_thousands_rounded integer,
    lightyears_from_earth numeric,
    diameter_in_1000_kms numeric,
    notes text,
    has_photos boolean,
    has_planets_orbiting boolean,
    number_of_planets_orbiting integer,
    year_discovered integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebula_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'MW0001', 13600, 0, 105700, 'Our galaxy, contains our Solar System.', false, true, 1920);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'ANDR02', 10000, 2537000, 220000, 'Nearest spiral galaxy to the Milky Way.', false, true, 964);
INSERT INTO public.galaxy VALUES (3, 'Sombrero Galaxy', 'SOM003', 8900, 29800000, 50000, 'Known for its bright nucleus and large central bulge.', false, false, 1767);
INSERT INTO public.galaxy VALUES (4, 'Triangulum Galaxy', 'TRI004', 13000, 3000000, 60000, 'Part of the Local Group, third-largest member after the Milky Way and Andromeda.', false, true, 1850);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 'WHI005', 14000, 23000000, 76000, 'Famous for its spiral arms and being a grand design spiral galaxy.', false, false, 1773);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel Galaxy', 'PIN006', 21000, 21000000, 170000, 'Face-on spiral galaxy in the constellation Ursa Major.', false, true, 1781);
INSERT INTO public.galaxy VALUES (7, 'Magellanic Clouds', 'MAG007', 14000, 163000, 14000, 'A duo of irregular dwarf galaxies, visible from the southern hemisphere.', false, true, 1519);
INSERT INTO public.galaxy VALUES (8, 'Messier 87', 'MES008', 13000, 53000000, 120000, 'A supergiant elliptical galaxy in the constellation Virgo.', false, false, 1781);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Moon', 'MOO001', 4500, 3.474, 'The only natural satellite of Earth.', false, true, -2000);
INSERT INTO public.moon VALUES (2, 2, 'Phobos', 'PHO002', 4600, 0.022, 'Larger and innermost of Mars two moons.', false, true, 1877);
INSERT INTO public.moon VALUES (3, 2, 'Deimos', 'DEI003', 4600, 0.012, 'Outer moon of Mars, smaller and more distant.', false, true, 1877);
INSERT INTO public.moon VALUES (4, 3, 'Proxima b I', 'PRBI004', 4800, 0.01, 'Fictional moon of Proxima b.', false, false, 2020);
INSERT INTO public.moon VALUES (5, 4, 'Proxima c I', 'PRCI005', 4800, 0.02, 'Fictional moon orbiting Proxima c.', false, false, 2021);
INSERT INTO public.moon VALUES (6, 5, 'Sirius b I', 'SBIOO6', 250, 0.005, 'Imaginary moon around Sirius b.', false, false, 2022);
INSERT INTO public.moon VALUES (7, 6, 'Betelgeuse I I', 'BEII007', 8200, 0.03, 'Fictional moon of Betelgeuse I.', true, false, 2023);
INSERT INTO public.moon VALUES (8, 7, 'Rigel b I', 'RBI008', 8000, 0.04, 'Fictional satellite orbiting Rigel b.', false, false, 2024);
INSERT INTO public.moon VALUES (9, 8, 'Vega I I', 'VEII009', 450, 0.06, 'Fictional moon of Vega I.', true, false, 2025);
INSERT INTO public.moon VALUES (10, 9, 'Vega II I', 'VEIII010', 450, 0.07, 'Another fictional moon orbiting Vega II.', false, false, 2026);
INSERT INTO public.moon VALUES (11, 10, 'Altair b I', 'ALBI011', 1250, 0.05, 'Fictional moon around Altair b.', false, false, 2027);
INSERT INTO public.moon VALUES (12, 11, 'Aldebaran b I', 'ALBII012', 6500, 0.09, 'Imaginary moon of Aldebaran b.', true, false, 1996);
INSERT INTO public.moon VALUES (13, 12, 'Spica b I', 'SPBI013', 12500, 0.1, 'Fictional moon orbiting Spica b.', false, false, 2028);
INSERT INTO public.moon VALUES (14, 13, 'Antares b I', 'ANBI014', 11000, 0.11, 'A large, fictional moon of Antares b.', true, false, 2029);
INSERT INTO public.moon VALUES (15, 14, 'Castor b I', 'CABI015', 350, 0.08, 'A rocky moon orbiting Castor b.', false, true, 2025);
INSERT INTO public.moon VALUES (16, 15, 'Pollux b I', 'POLBI016', 7200, 0.12, 'The first discovered moon of Pollux b.', false, true, 2007);
INSERT INTO public.moon VALUES (17, 1, 'Luna 2', 'LUNA017', 4500, 0.01, 'Fictional second moon of Earth.', false, false, 2030);
INSERT INTO public.moon VALUES (18, 3, 'Proxima b II', 'PRBII018', 4800, 0.015, 'Another fictional moon of Proxima b.', false, false, 2031);
INSERT INTO public.moon VALUES (19, 4, 'Proxima c II', 'PRCII019', 4800, 0.025, 'Second fictional moon orbiting Proxima c.', false, false, 2032);
INSERT INTO public.moon VALUES (20, 5, 'Sirius b II', 'SBII020', 250, 0.006, 'Second imaginary moon around Sirius b.', false, false, 2033);


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES (1, 1, 'Orion Nebula', 'ON001', 2400, 24, 'One of the brightest nebulae, visible to the naked eye in the night sky.', false, true, 1610);
INSERT INTO public.nebula VALUES (2, 1, 'Eagle Nebula', 'EN002', 5500, 70, 'Famous for the Pillars of Creation, a region of active star formation.', false, true, 1745);
INSERT INTO public.nebula VALUES (3, 2, 'Horsehead Nebula', 'HN003', 1500, 3.5, 'Dark nebula in Orion, known for its distinctive shape.', false, true, 1888);
INSERT INTO public.nebula VALUES (4, 3, 'Ring Nebula', 'RN004', 7000, 2.5, 'A planetary nebula in the northern constellation of Lyra.', false, true, 1779);
INSERT INTO public.nebula VALUES (5, 4, 'Crab Nebula', 'CN005', 960, 11, 'Remnant of a supernova observed in 1054 AD.', false, true, 1054);
INSERT INTO public.nebula VALUES (6, 5, 'Tarantula Nebula', 'TN006', 2500, 600, 'Located in the Large Magellanic Cloud, it is the most active starburst region in the Local Group.', true, true, 1751);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Earth', 'ERT001', 4540, 12.742, 'Our home planet, the only place where life is known to exist.', true, true, 0, -4500);
INSERT INTO public.planet VALUES (2, 1, 'Mars', 'MRS002', 4600, 6.779, 'Known as the Red Planet, currently being explored by rovers.', false, true, 0, -1610);
INSERT INTO public.planet VALUES (3, 2, 'Proxima b', 'PRB003', 4800, 1.3, 'An exoplanet orbiting within the habitable zone of Proxima Centauri.', false, true, 0, 2016);
INSERT INTO public.planet VALUES (4, 2, 'Proxima c', 'PRC004', 4800, 1.1, 'A second exoplanet in the Proxima Centauri system, much further out.', false, false, 0, 2019);
INSERT INTO public.planet VALUES (5, 3, 'Sirius b', 'SIB005', 242, 1.71, 'A white dwarf orbiting Sirius.', false, true, 0, 1862);
INSERT INTO public.planet VALUES (6, 4, 'Betelgeuse I', 'BEI006', 8200, 13, 'Fictional planet orbiting the red supergiant Betelgeuse.', false, false, 3, 2023);
INSERT INTO public.planet VALUES (7, 5, 'Rigel b', 'RIB007', 8000, 11, 'Fictional exoplanet orbiting the blue supergiant Rigel.', false, false, 0, 2024);
INSERT INTO public.planet VALUES (8, 6, 'Vega I', 'VEI008', 455, 14, 'Imaginary planet in the Vega system, known for its spectacular rings.', false, true, 4, 2021);
INSERT INTO public.planet VALUES (9, 6, 'Vega II', 'VEII009', 450, 9.5, 'Another fictional planet orbiting Vega, with potential for water.', false, false, 2, 2022);
INSERT INTO public.planet VALUES (10, 7, 'Altair b', 'ALB010', 1250, 6.5, 'Hypothetical planet orbiting Altair, with extensive research facilities.', false, true, 1, 2020);
INSERT INTO public.planet VALUES (11, 8, 'Aldebaran b', 'ALBB011', 6500, 12, 'Gas giant orbiting Aldebaran.', false, true, 0, 1995);
INSERT INTO public.planet VALUES (12, 9, 'Spica b', 'SPB012', 12500, 15, 'A large gas giant in the Spica system.', false, false, 5, 2025);
INSERT INTO public.planet VALUES (13, 10, 'Antares b', 'ANB013', 11000, 19, 'A super-Jupiter orbiting Antares, notable for its deep red atmosphere.', false, false, 7, 2023);
INSERT INTO public.planet VALUES (14, 11, 'Castor b', 'CASB014', 350, 7.2, 'A rocky exoplanet in the Castor system, with signs of ancient rivers.', false, true, 0, 2024);
INSERT INTO public.planet VALUES (15, 12, 'Pollux b', 'POLB015', 7200, 8.4, 'The first confirmed exoplanet orbiting the giant star Pollux.', false, true, 0, 2006);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sol', 'SOL001', 4600, 0, 1391, 'Our Sun, the star at the center of the Solar System.', true, true, 8, -2600);
INSERT INTO public.star VALUES (2, 1, 'Proxima Centauri', 'PRO002', 4850, 4.24, 1.02, 'The closest known star to the Sun and hosts at least two planets.', true, true, 2, 1915);
INSERT INTO public.star VALUES (3, 1, 'Sirius', 'SIR003', 242, 8.6, 2.063, 'The brightest star in Earth''s night sky.', true, true, 0, -300);
INSERT INTO public.star VALUES (4, 2, 'Betelgeuse', 'BET004', 8300, 642.5, 887, 'A red supergiant star approaching the end of its life cycle.', true, false, 0, -300);
INSERT INTO public.star VALUES (5, 2, 'Rigel', 'RIG005', 8000, 863, 78.9, 'A blue supergiant that is the brightest star in the constellation Orion.', true, false, 0, -300);
INSERT INTO public.star VALUES (6, 3, 'Vega', 'VEG006', 455, 25, 2.362, 'One of the most luminous stars in the proximity of Earth.', true, false, 0, -1200);
INSERT INTO public.star VALUES (7, 3, 'Altair', 'ALT007', 1250, 16.7, 1.63, 'A fast-rotating star in the constellation Aquila.', true, true, 0, -300);
INSERT INTO public.star VALUES (8, 4, 'Aldebaran', 'ALD008', 6500, 65, 44.2, 'An orange giant star located in the constellation Taurus.', true, false, 0, -300);
INSERT INTO public.star VALUES (9, 4, 'Spica', 'SPI009', 12500, 262, 7.4, 'The brightest star in the constellation Virgo.', true, false, 0, -300);
INSERT INTO public.star VALUES (10, 5, 'Antares', 'ANT010', 11000, 604, 883, 'A red supergiant star in the constellation Scorpius, rivaling Mars in brightness.', true, false, 0, -300);
INSERT INTO public.star VALUES (11, 7, 'Castor', 'CAS011', 370, 51, 2.3, 'A complex star system in the constellation Gemini, consisting of six individual stars.', true, true, 3, 1800);
INSERT INTO public.star VALUES (12, 6, 'Pollux', 'POL012', 7240, 34, 8.8, 'An orange giant star, the brightest in the constellation Gemini.', true, true, 1, -100);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 8, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebula_id_seq', 6, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 15, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 12, true);


--
-- Name: galaxy galaxy_nasa_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_nasa_code_key UNIQUE (nasa_code);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_nasa_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_nasa_code_key UNIQUE (nasa_code);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: nebula nebula_nasa_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_nasa_code_key UNIQUE (nasa_code);


--
-- Name: nebula nebula_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_pkey PRIMARY KEY (nebula_id);


--
-- Name: planet planet_nasa_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_nasa_code_key UNIQUE (nasa_code);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_nasa_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_nasa_code_key UNIQUE (nasa_code);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: nebula nebula_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

