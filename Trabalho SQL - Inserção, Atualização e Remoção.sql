-- Insira as categorias: Livros, DVD, Celular, TV
INSERT INTO categorias (nome)
VALUES ("Livros"), ("DVD"), ("Celular"), ("TV");

-- Insira 8 produtos (2 livros, 2 dvds, 2 celulares e 2 tvs), inclusive relacione cada um deles com sua respectiva categoria.
INSERT INTO produtos (titulo, preco, categoria_id)
VALUES ("MANIFESTO COMUNISTA", 28.90, 1),
       ("O LIVRO NEGRO DO COMUNISMO", 43.11, 1),
       ("O JOVEM KARL MARX", 59.99, 2),
       ("A REVOLUCAO DOS BICHOS", 25.50, 2),
       ("XIAOMI MI A2", 969.89, 3),
       ("XIAOMI POCOPHONE F1", 1873.00, 3),
       ("SMART TV LED 32 HD SAMSUNG", 199.99, 4),
       ("Smart TV LG PRO 49 Full HD", 1699.90, 4);

-- Insira 2 clientes: Carlos e Mariana
INSERT INTO clientes (nome, email, nascimento, endereco, cidade, uf)
VALUES ("CARLOS", "carlos@gmail.com", "1998-06-24", "RUA SEM NOME, N 0", "CIDADOPOLIS", "RR"),
       ("MARIANA", "mariana@gmail.com", "1992-04-01", "RUA ZEZE, N 88", "CAMARGO", "MG");

-- Cadastre 3 pedidos, dentre eles: 
--  Mariana compra 1 livro, paga em dinheiro; 
--  Carlos compra 1 livro, 1 filme e 1 celular, escolhe pagar com cartão, mas ainda não realiza o pagamento;
--  Mariana compra outro livro e um filme, paga com cartão;
INSERT INTO pedidos (cliente_id, datahora, pgto_tipo, pgto_status)
VALUES (2, "2018-01-03 12:00:00", 'D', 'S'),
       (1, "2017-02-02 13:30:00", 'CC', 'N'),
       (2, "2016-03-01 14:00:00", 'CC', 'S');

INSERT INTO pedidos_detalhes (pedido_id, produto_id, preco)
VALUES (1, 2, 9.60),
       (2, 1, 7.70), (2, 4, 119.99), (2, 6, 1034.99),
       (3, 1, 7.70), (3, 3, 39.99);

-- Altere o nome das categorias “DVD” para “DVDs”, “Celular” para “Celulares” e “TV” para “TVs”.
UPDATE categorias SET nome="DVDs" WHERE nome="DVD";
UPDATE categorias SET nome="Celulares" WHERE nome="Celular";
UPDATE categorias SET nome="TVs" WHERE nome="TV";

-- Altere o preço dos DVDs para um acréscimo de 10%.
UPDATE produtos SET preco=preco*1.1 WHERE categoria_id=2;

-- Altere o preço dos Celulares para um desconto de 10%.
UPDATE produtos SET preco=preco*0.9 WHERE categoria_id=3;

-- Remova todos os produtos pertencentes à categoria TVs e depois a própria categoria TVs.
DELETE FROM produtos WHERE categoria_id=4;
-- Insira as categorias: Livros, DVD, Celular, TV
INSERT INTO categorias (nome)
VALUES ("Livros"), ("DVD"), ("Celular"), ("TV");

-- Insira 8 produtos (2 livros, 2 dvds, 2 celulares e 2 tvs), inclusive relacione cada um deles com sua respectiva categoria.
INSERT INTO produtos (titulo, preco, categoria_id)
VALUES ("MANIFESTO COMUNISTA", 28.90, 1),
       ("O LIVRO NEGRO DO COMUNISMO", 43.11, 1),
       ("O JOVEM KARL MARX", 59.99, 2),
       ("A REVOLUCAO DOS BICHOS", 25.50, 2),
       ("XIAOMI MI A2", 969.89, 3),
       ("XIAOMI POCOPHONE F1", 1873.00, 3),
       ("SMART TV LED 32 HD SAMSUNG", 199.99, 4),
       ("Smart TV LG PRO 49 Full HD", 1699.90, 4);

-- Insira 2 clientes: Carlos e Mariana
INSERT INTO clientes (nome, email, nascimento, endereco, cidade, uf)
VALUES ("CARLOS", "carlos@gmail.com", "1998-06-24", "RUA SEM NOME, N 0", "CIDADOPOLIS", "RR"),
       ("MARIANA", "mariana@gmail.com", "1992-04-01", "RUA ZEZE, N 88", "CAMARGO", "MG");

-- Cadastre 3 pedidos, dentre eles: 
--  Mariana compra 1 livro, paga em dinheiro; 
--  Carlos compra 1 livro, 1 filme e 1 celular, escolhe pagar com cartão, mas ainda não realiza o pagamento;
--  Mariana compra outro livro e um filme, paga com cartão;
INSERT INTO pedidos (cliente_id, datahora, pgto_tipo, pgto_status)
VALUES (2, "2019-01-01 12:00:00", 'D', 'S'),
       (1, "2019-02-02 13:30:00", 'CC', 'N'),
       (2, "2019-03-03 14:00:00", 'CC', 'S');

INSERT INTO pedidos_detalhes (pedido_id, produto_id, preco)
VALUES (1, 2, 9.60),
       (2, 1, 7.70), (2, 4, 119.99), (2, 6, 1034.99),
       (3, 1, 7.70), (3, 3, 39.99);

-- Altere o nome das categorias “DVD” para “DVDs”, “Celular” para “Celulares” e “TV” para “TVs”.
UPDATE categorias SET nome="DVDs" WHERE nome="DVD";
UPDATE categorias SET nome="Celulares" WHERE nome="Celular";
UPDATE categorias SET nome="TVs" WHERE nome="TV";

-- Altere o preço dos DVDs para um acréscimo de 10%.
UPDATE produtos SET preco=preco*1.1 WHERE categoria_id=2;

-- Altere o preço dos Celulares para um desconto de 10%.
UPDATE produtos SET preco=preco*0.9 WHERE categoria_id=3;

-- Remova todos os produtos pertencentes à categoria TVs e depois a própria categoria TVs.
DELETE FROM produtos WHERE categoria_id=4;
DELETE FROM categorias WHERE id=4;