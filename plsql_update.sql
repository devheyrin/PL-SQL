set serveroutput on
set verify off

accept bun prompt 'ป็น๘ -> ' 

declare
    -- sa sawon%rowtype;
    v_sapay sawon.sapay%type;
    v_comm sawon.comm%type;

begin
    select sapay into v_sapay from sawon where sabun = &bun;

    if v_sapay < 1000 then 
        v_comm := v_sapay*0.1;
    elsif v_sapay <= 2000 then
        v_comm := v_sapay*0.15;
    elsif v_sapay > 2000 then 
        v_comm := v_sapay*0.2; 
    else
        v_comm := 0;
    end if;
    dbms_output.put_line('comm -> ' || v_comm);

    update sawon
    set comm = v_comm
    where sabun = &bun;
end;
/