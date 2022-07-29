create or replace trigger t_dept_backup
    after insert or update or delete on dept
    for each row
begin
    if inserting then
        insert into dept_bk(deptno, dname, loc) 
        values(:new.deptno, :new.dname, :new.loc);
    elsif updating then 
        update dept_bk 
        set deptno = :new.deptno;
            dname = :new.dname,
            loc = :new.loc
        where deptno = :old.deptno;
    elsif deleting then 
        delete dept_bk where deptno = :old.deptno;
end;
/