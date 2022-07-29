

declare 
	i number(4) := 10;
begin
	if i > 10 then
		dbms_output.put_line('i는 10보다 큽니다.');
	elsif i < 10 then
		dbms_output.put_line('i는 10보다 작습니다.');
	else
		dbms_output.put_line('i는 10과 같습니다.');
	end if;
end;
/