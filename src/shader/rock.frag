#version 330 core
out vec4 FragColor;

in vec3 fPos;

vec2 pillars[]= vec2[](
    vec2(0.3f,0.5f),
    vec2(0.2f,0.8f),
    vec2(0.7f,0.3f)
);



//from: https://stackoverflow.com/a/28095165
const float PHI = 1.61803398874989484820459; // Φ = Golden Ratio 

float gold_noise(in vec2 xy, in float seed)
{
    return fract(tan(distance(xy*PHI, xy)*seed)*xy.x);
}


void main()
{
    float f = 0.0f;
    for(int i = 0; i<3; i++){
        f+=1/length(fPos.xz-pillars[i])-i;
    }
    f-=1/length(fPos.xz)-1;
    f-=pow(length(fPos.xz)*3,3);
    vec2 helix = vec2(3*cos(fPos.y*30),5*sin(fPos.y*10));
    f+=dot(helix,fPos.xz);

    f+=cos(fPos.y*45);
    
    f-=2*gold_noise(fPos.xz,fPos.y);
    FragColor = vec4(f,f,f, 1.0f);

    //if(distance(fPos, vec3(0.5f,0.5f,0.5f))<0.5)
    //{
    //    FragColor = vec4(1.0f,1.0f,1.0f,1.0f);
    //}else{
    //    FragColor = vec4(0.0f,0.0f,0.0f,1.0f);
    //}
}



