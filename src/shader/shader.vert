#version 330 core
layout (location = 0) in vec3 aPos;

out vec2 TexCoords;

void main()
{
    int id = gl_VertexID;
    int x = id/(96*256);
    int y = (id%(96*256))/256;
    int z = id%256;

    gl_Position = vec4(x,y,z,1.0); 
}  