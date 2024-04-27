function processSensorData(cameraData, lidarData, radarData)
    thresholdDistance = 10; 
    crossingThreshold = 5;  

    if isempty(lidarData) && isempty(radarData)
        disp('No sensor data available.');
        return;
    end

    if ~isempty(lidarData) && any(lidarData > thresholdDistance)
        disp('Using lidar for objects more than 10m away.');
        processLidarData(lidarData);
    end

    if ~isempty(cameraData)
        disp('Using camera for lane detection.');
        processCameraData(cameraData);
    end

    if ~isempty(radarData) && any(radarData < thresholdDistance)
        disp('Using radar for objects less than 10m away and for crossings.');
        processRadarData(radarData, crossingThreshold);
    end
end

function processLidarData(lidarData)
    disp('Processing lidar data.');
    % lidar processing code
end

function processCameraData(cameraData)
  
    disp('Processing camera data for lane detection.');
    % camera processing code for lane detection 
end

function processRadarData(radarData, crossingThreshold)
    disp('Processing radar data for objects less than 10m away and for crossings.');
   
    closeObjects = radarData(radarData < 10);
    if ~isempty(closeObjects)
        disp('Processing close objects detected by radar.');
  
    end

    crossingObjects = radarData(radarData < crossingThreshold);
    if ~isempty(crossingObjects)
        disp('Processing radar data for crossings.');
        % radar processing code for crossings 
    end
end