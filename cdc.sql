
CREATE TABLE `cdc_college_details` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `cCode` int(11) DEFAULT NULL,
  `cName` varchar(45) DEFAULT NULL,
  `cAddress` varchar(45) DEFAULT NULL,
  `sName` varchar(45) DEFAULT NULL,
  `sAddress` varchar(45) DEFAULT NULL,
  `sRegNo` varchar(45) DEFAULT NULL,
  `sYear` year(4) DEFAULT NULL,
  `cEstd` date DEFAULT NULL,
  `secName` varchar(45) DEFAULT NULL,
  `secPhNo` int(11) DEFAULT NULL,
  `cPrincipal` varchar(45) DEFAULT NULL,
  `cPPhNo` varchar(45) DEFAULT NULL,
  `valOwnBuilding` tinyint(2) DEFAULT NULL,
  `lLessor` varchar(45) DEFAULT NULL,
  `lLessee` varchar(45) DEFAULT NULL,
  `lPeriod` int(11) DEFAULT NULL,
  `lSurveyNo` varchar(45) DEFAULT NULL,
  `lRegNo` varchar(45) DEFAULT NULL,
  `lRegDate` date DEFAULT NULL,
  `landSurveyNumber` varchar(45) DEFAULT NULL,
  `landDocNo` varchar(45) DEFAULT NULL,
  `landRegNo` date DEFAULT NULL,
  `valRegSociety` tinyint(2) DEFAULT NULL,
  `valSecMem` tinyint(2) DEFAULT NULL,
  `valSocietyMem` tinyint(2) DEFAULT NULL,
  `valSingleBit` tinyint(2) DEFAULT NULL,
  `valLandCert` tinyint(2) DEFAULT NULL,
  `grantPermission` varchar(45) DEFAULT NULL,
  `mapApproval` varchar(45) DEFAULT NULL,
  `mapArea` int(11) DEFAULT NULL,
  `valPlayGround` tinyint(2) DEFAULT NULL,
  `valParkingArea` tinyint(2) DEFAULT NULL,
  `valDrinkingWater` tinyint(2) DEFAULT NULL,
  `valFireSafety` tinyint(2) DEFAULT NULL,
  `valSanitaryCert` tinyint(2) DEFAULT NULL,
  `pQualification` varchar(45) DEFAULT NULL,
  `pDateOfAppointment` date DEFAULT NULL,
  `appointmentNature` varchar(45) DEFAULT NULL,
  `appointmentMode` varchar(45) DEFAULT NULL,
  `pSalary` int(11) DEFAULT NULL,
  `paymentMode` varchar(45) DEFAULT NULL,
  `pBankAccNo` int(11) DEFAULT NULL,
  `pPANNo` int(11) DEFAULT NULL,
  `pAadharNo` int(11) DEFAULT NULL,
  `pExperience` int(11) DEFAULT NULL,
  `CFDNo` varchar(45) DEFAULT NULL,
  `CFDDate` date DEFAULT NULL,
  `CFDAmount` int(11) DEFAULT NULL,
  `CFDIssuingBank` varchar(45) DEFAULT NULL,
  `CFDMaturitydate` date DEFAULT NULL,
  `CFDRenewalDate` date DEFAULT NULL,
  `totalLand` int(11) DEFAULT NULL,
  `bPlinthArea` int(11) DEFAULT NULL,
  `priRoomArea` int(11) DEFAULT NULL,
  `offRoomArea` int(11) DEFAULT NULL,
  `staffRoomArea` int(11) DEFAULT NULL,
  `gamesRoomArea` int(11) DEFAULT NULL,
  `lWaitingRoom` int(11) DEFAULT NULL,
  `toiletsRoomArea` int(11) DEFAULT NULL,
  `libraryArea` int(11) DEFAULT NULL,
  `noClassRooms` int(11) DEFAULT NULL,
  `classSize` int(11) DEFAULT NULL,
  `noLabRooms` int(11) DEFAULT NULL,
  `labSize` int(11) DEFAULT NULL,
  `nLibrarian` varchar(45) DEFAULT NULL,
  `noBooks` int(11) DEFAULT NULL,
  `noJournels` int(11) DEFAULT NULL,
  `noPeriodicals` int(11) DEFAULT NULL,
  `noTeachingStaff` int(11) DEFAULT NULL,
  `noNonTeachingStaff` int(11) DEFAULT NULL,
  PRIMARY KEY (`sno`)
) ;

--
-- Dumping data for table `cdc_college_details`
--


CREATE TABLE `course_structure` (
  `sno` int(11) NOT NULL,
  `type` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `combination` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medium` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sno`)
) ;

--
-- Dumping data for table `course_structure`
--



--
-- Table structure for table `courses`
--


CREATE TABLE `courses` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `cCode` int(11) NOT NULL,
  `cType` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cCourse` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cCombination` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cMedium` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cIntakeSanctioned` int(11) DEFAULT NULL,
  `cStudentsAdmitted` int(11) DEFAULT NULL,
  `cStatus` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sno`)
);

--
-- Dumping data for table `courses`
--


--
-- Table structure for table `faculty`
--


CREATE TABLE `faculty` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `cCode` int(11) NOT NULL,
  `tType` varchar(30) DEFAULT NULL,
  `tName` varchar(80) DEFAULT NULL,
  `tDesignation` varchar(45) DEFAULT NULL,
  `tQualification` varchar(45) DEFAULT NULL,
  `tDate` date DEFAULT NULL,
  `tNature` varchar(45) DEFAULT NULL,
  `tModeApp` varchar(45) DEFAULT NULL,
  `tScale` varchar(20) DEFAULT NULL,
  `tBank` varchar(20) DEFAULT NULL,
  `tModePay` varchar(45) DEFAULT NULL,
  `tPan` varchar(10) DEFAULT NULL,
  `tAadhar` varchar(12) DEFAULT NULL,
  `tMobile` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`sno`)
) ;

--
-- Dumping data for table `faculty`
--



--
-- Table structure for table `test`
--


--
-- Dumping data for table `test`
--
