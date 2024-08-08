SET SERVEROUTPUT ON

DECLARE
    a NUMBER;    -- This will store the first number in the Fibonacci sequence.
    b NUMBER;    -- This will store the second number in the Fibonacci sequence.
    c NUMBER;    -- This will store the sum of the previous two numbers.
    n NUMBER;    -- This will determine how many Fibonacci numbers to generate.
    i NUMBER;    -- This will be used as the loop counter.
BEGIN
    n := 8;      -- Set the number of Fibonacci terms you want to generate.
    a := 0;      -- Initialize the first term of the sequence.
    b := 1;      -- Initialize the second term of the sequence.
    
    DBMS_OUTPUT.PUT_LINE(a);  -- Output the first term.
    DBMS_OUTPUT.PUT_LINE(b);  -- Output the second term.
    
    FOR i IN 1..n-2 LOOP      -- Loop starts from 1 to n-2 because the first two terms are already printed.
        c := a + b;           -- Calculate the next term in the sequence.
        DBMS_OUTPUT.PUT_LINE(c); -- Output the next term.
        a := b;               -- Move to the next term in the sequence.
        b := c;               -- Move to the next term in the sequence.
    END LOOP;
END;
/
