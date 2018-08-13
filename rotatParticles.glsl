float dotSize = 0.01;
float iteration = 100.0;
float xAmp = 0.3;
float yAmp = 0.1;
float speed = 0.05;
float rotateCanvas = 0.0;
float rotateParticles = 1.;
float rotateMultiplier = 10.0;
vec2 pos = vec2(0.5, 0.5);
float xFactor = 0.2;
float yFactor = 0.2;


uniform vec2 RENDERSIZE;

uniform float iGlobalTime;


vec2 rot(vec2 uv, float a)
{
    return vec2(uv.x * cos(a) - uv.y * sin(a),
                uv.y * cos(a) + uv.x * sin(a));
}


float circle(vec2 uv, float size)
{
    return length(uv) > size ? 0.0 : 1.0;
}



void main()
{
    vec2 uv = gl_FragCoord.xy / RENDERSIZE;
    uv -= vec2(pos);
    // uv.x *= RENDERSIZE.x /RENDERSIZE.y;

    vec3 color = vec3(0);

    uv =  rot(uv, rotateCanvas);



    for(float i = 0.0; i < 100.0; i++)
    {
        if(iteration < i)
        {
            break;
        }

        vec2 new_pos = vec2(cos(i * xFactor * (iGlobalTime * speed)) * xAmp,
                            sin(i * yFactor * (iGlobalTime * speed)) * yAmp);
                        
        vec2 st = uv - new_pos;

        float dots = circle((st), dotSize * (i * 0.02));
        uv = rot(uv, rotateParticles * rotateMultiplier);

        color += dots;
    }

    gl_FragColor = vec4(vec3(color), 1.0);
}