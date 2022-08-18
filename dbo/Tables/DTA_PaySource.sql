CREATE TABLE [dbo].[DTA_PaySource](

      [DTAPSID] [bigint] IDENTITY(1,1) NOT NULL,

      [LoginSessionGUID] [uniqueidentifier] NULL,

      [LoginUser] [varchar](500) NULL,

      [LUTPSCID] [tinyint] NULL,

      [CopiedFromDTAPSID] [bigint] NULL,

      [TMPPSID] [bigint] NULL,

      [facility_id] [char](16) NOT NULL,

      [payer_id] [char](13) NOT NULL,

      [npi] [char](10) NOT NULL,

      [taxonomy] [char](10) NOT NULL,

      [pattype] [char](2) NULL,

      [npi_flag] [char](1) NOT NULL,

      [date_flag] [char](1) NULL,

      [paysource_name] [varchar](25) NULL,

      [abbrev_name] [varchar](5) NULL,

      [Enabled] [bit] NULL,

      [InsertedTS] [datetime] NULL,

      [ModifiedTS] [datetime] NULL,

      [TMPSPSID] [bigint] NULL,

      [InExportQueue] [bit] NULL,

      [DTAPDID] [int] NOT NULL,
      
      [Dummy2] [int] NULL,

      [Dummy3] INT NULL, 
    CONSTRAINT [PK_DTA_PaySource] PRIMARY KEY CLUSTERED

(

      [DTAPDID] ASC,

      [DTAPSID] ASC     

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

) ON [PRIMARY]

 

GO

CREATE NONCLUSTERED INDEX [IX_DTA_PaySource_facility] ON [DTA_PaySource]

(

      [facility_id] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

 

GO

CREATE NONCLUSTERED INDEX [IX_DTA_PaySource_Search] ON [DTA_PaySource]

(

      [facility_id] ASC,

      [npi] ASC,

      [payer_id] ASC,

      [taxonomy] ASC,

      [paysource_name] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

 

GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_DTA_PaySource_UniqueKey] ON [DTA_PaySource]

(

      [facility_id] ASC,

      [payer_id] ASC,

      [npi] ASC,

      [taxonomy] ASC,

      [pattype] ASC,

      [DTAPDID] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [IX_DTAPSID_Incl_ModTS] ON [dbo].[DTA_PaySource]

(

      [DTAPSID] ASC

)

INCLUDE (    [ModifiedTS]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [IX_Enabled] ON [DTA_PaySource]

(

      [Enabled] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [IX_InExportQueue] ON [DTA_PaySource]

(

      [InExportQueue] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

 

GO

CREATE NONCLUSTERED INDEX [IX_NPI] ON [DTA_PaySource]

(

      [npi] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

 

GO

CREATE NONCLUSTERED INDEX [SearchingIndex] ON [DTA_PaySource]

(

      [facility_id] ASC,

      [payer_id] ASC,

      [paysource_name] ASC,

      [abbrev_name] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

 

GO

CREATE NONCLUSTERED INDEX [SearchingIndex2] ON [DTA_PaySource]

(

      [facility_id] ASC,

      [payer_id] ASC,

      [npi] ASC,

      [paysource_name] ASC,

      [abbrev_name] ASC

)

INCLUDE (    [DTAPSID],

      [taxonomy]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO

ALTER TABLE [DTA_PaySource] ADD  CONSTRAINT [DF_DTA_PaySource_npi]  DEFAULT ('          ') FOR [npi]

GO

ALTER TABLE [DTA_PaySource] ADD  CONSTRAINT [DF_DTA_PaySource_taxonomy]  DEFAULT ('          ') FOR [taxonomy]

GO

ALTER TABLE [DTA_PaySource] ADD  CONSTRAINT [DF_DTA_PaySource_npi_flag]  DEFAULT ('0') FOR [npi_flag]

GO

ALTER TABLE [dbo].[DTA_PaySource] ADD  CONSTRAINT [DF_DTA_PaySource_DTAPDID]  DEFAULT (0) FOR [DTAPDID]

GO
