shader_type canvas_item;

uniform vec3 color : source_color;

void fragment() {
	// Place fragment code here.
	COLOR = vec4(color, 1.0);
}
