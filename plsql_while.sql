declare
	i number := 1;
begin 
	while i <= 10 loop
		dbms_output.put_line('iÀÇ °ª->' || i);
		i := i + 1;
	end loop;
end;
/