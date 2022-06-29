--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3 (Debian 14.3-1.pgdg110+1)
-- Dumped by pg_dump version 14.3

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
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id uuid NOT NULL,
    name character varying(255),
    price integer,
    size character varying(255),
    description text,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    product_url character varying(255)
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, price, size, description, inserted_at, updated_at, product_url) FROM stdin;
b366c9b5-33c6-4798-a4cc-c2dfac618066	Vegetable Soup	444	small	Two butter croissants of your choice (plain, almond or cheese). With a side of herb butter or house-made hazelnut spread.	2022-06-22 05:59:17	2022-06-22 05:59:17	product_4.jpg?63823096757
cf68e217-92be-4f5d-a922-b253503ef3b2	Katsu Curry	724	small	Thick slices of French toast bread, brown sugar, half-and-half and vanilla, topped with powdered sugar. With two eggs served any style, and your choice of smoked bacon or smoked ham.	2022-06-22 05:59:17	2022-06-22 05:59:17	product_4.jpg?63823096757
4ae1b27f-e6c5-41db-81e8-f959c4201a1f	Fish and chips	946	small	28-day aged 300g USDA Certified Prime Ribeye, rosemary-thyme garlic butter, with choice of two sides.	2022-06-22 05:59:17	2022-06-22 05:59:17	product_4.jpg?63823096757
cde41483-7b84-4ec0-8bfa-20c7428f5835	Chicken wings	502	small	Three eggs with cilantro, tomatoes, onions, avocados and melted Emmental cheese. With a side of roasted potatoes, and your choice of toast or croissant.	2022-06-22 05:59:18	2022-06-22 05:59:18	product_3.jpg?63823096758
14b24755-f3da-46c4-9624-ad642287eb67	Fettuccine Alfredo	312	small	Creamy mascarpone cheese and custard layered between espresso and rum soaked house-made ladyfingers, topped with Valrhona cocoa powder.	2022-06-22 05:59:18	2022-06-22 05:59:18	product_4.jpg?63823096758
b49e878d-54b2-4dc4-abb2-8a3e8c2021c9	Ricotta stuffed Ravioli	598	small	Three egg omelet with Roquefort cheese, chives, and ham. With a side of roasted potatoes, and your choice of toast or croissant.	2022-06-22 05:59:18	2022-06-22 05:59:18	product_2.jpg?63823096758
f82a6689-5f0b-4eb4-9cbc-4b1cf402605a	Linguine with clams	916	small	Granny Smith apples mixed with brown sugar and butter filling, in a flaky all-butter crust, with ice cream.	2022-06-22 05:59:18	2022-06-22 05:59:18	product_1.jpg?63823096758
86d796e4-1e95-4401-8805-0d2f4b2cb1e3	Pasta with Tomato and Basil	667	small	Three egg omelet with Roquefort cheese, chives, and ham. With a side of roasted potatoes, and your choice of toast or croissant.	2022-06-22 05:59:18	2022-06-22 05:59:18	product_4.jpg?63823096758
5553040e-bd0b-4a8e-805d-2ca34a5b4a87	Pasta and Beans	478	small	Smoked salmon, poached eggs, diced red onions and Hollandaise sauce on an English muffin. With a side of roasted potatoes.	2022-06-22 05:59:18	2022-06-22 05:59:18	product_1.jpg?63823096758
fbcf6597-2819-4f6a-943a-70e365fe8f0a	Pizza	597	small	Two butter croissants of your choice (plain, almond or cheese). With a side of herb butter or house-made hazelnut spread.	2022-06-22 05:59:18	2022-06-22 05:59:18	product_4.jpg?63823096758
f0344ab5-a065-4734-90ee-14fdd60922c1	Meatballs with sauce	143	small	Granny Smith apples mixed with brown sugar and butter filling, in a flaky all-butter crust, with ice cream.	2022-06-22 05:59:18	2022-06-22 05:59:18	product_1.jpg?63823096758
53d235ee-3613-44bc-91a8-685ab370a438	Tuna sashimi	698	small	Three egg omelet with Roquefort cheese, chives, and ham. With a side of roasted potatoes, and your choice of toast or croissant.	2022-06-22 05:59:18	2022-06-22 05:59:18	product_1.jpg?63823096758
c6b1e97f-9c77-4b61-81d2-e272f7bbba03	Souvlaki	422	small	Two buttermilk waffles, topped with whipped cream and maple syrup, a side of two eggs served any style, and your choice of smoked bacon or smoked ham.	2022-06-22 05:59:18	2022-06-22 05:59:18	product_4.jpg?63823096758
bfa81cb9-6a8c-4209-adec-379818bb7b39	Chicken milanese	563	small	Three eggs with cilantro, tomatoes, onions, avocados and melted Emmental cheese. With a side of roasted potatoes, and your choice of toast or croissant.	2022-06-22 05:59:18	2022-06-22 05:59:18	product_4.jpg?63823096758
6c6083d2-6a2e-4f52-978e-c8b7be49ded0	Philadelphia maki	476	small	28-day aged 300g USDA Certified Prime Ribeye, rosemary-thyme garlic butter, with choice of two sides.	2022-06-22 05:59:18	2022-06-22 05:59:18	product_2.jpg?63823096758
4ba14c0f-66c3-4d40-b1a8-23257f655f81	Chicken Fajitas	401	small	28-day aged 300g USDA Certified Prime Ribeye, rosemary-thyme garlic butter, with choice of two sides.	2022-06-22 05:59:18	2022-06-22 05:59:18	product_4.jpg?63823096758
55045f79-1226-4421-ab17-2bf6a47648aa	Tiramisù	310	small	Two butter croissants of your choice (plain, almond or cheese). With a side of herb butter or house-made hazelnut spread.	2022-06-22 05:59:18	2022-06-22 05:59:18	product_1.jpg?63823096758
a2a74aa4-12f1-429b-b565-75b051911fc5	Califlower penne	59	small	Three eggs with cilantro, tomatoes, onions, avocados and melted Emmental cheese. With a side of roasted potatoes, and your choice of toast or croissant.	2022-06-22 05:59:18	2022-06-22 05:59:18	product_1.jpg?63823096758
b4c1c9e9-a8ca-4bac-9dd1-c6c78e464776	Caesar Salad	990	small	Creamy mascarpone cheese and custard layered between espresso and rum soaked house-made ladyfingers, topped with Valrhona cocoa powder.	2022-06-22 05:59:18	2022-06-22 05:59:18	product_3.jpg?63823096758
43e5cdc0-8e40-465f-b59f-2459cddbb2cb	Pork sausage roll	331	small	Two butter croissants of your choice (plain, almond or cheese). With a side of herb butter or house-made hazelnut spread.	2022-06-22 05:59:18	2022-06-22 05:59:18	product_4.jpg?63823096758
d900e85c-3a26-48bf-a2fb-70debc1ea3a2	Mushroom Risotto	184	small	Three eggs with cilantro, tomatoes, onions, avocados and melted Emmental cheese. With a side of roasted potatoes, and your choice of toast or croissant.	2022-06-22 05:59:18	2022-06-22 05:59:18	product_3.jpg?63823096758
9b6cb6c5-6188-4e34-b4df-172ccd7899ec	Ebiten maki	34	small	Creamy mascarpone cheese and custard layered between espresso and rum soaked house-made ladyfingers, topped with Valrhona cocoa powder.	2022-06-22 05:59:18	2022-06-22 05:59:18	product_4.jpg?63823096758
02cdaba3-3476-41b1-9070-b93814827ddd	Pork belly buns	940	small	Granny Smith apples mixed with brown sugar and butter filling, in a flaky all-butter crust, with ice cream.	2022-06-22 05:59:19	2022-06-22 05:59:19	product_1.jpg?63823096759
2d168dba-8108-40ff-9612-347c858428ab	Caprese Salad	237	small	Fresh parsley, Italian sausage, shallots, garlic, sun-dried tomatoes and mozzarella cheese in an all-butter crust. With a side of mixed fruits.	2022-06-22 05:59:19	2022-06-22 05:59:19	product_4.jpg?63823096759
f3276b22-ddfd-4017-9fc0-06e19deb1bab	Lasagne	64	small	Two buttermilk waffles, topped with whipped cream and maple syrup, a side of two eggs served any style, and your choice of smoked bacon or smoked ham.	2022-06-22 05:59:20	2022-06-22 05:59:20	product_2.jpg?63823096760
b5eeb6ce-9c02-4e08-9195-7ba450b48fc6	Pappardelle alla Bolognese	819	small	Granny Smith apples mixed with brown sugar and butter filling, in a flaky all-butter crust, with ice cream.	2022-06-22 05:59:19	2022-06-22 05:59:19	product_1.jpg?63823096759
f1ad849e-a5d0-4651-8562-b13b055be506	Risotto with seafood	667	small	Smoked salmon, poached eggs, diced red onions and Hollandaise sauce on an English muffin. With a side of roasted potatoes.	2022-06-22 05:59:18	2022-06-22 05:59:18	product_3.jpg?63823096758
07deb94d-848c-4925-bb9d-c7d929ae057c	Scotch eggs	334	small	Thick slices of French toast bread, brown sugar, half-and-half and vanilla, topped with powdered sugar. With two eggs served any style, and your choice of smoked bacon or smoked ham.	2022-06-22 05:59:19	2022-06-22 05:59:19	product_1.jpg?63823096759
e1c40820-937c-44ff-af1d-19a0239ac4cd	Chilli con carne	810	small	Granny Smith apples mixed with brown sugar and butter filling, in a flaky all-butter crust, with ice cream.	2022-06-22 05:59:18	2022-06-22 05:59:18	product_1.jpg?63823096758
d3d4d43f-9c86-4820-b323-f32fe188019e	Bruschette with Tomato	598	small	Fresh parsley, Italian sausage, shallots, garlic, sun-dried tomatoes and mozzarella cheese in an all-butter crust. With a side of mixed fruits.	2022-06-22 05:59:19	2022-06-22 05:59:19	product_2.jpg?63823096759
f31bf869-34ab-4a07-bcb1-9b3aba1e8dca	Pasta Carbonara	619	small	Granny Smith apples mixed with brown sugar and butter filling, in a flaky all-butter crust, with ice cream.	2022-06-22 05:59:20	2022-06-22 05:59:20	product_1.jpg?63823096760
d7fd16d0-b213-402c-b81e-c4c8541a816b	Teriyaki Chicken donburi	19	small	Breaded fried chicken with waffles. Served with maple syrup.	2022-06-22 05:59:18	2022-06-22 05:59:18	product_2.jpg?63823096758
aa6b54e8-dca6-44d8-82fd-2cb17446394b	Cheeseburger	893	small	Breaded fried chicken with waffles. Served with maple syrup.	2022-06-22 05:59:19	2022-06-22 05:59:19	product_1.jpg?63823096759
4177aa01-e8d1-492d-addc-718112423351	French fries with sausages	26	small	Smoked salmon, poached eggs, diced red onions and Hollandaise sauce on an English muffin. With a side of roasted potatoes.	2022-06-22 05:59:18	2022-06-22 05:59:18	product_1.jpg?63823096758
899f231f-27f0-42ff-84aa-c8de74fdfbc2	Barbecue Ribs	613	small	Fresh Norwegian salmon, lightly brushed with our herbed Dijon mustard sauce, with choice of two sides.	2022-06-22 05:59:19	2022-06-22 05:59:19	product_1.jpg?63823096759
06056b54-2026-4773-956c-218aebec6c71	Salmon nigiri	794	small	Two buttermilk waffles, topped with whipped cream and maple syrup, a side of two eggs served any style, and your choice of smoked bacon or smoked ham.	2022-06-22 05:59:20	2022-06-22 05:59:20	product_4.jpg?63823096760
194bfc92-e644-466b-8f39-abecfc95d3c2	California maki	2	small	Three egg omelet with Roquefort cheese, chives, and ham. With a side of roasted potatoes, and your choice of toast or croissant.	2022-06-22 05:59:19	2022-06-22 05:59:19	product_1.jpg?63823096759
\.


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: products_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX products_name_index ON public.products USING btree (name);


--
-- PostgreSQL database dump complete
--

