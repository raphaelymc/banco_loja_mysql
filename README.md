Sistema de Gestão de Loja e Contas a Receber
Este repositório contém o projeto de modelagem e implementação de um banco de dados relacional (MySQL) para o gerenciamento de clientes e faturas financeiras de uma loja.

 Diagrama de Entidade-Relacionamento (EER)
Abaixo apresento a estrutura visual das tabelas e seus relacionamentos:

📋 Estrutura do Banco de Dados
O banco de dados foi projetado seguindo as normas de integridade referencial:

Estado & Município: Normalização de endereços para garantir a consistência geográfica.

Cliente: Cadastro completo de informações pessoais (CPF, Celular) vinculado à tabela de municípios.

ContaReceber: Tabela central de controle financeiro, registrando faturas, vencimentos e o status de pagamento (Situacao).

⚙️ Funcionalidades Técnicas
Views Otimizadas: Implementação da View ContasNaoPagas para agilizar a identificação de clientes inadimplentes.

Segurança de Dados: Uso de chaves primárias e estrangeiras para evitar registros órfãos.

Status Dinâmicos: Controle de situação da fatura através de tipos ENUM.

🔍 Exemplo de Consulta (Relatório de Cobrança)
O sistema permite extrair relatórios financeiros imediatos. Para visualizar clientes com pagamentos pendentes, basta executar:
SELECT * FROM ContasNaoPagas;
