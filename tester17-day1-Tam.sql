create database tester17;
use tester17;

CREATE TABLE `department` (
  `departmentID` int NOT NULL AUTO_INCREMENT,
  `departmentName` varchar(45) NOT NULL,
  PRIMARY KEY (`departmentID`)
);

CREATE TABLE `GROUP` (
  `GROUPID` int NOT NULL AUTO_INCREMENT,
  `GROUPNAME` varchar(45) NOT NULL,
  `creatorID` varchar(45) NOT NULL,
  `creatordate` datetime NOT NULL,
  PRIMARY KEY (`GROUPID`)
);

CREATE TABLE `position` (
  `positionID` int NOT NULL AUTO_INCREMENT,
  `position name` varchar(45) NOT NULL,
  PRIMARY KEY (`positionID`)
);

CREATE TABLE `typequestion` (
  `typeID` int NOT NULL AUTO_INCREMENT,
  `TYPENAME` varchar(45) NOT NULL,
  PRIMARY KEY (`typeID`)
);

CREATE TABLE `CategoryQuestion` (
  `categoryID` int NOT NULL AUTO_INCREMENT,
  `CategoryNAME` varchar(45) NOT NULL,
  PRIMARY KEY (`categoryID`)
);

CREATE TABLE `account` (
  `accountID` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `fullname` varchar(45) NOT NULL,
  `departmentID` int NOT NULL,
  `positionID` int DEFAULT NULL,
  `CREATEDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`accountID`),
  KEY `departmentID_idx` (`departmentID`),
  KEY `fk_positionID_idx` (`positionID`),
  CONSTRAINT `fk_departmentID` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentID`),
  CONSTRAINT `fk_positionID` FOREIGN KEY (`positionID`) REFERENCES `position` (`positionID`)
);

CREATE TABLE `ANSWER` (
  `idANSWER` int NOT NULL,
  `CONTENT` varchar(45) NOT NULL,
  `QUESTIONID` int NOT NULL,
  `ISCORRECT` tinyint(1) NOT NULL,
  PRIMARY KEY (`idANSWER`)
);


CREATE TABLE `EXAM` (
  `EXAMID` int NOT NULL AUTO_INCREMENT,
  `CODE` varchar(45) NOT NULL,
  `TILE` varchar(45) NOT NULL,
  `CATEGORYID` int NOT NULL,
  `DURATION` int NOT NULL,
  `CREATORID` int NOT NULL,
  `CREATEDATE` datetime NOT NULL,
  PRIMARY KEY (`EXAMID`),
  KEY `fk_category _idx` (`CATEGORYID`),
  KEY `fk_creator_idx` (`CREATORID`),
  CONSTRAINT `fk_exam_account` FOREIGN KEY (`CREATORID`) REFERENCES `account` (`accountID`),
  CONSTRAINT `fk_exam_cat` FOREIGN KEY (`CATEGORYID`) REFERENCES `CategoryQuestion` (`categoryID`)
);

CREATE TABLE `groupaccount` (
  `groupID` int NOT NULL AUTO_INCREMENT,
  `AccountID` int NOT NULL,
  `Jointdate` datetime NOT NULL,
  PRIMARY KEY (`groupID`),
  KEY `fk_account_idx` (`AccountID`),
  CONSTRAINT `fk_account` FOREIGN KEY (`AccountID`) REFERENCES `account` (`accountID`),
  CONSTRAINT `fk_group` FOREIGN KEY (`groupID`) REFERENCES `GROUP` (`GROUPID`)
);

CREATE TABLE `QUESTION` (
  `idQUESTION` int NOT NULL AUTO_INCREMENT,
  `CONTENT` varchar(300) NOT NULL,
  `CATEGORYID` int NOT NULL,
  `TYPEID` int NOT NULL,
  `CREATORID` int NOT NULL,
  `CREATDATE` datetime NOT NULL,
  PRIMARY KEY (`idQUESTION`),
  KEY `fk_category_idx` (`CATEGORYID`),
  KEY `fk_type_idx` (`TYPEID`),
  KEY `fk_creator_idx` (`CREATORID`),
  CONSTRAINT `fk_category` FOREIGN KEY (`CATEGORYID`) REFERENCES `CategoryQuestion` (`categoryID`),
  CONSTRAINT `fk_creator` FOREIGN KEY (`CREATORID`) REFERENCES `GROUP` (`GROUPID`),
  CONSTRAINT `fk_type` FOREIGN KEY (`TYPEID`) REFERENCES `typequestion` (`typeID`)
);

CREATE TABLE `EXAMQUESTION` (
  `EXAMID` int NOT NULL AUTO_INCREMENT,
  `QUESTIONID` int NOT NULL,
  PRIMARY KEY (`EXAMID`),
  KEY `fk_eq_q_idx` (`QUESTIONID`),
  CONSTRAINT `fk_eq_exam` FOREIGN KEY (`EXAMID`) REFERENCES `EXAM` (`EXAMID`),
  CONSTRAINT `fk_eq_q` FOREIGN KEY (`QUESTIONID`) REFERENCES `QUESTION` (`idQUESTION`)
);
