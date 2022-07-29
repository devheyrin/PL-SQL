create or replace function f_sex
(v_gojumin varchar2)
return varchar2
is
    v_num varchar2(10);
    v_sex varchar2(10);
begin
    v_num := substr(v_gojumin, 8, 1);
    if v_num = '2' or v_num = '4' then 
        v_sex := '여자';
    elsif v_num = '1' or v_num = '3' then 
        v_sex := '남자';
    end if;
    return v_sex;
end;
/