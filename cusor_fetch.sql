set serveroutput on
set verify off

declare
    cursor mycur is select sapay, sabun from sawon;
    v_sapay sawon.sapay%type;
    v_sabun sawon.sabun%type;
    v_comm sawon.comm%type;

begin
    if mycur%isopen then close mycur;
    end if;

    open mycur;

    loop
        fetch mycur into v_sapay, v_sabun;
        exit when (mycur%notfound);

        if v_sapay < 1000 then
            v_comm := v_sapay*0.1;
        elsif v_sapay <= 2000 then 
            v_comm := v_sapay*0.15;
        elsif v_sapay > 2000 then
            v_comm := v_sapay*0.2;
        else   
            v_comm := 0;
        end if;

        update sawon
        set comm = v_comm
        where sabun = v_sabun;
        dbms_output.put_line('사번: ' || v_sabun || ', 커미션: ' || v_comm);
    
    end loop;
    close mycur;
end;
/