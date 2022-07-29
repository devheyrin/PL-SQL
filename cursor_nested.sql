set serveroutput on
set verify off

declare
    cursor mycur1 is select hakbun, name, kor, mat, eng from student;
    v_total record.total%type;
    v_avg record.avg%type;
    v_hakjum record.hakjum%type;
    v_grade record.grade%type;
    cnt number(3) := 0;

begin
    delete from record where 1=1;

    for i in mycur1 loop
        -- ����
        v_total := i.kor + i.mat + i.eng;
        -- ���
        v_avg := (v_total) / 3;
        dbms_output.put_line(v_avg);
        -- ���� : ����̾簡
        if v_avg >= 90 then 
            v_hakjum := '��';
        elsif v_avg >= 80 then
            v_hakjum := '��';
        elsif v_avg >= 70 then  
            v_hakjum := '��';
        elsif v_avg >= 60 then
            v_hakjum := '��';
        else 
            v_hakjum := '��';
        end if;
        dbms_output.put_line(v_hakjum);
        
        -- �� 
        if v_avg >= 70 then 
            v_grade := '�հ�';
        else 
            v_grade := '���հ�';
        end if;
        dbms_output.put_line(v_grade);
        
        insert into record(hakbun, name, kor, mat, eng, total, avg, hakjum, grade)
        values(i.hakbun, i.name, i.kor, i.mat, i.eng, v_total, v_avg, v_hakjum, v_grade);
        
        cnt := mycur1%rowcount;
    end loop;

    dbms_output.put_line('ó���� �л��� '|| cnt);

    declare
        cursor mycur2 is select hakbun, total from record;
        v_rank record.s_rank%type;
    begin
        for i in mycur2 loop
            v_rank := 0;
            select count(*) into v_rank from record where total > i.total;
            v_rank := v_rank + 1;
            update record 
            set s_rank = v_rank
            where hakbun = i.hakbun;
        end loop;
    end;
end;
/