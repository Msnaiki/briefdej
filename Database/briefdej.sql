-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2020 at 03:10 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `briefdej`
--

-- --------------------------------------------------------

--
-- Table structure for table `commandemeal`
--

CREATE TABLE `commandemeal` (
  `idcom` int(40) NOT NULL,
  `nom` varchar(40) NOT NULL,
  `prénom` varchar(40) NOT NULL,
  `numero` varchar(40) NOT NULL,
  `zone` varchar(40) NOT NULL,
  `plat` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `repas`
--

CREATE TABLE `repas` (
  `idrepas` int(11) NOT NULL,
  `meal` varchar(40) NOT NULL,
  `img_repas` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `repas`
--

INSERT INTO `repas` (`idrepas`, `meal`, `img_repas`) VALUES
(1, 'couscous', 'https://www.la-cuisine-marocaine.com/photos-recettes/couscous-doukkali.jpg'),
(2, 'couscous', 'https://www.la-cuisine-marocaine.com/photos-recettes/couscous-doukkali.jpg'),
(3, 'Tajine', 'https://www.la-cuisine-marocaine.com/photos-recettes/01-tajine-berbere-e1427645777521.jpg'),
(4, 'poulet', 'https://www.warmcook.com/img/cms/Blog/Recettes/Roaster/poulet.jpg'),
(5, 'pastichio', 'https://tastykitchen.com/recipes/wp-content/uploads/sites/2/2011/04/pastichio-410x286.jpg'),
(6, 'pizza', 'https://www.recipetineats.com/wp-content/uploads/2020/05/Pepperoni-Pizza_5-SQjpg.jpg'),
(7, 'sushi', 'https://sushi-guide.co.uk/wp-content/uploads/2019/09/Sushi-Ingredients.jpg'),
(8, 'hrira', 'https://www.bladi.net/IMG/arton7239.jpg'),
(9, 'rfissa', 'https://cuisine-test.com/wp-content/uploads/2020/08/Rfissa-au-poulet-2-930x620.jpg'),
(10, 'BM', 'https://i0.wp.com/cuisinedefadila.com/wp-content/uploads/2015/06/Tajine-kefta-aux-oeufs-6-sur-19.jpg'),
(11, 'poisson', 'https://i.ytimg.com/vi/Jq_UU3zj5K4/maxresdefault.jpg'),
(12, 'mrozya', 'https://i.ytimg.com/vi/7Q0J0g6CO6E/maxresdefault.jpg'),
(13, 'lasagna', 'https://www.365daysofbakingandmore.com/wp-content/uploads/2011/02/Lasagna-FEATURE.jpg'),
(14, 'fruits de mer', 'https://www.aquaportail.com/pictures1309/plateau-fruits-de-mer.jpg'),
(15, 'saffa', 'https://tasteofmaroc.com/wp-content/uploads/2017/11/seffa-vermicelli-picturepartners-bigstock.jpg'),
(16, 'baddaz', 'https://maroc-tourisme-rural.com/wp-content/uploads/2017/12/baddaz-1.jpg'),
(17, 'steak', 'https://weclikd.files.wordpress.com/2020/08/fancyfeast.jpg'),
(18, 'sandwich', 'https://simply-delicious-food.com/wp-content/uploads/2019/04/salami-picnic-sandwich-6.jpg'),
(19, 'humbergur', 'https://natashaskitchen.com/wp-content/uploads/2020/06/Chicken-Sandwich-7.jpg'),
(20, 'bbq', 'https://media-cdn.tripadvisor.com/media/photo-s/12/ba/e3/61/getlstd-property-photo.jpg'),
(21, 'boulfaf', 'https://i.pinimg.com/originals/fe/af/e1/feafe109f0d5c5efe61c5c310b8c0152.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `repas_du_jours`
--

CREATE TABLE `repas_du_jours` (
  `id_tm` int(11) NOT NULL,
  `today_meal` varchar(40) NOT NULL,
  `today_img` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `repas_du_jours`
--

INSERT INTO `repas_du_jours` (`id_tm`, `today_meal`, `today_img`) VALUES
(0, 'poisson', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `commandemeal`
--
ALTER TABLE `commandemeal`
  ADD PRIMARY KEY (`idcom`);

--
-- Indexes for table `repas`
--
ALTER TABLE `repas`
  ADD PRIMARY KEY (`idrepas`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `commandemeal`
--
ALTER TABLE `commandemeal`
  MODIFY `idcom` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `repas`
--
ALTER TABLE `repas`
  MODIFY `idrepas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `update_meal` ON SCHEDULE EVERY 5 SECOND STARTS '2020-11-22 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE `repas_du_jours` SET `today_meal`=(SELECT meal FROM repas ORDER BY RAND() LIMIT 1) WHERE `id_tm`=0$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
