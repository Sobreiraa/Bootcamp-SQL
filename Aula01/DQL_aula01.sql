-------------------------------------------------------------------------------------- SELECT ----------------------------------------------------------------------------
SELECT * FROM customers;

SELECT customer_id,
	   company_name
FROM customers;

-- DISTINCT
SELECT country FROM customers;

SELECT DISTINCT(country) FROM customers;

-- COUNT
SELECT COUNT(DISTINCT(country)) FROM customers;

-------------------------------------------------------------------------------------- WHERE ----------------------------------------------------------------------------
-- Cliente do Brasil.
SELECT * FROM customers 
WHERE country = 'Brazil'; 

-- Clientes da Alemanha.
SELECT * FROM customers 
WHERE country = 'Germany';

-- Clientes da Alemanha e da cidade Berlin.
SELECT * FROM customers 
WHERE country = 'Germany' AND city = 'Berlin';

-- Clientes do Brasil e da Alemanha.
SELECT * FROM customers 
WHERE country = 'Brazil' OR country = 'Germany';

-- Clientes que não são do Brasil.
SELECT * FROM customers 
WHERE country <> 'Brazil';

-- Produtos com preço maior que 20 reais.
SELECT * FROM products
WHERE unit_price > 20;

-- Produtos entre 50 e 100 reais.
SELECT * FROM products
WHERE unit_price > 50 AND unit_price < 100;

-- Clientes onde a região não é null.
SELECT * FROM customers
WHERE region is not null;

SELECT * FROM customers
WHERE region is null;

-- Clientes onde o nome começa com A.
SELECT * FROM customers
WHERE company_name LIKE 'A%';

-- Clientes onde o nome termina com e.
SELECT UPPER(company_name) FROM customers
WHERE company_name LIKE '%e';

-- Cliente onde tem 'or' no meio do nome.
SELECT company_name FROM customers
WHERE company_name LIKE '%or%';

----------------------------------------------------------------------------------- operador IN --------------------------------------------------------------------------
-- Selecionando Alemanha, França ou Reino Unido.
SELECT * FROM customers
WHERE country IN ('Germany', 'France', 'UK');

-- Não selecionando Alemanha, França ou Reino Unido.
SELECT * FROM customers
WHERE country NOT IN ('Germany', 'France', 'UK');

------------------------------------------------------------------------------------ BETWEEN -----------------------------------------------------------------------------
-- Produtos entre 50 e 100 reais.
SELECT * FROM products 
WHERE unit_price BETWEEN 50 AND 100; 

-- Produtos entre as letras C e M.
SELECT * FROM products
WHERE product_name BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY product_name;

-- BETWEEN entre as datas informadas.
SELECT * FROM orders
WHERE order_date BETWEEN '07/04/1996' AND '07/09/1996';

----------------------------------------------------------------------------- FUNÇÃO DE AGREGAÇÃO ------------------------------------------------------------------------
SELECT product_name, MAX(unit_price) AS preco_maximo
FROM products
GROUP BY product_name
ORDER BY preco_maximo DESC
LIMIT 1;


------------------------------------------------------------------------------------ DESAFIOS ----------------------------------------------------------------------------
-- 1. Obter todas as colunas das tabelas Clientes, Pedidos e Fornecedores
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM suppliers;

-- 2. Obter todos os Clientes em ordem alfabética por país e nome
SELECT * FROM customers
ORDER BY country, contact_name;

-- 3. Obter os 5 pedidos mais antigos
SELECT * FROM orders
ORDER BY order_date ASC
LIMIT 5;

-- 4. Obter a contagem de todos os Pedidos feitos durante 1997
SELECT COUNT(*) FROM orders
WHERE order_date BETWEEN '1997-01-01' AND '1997-12-31';

-- 5. Obter os nomes de todas as pessoas de contato onde a pessoa é um gerente, em ordem alfabética
SELECT contact_name FROM customers
WHERE contact_title LIKE '%Manager%'
ORDER BY contact_name;

-- 6. Obter todos os pedidos feitos em 19 de maio de 1997
SELECT * FROM orders
WHERE order_date = '1997-05-19';






