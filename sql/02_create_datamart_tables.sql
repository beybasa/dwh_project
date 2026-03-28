CREATE TABLE IF NOT EXISTS datamart.dimdate (
    "DateKey"         INTEGER         NOT NULL PRIMARY KEY,
    "FullDate"        DATE            NOT NULL,
    "Day"             SMALLINT        NOT NULL,
    "Month"           SMALLINT        NOT NULL,
    "MonthName"       VARCHAR(15)     NOT NULL,
    "Quarter"         SMALLINT        NOT NULL,
    "Year"            SMALLINT        NOT NULL,
    "DayOfWeek"       SMALLINT        NOT NULL,
    "DayName"         VARCHAR(15)     NOT NULL,
    "IsWeekend"       BOOLEAN         NOT NULL
);

CREATE TABLE IF NOT EXISTS datamart.dimcustomer (
    "CustomerKey"     SERIAL          PRIMARY KEY,
    "CustomerID"      CHAR(5)         NOT NULL,
    "CompanyName"     VARCHAR(100),
    "ContactName"     VARCHAR(100),
    "ContactTitle"    VARCHAR(100),
    "City"            VARCHAR(50),
    "Region"          VARCHAR(50),
    "Country"         VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS datamart.dimemployee (
    "EmployeeKey"     SERIAL          PRIMARY KEY,
    "EmployeeID"      SMALLINT        NOT NULL,
    "FullName"        VARCHAR(100),
    "Title"           VARCHAR(100),
    "City"            VARCHAR(50),
    "Country"         VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS datamart.dimproduct (
    "ProductKey"         SERIAL          PRIMARY KEY,
    "ProductID"          INTEGER         NOT NULL,
    "ProductName"        VARCHAR(100),
    "CategoryName"       VARCHAR(50),
    "QuantityPerUnit"    VARCHAR(50),
    "UnitPrice"          NUMERIC(10, 2),
    "UnitsInStock"       SMALLINT,
    "ReorderLevel"       SMALLINT,
    "Discontinued"       BOOLEAN
);

CREATE TABLE IF NOT EXISTS datamart.dimshipper (
    "ShipperKey"     SERIAL          PRIMARY KEY,
    "ShipVia"        SMALLINT        NOT NULL,
    "ShipName"       VARCHAR(100),
    "ShipCountry"    VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS datamart.factsales (
    "SalesKey"        SERIAL          PRIMARY KEY,

    -- Foreign keys to dimensions
    "OrderDateKey"    INTEGER         REFERENCES datamart.dimdate("DateKey"),
    "CustomerKey"     INTEGER         REFERENCES datamart.dimcustomer("CustomerKey"),
    "EmployeeKey"     INTEGER         REFERENCES datamart.dimemployee("EmployeeKey"),
    "ProductKey"      INTEGER         REFERENCES datamart.dimproduct("ProductKey"),
    "ShipperKey"      INTEGER         REFERENCES datamart.dimshipper("ShipperKey"),

    -- Degenerate dimensions
    "OrderID"         INTEGER         NOT NULL,

    -- Measures
    "UnitPrice"       NUMERIC(10, 2),
    "Quantity"        SMALLINT,
    "Discount"        NUMERIC(4, 2),
    "Freight"         NUMERIC(10, 2),
    "Revenue"         NUMERIC(12, 2)
);