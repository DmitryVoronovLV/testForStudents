-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 17 2019 г., 16:02
-- Версия сервера: 5.7.24
-- Версия PHP: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `tests`
--

-- --------------------------------------------------------

--
-- Структура таблицы `answers`
--

DROP TABLE IF EXISTS `answers`;
CREATE TABLE IF NOT EXISTS `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(100) NOT NULL,
  `qid` int(11) NOT NULL,
  `correct` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `qid` (`qid`)
) ENGINE=MyISAM AUTO_INCREMENT=191 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `answers`
--

INSERT INTO `answers` (`id`, `text`, `qid`, `correct`) VALUES
(1, 'Scooter Across Australia', 1, 1),
(2, 'Live on the Streets', 1, 0),
(3, 'African clawless otter Aonyx capensis', 1, 0),
(4, 'Ant (unidentified) unavailable', 1, 0),
(5, 'African jacana Actophilornis africanus', 2, 1),
(6, 'African polecat Ictonyx striatus', 2, 0),
(7, 'For sale on behalf of Make-A-Wish', 2, 0),
(8, 'Buy a Stranger Lunch', 2, 0),
(9, 'Act in a Play', 3, 1),
(10, 'Throw a Dart at a Map and Visit the Country It Lands On', 3, 0),
(11, 'For Auction on behalf of Camp Quality', 3, 0),
(12, 'Asian lion Panthera leo persica', 3, 0),
(13, 'Asian water dragon Physignathus cocincinus', 3, 0),
(14, 'Australian pelican Pelecanus conspicillatus', 3, 0),
(15, 'Australian sea lion Neophoca cinerea', 3, 0),
(16, 'Adouri', 4, 1),
(17, 'Sumo Wrestling', 4, 0),
(18, 'Feature in a Bollywood Movie', 4, 0),
(19, 'Surf Safari', 4, 0),
(20, 'Speed Dating', 4, 0),
(21, 'Street Performance', 5, 1),
(22, 'Cross a Desert', 5, 0),
(23, 'American badger Taxidea taxus', 5, 0),
(24, 'American beaver Castor canadensis', 5, 0),
(25, 'Playboy Mansion', 5, 0),
(26, 'Leaning Tower of Pisa', 5, 0),
(27, 'Live with a Tribe for One Week', 5, 0),
(28, 'Anteater, giant Myrmecophaga tridactyla', 5, 0),
(29, 'Armadillo, common long-nosed Dasypus novemcinctus', 6, 1),
(30, 'Publish an Article', 6, 0),
(31, 'Hit a Hole in One', 7, 1),
(32, 'Invent Something', 7, 0),
(33, 'Asian false vampire bat Megaderma spasma', 7, 0),
(34, 'Antelope, roan Hippotragus equinus', 7, 0),
(35, 'Armadillo, seven-banded Dasypus septemcincus', 8, 1),
(36, 'Asiatic jackal Canis aureus', 8, 0),
(37, 'Ultimate Prank', 8, 0),
(38, 'Minister a Wedding', 8, 0),
(39, 'Land Diving', 8, 0),
(40, 'Grow a Beard', 8, 0),
(41, 'Make a London Guard Laugh', 9, 1),
(42, 'African red-eyed bulbul Pycnonotus nigricans', 9, 0),
(43, 'African black crake Limnocorax flavirostra', 9, 0),
(44, 'Learn Salsa', 9, 0),
(45, 'Dad’s Dream Car', 9, 0),
(46, 'Be in a Hollywood Movie', 9, 0),
(47, 'Meet Another ‘Sebastian Terry’', 10, 1),
(48, 'Raise $100,000 for Camp Quality', 10, 0),
(49, 'African buffalo Snycerus caffer', 10, 0),
(50, 'For Auction on behalf of Camp Quality', 10, 0),
(51, 'Australian spiny anteater Tachyglossus aculeatus', 10, 0),
(52, 'Armadillo, nine-banded Dasypus novemcinctus', 10, 0),
(53, 'Arctic fox Alopex lagopus', 10, 0),
(54, 'American black bear Ursus americanus', 10, 0),
(55, 'Alpaca Lama pacos', 11, 1),
(56, 'American crow Corvus brachyrhynchos', 11, 0),
(57, 'Statue of Liberty', 11, 0),
(58, 'Ice Fishing', 11, 0),
(59, 'Walk Across a Country', 12, 1),
(60, 'Running with Bulls', 12, 0),
(61, 'Eiffel Tower', 12, 0),
(62, 'Admiral, indian red Vanessa indica', 12, 0),
(63, 'Arctic hare Lepus arcticus', 12, 0),
(64, 'American racer Coluber constrictor', 13, 1),
(65, 'Machu Picchu', 13, 0),
(66, 'American bighorn sheep Ovis canadensis', 13, 0),
(67, 'Chase a Tornado', 13, 0),
(68, 'Treacherous Trek', 13, 0),
(69, 'American bison Bison bison', 14, 1),
(70, 'Agile wallaby Macropus agilis', 14, 0),
(71, 'Crazy Bid', 14, 0),
(72, 'Asian water buffalo Bubalus arnee', 14, 0),
(73, 'Asian elephant Elephas maximus bengalensis', 14, 0),
(74, 'Perform an Original Song', 15, 1),
(75, 'Haunted House', 15, 0),
(76, 'Agama lizard (unidentified) Agama sp.', 15, 0),
(77, 'African ground squirrel (unidentified) Xerus sp.', 15, 0),
(78, 'Stand-Up Comedy Routine', 15, 0),
(79, 'Complete a Triathlon', 15, 0),
(80, 'Kiss a Celebrity', 15, 0),
(81, 'Work at an Orphanage', 16, 1),
(82, 'Sports Streak', 16, 0),
(83, 'Foreign Aid', 16, 0),
(84, 'Have Something Named After Me', 16, 0),
(85, 'Surf River Wave', 16, 0),
(86, 'Avocet, pied Recurvirostra avosetta', 16, 0),
(87, 'Asiatic wild ass Equus hemionus', 16, 0),
(88, 'Antechinus, brown Antechinus flavipes', 17, 1),
(89, 'Go on an Adventure', 17, 0),
(90, 'Live on a Desert Island for One Week', 17, 0),
(91, 'Be a Contestant on a TV Game Show', 17, 0),
(92, 'Whale Shark Swim', 17, 0),
(93, 'Be in a Dance Video Clip', 18, 1),
(94, 'Bet $1000 on Black (Roulette)', 18, 0),
(95, 'Tantric Lesson', 18, 0),
(96, 'Hitchhike Across America', 18, 0),
(97, 'Sydney Opera House', 18, 0),
(98, 'Alligator, mississippi Alligator mississippiensis', 18, 0),
(99, 'American alligator Alligator mississippiensis', 18, 0),
(100, 'Andean goose Chloephaga melanoptera', 18, 0),
(101, 'American woodcock Scolopax minor', 19, 1),
(102, 'Albatross, galapagos Diomedea irrorata', 19, 0),
(103, 'African pied wagtail Motacilla aguimp', 19, 0),
(104, 'African elephant Loxodonta africana', 19, 0),
(105, 'Plant a Tree', 19, 0),
(106, 'Visit a Fortune Teller', 19, 0),
(107, 'Own a Company', 20, 1),
(108, 'Skydive Naked', 20, 0),
(109, 'Attend an Extreme Religious Ceremony', 20, 0),
(110, 'Muster Cattle', 20, 0),
(111, 'Endurance Tandem Bike Ride', 20, 0),
(112, 'Be a Horse Jockey', 20, 0),
(113, 'Kremlin', 20, 0),
(114, 'Anaconda (unidentified) Eunectes sp.', 20, 0),
(115, 'American marten Martes americana', 20, 0),
(116, 'Amazon parrot (unidentified) Amazona sp.', 20, 0),
(117, 'American buffalo Bison bison', 20, 0),
(118, 'Antelope, sable Hippotragus niger', 20, 0),
(119, 'Asian openbill Anastomus oscitans', 20, 0),
(120, 'Arctic ground squirrel Spermophilus parryii', 21, 1),
(121, 'Great Wall of China', 21, 0),
(122, 'Stay Awake for Seventy-Two Hours', 21, 0),
(123, 'African darter Anhinga rufa', 21, 0),
(124, 'African lion Panthera leo', 21, 0),
(125, 'African bush squirrel Paraxerus cepapi', 21, 0),
(126, 'Albatross, waved Diomedea irrorata', 21, 0),
(127, 'African porcupine Hystrix cristata', 21, 0),
(128, 'Join a Protest', 21, 0),
(129, 'Burning Man Festival', 22, 1),
(130, 'Visit a Death Row Inmate', 22, 0),
(131, 'Cycle through Cuba', 22, 0),
(132, 'African skink Mabuya spilogaster', 22, 0),
(133, 'African wild cat Felis silvestris lybica', 22, 0),
(134, 'Meditation', 22, 0),
(135, 'Crash a Red Carpet', 22, 0),
(136, 'Face a Shane Warne Over', 23, 1),
(137, 'Agouti Dasyprocta leporina', 23, 0),
(138, 'African fish eagle Haliaetus vocifer', 23, 0),
(139, 'Sail the Seas', 23, 0),
(140, 'Say Yes to Everything for One Week', 23, 0),
(141, 'American Virginia opossum Didelphis virginiana', 23, 0),
(142, 'Ass, asiatic wild Equus hemionus', 24, 1),
(143, 'Deliver a Baby', 24, 0),
(144, 'African snake (unidentified) unavailable', 24, 0),
(145, 'Alligator, american Alligator mississippiensis', 25, 1),
(146, 'African lynx Felis caracal', 25, 0),
(147, 'Aardwolf Proteles cristatus', 25, 0),
(148, 'Marathon (Iron Man)', 25, 0),
(149, 'Get Shot', 25, 0),
(150, 'Be a Team Mascot for a Day', 25, 0),
(151, 'Taj Mahal', 25, 0),
(152, 'Catch a Thief', 25, 0),
(153, 'Participate in a Boxing Match', 25, 0),
(154, 'Naked Rugby', 25, 0),
(155, 'Get a Tattoo', 25, 0),
(156, 'Argalis Ovis ammon', 25, 0),
(157, 'Asian red fox Vulpes vulpes', 25, 0),
(158, 'Asian foreset tortoise Manouria emys', 26, 1),
(159, 'Antelope, four-horned Tetracerus quadricornis', 26, 0),
(160, 'Find My Family Tree', 26, 0),
(161, 'Olympic Ski Jump', 26, 0),
(162, 'Pyramid of Giza', 26, 0),
(163, 'Pose Nude', 26, 0),
(164, 'Marry a Stranger in Vegas', 27, 1),
(165, 'Be in a Medical Trial', 27, 0),
(166, 'Go to Timbuktu', 27, 0),
(167, 'Be a Weaponless & Harmless Matador', 27, 0),
(168, 'Read the National TV Weather Report', 27, 0),
(169, 'Anteater, australian spiny Tachyglossus aculeatus', 27, 0),
(170, 'Arctic lemming Dicrostonyx groenlandicus', 28, 1),
(171, 'Australian brush turkey Alectura lathami', 28, 0),
(172, 'Australian magpie Gymnorhina tibicen', 28, 0),
(173, 'Australian masked owl Tyto novaehollandiae', 28, 0),
(174, 'Throw a Party', 28, 0),
(175, 'Save a Life', 28, 0),
(176, 'Easter Island Moai', 28, 0),
(177, 'African wild dog Lycaon pictus', 28, 0),
(178, 'Publish a Book', 29, 1),
(179, 'One Week’s Silence', 29, 0),
(180, 'Help a Stranger', 29, 0),
(181, 'Learn French', 29, 0),
(182, 'Challenge a World Champion', 29, 0),
(183, 'Arboral spiny rat Echimys chrysurus', 29, 0),
(184, 'Antelope ground squirrel Ammospermophilus nelsoni', 29, 0),
(185, 'Arctic tern Sterna paradisaea', 30, 1),
(186, 'Armadillo, giant Priodontes maximus', 30, 0),
(187, 'Azaras zorro Pseudalopex gymnocercus', 30, 0),
(188, 'Represent a Country at Something', 30, 0),
(189, 'Guinness World Record', 30, 0),
(190, 'Build Something', 30, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `answer_history`
--

DROP TABLE IF EXISTS `answer_history`;
CREATE TABLE IF NOT EXISTS `answer_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `aid` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `aid` (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `questions`
--

DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(400) NOT NULL,
  `tid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `questions`
--

INSERT INTO `questions` (`id`, `text`, `tid`) VALUES
(1, 'What weird food combinations do you really enjoy?', 1),
(2, 'What social stigma does society need to get over?', 1),
(3, 'What food have you never eaten but would really like to try?', 1),
(4, 'What\'s something you really resent paying for?', 1),
(5, 'What would a world populated by clones of you be like?', 1),
(6, 'Do you think that aliens exist?', 1),
(7, 'What are you currently worried about?', 1),
(8, 'Where are some unusual places you\'ve been?', 1),
(9, 'Where do you get your news?', 2),
(10, 'What are some red flags to watch out for in daily life?', 2),
(11, 'What movie can you watch over and over without ever getting tired of?', 2),
(12, 'When you are old, what do you think children will ask you to tell stories about?', 2),
(13, 'If you could switch two movie characters, what switch would lead to the most inappropriate movies?', 3),
(14, 'What inanimate object would be the most annoying if it played loud upbeat music while being used?', 3),
(15, 'When did something start out badly for you but in the end, it was great?', 3),
(16, 'How would your country change if everyone, regardless of age, could vote?', 3),
(17, 'What animal would be cutest if scaled down to the size of a cat?', 3),
(18, 'If your job gave you a surprise three day paid break to rest and recuperate, what would you do with those three days?', 3),
(19, 'What\'s wrong but sounds right?', 3),
(20, 'What\'s the most epic way you\'ve seen someone quit or be fired?', 3),
(21, 'If you couldn\'t be convicted of any one type of crime, what criminal charge would you like to be immune to?', 3),
(22, 'What\'s something that will always be in fashion, no matter how much time passes?', 4),
(23, 'What actors or actresses play the same character in almost every movie or show they do?', 4),
(24, 'In the past people were buried with the items they would need in the afterlife, what would you want buried with you so you could use it in the afterlife?', 4),
(25, 'What\'s the best / worst practical joke that you\'ve played on someone or that was played on you?', 5),
(26, 'Who do you go out of your way to be nice to?', 5),
(27, 'Where do you get most of the decorations for your home?', 5),
(28, 'What food is delicious but a pain to eat?', 5),
(29, 'Who was your craziest / most interesting teacher', 5),
(30, 'What \'old person\' things do you do?', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `score_history`
--

DROP TABLE IF EXISTS `score_history`;
CREATE TABLE IF NOT EXISTS `score_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `tid` (`tid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `score_history`
--

INSERT INTO `score_history` (`id`, `uid`, `tid`, `score`, `date`) VALUES
(1, 0, 3, 0, '2019-06-17 19:02:24');

-- --------------------------------------------------------

--
-- Структура таблицы `tests`
--

DROP TABLE IF EXISTS `tests`;
CREATE TABLE IF NOT EXISTS `tests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tests`
--

INSERT INTO `tests` (`id`, `title`) VALUES
(1, 'grammar'),
(2, 'english'),
(3, 'math'),
(4, 'biology'),
(5, 'logic');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`) VALUES
(1, '124');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
