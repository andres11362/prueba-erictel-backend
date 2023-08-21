--
-- PostgreSQL database dump
--

-- Dumped from database version 11.4
-- Dumped by pg_dump version 11.4

-- Started on 2023-08-21 17:48:58

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

DROP DATABASE prueba_erictel;
--
-- TOC entry 2868 (class 1262 OID 61880)
-- Name: prueba_erictel; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE prueba_erictel WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Colombia.1252' LC_CTYPE = 'Spanish_Colombia.1252';


\connect prueba_erictel

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
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- TOC entry 2869 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 202 (class 1259 OID 73549)
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- TOC entry 201 (class 1259 OID 73547)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2870 (class 0 OID 0)
-- Dependencies: 201
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 197 (class 1259 OID 73465)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


--
-- TOC entry 196 (class 1259 OID 73463)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2871 (class 0 OID 0)
-- Dependencies: 196
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 200 (class 1259 OID 73539)
-- Name: password_resets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


--
-- TOC entry 204 (class 1259 OID 73563)
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 203 (class 1259 OID 73561)
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2872 (class 0 OID 0)
-- Dependencies: 203
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- TOC entry 199 (class 1259 OID 73528)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    description text NOT NULL,
    image character varying(255),
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 198 (class 1259 OID 73526)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2873 (class 0 OID 0)
-- Dependencies: 198
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 2713 (class 2604 OID 73552)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 2711 (class 2604 OID 73468)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 2715 (class 2604 OID 73566)
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- TOC entry 2712 (class 2604 OID 73531)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 2860 (class 0 OID 73549)
-- Dependencies: 202
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2855 (class 0 OID 73465)
-- Dependencies: 197
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.migrations VALUES (5, '2014_10_12_000000_create_users_table', 1);
INSERT INTO public.migrations VALUES (6, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO public.migrations VALUES (7, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO public.migrations VALUES (8, '2019_12_14_000001_create_personal_access_tokens_table', 1);


--
-- TOC entry 2858 (class 0 OID 73539)
-- Dependencies: 200
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2862 (class 0 OID 73563)
-- Dependencies: 204
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2857 (class 0 OID 73528)
-- Dependencies: 199
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Mitchell O''Connell', 'maximillian56@example.net', 'Et quisquam modi provident quidem et porro. Quam amet dignissimos distinctio facilis unde quis adipisci tempore. Voluptatem quia aut velit est voluptatem.', NULL, '2023-08-19 16:26:39', '$2y$10$LWhG.8eW8CC7TvsSf18xAePhtjx4gWVFVnHsLwpqGgE5d3ZQT40km', 'JaPGITBXcz', '2023-08-19 16:26:39', '2023-08-19 16:26:39');
INSERT INTO public.users VALUES (2, 'Miss Kimberly Torp', 'mann.jayme@example.com', 'Itaque aut eos impedit nam dolore et. Qui eos qui ad consectetur unde. A dolores itaque temporibus non itaque dolorem. Perspiciatis dolores quas quod ratione eum dolorem at.', NULL, '2023-08-19 16:26:39', '$2y$10$wYrQsS.Q.B86EI8Gum4tDujoB3KS9vAWBJQ/NEe9bBrFJr0shZugC', 'jE4L960lru', '2023-08-19 16:26:40', '2023-08-19 16:26:40');
INSERT INTO public.users VALUES (3, 'Brant Cremin', 'iwilderman@example.net', 'Nam non repellendus doloribus. Ea nihil quia quibusdam necessitatibus omnis sint commodi. Quia ut sit iste et vero eligendi magni. Doloremque esse assumenda aspernatur.', NULL, '2023-08-19 16:26:39', '$2y$10$aZyzs60fNJpX55ZMVC2MRO.TJf6pPLF2HbsYx2jBocRVAQA5CW6Tm', '3Qu8rP5fta', '2023-08-19 16:26:40', '2023-08-19 16:26:40');
INSERT INTO public.users VALUES (4, 'Perry Gutmann DVM', 'ykemmer@example.com', 'Quis perspiciatis asperiores praesentium quae consectetur. Suscipit dolorem id ipsa blanditiis et cumque reprehenderit. Soluta voluptas eaque neque in sit modi dolor.', NULL, '2023-08-19 16:26:39', '$2y$10$SdtpKtIXOv/JlA8apsfdGuKBCuy30HJ8cICYLli8CzjtcehQdQWl6', 'OXKOYCENCn', '2023-08-19 16:26:40', '2023-08-19 16:26:40');
INSERT INTO public.users VALUES (5, 'Dr. Everardo Zemlak', 'stanton.lennie@example.org', 'Eligendi odit qui omnis et nostrum distinctio et voluptas. Velit ducimus sequi molestias molestiae molestiae corrupti. Ea molestiae totam ut enim non.', NULL, '2023-08-19 16:26:39', '$2y$10$qti2Is9kNxLkhUaOJK/Sq.YUvzKEj5wIzS0aQl1ybL7UFDaaK0IH.', '6Pv1J0gC8x', '2023-08-19 16:26:40', '2023-08-19 16:26:40');
INSERT INTO public.users VALUES (6, 'Kenny Stamm', 'teagan.rice@example.com', 'Facere quia maxime reiciendis sed. Ipsam cum cupiditate ipsa eveniet quo. Qui eum velit adipisci sint in est. Dolorum debitis sint non doloremque.', NULL, '2023-08-19 16:26:39', '$2y$10$UZKxBtArGpwBrXpC3HpJHuZspG6.8oGq0yZSouh/rQKhB1O8Beqy.', 'M2J2SnJjyh', '2023-08-19 16:26:40', '2023-08-19 16:26:40');
INSERT INTO public.users VALUES (7, 'Keshawn Quitzon', 'alfreda67@example.com', 'Velit sequi quis iste qui ipsa excepturi. Cumque consequatur in sit beatae qui modi. Optio nisi sapiente sunt. Dicta aspernatur hic sit sed rerum eaque.', NULL, '2023-08-19 16:26:39', '$2y$10$AHKfUmE.mrt9KQOFpfxZ1OyfbfDUnF91GGsaJE.BHij4Zac699S2y', 'xfhAdS9PRn', '2023-08-19 16:26:40', '2023-08-19 16:26:40');
INSERT INTO public.users VALUES (8, 'Arch Grant I', 'pmurazik@example.net', 'Veritatis facere adipisci atque debitis. Quasi ducimus et ut facere asperiores corrupti dolor. Voluptas vero vel quidem quos quibusdam. Quis sit enim et eos.', NULL, '2023-08-19 16:26:39', '$2y$10$Q6A4PBm8QDFJ5crzOI7N3u4IXhZYtAHdIRSQ7OMRwGRpCMiDoq.BS', 'p608OvCk1x', '2023-08-19 16:26:40', '2023-08-19 16:26:40');
INSERT INTO public.users VALUES (9, 'Lexi Price', 'dare.jacquelyn@example.org', 'Necessitatibus placeat reiciendis ea laudantium culpa non non. Et sed aperiam quae. Delectus vero velit voluptas consectetur et deleniti illo tenetur.', NULL, '2023-08-19 16:26:39', '$2y$10$sFbBeNRfhRiabx/00QlR8uxncuNRT8fRus.HrEe/plgWgZYAnQteG', 'lxXUNbs9fY', '2023-08-19 16:26:40', '2023-08-19 16:26:40');
INSERT INTO public.users VALUES (10, 'Dulce Turcotte', 'aryanna37@example.com', 'Error eos numquam saepe beatae voluptatem incidunt. Id dolore dolorem dignissimos sint eum vel quo. Temporibus fugiat qui id molestias illo ullam voluptas.', NULL, '2023-08-19 16:26:39', '$2y$10$lA5TRl4xMhIy.3b9u8iNGu1nELj9QNtJh21MdOxaYC3VJBfoxMq4y', 'pE7Uy7V6Vj', '2023-08-19 16:26:40', '2023-08-19 16:26:40');
INSERT INTO public.users VALUES (11, 'Sigmund Littel PhD', 'leo49@example.org', 'Maiores officia earum quam nostrum accusantium esse. Provident reiciendis vitae provident quasi officiis. Vitae itaque consequatur ducimus quos totam provident sit necessitatibus.', NULL, '2023-08-19 16:32:09', '$2y$10$M06/P/ey35IpawH7DTy2kOXtV.c7PyoICDnH.mFTp9Oq0cktbAQ1m', 'yA4NHSxDJb', '2023-08-19 16:32:10', '2023-08-19 16:32:10');
INSERT INTO public.users VALUES (12, 'Dr. Monroe Conn', 'easton.harvey@example.com', 'Et eos nemo temporibus fuga quis voluptas molestiae velit. Dolores voluptate vero quos adipisci ut quos voluptatem consequuntur. Quis deserunt voluptates quo molestiae velit.', NULL, '2023-08-19 16:32:09', '$2y$10$bTOxzQ7wbjS4UnfwZvlNZOFQ/k6sLwecDoy6AAbH3KCbF4vePCS/K', 'iKZSsZNuSm', '2023-08-19 16:32:10', '2023-08-19 16:32:10');
INSERT INTO public.users VALUES (13, 'Prof. Liliane Schultz DVM', 'melisa.johnston@example.com', 'Corrupti illo quam rem aut asperiores enim. Maiores rem qui sunt quaerat cupiditate. Earum impedit suscipit molestiae.', NULL, '2023-08-19 16:32:09', '$2y$10$8jnvl6TM/F1Ha47LvdLuwe/0DjIu0jbhLc0WihhuxaTovZ7S3UHeC', 'jt3wCAXMfD', '2023-08-19 16:32:10', '2023-08-19 16:32:10');
INSERT INTO public.users VALUES (14, 'Jennyfer Keebler', 'jstiedemann@example.net', 'Dignissimos magnam iure aspernatur distinctio impedit similique blanditiis. Voluptatem atque veniam laborum porro consectetur.', NULL, '2023-08-19 16:32:09', '$2y$10$T1Jk5ez./wvcxfQe4aXzTe2L6e2OK/DMfsumUAJjtmciVYZbCJSF.', 'MbslmQarBJ', '2023-08-19 16:32:10', '2023-08-19 16:32:10');
INSERT INTO public.users VALUES (15, 'Melody White', 'goyette.mercedes@example.org', 'Laudantium cumque nisi quos. Aut totam sit est corrupti similique rem. Numquam et consequatur saepe similique qui similique aut. Suscipit voluptatem occaecati magnam deleniti iste in fugit.', NULL, '2023-08-19 16:32:09', '$2y$10$c2ogN.BrLFHAJ7CDZffHuuZANrTMWgtJ9F6LNDBzOBtNGc1CiEL4a', 'YqfFu3nzxK', '2023-08-19 16:32:10', '2023-08-19 16:32:10');
INSERT INTO public.users VALUES (16, 'Mrs. Yoshiko Abbott Sr.', 'prosacco.shanny@example.com', 'Quas alias in quod nemo. Alias nesciunt placeat et tempora aspernatur qui ad. Ut ab nemo et.', NULL, '2023-08-19 16:32:09', '$2y$10$x62TSoXJ9xV4ui.DZPQqnu8XI75hfcCw7uCVdxS6Abj9L0kIAVeym', 'gJueDHb8AK', '2023-08-19 16:32:10', '2023-08-19 16:32:10');
INSERT INTO public.users VALUES (17, 'Izabella Brown', 'sauer.fay@example.org', 'Est est quo molestias. Nisi enim doloremque nam voluptatem eos laudantium sed. Rem ex inventore debitis voluptatibus tempore. Illo repellendus voluptas numquam sed.', NULL, '2023-08-19 16:32:09', '$2y$10$vHcUwwyr4FUl7uy08hM44uS9nRRfprNK0K3ydJH455ynA36Zk3l1y', '35r5gIh4o4', '2023-08-19 16:32:10', '2023-08-19 16:32:10');
INSERT INTO public.users VALUES (18, 'Madyson Langworth', 'joaquin.lindgren@example.com', 'Porro tempora asperiores aut consequatur eligendi nam. Odit harum corporis similique maiores amet. Repudiandae non voluptatibus quasi non et ab sit.', NULL, '2023-08-19 16:32:09', '$2y$10$J9X19JlcbCaHgE8QjbRZM.wpR2jtyXES85ycJeQSFr99zt92RTXG.', 'UKVfweSnQ3', '2023-08-19 16:32:10', '2023-08-19 16:32:10');
INSERT INTO public.users VALUES (19, 'Brent Swaniawski', 'sawayn.aleen@example.net', 'Id necessitatibus optio unde ut. Quae in tenetur pariatur ut molestiae corrupti aspernatur. Quidem itaque sint debitis. Repudiandae molestiae in reiciendis reiciendis excepturi.', NULL, '2023-08-19 16:32:09', '$2y$10$LF4ndQeqJzJ9mFgRubPhs.umuUMxV2bOXOdXrR5HZmyJb5141p.fi', 'w8As1X8pg1', '2023-08-19 16:32:10', '2023-08-19 16:32:10');
INSERT INTO public.users VALUES (20, 'Keven Tromp', 'schiller.otilia@example.org', 'Nulla ipsa quis voluptates iure provident enim similique et. Suscipit cumque dolore omnis autem. Ut veniam quia doloremque numquam nulla odit.', NULL, '2023-08-19 16:32:09', '$2y$10$SLekpx3eNWbkYhe4M9fa9eRgPEQ7c5Db7KfXS8/uWGJViOLSIuCWC', 'D9bL4z15QE', '2023-08-19 16:32:10', '2023-08-19 16:32:10');
INSERT INTO public.users VALUES (21, 'Mr. Constantin Marvin', 'ebergnaum@example.com', 'Ipsum mollitia dolor excepturi cum molestiae ut. Debitis hic ea quibusdam officia ad aperiam. Optio autem qui consequatur ipsa. Nobis in voluptatem neque non.', NULL, '2023-08-19 16:33:22', '$2y$10$WiuhLcgkOiLjzKFF5h4ksONR/ujDTuzsFeqZuoz5mj9NnruwBdYNG', 'oZCjtY5H7l', '2023-08-19 16:33:23', '2023-08-19 16:33:23');
INSERT INTO public.users VALUES (22, 'Mr. Monserrate Weissnat', 'wschoen@example.net', 'Veritatis nesciunt quisquam cupiditate. Explicabo animi consequatur quis fugit nobis velit. Porro rerum veniam consequatur non quaerat alias. Magnam ea enim veniam nulla et dolores aut.', NULL, '2023-08-19 16:33:22', '$2y$10$ED5VsDh0n6..OJlhh1/kWuwD9YhPI2oNVRyrCJRHeV.FTE7oAMPJC', 'yMn6lh7JQE', '2023-08-19 16:33:23', '2023-08-19 16:33:23');
INSERT INTO public.users VALUES (23, 'Josie Kuphal', 'walter.else@example.org', 'Laudantium asperiores et asperiores dignissimos. Ipsam iusto quod ipsam commodi enim. Repellendus dolores magnam et debitis nulla.', NULL, '2023-08-19 16:33:22', '$2y$10$AbmeysYqoAN6ZmbVcqPOLuF.F52BkBqu/hp5ccgejeWOlm8RMO0T6', 'HNk4GnwYRR', '2023-08-19 16:33:23', '2023-08-19 16:33:23');
INSERT INTO public.users VALUES (24, 'Jerel VonRueden', 'ozulauf@example.com', 'Voluptatem ea molestias exercitationem repudiandae illo et illum. Maiores in autem maiores sed cum inventore quae dolores. Sunt recusandae dolore quo blanditiis.', NULL, '2023-08-19 16:33:22', '$2y$10$4fL5NYJJ3g.qXQJmN/12PuwFaCzN2EcGzjz3EyErH3UN.zcAPvGDC', 'z9p0lzamOS', '2023-08-19 16:33:23', '2023-08-19 16:33:23');
INSERT INTO public.users VALUES (25, 'Wiley Bartoletti', 'bins.jailyn@example.org', 'Repudiandae eligendi molestias rerum est. At ea amet iste et et quam. Consequatur officia magnam facere tempore quia.', NULL, '2023-08-19 16:33:22', '$2y$10$SX9rwzXRYrdNU5QMcgDNFOSx8YR.OkaT1hQfaCyRHg8HwPszPdwci', 'dyFXubIMGe', '2023-08-19 16:33:23', '2023-08-19 16:33:23');
INSERT INTO public.users VALUES (26, 'Elisa Langosh I', 'pturcotte@example.com', 'Excepturi quis eos aspernatur ut. Cupiditate id alias pariatur sed eveniet id non pariatur. Ab earum et ut id aspernatur illum. Expedita temporibus velit saepe eius.', NULL, '2023-08-19 16:33:22', '$2y$10$TIvljAL3rY0O1MB1jZ0XfO0wMlZxumFv5oVqypmoL.jJws3DpEolS', 'x6Q5HGQf5B', '2023-08-19 16:33:23', '2023-08-19 16:33:23');
INSERT INTO public.users VALUES (27, 'Cameron Toy', 'sven.morar@example.net', 'Aut eos non facilis. Qui in aut quisquam voluptate earum ea. Sed nihil necessitatibus aspernatur.', NULL, '2023-08-19 16:33:22', '$2y$10$yIAJGkGG7KlGFvYn3EOi5O/oDyLiywCUaXDwVPRjKyjekNze9j3IW', '5i9DZUrUnf', '2023-08-19 16:33:23', '2023-08-19 16:33:23');
INSERT INTO public.users VALUES (28, 'Jadyn Steuber MD', 'winona63@example.net', 'Et neque maiores molestiae aliquid. Et dolore voluptatem rerum nam minima. Consequatur excepturi sequi repellat tenetur. Accusamus ut amet nulla.', NULL, '2023-08-19 16:33:22', '$2y$10$8IhVVDs8nbkKSuvNH.iq4ubZlAbEykvumHiqx65BMuKK8ZVsYVSk6', 'dErlCQYoA3', '2023-08-19 16:33:23', '2023-08-19 16:33:23');
INSERT INTO public.users VALUES (29, 'Myra Altenwerth', 'lauriane63@example.com', 'Blanditiis et est consectetur non asperiores eius repellendus. Beatae animi dolor saepe ut non error iste. Molestiae enim quia officia. Optio debitis est quia qui architecto quia non.', NULL, '2023-08-19 16:33:23', '$2y$10$akKbGGJQpmXFgr7PIiPj8.HuVR862KTO7o5saFygS0igczUmtt3TG', 'StNBkhaM7f', '2023-08-19 16:33:23', '2023-08-19 16:33:23');
INSERT INTO public.users VALUES (30, 'Jayce Bradtke', 'swift.asha@example.net', 'Illum sit at ullam qui illum quia. Id qui reiciendis consequatur molestiae soluta natus. Veniam dolor aut ducimus ducimus officiis.', NULL, '2023-08-19 16:33:23', '$2y$10$GQDEJDVFGL5q3w6ehWI8sO4PNFLircgiOV/VxqqfQI9FZfZUAJWei', 'Je5LUYOhyT', '2023-08-19 16:33:23', '2023-08-19 16:33:23');


--
-- TOC entry 2874 (class 0 OID 0)
-- Dependencies: 201
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 2875 (class 0 OID 0)
-- Dependencies: 196
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.migrations_id_seq', 8, true);


--
-- TOC entry 2876 (class 0 OID 0)
-- Dependencies: 203
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- TOC entry 2877 (class 0 OID 0)
-- Dependencies: 198
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 38, true);


--
-- TOC entry 2725 (class 2606 OID 73558)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 73560)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 2717 (class 2606 OID 73470)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 73546)
-- Name: password_resets password_resets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.password_resets
    ADD CONSTRAINT password_resets_pkey PRIMARY KEY (email);


--
-- TOC entry 2729 (class 2606 OID 73571)
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 73574)
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- TOC entry 2719 (class 2606 OID 73538)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 2721 (class 2606 OID 73536)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 1259 OID 73572)
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


-- Completed on 2023-08-21 17:48:58

--
-- PostgreSQL database dump complete
--

