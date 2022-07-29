create or replace function f_jumin_check
(v_jumin varchar2)
return varchar2
is

v_result number(10);

begin
    v_result := substr(v_jumin, 1, 1) * 2
              + substr(v_jumin, 2, 1) * 3
              + substr(v_jumin, 3, 1) * 4
              + substr(v_jumin, 4, 1) * 5
              + substr(v_jumin, 5, 1) * 6
              + substr(v_jumin, 6, 1) * 7
              + substr(v_jumin, 8, 1) * 8
              + substr(v_jumin, 9, 1) * 9
              + substr(v_jumin, 10, 1) * 2
              + substr(v_jumin, 11, 1) * 3
              + substr(v_jumin, 12, 1) * 4
              + substr(v_jumin, 13, 1) * 5;
              
    v_result := mod(v_result, 11);
    v_result := 11 - v_result;

    v_result := mod(v_result, 10);

    if v_result = substr(v_jumin, 14, 1) then 
        return '유효';
    else
        return '비유효';
    end if;
end;
/