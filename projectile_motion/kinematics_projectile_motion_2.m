clear all; clc
%%
%Find minimum horizontal velocity needed to clear specified horizontal 
%distance for a projectile fired at a given height with no launch angle. 

%y = vertical (up is + and down is -)
%x = horizontal
distance_to_clear = 10; %Horizontal distance that needs to be cleared
clearance = 0; %Clearance for a given horizontal velocity; will be appended to on each iteration 
all_velocities = []; %Velocities used to calculate clearance
j = 0; %Iteration variable; needed to update horizontal velocity

while clearance(end) < distance_to_clear
    j = j+1; %Update iteration variable
    position_y = 30; %Initial vertical position is 30
    position_x = 0;

    velocity_y = 0;
    velocity_x = j * 0.01; %Update horizontal velocity
    all_velocities(end+1) = velocity_x;

    acceleration_y = -9.81; %gravity
    acceleration_x = 0;

    time = 0;

    while position_y(end) > 0
        %Update Time
        time(end+1) = time(end) + 0.01;
        
        %Update Velocity
        velocity_y(end+1) = acceleration_y(end) * 0.01 + velocity_y(end);
        velocity_x(end+1) = acceleration_x(end) * 0.01 + velocity_x(end);

        %Update Position
        position_y(end+1) = velocity_y(end) * 0.01 + position_y(end);
        position_x(end+1) = velocity_x(end) * 0.01 + position_x(end);

        %Update Acceleration
        acceleration_y(end+1) = -9.81;
        acceleration_x(end+1) = 0;
    end
   
    %Update clearance
    clearance(end+1) = position_x(end);
    disp(['Velocity: ' num2str(velocity_x(1)) '; ' 'Clearance: ' num2str(position_x(end))])
end

disp(['Minimum velocity needed to clear is: ' num2str(all_velocities(end))])

