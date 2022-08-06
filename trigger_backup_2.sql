create or replace trigger t_backup_ljc
    after insert or update or delete on jaechuldb2
    for each row
begin
    if inserting then
        insert into jaechuldb2@ljc(idx, name, age) 
        values(:new.idx, :new.name, :new.age);

        -- insert into jaechuldb@pyj(name, age) 
        -- values(:new.name, :new.age);

        -- insert into jaechuldb@jhn(name, age) 
        -- values(:new.name, :new.age);
    elsif updating then 
        update jaechuldb2@ljc
        set age = :new.age,
            name = :new.name
        where idx = :old.idx;

        -- update jaechuldb@pyj
        -- set age = :new.age
        -- where name = :old.name;

        -- update jaechuldb@jhn
        -- set age = :new.age
        -- where name = :old.name;

    elsif deleting then 
        delete jaechuldb2@ljc where name = :old.idx;
        -- delete jaechuldb@pyj where name = :old.name;
        -- delete jaechuldb@jhn where name = :old.name;
    end if;
end;
/