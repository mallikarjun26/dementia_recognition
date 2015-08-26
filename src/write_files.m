function write_files(data_tr, labels_tr, data_te, labels_te, data_folder)

  %
  data_dimension = size(data_tr(1,:), 2);
  
  %
  fid = fopen([data_folder '/../train_test/train.txt'], 'w');
  for i=1:size(data_tr, 1)
    line = num2str(labels_tr(i));
    for j=1:data_dimension
      line = [line ' ' num2str(j) ':' num2str(data_tr(i,j))];
    end
    line = [line '\n'];
    fprintf(fid, line);
  end
  fclose(fid);

  %
  fid = fopen([data_folder '/../train_test/test.txt'], 'w');
  for i=1:size(data_te, 1)
    line = num2str(labels_te(i));
    for j=1:data_dimension
      line = [line ' ' num2str(j) ':' num2str(data_te(i,j))];
    end
    line = [line '\n'];
    fprintf(fid, line);
  end
  fclose(fid);

end