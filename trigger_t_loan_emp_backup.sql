-- create table emp(
--    eid number(3) constraint emp_id_pk primary key, 
--    ename varchar2(10), 
--    loan_ck varchar2(2) default 'N');
-- create table loan(
--    empid number(3) constraint loan_empid_fk references emp(eid), 
--    amount number(10), 
--    loan_date date default sysdate);

-- create sequence s_eid
-- increment by 1
-- start with 1
-- maxvalue 100;

-- insert into emp(eid, ename) 
-- values(s_eid.nextval, '±èÁ¦´Ï');
-- insert into emp(eid, ename) 
-- values(s_eid.nextval, '¹ÚÁö¼ö');
-- insert into emp(eid, ename) 
-- values(s_eid.nextval, 'È«·ÎÁ¦');

create or replace trigger t_loan_emp_backup
    after insert or update of empid or delete on loan
    for each row

begin
    if inserting then 
        update emp
        set loan_ck = 'Y'
        where eid = :new.empid;
    elsif deleting then 
        update emp
        set loan_ck = 'N'
        where eid = :old.empid;
    elsif updating then 
        update emp
        set loan_ck = 'N'
        where eid = :old.empid;

        update emp 
        set loan_ck = 'Y'
        where eid = :new.empid;
    end if;
end;
/