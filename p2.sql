-- Create Source_Table
CREATE TABLE Source_Table (
    id INT PRIMARY KEY,
    name CHAR(20),
    value CHAR(20)
);

-- Create Destination_Table
CREATE TABLE Destination_Table (
    id INT PRIMARY KEY,
    name CHAR(20),
    value CHAR(20)
);

-- Insert sample data into Source_Table
INSERT INTO Source_Table VALUES (10, 'nuts', 'black');
INSERT INTO Source_Table VALUES (20, 'bolts', 'grey');
INSERT INTO Source_Table VALUES (30, 'screw', 'green');

-- PL/SQL block to copy data from Source_Table to Destination_Table
DECLARE
    CURSOR src_cursor IS 
        SELECT * FROM Source_Table;
    src_row Source_Table%ROWTYPE;
    counter INT := 0;
BEGIN
    OPEN src_cursor;
    LOOP
        FETCH src_cursor INTO src_row;
        EXIT WHEN src_cursor%NOTFOUND;

        INSERT INTO Destination_Table VALUES (src_row.id, src_row.name, src_row.value);
        
        counter := counter + 1;
    END LOOP;
    CLOSE src_cursor;

    DBMS_OUTPUT.PUT_LINE(counter || ' rows inserted into the Destination_Table.');
END;
/
