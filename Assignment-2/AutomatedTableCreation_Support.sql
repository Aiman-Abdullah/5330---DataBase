Drop database COVIDVACCINE;
Create Database COVIDVACCINE;
USE COVIDVACCINE;

CREATE TABLE Manufacturer(
    ManuId INT PRIMARY KEY,
    ManuName VARCHAR(20),
    UnitType VARCHAR(20),
    VaccineName VARCHAR(20),
    VaccineType VARCHAR(20)
);

CREATE TABLE LocalBody (
    LocalBodyId INT PRIMARY KEY,
    LocalBodyName VARCHAR(50),
    LocalBodyType VARCHAR(50)
);

CREATE TABLE UnitDistribution(
    DistId INT PRIMARY KEY,
    LocalBodyId INT,
    QtyOfDoses INT,
    ManuId INT,
    DistDate DATE,
    FOREIGN KEY (LocalBodyId) REFERENCES LocalBody(LocalBodyId),
    FOREIGN KEY (ManuId) REFERENCES Manufacturer(ManuId)
);

CREATE TABLE DistByFederalGorv(
    DistId INT,
    StateName VARCHAR(20) PRIMARY KEY,
    QtyDist INT,
    FOREIGN KEY (DistId) REFERENCES UnitDistribution(DistId)
);

CREATE TABLE DistByState(
    StateName VARCHAR(20) ,
    LocalBodyId INT,
    QtyObtain INT,
    FOREIGN KEY (StateName) REFERENCES DistByFederalGorv(StateName),
    FOREIGN KEY (LocalBodyId) REFERENCES LocalBody(LocalBodyId)
);

CREATE TABLE PersonalInfo(
    PId INT PRIMARY KEY,
    PName VARCHAR(20),
    PAdd VARCHAR(50),
    PContactNo INT,
    PAge INT,
    PMedicalCond VARCHAR(20),
    PAllergy VARCHAR(20)
);

CREATE TABLE Patient(
    PId INT,
    VaccinationPhase VARCHAR(20),
    LocalBodyId INT,
    doseId int PRIMARY KEY,
    FOREIGN KEY (PId) REFERENCES PersonalInfo(PId),
    FOREIGN KEY (LocalBodyId) REFERENCES LocalBody(LocalBodyId)
);

CREATE TABLE Doses(
    PId INT,
    DoseId INT,
    ShotTime date,
    ManuId INT,
    FOREIGN KEY (PId) REFERENCES PersonalInfo(PId),
    FOREIGN KEY (DoseId) REFERENCES Patient(DoseId),
    FOREIGN KEY (ManuId) REFERENCES Manufacturer(ManuId)
);



#1.
INSERT INTO PersonalInfo(PId,PName,PAdd,PContactNo,PAge,PMedicalCond,PAllergy) VALUES
(04	,"James	Isabella","UK",654987,24,"Arthritis","dust allergies"),                                                
(05	,"Oliver	Sophia","UK",654987,24,"Arthritis","dust allergies"),                                                  
(06	,"Benjamin	Charlotte","UK",654987,24,"Arthritis","dust allergies"),                                                     
(07	,"Elijah	Mia","UK",654987,24,"Arthritis","dust allergies"),                                               
(08	,"Lucas	Amelia","UK",654987,24,"Arthritis","dust allergies"),                                              
(09	,"Mason	Harper","UK",654987,24,"Arthritis","dust allergies"),                                              
(10	,"Logan	Evelyn","UK",654987,24,"Arthritis","dust allergies"),                                              
(11	,"Alexander	Abigail","UK",654987,24,"Arthritis","dust allergies"),                                                   
(12	,"Ethan	Emily","UK",654987,24,"Arthritis","dust allergies"),                                             
(13	,"Jacob	Elizabeth","UK",654987,24,"Arthritis","dust allergies"),                                                 
(14	,"Michael	Mila","UK",654987,24,"Arthritis","dust allergies"),                                                
(15	,"Daniel	Ella","UK",654987,24,"Arthritis","dust allergies"),                                                
(16	,"Henry	Avery","UK",654987,24,"Arthritis","dust allergies"),                                             
(17	,"Jackson	Sofia","UK",654987,24,"Arthritis","dust allergies"),                                                 
(18	,"Sebastian	Camila","UK",654987,24,"Arthritis","dust allergies"),                                                  
(19	,"Aiden	Aria","UK",654987,24,"Arthritis","dust allergies"),                                            
(20	,"Matthew	Scarlett","UK",654987,24,"Arthritis","dust allergies"),                                                    
(21	,"Samuel	Victoria","UK",654987,75,"Arthritis","dust allergies"),                                                    
(22	,"David	Madison","UK",654987,75,"Arthritis","dust allergies"),                                               
(23	,"Joseph	Luna","UK",654987,75,"Asthma","dust allergies"),                                             
(24	,"Carter	Grace","UK",654987,75,"Asthma","dust allergies"),                                              
(25	,"Owen	Chloe","UK",654987,75,"Asthma","dust allergies"),                                          
(26	,"Wyatt	Penelope","UK",654987,75,"Asthma","dust allergies"),                                                                                                           
(27	,"John	Layla","UK",654987,75,"Asthma","dust allergies"),                                          
(28	,"Jack	Riley","CK",845775,75,"Asthma","dust allergies"),                                          
(29	,"Luke	Zoey","CK",845775,75,"Asthma","dust allergies"),                                                                                                       
(30	,"Jayden	Nora","CK",845775,75,"Asthma","dust allergies"),                                                                                                           
(31	,"Dylan	Lily","CK",845775,75,"Asthma","dust allergies"),                                         
(32	,"Grayson	Eleanor","CK",845775,75,"Asthma","insect bites"  ),                                                                                                            
(33	,"Levi	Hannah","CK",845775,75,"Asthma","insect bites"  ),                                                                                                       
(34	,"Isaac	Lillian","CK",845775,75,"Asthma","insect bites"  ),                                          
(35	,"Gabriel	Addison","CK",845775,75,"Asthma","insect bites"  ),                                              
(36	,"Julian	Aubrey","CK",845775,75,"Asthma","insect bites"  ),                                             
(37	,"Mateo	Ellie","CK",845775,75,"Asthma","insect bites"  ),                                        
(38	,"Anthony	Stella","CK",845775,75,"Asthma","insect bites"  ),                                             
(39	,"Jaxon	Natalie","CK",845775,75,"Asthma","insect bites"  ),                                          
(40	,"Lincoln	Zoe","CK",845775,75,"Asthma","insect bites"  ),                                                                                                        
(41	,"Joshua	Leah","CK",845775,47,"Asthma","insect bites"  ),                                           
(42	,"Christopher	Hazel","CK",845775,47,"Asthma","insect bites"  ),                                                
(43	,"Andrew	Violet","CK",845775,47,"Asthma","insect bites"  ),                                             
(44	,"Theodore	Aurora","CK",845775,47,"Asthma","insect bites"  ),                                             
(45	,"Caleb	Savannah","CK",845775,47,"Conjuntivitis","insect bites"  ),                                                  
(46	,"Ryan	Audrey","CK",845775,47,"Conjuntivitis","insect bites"  ),                                                
(47	,"Asher	Brooklyn","CK",845775,47,"Conjuntivitis","insect bites"  ),                                                  
(48	,"Nathan	Bella","CK",845775,47,"Conjuntivitis","insect bites"  ),                                                                                                                                                                               
(49	,"Thomas	Claire","CK",845775,47,"Conjuntivitis","insect bites"  ),                                                    
(50	,"Leo	Skylar","CK",845775,47,"Conjuntivitis","insect bites"  ),                                                
(51	,"Isaiah	Lucy","CK",845775,47,"Conjuntivitis","insect bites"  ),                                                                                                                
(52	,"Charles	Paisley","CK",845775,47,"Conjuntivitis","insect bites"  ),                                                                                                                   
(53	,"Josiah	Everly","CK",845775,47,"Conjuntivitis","insect bites"  ),                                                    
(54	,"Hudson	Anna","CK",845775,47,"Conjuntivitis","insect bites"  ),                                                  
(55	,"Christian	Caroline","RA",845775,47,"Conjuntivitis","insect bites"  ),                                                      
(56	,"Hunter	Nova","RA",845775,47,"Conjuntivitis","insect bites"  ),                                                                                                                
(57	,"Connor	Genesis","RA",457789,47,"Conjuntivitis","insect bites"  ),                                                     
(58	,"Eli	Emilia","RA",457789,47,"Conjuntivitis","insect bites"  ),                                                
(59	,"Ezra	Kennedy","RA",457789,47,"Conjuntivitis","insect bites"  ),                                                 
(60	,"Aaron	Samantha","RA",457789,47,"Conjuntivitis","insect bites"  ),                                                  
(61	,"Landon	Maya","RA",457789,79,"Conjuntivitis","insect bites"  ),                                                  
(62	,"Adrian	Willow","RA",457789,79,"Conjuntivitis","insect bites"  ),                                                    
(63	,"Jonathan	Kinsley","RA",457789,79,"Conjuntivitis","N.A."          ),                                             
(64	,"Nolan	Naomi","RA",457789,79,"Conjuntivitis","N.A."          ),                                       
(65	,"Jeremiah	Aaliyah","RA",457789,79,"Conjuntivitis","N.A."          ),                                             
(66	,"Easton	Elena","RA",457789,79,"Conjuntivitis","N.A."          ),                                           
(67	,"Elias	Sarah","RA",457789,79,"Cancer","N.A."          ),                                
(68	,"Colton	Ariana","RA",457789,79,"Cancer","N.A."          ),                                     
(69	,"Cameron	Allison","RA",457789,79,"Cancer","N.A."          ),                                      
(70	,"Carson	Gabriella","RA",457789,79,"Cancer","N.A."          ),                                                                                                      
(71	,"Robert	Alice","RA",457789,79,"Cancer","N.A."          ),                                    
(72	,"Angel	Madelyn","RA",457789,79,"Cancer","N.A."          ),                                  
(73	,"Maverick	Cora","RA",457789,79,"Cancer","N.A."          ),                                   
(74	,"Nicholas	Ruby","RA",457789,79,"Cancer","N.A."          ),                                   
(75	,"Dominic	Eva","RA",457789,79,"Cancer","N.A."          ),                                  
(76	,"Jaxson	Serenity","RA",457789,79,"Cancer","N.A."          ),                                       
(77	,"Greyson	Autumn","RA",457789,79,"Cancer","N.A."          ),                                     
(78	,"Adam	Adeline","RA",457789,79,"Cancer","N.A."          ),                                  
(79	,"Ian	Hailey","RA",457789,79,"Cancer","N.A."          ),                                 
(80	,"Austin	Gianna","RA",457789,79,"Cancer","N.A."          ),                                     
(81	,"Santiago	Valentina","RA",457789,15,"Good","N.A."          ),                                        
(82	,"Jordan	Isla","GE",457789,15,"Good","N.A."          ),                                        
(83	,"Cooper	Eliana","GE",457789,15,"Good","N.A."          ),                                        
(84	,"Brayden	Quinn","GE",457789,15,"Good","N.A."          ),                                        
(85	,"Roman	Nevaeh","GE",457789,15,"Good","N.A."          ),                                        
(86	,"Evan	Ivy","GE",457789,15,"Good","N.A."          ),                                        
(87	,"Ezekiel	Sadie","GE",457789,15,"Good","N.A."          ),                                        
(88	,"Xavier	Piper","GE",457789,15,"Good","N.A."          ),                                        
(89	,"Jose	Lydia","GE",457789,15,"Good","N.A."          ),                                        
(90	,"Jace	Alexa","GE",457789,15,"Good","N.A."          ),                                        
(91	,"Jameson	Josephine","GE",457789,15,"Good","N.A."          ),                                        
(92	,"Leonardo	Emery","GE",457789,15,"Good","N.A."          ),                                        
(93	,"Bryson	Julia","GE",457789,15,"Good","N.A."          ),                                        
(94	,"Axel	Delilah","GE",457789,15,"Good","nut allregies" ),                                                 
(95	,"Everett	Arianna","GE",457789,15,"Tussis","nut allregies" ),                                                   
(96	,"Parker	Vivian","GE",457789,15,"Tussis","nut allregies" ),                                                   
(97	,"Kayden	Kaylee","GE",457789,15,"Tussis","nut allregies" ),                                                   
(98	,"Miles	Sophie","GE",354741,15,"Tussis","nut allregies" ),                                                   
(99	,"Sawyer	Brielle","GE",785464,15,"Tussis","nut allregies" ),                                            
(100,"	Jason	Madeline","GE",546512,15,"Tussis","nut allregies" );


INSERT INTO Manufacturer(ManuId,ManuName,UnitType,VaccineName,VaccineType) VALUES
(105,"ABC","state","Covaxin"    ,"Whole Virus"),
(106,"Lol","state","Novavax"    ,"Protein subunit"),
(107,"ABC","state","CanSino"    ,"Viral vector"),    
(108,"Ponf","local","AstraZeneca","Viral vector"),
(109,"ZXY","local","Moderna"    ,"Viral vector"),
(110,"ZXY","independent","Pfizer"     ,"Viral vector"),
(111,"P.At.","independent","BioNTech "  ,"nucleic acid"),
(112,"P.At.","independent","Johnson "   ,"nucleic acid");


INSERT INTO LocalBody(LocalBodyId,LocalBodyName,LocalBodyType)VALUES
(55600,"Alomere Health","Gorv and PVT hospitals"),
(55601,"Alvarado Hospital Medical Center","Gorv and PVT hospitals"),
(55602,"Baptist Health Floyd","Gorv and PVT hospitals"),
(55603,"Baptist Hospital","Gorv and PVT hospitals"),
(55604,"Anna Jaques Hospital","Gorv and PVT hospitals"),
(55605,"AnMed Health Medical Center","Gorv and PVT hospitals"),
(55606, "Geocaching","Vaccine Camps"),
(55607,"Create a stay-at-home","Vaccine Camps"),
(55608,"Adnsm CAMP","Vaccine Camps"),
(55609,"ls.st Camp","Vaccine Camps"),
(55610,"Safe Camp","Vaccine Camps"),
(55611,"WalMart","PVT labs"),
(55612,"CVS","PVT labs"),
(55613,"Walgreens","PVT labs"),
(55614,"Jskl","PVT labs"),
(55615,"WallMart","PVT labs");

INSERT INTO Patient(PId,VaccinationPhase,LocalBodyId,doseId ) VALUES
(04	,"1A",55609,101),                                                
(05	,"1A",55610,102),                                                  
(06	,"1A",55611,103),                                                     
(07	,"1A",55612,104),                                               
(08	,"1B",55613,105),                                              
(09	,"1B",55614,106),                                              
(10	,"2" ,55615,107);

INSERT INTO UnitDistribution(DistId,LocalBodyId,QtyOfDoses,ManuId,DistDate) VALUES
(2560,55613,10000,110,'2020-7-04'),
(2561,55614,20000,111,'2020-8-07'),
(2562,55615,50000,112,'2020-9-27');

INSERT INTO DistByFederalGorv(DistId,StateName,QtyDist)   VALUES
(2560,"CALIFORNIA",10000),
(2561,"ALASKA",20000),
(2562,"TEXAS",50000);

INSERT INTO DistByState(StateName,LocalBodyId,QtyObtain) VALUES
("CALIFORNIA",55613,10000),
("ALASKA",55614,20000),
("TEXAS",55615,50000);

Insert INTO Doses(PId,DoseId,ShotTime,ManuId) VALUES
(04,101,'2021-1-28',106),
(04,102,'2021-1-28',107),
(07,103,'2021-1-29',108),
(07,104,'2021-1-29',109),
(08,105,'2021-1-30',109),
(09,106,'2021-2-1' ,110),
(09,107,'2021-2-1' ,109);



#2.
Select * from distbyfederalgorv;
Select * from distbystate;
Select * from localbody;
Select * from manufacturer;
Select * from patient;
Select * from personalinfo;
Select * from unitdistribution;

#3.
select count(Doses.doseId) as VaccineShots, DistByState.statename 
from DistByState, Doses, Patient, LocalBody 
where Doses.DoseId=Patient.DoseId and Patient.LocalBodyId=DistByState.LocalBodyId
group by DistByState.statename;



#4.1
    select count(doseId) from Doses, Manufacturer
    where Doses.ManuId=ManuFacturer.ManuId
    and VaccineName='Pfizer';

#4.2
   UPDATE DistByFederalGorv
    set QtyDist=QtyDist+1000 where StateName='TEXAS';
    select * from DistByFederalGorv;

#4.3
    Set SQL_SAFE_UPDATES=0;
	UPDATE DistByState,LocalBody
    set QtyObtain=QtyObtain+500 where DistByState.localBodyId=LocalBody.LocalBodyId and LocalBodyName="Walgreens";
    select * from DistByState;
    Set SQL_SAFE_UPDATES=1;

#4.4
    INSERT INTO Manufacturer(ManuId,ManuName,UnitType,VaccineName,VaccineType) VALUES
    (113,"ronda corps","Gorv","GoCorona","ALL REMOVAL");
#4.5
    select concat("Adverse reaction for ", personalInfo.PName ," after getting ", Manufacturer.VaccineName ," administration") as "REPORT" from PersonalInfo,Manufacturer,Doses where 
    PersonalInfo.PId=Doses.Pid and Doses.ManuId=Manufacturer.ManuId and ShotTime='2021-2-1';
#5.
create trigger UpdateCDC
Before update 
on Patient
for each row
        Select if(
			Patient.VaccinationPhase<>'2',
				if(PersonalInfo.PAge>=16,
					if(
						PersonalInfo.PMedicalCond<>NULL,
						Concat(PersonalInfo.PName," of ",PersonalInfo.PAdd," should belong to Phase 2"),
						'ALL GOOD'),
					'All GOOD'),
                'All GOOD') INTO @CDCMessage;