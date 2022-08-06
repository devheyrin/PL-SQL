-- 프로시져.1
create or replace procedure p_state
                            (v_hireyear number, 
                            v_result out varchar2)
is 
    v_sanum number(10);
    v_avgpay number(10);
begin
    select count(*), avg(sapay) into v_sanum, v_avgpay from sawon
    where sahire >= to_date(v_hireyear, 'yyyy') 
    and sahire < to_date(v_hireyear+1, 'yyyy');
    v_result := v_hireyear||'년 입사한 사원은 '
                || v_sanum || '명, 평균급여는 ' 
                || v_avgpay || '이다.' ;
end;
/

-- 함수.1
create or replace function f_num_graph
(v_sapay number)
return varchar2

is

begin
    return lpad('*', v_sapay / 100, '*');
end;
/

-- 함수.2
create or replace function f_work_term
(v_sahire date)
return varchar2

is
    v_hiredays number;
    v_hiredyear varchar2(100);
    v_hiredmonth varchar2(100);
    v_result varchar2(100);
begin
    v_hiredays := months_between(sysdate, v_sahire);
    v_hiredyear := floor(v_hiredays / 12);
    v_hiredmonth := floor(mod(v_hiredays, 12));
    v_result := v_hiredyear || '년 ' || v_hiredmonth || '개월';

    return v_result;
end;
/

-- 함수 .3
create or replace function add_date
(v_sahire date, 
v_year number,
v_month number, 
v_day number)
return date

is 

v_ym varchar2(10);
v_ds varchar2(10);
v_hire date;

begin
    v_ym := to_char(v_year, '00') || '-' || to_char(v_month, '00');
    v_ds := v_day || ' 00:00:00';
    v_hire := v_sahire + to_yminterval(v_ym);
    v_hire := v_hire + to_dsinterval(v_ds);
    return v_hire;
end;
/