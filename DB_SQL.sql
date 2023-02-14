CREATE DATABASE Project;

GO
CREATE PROCEDURE createAllTables
AS
BEGIN
CREATE TABLE SystemUser(
	username VARCHAR(20),
	password VARCHAR(20) NOT NULL,
	CONSTRAINT SU_PK PRIMARY KEY(username)
)
CREATE TABLE Stadium(
	id INT IDENTITY,
	name VARCHAR(20),
	location VARCHAR(20),
	capacity INT,
	status BIT NOT NULL DEFAULT(1),
	CONSTRAINT S_PK PRIMARY KEY(id)
)
CREATE TABLE Club(
	id INT IDENTITY,
	name VARCHAR(20) NOT NULL,
	location VARCHAR(20),
	CONSTRAINT C_PK PRIMARY KEY(id)
)
CREATE TABLE StadiumManager(
	id INT IDENTITY,
	name VARCHAR(20) NOT NULL,
	stadium_id INT UNIQUE,
	username VARCHAR(20) UNIQUE,
	CONSTRAINT SM_PK PRIMARY KEY(id),
	CONSTRAINT SM_FK FOREIGN KEY(username) references SystemUser(username)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	CONSTRAINT SM_FK2 FOREIGN KEY(stadium_id) references Stadium
	ON UPDATE CASCADE
	ON DELETE SET NULL
	
)
CREATE TABLE ClubRepresentative(
	id INT IDENTITY,
	name VARCHAR(20) NOT NULL,
	club_id INT UNIQUE,
	username VARCHAR(20) UNIQUE,
	CONSTRAINT CR_PK PRIMARY KEY(id),
	CONSTRAINT CR_FK FOREIGN KEY(username) references SystemUser
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	CONSTRAINT CR_FK2 FOREIGN KEY(club_id) references Club(id)
	ON UPDATE CASCADE
	ON DELETE SET NULL
)
CREATE TABLE Fan(
	national_id VARCHAR(20),
	name VARCHAR(20) NOT NULL,
	birth_date DATETIME NOT NULL,
	address VARCHAR(20),
	phone_no VARCHAR(20) UNIQUE,
	status BIT NOT NULL DEFAULT(1),
	username VARCHAR(20) UNIQUE,
	CONSTRAINT F_PK PRIMARY KEY(national_id),
	CONSTRAINT F_FK FOREIGN KEY(username) references SystemUser
	ON UPDATE CASCADE
	ON DELETE CASCADE
)
CREATE TABLE SportsAssociationManager(
	id INT IDENTITY,
	name VARCHAR(20) NOT NULL,
	username VARCHAR(20) UNIQUE,
	CONSTRAINT SA_PK PRIMARY KEY(id),
	CONSTRAINT SA_FK FOREIGN KEY(username) references SystemUser
	ON UPDATE CASCADE
	ON DELETE CASCADE
)
CREATE TABLE SystemAdmin(
	id INT IDENTITY,
	name VARCHAR(20) NOT NULL,
	username VARCHAR(20) UNIQUE,
	CONSTRAINT SAdmin_PK PRIMARY KEY(id),
	CONSTRAINT SAdmin_FK FOREIGN KEY(username) references SystemUser
	ON UPDATE CASCADE
	ON DELETE CASCADE
)

CREATE TABLE Match(
	id INT IDENTITY,
	start_time DATETIME,
	end_time DATETIME,
	host_id INT,
	guest_id INT,
	stadium_id INT,
	CONSTRAINT M_PK PRIMARY KEY(id),
	CONSTRAINT M_FK1 FOREIGN KEY(stadium_id) references Stadium
	ON UPDATE CASCADE 
	ON DELETE SET NULL,
	CONSTRAINT M_FK2 FOREIGN KEY(host_id) references Club
	ON UPDATE CASCADE  
	ON DELETE SET NULL,
	CONSTRAINT M_FK3 FOREIGN KEY(guest_id) references Club
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
)
CREATE TABLE HostRequest(
	id INT IDENTITY,
	representative_id INT,
	manager_id INT,
	match_id INT NOT NULL,
	status VARCHAR(20) DEFAULT('Uhandled') NOT NULL,
	CONSTRAINT HR_PK PRIMARY KEY(id),
	CONSTRAINT HR_FK1 FOREIGN KEY(manager_id) references StadiumManager
	ON UPDATE NO ACTION 
	ON DELETE SET NULL,
	CONSTRAINT HR_FK2 FOREIGN KEY(representative_id) references ClubRepresentative
	ON UPDATE NO ACTION
	ON DELETE NO ACTION,
	CONSTRAINT HR_FK3 FOREIGN KEY(match_id) references Match
	ON UPDATE CASCADE
	ON DELETE CASCADE
)
CREATE TABLE Ticket(
	id INT IDENTITY,
	status BIT DEFAULT(1),
	match_id INT,
	CONSTRAINT T_PK PRIMARY KEY(id),
	CONSTRAINT T_FK1 FOREIGN KEY(match_id) references Match
	ON UPDATE CASCADE
	ON DELETE CASCADE
)
CREATE TABLE TicketBuyingTransactions(
	fan_national_id VARCHAR(20),
	ticket_id INT,
	CONSTRAINT B_PK PRIMARY KEY(fan_national_id,ticket_id),
	CONSTRAINT B_FK1 FOREIGN KEY(fan_national_id) REFERENCES Fan(national_id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION,
	CONSTRAINT B_FK2 FOREIGN KEY(ticket_id) REFERENCES Ticket(id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
)
END
GO



GO
CREATE PROCEDURE dropAllTables
AS
DROP TABLE TicketBuyingTransactions
DROP TABLE Ticket
DROP TABLE HostRequest
DROP TABLE Match
DROP TABLE SystemAdmin
DROP TABLE SportsAssociationManager
DROP TABLE Fan
DROP TABLE ClubRepresentative
DROP TABLE StadiumManager
DROP TABLE Club
DROP TABLE Stadium
DROP TABLE SystemUser
GO


GO
CREATE PROCEDURE dropALLProceduresFunctionsViews
AS
DROP PROCEDURE createAllTables
DROP PROCEDURE dropAllTables;
DROP PROCEDURE clearAllTables;
DROP VIEW allAssocManagers;
DROP VIEW allClubRepresentatives;
DROP VIEW allStadiumManagers;
DROP VIEW allFans;
DROP VIEW allMatches;
DROP VIEW allTickets;
DROP VIEW allClubs;
DROP VIEW allStadiums;
DROP VIEW allRequest;
DROP PROCEDURE addAssociationManager;
DROP PROCEDURE addNewMatch;
DROP VIEW clubsWithNoMatches;
DROP PROCEDURE deleteMatch;
DROP PROCEDURE deleteMatchesOnStadium;
DROP PROCEDURE addClub;
DROP PROCEDURE addTicket;
DROP PROCEDURE deleteClub;
DROP PROCEDURE addStadium;
DROP PROCEDURE deleteStadium;
DROP PROCEDURE blockFan;
DROP PROCEDURE unblockFan;
DROP PROCEDURE addRepresentative;
DROP FUNCTION viewAvailableStadiumsON;
DROP PROCEDURE addHostRequest;
DROP FUNCTION allUnassignedMatches;
DROP PROCEDURE addStadiumManager;
DROP FUNCTION allPendingRequests;
DROP PROCEDURE acceptRequest;
DROP PROCEDURE rejectRequest;
DROP PROCEDURE addFan;
DROP FUNCTION upcomingMatchesOfClub;
DROP FUNCTION availableMatchesToAttend;
DROP PROCEDURE purchaseTicket;
DROP PROCEDURE updateMatchHost;
DROP VIEW matchesPerTeam;
DROP VIEW clubsNeverMatched;
DROP FUNCTION clubsNeverPlayed;
DROP FUNCTION matchWithHighestAttendance;
DROP FUNCTION matchesRankedByAttendance;
DROP FUNCTION requestFromClub;
DROP PROCEDURE checkLogin;
DROP PROCEDURE viewAllrelated;
DROP PROCEDURE viewAllClubMatches;
DROP PROCEDURE sendRequest;
DROP PROCEDURE viewTickets;
DROP PROCEDURE purchase;
DROP PROCEDURE projreq;
DROP PROCEDURE projreq2;
DROP PROCEDURE projreqacc;
DROP PROCEDURE projreqrej;
GO

GO
CREATE PROCEDURE clearAllTables
AS
TRUNCATE TABLE TicketBuyingTransactions

ALTER TABLE TicketBuyingTransactions 
DROP CONSTRAINT B_FK1

ALTER TABLE TicketBuyingTransactions  
DROP CONSTRAINT B_FK2

TRUNCATE TABLE Ticket

ALTER TABLE Ticket
DROP CONSTRAINT T_FK1

TRUNCATE TABLE HostRequest

ALTER TABLE HostRequest
DROP CONSTRAINT HR_FK1;

ALTER TABLE HostRequest
DROP CONSTRAINT HR_FK2;

ALTER TABLE HostRequest
DROP CONSTRAINT HR_FK3;

TRUNCATE TABLE Match

ALTER TABLE Match
DROP CONSTRAINT M_FK1

ALTER TABLE Match
DROP CONSTRAINT M_FK2

ALTER TABLE Match
DROP CONSTRAINT M_FK3

TRUNCATE TABLE SystemAdmin

ALTER TABLE SystemAdmin
DROP CONSTRAINT SAdmin_FK

TRUNCATE TABLE SportsAssociationManager

ALTER TABLE SportsAssociationManager
DROP CONSTRAINT SA_FK

TRUNCATE TABLE Fan

ALTER TABLE Fan
DROP CONSTRAINT F_FK

TRUNCATE TABLE ClubRepresentative

ALTER TABLE ClubRepresentative
DROP CONSTRAINT CR_FK

ALTER TABLE ClubRepresentative
DROP CONSTRAINT CR_FK2

TRUNCATE TABLE StadiumManager

ALTER TABLE StadiumManager
DROP CONSTRAINT SM_FK

ALTER TABLE StadiumManager
DROP CONSTRAINT SM_FK2

TRUNCATE TABLE Club
TRUNCATE TABLE Stadium
TRUNCATE TABLE SystemUser

ALTER TABLE StadiumManager
ADD CONSTRAINT SM_FK FOREIGN KEY(username) references SystemUser(username) ON UPDATE CASCADE ON DELETE CASCADE

ALTER TABLE StadiumManager
ADD CONSTRAINT SM_FK2 FOREIGN KEY(stadium_id) references Stadium ON UPDATE CASCADE ON DELETE SET NULL

ALTER TABLE ClubRepresentative
ADD CONSTRAINT CR_FK FOREIGN KEY(username) references SystemUser ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ClubRepresentative
ADD CONSTRAINT CR_FK2 FOREIGN KEY(club_id) references Club(id) ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE Fan
ADD CONSTRAINT F_FK FOREIGN KEY(username) references SystemUser ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE SportsAssociationManager
ADD CONSTRAINT SA_FK FOREIGN KEY(username) references SystemUser ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE SystemAdmin
ADD CONSTRAINT SAdmin_FK FOREIGN KEY(username) references SystemUser ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE Match
ADD CONSTRAINT M_FK1 FOREIGN KEY(stadium_id) references Stadium ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE Match
ADD CONSTRAINT M_FK2 FOREIGN KEY(host_id) references Club ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE Match
ADD CONSTRAINT M_FK3 FOREIGN KEY(guest_id) references Club ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE HostRequest
ADD CONSTRAINT HR_FK1 FOREIGN KEY(manager_id) references StadiumManager ON UPDATE NO ACTION ON DELETE SET NULL;

ALTER TABLE HostRequest
ADD CONSTRAINT HR_FK2 FOREIGN KEY(representative_id) references ClubRepresentative ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE HostRequest
ADD CONSTRAINT HR_FK3 FOREIGN KEY(match_id) references Match ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE Ticket
ADD CONSTRAINT T_FK1 FOREIGN KEY(match_id) references Match ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE TicketBuyingTransactions 
ADD CONSTRAINT B_FK1 FOREIGN KEY(fan_national_id) REFERENCES Fan(national_id) ON UPDATE CASCADE ON DELETE NO ACTION;

ALTER TABLE TicketBuyingTransactions  
ADD CONSTRAINT B_FK2 FOREIGN KEY(ticket_id) REFERENCES Ticket(id) ON UPDATE CASCADE ON DELETE NO ACTION;

GO

GO
CREATE VIEW allAssocManagers
AS
SELECT S.name,S.username,S1.password
FROM SportsAssociationManager S
INNER JOIN SystemUser S1 ON S1.username = S.username;
GO

GO
CREATE VIEW allClubRepresentatives
AS
SELECT R.username,S.password,R.name AS representative,C.name AS club_name
FROM ClubRepresentative R
INNER JOIN SystemUser S ON S.username = R.username
INNER JOIN Club C ON C.id = R.club_id;
GO

GO
CREATE VIEW allStadiumManagers
AS
SELECT M.username,S1.password,M.name AS manager_name,S.name AS stadium_name
FROM StadiumManager M
INNER JOIN SystemUser S1 ON S1.username = M.username
INNER JOIN Stadium S ON S.id = M.stadium_id;
GO

GO
CREATE VIEW allFans
AS
SELECT S.username,S.password,F.name AS fan_name,F.national_id AS fan_national_id,F.birth_date,F.status
FROM Fan F
INNER JOIN SystemUser S ON S.username = F.username;
GO

GO
CREATE VIEW allMatches
AS
SELECT C1.name AS host_club,C2.name AS guest_club,M.start_time
FROM Match M
INNER JOIN Club C1 ON C1.id = M.host_id
INNER JOIN Club C2 ON C2.id = M.guest_id;
GO

GO
CREATE VIEW allTickets
AS
SELECT T.match_id,C1.name AS host_club,C2.name AS guest_club,S.name AS stadium_name,M.start_time
FROM Ticket T 
INNER JOIN Match M ON M.id = T.match_id
INNER JOIN Club C1 ON C1.id = M.host_id
INNER JOIN Club C2 ON C2.id = M.guest_id
INNER JOIN Stadium S ON S.id = M.stadium_id;
GO

DROP VIEW allTickets;

GO
CREATE VIEW allClubs
AS
SELECT name,location
FROM Club;
GO

GO
CREATE VIEW allStadiums
AS
SELECT name,location,capacity,status
FROM Stadium;
GO

GO
CREATE VIEW allRequest
AS
SELECT C.username AS club_representative,S.username AS stadium_manager,R.status
FROM HostRequest R 
INNER JOIN ClubRepresentative C ON C.id = R.representative_id
INNER JOIN StadiumManager S ON S.id = R.manager_id;
GO

GO
CREATE PROCEDURE addAssociationManager
@name VARCHAR(20),
@username VARCHAR(20),
@password VARCHAR(20)
AS
IF @name IS NULL OR @username IS NULL or @password IS NULL
print 'One of the inputs is null'
ELSE
BEGIN
	IF EXISTS (SELECT username FROM SystemUser WHERE username = @username)
		PRINT 'Username already exist';
	ELSE
	BEGIN
	INSERT INTO SystemUser VALUES(@username,@password)
	INSERT INTO SportsAssociationManager(name,username) VALUES(@name,@username)
	END
END;
GO


GO
CREATE PROCEDURE addNewMatch
@host_club VARCHAR(20),
@guest_club VARCHAR(20),
@start_time DATETIME,
@end_time DATETIME
AS
IF @host_club IS NULL OR @guest_club IS NULL OR @start_time IS NULL OR @end_time IS NULL
print 'One of the inputs is null'
ELSE
BEGIN
	IF NOT EXISTS (SELECT id FROM Club WHERE name = @host_club)
		PRINT 'First club does not exist'
	ELSE IF NOT EXISTS (SELECT id FROM Club WHERE name = @guest_club)
		PRINT 'Second club does not exist'
	ELSE
	BEGIN
		DECLARE @host INT
		DECLARE @guest INT
		SET @host = (SELECT C.id FROM Club C WHERE C.name = @host_club);
		SET @guest = (SELECT C.id FROM Club C WHERE C.name = @guest_club);
		IF EXISTS (SELECT id FROM Match WHERE host_id = @host AND guest_id = @guest AND start_time = @start_time AND end_time = @end_time)
			PRINT 'There is already exists a match with the given info'
		ELSE
			INSERT INTO Match VALUES(@start_time,@end_time,@host,@guest,NULL);
	END
END;
GO

GO
CREATE VIEW clubsWithNoMatches
AS
SELECT C.name AS club_name
FROM Club C
EXCEPT
(
	SELECT C1.name 
	FROM Club C1 
	INNER JOIN Match M1 ON M1.guest_id = C1.id
	UNION
	SELECT C1.name 
	FROM Club C1 
	INNER JOIN Match M1 ON M1.host_id = C1.id
);
GO

GO
CREATE PROCEDURE deleteMatch
@host_club VARCHAR(20),
@guest_club VARCHAR(20),
@start_time DATETIME,
@end_time DATETIME
AS
BEGIN
IF  @host_club IS NULL OR @guest_club IS NULL
	print 'One of the inputs is null'
ELSE IF NOT EXISTS (SELECT id FROM Club WHERE name = @host_club)
	PRINT 'First club does not exist'
ELSE IF NOT EXISTS (SELECT id FROM Club WHERE name = @guest_club)
	PRINT 'Second club does not exist'
ELSE
	BEGIN
	DECLARE @host INT
	DECLARE @guest INT
	SET @host = (SELECT C.id FROM Club C WHERE C.name = @host_club)
	SET @guest = (SELECT C.id FROM Club C WHERE C.name = @guest_club)
	IF NOT EXISTS(SELECT id FROM Match WHERE guest_id = @guest AND host_id = @host)
		PRINT 'No match exists with the given info'
	ELSE
		DELETE FROM Match WHERE guest_id = @guest AND host_id = @host AND start_time = @start_time AND end_time = @end_time
	END
END;
GO


GO
CREATE PROCEDURE deleteMatchesOnStadium
@stadium_name VARCHAR(20)
AS
BEGIN
	IF @stadium_name IS NULL
		print 'stadium is null'
	ELSE IF NOT EXISTS(SELECT id FROM Stadium WHERE name = @stadium_name)
		PRINT 'The given stadium does not exists'
	ELSE
		BEGIN 
		DECLARE @stadium_id INT
		SET @stadium_id = (SELECT S.id FROM Stadium S WHERE S.name = @stadium_name)
		DELETE FROM Match WHERE stadium_id = @stadium_id AND end_time > CURRENT_TIMESTAMP
		END
END;
GO

GO
CREATE PROCEDURE addClub
@club_name VARCHAR(20),
@location VARCHAR(20)
AS
BEGIN
IF @club_name IS NULL OR @location IS NULL
	print 'One of the inputs is null'
ELSE IF EXISTS (SELECT name FROM Club WHERE name = @club_name AND location = @location)
	PRINT 'There a club exists with given info'
ELSE
	INSERT INTO Club VALUES(@club_name,@location)
END;
GO

GO
CREATE PROCEDURE addTicket
@host_name VARCHAR(20),
@guest_name VARCHAR(20),
@date_time DATETIME
AS
BEGIN
	IF @host_name IS NULL OR @guest_name IS NULL OR @date_time IS NULL
		PRINT 'One of the inputs is null'
	ELSE IF NOT EXISTS (SELECT name FROM Club WHERE name = @host_name)
		PRINT 'The host club with the given name does not exists'
	ELSE IF NOT EXISTS (SELECT name FROM Club WHERE name = @guest_name)
		PRINT 'The guest club with the given name does not exists'
	ELSE
	BEGIN
	DECLARE @host_id INT
	DECLARE @guest_id INT
	DECLARE @match_id INT
	DECLARE @req VARCHAR(20)
	SET @host_id = (SELECT id FROM Club WHERE name = @host_name)
	SET @guest_id = (SELECT id FROM Club WHERE name = @guest_name)
	SET @match_id = (SELECT id FROM Match WHERE guest_id = @guest_id AND host_id = @host_id AND start_time = @date_time)
		IF @match_id IS NULL
			print 'No match exists with the given inputs'
		ELSE 
			BEGIN 
					INSERT INTO Ticket VALUES(1,@match_id)
			END
	END
END;
GO


GO
CREATE PROCEDURE deleteClub
@club_name VARCHAR(20)
AS
IF @club_name IS NULL
PRINT 'One of the inputs is null'
ELSE
BEGIN
	DECLARE @club_id INT
	SET @club_id = (SELECT id FROM Club WHERE name = @club_name)
		IF @club_id IS NULL
			PRINT 'No club with the given information exists'
		ELSE
			BEGIN
			UPDATE Match SET host_id = NULL WHERE host_id = @club_id
			UPDATE Match SET guest_id = NULL WHERE guest_id = @club_id
			DELETE FROM Club WHERE id = @club_id
			END
END;
GO

GO
CREATE PROCEDURE addStadium
@stadium_name VARCHAR(20),
@stadium_location VARCHAR(20),
@capacity INT
AS
BEGIN
	IF @stadium_name IS NULL OR @stadium_location IS NULL OR @capacity IS NULL
		PRINT 'One of the inputs is null'
	ELSE IF EXISTS (SELECT * FROM Stadium WHERE name = @stadium_name AND location = @stadium_location AND capacity = @capacity)
		PRINT 'There exists a stadium with the given information'
	ELSE
		INSERT INTO Stadium VALUES(@stadium_name,@stadium_location,@capacity,1);
END;
GO

GO
CREATE PROCEDURE deleteStadium
@stadium_name VARCHAR(20)
AS
BEGIN
IF @stadium_name IS NULL
	PRINT 'The stadium name given is null'
ELSE
	BEGIN
	DECLARE @stadium_id INT
	SET @stadium_id = (SELECT id FROM Stadium WHERE name = @stadium_name)
	IF @stadium_id IS NULL 
		PRINT 'No stadium exists with the given name'
	ELSE
		DELETE FROM Stadium WHERE id = @stadium_id
	END
END
GO

GO
CREATE PROCEDURE blockFan
@national_id VARCHAR(20)
AS
BEGIN
IF @national_id IS NULL
	PRINT 'The nationalIdNumber given is null'
ELSE
	BEGIN
	DECLARE @id VARCHAR(20)
	SET @id = (SELECT national_id FROM Fan WHERE national_id = @national_id)
	IF @id IS NULL
		PRINT 'No Fan exist with the given nationalIdNumber'
	ELSE
		BEGIN
		DECLARE @status INT
		SET @status = (SELECT status FROM Fan WHERE national_id = @id)
		IF @status = 0
			PRINT 'Fan is already blocked'
		ELSE
			UPDATE Fan SET status = 0 WHERE national_id = @id
		END
	END
END;
GO


GO
CREATE PROCEDURE unblockFan
@national_id VARCHAR(20)
AS
BEGIN
IF @national_id IS NULL
	PRINT 'The nationalIdNumber given is null'
ELSE
	BEGIN
	DECLARE @id VARCHAR(20)
	SET @id = (SELECT national_id FROM Fan WHERE national_id = @national_id)
	IF @id IS NULL
		PRINT 'No Fan exist with the given nationalIdNumber'
	ELSE
		BEGIN
		DECLARE @status INT
		SET @status = (SELECT status FROM Fan WHERE national_id = @id)
		IF @status = 1
			PRINT 'Fan is already unblocked'
		ELSE
			UPDATE Fan SET status = 1 WHERE national_id = @id
		END
	END
END;
GO


GO
CREATE PROCEDURE addRepresentative
@name VARCHAR(20),
@club_name VARCHAR(20),
@username VARCHAR(20),
@password VARCHAR(20)
AS
BEGIN
IF @name IS NULL OR @club_name IS NULL OR @username IS NULL OR @password IS NULL
	PRINT 'One of the given inputs is null'
ELSE
	BEGIN
		IF NOT EXISTS(SELECT id FROM Club WHERE name = @club_name)
			PRINT 'No club exist with the given name'
		ELSE IF EXISTS(SELECT username FROM SystemUser WHERE username = @username)
			PRINT 'Username already exists'
		ELSE
			BEGIN
			IF NOT EXISTS(SELECT * FROM ClubRepresentative R INNER JOIN Club C ON C.id = R.club_id WHERE C.name = @club_name)
				BEGIN
				DECLARE @id INT
				SET @id = (SELECT id FROM Club WHERE name = @club_name)
				INSERT INTO SystemUser VALUES(@username,@password)
				INSERT INTO ClubRepresentative VALUES(@name,@id,@username)
				END
			ELSE
				PRINT 'The club given already has a representative'
			END
	END
END;
GO

GO
CREATE FUNCTION viewAvailableStadiumsON
(@date DATETIME)
RETURNS TABLE
AS
	RETURN 
		SELECT S.name,S.location,S.capacity
		FROM Stadium S
		WHERE S.status = 1 AND NOT EXISTS(
			SELECT S1.id 
			FROM Stadium S1
			INNER JOIN Match M ON M.stadium_id = S1.id
			WHERE CAST(M.start_time AS date) = CAST(@date AS date) AND S.id = S1.id)

GO

GO
CREATE PROCEDURE addHostRequest
@club_name VARCHAR(20),
@stadium_name VARCHAR(20),
@start_time DATETIME,
@end_time DATETIME
AS
BEGIN
	IF @club_name IS NULL OR @stadium_name IS NULL OR @start_time IS NULL OR @end_time IS NULL
		PRINT 'One of the inputs is null'
	ELSE IF NOT EXISTS (SELECT name FROM Club WHERE name = @club_name)
		PRINT 'No club exits with the given name'
	ELSE IF NOT EXISTS (SELECT name FROM Stadium WHERE name = @stadium_name)
		PRINT 'No stadium exists with the given name'
	ELSE
		BEGIN
		DECLARE @host_id INT
		DECLARE @stadium_manger INT
		DECLARE @match_id INT
		DECLARE @club_R INT
		SET @host_id = (SELECT id FROM Club WHERE name = @club_name)
		SET @club_R = (SELECT id FROM ClubRepresentative WHERE club_id = @host_id)
		SET @stadium_manger = (
								SELECT S.id
								FROM StadiumManager S
								INNER JOIN Stadium S1 ON S1.id = S.stadium_id
								WHERE S1.name = @stadium_name)
		SET @match_id = (SELECT M.id 
						 FROM Match M
						 WHERE M.host_id = @host_id AND M.start_time = @start_time AND M.end_time = @end_time AND M.stadium_id IS NULL)
		IF @club_R IS NULL
			PRINT 'The given club does not have a representative'
		ELSE IF @stadium_manger IS NULL
			PRINT 'The given stadium does not have a manager'
		ELSE IF @match_id IS NULL
			PRINT 'There is no match to host with the given information'
		ELSE IF EXISTS(SELECT * FROM HostRequest WHERE representative_id = @club_R AND manager_id = @stadium_manger AND match_id = @match_id)
			PRINT 'Request is already sent'
		ELSE
			INSERT INTO HostRequest VALUES(@club_R,@stadium_manger,@match_id,'Unhandled')
		END
END
GO

GO
CREATE FUNCTION allUnassignedMatches(@club_name VARCHAR(20))
RETURNS TABLE
AS
	RETURN 
	SELECT C.name AS competing_club,M.start_time
	FROM Club C
	INNER JOIN Match M ON M.guest_id = C.id
	WHERE M.stadium_id IS NULL AND M.host_id = (SELECT id FROM Club WHERE name = @club_name)

GO

GO
CREATE PROCEDURE addStadiumManager
@name VARCHAR(20),
@stadium_name VARCHAR(20),
@username VARCHAR(20),
@password VARCHAR(20)
AS
BEGIN
IF @name IS NULL OR @stadium_name IS NULL OR @username IS NULL OR @password IS NULL
	PRINT 'One of the given inputs is null'
ELSE
	BEGIN
		IF NOT EXISTS(SELECT id FROM Stadium WHERE name = @stadium_name)
			PRINT 'No stadium exist with the given name'
		ELSE IF EXISTS(SELECT username FROM SystemUser WHERE username = @username)
			PRINT 'Username already exists'
		ELSE
			BEGIN
			IF NOT EXISTS(SELECT * FROM StadiumManager S INNER JOIN Stadium S1 ON S1.id = S.stadium_id WHERE S1.name = @stadium_name)
				BEGIN
				DECLARE @id INT
				SET @id = (SELECT id FROM Stadium WHERE name = @stadium_name)
				INSERT INTO SystemUser VALUES(@username,@password)
				INSERT INTO StadiumManager VALUES(@name,@id,@username)
				END
			ELSE
				PRINT 'The stadium given already has a manager'
			END
	END
END;
GO

GO
CREATE FUNCTION allPendingRequests(@stadium_manager_username VARCHAR(20))
RETURNS TABLE 
AS
	RETURN 
			SELECT R.name AS club_representative,C.name AS competing_club,start_time
			FROM ClubRepresentative R
			INNER JOIN HostRequest H ON H.representative_id = R.id
			INNER JOIN Match M ON M.id = H.match_id
			INNER JOIN Club C ON C.id = M.guest_id
			WHERE H.manager_id = (SELECT id FROM StadiumManager WHERE username = @stadium_manager_username) AND H.status = 'unhandled'

GO

GO
CREATE PROCEDURE acceptRequest
@manager_username VARCHAR(20),
@host_name VARCHAR(20),
@guest_name VARCHAR(20),
@date DATETIME
AS
BEGIN
	IF @manager_username IS NULL OR @host_name IS NULL OR @date IS NULL
		PRINT 'One of the given inputs is null'
	ELSE
		BEGIN
		DECLARE @manager_id INT
		DECLARE @match_id INT
		DECLARE @representative INT
		DECLARE @host_id INT
		DECLARE @guest_id INT
		DECLARE @req INT
		SET @manager_id = (SELECT id FROM StadiumManager WHERE username = @manager_username)
		SET @host_id = (SELECT id FROM Club WHERE name = @host_name)
		SET @guest_id = (SELECT id FROM Club WHERE name = @guest_name)
		SET @representative = (SELECT id FROM ClubRepresentative WHERE club_id = @host_id)
		SET @match_id = (SELECT id FROM Match WHERE start_time = @date AND host_id = @host_id AND guest_id = @guest_id)
		IF @manager_id IS NULL
			PRINT 'Stadium manager given does not exists'
		ELSE IF @host_id IS NULL
			PRINT 'The host name given does not exists'
		ELSE IF @guest_id IS NULL
			PRINT 'The guest name given does not exist'
		ELSE IF @representative IS NULL
			PRINT 'The club does not have a representative'
		ELSE IF @match_id IS NULL
			PRINT 'The match does not exist'
		ELSE	
			BEGIN
			SET @req = (SELECT id FROM HostRequest WHERE representative_id = @representative AND manager_id = @manager_id AND match_id = @match_id)
			IF @req IS NULL
				PRINT 'No request exists with the given info'
			ELSE IF EXISTS(SELECT id FROM HostRequest WHERE representative_id = @representative AND manager_id = @manager_id AND match_id = @match_id AND status = 'Accepted')
				PRINT 'Request already accepted'
			ELSE
				BEGIN
					DECLARE @stadium_id INT
					SET @stadium_id = (SELECT id FROM StadiumManager WHERE id = @manager_id)
					EXEC addTicket @host_name,@guest_name,@date
					DECLARE @capacity INT 
					SET @capacity = (SELECT S.capacity 
										FROM Stadium S
										WHERE S.id = @stadium_id)

					UPDATE HostRequest SET status = 'Accepted' WHERE id = @req
					UPDATE Match SET stadium_id = @stadium_id WHERE id = @match_id
			
					WHILE @capacity > 0
					BEGIN
						EXEC addTicket @host_name,@guest_name,@date
						SET @capacity = @capacity - 1

					END;
				END
			END
				
		END
END;
GO

GO
CREATE PROCEDURE rejectRequest
@manager_username VARCHAR(20),
@host_name VARCHAR(20),
@guest_name VARCHAR(20),
@date DATETIME
AS
BEGIN
	IF @manager_username IS NULL OR @host_name IS NULL OR @date IS NULL
		PRINT 'One of the given inputs is null'
	ELSE
		BEGIN
		DECLARE @manager_id INT
		DECLARE @match_id INT
		DECLARE @representative INT
		DECLARE @host_id INT
		DECLARE @guest_id INT
		DECLARE @req INT
		SET @manager_id = (SELECT id FROM StadiumManager WHERE name = @manager_username)
		SET @host_id = (SELECT id FROM Club WHERE name = @host_name)
		SET @guest_id = (SELECT id FROM Club WHERE name = @guest_name)
		SET @representative = (SELECT id FROM ClubRepresentative WHERE club_id = @host_id)
		SET @match_id = (SELECT id FROM Match WHERE start_time = @date AND host_id = @host_id AND guest_id = @guest_id)
		IF @manager_id IS NULL
			PRINT 'Stadium manager given does not exists'
		ELSE IF @host_id IS NULL
			PRINT 'The host name given does not exists'
		ELSE IF @guest_id IS NULL
			PRINT 'The guest name given does not exist'
		ELSE IF @representative IS NULL
			PRINT 'The club does not have a representative'
		ELSE IF @match_id IS NULL
			PRINT 'The match does not exist'
		ELSE	
			BEGIN
			SET @req = (SELECT id FROM HostRequest WHERE representative_id = @representative AND manager_id = @manager_id AND match_id = @match_id)
			IF @req IS NULL
				PRINT 'No request exists with the given info'
			ELSE IF EXISTS(SELECT id FROM HostRequest WHERE representative_id = @representative AND manager_id = @manager_id AND match_id = @match_id AND status = 'Rejected')
				PRINT 'Request is already rejected'
			ELSE
				UPDATE HostRequest SET status = 'Rejected' WHERE id = @req
			END
				
		END
END;
GO

GO
CREATE PROCEDURE addFan
@name VARCHAR(20),
@username VARCHAR(20),
@password VARCHAR(20),
@national_id VARCHAR(20),
@birth_date DATETIME,
@address VARCHAR(20),
@number INT
AS
BEGIN
IF @name IS NULL OR @national_id IS NULL OR @birth_date IS NULL OR @address IS NULL OR @number IS NULL
	PRINT 'One of the given inputs is null'
ELSE IF EXISTS (SELECT national_id FROM Fan WHERE national_id = @national_id)
	PRINT 'There is a fan with the given national id'
ELSE IF EXISTS (SELECT phone_no FROM Fan WHERE phone_no = @number)
	PRINT 'There is fan exists with the given phone no'
ELSE IF EXISTS (SELECT username FROM SystemUser WHERE username = @username)
	PRINT 'Username already exists'
ELSE
	BEGIN
		INSERT INTO SystemUser VALUES(@username,@password)
		INSERT INTO Fan VALUES(@national_id,@name,@birth_date,@address,@number,1,@username)
	END

END
GO

GO
CREATE FUNCTION upcomingMatchesOfClub(@club_name VARCHAR(20))
RETURNS TABLE
AS 
	RETURN (SELECT C1.name AS given_club,C2.name AS competing_club,M.start_time AS start_time,S.name AS stadium_name
			FROM Club C1
			INNER JOIN Match M ON M.host_id = C1.id
			INNER JOIN Club C2 ON C2.id = M.guest_id
			INNER JOIN Stadium S ON S.id = M.stadium_id
			WHERE C1.name = @club_name AND M.end_time > CURRENT_TIMESTAMP)
			UNION
			(SELECT C1.name AS given_club,C2.name AS competing_club,M.start_time AS start_time,S.name AS stadium_name
			FROM Club C1
			INNER JOIN Match M ON M.guest_id = C1.id
			INNER JOIN Club C2 ON C2.id = M.host_id
			INNER JOIN Stadium S ON S.id = M.stadium_id
			WHERE C1.name = @club_name AND M.end_time > CURRENT_TIMESTAMP)
GO


GO
CREATE FUNCTION availableMatchesToAttend(@date DATETIME)
RETURNS TABLE
AS
	RETURN SELECT C1.name AS host_club,C2.name AS guest_club,M.start_time AS start_time,S.name AS stadium_name
			FROM Club C1
			INNER JOIN Match M ON M.host_id = C1.id
			INNER JOIN Club C2 ON C2.id = M.guest_id
			INNER JOIN Stadium S ON S.id = M.stadium_id
			WHERE M.end_time > @date AND EXISTS ( SELECT *
									     			FROM Ticket T
													WHERE T.status = 1 AND T.match_id = M.id)
GO

GO
CREATE PROCEDURE purchaseTicket
@national_id VARCHAR(20),
@host_club VARCHAR(20),
@guest_club VARCHAR(20),
@datetime DATETIME
AS
BEGIN
	IF @national_id IS NULL OR @host_club IS NULL OR @guest_club IS NULL OR @datetime IS NULL
		PRINT 'One of the given inputs is null'
	ELSE IF NOT EXISTS(SELECT id FROM Club WHERE name = @host_club )
		PRINT 'The given host club does not exist'
	ELSE IF NOT EXISTS(SELECT id FROM Club WHERE name = @guest_club)
		PRINT 'The given guest club does not exist'
	ELSE IF NOT EXISTS (SELECT national_id FROM Fan WHERE national_id = @national_id)
		PRINT 'No fan exist with the given national id'
	ELSE
		BEGIN
		DECLARE @host_id INT
		DECLARE @guest_id INT
		DECLARE @match_id INT
		SET @host_id = (SELECT id FROM Club WHERE name = @host_club)
		SET @guest_id = (SELECT id FROM Club WHERE name = @guest_club)
		SET @match_id = (SELECT id FROM Match WHERE host_id = @host_id AND guest_id = @guest_id AND CAST(start_time AS DATE) = CAST(@datetime AS date))
		IF @match_id IS NULL
			PRINT 'No match exist with given info';
		ELSE IF NOT EXISTS(SELECT * FROM Ticket WHERE match_id = @match_id AND status = 1)
			PRINT 'No tickets are available for the given match'
		ELSE
			BEGIN
				DECLARE @ticket_id INT
				SET @ticket_id = (SELECT TOP 1 id FROM Ticket WHERE match_id = @match_id AND status = 1 )
				UPDATE Ticket SET status = 0 WHERE id = @ticket_id;
				INSERT INTO TicketBuyingTransactions VALUES(@national_id,@ticket_id)
			END
			
		END

END;
GO

GO
CREATE PROCEDURE updateMatchHost
@host VARCHAR(20),
@guest VARCHAR(20),
@start_time DATETIME
AS
BEGIN
	IF @host IS NULL OR @guest IS NULL OR @start_time IS NULL
		PRINT 'One of the inputs given is null'
	ELSE IF NOT EXISTS (SELECT id FROM Club WHERE name = @host)
		PRINT 'The given host club does not exist'
	ELSE IF NOT EXISTS (SELECT id FROM Club WHERE name = @guest)
		PRINT 'The given guest club does not exist'
	ELSE 
		BEGIN
			DECLARE @host_id INT
			DECLARE @guest_id INT
			DECLARE @match_id INT
			DECLARE @represenatative INT
			SET @host_id = (SELECT id FROM Club WHERE name = @host)
			SET @guest_id = (SELECT id FROM Club WHERE name = @guest)
			SET @match_id = (SELECT id FROM Match WHERE host_id = @host_id AND guest_id = @guest_id AND start_time = @start_time)
			SET @represenatative = (SELECT id FROM ClubRepresentative WHERE club_id = @guest_id)
			IF @match_id IS NULL
				PRINT 'There is no match exist with the given information'
			ELSE
				BEGIN
					UPDATE HostRequest SET representative_id = @represenatative WHERE match_id = @match_id
					UPDATE Match SET host_id = @guest_id WHERE id = @match_id
					UPDATE Match SET guest_id = @host_id WHERE id = @match_id
				END

		END


END;
GO


GO
CREATE VIEW matchesPerTeam
AS
	SELECT club_name,SUM(X1) AS matches_played
	FROM ((SELECT C.name AS club_name,COUNT(M.id) AS X1
	FROM Club C
	INNER JOIN Match M ON M.host_id = C.id
	WHERE M.end_time <= CURRENT_TIMESTAMP
	GROUP BY C.name)
	UNION ALL
	(SELECT C.name AS club_name,COUNT(M.id) AS X1
	FROM Club C
	INNER JOIN Match M ON M.guest_id = C.id
	WHERE M.end_time <= CURRENT_TIMESTAMP
	GROUP BY C.name)) AS t(club_name,X1)
	GROUP BY club_name

GO

GO
CREATE VIEW clubsNeverMatched
AS
	SELECT C1.name AS first_club,C2.name AS second_club
	FROM Club C1,Club C2
	WHERE C1.id < C2.id AND NOT EXISTS (SELECT id
						FROM Match 
						WHERE host_id = C1.id AND guest_id = C2.id AND end_time <= CURRENT_TIMESTAMP)
	INTERSECT
	SELECT C1.name AS first_club,C2.name AS second_club
	FROM Club C1,Club C2
	WHERE C1.id < C2.id AND NOT EXISTS (SELECT id
						FROM Match 
						WHERE guest_id = C1.id AND host_id = C2.id AND end_time <= CURRENT_TIMESTAMP)
GO

GO
CREATE FUNCTION clubsNeverPlayed(@club_name VARCHAR(20))
RETURNS TABLE
AS 
	RETURN 
			SELECT C.name
			FROM Club C
			WHERE C.name <> @club_name
			EXCEPT ( SELECT C1.name
					 FROM Club C1
					 INNER JOIN Match M ON M.host_id = C1.id
					 INNER JOIN Club C2 ON C2.id = M.guest_id
					 WHERE C2.name = @club_name AND M.end_time <= CURRENT_TIMESTAMP
					 UNION
					 SELECT C1.name
					 FROM Club C1
					 INNER JOIN Match M ON M.guest_id = C1.id
					 INNER JOIN Club C2 ON C2.id = M.host_id
					 WHERE C2.name = @club_name AND M.end_time <= CURRENT_TIMESTAMP)
GO

GO
CREATE FUNCTION matchWithHighestAttendance()
RETURNS TABLE
AS	
	RETURN 
		SELECT C1.name AS host_club,C2.name AS guest_club
		FROM Club C1
		INNER JOIN Match M ON M.host_id = C1.id
		INNER JOIN Club C2 ON C2.id = M.guest_id
		WHERE M.id IN (SELECT M1.id 
							FROM Match M1
							INNER JOIN Ticket T1 ON T1.match_id = M1.id
							WHERE T1.status = 0
							GROUP BY M1.id
							HAVING COUNT(T1.id) >= (SELECT MAX(X)
													FROM (SELECT T2.match_id,COUNT(*) AS X
														FROM Ticket T2
														WHERE T2.status = 0
														GROUP BY T2.match_id) AS T(match_id,X)))

GO

GO
CREATE FUNCTION matchesRankedByAttendance()
RETURNS TABLE
AS
	RETURN
		
		SELECT TOP 100 C1.name AS host_club,C2.name AS guest_club, COUNT(T.id)  AS sold_tickets
		FROM Club C1
		INNER JOIN Match M ON M.host_id = C1.id
		INNER JOIN Club C2 ON C2.id = M.guest_id
		INNER JOIN Ticket T ON T.match_id = M.id
		WHERE T.status = 0 
		GROUP BY C1.name,C2.name,M.id
		ORDER BY COUNT(*) DESC
GO

GO
CREATE FUNCTION requestFromClub(@stadium_name VARCHAR(20),@club_name VARCHAR(20))
RETURNS TABLE
AS	
	RETURN 
			SELECT C1.name AS host_club,C2.name AS guest_club
			FROM Club C1
			INNER JOIN Match M ON M.host_id = C1.id
			INNER JOIN Club C2 ON C2.id = M.guest_id
			INNER JOIN HostRequest R ON R.match_id = M.id
			INNER JOIN Stadium S ON S.id = M.stadium_id
			INNER JOIN StadiumManager S1 ON S1.stadium_id = S.id
			INNER JOIN ClubRepresentative CC ON CC.club_id = C1.id
			WHERE C1.name = @club_name AND S.name = @stadium_name AND R.manager_id = S1.id AND R.representative_id = CC.id
GO

GO
CREATE PROCEDURE checkLogin
@username VARCHAR(20),
@password VARCHAR(20),
@check INT OUTPUT,
@success INT OUTPUT
AS
	IF NOT EXISTS (SELECT * FROM SystemUser WHERE username = @username)
		PRINT 'Username does not exist';
	ELSE
		BEGIN
		SET @success = 1;
			IF EXISTS (SELECT * FROM SystemAdmin WHERE username = @username)
				BEGIN 
					IF @password = (SELECT password FROM SystemUser WHERE username = @username)
						SET @check = 1;
					ELSE
						PRINT 'Invalid Username or Password';
				END
			ELSE IF EXISTS (SELECT * FROM SportsAssociationManager WHERE username = @username)
				BEGIN 
					IF @password = (SELECT password FROM SystemUser WHERE username = @username)
						SET @check = 2;
					ELSE
						PRINT 'Invalid Username or Password';
				END
			ELSE IF EXISTS (SELECT * FROM ClubRepresentative WHERE username = @username)
				BEGIN 
					IF @password = (SELECT password FROM SystemUser WHERE username = @username)
						SET @check = 3;
					ELSE
						PRINT 'Invalid Username or Password';
				END
			ELSE IF EXISTS (SELECT * FROM StadiumManager WHERE username = @username)
				BEGIN 
					IF @password = (SELECT password FROM SystemUser WHERE username = @username)
						SET @check = 4;
					ELSE
						PRINT 'Invalid Username or Password';
				END
			ELSE IF EXISTS (SELECT * FROM Fan WHERE username = @username)
				BEGIN 
					IF @password = (SELECT password FROM SystemUser WHERE username = @username)
						SET @check = 5;
					ELSE
						PRINT 'Invalid Username or Password'
				END
			ELSE 
				SET @success = 0
				
		END
GO

GO
CREATE PROCEDURE viewAllrelated
@username VARCHAR(20)
AS
BEGIN
	IF NOT EXISTS(SELECT C.id FROM Club C INNER JOIN ClubRepresentative C1 ON C1.club_id = C.id WHERE C1.username = @username)
		PRINT 'No information is valid about the club you are representing';

	ELSE
		BEGIN
			SELECT C.name AS club_name,C.location AS club_location
			FROM Club C
			INNER JOIN ClubRepresentative C1 ON C1.club_id = C.id
			INNER JOIN SystemUser S ON S.username = C1.username
			WHERE S.username = @username
		END
END
GO

GO
CREATE PROCEDURE viewAllClubMatches
@username VARCHAR(20)
AS
BEGIN
		DECLARE @club_name VARCHAR(20)
		SET @club_name = (SELECT Distinct C.name
							FROM Club C
							INNER JOIN ClubRepresentative C1 ON C1.club_id = C.id
							WHERE C1.username = @username)

		SELECT C1.name AS host_club,C2.name AS guest_club,M.start_time AS start_time,M.end_time AS end_time,S.name AS stadium_name
		FROM Club C1
		INNER JOIN Match M ON M.host_id = C1.id
		INNER JOIN Club C2 ON C2.id = M.guest_id
		LEFT OUTER JOIN Stadium S ON S.id = M.stadium_id
		WHERE C1.name = @club_name AND M.end_time > CURRENT_TIMESTAMP
		UNION
		SELECT C1.name AS host_club,C2.name AS guest_club,M.start_time AS start_time,M.end_time AS end_time,S.name AS stadium_name
		FROM Club C1
		INNER JOIN Match M ON M.host_id = C1.id
		INNER JOIN Club C2 ON C2.id = M.guest_id
		LEFT OUTER JOIN Stadium S ON S.id = M.stadium_id
		WHERE C2.name = @club_name AND M.end_time > CURRENT_TIMESTAMP

END
GO

GO
CREATE PROCEDURE sendRequest
@username VARCHAR(20),
@stadium_name VARCHAR(20),
@start_time DATETIME,
@end_time DATETIME
AS
BEGIN
		DECLARE @club_name VARCHAR(20)
		SET @club_name = (SELECT Distinct C.name
							FROM Club C
							INNER JOIN ClubRepresentative C1 ON C1.club_id = C.id
							WHERE C1.username = @username)

		EXEC addHostRequest @club_name,@stadium_name,@start_time,@end_time

END
GO

GO
CREATE PROCEDURE viewTickets
@datetime DATETIME
AS
BEGIN
	IF @datetime < CURRENT_TIMESTAMP
		PRINT 'No tickets is available at that time'
	ELSE IF NOT EXISTS( SELECT DISTINCT(T.match_id)
							FROM Ticket T
							INNER JOIN Match M ON M.id = T.match_id
							INNER JOIN Club C1 ON C1.id = M.host_id
							INNER JOIN Club C2 ON C2.id = M.guest_id
							INNER JOIN Stadium S ON S.id = M.stadium_id
							WHERE T.status = 1 AND M.start_time = @datetime)
		PRINT 'No tickets is available at that time'
	ELSE 
		SELECT DISTINCT(T.match_id) AS match_number,C1.name AS host_club,C2.name AS guest_club,S.name AS stadium_name,S.location AS stadium_location
							FROM Ticket T
							INNER JOIN Match M ON M.id = T.match_id
							INNER JOIN Club C1 ON C1.id = M.host_id
							INNER JOIN Club C2 ON C2.id = M.guest_id
							INNER JOIN Stadium S ON S.id = M.stadium_id
							WHERE T.status = 1 AND M.start_time = @datetime
END
GO


GO
CREATE PROCEDURE purchase
@username VARCHAR(20),
@host_club VARCHAR(20),
@guest_club VARCHAR(20),
@datetime DATETIME
AS
BEGIN
	IF EXISTS (SELECT * 
				FROM Fan
				WHERE username = @username AND status = 0)
				PRINT 'You are not allowed to purchase a ticket';
	ELSE 
	BEGIN 
			DECLARE @nationalID VARCHAR(20)
			SET @nationalID = (SELECT national_id FROM Fan WHERE username = @username)

			EXEC purchaseTicket @nationalID,@host_club,@guest_club,@datetime

	END
		

END
GO


GO
CREATE PROCEDURE projreq
(@username VARCHAR(20))
AS
SELECT s.* 
FROM StadiumManager sm INNER JOIN Stadium s ON sm.stadium_id = s.id INNER JOIN SystemUser u ON u.username = sm.username
WHERE sm.username = @username
GO

GO
CREATE PROC projreq2
(@username VARCHAR(20))
AS
SELECT DISTINCT cr.name AS representative , ch.name AS Host , cg.name AS Guest , m.start_time AS StartTime , m.end_time AS EndTime, hr.status AS Status
FROM Stadium s 
INNER JOIN StadiumManager sm ON s.id = sm.stadium_id 
INNER JOIN HostRequest hr ON hr.manager_id = sm.id
INNER JOIN ClubRepresentative cr ON cr.id = hr.representative_id
INNER JOIN Club ch ON ch.id = cr.club_id
INNER JOIN Match m ON m.host_id = cr.club_id
INNER JOIN Club cg ON cg.id = m.guest_id
WHERE sm.username = @username AND hr.status = 'UNHANDLED'
GO

GO
CREATE PROCEDURE projreqacc
@manager_username VARCHAR(20),
@host_name VARCHAR(20),
@guest_name VARCHAR(20),
@date DATETIME
AS
BEGIN
	IF @manager_username IS NULL OR @host_name IS NULL OR @date IS NULL
		PRINT 'One of the given inputs is null'
	ELSE
		BEGIN
		DECLARE @manager_id INT
		DECLARE @match_id INT
		DECLARE @representative INT
		DECLARE @host_id INT
		DECLARE @guest_id INT
		DECLARE @req INT
		SET @manager_id = (SELECT id FROM StadiumManager WHERE username = @manager_username)
		SET @host_id = (SELECT id FROM Club WHERE name = @host_name)
		SET @guest_id = (SELECT id FROM Club WHERE name = @guest_name)
		SET @representative = (SELECT id FROM ClubRepresentative WHERE club_id = @host_id)
		SET @match_id = (SELECT id FROM Match WHERE start_time = @date AND host_id = @host_id AND guest_id = @guest_id)
		IF @manager_id IS NULL
			PRINT 'Stadium manager given does not exists'
		ELSE IF @host_id IS NULL
			PRINT 'The host name given does not exists'
		ELSE IF @guest_id IS NULL
			PRINT 'The guest name given does not exist'
		ELSE IF @representative IS NULL
			PRINT 'The club does not have a representative'
		ELSE IF @match_id IS NULL
			PRINT 'The match does not exist'
		ELSE	
			BEGIN
			SET @req = (SELECT id FROM HostRequest WHERE representative_id = @representative AND manager_id = @manager_id AND match_id = @match_id)
			IF @req IS NULL
				PRINT 'No request exists with the given info'
			ELSE IF EXISTS(SELECT id FROM HostRequest WHERE representative_id = @representative AND manager_id = @manager_id AND match_id = @match_id AND status = 'Accepted')
				PRINT 'Request already accepted'
			ELSE IF EXISTS(SELECT id FROM HostRequest WHERE representative_id = @representative AND manager_id = @manager_id AND match_id = @match_id AND status = 'Rejected')
				PRINT 'Request already rejected'
			ELSE
				BEGIN
					DECLARE @stadium_id INT
					SET @stadium_id = (SELECT id FROM StadiumManager WHERE id = @manager_id)
					EXEC addTicket @host_name,@guest_name,@date
					DECLARE @capacity INT 
					SET @capacity = (SELECT S.capacity 
										FROM Stadium S
										WHERE S.id = @stadium_id)

					UPDATE HostRequest SET status = 'Accepted' WHERE id = @req
					UPDATE Match SET stadium_id = @stadium_id WHERE id = @match_id
			
					WHILE @capacity > 0
					BEGIN
						EXEC addTicket @host_name,@guest_name,@date
						SET @capacity = @capacity - 1

					END;
				END
			END
				
		END
END;
GO

GO
CREATE PROCEDURE projreqrej
@manager_username VARCHAR(20),
@host_name VARCHAR(20),
@guest_name VARCHAR(20),
@date DATETIME
AS
BEGIN
	IF @manager_username IS NULL OR @host_name IS NULL OR @date IS NULL
		PRINT 'One of the given inputs is null'
	ELSE
		BEGIN
		DECLARE @manager_id INT
		DECLARE @match_id INT
		DECLARE @representative INT
		DECLARE @host_id INT
		DECLARE @guest_id INT
		DECLARE @req INT
		SET @manager_id = (SELECT id FROM StadiumManager  WHERE username = @manager_username)
		SET @host_id = (SELECT id FROM Club WHERE name = @host_name)
		SET @guest_id = (SELECT id FROM Club WHERE name = @guest_name)
		SET @representative = (SELECT id FROM ClubRepresentative WHERE club_id = @host_id)
		SET @match_id = (SELECT id FROM Match WHERE start_time = @date AND host_id = @host_id AND guest_id = @guest_id)
		IF @manager_id IS NULL
			PRINT 'Stadium manager given does not exists'
		ELSE IF @host_id IS NULL
			PRINT 'The host name given does not exists'
		ELSE IF @guest_id IS NULL
			PRINT 'The guest name given does not exist'
		ELSE IF @representative IS NULL
			PRINT 'The club does not have a representative'
		ELSE IF @match_id IS NULL
			PRINT 'The match does not exist'
		ELSE	
			BEGIN
			SET @req = (SELECT id FROM HostRequest WHERE representative_id = @representative AND manager_id = @manager_id AND match_id = @match_id)
			IF @req IS NULL
				PRINT 'No request exists with the given info'
			ELSE IF EXISTS(SELECT id FROM HostRequest WHERE representative_id = @representative AND manager_id = @manager_id AND match_id = @match_id AND status = 'Rejected')
				PRINT 'Request already rejected'
			ELSE IF EXISTS(SELECT id FROM HostRequest WHERE representative_id = @representative AND manager_id = @manager_id AND match_id = @match_id AND status = 'Accepted')
				PRINT 'Request already accepted'
			ELSE
				UPDATE HostRequest SET status = 'Rejected' WHERE id = @req
			END
				
		END
END;
GO


