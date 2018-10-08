%eatfood1 = {'accelerometer-1533862083.csv','gyro-1533862083.csv','orientation-1533862083.csv','orientationEuler-1533862083.csv'};
%eatfood2 = {'accelerometer-1533862416.csv','gyro-1533862416.csv','orientation-1533862416.csv','orientationEuler-1533862416.csv'};
%eatfood3 = {'accelerometer-1533862913.csv','gyro-1533862913.csv','orientation-1533862913.csv','orientationEuler-1533862913.csv'};
%eatfood4 = {'accelerometer-1533864477.csv','gyro-1533864477.csv','orientation-1533864477.csv','orientationEuler-1533864477.csv'};

%drive1 = {'accelerometer-1533665970.csv','gyro-1533665970.csv','orientation-1533665970.csv','orientationEuler-1533665970.csv'};
%drive2 = {'accelerometer-1533665971.csv','gyro-1533665971.csv','orientation-1533665971.csv','orientationEuler-1533665971.csv'};
%drive3 = {'accelerometer-1533844116.csv','gyro-1533844116.csv','orientationEuler-1533844116.csv'}; 

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

all_eating = {eatfoodacc,eatfoodgyro,eatfoodorient,eatfoodeuorient,eatfoodemg};
all_driving = {driveacc,drivegyro,driveorient,driveeuorient,driveemg};

eatingACC = DataFormatter(eatfoodacc);
eatingGYRO = DataFormatter(eatfoodgyro);
eatingORIENT = DataFormatter(eatfoodorient); 
eatingEUORIENT = DataFormatter(eatfoodeuorient); 
eatingEMG = DataFormatter(eatfoodemg);

drivingACC = DataFormatter(driveacc);
drivingGYRO = DataFormatter(drivegyro);
drivingORIENT = DataFormatter(driveorient);
drivingEUORIENT = DataFormatter(driveeuorient);
drivingEMG = DataFormatter(driveemg);