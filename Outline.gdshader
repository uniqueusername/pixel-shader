shader_type canvas_item;
uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

void fragment() {
    vec3 col = -8.0 * texture(screen_texture, UV).xyz;
    col += texture(screen_texture, UV + vec2(0.0, SCREEN_PIXEL_SIZE.y)).xyz;
    col += texture(screen_texture, UV + vec2(0.0, -SCREEN_PIXEL_SIZE.y)).xyz;
    col += texture(screen_texture, UV + vec2(SCREEN_PIXEL_SIZE.x, 0.0)).xyz;
    col += texture(screen_texture, UV + vec2(-SCREEN_PIXEL_SIZE.x, 0.0)).xyz;
    col += texture(screen_texture, UV + SCREEN_PIXEL_SIZE.xy).xyz;
    col += texture(screen_texture, UV - SCREEN_PIXEL_SIZE.xy).xyz;
    col += texture(screen_texture, UV + vec2(-SCREEN_PIXEL_SIZE.x, SCREEN_PIXEL_SIZE.y)).xyz;
    col += texture(screen_texture, UV + vec2(SCREEN_PIXEL_SIZE.x, -SCREEN_PIXEL_SIZE.y)).xyz;
    COLOR.xyz = col;
}