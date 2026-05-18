--
-- PostgreSQL database dump
--

\restrict fHdTUNDg3pZyfhm4q2ofuhPqmj8d8XgbUMsalh63HI5mntkcNqnBI8hek78WIzh

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-05-19 02:19:34

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
-- TOC entry 5 (class 2615 OID 26666)
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
-- TOC entry 244 (class 1259 OID 26806)
-- Name: Актив; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Актив" (
    "актив_id" integer NOT NULL,
    "наименование" character varying(100) NOT NULL,
    "ip_адрес" inet,
    "тип_актива_id" integer NOT NULL,
    "подразделение_id" integer,
    "дата_ввода" date,
    sla_id integer
);


ALTER TABLE public."Актив" OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 26805)
-- Name: Актив_актив_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Актив_актив_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Актив_актив_id_seq" OWNER TO postgres;

--
-- TOC entry 5378 (class 0 OID 0)
-- Dependencies: 243
-- Name: Актив_актив_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Актив_актив_id_seq" OWNED BY public."Актив"."актив_id";


--
-- TOC entry 240 (class 1259 OID 26784)
-- Name: Группа сотрудников; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Группа сотрудников" (
    "группа_id" integer NOT NULL,
    "наименование" character varying(100) CONSTRAINT "Группа сотрудни_наименование_not_null" NOT NULL
);


ALTER TABLE public."Группа сотрудников" OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 26783)
-- Name: Группа сотрудников_группа_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Группа сотрудников_группа_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Группа сотрудников_группа_id_seq" OWNER TO postgres;

--
-- TOC entry 5379 (class 0 OID 0)
-- Dependencies: 239
-- Name: Группа сотрудников_группа_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Группа сотрудников_группа_id_seq" OWNED BY public."Группа сотрудников"."группа_id";


--
-- TOC entry 262 (class 1259 OID 27029)
-- Name: Журнал аудита; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Журнал аудита" (
    "запись_id" integer NOT NULL,
    "сотрудник_id" integer NOT NULL,
    "действие" character varying(200) NOT NULL,
    "время_действия" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Журнал аудита" OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 27028)
-- Name: Журнал аудита_запись_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Журнал аудита_запись_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Журнал аудита_запись_id_seq" OWNER TO postgres;

--
-- TOC entry 5380 (class 0 OID 0)
-- Dependencies: 261
-- Name: Журнал аудита_запись_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Журнал аудита_запись_id_seq" OWNED BY public."Журнал аудита"."запись_id";


--
-- TOC entry 266 (class 1259 OID 27071)
-- Name: Информация об угрозах; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Информация об угрозах" (
    "ид_угрозы_id" integer CONSTRAINT "Информация об угр_ид_угрозы_id_not_null" NOT NULL,
    "индикатор" character varying(255) CONSTRAINT "Информация об угро_индикатор_not_null" NOT NULL,
    "угроза_id" integer CONSTRAINT "Информация об угроза_угроза_id_not_null" NOT NULL,
    "действует_до" date
);


ALTER TABLE public."Информация об угрозах" OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 27070)
-- Name: Информация об угроза_ид_угрозы_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Информация об угроза_ид_угрозы_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Информация об угроза_ид_угрозы_id_seq" OWNER TO postgres;

--
-- TOC entry 5381 (class 0 OID 0)
-- Dependencies: 265
-- Name: Информация об угроза_ид_угрозы_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Информация об угроза_ид_угрозы_id_seq" OWNED BY public."Информация об угрозах"."ид_угрозы_id";


--
-- TOC entry 256 (class 1259 OID 26934)
-- Name: Инцидент; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Инцидент" (
    "инцидент_id" integer NOT NULL,
    "заголовок" character varying(200) NOT NULL,
    "описание" text,
    "время_обнаружения" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "время_закрытия" timestamp without time zone,
    "статус_id" integer NOT NULL,
    "приоритет_id" integer NOT NULL,
    "затронутый_актив_id" integer,
    "ответственный_сотрудник_id" integer,
    "правило_обнаружения_id" integer,
    "основная_угроза_id" integer,
    "требуется_эскалация" boolean DEFAULT false,
    CONSTRAINT "Инцидент_check" CHECK ((("время_закрытия" IS NULL) OR ("время_закрытия" >= "время_обнаружения")))
);


ALTER TABLE public."Инцидент" OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 26933)
-- Name: Инцидент_инцидент_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Инцидент_инцидент_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Инцидент_инцидент_id_seq" OWNER TO postgres;

--
-- TOC entry 5382 (class 0 OID 0)
-- Dependencies: 255
-- Name: Инцидент_инцидент_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Инцидент_инцидент_id_seq" OWNED BY public."Инцидент"."инцидент_id";


--
-- TOC entry 272 (class 1259 OID 27130)
-- Name: История состояния инцидента; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."История состояния инцидента" (
    "история_id" integer CONSTRAINT "История состояния и_история_id_not_null" NOT NULL,
    "инцидент_id" integer CONSTRAINT "История состояния _инцидент_id_not_null" NOT NULL,
    "старый_статус_id" integer,
    "новый_статус_id" integer CONSTRAINT "История состоя_новый_статус_id_not_null" NOT NULL,
    "изменено_в" timestamp without time zone DEFAULT CURRENT_TIMESTAMP CONSTRAINT "История состояния _изменено_в_not_null" NOT NULL,
    "изменил" integer
);


ALTER TABLE public."История состояния инцидента" OWNER TO postgres;

--
-- TOC entry 271 (class 1259 OID 27129)
-- Name: История состояния инц_история_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."История состояния инц_история_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."История состояния инц_история_id_seq" OWNER TO postgres;

--
-- TOC entry 5383 (class 0 OID 0)
-- Dependencies: 271
-- Name: История состояния инц_история_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."История состояния инц_история_id_seq" OWNED BY public."История состояния инцидента"."история_id";


--
-- TOC entry 252 (class 1259 OID 26899)
-- Name: Источник событий; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Источник событий" (
    "источник_id" integer NOT NULL,
    "наименование" character varying(100) CONSTRAINT "Источник событи_наименование_not_null" NOT NULL,
    "тип_источника_id" integer CONSTRAINT "Источник событ_тип_источника__not_null" NOT NULL
);


ALTER TABLE public."Источник событий" OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 26898)
-- Name: Источник событий_источник_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Источник событий_источник_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Источник событий_источник_id_seq" OWNER TO postgres;

--
-- TOC entry 5384 (class 0 OID 0)
-- Dependencies: 251
-- Name: Источник событий_источник_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Источник событий_источник_id_seq" OWNED BY public."Источник событий"."источник_id";


--
-- TOC entry 258 (class 1259 OID 26986)
-- Name: Исходное событие; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Исходное событие" (
    "событие_id" integer NOT NULL,
    "время_события" timestamp without time zone DEFAULT CURRENT_TIMESTAMP CONSTRAINT "Исходное событ_время_события_not_null" NOT NULL,
    "сырой_лог" text NOT NULL,
    "источник_id" integer NOT NULL,
    "инцидент_id" integer
);


ALTER TABLE public."Исходное событие" OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 26985)
-- Name: Исходное событие_событие_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Исходное событие_событие_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Исходное событие_событие_id_seq" OWNER TO postgres;

--
-- TOC entry 5385 (class 0 OID 0)
-- Dependencies: 257
-- Name: Исходное событие_событие_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Исходное событие_событие_id_seq" OWNED BY public."Исходное событие"."событие_id";


--
-- TOC entry 232 (class 1259 OID 26738)
-- Name: Категория угрозы; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Категория угрозы" (
    "категория_id" integer NOT NULL,
    "наименование" character varying(50) CONSTRAINT "Категория угроз_наименование_not_null" NOT NULL
);


ALTER TABLE public."Категория угрозы" OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 26737)
-- Name: Категория угрозы_категория_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Категория угрозы_категория_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Категория угрозы_категория_id_seq" OWNER TO postgres;

--
-- TOC entry 5386 (class 0 OID 0)
-- Dependencies: 231
-- Name: Категория угрозы_категория_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Категория угрозы_категория_id_seq" OWNED BY public."Категория угрозы"."категория_id";


--
-- TOC entry 242 (class 1259 OID 26795)
-- Name: Команда реагирования; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Команда реагирования" (
    "команда_id" integer CONSTRAINT "Команда реагирован_команда_id_not_null" NOT NULL,
    "наименование" character varying(100) CONSTRAINT "Команда реагиро_наименование_not_null" NOT NULL,
    "руководитель_id" integer
);


ALTER TABLE public."Команда реагирования" OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 26794)
-- Name: Команда реагирования_команда_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Команда реагирования_команда_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Команда реагирования_команда_id_seq" OWNER TO postgres;

--
-- TOC entry 5387 (class 0 OID 0)
-- Dependencies: 241
-- Name: Команда реагирования_команда_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Команда реагирования_команда_id_seq" OWNED BY public."Команда реагирования"."команда_id";


--
-- TOC entry 264 (class 1259 OID 27046)
-- Name: Комментарий к инциденту; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Комментарий к инциденту" (
    "комментарий_id" integer CONSTRAINT "Комментарий к и_комментарий_id_not_null" NOT NULL,
    "инцидент_id" integer CONSTRAINT "Комментарий к инци_инцидент_id_not_null" NOT NULL,
    "сотрудник_id" integer CONSTRAINT "Комментарий к инц_сотрудник_id_not_null" NOT NULL,
    "текст_комментария" text CONSTRAINT "Комментарий к _текст_коммент_not_null" NOT NULL,
    "создан_в" timestamp without time zone DEFAULT CURRENT_TIMESTAMP CONSTRAINT "Комментарий к инциде_создан_в_not_null" NOT NULL
);


ALTER TABLE public."Комментарий к инциденту" OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 27045)
-- Name: Комментарий к инц_комментарий_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Комментарий к инц_комментарий_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Комментарий к инц_комментарий_id_seq" OWNER TO postgres;

--
-- TOC entry 5388 (class 0 OID 0)
-- Dependencies: 263
-- Name: Комментарий к инц_комментарий_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Комментарий к инц_комментарий_id_seq" OWNED BY public."Комментарий к инциденту"."комментарий_id";


--
-- TOC entry 254 (class 1259 OID 26914)
-- Name: Мера устранения; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Мера устранения" (
    "мера_id" integer NOT NULL,
    "инцидент_id" integer NOT NULL,
    "тип_меры_id" integer NOT NULL,
    "описание" text NOT NULL,
    "создана_в" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Мера устранения" OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 26913)
-- Name: Мера устранения_мера_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Мера устранения_мера_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Мера устранения_мера_id_seq" OWNER TO postgres;

--
-- TOC entry 5389 (class 0 OID 0)
-- Dependencies: 253
-- Name: Мера устранения_мера_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Мера устранения_мера_id_seq" OWNED BY public."Мера устранения"."мера_id";


--
-- TOC entry 226 (class 1259 OID 26705)
-- Name: Подразделение; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Подразделение" (
    "подразделение_id" integer CONSTRAINT "Подразделение_подразделение__not_null" NOT NULL,
    "наименование" character varying(100) NOT NULL,
    "расположение" character varying(100)
);


ALTER TABLE public."Подразделение" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 26704)
-- Name: Подразделение_подразделение_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Подразделение_подразделение_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Подразделение_подразделение_id_seq" OWNER TO postgres;

--
-- TOC entry 5390 (class 0 OID 0)
-- Dependencies: 225
-- Name: Подразделение_подразделение_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Подразделение_подразделение_id_seq" OWNED BY public."Подразделение"."подразделение_id";


--
-- TOC entry 250 (class 1259 OID 26881)
-- Name: Правило обнаружения; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Правило обнаружения" (
    "правило_id" integer CONSTRAINT "Правило обнаружени_правило_id_not_null" NOT NULL,
    "наименование" character varying(100) CONSTRAINT "Правило обнаруж_наименование_not_null" NOT NULL,
    "тип_правила_id" integer CONSTRAINT "Правило обнаруж_тип_правила_id_not_null" NOT NULL,
    "условие" text NOT NULL
);


ALTER TABLE public."Правило обнаружения" OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 26880)
-- Name: Правило обнаружения_правило_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Правило обнаружения_правило_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Правило обнаружения_правило_id_seq" OWNER TO postgres;

--
-- TOC entry 5391 (class 0 OID 0)
-- Dependencies: 249
-- Name: Правило обнаружения_правило_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Правило обнаружения_правило_id_seq" OWNED BY public."Правило обнаружения"."правило_id";


--
-- TOC entry 270 (class 1259 OID 27105)
-- Name: Приложение к инциденту; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Приложение к инциденту" (
    "приложение_id" integer CONSTRAINT "Приложение к инц_приложение_id_not_null" NOT NULL,
    "инцидент_id" integer CONSTRAINT "Приложение к инцид_инцидент_id_not_null" NOT NULL,
    "имя_файла" character varying(255) CONSTRAINT "Приложение к инциде_имя_файла_not_null" NOT NULL,
    "путь_к_файлу" text CONSTRAINT "Приложение к инц_путь_к_файлу_not_null" NOT NULL,
    "загружено_в" timestamp without time zone DEFAULT CURRENT_TIMESTAMP CONSTRAINT "Приложение к инци_загружено_в_not_null" NOT NULL,
    "загрузил" integer
);


ALTER TABLE public."Приложение к инциденту" OWNER TO postgres;

--
-- TOC entry 269 (class 1259 OID 27104)
-- Name: Приложение к инцид_приложение_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Приложение к инцид_приложение_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Приложение к инцид_приложение_id_seq" OWNER TO postgres;

--
-- TOC entry 5392 (class 0 OID 0)
-- Dependencies: 269
-- Name: Приложение к инцид_приложение_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Приложение к инцид_приложение_id_seq" OWNED BY public."Приложение к инциденту"."приложение_id";


--
-- TOC entry 222 (class 1259 OID 26681)
-- Name: Приоритет инцидента; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Приоритет инцидента" (
    "приоритет_id" integer CONSTRAINT "Приоритет инциде_приоритет_id_not_null" NOT NULL,
    "наименование" character varying(50) CONSTRAINT "Приоритет инцид_наименование_not_null" NOT NULL,
    "уровень_срочности" integer CONSTRAINT "Приоритет инци_уровень_срочн_not_null" NOT NULL,
    CONSTRAINT "Приоритет инци_уровень_срочно_check" CHECK ((("уровень_срочности" >= 1) AND ("уровень_срочности" <= 5)))
);


ALTER TABLE public."Приоритет инцидента" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 26680)
-- Name: Приоритет инцидента_приоритет_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Приоритет инцидента_приоритет_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Приоритет инцидента_приоритет_id_seq" OWNER TO postgres;

--
-- TOC entry 5393 (class 0 OID 0)
-- Dependencies: 221
-- Name: Приоритет инцидента_приоритет_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Приоритет инцидента_приоритет_id_seq" OWNED BY public."Приоритет инцидента"."приоритет_id";


--
-- TOC entry 228 (class 1259 OID 26716)
-- Name: Роль сотрудника; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Роль сотрудника" (
    "роль_id" integer NOT NULL,
    "наименование" character varying(50) NOT NULL
);


ALTER TABLE public."Роль сотрудника" OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 26715)
-- Name: Роль сотрудника_роль_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Роль сотрудника_роль_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Роль сотрудника_роль_id_seq" OWNER TO postgres;

--
-- TOC entry 5394 (class 0 OID 0)
-- Dependencies: 227
-- Name: Роль сотрудника_роль_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Роль сотрудника_роль_id_seq" OWNED BY public."Роль сотрудника"."роль_id";


--
-- TOC entry 246 (class 1259 OID 26833)
-- Name: Сотрудник; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Сотрудник" (
    "сотрудник_id" integer NOT NULL,
    "фио" character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    "роль_id" integer NOT NULL,
    "группа_id" integer,
    "команда_id" integer
);


ALTER TABLE public."Сотрудник" OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 26832)
-- Name: Сотрудник_сотрудник_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Сотрудник_сотрудник_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Сотрудник_сотрудник_id_seq" OWNER TO postgres;

--
-- TOC entry 5395 (class 0 OID 0)
-- Dependencies: 245
-- Name: Сотрудник_сотрудник_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Сотрудник_сотрудник_id_seq" OWNED BY public."Сотрудник"."сотрудник_id";


--
-- TOC entry 220 (class 1259 OID 26668)
-- Name: Статус инцидента; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Статус инцидента" (
    "статус_id" integer NOT NULL,
    "наименование" character varying(50) CONSTRAINT "Статус инцидент_наименование_not_null" NOT NULL,
    "описание" text
);


ALTER TABLE public."Статус инцидента" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 26667)
-- Name: Статус инцидента_статус_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Статус инцидента_статус_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Статус инцидента_статус_id_seq" OWNER TO postgres;

--
-- TOC entry 5396 (class 0 OID 0)
-- Dependencies: 219
-- Name: Статус инцидента_статус_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Статус инцидента_статус_id_seq" OWNED BY public."Статус инцидента"."статус_id";


--
-- TOC entry 224 (class 1259 OID 26694)
-- Name: Тип актива; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Тип актива" (
    "тип_актива_id" integer NOT NULL,
    "наименование" character varying(50) NOT NULL
);


ALTER TABLE public."Тип актива" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 26693)
-- Name: Тип актива_тип_актива_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Тип актива_тип_актива_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Тип актива_тип_актива_id_seq" OWNER TO postgres;

--
-- TOC entry 5397 (class 0 OID 0)
-- Dependencies: 223
-- Name: Тип актива_тип_актива_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Тип актива_тип_актива_id_seq" OWNED BY public."Тип актива"."тип_актива_id";


--
-- TOC entry 236 (class 1259 OID 26760)
-- Name: Тип источника событий; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Тип источника событий" (
    "тип_источника_id" integer CONSTRAINT "Тип источника _тип_источника__not_null" NOT NULL,
    "наименование" character varying(50) CONSTRAINT "Тип источника с_наименование_not_null" NOT NULL
);


ALTER TABLE public."Тип источника событий" OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 26759)
-- Name: Тип источника со_тип_источника_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Тип источника со_тип_источника_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Тип источника со_тип_источника_id_seq" OWNER TO postgres;

--
-- TOC entry 5398 (class 0 OID 0)
-- Dependencies: 235
-- Name: Тип источника со_тип_источника_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Тип источника со_тип_источника_id_seq" OWNED BY public."Тип источника событий"."тип_источника_id";


--
-- TOC entry 230 (class 1259 OID 26727)
-- Name: Тип меры реагирования; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Тип меры реагирования" (
    "тип_меры_id" integer CONSTRAINT "Тип меры реагирова_тип_меры_id_not_null" NOT NULL,
    "наименование" character varying(50) CONSTRAINT "Тип меры реагир_наименование_not_null" NOT NULL
);


ALTER TABLE public."Тип меры реагирования" OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 26726)
-- Name: Тип меры реагирования_тип_меры_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Тип меры реагирования_тип_меры_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Тип меры реагирования_тип_меры_id_seq" OWNER TO postgres;

--
-- TOC entry 5399 (class 0 OID 0)
-- Dependencies: 229
-- Name: Тип меры реагирования_тип_меры_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Тип меры реагирования_тип_меры_id_seq" OWNED BY public."Тип меры реагирования"."тип_меры_id";


--
-- TOC entry 234 (class 1259 OID 26749)
-- Name: Тип правила обнаружения; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Тип правила обнаружения" (
    "тип_правила_id" integer CONSTRAINT "Тип правила обн_тип_правила_id_not_null" NOT NULL,
    "наименование" character varying(50) CONSTRAINT "Тип правила обн_наименование_not_null" NOT NULL
);


ALTER TABLE public."Тип правила обнаружения" OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 26748)
-- Name: Тип правила обнару_тип_правила_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Тип правила обнару_тип_правила_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Тип правила обнару_тип_правила_id_seq" OWNER TO postgres;

--
-- TOC entry 5400 (class 0 OID 0)
-- Dependencies: 233
-- Name: Тип правила обнару_тип_правила_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Тип правила обнару_тип_правила_id_seq" OWNED BY public."Тип правила обнаружения"."тип_правила_id";


--
-- TOC entry 260 (class 1259 OID 27010)
-- Name: Уведомление; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Уведомление" (
    "уведомление_id" integer NOT NULL,
    "инцидент_id" integer NOT NULL,
    "получатель" character varying(150) NOT NULL,
    "отправлено_в" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "канал" character varying(30) NOT NULL,
    CONSTRAINT "Уведомление_канал_check" CHECK ((("канал")::text = ANY ((ARRAY['email'::character varying, 'telegram'::character varying, 'siem'::character varying])::text[])))
);


ALTER TABLE public."Уведомление" OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 27009)
-- Name: Уведомление_уведомление_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Уведомление_уведомление_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Уведомление_уведомление_id_seq" OWNER TO postgres;

--
-- TOC entry 5401 (class 0 OID 0)
-- Dependencies: 259
-- Name: Уведомление_уведомление_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Уведомление_уведомление_id_seq" OWNED BY public."Уведомление"."уведомление_id";


--
-- TOC entry 248 (class 1259 OID 26866)
-- Name: Угроза; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Угроза" (
    "угроза_id" integer NOT NULL,
    "наименование" character varying(150) NOT NULL,
    mitre_id character varying(20),
    "категория_id" integer NOT NULL
);


ALTER TABLE public."Угроза" OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 26865)
-- Name: Угроза_угроза_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Угроза_угроза_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Угроза_угроза_id_seq" OWNER TO postgres;

--
-- TOC entry 5402 (class 0 OID 0)
-- Dependencies: 247
-- Name: Угроза_угроза_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Угроза_угроза_id_seq" OWNED BY public."Угроза"."угроза_id";


--
-- TOC entry 238 (class 1259 OID 26771)
-- Name: Уровень обслуживания; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Уровень обслуживания" (
    sla_id integer NOT NULL,
    "наименование" character varying(100) CONSTRAINT "Уровень обслужи_наименование_not_null" NOT NULL,
    "часы_реагирования" integer CONSTRAINT "Уровень обслуж_часы_реагиров_not_null" NOT NULL,
    "часы_устранения" integer CONSTRAINT "Уровень обслуж_часы_устранен_not_null" NOT NULL
);


ALTER TABLE public."Уровень обслуживания" OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 26770)
-- Name: Уровень обслуживания_sla_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Уровень обслуживания_sla_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Уровень обслуживания_sla_id_seq" OWNER TO postgres;

--
-- TOC entry 5403 (class 0 OID 0)
-- Dependencies: 237
-- Name: Уровень обслуживания_sla_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Уровень обслуживания_sla_id_seq" OWNED BY public."Уровень обслуживания".sla_id;


--
-- TOC entry 268 (class 1259 OID 27086)
-- Name: Уязвимость актива; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Уязвимость актива" (
    "уязвимость_id" integer CONSTRAINT "Уязвимость акти_уязвимость_id_not_null" NOT NULL,
    "актив_id" integer NOT NULL,
    cve_id character varying(20) NOT NULL,
    "степень_опасности" character varying(20) CONSTRAINT "Уязвимость акт_степень_опасн_not_null" NOT NULL,
    "обнаружена_в" date DEFAULT CURRENT_DATE CONSTRAINT "Уязвимость акти_обнаружена_в_not_null" NOT NULL,
    CONSTRAINT "Уязвимость акт_степень_опасно_check" CHECK ((("степень_опасности")::text = ANY ((ARRAY['critical'::character varying, 'high'::character varying, 'medium'::character varying, 'low'::character varying])::text[])))
);


ALTER TABLE public."Уязвимость актива" OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 27085)
-- Name: Уязвимость актива_уязвимость_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Уязвимость актива_уязвимость_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Уязвимость актива_уязвимость_id_seq" OWNER TO postgres;

--
-- TOC entry 5404 (class 0 OID 0)
-- Dependencies: 267
-- Name: Уязвимость актива_уязвимость_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Уязвимость актива_уязвимость_id_seq" OWNED BY public."Уязвимость актива"."уязвимость_id";


--
-- TOC entry 274 (class 1259 OID 27162)
-- Name: Эскалация инцидента; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Эскалация инцидента" (
    "эскалация_id" integer CONSTRAINT "Эскалация инциде_эскалация_id_not_null" NOT NULL,
    "инцидент_id" integer CONSTRAINT "Эскалация инциден_инцидент_id_not_null" NOT NULL,
    "эскалировано_в" timestamp without time zone DEFAULT CURRENT_TIMESTAMP CONSTRAINT "Эскалация инци_эскалировано__not_null" NOT NULL,
    "эскалировал" integer,
    "причина" text,
    "целевая_команда_id" integer
);


ALTER TABLE public."Эскалация инцидента" OWNER TO postgres;

--
-- TOC entry 273 (class 1259 OID 27161)
-- Name: Эскалация инцидента_эскалация_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Эскалация инцидента_эскалация_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Эскалация инцидента_эскалация_id_seq" OWNER TO postgres;

--
-- TOC entry 5405 (class 0 OID 0)
-- Dependencies: 273
-- Name: Эскалация инцидента_эскалация_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Эскалация инцидента_эскалация_id_seq" OWNED BY public."Эскалация инцидента"."эскалация_id";


--
-- TOC entry 5003 (class 2604 OID 26809)
-- Name: Актив актив_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Актив" ALTER COLUMN "актив_id" SET DEFAULT nextval('public."Актив_актив_id_seq"'::regclass);


--
-- TOC entry 5001 (class 2604 OID 26787)
-- Name: Группа сотрудников группа_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Группа сотрудников" ALTER COLUMN "группа_id" SET DEFAULT nextval('public."Группа сотрудников_группа_id_seq"'::regclass);


--
-- TOC entry 5017 (class 2604 OID 27032)
-- Name: Журнал аудита запись_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Журнал аудита" ALTER COLUMN "запись_id" SET DEFAULT nextval('public."Журнал аудита_запись_id_seq"'::regclass);


--
-- TOC entry 5021 (class 2604 OID 27074)
-- Name: Информация об угрозах ид_угрозы_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Информация об угрозах" ALTER COLUMN "ид_угрозы_id" SET DEFAULT nextval('public."Информация об угроза_ид_угрозы_id_seq"'::regclass);


--
-- TOC entry 5010 (class 2604 OID 26937)
-- Name: Инцидент инцидент_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Инцидент" ALTER COLUMN "инцидент_id" SET DEFAULT nextval('public."Инцидент_инцидент_id_seq"'::regclass);


--
-- TOC entry 5026 (class 2604 OID 27133)
-- Name: История состояния инцидента история_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."История состояния инцидента" ALTER COLUMN "история_id" SET DEFAULT nextval('public."История состояния инц_история_id_seq"'::regclass);


--
-- TOC entry 5007 (class 2604 OID 26902)
-- Name: Источник событий источник_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Источник событий" ALTER COLUMN "источник_id" SET DEFAULT nextval('public."Источник событий_источник_id_seq"'::regclass);


--
-- TOC entry 5013 (class 2604 OID 26989)
-- Name: Исходное событие событие_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Исходное событие" ALTER COLUMN "событие_id" SET DEFAULT nextval('public."Исходное событие_событие_id_seq"'::regclass);


--
-- TOC entry 4997 (class 2604 OID 26741)
-- Name: Категория угрозы категория_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Категория угрозы" ALTER COLUMN "категория_id" SET DEFAULT nextval('public."Категория угрозы_категория_id_seq"'::regclass);


--
-- TOC entry 5002 (class 2604 OID 26798)
-- Name: Команда реагирования команда_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Команда реагирования" ALTER COLUMN "команда_id" SET DEFAULT nextval('public."Команда реагирования_команда_id_seq"'::regclass);


--
-- TOC entry 5019 (class 2604 OID 27049)
-- Name: Комментарий к инциденту комментарий_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Комментарий к инциденту" ALTER COLUMN "комментарий_id" SET DEFAULT nextval('public."Комментарий к инц_комментарий_id_seq"'::regclass);


--
-- TOC entry 5008 (class 2604 OID 26917)
-- Name: Мера устранения мера_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Мера устранения" ALTER COLUMN "мера_id" SET DEFAULT nextval('public."Мера устранения_мера_id_seq"'::regclass);


--
-- TOC entry 4994 (class 2604 OID 26708)
-- Name: Подразделение подразделение_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Подразделение" ALTER COLUMN "подразделение_id" SET DEFAULT nextval('public."Подразделение_подразделение_id_seq"'::regclass);


--
-- TOC entry 5006 (class 2604 OID 26884)
-- Name: Правило обнаружения правило_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Правило обнаружения" ALTER COLUMN "правило_id" SET DEFAULT nextval('public."Правило обнаружения_правило_id_seq"'::regclass);


--
-- TOC entry 5024 (class 2604 OID 27108)
-- Name: Приложение к инциденту приложение_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Приложение к инциденту" ALTER COLUMN "приложение_id" SET DEFAULT nextval('public."Приложение к инцид_приложение_id_seq"'::regclass);


--
-- TOC entry 4992 (class 2604 OID 26684)
-- Name: Приоритет инцидента приоритет_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Приоритет инцидента" ALTER COLUMN "приоритет_id" SET DEFAULT nextval('public."Приоритет инцидента_приоритет_id_seq"'::regclass);


--
-- TOC entry 4995 (class 2604 OID 26719)
-- Name: Роль сотрудника роль_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Роль сотрудника" ALTER COLUMN "роль_id" SET DEFAULT nextval('public."Роль сотрудника_роль_id_seq"'::regclass);


--
-- TOC entry 5004 (class 2604 OID 26836)
-- Name: Сотрудник сотрудник_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Сотрудник" ALTER COLUMN "сотрудник_id" SET DEFAULT nextval('public."Сотрудник_сотрудник_id_seq"'::regclass);


--
-- TOC entry 4991 (class 2604 OID 26671)
-- Name: Статус инцидента статус_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Статус инцидента" ALTER COLUMN "статус_id" SET DEFAULT nextval('public."Статус инцидента_статус_id_seq"'::regclass);


--
-- TOC entry 4993 (class 2604 OID 26697)
-- Name: Тип актива тип_актива_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Тип актива" ALTER COLUMN "тип_актива_id" SET DEFAULT nextval('public."Тип актива_тип_актива_id_seq"'::regclass);


--
-- TOC entry 4999 (class 2604 OID 26763)
-- Name: Тип источника событий тип_источника_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Тип источника событий" ALTER COLUMN "тип_источника_id" SET DEFAULT nextval('public."Тип источника со_тип_источника_id_seq"'::regclass);


--
-- TOC entry 4996 (class 2604 OID 26730)
-- Name: Тип меры реагирования тип_меры_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Тип меры реагирования" ALTER COLUMN "тип_меры_id" SET DEFAULT nextval('public."Тип меры реагирования_тип_меры_id_seq"'::regclass);


--
-- TOC entry 4998 (class 2604 OID 26752)
-- Name: Тип правила обнаружения тип_правила_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Тип правила обнаружения" ALTER COLUMN "тип_правила_id" SET DEFAULT nextval('public."Тип правила обнару_тип_правила_id_seq"'::regclass);


--
-- TOC entry 5015 (class 2604 OID 27013)
-- Name: Уведомление уведомление_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Уведомление" ALTER COLUMN "уведомление_id" SET DEFAULT nextval('public."Уведомление_уведомление_id_seq"'::regclass);


--
-- TOC entry 5005 (class 2604 OID 26869)
-- Name: Угроза угроза_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Угроза" ALTER COLUMN "угроза_id" SET DEFAULT nextval('public."Угроза_угроза_id_seq"'::regclass);


--
-- TOC entry 5000 (class 2604 OID 26774)
-- Name: Уровень обслуживания sla_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Уровень обслуживания" ALTER COLUMN sla_id SET DEFAULT nextval('public."Уровень обслуживания_sla_id_seq"'::regclass);


--
-- TOC entry 5022 (class 2604 OID 27089)
-- Name: Уязвимость актива уязвимость_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Уязвимость актива" ALTER COLUMN "уязвимость_id" SET DEFAULT nextval('public."Уязвимость актива_уязвимость_id_seq"'::regclass);


--
-- TOC entry 5028 (class 2604 OID 27165)
-- Name: Эскалация инцидента эскалация_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Эскалация инцидента" ALTER COLUMN "эскалация_id" SET DEFAULT nextval('public."Эскалация инцидента_эскалация_id_seq"'::regclass);


--
-- TOC entry 5340 (class 0 OID 26806)
-- Dependencies: 244
-- Data for Name: Актив; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Актив" ("актив_id", "наименование", "ip_адрес", "тип_актива_id", "подразделение_id", "дата_ввода", sla_id) FROM stdin;
\.


--
-- TOC entry 5336 (class 0 OID 26784)
-- Dependencies: 240
-- Data for Name: Группа сотрудников; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Группа сотрудников" ("группа_id", "наименование") FROM stdin;
\.


--
-- TOC entry 5358 (class 0 OID 27029)
-- Dependencies: 262
-- Data for Name: Журнал аудита; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Журнал аудита" ("запись_id", "сотрудник_id", "действие", "время_действия") FROM stdin;
\.


--
-- TOC entry 5362 (class 0 OID 27071)
-- Dependencies: 266
-- Data for Name: Информация об угрозах; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Информация об угрозах" ("ид_угрозы_id", "индикатор", "угроза_id", "действует_до") FROM stdin;
\.


--
-- TOC entry 5352 (class 0 OID 26934)
-- Dependencies: 256
-- Data for Name: Инцидент; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Инцидент" ("инцидент_id", "заголовок", "описание", "время_обнаружения", "время_закрытия", "статус_id", "приоритет_id", "затронутый_актив_id", "ответственный_сотрудник_id", "правило_обнаружения_id", "основная_угроза_id", "требуется_эскалация") FROM stdin;
\.


--
-- TOC entry 5368 (class 0 OID 27130)
-- Dependencies: 272
-- Data for Name: История состояния инцидента; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."История состояния инцидента" ("история_id", "инцидент_id", "старый_статус_id", "новый_статус_id", "изменено_в", "изменил") FROM stdin;
\.


--
-- TOC entry 5348 (class 0 OID 26899)
-- Dependencies: 252
-- Data for Name: Источник событий; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Источник событий" ("источник_id", "наименование", "тип_источника_id") FROM stdin;
\.


--
-- TOC entry 5354 (class 0 OID 26986)
-- Dependencies: 258
-- Data for Name: Исходное событие; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Исходное событие" ("событие_id", "время_события", "сырой_лог", "источник_id", "инцидент_id") FROM stdin;
\.


--
-- TOC entry 5328 (class 0 OID 26738)
-- Dependencies: 232
-- Data for Name: Категория угрозы; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Категория угрозы" ("категория_id", "наименование") FROM stdin;
\.


--
-- TOC entry 5338 (class 0 OID 26795)
-- Dependencies: 242
-- Data for Name: Команда реагирования; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Команда реагирования" ("команда_id", "наименование", "руководитель_id") FROM stdin;
\.


--
-- TOC entry 5360 (class 0 OID 27046)
-- Dependencies: 264
-- Data for Name: Комментарий к инциденту; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Комментарий к инциденту" ("комментарий_id", "инцидент_id", "сотрудник_id", "текст_комментария", "создан_в") FROM stdin;
\.


--
-- TOC entry 5350 (class 0 OID 26914)
-- Dependencies: 254
-- Data for Name: Мера устранения; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Мера устранения" ("мера_id", "инцидент_id", "тип_меры_id", "описание", "создана_в") FROM stdin;
\.


--
-- TOC entry 5322 (class 0 OID 26705)
-- Dependencies: 226
-- Data for Name: Подразделение; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Подразделение" ("подразделение_id", "наименование", "расположение") FROM stdin;
\.


--
-- TOC entry 5346 (class 0 OID 26881)
-- Dependencies: 250
-- Data for Name: Правило обнаружения; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Правило обнаружения" ("правило_id", "наименование", "тип_правила_id", "условие") FROM stdin;
\.


--
-- TOC entry 5366 (class 0 OID 27105)
-- Dependencies: 270
-- Data for Name: Приложение к инциденту; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Приложение к инциденту" ("приложение_id", "инцидент_id", "имя_файла", "путь_к_файлу", "загружено_в", "загрузил") FROM stdin;
\.


--
-- TOC entry 5318 (class 0 OID 26681)
-- Dependencies: 222
-- Data for Name: Приоритет инцидента; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Приоритет инцидента" ("приоритет_id", "наименование", "уровень_срочности") FROM stdin;
\.


--
-- TOC entry 5324 (class 0 OID 26716)
-- Dependencies: 228
-- Data for Name: Роль сотрудника; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Роль сотрудника" ("роль_id", "наименование") FROM stdin;
\.


--
-- TOC entry 5342 (class 0 OID 26833)
-- Dependencies: 246
-- Data for Name: Сотрудник; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Сотрудник" ("сотрудник_id", "фио", email, "роль_id", "группа_id", "команда_id") FROM stdin;
\.


--
-- TOC entry 5316 (class 0 OID 26668)
-- Dependencies: 220
-- Data for Name: Статус инцидента; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Статус инцидента" ("статус_id", "наименование", "описание") FROM stdin;
\.


--
-- TOC entry 5320 (class 0 OID 26694)
-- Dependencies: 224
-- Data for Name: Тип актива; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Тип актива" ("тип_актива_id", "наименование") FROM stdin;
\.


--
-- TOC entry 5332 (class 0 OID 26760)
-- Dependencies: 236
-- Data for Name: Тип источника событий; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Тип источника событий" ("тип_источника_id", "наименование") FROM stdin;
\.


--
-- TOC entry 5326 (class 0 OID 26727)
-- Dependencies: 230
-- Data for Name: Тип меры реагирования; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Тип меры реагирования" ("тип_меры_id", "наименование") FROM stdin;
\.


--
-- TOC entry 5330 (class 0 OID 26749)
-- Dependencies: 234
-- Data for Name: Тип правила обнаружения; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Тип правила обнаружения" ("тип_правила_id", "наименование") FROM stdin;
\.


--
-- TOC entry 5356 (class 0 OID 27010)
-- Dependencies: 260
-- Data for Name: Уведомление; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Уведомление" ("уведомление_id", "инцидент_id", "получатель", "отправлено_в", "канал") FROM stdin;
\.


--
-- TOC entry 5344 (class 0 OID 26866)
-- Dependencies: 248
-- Data for Name: Угроза; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Угроза" ("угроза_id", "наименование", mitre_id, "категория_id") FROM stdin;
\.


--
-- TOC entry 5334 (class 0 OID 26771)
-- Dependencies: 238
-- Data for Name: Уровень обслуживания; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Уровень обслуживания" (sla_id, "наименование", "часы_реагирования", "часы_устранения") FROM stdin;
\.


--
-- TOC entry 5364 (class 0 OID 27086)
-- Dependencies: 268
-- Data for Name: Уязвимость актива; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Уязвимость актива" ("уязвимость_id", "актив_id", cve_id, "степень_опасности", "обнаружена_в") FROM stdin;
\.


--
-- TOC entry 5370 (class 0 OID 27162)
-- Dependencies: 274
-- Data for Name: Эскалация инцидента; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Эскалация инцидента" ("эскалация_id", "инцидент_id", "эскалировано_в", "эскалировал", "причина", "целевая_команда_id") FROM stdin;
\.


--
-- TOC entry 5406 (class 0 OID 0)
-- Dependencies: 243
-- Name: Актив_актив_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Актив_актив_id_seq"', 1, false);


--
-- TOC entry 5407 (class 0 OID 0)
-- Dependencies: 239
-- Name: Группа сотрудников_группа_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Группа сотрудников_группа_id_seq"', 1, false);


--
-- TOC entry 5408 (class 0 OID 0)
-- Dependencies: 261
-- Name: Журнал аудита_запись_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Журнал аудита_запись_id_seq"', 1, false);


--
-- TOC entry 5409 (class 0 OID 0)
-- Dependencies: 265
-- Name: Информация об угроза_ид_угрозы_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Информация об угроза_ид_угрозы_id_seq"', 1, false);


--
-- TOC entry 5410 (class 0 OID 0)
-- Dependencies: 255
-- Name: Инцидент_инцидент_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Инцидент_инцидент_id_seq"', 1, false);


--
-- TOC entry 5411 (class 0 OID 0)
-- Dependencies: 271
-- Name: История состояния инц_история_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."История состояния инц_история_id_seq"', 1, false);


--
-- TOC entry 5412 (class 0 OID 0)
-- Dependencies: 251
-- Name: Источник событий_источник_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Источник событий_источник_id_seq"', 1, false);


--
-- TOC entry 5413 (class 0 OID 0)
-- Dependencies: 257
-- Name: Исходное событие_событие_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Исходное событие_событие_id_seq"', 1, false);


--
-- TOC entry 5414 (class 0 OID 0)
-- Dependencies: 231
-- Name: Категория угрозы_категория_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Категория угрозы_категория_id_seq"', 1, false);


--
-- TOC entry 5415 (class 0 OID 0)
-- Dependencies: 241
-- Name: Команда реагирования_команда_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Команда реагирования_команда_id_seq"', 1, false);


--
-- TOC entry 5416 (class 0 OID 0)
-- Dependencies: 263
-- Name: Комментарий к инц_комментарий_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Комментарий к инц_комментарий_id_seq"', 1, false);


--
-- TOC entry 5417 (class 0 OID 0)
-- Dependencies: 253
-- Name: Мера устранения_мера_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Мера устранения_мера_id_seq"', 1, false);


--
-- TOC entry 5418 (class 0 OID 0)
-- Dependencies: 225
-- Name: Подразделение_подразделение_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Подразделение_подразделение_id_seq"', 1, false);


--
-- TOC entry 5419 (class 0 OID 0)
-- Dependencies: 249
-- Name: Правило обнаружения_правило_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Правило обнаружения_правило_id_seq"', 1, false);


--
-- TOC entry 5420 (class 0 OID 0)
-- Dependencies: 269
-- Name: Приложение к инцид_приложение_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Приложение к инцид_приложение_id_seq"', 1, false);


--
-- TOC entry 5421 (class 0 OID 0)
-- Dependencies: 221
-- Name: Приоритет инцидента_приоритет_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Приоритет инцидента_приоритет_id_seq"', 1, false);


--
-- TOC entry 5422 (class 0 OID 0)
-- Dependencies: 227
-- Name: Роль сотрудника_роль_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Роль сотрудника_роль_id_seq"', 1, false);


--
-- TOC entry 5423 (class 0 OID 0)
-- Dependencies: 245
-- Name: Сотрудник_сотрудник_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Сотрудник_сотрудник_id_seq"', 1, false);


--
-- TOC entry 5424 (class 0 OID 0)
-- Dependencies: 219
-- Name: Статус инцидента_статус_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Статус инцидента_статус_id_seq"', 1, false);


--
-- TOC entry 5425 (class 0 OID 0)
-- Dependencies: 223
-- Name: Тип актива_тип_актива_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Тип актива_тип_актива_id_seq"', 1, false);


--
-- TOC entry 5426 (class 0 OID 0)
-- Dependencies: 235
-- Name: Тип источника со_тип_источника_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Тип источника со_тип_источника_id_seq"', 1, false);


--
-- TOC entry 5427 (class 0 OID 0)
-- Dependencies: 229
-- Name: Тип меры реагирования_тип_меры_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Тип меры реагирования_тип_меры_id_seq"', 1, false);


--
-- TOC entry 5428 (class 0 OID 0)
-- Dependencies: 233
-- Name: Тип правила обнару_тип_правила_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Тип правила обнару_тип_правила_id_seq"', 1, false);


--
-- TOC entry 5429 (class 0 OID 0)
-- Dependencies: 259
-- Name: Уведомление_уведомление_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Уведомление_уведомление_id_seq"', 1, false);


--
-- TOC entry 5430 (class 0 OID 0)
-- Dependencies: 247
-- Name: Угроза_угроза_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Угроза_угроза_id_seq"', 1, false);


--
-- TOC entry 5431 (class 0 OID 0)
-- Dependencies: 237
-- Name: Уровень обслуживания_sla_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Уровень обслуживания_sla_id_seq"', 1, false);


--
-- TOC entry 5432 (class 0 OID 0)
-- Dependencies: 267
-- Name: Уязвимость актива_уязвимость_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Уязвимость актива_уязвимость_id_seq"', 1, false);


--
-- TOC entry 5433 (class 0 OID 0)
-- Dependencies: 273
-- Name: Эскалация инцидента_эскалация_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Эскалация инцидента_эскалация_id_seq"', 1, false);


--
-- TOC entry 5083 (class 2606 OID 26816)
-- Name: Актив Актив_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Актив"
    ADD CONSTRAINT "Актив_pkey" PRIMARY KEY ("актив_id");


--
-- TOC entry 5075 (class 2606 OID 26793)
-- Name: Группа сотрудников Группа сотруднико_наименование_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Группа сотрудников"
    ADD CONSTRAINT "Группа сотруднико_наименование_key" UNIQUE ("наименование");


--
-- TOC entry 5077 (class 2606 OID 26791)
-- Name: Группа сотрудников Группа сотрудников_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Группа сотрудников"
    ADD CONSTRAINT "Группа сотрудников_pkey" PRIMARY KEY ("группа_id");


--
-- TOC entry 5115 (class 2606 OID 27039)
-- Name: Журнал аудита Журнал аудита_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Журнал аудита"
    ADD CONSTRAINT "Журнал аудита_pkey" PRIMARY KEY ("запись_id");


--
-- TOC entry 5120 (class 2606 OID 27079)
-- Name: Информация об угрозах Информация об угрозах_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Информация об угрозах"
    ADD CONSTRAINT "Информация об угрозах_pkey" PRIMARY KEY ("ид_угрозы_id");


--
-- TOC entry 5105 (class 2606 OID 26949)
-- Name: Инцидент Инцидент_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Инцидент"
    ADD CONSTRAINT "Инцидент_pkey" PRIMARY KEY ("инцидент_id");


--
-- TOC entry 5129 (class 2606 OID 27140)
-- Name: История состояния инцидента История состояния инцидента_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."История состояния инцидента"
    ADD CONSTRAINT "История состояния инцидента_pkey" PRIMARY KEY ("история_id");


--
-- TOC entry 5093 (class 2606 OID 26907)
-- Name: Источник событий Источник событий_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Источник событий"
    ADD CONSTRAINT "Источник событий_pkey" PRIMARY KEY ("источник_id");


--
-- TOC entry 5109 (class 2606 OID 26998)
-- Name: Исходное событие Исходное событие_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Исходное событие"
    ADD CONSTRAINT "Исходное событие_pkey" PRIMARY KEY ("событие_id");


--
-- TOC entry 5059 (class 2606 OID 26745)
-- Name: Категория угрозы Категория угрозы_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Категория угрозы"
    ADD CONSTRAINT "Категория угрозы_pkey" PRIMARY KEY ("категория_id");


--
-- TOC entry 5061 (class 2606 OID 26747)
-- Name: Категория угрозы Категория угрозы_наименование_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Категория угрозы"
    ADD CONSTRAINT "Категория угрозы_наименование_key" UNIQUE ("наименование");


--
-- TOC entry 5079 (class 2606 OID 26804)
-- Name: Команда реагирования Команда реагирова_наименование_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Команда реагирования"
    ADD CONSTRAINT "Команда реагирова_наименование_key" UNIQUE ("наименование");


--
-- TOC entry 5081 (class 2606 OID 26802)
-- Name: Команда реагирования Команда реагирования_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Команда реагирования"
    ADD CONSTRAINT "Команда реагирования_pkey" PRIMARY KEY ("команда_id");


--
-- TOC entry 5118 (class 2606 OID 27059)
-- Name: Комментарий к инциденту Комментарий к инциденту_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Комментарий к инциденту"
    ADD CONSTRAINT "Комментарий к инциденту_pkey" PRIMARY KEY ("комментарий_id");


--
-- TOC entry 5096 (class 2606 OID 26927)
-- Name: Мера устранения Мера устранения_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Мера устранения"
    ADD CONSTRAINT "Мера устранения_pkey" PRIMARY KEY ("мера_id");


--
-- TOC entry 5047 (class 2606 OID 26712)
-- Name: Подразделение Подразделение_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Подразделение"
    ADD CONSTRAINT "Подразделение_pkey" PRIMARY KEY ("подразделение_id");


--
-- TOC entry 5049 (class 2606 OID 26714)
-- Name: Подразделение Подразделение_наименование_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Подразделение"
    ADD CONSTRAINT "Подразделение_наименование_key" UNIQUE ("наименование");


--
-- TOC entry 5091 (class 2606 OID 26892)
-- Name: Правило обнаружения Правило обнаружения_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Правило обнаружения"
    ADD CONSTRAINT "Правило обнаружения_pkey" PRIMARY KEY ("правило_id");


--
-- TOC entry 5126 (class 2606 OID 27118)
-- Name: Приложение к инциденту Приложение к инциденту_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Приложение к инциденту"
    ADD CONSTRAINT "Приложение к инциденту_pkey" PRIMARY KEY ("приложение_id");


--
-- TOC entry 5039 (class 2606 OID 26692)
-- Name: Приоритет инцидента Приоритет инциден_наименование_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Приоритет инцидента"
    ADD CONSTRAINT "Приоритет инциден_наименование_key" UNIQUE ("наименование");


--
-- TOC entry 5041 (class 2606 OID 26690)
-- Name: Приоритет инцидента Приоритет инцидента_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Приоритет инцидента"
    ADD CONSTRAINT "Приоритет инцидента_pkey" PRIMARY KEY ("приоритет_id");


--
-- TOC entry 5051 (class 2606 OID 26723)
-- Name: Роль сотрудника Роль сотрудника_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Роль сотрудника"
    ADD CONSTRAINT "Роль сотрудника_pkey" PRIMARY KEY ("роль_id");


--
-- TOC entry 5053 (class 2606 OID 26725)
-- Name: Роль сотрудника Роль сотрудника_наименование_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Роль сотрудника"
    ADD CONSTRAINT "Роль сотрудника_наименование_key" UNIQUE ("наименование");


--
-- TOC entry 5085 (class 2606 OID 26844)
-- Name: Сотрудник Сотрудник_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Сотрудник"
    ADD CONSTRAINT "Сотрудник_email_key" UNIQUE (email);


--
-- TOC entry 5087 (class 2606 OID 26842)
-- Name: Сотрудник Сотрудник_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Сотрудник"
    ADD CONSTRAINT "Сотрудник_pkey" PRIMARY KEY ("сотрудник_id");


--
-- TOC entry 5035 (class 2606 OID 26677)
-- Name: Статус инцидента Статус инцидента_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Статус инцидента"
    ADD CONSTRAINT "Статус инцидента_pkey" PRIMARY KEY ("статус_id");


--
-- TOC entry 5037 (class 2606 OID 26679)
-- Name: Статус инцидента Статус инцидента_наименование_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Статус инцидента"
    ADD CONSTRAINT "Статус инцидента_наименование_key" UNIQUE ("наименование");


--
-- TOC entry 5043 (class 2606 OID 26701)
-- Name: Тип актива Тип актива_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Тип актива"
    ADD CONSTRAINT "Тип актива_pkey" PRIMARY KEY ("тип_актива_id");


--
-- TOC entry 5045 (class 2606 OID 26703)
-- Name: Тип актива Тип актива_наименование_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Тип актива"
    ADD CONSTRAINT "Тип актива_наименование_key" UNIQUE ("наименование");


--
-- TOC entry 5067 (class 2606 OID 26769)
-- Name: Тип источника событий Тип источника собы_наименование_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Тип источника событий"
    ADD CONSTRAINT "Тип источника собы_наименование_key" UNIQUE ("наименование");


--
-- TOC entry 5069 (class 2606 OID 26767)
-- Name: Тип источника событий Тип источника событий_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Тип источника событий"
    ADD CONSTRAINT "Тип источника событий_pkey" PRIMARY KEY ("тип_источника_id");


--
-- TOC entry 5055 (class 2606 OID 26736)
-- Name: Тип меры реагирования Тип меры реагирова_наименование_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Тип меры реагирования"
    ADD CONSTRAINT "Тип меры реагирова_наименование_key" UNIQUE ("наименование");


--
-- TOC entry 5057 (class 2606 OID 26734)
-- Name: Тип меры реагирования Тип меры реагирования_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Тип меры реагирования"
    ADD CONSTRAINT "Тип меры реагирования_pkey" PRIMARY KEY ("тип_меры_id");


--
-- TOC entry 5063 (class 2606 OID 26758)
-- Name: Тип правила обнаружения Тип правила обнару_наименование_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Тип правила обнаружения"
    ADD CONSTRAINT "Тип правила обнару_наименование_key" UNIQUE ("наименование");


--
-- TOC entry 5065 (class 2606 OID 26756)
-- Name: Тип правила обнаружения Тип правила обнаружения_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Тип правила обнаружения"
    ADD CONSTRAINT "Тип правила обнаружения_pkey" PRIMARY KEY ("тип_правила_id");


--
-- TOC entry 5112 (class 2606 OID 27022)
-- Name: Уведомление Уведомление_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Уведомление"
    ADD CONSTRAINT "Уведомление_pkey" PRIMARY KEY ("уведомление_id");


--
-- TOC entry 5089 (class 2606 OID 26874)
-- Name: Угроза Угроза_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Угроза"
    ADD CONSTRAINT "Угроза_pkey" PRIMARY KEY ("угроза_id");


--
-- TOC entry 5071 (class 2606 OID 26782)
-- Name: Уровень обслуживания Уровень обслужива_наименование_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Уровень обслуживания"
    ADD CONSTRAINT "Уровень обслужива_наименование_key" UNIQUE ("наименование");


--
-- TOC entry 5073 (class 2606 OID 26780)
-- Name: Уровень обслуживания Уровень обслуживания_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Уровень обслуживания"
    ADD CONSTRAINT "Уровень обслуживания_pkey" PRIMARY KEY (sla_id);


--
-- TOC entry 5123 (class 2606 OID 27098)
-- Name: Уязвимость актива Уязвимость актива_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Уязвимость актива"
    ADD CONSTRAINT "Уязвимость актива_pkey" PRIMARY KEY ("уязвимость_id");


--
-- TOC entry 5132 (class 2606 OID 27173)
-- Name: Эскалация инцидента Эскалация инцидента_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Эскалация инцидента"
    ADD CONSTRAINT "Эскалация инцидента_pkey" PRIMARY KEY ("эскалация_id");


--
-- TOC entry 5113 (class 1259 OID 27200)
-- Name: idx_аудит_сотрудник; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_аудит_сотрудник" ON public."Журнал аудита" USING btree ("сотрудник_id");


--
-- TOC entry 5097 (class 1259 OID 27191)
-- Name: idx_инцидент_актив; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_инцидент_актив" ON public."Инцидент" USING btree ("затронутый_актив_id");


--
-- TOC entry 5098 (class 1259 OID 27195)
-- Name: idx_инцидент_время; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_инцидент_время" ON public."Инцидент" USING btree ("время_обнаружения");


--
-- TOC entry 5099 (class 1259 OID 27192)
-- Name: idx_инцидент_ответственный; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_инцидент_ответственный" ON public."Инцидент" USING btree ("ответственный_сотрудник_id");


--
-- TOC entry 5100 (class 1259 OID 27193)
-- Name: idx_инцидент_правило; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_инцидент_правило" ON public."Инцидент" USING btree ("правило_обнаружения_id");


--
-- TOC entry 5101 (class 1259 OID 27190)
-- Name: idx_инцидент_приоритет; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_инцидент_приоритет" ON public."Инцидент" USING btree ("приоритет_id");


--
-- TOC entry 5102 (class 1259 OID 27189)
-- Name: idx_инцидент_статус; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_инцидент_статус" ON public."Инцидент" USING btree ("статус_id");


--
-- TOC entry 5103 (class 1259 OID 27194)
-- Name: idx_инцидент_угроза; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_инцидент_угроза" ON public."Инцидент" USING btree ("основная_угроза_id");


--
-- TOC entry 5127 (class 1259 OID 27203)
-- Name: idx_история_инцидент; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_история_инцидент" ON public."История состояния инцидента" USING btree ("инцидент_id");


--
-- TOC entry 5106 (class 1259 OID 27205)
-- Name: idx_исходное_время; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_исходное_время" ON public."Исходное событие" USING btree ("время_события");


--
-- TOC entry 5107 (class 1259 OID 27197)
-- Name: idx_исходное_инцидент; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_исходное_инцидент" ON public."Исходное событие" USING btree ("инцидент_id");


--
-- TOC entry 5116 (class 1259 OID 27199)
-- Name: idx_комментарий_инцидент; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_комментарий_инцидент" ON public."Комментарий к инциденту" USING btree ("инцидент_id");


--
-- TOC entry 5094 (class 1259 OID 27196)
-- Name: idx_мера_инцидент; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_мера_инцидент" ON public."Мера устранения" USING btree ("инцидент_id");


--
-- TOC entry 5124 (class 1259 OID 27202)
-- Name: idx_приложение_инцидент; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_приложение_инцидент" ON public."Приложение к инциденту" USING btree ("инцидент_id");


--
-- TOC entry 5110 (class 1259 OID 27198)
-- Name: idx_уведомление_инцидент; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_уведомление_инцидент" ON public."Уведомление" USING btree ("инцидент_id");


--
-- TOC entry 5121 (class 1259 OID 27201)
-- Name: idx_уязвимость_актив; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_уязвимость_актив" ON public."Уязвимость актива" USING btree ("актив_id");


--
-- TOC entry 5130 (class 1259 OID 27204)
-- Name: idx_эскалация_инцидент; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_эскалация_инцидент" ON public."Эскалация инцидента" USING btree ("инцидент_id");


--
-- TOC entry 5133 (class 2606 OID 26860)
-- Name: Команда реагирования fk_команда_руководитель; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Команда реагирования"
    ADD CONSTRAINT "fk_команда_руководитель" FOREIGN KEY ("руководитель_id") REFERENCES public."Сотрудник"("сотрудник_id") ON DELETE SET NULL;


--
-- TOC entry 5143 (class 2606 OID 26980)
-- Name: Мера устранения fk_мера_инцидент; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Мера устранения"
    ADD CONSTRAINT "fk_мера_инцидент" FOREIGN KEY ("инцидент_id") REFERENCES public."Инцидент"("инцидент_id") ON DELETE CASCADE;


--
-- TOC entry 5134 (class 2606 OID 26827)
-- Name: Актив Актив_sla_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Актив"
    ADD CONSTRAINT "Актив_sla_id_fkey" FOREIGN KEY (sla_id) REFERENCES public."Уровень обслуживания"(sla_id) ON DELETE SET NULL;


--
-- TOC entry 5135 (class 2606 OID 26822)
-- Name: Актив Актив_подразделение_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Актив"
    ADD CONSTRAINT "Актив_подразделение_id_fkey" FOREIGN KEY ("подразделение_id") REFERENCES public."Подразделение"("подразделение_id") ON DELETE SET NULL;


--
-- TOC entry 5136 (class 2606 OID 26817)
-- Name: Актив Актив_тип_актива_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Актив"
    ADD CONSTRAINT "Актив_тип_актива_id_fkey" FOREIGN KEY ("тип_актива_id") REFERENCES public."Тип актива"("тип_актива_id") ON DELETE RESTRICT;


--
-- TOC entry 5154 (class 2606 OID 27040)
-- Name: Журнал аудита Журнал аудита_сотрудник_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Журнал аудита"
    ADD CONSTRAINT "Журнал аудита_сотрудник_id_fkey" FOREIGN KEY ("сотрудник_id") REFERENCES public."Сотрудник"("сотрудник_id") ON DELETE CASCADE;


--
-- TOC entry 5157 (class 2606 OID 27080)
-- Name: Информация об угрозах Информация об угрозах_угроза_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Информация об угрозах"
    ADD CONSTRAINT "Информация об угрозах_угроза_id_fkey" FOREIGN KEY ("угроза_id") REFERENCES public."Угроза"("угроза_id") ON DELETE CASCADE;


--
-- TOC entry 5145 (class 2606 OID 26960)
-- Name: Инцидент Инцидент_затронутый_актив_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Инцидент"
    ADD CONSTRAINT "Инцидент_затронутый_актив_id_fkey" FOREIGN KEY ("затронутый_актив_id") REFERENCES public."Актив"("актив_id") ON DELETE SET NULL;


--
-- TOC entry 5146 (class 2606 OID 26975)
-- Name: Инцидент Инцидент_основная_угроза_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Инцидент"
    ADD CONSTRAINT "Инцидент_основная_угроза_id_fkey" FOREIGN KEY ("основная_угроза_id") REFERENCES public."Угроза"("угроза_id") ON DELETE SET NULL;


--
-- TOC entry 5147 (class 2606 OID 26965)
-- Name: Инцидент Инцидент_ответственный_сотрудн_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Инцидент"
    ADD CONSTRAINT "Инцидент_ответственный_сотрудн_fkey" FOREIGN KEY ("ответственный_сотрудник_id") REFERENCES public."Сотрудник"("сотрудник_id") ON DELETE SET NULL;


--
-- TOC entry 5148 (class 2606 OID 26970)
-- Name: Инцидент Инцидент_правило_обнаружения_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Инцидент"
    ADD CONSTRAINT "Инцидент_правило_обнаружения_id_fkey" FOREIGN KEY ("правило_обнаружения_id") REFERENCES public."Правило обнаружения"("правило_id") ON DELETE SET NULL;


--
-- TOC entry 5149 (class 2606 OID 26955)
-- Name: Инцидент Инцидент_приоритет_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Инцидент"
    ADD CONSTRAINT "Инцидент_приоритет_id_fkey" FOREIGN KEY ("приоритет_id") REFERENCES public."Приоритет инцидента"("приоритет_id") ON DELETE RESTRICT;


--
-- TOC entry 5150 (class 2606 OID 26950)
-- Name: Инцидент Инцидент_статус_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Инцидент"
    ADD CONSTRAINT "Инцидент_статус_id_fkey" FOREIGN KEY ("статус_id") REFERENCES public."Статус инцидента"("статус_id") ON DELETE RESTRICT;


--
-- TOC entry 5161 (class 2606 OID 27146)
-- Name: История состояния инцидента История состоян_старый_статус_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."История состояния инцидента"
    ADD CONSTRAINT "История состоян_старый_статус_id_fkey" FOREIGN KEY ("старый_статус_id") REFERENCES public."Статус инцидента"("статус_id") ON DELETE SET NULL;


--
-- TOC entry 5162 (class 2606 OID 27151)
-- Name: История состояния инцидента История состояни_новый_статус_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."История состояния инцидента"
    ADD CONSTRAINT "История состояни_новый_статус_id_fkey" FOREIGN KEY ("новый_статус_id") REFERENCES public."Статус инцидента"("статус_id") ON DELETE RESTRICT;


--
-- TOC entry 5163 (class 2606 OID 27141)
-- Name: История состояния инцидента История состояния ин_инцидент_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."История состояния инцидента"
    ADD CONSTRAINT "История состояния ин_инцидент_id_fkey" FOREIGN KEY ("инцидент_id") REFERENCES public."Инцидент"("инцидент_id") ON DELETE CASCADE;


--
-- TOC entry 5164 (class 2606 OID 27156)
-- Name: История состояния инцидента История состояния инци_изменил_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."История состояния инцидента"
    ADD CONSTRAINT "История состояния инци_изменил_fkey" FOREIGN KEY ("изменил") REFERENCES public."Сотрудник"("сотрудник_id") ON DELETE SET NULL;


--
-- TOC entry 5142 (class 2606 OID 26908)
-- Name: Источник событий Источник событи_тип_источника_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Источник событий"
    ADD CONSTRAINT "Источник событи_тип_источника_id_fkey" FOREIGN KEY ("тип_источника_id") REFERENCES public."Тип источника событий"("тип_источника_id") ON DELETE RESTRICT;


--
-- TOC entry 5151 (class 2606 OID 27004)
-- Name: Исходное событие Исходное событие_инцидент_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Исходное событие"
    ADD CONSTRAINT "Исходное событие_инцидент_id_fkey" FOREIGN KEY ("инцидент_id") REFERENCES public."Инцидент"("инцидент_id") ON DELETE SET NULL;


--
-- TOC entry 5152 (class 2606 OID 26999)
-- Name: Исходное событие Исходное событие_источник_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Исходное событие"
    ADD CONSTRAINT "Исходное событие_источник_id_fkey" FOREIGN KEY ("источник_id") REFERENCES public."Источник событий"("источник_id") ON DELETE RESTRICT;


--
-- TOC entry 5155 (class 2606 OID 27065)
-- Name: Комментарий к инциденту Комментарий к инцид_сотрудник_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Комментарий к инциденту"
    ADD CONSTRAINT "Комментарий к инцид_сотрудник_id_fkey" FOREIGN KEY ("сотрудник_id") REFERENCES public."Сотрудник"("сотрудник_id") ON DELETE CASCADE;


--
-- TOC entry 5156 (class 2606 OID 27060)
-- Name: Комментарий к инциденту Комментарий к инциде_инцидент_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Комментарий к инциденту"
    ADD CONSTRAINT "Комментарий к инциде_инцидент_id_fkey" FOREIGN KEY ("инцидент_id") REFERENCES public."Инцидент"("инцидент_id") ON DELETE CASCADE;


--
-- TOC entry 5144 (class 2606 OID 26928)
-- Name: Мера устранения Мера устранения_тип_меры_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Мера устранения"
    ADD CONSTRAINT "Мера устранения_тип_меры_id_fkey" FOREIGN KEY ("тип_меры_id") REFERENCES public."Тип меры реагирования"("тип_меры_id") ON DELETE RESTRICT;


--
-- TOC entry 5141 (class 2606 OID 26893)
-- Name: Правило обнаружения Правило обнаружен_тип_правила_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Правило обнаружения"
    ADD CONSTRAINT "Правило обнаружен_тип_правила_id_fkey" FOREIGN KEY ("тип_правила_id") REFERENCES public."Тип правила обнаружения"("тип_правила_id") ON DELETE RESTRICT;


--
-- TOC entry 5159 (class 2606 OID 27119)
-- Name: Приложение к инциденту Приложение к инциден_инцидент_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Приложение к инциденту"
    ADD CONSTRAINT "Приложение к инциден_инцидент_id_fkey" FOREIGN KEY ("инцидент_id") REFERENCES public."Инцидент"("инцидент_id") ON DELETE CASCADE;


--
-- TOC entry 5160 (class 2606 OID 27124)
-- Name: Приложение к инциденту Приложение к инцидент_загрузил_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Приложение к инциденту"
    ADD CONSTRAINT "Приложение к инцидент_загрузил_fkey" FOREIGN KEY ("загрузил") REFERENCES public."Сотрудник"("сотрудник_id") ON DELETE SET NULL;


--
-- TOC entry 5137 (class 2606 OID 26850)
-- Name: Сотрудник Сотрудник_группа_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Сотрудник"
    ADD CONSTRAINT "Сотрудник_группа_id_fkey" FOREIGN KEY ("группа_id") REFERENCES public."Группа сотрудников"("группа_id") ON DELETE SET NULL;


--
-- TOC entry 5138 (class 2606 OID 26855)
-- Name: Сотрудник Сотрудник_команда_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Сотрудник"
    ADD CONSTRAINT "Сотрудник_команда_id_fkey" FOREIGN KEY ("команда_id") REFERENCES public."Команда реагирования"("команда_id") ON DELETE SET NULL;


--
-- TOC entry 5139 (class 2606 OID 26845)
-- Name: Сотрудник Сотрудник_роль_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Сотрудник"
    ADD CONSTRAINT "Сотрудник_роль_id_fkey" FOREIGN KEY ("роль_id") REFERENCES public."Роль сотрудника"("роль_id") ON DELETE RESTRICT;


--
-- TOC entry 5153 (class 2606 OID 27023)
-- Name: Уведомление Уведомление_инцидент_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Уведомление"
    ADD CONSTRAINT "Уведомление_инцидент_id_fkey" FOREIGN KEY ("инцидент_id") REFERENCES public."Инцидент"("инцидент_id") ON DELETE CASCADE;


--
-- TOC entry 5140 (class 2606 OID 26875)
-- Name: Угроза Угроза_категория_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Угроза"
    ADD CONSTRAINT "Угроза_категория_id_fkey" FOREIGN KEY ("категория_id") REFERENCES public."Категория угрозы"("категория_id") ON DELETE RESTRICT;


--
-- TOC entry 5158 (class 2606 OID 27099)
-- Name: Уязвимость актива Уязвимость актива_актив_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Уязвимость актива"
    ADD CONSTRAINT "Уязвимость актива_актив_id_fkey" FOREIGN KEY ("актив_id") REFERENCES public."Актив"("актив_id") ON DELETE CASCADE;


--
-- TOC entry 5165 (class 2606 OID 27184)
-- Name: Эскалация инцидента Эскалация инцид_целевая_команд_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Эскалация инцидента"
    ADD CONSTRAINT "Эскалация инцид_целевая_команд_fkey" FOREIGN KEY ("целевая_команда_id") REFERENCES public."Команда реагирования"("команда_id") ON DELETE SET NULL;


--
-- TOC entry 5166 (class 2606 OID 27179)
-- Name: Эскалация инцидента Эскалация инцидент_эскалировал_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Эскалация инцидента"
    ADD CONSTRAINT "Эскалация инцидент_эскалировал_fkey" FOREIGN KEY ("эскалировал") REFERENCES public."Сотрудник"("сотрудник_id") ON DELETE SET NULL;


--
-- TOC entry 5167 (class 2606 OID 27174)
-- Name: Эскалация инцидента Эскалация инцидента_инцидент_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Эскалация инцидента"
    ADD CONSTRAINT "Эскалация инцидента_инцидент_id_fkey" FOREIGN KEY ("инцидент_id") REFERENCES public."Инцидент"("инцидент_id") ON DELETE CASCADE;


--
-- TOC entry 5377 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2026-05-19 02:19:34

--
-- PostgreSQL database dump complete
--

\unrestrict fHdTUNDg3pZyfhm4q2ofuhPqmj8d8XgbUMsalh63HI5mntkcNqnBI8hek78WIzh

