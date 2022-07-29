set serveroutput on
set verify off

begin
    for i in 1..9 loop
        dbms_output.put(i);
    end loop;
    dbms_output.put_line(' ');
end;
/