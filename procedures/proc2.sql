BEGIN
  -- Example logic
  DECLARE output STRING;
  SET output = 'Hello BigQuery';
  insert into `manifest-audio-459916-d1.tf_dataset.Table_B` values ("1","Hello",CURRENT_TIMESTAMP());
END;