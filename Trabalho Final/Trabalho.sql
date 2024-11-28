-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 28/11/2024 às 01:57
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
-- Banco de dados: `Trabalho`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `Emprestimos`
--

CREATE TABLE `Emprestimos` (
  `id_emprestimo` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_livro` int(11) NOT NULL,
  `data_emprestimo` date NOT NULL,
  `data_devolucao` date DEFAULT NULL,
  `status` enum('Aberto','Concluido','Atrasado') DEFAULT 'Aberto'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `Emprestimos`
--

INSERT INTO `Emprestimos` (`id_emprestimo`, `id_usuario`, `id_livro`, `data_emprestimo`, `data_devolucao`, `status`) VALUES
(1, 1, 1, '2024-11-01', '2024-11-15', 'Concluido'),
(2, 2, 3, '2024-11-10', NULL, 'Aberto'),
(3, 3, 4, '2024-11-05', '2024-11-20', 'Concluido'),
(4, 1, 2, '2024-11-11', NULL, 'Atrasado');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Livros`
--

CREATE TABLE `Livros` (
  `id_livro` int(11) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `autor` varchar(100) NOT NULL,
  `isbn` varchar(20) NOT NULL,
  `categoria` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `Livros`
--

INSERT INTO `Livros` (`id_livro`, `titulo`, `autor`, `isbn`, `categoria`) VALUES
(1, 'O Senhor dos Anéis', 'J.R.R. Tolkien', '9788578273310', 'Ficção'),
(2, 'A Origem das Espécies', 'Charles Darwin', '9788520937211', 'Ciência'),
(3, '1984', 'George Orwell', '9788535914849', 'Ficção'),
(4, 'Sapiens', 'Yuval Noah Harari', '9788543102149', 'História'),
(5, 'O Código Da Vinci', 'Dan Brown', '9788501078959', 'Ficção');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Multas`
--

CREATE TABLE `Multas` (
  `id_multa` int(11) NOT NULL,
  `id_emprestimo` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `Multas`
--

INSERT INTO `Multas` (`id_multa`, `id_emprestimo`, `valor`) VALUES
(1, 4, 25.50);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Reservas`
--

CREATE TABLE `Reservas` (
  `id_reserva` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_livro` int(11) NOT NULL,
  `data_reserva` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `Reservas`
--

INSERT INTO `Reservas` (`id_reserva`, `id_usuario`, `id_livro`, `data_reserva`) VALUES
(1, 4, 1, '2024-11-12'),
(2, 3, 5, '2024-11-13');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Usuarios`
--

CREATE TABLE `Usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `tipo` enum('Aluno','Professor','Funcionario','Bibliotecario','Administrador') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `Usuarios`
--

INSERT INTO `Usuarios` (`id_usuario`, `nome`, `email`, `telefone`, `tipo`) VALUES
(1, 'João Silva', 'joao.silva@email.com', '999999999', 'Aluno'),
(2, 'Maria Oliveira', 'maria.oliveira@email.com', '988888888', 'Professor'),
(3, 'Carlos Santos', 'carlos.santos@email.com', '977777777', 'Funcionario'),
(4, 'Ana Souza', 'ana.souza@email.com', '966666666', 'Bibliotecario'),
(5, 'Pedro Lima', 'pedro.lima@email.com', '955555555', 'Administrador');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `Emprestimos`
--
ALTER TABLE `Emprestimos`
  ADD PRIMARY KEY (`id_emprestimo`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_livro` (`id_livro`);

--
-- Índices de tabela `Livros`
--
ALTER TABLE `Livros`
  ADD PRIMARY KEY (`id_livro`),
  ADD UNIQUE KEY `isbn` (`isbn`);

--
-- Índices de tabela `Multas`
--
ALTER TABLE `Multas`
  ADD PRIMARY KEY (`id_multa`),
  ADD KEY `id_emprestimo` (`id_emprestimo`);

--
-- Índices de tabela `Reservas`
--
ALTER TABLE `Reservas`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_livro` (`id_livro`);

--
-- Índices de tabela `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `Emprestimos`
--
ALTER TABLE `Emprestimos`
  MODIFY `id_emprestimo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `Livros`
--
ALTER TABLE `Livros`
  MODIFY `id_livro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `Multas`
--
ALTER TABLE `Multas`
  MODIFY `id_multa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `Reservas`
--
ALTER TABLE `Reservas`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `Usuarios`
--
ALTER TABLE `Usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `Emprestimos`
--
ALTER TABLE `Emprestimos`
  ADD CONSTRAINT `emprestimos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `Usuarios` (`id_usuario`),
  ADD CONSTRAINT `emprestimos_ibfk_2` FOREIGN KEY (`id_livro`) REFERENCES `Livros` (`id_livro`);

--
-- Restrições para tabelas `Multas`
--
ALTER TABLE `Multas`
  ADD CONSTRAINT `multas_ibfk_1` FOREIGN KEY (`id_emprestimo`) REFERENCES `Emprestimos` (`id_emprestimo`);

--
-- Restrições para tabelas `Reservas`
--
ALTER TABLE `Reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `Usuarios` (`id_usuario`),
  ADD CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`id_livro`) REFERENCES `Livros` (`id_livro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
