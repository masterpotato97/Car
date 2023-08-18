create database Dealership;


-- Create Salesperson table
CREATE TABLE Salesperson (
    SalespersonID INT PRIMARY KEY,
    Name VARCHAR(255),
    ContactInfo VARCHAR(255)
);

-- Create Customer table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(255),
    ContactInfo VARCHAR(255)
);

-- Create Car table
CREATE TABLE Car (
    SerialNumber VARCHAR(255) PRIMARY KEY,
    Model VARCHAR(255),
    Make VARCHAR(255),
    is_new VARCHAR(255),
    Price DECIMAL(10, 2)
);

-- Create Invoice table
CREATE TABLE Invoice (
    InvoiceID INT PRIMARY KEY,
    CarSerialNumber VARCHAR(255),
    SalespersonID INT,
    CustomerID INT,
    SaleDate DATE,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (CarSerialNumber) REFERENCES Car(SerialNumber),
    FOREIGN KEY (SalespersonID) REFERENCES Salesperson(SalespersonID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Create ServiceTicket table
CREATE TABLE ServiceTicket (
    TicketID INT PRIMARY KEY,
    CarSerialNumber VARCHAR(255),
    CustomerID INT,
    IssueDescription TEXT,
    TicketDate DATE,
    FOREIGN KEY (CarSerialNumber) REFERENCES Car(SerialNumber),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Create Mechanic table
CREATE TABLE Mechanic (
    MechanicID INT PRIMARY KEY,
    Name VARCHAR(255),
    Specialization VARCHAR(255)
);

-- Create ServiceRecord table
CREATE TABLE ServiceRecord (
    RecordID INT PRIMARY KEY,
    CarSerialNumber VARCHAR(255),
    MechanicID INT,
    ServiceDate DATE,
    Description TEXT,
    FOREIGN KEY (CarSerialNumber) REFERENCES Car(SerialNumber),
    FOREIGN KEY (MechanicID) REFERENCES Mechanic(MechanicID)
);



-- Insert data into Salesperson table
INSERT INTO Salesperson (SalespersonID, Name, ContactInfo)
VALUES (1, 'John Smith', 'john@example.com');

-- Insert data into Customer table
INSERT INTO Customer (CustomerID, Name, ContactInfo)
VALUES (1, 'Jane Doe', 'jane@example.com');

-- Insert data into Car table
INSERT INTO Car (SerialNumber, Model, Make, is_new, Price)
VALUES ('ABC123', 'Civic', 'Honda', 'New', 25000);

-- Insert data into Invoice table
INSERT INTO Invoice (InvoiceID, CarSerialNumber, SalespersonID, CustomerID, SaleDate, Amount)
VALUES (1, 'ABC123', 1, 1, '2023-08-17', 25000);

-- Insert data into ServiceTicket table
INSERT INTO ServiceTicket (TicketID, CarSerialNumber, CustomerID, IssueDescription, TicketDate)
VALUES (1, 'ABC123', 1, 'Oil Change', '2023-08-18');

-- Insert data into Mechanic table
INSERT INTO Mechanic (MechanicID, Name, Specialization)
VALUES (1, 'Michael Johnson', 'Engine');

-- Insert data into ServiceRecord table
INSERT INTO ServiceRecord (RecordID, CarSerialNumber, MechanicID, ServiceDate, Description)
VALUES (1, 'ABC123', 1, '2023-08-18', 'Performed oil change');