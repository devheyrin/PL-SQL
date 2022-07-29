set serveroutput on
set verify off

create or replace procedure p_sawon_up
	(v_sabun sawon.sabun%type, 
    v_pay sawon.sapay%type, 
    v_sajob sawon.sajob%type, 
    v_dname dept.dname%type)
is 
    v_comm sawon.comm%type;
    v_samgr sawon.sabun%type;
    v_deptno sawon.deptno%type;

begin

    -- 目固记 
    if v_sajob = '措府' then
        v_comm := v_pay * 0.1;
    elsif v_sajob = '苞厘' then
        v_comm := v_pay * 0.15;
    elsif v_sajob = '何厘' then
        v_comm := v_pay * 0.2;
    else 
        v_comm := 0;
    end if;

    -- 包府磊锅龋 
    if v_dname = '康诀何' then
        v_samgr := 3;
    elsif v_dname = '醚公何' then
        v_samgr := 10;
    elsif v_dname = '傈魂何' then
        v_samgr := 6;
    elsif v_dname = '包府何' then
        v_samgr := 1;
    else
        v_samgr := 0;
    end if;

    -- deptno 
    select deptno into v_deptno from dept where dname = v_dname;

    -- update
    update sawon
    set 
    sapay = v_pay,
    sajob = v_sajob,
    comm = v_comm,
    deptno = v_deptno,
    samgr = v_samgr
    where sabun = v_sabun;
end;
/

-- exec p_sawon_up(209, 3500, '苞厘', '包府何')