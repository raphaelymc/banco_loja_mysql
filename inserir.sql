CREATE DATABASE IF NOT EXISTS loja;
USE loja;

CREATE TABLE IF NOT EXISTS Estado (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    UF VARCHAR(2) NOT NULL
);

CREATE TABLE IF NOT EXISTS Municipio (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    FK_Estado_ID INT NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    CodIBGE INT NOT NULL,
    FOREIGN KEY (FK_Estado_ID) REFERENCES Estado(ID)
);

CREATE TABLE IF NOT EXISTS Cliente (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(90) NOT NULL,
    CPF VARCHAR(11) NOT NULL,
    Celular VARCHAR(11) NOT NULL,
    EndLogradouro VARCHAR(100) NOT NULL,
    EndNumero VARCHAR(10) NOT NULL,
    EndMunicipio INT NOT NULL,
    EndCep CHAR(8) NOT NULL,
    FK_Municipio_ID INT NOT NULL,
    FOREIGN KEY (FK_Municipio_ID) REFERENCES Municipio(ID)
);

CREATE TABLE IF NOT EXISTS ContaReceber (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    FK_Cliente_ID INT NOT NULL,
    FaturaVendaID INT NOT NULL,
    DataConta DATE NOT NULL,
    DataVencimento DATE NOT NULL,
    Valor DECIMAL(18,2) NOT NULL,
    Situacao ENUM ('1','2','3') NOT NULL,
    FOREIGN KEY (FK_Cliente_ID) REFERENCES Cliente(ID)
);

INSERT IGNORE INTO Estado (Nome, UF) VALUES
('Rio de Janeiro', 'RJ'),
('Sao Paulo', 'SP'),
('Minas Gerais', 'MG');

INSERT IGNORE INTO Municipio (FK_Estado_ID, Nome, CodIBGE) VALUES
(1, 'Sao Joao', 3304557),
(2, 'Sao Luiz', 3550308),
(3, 'Santo Antonio', 3106200);

INSERT IGNORE INTO Cliente
(Nome, CPF, Celular, EndLogradouro, EndNumero, EndMunicipio, FK_Municipio_ID, EndCep)
VALUES
('Mariana Souza', '44433322211', '21901098765', 'Rua A', '350', 1, 1, '25010000'),
('Ricardo Almeida', '99988877766', '11955544433', 'Rua B', '100', 2, 2, '01310000'),
('Felipe Santos', '12345678900', '88998877665', 'Rua C', '45', 3, 3, '30110000');

INSERT IGNORE INTO ContaReceber
(FK_Cliente_ID, FaturaVendaID, DataConta, DataVencimento, Valor, Situacao)
VALUES
(1, 101, '2025-10-20', '2025-11-05', 150.75, '1'),
(2, 102, '2025-09-15', '2025-10-01', 500.00, '2'),
(3, 103, '2025-10-01', '2025-10-15', 75.20, '3');

CREATE OR REPLACE VIEW ContasNaoPagas AS
SELECT
    CR.ID AS 'ID da conta a receber',
    C.Nome AS 'Nome do Cliente',
    C.CPF AS 'CPF do Cliente',
    CR.DataVencimento AS 'Data de vencimento',
    CR.Valor AS 'Valor da conta'
FROM ContaReceber CR
JOIN Cliente C ON CR.FK_Cliente_ID = C.ID
WHERE CR.Situacao = '1';


