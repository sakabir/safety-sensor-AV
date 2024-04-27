function lidarCollisionAvoidance(lidarData)
    safeDistance = 5;
    if isempty(lidarData)
        disp('No lidar data available.');
        return;
    end

    obstacles = lidarData(lidarData < safeDistance);
    if ~isempty(obstacles)
        disp('Collision detected! Taking evasive action.');
        % collision avoidance algorithm
        stopVehicle();
    else
        disp('No collision detected. Proceeding safely.');
        % normal driving algorithm
    end
end

function stopVehicle()
    disp('Stopping the vehicle!');
    % code to stop or take action
end