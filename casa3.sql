-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 21, 2020 at 12:58 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `casa3`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrador`
--

CREATE TABLE `administrador` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `administrador`
--

INSERT INTO `administrador` (`id`, `nome`, `user_id`) VALUES
(1, 'Mila', 7),
(2, 'Shazia', 8);

-- --------------------------------------------------------

--
-- Table structure for table `arrendamento`
--

CREATE TABLE `arrendamento` (
  `id` int(11) NOT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `status` varchar(45) NOT NULL,
  `inicio` date NOT NULL,
  `fim` date NOT NULL,
  `casa_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `intermediario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `arrendamento`
--

INSERT INTO `arrendamento` (`id`, `titulo`, `status`, `inicio`, `fim`, `casa_id`, `cliente_id`, `intermediario_id`) VALUES
(1, 'Casa Familiar', 'aprovado', '2019-05-12', '2019-05-31', 13, 2, 1),
(2, 'Condominio Familiar', 'aprovado', '2019-05-20', '2019-07-31', 13, 3, 2),
(3, 'Escritorio', 'pendente', '2019-05-15', '2019-09-11', 13, 6, 1),
(4, 'Casa Familiar', 'reprovado', '2019-05-08', '2019-09-30', 13, 7, 2),
(5, 'Escola', 'pendente', '2019-05-22', '2019-06-20', 13, 8, 1),
(6, 'Familiar', 'pendente', '2019-05-15', '2019-05-31', 13, 9, 1),
(7, 'Tipo 3', 'pendente', '2019-05-19', '2020-05-20', 13, 12, 2),
(8, 'Flat Familiar T2', 'aprovado', '2019-06-08', '2019-06-30', 13, 14, 3),
(9, 'Familiar', 'pendente', '2019-06-03', '2019-06-30', 29, 15, 3),
(17, 'Casa PPPP', 'pendente', '2019-06-01', '2019-06-30', 52, 13, 3),
(58, 'Apartamento ', 'pendente', '2019-06-01', '2019-06-30', 56, 19, 6),
(59, 'Casa temporaria', 'aprovado', '2019-08-01', '2019-12-31', 58, 20, 7),
(60, 'Casa no Benfica', 'aprovado', '2019-06-28', '2019-12-02', 59, 21, 8),
(61, 'Casa para um casal', 'aprovado', '2019-07-06', '2019-07-31', 60, 14, 3),
(64, 'Casa do Helio', 'aprovado', '2019-07-11', '2019-07-27', 65, 22, 5);

-- --------------------------------------------------------

--
-- Table structure for table `bairro`
--

CREATE TABLE `bairro` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bairro`
--

INSERT INTO `bairro` (`id`, `nome`) VALUES
(1, 'Bairro Central'),
(2, 'Museu'),
(3, 'Malhangalene'),
(4, 'Coop'),
(5, 'Sommershield'),
(6, 'Luis Cabral'),
(7, 'Alto Mae'),
(8, 'Maxaquene'),
(9, 'Jardim'),
(10, 'Chopal'),
(11, 'Benfica'),
(12, 'Zimpeto'),
(13, 'Triunfo'),
(14, 'Polana');

-- --------------------------------------------------------

--
-- Table structure for table `casa`
--

CREATE TABLE `casa` (
  `id` int(11) NOT NULL,
  `localizacao` varchar(45) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  `descrisao` varchar(255) DEFAULT NULL,
  `nr_quartos` int(11) DEFAULT NULL,
  `casa_banho` int(11) DEFAULT NULL,
  `intermediario_id` int(11) DEFAULT NULL,
  `bairro_id` int(11) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `casa`
--

INSERT INTO `casa` (`id`, `localizacao`, `nome`, `image`, `valor`, `descrisao`, `nr_quartos`, `casa_banho`, `intermediario_id`, `bairro_id`, `status`) VALUES
(13, 'Bairro Central', 'Ana Braga', '1.jpg', 75000, 'Flat Tipo 3, Localizada na Av. Vladimir Lenine, esquina com a Eduardo Mondlane. Casa comoda com 3 quartos e 3 casas de Banho, espacos largos e aconchegante', 3, 3, 1, 1, ''),
(29, '24 de Julho', 'Sonia\r\n', '5.jpg', 58000, 'Vivenda, 4 quartos, uma dependÃªncia, 2 casas de banho, parque de estacionamento, jardim', 4, 2, 1, 1, ''),
(44, 'Coop', 'Mariazinha', 'a9dac45bcb14cc32e4d92aaaa683b704.jpg', 15000, 'Dependencia com um quarto, 1 casa de banho interna, cozinha', 1, 1, 4, 4, ''),
(47, 'Jardim', NULL, '6fb6e9ffa56e237141d672855e70ebd7 (1).jpg', 500000, 'Casa grande com jardim, piscina, uma garagem, tres quartos, duas casas de banho', 4, 4, 1, 6, ''),
(48, 'Mira Flores', NULL, '2291b08b42985f85472183789dbd4916.jpg', 45780, 'Casa Apmpla com 3 quartos;\r\nduas casas de balho;\r\num terraco para lazer.', 3, 2, 3, 1, ''),
(51, 'Ponta de Ouro', NULL, 'Casa.jpg', 35800, 'Casa bonita...', 2, 1, 3, 2, 'Pendente'),
(52, 'Alto Mae', NULL, 'e9bc2d6c5fa647bf89d78771da72b849.jpg', 15000, 'Casa Pequena, com dois quartos, uma casa de banho', 2, 1, 2, 7, 'Pendente'),
(54, 'Belita', NULL, '16f9d096adaba9998d9312d51b262f75.jpg', 5000, 'Casa linda com espacos de lazer, um quarto e uma casa de banho...', 1, 1, 4, 7, ''),
(55, 'Triunfo', NULL, 'b7ac70d72b090c5050b13a6b429505ea.jpg', 95000, 'Casa comoda com espaco largo,\r\numa piscina, uma garagem, quatro quartos.', 4, 2, 3, 13, ' '),
(56, 'Ponta Vermelha', NULL, '55982f0f3f52eba46b16c0823cceab6c.jpg', 68700, 'Apartamento pequeno, com dois quartos, uma casas de banho ', 2, 1, 6, 2, 'Pendente'),
(57, 'Benfica', NULL, '9a693cae23a47ce03a77f064b12118f5.jpg', 10000, 'Casa pequena, com um quarto, uma casa de banho, quintal pequeno', 1, 1, 3, 11, ' '),
(58, 'Xima', NULL, '39f7f25449d026df200e3cd5f8e3d81b.jpg', 25000, 'Flat com dois quartos, uma casa de banho,\r\nlocalizada perto do Xima, 2nd andar, E', 2, 1, 7, 7, 'Pendente'),
(59, 'Benfica Parragem', NULL, '88bb72d7dcfdf4f29e3488954a8fcfbf.jpg', 15000, 'Casa pequena mas comoda', 2, 2, 8, 11, 'Pendente'),
(60, 'Zona do MICA', NULL, 'bbcdb373606ede1977513ad9db923635.jpg', 15000, 'Flat pequena e comoda para um casal..', 1, 1, 3, 8, 'Pendente'),
(61, 'Shoprite', NULL, 'bbcdb373606ede1977513ad9db923635.jpg', 59800, 'Flat com dois quartos, uma sala, uma casa de banho, duas varandas, localizada no 3Âº andar, Esquerda', 2, 1, 3, 3, ' '),
(62, 'Malhangalene', NULL, 'c054f269ff5ad0048d6447c2212ba0da.jpg', 45000, 'Flat com dois quartos, uma sala, cozinha,\r\nlocalizada no segundo andar, esquerda', 2, 1, 5, 3, 'Pendente'),
(63, 'Chopal-Rua7', NULL, '21e376da175676017e2a1caf15cdf013.jpg', 75800, 'Casa para familia grande, uma garragem, piscina,\r\ncampo de desporto, tres quartos...', 5, 3, 5, 10, ' '),
(64, 'Triunfo', NULL, '89b1da68fa6f4a28a0e7f9895e58f9b9.jpg', 105000, 'Casa grande de lazer, espacos amplos para pratica\r\nde desporto, vista para zona costeira, seguranca\r\ngarantida 24 horas por dia', 5, 3, 5, 13, ' '),
(65, 'Museu ', NULL, 'da3f4b6ff5eff83aa7d85e4ce1b608f6.jpg', 52000, 'Flat com tres quartos e duas casas de banho\r\nlocalizada no decimo andar', 3, 2, 5, 2, 'Pendente'),
(66, 'Pandora', NULL, 'ded18d742c74031288022348954ff322.jpg', 50000, 'Flat com quatro quartos, duas casas de banho, localizada\r\nno setimo andar', 4, 2, 3, 1, ''),
(67, 'Sommershield', NULL, 'imagem2-9.jpg', 250000, 'Vivenda com seis quartos, cinco casas de banho\r\npiscina, duas garragens...', 6, 5, 6, 5, ' ');

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `apelido` varchar(45) NOT NULL,
  `user_id` int(11) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `nr_documento` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `apelido`, `user_id`, `telefone`, `email`, `nr_documento`) VALUES
(2, 'Ana', 'Maria', 5, '84123456', 'ana@gmail.com', '11001114'),
(3, 'Samora', 'Machel', 6, '84123456', 'samora@gmail.com', '11011244'),
(4, 'Teresa Mat', 'Scott', 11, '84123456', 'tesa@gmail.com', '101111015'),
(5, 'Sandra', 'Mabote', 12, '8412456', 'sandra@gmail.com', '101421251'),
(6, 'Ilidio', 'Machel', 13, '841245784', 'ilidio@gmail.com', '10111151'),
(7, 'Bela', 'Maira', 14, '841245488', 'bela@gmail.com', '101121515151'),
(8, 'Vania', 'Tome', 15, '874512425', 'va@gmail.com', '101245454'),
(9, 'Zaira', 'Almeida', 16, '844245454', 'za@gmail.com', '101111145'),
(10, 'Valter', 'Cossa', 17, '841245678', 'valter@gmail.com', '101111245445'),
(11, 'Sara', 'Zandamela', 18, '841234567', 'sara@gmail.com', '101110221542'),
(12, 'Carlos', 'Cossa', 19, '841234567', 'carlos@gmail.com', '1011012121'),
(13, 'Maia', 'Soares', 21, '841234567', 'maia@gmail.com', '101002115151'),
(14, 'Carolina', 'Guambe', 22, '841234567', 'carolina@gmail.com', '1011212454'),
(15, 'Marco', 'Caio', 24, '841245154', 'marco@gmail.com', '10114245545'),
(16, 'Claudia', 'Costa', 25, '841245678', 'claudinha@hotmail.com', '101110022'),
(17, 'Dilara', 'Aslan', 27, '821547896', 'lara@outlook.tk', '1100121151'),
(18, 'Mario', 'Almeida', 28, '8412345678', 'ma@gmail.com', '111000115'),
(19, 'Jamal', 'Aslan', 29, '851349706', 'jamal@outlook.tk', '101112151'),
(20, 'Belarmina', 'Macuacua', 31, '860176379', 'belarmina@hotmail.com', '101142154'),
(21, 'Maria', 'Silva', 33, '841246920', 'maria@gmail.com', '1051251'),
(22, 'Helio', 'Alves', 35, '841245678', 'helio@gmail.com', '101115121'),
(23, 'Samira', 'Flavia', 36, '929220202929229', 'samira@samira.com', '11133455555555');

-- --------------------------------------------------------

--
-- Table structure for table `intermediario`
--

CREATE TABLE `intermediario` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `nr_documento` varchar(45) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `intermediario`
--

INSERT INTO `intermediario` (`id`, `nome`, `email`, `telefone`, `nr_documento`, `user_id`) VALUES
(1, 'Pedro', 'pedro@gmail.com', '841245680', '11011454545', 9),
(2, 'Socrates', 'so@gmail.com', '841245678', '1100121216B', 10),
(3, 'Natasha', 'natasha@hotmail.com', '871234567', '1101241445', 20),
(4, 'Gustavo', 'gaxito@yahoo.com', '871234569', '10222145151', 23),
(5, 'Paulo', 'paulinho@yahoo.com', '841234567', '101111215', 26),
(6, 'Nuria', 'nur@gmail.com', '861079108', '10214211', 30),
(7, 'Celio', 'celio@uem.ac.mz', '861034893', '102151844', 32),
(8, 'Joaquim', 'jo@gmail.com', '841246905', '1011525125', 34);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `perfil` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `perfil`) VALUES
(5, 'Ana', '0000', 'cliente'),
(6, 'Samora', '0000', 'cliente'),
(7, 'Mila', 'admin', 'admin'),
(8, 'Shazia', 'admin', 'admin'),
(9, 'Pedro', '2019', 'intermediario'),
(10, 'Socrates', '2019', 'intermediario'),
(11, 'Teresa', '0000', 'cliente'),
(12, 'Sandra', '0000', 'cliente'),
(13, 'ilidio', '0000', 'cliente'),
(14, 'bela', '0000', 'cliente'),
(15, 'vania', '0000', 'cliente'),
(16, 'zaira', '0000', 'cliente'),
(17, 'Valter', '0000', 'cliente'),
(18, 'Sara', '0000', 'cliente'),
(19, 'Carlos', '0000', 'cliente'),
(20, 'Natasha', '2019', 'intermediario'),
(21, 'Maia', '0000', 'cliente'),
(22, 'Carolina', '0000', 'cliente'),
(23, 'Gustavo', '2019', 'intermediario'),
(24, 'marco', '0000', 'cliente'),
(25, 'Claudia', '0000', 'cliente'),
(26, 'Paulo', '2019', 'intermediario'),
(27, 'Dilara', '0000', 'cliente'),
(28, 'Mario', '0000', 'cliente'),
(29, 'Jamal', '0000', 'cliente'),
(30, 'Nuria', '2019', 'intermediario'),
(31, 'Belarmina', '0000', 'cliente'),
(32, 'Celio', '2019', 'intermediario'),
(33, 'Maria', '0000', 'cliente'),
(34, 'Joaquim', '2019', 'intermediario'),
(35, 'Helio', '0000', 'cliente'),
(36, 'Samira', '11111111', 'cliente');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  ADD KEY `fk_autoridade_user1_idx` (`user_id`);

--
-- Indexes for table `arrendamento`
--
ALTER TABLE `arrendamento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_arrendamento_casa1_idx` (`casa_id`),
  ADD KEY `fk_arrendamento_cliente1_idx` (`cliente_id`),
  ADD KEY `fk_arrendamento_intermediario1_idx` (`intermediario_id`);

--
-- Indexes for table `bairro`
--
ALTER TABLE `bairro`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `casa`
--
ALTER TABLE `casa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_casa_intermediario1_idx` (`intermediario_id`),
  ADD KEY `fk_casa_bairro1_idx` (`bairro_id`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  ADD KEY `fk_cliente_user1_idx` (`user_id`);

--
-- Indexes for table `intermediario`
--
ALTER TABLE `intermediario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  ADD KEY `fk_intermediario_user1_idx` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrador`
--
ALTER TABLE `administrador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `arrendamento`
--
ALTER TABLE `arrendamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `bairro`
--
ALTER TABLE `bairro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `casa`
--
ALTER TABLE `casa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `intermediario`
--
ALTER TABLE `intermediario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `fk_autoridade_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `arrendamento`
--
ALTER TABLE `arrendamento`
  ADD CONSTRAINT `fk_arrendamento_casa1` FOREIGN KEY (`casa_id`) REFERENCES `casa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_arrendamento_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_arrendamento_intermediario1` FOREIGN KEY (`intermediario_id`) REFERENCES `intermediario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `casa`
--
ALTER TABLE `casa`
  ADD CONSTRAINT `fk_casa_bairro1` FOREIGN KEY (`bairro_id`) REFERENCES `bairro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_casa_intermediario1` FOREIGN KEY (`intermediario_id`) REFERENCES `intermediario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_cliente_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `intermediario`
--
ALTER TABLE `intermediario`
  ADD CONSTRAINT `fk_intermediario_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
