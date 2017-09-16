DROP TABLE IF EXISTS `APP_SH_PC` ;
CREATE TABLE IF NOT EXISTS APP_SH_PC (
  `ID` VARCHAR(32) NOT NULL,
  `PC_MC` VARCHAR(255) NULL ,
  `PC_SJ` DATETIME NULL ,
  `SHLX` VARCHAR(1) NULL ,
  PRIMARY KEY (`ID`));

DROP TABLE IF EXISTS `APP_SH_TP` ;
CREATE TABLE IF NOT EXISTS `APP_SH_TP` (
  `ID` VARCHAR(32) NOT NULL,
  `TPQ_BH` VARCHAR(128) NULL ,
  `TPR_ID` VARCHAR(32) NULL ,
  `TPR_XM` VARCHAR(64) NULL ,
  `TP_SJ` DATETIME NULL ,
  `APP_SH_PC_ID` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`ID`),

  CONSTRAINT `fk_RM_SH_TP_RM_SH_PC1`
    FOREIGN KEY (`APP_SH_PC_ID`)
    REFERENCES `APP_SH_PC` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

DROP TABLE IF EXISTS `APP_SH_A01` ;
CREATE TABLE IF NOT EXISTS `APP_SH_A01` (
  `ID` VARCHAR(32) NOT NULL,
  `APP_SH_PC_ID` VARCHAR(32) NOT NULL,
  `RMLX` VARCHAR(1) NULL ,
  `RMLX_STR` VARCHAR(128) NULL,
  `XM` VARCHAR(20) NULL,
  `XB` VARCHAR(10) NULL,
  `MZ` VARCHAR(20) NULL,
  `JG` VARCHAR(20) NULL,
  `CSNY` VARCHAR(24) NULL,
  `CJGZSJ` VARCHAR(24) NULL,
  `RDSJ` VARCHAR(24) NULL,
  `WHCD` VARCHAR(40) NULL,
  `RXJBSJ` VARCHAR(24) NULL,
  `MZTJQK` VARCHAR(80) NULL,
  `YWFPJL` VARCHAR(10) NULL,
  `XGZDWJZW` VARCHAR(128) NULL,
  `NTZPBYJ` VARCHAR(128) NULL,
  `SHYJ` VARCHAR(10) NULL ,
  `A01_PX` INT NULL,
  PRIMARY KEY (`ID`));

DROP TABLE IF EXISTS `APP_SH_TP_SJ` ;

CREATE TABLE IF NOT EXISTS `APP_SH_TP_SJ` (
  `ID` VARCHAR(32) NOT NULL,
  `TP` INT NOT NULL ,
  `APP_SH_TP_ID` VARCHAR(32) NOT NULL,
  `APP_SH_A01_ID` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`ID`));

DROP TABLE IF EXISTS `APP_SH_A01_KCCL` ;

CREATE TABLE IF NOT EXISTS `APP_SH_A01_KCCL` (
  `ID` VARCHAR(32) NOT NULL,
  `PATH` VARCHAR(128) NULL,
  `APP_SH_A01_ID` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`ID`));


DROP TABLE IF EXISTS `APP_SH_A01_DASCQK` ;

CREATE TABLE IF NOT EXISTS `APP_SH_A01_DASCQK` (
  `ID` VARCHAR(32) NOT NULL,
  `PATH` VARCHAR(128) NULL,
  `APP_SH_A01_ID` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`ID`));



DROP TABLE IF EXISTS `APP_SH_A01_GRZDSX` ;

CREATE TABLE IF NOT EXISTS `APP_SH_A01_GRZDSX` (
  `ID` VARCHAR(32) NOT NULL,
  `PATH` VARCHAR(128) NULL,
  `APP_SH_A01_ID` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`ID`));



DROP TABLE IF EXISTS `APP_SH_A01_DASCQK_TIPS` ;

CREATE TABLE IF NOT EXISTS `APP_SH_A01_DASCQK_TIPS` (
  `ID` VARCHAR(32) NOT NULL,
  `TIP` VARCHAR(256) NULL,
  `APP_SH_A01_DASCQK_ID` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`ID`));



DROP TABLE IF EXISTS `APP_SH_A01_GBRMSPB` ;

CREATE TABLE IF NOT EXISTS `APP_SH_A01_GBRMSPB` (
  `ID` VARCHAR(32) NOT NULL,
  `XM` VARCHAR(20) NULL,
  `XB` VARCHAR(10) NULL,
  `CSNY` VARCHAR(24) NULL,
  `NL` VARCHAR(10) NULL,
  `ZP_PATH` VARCHAR(128) NULL,
  `MZ` VARCHAR(24) NULL,
  `JG` VARCHAR(24) NULL,
  `CSD` VARCHAR(24) NULL,
  `RDSJ` VARCHAR(10) NULL,
  `CJGZSJ` VARCHAR(10) NULL,
  `JKZK` VARCHAR(24) NULL,
  `ZYJSZW` VARCHAR(60) NULL,
  `ZYTC` VARCHAR(60) NULL,
  `XL_QRZ` VARCHAR(24) NULL,
  `XW_QRZ` VARCHAR(24) NULL,
  `XL_ZZ` VARCHAR(24) NULL,
  `XW_ZZ` VARCHAR(24) NULL,
  `QRZ_BYYX` VARCHAR(128) NULL,
  `ZZ_BYYX` VARCHAR(128) NULL,
  `XRZW` VARCHAR(128) NULL,
  `NRZW` VARCHAR(128) NULL,
  `NMZW` VARCHAR(128) NULL,
  `RMLY` VARCHAR(255) NULL,
  `CBDWYJ` VARCHAR(255) NULL,
  `SPJGYJ` VARCHAR(255) NULL,
  `XZJGRMYJ` VARCHAR(255) NULL,
  `APP_SH_A01_ID` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`ID`));

DROP TABLE IF EXISTS `APP_SH_A01_GZJL` ;

CREATE TABLE IF NOT EXISTS `APP_SH_A01_GZJL` (
  `ID` VARCHAR(32) NOT NULL,
  `C_SJ` VARCHAR(24) NULL,
  `Z_SJ` VARCHAR(24) NULL,
  `JLSM` VARCHAR(256) NULL,
  `APP_SH_A01_ID` VARCHAR(32) NOT NULL,
  `GZJL_PX` INT NULL,
  PRIMARY KEY (`ID`));


DROP TABLE IF EXISTS `APP_SH_A01_JC` ;

CREATE TABLE IF NOT EXISTS `APP_SH_A01_JC` (
  `ID` VARCHAR(32) NOT NULL,
  `ND` VARCHAR(24) NULL,
  `JCSM` VARCHAR(256) NULL,
  `APP_SH_A01_ID` VARCHAR(32) NOT NULL,
  `JC_PX` INT NULL,
  PRIMARY KEY (`ID`));



DROP TABLE IF EXISTS `APP_SH_A01_NDKH` ;

CREATE TABLE IF NOT EXISTS `APP_SH_A01_NDKH` (
  `ID` VARCHAR(32) NOT NULL,
  `ND` VARCHAR(24) NULL,
  `KHJG` VARCHAR(60) NULL,
  `APP_SH_A01_ID` VARCHAR(32) NOT NULL,
  `NDKH_PX` INT NULL,
  PRIMARY KEY (`ID`));



DROP TABLE IF EXISTS `APP_SH_A01_SHGX` ;

CREATE TABLE IF NOT EXISTS `APP_SH_A01_SHGX` (
  `ID` VARCHAR(32) NOT NULL,
  `CW` VARCHAR(24) NULL,
  `XM` VARCHAR(24) NULL,
  `NL` VARCHAR(10) NULL,
  `ZZMM` VARCHAR(24) NULL,
  `GZDWJZW` VARCHAR(128) NULL,
  `APP_SH_A01_ID` VARCHAR(32) NOT NULL,
  `SHGX_PX` INT NULL,
  PRIMARY KEY (`ID`));


DROP TABLE IF EXISTS `APP_MENU_SETTING` ;

CREATE TABLE IF NOT EXISTS `APP_MENU_SETTING` (
  `ID` INT NOT NULL,
  `MENU_CODE` VARCHAR(40) NOT NULL ,
  `DISPLAY` INT NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`ID`));


DROP TABLE IF EXISTS `APP_DWJG_TJ` ;

CREATE TABLE IF NOT EXISTS `APP_DWJG_TJ` (
  `ID` VARCHAR(32) NOT NULL,
  `TJ_MC` VARCHAR(128) NULL ,
  `TJ_JSON_DATA` TEXT NULL ,
  `TJ_PX` INT NULL,
  PRIMARY KEY (`ID`));
