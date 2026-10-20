extern float bg_time;
extern float screen_w;
extern float screen_h;

float rand(float n) {
    return fract(sin(n * 127.1 + 19.73) * 43758.5453);
}

vec3 confetti_color(float seed) {
    float ci = rand(seed);
    if      (ci < 0.167) { return vec3(1.00, 0.22, 0.28); }
    else if (ci < 0.333) { return vec3(0.22, 0.82, 0.35); }
    else if (ci < 0.500) { return vec3(0.28, 0.52, 1.00); }
    else if (ci < 0.667) { return vec3(1.00, 0.88, 0.12); }
    else if (ci < 0.833) { return vec3(0.95, 0.32, 1.00); }
    else                 { return vec3(0.20, 0.95, 0.95); }
}

vec4 effect(vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords) {
    float t  = bg_time;
    vec2  uv = screen_coords / vec2(screen_w, screen_h);

    for (int i = 0; i < 25; i++) {
        float fi = float(i);

        float r_size  = rand(fi * 2.71 + 0.20);
        float r_fall  = rand(fi * 5.53 + 0.40);
        float r_sway  = rand(fi * 11.3 + 0.60);

        float w         = 0.006 + r_size * 0.008;
        float h         = 0.026 + fract(r_size * 13.1 + 0.57) * 0.034;
        float speed     = 0.04  + r_fall * 0.06;
        float phase     = fract(r_fall * 9.7  + 0.31);
        float sway_freq = 1.2   + r_sway * 2.2;
        float sway_amp  = 0.012 + fract(r_sway * 7.3 + 0.17) * 0.018;

        float base_pos = phase + speed * t;
        float cycle    = floor(base_pos / (1.0 + h));
        float cx       = 0.05 + fract(fi * 0.618034) * 0.90;
        float angle    = rand(fi * 19.1 + cycle * 7.33 + 0.80) * 3.14159;

        float x = cx + sin(t * sway_freq + fi * 2.3996) * sway_amp;
        float y = mod(base_pos + speed * 0.15 * sin(t * 0.6 + fi * 2.89), 1.0 + h) - h * 0.5 - 0.01;

        float ca = cos(angle);
        float sa = sin(angle);
        vec2 off = uv - vec2(x, y);
        vec2 loc = vec2(off.x * ca + off.y * sa, -off.x * sa + off.y * ca);
        if (abs(loc.x) < w * 0.5 && abs(loc.y) < h * 0.5) {
            return vec4(confetti_color(fi * 17.3 + 1.1), 1.0);
        }

        float cx2    = 0.05 + fract(fi * 0.618034 + 0.5) * 0.90;
        float angle2 = rand(fi * 19.1 + cycle * 7.33 + 51.7) * 3.14159;
        float x2  = cx2 + sin(t * sway_freq + fi * 2.3996 + 1.57) * sway_amp;
        float y2  = mod(base_pos + 0.5 + speed * 0.15 * sin(t * 0.6 + fi * 2.89 + 1.57), 1.0 + h) - h * 0.5 - 0.01;

        float ca2 = cos(angle2);
        float sa2 = sin(angle2);
        vec2 off2 = uv - vec2(x2, y2);
        vec2 loc2 = vec2(off2.x * ca2 + off2.y * sa2, -off2.x * sa2 + off2.y * ca2);
        if (abs(loc2.x) < w * 0.5 && abs(loc2.y) < h * 0.5) {
            return vec4(confetti_color(fi * 17.3 + 51.7), 1.0);
        }
    }

    return vec4(0.0, 0.0, 0.0, 0.0);
}
