create or replace trigger t_deptno_update_cascade
    after update on dept
    for each row
begin
    update sawon
    set deptno = :new.deptno
    where deptno = :old.deptno;
end;
/