create table dept_bk as select * from dept;

create or replace trigger t_dept_in
    after insert on dept
    for each row
begin
    insert into dept_bk(deptno, dname, loc) 
    values(:new.deptno, :new.dname, :new.loc);
end;
/