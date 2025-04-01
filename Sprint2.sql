--Integrantes: 
--Júlia Martins Santana Figueiredo, RM98163 
--Larrisa Akemi Iwamoto, RM550562 
--Marcelo Henrique Góes da Costa Borgar, RM98893 
--Ricardo Brito Ponticelli Prieto, RM98370 
--Vinicius Becker Prediger, RM94679, 2TDSS




--Melhorias no Planejamento Estratégico:


--OBS: O FORMATO DE DATA INSERIDO É O QUE ESTÁ COMO CERTO NO MEU COMPUTADOR, RODANDO 'select sysdate from dual;' ESSE É O FORMATO FORNECIDO(09-03-24). 
--FALANDO ISSO, POIS PODE SER QUE DÊ ERRO AO RODAR INSERINDO VALORES 'DATE' NAS TABELAS. MAS É QUE CADA COMPUTADOR TEM UMA FORMA DE ACEITAR AS DATAS.


--DELETANDO AS TABELAS
DROP TABLE synthai_sede CASCADE CONSTRAINTS;
DROP TABLE lideres_melhoria CASCADE CONSTRAINTS;
DROP TABLE resultado_melhoria CASCADE CONSTRAINTS;
DROP TABLE simulacao_melhoria CASCADE CONSTRAINTS;
DROP TABLE solucao_melhoria CASCADE CONSTRAINTS;
DROP TABLE empresa_melhoria CASCADE CONSTRAINTS;


--CRIANDO AS TABELAS E ADICIONANDO AS CHAVES ESTRANGEIRAS
CREATE TABLE synthai_sede (
    cnpj_sede NUMBER(14) PRIMARY KEY,
    email_sede VARCHAR2(255) NOT NULL,
    endereco_sede VARCHAR2(255) NOT NULL,
    telefone_sede NUMBER(20) NOT NULL,
    site_sede VARCHAR2(255) NOT NULL
);

CREATE TABLE lideres_melhoria (
    id_lider NUMBER(5) PRIMARY KEY,
    nome_lider VARCHAR2(45) NOT NULL,
    funcao_lider VARCHAR2(100) NOT NULL,
    departamento_lider VARCHAR2(100) NOT NULL,
    email_lider VARCHAR2(255) NOT NULL
);

CREATE TABLE resultado_melhoria (
    id_resul NUMBER(5) PRIMARY KEY,
    eficacia_resul VARCHAR2(255) NOT NULL,
    descricao_resul VARCHAR2(400) NOT NULL,
    data_registro_resul DATE NOT NULL,
    status_resul VARCHAR2(50) NOT NULL,
    lideres_melhoria_id_lider NUMBER(5) NOT NULL,
    CONSTRAINT fk_resultado_lideres_melhoria FOREIGN KEY (lideres_melhoria_id_lider) REFERENCES lideres_melhoria(id_lider)
);

CREATE TABLE simulacao_melhoria (
    id_simu NUMBER(5) PRIMARY KEY,
    algoritmo_utilizado_simu VARCHAR2(255) NOT NULL,
    tipo_modelo_simu VARCHAR2(255) NOT NULL,
    descricao_simu VARCHAR2(400) NOT NULL,
    nome_simu VARCHAR2(100) NOT NULL,
    synthai_sede_cnpj_sede NUMBER(14) NOT NULL,
    resultado_melhoria_id_resul NUMBER(5) NOT NULL,
    CONSTRAINT fk_simulacao_synthai_sede FOREIGN KEY (synthai_sede_cnpj_sede) REFERENCES synthai_sede(cnpj_sede),
    CONSTRAINT fk_simulacao_resultado_melhoria FOREIGN KEY (resultado_melhoria_id_resul) REFERENCES resultado_melhoria(id_resul)
);

CREATE TABLE solucao_melhoria (
    id_solucao NUMBER(5)PRIMARY KEY,
    resultado_solucao VARCHAR2(255) NOT NULL,
    custo_solucao NUMBER(11) NOT NULL,
    data_implementacao_solucao DATE NOT NULL,
    descricao_solucao VARCHAR2(400) NOT NULL,
    lideres_melhoria_id_lider NUMBER(5) NOT NULL,
    CONSTRAINT fk_solucao_lideres_melhoria FOREIGN KEY (lideres_melhoria_id_lider) REFERENCES lideres_melhoria(id_lider)
);

CREATE TABLE empresa_melhoria (
    cnpf_empre NUMBER(14) PRIMARY KEY,
    nome_empre VARCHAR2(100) NOT NULL,
    endereco_empre VARCHAR2(255) NOT NULL,
    email_empre VARCHAR2(255) NOT NULL,
    telefone_empre NUMBER(20) NOT NULL,
    synthai_sede_cnpj_sede NUMBER(14) NOT NULL,
    CONSTRAINT fk_empresa_synthai_sede FOREIGN KEY (synthai_sede_cnpj_sede) REFERENCES synthai_sede(cnpj_sede)
);


--INSERINDO VALORES NAS TABELAS
INSERT INTO synthai_sede (cnpj_sede, email_sede, endereco_sede, telefone_sede, site_sede) VALUES 
    (12345678901234, 'synthai@hotmail.com', 'Rua da Glória', 1122334401, 'www.synthai.com.br');

SELECT * FROM synthai_sede;


INSERT INTO lideres_melhoria (id_lider, nome_lider, funcao_lider, departamento_lider, email_lider) VALUES
    (10, 'Maria Santos', 'Analista de Recursos Humanos', 'Departamento de Recursos Humanos', 'maria.santos@hotmail.com');
INSERT INTO lideres_melhoria (id_lider, nome_lider, funcao_lider, departamento_lider, email_lider) VALUES
    (12, 'Pedro Oliveira', 'Diretor Financeiro', 'Departamento Financeiro', 'pedro.oliveira@hotmail.com');
INSERT INTO lideres_melhoria (id_lider, nome_lider, funcao_lider, departamento_lider, email_lider) VALUES
    (13, 'Ana Lima', 'Gerente de Vendas', 'Departamento de Vendas e Marketing', 'ana.lima@gmail.com');
INSERT INTO lideres_melhoria (id_lider, nome_lider, funcao_lider, departamento_lider, email_lider) VALUES
    (11, 'João Silva', 'Gerente de Projetos', 'Departamento de Tecnologia da Informação (TI)', 'joaosilva@gmail.com');
INSERT INTO lideres_melhoria (id_lider, nome_lider, funcao_lider, departamento_lider, email_lider) VALUES
    (14, 'Juliana Costa', 'Analista de TI', 'Departamento de Tecnologia da Informação (TI)', 'juliana.costa@hotmail.com');

SELECT * FROM lideres_melhoria;


--OBS: O FORMATO DE DATA INSERIDO É O QUE ESTÁ COMO CERTO NO MEU COMPUTADOR, RODANDO 'select sysdate from dual;' ESSE É O FORMATO FORNECIDO.
INSERT INTO resultado_melhoria (id_resul, eficacia_resul, descricao_resul, data_registro_resul, status_resul, lideres_melhoria_id_lider) VALUES
    (52, '95% de precisão', 'A simulação forneceu insights cruciais para orientar ajustes estratégicos e otimizar a eficácia dos processos organizacionais.', '07-03-23', 'Concluído', 10);
INSERT INTO resultado_melhoria (id_resul, eficacia_resul, descricao_resul, data_registro_resul, status_resul, lideres_melhoria_id_lider) VALUES
    (53, '90% de eficácia', 'A análise revelou áreas-chave para melhorias na eficiência operacional.', '02-03-24', 'Em andamento', 11);
INSERT INTO resultado_melhoria (id_resul, eficacia_resul, descricao_resul, data_registro_resul, status_resul, lideres_melhoria_id_lider) VALUES
    (54, '99% de sucesso', 'As descobertas forneceram insights para otimizar a experiência do cliente.', '15-04-24', 'Em andamento', 12);
INSERT INTO resultado_melhoria (id_resul, eficacia_resul, descricao_resul, data_registro_resul, status_resul, lideres_melhoria_id_lider) VALUES
    (55, '97% de efetividade', 'A simulação destacou oportunidades de crescimento no mercado-alvo.', '26-02-24', 'Concluído', 13);
INSERT INTO resultado_melhoria (id_resul, eficacia_resul, descricao_resul, data_registro_resul, status_resul, lideres_melhoria_id_lider) VALUES
    (56, '99% de precisão', 'Os resultados indicaram a necessidade de ajustes na estratégia de vendas.', '04-05-24', 'Concluído', 14);

SELECT * FROM resultado_melhoria;


INSERT INTO simulacao_melhoria (id_simu, algoritmo_utilizado_simu, tipo_modelo_simu, descricao_simu, nome_simu, synthai_sede_cnpj_sede, resultado_melhoria_id_resul) VALUES 
    (20001, 'K-Means', 'Regressão', 'Nesta simulação, empregamos um modelo de regressão utilizando algoritmos de redes neurais, fornecendo insights cruciais para otimizar a eficácia operacional da empresa', 'Simulação 007', 12345678901234, 52);
INSERT INTO simulacao_melhoria (id_simu, algoritmo_utilizado_simu, tipo_modelo_simu, descricao_simu, nome_simu, synthai_sede_cnpj_sede, resultado_melhoria_id_resul) VALUES
    (20002, 'Árvores de Decisão', 'Classificação', 'Nesta simulação, utilizamos o modelo de classificação com árvores de decisão para analisar padrões complexos e tomar decisões estratégicas fundamentadas.', 'Simulação 008', 12345678901234, 53);
INSERT INTO simulacao_melhoria (id_simu, algoritmo_utilizado_simu, tipo_modelo_simu, descricao_simu, nome_simu, synthai_sede_cnpj_sede, resultado_melhoria_id_resul) VALUES
    (20003, 'Regressão Linear', 'Regressão', 'Nesta simulação, aplicamos o modelo de regressão linear para identificar relações lineares entre variáveis ??e prever tendências futuras, orientando decisões estratégicas baseadas em dados.', 'Simulação 009', 12345678901234, 54);
INSERT INTO simulacao_melhoria (id_simu, algoritmo_utilizado_simu, tipo_modelo_simu, descricao_simu, nome_simu, synthai_sede_cnpj_sede, resultado_melhoria_id_resul) VALUES
    (20004, 'Rede Neural', 'Classificação', 'Nesta simulação, empregamos uma rede neural para análise preditiva, identificando padrões complexos nos dados e fornecendo insights valiosos para aprimorar estratégias de negócios.', 'Simulação 010', 12345678901234, 55);
INSERT INTO simulacao_melhoria (id_simu, algoritmo_utilizado_simu, tipo_modelo_simu, descricao_simu, nome_simu, synthai_sede_cnpj_sede, resultado_melhoria_id_resul) VALUES
    (20005, 'Gradient Boosting', 'Classificação', 'Nesta simulação, utilizamos o algoritmo de Gradient Boosting para construir um modelo de classificação robusto, fornecendo insights cruciais para melhorar a eficácia das estratégias de marketing.', 'Simulação 011', 12345678901234, 56);

SELECT * FROM simulacao_melhoria;


INSERT INTO solucao_melhoria (id_solucao, resultado_solucao, custo_solucao, data_implementacao_solucao, descricao_solucao, lideres_melhoria_id_lider) VALUES 
    (1, 'Redução de custos em 15%', 10524, '23-05-24', 'Implementação de práticas de gestão de estoque otimizadas para reduzir os custos operacionais da empresa em 15%', 10);
INSERT INTO solucao_melhoria (id_solucao, resultado_solucao, custo_solucao, data_implementacao_solucao, descricao_solucao, lideres_melhoria_id_lider) VALUES
    (2, 'Aumento da produtividade em 20%', 100500, '12-05-24', 'Implementação de novos processos de automação para aumentar a produtividade da equipe em 20%', 11);
INSERT INTO solucao_melhoria (id_solucao, resultado_solucao, custo_solucao, data_implementacao_solucao, descricao_solucao, lideres_melhoria_id_lider) VALUES
    (3, 'Otimização do fluxo de trabalho', 50258, '07-03-24', 'Revisão e simplificação dos processos internos para otimizar o fluxo de trabalho e reduzir os tempos de ciclo', 12);
INSERT INTO solucao_melhoria (id_solucao, resultado_solucao, custo_solucao, data_implementacao_solucao, descricao_solucao, lideres_melhoria_id_lider) VALUES
    (4, 'Melhoria da qualidade do produto', 120500, '26-02-24', 'Implementação de programas de treinamento para funcionários e atualização de equipamentos para garantir uma melhoria significativa na qualidade do produto', 13);
INSERT INTO solucao_melhoria (id_solucao, resultado_solucao, custo_solucao, data_implementacao_solucao, descricao_solucao, lideres_melhoria_id_lider) VALUES
    (5, 'Aumento da satisfação do cliente em 25%', 30100, '10-04-24', 'Desenvolvimento e implementação de estratégias focadas no cliente para melhorar a experiência do cliente e aumentar a satisfação em 25%', 14);

SELECT * FROM solucao_melhoria;


INSERT INTO empresa_melhoria (cnpf_empre, nome_empre, endereco_empre, email_empre, telefone_empre, synthai_sede_cnpj_sede) VALUES    
    (12345678000190, 'TechNova Solutions', 'Avenida joão marques', 'technovasolutions@hotmail.com', 119546321078, 12345678901234);
INSERT INTO empresa_melhoria (cnpf_empre, nome_empre, endereco_empre, email_empre, telefone_empre, synthai_sede_cnpj_sede) VALUES 
    (98765432000121, 'GreenGrowth Innovations', 'Avenida dos santos', 'greenGrowthinnovations@hotmail.com', 139475123650, 12345678901234);
INSERT INTO empresa_melhoria (cnpf_empre, nome_empre, endereco_empre, email_empre, telefone_empre, synthai_sede_cnpj_sede) VALUES 
    (45678901000154, 'BrightSpark Technologies', 'Rua das flores', 'brightsparktechnologies@hotmail.com', 119201475326, 12345678901234);
INSERT INTO empresa_melhoria (cnpf_empre, nome_empre, endereco_empre, email_empre, telefone_empre, synthai_sede_cnpj_sede) VALUES 
    (23456789000183, 'AquaQuest Enterprises', 'Rua Osórios Flores', 'aquaquestenterprises@gmail.com', 619012547863, 12345678901234);
INSERT INTO empresa_melhoria (cnpf_empre, nome_empre, endereco_empre, email_empre, telefone_empre, synthai_sede_cnpj_sede) VALUES 
    (67890123000132, 'StellarCraft Industries', 'Rua Boreal', 'stellarcraftindustries@gmail.com', 279648721048, 12345678901234);

SELECT * FROM empresa_melhoria;







--Este bloco executa um inner join entre as tabelas lideres_melhoria e solucao_melhoria e exibe 
--apenas o nome do líder e o resultado da solução na saída, assim mostrando o resultado que o líder conseguiu.


SET SERVEROUTPUT ON;

DECLARE
    v_nome_lider lideres_melhoria.nome_lider%TYPE;
    v_resultado_solucao solucao_melhoria.resultado_solucao%TYPE;
    
BEGIN
    FOR rec IN (
        SELECT l.nome_lider, s.resultado_solucao
        FROM lideres_melhoria l
        INNER JOIN solucao_melhoria s ON l.id_lider = s.lideres_melhoria_id_lider
    ) LOOP
        v_nome_lider := rec.nome_lider;
        v_resultado_solucao := rec.resultado_solucao;
        
        DBMS_OUTPUT.PUT_LINE('Nome Líder: ' || v_nome_lider || ' / Resultado Solução: ' || v_resultado_solucao);
    END LOOP;
    COMMIT;
END;
/


-- Esse bloco percorre a tabela empresa_melhorias, selecionando os nomes e CNPJs das empresas, agrupandos por nome_empre e cnpf_empre. E imprimindos.

SET SERVEROUTPUT ON;

DECLARE
    v_nome_empre empresa_melhoria.nome_empre%TYPE;
    v_cnpf_empre empresa_melhoria.cnpf_empre%TYPE;
BEGIN
    FOR empresa IN (
    SELECT nome_empre, cnpf_empre 
    FROM empresa_melhoria 
    GROUP BY nome_empre, cnpf_empre) 
    LOOP
        v_nome_empre := empresa.nome_empre;
        v_cnpf_empre := empresa.cnpf_empre;
        DBMS_OUTPUT.PUT_LINE('Empresa: ' || v_nome_empre || ' / CNPJ: ' || v_cnpf_empre);
    END LOOP;
    COMMIT;
END;
/



-- Aqui é um bloco PL/SQL que utiliza um left join entre as tabelas simulacao_melhoria e resultado_melhoria e ordena os resultados por id_simu:

SET SERVEROUTPUT ON;

DECLARE
    v_id_simu simulacao_melhoria.id_simu%TYPE;
    v_algoritmo_utilizado_simu simulacao_melhoria.algoritmo_utilizado_simu%TYPE;
    v_tipo_modelo_simu simulacao_melhoria.tipo_modelo_simu%TYPE;
    
BEGIN
    FOR rec IN (
        SELECT s.id_simu, s.algoritmo_utilizado_simu, s.tipo_modelo_simu, s.descricao_simu, s.nome_simu
        FROM simulacao_melhoria s
        LEFT JOIN resultado_melhoria r ON s.resultado_melhoria_id_resul = r.id_resul
        ORDER BY s.id_simu
    ) LOOP
        v_id_simu := rec.id_simu;
        v_algoritmo_utilizado_simu := rec.algoritmo_utilizado_simu;
        v_tipo_modelo_simu := rec.tipo_modelo_simu;
        
        DBMS_OUTPUT.PUT_LINE('ID Simulação: ' || v_id_simu || ' / Algoritmo Utilizado: ' || v_algoritmo_utilizado_simu ||
                             ' / Tipo de Modelo: ' || v_tipo_modelo_simu);
    END LOOP;
    COMMIT;
END;
/









--FUNÇÕES PARA VALIDAR ENTRADA DE DADOS

--Essa é uma função que válida a entrada de um número, e ele deve ser igual ou menor que 10.
--Essa função serve para válidar a entrada de um ID, por exemplo.

SET SERVEROUTPUT ON;

DECLARE
    FUNCTION validar_numero(p_numero NUMBER) RETURN VARCHAR2 AS
        v_resultado VARCHAR2(100);
        
    BEGIN
        IF p_numero <= 10 THEN
            v_resultado := 'Válido, o número é menor ou igual a 10.';
        ELSE
            v_resultado := 'Inválido, número é maior que 10.';
        END IF;
        RETURN v_resultado;
    END validar_numero;
BEGIN
    DBMS_OUTPUT.PUT_LINE(validar_numero(5));
    DBMS_OUTPUT.PUT_LINE(validar_numero(11));
END;
/





--Essa função válida a entrada de e-mails.

SET SERVEROUTPUT ON;

DECLARE
    FUNCTION validar_email(p_email VARCHAR2) RETURN VARCHAR2 AS
        v_valido VARCHAR2(20);
        
    BEGIN

        IF REGEXP_LIKE(p_email, '^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$', 'i') THEN
            v_valido := 'Válido';
        ELSE
            v_valido := 'Inválido';
        END IF;
        RETURN v_valido;
    END validar_email;
BEGIN
    DBMS_OUTPUT.PUT_LINE('O e-mail "synthai@hotmail.com" é ' || validar_email('synthai@hotmail.com'));
    DBMS_OUTPUT.PUT_LINE('O e-mail "technovasolutionshotmail.com" é ' || validar_email('technovasolutionshotmail.com'));
END;
/








--PROCEDURES DE INSERT, UPDATE E DELETE

--Esta procedure aceita parâmetros correspondentes aos atributos da tabela lideres_melhoria e insere um novo 
--registro na tabela. E imprime uma mensagem indicando que o líder foi inserido com sucesso.

SET SERVEROUTPUT ON;

DECLARE
    PROCEDURE inserir_lider(
        p_id_lider IN lideres_melhoria.id_lider%TYPE,
        p_nome_lider IN lideres_melhoria.nome_lider%TYPE,
        p_funcao_lider IN lideres_melhoria.funcao_lider%TYPE,
        p_departamento_lider IN lideres_melhoria.departamento_lider%TYPE,
        p_email_lider IN lideres_melhoria.email_lider%TYPE
    ) AS
    BEGIN
        INSERT INTO lideres_melhoria(id_lider, nome_lider, funcao_lider, departamento_lider, email_lider)
        VALUES (p_id_lider, p_nome_lider, p_funcao_lider, p_departamento_lider, p_email_lider);
        
        DBMS_OUTPUT.PUT_LINE('Líder inserido com sucesso!');
        COMMIT;
    END inserir_lider;
BEGIN
    -- Chamada da procedure para inserir um líder
    inserir_lider(15, 'Valquiria Figueiredo', 'Diretora de Vendas', 'Departamento de Vendas e Marketing', 'valquiriafigueiredo@gmail.com');
END;
/




-- Essa procedure deleta uma empresa da tabela empresa_melhoria.

SET SERVEROUTPUT ON;

DECLARE
    PROCEDURE deletar_empresa(p_cnpf_empre IN empresa_melhoria.cnpf_empre%TYPE) AS
    BEGIN
        DELETE FROM empresa_melhoria WHERE cnpf_empre = p_cnpf_empre;
        DBMS_OUTPUT.PUT_LINE('Empresa excluída com sucesso!');
        COMMIT;
    END deletar_empresa;
BEGIN
    -- Chamada da procedure para excluir uma empresa
    deletar_empresa(12345678000190);
END;
/




-- Essa procedure de UPDATE atualiza os dados de uma empresa na tabela empresa_melhoria. 

SET SERVEROUTPUT ON;

DECLARE
    PROCEDURE atualizar_empresa(
        p_cnpf_empre IN empresa_melhoria.cnpf_empre%TYPE,
        p_nome_empre IN empresa_melhoria.nome_empre%TYPE,
        p_endereco_empre IN empresa_melhoria.endereco_empre%TYPE,
        p_email_empre IN empresa_melhoria.email_empre%TYPE,
        p_telefone_empre IN empresa_melhoria.telefone_empre%TYPE,
        p_synthai_sede_cnpj_sede IN empresa_melhoria.synthai_sede_cnpj_sede%TYPE
    ) AS
    BEGIN
        UPDATE empresa_melhoria
        SET nome_empre = p_nome_empre,
            endereco_empre = p_endereco_empre,
            email_empre = p_email_empre,
            telefone_empre = p_telefone_empre,
            synthai_sede_cnpj_sede = p_synthai_sede_cnpj_sede
        WHERE cnpf_empre = p_cnpf_empre;

        DBMS_OUTPUT.PUT_LINE('Empresa atualizada com sucesso!');
        COMMIT;
    END atualizar_empresa;
BEGIN
    -- Chamada da procedure para atualizar uma empresa (o endereço está sendo atualizado).
    atualizar_empresa(98765432000121, 'GreenGrowth Innovations', 'Avenida Horizonte', 'greenGrowthinnovations@hotmail.com', 139475123650, 12345678901234);
END;
/



SELECT * FROM lideres_melhoria;
SELECT * FROM empresa_melhoria;
SELECT * FROM empresa_melhoria;








--PROCEDURE UTILIZANDO UM CURSO E JOIN

--Esta procedure contém um cursor que faz um join entre as tabelas simulacao_melhoria e resultado_melhoria, selecionando 4 colunas dessas tabelas. Em seguida, 
--imprime os resultados.

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE consultar_simulacao_resultado IS
    CURSOR simulacao_cursor IS
        SELECT s.descricao_simu,
               s.nome_simu,
               r.eficacia_resul,
               r.descricao_resul
          FROM simulacao_melhoria s
               JOIN resultado_melhoria r ON s.resultado_melhoria_id_resul = r.id_resul;
BEGIN
    FOR simu_rec IN simulacao_cursor LOOP
        DBMS_OUTPUT.PUT_LINE('Descrição: ' || simu_rec.descricao_simu);
        DBMS_OUTPUT.PUT_LINE('Nome: ' || simu_rec.nome_simu);
        DBMS_OUTPUT.PUT_LINE('Eficácia do Resultado: ' || simu_rec.eficacia_resul);
        DBMS_OUTPUT.PUT_LINE('Descrição do Resultado: ' || simu_rec.descricao_resul);
        DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------------------------------------------------------------------');
        COMMIT;
    END LOOP;
    
    EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.put_line('ERRO NO PROCESSO! '|| 'CÓDIGO DO ERRO' || SQLCODE ||
                         'MENSAGEM ERRO: '|| SQLERRM);
    
END;
/




--Fazendo a chamada da procedure "consultar_simulacao_resultado".

SET SERVEROUTPUT ON;

DECLARE
    v_descricao_simu simulacao_melhoria.descricao_simu%TYPE;
    v_nome_simu simulacao_melhoria.nome_simu%TYPE;
    v_eficacia_resul resultado_melhoria.eficacia_resul%TYPE;
    v_descricao_resul resultado_melhoria.descricao_resul%TYPE;
BEGIN
    consultar_simulacao_resultado;
END;
/







--PROCEDURE QUE IMPRIME UM RELATÓRIO

--Aqui é criada uma procedure que imprime um relatório baseado nas tabelas lideres_melhoria e solucao_melhoria, que contém uma regra de negócio. 
--A regra de négocio é: Juntando os lideres e as soluções implementadas, o conjunto de soluções implementadas pelos líderes tem que ser até 10, pois
--temos que ter o controle do que estamos trabalhando.


SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE imprimir_relatorio AS
    v_total_solucoes NUMBER;
    
BEGIN
    SELECT COUNT(*)
    INTO v_total_solucoes
    FROM solucao_melhoria;
    
    DBMS_OUTPUT.PUT_LINE('RELATÓRIO DE SOLUÇÕES DE MELHORIA IMPLEMENTADAS');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Total de Soluções Implementadas: ' || v_total_solucoes);
    
    -- Imprime a regra de negócio
    IF v_total_solucoes > 10 THEN
        DBMS_OUTPUT.PUT_LINE('Atenção: O número total de soluções implementadas excedeu o limite!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Número total de soluções implementadas dentro do limite.');
        COMMIT;
    END IF;
    
    FOR r IN (
        SELECT 
            lm.nome_lider,
            lm.funcao_lider,
            lm.departamento_lider,
            COUNT(sm.id_solucao) AS total_solucoes
        FROM 
            lideres_melhoria lm
        INNER JOIN 
            solucao_melhoria sm ON lm.id_lider = sm.lideres_melhoria_id_lider
        GROUP BY 
            lm.nome_lider, lm.funcao_lider, lm.departamento_lider
        ORDER BY 
            COUNT(sm.id_solucao) DESC
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('-----------------------------------------------');
        DBMS_OUTPUT.PUT_LINE('Líder: ' || r.nome_lider);
        DBMS_OUTPUT.PUT_LINE('Função: ' || r.funcao_lider);
        DBMS_OUTPUT.PUT_LINE('Departamento: ' || r.departamento_lider);
        DBMS_OUTPUT.PUT_LINE('Total de Soluções Implementadas: ' || r.total_solucoes);
        COMMIT;
    END LOOP;
END imprimir_relatorio;
/


--Chamada da procedure "imprimir_relatorio".

SET SERVEROUTPUT ON;

BEGIN
   imprimir_relatorio;
END;
/







-- 5 PROCEDURES

--Esta procedure aceita parâmetros correspondentes aos atributos da tabela resultado_melhoria e insere um novo 
--registro na tabela. E imprime uma mensagem indicando que o resultado foi inserido com sucesso.

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE inserir_resultado(
    p_id_resul IN resultado_melhoria.id_resul%TYPE,
    p_eficacia_resul IN resultado_melhoria.eficacia_resul%TYPE,
    p_descricao_resul IN resultado_melhoria.descricao_resul%TYPE,
    p_data_registro_resul IN resultado_melhoria.data_registro_resul%TYPE,
    p_status_resul IN resultado_melhoria.status_resul%TYPE,
    p_lider_id IN resultado_melhoria.lideres_melhoria_id_lider%TYPE
) AS
BEGIN
    INSERT INTO resultado_melhoria(id_resul, eficacia_resul, descricao_resul, data_registro_resul, status_resul, lideres_melhoria_id_lider)
    VALUES (p_id_resul, p_eficacia_resul, p_descricao_resul, p_data_registro_resul, p_status_resul, p_lider_id);
    
    DBMS_OUTPUT.PUT_LINE('Resultado inserido com sucesso!');
    COMMIT;
END inserir_resultado;
/




--Esta procedure aceita parâmetros correspondentes aos atributos da tabela empresa_melhoria e insere um novo 
--registro na tabela. E imprime uma mensagem indicando que a empresa foi inserida com sucesso.

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE inserir_empresa(
    p_cnpj_empre IN empresa_melhoria.cnpf_empre%TYPE,
    p_nome_empre IN empresa_melhoria.nome_empre%TYPE,
    p_endereco_empre IN empresa_melhoria.endereco_empre%TYPE,
    p_email_empre IN empresa_melhoria.email_empre%TYPE,
    p_telefone_empre IN empresa_melhoria.telefone_empre%TYPE,
    p_synthai_sede_cnpj_sede IN empresa_melhoria.synthai_sede_cnpj_sede%TYPE
) AS
BEGIN
    INSERT INTO empresa_melhoria(cnpf_empre, nome_empre, endereco_empre, email_empre, telefone_empre, synthai_sede_cnpj_sede)
    VALUES (p_cnpj_empre, p_nome_empre, p_endereco_empre, p_email_empre, p_telefone_empre, p_synthai_sede_cnpj_sede);
    
    DBMS_OUTPUT.PUT_LINE('Empresa inserida com sucesso!');
    COMMIT;
END inserir_empresa;
/




-- Essa procedure de UPDATE atualiza os dados de um líder na tabela lideres_melhoria.

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE atualizar_lider(
    p_id_lider IN lideres_melhoria.id_lider%TYPE,
    p_nome_lider IN lideres_melhoria.nome_lider%TYPE,
    p_funcao_lider IN lideres_melhoria.funcao_lider%TYPE,
    p_departamento_lider IN lideres_melhoria.departamento_lider%TYPE,
    p_email_lider IN lideres_melhoria.email_lider%TYPE
) AS
BEGIN
    UPDATE lideres_melhoria
    SET nome_lider = p_nome_lider,
        funcao_lider = p_funcao_lider,
        departamento_lider = p_departamento_lider,
        email_lider = p_email_lider
    WHERE id_lider = p_id_lider;

    DBMS_OUTPUT.PUT_LINE('Líder atualizado com sucesso!');
    COMMIT;
END atualizar_lider;
/




-- Essa procedure deleta uma solução da tabela solucao_melhoria.

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE deletar_solucao(p_id_solucao IN solucao_melhoria.id_solucao%TYPE) AS
BEGIN
    DELETE FROM solucao_melhoria WHERE id_solucao = p_id_solucao;
    DBMS_OUTPUT.PUT_LINE('Solução excluída com sucesso!');
    COMMIT;
END deletar_solucao;
/





-- Essa procedure deleta uma simulação da tabela simulacao_melhoria.

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE deletar_simulacao(p_id_simu IN simulacao_melhoria.id_simu%TYPE) AS
BEGIN
    DELETE FROM simulacao_melhoria WHERE id_simu = p_id_simu;
    
    DBMS_OUTPUT.PUT_LINE('Simulação excluída com sucesso!');
    COMMIT;
END deletar_simulacao;
/




--Fazendo as chamadas das 5 procedures.

DECLARE

BEGIN
    -- Chamada da procedure "inserir_resultado".
    inserir_resultado(57, '98% de precisão', 'A análise resulta em que deve haver uma melhoria de processos de produção', '30/MAR/24', 'Em Andamento', 15);
    -- Chamada da procedure "inserir_empresa".
    inserir_empresa(33888999000177, 'AlphaWave Enterprises', 'Rua Alameda Imigrantes', 'alphawaveenterprises@hotmail.com', 119652135478, 12345678901234);
    -- Chamada da procedure "atualizar_lider" (o e-mail dela está sendo atualizado).
    atualizar_lider(13, 'Ana Lima', 'Gerente de Vendas', 'Departamento de Vendas e Marketing', 'analima@hotmail.com');
    -- Chamada da procedure "deletar_solucao".
    deletar_solucao(2);
     -- Chamada da procedure "deletar_simulacao".
    deletar_simulacao(20001);
END;
/



SELECT * FROM resultado_melhoria;
SELECT * FROM empresa_melhoria;
SELECT * FROM lideres_melhoria;
SELECT * FROM solucao_melhoria;
SELECT * FROM simulacao_melhoria;










































