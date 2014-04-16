-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.20a-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema thesis
--

CREATE DATABASE IF NOT EXISTS thesis;
USE thesis;

--
-- Definition of table `billassocbdown`
--

DROP TABLE IF EXISTS `billassocbdown`;
CREATE TABLE `billassocbdown` (
  `subid` int(10) unsigned NOT NULL auto_increment,
  `subtotalName` varchar(45) NOT NULL,
  `subtotalamount` double NOT NULL,
  `subtotaltype` varchar(45) NOT NULL,
  PRIMARY KEY  (`subid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billassocbdown`
--

/*!40000 ALTER TABLE `billassocbdown` DISABLE KEYS */;
INSERT INTO `billassocbdown` (`subid`,`subtotalName`,`subtotalamount`,`subtotaltype`) VALUES 
 (1,'garbage',40,'FLAT RATE'),
 (2,'salary',30,'PER SQM');
/*!40000 ALTER TABLE `billassocbdown` ENABLE KEYS */;


--
-- Definition of table `billchargesbdown`
--

DROP TABLE IF EXISTS `billchargesbdown`;
CREATE TABLE `billchargesbdown` (
  `pid` int(10) unsigned NOT NULL auto_increment,
  `issueID` varchar(45) NOT NULL,
  `chargename` varchar(200) NOT NULL,
  `chargeamt` double NOT NULL,
  `chargecomptype` varchar(200) NOT NULL,
  `chargebilltype` varchar(200) NOT NULL,
  PRIMARY KEY  (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billchargesbdown`
--

/*!40000 ALTER TABLE `billchargesbdown` DISABLE KEYS */;
INSERT INTO `billchargesbdown` (`pid`,`issueID`,`chargename`,`chargeamt`,`chargecomptype`,`chargebilltype`) VALUES 
 (1,'1','garbage',40,'FLAT RATE','Association Due'),
 (2,'1','salary',30,'PER SQM','Association Due');
/*!40000 ALTER TABLE `billchargesbdown` ENABLE KEYS */;


--
-- Definition of table `billelec`
--

DROP TABLE IF EXISTS `billelec`;
CREATE TABLE `billelec` (
  `bid` int(10) unsigned NOT NULL auto_increment,
  `elecName` varchar(450) NOT NULL,
  `elecFee` double NOT NULL,
  `efeecomptype` varchar(45) NOT NULL,
  PRIMARY KEY  (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billelec`
--

/*!40000 ALTER TABLE `billelec` DISABLE KEYS */;
/*!40000 ALTER TABLE `billelec` ENABLE KEYS */;


--
-- Definition of table `billissue`
--

DROP TABLE IF EXISTS `billissue`;
CREATE TABLE `billissue` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `stat` varchar(45) NOT NULL,
  `sdate` timestamp NOT NULL default '0000-00-00 00:00:00',
  `edate` timestamp NOT NULL default '0000-00-00 00:00:00',
  `type` varchar(45) NOT NULL,
  `basecharge` double default NULL,
  `ameasure` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billissue`
--

/*!40000 ALTER TABLE `billissue` DISABLE KEYS */;
INSERT INTO `billissue` (`id`,`stat`,`sdate`,`edate`,`type`,`basecharge`,`ameasure`) VALUES 
 (1,'Issued','2008-11-03 00:00:00','2008-12-03 00:00:00','Assoc',100,'SQM');
/*!40000 ALTER TABLE `billissue` ENABLE KEYS */;


--
-- Definition of table `billpenalty`
--

DROP TABLE IF EXISTS `billpenalty`;
CREATE TABLE `billpenalty` (
  `bid` int(10) unsigned NOT NULL auto_increment,
  `penaltyname` varchar(205) NOT NULL,
  `penaltyamt` double NOT NULL,
  `penaltymeasure` varchar(200) NOT NULL,
  PRIMARY KEY  (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billpenalty`
--

/*!40000 ALTER TABLE `billpenalty` DISABLE KEYS */;
INSERT INTO `billpenalty` (`bid`,`penaltyname`,`penaltyamt`,`penaltymeasure`) VALUES 
 (1,'vandalism',5000,'FLAT');
/*!40000 ALTER TABLE `billpenalty` ENABLE KEYS */;


--
-- Definition of table `billpenaltymisc`
--

DROP TABLE IF EXISTS `billpenaltymisc`;
CREATE TABLE `billpenaltymisc` (
  `bid` int(10) unsigned NOT NULL auto_increment,
  `dueName` varchar(2000) NOT NULL,
  `feeamt` double NOT NULL,
  `residentName` varchar(205) default NULL,
  `dDate` timestamp NOT NULL default '0000-00-00 00:00:00',
  `residentID` int(10) unsigned default NULL,
  `familyHeadID` int(10) unsigned default NULL,
  `type` varchar(200) NOT NULL,
  `lotid` int(10) unsigned default NULL,
  `billid` int(10) unsigned default NULL,
  PRIMARY KEY  (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billpenaltymisc`
--

/*!40000 ALTER TABLE `billpenaltymisc` DISABLE KEYS */;
INSERT INTO `billpenaltymisc` (`bid`,`dueName`,`feeamt`,`residentName`,`dDate`,`residentID`,`familyHeadID`,`type`,`lotid`,`billid`) VALUES 
 (1,'new streetlights',150,NULL,'2008-12-02 17:36:21',NULL,NULL,'Misc Res',NULL,NULL),
 (2,'vandalism',5000,'Jemuel Dalino','2008-12-02 17:55:25',3,0,'Penalty Flat',1,NULL);
/*!40000 ALTER TABLE `billpenaltymisc` ENABLE KEYS */;


--
-- Definition of table `billpermits`
--

DROP TABLE IF EXISTS `billpermits`;
CREATE TABLE `billpermits` (
  `bid` int(10) unsigned NOT NULL auto_increment,
  `permitID` int(10) unsigned default NULL,
  `permitDate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `residentID` int(10) unsigned NOT NULL,
  `residentName` varchar(205) NOT NULL,
  `familyHeadID` int(10) unsigned NOT NULL,
  `permitfee` double NOT NULL,
  `permitName` varchar(200) NOT NULL,
  `lotid` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billpermits`
--

/*!40000 ALTER TABLE `billpermits` DISABLE KEYS */;
/*!40000 ALTER TABLE `billpermits` ENABLE KEYS */;


--
-- Definition of table `billreserve`
--

DROP TABLE IF EXISTS `billreserve`;
CREATE TABLE `billreserve` (
  `bid` int(10) unsigned NOT NULL auto_increment,
  `reserveID` int(10) unsigned default NULL,
  `reserveDate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `residentID` int(10) unsigned NOT NULL,
  `residentName` varchar(205) NOT NULL,
  `familyHeadID` int(10) unsigned NOT NULL,
  `reserveFee` double NOT NULL,
  `reserveName` varchar(200) NOT NULL,
  `lotid` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billreserve`
--

/*!40000 ALTER TABLE `billreserve` DISABLE KEYS */;
/*!40000 ALTER TABLE `billreserve` ENABLE KEYS */;


--
-- Definition of table `billresident`
--

DROP TABLE IF EXISTS `billresident`;
CREATE TABLE `billresident` (
  `bid` int(10) unsigned NOT NULL auto_increment,
  `residentID` int(10) unsigned NOT NULL,
  `billtotal` double NOT NULL,
  `status` varchar(45) NOT NULL,
  `residentName` varchar(45) NOT NULL,
  `watersubtotl` double default NULL,
  `penaltymiscsubtotl` double default NULL,
  `elecsubtotl` double default NULL,
  `reservesubtotl` double default NULL,
  `permitsubtotl` double default NULL,
  `assocduessubtotl` double default NULL,
  `billType` varchar(45) NOT NULL,
  `billWReading` int(10) unsigned default NULL,
  `billEReading` int(10) unsigned default NULL,
  `lotID` int(10) unsigned NOT NULL,
  `issueID` int(10) unsigned NOT NULL,
  `billNotice` timestamp NOT NULL default '0000-00-00 00:00:00',
  `pymttype` varchar(45) default NULL,
  `balance` double default NULL,
  `change` double default NULL,
  PRIMARY KEY  (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billresident`
--

/*!40000 ALTER TABLE `billresident` DISABLE KEYS */;
INSERT INTO `billresident` (`bid`,`residentID`,`billtotal`,`status`,`residentName`,`watersubtotl`,`penaltymiscsubtotl`,`elecsubtotl`,`reservesubtotl`,`permitsubtotl`,`assocduessubtotl`,`billType`,`billWReading`,`billEReading`,`lotID`,`issueID`,`billNotice`,`pymttype`,`balance`,`change`) VALUES 
 (1,3,65040.0066666667,'unpaid','Jemuel Dalino',NULL,0.00666666666666667,NULL,0,0,65040,'Assoc',NULL,NULL,1,1,'2008-12-07 00:00:00',NULL,65040.0066666667,NULL),
 (2,4,26040.0066666667,'unpaid','Paolo Domingo',NULL,0.00666666666666667,NULL,0,0,26040,'Assoc',NULL,NULL,2,1,'2008-12-07 00:00:00',NULL,26040.0066666667,NULL),
 (3,9,13040.0066666667,'unpaid','Ace Subido',NULL,0.00666666666666667,NULL,0,0,13040,'Assoc',NULL,NULL,3,1,'2008-12-07 00:00:00',NULL,13040.0066666667,NULL),
 (4,10,65040.0066666667,'unpaid','Jay-Robert Tuason',NULL,0.00666666666666667,NULL,0,0,65040,'Assoc',NULL,NULL,4,1,'2008-12-07 00:00:00',NULL,65040.0066666667,NULL);
/*!40000 ALTER TABLE `billresident` ENABLE KEYS */;


--
-- Definition of table `billsettings`
--

DROP TABLE IF EXISTS `billsettings`;
CREATE TABLE `billsettings` (
  `bId` int(10) unsigned NOT NULL auto_increment,
  `cutOffDate` int(10) unsigned default '0',
  `delDate` int(10) unsigned default '0',
  `waterpercube` double default '0',
  `elecperkwh` double default '0',
  `water` varchar(45) default '0',
  `elec` varchar(45) default '0',
  `assocdue` double default '0',
  `penalty` varchar(45) default NULL,
  `miscalleneous` varchar(45) default NULL,
  `aduemeasureunit` varchar(45) default NULL,
  `wcutdate` int(10) unsigned default NULL,
  `wduedate` int(10) unsigned default NULL,
  `ecutdate` int(10) unsigned default NULL,
  `eduedate` int(10) unsigned default NULL,
  PRIMARY KEY  (`bId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billsettings`
--

/*!40000 ALTER TABLE `billsettings` DISABLE KEYS */;
INSERT INTO `billsettings` (`bId`,`cutOffDate`,`delDate`,`waterpercube`,`elecperkwh`,`water`,`elec`,`assocdue`,`penalty`,`miscalleneous`,`aduemeasureunit`,`wcutdate`,`wduedate`,`ecutdate`,`eduedate`) VALUES 
 (1,3,4,660,600,'No','No',100,'Enabled','Enabled','SQM',1,1,1,1);
/*!40000 ALTER TABLE `billsettings` ENABLE KEYS */;


--
-- Definition of table `billwater`
--

DROP TABLE IF EXISTS `billwater`;
CREATE TABLE `billwater` (
  `bid` int(10) unsigned NOT NULL auto_increment,
  `wfee` double NOT NULL,
  `wname` varchar(450) NOT NULL,
  `wfeecomptype` varchar(45) NOT NULL,
  PRIMARY KEY  (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billwater`
--

/*!40000 ALTER TABLE `billwater` DISABLE KEYS */;
/*!40000 ALTER TABLE `billwater` ENABLE KEYS */;


--
-- Definition of table `blocks`
--

DROP TABLE IF EXISTS `blocks`;
CREATE TABLE `blocks` (
  `bid` int(10) unsigned NOT NULL auto_increment,
  `phasebd` int(10) unsigned NOT NULL,
  `blockflr` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blocks`
--

/*!40000 ALTER TABLE `blocks` DISABLE KEYS */;
INSERT INTO `blocks` (`bid`,`phasebd`,`blockflr`) VALUES 
 (1,1,2),
 (2,2,2);
/*!40000 ALTER TABLE `blocks` ENABLE KEYS */;


--
-- Definition of table `bulletinapproved`
--

DROP TABLE IF EXISTS `bulletinapproved`;
CREATE TABLE `bulletinapproved` (
  `appid` int(10) unsigned NOT NULL default '0',
  `status` varchar(45) default NULL,
  PRIMARY KEY  (`appid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bulletinapproved`
--

/*!40000 ALTER TABLE `bulletinapproved` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulletinapproved` ENABLE KEYS */;


--
-- Definition of table `bulletinboard`
--

DROP TABLE IF EXISTS `bulletinboard`;
CREATE TABLE `bulletinboard` (
  `bulletinId` int(10) unsigned NOT NULL,
  `bulletinContent` longtext NOT NULL,
  `poster` varchar(45) NOT NULL,
  `status` varchar(45) default NULL,
  `bulletinTitle` varchar(45) default NULL,
  `bulletinDate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `category` varchar(45) default NULL,
  `locked` varchar(45) default NULL,
  PRIMARY KEY  (`bulletinId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bulletinboard`
--

/*!40000 ALTER TABLE `bulletinboard` DISABLE KEYS */;
INSERT INTO `bulletinboard` (`bulletinId`,`bulletinContent`,`poster`,`status`,`bulletinTitle`,`bulletinDate`,`category`,`locked`) VALUES 
 (1,'tol','Staff','Latest','Maintenance','2008-11-12 06:48:52','site','Yes');
/*!40000 ALTER TABLE `bulletinboard` ENABLE KEYS */;


--
-- Definition of table `bulletincategory`
--

DROP TABLE IF EXISTS `bulletincategory`;
CREATE TABLE `bulletincategory` (
  `catId` int(10) unsigned NOT NULL auto_increment,
  `catName` varchar(45) default NULL,
  `description` longtext,
  PRIMARY KEY  (`catId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bulletincategory`
--

/*!40000 ALTER TABLE `bulletincategory` DISABLE KEYS */;
INSERT INTO `bulletincategory` (`catId`,`catName`,`description`) VALUES 
 (7,'Beautification',NULL);
/*!40000 ALTER TABLE `bulletincategory` ENABLE KEYS */;


--
-- Definition of table `bulletinhandlers`
--

DROP TABLE IF EXISTS `bulletinhandlers`;
CREATE TABLE `bulletinhandlers` (
  `bId` int(10) unsigned NOT NULL,
  `comDivId` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`bId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bulletinhandlers`
--

/*!40000 ALTER TABLE `bulletinhandlers` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulletinhandlers` ENABLE KEYS */;


--
-- Definition of table `commandiv`
--

DROP TABLE IF EXISTS `commandiv`;
CREATE TABLE `commandiv` (
  `comDivId` int(10) unsigned NOT NULL auto_increment,
  `comDivisionName` varchar(50) default NULL,
  `available` varchar(45) default NULL,
  PRIMARY KEY  (`comDivId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `commandiv`
--

/*!40000 ALTER TABLE `commandiv` DISABLE KEYS */;
INSERT INTO `commandiv` (`comDivId`,`comDivisionName`,`available`) VALUES 
 (1,'Beautification','available'),
 (2,'Security','available'),
 (3,'Security2','not'),
 (4,'a','available');
/*!40000 ALTER TABLE `commandiv` ENABLE KEYS */;


--
-- Definition of table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `commentid` int(10) unsigned NOT NULL auto_increment,
  `parentBulletId` int(10) unsigned NOT NULL,
  `poster` varchar(45) NOT NULL,
  `commentContent` longtext NOT NULL,
  `commentDate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`commentid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;


--
-- Definition of table `director`
--

DROP TABLE IF EXISTS `director`;
CREATE TABLE `director` (
  `dirId` int(10) unsigned NOT NULL auto_increment,
  `chargeOf` int(10) unsigned default NULL,
  `DirName` varchar(255) default NULL,
  `resId` int(10) unsigned default NULL,
  `status` varchar(45) default NULL,
  `start` timestamp NOT NULL default '0000-00-00 00:00:00',
  `end` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`dirId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `director`
--

/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` (`dirId`,`chargeOf`,`DirName`,`resId`,`status`,`start`,`end`) VALUES 
 (3,1,'Jemuel Dalino',3,'Serving','2008-12-01 00:00:00','2009-12-01 00:00:00'),
 (4,2,'Paolo Domingo',4,'Serving','2008-12-01 00:00:00','2009-12-01 00:00:00');
/*!40000 ALTER TABLE `director` ENABLE KEYS */;


--
-- Definition of table `elecchoices`
--

DROP TABLE IF EXISTS `elecchoices`;
CREATE TABLE `elecchoices` (
  `ElecCId` int(10) unsigned NOT NULL auto_increment,
  `ElecEId` int(10) unsigned default NULL,
  `ElecResId` int(10) unsigned default NULL,
  `ElecVoteNum` int(10) unsigned default NULL,
  PRIMARY KEY  (`ElecCId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `elecchoices`
--

/*!40000 ALTER TABLE `elecchoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `elecchoices` ENABLE KEYS */;


--
-- Definition of table `electable`
--

DROP TABLE IF EXISTS `electable`;
CREATE TABLE `electable` (
  `ElecId` int(10) unsigned NOT NULL auto_increment,
  `ElecName` varchar(45) default NULL,
  `ElecSDate` timestamp NOT NULL default '0000-00-00 00:00:00',
  `ElecCDate` timestamp NOT NULL default '0000-00-00 00:00:00',
  `ElecStatus` varchar(45) default NULL,
  `ElecDesc` varchar(255) default NULL,
  `ElecNomId` int(10) unsigned default NULL,
  `JustClosed` varchar(45) default ' ',
  PRIMARY KEY  (`ElecId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `electable`
--

/*!40000 ALTER TABLE `electable` DISABLE KEYS */;
/*!40000 ALTER TABLE `electable` ENABLE KEYS */;


--
-- Definition of table `elecvote`
--

DROP TABLE IF EXISTS `elecvote`;
CREATE TABLE `elecvote` (
  `ElecVoteId` int(10) unsigned NOT NULL auto_increment,
  `residentID` int(10) unsigned default NULL,
  `nomChoice` int(10) unsigned default NULL,
  `ElecId` int(10) unsigned default NULL,
  PRIMARY KEY  (`ElecVoteId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `elecvote`
--

/*!40000 ALTER TABLE `elecvote` DISABLE KEYS */;
/*!40000 ALTER TABLE `elecvote` ENABLE KEYS */;


--
-- Definition of table `eventhandlers`
--

DROP TABLE IF EXISTS `eventhandlers`;
CREATE TABLE `eventhandlers` (
  `eId` int(10) unsigned NOT NULL,
  `comDivId` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`eId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eventhandlers`
--

/*!40000 ALTER TABLE `eventhandlers` DISABLE KEYS */;
INSERT INTO `eventhandlers` (`eId`,`comDivId`) VALUES 
 (0,1),
 (1,2),
 (2,3),
 (3,4);
/*!40000 ALTER TABLE `eventhandlers` ENABLE KEYS */;


--
-- Definition of table `eventstable`
--

DROP TABLE IF EXISTS `eventstable`;
CREATE TABLE `eventstable` (
  `EventID` int(10) unsigned NOT NULL auto_increment,
  `ResidentID` int(10) unsigned default NULL,
  `Status` varchar(45) default NULL,
  `EvtDetails` varchar(2000) default NULL,
  PRIMARY KEY  (`EventID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eventstable`
--

/*!40000 ALTER TABLE `eventstable` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventstable` ENABLE KEYS */;


--
-- Definition of table `facility`
--

DROP TABLE IF EXISTS `facility`;
CREATE TABLE `facility` (
  `FacilityId` int(10) NOT NULL auto_increment,
  `Type` varchar(255) default NULL,
  `Location` varchar(255) default NULL,
  `Availability` varchar(255) default NULL,
  `AllowRes` varchar(255) default NULL,
  `FaciName` varchar(255) default NULL,
  `Capacity` int(10) default NULL,
  `LandArea` int(10) default NULL,
  `UsageFee` int(10) default NULL,
  `ReservationFee` int(10) default NULL,
  `OpTime` timestamp NOT NULL default '2007-07-12 06:00:00',
  `ClTime` timestamp NOT NULL default '2007-07-12 06:00:00',
  `advDaysRes` int(10) unsigned default NULL,
  `hoursperDay` int(10) unsigned default NULL,
  PRIMARY KEY  (`FacilityId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `facility`
--

/*!40000 ALTER TABLE `facility` DISABLE KEYS */;
INSERT INTO `facility` (`FacilityId`,`Type`,`Location`,`Availability`,`AllowRes`,`FaciName`,`Capacity`,`LandArea`,`UsageFee`,`ReservationFee`,`OpTime`,`ClTime`,`advDaysRes`,`hoursperDay`) VALUES 
 (2,'Basketball court','1','available','No','Jordan Court',100,500,NULL,0,'2007-07-12 06:00:00','2007-07-12 06:00:00',NULL,NULL),
 (5,'Basketball court','1','available','Yes','Booty Court',100,1000,NULL,100,'2007-07-12 06:00:00','2007-07-12 06:00:00',NULL,NULL);
/*!40000 ALTER TABLE `facility` ENABLE KEYS */;


--
-- Definition of table `facilitytype`
--

DROP TABLE IF EXISTS `facilitytype`;
CREATE TABLE `facilitytype` (
  `TypeName` varchar(255) default NULL,
  `Availability` varchar(255) default NULL,
  `TypeId` int(10) NOT NULL,
  PRIMARY KEY  (`TypeId`),
  KEY `Id` (`TypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `facilitytype`
--

/*!40000 ALTER TABLE `facilitytype` DISABLE KEYS */;
INSERT INTO `facilitytype` (`TypeName`,`Availability`,`TypeId`) VALUES 
 ('Basketball court','available',1),
 ('Ballroom','available',2);
/*!40000 ALTER TABLE `facilitytype` ENABLE KEYS */;


--
-- Definition of table `lots`
--

DROP TABLE IF EXISTS `lots`;
CREATE TABLE `lots` (
  `lid` int(10) unsigned NOT NULL default '0',
  `rid` int(10) unsigned default NULL,
  `address` varchar(255) default NULL,
  `lotarea` int(10) unsigned default NULL,
  `status` varchar(200) NOT NULL default 'unoccupied',
  `blflid` int(10) unsigned default NULL,
  `phblid` int(10) unsigned default NULL,
  `lotNum` int(10) unsigned default NULL,
  PRIMARY KEY  (`lid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lots`
--

/*!40000 ALTER TABLE `lots` DISABLE KEYS */;
INSERT INTO `lots` (`lid`,`rid`,`address`,`lotarea`,`status`,`blflid`,`phblid`,`lotNum`) VALUES 
 (1,3,'Unit 1 Floor 1 Building 1',500,'Occupied',1,1,1),
 (2,4,'Unit 2 Floor 1 Building 1',200,'Occupied',1,1,2),
 (3,9,'Unit 1 Floor 2 Building 1',100,'Occupied',2,1,1),
 (4,10,'Unit 2 Floor 2 Building 1',500,'Occupied',2,1,2),
 (5,NULL,'Unit 1 Floor 1 Building 2',300,'unoccupied',1,2,1),
 (6,NULL,'Unit 2 Floor 1 Building 2',400,'unoccupied',1,2,2);
/*!40000 ALTER TABLE `lots` ENABLE KEYS */;


--
-- Definition of table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `messageId` int(10) unsigned NOT NULL auto_increment,
  `content` varchar(900) NOT NULL,
  `fromID` int(10) unsigned NOT NULL,
  `toID` int(10) unsigned NOT NULL,
  `fromName` varchar(200) NOT NULL,
  `toName` varchar(200) NOT NULL,
  `MTitle` varchar(200) NOT NULL,
  `isReplied` int(10) unsigned default NULL,
  `MDate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`messageId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` (`messageId`,`content`,`fromID`,`toID`,`fromName`,`toName`,`MTitle`,`isReplied`,`MDate`) VALUES 
 (1,'You have been invited to join the petition for the social group testing lang by Bulldog Las',6,1,'Bulldog Las','Jemuel Dalino','Social Group Petition Invitiation : testing lang',NULL,'2008-10-31 22:10:57'),
 (2,'You have been invited to join the petition for the social group testing lang by Bulldog Las',6,3,'Bulldog Las','Pogi Bilayo','Social Group Petition Invitiation : testing lang',NULL,'2008-10-31 22:10:57'),
 (3,'You have been invited to join the petition for the social group testing lang by Bulldog Las',6,4,'Bulldog Las','Mike Magat','Social Group Petition Invitiation : testing lang',NULL,'2008-11-01 20:15:03'),
 (4,'You have been invited to join the petition for the social group testing775757 by Pogita Po',7,1,'Pogita Po','Jemuel Dalino','Social Group Petition Invitiation : testing775757',NULL,'2008-11-04 13:19:08'),
 (5,'You have been invited to join the petition for the social group testing775757 by Pogita Po',7,6,'Pogita Po','Bulldog Las','Social Group Petition Invitiation : testing775757',NULL,'2008-11-04 13:19:09'),
 (6,'You have been invited to join the petition for the social group testing775757 by Pogita Po',7,8,'Pogita Po','Satanas Mansanas','Social Group Petition Invitiation : testing775757',NULL,'2008-11-04 13:19:09'),
 (7,'You have been invited to join the petition for the social group alagad ko mwahahaha by Satanas Mansanas',8,1,'Satanas Mansanas','Jemuel Dalino','Social Group Petition Invitiation : alagad ko mwahahaha',NULL,'2008-11-07 14:58:35'),
 (8,'You have been invited to join the petition for the social group alagad ko mwahahaha by Satanas Mansanas',8,6,'Satanas Mansanas','Bulldog Las','Social Group Petition Invitiation : alagad ko mwahahaha',NULL,'2008-11-07 14:58:35'),
 (9,'You have been invited to join the petition for the social group alagad ko mwahahaha by Satanas Mansanas',8,7,'Satanas Mansanas','Pogita Po','Social Group Petition Invitiation : alagad ko mwahahaha',NULL,'2008-11-07 14:58:35'),
 (10,'You have been invited to join the petition for the social group testing lang by Jemuel Dalino',1,8,'Jemuel Dalino','Satanas Mansanas','Social Group Petition Invitiation : testing lang',NULL,'2008-11-07 15:12:24'),
 (11,'You have been invited to join the petition for the social group testing lang by Jemuel Dalino',1,6,'Jemuel Dalino','Bulldog Las','Social Group Petition Invitiation : testing lang',NULL,'2008-11-07 15:12:24'),
 (12,'You have been invited to join the petition for the social group testing lang by Jemuel Dalino',1,7,'Jemuel Dalino','Pogita Po','Social Group Petition Invitiation : testing lang',NULL,'2008-11-07 15:12:24'),
 (13,'You have been invited to join the petition for the social group social group... by Pogi Bilayo',3,6,'Pogi Bilayo','Bulldog Las','Social Group Petition Invitiation : social group...',NULL,'2008-11-08 16:36:29'),
 (14,'You have been invited to join the petition for the social group social group... by Pogi Bilayo',3,7,'Pogi Bilayo','Pogita Po','Social Group Petition Invitiation : social group...',NULL,'2008-11-08 16:36:29'),
 (15,'You have been invited to join the petition for the social group social group... by Pogi Bilayo',3,8,'Pogi Bilayo','Satanas Mansanas','Social Group Petition Invitiation : social group...',NULL,'2008-11-08 16:36:29'),
 (16,'ayaw belat',3,6,'Pogi Bilayo','Bulldog Las','Re : Social Group Petition Invitiation : testing lang',NULL,'2008-11-11 23:15:20');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;


--
-- Definition of table `moderators`
--

DROP TABLE IF EXISTS `moderators`;
CREATE TABLE `moderators` (
  `modId` int(10) unsigned NOT NULL auto_increment,
  `category` varchar(45) default NULL,
  `username` varchar(45) default NULL,
  PRIMARY KEY  (`modId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `moderators`
--

/*!40000 ALTER TABLE `moderators` DISABLE KEYS */;
/*!40000 ALTER TABLE `moderators` ENABLE KEYS */;


--
-- Definition of table `monthlybillextraexpenses`
--

DROP TABLE IF EXISTS `monthlybillextraexpenses`;
CREATE TABLE `monthlybillextraexpenses` (
  `mbee` int(10) unsigned NOT NULL default '0',
  `billBatch` int(10) unsigned default NULL,
  `expenseName` varchar(45) default NULL,
  `amount` int(10) unsigned default NULL,
  PRIMARY KEY  (`mbee`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `monthlybillextraexpenses`
--

/*!40000 ALTER TABLE `monthlybillextraexpenses` DISABLE KEYS */;
INSERT INTO `monthlybillextraexpenses` (`mbee`,`billBatch`,`expenseName`,`amount`) VALUES 
 (0,2,'Street Light',500);
/*!40000 ALTER TABLE `monthlybillextraexpenses` ENABLE KEYS */;


--
-- Definition of table `monthlybillvalues`
--

DROP TABLE IF EXISTS `monthlybillvalues`;
CREATE TABLE `monthlybillvalues` (
  `billBatch` int(10) unsigned NOT NULL default '0',
  `mnBill` int(10) unsigned default NULL,
  `comMeter` int(10) unsigned default NULL,
  `masterTax` int(10) unsigned default NULL,
  `security` int(10) unsigned default NULL,
  `garbage` int(10) unsigned default NULL,
  `salary` int(10) unsigned default NULL,
  PRIMARY KEY  (`billBatch`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `monthlybillvalues`
--

/*!40000 ALTER TABLE `monthlybillvalues` DISABLE KEYS */;
INSERT INTO `monthlybillvalues` (`billBatch`,`mnBill`,`comMeter`,`masterTax`,`security`,`garbage`,`salary`) VALUES 
 (1,50000,3300,50000,16000,500,50000),
 (2,50000,33000,50000,16000,5000,30000);
/*!40000 ALTER TABLE `monthlybillvalues` ENABLE KEYS */;


--
-- Definition of table `newsletter`
--

DROP TABLE IF EXISTS `newsletter`;
CREATE TABLE `newsletter` (
  `news_id` double default NULL,
  `author_id` double default NULL,
  `news_title` varchar(255) default NULL,
  `news_body` varchar(255) default NULL,
  `isApproved` varchar(5) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `newsletter`
--

/*!40000 ALTER TABLE `newsletter` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter` ENABLE KEYS */;


--
-- Definition of table `newsletterhandlers`
--

DROP TABLE IF EXISTS `newsletterhandlers`;
CREATE TABLE `newsletterhandlers` (
  `nId` int(10) unsigned NOT NULL,
  `comDivId` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`nId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `newsletterhandlers`
--

/*!40000 ALTER TABLE `newsletterhandlers` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletterhandlers` ENABLE KEYS */;


--
-- Definition of table `nomchoices`
--

DROP TABLE IF EXISTS `nomchoices`;
CREATE TABLE `nomchoices` (
  `NomChoiceId` int(10) unsigned NOT NULL auto_increment,
  `NomNomId` int(10) unsigned default NULL,
  `NomResId` int(10) unsigned default NULL,
  `NomVoteNum` int(10) unsigned default NULL,
  PRIMARY KEY  (`NomChoiceId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nomchoices`
--

/*!40000 ALTER TABLE `nomchoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `nomchoices` ENABLE KEYS */;


--
-- Definition of table `nominationtable`
--

DROP TABLE IF EXISTS `nominationtable`;
CREATE TABLE `nominationtable` (
  `NomId` int(10) unsigned NOT NULL auto_increment,
  `NomName` varchar(255) default NULL,
  `NomDesc` varchar(45) default NULL,
  `NomSDate` timestamp NOT NULL default '2000-01-01 06:00:00',
  `NomCDate` timestamp NOT NULL default '2000-01-01 06:00:00',
  `NomStatus` varchar(45) default NULL,
  `NomDivId` int(10) unsigned default NULL,
  `JustClosed` varchar(45) default NULL,
  PRIMARY KEY  (`NomId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nominationtable`
--

/*!40000 ALTER TABLE `nominationtable` DISABLE KEYS */;
/*!40000 ALTER TABLE `nominationtable` ENABLE KEYS */;


--
-- Definition of table `nomivote`
--

DROP TABLE IF EXISTS `nomivote`;
CREATE TABLE `nomivote` (
  `NomVote` int(10) unsigned NOT NULL auto_increment,
  `NomResId` int(10) unsigned default NULL,
  `NomResNom` int(10) unsigned default NULL,
  `NomNomId` int(10) unsigned default NULL,
  PRIMARY KEY  (`NomVote`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nomivote`
--

/*!40000 ALTER TABLE `nomivote` DISABLE KEYS */;
/*!40000 ALTER TABLE `nomivote` ENABLE KEYS */;


--
-- Definition of table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `notID` int(10) unsigned NOT NULL auto_increment,
  `resID` int(10) unsigned NOT NULL,
  `notmsg` varchar(5000) NOT NULL,
  `nottype` varchar(45) NOT NULL,
  `nottime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`notID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;


--
-- Definition of table `paymenthandlers`
--

DROP TABLE IF EXISTS `paymenthandlers`;
CREATE TABLE `paymenthandlers` (
  `pId` int(10) unsigned NOT NULL,
  `comDivId` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`pId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paymenthandlers`
--

/*!40000 ALTER TABLE `paymenthandlers` DISABLE KEYS */;
/*!40000 ALTER TABLE `paymenthandlers` ENABLE KEYS */;


--
-- Definition of table `permitcarstickertemplate`
--

DROP TABLE IF EXISTS `permitcarstickertemplate`;
CREATE TABLE `permitcarstickertemplate` (
  `Key` int(10) unsigned NOT NULL default '1',
  `VehicleType` varchar(45) NOT NULL,
  `Model` varchar(45) NOT NULL,
  `PlateNum` varchar(45) NOT NULL,
  `Color` varchar(45) NOT NULL,
  `SerialNum` varchar(45) NOT NULL,
  `ApplicationType` varchar(45) NOT NULL,
  `ORNum` varchar(45) NOT NULL,
  `StickNum` varchar(45) NOT NULL,
  `Date` varchar(45) NOT NULL,
  `ModelNum` varchar(45) NOT NULL,
  PRIMARY KEY  (`Key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permitcarstickertemplate`
--

/*!40000 ALTER TABLE `permitcarstickertemplate` DISABLE KEYS */;
INSERT INTO `permitcarstickertemplate` (`Key`,`VehicleType`,`Model`,`PlateNum`,`Color`,`SerialNum`,`ApplicationType`,`ORNum`,`StickNum`,`Date`,`ModelNum`) VALUES 
 (1,'Yes','Yes','Yes','Yes','Yes','Yes','Yes','Yes','Yes','Yes');
/*!40000 ALTER TABLE `permitcarstickertemplate` ENABLE KEYS */;


--
-- Definition of table `permitcheck`
--

DROP TABLE IF EXISTS `permitcheck`;
CREATE TABLE `permitcheck` (
  `pId` int(10) unsigned NOT NULL auto_increment,
  `permitName` varchar(255) NOT NULL,
  `field1` varchar(255) default NULL,
  `field2` varchar(255) default NULL,
  `field3` varchar(255) default NULL,
  `field4` varchar(255) default NULL,
  `field5` varchar(255) default NULL,
  `field6` varchar(255) default NULL,
  `field7` varchar(255) default NULL,
  `field8` varchar(255) default NULL,
  `field9` varchar(255) default NULL,
  `field10` varchar(255) default NULL,
  `field11` varchar(255) default NULL,
  `field12` varchar(255) default NULL,
  `field13` varchar(255) default NULL,
  `field14` varchar(255) default NULL,
  `field15` varchar(255) default NULL,
  `field16` varchar(255) default NULL,
  `field17` varchar(255) default NULL,
  `field18` varchar(255) default NULL,
  `field19` varchar(255) default NULL,
  `field20` varchar(255) default NULL,
  PRIMARY KEY  (`pId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permitcheck`
--

/*!40000 ALTER TABLE `permitcheck` DISABLE KEYS */;
INSERT INTO `permitcheck` (`pId`,`permitName`,`field1`,`field2`,`field3`,`field4`,`field5`,`field6`,`field7`,`field8`,`field9`,`field10`,`field11`,`field12`,`field13`,`field14`,`field15`,`field16`,`field17`,`field18`,`field19`,`field20`) VALUES 
 (2,'Car Sticker','on','on','on','on','on','on','on','null','null','null','null','null','null','null','null','null','null','null','null','null');
/*!40000 ALTER TABLE `permitcheck` ENABLE KEYS */;


--
-- Definition of table `permitconstructtemplate`
--

DROP TABLE IF EXISTS `permitconstructtemplate`;
CREATE TABLE `permitconstructtemplate` (
  `Key` int(10) unsigned NOT NULL default '1',
  `Company` varchar(45) NOT NULL,
  `ComCategory` varchar(45) NOT NULL,
  `ComLicenseNum` varchar(45) NOT NULL,
  `ComAddress` varchar(45) NOT NULL,
  `ComNum` varchar(45) NOT NULL,
  `ConstructType` varchar(45) NOT NULL,
  `InChargeName` varchar(45) NOT NULL,
  `InChargePRC` varchar(45) NOT NULL,
  `InChargeAddress` varchar(45) NOT NULL,
  `InChargeNum` varchar(45) NOT NULL,
  `EstCost` varchar(45) NOT NULL,
  `EstTime` varchar(45) NOT NULL,
  `AvailDocs` varchar(45) NOT NULL,
  `DTINum` varchar(45) NOT NULL,
  PRIMARY KEY  USING BTREE (`Key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permitconstructtemplate`
--

/*!40000 ALTER TABLE `permitconstructtemplate` DISABLE KEYS */;
INSERT INTO `permitconstructtemplate` (`Key`,`Company`,`ComCategory`,`ComLicenseNum`,`ComAddress`,`ComNum`,`ConstructType`,`InChargeName`,`InChargePRC`,`InChargeAddress`,`InChargeNum`,`EstCost`,`EstTime`,`AvailDocs`,`DTINum`) VALUES 
 (1,'Yes','Yes','Yes','Yes','Yes','Yes','Yes','Yes','Yes','Yes','Yes','Yes','Nope','Yes');
/*!40000 ALTER TABLE `permitconstructtemplate` ENABLE KEYS */;


--
-- Definition of table `permithandlers`
--

DROP TABLE IF EXISTS `permithandlers`;
CREATE TABLE `permithandlers` (
  `pId` int(10) unsigned NOT NULL,
  `comDivId` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`pId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permithandlers`
--

/*!40000 ALTER TABLE `permithandlers` DISABLE KEYS */;
INSERT INTO `permithandlers` (`pId`,`comDivId`) VALUES 
 (0,2),
 (1,3),
 (2,4),
 (3,5);
/*!40000 ALTER TABLE `permithandlers` ENABLE KEYS */;


--
-- Definition of table `permithousehelptemplate`
--

DROP TABLE IF EXISTS `permithousehelptemplate`;
CREATE TABLE `permithousehelptemplate` (
  `Key` int(10) unsigned NOT NULL default '1',
  `MaidName` varchar(45) NOT NULL,
  `MaidProvAddress` varchar(45) NOT NULL,
  `MaidCityAddress` varchar(45) NOT NULL,
  `BirthDate` varchar(45) NOT NULL,
  `CivilStatus` varchar(45) NOT NULL,
  `Height` varchar(45) NOT NULL,
  `Weight` varchar(45) NOT NULL,
  `WorkType` varchar(45) NOT NULL,
  `EmergName` varchar(45) NOT NULL,
  `EmergRelation` varchar(45) NOT NULL,
  `EmergNum` varchar(45) NOT NULL,
  `EmergAddress` varchar(45) NOT NULL,
  `MaidSalary` varchar(45) NOT NULL,
  PRIMARY KEY  (`Key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permithousehelptemplate`
--

/*!40000 ALTER TABLE `permithousehelptemplate` DISABLE KEYS */;
INSERT INTO `permithousehelptemplate` (`Key`,`MaidName`,`MaidProvAddress`,`MaidCityAddress`,`BirthDate`,`CivilStatus`,`Height`,`Weight`,`WorkType`,`EmergName`,`EmergRelation`,`EmergNum`,`EmergAddress`,`MaidSalary`) VALUES 
 (1,'Yes','Yes','Yes','Yes','Yes','Yes','Yes','Yes','Yes','Yes','Yes','Yes','Yes');
/*!40000 ALTER TABLE `permithousehelptemplate` ENABLE KEYS */;


--
-- Definition of table `permitresident`
--

DROP TABLE IF EXISTS `permitresident`;
CREATE TABLE `permitresident` (
  `pID` int(10) unsigned NOT NULL auto_increment,
  `permitID` int(10) unsigned default NULL,
  `resID` varchar(255) NOT NULL,
  `field1` timestamp NOT NULL default '2000-01-01 00:00:00',
  `field2` varchar(255) default NULL,
  `field3` varchar(255) default NULL,
  `field4` varchar(255) default NULL,
  `field5` varchar(255) default NULL,
  `field6` varchar(255) default NULL,
  `field7` varchar(255) default NULL,
  `field8` varchar(255) default NULL,
  `field9` varchar(255) default NULL,
  `field10` varchar(255) default NULL,
  `field11` varchar(255) default NULL,
  `field12` varchar(255) default NULL,
  `field13` varchar(255) default NULL,
  `field14` varchar(255) default NULL,
  `field15` varchar(255) default NULL,
  `field16` varchar(255) default NULL,
  `field17` varchar(255) default NULL,
  `field18` varchar(255) default NULL,
  `field19` varchar(255) default NULL,
  `field20` varchar(255) default NULL,
  `Status` varchar(255) default NULL,
  `permitApprove` timestamp NOT NULL default '2000-01-01 00:00:00',
  `permitReject` timestamp NOT NULL default '2000-01-01 00:00:00',
  `remark` varchar(511) default NULL,
  `path` varchar(255) default NULL,
  `view` varchar(45) default NULL,
  `pfee` double default NULL,
  `expiration` varchar(45) default NULL,
  `years` timestamp NOT NULL default '2000-01-01 00:00:00',
  PRIMARY KEY  (`pID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permitresident`
--

/*!40000 ALTER TABLE `permitresident` DISABLE KEYS */;
INSERT INTO `permitresident` (`pID`,`permitID`,`resID`,`field1`,`field2`,`field3`,`field4`,`field5`,`field6`,`field7`,`field8`,`field9`,`field10`,`field11`,`field12`,`field13`,`field14`,`field15`,`field16`,`field17`,`field18`,`field19`,`field20`,`Status`,`permitApprove`,`permitReject`,`remark`,`path`,`view`,`pfee`,`expiration`,`years`) VALUES 
 (2,2,'3','2008-12-02 00:00:00','Make-a','Model-a','Model Number-a','Plate Number-a','Color-a','Serial Number-a','','','','','','','','','','','','','','Approved','2008-12-02 00:00:00','2000-01-01 00:00:00',NULL,'','True',100,'Expired','2009-12-01 00:00:00');
/*!40000 ALTER TABLE `permitresident` ENABLE KEYS */;


--
-- Definition of table `permits`
--

DROP TABLE IF EXISTS `permits`;
CREATE TABLE `permits` (
  `pId` int(10) unsigned NOT NULL auto_increment,
  `permitName` varchar(45) NOT NULL,
  `field1` varchar(255) default NULL,
  `field2` varchar(255) default NULL,
  `field3` varchar(255) default NULL,
  `field4` varchar(255) default NULL,
  `field5` varchar(255) default NULL,
  `field6` varchar(255) default NULL,
  `field7` varchar(255) default NULL,
  `field8` varchar(255) default NULL,
  `field9` varchar(255) default NULL,
  `field10` varchar(255) default NULL,
  `field11` varchar(255) default NULL,
  `field12` varchar(255) default NULL,
  `field13` varchar(255) default NULL,
  `field14` varchar(255) default NULL,
  `field15` varchar(255) default NULL,
  `field16` varchar(255) default NULL,
  `field17` varchar(255) default NULL,
  `field18` varchar(255) default NULL,
  `field19` varchar(255) default NULL,
  `field20` varchar(255) default NULL,
  `Status` varchar(45) default NULL,
  `Rules` varchar(511) default NULL,
  `Path` varchar(255) default NULL,
  `pfee` double default NULL,
  `years` int(10) unsigned default NULL,
  PRIMARY KEY  (`pId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permits`
--

/*!40000 ALTER TABLE `permits` DISABLE KEYS */;
INSERT INTO `permits` (`pId`,`permitName`,`field1`,`field2`,`field3`,`field4`,`field5`,`field6`,`field7`,`field8`,`field9`,`field10`,`field11`,`field12`,`field13`,`field14`,`field15`,`field16`,`field17`,`field18`,`field19`,`field20`,`Status`,`Rules`,`Path`,`pfee`,`years`) VALUES 
 (2,'Car Sticker','Date of Application','Make','Model','Model Number','Plate Number','Color','Serial Number','','','','','','','','','','','','','','No','a','Admin-4-',100,1);
/*!40000 ALTER TABLE `permits` ENABLE KEYS */;


--
-- Definition of table `permittemplate`
--

DROP TABLE IF EXISTS `permittemplate`;
CREATE TABLE `permittemplate` (
  `pId` int(10) unsigned NOT NULL auto_increment,
  `permitName` varchar(255) default NULL,
  `field` varchar(255) default NULL,
  `field2` varchar(255) default NULL,
  `field3` varchar(255) default NULL,
  `field4` varchar(255) default NULL,
  `field5` varchar(255) default NULL,
  `field6` varchar(255) default NULL,
  `field7` varchar(255) default NULL,
  `field8` varchar(255) default NULL,
  `field9` varchar(255) default NULL,
  `field10` varchar(255) default NULL,
  `field11` varchar(255) default NULL,
  `field12` varchar(255) default NULL,
  `field13` varchar(255) default NULL,
  PRIMARY KEY  (`pId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permittemplate`
--

/*!40000 ALTER TABLE `permittemplate` DISABLE KEYS */;
INSERT INTO `permittemplate` (`pId`,`permitName`,`field`,`field2`,`field3`,`field4`,`field5`,`field6`,`field7`,`field8`,`field9`,`field10`,`field11`,`field12`,`field13`) VALUES 
 (1,'Car Sticker','Make','Model','Model Number','Plate Number','Color','Serial Number','','','','','','',''),
 (2,'Construction','Construction Type','Construction Company','Category','License Number','Business Address','DTI/ Registration Number','Name of Project Engineer/ Architect in Charge/ Foreman','PRC License Number','Address','Contact Number','','',''),
 (3,'House Help ID','Salary','Nature of Work','Name','Provincial Address','City Address','Birth Date','Civil Status','Height','Weight','Person to be notified in case of emergency','Relation','Address','Contact Number');
/*!40000 ALTER TABLE `permittemplate` ENABLE KEYS */;


--
-- Definition of table `pollchoices`
--

DROP TABLE IF EXISTS `pollchoices`;
CREATE TABLE `pollchoices` (
  `pollchoicesID` int(10) unsigned NOT NULL auto_increment,
  `Pollid` int(10) unsigned default NULL,
  `pollchoicename` varchar(200) NOT NULL,
  `votenum` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`pollchoicesID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pollchoices`
--

/*!40000 ALTER TABLE `pollchoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `pollchoices` ENABLE KEYS */;


--
-- Definition of table `pollssettings`
--

DROP TABLE IF EXISTS `pollssettings`;
CREATE TABLE `pollssettings` (
  `id` int(10) unsigned NOT NULL default '0',
  `polldays` int(10) unsigned default NULL,
  `nomdays` int(10) unsigned default NULL,
  `elecdays` int(10) unsigned default NULL,
  `years` int(10) unsigned default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pollssettings`
--

/*!40000 ALTER TABLE `pollssettings` DISABLE KEYS */;
INSERT INTO `pollssettings` (`id`,`polldays`,`nomdays`,`elecdays`,`years`) VALUES 
 (1,7,3,5,1);
/*!40000 ALTER TABLE `pollssettings` ENABLE KEYS */;


--
-- Definition of table `pollstable`
--

DROP TABLE IF EXISTS `pollstable`;
CREATE TABLE `pollstable` (
  `Pollid` int(10) unsigned NOT NULL auto_increment,
  `Pollname` varchar(45) NOT NULL,
  `PollSDate` timestamp NOT NULL default '2000-01-01 06:00:00',
  `PollCDate` timestamp NOT NULL default '2000-01-01 06:00:00',
  `Pollstatus` varchar(45) default NULL,
  `Polldesc` varchar(1024) default NULL,
  PRIMARY KEY  (`Pollid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pollstable`
--

/*!40000 ALTER TABLE `pollstable` DISABLE KEYS */;
/*!40000 ALTER TABLE `pollstable` ENABLE KEYS */;


--
-- Definition of table `radiofacility`
--

DROP TABLE IF EXISTS `radiofacility`;
CREATE TABLE `radiofacility` (
  `ID` int(10) NOT NULL,
  `nameRadio` varchar(255) default NULL,
  `radioValue` varchar(255) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `radiofacility`
--

/*!40000 ALTER TABLE `radiofacility` DISABLE KEYS */;
/*!40000 ALTER TABLE `radiofacility` ENABLE KEYS */;


--
-- Definition of table `reservationhandlers`
--

DROP TABLE IF EXISTS `reservationhandlers`;
CREATE TABLE `reservationhandlers` (
  `rId` int(10) unsigned NOT NULL,
  `comDivId` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`rId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservationhandlers`
--

/*!40000 ALTER TABLE `reservationhandlers` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservationhandlers` ENABLE KEYS */;


--
-- Definition of table `reservationtable`
--

DROP TABLE IF EXISTS `reservationtable`;
CREATE TABLE `reservationtable` (
  `ReservationID` int(10) unsigned NOT NULL auto_increment,
  `FrResDate` timestamp NOT NULL default '2007-07-12 06:00:00',
  `ToResDate` timestamp NOT NULL default '2007-07-12 06:00:00',
  `ResidentID` int(10) unsigned NOT NULL,
  `FacilityID` int(10) unsigned NOT NULL,
  `Status` varchar(45) NOT NULL,
  `FeePaid` int(10) unsigned default NULL,
  `PaidStatus` varchar(45) default NULL,
  `EventId` int(10) unsigned default NULL,
  PRIMARY KEY  (`ReservationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservationtable`
--

/*!40000 ALTER TABLE `reservationtable` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservationtable` ENABLE KEYS */;


--
-- Definition of table `resident`
--

DROP TABLE IF EXISTS `resident`;
CREATE TABLE `resident` (
  `ResId` int(10) unsigned NOT NULL auto_increment,
  `EmailAdd` varchar(35) default NULL,
  `StatInFam` varchar(255) default NULL,
  `FamId` int(10) unsigned default NULL,
  `Password` varchar(25) default NULL,
  `Username` varchar(25) default NULL,
  `UserType` varchar(25) default NULL,
  `FirstName` varchar(255) default NULL,
  `LastName` varchar(255) default NULL,
  `HouseNum` varchar(25) default NULL,
  `Address` varchar(255) default NULL,
  `LotID` int(10) unsigned default NULL,
  `Sex` varchar(45) default NULL,
  `Status` varchar(45) default NULL,
  PRIMARY KEY  (`ResId`),
  KEY `FamId` (`FamId`),
  KEY `HouseNum` (`HouseNum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resident`
--

/*!40000 ALTER TABLE `resident` DISABLE KEYS */;
INSERT INTO `resident` (`ResId`,`EmailAdd`,`StatInFam`,`FamId`,`Password`,`Username`,`UserType`,`FirstName`,`LastName`,`HouseNum`,`Address`,`LotID`,`Sex`,`Status`) VALUES 
 (1,'jassiy_7@yahoo.com','-',1,'admins','admin','Administrator','admin','admin','9162599096','2 asdasd',0,'M','Enabled'),
 (2,'jassiy_7@yahoo.com','-',2,'123','staff2','Staff','staff','staff','9162599096','2 asda ',0,'M','Enabled'),
 (3,'chengbang69@yahoo.com','head',3,'welcome','3Jemuel','Director','Jemuel','Dalino','3617417','Unit 1 Floor 1 Building 1',1,'M','Enabled'),
 (4,'paopaodomingo@yahoo.com','head',4,'welcome','4Paolo','Director','Paolo','Domingo','2312323','Unit 2 Floor 1 Building 1',2,'F','Enabled'),
 (9,'jr_tuason11@yahoo.com','head',5,'123','5Ace','Resident','Ace','Subido','09162599096','Unit 1 Floor 2 Building 1',3,'M','Enabled'),
 (10,'jr_tuason11@yahoo.com','head',6,'123','6JR','Resident','Jay-Robert','Tuason','09162599096','Unit 2 Floor 2 Building 1',4,'M','Enabled');
/*!40000 ALTER TABLE `resident` ENABLE KEYS */;


--
-- Definition of table `residenthead`
--

DROP TABLE IF EXISTS `residenthead`;
CREATE TABLE `residenthead` (
  `FamId` int(10) unsigned NOT NULL auto_increment,
  `ResId` int(10) unsigned NOT NULL,
  PRIMARY KEY  USING BTREE (`FamId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `residenthead`
--

/*!40000 ALTER TABLE `residenthead` DISABLE KEYS */;
INSERT INTO `residenthead` (`FamId`,`ResId`) VALUES 
 (1,1),
 (2,2),
 (3,3),
 (4,4),
 (5,9),
 (6,10);
/*!40000 ALTER TABLE `residenthead` ENABLE KEYS */;


--
-- Definition of table `servicestemplate`
--

DROP TABLE IF EXISTS `servicestemplate`;
CREATE TABLE `servicestemplate` (
  `Sid` int(10) unsigned NOT NULL default '1',
  `permit` varchar(45) NOT NULL,
  `reservation` varchar(45) NOT NULL,
  `vote` varchar(45) NOT NULL,
  `bulletinBoard` varchar(45) NOT NULL,
  `billing` varchar(45) NOT NULL,
  `newsletter` varchar(45) NOT NULL,
  `socialgroups` varchar(45) NOT NULL,
  PRIMARY KEY  (`Sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `servicestemplate`
--

/*!40000 ALTER TABLE `servicestemplate` DISABLE KEYS */;
INSERT INTO `servicestemplate` (`Sid`,`permit`,`reservation`,`vote`,`bulletinBoard`,`billing`,`newsletter`,`socialgroups`) VALUES 
 (1,'Yes','Nope','Yes','Yes','Yes','Nope','Yes');
/*!40000 ALTER TABLE `servicestemplate` ENABLE KEYS */;


--
-- Definition of table `setup`
--

DROP TABLE IF EXISTS `setup`;
CREATE TABLE `setup` (
  `houseId` int(10) unsigned NOT NULL,
  `lotarea` double default NULL,
  `address` varchar(255) default NULL,
  `status` varchar(45) default NULL,
  PRIMARY KEY  (`houseId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `setup`
--

/*!40000 ALTER TABLE `setup` DISABLE KEYS */;
INSERT INTO `setup` (`houseId`,`lotarea`,`address`,`status`) VALUES 
 (1,100,'Paranaque City','not yet applied'),
 (2,100,'Paranaque City','applied'),
 (3,200,'Pineda','applied');
/*!40000 ALTER TABLE `setup` ENABLE KEYS */;


--
-- Definition of table `socgrp`
--

DROP TABLE IF EXISTS `socgrp`;
CREATE TABLE `socgrp` (
  `SGID` int(10) unsigned NOT NULL auto_increment,
  `SGName` varchar(45) NOT NULL,
  `SGCategory` varchar(45) NOT NULL,
  `SGResidentHeadID` int(10) unsigned NOT NULL,
  `SGStatus` varchar(45) NOT NULL,
  `SGStartDate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `SGDetails` varchar(1000) default NULL,
  `SGRHNme` varchar(200) NOT NULL,
  `SGMemSet` varchar(45) default NULL,
  `SGAPostExp` int(10) unsigned default NULL,
  PRIMARY KEY  (`SGID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `socgrp`
--

/*!40000 ALTER TABLE `socgrp` DISABLE KEYS */;
INSERT INTO `socgrp` (`SGID`,`SGName`,`SGCategory`,`SGResidentHeadID`,`SGStatus`,`SGStartDate`,`SGDetails`,`SGRHNme`,`SGMemSet`,`SGAPostExp`) VALUES 
 (1,'social group...','Sports',3,'Social Group','2008-11-08 22:44:47','hello there','Pogi Bilayo','Private',0);
/*!40000 ALTER TABLE `socgrp` ENABLE KEYS */;


--
-- Definition of table `socgrpaboard`
--

DROP TABLE IF EXISTS `socgrpaboard`;
CREATE TABLE `socgrpaboard` (
  `aid` int(10) unsigned NOT NULL auto_increment,
  `message` varchar(2000) NOT NULL,
  `parentid` int(10) unsigned NOT NULL,
  `residentid` int(10) unsigned NOT NULL,
  `residentname` varchar(200) NOT NULL,
  `mdate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `sid` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `socgrpaboard`
--

/*!40000 ALTER TABLE `socgrpaboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `socgrpaboard` ENABLE KEYS */;


--
-- Definition of table `socgrpapprovals`
--

DROP TABLE IF EXISTS `socgrpapprovals`;
CREATE TABLE `socgrpapprovals` (
  `appid` int(10) unsigned NOT NULL auto_increment,
  `socID` int(10) unsigned NOT NULL,
  `resID` int(10) unsigned NOT NULL,
  `dirName` varchar(45) NOT NULL,
  `statapproval` varchar(45) NOT NULL,
  PRIMARY KEY  (`appid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `socgrpapprovals`
--

/*!40000 ALTER TABLE `socgrpapprovals` DISABLE KEYS */;
/*!40000 ALTER TABLE `socgrpapprovals` ENABLE KEYS */;


--
-- Definition of table `socgrpcategory`
--

DROP TABLE IF EXISTS `socgrpcategory`;
CREATE TABLE `socgrpcategory` (
  `scatId` int(10) unsigned NOT NULL auto_increment,
  `scatName` varchar(45) NOT NULL,
  PRIMARY KEY  (`scatId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `socgrpcategory`
--

/*!40000 ALTER TABLE `socgrpcategory` DISABLE KEYS */;
INSERT INTO `socgrpcategory` (`scatId`,`scatName`) VALUES 
 (2,'Gardening'),
 (3,'Sports'),
 (4,'Sugalan'),
 (5,'Arts');
/*!40000 ALTER TABLE `socgrpcategory` ENABLE KEYS */;


--
-- Definition of table `socgrpdirapp`
--

DROP TABLE IF EXISTS `socgrpdirapp`;
CREATE TABLE `socgrpdirapp` (
  `appID` int(10) unsigned NOT NULL auto_increment,
  `resID` int(10) unsigned NOT NULL,
  `dirName` varchar(200) NOT NULL,
  `socpath` int(10) unsigned default NULL,
  `socsim` varchar(45) default NULL,
  PRIMARY KEY  (`appID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `socgrpdirapp`
--

/*!40000 ALTER TABLE `socgrpdirapp` DISABLE KEYS */;
INSERT INTO `socgrpdirapp` (`appID`,`resID`,`dirName`,`socpath`,`socsim`) VALUES 
 (3,1,'Jemuel Dalino',0,'Yes'),
 (4,4,'Mike Magat',0,'Yes');
/*!40000 ALTER TABLE `socgrpdirapp` ENABLE KEYS */;


--
-- Definition of table `socgrpforapp`
--

DROP TABLE IF EXISTS `socgrpforapp`;
CREATE TABLE `socgrpforapp` (
  `appID` int(10) unsigned NOT NULL auto_increment,
  `resID` int(10) unsigned NOT NULL,
  `dirName` varchar(45) NOT NULL,
  `socID` int(10) unsigned NOT NULL,
  `status` varchar(45) NOT NULL,
  `socpath` int(10) unsigned default NULL,
  PRIMARY KEY  (`appID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `socgrpforapp`
--

/*!40000 ALTER TABLE `socgrpforapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `socgrpforapp` ENABLE KEYS */;


--
-- Definition of table `socgrpmembers`
--

DROP TABLE IF EXISTS `socgrpmembers`;
CREATE TABLE `socgrpmembers` (
  `memberid` int(10) unsigned NOT NULL auto_increment,
  `socgrpid` int(10) unsigned NOT NULL,
  `residentid` int(10) unsigned NOT NULL,
  `name` varchar(200) NOT NULL,
  `pos` varchar(45) default NULL,
  PRIMARY KEY  (`memberid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `socgrpmembers`
--

/*!40000 ALTER TABLE `socgrpmembers` DISABLE KEYS */;
INSERT INTO `socgrpmembers` (`memberid`,`socgrpid`,`residentid`,`name`,`pos`) VALUES 
 (1,1,6,'Bulldog Las','Member'),
 (2,1,8,'Satanas Mansanas','Member'),
 (3,1,3,'Pogi Bilayo','Admin'),
 (4,1,7,'Pogita Po','Member'),
 (5,1,1,'Jemuel Dalino','Applicant');
/*!40000 ALTER TABLE `socgrpmembers` ENABLE KEYS */;


--
-- Definition of table `socgrppetitioninvite`
--

DROP TABLE IF EXISTS `socgrppetitioninvite`;
CREATE TABLE `socgrppetitioninvite` (
  `invID` int(10) unsigned NOT NULL auto_increment,
  `socID` int(10) unsigned NOT NULL,
  `resID` int(10) unsigned NOT NULL,
  `nme` varchar(200) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY  USING BTREE (`invID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `socgrppetitioninvite`
--

/*!40000 ALTER TABLE `socgrppetitioninvite` DISABLE KEYS */;
/*!40000 ALTER TABLE `socgrppetitioninvite` ENABLE KEYS */;


--
-- Definition of table `socgrppetitions`
--

DROP TABLE IF EXISTS `socgrppetitions`;
CREATE TABLE `socgrppetitions` (
  `petitionId` int(10) unsigned NOT NULL auto_increment,
  `SocGroupID` int(10) unsigned NOT NULL,
  `ResidentID` int(10) unsigned NOT NULL,
  `ResidentNme` varchar(200) NOT NULL,
  PRIMARY KEY  (`petitionId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `socgrppetitions`
--

/*!40000 ALTER TABLE `socgrppetitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `socgrppetitions` ENABLE KEYS */;


--
-- Definition of table `socgrpservicesettings`
--

DROP TABLE IF EXISTS `socgrpservicesettings`;
CREATE TABLE `socgrpservicesettings` (
  `GID` int(10) unsigned NOT NULL auto_increment,
  `numppl` int(10) unsigned default NULL,
  `inviteppl` int(10) unsigned default NULL,
  `dapprove` varchar(45) default NULL,
  `newslet` varchar(45) default NULL,
  `reserve` varchar(45) default NULL,
  `bullet` varchar(45) default NULL,
  PRIMARY KEY  (`GID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `socgrpservicesettings`
--

/*!40000 ALTER TABLE `socgrpservicesettings` DISABLE KEYS */;
INSERT INTO `socgrpservicesettings` (`GID`,`numppl`,`inviteppl`,`dapprove`,`newslet`,`reserve`,`bullet`) VALUES 
 (1,3,3,'Simultaneous','Enabled','Enabled','Enabled');
/*!40000 ALTER TABLE `socgrpservicesettings` ENABLE KEYS */;


--
-- Definition of table `tempbulletin`
--

DROP TABLE IF EXISTS `tempbulletin`;
CREATE TABLE `tempbulletin` (
  `bulletinId` int(10) unsigned NOT NULL,
  `bulletinContent` longtext NOT NULL,
  `poster` varchar(45) NOT NULL,
  PRIMARY KEY  (`bulletinId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tempbulletin`
--

/*!40000 ALTER TABLE `tempbulletin` DISABLE KEYS */;
/*!40000 ALTER TABLE `tempbulletin` ENABLE KEYS */;


--
-- Definition of table `villagehouses`
--

DROP TABLE IF EXISTS `villagehouses`;
CREATE TABLE `villagehouses` (
  `ID` int(10) NOT NULL auto_increment,
  `Lot` int(10) default NULL,
  `Block` int(10) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `villagehouses`
--

/*!40000 ALTER TABLE `villagehouses` DISABLE KEYS */;
/*!40000 ALTER TABLE `villagehouses` ENABLE KEYS */;


--
-- Definition of table `villageinfo`
--

DROP TABLE IF EXISTS `villageinfo`;
CREATE TABLE `villageinfo` (
  `ID` int(10) NOT NULL default '0',
  `Division` int(10) default NULL,
  `DivisionUnit` varchar(255) default NULL,
  `NameOfAssoc` varchar(255) default NULL,
  `AddressAssoc` varchar(255) default NULL,
  `ResidentialUnit` int(10) default NULL,
  `ComType` varchar(50) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `villageinfo`
--

/*!40000 ALTER TABLE `villageinfo` DISABLE KEYS */;
INSERT INTO `villageinfo` (`ID`,`Division`,`DivisionUnit`,`NameOfAssoc`,`AddressAssoc`,`ResidentialUnit`,`ComType`) VALUES 
 (0,2,'building','Tahanan Village','Paranaque',NULL,'');
/*!40000 ALTER TABLE `villageinfo` ENABLE KEYS */;


--
-- Definition of table `votehandlers`
--

DROP TABLE IF EXISTS `votehandlers`;
CREATE TABLE `votehandlers` (
  `vId` int(10) unsigned NOT NULL,
  `comDivId` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`vId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `votehandlers`
--

/*!40000 ALTER TABLE `votehandlers` DISABLE KEYS */;
/*!40000 ALTER TABLE `votehandlers` ENABLE KEYS */;


--
-- Definition of table `votetable`
--

DROP TABLE IF EXISTS `votetable`;
CREATE TABLE `votetable` (
  `voteID` int(10) unsigned NOT NULL auto_increment,
  `residentID` int(10) unsigned NOT NULL,
  `pollchoiceID` int(10) unsigned NOT NULL,
  `pollID` varchar(45) NOT NULL,
  PRIMARY KEY  (`voteID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `votetable`
--

/*!40000 ALTER TABLE `votetable` DISABLE KEYS */;
INSERT INTO `votetable` (`voteID`,`residentID`,`pollchoiceID`,`pollID`) VALUES 
 (1,3,2,'1');
/*!40000 ALTER TABLE `votetable` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
