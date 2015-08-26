function [data_tr, data_te] = get_data(samples_folder)

  %
  %data_dimension    = 3;
  file_extension    = '/*.stats';
  sample_files      = dir([samples_folder file_extension]);
  number_of_samples = size(sample_files, 1);
  
  %
  %data = zeros(number_of_samples, data_dimension);
  data = [];
  
  %
  for i=1:number_of_samples
    file_name   = [samples_folder '/' sample_files(i).name];
    %data(i, :)  = process_file(file_name);
    data        = [data ; process_file(file_name)];
  end
  
  %
  [tr_ind, ~, te_ind] = dividerand(number_of_samples(1), 0.75, 0, 0.25);
  
  %
  data_tr = data(tr_ind, :);
  data_te = data(te_ind, :);
  
end