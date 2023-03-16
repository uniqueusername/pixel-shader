shader_type canvas_item;
uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

uniform float scale : hint_range(64, 512, 4) = 256;

void fragment() {
    vec2 uv = floor(UV * scale) / scale;
	COLOR = textureLod(screen_texture, uv, 0.0);
}