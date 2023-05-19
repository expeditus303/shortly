--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)

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
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token text NOT NULL,
    active boolean DEFAULT true NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: shorts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shorts (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "shortUrl" text NOT NULL,
    url text NOT NULL,
    "visitCount" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: shorts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.shorts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shorts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.shorts_id_seq OWNED BY public.shorts.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    createdat timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: shorts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shorts ALTER COLUMN id SET DEFAULT nextval('public.shorts_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 1, 'afb33353-c8fb-434a-b8df-ec018f0dee73', true, '2023-05-18 16:05:28.244677-03');
INSERT INTO public.sessions VALUES (2, 3, 'f8d4e1ed-23d9-4e26-91cd-cdb4f6fab6d3', true, '2023-05-18 18:58:22.291144-03');


--
-- Data for Name: shorts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.shorts VALUES (8, 1, 'JcElQIsfKV2e', 'https://s2.glbimg.com/88a4QNHTzEa2Pwm0NmiFtvja-5I=/0x0:1200x768/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2022/6/Z/BtyF8UT5aeLFwmccA9CQ/fotonaruto2.jpg', 0, '2023-05-18 21:17:32.607251-03');
INSERT INTO public.shorts VALUES (19, 3, 'lK1yEpece8On', 'https://s2.glbimg.com/88a4QNHTzEa2Pwm0NmiFtvja-5I=/0x0:1200x768/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2022/6/Z/BtyF8UT5aeLFwmccA9CQ/fotonaruto2.jpg', 0, '2023-05-19 11:29:20.409056-03');
INSERT INTO public.shorts VALUES (21, 3, 'OH-jcH3kZyZe', 'https://s2.glbimg.com/88a4QNHTzEa2Pwm0NmiFtvja-5I=/0x0:1200x768/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2022/6/Z/BtyF8UT5aeLFwmccA9CQ/fotonaruto2.jpg', 0, '2023-05-19 11:29:20.687561-03');
INSERT INTO public.shorts VALUES (15, 3, 'GEP5xSFrphpd', 'https://s2.glbimg.com/88a4QNHTzEa2Pwm0NmiFtvja-5I=/0x0:1200x768/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2022/6/Z/BtyF8UT5aeLFwmccA9CQ/fotonaruto2.jpg', 3, '2023-05-19 11:29:19.850104-03');
INSERT INTO public.shorts VALUES (17, 3, 'AFr81ySCh2yu', 'https://s2.glbimg.com/88a4QNHTzEa2Pwm0NmiFtvja-5I=/0x0:1200x768/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2022/6/Z/BtyF8UT5aeLFwmccA9CQ/fotonaruto2.jpg', 4, '2023-05-19 11:29:20.149422-03');
INSERT INTO public.shorts VALUES (22, 4, 'A7x5RBq9eS3f', 'https://i.kym-cdn.com/photos/images/original/000/862/065/0e9.jpg', 0, '2023-05-19 15:17:55.896051-03');
INSERT INTO public.shorts VALUES (25, 6, 'NRWfGSEbYLiU', 'https://i.kym-cdn.com/photos/images/original/000/862/065/0e9.jpg', 0, '2023-05-19 15:19:26.800171-03');
INSERT INTO public.shorts VALUES (26, 7, 'kWT_OCYTAJG7', 'https://i.kym-cdn.com/photos/images/original/000/862/065/0e9.jpg', 0, '2023-05-19 15:19:41.477938-03');
INSERT INTO public.shorts VALUES (27, 8, 'VgDTgXhoEy66', 'https://i.kym-cdn.com/photos/images/original/000/862/065/0e9.jpg', 0, '2023-05-19 15:19:59.868526-03');
INSERT INTO public.shorts VALUES (28, 9, 'GmJJKSnf4DRz', 'https://i.kym-cdn.com/photos/images/original/000/862/065/0e9.jpg', 0, '2023-05-19 15:24:26.241122-03');
INSERT INTO public.shorts VALUES (29, 10, 'gbFmvq5atA5c', 'https://i.kym-cdn.com/photos/images/original/000/862/065/0e9.jpg', 0, '2023-05-19 15:24:48.2391-03');
INSERT INTO public.shorts VALUES (30, 11, 'dP3MSlV_vy_6', 'https://i.kym-cdn.com/photos/images/original/000/862/065/0e9.jpg', 0, '2023-05-19 15:25:13.505018-03');
INSERT INTO public.shorts VALUES (18, 4, '6D-0fqx4EmTn', 'https://s2.glbimg.com/88a4QNHTzEa2Pwm0NmiFtvja-5I=/0x0:1200x768/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2022/6/Z/BtyF8UT5aeLFwmccA9CQ/fotonaruto2.jpg', 0, '2023-05-19 11:29:20.270939-03');
INSERT INTO public.shorts VALUES (14, 4, '2mBaSvpy4liB', 'https://s2.glbimg.com/88a4QNHTzEa2Pwm0NmiFtvja-5I=/0x0:1200x768/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2022/6/Z/BtyF8UT5aeLFwmccA9CQ/fotonaruto2.jpg', 15, '2023-05-19 11:29:19.667285-03');
INSERT INTO public.shorts VALUES (16, 4, 'FLFwKFZn67zl', 'https://s2.glbimg.com/88a4QNHTzEa2Pwm0NmiFtvja-5I=/0x0:1200x768/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2022/6/Z/BtyF8UT5aeLFwmccA9CQ/fotonaruto2.jpg', 20, '2023-05-19 11:29:19.952853-03');
INSERT INTO public.shorts VALUES (13, 2, 'xA6mnfQCfG5i', 'https://s2.glbimg.com/88a4QNHTzEa2Pwm0NmiFtvja-5I=/0x0:1200x768/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2022/6/Z/BtyF8UT5aeLFwmccA9CQ/fotonaruto2.jpg', 7, '2023-05-19 11:29:19.596109-03');
INSERT INTO public.shorts VALUES (20, 3, '0Push3sY5lbn', 'https://s2.glbimg.com/88a4QNHTzEa2Pwm0NmiFtvja-5I=/0x0:1200x768/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2022/6/Z/BtyF8UT5aeLFwmccA9CQ/fotonaruto2.jpg', 3, '2023-05-19 11:29:20.517943-03');
INSERT INTO public.shorts VALUES (23, 4, 'TCA_WQ26WuIj', 'https://i.kym-cdn.com/photos/images/original/000/862/065/0e9.jpg', 30, '2023-05-19 15:18:51.254636-03');
INSERT INTO public.shorts VALUES (24, 5, 'jti5Omtb3DZJ', 'https://i.kym-cdn.com/photos/images/original/000/862/065/0e9.jpg', 134, '2023-05-19 15:19:05.588579-03');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Gabriel Medina', 'medina@gmail.com', '$2b$10$juXmfF8C4mloUjb9KgViJ.SKthXMAk2Aup8kU05QK1oYdOgdACzwC', '2023-05-18 16:04:37.349686-03');
INSERT INTO public.users VALUES (2, 'Taj Burrow', 'tajburow@gmail.com', '$2b$10$HGUrmWi10nAfsFEsd6gK9ucCvJaSlVHLVh/RXVGj75NQRGqw/noK6', '2023-05-18 18:21:27.40444-03');
INSERT INTO public.users VALUES (3, 'Bruce Irons', 'bruceirons@gmail.com', '$2b$10$Cl25O8g7vhXTavQ2lX4eaezbs7raW4hjWUgxsW1uUFSuzwn08/kGq', '2023-05-18 18:58:03.909238-03');
INSERT INTO public.users VALUES (4, 'Andy Irons', 'andyirons@gmail.com', '$2b$10$77He4Oii9e8tfsq5R0lemOFx.PTuUmfJHaMxYSf.d0QP.ZtTXGE.2', '2023-05-19 15:06:40.984155-03');
INSERT INTO public.users VALUES (5, 'Kelly Slater', 'slater@gmail.com', '$2b$10$BWBFtmGX6d8QnZvFlVOkKOJixCBfmvmDHm8zEfHZvuyo5sacn39Gy', '2023-05-19 15:06:52.003153-03');
INSERT INTO public.users VALUES (6, 'Sunny Garcia', 'hawaii@gmail.com', '$2b$10$xSuslFsz/w/hmMEYqL05I.BfgO.2fjZRiQRCaBelRHAY.93QnazF.', '2023-05-19 15:07:11.874709-03');
INSERT INTO public.users VALUES (7, 'Dingo Morrison', 'fuck@gmail.com', '$2b$10$tQ5LIxnvKkhNU8Xu6wV.juJOLeLZnjtIxFX6ygEiG.feUV.qThrjS', '2023-05-19 15:07:24.15165-03');
INSERT INTO public.users VALUES (8, 'Dane Reynolds', 'firstchapter@gmail.com', '$2b$10$Eolh0wxotpM5FjVcEU3hTueIBGcBJMf8LTs8SckOA6DuD.PbiKKPe', '2023-05-19 15:08:04.070843-03');
INSERT INTO public.users VALUES (9, 'John John Florence', 'florence@gmail.com', '$2b$10$oOwhSnufGn2K/NFEUIliaOFMY5nchI0RvpwcKTdVo2ZElYwYLNKnm', '2023-05-19 15:08:24.956615-03');
INSERT INTO public.users VALUES (10, 'Aristóteles', 'filo@gmail.com', '$2b$10$tOf.bl2DPK.MBAzFZiBgK.36zYhwKzg7V7vIqF4BzKozY0/o33lWG', '2023-05-19 15:08:38.473068-03');
INSERT INTO public.users VALUES (11, 'Diógenes', 'filos@gmail.com', '$2b$10$S6RHtNLKUpOYYZfGeWeSFuztUnOdRbRcDGVzU67KtYdQThhJjtoTe', '2023-05-19 15:08:51.150461-03');
INSERT INTO public.users VALUES (12, 'Brandon', 'letsgobrandon@gmail.com', '$2b$10$tlj5jAPXsFbb0jZFM1YWXeseqzFrIFlPkiRDM7j/BVGQ5jPf9VXSy', '2023-05-19 15:09:20.28405-03');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 2, true);


--
-- Name: shorts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.shorts_id_seq', 30, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 12, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_token_key UNIQUE (token);


--
-- Name: shorts shorts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shorts
    ADD CONSTRAINT shorts_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: shorts shorts_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shorts
    ADD CONSTRAINT "shorts_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

