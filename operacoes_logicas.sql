--Exercicio
--1.3 Faça um programa que opera de acordo com o seguinte menu.
-- Opções:
-- 1 - Soma
-- 2 - Subtração
-- 3 - Multiplicação
-- 4 - Divisão
-- Cada operação envolve dois números inteiros. O resultado deve ser exibido no formato
-- op1 op op2 = res
-- Exemplo:
-- 2 + 3 = 5

DO $$
DECLARE
    opcao INT;
    num1 INT;
    num2 INT;
    resultado INT;
BEGIN
    num1 := valor_aleatorio_entre(1, 100); 
    num2 := valor_aleatorio_entre(1, 100); 
    RAISE NOTICE 'Opções:';
    RAISE NOTICE '1 - Soma';
    RAISE NOTICE '2 - Subtração';
    RAISE NOTICE '3 - Multiplicação';
    RAISE NOTICE '4 - Divisão';
    opcao := 1; 
    CASE opcao
        WHEN 1 THEN
            resultado := num1 + num2;
        WHEN 2 THEN
            resultado := num1 - num2;
        WHEN 3 THEN
            resultado := num1 * num2;
        WHEN 4 THEN
            resultado := num1 / num2;
        ELSE
            RAISE EXCEPTION 'Opção inválida';
    END CASE;
    RAISE NOTICE '%s %s %s = %s', num1, 
        CASE opcao
            WHEN 1 THEN '+'
            WHEN 2 THEN '-'
            WHEN 3 THEN '*'
            WHEN 4 THEN '/'
        END,
        num2, resultado;
END;
$$;


--1.2 Faça um programa que exibe se um número inteiro é múltiplo de 3 ou de 5.
DO $$
DECLARE
    numero_aleatorio INT;
BEGIN
    numero_aleatorio := valor_aleatorio_entre(1, 100); 
    IF numero_aleatorio % 3 = 0 OR numero_aleatorio % 5 = 0 THEN
        RAISE NOTICE 'O número aleatório % é múltiplo de 3 ou de 5', numero_aleatorio;
    ELSE
        RAISE NOTICE 'O número aleatório % não é múltiplo de 3 nem de 5', numero_aleatorio;
    END IF;
END;
$$;


-- 1.1 Faça um programa que exibe se um número inteiro é múltiplo de 3
-- DO $$
-- DECLARE
--     numero_aleatorio INT;
-- BEGIN
--     numero_aleatorio := valor_aleatorio_entre(1, 100);
--     IF numero_aleatorio % 3 = 0 THEN
--         RAISE NOTICE 'O número aleatório % é múltiplo de 3', numero_aleatorio;
--     ELSE
--         RAISE NOTICE 'O número aleatório % não é múltiplo de 3', numero_aleatorio;
--     END IF;
-- END;
-- $$;


-- DO $$
-- DECLARE
-- --testar
-- --22/10/2022: valida
-- --29/02/2020: 2020 é bissexto, válida
-- --29/02/2021: inválida
-- --28/02/2021: válida
-- --31/06/2021: inválida
-- 	data INT := 31062021;
-- 	dia INT;	
-- 	mes INT;
-- 	ano INT;
-- 	data_valida BOOL := TRUE;
-- BEGIN
-- 	dia := data / 1000000;
-- 	mes := data % 1000000 / 10000;
-- 	ano := data % 10000;
-- 	RAISE NOTICE 'A data é %/%/%', dia, mes, ano;
-- 	RAISE NOTICE 'Vejamos se é ela é válida...';
-- 	IF ano >= 1 THEN
-- 		CASE
-- 			WHEN mes > 12 OR mes < 1 OR dia < 1 OR dia > 31 THEN
-- 				data_valida := FALSE;
-- 		ELSE
-- 		--abril, junho, setembro e novembro não podem ter mais de 30 dias
-- 			IF ((mes = 4 OR mes = 6 OR mes = 9 OR mes = 11) AND dia > 30) THEN
-- 				data_valida := FALSE;
-- 			ELSE
-- 				--fevereiro
-- 				IF mes = 2 THEN
-- 					CASE
-- 						--se o ano for bissexto
-- 						WHEN ((ano % 4 = 0 AND ano % 100 <> 0)
-- 							OR ANO % 400 = 0) THEN
-- 						IF dia > 29 THEN
-- 							data_valida := FALSE;
-- 						END IF;
-- 					ELSE
-- 						IF dia > 28 THEN
-- 							data_valida := FALSE;
-- 						END IF;
-- 					END CASE;
-- 				END IF;
-- 			END IF;
-- 		END CASE;
-- 	ELSE
-- 		data_valida := FALSE;
-- 	END IF;
-- 	CASE
-- 		WHEN data_valida THEN
-- 			RAISE NOTICE 'Data válida';
-- 	ELSE
-- 		RAISE NOTICE 'Data inválida';
-- 	END CASE;
-- END;
-- $$

-- DO $$
-- DECLARE
-- 	valor INT := valor_aleatorio_entre (1, 12);
-- BEGIN
-- 	RAISE NOTICE 'O valor gerado é: %', valor;
-- 	CASE
-- 		WHEN valor BETWEEN 1 AND 10 THEN
-- 			CASE
-- 				WHEN valor % 2 = 0 THEN
-- 					RAISE NOTICE 'Par';
-- 			ELSE
-- 				RAISE NOTICE 'Ímpar';
-- 			END CASE;
-- 	ELSE
-- 		RAISE NOTICE 'Fora do intervalo';
-- 	END CASE;
-- END;
-- $$


-- DO $$
-- DECLARE
-- 	valor INT := valor_aleatorio_entre(1, 12);
-- 	mensagem VARCHAR(200);
-- BEGIN
-- 	RAISE NOTICE 'O valor gerado é: %', valor;
-- 	CASE valor
-- 	WHEN 1, 3, 5, 7, 9 THEN
-- 		mensagem := 'Ímpar';
-- 	WHEN 2, 4, 6, 8, 10 THEN
-- 		mensagem := 'Par';	
-- 	ELSE
-- 		mensagem := 'Fora do intervalo';
-- 	END CASE;
-- 		RAISE NOTICE '%', mensagem;
-- END;
-- $$

-- DO $$
-- DECLARE
-- 	valor INT;
-- 	mensagem VARCHAR(200);
-- BEGIN
-- 	--vamos admitir alguns valores fora do intervalo para ver o que acontece quando não há case previsto
-- 	valor := valor_aleatorio_entre (1, 12);
-- 	RAISE NOTICE 'O valor gerado é: %', valor;
-- 	CASE valor
-- 	WHEN 1 THEN
-- 		mensagem := 'Ímpar';
-- 	WHEN 3 THEN
-- 		mensagem := 'Ímpar';
-- 	WHEN 5 THEN
-- 		mensagem := 'Ímpar';
-- 	WHEN 7 THEN
-- 		mensagem := 'Ímpar';
-- 	WHEN 9 THEN
-- 		mensagem := 'Ímpar';
-- 	WHEN 2 THEN
-- 		mensagem := 'Par';
-- 	WHEN 4 THEN
-- 		mensagem := 'Par';
-- 	WHEN 6 THEN
-- 		mensagem := 'Par';
-- 	WHEN 8 THEN
-- 		mensagem := 'Par';
-- 	WHEN 10 THEN
-- 		mensagem := 'Par';
-- 	--comente o ELSE e veja o resultado quando não houver case para o valor: Exceção CASE_NOT_FOUND
-- 	ELSE
-- 		mensagem := 'Valor fora do intervalo';
-- 	END CASE;
-- 		RAISE NOTICE '%', mensagem;
-- END;
-- $$


-- DO $$
-- DECLARE
-- 	a INT := valor_aleatorio_entre(0, 20);
-- 	b INT := valor_aleatorio_entre(0, 20);
-- 	c INT := valor_aleatorio_entre(0, 20);
-- 	delta NUMERIC(10,2);
-- 	raizUm NUMERIC(10, 2);
-- 	raizDois NUMERIC(10, 2);
-- BEGIN
-- --U& precedendo uma string indica que podemos especificar símbolos unicode
-- 	RAISE NOTICE 'Equação: %x% + %x + % = 0', a, U&'\00B2', b, c;
-- 	IF a = 0 THEN
-- 		RAISE NOTICE 'Não é uma equação do segundo grau';
-- 	ELSE
-- 	-- observe que podemos omitir * para multiplicação
-- 		delta := b ^ 2 - 4 * a * c;
-- 		RAISE NOTICE 'Valor de delta: %', delta;
-- 	IF delta < 0 THEN
-- 		RAISE NOTICE 'Nenhum raiz.';
-- 	-- ELSIF pode ser ELSEIF também
-- 	ELSIF delta = 0 THEN
-- 		raizUm := (-b + |/delta) / 2*a;
-- 		RAISE NOTICE 'Uma raiz: %', raizUm;
-- 	ELSE
-- 		raizUm := (-b + |/delta) / 2*a;
-- 		raizDois := (-b - |/delta) / 2*a;
-- 		RAISE NOTICE 'Duas raizes: % e %', raizUm, raizDois;
-- 	END IF;
-- 	END IF;
-- END;
-- $$


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