

declare 
	i number(4) := 10;
begin
	if i > 10 then
		dbms_output.put_line('i�� 10���� Ů�ϴ�.');
	elsif i < 10 then
		dbms_output.put_line('i�� 10���� �۽��ϴ�.');
	else
		dbms_output.put_line('i�� 10�� �����ϴ�.');
	end if;
end;
/