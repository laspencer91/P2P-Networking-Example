/// @description Move Towards Updated Positions

x = lerp(x, moveToX, 0.3);
y = lerp(y, moveToY, 0.3);

image_angle += median(-30, 30, (1-0.5) * angle_difference(turnTo, image_angle));
