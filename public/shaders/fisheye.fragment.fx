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

    vec2 newUV = vec2((model_uv * 2.0) - 1.0);
    float theda = atan(newUV.y, newUV.x);
    float rad = (length(newUV), 1.5);
    newUV = vec2(rad * cos(theda),  rad * sin(theda));
    vec2 newnewUV = vec2((newUV + 1.0) * 0.5);

    FragColor = texture(image, newnewUV);
 
}
