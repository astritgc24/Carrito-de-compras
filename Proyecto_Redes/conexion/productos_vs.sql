/*
 Navicat MySQL Data Transfer

 Source Server         : Proyectos
 Source Server Type    : MySQL
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : productos_vs

 Target Server Type    : MySQL
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 13/06/2024 12:26:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categoria
-- ----------------------------
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categoria
-- ----------------------------
INSERT INTO `categoria` VALUES (1, 'Lociones');
INSERT INTO `categoria` VALUES (2, 'Brumas');
INSERT INTO `categoria` VALUES (3, 'Bolsos');
INSERT INTO `categoria` VALUES (4, 'Accesorios');
INSERT INTO `categoria` VALUES (5, 'Labiales');

-- ----------------------------
-- Table structure for detalleventa
-- ----------------------------
DROP TABLE IF EXISTS `detalleventa`;
CREATE TABLE `detalleventa`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `precio_unitario` decimal(10, 2) NOT NULL,
  `cantidad` int NOT NULL,
  `nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ap1` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ap2` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_producto` int NOT NULL,
  `direc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `codigo` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `total` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_producto`(`id_producto` ASC) USING BTREE,
  CONSTRAINT `id_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detalleventa
-- ----------------------------
INSERT INTO `detalleventa` VALUES (18, 400.00, 1, 's', 's', 's', 3, '', '', 0.00);
INSERT INTO `detalleventa` VALUES (19, 400.00, 1, 's', 's', 's', 2, '', '', 0.00);
INSERT INTO `detalleventa` VALUES (20, 400.00, 1, 's', 's', 's', 4, '', '', 0.00);
INSERT INTO `detalleventa` VALUES (21, 400.00, 1, 'yghudasj', 'bg', 'bg', 3, '', '', 0.00);
INSERT INTO `detalleventa` VALUES (22, 400.00, 1, 'yghudasj', 'bg', 'bg', 2, '', '', 0.00);
INSERT INTO `detalleventa` VALUES (23, 400.00, 1, 'yghudasj', 'bg', 'bg', 4, '', '', 0.00);
INSERT INTO `detalleventa` VALUES (24, 400.00, 1, 'jhgkj', 'jhlk', 'kjl', 2, '', '', 0.00);
INSERT INTO `detalleventa` VALUES (25, 400.00, 1, 'jhgkj', 'jhlk', 'kjl', 4, '', '', 0.00);
INSERT INTO `detalleventa` VALUES (26, 240.00, 1, 'jhgkj', 'jhlk', 'kjl', 21, '', '', 0.00);
INSERT INTO `detalleventa` VALUES (27, 400.00, 1, 'ujl', 'ljl', 'kjkl', 2, '', '', 0.00);
INSERT INTO `detalleventa` VALUES (28, 400.00, 1, 'ujl', 'ljl', 'kjkl', 4, '', '', 0.00);
INSERT INTO `detalleventa` VALUES (29, 240.00, 1, 'ujl', 'ljl', 'kjkl', 21, '', '', 0.00);
INSERT INTO `detalleventa` VALUES (30, 400.00, 2, 'Astrit Lariza', 'Garcia', 'Castillo', 1, 'jilotepec', '54384', 800.00);
INSERT INTO `detalleventa` VALUES (31, 400.00, 3, 'Astrit Lariza', 'Garcia', 'Castillo', 4, 'jilotepec', '54384', 1200.00);
INSERT INTO `detalleventa` VALUES (32, 240.00, 2, 'Astrit Lariza', 'Garcia', 'Castillo', 21, 'jilotepec', '54384', 480.00);
INSERT INTO `detalleventa` VALUES (33, 1300.00, 6, 'Guadalupe', 'Rivera', 'Maldonado', 18, 'Daxthi Soyaniquilpan', '54384', 7800.00);
INSERT INTO `detalleventa` VALUES (34, 1100.00, 1, 'Guadalupe', 'Rivera', 'Maldonado', 16, 'Daxthi Soyaniquilpan', '54384', 1100.00);
INSERT INTO `detalleventa` VALUES (35, 1403.00, 1, 'Guadalupe', 'Rivera', 'Maldonado', 13, 'Daxthi Soyaniquilpan', '54384', 1403.00);
INSERT INTO `detalleventa` VALUES (36, 400.00, 1, 'Juan', 'Perez', 'Perez', 2, 'La esperanza Chapa De Mota', '54384', 400.00);
INSERT INTO `detalleventa` VALUES (37, 400.00, 4, 'yo', 'yo', 'yo', 3, 'yo', '3781', 1600.00);
INSERT INTO `detalleventa` VALUES (38, 1700.00, 45, 'Bibridisquis', 'Castillo', 'Mendoza', 15, 'Canalejas', '54384', 76500.00);

-- ----------------------------
-- Table structure for ejemplar
-- ----------------------------
DROP TABLE IF EXISTS `ejemplar`;
CREATE TABLE `ejemplar`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `estado` enum('disponible','vendido') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'disponible',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_producto`(`id_producto` ASC) USING BTREE,
  CONSTRAINT `ejemplar_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1453 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ejemplar
-- ----------------------------
INSERT INTO `ejemplar` VALUES (343, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (344, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (345, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (346, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (347, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (348, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (349, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (350, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (351, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (352, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (353, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (354, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (355, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (356, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (357, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (358, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (359, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (360, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (361, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (362, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (363, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (364, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (365, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (366, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (367, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (368, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (369, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (370, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (371, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (372, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (373, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (374, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (375, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (376, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (377, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (378, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (379, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (380, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (381, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (382, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (383, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (384, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (385, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (386, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (387, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (388, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (389, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (390, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (391, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (392, 1, 'disponible');
INSERT INTO `ejemplar` VALUES (393, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (394, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (395, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (396, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (397, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (398, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (399, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (400, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (401, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (402, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (403, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (404, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (405, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (406, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (407, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (408, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (409, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (410, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (411, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (412, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (413, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (414, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (415, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (416, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (417, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (418, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (419, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (420, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (421, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (422, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (423, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (424, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (425, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (426, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (427, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (428, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (429, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (430, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (431, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (432, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (433, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (434, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (435, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (436, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (437, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (438, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (439, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (440, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (441, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (442, 2, 'disponible');
INSERT INTO `ejemplar` VALUES (443, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (444, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (445, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (446, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (447, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (448, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (449, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (450, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (451, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (452, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (453, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (454, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (455, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (456, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (457, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (458, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (459, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (460, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (461, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (462, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (463, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (464, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (465, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (466, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (467, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (468, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (469, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (470, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (471, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (472, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (473, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (474, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (475, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (476, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (477, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (478, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (479, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (480, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (481, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (482, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (483, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (484, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (485, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (486, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (487, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (488, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (489, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (490, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (491, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (492, 3, 'disponible');
INSERT INTO `ejemplar` VALUES (493, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (494, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (495, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (496, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (497, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (498, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (499, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (500, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (501, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (502, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (503, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (504, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (505, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (506, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (507, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (508, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (509, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (510, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (511, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (512, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (513, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (514, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (515, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (516, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (517, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (518, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (519, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (520, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (521, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (522, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (523, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (524, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (525, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (526, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (527, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (528, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (529, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (530, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (531, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (532, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (533, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (534, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (535, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (536, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (537, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (538, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (539, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (540, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (541, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (542, 4, 'disponible');
INSERT INTO `ejemplar` VALUES (543, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (544, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (545, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (546, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (547, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (548, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (549, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (550, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (551, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (552, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (553, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (554, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (555, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (556, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (557, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (558, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (559, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (560, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (561, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (562, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (563, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (564, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (565, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (566, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (567, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (568, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (569, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (570, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (571, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (572, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (573, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (574, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (575, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (576, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (577, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (578, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (579, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (580, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (581, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (582, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (583, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (584, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (585, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (586, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (587, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (588, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (589, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (590, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (591, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (592, 5, 'disponible');
INSERT INTO `ejemplar` VALUES (593, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (594, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (595, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (596, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (597, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (598, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (599, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (600, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (601, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (602, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (603, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (604, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (605, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (606, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (607, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (608, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (609, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (610, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (611, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (612, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (613, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (614, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (615, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (616, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (617, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (618, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (619, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (620, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (621, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (622, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (623, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (624, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (625, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (626, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (627, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (628, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (629, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (630, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (631, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (632, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (633, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (634, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (635, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (636, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (637, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (638, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (639, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (640, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (641, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (642, 6, 'disponible');
INSERT INTO `ejemplar` VALUES (643, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (644, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (645, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (646, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (647, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (648, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (649, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (650, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (651, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (652, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (653, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (654, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (655, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (656, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (657, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (658, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (659, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (660, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (661, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (662, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (663, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (664, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (665, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (666, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (667, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (668, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (669, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (670, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (671, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (672, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (673, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (674, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (675, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (676, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (677, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (678, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (679, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (680, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (681, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (682, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (683, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (684, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (685, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (686, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (687, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (688, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (689, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (690, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (691, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (692, 7, 'disponible');
INSERT INTO `ejemplar` VALUES (693, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (694, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (695, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (696, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (697, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (698, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (699, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (700, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (701, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (702, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (703, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (704, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (705, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (706, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (707, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (708, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (709, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (710, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (711, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (712, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (713, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (714, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (715, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (716, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (717, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (718, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (719, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (720, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (721, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (722, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (723, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (724, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (725, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (726, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (727, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (728, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (729, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (730, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (731, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (732, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (733, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (734, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (735, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (736, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (737, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (738, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (739, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (740, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (741, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (742, 8, 'disponible');
INSERT INTO `ejemplar` VALUES (743, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (744, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (745, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (746, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (747, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (748, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (749, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (750, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (751, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (752, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (753, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (754, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (755, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (756, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (757, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (758, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (759, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (760, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (761, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (762, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (763, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (764, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (765, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (766, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (767, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (768, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (769, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (770, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (771, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (772, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (773, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (774, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (775, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (776, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (777, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (778, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (779, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (780, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (781, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (782, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (783, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (784, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (785, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (786, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (787, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (788, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (789, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (790, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (791, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (792, 9, 'disponible');
INSERT INTO `ejemplar` VALUES (793, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (794, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (795, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (796, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (797, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (798, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (799, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (800, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (801, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (802, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (803, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (804, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (805, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (806, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (807, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (808, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (809, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (810, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (811, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (812, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (813, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (814, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (815, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (816, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (817, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (818, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (819, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (820, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (821, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (822, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (823, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (824, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (825, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (826, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (827, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (828, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (829, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (830, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (831, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (832, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (833, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (834, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (835, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (836, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (837, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (838, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (839, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (840, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (841, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (842, 10, 'disponible');
INSERT INTO `ejemplar` VALUES (843, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (844, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (845, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (846, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (847, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (848, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (849, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (850, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (851, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (852, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (853, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (854, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (855, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (856, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (857, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (858, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (859, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (860, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (861, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (862, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (863, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (864, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (865, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (866, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (867, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (868, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (869, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (870, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (871, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (872, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (873, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (874, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (875, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (876, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (877, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (878, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (879, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (880, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (881, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (882, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (883, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (884, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (885, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (886, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (887, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (888, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (889, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (890, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (891, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (892, 11, 'disponible');
INSERT INTO `ejemplar` VALUES (893, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (894, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (895, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (896, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (897, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (898, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (899, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (900, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (901, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (902, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (903, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (904, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (905, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (906, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (907, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (908, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (909, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (910, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (911, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (912, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (913, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (914, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (915, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (916, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (917, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (918, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (919, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (920, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (921, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (922, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (923, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (924, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (925, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (926, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (927, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (928, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (929, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (930, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (931, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (932, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (933, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (934, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (935, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (936, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (937, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (938, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (939, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (940, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (941, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (942, 12, 'disponible');
INSERT INTO `ejemplar` VALUES (943, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (944, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (945, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (946, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (947, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (948, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (949, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (950, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (951, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (952, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (953, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (954, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (955, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (956, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (957, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (958, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (959, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (960, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (961, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (962, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (963, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (964, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (965, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (966, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (967, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (968, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (969, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (970, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (971, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (972, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (973, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (974, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (975, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (976, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (977, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (978, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (979, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (980, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (981, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (982, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (983, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (984, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (985, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (986, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (987, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (988, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (989, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (990, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (991, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (992, 13, 'disponible');
INSERT INTO `ejemplar` VALUES (993, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (994, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (995, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (996, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (997, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (998, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (999, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1000, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1001, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1002, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1003, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1004, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1005, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1006, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1007, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1008, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1009, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1010, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1011, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1012, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1013, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1014, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1015, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1016, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1017, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1018, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1019, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1020, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1021, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1022, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1023, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1024, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1025, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1026, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1027, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1028, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1029, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1030, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1031, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1032, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1033, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1034, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1035, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1036, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1037, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1038, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1039, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1040, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1041, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1042, 14, 'disponible');
INSERT INTO `ejemplar` VALUES (1043, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1044, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1045, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1046, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1047, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1048, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1049, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1050, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1051, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1052, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1053, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1054, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1055, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1056, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1057, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1058, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1059, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1060, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1061, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1062, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1063, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1064, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1065, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1066, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1067, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1068, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1069, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1070, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1071, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1072, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1073, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1074, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1075, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1076, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1077, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1078, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1079, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1080, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1081, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1082, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1083, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1084, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1085, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1086, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1087, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1088, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1089, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1090, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1091, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1092, 15, 'disponible');
INSERT INTO `ejemplar` VALUES (1093, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1094, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1095, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1096, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1097, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1098, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1099, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1100, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1101, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1102, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1103, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1104, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1105, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1106, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1107, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1108, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1109, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1110, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1111, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1112, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1113, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1114, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1115, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1116, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1117, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1118, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1119, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1120, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1121, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1122, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1123, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1124, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1125, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1126, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1127, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1128, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1129, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1130, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1131, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1132, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1133, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1134, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1135, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1136, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1137, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1138, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1139, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1140, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1141, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1142, 16, 'disponible');
INSERT INTO `ejemplar` VALUES (1143, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1144, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1145, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1146, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1147, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1148, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1149, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1150, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1151, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1152, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1153, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1154, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1155, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1156, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1157, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1158, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1159, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1160, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1161, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1162, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1163, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1164, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1165, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1166, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1167, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1168, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1169, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1170, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1171, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1172, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1173, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1174, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1175, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1176, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1177, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1178, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1179, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1180, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1181, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1182, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1183, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1184, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1185, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1186, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1187, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1188, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1189, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1190, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1191, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1192, 17, 'disponible');
INSERT INTO `ejemplar` VALUES (1193, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1194, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1195, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1196, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1197, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1198, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1199, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1200, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1201, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1202, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1203, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1204, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1205, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1206, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1207, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1208, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1209, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1210, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1211, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1212, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1213, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1214, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1215, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1216, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1217, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1218, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1219, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1220, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1221, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1222, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1223, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1224, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1225, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1226, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1227, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1228, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1229, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1230, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1231, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1232, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1233, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1234, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1235, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1236, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1237, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1238, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1239, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1240, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1241, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1242, 18, 'disponible');
INSERT INTO `ejemplar` VALUES (1243, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1244, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1245, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1246, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1247, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1248, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1249, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1250, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1251, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1252, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1253, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1254, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1255, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1256, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1257, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1258, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1259, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1260, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1261, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1262, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1263, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1264, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1265, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1266, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1267, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1268, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1269, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1270, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1271, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1272, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1273, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1274, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1275, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1276, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1277, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1278, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1279, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1280, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1281, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1282, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1283, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1284, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1285, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1286, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1287, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1288, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1289, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1290, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1291, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1292, 19, 'disponible');
INSERT INTO `ejemplar` VALUES (1293, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1294, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1295, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1296, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1297, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1298, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1299, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1300, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1301, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1302, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1303, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1304, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1305, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1306, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1307, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1308, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1309, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1310, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1311, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1312, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1313, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1314, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1315, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1316, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1317, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1318, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1319, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1320, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1321, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1322, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1323, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1324, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1325, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1326, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1327, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1328, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1329, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1330, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1331, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1332, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1333, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1334, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1335, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1336, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1337, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1338, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1339, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1340, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1341, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1342, 20, 'disponible');
INSERT INTO `ejemplar` VALUES (1343, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1344, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1345, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1346, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1347, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1348, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1349, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1350, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1351, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1352, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1353, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1354, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1355, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1356, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1357, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1358, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1359, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1360, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1361, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1362, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1363, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1364, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1365, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1366, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1367, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1368, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1369, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1370, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1371, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1372, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1373, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1374, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1375, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1376, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1377, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1378, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1379, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1380, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1381, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1382, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1383, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1384, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1385, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1386, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1387, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1388, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1389, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1390, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1391, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1392, 21, 'disponible');
INSERT INTO `ejemplar` VALUES (1393, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1394, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1395, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1396, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1397, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1398, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1399, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1400, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1401, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1402, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1403, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1404, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1405, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1406, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1407, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1408, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1409, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1410, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1411, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1412, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1413, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1414, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1415, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1416, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1417, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1418, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1419, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1420, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1421, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1422, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1423, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1424, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1425, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1426, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1427, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1428, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1429, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1430, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1431, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1432, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1433, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1434, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1435, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1436, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1437, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1438, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1439, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1440, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1441, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1442, 22, 'disponible');
INSERT INTO `ejemplar` VALUES (1443, 24, 'disponible');
INSERT INTO `ejemplar` VALUES (1444, 24, 'disponible');
INSERT INTO `ejemplar` VALUES (1445, 24, 'disponible');
INSERT INTO `ejemplar` VALUES (1446, 24, 'disponible');
INSERT INTO `ejemplar` VALUES (1447, 24, 'disponible');
INSERT INTO `ejemplar` VALUES (1448, 24, 'disponible');
INSERT INTO `ejemplar` VALUES (1449, 24, 'disponible');
INSERT INTO `ejemplar` VALUES (1450, 24, 'disponible');
INSERT INTO `ejemplar` VALUES (1451, 24, 'disponible');
INSERT INTO `ejemplar` VALUES (1452, 24, 'disponible');

-- ----------------------------
-- Table structure for marca
-- ----------------------------
DROP TABLE IF EXISTS `marca`;
CREATE TABLE `marca`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of marca
-- ----------------------------
INSERT INTO `marca` VALUES (1, 'Victorias\'Secret');
INSERT INTO `marca` VALUES (2, 'PINK');

-- ----------------------------
-- Table structure for movimientoinventario
-- ----------------------------
DROP TABLE IF EXISTS `movimientoinventario`;
CREATE TABLE `movimientoinventario`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_ejemplar` int NOT NULL,
  `tipo` enum('entrada','salida') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_ejemplar`(`id_ejemplar` ASC) USING BTREE,
  CONSTRAINT `movimientoinventario_ibfk_1` FOREIGN KEY (`id_ejemplar`) REFERENCES `ejemplar` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movimientoinventario
-- ----------------------------

-- ----------------------------
-- Table structure for presentacion
-- ----------------------------
DROP TABLE IF EXISTS `presentacion`;
CREATE TABLE `presentacion`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of presentacion
-- ----------------------------
INSERT INTO `presentacion` VALUES (1, 'Envase ');
INSERT INTO `presentacion` VALUES (2, 'Botella');
INSERT INTO `presentacion` VALUES (3, 'No aplica');
INSERT INTO `presentacion` VALUES (4, 'Envase de labias');

-- ----------------------------
-- Table structure for producto
-- ----------------------------
DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `precio` decimal(10, 2) NOT NULL,
  `id_marca` int NULL DEFAULT NULL,
  `id_categoria` int NULL DEFAULT NULL,
  `id_presentacion` int NULL DEFAULT NULL,
  `stock_minimo` int NULL DEFAULT 0,
  `stock_maximo` int NULL DEFAULT 0,
  `cantidad` int NULL DEFAULT 0,
  `imagen_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_marca`(`id_marca` ASC) USING BTREE,
  INDEX `id_categoria`(`id_categoria` ASC) USING BTREE,
  INDEX `id_presentacion`(`id_presentacion` ASC) USING BTREE,
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `producto_ibfk_3` FOREIGN KEY (`id_presentacion`) REFERENCES `presentacion` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of producto
-- ----------------------------
INSERT INTO `producto` VALUES (1, 'Velvet petals', 'Locion corporal de 236ml', 400.00, 1, 1, 1, 5, 50, 45, 'C:/Users/lariz/Downloads/Imagenes/lociones/locion2.jpg');
INSERT INTO `producto` VALUES (2, 'Aqua Kiss', 'Locion corporal de 236ml', 400.00, 1, 1, 1, 5, 50, 45, 'C:/xampp/htdocs/Proyecto_Redes/Imagenes/lociones/locion3.jpg');
INSERT INTO `producto` VALUES (3, 'Love Spell', 'Locion corporal de 236ml', 400.00, 1, 1, 1, 5, 50, 41, 'C:/xampp/htdocs/Proyecto_Redes/Imagenes/lociones/locion4.jpg');
INSERT INTO `producto` VALUES (4, 'Bare Vainilla', 'Locion corporal de 236ml', 400.00, 1, 1, 1, 5, 50, 45, 'C:/xampp/htdocs/Proyecto_Redes/Imagenes/lociones/locion1.jpeg');
INSERT INTO `producto` VALUES (5, 'Velvet petals', 'Bruma corporal de 250ml', 500.00, 1, 2, 2, 5, 50, 45, '');
INSERT INTO `producto` VALUES (6, 'Aqua kiss', 'Bruma corporal de 250ml', 500.00, 1, 2, 2, 5, 50, 45, '');
INSERT INTO `producto` VALUES (7, 'Love Spell', 'Bruma corporal de 250ml', 500.00, 1, 2, 2, 5, 50, 45, '');
INSERT INTO `producto` VALUES (8, 'Bare vainilla', 'Bruma corporal de 250ml', 500.00, 1, 2, 2, 5, 50, 45, '');
INSERT INTO `producto` VALUES (9, 'Tarjetero de solapa', 'Tarjetero color rosa con solapa y llavero', 200.00, 1, 3, 3, 5, 50, 45, NULL);
INSERT INTO `producto` VALUES (10, 'Tarjetero con llavero', 'Tarjetero con llavero color negro', 200.00, 1, 3, 3, 5, 50, 45, NULL);
INSERT INTO `producto` VALUES (11, 'Billetera con cierre', 'Billetera pequeña color beige', 300.00, 1, 3, 3, 5, 50, 45, NULL);
INSERT INTO `producto` VALUES (12, 'LLavero en forma de corazon', 'Llavero color rosado con forma de corazon', 500.00, 1, 3, 3, 5, 50, 45, NULL);
INSERT INTO `producto` VALUES (13, 'Bandolera con corazon', 'Bolso tipo bandolera color beige con piedras', 1403.00, 1, 4, 3, 5, 50, 45, NULL);
INSERT INTO `producto` VALUES (14, 'Estuche de maquillaje', 'Estuche de maquillaje estilo animal print', 600.00, 1, 4, 3, 5, 50, 45, NULL);
INSERT INTO `producto` VALUES (15, 'Cartera satchel', 'Bolso satchel color beige', 1700.00, 1, 4, 3, 5, 50, 0, NULL);
INSERT INTO `producto` VALUES (16, 'Bolso pequeño VS', 'Bolso pequeño color caramelo', 1100.00, 1, 4, 3, 5, 50, 45, NULL);
INSERT INTO `producto` VALUES (17, 'Bolso bombonera', 'Bolso pequeño color beige y cafe', 1300.00, 1, 4, 3, 5, 50, 45, NULL);
INSERT INTO `producto` VALUES (18, 'Bolso bandolera de corazon', 'Bolso bandolera de corazon', 1300.00, 1, 4, 3, 5, 50, 45, NULL);
INSERT INTO `producto` VALUES (19, 'Kit de labiales de sabores', 'Estuche de 5 labiales con color y sabor', 700.00, 1, 5, 4, 5, 50, 45, NULL);
INSERT INTO `producto` VALUES (20, 'Kit de cuidado para labios', 'Set de mascarillas para labios', 700.00, 1, 5, 4, 5, 50, 45, NULL);
INSERT INTO `producto` VALUES (21, 'Exfoliante labial', 'Exfoliante de azucar para labios', 240.00, 1, 5, 4, 5, 50, 45, NULL);
INSERT INTO `producto` VALUES (22, 'Bufanda', 'Bufanda acanalada', 300.00, 2, 3, 3, 5, 50, 45, NULL);
INSERT INTO `producto` VALUES (24, 'Hola', 'no hay', 5.00, 1, 1, 1, 2, 10, 0, NULL);

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `correo_electronico` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contraseña` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `nombre_usuario`(`nombre_usuario` ASC) USING BTREE,
  UNIQUE INDEX `correo_electronico`(`correo_electronico` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES (1, 'Astrit Lariza', 'lariza@gmail.com', '123');
INSERT INTO `usuario` VALUES (2, 'Juan', 'juan@gmail.com', '1234');
INSERT INTO `usuario` VALUES (3, 'lariza', 'astrit@gmail.com', '$2y$10$UH7FN9.z64aDc3V6vGfNt.vas9XnHBq9seJuC7VroU5L8rBIvgTaa');
INSERT INTO `usuario` VALUES (4, 'juana', 'juana@gmail.com', '$2y$10$m7LICI2FrJn8WVnxrvccv.saCHmACf.yo3t/4f1e4m.fpu799y45u');
INSERT INTO `usuario` VALUES (5, 'pepe', 'hola@gmail.com', '$2y$10$idTfYU7ZvDvB3CbkETCXZe/NKBYbFvHboK.j4mmoe6tUVT2OFR6Ii');
INSERT INTO `usuario` VALUES (6, 'Astrit', 'astrit24@gmail.com', '$2y$10$22hi//spJ7HCQQxYUoy04Ovj8sJ/aYJx4r2vEd.NGm9gFq7x2aTCW');

-- ----------------------------
-- Triggers structure for table detalleventa
-- ----------------------------
DROP TRIGGER IF EXISTS `actualizar_inventario`;
delimiter ;;
CREATE TRIGGER `actualizar_inventario` AFTER INSERT ON `detalleventa` FOR EACH ROW BEGIN
    -- Update the inventory of the product
    UPDATE producto
    SET cantidad = cantidad - NEW.cantidad
    WHERE id = NEW.id_producto;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
