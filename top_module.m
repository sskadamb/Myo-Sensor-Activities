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

%get split data:
eating1ACC = DataFormatter('data/accelerometer-1533862083.csv');
eating2ACC = DataFormatter('data/accelerometer-1533862416.csv');
eating3ACC = DataFormatter('data/accelerometer-1533862913.csv');
eating4ACC = DataFormatter('data/accelerometer-1533864477.csv');

eating1GYRO = DataFormatter('data/gyro-1533862083.csv');
eating2GYRO = DataFormatter('data/gyro-1533862416.csv');
eating3GYRO = DataFormatter('data/gyro-1533862913.csv');
eating4GYRO = DataFormatter('data/gyro-1533864477.csv');

eating1ORIENT = DataFormatter('data/orientation-1533862083.csv'); 
eating2ORIENT = DataFormatter('data/orientation-1533862416.csv'); 
eating3ORIENT = DataFormatter('data/orientation-1533862913.csv'); 
eating4ORIENT = DataFormatter('data/orientation-1533864477.csv'); 

eating1EUORIENT = DataFormatter('data/orientationEuler-1533862083.csv'); 
eating2EUORIENT = DataFormatter('data/orientationEuler-1533862416.csv'); 
eating3EUORIENT = DataFormatter('data/orientation-1533862913.csv'); 
eating4EUORIENT = DataFormatter('data/orientation-1533864477.csv'); 

eating1EMG = DataFormatter('data/emg-1533862083.csv');
eating2EMG = DataFormatter('data/emg-1533862416.csv');
eating3EMG = DataFormatter('data/emg-1533862913.csv');
eating4EMG = DataFormatter('data/emg-1533864477.csv');

driving1ACC = DataFormatter('data/accelerometer-1533665970.csv'); 
driving2ACC = DataFormatter('data/accelerometer-1533665971.csv'); 

driving1GYRO = DataFormatter('data/gyro-1533665970.csv'); 
driving2GYRO = DataFormatter('data/gyro-1533665971.csv'); 

driving1ORIENT = DataFormatter('data/orientation-1533665970.csv'); 
driving2ORIENT = DataFormatter('data/orientation-1533665971.csv'); 

driving1EUORIENT = DataFormatter('data/orientationEuler-1533665970.csv'); 
driving2EUORIENT = DataFormatter('data/orientationEuler-1533665971.csv'); 

driving1EMG = DataFormatter('data/emg-1533665970.csv'); 
driving2EMG = DataFormatter('data/emg-1533665971.csv');


%eatingOVGYRO = DataFormatter(eatfoodgyro);
%eatingOVORIENT = DataFormatter(eatfoodorient); 
%eatingOVEUORIENT = DataFormatter(eatfoodeuorient); 
%eatingOVEMG = DataFormatter(eatfoodemg);

%drivingACC = DataFormatter(driveacc);
%drivingGYRO = DataFormatter(drivegyro);
%drivingORIENT = DataFormatter(driveorient);
%drivingEUORIENT = DataFormatter(driveeuorient);
%drivingEMG = DataFormatter(driveemg);

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
%eval(sprintf('activity_%d,variance_%d = newFeatureExtraction(t1,t2,t3,t4,t5);', i));
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
    eval(sprintf('activity_eat_%d = padarray(activity_%d,[0,%d],\"post\");', i,i,pad_value));
end



activity_eatFood = [activity_eat_1; activity_eat_2; activity_eat_3; activity_eat_4];

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
%x=zeros(1,2);
%y=zeros(1,2);
%for i =1:2
%    eval(sprintf('[x(%d),y(%d)]=size(activity_%d);', i,i,i));
%end
pad_value_max=max(y);
%activity_1=padarray(activity_1,[0,100000000])
for i =1:2
    eval(sprintf('pad_value = pad_value_max - length(activity_%d);', i));
    eval(sprintf('activity_drive_%d = padarray(activity_%d,[0,%d],\"post\");', i,i,pad_value));
end


activity_drive = [activity_drive_1; activity_drive_2];

%[coeff,score,latent,tsquared,explained,mu] =pca(X)

% Now do PCA on the "measurements, without the class labels... this is
% created with our matrix X. 

%on how we got X: We had all of our data in a time form before, so we
%needed to summary the event of any 1 single activity by a transform. We
%did that through either the RMS, std, mean, fft etc. So now, for each
%single activity, we have a single vector with all of the transformed
%features acting as the new input data for the pca. we basically stack all
%of those, and get our X matrix as the following: 
X=[activity_eat_1;activity_eat_2;activity_eat_3;activity_eat_4;activity_drive_1;activity_drive_2]; % This is 6x84 as it should be. 


%X=[activity_eat_1;activity_eat_1;activity_eat_1;activity_eat_1;activity_eat_1;activity_eat_1]; % This is 6x84 as it should be. 

% now do the PCA: 

% 1. SVD: U(Sigma)V*  = X
%[U, Sig, V] = svd(X); % iris: 4x4, our: 84x84

% we are going to pick R =2 so that I can plot: 
%V_r = V(:,1:5);

% project all of the measurements onto V_r:
%a = X * V_r;

% now size of a is 6x 2, whereas iris 150x2... because I only picked the
% first 2 principle components 

%plot the data with the principle components as the new axis: 
%figure; plot(a(:,1), a(:,2),'o'); xlabel('PC1'); ylabel('PC2'); 

%was that the correct choice to just pick the top 2 components? 

%look at the sigma: 
%sv = diag(Sig);
%3.1803
%0.5919
%0.3617
%0.1030
%0.0788
%0.0215

% so... 95.36% variance explained in the first 2 PC... or 59.19 %? 
%figure; stairs(cumsum(sv)/sum(sv));

%so techically we have labels for this data according to the order of the
%creation of the X matrix. 

% labels = ['eating'; 'eating'; 'eating'; 'eating'; 'driving'; 'driving']
labels = ["eating"; "eating"; "eating"; "eating"; "driving"; "driving"]

%figure; scatter(a(:,1),a(:,2),30,categorical(labels));

[coeff,score,latent,tsquared,explained,mu] = pca(X); 
reducedDimension = coeff(:,1:5); 
reducedData = X * reducedDimension;



% 1. investigate ACC to be a good feature? YES 
plot(downsample(eating1ACC(:,1),30));  %subsampling with every 30 samples, good reconstruction 
hold on 
plot(driving1ACC1(:,1));


% 1. investigate ACC to be a good feature? YES 
plot(downsample(eating1ACC(:,1),30));  %subsampling with every 30 samples, good reconstruction 
hold on 
plot(driving1ACC1(:,1));

CompareFeatures(eating1ACC(:,1),driving1ACC(:,1));  %YES
CompareFeatures(eating1ACC(:,2),driving1ACC(:,2));  %YES 
CompareFeatures(eating1ACC(:,3),driving1ACC(:,3));  %YES
CompareFeatures(eating2ACC(:,3),driving2ACC(:,3));  %YES
CompareFeatures(eating2ACC(:,1),driving2ACC(:,1));  %YES

% 2. investigate GYRO to be a good feature? 
CompareFeatures(eating1GYRO(:,1),driving1GYRO(:,1)); % no
CompareFeatures(eating1GYRO(:,2),driving1GYRO(:,2));  %NO 
CompareFeatures(eating1GYRO(:,3),driving1GYRO(:,3));  %YES
CompareFeatures(eating2GYRO(:,3),driving2GYRO(:,3));  %YES
CompareFeatures(eating2GYRO(:,1),driving2GYRO(:,1));  %NO

% Investigate ORIENT  to be a good feature? 
CompareFeatures(eating1ORIENT(:,1),driving1ORIENT(:,1)); % YES! 
CompareFeatures(eating1ORIENT(:,2),driving1ORIENT(:,2));  %YES!  
CompareFeatures(eating1ORIENT(:,3),driving1ORIENT(:,3));  %YES!
CompareFeatures(eating1ORIENT(:,4),driving1ORIENT(:,4)); % YES! 
CompareFeatures(eating2ORIENT(:,3),driving2ORIENT(:,3));  %YES!
CompareFeatures(eating2ORIENT(:,1),driving2ORIENT(:,1));  %YES!

%Investigate EUORIENT to be a good feature?  %YES
CompareFeatures(eating1EUORIENT(:,1),driving1EUORIENT(:,1)); 
CompareFeatures(eating1EUORIENT(:,2),driving1EUORIENT(:,2));   
CompareFeatures(eating1EUORIENT(:,3),driving1EUORIENT(:,3));  %YES
CompareFeatures(eating2EUORIENT(:,3),driving2EUORIENT(:,3));  %YES!
CompareFeatures(eating2EUORIENT(:,1),driving2EUORIENT(:,1));  

%Investigate EMG to be a good feature? %its horrible 
CompareFeatures(eating1EMG(:,1),driving1EMG(:,1)); 
CompareFeatures(eating1EMG(:,2),driving1EMG(:,2));   
CompareFeatures(eating1EMG(:,3),driving1EMG(:,3));  
CompareFeatures(eating2EMG(:,3),driving2EMG(:,3));  
CompareFeatures(eating2EMG(:,1),driving2EMG(:,1));
CompareFeatures(eating2EMG(:,8),driving2EMG(:,8));
