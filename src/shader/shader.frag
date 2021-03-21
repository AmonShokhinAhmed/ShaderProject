#version 330 core
out vec4 FragColor;
  
in vec3 fColor;

//------------
// Test
//------------
//in vec2 TexCoords;
//uniform float zIndex;
//uniform sampler3D screenTexture;
//------------
//------------

void main()
{ 
    FragColor = vec4(fColor,1.0);
    //------------
    // Test
    //------------
    //FragColor = texture(screenTexture, vec3(TexCoords,zIndex));
    //------------
    //------------
}