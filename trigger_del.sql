create or replace trigger t_dept_del
    after delete on dept
    for each row
begin
    delete dept_bk where deptno = :old.deptno;
end;
/