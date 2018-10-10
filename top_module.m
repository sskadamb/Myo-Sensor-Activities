% Eating activity 1



eatfoodacc = {'data/accelerometer-1533862083.csv','data/accelerometer-1533862416.csv','data/accelerometer-1533862913.csv','data/accelerometer-1533864477.csv'};
eatfoodgyro = {'data/gyro-1533862083.csv','data/gyro-1533862416.csv','data/gyro-1533862913.csv','data/gyro-1533864477.csv'};
eatfoodorient = {'data/orientation-1533862083.csv','data/orientation-1533862416.csv','data/orientation-1533862913.csv','data/orientation-1533864477.csv'};
eatfoodeuorient = {'data/orientationEuler-1533665970.csv','data/orientationEuler-1533862416.csv','data/orientationEuler-1533862913.csv','data/orientationEuler-1533864477.csv'};
eatfoodemg = {'data/emg-1533862083.csv','data/emg-1533862416.csv','data/emg-1533862913.csv','data/emg-1533864477.csv'};

driveacc = {'data/accelerometer-1533665970.csv','data/accelerometer-1533665971.csv','data/accelerometer-1533844116.csv'};
drivegyro = {'data/gyro-1533665970.csv','data/gyro-1533665971.csv','data/gyro-1533844116.csv'};
driveorient = {'data/orientation-1533665970.csv','data/orientation-1533665971.csv'};
driveeuorient = {'data/orientationEuler-1533665970.csv','data/orientationEuler-1533665971.csv','data/orientationEuler-1533844116.csv'}; 
driveemg = {'data/emg-1533665970.csv','data/emg-1533665971.csv','data/emg-1533844116.csv'};

for i = 1:4
file_name_1 = string(eatfoodorient(i));
file_name_2 = string(eatfoodgyro(i));
file_name_3 = string(eatfoodeuorient(i));
file_name_4 = string(eatfoodacc(i));
file_name_5 = string(eatfoodemg(i));
t1 = csvread(file_name_1, 1, 1);
t2 = csvread(file_name_2, 1, 1);
t3 = csvread(file_name_3, 1, 1);
t4 = csvread(file_name_4, 1, 1);
t5 = csvread(file_name_5, 1, 1);
%activity_1 = newFeatureExtraction(t1,t2,t3,t4,t5);
eval(sprintf('activity_%d = newFeatureExtraction(t1,t2,t3,t4,t5);', i));

end
activity_eatFood = [activity_1; activity_2; activity_3; activity_4];

figure
plot(activity_eatFood(:,1), '-o')

title('Eating Action v/s RMS Orientation along X')
xlabel('Activity')
ylabel('rms_orientation_x')

figure
plot(activity_eatFood(:,2), '-o')

title('Eating Action v/s RMS Orientation along Y')
xlabel('Activity')
ylabel('rms_orientation_y')

figure
plot(activity_eatFood(:,3), '-o')

title('Eating Action v/s RMS Orientation along z')
xlabel('Activity')
ylabel('rms_orientation_z')

figure
plot(activity_eatFood(:,4), '-o')

title('Eating Action v/s RMS Orientation along W')
xlabel('Activity')
ylabel('rms_orientation_w')




% Zero padding
x=zeros(1,4);
y=zeros(1,4);
for i =1:4
    eval(sprintf('[x(%d),y(%d)]=size(activity_%d);', i,i,i));
end
pad_value_max=max(y);
%activity_1=padarray(activity_1,[0,100000000])
for i =1:4
    eval(sprintf('pad_value = pad_value_max - length(activity_%d);', i));
    eval(sprintf('activity_eat_%d = padarray(activity_%d,[0,%d],\"post\");', i,i,pad_value));
end






% Driving Activity

for i = 1:2
file_name_1 = string(driveorient(i));
file_name_2 = string(drivegyro(i));
file_name_3 = string(driveeuorient(i));
file_name_4 = string(driveacc(i));
file_name_5 = string(driveemg(i));
t1 = csvread(file_name_1, 1, 1);
t2 = csvread(file_name_2, 1, 1);
t3 = csvread(file_name_3, 1, 1);
t4 = csvread(file_name_4, 1, 1);
t5 = csvread(file_name_5, 1, 1);
%activity_1 = newFeatureExtraction(t1,t2,t3,t4,t5);
eval(sprintf('activity_%d = newFeatureExtraction(t1,t2,t3,t4,t5);', i));

end


% Zero padding
x=zeros(1,4);
y=zeros(1,4);
for i =1:4
    eval(sprintf('[x(%d),y(%d)]=size(activity_%d);', i,i,i));
end
pad_value_max=max(y);
%activity_1=padarray(activity_1,[0,100000000])
for i =1:4
    eval(sprintf('pad_value = pad_value_max - length(activity_%d);', i));
    eval(sprintf('activity_drive_%d = padarray(activity_%d,[0,%d],\"post\");', i,i,pad_value));
end
