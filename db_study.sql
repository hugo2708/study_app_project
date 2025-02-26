toc.dat                                                                                             0000600 0004000 0002000 00000024077 14431032246 0014450 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       9    9                {            db_study_app    15.2    15.2 $    &           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         '           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         (           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         )           1262    16396    db_study_app    DATABASE     n   CREATE DATABASE db_study_app WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE db_study_app;
                postgres    false         �            1259    16397    themes    TABLE     �   CREATE TABLE public.themes (
    id integer NOT NULL,
    create_date timestamp without time zone,
    name character varying,
    description character varying,
    keywords character varying,
    owner_user_id integer
);
    DROP TABLE public.themes;
       public         heap    postgres    false         �            1259    16402    themes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.themes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.themes_id_seq;
       public          postgres    false    214         *           0    0    themes_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.themes_id_seq OWNED BY public.themes.id;
          public          postgres    false    215         �            1259    16403    themes_properties    TABLE     �   CREATE TABLE public.themes_properties (
    id integer NOT NULL,
    theme_id integer,
    property_name character varying,
    property_value character varying
);
 %   DROP TABLE public.themes_properties;
       public         heap    postgres    false         �            1259    16408    themes_properties_id_seq    SEQUENCE     �   CREATE SEQUENCE public.themes_properties_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.themes_properties_id_seq;
       public          postgres    false    216         +           0    0    themes_properties_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.themes_properties_id_seq OWNED BY public.themes_properties.id;
          public          postgres    false    217         �            1259    16409    topics    TABLE     �   CREATE TABLE public.topics (
    id integer NOT NULL,
    create_date timestamp without time zone,
    name character varying,
    topic_id integer,
    "order" integer,
    priority integer,
    color character varying,
    owner_user_id integer
);
    DROP TABLE public.topics;
       public         heap    postgres    false         �            1259    16414    topics_id_seq    SEQUENCE     �   CREATE SEQUENCE public.topics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.topics_id_seq;
       public          postgres    false    218         ,           0    0    topics_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.topics_id_seq OWNED BY public.topics.id;
          public          postgres    false    219         �            1259    16415    users    TABLE       CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying,
    last_name character varying,
    avatar character varying,
    email character varying,
    password character varying,
    deleted boolean,
    token character varying
);
    DROP TABLE public.users;
       public         heap    postgres    false         �            1259    16420    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    220         -           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    221         ~           2604    16421 	   themes id    DEFAULT     f   ALTER TABLE ONLY public.themes ALTER COLUMN id SET DEFAULT nextval('public.themes_id_seq'::regclass);
 8   ALTER TABLE public.themes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214                    2604    16422    themes_properties id    DEFAULT     |   ALTER TABLE ONLY public.themes_properties ALTER COLUMN id SET DEFAULT nextval('public.themes_properties_id_seq'::regclass);
 C   ALTER TABLE public.themes_properties ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216         �           2604    16423 	   topics id    DEFAULT     f   ALTER TABLE ONLY public.topics ALTER COLUMN id SET DEFAULT nextval('public.topics_id_seq'::regclass);
 8   ALTER TABLE public.topics ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218         �           2604    16424    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220                   0    16397    themes 
   TABLE DATA           ]   COPY public.themes (id, create_date, name, description, keywords, owner_user_id) FROM stdin;
    public          postgres    false    214       3612.dat           0    16403    themes_properties 
   TABLE DATA           X   COPY public.themes_properties (id, theme_id, property_name, property_value) FROM stdin;
    public          postgres    false    216       3614.dat            0    16409    topics 
   TABLE DATA           j   COPY public.topics (id, create_date, name, topic_id, "order", priority, color, owner_user_id) FROM stdin;
    public          postgres    false    218       3616.dat "          0    16415    users 
   TABLE DATA           ]   COPY public.users (id, name, last_name, avatar, email, password, deleted, token) FROM stdin;
    public          postgres    false    220       3618.dat .           0    0    themes_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.themes_id_seq', 2, true);
          public          postgres    false    215         /           0    0    themes_properties_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.themes_properties_id_seq', 9, true);
          public          postgres    false    217         0           0    0    topics_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.topics_id_seq', 1, false);
          public          postgres    false    219         1           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 9, true);
          public          postgres    false    221         �           2606    16426    themes themes_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.themes
    ADD CONSTRAINT themes_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.themes DROP CONSTRAINT themes_pkey;
       public            postgres    false    214         �           2606    16428 (   themes_properties themes_properties_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.themes_properties
    ADD CONSTRAINT themes_properties_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.themes_properties DROP CONSTRAINT themes_properties_pkey;
       public            postgres    false    216         �           2606    16430    topics topics_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.topics DROP CONSTRAINT topics_pkey;
       public            postgres    false    218         �           2606    16432    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    220         �           2606    16433     themes themes_owner_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.themes
    ADD CONSTRAINT themes_owner_user_id_fkey FOREIGN KEY (owner_user_id) REFERENCES public.users(id);
 J   ALTER TABLE ONLY public.themes DROP CONSTRAINT themes_owner_user_id_fkey;
       public          postgres    false    220    3465    214         �           2606    16438 1   themes_properties themes_properties_theme_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.themes_properties
    ADD CONSTRAINT themes_properties_theme_id_fkey FOREIGN KEY (theme_id) REFERENCES public.themes(id);
 [   ALTER TABLE ONLY public.themes_properties DROP CONSTRAINT themes_properties_theme_id_fkey;
       public          postgres    false    214    216    3459         �           2606    16443     topics topics_owner_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_owner_user_id_fkey FOREIGN KEY (owner_user_id) REFERENCES public.users(id);
 J   ALTER TABLE ONLY public.topics DROP CONSTRAINT topics_owner_user_id_fkey;
       public          postgres    false    218    220    3465         �           2606    16448    topics topics_topic_id_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_topic_id_fkey FOREIGN KEY (topic_id) REFERENCES public.topics(id);
 E   ALTER TABLE ONLY public.topics DROP CONSTRAINT topics_topic_id_fkey;
       public          postgres    false    218    218    3463                                                                                                                                                                                                                                                                                                                                                                                                                                                                         3612.dat                                                                                            0000600 0004000 0002000 00000000216 14431032246 0014243 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	2023-03-31 08:02:03	Ciencias	Ciencias	ciencias	1
2	2023-01-26 17:00:05	Gestion de Proyectos	Gestion de Proyectos	gestions, proyectos	1
\.


                                                                                                                                                                                                                                                                                                                                                                                  3614.dat                                                                                            0000600 0004000 0002000 00000000314 14431032246 0014244 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	1	percent_complete	50
3	1	notification_date	2023-03-21T20:35:00
5	1	shared_by	Maria Ana Gonzalez
1	1	visited	true
7	2	percent_complete	75
8	2	notification_date	2023-04-28T14:00:00
6	2	visited	true
\.


                                                                                                                                                                                                                                                                                                                    3616.dat                                                                                            0000600 0004000 0002000 00000000005 14431032246 0014243 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3618.dat                                                                                            0000600 0004000 0002000 00000000730 14431032246 0014252 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        3	undefined	undefined	undefined	undefined	undefined	f	\N
4	undefined	undefined	undefined	undefined	undefined	f	\N
5	Yanina	undefined	null	yani@yani,com	12345	f	\N
6	undefined	undefined	undefined	undefined	undefined	f	\N
7	undefined	undefined	undefined	undefined	undefined	f	\N
2	undefined	undefined	undefined	undefined	undefined	t	\N
1	Jose	Aguilera	\N	jose@jose,com	12345	f	\N
8	Alan	Fernandez	\N	alan18@gmail.com	5432	t	\N
9	Alan	\N	\N	alan@alan.com	123456798	t	\N
\.


                                        restore.sql                                                                                         0000600 0004000 0002000 00000020721 14431032246 0015365 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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

DROP DATABASE db_study_app;
--
-- Name: db_study_app; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE db_study_app WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';


ALTER DATABASE db_study_app OWNER TO postgres;

\connect db_study_app

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
-- Name: themes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.themes (
    id integer NOT NULL,
    create_date timestamp without time zone,
    name character varying,
    description character varying,
    keywords character varying,
    owner_user_id integer
);


ALTER TABLE public.themes OWNER TO postgres;

--
-- Name: themes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.themes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.themes_id_seq OWNER TO postgres;

--
-- Name: themes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.themes_id_seq OWNED BY public.themes.id;


--
-- Name: themes_properties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.themes_properties (
    id integer NOT NULL,
    theme_id integer,
    property_name character varying,
    property_value character varying
);


ALTER TABLE public.themes_properties OWNER TO postgres;

--
-- Name: themes_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.themes_properties_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.themes_properties_id_seq OWNER TO postgres;

--
-- Name: themes_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.themes_properties_id_seq OWNED BY public.themes_properties.id;


--
-- Name: topics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.topics (
    id integer NOT NULL,
    create_date timestamp without time zone,
    name character varying,
    topic_id integer,
    "order" integer,
    priority integer,
    color character varying,
    owner_user_id integer
);


ALTER TABLE public.topics OWNER TO postgres;

--
-- Name: topics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.topics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.topics_id_seq OWNER TO postgres;

--
-- Name: topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.topics_id_seq OWNED BY public.topics.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying,
    last_name character varying,
    avatar character varying,
    email character varying,
    password character varying,
    deleted boolean,
    token character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: themes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes ALTER COLUMN id SET DEFAULT nextval('public.themes_id_seq'::regclass);


--
-- Name: themes_properties id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes_properties ALTER COLUMN id SET DEFAULT nextval('public.themes_properties_id_seq'::regclass);


--
-- Name: topics id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topics ALTER COLUMN id SET DEFAULT nextval('public.topics_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: themes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.themes (id, create_date, name, description, keywords, owner_user_id) FROM stdin;
\.
COPY public.themes (id, create_date, name, description, keywords, owner_user_id) FROM '$$PATH$$/3612.dat';

--
-- Data for Name: themes_properties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.themes_properties (id, theme_id, property_name, property_value) FROM stdin;
\.
COPY public.themes_properties (id, theme_id, property_name, property_value) FROM '$$PATH$$/3614.dat';

--
-- Data for Name: topics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.topics (id, create_date, name, topic_id, "order", priority, color, owner_user_id) FROM stdin;
\.
COPY public.topics (id, create_date, name, topic_id, "order", priority, color, owner_user_id) FROM '$$PATH$$/3616.dat';

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, last_name, avatar, email, password, deleted, token) FROM stdin;
\.
COPY public.users (id, name, last_name, avatar, email, password, deleted, token) FROM '$$PATH$$/3618.dat';

--
-- Name: themes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.themes_id_seq', 2, true);


--
-- Name: themes_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.themes_properties_id_seq', 9, true);


--
-- Name: topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.topics_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 9, true);


--
-- Name: themes themes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT themes_pkey PRIMARY KEY (id);


--
-- Name: themes_properties themes_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes_properties
    ADD CONSTRAINT themes_properties_pkey PRIMARY KEY (id);


--
-- Name: topics topics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: themes themes_owner_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT themes_owner_user_id_fkey FOREIGN KEY (owner_user_id) REFERENCES public.users(id);


--
-- Name: themes_properties themes_properties_theme_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes_properties
    ADD CONSTRAINT themes_properties_theme_id_fkey FOREIGN KEY (theme_id) REFERENCES public.themes(id);


--
-- Name: topics topics_owner_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_owner_user_id_fkey FOREIGN KEY (owner_user_id) REFERENCES public.users(id);


--
-- Name: topics topics_topic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_topic_id_fkey FOREIGN KEY (topic_id) REFERENCES public.topics(id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               