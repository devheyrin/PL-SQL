accept name prompt 'name-> ';
accept sal prompt 'sal-> ';
accept job prompt 'job-> ';
accept sex prompt 'sex-> ';
accept dname prompt 'dname-> ';

begin
    p_sawon_in('&name', &sal, '&job', '&sex', '&dname');
end;
/