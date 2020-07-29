-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29-Jul-2020 às 16:50
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `electrondb`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `provider` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `amount` char(3) NOT NULL,
  `price` decimal(7,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `product`
--

INSERT INTO `product` (`id`, `name`, `provider`, `description`, `amount`, `price`) VALUES
(1, 'Notebook Dell', 'Ponto Frio', 'notebook i5', '', '2500.000'),
(2, 'Mouse Logitech', '', 'mouse', '6', '15.000'),
(4, 'Fonte Acer', '', 'fonte acer 19v', '', '20.000'),
(7, 'Celular Iphone 6', 'Paracampos', 'iphone 64gb', '', '1500.000'),
(9, 'Monitor TV', '', 'Monitor tv LG', '1', '800.000'),
(10, 'Cadeira Gamer', 'kabum', 'Cadeira', '', '1100.000'),
(11, 'Notebook Samsung', 'JV Info', 'notebook i5', '5', '2000.000'),
(12, 'Cabo HDMI', 'Donato', 'cabo hdmi.', '10', '15.000');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
