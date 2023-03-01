--
-- PostgreSQL database dump
--

-- Dumped from database version 14.6 (Ubuntu 14.6-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.6 (Ubuntu 14.6-0ubuntu0.22.04.1)

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
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
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
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "shortUrl" text NOT NULL,
    url text NOT NULL,
    "visitCount" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
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
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 2, 'ba4b4559-58c7-4639-93d1-56a430db2bcb', '2023-02-27 17:42:39.969693');
INSERT INTO public.sessions VALUES (2, 1, 'd16c3798-915d-4e97-8bb0-3d9efc7efd4f', '2023-02-27 20:20:49.549453');
INSERT INTO public.sessions VALUES (3, 9, 'f59799e7-a89a-49d9-a400-df0074c4f4bf', '2023-02-28 11:20:25.575103');
INSERT INTO public.sessions VALUES (4, 10, '9e0e5ae0-cb88-4ff1-a673-2c0d6e481a9e', '2023-02-28 11:20:55.608634');
INSERT INTO public.sessions VALUES (5, 5, 'c3bd0f53-2010-448b-bbbc-600cddaa432f', '2023-02-28 12:36:41.980789');
INSERT INTO public.sessions VALUES (6, 4, 'c2b762a7-d62c-4d9e-82d7-e4c925698161', '2023-02-28 15:29:26.196785');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (14, 2, 'ARvQUxbBds', 'https://imgs.search.brave.com/cU3RsVNo-t6naXHKCunPI9AJ3BaL6MK9VwF8kEZhZFQ/rs:fit:499:900:1/g:ce/aHR0cHM6Ly9pbWFn/ZXMuZmluZWFydGFt/ZXJpY2EuY29tL2lt/YWdlcy1tZWRpdW0t/bGFyZ2UtNS9zYWlu/dC1leHBlZGl0dXMt/bWFydHlyLWludm9r/ZWQtYXQtdGhlLW1h/cnktZXZhbnMtcGlj/dHVyZS1saWJyYXJ5/LmpwZw', 1, '2023-02-28 12:21:25.036107');
INSERT INTO public.urls VALUES (5, 1, '0jEdvxkN90', 'https://imgs.search.brave.com/cU3RsVNo-t6naXHKCunPI9AJ3BaL6MK9VwF8kEZhZFQ/rs:fit:499:900:1/g:ce/aHR0cHM6Ly9pbWFn/ZXMuZmluZWFydGFt/ZXJpY2EuY29tL2lt/YWdlcy1tZWRpdW0t/bGFyZ2UtNS9zYWlu/dC1leHBlZGl0dXMt/bWFydHlyLWludm9r/ZWQtYXQtdGhlLW1h/cnktZXZhbnMtcGlj/dHVyZS1saWJyYXJ5/LmpwZw', 10, '2023-02-27 20:20:58.764827');
INSERT INTO public.urls VALUES (4, 2, 'FE64J_km20', 'https://ovicio.com.br/wp-content/uploads/2023/01/20230107-naruto-jutsu.jpg', 2, '2023-02-27 17:50:35.878214');
INSERT INTO public.urls VALUES (12, 2, 'ybBS5jFLN5', 'https://imgs.search.brave.com/cU3RsVNo-t6naXHKCunPI9AJ3BaL6MK9VwF8kEZhZFQ/rs:fit:499:900:1/g:ce/aHR0cHM6Ly9pbWFn/ZXMuZmluZWFydGFt/ZXJpY2EuY29tL2lt/YWdlcy1tZWRpdW0t/bGFyZ2UtNS9zYWlu/dC1leHBlZGl0dXMt/bWFydHlyLWludm9r/ZWQtYXQtdGhlLW1h/cnktZXZhbnMtcGlj/dHVyZS1saWJyYXJ5/LmpwZw', 0, '2023-02-28 12:21:24.562805');
INSERT INTO public.urls VALUES (13, 2, 'xH1cX_wP0L', 'https://imgs.search.brave.com/cU3RsVNo-t6naXHKCunPI9AJ3BaL6MK9VwF8kEZhZFQ/rs:fit:499:900:1/g:ce/aHR0cHM6Ly9pbWFn/ZXMuZmluZWFydGFt/ZXJpY2EuY29tL2lt/YWdlcy1tZWRpdW0t/bGFyZ2UtNS9zYWlu/dC1leHBlZGl0dXMt/bWFydHlyLWludm9r/ZWQtYXQtdGhlLW1h/cnktZXZhbnMtcGlj/dHVyZS1saWJyYXJ5/LmpwZw', 0, '2023-02-28 12:21:24.898832');
INSERT INTO public.urls VALUES (15, 2, 'NiD8AoY9T0', 'https://imgs.search.brave.com/cU3RsVNo-t6naXHKCunPI9AJ3BaL6MK9VwF8kEZhZFQ/rs:fit:499:900:1/g:ce/aHR0cHM6Ly9pbWFn/ZXMuZmluZWFydGFt/ZXJpY2EuY29tL2lt/YWdlcy1tZWRpdW0t/bGFyZ2UtNS9zYWlu/dC1leHBlZGl0dXMt/bWFydHlyLWludm9r/ZWQtYXQtdGhlLW1h/cnktZXZhbnMtcGlj/dHVyZS1saWJyYXJ5/LmpwZw', 0, '2023-02-28 12:21:25.347454');
INSERT INTO public.urls VALUES (16, 2, '-oliZH7V2c', 'https://imgs.search.brave.com/cU3RsVNo-t6naXHKCunPI9AJ3BaL6MK9VwF8kEZhZFQ/rs:fit:499:900:1/g:ce/aHR0cHM6Ly9pbWFn/ZXMuZmluZWFydGFt/ZXJpY2EuY29tL2lt/YWdlcy1tZWRpdW0t/bGFyZ2UtNS9zYWlu/dC1leHBlZGl0dXMt/bWFydHlyLWludm9r/ZWQtYXQtdGhlLW1h/cnktZXZhbnMtcGlj/dHVyZS1saWJyYXJ5/LmpwZw', 0, '2023-02-28 12:21:25.502067');
INSERT INTO public.urls VALUES (17, 2, 'sPinja0vT9', 'https://imgs.search.brave.com/cU3RsVNo-t6naXHKCunPI9AJ3BaL6MK9VwF8kEZhZFQ/rs:fit:499:900:1/g:ce/aHR0cHM6Ly9pbWFn/ZXMuZmluZWFydGFt/ZXJpY2EuY29tL2lt/YWdlcy1tZWRpdW0t/bGFyZ2UtNS9zYWlu/dC1leHBlZGl0dXMt/bWFydHlyLWludm9r/ZWQtYXQtdGhlLW1h/cnktZXZhbnMtcGlj/dHVyZS1saWJyYXJ5/LmpwZw', 0, '2023-02-28 12:21:25.629579');
INSERT INTO public.urls VALUES (18, 2, '6bWQhX6tZz', 'https://imgs.search.brave.com/cU3RsVNo-t6naXHKCunPI9AJ3BaL6MK9VwF8kEZhZFQ/rs:fit:499:900:1/g:ce/aHR0cHM6Ly9pbWFn/ZXMuZmluZWFydGFt/ZXJpY2EuY29tL2lt/YWdlcy1tZWRpdW0t/bGFyZ2UtNS9zYWlu/dC1leHBlZGl0dXMt/bWFydHlyLWludm9r/ZWQtYXQtdGhlLW1h/cnktZXZhbnMtcGlj/dHVyZS1saWJyYXJ5/LmpwZw', 0, '2023-02-28 12:21:25.784477');
INSERT INTO public.urls VALUES (19, 2, '9dqmRquIBt', 'https://imgs.search.brave.com/cU3RsVNo-t6naXHKCunPI9AJ3BaL6MK9VwF8kEZhZFQ/rs:fit:499:900:1/g:ce/aHR0cHM6Ly9pbWFn/ZXMuZmluZWFydGFt/ZXJpY2EuY29tL2lt/YWdlcy1tZWRpdW0t/bGFyZ2UtNS9zYWlu/dC1leHBlZGl0dXMt/bWFydHlyLWludm9r/ZWQtYXQtdGhlLW1h/cnktZXZhbnMtcGlj/dHVyZS1saWJyYXJ5/LmpwZw', 0, '2023-02-28 12:21:25.900954');
INSERT INTO public.urls VALUES (20, 2, '7aJ1tZHptv', 'https://imgs.search.brave.com/cU3RsVNo-t6naXHKCunPI9AJ3BaL6MK9VwF8kEZhZFQ/rs:fit:499:900:1/g:ce/aHR0cHM6Ly9pbWFn/ZXMuZmluZWFydGFt/ZXJpY2EuY29tL2lt/YWdlcy1tZWRpdW0t/bGFyZ2UtNS9zYWlu/dC1leHBlZGl0dXMt/bWFydHlyLWludm9r/ZWQtYXQtdGhlLW1h/cnktZXZhbnMtcGlj/dHVyZS1saWJyYXJ5/LmpwZw', 0, '2023-02-28 12:21:26.079259');
INSERT INTO public.urls VALUES (21, 2, 'SIupvrChVC', 'https://imgs.search.brave.com/cU3RsVNo-t6naXHKCunPI9AJ3BaL6MK9VwF8kEZhZFQ/rs:fit:499:900:1/g:ce/aHR0cHM6Ly9pbWFn/ZXMuZmluZWFydGFt/ZXJpY2EuY29tL2lt/YWdlcy1tZWRpdW0t/bGFyZ2UtNS9zYWlu/dC1leHBlZGl0dXMt/bWFydHlyLWludm9r/ZWQtYXQtdGhlLW1h/cnktZXZhbnMtcGlj/dHVyZS1saWJyYXJ5/LmpwZw', 0, '2023-02-28 12:21:26.202007');
INSERT INTO public.urls VALUES (22, 2, 'GXnFtj7PJU', 'https://imgs.search.brave.com/cU3RsVNo-t6naXHKCunPI9AJ3BaL6MK9VwF8kEZhZFQ/rs:fit:499:900:1/g:ce/aHR0cHM6Ly9pbWFn/ZXMuZmluZWFydGFt/ZXJpY2EuY29tL2lt/YWdlcy1tZWRpdW0t/bGFyZ2UtNS9zYWlu/dC1leHBlZGl0dXMt/bWFydHlyLWludm9r/ZWQtYXQtdGhlLW1h/cnktZXZhbnMtcGlj/dHVyZS1saWJyYXJ5/LmpwZw', 0, '2023-02-28 12:21:26.982087');
INSERT INTO public.urls VALUES (23, 4, 'P9X9gmI5Jh', 'https://letmegooglethat.com/?q=why+birds+can+fly%3F', 5, '2023-02-28 15:31:38.440613');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Ricardo', 'ricardo@gmail.com', '$2b$10$G0IKn2O8UQYFDMg.olENgOv1hJ0x0ubT/O./Iqkvgho1qAl7qEzWe', '2023-02-27 00:00:00');
INSERT INTO public.users VALUES (2, 'Ana', 'ana@gmail.com', '$2b$10$FKy96RvjdubgoAIagBk.WullgKruAurZDSKa7J.eZIxaQRWXmfqK.', '2023-02-27 00:00:00');
INSERT INTO public.users VALUES (3, 'João', 'bigode@gmail.com', '$2b$10$9LJ0QLkgzT3w.cR7FBrz4uiyUtm25yQv9suycJxV.RYiRjGv9GcES', '2023-02-27 00:00:00');
INSERT INTO public.users VALUES (4, 'Lucas', 'lucas@gmail.com', '$2b$10$YNEsM4LfDtcGz7.88tpjOugtKYBfe/iUHgGg6Veq9BJH6lAuMkTGa', '2023-02-27 00:00:00');
INSERT INTO public.users VALUES (5, 'Deisy', 'deisy@gmail.com', '$2b$10$DHroqyLVHBTfm.2esNS93u8CdO2ew0AhlxjrSBzdAsa1KW7rspZ26', '2023-02-27 00:00:00');
INSERT INTO public.users VALUES (6, 'Rafael', 'rafael@gmail.com', '$2b$10$e1OCTcoOjybjyuFxCWczbe01.Y3Ko3mXQnaBG5kyuH2hJa1LDa1Wy', '2023-02-27 00:00:00');
INSERT INTO public.users VALUES (7, 'Diva', 'diva@gmail.com', '$2b$10$aLt42IGN/Z6dZIofBcNFv.LVcWIKoSIwHd.n.ytlVJnHrXTPhFZ9G', '2023-02-27 00:00:00');
INSERT INTO public.users VALUES (8, 'Ivanyr', 'Ivanyr@gmail.com', '$2b$10$z1FyF5gozfzNme0WWs38hO6nYRMKwytbWc3/02XnY1FlJLzNQ6/Ni', '2023-02-27 00:00:00');
INSERT INTO public.users VALUES (9, 'Diogenes', 'diogenes@gmail.com', '$2b$10$eDu8VTnkS.ejiQ9uab9uu.j4/4ZQUD7NVMKfVa.S6pywPPAjwrLzu', '2023-02-27 00:00:00');
INSERT INTO public.users VALUES (10, 'sonia', 'sonia@gmail.com', '$2b$10$I9kTqK0pDcL6qh16e5nWtegIWh0yWnupcUt.XzOHhVwdyt7642hwa', '2023-02-27 00:00:00');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 6, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 23, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 10, true);


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
-- Name: sessions sessions_userId_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_key" UNIQUE ("userId");


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: urls urls_shortUrl_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_shortUrl_key" UNIQUE ("shortUrl");


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
-- Name: urls urls_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

