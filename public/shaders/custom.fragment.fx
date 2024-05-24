#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {
        // Sample the color from the texture
  vec4 color = texture(image, model_uv);

  // get L
  float L = 0.299 * color.r + 0.587 * color.g + 0.114 * color.b;

  // Define duotone colors (purple and yellow)
  vec3 color1 = vec3(0.75, 0.25, 0.75); // Purple
  vec3 color2 = vec3(1.0, 0.8, 0.0);  // Yellow

  // helper to control the transition between colors (adjust as needed)
  float helper = 0.5;


    //step(helper, L)

  // Apply duotone based on luminance
  vec3 finalColor = mix(color1, color2, L);

  // Preserve alpha channel from original color
  FragColor = vec4(finalColor, color.a);
}
