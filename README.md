# BASIC 2D KINEMATICS 
This repository houses MATLAB scripts related to solving 2D kinematic problems (e.g., projectile motion). 

---

## Linear Motion
`get_derivative.m`: This function finds the derivative of a signal.

`get_derivative_impliment.m`: This script provides an example case of finding a signal's derivative. Specifically, the script finds the first (velocity) and second (acceleration) derivative of the position of a motion capture marker. 

---

## Projectile Motion

`kinematics_projectile_motion_1.m`: This script calculates position, velocity, and acceleration as continuous variables for a projectile. The projectile is launched from a given height with a given velocity and no launch angle. Air resistance and assistance are considered negligible in this code. Initial height (position_y(1)) can be changed at line 11 and horizontal velocity (velocity_x(1)) can be changed at line 15.

`kinematics_projectile_motion_2.m`: This script finds the minimum horizontal velocity needed for a projectile to travel a specified horizontal distance. The projectile is launched from a given height with no launch angle. Air resistance and assistance are considered negligible in this code. Distance to be cleared can be changed at line 8 and initial height (position_y(1)) can be changed at line 15.

`kinematics_projectile_motion_3.m`: This script finds the air time, horizontal distance covered, and peak vertical position (height) of a projectile launched with a given 2D resultant velocity and launch angle. The projectile launches and lands at the same altitude. Air resistance and assistance are considered negligible in this code. Launch angle (launch_angle) can be changed at line 8 and resultant velocity (velocity_r) can be changed at line 15.

`kinematics_projectile_motion_4.m`: This script finds the optimal launch angle for a projectile launched with a given 2D resultant velocity. The projectile launches and lands at the same altitude. Air resistance and assistance are considered negligible in this code. Resultant velocity (velocity_r) can be changed at line 18. HINT: Optimal angle should always be 45-degrees!
