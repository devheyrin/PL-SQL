declare
	i number := 1;
begin 
	loop
        if i <= 10 then
            dbms_output.put_line('i ->' || i);
            i := i + 1;
        else 
            exit;
        end if;
	end loop;
end;
/