--Melhorias no Planejamento Estrat�gico:


--OBS: O FORMATO DE DATA INSERIDO � O QUE EST� COMO CERTO NO MEU COMPUTADOR, RODANDO 'select sysdate from dual;' ESSE � O FORMATO FORNECIDO(09-03-24). 
--FALANDO ISSO, POIS PODE SER QUE D� ERRO AO RODAR INSERINDO VALORES 'DATE' NAS TABELAS. MAS � QUE CADA COMPUTADOR TEM UMA FORMA DE ACEITAR AS DATAS.


--DELETANDO AS TABELAS
DROP TABLE synthai_sede CASCADE CONSTRAINTS;
DROP TABLE lideres_melhoria CASCADE CONSTRAINTS;
DROP TABLE resultado_melhoria CASCADE CONSTRAINTS;
DROP TABLE simulacao_melhoria CASCADE CONSTRAINTS;
DROP TABLE solucao_melhoria CASCADE CONSTRAINTS;
DROP TABLE empresa_melhoria CASCADE CONSTRAINTS;
DROP TABLE auditoria_melhoria CASCADE CONSTRAINTS;


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

--CRIANDO A TABELA AUDITORIA COMO SE PEDE NO EXERC�CIO 3.
CREATE TABLE auditoria_melhoria (
    usuario VARCHAR2(50),
    operacao VARCHAR2(10),
    data_operacao DATE,
    dados_antigos VARCHAR2(400),
    dados_novos VARCHAR2(400)
);



--INSERINDO VALORES NAS TABELAS
INSERT INTO synthai_sede (cnpj_sede, email_sede, endereco_sede, telefone_sede, site_sede) VALUES 
    (12345678901234, 'synthai@hotmail.com', 'Rua da Gl�ria', 1122334401, 'www.synthai.com.br');

SELECT * FROM synthai_sede;


INSERT INTO lideres_melhoria (id_lider, nome_lider, funcao_lider, departamento_lider, email_lider) VALUES
    (10, 'Maria Santos', 'Analista de Recursos Humanos', 'Departamento de Recursos Humanos', 'maria.santos@hotmail.com');
INSERT INTO lideres_melhoria (id_lider, nome_lider, funcao_lider, departamento_lider, email_lider) VALUES
    (12, 'Pedro Oliveira', 'Diretor Financeiro', 'Departamento Financeiro', 'pedro.oliveira@hotmail.com');
INSERT INTO lideres_melhoria (id_lider, nome_lider, funcao_lider, departamento_lider, email_lider) VALUES
    (13, 'Ana Lima', 'Gerente de Vendas', 'Departamento de Vendas e Marketing', 'ana.lima@gmail.com');
INSERT INTO lideres_melhoria (id_lider, nome_lider, funcao_lider, departamento_lider, email_lider) VALUES
    (11, 'Jo�o Silva', 'Gerente de Projetos', 'Departamento de Tecnologia da Informa��o (TI)', 'joaosilva@gmail.com');
INSERT INTO lideres_melhoria (id_lider, nome_lider, funcao_lider, departamento_lider, email_lider) VALUES
    (14, 'Juliana Costa', 'Analista de TI', 'Departamento de Tecnologia da Informa��o (TI)', 'juliana.costa@hotmail.com');

SELECT * FROM lideres_melhoria;


--OBS: O FORMATO DE DATA INSERIDO � O QUE EST� COMO CERTO NO MEU COMPUTADOR, RODANDO 'select sysdate from dual;' ESSE � O FORMATO FORNECIDO.
INSERT INTO resultado_melhoria (id_resul, eficacia_resul, descricao_resul, data_registro_resul, status_resul, lideres_melhoria_id_lider) VALUES
    (52, '95% de precis�o', 'A simula��o forneceu insights cruciais para orientar ajustes estrat�gicos e otimizar a efic�cia dos processos organizacionais.', '07-03-23', 'Conclu�do', 10);
INSERT INTO resultado_melhoria (id_resul, eficacia_resul, descricao_resul, data_registro_resul, status_resul, lideres_melhoria_id_lider) VALUES
    (53, '90% de efic�cia', 'A an�lise revelou �reas-chave para melhorias na efici�ncia operacional.', '02-03-24', 'Em andamento', 11);
INSERT INTO resultado_melhoria (id_resul, eficacia_resul, descricao_resul, data_registro_resul, status_resul, lideres_melhoria_id_lider) VALUES
    (54, '99% de sucesso', 'As descobertas forneceram insights para otimizar a experi�ncia do cliente.', '15-04-24', 'Em andamento', 12);
INSERT INTO resultado_melhoria (id_resul, eficacia_resul, descricao_resul, data_registro_resul, status_resul, lideres_melhoria_id_lider) VALUES
    (55, '97% de efetividade', 'A simula��o destacou oportunidades de crescimento no mercado-alvo.', '26-02-24', 'Conclu�do', 13);
INSERT INTO resultado_melhoria (id_resul, eficacia_resul, descricao_resul, data_registro_resul, status_resul, lideres_melhoria_id_lider) VALUES
    (56, '99% de precis�o', 'Os resultados indicaram a necessidade de ajustes na estrat�gia de vendas.', '04-05-24', 'Conclu�do', 14);

SELECT * FROM resultado_melhoria;


INSERT INTO simulacao_melhoria (id_simu, algoritmo_utilizado_simu, tipo_modelo_simu, descricao_simu, nome_simu, synthai_sede_cnpj_sede, resultado_melhoria_id_resul) VALUES 
    (20001, 'K-Means', 'Regress�o', 'Nesta simula��o, empregamos um modelo de regress�o utilizando algoritmos de redes neurais, fornecendo insights cruciais para otimizar a efic�cia operacional da empresa', 'Simula��o 007', 12345678901234, 52);
INSERT INTO simulacao_melhoria (id_simu, algoritmo_utilizado_simu, tipo_modelo_simu, descricao_simu, nome_simu, synthai_sede_cnpj_sede, resultado_melhoria_id_resul) VALUES
    (20002, '�rvores de Decis�o', 'Classifica��o', 'Nesta simula��o, utilizamos o modelo de classifica��o com �rvores de decis�o para analisar padr�es complexos e tomar decis�es estrat�gicas fundamentadas.', 'Simula��o 008', 12345678901234, 53);
INSERT INTO simulacao_melhoria (id_simu, algoritmo_utilizado_simu, tipo_modelo_simu, descricao_simu, nome_simu, synthai_sede_cnpj_sede, resultado_melhoria_id_resul) VALUES
    (20003, 'Regress�o Linear', 'Regress�o', 'Nesta simula��o, aplicamos o modelo de regress�o linear para identificar rela��es lineares entre vari�veis ??e prever tend�ncias futuras, orientando decis�es estrat�gicas baseadas em dados.', 'Simula��o 009', 12345678901234, 54);
INSERT INTO simulacao_melhoria (id_simu, algoritmo_utilizado_simu, tipo_modelo_simu, descricao_simu, nome_simu, synthai_sede_cnpj_sede, resultado_melhoria_id_resul) VALUES
    (20004, 'Rede Neural', 'Classifica��o', 'Nesta simula��o, empregamos uma rede neural para an�lise preditiva, identificando padr�es complexos nos dados e fornecendo insights valiosos para aprimorar estrat�gias de neg�cios.', 'Simula��o 010', 12345678901234, 55);
INSERT INTO simulacao_melhoria (id_simu, algoritmo_utilizado_simu, tipo_modelo_simu, descricao_simu, nome_simu, synthai_sede_cnpj_sede, resultado_melhoria_id_resul) VALUES
    (20005, 'Gradient Boosting', 'Classifica��o', 'Nesta simula��o, utilizamos o algoritmo de Gradient Boosting para construir um modelo de classifica��o robusto, fornecendo insights cruciais para melhorar a efic�cia das estrat�gias de marketing.', 'Simula��o 011', 12345678901234, 56);

SELECT * FROM simulacao_melhoria;


INSERT INTO solucao_melhoria (id_solucao, resultado_solucao, custo_solucao, data_implementacao_solucao, descricao_solucao, lideres_melhoria_id_lider) VALUES 
    (1, 'Redu��o de custos em 15%', 10524, '23-05-24', 'Implementa��o de pr�ticas de gest�o de estoque otimizadas para reduzir os custos operacionais da empresa em 15%', 10);
INSERT INTO solucao_melhoria (id_solucao, resultado_solucao, custo_solucao, data_implementacao_solucao, descricao_solucao, lideres_melhoria_id_lider) VALUES
    (2, 'Aumento da produtividade em 20%', 100500, '12-05-24', 'Implementa��o de novos processos de automa��o para aumentar a produtividade da equipe em 20%', 11);
INSERT INTO solucao_melhoria (id_solucao, resultado_solucao, custo_solucao, data_implementacao_solucao, descricao_solucao, lideres_melhoria_id_lider) VALUES
    (3, 'Otimiza��o do fluxo de trabalho', 50258, '07-03-24', 'Revis�o e simplifica��o dos processos internos para otimizar o fluxo de trabalho e reduzir os tempos de ciclo', 12);
INSERT INTO solucao_melhoria (id_solucao, resultado_solucao, custo_solucao, data_implementacao_solucao, descricao_solucao, lideres_melhoria_id_lider) VALUES
    (4, 'Melhoria da qualidade do produto', 120500, '26-02-24', 'Implementa��o de programas de treinamento para funcion�rios e atualiza��o de equipamentos para garantir uma melhoria significativa na qualidade do produto', 13);
INSERT INTO solucao_melhoria (id_solucao, resultado_solucao, custo_solucao, data_implementacao_solucao, descricao_solucao, lideres_melhoria_id_lider) VALUES
    (5, 'Aumento da satisfa��o do cliente em 25%', 30100, '10-04-24', 'Desenvolvimento e implementa��o de estrat�gias focadas no cliente para melhorar a experi�ncia do cliente e aumentar a satisfa��o em 25%', 14);

SELECT * FROM solucao_melhoria;


INSERT INTO empresa_melhoria (cnpf_empre, nome_empre, endereco_empre, email_empre, telefone_empre, synthai_sede_cnpj_sede) VALUES    
    (12345678000190, 'TechNova Solutions', 'Avenida jo�o marques', 'technovasolutions@hotmail.com', 119546321078, 12345678901234);
INSERT INTO empresa_melhoria (cnpf_empre, nome_empre, endereco_empre, email_empre, telefone_empre, synthai_sede_cnpj_sede) VALUES 
    (98765432000121, 'GreenGrowth Innovations', 'Avenida dos santos', 'greenGrowthinnovations@hotmail.com', 139475123650, 12345678901234);
INSERT INTO empresa_melhoria (cnpf_empre, nome_empre, endereco_empre, email_empre, telefone_empre, synthai_sede_cnpj_sede) VALUES 
    (45678901000154, 'BrightSpark Technologies', 'Rua das flores', 'brightsparktechnologies@hotmail.com', 119201475326, 12345678901234);
INSERT INTO empresa_melhoria (cnpf_empre, nome_empre, endereco_empre, email_empre, telefone_empre, synthai_sede_cnpj_sede) VALUES 
    (23456789000183, 'AquaQuest Enterprises', 'Rua Os�rios Flores', 'aquaquestenterprises@gmail.com', 619012547863, 12345678901234);
INSERT INTO empresa_melhoria (cnpf_empre, nome_empre, endereco_empre, email_empre, telefone_empre, synthai_sede_cnpj_sede) VALUES 
    (67890123000132, 'StellarCraft Industries', 'Rua Boreal', 'stellarcraftindustries@gmail.com', 279648721048, 12345678901234);

SELECT * FROM empresa_melhoria;










--1) O primeiro procedimento deve fazer join de duas ou mais tabelas relacionais e�exibir os dados obtidos�das tabelas relacionais�no formato JSON.�
--Os dados�devem�ser transformados�do�formato relacional�para o�formato�JSON�atrav�s de uma�fun��o desenvolvida pelo�grupo. 


--PROCEDURE que faz o JOIN de tr�s tabelas e trata 3 exce��es.
CREATE OR REPLACE PROCEDURE joins_tabelas
AS 
    CURSOR c_joins IS
        SELECT s.cnpj_sede,
               s.email_sede,
               s.endereco_sede,
               s.telefone_sede, 
               s.site_sede,
               r.id_resul,
               r.eficacia_resul,
               r.descricao_resul,
               r.data_registro_resul,
               r.status_resul,
               sim.id_simu,
               sim.algoritmo_utilizado_simu,
               sim.tipo_modelo_simu,
               sim.descricao_simu,
               sim.nome_simu
        FROM synthai_sede s
        JOIN simulacao_melhoria sim ON s.cnpj_sede = sim.synthai_sede_cnpj_sede
        JOIN resultado_melhoria r ON sim.resultado_melhoria_id_resul = r.id_resul;
        
    v_cnpj_sede synthai_sede.cnpj_sede%TYPE;
    v_email_sede synthai_sede.email_sede%TYPE;
    v_endereco_sede synthai_sede.endereco_sede%TYPE;
    v_telefone_sede synthai_sede.telefone_sede%TYPE;
    v_site_sede synthai_sede.site_sede%TYPE;
    v_id_resul resultado_melhoria.id_resul%TYPE;
    v_eficacia_resul resultado_melhoria.eficacia_resul%TYPE;
    v_descricao_resul resultado_melhoria.descricao_resul%TYPE;
    v_data_registro_resul resultado_melhoria.data_registro_resul%TYPE;
    v_status_resul resultado_melhoria.status_resul%TYPE;
    v_id_simu simulacao_melhoria.id_simu%TYPE;
    v_algoritmo_utilizado_simu simulacao_melhoria.algoritmo_utilizado_simu%TYPE;
    v_tipo_modelo_simu simulacao_melhoria.tipo_modelo_simu%TYPE;
    v_descricao_simu simulacao_melhoria.descricao_simu%TYPE;
    v_nome_simu simulacao_melhoria.nome_simu%TYPE;
BEGIN
    OPEN c_joins;
    LOOP 
        FETCH c_joins INTO v_cnpj_sede, v_email_sede, v_endereco_sede, v_telefone_sede, v_site_sede, 
                               v_id_resul, v_eficacia_resul, v_descricao_resul, v_data_registro_resul, v_status_resul, 
                               v_id_simu, v_algoritmo_utilizado_simu, v_tipo_modelo_simu, v_descricao_simu, v_nome_simu;
        EXIT WHEN c_joins%NOTFOUND;
        COMMIT;
    END LOOP;
    CLOSE c_joins;
    
EXCEPTION   
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum dado encontrado.');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('N�mero excessivo de linhas retornadas.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro inesperado: || SQLERRM');
END joins_tabelas;
/




--2)Uma�fun��o deve�ler os�dados�recebidos�e transform�-lo para o formato�JSON.�N�o use as fun��es built-in�internas de transforma��o de e para JSON 
--do�banco�de dados Oracle. Essa fun��o ser� usada no primeiro procedimento solicitado em 1).


--FUNCTION que recebe os dados da PROCEDURE 'joins_tabelas', transforma dados relacionais em JSON e trata 3 exce��es.
CREATE OR REPLACE  FUNCTION converter_json
RETURN CLOB
AS 
    v_json CLOB := '[';
BEGIN
    FOR rec IN (
        SELECT s.cnpj_sede, s.email_sede, s.endereco_sede, s.telefone_sede, s.site_sede,
               r.id_resul, r.eficacia_resul, r.descricao_resul, TO_CHAR(r.data_registro_resul, 'YYYY-MM-DD') AS data_registro_resul, r.status_resul,
               sim.id_simu, sim.algoritmo_utilizado_simu, sim.tipo_modelo_simu, sim.descricao_simu, sim.nome_simu
        FROM synthai_sede s
        JOIN simulacao_melhoria sim ON s.cnpj_sede = sim.synthai_sede_cnpj_sede
        JOIN resultado_melhoria r ON sim.resultado_melhoria_id_resul = r.id_resul
    ) LOOP
    
    v_json := v_json || '{"synthai_sede": {"cnpj_sede": "' || rec.cnpj_sede || 
                            '", "email_sede": "' || rec.email_sede || 
                            '", "endereco_sede": "' || rec.endereco_sede || 
                            '", "telefone_sede": "' || rec.telefone_sede || 
                            '", "site_sede": "' || rec.site_sede || 
                            '"}, "resultado_melhoria": {"id_resul": "' || rec.id_resul || 
                            '", "eficacia_resul": "' || rec.eficacia_resul || 
                            '", "descricao_resul": "' || rec.descricao_resul || 
                            '", "data_registro_resul": "' || rec.data_registro_resul || 
                            '", "status_resul": "' || rec.status_resul || 
                            '"}, "simulacao_melhoria": {"id_simu": "' || rec.id_simu || 
                            '", "algoritmo_utilizado_simu": "' || rec.algoritmo_utilizado_simu || 
                            '", "tipo_modelo_simu": "' || rec.tipo_modelo_simu || 
                            '", "descricao_simu": "' || rec.descricao_simu || 
                            '", "nome_simu": "' || rec.nome_simu || '"}},';
                            
    END LOOP;
    
    IF v_json IS NOT NULL AND LENGTH(v_json) > 1 THEN
        v_json := SUBSTR(v_json, 1, LENGTH(v_json) - 1);
        
        COMMIT;
        
    END IF;
    
    v_json := v_json || ']';
    
    RETURN v_json;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN '{Nenhum dado encontrado.}';
    WHEN TOO_MANY_ROWS THEN
        RETURN '{Consulta retornou mais registros do que o esperado.}';
    WHEN OTHERS THEN
        RETURN '{Erro inesperado}';
END converter_json;
/




--Nesse bloco PL/SQL chama a fun��o `converter_json` para obter o JSON, e em seguida imprime o conte�do no terminal.
SET SERVEROUTPUT ON;

DECLARE 
    v_json CLOB;
BEGIN
    v_json := converter_json;
    
    DBMS_OUTPUT.PUT_LINE(v_json);
END;
/









--1) O segundo procedimento deve ler os dados de uma tabela e, na mesma linha, mostrar o valor de uma coluna da linha atual, o valor dessa mesma coluna na
--linha anterior e o valor dessa mesma coluna na pr�xima linha. Caso a linha anterior ou a pr�xima linha n�o existir, apresentar a palavra "Vazio".
--O�relat�rio deve�ter,�pelo�menos,�cinco linhas de dados.�A�tabela e�a coluna a�ser�exibida�fica a cargo�do grupo.


CREATE OR REPLACE PROCEDURE relatorio_solucao_melhoria
AS
    CURSOR c_solucao IS
        SELECT id_solucao, custo_solucao
        FROM solucao_melhoria
        ORDER BY id_solucao;
        
    v_anterior_id NUMBER(5);
    v_atual_id NUMBER(5);
    v_proximo_id NUMBER(5);
    v_anterior_custo NUMBER(11);
    v_atual_custo NUMBER(11);
    v_proximo_custo NUMBER(11);
    
BEGIN
    OPEN c_solucao;
    
    FETCH c_solucao INTO v_atual_id, v_atual_custo;
    
    FETCH c_solucao INTO v_proximo_id, v_proximo_custo;
    
    DBMS_OUTPUT.PUT_LINE('ID_SOLUCAO   ANTERIOR   ATUAL   PROXIMO');
    
    WHILE c_solucao%FOUND
    LOOP 
        DECLARE 
            v_anterior_custo_display VARCHAR(20);
            v_proximo_custo_display VARCHAR(20);
        BEGIN
            IF v_anterior_custo IS NULL THEN
                v_anterior_custo_display := 'Vazio';
            ELSE
                v_anterior_custo_display := TO_CHAR(v_anterior_custo);
            END IF;
            
            IF v_proximo_custo IS NULL THEN
                v_proximo_custo_display := 'Vazio';
            ELSE
                v_proximo_custo_display := TO_CHAR(v_proximo_custo);
            END IF;
            
            DBMS_OUTPUT.PUT_LINE(v_atual_id || '         ' ||
                                 v_anterior_custo_display || '     ' ||
                                 TO_CHAR(v_atual_custo) || '     ' ||
                                 v_proximo_custo_display);
                                 
            v_anterior_id := v_atual_id;
            v_anterior_custo := v_atual_custo;
            
            v_atual_id := v_proximo_id;
            v_atual_custo := v_proximo_custo;
            
            FETCH c_solucao INTO v_proximo_id, v_proximo_custo;
        EXCEPTION
            WHEN VALUE_ERROR THEN
                DBMS_OUTPUT.PUT_LINE('Erro: Valor incorreto.');
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Erro inesperado: ' || SQLERRM);
        END;
        
        COMMIT;
        
    END LOOP;
    
    IF v_atual_custo IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE(v_atual_id || '         ' ||
                             TO_CHAR(v_anterior_custo) || '     ' ||
                             TO_CHAR(v_atual_custo) || '     ' ||
                             'Vazio');
    END IF;
    
    CLOSE c_solucao;
    
EXCEPTION 
    WHEN INVALID_NUMBER THEN
        DBMS_OUTPUT.PUT_LINE('Erro: N�mero inv�lido');
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Erro: valor incorreto');
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Erro: Valor duplicado no �ndice.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro inesperado: ' || SQLERRM);
        
END;
/                             



--Chamada da procedure.
SET SERVEROUTPUT ON;

BEGIN
    relatorio_solucao_melhoria;
END;
/









--2) Uma fun��o�deve substituir um�do processamentos existentes em seu projeto no formato Fun��o, como 
--por exemplo verifica��o da complexidade da senha ou c�lculos Matem�ticos.

-- Fun��o para calcular a m�dia dos custos de todas as solu��es de melhoria
CREATE OR REPLACE FUNCTION calcular_media_custos
RETURN NUMBER
AS
    v_media NUMBER;
BEGIN

    SELECT AVG(custo_solucao)
    INTO v_media
    FROM solucao_melhoria;
    
    RETURN v_media;
    
EXCEPTION 
    WHEN INVALID_NUMBER THEN
        DBMS_OUTPUT.PUT_LINE('Erro: N�mero inv�lido.');
        RETURN NULL;
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Erro: Valor incorreto.');
        RETURN NULL;
    WHEN DUP_VAL_ON_INDEX THEN 
        DBMS_OUTPUT.PUT_LINE('Erro: Valor duplicado no �ndice.');
        RETURN NULL;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: inesperado: ' || SQLERRM);

COMMIT;

END calcular_media_custos;
/



--Chamada da FUNCTION calcular_media_custos
SET SERVEROUTPUT ON;

DECLARE         
    v_media NUMBER;
BEGIN
    v_media := calcular_media_custos;
    DBMS_OUTPUT.PUT_LINE('A m�dia dos custos das solu��es �: ' || v_media);
END;
/









--3) Crie uma tabela de auditoria. A cada INSERT, UPDATE ou DELETE em uma tabela escolhida pelo grupo essa tabela dever�
--ser atualizada com os dados anteriores (OLD) e os novos dados�(NEW)�da tabela,�nome do usu�rio que fez a�opera��o, qual
--o nome da�opera��o�(INSERT, UPDATE ou�DELETE)�e a�data em�que a�opera��o foi realizada.



--Esse TRIGGER acionada em cada opera��o de INSERT, UPDATE ou DELETE na tabela 'lideres_melhoria'.
CREATE OR REPLACE TRIGGER auditoria_tabela
AFTER INSERT OR UPDATE OR DELETE
ON lideres_melhoria
FOR EACH ROW
DECLARE
    v_usuario VARCHAR2(50) := USER;
BEGIN
    IF INSERTING THEN
        INSERT INTO auditoria_melhoria (operacao, usuario, data_operacao, dados_novos)
        VALUES ('INSERT', v_usuario, SYSDATE,
                'Novo ID L�der: ' || :NEW.id_lider || ', Novo Nome: ' || :NEW.nome_lider || 
                ', Nova Fun��o: ' || :NEW.funcao_lider || ', Novo Departamento: ' || :NEW.departamento_lider || 
                ', Novo Email: ' || :NEW.email_lider);
                
        ELSIF UPDATING THEN
            INSERT INTO auditoria_melhoria (operacao, usuario, data_operacao, dados_antigos, dados_novos)
            VALUES ('UPDATE', v_usuario, SYSDATE,
                    'Antigo ID L�der: ' || :OLD.id_lider || ', Antigo Nome: ' || :OLD.nome_lider || 
                        ', Antiga Fun��o: ' || :OLD.funcao_lider || ', Antigo Departamento: ' || :OLD.departamento_lider || 
                        ', Antigo Email: ' || :OLD.email_lider,
                        'Novo ID L�der: ' || :NEW.id_lider || ', Novo Nome: ' || :NEW.nome_lider || 
                        ', Nova Fun��o: ' || :NEW.funcao_lider || ', Novo Departamento: ' || :NEW.departamento_lider || 
                        ', Novo Email: ' || :NEW.email_lider);
                        
            ELSIF DELETING THEN 
                INSERT INTO  auditoria_melhoria (operacao, usuario, data_operacao, dados_antigos)
                VALUES ('DELETE', v_usuario, SYSDATE,
                    'Antigo ID L�der: ' || :OLD.id_lider || ', Antigo Nome: ' || :OLD.nome_lider || 
                    ', Antiga Fun��o: ' || :OLD.funcao_lider || ', Antigo Departamento: ' || :OLD.departamento_lider || 
                    ', Antigo Email: ' || :OLD.email_lider);
            END IF;
END;
/



--Testando o funcionamento do gatilho.

--Inserindo novos dados na tabela lideres_melhoria
INSERT INTO lideres_melhoria (id_lider, nome_lider, funcao_lider, departamento_lider, email_lider) VALUES
    (16, 'Thais Gomes', 'Advogada', 'Departamento Jur�dico', 'thais.gomes@hotmail.com');

--Atualizando a tabela lideres_melhoria
UPDATE lideres_melhoria
SET nome_lider = 'Thais Gomes', funcao_lider = 'Ju�za', departamento_lider = 'Jur�dico', email_lider = 'thais.gomes@juiza.com'
WHERE id_lider = 16;

--Excluindo dados na tabela lideres_melhoria
DELETE FROM lideres_melhoria
WHERE id_lider = 16;

--Consultar os registros na tabela auditoria_melhoria
SELECT * FROM auditoria_melhoria;

COMMIT;


















