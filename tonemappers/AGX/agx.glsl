//you can change the look! 0 is default, 1 is golden, 2 is punchy (that looks the best)
#define AGX_LOOK 2


vec3 AGX(vec3 col)
{	
	col = mat3(.842, .0423, .0424, .0784, .878, .0784, .0792, .0792, .879) * col;
	// Log2 space encoding
	col = clamp((log2(col) + 12.47393) / 16.5, vec3(0), vec3(1));
	// Apply sigmoid function approximation
	col = .5 + .5 * sin(((-3.11 * col + 6.42) * col - .378) * col - 1.44);
	// AgX look (optional)
	#if AGX_LOOK == 1
	// Golden
	col = mix(vec3(dot(col, vec3(.216,.7152,.0722))), col * vec3(1.,.9,.5), .8);
	#elif AGX_LOOK == 2
	// Punchy
	col = mix(vec3(dot(col, vec3(.216,.7152,.0722))), pow(col,vec3(1.35)), 1.4);
	#endif
	
	return col;
}