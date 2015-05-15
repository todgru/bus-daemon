--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: locations; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE locations (
    id integer NOT NULL,
    expires bigint,
    signmessage character varying,
    servicedate bigint,
    loadpercentage integer,
    latitude double precision,
    nextstopseq integer,
    type character varying,
    blockid integer,
    signmessagelong character varying,
    lastlocid integer,
    nextlocid integer,
    locationinscheduleday integer,
    newtrip boolean,
    longitude double precision,
    direction integer,
    incongestion character varying,
    routenumber integer,
    bearing integer,
    garage character varying,
    tripid character varying,
    delay double precision,
    extrablockid character varying,
    messagecode integer,
    laststopseq integer,
    vehicleid integer,
    "time" bigint,
    offroute boolean
);


ALTER TABLE locations OWNER TO admin;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE locations_id_seq OWNER TO admin;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE locations_id_seq OWNED BY locations.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY locations ALTER COLUMN id SET DEFAULT nextval('locations_id_seq'::regclass);


--
-- PostgreSQL database dump complete
--

