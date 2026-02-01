BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS cliente (
    id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    telefone TEXT
);
CREATE TABLE IF NOT EXISTS item_venda (
    id_item_venda INTEGER PRIMARY KEY AUTOINCREMENT,
    id_venda INTEGER NOT NULL,
    id_produto INTEGER NOT NULL,
    quantidade INTEGER NOT NULL,
    valor_unitario NUMERIC(10,2) NOT NULL,
    subtotal NUMERIC(10,2) NOT NULL,

    FOREIGN KEY (id_venda) REFERENCES venda(id_venda),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);
CREATE TABLE IF NOT EXISTS produto (
    id_produto INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    valor NUMERIC(10,2) NOT NULL,
    quantidade INTEGER NOT NULL,
    descricao TEXT
);
CREATE TABLE IF NOT EXISTS servico (
    id_servico INTEGER PRIMARY KEY AUTOINCREMENT,
    id_cliente INTEGER NOT NULL,
    descricao TEXT NOT NULL,
    valor NUMERIC(10,2) NOT NULL,
    data_entrada TEXT,

    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);
CREATE TABLE IF NOT EXISTS servico_produto (
    id_servico_produto INTEGER PRIMARY KEY AUTOINCREMENT,
    id_servico INTEGER NOT NULL,
    id_produto INTEGER NOT NULL,
    quantidade INTEGER NOT NULL,

    FOREIGN KEY (id_servico) REFERENCES servico(id_servico),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);
CREATE TABLE IF NOT EXISTS usuario (
    id_usuario INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    login TEXT NOT NULL UNIQUE,
    senha TEXT NOT NULL,
    perfil TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS venda (
    id_venda INTEGER PRIMARY KEY AUTOINCREMENT,
    id_cliente INTEGER,
    data_venda TEXT,
    total_venda NUMERIC(10,2) NOT NULL,
    forma_pagamento TEXT,

    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);
COMMIT;
