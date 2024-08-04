-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: fdb1030.awardspace.net
-- Generation Time: Aug 03, 2024 at 10:57 AM
-- Server version: 8.0.32
-- PHP Version: 8.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `4508247_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `nutrition_tips`
--

CREATE TABLE `nutrition_tips` (
  `id` int NOT NULL,
  `tip` text NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `nutrition_tips`
--

INSERT INTO `nutrition_tips` (`id`, `tip`, `user_id`) VALUES
(1, 'Drink plenty of water every day.', 1),
(2, 'Eat a balanced diet with a variety of foods.', 1),
(3, 'Include more fruits and vegetables in your meals.', 2),
(4, 'Limit your intake of sugary drinks and snacks.', 3),
(5, 'Drink plenty of water every day.', 1),
(6, 'Eat a balanced diet with a variety of foods.', 4),
(7, 'Include more fruits and vegetables in your meals.', 2),
(8, 'Limit your intake of sugary drinks and snacks.', 2),
(9, 'Avoid processed foods as much as possible.', 1),
(10, 'Eat smaller portions to manage your weight.', 2),
(11, 'Incorporate healthy fats into your diet.', 3),
(12, 'Stay active to complement your nutrition plan.', 4),
(13, 'Maintain a regular eating schedule.', 2),
(14, 'Prepare meals at home to control ingredients.', 3),
(15, 'Choose whole grains over refined grains.', 1),
(16, 'Limit salt intake to lower blood pressure.', 4),
(17, 'Avoid eating late at night.', 1),
(18, 'Try to have a regular sleep schedule.', 2),
(19, 'Reduce your intake of processed foods.', 3),
(20, 'Incorporate more protein into your diet.', 4),
(21, 'Get enough fiber from whole grains and vegetables.', 1),
(22, 'Limit your intake of high-calorie snacks.', 2),
(23, 'Include healthy fats like avocados and nuts in your diet.', 3),
(24, 'Practice mindful eating to avoid overeating.', 4),
(25, 'Consume lean proteins like chicken and fish.', 1),
(26, 'Eat smaller, more frequent meals throughout the day.', 2),
(27, 'Avoid sugary cereals and opt for whole-grain options.', 3),
(28, 'Stay hydrated and limit sugary drinks.', 4);

-- --------------------------------------------------------

--
-- Table structure for table `progress`
--

CREATE TABLE `progress` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `progress_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `progress`
--

INSERT INTO `progress` (`id`, `user_id`, `progress_data`) VALUES
(13, 1, 'Lost 2kg in the first month.'),
(14, 2, 'Improved running speed by 10%.'),
(15, 4, 'Increased weightlifting capacity by 5kg.'),
(16, 3, 'Reduced body fat percentage by 2%.'),
(17, 1, 'Increased daily water intake to 3 liters.'),
(18, 2, 'Lost 5kg in the second month.'),
(19, 3, 'Gained 3kg of muscle mass.'),
(20, 4, 'Reduced cholesterol levels by 10%.'),
(21, 1, 'Achieved 10,000 steps daily for a week.'),
(22, 2, 'Improved flexibility with daily stretching.'),
(23, 3, 'Reduced waist circumference by 4cm.'),
(24, 4, 'Improved sleep quality by following a routine.'),
(25, 1, 'Started a new workout program.'),
(26, 2, 'Increased flexibility by 15%.'),
(27, 3, 'Achieved a new personal best in running.'),
(28, 4, 'Maintained weight for the past month.'),
(29, 1, 'Completed a 5K run for charity.'),
(30, 2, 'Improved overall endurance with new workout routine.'),
(31, 3, 'Lost 5kg in the last two months.'),
(32, 4, 'Gained muscle mass and increased strength.');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `coach` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `month` int NOT NULL,
  `payCode` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`id`, `user_id`, `coach`, `type`, `month`, `payCode`) VALUES
(3, 1, 'Coach Name', 'Type of Request', 8, 'Payment Code'),
(4, 1, 'Coach Name', 'Type of Request', 8, 'Payment Code'),
(5, 1, 'Coach Name', 'Type of Request', 8, 'Payment Code'),
(6, 1, 'Coach Name', 'Type of Request', 8, 'Payment Code'),
(7, 1, 'Coach Name', 'Type of Request', 8, 'Payment Code'),
(8, 1, 'Coach Name', 'Type of Request', 8, 'Payment Code'),
(13, 1, 'Coach Name', 'Type of Request', 8, 'Payment Code'),
(14, 1, 'Coach Name', 'Type of Request', 8, 'Payment Code'),
(15, 2, 'Coach Name', 'Type of Request', 8, 'Payment Code'),
(16, 34, 'aliii', 'fodd', 1, 'alik'),
(17, 37, 'Coach A', 'Type 1', 2, 'ff'),
(18, 37, 'Coach A', 'Type 1, Type 3', 2, 'ff'),
(19, 39, 'Coach B', 'Type 1, Type 2', 1, ',,'),
(20, 40, 'Hassan Hassan', 'Food Tips', 2, 'nnnnn-jj'),
(21, 42, 'Rawan wehbe', 'Food Tips, Workouts', 1, 'mmhhn-n'),
(22, 42, 'Rawan wehbe', 'Food Tips, Workouts', 1, 'mmhhn-n'),
(23, 43, 'Rawan wehbe', 'Workouts, Food Tips', 3, 'ff'),
(24, 43, 'Rawan wehbe', 'Workouts, Food Tips', 3, 'ff'),
(25, 45, 'Hassan Hassan', 'Food Tips, Workouts', 1, 'vv'),
(26, 45, 'Hassan Hassan', 'Food Tips, Workouts', 1, 'vv'),
(27, 46, 'Rawan wehbe', 'Food Tips', 1, 'dd'),
(28, 46, 'Rawan wehbe', 'Food Tips', 1, 'dd'),
(29, 46, 'Rawan wehbe', 'Food Tips', 1, 'dd'),
(30, 46, 'Rawan wehbe', 'Food Tips', 1, 'dd'),
(31, 46, 'Rawan wehbe', 'Food Tips', 1, 'dd'),
(32, 47, 'Rawan wehbe', 'Food Tips', 1, 'jj7'),
(33, 47, 'Rawan wehbe', 'Food Tips', 1, 'jj7'),
(34, 48, 'Rawan wehbe', 'Food Tips, Workouts', 1, '88'),
(35, 49, 'Rawan wehbe', 'Food Tips', 1, 'd'),
(36, 49, 'Rawan wehbe', 'Food Tips', 1, 'd'),
(37, 50, 'Rawan wehbe', 'Food Tips', 1, 'f'),
(38, 52, 'Rawan wehbe', 'Food Tips', 1, 'dd'),
(39, 3, 'Coach Name', 'Type of Request', 8, 'Payment Code'),
(40, 52, 'Rawan wehbe', 'Food Tips', 1, 'dd'),
(41, 53, 'Zahraa Moussa', 'Food Tips, Workouts', 1, '22553'),
(42, 57, 'Rawan wehbe', 'Food Tips', 1, '55tt'),
(43, 58, 'Hassan Hassan', 'Food Tips, Workouts', 1, 'gv55'),
(44, 59, 'Hassan Hassan', 'Food Tips, Workouts', 1, '233'),
(45, 60, 'Rawan wehbe', 'Food Tips, Workouts', 1, 'rrtt'),
(46, 67, 'Hassan Hassan', 'Food Tips, Workouts', 2, 'k');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `img` varchar(300) NOT NULL,
  `height` double NOT NULL,
  `weight` double(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `img`, `height`, `weight`) VALUES
(1, 'hadi moussa', 'hadi@gmail.com', 'hadi123', 'hadi.jpeg', 175.2, 80),
(2, 'ali hassan', 'ali@gmail.com', 'ali123', 'ali.png', 189, 70),
(3, 'rawan wehbi', 'rawan@gmail.com', 'rawan123', 'rawan.jpeg', 185.1, 90),
(4, 'zahraa moussaa', 'zahraa@gmail.com', 'zahraa123', 'zahraa.png', 190.7, 1012),
(5, 'sara abdallah', 'sara@gmail.com', 'sara123', 'sara.jpeg', 160, 55),
(6, 'karim fahmy', 'karim@gmail.com', 'karim123', 'karim.png', 170, 75),
(7, 'maya salah', 'maya@gmail.com', 'maya123', 'maya.jpeg', 165, 60),
(8, 'abir abir', 'abir@example.com', 'abir123', 'zahraa.png', 180, 75),
(10, 'youssef amin', 'youssef@gmail.com', 'youssef123', 'youssef.png', 180, 85),
(16, 'jane smith', 'jane.smith@example.com', 'jane123', 'jane.jpeg', 165.2, 60),
(21, 'mahdi', 'mahdi@gmai.com', 'mahdi123', 'zahraa.png', 55.2, 99),
(22, 'hussein hussein', 'hussein@gmail.com', 'hussein123', '', 180, 59),
(23, 'jana', 'jana@gmail.com', 'jana123', '', 6, 5),
(30, 'lama', 'lama', 'lama', '', 55, 225),
(31, 'alaa', 'alaa', 'alaa', '', 5.2, 9),
(32, 'x', 'x', 'x', '', 52, 5),
(33, 'xc', 'c', 'c', '', 4, 44),
(34, 'zz', 'ss', 'xx', '', 55, 52),
(37, 'ca', 'ca', 'aa', '', 5.5, 9),
(38, 'sure', 'mm', 'nn', '', 88, 11),
(39, 'kk', 'll', ' g', '', 55, 22),
(40, 'hi', 'hi', 'nn', '', 545, 11),
(42, 'mm', 'ddd', 'ss', '', 55, 66),
(43, 'rr', 'rr', 'rr', '', 55, 20),
(45, 'xxff', 'ff', 'ff', '', 44, 44),
(46, 'xx', 'xx', 'xx', '', 33, 33),
(47, 'sshbb', 'ssss', 'ssm ,', '', 225.3, 22),
(48, 'jjj', 'gg', 'kkk', '', 22.9, 44),
(49, 'dd', 'dd', 'dd', '', 33, 333),
(50, 'g', 'g', 'g', '', 5, 5),
(52, 'sdddcc', 'ssvvv', 's5555', '', 33.3, 339),
(53, 'mariam', 'mariam@gmail.com', 'mariam123', '', 16.3, 20),
(56, 'nhbjhb', 'kkiihj', 'yybb', '', 55.6, 55),
(57, 'vvv', 'dfff', 'eft', '', 44, 33),
(58, 'zza', 'hb', 'gj', '', 222, 55),
(59, 'hbh', 'cccc', 'vvv', '', 251, 51),
(60, 'dalida', 'dalida@gmail.com', 'dalida123', '', 112.52, 56),
(61, 'za', 'zm', 'mj', '', 23, 75),
(62, 'zahraagvgh', 'jndcknd', 'jsdn ckjsdn', '', 343, 45),
(64, 'ddbjk', 'vvmhbn', 'ggjkbk', '', 3344, 4422),
(65, 'oop', 'kkmc', 'bn jb', '', 7778, 373783),
(67, 'cciii', 'gghhh', 'tt44', '', 555, 6688);

-- --------------------------------------------------------

--
-- Table structure for table `workout_plans`
--

CREATE TABLE `workout_plans` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `workout_name` varchar(100) NOT NULL,
  `duration` int DEFAULT NULL,
  `instructions` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `workout_plans`
--

INSERT INTO `workout_plans` (`id`, `user_id`, `workout_name`, `duration`, `instructions`) VALUES
(1, 1, 'Morning Routine', 30, 'Warm-up, Push-Ups, Squats, Plank, Cool down.'),
(2, 2, 'Evening Routine', 45, 'Warm-up, Burpees, Squats, Plank, Cool down.'),
(3, 4, 'Strength Training', 60, 'Warm-up, Push-Ups, Weightlifting, Cool down.'),
(4, 4, 'Cardio Blast', 40, 'Warm-up, Running, Burpees, Cool down.'),
(5, 1, 'Yoga for Beginners', 30, 'Warm-up, Sun Salutations, Standing Poses, Cool down.'),
(6, 2, 'HIIT Routine', 20, 'Warm-up, High Knees, Burpees, Mountain Climbers, Cool down.'),
(7, 3, 'Full Body Strength', 50, 'Warm-up, Squats, Deadlifts, Bench Press, Cool down.'),
(8, 4, 'Evening Cardio', 40, 'Warm-up, Running, Jumping Jacks, Cool down.'),
(9, 1, 'Cardio Blast', 50, 'Warm-up, Jogging, Interval Training, Cool down.'),
(10, 2, 'Yoga Flow', 45, 'Warm-up, Sun Salutations, Standing Poses, Cool down.'),
(11, 3, 'Full Body Strength', 60, 'Warm-up, Squats, Lunges, Push-ups, Cool down.'),
(12, 1, 'HIIT Workout', 30, 'Warm-up, High Knees, Burpees, Mountain Climbers, Cool down.'),
(13, 2, 'Pilates Session', 40, 'Warm-up, Core Exercises, Flexibility Training, Cool down.'),
(14, 3, 'Full Body Circuit', 50, 'Warm-up, Jumping Jacks, Push-ups, Sit-ups, Cool down.'),
(15, 4, 'Strength and Conditioning', 60, 'Warm-up, Weight Training, Cardio Intervals, Cool down.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nutrition_tips`
--
ALTER TABLE `nutrition_tips`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rel` (`user_id`);

--
-- Indexes for table `progress`
--
ALTER TABLE `progress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `workout_plans`
--
ALTER TABLE `workout_plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nutrition_tips`
--
ALTER TABLE `nutrition_tips`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `progress`
--
ALTER TABLE `progress`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `workout_plans`
--
ALTER TABLE `workout_plans`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `nutrition_tips`
--
ALTER TABLE `nutrition_tips`
  ADD CONSTRAINT `rel` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `progress`
--
ALTER TABLE `progress`
  ADD CONSTRAINT `progress_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `workout_plans`
--
ALTER TABLE `workout_plans`
  ADD CONSTRAINT `workout_plans_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
