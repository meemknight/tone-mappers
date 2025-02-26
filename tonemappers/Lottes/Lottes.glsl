//Lottes

//https://github.com/dmnsgn/glsl-tone-map/blob/main/lottes.glsl
// Lottes 2016, "Advanced Techniques and Optimization of HDR Color Pipelines"
vec3 lottes(vec3 x) {
  x *= vec3(0.9); //I reduced the light a little
  const vec3 a = vec3(1.6);
  const vec3 d = vec3(0.977);
  const vec3 hdrMax = vec3(8.0);
  const vec3 midIn = vec3(0.18);
  const vec3 midOut = vec3(0.267);

  const vec3 b =
	  (-pow(midIn, a) + pow(hdrMax, a) * midOut) /
	  ((pow(hdrMax, a * d) - pow(midIn, a * d)) * midOut);
  const vec3 c =
	  (pow(hdrMax, a * d) * pow(midIn, a) - pow(hdrMax, a) * pow(midIn, a * d) * midOut) /
	  ((pow(hdrMax, a * d) - pow(midIn, a * d)) * midOut);

  return pow(x, a) / (pow(x, a * d) * b + c);
}
