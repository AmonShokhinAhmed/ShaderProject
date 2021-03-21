#version 330 core
layout (location = 0) in vec3 aPos;

//-----------
// Test
//-----------
//uniform mat4 model;
//uniform mat4 view;
//uniform mat4 projection;
//out vec2 TexCoords;
//out vec3 fColor;
//------------
//------------

void main()
{
    int id = gl_VertexID;
    int x = id/(95*255);
    int y = (id%(95*255))/255;
    int z = id%255;
    
    gl_Position = vec4(x,y,z,1.0f); 
    //-------------
    // Test
    //------------
    //fColor = vec3(1,0,0);
    //TexCoords = aPos.xy;
    //gl_Position = projection * view *  model * vec4(aPos,1.0f);
    //-------------
    //------------
}  