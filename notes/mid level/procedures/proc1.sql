BEGIN
  -- Example logic
  DECLARE output STRING;
  SET output = 'Hello BigQuery';
  insert into `project-info-prac.tf_dataset.table1` values ("1","Hello",CURRENT_TIMESTAMP(),1);
END;