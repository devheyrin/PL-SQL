declare
	i number := 1;
begin 
	loop
		dbms_output.put_line('i ->' || i);
		i := i + 1;
		exit when i > 10;
	end loop;
end;
/