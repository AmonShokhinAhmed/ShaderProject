#version 330 core

layout (location = 0) in vec3 aPos;

void main()
{
    int id = gl_VertexID;
    int x = id/(95*255);
    int y = (id%(95*255))/255;
    int z = id%255;
    
    gl_Position = vec4(x,y,z,1.0f); 
}  