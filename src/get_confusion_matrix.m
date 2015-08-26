function confusion_matrix = get_confusion_matrix(test_file, predict_file)

  %
  num_of_classes = 3;
  
  %
  confusion_matrix = zeros(num_of_classes, num_of_classes);
  
  %
  fid_t = fopen(test_file);
  fid_p = fopen(predict_file);
  
  %
  line_t = fgets(fid_t);
  line_p = fgets(fid_p);

  while(ischar(line_t))

    splits_t = strsplit(line_t, ' ');
    splits_p = strsplit(line_p, ' ');
    
    t = str2num(splits_t{1});
    p = str2num(splits_p{1});
    
    confusion_matrix(p, t) = confusion_matrix(p, t) + 1;
    
    line_t = fgets(fid_t);
    line_p = fgets(fid_p);

  end
  
end