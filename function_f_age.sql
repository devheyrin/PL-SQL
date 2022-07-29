create or replace function f_age
(v_gojumin varchar2)
return number
is

    v_year varchar2(10);
    v_century varchar2(10);
    v_birth varchar2(10);
    v_age number(10);

begin
    v_year := substr(v_gojumin, 1, 2);
    v_century := substr(v_gojumin, 8, 1);

    if v_century = 1 or v_century = 2 then
        v_birth := '19'||v_year;
    elsif v_century = 3 or v_century = 4 then
        v_birth := '20'||v_year;
    end if;

    v_age := months_between(sysdate, to_date(v_birth, 'yyyy')) / 12;
    v_age := floor(v_age) + 1;
    
    return v_age;
end;
/