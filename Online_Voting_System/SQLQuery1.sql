CREATE TABLE [dbo].[Candidates] (
    [Name]     VARCHAR (50) NOT NULL,
    [DOB]      VARCHAR (50) NULL,
    [Email]    VARCHAR (50) NULL,
    [Position] VARCHAR (50) NULL
);


CREATE TABLE [dbo].[registeruser] (
    [VoterId]  VARCHAR (50) NOT NULL,
    [Name]     VARCHAR (50) NULL,
    [DOB]      VARCHAR (50) NULL,
    [Age]      VARCHAR (50) NULL,
    [Email]    VARCHAR (50) NULL,
    [password] VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([VoterId] ASC)
);

CREATE TABLE [dbo].[UserVoted] (
    [VoterId] INT NOT NULL
);

CREATE TABLE [dbo].[vote] (
    [Name] VARCHAR (50) NOT NULL,
    [Vote] INT          NOT NULL
);

select * from registeruser
