clc; disp('Pre Processing ...');

data_folder       = '../data/ASEG data/';
class_1           = 'AD';
class_2A          = 'EMCI';
class_2B          = 'LMCI';
class_3           = 'NC';

data = [];
labels = [];

%%
[d_tr_1, d_te_1]    = get_data([data_folder class_1 ]);
[d_tr_2A, d_te_2A]  = get_data([data_folder class_2A]);
[d_tr_2B, d_te_2B]  = get_data([data_folder class_2B]);
[d_tr_3, d_te_3]    = get_data([data_folder class_3 ]);

l_tr_1  = 1 * ones(size(d_tr_1,1) , 1);
l_tr_2A = 2 * ones(size(d_tr_2A,1), 1);
l_tr_2B = 2 * ones(size(d_tr_2B,1), 1);
l_tr_3  = 3 * ones(size(d_tr_3,1) , 1);

l_te_1  = 1 * ones(size(d_te_1,1) , 1);
l_te_2A = 2 * ones(size(d_te_2A,1), 1);
l_te_2B = 2 * ones(size(d_te_2B,1), 1);
l_te_3  = 3 * ones(size(d_te_3,1) , 1);

%%
data_tr    = [d_tr_1; d_tr_2A; d_tr_2B; d_tr_3];
data_te    = [d_te_1; d_te_2A; d_te_2B; d_te_3];

labels_tr  = [l_tr_1; l_tr_2A; l_tr_2B; l_tr_3];
labels_te  = [l_te_1; l_te_2A; l_te_2B; l_te_3];

%%
write_files(data_tr, labels_tr, data_te, labels_te, data_folder);

disp('Done');