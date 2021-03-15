#version 330 core
out vec4 FragColor;

in vec3 fPos;

vec2 pillars[3]= vec2[](
    vec2(0.1f,0.1f),
    vec2(-0.7f,0.1f),
    vec2(0.50f,-0.30f)
);
void main()
{
    float f = 0.0f;
    //first pillar
    for(int i = 0; i<3; i++){
        f+=1/length(fPos.xz-pillars[i])-1;
    }
    f-=1/length(fPos.xz)-1;
    f=f-length(fPos.xz)*3;
    vec2 helix = vec2(cos(fPos.y),sin(fPos.y));
    f+=dot(helix,fPos.xz);

    f+=cos(fPos.y);

    FragColor = vec4(f,f,f, 1.0f);
}