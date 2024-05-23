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

  // assigning the luminance value to all 3 color components
  vec3 grayscale = vec3(L);

  // Set the final fragment color with alpha channel from original color
  FragColor = vec4(grayscale, color.a);
}
