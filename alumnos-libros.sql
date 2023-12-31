PGDMP                  	    {            alumnos-libros    16.0    16.0 #               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            	           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            
           1262    16485    alumnos-libros    DATABASE     �   CREATE DATABASE "alumnos-libros" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Argentina.1252';
     DROP DATABASE "alumnos-libros";
                postgres    false            �            1259    16487    alumnos    TABLE     �   CREATE TABLE public.alumnos (
    codigo integer NOT NULL,
    nombre character varying,
    apellido character varying,
    correo character varying,
    legajo character varying
);
    DROP TABLE public.alumnos;
       public         heap    postgres    false            �            1259    16486    alumnos_legajo_seq    SEQUENCE     �   CREATE SEQUENCE public.alumnos_legajo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.alumnos_legajo_seq;
       public          postgres    false    216                       0    0    alumnos_legajo_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.alumnos_legajo_seq OWNED BY public.alumnos.codigo;
          public          postgres    false    215            �            1259    16505 	   editorial    TABLE     ]   CREATE TABLE public.editorial (
    codigo integer NOT NULL,
    nombre character varying
);
    DROP TABLE public.editorial;
       public         heap    postgres    false            �            1259    16504    editorial_codigo_seq    SEQUENCE     �   CREATE SEQUENCE public.editorial_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.editorial_codigo_seq;
       public          postgres    false    220                       0    0    editorial_codigo_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.editorial_codigo_seq OWNED BY public.editorial.codigo;
          public          postgres    false    219            �            1259    16531    lectura    TABLE     l   CREATE TABLE public.lectura (
    codigo integer NOT NULL,
    cod_alumno integer,
    cod_libro integer
);
    DROP TABLE public.lectura;
       public         heap    postgres    false            �            1259    16530    lectura_codigo_seq    SEQUENCE     �   CREATE SEQUENCE public.lectura_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.lectura_codigo_seq;
       public          postgres    false    222                       0    0    lectura_codigo_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.lectura_codigo_seq OWNED BY public.lectura.codigo;
          public          postgres    false    221            �            1259    16496    libros    TABLE     �   CREATE TABLE public.libros (
    codigolibro integer NOT NULL,
    isbn character varying,
    titulo character varying,
    cod_editorial integer
);
    DROP TABLE public.libros;
       public         heap    postgres    false            �            1259    16495    libros_codigolibro_seq    SEQUENCE     �   CREATE SEQUENCE public.libros_codigolibro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.libros_codigolibro_seq;
       public          postgres    false    218                       0    0    libros_codigolibro_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.libros_codigolibro_seq OWNED BY public.libros.codigolibro;
          public          postgres    false    217            _           2604    16490    alumnos codigo    DEFAULT     p   ALTER TABLE ONLY public.alumnos ALTER COLUMN codigo SET DEFAULT nextval('public.alumnos_legajo_seq'::regclass);
 =   ALTER TABLE public.alumnos ALTER COLUMN codigo DROP DEFAULT;
       public          postgres    false    216    215    216            a           2604    16508    editorial codigo    DEFAULT     t   ALTER TABLE ONLY public.editorial ALTER COLUMN codigo SET DEFAULT nextval('public.editorial_codigo_seq'::regclass);
 ?   ALTER TABLE public.editorial ALTER COLUMN codigo DROP DEFAULT;
       public          postgres    false    220    219    220            b           2604    16534    lectura codigo    DEFAULT     p   ALTER TABLE ONLY public.lectura ALTER COLUMN codigo SET DEFAULT nextval('public.lectura_codigo_seq'::regclass);
 =   ALTER TABLE public.lectura ALTER COLUMN codigo DROP DEFAULT;
       public          postgres    false    222    221    222            `           2604    16499    libros codigolibro    DEFAULT     x   ALTER TABLE ONLY public.libros ALTER COLUMN codigolibro SET DEFAULT nextval('public.libros_codigolibro_seq'::regclass);
 A   ALTER TABLE public.libros ALTER COLUMN codigolibro DROP DEFAULT;
       public          postgres    false    217    218    218            �          0    16487    alumnos 
   TABLE DATA           K   COPY public.alumnos (codigo, nombre, apellido, correo, legajo) FROM stdin;
    public          postgres    false    216   �%                 0    16505 	   editorial 
   TABLE DATA           3   COPY public.editorial (codigo, nombre) FROM stdin;
    public          postgres    false    220   �&                 0    16531    lectura 
   TABLE DATA           @   COPY public.lectura (codigo, cod_alumno, cod_libro) FROM stdin;
    public          postgres    false    222   <'                  0    16496    libros 
   TABLE DATA           J   COPY public.libros (codigolibro, isbn, titulo, cod_editorial) FROM stdin;
    public          postgres    false    218   t'                  0    0    alumnos_legajo_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.alumnos_legajo_seq', 1, false);
          public          postgres    false    215                       0    0    editorial_codigo_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.editorial_codigo_seq', 1, false);
          public          postgres    false    219                       0    0    lectura_codigo_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.lectura_codigo_seq', 1, false);
          public          postgres    false    221                       0    0    libros_codigolibro_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.libros_codigolibro_seq', 1, false);
          public          postgres    false    217            j           2606    16536    lectura pk_cod_lectura 
   CONSTRAINT     X   ALTER TABLE ONLY public.lectura
    ADD CONSTRAINT pk_cod_lectura PRIMARY KEY (codigo);
 @   ALTER TABLE ONLY public.lectura DROP CONSTRAINT pk_cod_lectura;
       public            postgres    false    222            h           2606    16512    editorial pk_editorial 
   CONSTRAINT     X   ALTER TABLE ONLY public.editorial
    ADD CONSTRAINT pk_editorial PRIMARY KEY (codigo);
 @   ALTER TABLE ONLY public.editorial DROP CONSTRAINT pk_editorial;
       public            postgres    false    220            d           2606    16494    alumnos pk_id_alumno 
   CONSTRAINT     V   ALTER TABLE ONLY public.alumnos
    ADD CONSTRAINT pk_id_alumno PRIMARY KEY (codigo);
 >   ALTER TABLE ONLY public.alumnos DROP CONSTRAINT pk_id_alumno;
       public            postgres    false    216            f           2606    16503    libros pk_libros 
   CONSTRAINT     W   ALTER TABLE ONLY public.libros
    ADD CONSTRAINT pk_libros PRIMARY KEY (codigolibro);
 :   ALTER TABLE ONLY public.libros DROP CONSTRAINT pk_libros;
       public            postgres    false    218            l           2606    16537    lectura fk_cod_alumno    FK CONSTRAINT     }   ALTER TABLE ONLY public.lectura
    ADD CONSTRAINT fk_cod_alumno FOREIGN KEY (cod_alumno) REFERENCES public.alumnos(codigo);
 ?   ALTER TABLE ONLY public.lectura DROP CONSTRAINT fk_cod_alumno;
       public          postgres    false    216    222    4708            k           2606    16547    libros fk_cod_editorial    FK CONSTRAINT     �   ALTER TABLE ONLY public.libros
    ADD CONSTRAINT fk_cod_editorial FOREIGN KEY (cod_editorial) REFERENCES public.editorial(codigo) NOT VALID;
 A   ALTER TABLE ONLY public.libros DROP CONSTRAINT fk_cod_editorial;
       public          postgres    false    4712    220    218            m           2606    16542    lectura fk_cod_libor    FK CONSTRAINT        ALTER TABLE ONLY public.lectura
    ADD CONSTRAINT fk_cod_libor FOREIGN KEY (cod_libro) REFERENCES public.libros(codigolibro);
 >   ALTER TABLE ONLY public.lectura DROP CONSTRAINT fk_cod_libor;
       public          postgres    false    4710    222    218            �   �   x�e�=N�@��S���q��(�Q�l���2�k;ߊ3p1lkC����4�Fz9����4\�X�;��H�
�ڷ.�C�,˾U���:ˌ�x���=/g4G��kN������]�o��F�T�J��,�:��E���!p,ѓɫ�4XAk��� ��$���M�xU��z�ωn���VVM��j��Z�^�ͻqZ��\��hR��#��g+
O:-cD���e��_����;         l   x�35�tM�,�/�L�Q�)�KTp�*��22	'g��+����$�sq�d&����JS�����鹉\�Hf�d�%*��*��4^������ �@(=         (   x�340�4�41�242�4�41�243�4�45������ N�          O  x�5�=N1�k�),�Aɮ�'e�"$�b)i��(r�]{M�5�-�^��	t.ާ��Y�M�����M�V��!ڤq���.�e�I��Z��)�(A�6+X���OA�=��4G��ReU�J�
 ٘�s�1^�����c��iv�����aJ*�G{��Y�}��9��[-�$̥�PZ�\젟1n�Dy��p�Q45 ��Z��ǈ���}8c�i�J���8����;��#�w'��Q��</Eqn�z������D���g\�������.lX���Ơ��=�ѥ�r�z%iކOLr�;w�.�x��_I?��ar��ۢ(~�}     