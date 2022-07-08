DECLARE
primenum varchar(32767);
num number;
ehprimo boolean := true;
BEGIN
    FOR i in 2..1000
    LOOP
        ehprimo := true;
        FOR num in 2..(i-1)
        LOOP
             IF(mod(i,num) = 0) THEN
                ehprimo := false;
             END IF;
        END LOOP;
        IF ehprimo = true THEN
            IF primenum is null THEN
            primenum := i;
            ELSE
            primenum := primenum||'&'||i;
            END IF;
        END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(primenum);
END;