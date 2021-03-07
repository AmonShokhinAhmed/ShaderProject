#version 330 core
layout (points) in;
//layout (points, max_vertices = 2359296) out;
layout (points, max_vertices = 1) out;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;
uniform sampler3D screenTexture;

out vec3 fColor;


vec3 cube[]=vec3[](
    vec3(-0.5,-0.5,-0.5),
    vec3(0.5,-0.5,-0.5),
    vec3(0.5,-0.5,0.5),
    vec3(-0.5,-0.5,0.5),
    vec3(-0.5,0.5,-0.5),
    vec3(0.5,0.5,-0.5),
    vec3(0.5,0.5,0.5),
    vec3(-0.5,0.5,0.5)
);

//out vec3 FragPos;
//out vec2 TexCoords;

/*vec4 triangle1[3] = vec4[](    
    vec4(1.0,-1.0,0.0,0.0),
    vec4(-1.0,-1.0,0.0,0.0),
    vec4(-1.0,1.0,0.0,0.0)
);
vec4 triangle2[3] = vec4[](
    vec4(-1.0,1.0,0.0,0.0),
    vec4(1.0,1.0,0.0,0.0),
    vec4(1.0,-1.0,0.0,0.0)
);

void emitTriangle(vec4 triangle[3]){
    for(int i = 0; i<3; i++){
        gl_Position = projection * view * model * (gl_in[0].gl_Position+triangle[i]);
        FragPos = gl_Position.xyz;
        TexCoords = (triangle[i].xy+1.0)*0.5;
        EmitVertex();
    }
    EndPrimitive();
}*/

float sampleDensity(vec3 point){
    point.x/=95;
    point.y/=95;
    point.z/=255;
    return texture(screenTexture, point).r;
}
void main() {    
    //emitTriangle(triangle1);
    //emitTriangle(triangle2);
    
    
    float density = sampleDensity(gl_in[0].gl_Position.xyz);
    gl_Position = projection * view * model * gl_in[0].gl_Position;
    fColor = vec3(density);
    if(density>0.75){
        EmitVertex();
        EndPrimitive();
    }
}