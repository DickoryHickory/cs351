# Project 3 – Procedural WebGL Shapes

Levi Hicks && Jefferson Pinargote


For this project, we made shapes using WebGL. Instead of loading models, we generated all the geometry ourselves using shaders and math — apparently that’s called "procedural." We used `gl_VertexID` to figure out which point we were on, and drew everything using `gl.TRIANGLE_FAN` and `gl.LINE_LOOP`.

Each version of the project builds on the last one.

---

## 🔹 Version 1: [Wireframe Triangle](v1Tri.html)
We started with a triangle made out of lines using `gl.LINE_LOOP`. We only needed 3 vertices, and we used trig in the vertex shader to place them around a circle. It’s yellow. This part helped us figure out how the shaders work and how `gl_VertexID` gets used.

---

## 🔹 Version 2: [10-Sided Polygon](v2Polygon.html)
This version draws a filled 10-sided shape. We used `gl.TRIANGLE_FAN`, which needs a center point and then a bunch of points around it. We made a special case in the vertex shader for when `gl_VertexID == 0` to place the center. Then the rest loop around using angles.

---

## 🔹 Version 3: [Five-Pointed Star](v3Star.html)
Here we took the same 10-sided fan and changed it to a star by pulling every other vertex inward. We did that with a modulus check to see if a vertex was even or odd, and then set the radius smaller or larger. It looks like a star now.

---

## 🔹 Version 4: [Rotating Star](v4RotatingStar.html)
We made the star spin! This time we added a uniform called `t` and used `requestAnimationFrame()` to update it over time. Then we added `t` to the angle calculation for each point, and now the whole thing rotates smoothly. This one was pretty fun to watch.

---

## Notes
All the files are in the `Project-3/` folder. We copied the starter files from `~shreiner/public_html/CS-351/Project-3/` like the instructions said. We're still learning how all this shader stuff works, but this project helped us start to see how it all fits together.
