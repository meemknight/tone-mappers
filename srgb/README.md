# SRGB

The field of color theory is very complex, to say the least :)). I will try to briefly explain what's happening here. 
SRGB is a standard for screens and most screens, including your screen, use that, to a more or less degree of accuracy depending on how expensive it is. 
The point of doing gamma correction is to take textures that were created on screens that are SRGB convert their values to be linear, and convert them back in the end.
So when doing the gamma correction, the last step looks like this: ```finalColor = pow(finalColor, vec3(1.f/2.2));``` before displaying it on the screen.
This is actually kind of an approximation, and the real complete calculation looks like this:

```glsl
//before displaying the final color to the screen.
vec3 fromLinearToSRGB(vec3 linearRGB)
{
	bvec3 cutoff = lessThan(linearRGB, vec3(0.0031308));
	vec3 higher = vec3(1.055)*pow(linearRGB, vec3(1.0/2.4)) - vec3(0.055);
	vec3 lower = linearRGB * vec3(12.92);

	return mix(higher, lower, cutoff);
}
```

And then also, when loading textures, instead of doing: ```tColor = pow(tColor, vec3(2.2));```, we do this:

```glsl
//use this before loading textures!
vec3 toLinearSRGB(vec3 sRGB)
{
	bvec3 cutoff = lessThan(sRGB, vec3(0.04045));
	vec3 higher = pow((sRGB + vec3(0.055))/vec3(1.055), vec3(2.4));
	vec3 lower = sRGB/vec3(12.92);
	return mix(higher, lower, cutoff);
}
```

Let's look at the difference, I'm using the Uncharted tone mapper:

---
Propper SRGB gamma correction:
![image](https://github.com/user-attachments/assets/6925a4d0-f611-469a-b72b-b54fcb768356)

---
Just using the simple raising to a power:

![image](https://github.com/user-attachments/assets/2e27305b-afff-4577-9ccc-7c4d5491942c)


The difference isn't big but the colors do look a little better using the propper gamma correction function!



