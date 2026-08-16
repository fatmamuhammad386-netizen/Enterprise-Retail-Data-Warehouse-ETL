
CREATE DATABASE ContosoRetail_Staging;
GO

USE ContosoRetail_Staging;
GO

CREATE TABLE dbo.Stg_FactOnlineSales (
    OnlineSalesKey        INT            NOT NULL,
    DateKey               DATETIME       NOT NULL,
    StoreKey              INT            NOT NULL,
    ProductKey            INT            NOT NULL,
    PromotionKey          INT            NOT NULL,
    CurrencyKey           INT            NOT NULL,
    CustomerKey           INT            NOT NULL,
    SalesOrderNumber      NVARCHAR(20)   NULL,
    SalesOrderLineNumber  INT            NULL,
    SalesQuantity         INT            NOT NULL,
    SalesAmount           MONEY          NOT NULL,
    ReturnQuantity        INT            NOT NULL,
    ReturnAmount          MONEY          NULL,
    DiscountQuantity      INT            NULL,
    DiscountAmount        MONEY          NULL,
    TotalCost             MONEY          NOT NULL,
    UnitCost              MONEY          NULL,
    UnitPrice             MONEY          NULL,
    ETLLoadID             INT            NULL,
    LoadDate              DATETIME       NULL,
    UpdateDate            DATETIME       NULL
);

CREATE TABLE dbo.Stg_FactSales (
    SalesKey              INT            NOT NULL,
    DateKey               DATETIME       NOT NULL,
    ChannelKey            INT            NOT NULL,
    StoreKey              INT            NOT NULL,
    ProductKey            INT            NOT NULL,
    PromotionKey          INT            NOT NULL,
    CurrencyKey           INT            NOT NULL,
    UnitCost              MONEY          NOT NULL,
    UnitPrice             MONEY          NOT NULL,
    SalesQuantity         INT            NOT NULL,
    ReturnQuantity        INT            NOT NULL,
    ReturnAmount          MONEY          NULL,
    DiscountQuantity      INT            NULL,
    DiscountAmount        MONEY          NULL,
    TotalCost             MONEY          NOT NULL,
    SalesAmount           MONEY          NOT NULL,
    ETLLoadID             INT            NULL,
    LoadDate              DATETIME       NULL,
    UpdateDate            DATETIME       NULL
);

CREATE TABLE dbo.Stg_FactInventory (
    InventoryKey          INT            NOT NULL,
    DateKey               DATETIME       NOT NULL,
    StoreKey              INT            NOT NULL,
    ProductKey            INT            NOT NULL,
    CurrencyKey           INT            NOT NULL,
    OnHandQuantity        INT            NOT NULL,
    OnOrderQuantity       INT            NOT NULL,
    SafetyStockQuantity   INT            NULL,
    UnitCost              MONEY          NOT NULL,
    DaysInStock           INT            NULL,
    MinDayInStock         INT            NULL,
    MaxDayInStock         INT            NULL,
    Aging                 INT            NULL,
    ETLLoadID             INT            NULL,
    LoadDate              DATETIME       NULL,
    UpdateDate            DATETIME       NULL
);

CREATE TABLE dbo.Stg_DimProduct (
    ProductKey            INT            NOT NULL,
    ProductLabel          NVARCHAR(255)  NULL,
    ProductName           NVARCHAR(500)  NULL,
    ProductDescription    NVARCHAR(400)  NULL,
    ProductSubcategoryKey INT            NULL,
    Manufacturer          NVARCHAR(50)   NULL,
    BrandName             NVARCHAR(50)   NULL,
    ClassID               NVARCHAR(10)   NULL,
    ClassName             NVARCHAR(20)   NULL,
    StyleID               NVARCHAR(10)   NULL,
    StyleName             NVARCHAR(20)   NULL,
    ColorID               NVARCHAR(10)   NULL,
    ColorName             NVARCHAR(20)   NOT NULL,
    Size                  NVARCHAR(50)   NULL,
    SizeRange             NVARCHAR(50)   NULL,
    SizeUnitMeasureID     NVARCHAR(20)   NULL,
    Weight                FLOAT          NULL,
    WeightUnitMeasureID   NVARCHAR(20)   NULL,
    UnitOfMeasureID       NVARCHAR(10)   NULL,
    UnitOfMeasureName     NVARCHAR(40)   NULL,
    StockTypeID           NVARCHAR(10)   NULL,
    StockTypeName         NVARCHAR(40)   NULL,
    UnitCost              MONEY          NULL,
    UnitPrice             MONEY          NULL,
    AvailableForSaleDate  DATETIME       NULL,
    StopSaleDate          DATETIME       NULL,
    Status                NVARCHAR(7)    NULL,
    ImageURL              NVARCHAR(150)  NULL,
    ProductURL            NVARCHAR(150)  NULL,
    ETLLoadID             INT            NULL,
    LoadDate              DATETIME       NULL,
    UpdateDate            DATETIME       NULL
);

CREATE TABLE dbo.Stg_DimProductCategory (
    ProductCategoryKey    INT            NOT NULL,
    ProductCategoryLabel  NVARCHAR(100)  NULL,
    ProductCategoryName   NVARCHAR(30)   NULL,
    ProductCategoryDescription NVARCHAR(50) NULL,
    ETLLoadID             INT            NULL,
    LoadDate              DATETIME       NULL,
    UpdateDate            DATETIME       NULL
);


CREATE TABLE dbo.Stg_DimProductSubcategory (
    ProductSubcategoryKey INT            NULL, 
    ProductSubcategoryLabel NVARCHAR(100) NULL,
    ProductSubcategoryName NVARCHAR(50)  NULL,
    ProductSubcategoryDescription NVARCHAR(100) NULL,
    ProductCategoryKey    INT            NULL,
    ETLLoadID             INT            NULL,
    LoadDate              DATETIME       NULL,
    UpdateDate            DATETIME       NULL
);

CREATE TABLE dbo.Stg_DimCustomer (
    CustomerKey           INT            NOT NULL,
    GeographyKey          INT            NOT NULL,
    CustomerLabel         NVARCHAR(100)  NOT NULL,
    Title                 NVARCHAR(8)    NULL,
    FirstName             NVARCHAR(50)   NULL,
    MiddleName            NVARCHAR(50)   NULL,
    LastName              NVARCHAR(50)   NULL,
    NameStyle             BIT            NULL,
    BirthDate             DATE           NULL,
    MaritalStatus         NCHAR(1)       NULL,
    Suffix                NVARCHAR(10)   NULL,
    Gender                NVARCHAR(1)    NULL,
    EmailAddress          NVARCHAR(50)   NULL,
    YearlyIncome          MONEY          NULL,
    TotalChildren         TINYINT        NULL,
    NumberChildrenAtHome  TINYINT        NULL,
    Education             NVARCHAR(40)   NULL,
    Occupation            NVARCHAR(100)  NULL,
    HouseOwnerFlag        NCHAR(1)       NULL,
    NumberCarsOwned       TINYINT        NULL,
    AddressLine1          NVARCHAR(120)  NULL,
    AddressLine2          NVARCHAR(120)  NULL,
    Phone                 NVARCHAR(20)   NULL,
    DateFirstPurchase     DATE           NULL,
    CustomerType          NVARCHAR(15)   NULL,
    CompanyName           NVARCHAR(100)  NULL,
    ETLLoadID             INT            NULL,
    LoadDate              DATETIME       NULL,
    UpdateDate            DATETIME       NULL
);

CREATE TABLE dbo.Stg_DimStore (
    StoreKey              INT            NOT NULL,
    GeographyKey          INT            NOT NULL,
    StoreManager          INT            NULL,
    StoreType             NVARCHAR(15)   NULL,
    StoreName             NVARCHAR(100)  NOT NULL,
    StoreDescription      NVARCHAR(300)  NULL,
    Status                NVARCHAR(20)   NOT NULL,
    OpenDate              DATETIME       NOT NULL,
    CloseDate             DATETIME       NULL,
    EntityKey             INT            NULL,
    ZipCode               NVARCHAR(20)   NULL,
    ZipCodeExtension      NVARCHAR(10)   NULL,
    StorePhone            NVARCHAR(15)   NULL,
    StoreFax              NVARCHAR(14)   NULL,
    AddressLine1          NVARCHAR(100)  NULL,
    AddressLine2          NVARCHAR(100)  NULL,
    CloseReason           NVARCHAR(20)   NULL,
    EmployeeCount         INT            NULL,
    SellingAreaSize       FLOAT          NULL,
    LastRemodelDate       DATETIME       NULL,
    ETLLoadID             INT            NULL,
    LoadDate              DATETIME       NULL,
    UpdateDate            DATETIME       NULL
);
CREATE TABLE dbo.Stg_DimDate (
    Datekey               DATETIME       NOT NULL,
    FullDateLabel         NVARCHAR(20)   NULL,
    DateDescription       NVARCHAR(20)   NULL,
    CalendarYear          INT            NULL,
    CalendarYearLabel     NVARCHAR(20)   NULL,
    CalendarHalfYear      INT            NULL,
    CalendarHalfYearLabel NVARCHAR(20)   NULL,
    CalendarQuarter       INT            NULL,
    CalendarQuarterLabel  NVARCHAR(20)   NULL,
    CalendarMonth         INT            NULL,
    CalendarMonthLabel    NVARCHAR(20)   NULL,
    CalendarWeek          INT            NULL,
    CalendarWeekLabel     NVARCHAR(20)   NULL,
    CalendarDayOfWeek     INT            NULL,
    CalendarDayOfWeekLabel NVARCHAR(20)  NULL,
    FiscalYear            INT            NULL,
    FiscalYearLabel       NVARCHAR(20)   NULL,
    FiscalHalfYear        INT            NULL,
    FiscalHalfYearLabel   NVARCHAR(20)   NULL,
    FiscalQuarter         INT            NULL,
    FiscalQuarterLabel    NVARCHAR(20)   NULL,
    FiscalMonth           INT            NULL,
    FiscalMonthLabel      NVARCHAR(20)   NULL,
    IsWorkDay             NVARCHAR(20)   NOT NULL, 
    IsHoliday             INT            NOT NULL,
    HolidayName           NVARCHAR(20)   NOT NULL,
    EuropeSeason          NVARCHAR(50)   NULL,     
    NorthAmericaSeason    NVARCHAR(50)   NULL,     
    AsiaSeason            NVARCHAR(50)   NULL,     
    ETLLoadID             INT            NULL,
    LoadDate              DATETIME       NULL,
    UpdateDate            DATETIME       NULL
);

CREATE TABLE dbo.Stg_DimCurrency (
    CurrencyKey           INT            NOT NULL,
    CurrencyLabel         NVARCHAR(10)   NOT NULL,
    CurrencyName          NVARCHAR(20)   NOT NULL,
    CurrencyDescription   NVARCHAR(50)   NULL,
    ETLLoadID             INT            NULL,
    LoadDate              DATETIME       NULL,
    UpdateDate            DATETIME       NULL
);


CREATE TABLE dbo.Stg_DimPromotion (
    PromotionKey          INT            NOT NULL,
    PromotionLabel        NVARCHAR(100)  NULL,
    PromotionName         NVARCHAR(100)  NULL,
    PromotionDescription  NVARCHAR(255)  NULL,   
    DiscountPercent       FLOAT          NULL,
    PromotionType         NVARCHAR(50)   NULL,
    PromotionCategory     NVARCHAR(50)   NULL,
    StartDate             DATETIME       NOT NULL,
    EndDate               DATETIME       NULL,
    MinQuantity           INT            NULL,
    MaxQuantity           INT            NULL,
    ETLLoadID             INT            NULL,
    LoadDate              DATETIME       NULL,
    UpdateDate            DATETIME       NULL
);

CREATE TABLE dbo.Stg_DimGeography (
    GeographyKey          INT            NOT NULL,
    GeographyType         NVARCHAR(50)   NOT NULL,
    ContinentName         NVARCHAR(50)   NOT NULL,
    CityName              NVARCHAR(100)  NULL,
    StateProvinceName     NVARCHAR(100)  NULL,
    RegionCountryName     NVARCHAR(100)  NULL,
    ETLLoadID             INT            NULL,
    LoadDate              DATETIME       NULL,
    UpdateDate            DATETIME       NULL
);

CREATE TABLE dbo.Stg_DimChannel (
    ChannelKey            INT            NOT NULL,
    ChannelLabel          NVARCHAR(100)  NOT NULL,
    ChannelName           NVARCHAR(20)   NULL,
    ChannelDescription    NVARCHAR(50)   NULL,
    ETLLoadID             INT            NULL,
    LoadDate              DATETIME       NULL,
    UpdateDate            DATETIME       NULL
);

CREATE TABLE dbo.Stg_DimSalesTerritory (
    SalesTerritoryKey     INT            NOT NULL,
    GeographyKey          INT            NOT NULL,
    SalesTerritoryLabel   NVARCHAR(100)  NULL,
    SalesTerritoryName    NVARCHAR(50)   NULL,
    SalesTerritoryRegion  NVARCHAR(50)   NULL,
    SalesTerritoryCountry NVARCHAR(50)   NULL,
    SalesTerritoryGroup   NVARCHAR(50)   NULL,
    SalesTerritoryLevel   NVARCHAR(10)   NULL,
    SalesTerritoryManager INT            NULL,
    StartDate             DATETIME       NULL,
    EndDate               DATETIME       NULL,
    Status                NVARCHAR(50)   NULL,
    ETLLoadID             INT            NULL,
    LoadDate              DATETIME       NULL,
    UpdateDate            DATETIME       NULL
);





use contosoretailDW

   CREATE TABLE dbo.ErrorLog (
       RecordID      INT            NULL,
       SourceTable   NVARCHAR(100)  NULL,
       ErrorReason   NVARCHAR(500)  NULL,
       ErrorDate     DATETIME       NULL,
       PackageName   NVARCHAR(100)  NULL
   );




USE ContosoRetailDW;
GO


CREATE TABLE dbo.DW_DimDate (
    DateKey               DATETIME        PRIMARY KEY,
    FullDateLabel         NVARCHAR(20),
    DateDescription       NVARCHAR(20),
    CalendarYear          INT,
    CalendarYearLabel     NVARCHAR(20),
    CalendarHalfYear      INT,
    CalendarHalfYearLabel NVARCHAR(20),
    CalendarQuarter       INT,
    CalendarQuarterLabel  NVARCHAR(20),
    CalendarMonth         INT,
    CalendarMonthLabel    NVARCHAR(20),
    CalendarWeek          INT,
    CalendarWeekLabel     NVARCHAR(20),
    CalendarDayOfWeek     INT,
    CalendarDayOfWeekLabel NVARCHAR(20),
    FiscalYear            INT,
    FiscalYearLabel       NVARCHAR(20),
    FiscalHalfYear        INT,
    FiscalHalfYearLabel   NVARCHAR(20),
    FiscalQuarter         INT,
    FiscalQuarterLabel    NVARCHAR(20),
    FiscalMonth           INT,
    FiscalMonthLabel      NVARCHAR(20),
    IsWorkDay             NVARCHAR(20)    NOT NULL,
    IsHoliday             INT             NOT NULL,
    HolidayName           NVARCHAR(20)    NOT NULL,
    EuropeSeason          NVARCHAR(50),
    NorthAmericaSeason    NVARCHAR(50),
    AsiaSeason            NVARCHAR(50),
    LoadDate              DATETIME        DEFAULT GETDATE(),
    PackageName           NVARCHAR(100),
    ETLUser               NVARCHAR(100),
    BatchID               NVARCHAR(50)
);
GO

CREATE TABLE dbo.DW_DimCurrency (
    CurrencyKey           INT             PRIMARY KEY,
    CurrencyLabel         NVARCHAR(10)    NOT NULL,
    CurrencyName          NVARCHAR(20)    NOT NULL,
    CurrencyDescription   NVARCHAR(50),
    LoadDate              DATETIME        DEFAULT GETDATE(),
    PackageName           NVARCHAR(100),
    ETLUser               NVARCHAR(100),
    BatchID               NVARCHAR(50)
);
GO

CREATE TABLE dbo.DW_DimPromotion (
    PromotionKey          INT             PRIMARY KEY,
    PromotionLabel        NVARCHAR(100),
    PromotionName         NVARCHAR(100),
    PromotionDescription  NVARCHAR(255),
    DiscountPercent       FLOAT,
    PromotionType         NVARCHAR(50),
    PromotionCategory     NVARCHAR(50),
    StartDate             DATETIME        NOT NULL,
    EndDate               DATETIME,
    MinQuantity           INT,
    MaxQuantity           INT,
    LoadDate              DATETIME        DEFAULT GETDATE(),
    PackageName           NVARCHAR(100),
    ETLUser               NVARCHAR(100),
    BatchID               NVARCHAR(50)
);
GO

CREATE TABLE dbo.DW_DimGeography (
    GeographyKey          INT             PRIMARY KEY,
    GeographyType         NVARCHAR(50)    NOT NULL,
    ContinentName         NVARCHAR(50)    NOT NULL,
    CityName              NVARCHAR(100),
    StateProvinceName     NVARCHAR(100),
    RegionCountryName     NVARCHAR(100),
    LoadDate              DATETIME        DEFAULT GETDATE(),
    PackageName           NVARCHAR(100),
    ETLUser               NVARCHAR(100),
    BatchID               NVARCHAR(50)
);
GO

CREATE TABLE dbo.DW_DimChannel (
    ChannelKey            INT             PRIMARY KEY,
    ChannelLabel          NVARCHAR(100)   NOT NULL,
    ChannelName           NVARCHAR(20),
    ChannelDescription    NVARCHAR(50),
    LoadDate              DATETIME        DEFAULT GETDATE(),
    PackageName           NVARCHAR(100),
    ETLUser               NVARCHAR(100),
    BatchID               NVARCHAR(50)
);
GO

CREATE TABLE dbo.DW_DimProductCategory (
    ProductCategoryKey        INT         PRIMARY KEY,
    ProductCategoryLabel      NVARCHAR(100),
    ProductCategoryName       NVARCHAR(30),
    ProductCategoryDescription NVARCHAR(50),
    LoadDate                  DATETIME    DEFAULT GETDATE(),
    PackageName               NVARCHAR(100),
    ETLUser                   NVARCHAR(100),
    BatchID                   NVARCHAR(50)
);
GO


CREATE TABLE dbo.DW_DimProductSubcategory (
    ProductSubcategoryKey         INT             PRIMARY KEY,
    ProductSubcategoryLabel       NVARCHAR(100),
    ProductSubcategoryName        NVARCHAR(50),
    ProductSubcategoryDescription NVARCHAR(100),
    ProductCategoryKey            INT,
    LoadDate                      DATETIME        DEFAULT GETDATE(),
    PackageName                   NVARCHAR(100),
    ETLUser                       NVARCHAR(100),
    BatchID                       NVARCHAR(50),
    CONSTRAINT FK_DimProductSubcategory_Category 
        FOREIGN KEY (ProductCategoryKey) REFERENCES dbo.DW_DimProductCategory(ProductCategoryKey)
);
GO

CREATE TABLE dbo.DW_DimProduct (
    ProductKey              INT             PRIMARY KEY,
    ProductLabel            NVARCHAR(255),
    ProductName             NVARCHAR(500),
    ProductDescription      NVARCHAR(400),
    ProductSubcategoryKey   INT,
    Manufacturer            NVARCHAR(50),
    BrandName               NVARCHAR(50),
    ClassID                 NVARCHAR(10),
    ClassName               NVARCHAR(20),
    StyleID                 NVARCHAR(10),
    StyleName               NVARCHAR(20),
    ColorID                 NVARCHAR(10),
    ColorName               NVARCHAR(20)    NOT NULL,
    Size                    NVARCHAR(50),
    SizeRange               NVARCHAR(50),
    SizeUnitMeasureID       NVARCHAR(20),
    Weight                  FLOAT,
    WeightUnitMeasureID     NVARCHAR(20),
    UnitOfMeasureID         NVARCHAR(10),
    UnitOfMeasureName       NVARCHAR(40),
    StockTypeID             NVARCHAR(10),
    StockTypeName           NVARCHAR(40),
    UnitCost                MONEY,
    UnitPrice               MONEY,
    AvailableForSaleDate    DATETIME,
    StopSaleDate            DATETIME,
    Status                  NVARCHAR(7),
    ImageURL                NVARCHAR(150),
    ProductURL              NVARCHAR(150),
    -- Transformation Columns
    ProductName_Clean       NVARCHAR(500),
    BrandName_Clean         NVARCHAR(50),
    ProductDescription_Clean NVARCHAR(400),
    -- Audit Columns
    LoadDate                DATETIME        DEFAULT GETDATE(),
    PackageName             NVARCHAR(100),
    ETLUser                 NVARCHAR(100),
    BatchID                 NVARCHAR(50),
    CONSTRAINT FK_DimProduct_Subcategory 
        FOREIGN KEY (ProductSubcategoryKey) REFERENCES dbo.DW_DimProductSubcategory(ProductSubcategoryKey)
);
GO

CREATE TABLE dbo.DW_DimStore (
    StoreKey              INT             PRIMARY KEY,
    GeographyKey          INT             NOT NULL,
    StoreManager          INT,
    StoreType             NVARCHAR(15),
    StoreName             NVARCHAR(100)   NOT NULL,
    StoreDescription      NVARCHAR(300),
    Status                NVARCHAR(20)    NOT NULL,
    OpenDate              DATETIME        NOT NULL,
    CloseDate             DATETIME,
    EntityKey             INT,
    ZipCode               NVARCHAR(20),
    ZipCodeExtension      NVARCHAR(10),
    StorePhone            NVARCHAR(15),
    StoreFax              NVARCHAR(14),
    AddressLine1          NVARCHAR(100),
    AddressLine2          NVARCHAR(100),
    CloseReason           NVARCHAR(20),
    EmployeeCount         INT,
    SellingAreaSize       FLOAT,
    LastRemodelDate       DATETIME,
    LoadDate              DATETIME        DEFAULT GETDATE(),
    PackageName           NVARCHAR(100),
    ETLUser               NVARCHAR(100),
    BatchID               NVARCHAR(50),
    CONSTRAINT FK_DimStore_Geography 
        FOREIGN KEY (GeographyKey) REFERENCES dbo.DW_DimGeography(GeographyKey)
);
GO

CREATE TABLE dbo.DW_DimCustomer (
    CustomerKey             INT             PRIMARY KEY,
    GeographyKey            INT             NOT NULL,
    CustomerLabel           NVARCHAR(100)   NOT NULL,
    Title                   NVARCHAR(8),
    FirstName               NVARCHAR(50),
    MiddleName              NVARCHAR(50),
    LastName                NVARCHAR(50),
    NameStyle               BIT,
    BirthDate               DATE,
    MaritalStatus           NCHAR(1),
    Suffix                  NVARCHAR(10),
    Gender                  NVARCHAR(1),
    EmailAddress            NVARCHAR(50),
    YearlyIncome            MONEY,
    TotalChildren           TINYINT,
    NumberChildrenAtHome    TINYINT,
    Education               NVARCHAR(40),
    Occupation              NVARCHAR(100),
    HouseOwnerFlag          NCHAR(1),
    NumberCarsOwned         TINYINT,
    AddressLine1            NVARCHAR(120),
    AddressLine2            NVARCHAR(120),
    Phone                   NVARCHAR(20),
    DateFirstPurchase       DATE,
    CustomerType            NVARCHAR(15),
    CompanyName             NVARCHAR(100),
    FirstName_Clean         NVARCHAR(50),
    LastName_Clean          NVARCHAR(50),
    Phone_Clean             NVARCHAR(20),
    Email_Clean             NVARCHAR(50),
    CustomerTier            NVARCHAR(20),
    LoadDate                DATETIME        DEFAULT GETDATE(),
    PackageName             NVARCHAR(100),
    ETLUser                 NVARCHAR(100),
    BatchID                 NVARCHAR(50),
    CONSTRAINT FK_DimCustomer_Geography 
        FOREIGN KEY (GeographyKey) REFERENCES dbo.DW_DimGeography(GeographyKey)
);
GO

CREATE TABLE dbo.DW_DimSalesTerritory (
    SalesTerritoryKey       INT             PRIMARY KEY,
    GeographyKey            INT             NOT NULL,
    SalesTerritoryLabel     NVARCHAR(100),
    SalesTerritoryName      NVARCHAR(50),
    SalesTerritoryRegion    NVARCHAR(50),
    SalesTerritoryCountry   NVARCHAR(50),
    SalesTerritoryGroup     NVARCHAR(50),
    SalesTerritoryLevel     NVARCHAR(10),
    SalesTerritoryManager   INT,
    StartDate               DATETIME,
    EndDate                 DATETIME,
    Status                  NVARCHAR(50),
    LoadDate                DATETIME        DEFAULT GETDATE(),
    PackageName             NVARCHAR(100),
    ETLUser                 NVARCHAR(100),
    BatchID                 NVARCHAR(50),
    CONSTRAINT FK_DimSalesTerritory_Geography 
        FOREIGN KEY (GeographyKey) REFERENCES dbo.DW_DimGeography(GeographyKey)
);
GO


CREATE TABLE dbo.DW_FactOnlineSales (
    OnlineSalesKey        INT             PRIMARY KEY,
    DateKey               DATETIME        NOT NULL,
    StoreKey              INT             NOT NULL,
    ProductKey            INT             NOT NULL,
    PromotionKey          INT             NOT NULL,
    CurrencyKey           INT             NOT NULL,
    CustomerKey           INT             NOT NULL,
    SalesOrderNumber      NVARCHAR(20),
    SalesOrderLineNumber  INT,
    SalesQuantity         INT             NOT NULL,
    SalesAmount           MONEY           NOT NULL,
    ReturnQuantity        INT             NOT NULL,
    ReturnAmount          MONEY,
    DiscountQuantity      INT,
    DiscountAmount        MONEY,
    TotalCost             MONEY           NOT NULL,
    UnitCost              MONEY,
    UnitPrice             MONEY,
    NetSalesAmount        MONEY,
    GrossProfit           MONEY,
    ProfitMarginPercent   DECIMAL(10,2),
    OrderSize             NVARCHAR(10),
    LoadDate              DATETIME        DEFAULT GETDATE(),
    PackageName           NVARCHAR(100),
    ETLUser               NVARCHAR(100),
    BatchID               NVARCHAR(50),
    CONSTRAINT FK_FactOnlineSales_Date     FOREIGN KEY (DateKey)     REFERENCES dbo.DW_DimDate(DateKey),
    CONSTRAINT FK_FactOnlineSales_Store    FOREIGN KEY (StoreKey)    REFERENCES dbo.DW_DimStore(StoreKey),
    CONSTRAINT FK_FactOnlineSales_Product  FOREIGN KEY (ProductKey)  REFERENCES dbo.DW_DimProduct(ProductKey),
    CONSTRAINT FK_FactOnlineSales_Promo    FOREIGN KEY (PromotionKey) REFERENCES dbo.DW_DimPromotion(PromotionKey),
    CONSTRAINT FK_FactOnlineSales_Currency FOREIGN KEY (CurrencyKey) REFERENCES dbo.DW_DimCurrency(CurrencyKey),
    CONSTRAINT FK_FactOnlineSales_Customer FOREIGN KEY (CustomerKey) REFERENCES dbo.DW_DimCustomer(CustomerKey)
);
GO

CREATE TABLE dbo.DW_FactSales (
    SalesKey              INT             PRIMARY KEY,
    DateKey               DATETIME        NOT NULL,
    ChannelKey            INT             NOT NULL,
    StoreKey              INT             NOT NULL,
    ProductKey            INT             NOT NULL,
    PromotionKey          INT             NOT NULL,
    CurrencyKey           INT             NOT NULL,
    UnitCost              MONEY           NOT NULL,
    UnitPrice             MONEY           NOT NULL,
    SalesQuantity         INT             NOT NULL,
    ReturnQuantity        INT             NOT NULL,
    ReturnAmount          MONEY,
    DiscountQuantity      INT,
    DiscountAmount        MONEY,
    TotalCost             MONEY           NOT NULL,
    SalesAmount           MONEY           NOT NULL,
    NetSalesAmount        MONEY,
    GrossProfit           MONEY,
    ProfitMarginPercent   DECIMAL(10,2),
    OrderSize             NVARCHAR(10),
    LoadDate              DATETIME        DEFAULT GETDATE(),
    PackageName           NVARCHAR(100),
    ETLUser               NVARCHAR(100),
    BatchID               NVARCHAR(50),
    CONSTRAINT FK_FactSales_Date     FOREIGN KEY (DateKey)     REFERENCES dbo.DW_DimDate(DateKey),
    CONSTRAINT FK_FactSales_Channel  FOREIGN KEY (ChannelKey)  REFERENCES dbo.DW_DimChannel(ChannelKey),
    CONSTRAINT FK_FactSales_Store    FOREIGN KEY (StoreKey)    REFERENCES dbo.DW_DimStore(StoreKey),
    CONSTRAINT FK_FactSales_Product  FOREIGN KEY (ProductKey)  REFERENCES dbo.DW_DimProduct(ProductKey),
    CONSTRAINT FK_FactSales_Promo    FOREIGN KEY (PromotionKey) REFERENCES dbo.DW_DimPromotion(PromotionKey),
    CONSTRAINT FK_FactSales_Currency FOREIGN KEY (CurrencyKey) REFERENCES dbo.DW_DimCurrency(CurrencyKey)
);
GO

CREATE TABLE dbo.DW_FactInventory (
    InventoryKey          INT             PRIMARY KEY,
    DateKey               DATETIME        NOT NULL,
    StoreKey              INT             NOT NULL,
    ProductKey            INT             NOT NULL,
    CurrencyKey           INT             NOT NULL,
    OnHandQuantity        INT             NOT NULL,
    OnOrderQuantity       INT             NOT NULL,
    SafetyStockQuantity   INT,
    UnitCost              MONEY           NOT NULL,
    DaysInStock           INT,
    MinDayInStock         INT,
    MaxDayInStock         INT,
    Aging                 INT,
    TotalInventoryValue   MONEY,
    StockStatus           NVARCHAR(20),
    LoadDate              DATETIME        DEFAULT GETDATE(),
    PackageName           NVARCHAR(100),
    ETLUser               NVARCHAR(100),
    BatchID               NVARCHAR(50),
    CONSTRAINT FK_FactInventory_Date     FOREIGN KEY (DateKey)     REFERENCES dbo.DW_DimDate(DateKey),
    CONSTRAINT FK_FactInventory_Store    FOREIGN KEY (StoreKey)    REFERENCES dbo.DW_DimStore(StoreKey),
    CONSTRAINT FK_FactInventory_Product  FOREIGN KEY (ProductKey)  REFERENCES dbo.DW_DimProduct(ProductKey),
    CONSTRAINT FK_FactInventory_Currency FOREIGN KEY (CurrencyKey) REFERENCES dbo.DW_DimCurrency(CurrencyKey)
);
GO

ALTER TABLE dbo.DW_FactOnlineSales DROP CONSTRAINT FK_FactOnlineSales_Date;
ALTER TABLE dbo.DW_FactOnlineSales DROP CONSTRAINT FK_FactOnlineSales_Store;
ALTER TABLE dbo.DW_FactOnlineSales DROP CONSTRAINT FK_FactOnlineSales_Product;
ALTER TABLE dbo.DW_FactOnlineSales DROP CONSTRAINT FK_FactOnlineSales_Promo;
ALTER TABLE dbo.DW_FactOnlineSales DROP CONSTRAINT FK_FactOnlineSales_Currency;
ALTER TABLE dbo.DW_FactOnlineSales DROP CONSTRAINT FK_FactOnlineSales_Customer;
ALTER TABLE dbo.DW_FactSales DROP CONSTRAINT FK_FactSales_Date;
ALTER TABLE dbo.DW_FactSales DROP CONSTRAINT FK_FactSales_Channel;
ALTER TABLE dbo.DW_FactSales DROP CONSTRAINT FK_FactSales_Store;
ALTER TABLE dbo.DW_FactSales DROP CONSTRAINT FK_FactSales_Product;
ALTER TABLE dbo.DW_FactSales DROP CONSTRAINT FK_FactSales_Promo;
ALTER TABLE dbo.DW_FactSales DROP CONSTRAINT FK_FactSales_Currency;
ALTER TABLE dbo.DW_FactInventory DROP CONSTRAINT FK_FactInventory_Date;
ALTER TABLE dbo.DW_FactInventory DROP CONSTRAINT FK_FactInventory_Store;
ALTER TABLE dbo.DW_FactInventory DROP CONSTRAINT FK_FactInventory_Product;
ALTER TABLE dbo.DW_FactInventory DROP CONSTRAINT FK_FactInventory_Currency;
ALTER TABLE dbo.DW_DimCustomer DROP CONSTRAINT FK_DimCustomer_Geography;
ALTER TABLE dbo.DW_DimProduct DROP CONSTRAINT FK_DimProduct_Subcategory;
ALTER TABLE dbo.DW_DimProductSubcategory DROP CONSTRAINT FK_DimProductSubcategory_Category;
ALTER TABLE dbo.DW_DimStore DROP CONSTRAINT FK_DimStore_Geography;





TRUNCATE TABLE dbo.DW_FactOnlineSales;
TRUNCATE TABLE dbo.DW_FactSales;
TRUNCATE TABLE dbo.DW_FactInventory;
TRUNCATE TABLE dbo.DW_DimProductSubcategory;
TRUNCATE TABLE dbo.DW_DimProduct;
TRUNCATE TABLE dbo.DW_DimCustomer;
TRUNCATE TABLE dbo.DW_DimStore;
TRUNCATE TABLE dbo.DW_DimDate;
TRUNCATE TABLE dbo.DW_DimCurrency;
TRUNCATE TABLE dbo.DW_DimPromotion;
TRUNCATE TABLE dbo.DW_DimChannel;
TRUNCATE TABLE dbo.DW_DimGeography;
TRUNCATE TABLE dbo.DW_DimProductCategory;




ALTER TABLE dbo.DW_FactOnlineSales ADD CONSTRAINT FK_FactOnlineSales_Date FOREIGN KEY (DateKey) REFERENCES dbo.DW_DimDate(DateKey);
ALTER TABLE dbo.DW_FactOnlineSales ADD CONSTRAINT FK_FactOnlineSales_Store FOREIGN KEY (StoreKey) REFERENCES dbo.DW_DimStore(StoreKey);
ALTER TABLE dbo.DW_FactOnlineSales ADD CONSTRAINT FK_FactOnlineSales_Product FOREIGN KEY (ProductKey) REFERENCES dbo.DW_DimProduct(ProductKey);
ALTER TABLE dbo.DW_FactOnlineSales ADD CONSTRAINT FK_FactOnlineSales_Promo FOREIGN KEY (PromotionKey) REFERENCES dbo.DW_DimPromotion(PromotionKey);
ALTER TABLE dbo.DW_FactOnlineSales ADD CONSTRAINT FK_FactOnlineSales_Currency FOREIGN KEY (CurrencyKey) REFERENCES dbo.DW_DimCurrency(CurrencyKey);
ALTER TABLE dbo.DW_FactOnlineSales ADD CONSTRAINT FK_FactOnlineSales_Customer FOREIGN KEY (CustomerKey) REFERENCES dbo.DW_DimCustomer(CustomerKey);
ALTER TABLE dbo.DW_FactSales ADD CONSTRAINT FK_FactSales_Date FOREIGN KEY (DateKey) REFERENCES dbo.DW_DimDate(DateKey);
ALTER TABLE dbo.DW_FactSales ADD CONSTRAINT FK_FactSales_Channel FOREIGN KEY (ChannelKey) REFERENCES dbo.DW_DimChannel(ChannelKey);
ALTER TABLE dbo.DW_FactSales ADD CONSTRAINT FK_FactSales_Store FOREIGN KEY (StoreKey) REFERENCES dbo.DW_DimStore(StoreKey);
ALTER TABLE dbo.DW_FactSales ADD CONSTRAINT FK_FactSales_Product FOREIGN KEY (ProductKey) REFERENCES dbo.DW_DimProduct(ProductKey);
ALTER TABLE dbo.DW_FactSales ADD CONSTRAINT FK_FactSales_Promo FOREIGN KEY (PromotionKey) REFERENCES dbo.DW_DimPromotion(PromotionKey);
ALTER TABLE dbo.DW_FactSales ADD CONSTRAINT FK_FactSales_Currency FOREIGN KEY (CurrencyKey) REFERENCES dbo.DW_DimCurrency(CurrencyKey);
ALTER TABLE dbo.DW_FactInventory ADD CONSTRAINT FK_FactInventory_Date FOREIGN KEY (DateKey) REFERENCES dbo.DW_DimDate(DateKey);
ALTER TABLE dbo.DW_FactInventory ADD CONSTRAINT FK_FactInventory_Store FOREIGN KEY (StoreKey) REFERENCES dbo.DW_DimStore(StoreKey);
ALTER TABLE dbo.DW_FactInventory ADD CONSTRAINT FK_FactInventory_Product FOREIGN KEY (ProductKey) REFERENCES dbo.DW_DimProduct(ProductKey);
ALTER TABLE dbo.DW_FactInventory ADD CONSTRAINT FK_FactInventory_Currency FOREIGN KEY (CurrencyKey) REFERENCES dbo.DW_DimCurrency(CurrencyKey);
ALTER TABLE dbo.DW_DimCustomer ADD CONSTRAINT FK_DimCustomer_Geography FOREIGN KEY (GeographyKey) REFERENCES dbo.DW_DimGeography(GeographyKey);
ALTER TABLE dbo.DW_DimProduct ADD CONSTRAINT FK_DimProduct_Subcategory FOREIGN KEY (ProductSubcategoryKey) REFERENCES dbo.DW_DimProductSubcategory(ProductSubcategoryKey);
ALTER TABLE dbo.DW_DimProductSubcategory ADD CONSTRAINT FK_DimProductSubcategory_Category FOREIGN KEY (ProductCategoryKey) REFERENCES dbo.DW_DimProductCategory(ProductCategoryKey);
ALTER TABLE dbo.DW_DimStore ADD CONSTRAINT FK_DimStore_Geography FOREIGN KEY (GeographyKey) REFERENCES dbo.DW_DimGeography(GeographyKey);



SELECT TOP 10 CustomerKey, FirstName_Clean, LastName_Clean, CustomerTier 
FROM dbo.DW_DimCustomer;

SELECT TOP 10 SalesKey, NetSalesAmount, GrossProfit, ProfitMarginPercent, OrderSize
FROM dbo.DW_FactSales;




USE ContosoRetailDW;
GO

CREATE TABLE dbo.ETL_Log (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    PackageName NVARCHAR(100),
    StartTime DATETIME,
    EndTime DATETIME,
    DurationSeconds INT,
    TotalRecords INT,
    FailedRecords INT,
    Status NVARCHAR(50),
    ErrorMessage NVARCHAR(MAX)
);

select * from dbo.ETL_Log

