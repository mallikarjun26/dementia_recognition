function sample = process_file(file_name)

  %
  data_dimension    = 6;
  
  intr_vol_line         = 34;
  
  feature_line{1}.left  = 91;  % left hippocampus
  feature_line{1}.right = 106; % right hippocampus
  
  feature_line{2}.left  = 81;  % left lat vent
  feature_line{2}.right = 99; % right lat vent
  
  feature_line{3}.left  = 85;  % left caudate
  feature_line{3}.right = 103; % right caudate       
  
  feature_line{4}.left  = 86;  % left putamen
  feature_line{4}.right = 104; % right putamen
  
  feature_line{5}.left  = 92; % left amygdala
  feature_line{5}.right = 107; % right amygdala
  
  feature_line{6}.left  = 87;  % left pallidum
  feature_line{6}.right = 105; % right pallidum
  
  %
  sample   = zeros(1, data_dimension);
  fid      = fopen(file_name);
  C        = textscan(fid, '%s', 'delimiter', '\n');
  
  line     = C{1}{intr_vol_line};
  splits   = strsplit(line, ',');
  intr_vol = str2num(splits{4});
  
  for i=1:size(feature_line, 2)
    line    = C{1}{feature_line{i}.left};
    splits  = strsplit(line, ' ');
    sample(i) = str2num(splits{4});
    line    = C{1}{feature_line{i}.right};
    splits  = strsplit(line, ' ');
    sample(i) = (sample(i) + str2num(splits{4})) / intr_vol;   
  end
  
end