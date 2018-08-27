uniform sampler2D texture;

varying vec4 vertColor;
varying vec4 vertTexCoord;

uniform float contrast;

void main() {
    vec4 c = texture2D(texture, vertTexCoord.st) * vertColor;
    vec3 colorContrasted = c.rgb * contrast;

    gl_FragColor = vec4(colorContrasted, c.a);
}