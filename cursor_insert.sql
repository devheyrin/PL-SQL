set serveroutput on
set verify off
delete from sawon_result where 1=1;

declare
    cursor mycur is select sabun, saname, sahire, sapay from sawon;
    v_comm sawon.comm%type;
    v_hiredays varchar2(20);
    v_rank number(10);

begin
    for i in mycur loop
        -- 근무기간 
        v_hiredays := floor(months_between(sysdate, i.sahire)/12)||'년 '|| 
                      floor(mod(months_between(sysdate, i.sahire), 12))||'개월';

        -- 급여순위 
        v_rank := 0;
        select count(*) into v_rank from sawon where sapay > i.sapay;
        v_rank := v_rank +1;

        insert into 
        sawon_result(sabun, saname, sahire, sapay, work_bet, pay_rank) 
        values(i.sabun, i.saname, i.sahire, i.sapay, v_hiredays, v_rank);

    end loop;
end;
/