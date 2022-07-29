set serveroutput on
set verify off

-- ��� ������ ���� 
-- create sequence s_sabun
-- increment by 2
-- start with 201
-- maxvalue 200;

create or replace procedure p_sawon_in
	(v_name sawon.saname%type, v_pay sawon.sapay%type, v_sajob sawon.sajob%type, v_sex sawon.sasex%type, v_dname dept.dname%type)
is 
    v_sabun sawon.sabun%type;
    v_hiredate sawon.sahire%type;
    v_comm sawon.comm%type;
    v_samgr sawon.sabun%type;
    v_deptno sawon.deptno%type;

begin
    -- �Ի��� 
    v_hiredate := sysdate;

    -- Ŀ�̼� 
    if v_sajob = '�븮' then
        v_comm := v_pay * 0.1;
    elsif v_sajob = '����' then
        v_comm := v_pay * 0.15;
    elsif v_sajob = '����' then
        v_comm := v_pay * 0.2;
    else 
        v_comm := 0;
    end if;

    -- �����ڹ�ȣ 
    if v_dname = '������' then
        v_samgr := 3;
    elsif v_dname = '�ѹ���' then
        v_samgr := 10;
    elsif v_dname = '�����' then
        v_samgr := 6;
    else
        v_samgr := 0;
    end if;

    -- �μ���ȣ 
    select deptno into v_deptno from dept where dname = v_dname;

    -- insert 
    insert into 
    sawon(sabun, saname, deptno, sajob, sapay, sahire, sasex, samgr, comm)
    values(s_sabun.nextval, v_name, v_deptno, v_sajob, v_pay, v_hiredate, v_sex, v_samgr, v_comm);
end;
/

-- ȣ������(exec : ���ν��� ȣ��) 
-- exec p_sawon_in('ȫ����', 3000, '�븮', '����', '������')