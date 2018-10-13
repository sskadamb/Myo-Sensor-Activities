function compareGraph = CompareFeatures(eatingData,drivingData)

sampling_rate = round(length(eatingData)/length(drivingData));
 
figure
plot(downsample(eatingData(:,1),sampling_rate));
hold on
compareGraph = plot(drivingData(:,1));
end 

