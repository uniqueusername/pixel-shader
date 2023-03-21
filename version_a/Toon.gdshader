shader_type canvas_item;
uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

uniform float step_size : hint_range(0, 150, 0.5) = 24;

void fragment() {
    vec4 curr = textureLod(screen_texture, SCREEN_UV, 0.0);
	
	for (int i = 0; i < 4; i++) {
		curr[i] *= step_size;
		curr[i] = trunc(curr[i]);
		curr[i] /= step_size;
	}
	
	COLOR = curr;
}