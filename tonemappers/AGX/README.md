# AGX EXAMPLE:

//AGX DOES THE LAST STEP OF GAMA CORRECTION FOR YOU!

```glsl


	vec4 color = texture(u_color, v_uv); //load your color
	vec3 color.rgb = pow(color.rgb, vec3(2.2)); //gama correction!

	//do your lights calculations stuff
	
	color.rgb = AGX(color.gb * u_exposure); //use the tonemaper last step and than,
	outColor = color.rgb; //no gama correction step here because AXG does it for you!

```
