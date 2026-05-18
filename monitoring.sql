--
-- PostgreSQL database dump
--

\restrict mP5If8njE0dcR4YCoZvxrs3Zp1WqUPiUjzFyxeqEbYvD0srbmohKxfdTip4SA35

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-05-18 21:42:01

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
-- TOC entry 5 (class 2615 OID 25585)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 5376 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 230 (class 1259 OID 25647)
-- Name: actiontype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actiontype (
    action_type_id integer NOT NULL,
    type_name character varying(50) NOT NULL
);


ALTER TABLE public.actiontype OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 25646)
-- Name: actiontype_action_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.actiontype_action_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.actiontype_action_type_id_seq OWNER TO postgres;

--
-- TOC entry 5378 (class 0 OID 0)
-- Dependencies: 229
-- Name: actiontype_action_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.actiontype_action_type_id_seq OWNED BY public.actiontype.action_type_id;


--
-- TOC entry 244 (class 1259 OID 25726)
-- Name: asset; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asset (
    asset_id integer NOT NULL,
    asset_name character varying(100) NOT NULL,
    ip_address inet,
    asset_type_id integer NOT NULL,
    department_id integer,
    commissioning_date date,
    sla_id integer
);


ALTER TABLE public.asset OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 25725)
-- Name: asset_asset_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.asset_asset_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.asset_asset_id_seq OWNER TO postgres;

--
-- TOC entry 5379 (class 0 OID 0)
-- Dependencies: 243
-- Name: asset_asset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.asset_asset_id_seq OWNED BY public.asset.asset_id;


--
-- TOC entry 224 (class 1259 OID 25614)
-- Name: assettype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assettype (
    asset_type_id integer NOT NULL,
    type_name character varying(50) NOT NULL
);


ALTER TABLE public.assettype OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 25613)
-- Name: assettype_asset_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.assettype_asset_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.assettype_asset_type_id_seq OWNER TO postgres;

--
-- TOC entry 5380 (class 0 OID 0)
-- Dependencies: 223
-- Name: assettype_asset_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.assettype_asset_type_id_seq OWNED BY public.assettype.asset_type_id;


--
-- TOC entry 268 (class 1259 OID 26006)
-- Name: assetvulnerability; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assetvulnerability (
    vuln_id integer NOT NULL,
    asset_id integer NOT NULL,
    cve_id character varying(20) NOT NULL,
    severity character varying(20) NOT NULL,
    detected_at date DEFAULT CURRENT_DATE NOT NULL,
    CONSTRAINT assetvulnerability_severity_check CHECK (((severity)::text = ANY ((ARRAY['critical'::character varying, 'high'::character varying, 'medium'::character varying, 'low'::character varying])::text[])))
);


ALTER TABLE public.assetvulnerability OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 26005)
-- Name: assetvulnerability_vuln_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.assetvulnerability_vuln_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.assetvulnerability_vuln_id_seq OWNER TO postgres;

--
-- TOC entry 5381 (class 0 OID 0)
-- Dependencies: 267
-- Name: assetvulnerability_vuln_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.assetvulnerability_vuln_id_seq OWNED BY public.assetvulnerability.vuln_id;


--
-- TOC entry 262 (class 1259 OID 25949)
-- Name: auditlog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auditlog (
    log_id integer NOT NULL,
    employee_id integer NOT NULL,
    action character varying(200) NOT NULL,
    action_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.auditlog OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 25948)
-- Name: auditlog_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auditlog_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auditlog_log_id_seq OWNER TO postgres;

--
-- TOC entry 5382 (class 0 OID 0)
-- Dependencies: 261
-- Name: auditlog_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auditlog_log_id_seq OWNED BY public.auditlog.log_id;


--
-- TOC entry 226 (class 1259 OID 25625)
-- Name: department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department (
    department_id integer NOT NULL,
    dept_name character varying(100) NOT NULL,
    location character varying(100)
);


ALTER TABLE public.department OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 25624)
-- Name: department_department_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.department_department_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.department_department_id_seq OWNER TO postgres;

--
-- TOC entry 5383 (class 0 OID 0)
-- Dependencies: 225
-- Name: department_department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.department_department_id_seq OWNED BY public.department.department_id;


--
-- TOC entry 250 (class 1259 OID 25801)
-- Name: detectionrule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detectionrule (
    rule_id integer NOT NULL,
    rule_name character varying(100) NOT NULL,
    rule_type_id integer NOT NULL,
    rule_condition text NOT NULL
);


ALTER TABLE public.detectionrule OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 25800)
-- Name: detectionrule_rule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.detectionrule_rule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.detectionrule_rule_id_seq OWNER TO postgres;

--
-- TOC entry 5384 (class 0 OID 0)
-- Dependencies: 249
-- Name: detectionrule_rule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.detectionrule_rule_id_seq OWNED BY public.detectionrule.rule_id;


--
-- TOC entry 246 (class 1259 OID 25753)
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    employee_id integer NOT NULL,
    full_name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    role_id integer NOT NULL,
    group_id integer,
    team_id integer
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 25752)
-- Name: employee_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employee_employee_id_seq OWNER TO postgres;

--
-- TOC entry 5385 (class 0 OID 0)
-- Dependencies: 245
-- Name: employee_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_employee_id_seq OWNED BY public.employee.employee_id;


--
-- TOC entry 240 (class 1259 OID 25704)
-- Name: employeegroup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employeegroup (
    group_id integer NOT NULL,
    group_name character varying(100) NOT NULL
);


ALTER TABLE public.employeegroup OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 25703)
-- Name: employeegroup_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employeegroup_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employeegroup_group_id_seq OWNER TO postgres;

--
-- TOC entry 5386 (class 0 OID 0)
-- Dependencies: 239
-- Name: employeegroup_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employeegroup_group_id_seq OWNED BY public.employeegroup.group_id;


--
-- TOC entry 252 (class 1259 OID 25819)
-- Name: eventsource; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.eventsource (
    source_id integer NOT NULL,
    source_name character varying(100) NOT NULL,
    source_type_id integer NOT NULL
);


ALTER TABLE public.eventsource OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 25818)
-- Name: eventsource_source_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.eventsource_source_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.eventsource_source_id_seq OWNER TO postgres;

--
-- TOC entry 5387 (class 0 OID 0)
-- Dependencies: 251
-- Name: eventsource_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.eventsource_source_id_seq OWNED BY public.eventsource.source_id;


--
-- TOC entry 256 (class 1259 OID 25854)
-- Name: incident; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.incident (
    incident_id integer NOT NULL,
    title character varying(200) NOT NULL,
    description text,
    detection_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    closure_time timestamp without time zone,
    status_id integer NOT NULL,
    priority_id integer NOT NULL,
    affected_asset_id integer,
    assigned_employee_id integer,
    detection_rule_id integer,
    primary_threat_id integer,
    escalation_required boolean DEFAULT false,
    CONSTRAINT incident_check CHECK (((closure_time IS NULL) OR (closure_time >= detection_time)))
);


ALTER TABLE public.incident OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 25853)
-- Name: incident_incident_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.incident_incident_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.incident_incident_id_seq OWNER TO postgres;

--
-- TOC entry 5388 (class 0 OID 0)
-- Dependencies: 255
-- Name: incident_incident_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.incident_incident_id_seq OWNED BY public.incident.incident_id;


--
-- TOC entry 270 (class 1259 OID 26025)
-- Name: incidentattachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.incidentattachment (
    attachment_id integer NOT NULL,
    incident_id integer NOT NULL,
    file_name character varying(255) NOT NULL,
    file_path text NOT NULL,
    uploaded_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    uploaded_by integer
);


ALTER TABLE public.incidentattachment OWNER TO postgres;

--
-- TOC entry 269 (class 1259 OID 26024)
-- Name: incidentattachment_attachment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.incidentattachment_attachment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.incidentattachment_attachment_id_seq OWNER TO postgres;

--
-- TOC entry 5389 (class 0 OID 0)
-- Dependencies: 269
-- Name: incidentattachment_attachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.incidentattachment_attachment_id_seq OWNED BY public.incidentattachment.attachment_id;


--
-- TOC entry 264 (class 1259 OID 25966)
-- Name: incidentcomment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.incidentcomment (
    comment_id integer NOT NULL,
    incident_id integer NOT NULL,
    employee_id integer NOT NULL,
    comment_text text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.incidentcomment OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 25965)
-- Name: incidentcomment_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.incidentcomment_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.incidentcomment_comment_id_seq OWNER TO postgres;

--
-- TOC entry 5390 (class 0 OID 0)
-- Dependencies: 263
-- Name: incidentcomment_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.incidentcomment_comment_id_seq OWNED BY public.incidentcomment.comment_id;


--
-- TOC entry 274 (class 1259 OID 26082)
-- Name: incidentescalation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.incidentescalation (
    escalation_id integer NOT NULL,
    incident_id integer NOT NULL,
    escalated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    escalated_by integer,
    reason text,
    target_team_id integer
);


ALTER TABLE public.incidentescalation OWNER TO postgres;

--
-- TOC entry 273 (class 1259 OID 26081)
-- Name: incidentescalation_escalation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.incidentescalation_escalation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.incidentescalation_escalation_id_seq OWNER TO postgres;

--
-- TOC entry 5391 (class 0 OID 0)
-- Dependencies: 273
-- Name: incidentescalation_escalation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.incidentescalation_escalation_id_seq OWNED BY public.incidentescalation.escalation_id;


--
-- TOC entry 222 (class 1259 OID 25601)
-- Name: incidentpriority; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.incidentpriority (
    priority_id integer NOT NULL,
    priority_name character varying(50) NOT NULL,
    urgency_level integer NOT NULL,
    CONSTRAINT incidentpriority_urgency_level_check CHECK (((urgency_level >= 1) AND (urgency_level <= 5)))
);


ALTER TABLE public.incidentpriority OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 25600)
-- Name: incidentpriority_priority_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.incidentpriority_priority_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.incidentpriority_priority_id_seq OWNER TO postgres;

--
-- TOC entry 5392 (class 0 OID 0)
-- Dependencies: 221
-- Name: incidentpriority_priority_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.incidentpriority_priority_id_seq OWNED BY public.incidentpriority.priority_id;


--
-- TOC entry 220 (class 1259 OID 25588)
-- Name: incidentstatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.incidentstatus (
    status_id integer NOT NULL,
    status_name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.incidentstatus OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 25587)
-- Name: incidentstatus_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.incidentstatus_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.incidentstatus_status_id_seq OWNER TO postgres;

--
-- TOC entry 5393 (class 0 OID 0)
-- Dependencies: 219
-- Name: incidentstatus_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.incidentstatus_status_id_seq OWNED BY public.incidentstatus.status_id;


--
-- TOC entry 272 (class 1259 OID 26050)
-- Name: incidentstatushistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.incidentstatushistory (
    history_id integer NOT NULL,
    incident_id integer NOT NULL,
    old_status_id integer,
    new_status_id integer NOT NULL,
    changed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    changed_by integer
);


ALTER TABLE public.incidentstatushistory OWNER TO postgres;

--
-- TOC entry 271 (class 1259 OID 26049)
-- Name: incidentstatushistory_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.incidentstatushistory_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.incidentstatushistory_history_id_seq OWNER TO postgres;

--
-- TOC entry 5394 (class 0 OID 0)
-- Dependencies: 271
-- Name: incidentstatushistory_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.incidentstatushistory_history_id_seq OWNED BY public.incidentstatushistory.history_id;


--
-- TOC entry 254 (class 1259 OID 25834)
-- Name: mitigationaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mitigationaction (
    action_id integer NOT NULL,
    incident_id integer NOT NULL,
    action_type_id integer NOT NULL,
    description text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.mitigationaction OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 25833)
-- Name: mitigationaction_action_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mitigationaction_action_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mitigationaction_action_id_seq OWNER TO postgres;

--
-- TOC entry 5395 (class 0 OID 0)
-- Dependencies: 253
-- Name: mitigationaction_action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mitigationaction_action_id_seq OWNED BY public.mitigationaction.action_id;


--
-- TOC entry 260 (class 1259 OID 25930)
-- Name: notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notification (
    notification_id integer NOT NULL,
    incident_id integer NOT NULL,
    recipient character varying(150) NOT NULL,
    sent_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    channel character varying(30) NOT NULL,
    CONSTRAINT notification_channel_check CHECK (((channel)::text = ANY ((ARRAY['email'::character varying, 'telegram'::character varying, 'siem'::character varying])::text[])))
);


ALTER TABLE public.notification OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 25929)
-- Name: notification_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notification_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notification_notification_id_seq OWNER TO postgres;

--
-- TOC entry 5396 (class 0 OID 0)
-- Dependencies: 259
-- Name: notification_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notification_notification_id_seq OWNED BY public.notification.notification_id;


--
-- TOC entry 242 (class 1259 OID 25715)
-- Name: responseteam; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.responseteam (
    team_id integer NOT NULL,
    team_name character varying(100) NOT NULL,
    lead_employee_id integer
);


ALTER TABLE public.responseteam OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 25714)
-- Name: responseteam_team_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.responseteam_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.responseteam_team_id_seq OWNER TO postgres;

--
-- TOC entry 5397 (class 0 OID 0)
-- Dependencies: 241
-- Name: responseteam_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.responseteam_team_id_seq OWNED BY public.responseteam.team_id;


--
-- TOC entry 228 (class 1259 OID 25636)
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    role_id integer NOT NULL,
    role_name character varying(50) NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 25635)
-- Name: role_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.role_role_id_seq OWNER TO postgres;

--
-- TOC entry 5398 (class 0 OID 0)
-- Dependencies: 227
-- Name: role_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_role_id_seq OWNED BY public.role.role_id;


--
-- TOC entry 234 (class 1259 OID 25669)
-- Name: ruletype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ruletype (
    rule_type_id integer NOT NULL,
    type_name character varying(50) NOT NULL
);


ALTER TABLE public.ruletype OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 25668)
-- Name: ruletype_rule_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ruletype_rule_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ruletype_rule_type_id_seq OWNER TO postgres;

--
-- TOC entry 5399 (class 0 OID 0)
-- Dependencies: 233
-- Name: ruletype_rule_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ruletype_rule_type_id_seq OWNED BY public.ruletype.rule_type_id;


--
-- TOC entry 238 (class 1259 OID 25691)
-- Name: sla; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sla (
    sla_id integer NOT NULL,
    sla_name character varying(100) NOT NULL,
    response_hours integer NOT NULL,
    resolution_hours integer NOT NULL
);


ALTER TABLE public.sla OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 25690)
-- Name: sla_sla_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sla_sla_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sla_sla_id_seq OWNER TO postgres;

--
-- TOC entry 5400 (class 0 OID 0)
-- Dependencies: 237
-- Name: sla_sla_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sla_sla_id_seq OWNED BY public.sla.sla_id;


--
-- TOC entry 258 (class 1259 OID 25906)
-- Name: sourceevent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sourceevent (
    event_id integer NOT NULL,
    event_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    raw_log text NOT NULL,
    source_id integer NOT NULL,
    incident_id integer
);


ALTER TABLE public.sourceevent OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 25905)
-- Name: sourceevent_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sourceevent_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sourceevent_event_id_seq OWNER TO postgres;

--
-- TOC entry 5401 (class 0 OID 0)
-- Dependencies: 257
-- Name: sourceevent_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sourceevent_event_id_seq OWNED BY public.sourceevent.event_id;


--
-- TOC entry 236 (class 1259 OID 25680)
-- Name: sourcetype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sourcetype (
    source_type_id integer NOT NULL,
    type_name character varying(50) NOT NULL
);


ALTER TABLE public.sourcetype OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 25679)
-- Name: sourcetype_source_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sourcetype_source_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sourcetype_source_type_id_seq OWNER TO postgres;

--
-- TOC entry 5402 (class 0 OID 0)
-- Dependencies: 235
-- Name: sourcetype_source_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sourcetype_source_type_id_seq OWNED BY public.sourcetype.source_type_id;


--
-- TOC entry 248 (class 1259 OID 25786)
-- Name: threat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.threat (
    threat_id integer NOT NULL,
    threat_name character varying(150) NOT NULL,
    mitre_id character varying(20),
    category_id integer NOT NULL
);


ALTER TABLE public.threat OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 25785)
-- Name: threat_threat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.threat_threat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.threat_threat_id_seq OWNER TO postgres;

--
-- TOC entry 5403 (class 0 OID 0)
-- Dependencies: 247
-- Name: threat_threat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.threat_threat_id_seq OWNED BY public.threat.threat_id;


--
-- TOC entry 232 (class 1259 OID 25658)
-- Name: threatcategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.threatcategory (
    category_id integer NOT NULL,
    category_name character varying(50) NOT NULL
);


ALTER TABLE public.threatcategory OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 25657)
-- Name: threatcategory_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.threatcategory_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.threatcategory_category_id_seq OWNER TO postgres;

--
-- TOC entry 5404 (class 0 OID 0)
-- Dependencies: 231
-- Name: threatcategory_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.threatcategory_category_id_seq OWNED BY public.threatcategory.category_id;


--
-- TOC entry 266 (class 1259 OID 25991)
-- Name: threatintelligence; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.threatintelligence (
    ti_id integer NOT NULL,
    indicator character varying(255) NOT NULL,
    threat_id integer NOT NULL,
    valid_until date
);


ALTER TABLE public.threatintelligence OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 25990)
-- Name: threatintelligence_ti_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.threatintelligence_ti_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.threatintelligence_ti_id_seq OWNER TO postgres;

--
-- TOC entry 5405 (class 0 OID 0)
-- Dependencies: 265
-- Name: threatintelligence_ti_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.threatintelligence_ti_id_seq OWNED BY public.threatintelligence.ti_id;


--
-- TOC entry 4996 (class 2604 OID 25650)
-- Name: actiontype action_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actiontype ALTER COLUMN action_type_id SET DEFAULT nextval('public.actiontype_action_type_id_seq'::regclass);


--
-- TOC entry 5003 (class 2604 OID 25729)
-- Name: asset asset_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset ALTER COLUMN asset_id SET DEFAULT nextval('public.asset_asset_id_seq'::regclass);


--
-- TOC entry 4993 (class 2604 OID 25617)
-- Name: assettype asset_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assettype ALTER COLUMN asset_type_id SET DEFAULT nextval('public.assettype_asset_type_id_seq'::regclass);


--
-- TOC entry 5022 (class 2604 OID 26009)
-- Name: assetvulnerability vuln_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assetvulnerability ALTER COLUMN vuln_id SET DEFAULT nextval('public.assetvulnerability_vuln_id_seq'::regclass);


--
-- TOC entry 5017 (class 2604 OID 25952)
-- Name: auditlog log_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auditlog ALTER COLUMN log_id SET DEFAULT nextval('public.auditlog_log_id_seq'::regclass);


--
-- TOC entry 4994 (class 2604 OID 25628)
-- Name: department department_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department ALTER COLUMN department_id SET DEFAULT nextval('public.department_department_id_seq'::regclass);


--
-- TOC entry 5006 (class 2604 OID 25804)
-- Name: detectionrule rule_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detectionrule ALTER COLUMN rule_id SET DEFAULT nextval('public.detectionrule_rule_id_seq'::regclass);


--
-- TOC entry 5004 (class 2604 OID 25756)
-- Name: employee employee_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee ALTER COLUMN employee_id SET DEFAULT nextval('public.employee_employee_id_seq'::regclass);


--
-- TOC entry 5001 (class 2604 OID 25707)
-- Name: employeegroup group_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employeegroup ALTER COLUMN group_id SET DEFAULT nextval('public.employeegroup_group_id_seq'::regclass);


--
-- TOC entry 5007 (class 2604 OID 25822)
-- Name: eventsource source_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eventsource ALTER COLUMN source_id SET DEFAULT nextval('public.eventsource_source_id_seq'::regclass);


--
-- TOC entry 5010 (class 2604 OID 25857)
-- Name: incident incident_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incident ALTER COLUMN incident_id SET DEFAULT nextval('public.incident_incident_id_seq'::regclass);


--
-- TOC entry 5024 (class 2604 OID 26028)
-- Name: incidentattachment attachment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidentattachment ALTER COLUMN attachment_id SET DEFAULT nextval('public.incidentattachment_attachment_id_seq'::regclass);


--
-- TOC entry 5019 (class 2604 OID 25969)
-- Name: incidentcomment comment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidentcomment ALTER COLUMN comment_id SET DEFAULT nextval('public.incidentcomment_comment_id_seq'::regclass);


--
-- TOC entry 5028 (class 2604 OID 26085)
-- Name: incidentescalation escalation_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidentescalation ALTER COLUMN escalation_id SET DEFAULT nextval('public.incidentescalation_escalation_id_seq'::regclass);


--
-- TOC entry 4992 (class 2604 OID 25604)
-- Name: incidentpriority priority_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidentpriority ALTER COLUMN priority_id SET DEFAULT nextval('public.incidentpriority_priority_id_seq'::regclass);


--
-- TOC entry 4991 (class 2604 OID 25591)
-- Name: incidentstatus status_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidentstatus ALTER COLUMN status_id SET DEFAULT nextval('public.incidentstatus_status_id_seq'::regclass);


--
-- TOC entry 5026 (class 2604 OID 26053)
-- Name: incidentstatushistory history_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidentstatushistory ALTER COLUMN history_id SET DEFAULT nextval('public.incidentstatushistory_history_id_seq'::regclass);


--
-- TOC entry 5008 (class 2604 OID 25837)
-- Name: mitigationaction action_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mitigationaction ALTER COLUMN action_id SET DEFAULT nextval('public.mitigationaction_action_id_seq'::regclass);


--
-- TOC entry 5015 (class 2604 OID 25933)
-- Name: notification notification_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification ALTER COLUMN notification_id SET DEFAULT nextval('public.notification_notification_id_seq'::regclass);


--
-- TOC entry 5002 (class 2604 OID 25718)
-- Name: responseteam team_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.responseteam ALTER COLUMN team_id SET DEFAULT nextval('public.responseteam_team_id_seq'::regclass);


--
-- TOC entry 4995 (class 2604 OID 25639)
-- Name: role role_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN role_id SET DEFAULT nextval('public.role_role_id_seq'::regclass);


--
-- TOC entry 4998 (class 2604 OID 25672)
-- Name: ruletype rule_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ruletype ALTER COLUMN rule_type_id SET DEFAULT nextval('public.ruletype_rule_type_id_seq'::regclass);


--
-- TOC entry 5000 (class 2604 OID 25694)
-- Name: sla sla_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sla ALTER COLUMN sla_id SET DEFAULT nextval('public.sla_sla_id_seq'::regclass);


--
-- TOC entry 5013 (class 2604 OID 25909)
-- Name: sourceevent event_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sourceevent ALTER COLUMN event_id SET DEFAULT nextval('public.sourceevent_event_id_seq'::regclass);


--
-- TOC entry 4999 (class 2604 OID 25683)
-- Name: sourcetype source_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sourcetype ALTER COLUMN source_type_id SET DEFAULT nextval('public.sourcetype_source_type_id_seq'::regclass);


--
-- TOC entry 5005 (class 2604 OID 25789)
-- Name: threat threat_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.threat ALTER COLUMN threat_id SET DEFAULT nextval('public.threat_threat_id_seq'::regclass);


--
-- TOC entry 4997 (class 2604 OID 25661)
-- Name: threatcategory category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.threatcategory ALTER COLUMN category_id SET DEFAULT nextval('public.threatcategory_category_id_seq'::regclass);


--
-- TOC entry 5021 (class 2604 OID 25994)
-- Name: threatintelligence ti_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.threatintelligence ALTER COLUMN ti_id SET DEFAULT nextval('public.threatintelligence_ti_id_seq'::regclass);


--
-- TOC entry 5326 (class 0 OID 25647)
-- Dependencies: 230
-- Data for Name: actiontype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.actiontype (action_type_id, type_name) FROM stdin;
\.


--
-- TOC entry 5340 (class 0 OID 25726)
-- Dependencies: 244
-- Data for Name: asset; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asset (asset_id, asset_name, ip_address, asset_type_id, department_id, commissioning_date, sla_id) FROM stdin;
\.


--
-- TOC entry 5320 (class 0 OID 25614)
-- Dependencies: 224
-- Data for Name: assettype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assettype (asset_type_id, type_name) FROM stdin;
\.


--
-- TOC entry 5364 (class 0 OID 26006)
-- Dependencies: 268
-- Data for Name: assetvulnerability; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assetvulnerability (vuln_id, asset_id, cve_id, severity, detected_at) FROM stdin;
\.


--
-- TOC entry 5358 (class 0 OID 25949)
-- Dependencies: 262
-- Data for Name: auditlog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auditlog (log_id, employee_id, action, action_time) FROM stdin;
\.


--
-- TOC entry 5322 (class 0 OID 25625)
-- Dependencies: 226
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.department (department_id, dept_name, location) FROM stdin;
\.


--
-- TOC entry 5346 (class 0 OID 25801)
-- Dependencies: 250
-- Data for Name: detectionrule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detectionrule (rule_id, rule_name, rule_type_id, rule_condition) FROM stdin;
\.


--
-- TOC entry 5342 (class 0 OID 25753)
-- Dependencies: 246
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (employee_id, full_name, email, role_id, group_id, team_id) FROM stdin;
\.


--
-- TOC entry 5336 (class 0 OID 25704)
-- Dependencies: 240
-- Data for Name: employeegroup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employeegroup (group_id, group_name) FROM stdin;
\.


--
-- TOC entry 5348 (class 0 OID 25819)
-- Dependencies: 252
-- Data for Name: eventsource; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.eventsource (source_id, source_name, source_type_id) FROM stdin;
\.


--
-- TOC entry 5352 (class 0 OID 25854)
-- Dependencies: 256
-- Data for Name: incident; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.incident (incident_id, title, description, detection_time, closure_time, status_id, priority_id, affected_asset_id, assigned_employee_id, detection_rule_id, primary_threat_id, escalation_required) FROM stdin;
\.


--
-- TOC entry 5366 (class 0 OID 26025)
-- Dependencies: 270
-- Data for Name: incidentattachment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.incidentattachment (attachment_id, incident_id, file_name, file_path, uploaded_at, uploaded_by) FROM stdin;
\.


--
-- TOC entry 5360 (class 0 OID 25966)
-- Dependencies: 264
-- Data for Name: incidentcomment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.incidentcomment (comment_id, incident_id, employee_id, comment_text, created_at) FROM stdin;
\.


--
-- TOC entry 5370 (class 0 OID 26082)
-- Dependencies: 274
-- Data for Name: incidentescalation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.incidentescalation (escalation_id, incident_id, escalated_at, escalated_by, reason, target_team_id) FROM stdin;
\.


--
-- TOC entry 5318 (class 0 OID 25601)
-- Dependencies: 222
-- Data for Name: incidentpriority; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.incidentpriority (priority_id, priority_name, urgency_level) FROM stdin;
\.


--
-- TOC entry 5316 (class 0 OID 25588)
-- Dependencies: 220
-- Data for Name: incidentstatus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.incidentstatus (status_id, status_name, description) FROM stdin;
\.


--
-- TOC entry 5368 (class 0 OID 26050)
-- Dependencies: 272
-- Data for Name: incidentstatushistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.incidentstatushistory (history_id, incident_id, old_status_id, new_status_id, changed_at, changed_by) FROM stdin;
\.


--
-- TOC entry 5350 (class 0 OID 25834)
-- Dependencies: 254
-- Data for Name: mitigationaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mitigationaction (action_id, incident_id, action_type_id, description, created_at) FROM stdin;
\.


--
-- TOC entry 5356 (class 0 OID 25930)
-- Dependencies: 260
-- Data for Name: notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notification (notification_id, incident_id, recipient, sent_at, channel) FROM stdin;
\.


--
-- TOC entry 5338 (class 0 OID 25715)
-- Dependencies: 242
-- Data for Name: responseteam; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.responseteam (team_id, team_name, lead_employee_id) FROM stdin;
\.


--
-- TOC entry 5324 (class 0 OID 25636)
-- Dependencies: 228
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (role_id, role_name) FROM stdin;
\.


--
-- TOC entry 5330 (class 0 OID 25669)
-- Dependencies: 234
-- Data for Name: ruletype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ruletype (rule_type_id, type_name) FROM stdin;
\.


--
-- TOC entry 5334 (class 0 OID 25691)
-- Dependencies: 238
-- Data for Name: sla; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sla (sla_id, sla_name, response_hours, resolution_hours) FROM stdin;
\.


--
-- TOC entry 5354 (class 0 OID 25906)
-- Dependencies: 258
-- Data for Name: sourceevent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sourceevent (event_id, event_time, raw_log, source_id, incident_id) FROM stdin;
\.


--
-- TOC entry 5332 (class 0 OID 25680)
-- Dependencies: 236
-- Data for Name: sourcetype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sourcetype (source_type_id, type_name) FROM stdin;
\.


--
-- TOC entry 5344 (class 0 OID 25786)
-- Dependencies: 248
-- Data for Name: threat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.threat (threat_id, threat_name, mitre_id, category_id) FROM stdin;
\.


--
-- TOC entry 5328 (class 0 OID 25658)
-- Dependencies: 232
-- Data for Name: threatcategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.threatcategory (category_id, category_name) FROM stdin;
\.


--
-- TOC entry 5362 (class 0 OID 25991)
-- Dependencies: 266
-- Data for Name: threatintelligence; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.threatintelligence (ti_id, indicator, threat_id, valid_until) FROM stdin;
\.


--
-- TOC entry 5406 (class 0 OID 0)
-- Dependencies: 229
-- Name: actiontype_action_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.actiontype_action_type_id_seq', 1, false);


--
-- TOC entry 5407 (class 0 OID 0)
-- Dependencies: 243
-- Name: asset_asset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asset_asset_id_seq', 1, false);


--
-- TOC entry 5408 (class 0 OID 0)
-- Dependencies: 223
-- Name: assettype_asset_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.assettype_asset_type_id_seq', 1, false);


--
-- TOC entry 5409 (class 0 OID 0)
-- Dependencies: 267
-- Name: assetvulnerability_vuln_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.assetvulnerability_vuln_id_seq', 1, false);


--
-- TOC entry 5410 (class 0 OID 0)
-- Dependencies: 261
-- Name: auditlog_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auditlog_log_id_seq', 1, false);


--
-- TOC entry 5411 (class 0 OID 0)
-- Dependencies: 225
-- Name: department_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.department_department_id_seq', 1, false);


--
-- TOC entry 5412 (class 0 OID 0)
-- Dependencies: 249
-- Name: detectionrule_rule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.detectionrule_rule_id_seq', 1, false);


--
-- TOC entry 5413 (class 0 OID 0)
-- Dependencies: 245
-- Name: employee_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_employee_id_seq', 1, false);


--
-- TOC entry 5414 (class 0 OID 0)
-- Dependencies: 239
-- Name: employeegroup_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employeegroup_group_id_seq', 1, false);


--
-- TOC entry 5415 (class 0 OID 0)
-- Dependencies: 251
-- Name: eventsource_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.eventsource_source_id_seq', 1, false);


--
-- TOC entry 5416 (class 0 OID 0)
-- Dependencies: 255
-- Name: incident_incident_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.incident_incident_id_seq', 1, false);


--
-- TOC entry 5417 (class 0 OID 0)
-- Dependencies: 269
-- Name: incidentattachment_attachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.incidentattachment_attachment_id_seq', 1, false);


--
-- TOC entry 5418 (class 0 OID 0)
-- Dependencies: 263
-- Name: incidentcomment_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.incidentcomment_comment_id_seq', 1, false);


--
-- TOC entry 5419 (class 0 OID 0)
-- Dependencies: 273
-- Name: incidentescalation_escalation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.incidentescalation_escalation_id_seq', 1, false);


--
-- TOC entry 5420 (class 0 OID 0)
-- Dependencies: 221
-- Name: incidentpriority_priority_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.incidentpriority_priority_id_seq', 1, false);


--
-- TOC entry 5421 (class 0 OID 0)
-- Dependencies: 219
-- Name: incidentstatus_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.incidentstatus_status_id_seq', 1, false);


--
-- TOC entry 5422 (class 0 OID 0)
-- Dependencies: 271
-- Name: incidentstatushistory_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.incidentstatushistory_history_id_seq', 1, false);


--
-- TOC entry 5423 (class 0 OID 0)
-- Dependencies: 253
-- Name: mitigationaction_action_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mitigationaction_action_id_seq', 1, false);


--
-- TOC entry 5424 (class 0 OID 0)
-- Dependencies: 259
-- Name: notification_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notification_notification_id_seq', 1, false);


--
-- TOC entry 5425 (class 0 OID 0)
-- Dependencies: 241
-- Name: responseteam_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.responseteam_team_id_seq', 1, false);


--
-- TOC entry 5426 (class 0 OID 0)
-- Dependencies: 227
-- Name: role_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_role_id_seq', 1, false);


--
-- TOC entry 5427 (class 0 OID 0)
-- Dependencies: 233
-- Name: ruletype_rule_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ruletype_rule_type_id_seq', 1, false);


--
-- TOC entry 5428 (class 0 OID 0)
-- Dependencies: 237
-- Name: sla_sla_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sla_sla_id_seq', 1, false);


--
-- TOC entry 5429 (class 0 OID 0)
-- Dependencies: 257
-- Name: sourceevent_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sourceevent_event_id_seq', 1, false);


--
-- TOC entry 5430 (class 0 OID 0)
-- Dependencies: 235
-- Name: sourcetype_source_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sourcetype_source_type_id_seq', 1, false);


--
-- TOC entry 5431 (class 0 OID 0)
-- Dependencies: 247
-- Name: threat_threat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.threat_threat_id_seq', 1, false);


--
-- TOC entry 5432 (class 0 OID 0)
-- Dependencies: 231
-- Name: threatcategory_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.threatcategory_category_id_seq', 1, false);


--
-- TOC entry 5433 (class 0 OID 0)
-- Dependencies: 265
-- Name: threatintelligence_ti_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.threatintelligence_ti_id_seq', 1, false);


--
-- TOC entry 5055 (class 2606 OID 25654)
-- Name: actiontype actiontype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actiontype
    ADD CONSTRAINT actiontype_pkey PRIMARY KEY (action_type_id);


--
-- TOC entry 5057 (class 2606 OID 25656)
-- Name: actiontype actiontype_type_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actiontype
    ADD CONSTRAINT actiontype_type_name_key UNIQUE (type_name);


--
-- TOC entry 5083 (class 2606 OID 25736)
-- Name: asset asset_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset
    ADD CONSTRAINT asset_pkey PRIMARY KEY (asset_id);


--
-- TOC entry 5043 (class 2606 OID 25621)
-- Name: assettype assettype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assettype
    ADD CONSTRAINT assettype_pkey PRIMARY KEY (asset_type_id);


--
-- TOC entry 5045 (class 2606 OID 25623)
-- Name: assettype assettype_type_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assettype
    ADD CONSTRAINT assettype_type_name_key UNIQUE (type_name);


--
-- TOC entry 5122 (class 2606 OID 26018)
-- Name: assetvulnerability assetvulnerability_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assetvulnerability
    ADD CONSTRAINT assetvulnerability_pkey PRIMARY KEY (vuln_id);


--
-- TOC entry 5114 (class 2606 OID 25959)
-- Name: auditlog auditlog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auditlog
    ADD CONSTRAINT auditlog_pkey PRIMARY KEY (log_id);


--
-- TOC entry 5047 (class 2606 OID 25634)
-- Name: department department_dept_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_dept_name_key UNIQUE (dept_name);


--
-- TOC entry 5049 (class 2606 OID 25632)
-- Name: department department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (department_id);


--
-- TOC entry 5091 (class 2606 OID 25812)
-- Name: detectionrule detectionrule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detectionrule
    ADD CONSTRAINT detectionrule_pkey PRIMARY KEY (rule_id);


--
-- TOC entry 5085 (class 2606 OID 25764)
-- Name: employee employee_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_email_key UNIQUE (email);


--
-- TOC entry 5087 (class 2606 OID 25762)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (employee_id);


--
-- TOC entry 5075 (class 2606 OID 25713)
-- Name: employeegroup employeegroup_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employeegroup
    ADD CONSTRAINT employeegroup_group_name_key UNIQUE (group_name);


--
-- TOC entry 5077 (class 2606 OID 25711)
-- Name: employeegroup employeegroup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employeegroup
    ADD CONSTRAINT employeegroup_pkey PRIMARY KEY (group_id);


--
-- TOC entry 5093 (class 2606 OID 25827)
-- Name: eventsource eventsource_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eventsource
    ADD CONSTRAINT eventsource_pkey PRIMARY KEY (source_id);


--
-- TOC entry 5105 (class 2606 OID 25869)
-- Name: incident incident_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incident
    ADD CONSTRAINT incident_pkey PRIMARY KEY (incident_id);


--
-- TOC entry 5126 (class 2606 OID 26038)
-- Name: incidentattachment incidentattachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidentattachment
    ADD CONSTRAINT incidentattachment_pkey PRIMARY KEY (attachment_id);


--
-- TOC entry 5118 (class 2606 OID 25979)
-- Name: incidentcomment incidentcomment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidentcomment
    ADD CONSTRAINT incidentcomment_pkey PRIMARY KEY (comment_id);


--
-- TOC entry 5132 (class 2606 OID 26093)
-- Name: incidentescalation incidentescalation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidentescalation
    ADD CONSTRAINT incidentescalation_pkey PRIMARY KEY (escalation_id);


--
-- TOC entry 5039 (class 2606 OID 25610)
-- Name: incidentpriority incidentpriority_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidentpriority
    ADD CONSTRAINT incidentpriority_pkey PRIMARY KEY (priority_id);


--
-- TOC entry 5041 (class 2606 OID 25612)
-- Name: incidentpriority incidentpriority_priority_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidentpriority
    ADD CONSTRAINT incidentpriority_priority_name_key UNIQUE (priority_name);


--
-- TOC entry 5035 (class 2606 OID 25597)
-- Name: incidentstatus incidentstatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidentstatus
    ADD CONSTRAINT incidentstatus_pkey PRIMARY KEY (status_id);


--
-- TOC entry 5037 (class 2606 OID 25599)
-- Name: incidentstatus incidentstatus_status_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidentstatus
    ADD CONSTRAINT incidentstatus_status_name_key UNIQUE (status_name);


--
-- TOC entry 5129 (class 2606 OID 26060)
-- Name: incidentstatushistory incidentstatushistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidentstatushistory
    ADD CONSTRAINT incidentstatushistory_pkey PRIMARY KEY (history_id);


--
-- TOC entry 5096 (class 2606 OID 25847)
-- Name: mitigationaction mitigationaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mitigationaction
    ADD CONSTRAINT mitigationaction_pkey PRIMARY KEY (action_id);


--
-- TOC entry 5112 (class 2606 OID 25942)
-- Name: notification notification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_pkey PRIMARY KEY (notification_id);


--
-- TOC entry 5079 (class 2606 OID 25722)
-- Name: responseteam responseteam_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.responseteam
    ADD CONSTRAINT responseteam_pkey PRIMARY KEY (team_id);


--
-- TOC entry 5081 (class 2606 OID 25724)
-- Name: responseteam responseteam_team_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.responseteam
    ADD CONSTRAINT responseteam_team_name_key UNIQUE (team_name);


--
-- TOC entry 5051 (class 2606 OID 25643)
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (role_id);


--
-- TOC entry 5053 (class 2606 OID 25645)
-- Name: role role_role_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_role_name_key UNIQUE (role_name);


--
-- TOC entry 5063 (class 2606 OID 25676)
-- Name: ruletype ruletype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ruletype
    ADD CONSTRAINT ruletype_pkey PRIMARY KEY (rule_type_id);


--
-- TOC entry 5065 (class 2606 OID 25678)
-- Name: ruletype ruletype_type_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ruletype
    ADD CONSTRAINT ruletype_type_name_key UNIQUE (type_name);


--
-- TOC entry 5071 (class 2606 OID 25700)
-- Name: sla sla_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sla
    ADD CONSTRAINT sla_pkey PRIMARY KEY (sla_id);


--
-- TOC entry 5073 (class 2606 OID 25702)
-- Name: sla sla_sla_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sla
    ADD CONSTRAINT sla_sla_name_key UNIQUE (sla_name);


--
-- TOC entry 5109 (class 2606 OID 25918)
-- Name: sourceevent sourceevent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sourceevent
    ADD CONSTRAINT sourceevent_pkey PRIMARY KEY (event_id);


--
-- TOC entry 5067 (class 2606 OID 25687)
-- Name: sourcetype sourcetype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sourcetype
    ADD CONSTRAINT sourcetype_pkey PRIMARY KEY (source_type_id);


--
-- TOC entry 5069 (class 2606 OID 25689)
-- Name: sourcetype sourcetype_type_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sourcetype
    ADD CONSTRAINT sourcetype_type_name_key UNIQUE (type_name);


--
-- TOC entry 5089 (class 2606 OID 25794)
-- Name: threat threat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.threat
    ADD CONSTRAINT threat_pkey PRIMARY KEY (threat_id);


--
-- TOC entry 5059 (class 2606 OID 25667)
-- Name: threatcategory threatcategory_category_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.threatcategory
    ADD CONSTRAINT threatcategory_category_name_key UNIQUE (category_name);


--
-- TOC entry 5061 (class 2606 OID 25665)
-- Name: threatcategory threatcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.threatcategory
    ADD CONSTRAINT threatcategory_pkey PRIMARY KEY (category_id);


--
-- TOC entry 5120 (class 2606 OID 25999)
-- Name: threatintelligence threatintelligence_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.threatintelligence
    ADD CONSTRAINT threatintelligence_pkey PRIMARY KEY (ti_id);


--
-- TOC entry 5123 (class 1259 OID 26121)
-- Name: idx_asset_vulnerability_asset; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_asset_vulnerability_asset ON public.assetvulnerability USING btree (asset_id);


--
-- TOC entry 5124 (class 1259 OID 26122)
-- Name: idx_attachment_incident; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_attachment_incident ON public.incidentattachment USING btree (incident_id);


--
-- TOC entry 5115 (class 1259 OID 26120)
-- Name: idx_audit_employee; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_audit_employee ON public.auditlog USING btree (employee_id);


--
-- TOC entry 5116 (class 1259 OID 26119)
-- Name: idx_comment_incident; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_comment_incident ON public.incidentcomment USING btree (incident_id);


--
-- TOC entry 5130 (class 1259 OID 26124)
-- Name: idx_escalation_incident; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_escalation_incident ON public.incidentescalation USING btree (incident_id);


--
-- TOC entry 5106 (class 1259 OID 26125)
-- Name: idx_event_source_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_event_source_time ON public.sourceevent USING btree (event_time);


--
-- TOC entry 5097 (class 1259 OID 26111)
-- Name: idx_incident_asset; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_incident_asset ON public.incident USING btree (affected_asset_id);


--
-- TOC entry 5098 (class 1259 OID 26112)
-- Name: idx_incident_assigned; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_incident_assigned ON public.incident USING btree (assigned_employee_id);


--
-- TOC entry 5099 (class 1259 OID 26113)
-- Name: idx_incident_detection_rule; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_incident_detection_rule ON public.incident USING btree (detection_rule_id);


--
-- TOC entry 5100 (class 1259 OID 26115)
-- Name: idx_incident_detection_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_incident_detection_time ON public.incident USING btree (detection_time);


--
-- TOC entry 5101 (class 1259 OID 26114)
-- Name: idx_incident_primary_threat; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_incident_primary_threat ON public.incident USING btree (primary_threat_id);


--
-- TOC entry 5102 (class 1259 OID 26110)
-- Name: idx_incident_priority; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_incident_priority ON public.incident USING btree (priority_id);


--
-- TOC entry 5103 (class 1259 OID 26109)
-- Name: idx_incident_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_incident_status ON public.incident USING btree (status_id);


--
-- TOC entry 5094 (class 1259 OID 26116)
-- Name: idx_mitigation_incident; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_mitigation_incident ON public.mitigationaction USING btree (incident_id);


--
-- TOC entry 5110 (class 1259 OID 26118)
-- Name: idx_notification_incident; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_notification_incident ON public.notification USING btree (incident_id);


--
-- TOC entry 5107 (class 1259 OID 26117)
-- Name: idx_source_event_incident; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_source_event_incident ON public.sourceevent USING btree (incident_id);


--
-- TOC entry 5127 (class 1259 OID 26123)
-- Name: idx_status_history_incident; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_status_history_incident ON public.incidentstatushistory USING btree (incident_id);


--
-- TOC entry 5134 (class 2606 OID 25737)
-- Name: asset asset_asset_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset
    ADD CONSTRAINT asset_asset_type_id_fkey FOREIGN KEY (asset_type_id) REFERENCES public.assettype(asset_type_id) ON DELETE RESTRICT;


--
-- TOC entry 5135 (class 2606 OID 25742)
-- Name: asset asset_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset
    ADD CONSTRAINT asset_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.department(department_id) ON DELETE SET NULL;


--
-- TOC entry 5136 (class 2606 OID 25747)
-- Name: asset asset_sla_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset
    ADD CONSTRAINT asset_sla_id_fkey FOREIGN KEY (sla_id) REFERENCES public.sla(sla_id) ON DELETE SET NULL;


--
-- TOC entry 5158 (class 2606 OID 26019)
-- Name: assetvulnerability assetvulnerability_asset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assetvulnerability
    ADD CONSTRAINT assetvulnerability_asset_id_fkey FOREIGN KEY (asset_id) REFERENCES public.asset(asset_id) ON DELETE CASCADE;


--
-- TOC entry 5154 (class 2606 OID 25960)
-- Name: auditlog auditlog_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auditlog
    ADD CONSTRAINT auditlog_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employee(employee_id) ON DELETE CASCADE;


--
-- TOC entry 5141 (class 2606 OID 25813)
-- Name: detectionrule detectionrule_rule_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detectionrule
    ADD CONSTRAINT detectionrule_rule_type_id_fkey FOREIGN KEY (rule_type_id) REFERENCES public.ruletype(rule_type_id) ON DELETE RESTRICT;


--
-- TOC entry 5137 (class 2606 OID 25770)
-- Name: employee employee_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.employeegroup(group_id) ON DELETE SET NULL;


--
-- TOC entry 5138 (class 2606 OID 25765)
-- Name: employee employee_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.role(role_id) ON DELETE RESTRICT;


--
-- TOC entry 5139 (class 2606 OID 25775)
-- Name: employee employee_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.responseteam(team_id) ON DELETE SET NULL;


--
-- TOC entry 5142 (class 2606 OID 25828)
-- Name: eventsource eventsource_source_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eventsource
    ADD CONSTRAINT eventsource_source_type_id_fkey FOREIGN KEY (source_type_id) REFERENCES public.sourcetype(source_type_id) ON DELETE RESTRICT;


--
-- TOC entry 5143 (class 2606 OID 25900)
-- Name: mitigationaction fk_mitigation_incident; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mitigationaction
    ADD CONSTRAINT fk_mitigation_incident FOREIGN KEY (incident_id) REFERENCES public.incident(incident_id) ON DELETE CASCADE;


--
-- TOC entry 5133 (class 2606 OID 25780)
-- Name: responseteam fk_team_lead; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.responseteam
    ADD CONSTRAINT fk_team_lead FOREIGN KEY (lead_employee_id) REFERENCES public.employee(employee_id) ON DELETE SET NULL;


--
-- TOC entry 5145 (class 2606 OID 25880)
-- Name: incident incident_affected_asset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incident
    ADD CONSTRAINT incident_affected_asset_id_fkey FOREIGN KEY (affected_asset_id) REFERENCES public.asset(asset_id) ON DELETE SET NULL;


--
-- TOC entry 5146 (class 2606 OID 25885)
-- Name: incident incident_assigned_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incident
    ADD CONSTRAINT incident_assigned_employee_id_fkey FOREIGN KEY (assigned_employee_id) REFERENCES public.employee(employee_id) ON DELETE SET NULL;


--
-- TOC entry 5147 (class 2606 OID 25890)
-- Name: incident incident_detection_rule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incident
    ADD CONSTRAINT incident_detection_rule_id_fkey FOREIGN KEY (detection_rule_id) REFERENCES public.detectionrule(rule_id) ON DELETE SET NULL;


--
-- TOC entry 5148 (class 2606 OID 25895)
-- Name: incident incident_primary_threat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incident
    ADD CONSTRAINT incident_primary_threat_id_fkey FOREIGN KEY (primary_threat_id) REFERENCES public.threat(threat_id) ON DELETE SET NULL;


--
-- TOC entry 5149 (class 2606 OID 25875)
-- Name: incident incident_priority_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incident
    ADD CONSTRAINT incident_priority_id_fkey FOREIGN KEY (priority_id) REFERENCES public.incidentpriority(priority_id) ON DELETE RESTRICT;


--
-- TOC entry 5150 (class 2606 OID 25870)
-- Name: incident incident_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incident
    ADD CONSTRAINT incident_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.incidentstatus(status_id) ON DELETE RESTRICT;


--
-- TOC entry 5159 (class 2606 OID 26039)
-- Name: incidentattachment incidentattachment_incident_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidentattachment
    ADD CONSTRAINT incidentattachment_incident_id_fkey FOREIGN KEY (incident_id) REFERENCES public.incident(incident_id) ON DELETE CASCADE;


--
-- TOC entry 5160 (class 2606 OID 26044)
-- Name: incidentattachment incidentattachment_uploaded_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidentattachment
    ADD CONSTRAINT incidentattachment_uploaded_by_fkey FOREIGN KEY (uploaded_by) REFERENCES public.employee(employee_id) ON DELETE SET NULL;


--
-- TOC entry 5155 (class 2606 OID 25985)
-- Name: incidentcomment incidentcomment_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidentcomment
    ADD CONSTRAINT incidentcomment_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employee(employee_id) ON DELETE CASCADE;


--
-- TOC entry 5156 (class 2606 OID 25980)
-- Name: incidentcomment incidentcomment_incident_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidentcomment
    ADD CONSTRAINT incidentcomment_incident_id_fkey FOREIGN KEY (incident_id) REFERENCES public.incident(incident_id) ON DELETE CASCADE;


--
-- TOC entry 5165 (class 2606 OID 26099)
-- Name: incidentescalation incidentescalation_escalated_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidentescalation
    ADD CONSTRAINT incidentescalation_escalated_by_fkey FOREIGN KEY (escalated_by) REFERENCES public.employee(employee_id) ON DELETE SET NULL;


--
-- TOC entry 5166 (class 2606 OID 26094)
-- Name: incidentescalation incidentescalation_incident_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidentescalation
    ADD CONSTRAINT incidentescalation_incident_id_fkey FOREIGN KEY (incident_id) REFERENCES public.incident(incident_id) ON DELETE CASCADE;


--
-- TOC entry 5167 (class 2606 OID 26104)
-- Name: incidentescalation incidentescalation_target_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidentescalation
    ADD CONSTRAINT incidentescalation_target_team_id_fkey FOREIGN KEY (target_team_id) REFERENCES public.responseteam(team_id) ON DELETE SET NULL;


--
-- TOC entry 5161 (class 2606 OID 26076)
-- Name: incidentstatushistory incidentstatushistory_changed_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidentstatushistory
    ADD CONSTRAINT incidentstatushistory_changed_by_fkey FOREIGN KEY (changed_by) REFERENCES public.employee(employee_id) ON DELETE SET NULL;


--
-- TOC entry 5162 (class 2606 OID 26061)
-- Name: incidentstatushistory incidentstatushistory_incident_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidentstatushistory
    ADD CONSTRAINT incidentstatushistory_incident_id_fkey FOREIGN KEY (incident_id) REFERENCES public.incident(incident_id) ON DELETE CASCADE;


--
-- TOC entry 5163 (class 2606 OID 26071)
-- Name: incidentstatushistory incidentstatushistory_new_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidentstatushistory
    ADD CONSTRAINT incidentstatushistory_new_status_id_fkey FOREIGN KEY (new_status_id) REFERENCES public.incidentstatus(status_id) ON DELETE RESTRICT;


--
-- TOC entry 5164 (class 2606 OID 26066)
-- Name: incidentstatushistory incidentstatushistory_old_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidentstatushistory
    ADD CONSTRAINT incidentstatushistory_old_status_id_fkey FOREIGN KEY (old_status_id) REFERENCES public.incidentstatus(status_id) ON DELETE SET NULL;


--
-- TOC entry 5144 (class 2606 OID 25848)
-- Name: mitigationaction mitigationaction_action_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mitigationaction
    ADD CONSTRAINT mitigationaction_action_type_id_fkey FOREIGN KEY (action_type_id) REFERENCES public.actiontype(action_type_id) ON DELETE RESTRICT;


--
-- TOC entry 5153 (class 2606 OID 25943)
-- Name: notification notification_incident_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_incident_id_fkey FOREIGN KEY (incident_id) REFERENCES public.incident(incident_id) ON DELETE CASCADE;


--
-- TOC entry 5151 (class 2606 OID 25924)
-- Name: sourceevent sourceevent_incident_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sourceevent
    ADD CONSTRAINT sourceevent_incident_id_fkey FOREIGN KEY (incident_id) REFERENCES public.incident(incident_id) ON DELETE SET NULL;


--
-- TOC entry 5152 (class 2606 OID 25919)
-- Name: sourceevent sourceevent_source_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sourceevent
    ADD CONSTRAINT sourceevent_source_id_fkey FOREIGN KEY (source_id) REFERENCES public.eventsource(source_id) ON DELETE RESTRICT;


--
-- TOC entry 5140 (class 2606 OID 25795)
-- Name: threat threat_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.threat
    ADD CONSTRAINT threat_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.threatcategory(category_id) ON DELETE RESTRICT;


--
-- TOC entry 5157 (class 2606 OID 26000)
-- Name: threatintelligence threatintelligence_threat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.threatintelligence
    ADD CONSTRAINT threatintelligence_threat_id_fkey FOREIGN KEY (threat_id) REFERENCES public.threat(threat_id) ON DELETE CASCADE;


--
-- TOC entry 5377 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2026-05-18 21:42:02

--
-- PostgreSQL database dump complete
--

\unrestrict mP5If8njE0dcR4YCoZvxrs3Zp1WqUPiUjzFyxeqEbYvD0srbmohKxfdTip4SA35

