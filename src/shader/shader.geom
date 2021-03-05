#version 330 core
layout (points) in;
layout (triangle_strip, max_vertices = 6) out;

out vec3 fColor;
out vec3 fPos;

void main() {    
    fColor = vec3(1.0f,0.0f,0.0f);

    gl_Position =gl_in[0].gl_Position+vec4(0.5,-0.5,0.0,0.0);
    fPos = gl_Position.xyz;
    EmitVertex();
    gl_Position =gl_in[0].gl_Position+vec4(-0.5,-0.5,0.0,0.0);
    fPos = gl_Position.xyz;
    EmitVertex();
    gl_Position =gl_in[0].gl_Position+vec4(-0.5,0.5,0.0,0.0);
    fPos = gl_Position.xyz;
    EmitVertex();
    
    EndPrimitive();

    gl_Position =gl_in[0].gl_Position+vec4(-0.5,0.5,0.0,0.0);
    fPos = gl_Position.xyz;
    EmitVertex();
    gl_Position =gl_in[0].gl_Position+vec4(0.5,0.5,0.0,0.0);
    fPos = gl_Position.xyz;
    EmitVertex();
    gl_Position =gl_in[0].gl_Position+vec4(0.5,-0.5,0.0,0.0);
    fPos = gl_Position.xyz;
    EmitVertex();
    EndPrimitive();
}   