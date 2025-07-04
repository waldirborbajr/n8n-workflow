Tabela balances

CREATE TABLE balances (

id BIGINT NOT NULL,

created_at TIMESTAMPTZ NOT NULL DEFAULT now(),

value NUMERIC,

tenant_id VARCHAR

);

Tabela transactions

CREATE TABLE transactions (

id BIGINT NOT NULL,

category VARCHAR,

description VARCHAR,

registered_at TIMESTAMPTZ DEFAULT now(),

tenant_id VARCHAR,

value NUMERIC

);
