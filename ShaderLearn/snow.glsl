uniform vec2 RENDERSIZE;
uniform vec2 pos;
 
float circle(vec2 pos, float size)
{
    // return length(pos) > size ? 0.0 : 1.0;

    if(length(pos) > size)
    {
        return 0.0;
    }
    else
    {
        return 0.4;
    }
}
 
void main()
{
    vec2 uv = gl_FragCoord.xy / RENDERSIZE;
   
    // gl_FragColor = vec4(0,0,0, 1.0);

//    for (int i = 0; i < 100; i++)
//    {

//    }
    vec2 newpos = vec2(uv.x - 0.1, uv.y - 0.3);
    float color = circle(newpos, 0.05);

    gl_FragColor += color;
}