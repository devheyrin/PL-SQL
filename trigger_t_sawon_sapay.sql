create or replace trigger t_sawon_sapay
    after update of sapay on sawon
    for each row
    when (old.sajob != '����')

declare 
    pragma autonomous_transaction;
begin
    insert into black_list_table (bsabun, bpaybefore, bpayafter)
    values(:old.sabun, :old.sapay, :new.sapay); 
    commit;

    if ((:new.sapay < :old.sapay) or (:new.sapay > :old.sapay*1.3)) then
        raise_application_error(-20001, '�޿��� �������� ���� �ƴմϴ�!');
    end if;
    raise_application_error(-20001, '�޿��� ������ �� �����ϴ�.');
end;
/

alter table  