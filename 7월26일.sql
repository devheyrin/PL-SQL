set serveroutput on 
set verify off

-- 1번 
accept num prompt 'type number -> '

declare
    result string(4) := '';
begin
    if mod(&num, 2) = 0 then
        result := 'even'; 
    else
        result := 'odd';
    end if;
    dbms_output.put_line(result);
end;
/

-- 2번
accept num prompt 'type number -> '

declare
begin
    for i in 1..9 loop
        dbms_output.put_line(&num || '*' || i || '=' || &num*i);
    end loop;
end;
/

-- 3번
begin
    for i in 1..9 loop
        for j in 1..9 loop
            dbms_output.put(i || ' X ' || j || ' = ' || i*j || ' ');
        end loop;
        dbms_output.put_line('');
    end loop;
end;
/

-- 4번
accept num prompt 'type number -> '
begin
    for i in 1..&num loop
        dbms_output.put_line(lpad('*', i, '*'));
    end loop;
end;
/

-- 5번
begin
    for i in 1..9 loop
        for j in 2..9 loop
            dbms_output.put(rpad(j ||'x'|| i || '=' || i*j || ' ', 10, ' '));
        end loop;
        dbms_output.put_line('');
    end loop;
end;
/
