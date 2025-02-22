
//

//https://github.com/TheRealMJP/BakingLab/blob/master/BakingLab/ACES.hlsl
/*
=================================================================================================

  Baking Lab
  by MJP and David Neubelt
  http://mynameismjp.wordpress.com/

  All code licensed under the MIT license

=================================================================================================
 The code in this file was originally written by Stephen Hill (@self_shadow), who deserves all
 credit for coming up with this fit and implementing it. Buy him a beer next time you see him. :)
*/

// sRGB => XYZ => D65_2_D60 => AP1 => RRT_SAT
mat3x3 ACESInputMat = mat3x3
(
	0.59719, 0.35458, 0.04823,
	0.07600, 0.90834, 0.01566,
	0.02840, 0.13383, 0.83777
);

// ODT_SAT => XYZ => D60_2_D65 => sRGB
mat3x3 ACESOutputMat = mat3x3
(
	 1.60475, -0.53108, -0.07367,
	-0.10208,  1.10813, -0.00605,
	-0.00327, -0.07276,  1.07602
);

vec3 RRTAndODTFit(vec3 v)
{
	vec3 a = v * (v + 0.0245786f) - 0.000090537f;
	vec3 b = v * (0.983729f * v + 0.4329510f) + 0.238081f;
	return a / b;
}

vec3 ACESFitted(vec3 color)
{
	color = transpose(ACESInputMat) * color;
	// Apply RRT and ODT
	color = RRTAndODTFit(color);
	color = transpose(ACESOutputMat) * color;
	color = clamp(color, 0, 1);
	return color;
}

vec3 ACESFilmSimple(vec3 x)
{
	float a = 2.51f;
	float b = 0.03f;
	float c = 2.43f;
	float d = 0.59f;
	float e = 0.14f;
	return clamp((x*(a*x+b))/(x*(c*x+d)+e), 0, 1);

}
//


// https://advances.realtimerendering.com/s2021/jpatry_advances2021/index.html
// https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.40.9608&rep=rep1&type=pdf
vec4 rgb_to_lmsr(vec3 c)
{
	const mat4x3 m = mat4x3(
		0.31670331, 0.70299344, 0.08120592, 
		0.10129085, 0.72118661, 0.12041039, 
		0.01451538, 0.05643031, 0.53416779, 
		0.01724063, 0.60147464, 0.40056206);
	return c * m;
}
vec3 lms_to_rgb(vec3 c)
{
	const mat3 m = mat3(
		 4.57829597, -4.48749114,  0.31554848, 
		-0.63342362,  2.03236026, -0.36183302, 
		-0.05749394, -0.09275939,  1.90172089);
	return c * m;
}