#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;
uniform float timeHelper;

// Output
out vec4 FragColor;

void main() {

    //scale and translate the texture coordinate such that it is in the range [-1.0, 1.0]
    vec2 newUV = vec2((model_uv * 2.0) - 1.0);

    //calculate radius = magnitude of texture coordinate
    float rad = length(newUV);

    //calculate a texture coordinate offset = texture_coordinate * (sin(radius * 30.0 - time * 5.0) + 0.5) / 60.0
    vec2 textCoordOff = newUV * (sin(rad * 30.0 - timeHelper * 5.0) + 0.5) / 60.0;

    //calculate final texture coordinate = original_texture_coordinate + texture_coordinate_offset

    vec2 finalTextCoord = model_uv + textCoordOff;


    // Color
    FragColor = texture(image, finalTextCoord);
}
