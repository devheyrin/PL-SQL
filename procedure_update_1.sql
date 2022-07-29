set serveroutput on
set verify off

create or replace procedure p_sawon_up_1
	(v_sabun sawon.sabun%type, 
    v_pay sawon.sapay%type, 
    v_sajob sawon.sajob%type, 
    v_dname dept.dname%type)
is 
    v_comm sawon.comm%type;
    v_samgr sawon.sabun%type;
    v_deptno sawon.deptno%type;

begin
    -- update
    update sawon
    set 
    sapay = v_pay,
    sajob = v_sajob,
    comm = (case sajob when '措府' then sapay*0.1
                       when '苞厘' then sapay*0.15
                       when '何厘' then sapay*0.2
                       else 0 end),
    deptno = (select deptno from dept where dname = v_dname),
    samgr = (case v_dname when '康诀何' then 3
                          when '醚公何' then 10
                          when '傈魂何' then 6
                          when '包府何' then 1
                          else 1 end)
    where sabun = v_sabun;
end;
/

-- exec p_sawon_up(209, 3500, '苞厘', '包府何')