%Created by: Daniel Kuhman
%Github: https://github.com/dkuhman
%Last updated: 2020-05-17

%Clear workspace
clear all
clc

%Load data
data_in = xlsread('linear_motion_example_data.xlsx');
com_position = data_in(:,41);

%Get velocity (1st derivative of position)
%This is calculated as change in position per frame (Not per unit time!)
com_velocity = get_derivative(com_position);

%Get acceleration (2nd derivative of position)
%This is calculated as change in velocity per frame (Not per unit time!)
com_acceleration = get_derivative(get_derivative(com_position));

%PLOT
figure
subplot(3,1,1)
plot(com_position, 'b', 'LineWidth', 2)
xlim([0 length(com_position)])
ylabel('CoM Position')
subplot(3,1,2)
plot(com_velocity, 'b', 'LineWidth', 2)
xlim([0 length(com_position)])
ylabel('CoM Velocity')
subplot(3,1,3)
plot(com_acceleration, 'b', 'LineWidth', 2)
xlim([0 length(com_position)])
ylabel('CoM Acceleration')
xlabel('Frames')