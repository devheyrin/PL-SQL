create or replace trigger t_dept_up
    after update on dept
    for each row
begin
    update dept_bk 
    set deptno = :new.deptno;
        dname = :new.dname,
        loc = :new.loc
    where deptno = :old.deptno;
end;
/