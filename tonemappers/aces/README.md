# ACES EXAMPLE:

```glsl


	vec4 color = texture(u_color, v_uv); //load your color
	vec3 color.rgb = pow(color.rgb, vec3(2.2)); //gama correction!

	//do your lights calculations stuff
	
	color.rgb = ACESFitted(color.gb * u_exposure); //use the tonemaper last step and than,
	outColor = pow(color.rgb, vec3(1/2.2)); //gama correction!

```
