#version 330 core
out vec4 FragColor;
  
in vec2 TexCoords;

uniform sampler3D screenTexture;
uniform float zIndex;
void main()
{ 
    FragColor = texture(screenTexture, vec3(TexCoords.xy,zIndex/255.0f));
}