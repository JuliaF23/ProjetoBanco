## Projeto de Banco de Dados

### 1. Objetivo e descrição do problema

Esse projeto surge para lidar com os desafios complexos que empresas de todos 
os setores enfrentam em suas operações diárias e na tomada de decisões 
estratégicas. 

### 2. MLR (Modelo Lógico Relacional) e MER (Modelo Entidade Relacionamento) 

Considerando as dificuldades enfrentadas pelas empresas, conforme 
identificadas anteriormente, apresentamos a seguir os modelos desenvolvidos 
para abordar uma dessas dificuldades específicas. O objetivo é aprimorar e 
concentrar esforços em uma área de dor específica.

#### 2.1 Melhorias no Planejamento Estratégico: 

A SynthAI possibilita simular vários cenários empresariais, fornecendo uma 
visão ampla das consequências das decisões estratégicas. Isso permite aos 
líderes avaliar o impacto das variáveis e adotar abordagens mais embasadas 
para alcançar seus objetivos comerciais. 

-MER (Modelo Entidade Relacionamento):
![image](https://github.com/user-attachments/assets/d76ff48c-92ce-4ff8-8ec5-ff7608135ba0)

-MLR (Modelo Lógico Relaciona):
![image](https://github.com/user-attachments/assets/c789e747-3361-4181-a87e-e5869941030d)



### 4. MF (Modelo Físico) 
 
CREATE TABLE Empresa_melhoria ( 
    cnpj_empre NUMBER(14) PRIMARY KEY, 
    nome_empre VARCHAR2(100) NOT NULL, 
    endereco_empre VARCHAR2(255) NOT NULL, 
    email_empre VARCHAR2(255) NOT NULL, 
    telefone_empre NUMBER(20) NOT NULL 
); 
 
CREATE TABLE Synthai_sede ( 
    cnpj_sede NUMBER(14) PRIMARY KEY, 
    email_sede VARCHAR2(255) NOT NULL, 
    endereco_sede VARCHAR2(255) NOT NULL, 
    telefone_sede NUMBER(20) NOT NULL, 
    site_sede VARCHAR2(255) NOT NULL 
); 
 
CREATE TABLE Simulacao_melhoria ( 
    ID_simu NUMBER(5) PRIMARY KEY, 
    algoritmo_utilizado_simu VARCHAR2(255) NOT NULL, 
    tipo_modelo_simu VARCHAR2(255) NOT NULL, 
    descricao_simu VARCHAR2(400) NOT NULL, 
    nome_simu VARCHAR2(100) NOT NULL 
); 
 
CREATE TABLE Resultado_melhoria ( 
    ID_resul NUMBER(5) PRIMARY KEY, 
    descricao_resul VARCHAR2(400) NOT NULL, 
    status_resul VARCHAR2(50) NOT NULL, 
    eficacia_resul VARCHAR2(255) NOT NULL, 
    data_registro_resul DATE NOT NULL 
); 
 
CREATE TABLE Lideres_melhoria ( 
    ID_lider NUMBER(5) PRIMARY KEY, 
    nome_lider VARCHAR2(45) NOT NULL, 
    funcao_lider VARCHAR2(100) NOT NULL, 
    departamento_lider VARCHAR2(100) NOT NULL, 
    email_lider VARCHAR2(255) NOT NULL 
); 
 
CREATE TABLE Solucao_melhoria ( 
    ID_solucao NUMBER(5) PRIMARY KEY, 
    custo_solucao NUMBER(11) NOT NULL, 
    descricao_solucao VARCHAR2(400) NOT NULL, 
    resultado_solucao VARCHAR2(255) NOT NULL, 
    data_implementacao_solucao DATE NOT NULL 
); 
 
CREATE TABLE Solicita ( 
    fk_Empresa_melhoria_cnpj_empre NUMBER(14), 
    fk_Synthai_sede_cnpj_sede NUMBER(14) 
); 
 
CREATE TABLE Realiza ( 
    fk_Synthai_sede_cnpj_sede NUMBER(14), 
    fk_Simulacao_melhoria_ID_simu NUMBER(14) 
); 
 
CREATE TABLE Devolve ( 
    fk_Simulacao_melhoria_ID_simu NUMBER(5), 
    fk_Resultado_melhoria_ID_resul NUMBER(5) 
); 
 
CREATE TABLE Avaliam ( 
    fk_Resultado_melhoria_ID_resul NUMBER(5), 
    fk_Lideres_melhoria_ID_lider NUMBER(5) 
); 
 
CREATE TABLE Adota ( 
    fk_Lideres_melhoria_ID_lider NUMBER(5), 
    fk_Solucao_melhoria_ID_solucao NUMBER(5) 
); 
  
ALTER TABLE Solicita ADD CONSTRAINT FK_Solicita_1 
    FOREIGN KEY (fk_Empresa_melhoria_cnpj_empre) 
    REFERENCES Empresa_melhoria (cnpj_empre) 
    ON DELETE RESTRICT; 
  
ALTER TABLE Solicita ADD CONSTRAINT FK_Solicita_2 
    FOREIGN KEY (fk_Synthai_sede_cnpj_sede) 
    REFERENCES Synthai_sede (cnpj_sede) 
    ON DELETE RESTRICT; 
  
ALTER TABLE Realiza ADD CONSTRAINT FK_Realiza_1 
    FOREIGN KEY (fk_Synthai_sede_cnpj_sede) 
    REFERENCES Synthai_sede (cnpj_sede) 
    ON DELETE RESTRICT; 
  
ALTER TABLE Realiza ADD CONSTRAINT FK_Realiza_2 
    FOREIGN KEY (fk_Simulacao_melhoria_ID_simu) 
    REFERENCES Simulacao_melhoria (ID_simu) 
    ON DELETE RESTRICT; 
  
ALTER TABLE Devolve ADD CONSTRAINT FK_Devolve_1 
    FOREIGN KEY (fk_Simulacao_melhoria_ID_simu) 
    REFERENCES Simulacao_melhoria (ID_simu) 
    ON DELETE RESTRICT; 
  
ALTER TABLE Devolve ADD CONSTRAINT FK_Devolve_2 
    FOREIGN KEY (fk_Resultado_melhoria_ID_resul) 
    REFERENCES Resultado_melhoria (ID_resul) 
    ON DELETE RESTRICT; 
  
ALTER TABLE Avaliam ADD CONSTRAINT FK_avaliam_1 
    FOREIGN KEY (fk_Resultado_melhoria_ID_resul) 
    REFERENCES Resultado_melhoria (ID_resul) 
    ON DELETE RESTRICT; 
  
ALTER TABLE Avaliam ADD CONSTRAINT FK_Avaliam_2 
    FOREIGN KEY (fk_Lideres_melhoria_ID_lider) 
    REFERENCES Lideres_melhoria (ID_lider) 
    ON DELETE RESTRICT; 
  
ALTER TABLE Adota ADD CONSTRAINT FK_Adota_1 
    FOREIGN KEY (fk_Lideres_melhoria_ID_lider) 
    REFERENCES Lideres_melhoria (ID_lider) 
    ON DELETE RESTRICT; 
  
ALTER TABLE Adota ADD CONSTRAINT FK_Adota_2 
    FOREIGN KEY (fk_Solucao_melhoria_ID_solucao) 
    REFERENCES Solucao_melhoria (ID_solucao) 
    ON DELETE RESTRICT;
