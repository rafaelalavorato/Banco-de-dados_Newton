-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 21/11/2024 às 20:40
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
-- Banco de dados: `Projeto`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `Consultas`
--

CREATE TABLE `Consultas` (
  `id_consulta` int(11) NOT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `id_medico` int(11) DEFAULT NULL,
  `data_consulta` datetime DEFAULT NULL,
  `observacoes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `Consultas`
--

INSERT INTO `Consultas` (`id_consulta`, `id_paciente`, `id_medico`, `data_consulta`, `observacoes`) VALUES
(1, 1, 1, '2024-11-25 10:00:00', 'Consulta de rotina'),
(2, 2, 2, '2024-11-26 14:00:00', 'Consulta para acompanhamento'),
(3, 3, 3, '2024-11-27 09:00:00', 'Consulta para dor nas costas'),
(4, 4, 4, '2024-11-28 15:00:00', 'Consulta de urgência'),
(5, 5, 5, '2024-11-29 11:00:00', 'Consulta pediátrica');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Exames`
--

CREATE TABLE `Exames` (
  `id_exame` int(11) NOT NULL,
  `id_consulta` int(11) DEFAULT NULL,
  `tipo_exame` varchar(100) DEFAULT NULL,
  `data_exame` datetime DEFAULT NULL,
  `resultado` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `Exames`
--

INSERT INTO `Exames` (`id_exame`, `id_consulta`, `tipo_exame`, `data_exame`, `resultado`) VALUES
(1, 1, 'Eletrocardiograma', '2024-11-26 10:00:00', 'Normal'),
(2, 2, 'Exame de sangue', '2024-11-27 10:00:00', 'Normal'),
(3, 3, 'Raio-X', '2024-11-28 10:00:00', 'Fratura detectada'),
(4, 4, 'Ultrassonografia', '2024-11-29 13:00:00', 'Normal'),
(5, 5, 'Exame físico', '2024-11-30 09:00:00', 'Normal');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Medicos`
--

CREATE TABLE `Medicos` (
  `id_medico` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `especialidade` varchar(50) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `Medicos`
--

INSERT INTO `Medicos` (`id_medico`, `nome`, `especialidade`, `telefone`) VALUES
(1, 'Dr. Paulo Almeida', 'Cardiologia', '934567890'),
(2, 'Dr. Rafael Costa', 'Pediatria', '934567891'),
(3, 'Dr. Fernanda Lima', 'Ortopedia', '934567892'),
(4, 'Dr. João Batista', 'Cardiologia', '934567893'),
(5, 'Dr. Beatriz Souza', 'Pediatria', '934567894');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Pacientes`
--

CREATE TABLE `Pacientes` (
  `id_paciente` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `Pacientes`
--

INSERT INTO `Pacientes` (`id_paciente`, `nome`, `data_nascimento`, `telefone`, `endereco`) VALUES
(1, 'Maria Silva', '1985-07-20', '999999999', 'Rua A, 123'),
(2, 'João Pereira', '1990-11-11', '988888888', 'Rua B, 456'),
(3, 'Ana Costa', '1995-04-10', '977777777', 'Rua C, 789'),
(4, 'Carlos Oliveira', '1982-06-25', '966666666', 'Rua D, 101'),
(5, 'Luciana Souza', '1992-08-30', '955555555', 'Rua E, 202');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `Consultas`
--
ALTER TABLE `Consultas`
  ADD PRIMARY KEY (`id_consulta`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_medico` (`id_medico`);

--
-- Índices de tabela `Exames`
--
ALTER TABLE `Exames`
  ADD PRIMARY KEY (`id_exame`),
  ADD KEY `id_consulta` (`id_consulta`);

--
-- Índices de tabela `Medicos`
--
ALTER TABLE `Medicos`
  ADD PRIMARY KEY (`id_medico`);

--
-- Índices de tabela `Pacientes`
--
ALTER TABLE `Pacientes`
  ADD PRIMARY KEY (`id_paciente`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `Consultas`
--
ALTER TABLE `Consultas`
  MODIFY `id_consulta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `Exames`
--
ALTER TABLE `Exames`
  MODIFY `id_exame` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `Medicos`
--
ALTER TABLE `Medicos`
  MODIFY `id_medico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `Pacientes`
--
ALTER TABLE `Pacientes`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `Consultas`
--
ALTER TABLE `Consultas`
  ADD CONSTRAINT `consultas_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `Pacientes` (`id_paciente`),
  ADD CONSTRAINT `consultas_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `Medicos` (`id_medico`);

--
-- Restrições para tabelas `Exames`
--
ALTER TABLE `Exames`
  ADD CONSTRAINT `exames_ibfk_1` FOREIGN KEY (`id_consulta`) REFERENCES `Consultas` (`id_consulta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
