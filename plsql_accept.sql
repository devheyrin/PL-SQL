set serveroutput on 
set verify off

accept num prompt 'number -> '

begin
    dbms_output.put_line('input number -> ' || &num);
end;
/