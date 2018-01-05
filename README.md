# GenerativeEmissiveExample
![Alt Text](https://github.com/BenVanCitters/GenerativeEmissiveExample/blob/master/screengrab.png "")  
Playing with generative, emissive materials in Unity3d  
This example has a shader/material/texture combo that allows for generative, animated emissive textures.  The core idea being that you want to use a typical off-the-shelf material in Unity 2017.2.03 but there is a shader-animated texture in one of the channels (in this case the emissive texture).  
The shader uses sinusoidal math to create periodic flowing animations based on a ton of parameters (think amplitude, frequency, offset, etc.).
