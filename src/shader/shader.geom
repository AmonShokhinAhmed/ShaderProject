#version 330 core
layout (points) in;
layout (triangle_strip, max_vertices = 6) out;

out vec3 FragPos;
out vec2 TexCoords;

vec4 triangle1[3] = vec4[](    
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
        gl_Position =gl_in[0].gl_Position+triangle[i];
        FragPos = gl_Position.xyz;
        TexCoords = (triangle[i].xy+1.0)*0.5;
        EmitVertex();
    }
    EndPrimitive();
}

void main() {    
    emitTriangle(triangle1);
    emitTriangle(triangle2);
}   