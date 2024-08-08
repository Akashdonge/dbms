SET SERVEROUTPUT ON

DECLARE
    n NUMBER := &n;   -- Takes the input number from the user.
    j NUMBER := 2;    -- Starts checking divisors from 2.
    counter NUMBER := 0; -- A flag to indicate if a divisor is found.
BEGIN
    WHILE (j <= n/2) LOOP
        IF MOD(n, j) = 0 THEN
            DBMS_OUTPUT.PUT_LINE(n || ' is not a prime number');
            counter := 1; -- Set the flag to 1 if a divisor is found.
            EXIT; -- Exit the loop as the number is not prime.
        ELSE
            j := j + 1; -- Increment the divisor.
        END IF;
    END LOOP;

    IF counter = 0 THEN
        DBMS_OUTPUT.PUT_LINE(n || ' is a prime number'); -- If no divisor was found, the number is prime.
    END IF;
END;
/
