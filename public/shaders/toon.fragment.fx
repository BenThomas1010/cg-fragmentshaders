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

  // Set the final fragment color with alpha channel from original color
  FragColor = vec4(round(color.r * 4.0)/4.0, round(color.g * 4.0)/4.0, round(color.b * 4.0)/4.0, color.a);
}
