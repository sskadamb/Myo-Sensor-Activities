function [activity_1, variance_orient] = newFeatureExtraction(t1,t2,t3,t4,t5);

%t1 = csvread('../Project/Data/EatFood1/orientation-1533862083.csv', 1, 1);

%t2 = csvread('../Project/Data/EatFood1/gyro-1533862083.csv', 1, 1);

%t3 = csvread('../Project/Data/EatFood1/orientationEuler-1533862083.csv', 1, 1);

%t4 = csvread('../Project/Data/EatFood1/accelerometer-1533862083.csv', 1, 1);

%t5 = csvread('../Project/Data/EatFood1/emg-1533862083.csv', 1, 1);

rms_orientation = rms(t1);
std_orientation =std(t1);
mean_oriention = mean(t1);
var_oriention = var(t1);
fft_orientaion = fft(t1);
fft_orien_x = fft_orientaion(:,1);
fft_orien_y = fft_orientaion(:,2);
fft_orien_z = fft_orientaion(:,3);
fft_orien_w = fft_orientaion(:,4);

rms_gyro = rms(t2);
std_gyro = std(t2);
mean_gyro = mean(t2);
var_gyro = var(t2);
fft_gyro = fft(t2);
fft_gyro_x = fft_gyro(:,1);
fft_gyro_y = fft_gyro(:,2);
fft_gyro_z = fft_gyro(:,3);

rms_orientioneu = rms(t3);
std_orientioneu = std(t3);
mean_orientioneu = mean(t3);
var_orientioneu = mean(t3);
fft_orientioneu = fft(t3);
fft_orientioneu_roll= fft_orientioneu(:,1);
fft_orientioneu_pitch = fft_orientioneu(:,2);
fft_orientioneu_yaw = fft_orientioneu(:,3);

rms_acc = rms(t4);
std_acc = std(t4);
mean_acc = mean(t4);
var_acc = var(t4);
fft_acc = fft(t4);
fft_acc_x= fft_acc(:,1);
fft_acc_y = fft_acc(:,2);
fft_acc_z = fft_acc(:,3);

rms_emg = rms(t5);
std_emg = std(t5);
mean_emg = mean(t5);
var_emg = var(t5);
fft_emg = fft(t5);
fft_emg_1= fft_emg(:,1);
fft_emg_2 = fft_emg(:,2);
fft_emg_3 = fft_emg(:,3);
fft_emg_4= fft_emg(:,4);
fft_emg_5 = fft_emg(:,5);
fft_emg_6 = fft_emg(:,6);
fft_emg_7 = fft_emg(:,7);
fft_emg_8 = fft_emg(:,8);
activity_1 = real([rms_orientation, rms_gyro, rms_orientioneu, rms_acc, rms_emg, std_orientation, std_gyro, std_orientioneu, std_acc, std_emg, mean_oriention, mean_gyro, mean_orientioneu, mean_acc, mean_emg, var_oriention, var_gyro, var_orientioneu, var_acc, var_emg, fft_orien_x', fft_orien_y', fft_orien_z', fft_orien_w', fft_gyro_x', fft_gyro_y', fft_gyro_z', fft_orientioneu_roll', fft_orientioneu_pitch', fft_orientioneu_yaw', fft_acc_x', fft_acc_y',fft_acc_z', fft_emg_1',fft_emg_2', fft_emg_3', fft_emg_4', fft_emg_5', fft_emg_6', fft_emg_7',fft_emg_8' ]);
variance_orient = [var_oriention]
%activity_1 = real([rms_orientation, rms_gyro, rms_orientioneu, rms_acc, rms_emg, std_orientation, std_gyro, std_orientioneu, std_acc, std_emg, mean_oriention, mean_gyro, mean_orientioneu, mean_acc, mean_emg, var_oriention, var_gyro, var_orientioneu, var_acc, var_emg]);


