create or replace procedure p_sawon_name
(v_bun sawon.sabun%type,
v_name out sawon.saname%type)
 
is 
begin
    select saname into v_name from sawon where sabun = v_bun;
end;
/