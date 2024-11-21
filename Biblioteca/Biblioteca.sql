-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 21/11/2024 às 20:00
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
-- Banco de dados: `Biblioteca`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `Autor`
--

CREATE TABLE `Autor` (
  `AutorID` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Nacionalidade` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `Autor`
--

INSERT INTO `Autor` (`AutorID`, `Nome`, `Nacionalidade`) VALUES
(1, 'J.K. Rowling', 'Britânica'),
(2, 'George R.R. Martin', 'Americana'),
(3, 'J.R.R. Tolkien', 'Britânica');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Cliente`
--

CREATE TABLE `Cliente` (
  `ClienteID` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `CPF` varchar(14) NOT NULL,
  `Endereco` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `Cliente`
--

INSERT INTO `Cliente` (`ClienteID`, `Nome`, `CPF`, `Endereco`) VALUES
(1, 'Carlos Silva', '12345678900', 'Rua Nova, 999'),
(2, 'Ana Oliveira', '98765432100', 'Rua B, 456'),
(3, 'João Pereira', '11122233344', 'Rua C, 789');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Emprestimo`
--

CREATE TABLE `Emprestimo` (
  `EmprestimoID` int(11) NOT NULL,
  `ClienteID` int(11) DEFAULT NULL,
  `LivroID` int(11) DEFAULT NULL,
  `DataEmprestimo` date NOT NULL,
  `DataDevolucao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `Emprestimo`
--

INSERT INTO `Emprestimo` (`EmprestimoID`, `ClienteID`, `LivroID`, `DataEmprestimo`, `DataDevolucao`) VALUES
(1, 1, 1, '2024-11-01', '2024-11-15'),
(3, 3, 3, '2024-11-10', '2024-11-20');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Livro`
--

CREATE TABLE `Livro` (
  `LivroID` int(11) NOT NULL,
  `Titulo` varchar(200) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  `AnoPublicacao` year(4) DEFAULT NULL,
  `AutorID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `Livro`
--

INSERT INTO `Livro` (`LivroID`, `Titulo`, `ISBN`, `AnoPublicacao`, `AutorID`) VALUES
(1, 'Harry Potter e a Pedra Filosofal', '9780439708180', '1997', 1),
(3, 'O Senhor dos Anéis', '9780618640157', '1954', 3);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `Autor`
--
ALTER TABLE `Autor`
  ADD PRIMARY KEY (`AutorID`);

--
-- Índices de tabela `Cliente`
--
ALTER TABLE `Cliente`
  ADD PRIMARY KEY (`ClienteID`),
  ADD UNIQUE KEY `CPF` (`CPF`);

--
-- Índices de tabela `Emprestimo`
--
ALTER TABLE `Emprestimo`
  ADD PRIMARY KEY (`EmprestimoID`),
  ADD KEY `ClienteID` (`ClienteID`),
  ADD KEY `LivroID` (`LivroID`);

--
-- Índices de tabela `Livro`
--
ALTER TABLE `Livro`
  ADD PRIMARY KEY (`LivroID`),
  ADD UNIQUE KEY `ISBN` (`ISBN`),
  ADD KEY `AutorID` (`AutorID`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `Autor`
--
ALTER TABLE `Autor`
  MODIFY `AutorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `Cliente`
--
ALTER TABLE `Cliente`
  MODIFY `ClienteID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `Emprestimo`
--
ALTER TABLE `Emprestimo`
  MODIFY `EmprestimoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `Livro`
--
ALTER TABLE `Livro`
  MODIFY `LivroID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `Emprestimo`
--
ALTER TABLE `Emprestimo`
  ADD CONSTRAINT `emprestimo_ibfk_1` FOREIGN KEY (`ClienteID`) REFERENCES `Cliente` (`ClienteID`),
  ADD CONSTRAINT `emprestimo_ibfk_2` FOREIGN KEY (`LivroID`) REFERENCES `Livro` (`LivroID`);

--
-- Restrições para tabelas `Livro`
--
ALTER TABLE `Livro`
  ADD CONSTRAINT `livro_ibfk_1` FOREIGN KEY (`AutorID`) REFERENCES `Autor` (`AutorID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
