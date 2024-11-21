-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 21/11/2024 às 20:15
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
-- Banco de dados: `DDL_DML`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `Autor`
--

CREATE TABLE `Autor` (
  `AutorID` int(11) NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
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
  `Nome` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Telefone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `Cliente`
--

INSERT INTO `Cliente` (`ClienteID`, `Nome`, `Email`, `Telefone`) VALUES
(1, 'Maria Silva', 'maria.silva@email.com', '123456789'),
(2, 'João Santos', 'joao.santos@email.com', '987654321');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Emprestimo`
--

CREATE TABLE `Emprestimo` (
  `EmprestimoID` int(11) NOT NULL,
  `LivroID` int(11) DEFAULT NULL,
  `ClienteID` int(11) DEFAULT NULL,
  `DataEmprestimo` date DEFAULT NULL,
  `DataDevolucao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `Emprestimo`
--

INSERT INTO `Emprestimo` (`EmprestimoID`, `LivroID`, `ClienteID`, `DataEmprestimo`, `DataDevolucao`) VALUES
(1, 1, 1, '2024-11-01', '2024-11-15'),
(2, 2, 2, '2024-11-05', '2024-11-20');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Livro`
--

CREATE TABLE `Livro` (
  `LivroID` int(11) NOT NULL,
  `Titulo` varchar(200) DEFAULT NULL,
  `Genero` varchar(100) DEFAULT NULL,
  `AnoPublicacao` int(11) DEFAULT NULL,
  `AutorID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `Livro`
--

INSERT INTO `Livro` (`LivroID`, `Titulo`, `Genero`, `AnoPublicacao`, `AutorID`) VALUES
(1, 'Harry Potter e a Pedra Filosofal', 'Fantasia', 1997, 1),
(2, 'A Guerra dos Tronos', 'Fantasia', 1996, 2),
(3, 'O Senhor dos Anéis', 'Fantasia', 1954, 3);

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
  ADD PRIMARY KEY (`ClienteID`);

--
-- Índices de tabela `Emprestimo`
--
ALTER TABLE `Emprestimo`
  ADD PRIMARY KEY (`EmprestimoID`),
  ADD KEY `LivroID` (`LivroID`),
  ADD KEY `ClienteID` (`ClienteID`);

--
-- Índices de tabela `Livro`
--
ALTER TABLE `Livro`
  ADD PRIMARY KEY (`LivroID`),
  ADD KEY `AutorID` (`AutorID`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `Emprestimo`
--
ALTER TABLE `Emprestimo`
  ADD CONSTRAINT `emprestimo_ibfk_1` FOREIGN KEY (`LivroID`) REFERENCES `Livro` (`LivroID`),
  ADD CONSTRAINT `emprestimo_ibfk_2` FOREIGN KEY (`ClienteID`) REFERENCES `Cliente` (`ClienteID`);

--
-- Restrições para tabelas `Livro`
--
ALTER TABLE `Livro`
  ADD CONSTRAINT `livro_ibfk_1` FOREIGN KEY (`AutorID`) REFERENCES `Autor` (`AutorID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
