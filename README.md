# Sistema de Gestão de Loja e Contas a Receber (MySQL)

Este repositório contém o projeto de modelagem e implementação de um banco de dados relacional para controle de clientes, municípios e gestão financeira de faturas (Contas a Receber).

## Modelo de Entidade-Relacionamento (EER)

Abaixo está a representação visual da estrutura do banco de dados:

![Diagrama do Banco de Dados](./diagrama_eer.png) 



## Estrutura das Tabelas

O projeto foi construído focando na integridade referencial e normalização:

1.  **Estado & Municipio**: Tabelas para padronização de endereços, evitando duplicidade de dados.
2.  **Cliente**: Armazena informações cadastrais (CPF, Celular) e está vinculado obrigatoriamente a um município.
3.  **ContaReceber**: Controla as faturas de vendas, incluindo data de emissão, vencimento, valor e situação do pagamento.

## Tecnologias e Conceitos Aplicados

* **MySQL**: Banco de dados utilizado.
* **DDL (Data Definition Language)**: Criação de tabelas com chaves primárias (`AUTO_INCREMENT`) e estrangeiras (`FOREIGN KEY`).
* **DML (Data Manipulation Language)**: Inserção de dados de teste com `INSERT IGNORE`.
* **Views**: Implementação de visualizações otimizadas para o setor financeiro.

## 🔍 Exemplos de Uso

Uma das funcionalidades principais é a View **`ContasNaoPagas`**, que permite ao setor de cobrança identificar rapidamente clientes inadimplentes:

```sql
-- Executar para ver clientes com contas pendentes (Situacao = '1')
SELECT * FROM ContasNaoPagas;
