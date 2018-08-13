uniform mat4 transform;         // 在渲染循环里作为不变的输入值
uniform mat3 normalMatrix;
uniform vec3 lightNormal;

attribute vec4 position;        // 随顶点位置不同会变的输入值
attribute vec4 color;
attribute vec3 normal;

varying vec4 vertColor;         // 用来在Vertex shader和Fragment shader之间传递信息
varying vec3 vertNormal;        // 比如在Vertex shader中写入varying值  然后就可以在Fragment shader中读取和处理
varying vec3 vertLightDir;

void main()
{
    gl_Position = transform * position;
    vertColor = color;
    vertNormal = normalize(normalMatrix * normal);
    vertLightDir = -lightNormal;
}