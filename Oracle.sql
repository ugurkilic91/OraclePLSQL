--Veritabanında bulunan tablolarda primary key(PK) alanları listeler.
SELECT cols.table_name, cols.column_name, cols.position, cons.status, cons.owner
FROM all_constraints cons, all_cons_columns cols
WHERE
cols.table_name like 'TABLO_ADI'
AND cons.owner='Şema'
AND cons.constraint_type = 'P'
AND cons.constraint_name = cols.constraint_name
AND cons.owner = cols.owner
ORDER BY cols.table_name, cols.position;


--Veritabanında bulunan tüm sequence listeler
select sequence_owner, sequence_name from dba_sequences t where t.sequence_owner='Şema';

-- Tablo, view, sequence gibi objelerin oluşturulma ve son güncelleme tarihleri getirilecektir.
select object_name, object_type, created, last_ddl_time 
from user_objects
where object_name = 'OBJE_ADI';

-Tablo yada view unique kontrolu, belirtilen tabloda ve kolona göre unique olmayan kayıt varsa getirir.
SELECT kolon_adi, COUNT(kolon_adi)
FROM Tablo_adi
GROUP BY kolon_adi
HAVING COUNT(kolon_adi) > 1;
