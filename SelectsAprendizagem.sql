 -- Operadores aritméticos
 -- AS = apelidar 
 SELECT 10 +5 AS soma;  
 SELECT 10 - 5 AS subtracao;
 SELECT 10*5 AS multiplicacao;
 SELECT 10 / 5 AS divisao;
 SELECT 10 % 3 AS modulo; -- 10% 3 = 1 ( o resto da divisão)
 
 -- Operadores de comparação
 
 SELECT * FROM clientes WHERE idade = 20; -- Todo mundo que tem
 SELECT * FROM clientes WHERE idade!=25; -- Todo mundo que não tem
 
 SELECT * FROM produtos WHERE preco > 100; -- Maior
 SELECT * FROM produtos WHERE preco < 50; -- Menor
 SELECT * FROM produtos WHERE preco >= 500; -- Maior igual
 SELECT * FROM produtos WHERE preco <= 1000; -- Menor igual
 SELECT * FROM produtos WHERE preco BETWEEN 50 AND 100; -- Esteja entre
 SELECT * FROM clientes WHERE nome IN ('Ricardo', 'Roger'); -- Diversos
 
 SELECT * FROM clientes WHERE nome LIKE('ro%'); -- roger
 SELECT * FROM clientes WHERE nome LIKE('%o%');
 SELECT * FROM clientes WHERE nome LIKE('%ger%');
 SELECT * FROM clientes WHERE nome IS NULL; -- Selecionando quem é nulo
 
 -- Operadores lógicos
 SELECT * FROM clientes WHERE idade > 15 AND idade < 25; -- &&
 SELECT * FROM clientes WHERE idade > 15 OR idade < 25; -- ||
 SELECT * FROM clientes WHERE NOT idade = 18; -- Não seja
 SELECT * FROM clientes;
 
 -- Função de Agregação 
 SELECT COUNT(*) FROM clientes; -- Contas as linhas do banco
 SELECT SUM(quantidade) FROM produtos; -- Somar todas quantidades
 SELECT AVG(quantidade) FROM produtos; -- Média 
 SELECT MIN(quantidade) FROM produtos; -- Mínimo
 SELECT MAX(quantidade) FROM produtos; -- Máximo
 
 -- FUnções de String
 SELECT CONCAT(nome, idade) FROM clientes; -- Concatenar
 SELECT LOWER(nome) FROM clientes; -- Deixar tudo minusculo
 SELECT UPPER(nome) FROM clientes; -- Deixar tudo maíusculo
 SELECT SUBSTRING(nome,5,10) FROM clientes; -- Cortar a palavra, inicio e fim
 
 -- Função data e hora
 SELECT NOW(); -- Retorna a data e hora atual
 SELECT CURDATE(); -- Retorna a data atual
 SELECT CURTIME(); -- Retorna a hora atual
 
 -- Funções matemáticas
SELECT ABS(); -- Retorna um valor absoluto
SELECT CEIL(43.45); -- Arredonda para um número inteiro
SELECT CEILING(43.65); -- Arredonda para um número inteiro
-- 43.45 -> 44

SELECT FLOOR (45.97); -- Arredonda para baixo
SELECT ROUND(45.95,0); -- Arredonda com base nas casas decimais
SELECT SQRT(7); -- Raíz quadrada 