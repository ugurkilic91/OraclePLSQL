DECLARE
  l_str          CLOB;
  l_dept_obj     JSON_OBJECT_T;
  l_emp_arr      JSON_ARRAY_T;
BEGIN
  SELECT j.LISTEJSON 
    INTO l_str
    FROM TABLONAME j where  j.KAYITNO=306 ;
      l_emp_arr:=JSON_ARRAY_T(l_str);
       DBMS_OUTPUT.PUT_LINE(l_emp_arr.get_size());   
  FOR i IN 0 .. l_emp_arr.get_size - 1 
  LOOP
    l_dept_obj := TREAT(l_emp_arr.get(i) AS JSON_OBJECT_T);
    DBMS_OUTPUT.PUT_LINE('index  : '||i||' - KalanKapasite : ' || l_dept_obj.get_number('KalanKapasite'));
        DBMS_OUTPUT.PUT_LINE( l_dept_obj.get_String('CinsiyetString'));
  END LOOP;
END;
