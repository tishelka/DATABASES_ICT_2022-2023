PGDMP      7                    {            Opt Base    14.7    14.7 B    W           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            X           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            Y           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            Z           1262    24586    Opt Base    DATABASE     g   CREATE DATABASE "Opt Base" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "Opt Base";
                postgres    false            �            1259    25175    client    TABLE     �   CREATE TABLE public.client (
    client_id bigint NOT NULL,
    full_name character varying(40) NOT NULL,
    organization_name character varying(50) NOT NULL,
    address character varying(50) NOT NULL
);
    DROP TABLE public.client;
       public         heap    postgres    false            �            1259    25174    client_client_id_seq    SEQUENCE     �   ALTER TABLE public.client ALTER COLUMN client_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.client_client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            �            1259    25104    manager    TABLE     �   CREATE TABLE public.manager (
    manager_id bigint NOT NULL,
    full_name character varying(40) NOT NULL,
    "position" character varying(25) NOT NULL,
    contact_information character varying(20) NOT NULL
);
    DROP TABLE public.manager;
       public         heap    postgres    false            �            1259    25103    manager_manager_id_seq    SEQUENCE     �   ALTER TABLE public.manager ALTER COLUMN manager_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.manager_manager_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    212            �            1259    25145    product    TABLE     �   CREATE TABLE public.product (
    product_id bigint NOT NULL,
    product_type character varying(30) NOT NULL,
    product_name character varying(50) NOT NULL,
    unit_of_measurement_id bigint
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    25144    product_product_id_seq    SEQUENCE     �   ALTER TABLE public.product ALTER COLUMN product_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.product_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220            �            1259    25098    provider    TABLE     �   CREATE TABLE public.provider (
    provider_id bigint NOT NULL,
    name_of_company character varying(50) NOT NULL,
    full_name character varying(40) NOT NULL,
    address character varying(40) NOT NULL
);
    DROP TABLE public.provider;
       public         heap    postgres    false            �            1259    25097    provider_provider_id_seq    SEQUENCE     �   ALTER TABLE public.provider ALTER COLUMN provider_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.provider_provider_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    210            �            1259    25181    purchase    TABLE     /  CREATE TABLE public.purchase (
    purchase_id bigint NOT NULL,
    client_id bigint,
    manager_id bigint,
    invoice_creation_date date,
    invoice_fulfillment_date date,
    status character varying(40),
    CONSTRAINT purchase_check CHECK ((invoice_creation_date <= invoice_fulfillment_date))
);
    DROP TABLE public.purchase;
       public         heap    postgres    false            �            1259    25208    purchase_content    TABLE     |  CREATE TABLE public.purchase_content (
    purchase_content_id bigint NOT NULL,
    purchase_id bigint,
    product_id bigint,
    amount_of_goods integer NOT NULL,
    expiration_date date NOT NULL,
    price integer NOT NULL,
    CONSTRAINT purchase_content_amount_of_goods_check CHECK ((amount_of_goods > 0)),
    CONSTRAINT purchase_content_price_check CHECK ((price > 0))
);
 $   DROP TABLE public.purchase_content;
       public         heap    postgres    false            �            1259    25197    purchase_invoice    TABLE       CREATE TABLE public.purchase_invoice (
    purchase_invoice_id bigint NOT NULL,
    purchase_id bigint,
    invoice_number integer NOT NULL,
    invoice_date date NOT NULL,
    payment_date date NOT NULL,
    CONSTRAINT purchase_invoice_check CHECK ((payment_date > invoice_date))
);
 $   DROP TABLE public.purchase_invoice;
       public         heap    postgres    false            �            1259    25180    purchase_purchase_id_seq    SEQUENCE     �   ALTER TABLE public.purchase ALTER COLUMN purchase_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.purchase_purchase_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    226            �            1259    25110    shipment    TABLE     1  CREATE TABLE public.shipment (
    shipment_id bigint NOT NULL,
    provider_id bigint,
    manager_id bigint,
    invoice_creation_date date,
    invoice_fulfillment_date date,
    status character varying(40),
    CONSTRAINT shipment_check CHECK ((invoice_creation_date <= invoice_fulfillment_date))
);
    DROP TABLE public.shipment;
       public         heap    postgres    false            �            1259    25156    shipment_content    TABLE     �  CREATE TABLE public.shipment_content (
    shipment_content_id bigint NOT NULL,
    shipment_id bigint,
    product_id bigint,
    remains integer NOT NULL,
    amount_of_goods integer NOT NULL,
    expiration_date date NOT NULL,
    price integer NOT NULL,
    CONSTRAINT shipment_content_amount_of_goods_check CHECK ((amount_of_goods > 0)),
    CONSTRAINT shipment_content_price_check CHECK ((price >= 0)),
    CONSTRAINT shipment_content_remains_check CHECK ((remains > 0))
);
 $   DROP TABLE public.shipment_content;
       public         heap    postgres    false            �            1259    25155 (   shipment_content_shipment_content_id_seq    SEQUENCE     �   ALTER TABLE public.shipment_content ALTER COLUMN shipment_content_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.shipment_content_shipment_content_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            �            1259    25127    shipment_invoice    TABLE       CREATE TABLE public.shipment_invoice (
    shipment_invoice_id bigint NOT NULL,
    shipment_id bigint,
    invoice_number integer NOT NULL,
    invoice_date date NOT NULL,
    payment_date date NOT NULL,
    CONSTRAINT shipment_invoice_check CHECK ((payment_date > invoice_date))
);
 $   DROP TABLE public.shipment_invoice;
       public         heap    postgres    false            �            1259    25126 (   shipment_invoice_shipment_invoice_id_seq    SEQUENCE     �   ALTER TABLE public.shipment_invoice ALTER COLUMN shipment_invoice_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.shipment_invoice_shipment_invoice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            �            1259    25109    shipment_shipment_id_seq    SEQUENCE     �   ALTER TABLE public.shipment ALTER COLUMN shipment_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.shipment_shipment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    214            �            1259    25139    unit_of_measurement    TABLE     �   CREATE TABLE public.unit_of_measurement (
    unit_of_measurement_id bigint NOT NULL,
    name character varying(20) NOT NULL
);
 '   DROP TABLE public.unit_of_measurement;
       public         heap    postgres    false            �            1259    25138 .   unit_of_measurement_unit_of_measurement_id_seq    SEQUENCE     	  ALTER TABLE public.unit_of_measurement ALTER COLUMN unit_of_measurement_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.unit_of_measurement_unit_of_measurement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218            P          0    25175    client 
   TABLE DATA           R   COPY public.client (client_id, full_name, organization_name, address) FROM stdin;
    public          postgres    false    224   mX       D          0    25104    manager 
   TABLE DATA           Y   COPY public.manager (manager_id, full_name, "position", contact_information) FROM stdin;
    public          postgres    false    212   �X       L          0    25145    product 
   TABLE DATA           a   COPY public.product (product_id, product_type, product_name, unit_of_measurement_id) FROM stdin;
    public          postgres    false    220   �X       B          0    25098    provider 
   TABLE DATA           T   COPY public.provider (provider_id, name_of_company, full_name, address) FROM stdin;
    public          postgres    false    210   �X       R          0    25181    purchase 
   TABLE DATA              COPY public.purchase (purchase_id, client_id, manager_id, invoice_creation_date, invoice_fulfillment_date, status) FROM stdin;
    public          postgres    false    226   �X       T          0    25208    purchase_content 
   TABLE DATA           �   COPY public.purchase_content (purchase_content_id, purchase_id, product_id, amount_of_goods, expiration_date, price) FROM stdin;
    public          postgres    false    228   �X       S          0    25197    purchase_invoice 
   TABLE DATA           x   COPY public.purchase_invoice (purchase_invoice_id, purchase_id, invoice_number, invoice_date, payment_date) FROM stdin;
    public          postgres    false    227   Y       F          0    25110    shipment 
   TABLE DATA           �   COPY public.shipment (shipment_id, provider_id, manager_id, invoice_creation_date, invoice_fulfillment_date, status) FROM stdin;
    public          postgres    false    214   8Y       N          0    25156    shipment_content 
   TABLE DATA           �   COPY public.shipment_content (shipment_content_id, shipment_id, product_id, remains, amount_of_goods, expiration_date, price) FROM stdin;
    public          postgres    false    222   UY       H          0    25127    shipment_invoice 
   TABLE DATA           x   COPY public.shipment_invoice (shipment_invoice_id, shipment_id, invoice_number, invoice_date, payment_date) FROM stdin;
    public          postgres    false    216   rY       J          0    25139    unit_of_measurement 
   TABLE DATA           K   COPY public.unit_of_measurement (unit_of_measurement_id, name) FROM stdin;
    public          postgres    false    218   �Y       [           0    0    client_client_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.client_client_id_seq', 1, false);
          public          postgres    false    223            \           0    0    manager_manager_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.manager_manager_id_seq', 1, false);
          public          postgres    false    211            ]           0    0    product_product_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.product_product_id_seq', 1, false);
          public          postgres    false    219            ^           0    0    provider_provider_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.provider_provider_id_seq', 1, false);
          public          postgres    false    209            _           0    0    purchase_purchase_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.purchase_purchase_id_seq', 1, false);
          public          postgres    false    225            `           0    0 (   shipment_content_shipment_content_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.shipment_content_shipment_content_id_seq', 1, false);
          public          postgres    false    221            a           0    0 (   shipment_invoice_shipment_invoice_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.shipment_invoice_shipment_invoice_id_seq', 1, false);
          public          postgres    false    215            b           0    0    shipment_shipment_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.shipment_shipment_id_seq', 1, false);
          public          postgres    false    213            c           0    0 .   unit_of_measurement_unit_of_measurement_id_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.unit_of_measurement_unit_of_measurement_id_seq', 1, false);
          public          postgres    false    217            �           2606    25179    client client_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (client_id);
 <   ALTER TABLE ONLY public.client DROP CONSTRAINT client_pkey;
       public            postgres    false    224            �           2606    25108    manager manager_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.manager
    ADD CONSTRAINT manager_pkey PRIMARY KEY (manager_id);
 >   ALTER TABLE ONLY public.manager DROP CONSTRAINT manager_pkey;
       public            postgres    false    212            �           2606    25149    product product_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    220            �           2606    25102    provider provider_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.provider
    ADD CONSTRAINT provider_pkey PRIMARY KEY (provider_id);
 @   ALTER TABLE ONLY public.provider DROP CONSTRAINT provider_pkey;
       public            postgres    false    210            �           2606    25214 &   purchase_content purchase_content_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.purchase_content
    ADD CONSTRAINT purchase_content_pkey PRIMARY KEY (purchase_content_id);
 P   ALTER TABLE ONLY public.purchase_content DROP CONSTRAINT purchase_content_pkey;
       public            postgres    false    228            �           2606    25202 &   purchase_invoice purchase_invoice_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.purchase_invoice
    ADD CONSTRAINT purchase_invoice_pkey PRIMARY KEY (purchase_invoice_id);
 P   ALTER TABLE ONLY public.purchase_invoice DROP CONSTRAINT purchase_invoice_pkey;
       public            postgres    false    227            �           2606    25186    purchase purchase_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT purchase_pkey PRIMARY KEY (purchase_id);
 @   ALTER TABLE ONLY public.purchase DROP CONSTRAINT purchase_pkey;
       public            postgres    false    226            �           2606    25163 &   shipment_content shipment_content_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.shipment_content
    ADD CONSTRAINT shipment_content_pkey PRIMARY KEY (shipment_content_id);
 P   ALTER TABLE ONLY public.shipment_content DROP CONSTRAINT shipment_content_pkey;
       public            postgres    false    222            �           2606    25132 &   shipment_invoice shipment_invoice_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.shipment_invoice
    ADD CONSTRAINT shipment_invoice_pkey PRIMARY KEY (shipment_invoice_id);
 P   ALTER TABLE ONLY public.shipment_invoice DROP CONSTRAINT shipment_invoice_pkey;
       public            postgres    false    216            �           2606    25115    shipment shipment_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.shipment
    ADD CONSTRAINT shipment_pkey PRIMARY KEY (shipment_id);
 @   ALTER TABLE ONLY public.shipment DROP CONSTRAINT shipment_pkey;
       public            postgres    false    214            �           2606    25143 ,   unit_of_measurement unit_of_measurement_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.unit_of_measurement
    ADD CONSTRAINT unit_of_measurement_pkey PRIMARY KEY (unit_of_measurement_id);
 V   ALTER TABLE ONLY public.unit_of_measurement DROP CONSTRAINT unit_of_measurement_pkey;
       public            postgres    false    218            �           2606    25150 +   product product_unit_of_measurement_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_unit_of_measurement_id_fkey FOREIGN KEY (unit_of_measurement_id) REFERENCES public.unit_of_measurement(unit_of_measurement_id);
 U   ALTER TABLE ONLY public.product DROP CONSTRAINT product_unit_of_measurement_id_fkey;
       public          postgres    false    220    218    3230            �           2606    25187     purchase purchase_client_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT purchase_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(client_id);
 J   ALTER TABLE ONLY public.purchase DROP CONSTRAINT purchase_client_id_fkey;
       public          postgres    false    224    226    3236            �           2606    25220 1   purchase_content purchase_content_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchase_content
    ADD CONSTRAINT purchase_content_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id);
 [   ALTER TABLE ONLY public.purchase_content DROP CONSTRAINT purchase_content_product_id_fkey;
       public          postgres    false    3232    220    228            �           2606    25215 2   purchase_content purchase_content_purchase_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchase_content
    ADD CONSTRAINT purchase_content_purchase_id_fkey FOREIGN KEY (purchase_id) REFERENCES public.purchase(purchase_id);
 \   ALTER TABLE ONLY public.purchase_content DROP CONSTRAINT purchase_content_purchase_id_fkey;
       public          postgres    false    228    226    3238            �           2606    25203 2   purchase_invoice purchase_invoice_purchase_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchase_invoice
    ADD CONSTRAINT purchase_invoice_purchase_id_fkey FOREIGN KEY (purchase_id) REFERENCES public.purchase(purchase_id);
 \   ALTER TABLE ONLY public.purchase_invoice DROP CONSTRAINT purchase_invoice_purchase_id_fkey;
       public          postgres    false    227    226    3238            �           2606    25192 !   purchase purchase_manager_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT purchase_manager_id_fkey FOREIGN KEY (manager_id) REFERENCES public.manager(manager_id);
 K   ALTER TABLE ONLY public.purchase DROP CONSTRAINT purchase_manager_id_fkey;
       public          postgres    false    226    3224    212            �           2606    25169 1   shipment_content shipment_content_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shipment_content
    ADD CONSTRAINT shipment_content_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id);
 [   ALTER TABLE ONLY public.shipment_content DROP CONSTRAINT shipment_content_product_id_fkey;
       public          postgres    false    3232    220    222            �           2606    25164 2   shipment_content shipment_content_shipment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shipment_content
    ADD CONSTRAINT shipment_content_shipment_id_fkey FOREIGN KEY (shipment_id) REFERENCES public.shipment(shipment_id);
 \   ALTER TABLE ONLY public.shipment_content DROP CONSTRAINT shipment_content_shipment_id_fkey;
       public          postgres    false    3226    214    222            �           2606    25133 2   shipment_invoice shipment_invoice_shipment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shipment_invoice
    ADD CONSTRAINT shipment_invoice_shipment_id_fkey FOREIGN KEY (shipment_id) REFERENCES public.shipment(shipment_id);
 \   ALTER TABLE ONLY public.shipment_invoice DROP CONSTRAINT shipment_invoice_shipment_id_fkey;
       public          postgres    false    216    3226    214            �           2606    25121 !   shipment shipment_manager_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shipment
    ADD CONSTRAINT shipment_manager_id_fkey FOREIGN KEY (manager_id) REFERENCES public.manager(manager_id);
 K   ALTER TABLE ONLY public.shipment DROP CONSTRAINT shipment_manager_id_fkey;
       public          postgres    false    212    214    3224            �           2606    25116 "   shipment shipment_provider_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shipment
    ADD CONSTRAINT shipment_provider_id_fkey FOREIGN KEY (provider_id) REFERENCES public.provider(provider_id);
 L   ALTER TABLE ONLY public.shipment DROP CONSTRAINT shipment_provider_id_fkey;
       public          postgres    false    214    3222    210            P      x����� � �      D      x����� � �      L      x����� � �      B      x����� � �      R      x����� � �      T      x����� � �      S      x����� � �      F      x����� � �      N      x����� � �      H      x����� � �      J      x����� � �     