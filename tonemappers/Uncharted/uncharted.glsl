//uncharted

//you can change the Brightness variable if you want!
vec3 Uncharted2Tonemap(vec3 x) {
	float Brightness = 0.28;
	x*= Brightness;
	float A = 0.28;
	float B = 0.29;		
	float C = 0.10;
	float D = 0.2;
	float E = 0.025;
	float F = 0.35;
	return ((x*(A*x+C*B)+D*E)/(x*(A*x+B)+D*F))-E/F;
}

vec3 unchartedTonemapping(vec3 color)
{
	vec3 curr = Uncharted2Tonemap(color*4.7);
	color = curr/Uncharted2Tonemap(vec3(15.2));	
	return color;
}