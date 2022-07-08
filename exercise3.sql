set serveroutput on; 

SELECT CASE WHEN g.grade < 8 THEN 'NULL' ELSE s.name END name
     , g.grade
     , s.marks as mark
  FROM students s
  INNER JOIN grades g on s.marks between g.min_mark and g.max_mark   
 ORDER BY g.grade desc, name
/