--
-- PostgreSQL database dump
--

\restrict 7rKirZyDQl0TefGhI2k0OPQb56Zq3t4BnE6tst0kChnYNVfNf19L4IQPGElgKMY

-- Dumped from database version 16.10
-- Dumped by pg_dump version 16.10

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
-- Name: Группа сотрудников; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Группа сотрудников" (
    "группа_id" integer NOT NULL,
    "наименование" character varying(100) NOT NULL
);


ALTER TABLE public."Группа сотрудников" OWNER TO postgres;

--
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
-- Name: Группа сотрудников_группа_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Группа сотрудников_группа_id_seq" OWNED BY public."Группа сотрудников"."группа_id";


--
-- Name: Журнал аудита; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Журнал аудита" (
    "запись_id" integer NOT NULL,
    "сотрудник_id" integer NOT NULL,
    "действие" character varying(200) NOT NULL,
    "время_действия" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "имя_таблицы" character varying(100),
    "объект_id" integer,
    "данные_json" jsonb
)
PARTITION BY RANGE ("время_действия");


ALTER TABLE public."Журнал аудита" OWNER TO postgres;

--
-- Name: Журнал аудита_2026_q1_q2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Журнал аудита_2026_q1_q2" (
    "запись_id" integer NOT NULL,
    "сотрудник_id" integer NOT NULL,
    "действие" character varying(200) NOT NULL,
    "время_действия" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "имя_таблицы" character varying(100),
    "объект_id" integer,
    "данные_json" jsonb
);


ALTER TABLE public."Журнал аудита_2026_q1_q2" OWNER TO postgres;

--
-- Name: Журнал аудита_2026_q3_q4; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Журнал аудита_2026_q3_q4" (
    "запись_id" integer NOT NULL,
    "сотрудник_id" integer NOT NULL,
    "действие" character varying(200) NOT NULL,
    "время_действия" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "имя_таблицы" character varying(100),
    "объект_id" integer,
    "данные_json" jsonb
);


ALTER TABLE public."Журнал аудита_2026_q3_q4" OWNER TO postgres;

--
-- Name: Журнал аудита_default; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Журнал аудита_default" (
    "запись_id" integer NOT NULL,
    "сотрудник_id" integer NOT NULL,
    "действие" character varying(200) NOT NULL,
    "время_действия" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "имя_таблицы" character varying(100),
    "объект_id" integer,
    "данные_json" jsonb
);


ALTER TABLE public."Журнал аудита_default" OWNER TO postgres;

--
-- Name: Информация об угрозах; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Информация об угрозах" (
    ioc_id integer NOT NULL,
    "индикатор" character varying(255) NOT NULL,
    "угроза_id" integer NOT NULL,
    "действует_до" date
);


ALTER TABLE public."Информация об угрозах" OWNER TO postgres;

--
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
-- Name: Информация об угроза_ид_угрозы_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Информация об угроза_ид_угрозы_id_seq" OWNED BY public."Информация об угрозах".ioc_id;


--
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
    "требуется_эскалация" boolean DEFAULT false,
    CONSTRAINT "Инцидент_check" CHECK ((("время_закрытия" IS NULL) OR ("время_закрытия" >= "время_обнаружения")))
);


ALTER TABLE public."Инцидент" OWNER TO postgres;

--
-- Name: Инцидент_Угроза; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Инцидент_Угроза" (
    "инцидент_id" integer NOT NULL,
    "угроза_id" integer NOT NULL,
    "является_основной" boolean DEFAULT false
);


ALTER TABLE public."Инцидент_Угроза" OWNER TO postgres;

--
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
-- Name: Инцидент_инцидент_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Инцидент_инцидент_id_seq" OWNED BY public."Инцидент"."инцидент_id";


--
-- Name: История состояния инцидента; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."История состояния инцидента" (
    "история_id" integer NOT NULL,
    "инцидент_id" integer NOT NULL,
    "старый_статус_id" integer,
    "новый_статус_id" integer NOT NULL,
    "изменено_в" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "изменил" integer
);


ALTER TABLE public."История состояния инцидента" OWNER TO postgres;

--
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
-- Name: История состояния инц_история_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."История состояния инц_история_id_seq" OWNED BY public."История состояния инцидента"."история_id";


--
-- Name: Источник событий; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Источник событий" (
    "источник_id" integer NOT NULL,
    "наименование" character varying(100) NOT NULL,
    "тип_источника_id" integer NOT NULL
);


ALTER TABLE public."Источник событий" OWNER TO postgres;

--
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
-- Name: Источник событий_источник_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Источник событий_источник_id_seq" OWNED BY public."Источник событий"."источник_id";


--
-- Name: Исходное событие; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Исходное событие" (
    "событие_id" integer NOT NULL,
    "время_события" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "сырой_лог" text NOT NULL,
    "источник_id" integer NOT NULL,
    "инцидент_id" integer
);


ALTER TABLE public."Исходное событие" OWNER TO postgres;

--
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
-- Name: Исходное событие_событие_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Исходное событие_событие_id_seq" OWNED BY public."Исходное событие"."событие_id";


--
-- Name: Категория угрозы; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Категория угрозы" (
    "категория_id" integer NOT NULL,
    "наименование" character varying(50) NOT NULL
);


ALTER TABLE public."Категория угрозы" OWNER TO postgres;

--
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
-- Name: Категория угрозы_категория_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Категория угрозы_категория_id_seq" OWNED BY public."Категория угрозы"."категория_id";


--
-- Name: Команда реагирования; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Команда реагирования" (
    "команда_id" integer NOT NULL,
    "наименование" character varying(100) NOT NULL
);


ALTER TABLE public."Команда реагирования" OWNER TO postgres;

--
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
-- Name: Команда реагирования_команда_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Команда реагирования_команда_id_seq" OWNED BY public."Команда реагирования"."команда_id";


--
-- Name: Комментарий к инциденту; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Комментарий к инциденту" (
    "комментарий_id" integer NOT NULL,
    "инцидент_id" integer NOT NULL,
    "сотрудник_id" integer NOT NULL,
    "текст_комментария" text NOT NULL,
    "создан_в" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Комментарий к инциденту" OWNER TO postgres;

--
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
-- Name: Комментарий к инц_комментарий_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Комментарий к инц_комментарий_id_seq" OWNED BY public."Комментарий к инциденту"."комментарий_id";


--
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
-- Name: Мера устранения_мера_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Мера устранения_мера_id_seq" OWNED BY public."Мера устранения"."мера_id";


--
-- Name: Подразделение; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Подразделение" (
    "подразделение_id" integer NOT NULL,
    "наименование" character varying(100) NOT NULL,
    "расположение" character varying(100)
);


ALTER TABLE public."Подразделение" OWNER TO postgres;

--
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
-- Name: Подразделение_подразделение_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Подразделение_подразделение_id_seq" OWNED BY public."Подразделение"."подразделение_id";


--
-- Name: Правило обнаружения; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Правило обнаружения" (
    "правило_id" integer NOT NULL,
    "наименование" character varying(100) NOT NULL,
    "тип_правила_id" integer NOT NULL,
    "условие" text NOT NULL
);


ALTER TABLE public."Правило обнаружения" OWNER TO postgres;

--
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
-- Name: Правило обнаружения_правило_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Правило обнаружения_правило_id_seq" OWNED BY public."Правило обнаружения"."правило_id";


--
-- Name: Приложение к инциденту; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Приложение к инциденту" (
    "приложение_id" integer NOT NULL,
    "инцидент_id" integer NOT NULL,
    "имя_файла" character varying(255) NOT NULL,
    "путь_к_файлу" text NOT NULL,
    "загружено_в" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "загрузил" integer
);


ALTER TABLE public."Приложение к инциденту" OWNER TO postgres;

--
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
-- Name: Приложение к инцид_приложение_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Приложение к инцид_приложение_id_seq" OWNED BY public."Приложение к инциденту"."приложение_id";


--
-- Name: Приоритет инцидента; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Приоритет инцидента" (
    "приоритет_id" integer NOT NULL,
    "наименование" character varying(50) NOT NULL,
    "уровень_срочности" integer NOT NULL,
    CONSTRAINT "Приоритет инци_уровень_срочно_check" CHECK ((("уровень_срочности" >= 1) AND ("уровень_срочности" <= 5)))
);


ALTER TABLE public."Приоритет инцидента" OWNER TO postgres;

--
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
-- Name: Приоритет инцидента_приоритет_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Приоритет инцидента_приоритет_id_seq" OWNED BY public."Приоритет инцидента"."приоритет_id";


--
-- Name: Роль сотрудника; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Роль сотрудника" (
    "роль_id" integer NOT NULL,
    "наименование" character varying(50) NOT NULL
);


ALTER TABLE public."Роль сотрудника" OWNER TO postgres;

--
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
-- Name: Роль сотрудника_роль_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Роль сотрудника_роль_id_seq" OWNED BY public."Роль сотрудника"."роль_id";


--
-- Name: Состав команды; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Состав команды" (
    "команда_id" integer NOT NULL,
    "сотрудник_id" integer NOT NULL,
    "является_руководителем" boolean DEFAULT false NOT NULL
);


ALTER TABLE public."Состав команды" OWNER TO postgres;

--
-- Name: Сотрудник; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Сотрудник" (
    "сотрудник_id" integer NOT NULL,
    email character varying(100) NOT NULL,
    "роль_id" integer NOT NULL,
    "группа_id" integer,
    "фамилия" character varying(100) NOT NULL,
    "имя" character varying(100) NOT NULL,
    "отчество" character varying(100)
);


ALTER TABLE public."Сотрудник" OWNER TO postgres;

--
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
-- Name: Сотрудник_сотрудник_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Сотрудник_сотрудник_id_seq" OWNED BY public."Сотрудник"."сотрудник_id";


--
-- Name: Справочник каналов; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Справочник каналов" (
    "канал" character varying(30) NOT NULL
);


ALTER TABLE public."Справочник каналов" OWNER TO postgres;

--
-- Name: Статус инцидента; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Статус инцидента" (
    "статус_id" integer NOT NULL,
    "наименование" character varying(50) NOT NULL,
    "описание" text
);


ALTER TABLE public."Статус инцидента" OWNER TO postgres;

--
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
-- Name: Статус инцидента_статус_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Статус инцидента_статус_id_seq" OWNED BY public."Статус инцидента"."статус_id";


--
-- Name: Тип актива; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Тип актива" (
    "тип_актива_id" integer NOT NULL,
    "наименование" character varying(50) NOT NULL
);


ALTER TABLE public."Тип актива" OWNER TO postgres;

--
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
-- Name: Тип актива_тип_актива_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Тип актива_тип_актива_id_seq" OWNED BY public."Тип актива"."тип_актива_id";


--
-- Name: Тип источника событий; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Тип источника событий" (
    "тип_источника_id" integer NOT NULL,
    "наименование" character varying(50) NOT NULL
);


ALTER TABLE public."Тип источника событий" OWNER TO postgres;

--
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
-- Name: Тип источника со_тип_источника_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Тип источника со_тип_источника_id_seq" OWNED BY public."Тип источника событий"."тип_источника_id";


--
-- Name: Тип меры реагирования; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Тип меры реагирования" (
    "тип_меры_id" integer NOT NULL,
    "наименование" character varying(50) NOT NULL
);


ALTER TABLE public."Тип меры реагирования" OWNER TO postgres;

--
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
-- Name: Тип меры реагирования_тип_меры_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Тип меры реагирования_тип_меры_id_seq" OWNED BY public."Тип меры реагирования"."тип_меры_id";


--
-- Name: Тип правила обнаружения; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Тип правила обнаружения" (
    "тип_правила_id" integer NOT NULL,
    "наименование" character varying(50) NOT NULL
);


ALTER TABLE public."Тип правила обнаружения" OWNER TO postgres;

--
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
-- Name: Тип правила обнару_тип_правила_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Тип правила обнару_тип_правила_id_seq" OWNED BY public."Тип правила обнаружения"."тип_правила_id";


--
-- Name: Уведомление; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Уведомление" (
    "уведомление_id" integer NOT NULL,
    "инцидент_id" integer NOT NULL,
    "отправлено_в" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "канал" character varying(30) NOT NULL,
    "получатель_id" integer,
    CONSTRAINT check_notification_recipient_by_channel CHECK ((((("канал")::text = 'siem'::text) AND ("получатель_id" IS NULL)) OR ((("канал")::text = ANY ((ARRAY['email'::character varying, 'telegram'::character varying])::text[])) AND ("получатель_id" IS NOT NULL))))
);


ALTER TABLE public."Уведомление" OWNER TO postgres;

--
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
-- Name: Уведомление_уведомление_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Уведомление_уведомление_id_seq" OWNED BY public."Уведомление"."уведомление_id";


--
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
-- Name: Угроза_угроза_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Угроза_угроза_id_seq" OWNED BY public."Угроза"."угроза_id";


--
-- Name: Уровень критичности; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Уровень критичности" (
    "критичность" character varying(50) NOT NULL
);


ALTER TABLE public."Уровень критичности" OWNER TO postgres;

--
-- Name: Уровень обслуживания; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Уровень обслуживания" (
    sla_id integer NOT NULL,
    "наименование" character varying(100) NOT NULL,
    "часы_реагирования" integer NOT NULL,
    "часы_устранения" integer NOT NULL
);


ALTER TABLE public."Уровень обслуживания" OWNER TO postgres;

--
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
-- Name: Уровень обслуживания_sla_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Уровень обслуживания_sla_id_seq" OWNED BY public."Уровень обслуживания".sla_id;


--
-- Name: Уязвимость; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Уязвимость" (
    "уязвимость_id" integer NOT NULL,
    cve_id character varying(20) NOT NULL,
    "наименование" character varying(255) NOT NULL,
    "описание" text,
    "критичность" character varying(50)
);


ALTER TABLE public."Уязвимость" OWNER TO postgres;

--
-- Name: Уязвимость актива; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Уязвимость актива" (
    "актив_id" integer NOT NULL,
    "уязвимость_id" integer NOT NULL,
    "дата_обнаружения" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public."Уязвимость актива" OWNER TO postgres;

--
-- Name: Уязвимость_уязвимость_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Уязвимость_уязвимость_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Уязвимость_уязвимость_id_seq" OWNER TO postgres;

--
-- Name: Уязвимость_уязвимость_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Уязвимость_уязвимость_id_seq" OWNED BY public."Уязвимость"."уязвимость_id";


--
-- Name: Эскалация инцидента; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Эскалация инцидента" (
    "эскалация_id" integer NOT NULL,
    "инцидент_id" integer NOT NULL,
    "эскалировано_в" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "эскалировал" integer,
    "причина" text,
    "целевая_команда_id" integer
);


ALTER TABLE public."Эскалация инцидента" OWNER TO postgres;

--
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
-- Name: Эскалация инцидента_эскалация_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Эскалация инцидента_эскалация_id_seq" OWNED BY public."Эскалация инцидента"."эскалация_id";


--
-- Name: Журнал аудита_2026_q1_q2; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Журнал аудита" ATTACH PARTITION public."Журнал аудита_2026_q1_q2" FOR VALUES FROM ('2026-01-01 00:00:00') TO ('2026-07-01 00:00:00');


--
-- Name: Журнал аудита_2026_q3_q4; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Журнал аудита" ATTACH PARTITION public."Журнал аудита_2026_q3_q4" FOR VALUES FROM ('2026-07-01 00:00:00') TO ('2027-01-01 00:00:00');


--
-- Name: Журнал аудита_default; Type: TABLE ATTACH; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Журнал аудита" ATTACH PARTITION public."Журнал аудита_default" DEFAULT;


--
-- Name: Уязвимость уязвимость_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Уязвимость" ALTER COLUMN "уязвимость_id" SET DEFAULT nextval('public."Уязвимость_уязвимость_id_seq"'::regclass);


--
-- Data for Name: Актив; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Актив" ("актив_id", "наименование", "ip_адрес", "тип_актива_id", "подразделение_id", "дата_ввода", sla_id) FROM stdin;
\.


--
-- Data for Name: Группа сотрудников; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Группа сотрудников" ("группа_id", "наименование") FROM stdin;
\.


--
-- Data for Name: Журнал аудита_2026_q1_q2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Журнал аудита_2026_q1_q2" ("запись_id", "сотрудник_id", "действие", "время_действия", "имя_таблицы", "объект_id", "данные_json") FROM stdin;
\.


--
-- Data for Name: Журнал аудита_2026_q3_q4; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Журнал аудита_2026_q3_q4" ("запись_id", "сотрудник_id", "действие", "время_действия", "имя_таблицы", "объект_id", "данные_json") FROM stdin;
\.


--
-- Data for Name: Журнал аудита_default; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Журнал аудита_default" ("запись_id", "сотрудник_id", "действие", "время_действия", "имя_таблицы", "объект_id", "данные_json") FROM stdin;
\.


--
-- Data for Name: Информация об угрозах; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Информация об угрозах" (ioc_id, "индикатор", "угроза_id", "действует_до") FROM stdin;
\.


--
-- Data for Name: Инцидент; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Инцидент" ("инцидент_id", "заголовок", "описание", "время_обнаружения", "время_закрытия", "статус_id", "приоритет_id", "затронутый_актив_id", "ответственный_сотрудник_id", "правило_обнаружения_id", "требуется_эскалация") FROM stdin;
\.


--
-- Data for Name: Инцидент_Угроза; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Инцидент_Угроза" ("инцидент_id", "угроза_id", "является_основной") FROM stdin;
\.


--
-- Data for Name: История состояния инцидента; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."История состояния инцидента" ("история_id", "инцидент_id", "старый_статус_id", "новый_статус_id", "изменено_в", "изменил") FROM stdin;
\.


--
-- Data for Name: Источник событий; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Источник событий" ("источник_id", "наименование", "тип_источника_id") FROM stdin;
\.


--
-- Data for Name: Исходное событие; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Исходное событие" ("событие_id", "время_события", "сырой_лог", "источник_id", "инцидент_id") FROM stdin;
\.


--
-- Data for Name: Категория угрозы; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Категория угрозы" ("категория_id", "наименование") FROM stdin;
\.


--
-- Data for Name: Команда реагирования; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Команда реагирования" ("команда_id", "наименование") FROM stdin;
\.


--
-- Data for Name: Комментарий к инциденту; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Комментарий к инциденту" ("комментарий_id", "инцидент_id", "сотрудник_id", "текст_комментария", "создан_в") FROM stdin;
\.


--
-- Data for Name: Мера устранения; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Мера устранения" ("мера_id", "инцидент_id", "тип_меры_id", "описание", "создана_в") FROM stdin;
\.


--
-- Data for Name: Подразделение; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Подразделение" ("подразделение_id", "наименование", "расположение") FROM stdin;
\.


--
-- Data for Name: Правило обнаружения; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Правило обнаружения" ("правило_id", "наименование", "тип_правила_id", "условие") FROM stdin;
\.


--
-- Data for Name: Приложение к инциденту; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Приложение к инциденту" ("приложение_id", "инцидент_id", "имя_файла", "путь_к_файлу", "загружено_в", "загрузил") FROM stdin;
\.


--
-- Data for Name: Приоритет инцидента; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Приоритет инцидента" ("приоритет_id", "наименование", "уровень_срочности") FROM stdin;
\.


--
-- Data for Name: Роль сотрудника; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Роль сотрудника" ("роль_id", "наименование") FROM stdin;
1	Аналитик ИБ
\.


--
-- Data for Name: Состав команды; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Состав команды" ("команда_id", "сотрудник_id", "является_руководителем") FROM stdin;
\.


--
-- Data for Name: Сотрудник; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Сотрудник" ("сотрудник_id", email, "роль_id", "группа_id", "фамилия", "имя", "отчество") FROM stdin;
999	test@test.ru	1	\N	Тест	Тестович	\N
\.


--
-- Data for Name: Справочник каналов; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Справочник каналов" ("канал") FROM stdin;
email
telegram
siem
\.


--
-- Data for Name: Статус инцидента; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Статус инцидента" ("статус_id", "наименование", "описание") FROM stdin;
\.


--
-- Data for Name: Тип актива; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Тип актива" ("тип_актива_id", "наименование") FROM stdin;
\.


--
-- Data for Name: Тип источника событий; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Тип источника событий" ("тип_источника_id", "наименование") FROM stdin;
\.


--
-- Data for Name: Тип меры реагирования; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Тип меры реагирования" ("тип_меры_id", "наименование") FROM stdin;
\.


--
-- Data for Name: Тип правила обнаружения; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Тип правила обнаружения" ("тип_правила_id", "наименование") FROM stdin;
\.


--
-- Data for Name: Уведомление; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Уведомление" ("уведомление_id", "инцидент_id", "отправлено_в", "канал", "получатель_id") FROM stdin;
\.


--
-- Data for Name: Угроза; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Угроза" ("угроза_id", "наименование", mitre_id, "категория_id") FROM stdin;
\.


--
-- Data for Name: Уровень критичности; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Уровень критичности" ("критичность") FROM stdin;
low
medium
high
critical
\.


--
-- Data for Name: Уровень обслуживания; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Уровень обслуживания" (sla_id, "наименование", "часы_реагирования", "часы_устранения") FROM stdin;
\.


--
-- Data for Name: Уязвимость; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Уязвимость" ("уязвимость_id", cve_id, "наименование", "описание", "критичность") FROM stdin;
\.


--
-- Data for Name: Уязвимость актива; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Уязвимость актива" ("актив_id", "уязвимость_id", "дата_обнаружения") FROM stdin;
\.


--
-- Data for Name: Эскалация инцидента; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Эскалация инцидента" ("эскалация_id", "инцидент_id", "эскалировано_в", "эскалировал", "причина", "целевая_команда_id") FROM stdin;
\.


--
-- Name: Группа сотрудников_группа_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Группа сотрудников_группа_id_seq"', 1, false);


--
-- Name: Информация об угроза_ид_угрозы_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Информация об угроза_ид_угрозы_id_seq"', 1, false);


--
-- Name: Инцидент_инцидент_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Инцидент_инцидент_id_seq"', 1, false);


--
-- Name: История состояния инц_история_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."История состояния инц_история_id_seq"', 1, false);


--
-- Name: Источник событий_источник_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Источник событий_источник_id_seq"', 1, false);


--
-- Name: Исходное событие_событие_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Исходное событие_событие_id_seq"', 1, false);


--
-- Name: Категория угрозы_категория_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Категория угрозы_категория_id_seq"', 1, false);


--
-- Name: Команда реагирования_команда_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Команда реагирования_команда_id_seq"', 1, false);


--
-- Name: Комментарий к инц_комментарий_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Комментарий к инц_комментарий_id_seq"', 1, false);


--
-- Name: Мера устранения_мера_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Мера устранения_мера_id_seq"', 1, false);


--
-- Name: Подразделение_подразделение_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Подразделение_подразделение_id_seq"', 1, false);


--
-- Name: Правило обнаружения_правило_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Правило обнаружения_правило_id_seq"', 1, false);


--
-- Name: Приложение к инцид_приложение_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Приложение к инцид_приложение_id_seq"', 1, false);


--
-- Name: Приоритет инцидента_приоритет_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Приоритет инцидента_приоритет_id_seq"', 1, false);


--
-- Name: Роль сотрудника_роль_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Роль сотрудника_роль_id_seq"', 1, false);


--
-- Name: Сотрудник_сотрудник_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Сотрудник_сотрудник_id_seq"', 1, false);


--
-- Name: Статус инцидента_статус_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Статус инцидента_статус_id_seq"', 1, false);


--
-- Name: Тип актива_тип_актива_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Тип актива_тип_актива_id_seq"', 1, false);


--
-- Name: Тип источника со_тип_источника_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Тип источника со_тип_источника_id_seq"', 1, false);


--
-- Name: Тип меры реагирования_тип_меры_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Тип меры реагирования_тип_меры_id_seq"', 1, false);


--
-- Name: Тип правила обнару_тип_правила_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Тип правила обнару_тип_правила_id_seq"', 1, false);


--
-- Name: Уведомление_уведомление_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Уведомление_уведомление_id_seq"', 1, false);


--
-- Name: Угроза_угроза_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Угроза_угроза_id_seq"', 1, false);


--
-- Name: Уровень обслуживания_sla_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Уровень обслуживания_sla_id_seq"', 1, false);


--
-- Name: Уязвимость_уязвимость_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Уязвимость_уязвимость_id_seq"', 1, false);


--
-- Name: Эскалация инцидента_эскалация_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Эскалация инцидента_эскалация_id_seq"', 1, false);


--
-- Name: Журнал аудита pk_audit_log; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Журнал аудита"
    ADD CONSTRAINT pk_audit_log PRIMARY KEY ("запись_id", "время_действия");


--
-- Name: Инцидент_Угроза pk_incident_threat; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Инцидент_Угроза"
    ADD CONSTRAINT pk_incident_threat PRIMARY KEY ("инцидент_id", "угроза_id");


--
-- Name: Состав команды pk_team_members; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Состав команды"
    ADD CONSTRAINT pk_team_members PRIMARY KEY ("команда_id", "сотрудник_id");


--
-- Name: Актив Актив_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Актив"
    ADD CONSTRAINT "Актив_pkey" PRIMARY KEY ("актив_id");


--
-- Name: Группа сотрудников Группа сотруднико_наименование_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Группа сотрудников"
    ADD CONSTRAINT "Группа сотруднико_наименование_key" UNIQUE ("наименование");


--
-- Name: Группа сотрудников Группа сотрудников_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Группа сотрудников"
    ADD CONSTRAINT "Группа сотрудников_pkey" PRIMARY KEY ("группа_id");


--
-- Name: Журнал аудита_2026_q1_q2 Журнал аудита_2026_q1_q2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Журнал аудита_2026_q1_q2"
    ADD CONSTRAINT "Журнал аудита_2026_q1_q2_pkey" PRIMARY KEY ("запись_id", "время_действия");


--
-- Name: Журнал аудита_2026_q3_q4 Журнал аудита_2026_q3_q4_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Журнал аудита_2026_q3_q4"
    ADD CONSTRAINT "Журнал аудита_2026_q3_q4_pkey" PRIMARY KEY ("запись_id", "время_действия");


--
-- Name: Журнал аудита_default Журнал аудита_default_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Журнал аудита_default"
    ADD CONSTRAINT "Журнал аудита_default_pkey" PRIMARY KEY ("запись_id", "время_действия");


--
-- Name: Информация об угрозах Информация об угрозах_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Информация об угрозах"
    ADD CONSTRAINT "Информация об угрозах_pkey" PRIMARY KEY (ioc_id);


--
-- Name: Инцидент Инцидент_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Инцидент"
    ADD CONSTRAINT "Инцидент_pkey" PRIMARY KEY ("инцидент_id");


--
-- Name: История состояния инцидента История состояния инцидента_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."История состояния инцидента"
    ADD CONSTRAINT "История состояния инцидента_pkey" PRIMARY KEY ("история_id");


--
-- Name: Источник событий Источник событий_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Источник событий"
    ADD CONSTRAINT "Источник событий_pkey" PRIMARY KEY ("источник_id");


--
-- Name: Исходное событие Исходное событие_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Исходное событие"
    ADD CONSTRAINT "Исходное событие_pkey" PRIMARY KEY ("событие_id");


--
-- Name: Категория угрозы Категория угрозы_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Категория угрозы"
    ADD CONSTRAINT "Категория угрозы_pkey" PRIMARY KEY ("категория_id");


--
-- Name: Категория угрозы Категория угрозы_наименование_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Категория угрозы"
    ADD CONSTRAINT "Категория угрозы_наименование_key" UNIQUE ("наименование");


--
-- Name: Команда реагирования Команда реагирова_наименование_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Команда реагирования"
    ADD CONSTRAINT "Команда реагирова_наименование_key" UNIQUE ("наименование");


--
-- Name: Команда реагирования Команда реагирования_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Команда реагирования"
    ADD CONSTRAINT "Команда реагирования_pkey" PRIMARY KEY ("команда_id");


--
-- Name: Комментарий к инциденту Комментарий к инциденту_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Комментарий к инциденту"
    ADD CONSTRAINT "Комментарий к инциденту_pkey" PRIMARY KEY ("комментарий_id");


--
-- Name: Мера устранения Мера устранения_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Мера устранения"
    ADD CONSTRAINT "Мера устранения_pkey" PRIMARY KEY ("мера_id");


--
-- Name: Подразделение Подразделение_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Подразделение"
    ADD CONSTRAINT "Подразделение_pkey" PRIMARY KEY ("подразделение_id");


--
-- Name: Подразделение Подразделение_наименование_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Подразделение"
    ADD CONSTRAINT "Подразделение_наименование_key" UNIQUE ("наименование");


--
-- Name: Правило обнаружения Правило обнаружения_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Правило обнаружения"
    ADD CONSTRAINT "Правило обнаружения_pkey" PRIMARY KEY ("правило_id");


--
-- Name: Приложение к инциденту Приложение к инциденту_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Приложение к инциденту"
    ADD CONSTRAINT "Приложение к инциденту_pkey" PRIMARY KEY ("приложение_id");


--
-- Name: Приоритет инцидента Приоритет инциден_наименование_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Приоритет инцидента"
    ADD CONSTRAINT "Приоритет инциден_наименование_key" UNIQUE ("наименование");


--
-- Name: Приоритет инцидента Приоритет инцидента_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Приоритет инцидента"
    ADD CONSTRAINT "Приоритет инцидента_pkey" PRIMARY KEY ("приоритет_id");


--
-- Name: Роль сотрудника Роль сотрудника_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Роль сотрудника"
    ADD CONSTRAINT "Роль сотрудника_pkey" PRIMARY KEY ("роль_id");


--
-- Name: Роль сотрудника Роль сотрудника_наименование_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Роль сотрудника"
    ADD CONSTRAINT "Роль сотрудника_наименование_key" UNIQUE ("наименование");


--
-- Name: Сотрудник Сотрудник_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Сотрудник"
    ADD CONSTRAINT "Сотрудник_email_key" UNIQUE (email);


--
-- Name: Сотрудник Сотрудник_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Сотрудник"
    ADD CONSTRAINT "Сотрудник_pkey" PRIMARY KEY ("сотрудник_id");


--
-- Name: Справочник каналов Справочник каналов_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Справочник каналов"
    ADD CONSTRAINT "Справочник каналов_pkey" PRIMARY KEY ("канал");


--
-- Name: Статус инцидента Статус инцидента_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Статус инцидента"
    ADD CONSTRAINT "Статус инцидента_pkey" PRIMARY KEY ("статус_id");


--
-- Name: Статус инцидента Статус инцидента_наименование_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Статус инцидента"
    ADD CONSTRAINT "Статус инцидента_наименование_key" UNIQUE ("наименование");


--
-- Name: Тип актива Тип актива_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Тип актива"
    ADD CONSTRAINT "Тип актива_pkey" PRIMARY KEY ("тип_актива_id");


--
-- Name: Тип актива Тип актива_наименование_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Тип актива"
    ADD CONSTRAINT "Тип актива_наименование_key" UNIQUE ("наименование");


--
-- Name: Тип источника событий Тип источника собы_наименование_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Тип источника событий"
    ADD CONSTRAINT "Тип источника собы_наименование_key" UNIQUE ("наименование");


--
-- Name: Тип источника событий Тип источника событий_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Тип источника событий"
    ADD CONSTRAINT "Тип источника событий_pkey" PRIMARY KEY ("тип_источника_id");


--
-- Name: Тип меры реагирования Тип меры реагирова_наименование_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Тип меры реагирования"
    ADD CONSTRAINT "Тип меры реагирова_наименование_key" UNIQUE ("наименование");


--
-- Name: Тип меры реагирования Тип меры реагирования_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Тип меры реагирования"
    ADD CONSTRAINT "Тип меры реагирования_pkey" PRIMARY KEY ("тип_меры_id");


--
-- Name: Тип правила обнаружения Тип правила обнару_наименование_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Тип правила обнаружения"
    ADD CONSTRAINT "Тип правила обнару_наименование_key" UNIQUE ("наименование");


--
-- Name: Тип правила обнаружения Тип правила обнаружения_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Тип правила обнаружения"
    ADD CONSTRAINT "Тип правила обнаружения_pkey" PRIMARY KEY ("тип_правила_id");


--
-- Name: Уведомление Уведомление_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Уведомление"
    ADD CONSTRAINT "Уведомление_pkey" PRIMARY KEY ("уведомление_id");


--
-- Name: Угроза Угроза_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Угроза"
    ADD CONSTRAINT "Угроза_pkey" PRIMARY KEY ("угроза_id");


--
-- Name: Уровень критичности Уровень критичности_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Уровень критичности"
    ADD CONSTRAINT "Уровень критичности_pkey" PRIMARY KEY ("критичность");


--
-- Name: Уровень обслуживания Уровень обслужива_наименование_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Уровень обслуживания"
    ADD CONSTRAINT "Уровень обслужива_наименование_key" UNIQUE ("наименование");


--
-- Name: Уровень обслуживания Уровень обслуживания_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Уровень обслуживания"
    ADD CONSTRAINT "Уровень обслуживания_pkey" PRIMARY KEY (sla_id);


--
-- Name: Уязвимость актива Уязвимость актива_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Уязвимость актива"
    ADD CONSTRAINT "Уязвимость актива_pkey" PRIMARY KEY ("актив_id", "уязвимость_id");


--
-- Name: Уязвимость Уязвимость_cve_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Уязвимость"
    ADD CONSTRAINT "Уязвимость_cve_id_key" UNIQUE (cve_id);


--
-- Name: Уязвимость Уязвимость_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Уязвимость"
    ADD CONSTRAINT "Уязвимость_pkey" PRIMARY KEY ("уязвимость_id");


--
-- Name: Эскалация инцидента Эскалация инцидента_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Эскалация инцидента"
    ADD CONSTRAINT "Эскалация инцидента_pkey" PRIMARY KEY ("эскалация_id");


--
-- Name: idx_akv_podr; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_akv_podr ON public."Актив" USING btree ("подразделение_id");


--
-- Name: idx_akv_sla; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_akv_sla ON public."Актив" USING btree (sla_id);


--
-- Name: idx_akv_tip_aktiva; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_akv_tip_aktiva ON public."Актив" USING btree ("тип_актива_id");


--
-- Name: idx_eskal_cel; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_eskal_cel ON public."Эскалация инцидента" USING btree ("целевая_команда_id");


--
-- Name: idx_eskal_esk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_eskal_esk ON public."Эскалация инцидента" USING btree ("эскалировал");


--
-- Name: idx_inf_ugr_ugr; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_inf_ugr_ugr ON public."Информация об угрозах" USING btree ("угроза_id");


--
-- Name: idx_ish_ist; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ish_ist ON public."Исходное событие" USING btree ("источник_id");


--
-- Name: idx_ist_stat_izm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ist_stat_izm ON public."История состояния инцидента" USING btree ("изменил");


--
-- Name: idx_ist_stat_nov; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ist_stat_nov ON public."История состояния инцидента" USING btree ("новый_статус_id");


--
-- Name: idx_ist_stat_star; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ist_stat_star ON public."История состояния инцидента" USING btree ("старый_статус_id");


--
-- Name: idx_ist_tip; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ist_tip ON public."Источник событий" USING btree ("тип_источника_id");


--
-- Name: idx_komm_sotr; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_komm_sotr ON public."Комментарий к инциденту" USING btree ("сотрудник_id");


--
-- Name: idx_mer_tip; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_mer_tip ON public."Мера устранения" USING btree ("тип_меры_id");


--
-- Name: idx_prav_tip; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_prav_tip ON public."Правило обнаружения" USING btree ("тип_правила_id");


--
-- Name: idx_pril_zagr; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pril_zagr ON public."Приложение к инциденту" USING btree ("загрузил");


--
-- Name: idx_sotr_familiya; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_sotr_familiya ON public."Сотрудник" USING btree ("фамилия");


--
-- Name: idx_sotr_grp; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_sotr_grp ON public."Сотрудник" USING btree ("группа_id");


--
-- Name: idx_sotr_rol; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_sotr_rol ON public."Сотрудник" USING btree ("роль_id");


--
-- Name: idx_ugr_kat; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ugr_kat ON public."Угроза" USING btree ("категория_id");


--
-- Name: idx_инцидент_актив; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_инцидент_актив" ON public."Инцидент" USING btree ("затронутый_актив_id");


--
-- Name: idx_инцидент_время; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_инцидент_время" ON public."Инцидент" USING btree ("время_обнаружения");


--
-- Name: idx_инцидент_ответственный; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_инцидент_ответственный" ON public."Инцидент" USING btree ("ответственный_сотрудник_id");


--
-- Name: idx_инцидент_правило; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_инцидент_правило" ON public."Инцидент" USING btree ("правило_обнаружения_id");


--
-- Name: idx_инцидент_приоритет; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_инцидент_приоритет" ON public."Инцидент" USING btree ("приоритет_id");


--
-- Name: idx_инцидент_статус; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_инцидент_статус" ON public."Инцидент" USING btree ("статус_id");


--
-- Name: idx_история_инцидент; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_история_инцидент" ON public."История состояния инцидента" USING btree ("инцидент_id");


--
-- Name: idx_исходное_время; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_исходное_время" ON public."Исходное событие" USING btree ("время_события");


--
-- Name: idx_исходное_инцидент; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_исходное_инцидент" ON public."Исходное событие" USING btree ("инцидент_id");


--
-- Name: idx_комментарий_инцидент; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_комментарий_инцидент" ON public."Комментарий к инциденту" USING btree ("инцидент_id");


--
-- Name: idx_мера_инцидент; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_мера_инцидент" ON public."Мера устранения" USING btree ("инцидент_id");


--
-- Name: idx_приложение_инцидент; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_приложение_инцидент" ON public."Приложение к инциденту" USING btree ("инцидент_id");


--
-- Name: idx_уведомление_инцидент; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_уведомление_инцидент" ON public."Уведомление" USING btree ("инцидент_id");


--
-- Name: idx_эскалация_инцидент; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_эскалация_инцидент" ON public."Эскалация инцидента" USING btree ("инцидент_id");


--
-- Name: uq_primary_threat_per_incident; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uq_primary_threat_per_incident ON public."Инцидент_Угроза" USING btree ("инцидент_id") WHERE ("является_основной" = true);


--
-- Name: Журнал аудита_2026_q1_q2_pkey; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.pk_audit_log ATTACH PARTITION public."Журнал аудита_2026_q1_q2_pkey";


--
-- Name: Журнал аудита_2026_q3_q4_pkey; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.pk_audit_log ATTACH PARTITION public."Журнал аудита_2026_q3_q4_pkey";


--
-- Name: Журнал аудита_default_pkey; Type: INDEX ATTACH; Schema: public; Owner: postgres
--

ALTER INDEX public.pk_audit_log ATTACH PARTITION public."Журнал аудита_default_pkey";


--
-- Name: Состав команды fk_employee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Состав команды"
    ADD CONSTRAINT fk_employee FOREIGN KEY ("сотрудник_id") REFERENCES public."Сотрудник"("сотрудник_id") ON DELETE CASCADE;


--
-- Name: Эскалация инцидента fk_escal_author; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Эскалация инцидента"
    ADD CONSTRAINT fk_escal_author FOREIGN KEY ("эскалировал") REFERENCES public."Сотрудник"("сотрудник_id") ON DELETE RESTRICT;


--
-- Name: Уведомление fk_notif_recipient; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Уведомление"
    ADD CONSTRAINT fk_notif_recipient FOREIGN KEY ("получатель_id") REFERENCES public."Сотрудник"("сотрудник_id") ON DELETE RESTRICT;


--
-- Name: Уведомление fk_notification_channel_lookup; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Уведомление"
    ADD CONSTRAINT fk_notification_channel_lookup FOREIGN KEY ("канал") REFERENCES public."Справочник каналов"("канал") ON UPDATE CASCADE;


--
-- Name: Состав команды fk_team; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Состав команды"
    ADD CONSTRAINT fk_team FOREIGN KEY ("команда_id") REFERENCES public."Команда реагирования"("команда_id") ON DELETE CASCADE;


--
-- Name: Уязвимость fk_vulnerability_criticality_lookup; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Уязвимость"
    ADD CONSTRAINT fk_vulnerability_criticality_lookup FOREIGN KEY ("критичность") REFERENCES public."Уровень критичности"("критичность") ON UPDATE CASCADE;


--
-- Name: Мера устранения fk_мера_инцидент; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Мера устранения"
    ADD CONSTRAINT "fk_мера_инцидент" FOREIGN KEY ("инцидент_id") REFERENCES public."Инцидент"("инцидент_id") ON DELETE CASCADE;


--
-- Name: Актив Актив_sla_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Актив"
    ADD CONSTRAINT "Актив_sla_id_fkey" FOREIGN KEY (sla_id) REFERENCES public."Уровень обслуживания"(sla_id) ON DELETE SET NULL;


--
-- Name: Актив Актив_подразделение_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Актив"
    ADD CONSTRAINT "Актив_подразделение_id_fkey" FOREIGN KEY ("подразделение_id") REFERENCES public."Подразделение"("подразделение_id") ON DELETE SET NULL;


--
-- Name: Актив Актив_тип_актива_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Актив"
    ADD CONSTRAINT "Актив_тип_актива_id_fkey" FOREIGN KEY ("тип_актива_id") REFERENCES public."Тип актива"("тип_актива_id") ON DELETE RESTRICT;


--
-- Name: Информация об угрозах Информация об угрозах_угроза_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Информация об угрозах"
    ADD CONSTRAINT "Информация об угрозах_угроза_id_fkey" FOREIGN KEY ("угроза_id") REFERENCES public."Угроза"("угроза_id") ON DELETE CASCADE;


--
-- Name: Инцидент_Угроза Инцидент_Угроза_инцидент_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Инцидент_Угроза"
    ADD CONSTRAINT "Инцидент_Угроза_инцидент_id_fkey" FOREIGN KEY ("инцидент_id") REFERENCES public."Инцидент"("инцидент_id") ON DELETE CASCADE;


--
-- Name: Инцидент_Угроза Инцидент_Угроза_угроза_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Инцидент_Угроза"
    ADD CONSTRAINT "Инцидент_Угроза_угроза_id_fkey" FOREIGN KEY ("угроза_id") REFERENCES public."Угроза"("угроза_id") ON DELETE CASCADE;


--
-- Name: Инцидент Инцидент_затронутый_актив_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Инцидент"
    ADD CONSTRAINT "Инцидент_затронутый_актив_id_fkey" FOREIGN KEY ("затронутый_актив_id") REFERENCES public."Актив"("актив_id") ON DELETE SET NULL;


--
-- Name: Инцидент Инцидент_ответственный_сотрудн_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Инцидент"
    ADD CONSTRAINT "Инцидент_ответственный_сотрудн_fkey" FOREIGN KEY ("ответственный_сотрудник_id") REFERENCES public."Сотрудник"("сотрудник_id") ON DELETE SET NULL;


--
-- Name: Инцидент Инцидент_правило_обнаружения_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Инцидент"
    ADD CONSTRAINT "Инцидент_правило_обнаружения_id_fkey" FOREIGN KEY ("правило_обнаружения_id") REFERENCES public."Правило обнаружения"("правило_id") ON DELETE SET NULL;


--
-- Name: Инцидент Инцидент_приоритет_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Инцидент"
    ADD CONSTRAINT "Инцидент_приоритет_id_fkey" FOREIGN KEY ("приоритет_id") REFERENCES public."Приоритет инцидента"("приоритет_id") ON DELETE RESTRICT;


--
-- Name: Инцидент Инцидент_статус_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Инцидент"
    ADD CONSTRAINT "Инцидент_статус_id_fkey" FOREIGN KEY ("статус_id") REFERENCES public."Статус инцидента"("статус_id") ON DELETE RESTRICT;


--
-- Name: История состояния инцидента История состоян_старый_статус_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."История состояния инцидента"
    ADD CONSTRAINT "История состоян_старый_статус_id_fkey" FOREIGN KEY ("старый_статус_id") REFERENCES public."Статус инцидента"("статус_id") ON DELETE SET NULL;


--
-- Name: История состояния инцидента История состояни_новый_статус_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."История состояния инцидента"
    ADD CONSTRAINT "История состояни_новый_статус_id_fkey" FOREIGN KEY ("новый_статус_id") REFERENCES public."Статус инцидента"("статус_id") ON DELETE RESTRICT;


--
-- Name: История состояния инцидента История состояния ин_инцидент_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."История состояния инцидента"
    ADD CONSTRAINT "История состояния ин_инцидент_id_fkey" FOREIGN KEY ("инцидент_id") REFERENCES public."Инцидент"("инцидент_id") ON DELETE CASCADE;


--
-- Name: История состояния инцидента История состояния инци_изменил_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."История состояния инцидента"
    ADD CONSTRAINT "История состояния инци_изменил_fkey" FOREIGN KEY ("изменил") REFERENCES public."Сотрудник"("сотрудник_id") ON DELETE SET NULL;


--
-- Name: Источник событий Источник событи_тип_источника_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Источник событий"
    ADD CONSTRAINT "Источник событи_тип_источника_id_fkey" FOREIGN KEY ("тип_источника_id") REFERENCES public."Тип источника событий"("тип_источника_id") ON DELETE RESTRICT;


--
-- Name: Исходное событие Исходное событие_инцидент_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Исходное событие"
    ADD CONSTRAINT "Исходное событие_инцидент_id_fkey" FOREIGN KEY ("инцидент_id") REFERENCES public."Инцидент"("инцидент_id") ON DELETE SET NULL;


--
-- Name: Исходное событие Исходное событие_источник_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Исходное событие"
    ADD CONSTRAINT "Исходное событие_источник_id_fkey" FOREIGN KEY ("источник_id") REFERENCES public."Источник событий"("источник_id") ON DELETE RESTRICT;


--
-- Name: Комментарий к инциденту Комментарий к инцид_сотрудник_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Комментарий к инциденту"
    ADD CONSTRAINT "Комментарий к инцид_сотрудник_id_fkey" FOREIGN KEY ("сотрудник_id") REFERENCES public."Сотрудник"("сотрудник_id") ON DELETE CASCADE;


--
-- Name: Комментарий к инциденту Комментарий к инциде_инцидент_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Комментарий к инциденту"
    ADD CONSTRAINT "Комментарий к инциде_инцидент_id_fkey" FOREIGN KEY ("инцидент_id") REFERENCES public."Инцидент"("инцидент_id") ON DELETE CASCADE;


--
-- Name: Мера устранения Мера устранения_тип_меры_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Мера устранения"
    ADD CONSTRAINT "Мера устранения_тип_меры_id_fkey" FOREIGN KEY ("тип_меры_id") REFERENCES public."Тип меры реагирования"("тип_меры_id") ON DELETE RESTRICT;


--
-- Name: Правило обнаружения Правило обнаружен_тип_правила_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Правило обнаружения"
    ADD CONSTRAINT "Правило обнаружен_тип_правила_id_fkey" FOREIGN KEY ("тип_правила_id") REFERENCES public."Тип правила обнаружения"("тип_правила_id") ON DELETE RESTRICT;


--
-- Name: Приложение к инциденту Приложение к инциден_инцидент_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Приложение к инциденту"
    ADD CONSTRAINT "Приложение к инциден_инцидент_id_fkey" FOREIGN KEY ("инцидент_id") REFERENCES public."Инцидент"("инцидент_id") ON DELETE CASCADE;


--
-- Name: Приложение к инциденту Приложение к инцидент_загрузил_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Приложение к инциденту"
    ADD CONSTRAINT "Приложение к инцидент_загрузил_fkey" FOREIGN KEY ("загрузил") REFERENCES public."Сотрудник"("сотрудник_id") ON DELETE SET NULL;


--
-- Name: Сотрудник Сотрудник_группа_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Сотрудник"
    ADD CONSTRAINT "Сотрудник_группа_id_fkey" FOREIGN KEY ("группа_id") REFERENCES public."Группа сотрудников"("группа_id") ON DELETE SET NULL;


--
-- Name: Сотрудник Сотрудник_роль_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Сотрудник"
    ADD CONSTRAINT "Сотрудник_роль_id_fkey" FOREIGN KEY ("роль_id") REFERENCES public."Роль сотрудника"("роль_id") ON DELETE RESTRICT;


--
-- Name: Уведомление Уведомление_инцидент_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Уведомление"
    ADD CONSTRAINT "Уведомление_инцидент_id_fkey" FOREIGN KEY ("инцидент_id") REFERENCES public."Инцидент"("инцидент_id") ON DELETE CASCADE;


--
-- Name: Угроза Угроза_категория_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Угроза"
    ADD CONSTRAINT "Угроза_категория_id_fkey" FOREIGN KEY ("категория_id") REFERENCES public."Категория угрозы"("категория_id") ON DELETE RESTRICT;


--
-- Name: Уязвимость актива Уязвимость актива_актив_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Уязвимость актива"
    ADD CONSTRAINT "Уязвимость актива_актив_id_fkey" FOREIGN KEY ("актив_id") REFERENCES public."Актив"("актив_id") ON DELETE CASCADE;


--
-- Name: Уязвимость актива Уязвимость актива_уязвимость_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Уязвимость актива"
    ADD CONSTRAINT "Уязвимость актива_уязвимость_id_fkey" FOREIGN KEY ("уязвимость_id") REFERENCES public."Уязвимость"("уязвимость_id") ON DELETE CASCADE;


--
-- Name: Эскалация инцидента Эскалация инцид_целевая_команд_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Эскалация инцидента"
    ADD CONSTRAINT "Эскалация инцид_целевая_команд_fkey" FOREIGN KEY ("целевая_команда_id") REFERENCES public."Команда реагирования"("команда_id") ON DELETE SET NULL;


--
-- Name: Эскалация инцидента Эскалация инцидент_эскалировал_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Эскалация инцидента"
    ADD CONSTRAINT "Эскалация инцидент_эскалировал_fkey" FOREIGN KEY ("эскалировал") REFERENCES public."Сотрудник"("сотрудник_id") ON DELETE SET NULL;


--
-- Name: Эскалация инцидента Эскалация инцидента_инцидент_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Эскалация инцидента"
    ADD CONSTRAINT "Эскалация инцидента_инцидент_id_fkey" FOREIGN KEY ("инцидент_id") REFERENCES public."Инцидент"("инцидент_id") ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict 7rKirZyDQl0TefGhI2k0OPQb56Zq3t4BnE6tst0kChnYNVfNf19L4IQPGElgKMY

