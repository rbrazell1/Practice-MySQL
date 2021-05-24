create table profile
(
    profileId      VARCHAR(36) not null PRIMARY KEY,
    profileAboutMe varchar(500),
    profileEmail   varchar(60)  not null,
    profileHash    varchar(300) not null,
    profileName    varchar(35)  not null
);
create table project
(
    projectId          VARCHAR(36) auto_increment not null PRIMARY KEY,
    foreign key (profileId)
        references profile (profileId),
    projectDueDate     date,
    projectDescription varchar(500),
    projectName        varchar(35),
    profileId          varchar(36) not null

);
create table ticket
(
    ticketId          VARCHAR(36) auto_increment not null PRIMARY KEY,
    foreign key (ticketProfileId)
        references profile (profileId),
    foreign key (ticketProjectId)
        references project (projectId),
    ticketDescription varchar(300),
    ticketDueDate     date,
    ticketName        varchar(36) not null,
    ticketProfileId   varchar(36) not null,
    ticketProjectId   varchar(36) not null
);
create table status
(
    statusId    VARCHAR(36) auto_increment not null PRIMARY KEY,
    statusValue varchar(20) not null,
    statusColor varchar(15)
);
create table ticketStatus
(
    ticketStatusStatusId VARCHAR(36),
    ticketStatusTicketId varchar(20),
    ticketStatusDate     date
);

INSERT INTO profile(profileId, profileAboutMe, profileEmail, profileHash, profileName) VALUES (1, 'I like to be first', 'email@memail.com', 123, 'Mister One');
INSERT INTO profile(profileId, profileAboutMe, profileEmail, profileHash, profileName) VALUES (2, 'I like to be Second', 'email1@memail.com', 123, 'Mister Two');
INSERT INTO profile(profileId, profileAboutMe, profileEmail, profileHash, profileName) VALUES (3, 'I like to be first', 'email2@memail.com', 123, 'Mister EEE');
UPDATE profile SET profileEmail = 'NoMail@memail.com' WHERE profileEmail = 'email@memail.com';
DELETE FROM profile WHERE profileEmail = 'email1@memail.com';
INSERT INTO project(projectId, projectDueDate, projectDescription, projectName, profileId) VALUES (default, 05/28/2021, 'This will be a trick thing to do', 'SQLify', 1);
SELECT projectId FROM project;
SELECT project.projectName, project.projectDescription, profile.profileAboutMe  FROM project INNER JOIN profile WHERE projectId = NOT NULL;