accept bun prompt '사번 입력 -> ' 

declare
    -- saname sawon.saname%type;
    -- sapay sawon.sapay%type;
    a sawon%rowtype;

begin
    select saname, sapay into a.saname, a.sapay from sawon where sabun = &bun;
    dbms_output.put_line(a.saname || a.sapay);
end;
/