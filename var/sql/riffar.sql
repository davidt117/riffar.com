--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: adv_adv; Type: TABLE; Schema: public; Owner: riffar; Tablespace: 
--

CREATE TABLE adv_adv (
    id integer NOT NULL,
    date_from timestamp with time zone NOT NULL,
    date_to timestamp with time zone NOT NULL,
    name character varying(255) NOT NULL,
    title text NOT NULL,
    link character varying(200) NOT NULL,
    code text NOT NULL,
    bg character varying(255) NOT NULL,
    views integer NOT NULL,
    picture character varying(100),
    is_enabled boolean NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_changed timestamp with time zone NOT NULL,
    place_id integer NOT NULL
);


ALTER TABLE public.adv_adv OWNER TO riffar;

--
-- Name: adv_adv_id_seq; Type: SEQUENCE; Schema: public; Owner: riffar
--

CREATE SEQUENCE adv_adv_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.adv_adv_id_seq OWNER TO riffar;

--
-- Name: adv_adv_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riffar
--

ALTER SEQUENCE adv_adv_id_seq OWNED BY adv_adv.id;


--
-- Name: adv_adv_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riffar
--

SELECT pg_catalog.setval('adv_adv_id_seq', 1, false);


--
-- Name: adv_adv_section; Type: TABLE; Schema: public; Owner: riffar; Tablespace: 
--

CREATE TABLE adv_adv_section (
    id integer NOT NULL,
    adv_id integer NOT NULL,
    advsection_id integer NOT NULL
);


ALTER TABLE public.adv_adv_section OWNER TO riffar;

--
-- Name: adv_adv_section_id_seq; Type: SEQUENCE; Schema: public; Owner: riffar
--

CREATE SEQUENCE adv_adv_section_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.adv_adv_section_id_seq OWNER TO riffar;

--
-- Name: adv_adv_section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riffar
--

ALTER SEQUENCE adv_adv_section_id_seq OWNED BY adv_adv_section.id;


--
-- Name: adv_adv_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riffar
--

SELECT pg_catalog.setval('adv_adv_section_id_seq', 1, false);


--
-- Name: adv_advplace; Type: TABLE; Schema: public; Owner: riffar; Tablespace: 
--

CREATE TABLE adv_advplace (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(50) NOT NULL,
    is_enabled boolean NOT NULL
);


ALTER TABLE public.adv_advplace OWNER TO riffar;

--
-- Name: adv_advplace_id_seq; Type: SEQUENCE; Schema: public; Owner: riffar
--

CREATE SEQUENCE adv_advplace_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.adv_advplace_id_seq OWNER TO riffar;

--
-- Name: adv_advplace_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riffar
--

ALTER SEQUENCE adv_advplace_id_seq OWNED BY adv_advplace.id;


--
-- Name: adv_advplace_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riffar
--

SELECT pg_catalog.setval('adv_advplace_id_seq', 1, false);


--
-- Name: adv_advsection; Type: TABLE; Schema: public; Owner: riffar; Tablespace: 
--

CREATE TABLE adv_advsection (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    is_enabled boolean NOT NULL
);


ALTER TABLE public.adv_advsection OWNER TO riffar;

--
-- Name: adv_advsection_id_seq; Type: SEQUENCE; Schema: public; Owner: riffar
--

CREATE SEQUENCE adv_advsection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.adv_advsection_id_seq OWNER TO riffar;

--
-- Name: adv_advsection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riffar
--

ALTER SEQUENCE adv_advsection_id_seq OWNED BY adv_advsection.id;


--
-- Name: adv_advsection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riffar
--

SELECT pg_catalog.setval('adv_advsection_id_seq', 1, false);


--
-- Name: adv_click; Type: TABLE; Schema: public; Owner: riffar; Tablespace: 
--

CREATE TABLE adv_click (
    id integer NOT NULL,
    referer character varying(255) NOT NULL,
    url character varying(200) NOT NULL,
    ip_address inet,
    user_agent character varying(512) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    ad_id integer
);


ALTER TABLE public.adv_click OWNER TO riffar;

--
-- Name: adv_click_id_seq; Type: SEQUENCE; Schema: public; Owner: riffar
--

CREATE SEQUENCE adv_click_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.adv_click_id_seq OWNER TO riffar;

--
-- Name: adv_click_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riffar
--

ALTER SEQUENCE adv_click_id_seq OWNED BY adv_click.id;


--
-- Name: adv_click_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riffar
--

SELECT pg_catalog.setval('adv_click_id_seq', 1, false);


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: riffar; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO riffar;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: riffar
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO riffar;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riffar
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riffar
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: riffar; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO riffar;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: riffar
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO riffar;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riffar
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riffar
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: riffar; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO riffar;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: riffar
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO riffar;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riffar
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riffar
--

SELECT pg_catalog.setval('auth_permission_id_seq', 87, true);


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: riffar; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO riffar;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: riffar; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO riffar;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: riffar
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO riffar;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riffar
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riffar
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: riffar
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO riffar;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riffar
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riffar
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, false);


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: riffar; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO riffar;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: riffar
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO riffar;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riffar
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riffar
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Name: cms_cmsmodule; Type: TABLE; Schema: public; Owner: riffar; Tablespace: 
--

CREATE TABLE cms_cmsmodule (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    name_en character varying(64) NOT NULL,
    sort integer NOT NULL,
    description text NOT NULL,
    slug character varying(50) NOT NULL,
    is_enabled boolean NOT NULL,
    group_id character varying(50) NOT NULL
);


ALTER TABLE public.cms_cmsmodule OWNER TO riffar;

--
-- Name: cms_cmsmodule_id_seq; Type: SEQUENCE; Schema: public; Owner: riffar
--

CREATE SEQUENCE cms_cmsmodule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.cms_cmsmodule_id_seq OWNER TO riffar;

--
-- Name: cms_cmsmodule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riffar
--

ALTER SEQUENCE cms_cmsmodule_id_seq OWNED BY cms_cmsmodule.id;


--
-- Name: cms_cmsmodule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riffar
--

SELECT pg_catalog.setval('cms_cmsmodule_id_seq', 1, false);


--
-- Name: cms_cmsmodule_user; Type: TABLE; Schema: public; Owner: riffar; Tablespace: 
--

CREATE TABLE cms_cmsmodule_user (
    id integer NOT NULL,
    cmsmodule_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.cms_cmsmodule_user OWNER TO riffar;

--
-- Name: cms_cmsmodule_user_id_seq; Type: SEQUENCE; Schema: public; Owner: riffar
--

CREATE SEQUENCE cms_cmsmodule_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.cms_cmsmodule_user_id_seq OWNER TO riffar;

--
-- Name: cms_cmsmodule_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riffar
--

ALTER SEQUENCE cms_cmsmodule_user_id_seq OWNED BY cms_cmsmodule_user.id;


--
-- Name: cms_cmsmodule_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riffar
--

SELECT pg_catalog.setval('cms_cmsmodule_user_id_seq', 1, false);


--
-- Name: cms_cmsmodulegroup; Type: TABLE; Schema: public; Owner: riffar; Tablespace: 
--

CREATE TABLE cms_cmsmodulegroup (
    id integer NOT NULL,
    slug character varying(50) NOT NULL,
    name character varying(64) NOT NULL,
    name_en character varying(64) NOT NULL,
    fa character varying(50) NOT NULL,
    sort integer NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.cms_cmsmodulegroup OWNER TO riffar;

--
-- Name: cms_cmsmodulegroup_id_seq; Type: SEQUENCE; Schema: public; Owner: riffar
--

CREATE SEQUENCE cms_cmsmodulegroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.cms_cmsmodulegroup_id_seq OWNER TO riffar;

--
-- Name: cms_cmsmodulegroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riffar
--

ALTER SEQUENCE cms_cmsmodulegroup_id_seq OWNED BY cms_cmsmodulegroup.id;


--
-- Name: cms_cmsmodulegroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riffar
--

SELECT pg_catalog.setval('cms_cmsmodulegroup_id_seq', 1, false);


--
-- Name: cms_file; Type: TABLE; Schema: public; Owner: riffar; Tablespace: 
--

CREATE TABLE cms_file (
    id integer NOT NULL,
    path character varying(100) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    folder_id integer NOT NULL
);


ALTER TABLE public.cms_file OWNER TO riffar;

--
-- Name: cms_file_id_seq; Type: SEQUENCE; Schema: public; Owner: riffar
--

CREATE SEQUENCE cms_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.cms_file_id_seq OWNER TO riffar;

--
-- Name: cms_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riffar
--

ALTER SEQUENCE cms_file_id_seq OWNED BY cms_file.id;


--
-- Name: cms_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riffar
--

SELECT pg_catalog.setval('cms_file_id_seq', 1, false);


--
-- Name: cms_folder; Type: TABLE; Schema: public; Owner: riffar; Tablespace: 
--

CREATE TABLE cms_folder (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    date_created timestamp with time zone NOT NULL
);


ALTER TABLE public.cms_folder OWNER TO riffar;

--
-- Name: cms_folder_id_seq; Type: SEQUENCE; Schema: public; Owner: riffar
--

CREATE SEQUENCE cms_folder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.cms_folder_id_seq OWNER TO riffar;

--
-- Name: cms_folder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riffar
--

ALTER SEQUENCE cms_folder_id_seq OWNED BY cms_folder.id;


--
-- Name: cms_folder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riffar
--

SELECT pg_catalog.setval('cms_folder_id_seq', 1, false);


--
-- Name: cms_sitesettings; Type: TABLE; Schema: public; Owner: riffar; Tablespace: 
--

CREATE TABLE cms_sitesettings (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    descr text NOT NULL,
    type character varying(10) NOT NULL,
    text_value text NOT NULL,
    date_value timestamp with time zone,
    file_value character varying(100),
    options text NOT NULL
);


ALTER TABLE public.cms_sitesettings OWNER TO riffar;

--
-- Name: cms_sitesettings_id_seq; Type: SEQUENCE; Schema: public; Owner: riffar
--

CREATE SEQUENCE cms_sitesettings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.cms_sitesettings_id_seq OWNER TO riffar;

--
-- Name: cms_sitesettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riffar
--

ALTER SEQUENCE cms_sitesettings_id_seq OWNED BY cms_sitesettings.id;


--
-- Name: cms_sitesettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riffar
--

SELECT pg_catalog.setval('cms_sitesettings_id_seq', 1, true);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: riffar; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO riffar;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: riffar
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO riffar;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riffar
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riffar
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: riffar; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO riffar;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: riffar
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO riffar;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riffar
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riffar
--

SELECT pg_catalog.setval('django_content_type_id_seq', 29, true);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: riffar; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO riffar;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: riffar
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO riffar;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riffar
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riffar
--

SELECT pg_catalog.setval('django_migrations_id_seq', 28, true);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: riffar; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO riffar;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: riffar; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO riffar;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: riffar
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO riffar;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riffar
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riffar
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Name: lottery_lottery; Type: TABLE; Schema: public; Owner: riffar; Tablespace: 
--

CREATE TABLE lottery_lottery (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    min_number integer NOT NULL,
    max_number integer NOT NULL,
    min_amount integer NOT NULL,
    max_amount integer NOT NULL,
    open_time time without time zone NOT NULL,
    close_time time without time zone NOT NULL,
    created_by_id integer NOT NULL,
    is_available boolean NOT NULL,
    payment_amount_first_place numeric(6,2) NOT NULL,
    payment_amount_second_place numeric(6,2) NOT NULL,
    payment_amount_third_place numeric(6,2) NOT NULL,
    payment_amount_first_and_second_place numeric(6,2) NOT NULL,
    payment_amount_first_and_third_place numeric(6,2) NOT NULL,
    payment_amount_second_and_third_place numeric(6,2) NOT NULL,
    payment_amount_triplets numeric(6,2) NOT NULL
);


ALTER TABLE public.lottery_lottery OWNER TO riffar;

--
-- Name: lottery_lottery_id_seq; Type: SEQUENCE; Schema: public; Owner: riffar
--

CREATE SEQUENCE lottery_lottery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.lottery_lottery_id_seq OWNER TO riffar;

--
-- Name: lottery_lottery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riffar
--

ALTER SEQUENCE lottery_lottery_id_seq OWNED BY lottery_lottery.id;


--
-- Name: lottery_lottery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riffar
--

SELECT pg_catalog.setval('lottery_lottery_id_seq', 9, true);


--
-- Name: lottery_stopnumber; Type: TABLE; Schema: public; Owner: riffar; Tablespace: 
--

CREATE TABLE lottery_stopnumber (
    id integer NOT NULL,
    admin_id integer NOT NULL,
    number integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    lottery_id integer NOT NULL
);


ALTER TABLE public.lottery_stopnumber OWNER TO riffar;

--
-- Name: lottery_stopnumber_id_seq; Type: SEQUENCE; Schema: public; Owner: riffar
--

CREATE SEQUENCE lottery_stopnumber_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.lottery_stopnumber_id_seq OWNER TO riffar;

--
-- Name: lottery_stopnumber_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riffar
--

ALTER SEQUENCE lottery_stopnumber_id_seq OWNED BY lottery_stopnumber.id;


--
-- Name: lottery_stopnumber_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riffar
--

SELECT pg_catalog.setval('lottery_stopnumber_id_seq', 2, true);


--
-- Name: lottery_winningnumberlog; Type: TABLE; Schema: public; Owner: riffar; Tablespace: 
--

CREATE TABLE lottery_winningnumberlog (
    id integer NOT NULL,
    winning_numbers_first_place character varying(255) NOT NULL,
    winning_numbers_second_place character varying(255) NOT NULL,
    winning_numbers_third_place character varying(255) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    lottery_id integer NOT NULL,
    date_of_report timestamp with time zone
);


ALTER TABLE public.lottery_winningnumberlog OWNER TO riffar;

--
-- Name: lottery_winningnumberlog_id_seq; Type: SEQUENCE; Schema: public; Owner: riffar
--

CREATE SEQUENCE lottery_winningnumberlog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.lottery_winningnumberlog_id_seq OWNER TO riffar;

--
-- Name: lottery_winningnumberlog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riffar
--

ALTER SEQUENCE lottery_winningnumberlog_id_seq OWNED BY lottery_winningnumberlog.id;


--
-- Name: lottery_winningnumberlog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riffar
--

SELECT pg_catalog.setval('lottery_winningnumberlog_id_seq', 12, true);


--
-- Name: pagemap_page; Type: TABLE; Schema: public; Owner: riffar; Tablespace: 
--

CREATE TABLE pagemap_page (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    header character varying(255) NOT NULL,
    menu_name character varying(255) NOT NULL,
    menu_url character varying(255) NOT NULL,
    slug character varying(50) NOT NULL,
    url character varying(512) NOT NULL,
    sort integer NOT NULL,
    module_params character varying(128),
    before_content text NOT NULL,
    after_content text NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_changed timestamp with time zone NOT NULL,
    seo_keywords text NOT NULL,
    seo_description text NOT NULL,
    is_enabled boolean NOT NULL,
    is_in_menu boolean NOT NULL,
    is_locked boolean NOT NULL,
    adv_section_id integer NOT NULL,
    module_id integer NOT NULL,
    parent_id integer
);


ALTER TABLE public.pagemap_page OWNER TO riffar;

--
-- Name: pagemap_page_id_seq; Type: SEQUENCE; Schema: public; Owner: riffar
--

CREATE SEQUENCE pagemap_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.pagemap_page_id_seq OWNER TO riffar;

--
-- Name: pagemap_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riffar
--

ALTER SEQUENCE pagemap_page_id_seq OWNED BY pagemap_page.id;


--
-- Name: pagemap_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riffar
--

SELECT pg_catalog.setval('pagemap_page_id_seq', 1, false);


--
-- Name: pagemap_pagemodule; Type: TABLE; Schema: public; Owner: riffar; Tablespace: 
--

CREATE TABLE pagemap_pagemodule (
    id integer NOT NULL,
    slug character varying(50) NOT NULL,
    name character varying(64) NOT NULL,
    name_en character varying(64) NOT NULL,
    is_enabled boolean NOT NULL
);


ALTER TABLE public.pagemap_pagemodule OWNER TO riffar;

--
-- Name: pagemap_pagemodule_id_seq; Type: SEQUENCE; Schema: public; Owner: riffar
--

CREATE SEQUENCE pagemap_pagemodule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.pagemap_pagemodule_id_seq OWNER TO riffar;

--
-- Name: pagemap_pagemodule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riffar
--

ALTER SEQUENCE pagemap_pagemodule_id_seq OWNED BY pagemap_pagemodule.id;


--
-- Name: pagemap_pagemodule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riffar
--

SELECT pg_catalog.setval('pagemap_pagemodule_id_seq', 1, false);


--
-- Name: pin_adminpin; Type: TABLE; Schema: public; Owner: riffar; Tablespace: 
--

CREATE TABLE pin_adminpin (
    id integer NOT NULL,
    pin character varying(50) NOT NULL,
    is_active boolean NOT NULL,
    date_created timestamp with time zone NOT NULL,
    created_by_id integer NOT NULL
);


ALTER TABLE public.pin_adminpin OWNER TO riffar;

--
-- Name: pin_adminpin_id_seq; Type: SEQUENCE; Schema: public; Owner: riffar
--

CREATE SEQUENCE pin_adminpin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.pin_adminpin_id_seq OWNER TO riffar;

--
-- Name: pin_adminpin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riffar
--

ALTER SEQUENCE pin_adminpin_id_seq OWNED BY pin_adminpin.id;


--
-- Name: pin_adminpin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riffar
--

SELECT pg_catalog.setval('pin_adminpin_id_seq', 10, true);


--
-- Name: pin_pin; Type: TABLE; Schema: public; Owner: riffar; Tablespace: 
--

CREATE TABLE pin_pin (
    id integer NOT NULL,
    pin character varying(50) NOT NULL,
    is_active boolean NOT NULL,
    date_created timestamp with time zone NOT NULL,
    created_by_id integer NOT NULL
);


ALTER TABLE public.pin_pin OWNER TO riffar;

--
-- Name: pin_pin_id_seq; Type: SEQUENCE; Schema: public; Owner: riffar
--

CREATE SEQUENCE pin_pin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.pin_pin_id_seq OWNER TO riffar;

--
-- Name: pin_pin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riffar
--

ALTER SEQUENCE pin_pin_id_seq OWNED BY pin_pin.id;


--
-- Name: pin_pin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riffar
--

SELECT pg_catalog.setval('pin_pin_id_seq', 13, true);


--
-- Name: siteadmin_siteadmin; Type: TABLE; Schema: public; Owner: riffar; Tablespace: 
--

CREATE TABLE siteadmin_siteadmin (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    email character varying(254) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    pin_id integer NOT NULL
);


ALTER TABLE public.siteadmin_siteadmin OWNER TO riffar;

--
-- Name: siteadmin_siteadmin_id_seq; Type: SEQUENCE; Schema: public; Owner: riffar
--

CREATE SEQUENCE siteadmin_siteadmin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.siteadmin_siteadmin_id_seq OWNER TO riffar;

--
-- Name: siteadmin_siteadmin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riffar
--

ALTER SEQUENCE siteadmin_siteadmin_id_seq OWNED BY siteadmin_siteadmin.id;


--
-- Name: siteadmin_siteadmin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riffar
--

SELECT pg_catalog.setval('siteadmin_siteadmin_id_seq', 5, true);


--
-- Name: siteuser_siteuser; Type: TABLE; Schema: public; Owner: riffar; Tablespace: 
--

CREATE TABLE siteuser_siteuser (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    email character varying(254) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    pin_id integer NOT NULL,
    commission_percent numeric(4,2) NOT NULL
);


ALTER TABLE public.siteuser_siteuser OWNER TO riffar;

--
-- Name: siteuser_siteuser_id_seq; Type: SEQUENCE; Schema: public; Owner: riffar
--

CREATE SEQUENCE siteuser_siteuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.siteuser_siteuser_id_seq OWNER TO riffar;

--
-- Name: siteuser_siteuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riffar
--

ALTER SEQUENCE siteuser_siteuser_id_seq OWNED BY siteuser_siteuser.id;


--
-- Name: siteuser_siteuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riffar
--

SELECT pg_catalog.setval('siteuser_siteuser_id_seq', 7, true);


--
-- Name: superadmin_superadmin; Type: TABLE; Schema: public; Owner: riffar; Tablespace: 
--

CREATE TABLE superadmin_superadmin (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    email character varying(254) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL
);


ALTER TABLE public.superadmin_superadmin OWNER TO riffar;

--
-- Name: superadmin_superadmin_id_seq; Type: SEQUENCE; Schema: public; Owner: riffar
--

CREATE SEQUENCE superadmin_superadmin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.superadmin_superadmin_id_seq OWNER TO riffar;

--
-- Name: superadmin_superadmin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riffar
--

ALTER SEQUENCE superadmin_superadmin_id_seq OWNED BY superadmin_superadmin.id;


--
-- Name: superadmin_superadmin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riffar
--

SELECT pg_catalog.setval('superadmin_superadmin_id_seq', 1, true);


--
-- Name: ticket_play; Type: TABLE; Schema: public; Owner: riffar; Tablespace: 
--

CREATE TABLE ticket_play (
    id integer NOT NULL,
    ticket_id integer NOT NULL,
    number character varying(64) NOT NULL,
    amount character varying(64) NOT NULL,
    lottery_id integer NOT NULL,
    date_created timestamp with time zone NOT NULL
);


ALTER TABLE public.ticket_play OWNER TO riffar;

--
-- Name: ticket_play_id_seq; Type: SEQUENCE; Schema: public; Owner: riffar
--

CREATE SEQUENCE ticket_play_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.ticket_play_id_seq OWNER TO riffar;

--
-- Name: ticket_play_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riffar
--

ALTER SEQUENCE ticket_play_id_seq OWNED BY ticket_play.id;


--
-- Name: ticket_play_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riffar
--

SELECT pg_catalog.setval('ticket_play_id_seq', 55, true);


--
-- Name: ticket_ticket; Type: TABLE; Schema: public; Owner: riffar; Tablespace: 
--

CREATE TABLE ticket_ticket (
    id integer NOT NULL,
    number integer NOT NULL,
    user_id integer NOT NULL,
    date_created timestamp with time zone NOT NULL
);


ALTER TABLE public.ticket_ticket OWNER TO riffar;

--
-- Name: ticket_ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: riffar
--

CREATE SEQUENCE ticket_ticket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.ticket_ticket_id_seq OWNER TO riffar;

--
-- Name: ticket_ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riffar
--

ALTER SEQUENCE ticket_ticket_id_seq OWNED BY ticket_ticket.id;


--
-- Name: ticket_ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riffar
--

SELECT pg_catalog.setval('ticket_ticket_id_seq', 32, true);


--
-- Name: watson_searchentry; Type: TABLE; Schema: public; Owner: riffar; Tablespace: 
--

CREATE TABLE watson_searchentry (
    id integer NOT NULL,
    engine_slug character varying(200) NOT NULL,
    object_id text NOT NULL,
    object_id_int integer,
    title character varying(1000) NOT NULL,
    description text NOT NULL,
    content text NOT NULL,
    url character varying(1000) NOT NULL,
    meta_encoded text NOT NULL,
    content_type_id integer NOT NULL
);


ALTER TABLE public.watson_searchentry OWNER TO riffar;

--
-- Name: watson_searchentry_id_seq; Type: SEQUENCE; Schema: public; Owner: riffar
--

CREATE SEQUENCE watson_searchentry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.watson_searchentry_id_seq OWNER TO riffar;

--
-- Name: watson_searchentry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riffar
--

ALTER SEQUENCE watson_searchentry_id_seq OWNED BY watson_searchentry.id;


--
-- Name: watson_searchentry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riffar
--

SELECT pg_catalog.setval('watson_searchentry_id_seq', 1, false);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY adv_adv ALTER COLUMN id SET DEFAULT nextval('adv_adv_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY adv_adv_section ALTER COLUMN id SET DEFAULT nextval('adv_adv_section_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY adv_advplace ALTER COLUMN id SET DEFAULT nextval('adv_advplace_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY adv_advsection ALTER COLUMN id SET DEFAULT nextval('adv_advsection_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY adv_click ALTER COLUMN id SET DEFAULT nextval('adv_click_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY cms_cmsmodule ALTER COLUMN id SET DEFAULT nextval('cms_cmsmodule_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY cms_cmsmodule_user ALTER COLUMN id SET DEFAULT nextval('cms_cmsmodule_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY cms_cmsmodulegroup ALTER COLUMN id SET DEFAULT nextval('cms_cmsmodulegroup_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY cms_file ALTER COLUMN id SET DEFAULT nextval('cms_file_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY cms_folder ALTER COLUMN id SET DEFAULT nextval('cms_folder_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY cms_sitesettings ALTER COLUMN id SET DEFAULT nextval('cms_sitesettings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY lottery_lottery ALTER COLUMN id SET DEFAULT nextval('lottery_lottery_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY lottery_stopnumber ALTER COLUMN id SET DEFAULT nextval('lottery_stopnumber_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY lottery_winningnumberlog ALTER COLUMN id SET DEFAULT nextval('lottery_winningnumberlog_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY pagemap_page ALTER COLUMN id SET DEFAULT nextval('pagemap_page_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY pagemap_pagemodule ALTER COLUMN id SET DEFAULT nextval('pagemap_pagemodule_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY pin_adminpin ALTER COLUMN id SET DEFAULT nextval('pin_adminpin_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY pin_pin ALTER COLUMN id SET DEFAULT nextval('pin_pin_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY siteadmin_siteadmin ALTER COLUMN id SET DEFAULT nextval('siteadmin_siteadmin_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY siteuser_siteuser ALTER COLUMN id SET DEFAULT nextval('siteuser_siteuser_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY superadmin_superadmin ALTER COLUMN id SET DEFAULT nextval('superadmin_superadmin_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY ticket_play ALTER COLUMN id SET DEFAULT nextval('ticket_play_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY ticket_ticket ALTER COLUMN id SET DEFAULT nextval('ticket_ticket_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY watson_searchentry ALTER COLUMN id SET DEFAULT nextval('watson_searchentry_id_seq'::regclass);


--
-- Data for Name: adv_adv; Type: TABLE DATA; Schema: public; Owner: riffar
--

COPY adv_adv (id, date_from, date_to, name, title, link, code, bg, views, picture, is_enabled, date_created, date_changed, place_id) FROM stdin;
\.


--
-- Data for Name: adv_adv_section; Type: TABLE DATA; Schema: public; Owner: riffar
--

COPY adv_adv_section (id, adv_id, advsection_id) FROM stdin;
\.


--
-- Data for Name: adv_advplace; Type: TABLE DATA; Schema: public; Owner: riffar
--

COPY adv_advplace (id, name, slug, is_enabled) FROM stdin;
\.


--
-- Data for Name: adv_advsection; Type: TABLE DATA; Schema: public; Owner: riffar
--

COPY adv_advsection (id, name, is_enabled) FROM stdin;
\.


--
-- Data for Name: adv_click; Type: TABLE DATA; Schema: public; Owner: riffar
--

COPY adv_click (id, referer, url, ip_address, user_agent, date_created, ad_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: riffar
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: riffar
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: riffar
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add log entry	4	add_logentry
11	Can change log entry	4	change_logentry
12	Can delete log entry	4	delete_logentry
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add site	7	add_site
20	Can change site	7	change_site
21	Can delete site	7	delete_site
22	Can add search entry	8	add_searchentry
23	Can change search entry	8	change_searchentry
24	Can delete search entry	8	delete_searchentry
25	Can add CMS Module Group	9	add_cmsmodulegroup
26	Can change CMS Module Group	9	change_cmsmodulegroup
27	Can delete CMS Module Group	9	delete_cmsmodulegroup
28	Can add CMS Module	10	add_cmsmodule
29	Can change CMS Module	10	change_cmsmodule
30	Can delete CMS Module	10	delete_cmsmodule
31	Can add folder	11	add_folder
32	Can change folder	11	change_folder
33	Can delete folder	11	delete_folder
34	Can add file	12	add_file
35	Can change file	12	change_file
36	Can delete file	12	delete_file
37	Can add Site setting	13	add_sitesettings
38	Can change Site setting	13	change_sitesettings
39	Can delete Site setting	13	delete_sitesettings
40	Can add ad place	14	add_advplace
41	Can change ad place	14	change_advplace
42	Can delete ad place	14	delete_advplace
43	Can add ad section	15	add_advsection
44	Can change ad section	15	change_advsection
45	Can delete ad section	15	delete_advsection
46	Can add banner	16	add_adv
47	Can change banner	16	change_adv
48	Can delete banner	16	delete_adv
49	Can add click	17	add_click
50	Can change click	17	change_click
51	Can delete click	17	delete_click
52	Can add Module	18	add_pagemodule
53	Can change Module	18	change_pagemodule
54	Can delete Module	18	delete_pagemodule
55	Can add page	19	add_page
56	Can change page	19	change_page
57	Can delete page	19	delete_page
58	Can add site admin	20	add_siteadmin
59	Can change site admin	20	change_siteadmin
60	Can delete site admin	20	delete_siteadmin
61	Can add super admin	21	add_superadmin
62	Can change super admin	21	change_superadmin
63	Can delete super admin	21	delete_superadmin
64	Can add site user	22	add_siteuser
65	Can change site user	22	change_siteuser
66	Can delete site user	22	delete_siteuser
67	Can add Pin	23	add_pin
68	Can change Pin	23	change_pin
69	Can delete Pin	23	delete_pin
70	Can add Pin	24	add_adminpin
71	Can change Pin	24	change_adminpin
72	Can delete Pin	24	delete_adminpin
73	Can add lottery	25	add_lottery
74	Can change lottery	25	change_lottery
75	Can delete lottery	25	delete_lottery
76	Can add stop number	26	add_stopnumber
77	Can change stop number	26	change_stopnumber
78	Can delete stop number	26	delete_stopnumber
79	Can add ticket	27	add_ticket
80	Can change ticket	27	change_ticket
81	Can delete ticket	27	delete_ticket
82	Can add play	28	add_play
83	Can change play	28	change_play
84	Can delete play	28	delete_play
85	Can add winning numbers log	29	add_winningnumberlog
86	Can change winning numbers log	29	change_winningnumberlog
87	Can delete winning numbers log	29	delete_winningnumberlog
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: riffar
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: riffar
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: riffar
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: cms_cmsmodule; Type: TABLE DATA; Schema: public; Owner: riffar
--

COPY cms_cmsmodule (id, name, name_en, sort, description, slug, is_enabled, group_id) FROM stdin;
\.


--
-- Data for Name: cms_cmsmodule_user; Type: TABLE DATA; Schema: public; Owner: riffar
--

COPY cms_cmsmodule_user (id, cmsmodule_id, user_id) FROM stdin;
\.


--
-- Data for Name: cms_cmsmodulegroup; Type: TABLE DATA; Schema: public; Owner: riffar
--

COPY cms_cmsmodulegroup (id, slug, name, name_en, fa, sort, description) FROM stdin;
\.


--
-- Data for Name: cms_file; Type: TABLE DATA; Schema: public; Owner: riffar
--

COPY cms_file (id, path, date_created, folder_id) FROM stdin;
\.


--
-- Data for Name: cms_folder; Type: TABLE DATA; Schema: public; Owner: riffar
--

COPY cms_folder (id, name, date_created) FROM stdin;
\.


--
-- Data for Name: cms_sitesettings; Type: TABLE DATA; Schema: public; Owner: riffar
--

COPY cms_sitesettings (id, name, descr, type, text_value, date_value, file_value, options) FROM stdin;
1	site_title	Site Title	string	RIFFAR	\N	\N	
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: riffar
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: riffar
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	auth	permission
2	auth	group
3	auth	user
4	admin	logentry
5	contenttypes	contenttype
6	sessions	session
7	sites	site
8	watson	searchentry
9	cms	cmsmodulegroup
10	cms	cmsmodule
11	cms	folder
12	cms	file
13	cms	sitesettings
14	adv	advplace
15	adv	advsection
16	adv	adv
17	adv	click
18	pagemap	pagemodule
19	pagemap	page
20	siteadmin	siteadmin
21	superadmin	superadmin
22	siteuser	siteuser
23	pin	pin
24	pin	adminpin
25	lottery	lottery
26	lottery	stopnumber
27	ticket	ticket
28	ticket	play
29	lottery	winningnumberlog
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: riffar
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2015-11-09 06:32:11.265802+01
2	auth	0001_initial	2015-11-09 06:32:13.240721+01
3	admin	0001_initial	2015-11-09 06:32:13.757305+01
4	adv	0001_initial	2015-11-09 06:32:15.282961+01
5	contenttypes	0002_remove_content_type_name	2015-11-09 06:32:15.332974+01
6	auth	0002_alter_permission_name_max_length	2015-11-09 06:32:15.357928+01
7	auth	0003_alter_user_email_max_length	2015-11-09 06:32:15.382745+01
8	auth	0004_alter_user_username_opts	2015-11-09 06:32:15.407051+01
9	auth	0005_alter_user_last_login_null	2015-11-09 06:32:15.441144+01
10	auth	0006_require_contenttypes_0002	2015-11-09 06:32:15.44979+01
11	cms	0001_initial	2015-11-09 06:32:16.592186+01
12	pagemap	0001_initial	2015-11-09 06:32:17.136214+01
13	sessions	0001_initial	2015-11-09 06:32:17.351531+01
14	sites	0001_initial	2015-11-09 06:32:17.434318+01
15	watson	0001_initial	2015-11-09 06:32:17.676193+01
16	pin	0001_initial	2015-11-10 03:00:01.549313+01
17	lottery	0001_initial	2015-11-12 02:39:25.79843+01
18	lottery	0002_lottery_created_by	2015-11-12 03:32:08.281407+01
19	lottery	0003_stopnumber_lottery	2015-11-12 03:32:09.160248+01
20	lottery	0004_remove_stopnumber_user	2015-11-12 03:32:09.379647+01
21	lottery	0005_auto_20151112_2254	2015-11-13 05:17:20.147109+01
22	pin	0002_auto_20151116_2218	2015-11-17 04:19:36.133557+01
23	siteuser	0001_initial	2015-11-17 04:19:36.190205+01
24	siteuser	0002_siteuser_commission_percent	2015-11-17 04:46:07.227619+01
25	lottery	0006_auto_20151118_2029	2015-11-19 02:51:51.641737+01
26	lottery	0007_auto_20151119_0022	2015-11-19 06:49:26.792708+01
27	lottery	0008_auto_20151119_2032	2015-11-20 02:49:47.163628+01
28	lottery	0009_auto_20151208_2155	2015-12-09 04:00:38.407969+01
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: riffar
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
34en8i3e1i4mdn1sou0b9ufr27zwug0c	YzE1MjQzZmMyZDlmMGIyOTNjZGUxMzQzMDk2MGI4ZjBjY2FjYzFhNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMWZhNjJiMTFlODQ2YzIxODE0MGIxMDVmOTk2MGE1MTE4MjUyZjAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhcHAuc2l0ZWFkbWluYXV0aC5iYWNrZW5kcy5BZG1pbkF1dGhCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2015-11-24 03:51:41.188932+01
njsbh3qtdol5go7loi4i81085bsitbny	ZGM1ZjcwY2Q2MjEzNDJiNjgyYWU2ZjA5YWI4MTBkMTAxODIyMTNmMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImI5MDI1OWU0NjNmZjM4ODZjMmYxMjY4NzkzMjU1ZjAwYTkwOThlZGUiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcC5zdXBlcmFkbWluYXV0aC5iYWNrZW5kcy5TdXBlckFkbWluQXV0aEJhY2tlbmQifQ==	2015-11-24 03:52:37.41921+01
rqw2gitvcl6dt684u9p8xdo82ufxw77g	MzQ1YzZjZjFhNjcyMTczYmQ4NDNiZmEwMTEzYjdhZGJmMGNhZWM3Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc0YjgyNzllMjY2Zjg2ZmFmNzIwNTU1OTkwNGVmNmI5NGM5Y2JkMzYiLCJwbGF5cyI6W10sIl9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYXBwLnNpdGVhdXRoLmJhY2tlbmRzLlVzZXJBdXRoQmFja2VuZCJ9	2015-11-24 03:35:21.700283+01
7lzgc68xoay77ablmtg9j4lnyopo10kk	ZjlkNzJjYjU3MjVhNjA4YzViMWU2ZTdmN2NmZDEyOWRjZmIxZTgxNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAyNTIwZTBlYjBjYzNmOWJmMzA0ZTZiYzA5NDNkYzVjN2RhODRjNDAiLCJwbGF5cyI6W10sIl9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYXBwLnNpdGVhdXRoLmJhY2tlbmRzLlVzZXJBdXRoQmFja2VuZCJ9	2015-11-26 16:56:05.26112+01
k6rocrr6juprenxu0qh824m9wvu8b3bo	ZTVlMTYyMjJkMjNkZmFjOTIzZGJlOTM0NDUwYjE1NDVlZDZkMzZiMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImMxZjQ1NzE2NGRmN2IzYjVhZjE3N2Q5ODkxNjI0MzllZGEyYTI0MGEiLCJwbGF5cyI6W10sIl9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYXBwLnNpdGVhdXRoLmJhY2tlbmRzLlVzZXJBdXRoQmFja2VuZCJ9	2015-11-27 05:17:41.441935+01
ig0hqd7jzlac6heb89i71ma6f40tg2qz	MDBjNTc3ODJmZjIwY2NkMmMwNWNlYWI2Nzk0MDE2Zjk5ODk3MTUzNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAyNTIwZTBlYjBjYzNmOWJmMzA0ZTZiYzA5NDNkYzVjN2RhODRjNDAiLCJwbGF5cyI6W10sIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcC5zaXRlYXV0aC5iYWNrZW5kcy5Vc2VyQXV0aEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiNCJ9	2015-12-01 10:23:23.558517+01
nu4pr0o4mq1f0f6gxd072yir57d0opqg	YjE1NjU2MWI1ZWMxNTdkOTM3MzA1OTMwOWQ0MWNkYThlZTNjZTcyYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjJkZmE5NmU2ZDE4YzhmYTI5OTc2MmY4OTZjOTc5OTQyZGVlNGExYzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhcHAuc2l0ZWFkbWluYXV0aC5iYWNrZW5kcy5BZG1pbkF1dGhCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjQifQ==	2015-12-23 01:10:57.076109+01
ra0ngoaizloihlt2zt1glkqv1b9ujf6a	MGNiNTM5Yzk4ZmNjOTM1MDlmMDYyMzg1ZWNlNzU1NDk2Y2NiNWExYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjZlNmE4YzhiNTdiNDgxNmQ3NTg5ZDY5MjFhY2QxZDU2NWUxNThhOWYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhcHAuc2l0ZWFkbWluYXV0aC5iYWNrZW5kcy5BZG1pbkF1dGhCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIifQ==	2015-11-27 05:22:18.377519+01
g68upemysmblt1n7hema9hff20viremo	MjI1OGQ4YTEwM2JiOGU1ZDNjMjEwYTQyODgyNTlhMTM4NzgwZTY2ZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImI5MDI1OWU0NjNmZjM4ODZjMmYxMjY4NzkzMjU1ZjAwYTkwOThlZGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhcHAuc3VwZXJhZG1pbmF1dGguYmFja2VuZHMuU3VwZXJBZG1pbkF1dGhCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2015-11-27 18:19:46.296976+01
8nnh66b2nwdsyx3abxmcczsmdsl25dt4	Y2IyY2JhYmI2MjgyYmNmZTZhMGNjNWE4ODAwMGQxYmE0NzY1M2VhODp7Il9hdXRoX3VzZXJfaGFzaCI6IjJkZmE5NmU2ZDE4YzhmYTI5OTc2MmY4OTZjOTc5OTQyZGVlNGExYzMiLCJfYXV0aF91c2VyX2lkIjoiNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcC5zaXRlYWRtaW5hdXRoLmJhY2tlbmRzLkFkbWluQXV0aEJhY2tlbmQifQ==	2015-12-21 19:00:26.09466+01
nydyg0w7xgku5f12lopxuogje2e33rt6	YjE1NjU2MWI1ZWMxNTdkOTM3MzA1OTMwOWQ0MWNkYThlZTNjZTcyYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjJkZmE5NmU2ZDE4YzhmYTI5OTc2MmY4OTZjOTc5OTQyZGVlNGExYzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhcHAuc2l0ZWFkbWluYXV0aC5iYWNrZW5kcy5BZG1pbkF1dGhCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjQifQ==	2015-11-26 15:49:05.311391+01
k5ro96pv3qcw33d6ilpc8jo4aiehnpzq	MDBjNTc3ODJmZjIwY2NkMmMwNWNlYWI2Nzk0MDE2Zjk5ODk3MTUzNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAyNTIwZTBlYjBjYzNmOWJmMzA0ZTZiYzA5NDNkYzVjN2RhODRjNDAiLCJwbGF5cyI6W10sIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcC5zaXRlYXV0aC5iYWNrZW5kcy5Vc2VyQXV0aEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiNCJ9	2015-11-26 16:26:49.97686+01
kp53yzorsqlxjakhd6dz3bst8mp3quvv	NzVlYTZlMmVmOWM2YTY5OGYxMjM1ZTAyOTI0MWYzOTY0MTFiODliZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImI3YTU2NmE3NTYzYzhjODAwNDMwYTc4MjYxNjlkMzg2M2U5NmZjZmIiLCJfYXV0aF91c2VyX2lkIjoiNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcC5zaXRlYWRtaW5hdXRoLmJhY2tlbmRzLkFkbWluQXV0aEJhY2tlbmQifQ==	2015-12-24 01:24:32.112709+01
zgeecp97s34yafabtgz5gqh20vctysw7	YjBiYWNmNjE0N2NhY2MxMDliMDgxOTIxYTVkMTJjYWU1YjZkYWE0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjMyMjZlYzk5YTBmZjdiMWM3ZTEyM2JhMjA0MzY3MmI0MjBiOWM2MjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhcHAuc2l0ZWF1dGguYmFja2VuZHMuVXNlckF1dGhCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjUifQ==	2015-12-25 05:55:52.860437+01
45sdsizhls81fr0xswi68ec0j69i6fli	MGNiNTM5Yzk4ZmNjOTM1MDlmMDYyMzg1ZWNlNzU1NDk2Y2NiNWExYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjZlNmE4YzhiNTdiNDgxNmQ3NTg5ZDY5MjFhY2QxZDU2NWUxNThhOWYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhcHAuc2l0ZWFkbWluYXV0aC5iYWNrZW5kcy5BZG1pbkF1dGhCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIifQ==	2015-11-24 14:26:31.788554+01
gaaog4fs6dldxmuvh421wou3it4u1h0d	MjI1OGQ4YTEwM2JiOGU1ZDNjMjEwYTQyODgyNTlhMTM4NzgwZTY2ZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImI5MDI1OWU0NjNmZjM4ODZjMmYxMjY4NzkzMjU1ZjAwYTkwOThlZGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhcHAuc3VwZXJhZG1pbmF1dGguYmFja2VuZHMuU3VwZXJBZG1pbkF1dGhCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2015-11-26 14:53:05.052239+01
kdneok8givn10papbxcgjmkkfuxrmchs	OTMyNDVmMWU4ZjM1MzA5NWM5NTVhOGRlNzA4OWYxZDY1YzkzZThhMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImI3YTU2NmE3NTYzYzhjODAwNDMwYTc4MjYxNjlkMzg2M2U5NmZjZmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhcHAuc2l0ZWFkbWluYXV0aC5iYWNrZW5kcy5BZG1pbkF1dGhCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjUifQ==	2015-12-25 06:44:05.296434+01
5liijzwq7i5t0l2dxt8nu2iqvkaulj0w	Y2IyY2JhYmI2MjgyYmNmZTZhMGNjNWE4ODAwMGQxYmE0NzY1M2VhODp7Il9hdXRoX3VzZXJfaGFzaCI6IjJkZmE5NmU2ZDE4YzhmYTI5OTc2MmY4OTZjOTc5OTQyZGVlNGExYzMiLCJfYXV0aF91c2VyX2lkIjoiNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcC5zaXRlYWRtaW5hdXRoLmJhY2tlbmRzLkFkbWluQXV0aEJhY2tlbmQifQ==	2015-11-26 15:11:00.353721+01
nj7pe6a65luv6trgbj38l8br70v9l1hd	ZTVlMTYyMjJkMjNkZmFjOTIzZGJlOTM0NDUwYjE1NDVlZDZkMzZiMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImMxZjQ1NzE2NGRmN2IzYjVhZjE3N2Q5ODkxNjI0MzllZGEyYTI0MGEiLCJwbGF5cyI6W10sIl9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYXBwLnNpdGVhdXRoLmJhY2tlbmRzLlVzZXJBdXRoQmFja2VuZCJ9	2015-11-26 16:43:52.341342+01
69l424453tsb3rn3052lg0b4w5bioz5l	MDY0NDdjM2IzMjA2NjFjMWY3MDI0NzI5Y2FiNzI1MTQ5ODA2MjVmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAyNTIwZTBlYjBjYzNmOWJmMzA0ZTZiYzA5NDNkYzVjN2RhODRjNDAiLCJfYXV0aF91c2VyX2lkIjoiNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcC5zaXRlYXV0aC5iYWNrZW5kcy5Vc2VyQXV0aEJhY2tlbmQifQ==	2015-12-01 01:15:36.905189+01
pudanzzftuvn433afvmb76ygdtre75d5	YjE1NjU2MWI1ZWMxNTdkOTM3MzA1OTMwOWQ0MWNkYThlZTNjZTcyYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjJkZmE5NmU2ZDE4YzhmYTI5OTc2MmY4OTZjOTc5OTQyZGVlNGExYzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhcHAuc2l0ZWFkbWluYXV0aC5iYWNrZW5kcy5BZG1pbkF1dGhCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjQifQ==	2015-11-29 19:51:43.966151+01
gmjmohc5yiw68aab7gcdlke3fya8sr7k	MTc1MjU5MjlkYzQyOTA5OWI1MGJiNjA5NTRkZTc4ZjM4MDM2OWRlMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImMxZjQ1NzE2NGRmN2IzYjVhZjE3N2Q5ODkxNjI0MzllZGEyYTI0MGEiLCJwbGF5cyI6W10sIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcC5zaXRlYXV0aC5iYWNrZW5kcy5Vc2VyQXV0aEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMyJ9	2015-11-27 13:37:48.144724+01
3p0yxqb3dqzgklb2lq6769tg3e9fvsl4	MjI1OGQ4YTEwM2JiOGU1ZDNjMjEwYTQyODgyNTlhMTM4NzgwZTY2ZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImI5MDI1OWU0NjNmZjM4ODZjMmYxMjY4NzkzMjU1ZjAwYTkwOThlZGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhcHAuc3VwZXJhZG1pbmF1dGguYmFja2VuZHMuU3VwZXJBZG1pbkF1dGhCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2015-12-23 06:42:47.844739+01
yt2mcwfe1x24k8lb2stf60zjvd538m1u	Y2IyY2JhYmI2MjgyYmNmZTZhMGNjNWE4ODAwMGQxYmE0NzY1M2VhODp7Il9hdXRoX3VzZXJfaGFzaCI6IjJkZmE5NmU2ZDE4YzhmYTI5OTc2MmY4OTZjOTc5OTQyZGVlNGExYzMiLCJfYXV0aF91c2VyX2lkIjoiNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcC5zaXRlYWRtaW5hdXRoLmJhY2tlbmRzLkFkbWluQXV0aEJhY2tlbmQifQ==	2015-12-01 06:18:10.317381+01
ap4pqf2yyd79krlewvkvacswb50pxp2g	MDBjNTc3ODJmZjIwY2NkMmMwNWNlYWI2Nzk0MDE2Zjk5ODk3MTUzNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAyNTIwZTBlYjBjYzNmOWJmMzA0ZTZiYzA5NDNkYzVjN2RhODRjNDAiLCJwbGF5cyI6W10sIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcC5zaXRlYXV0aC5iYWNrZW5kcy5Vc2VyQXV0aEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiNCJ9	2015-12-06 22:56:49.193253+01
0cqpr73kvx7wgvx22r8umlim7ch93fth	N2NjOTc5ZmQ5NWY0ZGU4NTg1MmU0ODI1MjQzNjM1ZTIxN2M2MzAyYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImQwZGMzNzNiZjZlMjQ4Zjk1NmNlNGI4M2FmZGIwYzU4NTcxYTlhYTgiLCJwbGF5cyI6W10sIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcC5zaXRlYXV0aC5iYWNrZW5kcy5Vc2VyQXV0aEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiNiJ9	2015-12-23 07:13:24.600337+01
94krrpz1fi5wj784nydf6eh6crj2p1sm	MWY4Y2JhMmMxNTkzZGQ4ZDk3NTAyMTcwNjcyNTQxN2UxOTY0ZGE4Zjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAyNTIwZTBlYjBjYzNmOWJmMzA0ZTZiYzA5NDNkYzVjN2RhODRjNDAiLCJwbGF5cyI6W3siYW1vdW50IjozNiwibnVtYmVyIjoiMjUgMzYiLCJsb3R0ZXJ5X2lkIjoiMyJ9LHsiYW1vdW50Ijo2MywibnVtYmVyIjoiMjUgMzYgNDUiLCJsb3R0ZXJ5X2lkIjoiMyJ9LHsiYW1vdW50IjozLCJudW1iZXIiOiI0NyAzNiIsImxvdHRlcnlfaWQiOiIzIn0seyJhbW91bnQiOjMsIm51bWJlciI6IjIyIDIyIiwibG90dGVyeV9pZCI6IjMifSx7ImFtb3VudCI6MywibnVtYmVyIjoiMTQiLCJsb3R0ZXJ5X2lkIjoiMyJ9LHsiYW1vdW50IjozOSwibnVtYmVyIjoiMTIgMzUiLCJsb3R0ZXJ5X2lkIjoiMyJ9LHsiYW1vdW50IjozLCJudW1iZXIiOiIxNyAyOCAzOSIsImxvdHRlcnlfaWQiOiIzIn0seyJhbW91bnQiOjU4LCJudW1iZXIiOiI1OCAzNiA3NSIsImxvdHRlcnlfaWQiOiIzIn1dLCJfYXV0aF91c2VyX2lkIjoiNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcC5zaXRlYXV0aC5iYWNrZW5kcy5Vc2VyQXV0aEJhY2tlbmQifQ==	2015-12-08 00:11:47.53342+01
k7isvq6ytm2ymlct3ux8lbtwtcpvrcta	YjE1NjU2MWI1ZWMxNTdkOTM3MzA1OTMwOWQ0MWNkYThlZTNjZTcyYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjJkZmE5NmU2ZDE4YzhmYTI5OTc2MmY4OTZjOTc5OTQyZGVlNGExYzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhcHAuc2l0ZWFkbWluYXV0aC5iYWNrZW5kcy5BZG1pbkF1dGhCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjQifQ==	2015-12-03 03:33:06.330193+01
7xh5g966xk5utz3wbmu8ro048ke9d7vg	OTMyNDVmMWU4ZjM1MzA5NWM5NTVhOGRlNzA4OWYxZDY1YzkzZThhMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImI3YTU2NmE3NTYzYzhjODAwNDMwYTc4MjYxNjlkMzg2M2U5NmZjZmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhcHAuc2l0ZWFkbWluYXV0aC5iYWNrZW5kcy5BZG1pbkF1dGhCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjUifQ==	2016-01-11 00:58:00.371308+01
5m0lcnsoz3v18o5vt9yj9xdp4rm3mgyc	ZGIxYmMzMGZhMWY1YTBlYjU5ZDZhNWYwYWRjMWM1Y2MxOGMwNDhmMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjMyMjZlYzk5YTBmZjdiMWM3ZTEyM2JhMjA0MzY3MmI0MjBiOWM2MjYiLCJwbGF5cyI6W10sIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcC5zaXRlYXV0aC5iYWNrZW5kcy5Vc2VyQXV0aEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiNSJ9	2016-01-11 01:00:11.268474+01
vvh2shswz6aac7npwuskhlsqdejpksrw	NWI3ZmRlYmVkNTUwZTlmYjk4OWJkZTRjYjU4NjRlMjdjM2E5MDhjZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjMyMjZlYzk5YTBmZjdiMWM3ZTEyM2JhMjA0MzY3MmI0MjBiOWM2MjYiLCJfYXV0aF91c2VyX2lkIjoiNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcC5zaXRlYXV0aC5iYWNrZW5kcy5Vc2VyQXV0aEJhY2tlbmQifQ==	2016-01-11 06:02:35.244723+01
gh1jm86fi6zdup7ousbodpcxzazjvxn7	NzVlYTZlMmVmOWM2YTY5OGYxMjM1ZTAyOTI0MWYzOTY0MTFiODliZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImI3YTU2NmE3NTYzYzhjODAwNDMwYTc4MjYxNjlkMzg2M2U5NmZjZmIiLCJfYXV0aF91c2VyX2lkIjoiNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcC5zaXRlYWRtaW5hdXRoLmJhY2tlbmRzLkFkbWluQXV0aEJhY2tlbmQifQ==	2016-01-11 00:40:39.084119+01
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: riffar
--

COPY django_site (id, domain, name) FROM stdin;
1	riffar.ru	riffar.ru
\.


--
-- Data for Name: lottery_lottery; Type: TABLE DATA; Schema: public; Owner: riffar
--

COPY lottery_lottery (id, name, min_number, max_number, min_amount, max_amount, open_time, close_time, created_by_id, is_available, payment_amount_first_place, payment_amount_second_place, payment_amount_third_place, payment_amount_first_and_second_place, payment_amount_first_and_third_place, payment_amount_second_and_third_place, payment_amount_triplets) FROM stdin;
1	Test Lottery	0	1000	0	1000	00:00:01	23:59:59	2	t	0.00	0.00	0.00	0.00	0.00	0.00	0.00
2	Loteria Nacional	0	99	1	1000	06:00:00	11:35:00	4	t	0.00	0.00	0.00	0.00	0.00	0.00	0.00
4	PALE	0	99	1	1000	23:30:00	23:45:00	4	t	0.00	0.00	0.00	0.00	0.00	0.00	0.00
3	Nacional	0	99	1	1000	01:05:00	23:59:00	4	t	50.00	20.00	10.00	70.00	70.00	70.00	100.00
9	Loteka	0	99	1	1000	00:01:00	21:38:00	5	t	50.00	20.00	1.00	1000.00	700.00	500.00	1000.00
7	Nacional Afternoon	0	99	1	1000	00:01:00	20:39:00	5	t	50.00	20.00	1.00	1000.00	700.00	500.00	1000.00
5	Nacional Morning	0	99	1	1000	00:01:00	21:39:00	5	t	50.00	20.00	1.00	1000.00	700.00	500.00	1000.00
8	Quiniela Pale	0	99	1	1000	00:01:00	21:39:00	5	t	50.00	20.00	1.00	1000.00	700.00	500.00	1000.00
6	Real	0	99	1	1000	00:01:00	21:40:00	5	t	50.00	20.00	1.00	1000.00	700.00	500.00	1000.00
\.


--
-- Data for Name: lottery_stopnumber; Type: TABLE DATA; Schema: public; Owner: riffar
--

COPY lottery_stopnumber (id, admin_id, number, date_created, lottery_id) FROM stdin;
1	2	44	2015-11-12 03:32:32.15021+01	1
2	2	33	2015-11-12 03:32:32.216134+01	1
\.


--
-- Data for Name: lottery_winningnumberlog; Type: TABLE DATA; Schema: public; Owner: riffar
--

COPY lottery_winningnumberlog (id, winning_numbers_first_place, winning_numbers_second_place, winning_numbers_third_place, date_created, lottery_id, date_of_report) FROM stdin;
1	66	44	22	2015-11-19 07:12:32.158341+01	3	\N
2	1	2	3	2015-11-20 02:50:12.110162+01	4	\N
3	30	40	50	2015-11-20 02:51:22.483737+01	3	\N
4	20	30	40	2015-11-20 02:52:21.40262+01	3	\N
5	22	47	77	2015-11-26 03:13:34.810987+01	3	\N
6	25	15	36	2015-12-08 01:20:40.488371+01	3	\N
7	25	15	30	2015-12-09 07:26:45.259285+01	2	2015-12-09 06:00:00+01
8	25	15	30	2015-12-09 07:28:21.444117+01	9	2015-12-09 06:00:00+01
9	25	15	30	2015-12-09 07:29:54.827082+01	5	2015-12-09 06:00:00+01
10	25	11	11	2015-12-09 07:30:51.43101+01	9	2015-12-08 06:00:00+01
11	25	11	23	2015-12-09 07:32:13.275343+01	5	2015-12-08 06:00:00+01
12	25	22	33	2015-12-09 07:32:23.482024+01	5	2015-12-09 06:00:00+01
\.


--
-- Data for Name: pagemap_page; Type: TABLE DATA; Schema: public; Owner: riffar
--

COPY pagemap_page (id, title, header, menu_name, menu_url, slug, url, sort, module_params, before_content, after_content, date_created, date_changed, seo_keywords, seo_description, is_enabled, is_in_menu, is_locked, adv_section_id, module_id, parent_id) FROM stdin;
\.


--
-- Data for Name: pagemap_pagemodule; Type: TABLE DATA; Schema: public; Owner: riffar
--

COPY pagemap_pagemodule (id, slug, name, name_en, is_enabled) FROM stdin;
\.


--
-- Data for Name: pin_adminpin; Type: TABLE DATA; Schema: public; Owner: riffar
--

COPY pin_adminpin (id, pin, is_active, date_created, created_by_id) FROM stdin;
6	l8aFHqGj	t	2015-11-10 04:08:55.727744+01	1
7	MDxffrxz	t	2015-11-10 04:15:28.264912+01	1
8	Ben	f	2015-11-11 23:25:32.47521+01	1
9	u8blUhXr	t	2015-11-11 23:25:56.155299+01	1
10	8tA5y4X8	t	2015-12-09 06:42:47.334281+01	1
\.


--
-- Data for Name: pin_pin; Type: TABLE DATA; Schema: public; Owner: riffar
--

COPY pin_pin (id, pin, is_active, date_created, created_by_id) FROM stdin;
7	m4xV0aKY	t	2015-11-10 04:15:56.957771+01	3
8	7zT7lwnb	t	2015-11-10 04:16:02.393638+01	3
9	aYLHDEzo	t	2015-11-10 04:19:30.599431+01	2
10	mTsmo9sM	t	2015-11-12 15:10:59.837523+01	4
11	e6IkTnLH	t	2015-12-09 06:44:57.601455+01	5
12	TP3rZiCm	t	2015-12-09 06:46:20.295989+01	5
13	iSGNiECz	t	2015-12-09 06:47:41.93497+01	5
\.


--
-- Data for Name: siteadmin_siteadmin; Type: TABLE DATA; Schema: public; Owner: riffar
--

COPY siteadmin_siteadmin (id, password, last_login, email, first_name, last_name, pin_id) FROM stdin;
3	pbkdf2_sha256$20000$YsLV7l8jkBrY$SIDLBHwqLNDkZ4aui46NJGZV9VoTjdPgyHtvY1wlOj4=	2015-11-10 04:21:44.370531+01	secondadmin@riffar.com	Second	Admin	7
2	pbkdf2_sha256$20000$0tacpmRGi37B$MBbtov3lyN2kALymKaReD6sgHv2g5aIRkleG+itzkok=	2015-11-14 03:04:34.846044+01	firstadmin@riffar.com	First	Admin	6
4	pbkdf2_sha256$20000$F4fdKZDmmLTc$qale+TohIPiGmJ1mC0uFqp2yB9DAmmGDKlNO8YBytYw=	2015-12-04 00:01:46.200246+01	ben@gmail.com	Ben	Ben	9
5	pbkdf2_sha256$20000$mVZWNFKqqZT8$8Ugenq9x/O4YA/N8WzZPpDTEIh5pZ3RHg0vMYHDMIdA=	2015-12-27 02:41:47.752995+01	ben1@gmail.com	ben	ben	10
\.


--
-- Data for Name: siteuser_siteuser; Type: TABLE DATA; Schema: public; Owner: riffar
--

COPY siteuser_siteuser (id, password, last_login, email, first_name, last_name, pin_id, commission_percent) FROM stdin;
3	pbkdf2_sha256$20000$NesJSap76cgl$eO8MGdb+5pHfoUWAR6SbsYRhjkiSVTBE4bJEAbfbEXw=	2015-11-13 13:36:15.616739+01	firstseller@riffar.com	First	Seller	9	18.00
4	pbkdf2_sha256$20000$QWseY7Zg2CBC$XzYXcYdPIo45rEVs9+KFxKtCov91da4E0q6JVxPXDms=	2015-12-08 01:18:47.486706+01	bt@gmail.com	BT	BT	10	18.00
7	pbkdf2_sha256$20000$PvWj5Mpk94SM$ZmEsGwz9zeuAGkKNUUFD+eWuuCXDWwGWjXgr33WLEdc=	2015-12-09 07:48:55.172412+01	seller_c@gmail.com	seller_c	seller_c	13	18.00
6	pbkdf2_sha256$20000$Dl3cpL9sUDS3$dFW62g5Kd3A88ZN1kzpb6iOeUzSNuZvs4eTzuyqARQk=	2015-12-28 00:30:43.371986+01	seller_b@gmail.com	seller_b	seller_b	12	18.00
5	pbkdf2_sha256$20000$ikzsqZqhKs48$iIa/uqtVGCqVrkooNxadEoTcwhOl8cVQS6H+m8TmNfY=	2015-12-28 00:37:13.332045+01	seller_a@gmail.com	seller_a	seller_a	11	18.00
\.


--
-- Data for Name: superadmin_superadmin; Type: TABLE DATA; Schema: public; Owner: riffar
--

COPY superadmin_superadmin (id, password, last_login, email, first_name, last_name) FROM stdin;
1	pbkdf2_sha256$20000$jVi0hFnPjAVX$B/fr0ssBd9j5RZlc5QiplSlmkgEUPiXaiXwMxkqxR+s=	2015-12-09 06:41:44.777538+01	superadmin@riffar.com	Super	Admin
\.


--
-- Data for Name: ticket_play; Type: TABLE DATA; Schema: public; Owner: riffar
--

COPY ticket_play (id, ticket_id, number, amount, lottery_id, date_created) FROM stdin;
5	4	11	33	1	2015-11-10 04:20:36.278074+01
6	5	25 36	1000	2	2015-11-12 15:48:06.700208+01
7	5	47 25	1000	2	2015-11-12 15:48:06.75819+01
8	5	74	1000	2	2015-11-12 15:48:06.781323+01
9	6	25	39	2	2015-11-12 16:29:13.927405+01
10	6	14 78	3	2	2015-11-12 16:29:13.9357+01
11	6	25 80	36	2	2015-11-12 16:29:13.943889+01
12	7	25	3	2	2015-11-12 16:30:33.979408+01
13	7	01	78	2	2015-11-12 16:30:33.987713+01
14	8	22	33	1	2015-11-12 16:43:33.207995+01
15	9	02	3	2	2015-11-12 16:45:02.723095+01
16	10	52	3	2	2015-11-12 16:46:30.305776+01
17	12	22	336	1	2015-11-13 13:36:36.890437+01
18	12	11 22	33	1	2015-11-13 13:36:36.948416+01
19	13	22	3	1	2015-11-13 13:37:04.172566+01
20	13	22 55	33	1	2015-11-13 13:37:04.185438+01
21	14	12	36	3	2015-11-13 18:36:35.241439+01
22	14	28 80	3	3	2015-11-13 18:36:35.253564+01
23	14	25	6	3	2015-11-13 18:36:35.266238+01
24	14	47	3	3	2015-11-13 18:36:35.278289+01
25	15	25	5	3	2015-11-13 18:41:31.953542+01
26	16	22	20	3	2015-11-15 19:25:21.462135+01
27	18	42	2	3	2015-11-15 19:48:11.602827+01
28	19	02	25	3	2015-11-15 20:45:53.158309+01
29	20	22	30	3	2015-11-19 07:12:02.666139+01
30	20	44	60	3	2015-11-19 07:12:02.717548+01
31	21	86 52	3	3	2015-11-20 02:30:15.263951+01
32	21	56	9	3	2015-11-20 02:30:15.319903+01
33	21	53	5	3	2015-11-20 02:30:15.330124+01
34	21	23	2	3	2015-11-20 02:30:15.344439+01
35	21	23	56	3	2015-11-20 02:30:15.355025+01
36	21	32	6	3	2015-11-20 02:30:15.363286+01
37	22	20	30	3	2015-11-20 02:51:08.095723+01
38	22	30	40	3	2015-11-20 02:51:08.11221+01
39	22	40	50	3	2015-11-20 02:51:08.120365+01
40	23	20 30	20	3	2015-11-20 03:03:30.560417+01
41	24	20 30 40	50	3	2015-11-20 03:04:30.056866+01
42	25	22	30	3	2015-11-26 03:13:21.884664+01
43	25	47	60	3	2015-11-26 03:13:21.946503+01
44	26	90	300	3	2015-11-26 03:15:20.053888+01
45	27	25	100	3	2015-12-08 01:19:30.730917+01
46	28	25	10	5	2015-12-09 07:11:07.278685+01
47	28	15	10	5	2015-12-09 07:11:07.293272+01
48	29	14	36	5	2015-12-09 07:12:14.568722+01
49	29	25	1	5	2015-12-09 07:12:14.585431+01
50	30	25	3	5	2015-12-09 07:13:14.174798+01
51	30	75	58	5	2015-12-09 07:13:14.183176+01
52	31	02	20	7	2015-12-28 00:46:30.434577+01
53	31	05	20	9	2015-12-28 00:46:30.483894+01
54	32	55	30	9	2015-12-28 00:52:27.055708+01
55	32	14	2	7	2015-12-28 00:52:27.064109+01
\.


--
-- Data for Name: ticket_ticket; Type: TABLE DATA; Schema: public; Owner: riffar
--

COPY ticket_ticket (id, number, user_id, date_created) FROM stdin;
4	1	3	2015-11-10 04:20:36.258152+01
5	1	4	2015-11-12 15:48:06.612014+01
6	2	4	2015-11-12 16:29:13.908022+01
7	3	4	2015-11-12 16:30:33.939842+01
8	2	3	2015-11-12 16:43:33.187484+01
9	4	4	2015-11-12 16:45:02.698195+01
10	5	4	2015-11-12 16:46:30.264536+01
11	6	4	2015-11-12 16:55:54.614678+01
12	3	3	2015-11-13 13:36:36.794828+01
13	4	3	2015-11-13 13:37:04.154012+01
14	7	4	2015-11-13 18:36:35.195254+01
15	8	4	2015-11-13 18:41:31.942547+01
16	9	4	2015-11-15 19:25:21.385595+01
17	10	4	2015-11-15 19:26:12.552672+01
18	11	4	2015-11-15 19:48:11.558226+01
19	12	4	2015-11-15 20:45:53.145206+01
20	13	4	2015-11-19 07:12:02.577338+01
21	14	4	2015-11-20 02:30:15.113875+01
22	15	4	2015-11-20 02:51:08.00721+01
23	16	4	2015-11-20 03:03:30.54753+01
24	17	4	2015-11-20 03:04:30.036414+01
25	18	4	2015-11-26 03:13:21.755455+01
26	19	4	2015-11-26 03:15:20.034704+01
27	20	4	2015-12-08 01:19:30.659625+01
28	1	7	2015-12-09 07:11:07.263395+01
29	1	5	2015-12-09 07:12:14.557366+01
30	1	6	2015-12-09 07:13:14.161879+01
31	2	5	2015-12-28 00:46:30.359981+01
32	3	5	2015-12-28 00:52:27.037779+01
\.


--
-- Data for Name: watson_searchentry; Type: TABLE DATA; Schema: public; Owner: riffar
--

COPY watson_searchentry (id, engine_slug, object_id, object_id_int, title, description, content, url, meta_encoded, content_type_id) FROM stdin;
\.


--
-- Name: adv_adv_pkey; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY adv_adv
    ADD CONSTRAINT adv_adv_pkey PRIMARY KEY (id);


--
-- Name: adv_adv_section_adv_id_advsection_id_key; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY adv_adv_section
    ADD CONSTRAINT adv_adv_section_adv_id_advsection_id_key UNIQUE (adv_id, advsection_id);


--
-- Name: adv_adv_section_pkey; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY adv_adv_section
    ADD CONSTRAINT adv_adv_section_pkey PRIMARY KEY (id);


--
-- Name: adv_advplace_pkey; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY adv_advplace
    ADD CONSTRAINT adv_advplace_pkey PRIMARY KEY (id);


--
-- Name: adv_advplace_slug_key; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY adv_advplace
    ADD CONSTRAINT adv_advplace_slug_key UNIQUE (slug);


--
-- Name: adv_advsection_pkey; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY adv_advsection
    ADD CONSTRAINT adv_advsection_pkey PRIMARY KEY (id);


--
-- Name: adv_click_pkey; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY adv_click
    ADD CONSTRAINT adv_click_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: cms_cmsmodule_pkey; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY cms_cmsmodule
    ADD CONSTRAINT cms_cmsmodule_pkey PRIMARY KEY (id);


--
-- Name: cms_cmsmodule_slug_key; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY cms_cmsmodule
    ADD CONSTRAINT cms_cmsmodule_slug_key UNIQUE (slug);


--
-- Name: cms_cmsmodule_user_cmsmodule_id_user_id_key; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY cms_cmsmodule_user
    ADD CONSTRAINT cms_cmsmodule_user_cmsmodule_id_user_id_key UNIQUE (cmsmodule_id, user_id);


--
-- Name: cms_cmsmodule_user_pkey; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY cms_cmsmodule_user
    ADD CONSTRAINT cms_cmsmodule_user_pkey PRIMARY KEY (id);


--
-- Name: cms_cmsmodulegroup_pkey; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY cms_cmsmodulegroup
    ADD CONSTRAINT cms_cmsmodulegroup_pkey PRIMARY KEY (id);


--
-- Name: cms_cmsmodulegroup_slug_key; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY cms_cmsmodulegroup
    ADD CONSTRAINT cms_cmsmodulegroup_slug_key UNIQUE (slug);


--
-- Name: cms_file_pkey; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY cms_file
    ADD CONSTRAINT cms_file_pkey PRIMARY KEY (id);


--
-- Name: cms_folder_name_5e2f9a7b69b256a4_uniq; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY cms_folder
    ADD CONSTRAINT cms_folder_name_5e2f9a7b69b256a4_uniq UNIQUE (name);


--
-- Name: cms_folder_pkey; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY cms_folder
    ADD CONSTRAINT cms_folder_pkey PRIMARY KEY (id);


--
-- Name: cms_sitesettings_name_key; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY cms_sitesettings
    ADD CONSTRAINT cms_sitesettings_name_key UNIQUE (name);


--
-- Name: cms_sitesettings_pkey; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY cms_sitesettings
    ADD CONSTRAINT cms_sitesettings_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_45f3b1d93ec8c61c_uniq; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_45f3b1d93ec8c61c_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: lottery_lottery_pkey; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY lottery_lottery
    ADD CONSTRAINT lottery_lottery_pkey PRIMARY KEY (id);


--
-- Name: lottery_stopnumber_pkey; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY lottery_stopnumber
    ADD CONSTRAINT lottery_stopnumber_pkey PRIMARY KEY (id);


--
-- Name: lottery_winningnumberlog_pkey; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY lottery_winningnumberlog
    ADD CONSTRAINT lottery_winningnumberlog_pkey PRIMARY KEY (id);


--
-- Name: pagemap_page_module_id_6cc9582e197a1f6d_uniq; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY pagemap_page
    ADD CONSTRAINT pagemap_page_module_id_6cc9582e197a1f6d_uniq UNIQUE (module_id, slug);


--
-- Name: pagemap_page_pkey; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY pagemap_page
    ADD CONSTRAINT pagemap_page_pkey PRIMARY KEY (id);


--
-- Name: pagemap_pagemodule_pkey; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY pagemap_pagemodule
    ADD CONSTRAINT pagemap_pagemodule_pkey PRIMARY KEY (id);


--
-- Name: pagemap_pagemodule_slug_key; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY pagemap_pagemodule
    ADD CONSTRAINT pagemap_pagemodule_slug_key UNIQUE (slug);


--
-- Name: pin_adminpin_pin_key; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY pin_adminpin
    ADD CONSTRAINT pin_adminpin_pin_key UNIQUE (pin);


--
-- Name: pin_adminpin_pkey; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY pin_adminpin
    ADD CONSTRAINT pin_adminpin_pkey PRIMARY KEY (id);


--
-- Name: pin_pin_pin_key; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY pin_pin
    ADD CONSTRAINT pin_pin_pin_key UNIQUE (pin);


--
-- Name: pin_pin_pkey; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY pin_pin
    ADD CONSTRAINT pin_pin_pkey PRIMARY KEY (id);


--
-- Name: siteadmin_siteadmin_pkey; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY siteadmin_siteadmin
    ADD CONSTRAINT siteadmin_siteadmin_pkey PRIMARY KEY (id);


--
-- Name: siteuser_siteuser_pkey; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY siteuser_siteuser
    ADD CONSTRAINT siteuser_siteuser_pkey PRIMARY KEY (id);


--
-- Name: superadmin_superadmin_pkey; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY superadmin_superadmin
    ADD CONSTRAINT superadmin_superadmin_pkey PRIMARY KEY (id);


--
-- Name: ticket_play_pkey; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY ticket_play
    ADD CONSTRAINT ticket_play_pkey PRIMARY KEY (id);


--
-- Name: ticket_ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY ticket_ticket
    ADD CONSTRAINT ticket_ticket_pkey PRIMARY KEY (id);


--
-- Name: watson_searchentry_pkey; Type: CONSTRAINT; Schema: public; Owner: riffar; Tablespace: 
--

ALTER TABLE ONLY watson_searchentry
    ADD CONSTRAINT watson_searchentry_pkey PRIMARY KEY (id);


--
-- Name: adv_adv_62becf4a; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX adv_adv_62becf4a ON adv_adv USING btree (place_id);


--
-- Name: adv_adv_section_3a60b0b8; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX adv_adv_section_3a60b0b8 ON adv_adv_section USING btree (adv_id);


--
-- Name: adv_adv_section_cf27cf7f; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX adv_adv_section_cf27cf7f ON adv_adv_section USING btree (advsection_id);


--
-- Name: adv_advplace_slug_2fa5cdd9485b4372_like; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX adv_advplace_slug_2fa5cdd9485b4372_like ON adv_advplace USING btree (slug varchar_pattern_ops);


--
-- Name: adv_click_411f412e; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX adv_click_411f412e ON adv_click USING btree (ad_id);


--
-- Name: auth_group_name_253ae2a6331666e8_like; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX auth_group_name_253ae2a6331666e8_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_51b3b110094b8aae_like; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX auth_user_username_51b3b110094b8aae_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: cms_cmsmodule_0e939a4f; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX cms_cmsmodule_0e939a4f ON cms_cmsmodule USING btree (group_id);


--
-- Name: cms_cmsmodule_slug_401e30b585dc7f80_like; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX cms_cmsmodule_slug_401e30b585dc7f80_like ON cms_cmsmodule USING btree (slug varchar_pattern_ops);


--
-- Name: cms_cmsmodule_user_e8701ad4; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX cms_cmsmodule_user_e8701ad4 ON cms_cmsmodule_user USING btree (user_id);


--
-- Name: cms_cmsmodule_user_ea668af0; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX cms_cmsmodule_user_ea668af0 ON cms_cmsmodule_user USING btree (cmsmodule_id);


--
-- Name: cms_cmsmodulegroup_89e6d2b3; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX cms_cmsmodulegroup_89e6d2b3 ON cms_cmsmodulegroup USING btree (fa);


--
-- Name: cms_cmsmodulegroup_fa_3e5f9965380d7514_like; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX cms_cmsmodulegroup_fa_3e5f9965380d7514_like ON cms_cmsmodulegroup USING btree (fa varchar_pattern_ops);


--
-- Name: cms_cmsmodulegroup_slug_751a82ce576d27a0_like; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX cms_cmsmodulegroup_slug_751a82ce576d27a0_like ON cms_cmsmodulegroup USING btree (slug varchar_pattern_ops);


--
-- Name: cms_file_a8a44dbb; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX cms_file_a8a44dbb ON cms_file USING btree (folder_id);


--
-- Name: cms_sitesettings_name_2ae4c46388f73494_like; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX cms_sitesettings_name_2ae4c46388f73494_like ON cms_sitesettings USING btree (name varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_461cfeaa630ca218_like; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX django_session_session_key_461cfeaa630ca218_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: lottery_lottery_e93cb7eb; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX lottery_lottery_e93cb7eb ON lottery_lottery USING btree (created_by_id);


--
-- Name: lottery_stopnumber_156f41ed; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX lottery_stopnumber_156f41ed ON lottery_stopnumber USING btree (admin_id);


--
-- Name: lottery_stopnumber_496ce04d; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX lottery_stopnumber_496ce04d ON lottery_stopnumber USING btree (lottery_id);


--
-- Name: lottery_winningnumberlog_496ce04d; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX lottery_winningnumberlog_496ce04d ON lottery_winningnumberlog USING btree (lottery_id);


--
-- Name: pagemap_page_2dbcba41; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX pagemap_page_2dbcba41 ON pagemap_page USING btree (slug);


--
-- Name: pagemap_page_46d4bb88; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX pagemap_page_46d4bb88 ON pagemap_page USING btree (adv_section_id);


--
-- Name: pagemap_page_6be37982; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX pagemap_page_6be37982 ON pagemap_page USING btree (parent_id);


--
-- Name: pagemap_page_c9799665; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX pagemap_page_c9799665 ON pagemap_page USING btree (module_id);


--
-- Name: pagemap_page_slug_4619efa64f3e12d9_like; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX pagemap_page_slug_4619efa64f3e12d9_like ON pagemap_page USING btree (slug varchar_pattern_ops);


--
-- Name: pagemap_pagemodule_slug_459ffaafb746357_like; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX pagemap_pagemodule_slug_459ffaafb746357_like ON pagemap_pagemodule USING btree (slug varchar_pattern_ops);


--
-- Name: pin_adminpin_e93cb7eb; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX pin_adminpin_e93cb7eb ON pin_adminpin USING btree (created_by_id);


--
-- Name: pin_adminpin_pin_655b9afc8d77a549_like; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX pin_adminpin_pin_655b9afc8d77a549_like ON pin_adminpin USING btree (pin varchar_pattern_ops);


--
-- Name: pin_pin_e93cb7eb; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX pin_pin_e93cb7eb ON pin_pin USING btree (created_by_id);


--
-- Name: pin_pin_pin_4da42fe640fa63ed_like; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX pin_pin_pin_4da42fe640fa63ed_like ON pin_pin USING btree (pin varchar_pattern_ops);


--
-- Name: siteadmin_siteadmin_8c95965a; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX siteadmin_siteadmin_8c95965a ON siteadmin_siteadmin USING btree (pin_id);


--
-- Name: siteuser_siteuser_8c95965a; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX siteuser_siteuser_8c95965a ON siteuser_siteuser USING btree (pin_id);


--
-- Name: ticket_play_496ce04d; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX ticket_play_496ce04d ON ticket_play USING btree (lottery_id);


--
-- Name: ticket_play_649b92cd; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX ticket_play_649b92cd ON ticket_play USING btree (ticket_id);


--
-- Name: ticket_ticket_e8701ad4; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX ticket_ticket_e8701ad4 ON ticket_ticket USING btree (user_id);


--
-- Name: watson_searchentry_0c9ba3a3; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX watson_searchentry_0c9ba3a3 ON watson_searchentry USING btree (object_id_int);


--
-- Name: watson_searchentry_14f8682a; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX watson_searchentry_14f8682a ON watson_searchentry USING btree (engine_slug);


--
-- Name: watson_searchentry_417f1b1c; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX watson_searchentry_417f1b1c ON watson_searchentry USING btree (content_type_id);


--
-- Name: watson_searchentry_engine_slug_25599183916b0a2b_like; Type: INDEX; Schema: public; Owner: riffar; Tablespace: 
--

CREATE INDEX watson_searchentry_engine_slug_25599183916b0a2b_like ON watson_searchentry USING btree (engine_slug varchar_pattern_ops);


--
-- Name: adv_adv_place_id_32733cc98fcd3c88_fk_adv_advplace_id; Type: FK CONSTRAINT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY adv_adv
    ADD CONSTRAINT adv_adv_place_id_32733cc98fcd3c88_fk_adv_advplace_id FOREIGN KEY (place_id) REFERENCES adv_advplace(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: adv_adv_sec_advsection_id_58a73aa6d2a4eb3e_fk_adv_advsection_id; Type: FK CONSTRAINT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY adv_adv_section
    ADD CONSTRAINT adv_adv_sec_advsection_id_58a73aa6d2a4eb3e_fk_adv_advsection_id FOREIGN KEY (advsection_id) REFERENCES adv_advsection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: adv_adv_section_adv_id_3ca5702ce3cdb5d8_fk_adv_adv_id; Type: FK CONSTRAINT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY adv_adv_section
    ADD CONSTRAINT adv_adv_section_adv_id_3ca5702ce3cdb5d8_fk_adv_adv_id FOREIGN KEY (adv_id) REFERENCES adv_adv(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: adv_click_ad_id_3d1c92f40633ba08_fk_adv_adv_id; Type: FK CONSTRAINT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY adv_click
    ADD CONSTRAINT adv_click_ad_id_3d1c92f40633ba08_fk_adv_adv_id FOREIGN KEY (ad_id) REFERENCES adv_adv(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_content_type_id_508cf46651277a81_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_content_type_id_508cf46651277a81_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_cmsmod_group_id_3533e35784afaab2_fk_cms_cmsmodulegroup_slug; Type: FK CONSTRAINT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY cms_cmsmodule
    ADD CONSTRAINT cms_cmsmod_group_id_3533e35784afaab2_fk_cms_cmsmodulegroup_slug FOREIGN KEY (group_id) REFERENCES cms_cmsmodulegroup(slug) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_cmsmodule_cmsmodule_id_1296c4e8f4ec3cab_fk_cms_cmsmodule_id; Type: FK CONSTRAINT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY cms_cmsmodule_user
    ADD CONSTRAINT cms_cmsmodule_cmsmodule_id_1296c4e8f4ec3cab_fk_cms_cmsmodule_id FOREIGN KEY (cmsmodule_id) REFERENCES cms_cmsmodule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_cmsmodule_user_user_id_4d9ca26b10900150_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY cms_cmsmodule_user
    ADD CONSTRAINT cms_cmsmodule_user_user_id_4d9ca26b10900150_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_file_folder_id_7ecddaaf150b054_fk_cms_folder_id; Type: FK CONSTRAINT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY cms_file
    ADD CONSTRAINT cms_file_folder_id_7ecddaaf150b054_fk_cms_folder_id FOREIGN KEY (folder_id) REFERENCES cms_folder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djan_content_type_id_697914295151027a_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT djan_content_type_id_697914295151027a_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: lottery_created_by_id_1e763ac4cec1086_fk_siteadmin_siteadmin_id; Type: FK CONSTRAINT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY lottery_lottery
    ADD CONSTRAINT lottery_created_by_id_1e763ac4cec1086_fk_siteadmin_siteadmin_id FOREIGN KEY (created_by_id) REFERENCES siteadmin_siteadmin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: lottery_stop_admin_id_570dc8534a1059d_fk_siteadmin_siteadmin_id; Type: FK CONSTRAINT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY lottery_stopnumber
    ADD CONSTRAINT lottery_stop_admin_id_570dc8534a1059d_fk_siteadmin_siteadmin_id FOREIGN KEY (admin_id) REFERENCES siteadmin_siteadmin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: lottery_stopn_lottery_id_4ef86c6f6297739d_fk_lottery_lottery_id; Type: FK CONSTRAINT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY lottery_stopnumber
    ADD CONSTRAINT lottery_stopn_lottery_id_4ef86c6f6297739d_fk_lottery_lottery_id FOREIGN KEY (lottery_id) REFERENCES lottery_lottery(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: lottery_winni_lottery_id_3ab5ebf035413055_fk_lottery_lottery_id; Type: FK CONSTRAINT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY lottery_winningnumberlog
    ADD CONSTRAINT lottery_winni_lottery_id_3ab5ebf035413055_fk_lottery_lottery_id FOREIGN KEY (lottery_id) REFERENCES lottery_lottery(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pagemap_pa_adv_section_id_11861f614990d4e7_fk_adv_advsection_id; Type: FK CONSTRAINT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY pagemap_page
    ADD CONSTRAINT pagemap_pa_adv_section_id_11861f614990d4e7_fk_adv_advsection_id FOREIGN KEY (adv_section_id) REFERENCES adv_advsection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pagemap_pag_module_id_4d4285b7096333a5_fk_pagemap_pagemodule_id; Type: FK CONSTRAINT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY pagemap_page
    ADD CONSTRAINT pagemap_pag_module_id_4d4285b7096333a5_fk_pagemap_pagemodule_id FOREIGN KEY (module_id) REFERENCES pagemap_pagemodule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pagemap_page_parent_id_30031fbe76883bed_fk_pagemap_page_id; Type: FK CONSTRAINT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY pagemap_page
    ADD CONSTRAINT pagemap_page_parent_id_30031fbe76883bed_fk_pagemap_page_id FOREIGN KEY (parent_id) REFERENCES pagemap_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pin__created_by_id_3fe79d2b1e91bb22_fk_superadmin_superadmin_id; Type: FK CONSTRAINT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY pin_adminpin
    ADD CONSTRAINT pin__created_by_id_3fe79d2b1e91bb22_fk_superadmin_superadmin_id FOREIGN KEY (created_by_id) REFERENCES superadmin_superadmin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pin_pi_created_by_id_3249d2971546edc6_fk_siteadmin_siteadmin_id; Type: FK CONSTRAINT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY pin_pin
    ADD CONSTRAINT pin_pi_created_by_id_3249d2971546edc6_fk_siteadmin_siteadmin_id FOREIGN KEY (created_by_id) REFERENCES siteadmin_siteadmin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: siteadmin_siteadmin_pin_id_6fc87671cd64af52_fk_pin_adminpin_id; Type: FK CONSTRAINT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY siteadmin_siteadmin
    ADD CONSTRAINT siteadmin_siteadmin_pin_id_6fc87671cd64af52_fk_pin_adminpin_id FOREIGN KEY (pin_id) REFERENCES pin_adminpin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: siteuser_siteuser_pin_id_1e2cb44c464cbfa2_fk_pin_pin_id; Type: FK CONSTRAINT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY siteuser_siteuser
    ADD CONSTRAINT siteuser_siteuser_pin_id_1e2cb44c464cbfa2_fk_pin_pin_id FOREIGN KEY (pin_id) REFERENCES pin_pin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ticket_play_lottery_id_7d0333a546819904_fk_lottery_lottery_id; Type: FK CONSTRAINT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY ticket_play
    ADD CONSTRAINT ticket_play_lottery_id_7d0333a546819904_fk_lottery_lottery_id FOREIGN KEY (lottery_id) REFERENCES lottery_lottery(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ticket_play_ticket_id_25e430ec1d1886ae_fk_ticket_ticket_id; Type: FK CONSTRAINT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY ticket_play
    ADD CONSTRAINT ticket_play_ticket_id_25e430ec1d1886ae_fk_ticket_ticket_id FOREIGN KEY (ticket_id) REFERENCES ticket_ticket(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ticket_ticket_user_id_d663e9cda19b229_fk_siteuser_siteuser_id; Type: FK CONSTRAINT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY ticket_ticket
    ADD CONSTRAINT ticket_ticket_user_id_d663e9cda19b229_fk_siteuser_siteuser_id FOREIGN KEY (user_id) REFERENCES siteuser_siteuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wats_content_type_id_1dcb4248d8b97b31_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: riffar
--

ALTER TABLE ONLY watson_searchentry
    ADD CONSTRAINT wats_content_type_id_1dcb4248d8b97b31_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

