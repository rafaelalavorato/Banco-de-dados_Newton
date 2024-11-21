-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 21/11/2024 às 19:43
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `DDL`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `Cliente`
--

CREATE TABLE `Cliente` (
  `codCliente` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `codArea` char(2) DEFAULT NULL,
  `endereco` varchar(120) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Fatura`
--

CREATE TABLE `Fatura` (
  `codFatura` int(11) NOT NULL,
  `codCliente` int(11) DEFAULT NULL,
  `data` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Fornecedor`
--

CREATE TABLE `Fornecedor` (
  `codFornecedor` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `status` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Item`
--

CREATE TABLE `Item` (
  `codFatura` int(11) NOT NULL,
  `codProduto` int(11) NOT NULL,
  `valorUnitario` double DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Produto`
--

CREATE TABLE `Produto` (
  `codProduto` int(11) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `precoCusto` double DEFAULT NULL,
  `codFornecedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `Cliente`
--
ALTER TABLE `Cliente`
  ADD PRIMARY KEY (`codCliente`);

--
-- Índices de tabela `Fatura`
--
ALTER TABLE `Fatura`
  ADD PRIMARY KEY (`codFatura`),
  ADD KEY `codCliente` (`codCliente`);

--
-- Índices de tabela `Fornecedor`
--
ALTER TABLE `Fornecedor`
  ADD PRIMARY KEY (`codFornecedor`);

--
-- Índices de tabela `Item`
--
ALTER TABLE `Item`
  ADD PRIMARY KEY (`codFatura`,`codProduto`),
  ADD KEY `codProduto` (`codProduto`);

--
-- Índices de tabela `Produto`
--
ALTER TABLE `Produto`
  ADD PRIMARY KEY (`codProduto`),
  ADD KEY `codFornecedor` (`codFornecedor`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `Fatura`
--
ALTER TABLE `Fatura`
  ADD CONSTRAINT `fatura_ibfk_1` FOREIGN KEY (`codCliente`) REFERENCES `Cliente` (`codCliente`);

--
-- Restrições para tabelas `Item`
--
ALTER TABLE `Item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`codFatura`) REFERENCES `Fatura` (`codFatura`),
  ADD CONSTRAINT `item_ibfk_2` FOREIGN KEY (`codProduto`) REFERENCES `Produto` (`codProduto`);

--
-- Restrições para tabelas `Produto`
--
ALTER TABLE `Produto`
  ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`codFornecedor`) REFERENCES `Fornecedor` (`codFornecedor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
