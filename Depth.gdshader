shader_type spatial;
render_mode unshaded;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;
uniform sampler2D DEPTH_TEXTURE : hint_depth_texture, filter_linear_mipmap;

varying mat4 CAMERA;

uniform float zNear = 0.05;
uniform float zFar = 100.0;

void vertex() {
	POSITION = vec4(VERTEX, 1.0);
	CAMERA = INV_VIEW_MATRIX;
}

void fragment() {
	float depth = texture(DEPTH_TEXTURE, SCREEN_UV).x;
	vec3 ndc = vec3(SCREEN_UV * 2.0 - 1.0,  depth);

	vec4 view = INV_PROJECTION_MATRIX * vec4(ndc, 1.0);
	view.xyz /= view.w;
	float linear_depth = view.z;
	float scaled_depth = (zFar * zNear) / (zFar + ((linear_depth) * (zNear - zFar)));
	
	//vec4 world = CAMERA * INV_PROJECTION_MATRIX * vec4(ndc, 1.0);
	//vec3 world_position = world.xyz / world.w;
	ALBEDO = vec3(scaled_depth);
}