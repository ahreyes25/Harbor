// float upwards
y = y - 0.5;

// fade out
if (image_alpha > 0)
	image_alpha -= 0.03;
	
// delete
if (image_alpha <= 0)
	instance_destroy();