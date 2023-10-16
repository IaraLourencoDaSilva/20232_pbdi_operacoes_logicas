DO $$
DECLARE
	a INT := valor_aleatorio_entre(0, 20);
	b INT := valor_aleatorio_entre(0, 20);
	c INT := valor_aleatorio_entre(0, 20);
	delta NUMERIC(10,2);
	raizUm NUMERIC(10, 2);
	raizDois NUMERIC(10, 2);
BEGIN
--U& precedendo uma string indica que podemos especificar símbolos unicode
	RAISE NOTICE 'Equação: %x% + %x + % = 0', a, U&'\00B2', b, c;
	IF a = 0 THEN
		RAISE NOTICE 'Não é uma equação do segundo grau';
	ELSE
	-- observe que podemos omitir * para multiplicação
		delta := b ^ 2 - 4 * a * c;
		RAISE NOTICE 'Valor de delta: %', delta;
	IF delta < 0 THEN
		RAISE NOTICE 'Nenhum raiz.';
	-- ELSIF pode ser ELSEIF também
	ELSIF delta = 0 THEN
		raizUm := (-b + |/delta) / 2*a;
		RAISE NOTICE 'Uma raiz: %', raizUm;
	ELSE
		raizUm := (-b + |/delta) / 2*a;
		raizDois := (-b - |/delta) / 2*a;
		RAISE NOTICE 'Duas raizes: % e %', raizUm, raizDois;
	END IF;
	END IF;
END;
$$


-- DO $$
-- DECLARE
-- 	valor INT := valor_aleatorio_entre(1, 100);
-- BEGIN
-- 	RAISE NOTICE 'O valor gerado é: %', valor;
-- 	IF valor % 2 = 0 THEN
-- 		RAISE NOTICE '% é par', valor;
-- 	ELSE
-- 		RAISE NOTICE '% é ímpar', valor;
-- 	END IF;
-- END;
-- $$

-- DO $$
-- DECLARE
-- 	valor INT;
-- BEGIN
-- 	SELECT valor_aleatorio_entre(1, 100) INTO valor;
-- 	RAISE NOTICE 'O valor gerado é: %', valor;
-- 	IF valor BETWEEN 1 AND 20 THEN
-- 		RAISE NOTICE 'A metade do valor % é %', valor, valor / 2.;
-- 	END IF;
-- END;
-- $$



-- DO $$
-- DECLARE
-- 	valor INT;
-- BEGIN
-- 	valor := valor_aleatorio_entre(1, 100);
-- 	RAISE NOTICE 'O valor gerado é: %', valor;
-- 	IF valor <= 20 THEN
-- 		RAISE NOTICE 'A metade do valor % é %',	valor, valor / 2::FLOAT;
-- 	END IF;
-- END;
-- $$


-- CREATE OR REPLACE FUNCTION valor_aleatorio_entre (lim_inferior INT, lim_superior
-- INT) RETURNS INT AS
-- $$
-- BEGIN
-- RETURN FLOOR(RANDOM() * (lim_superior - lim_inferior + 1) + lim_inferior)::INT;
-- END;
-- $$ LANGUAGE plpgsql;
-- SELECT valor_aleatorio_entre (2, 10);

-- CREATE OR REPLACE FUNCTION valor_aleatorio_entre (lim_inferior INT, lim_superior
-- INT) RETURNS INT AS
-- $$
-- BEGIN
-- RETURN FLOOR(RANDOM() * (lim_superior - lim_inferior + 1) + lim_inferior)::INT;
-- END;
-- $$ LANGUAGE plpgsql;