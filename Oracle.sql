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

-- Prosedür yada foksiyona gelen değer varsa koşula ekle yoksa, yoksay değişken adi "KATEGORI"
select * from kategoriler i where 
1 = (CASE WHEN KATEGORI = 0 THEN 1 WHEN KATEGORI !=0 AND i.KATEGORI_ID = KATEGORI THEN 1 END) and  bla bla :)


-- Prosedür yada foksiyona gelen değer varsa koşula ekle Basit
select * from (
select 
(case when 11<10 then 'bura'
when 1<5 then 'aa' end) D
 from dual)  where D= case when D='aa'  then D else 'a' end;
