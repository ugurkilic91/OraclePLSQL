--Basit bir cursor örneği
DECLARE
 plsql_sequence       VARCHAR2(500);
 my number(10):=5;
 CURSOR tablo_adi IS
SELECT owner, table_name FROM all_tables t where t.table_name like 'tbl_%' and t.owner='DB';
BEGIN
  FOR tablo IN tablo_adi LOOP
my:=my+1;
--  plsql_sequence:='insert into cbs_bt_dil values(:1)';
    plsql_sequence:='insert into "DB".cbs_bt_dil (id,ad,kisaltma) values(:1,:2,:3)';
      EXECUTE IMMEDIATE plsql_sequence USING my,tablo.table_name,'test';
    DBMS_OUTPUT.PUT_LINE(tablo.table_name);
  END LOOP;
END;
