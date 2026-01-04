--
-- PostgreSQL database cluster dump
--

\restrict tTzopibTC5eB7ZQegKZoLERTSb7upTCed8W03qzDJaNPsh1cGeumum9r0qPMKsH

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:9MORH5QgsPzNyUZ8BODQLw==$/w2VxYuJvK9kF2B+Shf9pAns53y8Zs83344E1J90/aY=:IGFcGtN77Wh/eakYvgAPgEYV9snqvWmWEc9kbbqNwiI=';

--
-- User Configurations
--








\unrestrict tTzopibTC5eB7ZQegKZoLERTSb7upTCed8W03qzDJaNPsh1cGeumum9r0qPMKsH

--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

\restrict cxQPcgne6nCBilQ4XzfYIGja3NaqQsbygpXfvuJ4cyqynsROYmVJH11EGpuAeVx

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

\unrestrict cxQPcgne6nCBilQ4XzfYIGja3NaqQsbygpXfvuJ4cyqynsROYmVJH11EGpuAeVx

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

\restrict nh7v0qvf7ozLby6gLqkbEnQqzdwhWOU2tRQMzdbRWzHpejY2q6TJqvcjmS1EcjW

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

\unrestrict nh7v0qvf7ozLby6gLqkbEnQqzdwhWOU2tRQMzdbRWzHpejY2q6TJqvcjmS1EcjW

--
-- Database "shop" dump
--

--
-- PostgreSQL database dump
--

\restrict bN4IrMCFvagTc07sAjL8E3VAZynpBN1lo3mlrauq1o6OKJgcvrcYqFUkHmJjbXU

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: shop; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE shop WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Chinese (Simplified)_China.936';


ALTER DATABASE shop OWNER TO postgres;

\unrestrict bN4IrMCFvagTc07sAjL8E3VAZynpBN1lo3mlrauq1o6OKJgcvrcYqFUkHmJjbXU
\connect shop
\restrict bN4IrMCFvagTc07sAjL8E3VAZynpBN1lo3mlrauq1o6OKJgcvrcYqFUkHmJjbXU

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    product_id character(4) NOT NULL,
    product_name character varying(100) NOT NULL,
    product_type character varying(32) NOT NULL,
    sale_price integer,
    purchase_price integer,
    regist_date date
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: avgpricebytype; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.avgpricebytype AS
 SELECT product_id,
    product_name,
    product_type,
    sale_price,
    ( SELECT avg(p2.sale_price) AS avg
           FROM public.product p2
          WHERE ((p1.product_type)::text = (p2.product_type)::text)
          GROUP BY p2.product_type) AS avg_sale_price
   FROM public.product p1;


ALTER VIEW public.avgpricebytype OWNER TO postgres;

--
-- Name: chars; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chars (
    chr character(3) NOT NULL
);


ALTER TABLE public.chars OWNER TO postgres;

--
-- Name: inventoryproduct; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventoryproduct (
    inventory_id character(4) NOT NULL,
    product_id character(4) NOT NULL,
    inventory_quantity integer NOT NULL
);


ALTER TABLE public.inventoryproduct OWNER TO postgres;

--
-- Name: product2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product2 (
    product_id character(4) NOT NULL,
    product_name character varying(100) NOT NULL,
    product_type character varying(32) NOT NULL,
    sale_price integer,
    purchase_price integer,
    regist_date date
);


ALTER TABLE public.product2 OWNER TO postgres;

--
-- Name: productcopy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productcopy (
    product_id character(4) NOT NULL,
    product_name character varying(100) NOT NULL,
    product_type character varying(32) NOT NULL,
    sale_price integer,
    purchase_price integer,
    regist_date date
);


ALTER TABLE public.productcopy OWNER TO postgres;

--
-- Name: productins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productins (
    product_id character(4) NOT NULL,
    product_name character varying(100) NOT NULL,
    product_type character varying(32) NOT NULL,
    sale_price integer DEFAULT 0,
    purchase_price integer,
    regist_date date
);


ALTER TABLE public.productins OWNER TO postgres;

--
-- Name: productjim; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.productjim AS
 SELECT product_id,
    product_name,
    product_type,
    sale_price,
    purchase_price,
    regist_date
   FROM public.product
  WHERE ((product_type)::text = '办公用品'::text);


ALTER VIEW public.productjim OWNER TO postgres;

--
-- Name: productmargin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productmargin (
    product_id character(32) NOT NULL,
    product_name character varying(32) NOT NULL,
    sale_price integer,
    purchase_price integer,
    margin integer
);


ALTER TABLE public.productmargin OWNER TO postgres;

--
-- Name: productsum; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.productsum AS
 SELECT product_type,
    count(*) AS cnt_product
   FROM public.product
  GROUP BY product_type;


ALTER VIEW public.productsum OWNER TO postgres;

--
-- Name: producttype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producttype (
    product_type character varying(32) NOT NULL,
    sum_sale_price integer,
    sum_purchase_price integer
);


ALTER TABLE public.producttype OWNER TO postgres;

--
-- Name: samplelike; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.samplelike (
    strcol character varying(6) NOT NULL
);


ALTER TABLE public.samplelike OWNER TO postgres;

--
-- Name: samplemath; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.samplemath (
    m numeric(10,3),
    n integer,
    p integer
);


ALTER TABLE public.samplemath OWNER TO postgres;

--
-- Name: samplestr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.samplestr (
    str1 character varying(40),
    str2 character varying(40),
    str3 character varying(40)
);


ALTER TABLE public.samplestr OWNER TO postgres;

--
-- Name: shopproduct; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shopproduct (
    shop_id character(4) NOT NULL,
    shop_name character varying(200) NOT NULL,
    product_id character(4) NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public.shopproduct OWNER TO postgres;

--
-- Name: viewpractce5_1; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.viewpractce5_1 AS
 SELECT product_name,
    sale_price,
    regist_date
   FROM public.product
  WHERE ((sale_price >= 1000) AND (regist_date = '2009-09-20'::date));


ALTER VIEW public.viewpractce5_1 OWNER TO postgres;

--
-- Data for Name: chars; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chars (chr) FROM stdin;
1  
2  
3  
10 
11 
222
\.


--
-- Data for Name: inventoryproduct; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventoryproduct (inventory_id, product_id, inventory_quantity) FROM stdin;
P001	0001	0
P001	0002	120
P001	0003	200
P001	0004	3
P001	0005	0
P001	0006	99
P001	0007	999
P001	0008	200
P002	0001	10
P002	0002	25
P002	0003	34
P002	0004	19
P002	0005	99
P002	0006	0
P002	0007	0
P002	0008	18
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (product_id, product_name, product_type, sale_price, purchase_price, regist_date) FROM stdin;
0001	T恤	衣服	1000	500	2009-09-20
0002	打孔器	办公用品	500	320	2009-09-11
0003	运动T恤	衣服	4000	2800	\N
0004	菜刀	厨房用具	3000	2800	2009-09-20
0005	高压锅	厨房用具	6800	5000	2009-01-15
0006	叉子	厨房用具	500	\N	2009-09-20
0007	擦菜板	厨房用具	880	790	2008-04-28
0008	圆珠笔	办公用品	100	\N	2009-11-11
\.


--
-- Data for Name: product2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product2 (product_id, product_name, product_type, sale_price, purchase_price, regist_date) FROM stdin;
0001	T恤	衣服	1000	500	2009-09-20
0002	打孔器	办公用品	500	320	2009-09-11
0003	运动T恤	衣服	4000	2800	\N
0009	手套	衣服	800	500	\N
0010	水壶	厨房用具	2000	1700	2009-09-20
\.


--
-- Data for Name: productcopy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productcopy (product_id, product_name, product_type, sale_price, purchase_price, regist_date) FROM stdin;
0001	T恤	衣服	1000	500	2009-09-20
0002	打孔器	办公用品	500	320	2009-09-11
0003	运动T恤	衣服	4000	2800	\N
0004	菜刀	厨房用具	3000	2800	2009-09-20
0005	高压锅	厨房用具	6800	5000	2009-01-15
0006	叉子	厨房用具	500	\N	2009-09-20
0007	擦菜板	厨房用具	880	790	2008-04-28
0008	圆珠笔	办公用品	100	\N	2009-11-11
\.


--
-- Data for Name: productins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productins (product_id, product_name, product_type, sale_price, purchase_price, regist_date) FROM stdin;
0001	T恤衫	衣服	1000	500	2009-09-20
0002	打孔器	办公用品	500	320	2009-09-11
0003	运动T恤	衣服	4000	2800	\N
0004	菜刀	厨房用品	3000	2800	2009-09-20
0005	高压锅	厨房用品	6800	5000	2009-01-15
0006	叉子	厨房用品	500	\N	2009-09-20
0007	擦菜板	厨房用品	0	790	2009-04-28
\.


--
-- Data for Name: productmargin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productmargin (product_id, product_name, sale_price, purchase_price, margin) FROM stdin;
0001                            	T恤	1000	500	500
0002                            	打孔器	500	320	180
0008                            	圆珠笔	100	\N	\N
0004                            	菜刀	300000	1400	298600
0006                            	叉子	50000	\N	\N
0007                            	擦菜板	88000	395	87605
\.


--
-- Data for Name: producttype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.producttype (product_type, sum_sale_price, sum_purchase_price) FROM stdin;
衣服	5000	3300
办公用品	600	320
厨房用具	11180	8590
\.


--
-- Data for Name: samplelike; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.samplelike (strcol) FROM stdin;
abcddd
dddabc
abdddc
abcdd
ddabc
abddc
\.


--
-- Data for Name: samplemath; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.samplemath (m, n, p) FROM stdin;
500.000	0	\N
-180.000	0	\N
\N	\N	\N
\N	7	3
\N	5	2
\N	4	\N
8.000	\N	3
2.270	1	\N
5.555	2	\N
\N	1	\N
8.760	\N	\N
\.


--
-- Data for Name: samplestr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.samplestr (str1, str2, str3) FROM stdin;
opx	rt	\N
abc	def	\N
山田	太郎	是我
aaa	\N	\N
\N	xyz	\N
@!#$%	\N	\N
ABC	\N	\N
aBC	\N	\N
abc太郎	abc	ABC
abcdefabc	abc	ABC
micmic	i	I
\.


--
-- Data for Name: shopproduct; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopproduct (shop_id, shop_name, product_id, quantity) FROM stdin;
000A	东京	0001	30
000A	东京	0002	50
000A	东京	0003	15
000B	名古屋	0002	30
000B	名古屋	0003	120
000B	名古屋	0004	20
000B	名古屋	0006	10
000B	名古屋	0007	40
000C	大阪	0003	20
000C	大阪	0004	50
000C	大阪	0006	90
000C	大阪	0007	70
000D	福冈	0001	100
\.


--
-- Name: chars chars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chars
    ADD CONSTRAINT chars_pkey PRIMARY KEY (chr);


--
-- Name: inventoryproduct inventoryproduct_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventoryproduct
    ADD CONSTRAINT inventoryproduct_pkey PRIMARY KEY (inventory_id, product_id);


--
-- Name: product2 product2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product2
    ADD CONSTRAINT product2_pkey PRIMARY KEY (product_id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);


--
-- Name: productcopy productcopy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productcopy
    ADD CONSTRAINT productcopy_pkey PRIMARY KEY (product_id);


--
-- Name: productins productins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productins
    ADD CONSTRAINT productins_pkey PRIMARY KEY (product_id);


--
-- Name: productmargin productmargin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productmargin
    ADD CONSTRAINT productmargin_pkey PRIMARY KEY (product_id);


--
-- Name: producttype producttype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producttype
    ADD CONSTRAINT producttype_pkey PRIMARY KEY (product_type);


--
-- Name: samplelike samplelike_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.samplelike
    ADD CONSTRAINT samplelike_pkey PRIMARY KEY (strcol);


--
-- Name: shopproduct shopproduct_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopproduct
    ADD CONSTRAINT shopproduct_pkey PRIMARY KEY (shop_id, product_id);


--
-- PostgreSQL database dump complete
--

\unrestrict bN4IrMCFvagTc07sAjL8E3VAZynpBN1lo3mlrauq1o6OKJgcvrcYqFUkHmJjbXU

--
-- PostgreSQL database cluster dump complete
--

