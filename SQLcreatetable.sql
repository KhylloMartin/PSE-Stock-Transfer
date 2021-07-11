
CREATE TABLE custinfo_tb(
	transactionID bigint NOT NULL,
    Col_ID int(8) NOT NULL,
    email varchar(50) NOT NULL,
	contact int(11) NOT NULL,
	address varchar(100) NOT NULL,
	tdcp varchar(100) NOT NULL,
	pc varchar(4) NOT NULL,
    PRIMARY KEY (Col_ID,transactionID)
    
  
)ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE brokerinfo_tb
(
 transactionID bigint NOT NULL,
  Brokerid varchar(30) NOT NULL,
  Broker_contact bigint(15) NOT NULL,
  Account_wBroker varchar(100) NOT NULL,
  PRIMARY KEY (Brokerid,transactionID)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE stockinfo_tb
(
	transactionID bigint NOT NULL,
	Stock_Code varchar(6) NOT NULL,
	Stock_Name varchar(50) NOT NULL,
	Stock_Amount int(9) NOT NULL,
	Avecost float NOT NULL,
	Cert_amount float NOT NULL,
	PRIMARY KEY (stock_code,transactionID)
	
)ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE transactiontype_tb
(
  transactionID bigint NOT NULL,
  Transfertype varchar(20) NOT NULL,
  transferdesc varchar(20) NOT NULL,
  transperiod varchar(10) NOT NULL,
  transfee double NOT NULL,
  PRIMARY KEY (transfertype,transactionID)
	
)ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE transaction_tb(
    transactionID bigint  NOT NULL AUTO_INCREMENT,
    COL_ID int NOT NULL,
    sysdate DATETIME,
    Stock_Code varchar(6) NOT NULL,
	Brokerid varchar(30) NOT NULL,
	Transfertype varchar(20) NOT NULL,
    PRIMARY KEY (transactionID),
    FOREIGN KEY (Col_ID,transactionID) REFERENCES custinfo_tb(Col_ID,transactionID)  ON DELETE CASCADE ON UPDATE CASCADE ,
	FOREIGN KEY (Brokerid,transactionID) REFERENCES brokerinfo_tb(Brokerid,transactionID)  ON DELETE CASCADE ON UPDATE CASCADE ,
	FOREIGN KEY (Stock_Code,transactionID) REFERENCES stockinfo_tb(Stock_Code,transactionID)  ON DELETE CASCADE ON UPDATE CASCADE ,
	FOREIGN KEY (Transfertype,transactionID) REFERENCES transactiontype_tb(Transfertype,transactionID)  ON DELETE CASCADE ON UPDATE CASCADE
    
)ENGINE=InnoDB DEFAULT CHARSET=latin1;