CREATE SEQUENCE public.seq_empresa_id
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;


CREATE TABLE public.empresa(
  id bigint NOT NULL DEFAULT nextval('seq_empresa_id'::regclass),
  cnpj varchar(255) NOT NULL,
  data_atualizacao timestamp NOT NULL,
  data_criacao timestamp NOT NULL,
  razao_social varchar(255) NOT NULL
)WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

CREATE SEQUENCE public.seq_funcionario_id
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

CREATE TABLE public.funcionario(
  id bigint NOT NULL DEFAULT nextval('seq_funcionario_id'::regclass),
  cpf varchar(255) NOT NULL,
  data_atualizacao timestamp NOT NULL,
  data_criacao timestamp NOT NULL,
  email varchar(255) NOT NULL,
  nome varchar(255) NOT NULL,
  perfil varchar(255) NOT NULL,
  qtd_horas_almoco float DEFAULT NULL,
  qtd_horas_trabalho_dia float DEFAULT NULL,
  senha varchar(255) NOT NULL,
  valor_hora decimal(19,2) DEFAULT NULL,
  empresa_id Integer DEFAULT NULL
)WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

CREATE SEQUENCE public.seq_lancamento_id
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

CREATE TABLE public.lancamento(
  id bigint NOT NULL DEFAULT nextval('seq_lancamento_id'::regclass),
  data timestamp NOT NULL,
  data_atualizacao timestamp NOT NULL,
  data_criacao timestamp NOT NULL,
  descricao varchar(255) DEFAULT NULL,
  localizacao varchar(255) DEFAULT NULL,
  tipo varchar(255) NOT NULL,
  funcionario_id Integer DEFAULT NULL
)

WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

--
-- Indexes for table `empresa`
--
ALTER TABLE public.empresa ADD PRIMARY KEY (id);

--
-- Indexes for table `funcionario`
--
ALTER TABLE public.funcionario ADD PRIMARY KEY (id);

--
-- Indexes for table `lancamento`
--
ALTER TABLE public.lancamento ADD PRIMARY KEY (id);


ALTER TABLE public.funcionario
  ADD CONSTRAINT FK4cm1kg523jlopyexjbmi6y54j FOREIGN KEY (empresa_id) REFERENCES empresa (id);

--
-- Constraints for table `lancamento`
--
ALTER TABLE public.lancamento
  ADD CONSTRAINT FK46i4k5vl8wah7feutye9kbpi4 FOREIGN KEY (funcionario_id) REFERENCES funcionario (id);
