#version 330 core
out vec4 FragColor;
  
//in vec2 TexCoords;
in vec3 fColor;
//uniform float zIndex;

void main()
{ 
    FragColor = vec4(fColor,1.0);
}