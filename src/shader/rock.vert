#version 330 core
layout (location = 0) in vec3 aPos;

out vec3 fPos;
uniform int yIndex;
void main()
{
    fPos.xz = aPos.xy;
    fPos.y=yIndex;
    gl_Position = vec4(aPos, 1.0);
}