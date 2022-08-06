create or replace trigger t_sawon_sapay
    after update of sapay on sawon
    for each row
    when (old.sajob != '부장')

declare 
    pragma autonomous_transaction;
begin
    insert into black_list_table (bsabun, bpaybefore, bpayafter)
    values(:old.sabun, :old.sapay, :new.sapay); 
    commit;

    if ((:new.sapay < :old.sapay) or (:new.sapay > :old.sapay*1.3)) then
        raise_application_error(-20001, '급여가 범위안의 값이 아닙니다!');
    end if;
    raise_application_error(-20001, '급여는 변경할 수 없습니다.');
end;
/

alter table  