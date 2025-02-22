# Tonemappers for you to USE!

##Copy paste tone mappers for you to use! Make sure you READ THE IMPORTANT THINGS!

##Youtube Video [HERE]()!

# Important things!

- I talk about how cheap or expensive these tone mappers are but they are still something very cheap, especially for modern hardware
- Make sure you do gamma correction, and also AGX has the gamma correction step already applied so if you use that one, don't do ```return pow(a, vec3(1.f/2.2));``` at the end!
- I will add more tone mappers as I find them so consider starting this repo 💪!
- I have a BONUS thing in the srgb folder, to make your game look even better!
- If you want to learn more here are some resources:

https://learnopengl.com/Advanced-Lighting/Gamma-Correction
https://learnopengl.com/Advanced-Lighting/HDR
https://blog.johnnovak.net/2016/09/21/what-every-coder-should-know-about-gamma/#a-short-quiz
https://developer.nvidia.com/gpugems/gpugems3/part-iv-image-effects/chapter-24-importance-being-linear
https://learning.oreilly.com/library/view/real-time-rendering-fourth/9781351816144/xhtml/ch05.xhtml (section 5.6)
https://thelittleengineerthatcould.blogspot.com/2017/10/srgb-versus-linear-colour-space.html
https://medium.com/@tomforsyth/the-srgb-learning-curve-773b7f68cf7a
https://bottosson.github.io/posts/colorwrong/


# Screen Shots:

## Uncharted:
I like the uncharted tonemapper the most because it is the most balanced, and it is also cheap as a bonus.

![image](https://github.com/user-attachments/assets/08230773-2fcf-4d07-9b8d-d60ce6c62b3a)

---


## ACES:
The Aces tone mapper is used in the film industry and it is very good, and it does indeed offer a filmic look. The best part about it is that it makes bright lights turn white no matter their original color.
The only downside is that it may maybe too dramatic.

![image](https://github.com/user-attachments/assets/222ad022-6c8b-4b1f-868f-e815be303cab)

---


## Zcam
Zcam is a very neutral tone mapper, and more saturated in comparison with the others. Being neutral it is good to use to apply other effects on top.
It is more expensive, and it does a binary search in the color space, but that isn't really a reason not to use it after all, it is still a small calculation done once per pixel, and as long as you don't have
crazy overdraw, it won't be a problem. To remove overdraw completely without using deferred rendering or use [a z pre pas](https://www.youtube.com/watch?v=yUUh5N2ZYHA)!

![image](https://github.com/user-attachments/assets/55048704-4feb-453e-869a-6408d75368e3)

---

## AGX
Agx aims to be similar to ACES but less dramatic so maybe more suitable for some games. It is also cheaper than ACES.


- (punchy setting)

![image](https://github.com/user-attachments/assets/24776302-1468-4239-9041-7fe61a2ce3a5)

- (default setting but I think it looks bad so I set the punchy as the default)
![image](https://github.com/user-attachments/assets/ffca46db-9a2b-4c1e-b2fe-3623a3123bb5)

- (golden setting)

![image](https://github.com/user-attachments/assets/5efb56d7-1244-49d9-9c52-19464ee3f919)






