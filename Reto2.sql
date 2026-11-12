DROP TABLE IF EXISTS Empleado;
DROP TABLE IF EXISTS Departamento;

CREATE TABLE Departamento (
    DeptID       INT           NOT NULL,                
    NombreDepto  VARCHAR(100)  NOT NULL,                
    Ubicacion    VARCHAR(150)  NOT NULL,                
    CONSTRAINT pk_departamento PRIMARY KEY (DeptID)
);

CREATE TABLE Empleado (
    EmpID     INT            NOT NULL,                  
    Nombre    VARCHAR(80)    NOT NULL,                  
    Apellido  VARCHAR(80)    NOT NULL,                  
    Edad      INT            NOT NULL,                  
    Salario   DECIMAL(12,2)  NOT NULL,                  
    DeptID    INT            NOT NULL,                  

    CONSTRAINT pk_empleado PRIMARY KEY (EmpID),

    CONSTRAINT fk_empleado_departamento
        FOREIGN KEY (DeptID) REFERENCES Departamento (DeptID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_empleado_edad    CHECK (Edad >= 18 AND Edad <= 100),
    CONSTRAINT chk_empleado_salario CHECK (Salario >= 0)
);

CREATE INDEX idx_empleado_deptid ON Empleado (DeptID);