CREATE TABLE IF NOT EXISTS staging.categories (
    "CategoryID"      SMALLINT        NOT NULL,
    "CategoryName"    VARCHAR(50)     NOT NULL,
    "Description"     TEXT
);

CREATE TABLE IF NOT EXISTS staging.customers (
    "CustomerID"      CHAR(5)         NOT NULL,
    "CompanyName"     VARCHAR(100)    NOT NULL,
    "ContactName"     VARCHAR(100),
    "ContactTitle"    VARCHAR(100),
    "Address"         VARCHAR(200),
    "City"            VARCHAR(50),
    "Region"          VARCHAR(50),       -- nullable: many rows contain NULL
    "PostalCode"      VARCHAR(20),
    "Country"         VARCHAR(50),
    "Phone"           VARCHAR(30),
    "Fax"             VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS staging.employees (
    "EmployeeID"          SMALLINT        NOT NULL,
    "LastName"            VARCHAR(50)     NOT NULL,
    "FirstName"           VARCHAR(50)     NOT NULL,
    "Title"               VARCHAR(100),
    "TitleOfCourtesy"     VARCHAR(10),
    "BirthDate"           DATE,
    "HireDate"            DATE,
    "Address"             VARCHAR(200),
    "City"                VARCHAR(50),
    "Region"              VARCHAR(50),
    "PostalCode"          VARCHAR(20),
    "Country"             VARCHAR(50),
    "HomePhone"           VARCHAR(30),
    "Extension"           VARCHAR(10),
    "Photo"               TEXT,
    "Notes"               TEXT,
    "ReportsTo"           VARCHAR(10),
    "PhotoPath"           VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS staging.orders (
    "OrderID"            INTEGER         NOT NULL,
    "CustomerID"         CHAR(5),
    "EmployeeID"         SMALLINT,
    "OrderDate"          DATE,
    "RequiredDate"       DATE,
    "ShippedDate"        DATE,           -- nullable
    "ShipVia"            SMALLINT,
    "Freight"            NUMERIC(10, 2),
    "ShipName"           VARCHAR(100),
    "ShipAddress"        VARCHAR(200),
    "ShipCity"           VARCHAR(50),
    "ShipRegion"         VARCHAR(50),    -- nullable
    "ShipPostalCode"     VARCHAR(20),
    "ShipCountry"        VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS staging.orderdetails (
    "OrderID"     INTEGER         NOT NULL,
    "ProductID"   INTEGER         NOT NULL,
    "UnitPrice"   NUMERIC(10, 2),
    "Quantity"    SMALLINT,
    "Discount"    NUMERIC(4, 2)   -- e.g. 0.15 = 15%; negatives cleaned in KNIME
);

CREATE TABLE IF NOT EXISTS staging.products (
    "ProductID"          INTEGER         NOT NULL,
    "ProductName"        VARCHAR(100)    NOT NULL,
    "SupplierID"         INTEGER,
    "CategoryID"         SMALLINT,
    "QuantityPerUnit"    VARCHAR(50),
    "UnitPrice"          NUMERIC(10, 2),
    "UnitsInStock"       SMALLINT,
    "UnitsOnOrder"       SMALLINT,
    "ReorderLevel"       SMALLINT,
    "Discontinued"       SMALLINT        -- 0 = active, 1 = discontinued
);