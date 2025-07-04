CREATE TABLE IF NOT EXISTS users (

id uuid PRIMARY KEY, -- assumindo uuid como PK

numero numeric,

isPremium boolean,

qtdMensagem numeric,

created_at timestamp with time zone DEFAULT now(),

);
