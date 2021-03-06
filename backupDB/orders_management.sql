PGDMP                         z           orders_management    14.2    14.2     ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    16477    orders_management    DATABASE     r   CREATE DATABASE orders_management WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Bulgarian_Bulgaria.1251';
 !   DROP DATABASE orders_management;
                postgres    false            ?            1259    16611    customer    TABLE     /  CREATE TABLE public.customer (
    customer_id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    phone character(13) NOT NULL,
    age smallint DEFAULT 99,
    address character varying(255),
    city character varying(255),
    postal_code integer,
    country character varying(255),
    consent_status boolean NOT NULL,
    is_profile_active boolean NOT NULL,
    date_profile_created timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    date_profile_deactivated timestamp without time zone,
    reason_for_deactivation character varying(255),
    notes text,
    CONSTRAINT chk_phone CHECK ((phone !~~ '%[^0-9]%'::text)),
    CONSTRAINT customer_age_check CHECK ((age >= 18)),
    CONSTRAINT customer_postal_code_check CHECK ((postal_code > 0))
);
    DROP TABLE public.customer;
       public         heap    postgres    false            ?            1259    16610    customer_customer_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.customer_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.customer_customer_id_seq;
       public          postgres    false    210            ?           0    0    customer_customer_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.customer_customer_id_seq OWNED BY public.customer.customer_id;
          public          postgres    false    209            \           2604    16614    customer customer_id    DEFAULT     |   ALTER TABLE ONLY public.customer ALTER COLUMN customer_id SET DEFAULT nextval('public.customer_customer_id_seq'::regclass);
 C   ALTER TABLE public.customer ALTER COLUMN customer_id DROP DEFAULT;
       public          postgres    false    210    209    210            ?          0    16611    customer 
   TABLE DATA           ?   COPY public.customer (customer_id, name, email, phone, age, address, city, postal_code, country, consent_status, is_profile_active, date_profile_created, date_profile_deactivated, reason_for_deactivation, notes) FROM stdin;
    public          postgres    false    210   ?       ?           0    0    customer_customer_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.customer_customer_id_seq', 1, false);
          public          postgres    false    209            c           2606    16625    customer customer_email_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_email_key UNIQUE (email);
 E   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_email_key;
       public            postgres    false    210            e           2606    16627    customer customer_phone_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_phone_key UNIQUE (phone);
 E   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_phone_key;
       public            postgres    false    210            g           2606    16623    customer customer_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);
 @   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_pkey;
       public            postgres    false    210            h           1259    16630    index_email    INDEX     A   CREATE INDEX index_email ON public.customer USING btree (email);
    DROP INDEX public.index_email;
       public            postgres    false    210            i           1259    16629 
   index_name    INDEX     ?   CREATE INDEX index_name ON public.customer USING btree (name);
    DROP INDEX public.index_name;
       public            postgres    false    210            j           1259    16631    index_phone    INDEX     A   CREATE INDEX index_phone ON public.customer USING btree (phone);
    DROP INDEX public.index_phone;
       public            postgres    false    210            ?   Y  x?}R?n?0?v??<??? !?J??*R?U????8/?F?I??߱i֋I?9???Ò=??U?ڴ?颪c?|]??,[?E,+??(;ng??8?bˢ??s?ei??wqv?&?????>I?U??????"e[)jd??7???K?A*-أA$??QY??ۛ??2???>?i?ˬ?????[!?;I?7'??cë󻏒|d??|??q?g?!+?? ?{?<??U?v?????xy??m????2??ȍ?????\?7?b?W??n???E??O????:?!????`???=V???B3???vpP?????	?W???]8Ռ֙ktP0?;r?
??A$ሀ???3<?!uUc?'y?Op?????Q?????a??'??q)?
?#Y
?lk??Jb?z~???֢'ފ"?޹?Վ?LkJ;Њjh?5*7?d?????K??K?|?d$?kg????p?
?B???Z???Jqh???&???'蠇Q???7>??????E?c8?=?"??:9?GDg??ʽi?ᙹ???|C=??'#+??A{rzر??=?խ?pKAn%?^????4K?c㡴?+????M<Z??b?=?R?     