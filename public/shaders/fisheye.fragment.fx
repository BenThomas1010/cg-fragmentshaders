#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {
    // Color

    //scale and translate the texture coordinate such that it is in the range [-1.0, 1.0]
    vec2 newUV = vec2((model_uv * 2.0) - 1.0);

    //calculate 𝜽 = arctan(texture_coordinate_y, texture_coordinate_x)
    float theda = atan(newUV.y, newUV.x);

    //calculate radius = magnitude of texture coordinate, raised to the power of 1.5
    float rad = pow(length(newUV), 1.5);

    newUV = vec2(rad * cos(theda),  rad * sin(theda));
    vec2 newnewUV = vec2((newUV + 1.0) * 0.5);

    FragColor = texture(image, newnewUV);
 
}
