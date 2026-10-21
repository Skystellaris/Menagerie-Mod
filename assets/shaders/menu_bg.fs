#if defined(VERTEX) || __VERSION__ > 100 || defined(GL_FRAGMENT_PRECISION_HIGH)
	#define MY_HIGHP_OR_MEDIUMP highp
#else
	#define MY_HIGHP_OR_MEDIUMP mediump
#endif

// Copied and edited vanilla main menu shader (Balatro's resources/shaders/splash.fs).

extern MY_HIGHP_OR_MEDIUMP number time;
extern MY_HIGHP_OR_MEDIUMP number vort_speed;
extern MY_HIGHP_OR_MEDIUMP number mid_flash;
extern MY_HIGHP_OR_MEDIUMP number vort_offset;

extern MY_HIGHP_OR_MEDIUMP vec4 colour_inside;  // inner swirl  (vanilla colour_2)
extern MY_HIGHP_OR_MEDIUMP vec4 colour_middle;  // blend band between the two
extern MY_HIGHP_OR_MEDIUMP vec4 colour_outside; // outer swirl (vanilla colour_1)

extern MY_HIGHP_OR_MEDIUMP number blend;        // 0 = vanilla flat black gap, 1 = full colour_middle
extern MY_HIGHP_OR_MEDIUMP number tertiary_dim; // middle band brightness, 1 = colour_middle as given

#define PIXEL_SIZE_FAC 700.
#define BLACK 0.6*vec4(79./255.,99./255., 103./255., 1./0.6)
#define TERTIARY_WIDTH 2. // lower = narrower colour_middle band, higher = wider
// Scale on the inner colour's falloff: <1 grows the inner (colour_inside)
// swirl, >1 shrinks it (1.0 = vanilla size)
#define INNER_SPREAD 1.78
// Where colour_middle shows up, in smoke_res terms: 0 = inside colour, 1 =
// outside colour. Fades in at TERTIARY_IN, holds until TERTIARY_OUT, then back
// to vanilla BLACK so it never leaks outside the outer ring.
#define TERTIARY_IN 0.10
#define TERTIARY_IN_K 3.3
#define TERTIARY_OUT 1.05
#define TERTIARY_OUT_K 3.0

vec4 effect( vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords )
{
    //Convert to UV coords (0-1) and floor for pixel effect
    MY_HIGHP_OR_MEDIUMP number pixel_size = length(love_ScreenSize.xy)/PIXEL_SIZE_FAC;
    MY_HIGHP_OR_MEDIUMP vec2 uv = (floor(screen_coords.xy*(1./pixel_size))*pixel_size - 0.5*love_ScreenSize.xy)/length(love_ScreenSize.xy);
    MY_HIGHP_OR_MEDIUMP number uv_len = length(uv);

    //Adding in a center swirl, changes with time
    MY_HIGHP_OR_MEDIUMP number speed = time*vort_speed;
    MY_HIGHP_OR_MEDIUMP number new_pixel_angle = atan(uv.y, uv.x) + (2.2 + 0.4*min(6.,speed))*uv_len - 1. -  speed*0.05 - min(6.,speed)*speed*0.02 + vort_offset;
    MY_HIGHP_OR_MEDIUMP vec2 mid = (love_ScreenSize.xy/length(love_ScreenSize.xy))/2.;
    MY_HIGHP_OR_MEDIUMP vec2 sv = vec2((uv_len * cos(new_pixel_angle) + mid.x), (uv_len * sin(new_pixel_angle) + mid.y)) - mid;

	//Now add the smoke effect to the swirled UV

    sv *= 30.;
    speed = time*(6.)*vort_speed + vort_offset + 1033.;
	MY_HIGHP_OR_MEDIUMP vec2 uv2 = vec2(sv.x+sv.y);

    for(int i=0; i < 5; i++) {
		uv2 += sin(max(sv.x, sv.y)) + sv;
		sv  += 0.5*vec2(cos(5.1123314 + 0.353*uv2.y + speed*0.131121),sin(uv2.x - 0.113*speed));
		sv  -= 1.0*cos(sv.x + sv.y) - 1.0*sin(sv.x*0.711 - sv.y);
	}

    //Make the smoke amount range from 0 - 2
	MY_HIGHP_OR_MEDIUMP number smoke_res =min(2., max(-2., 1.5 + length(sv)*0.12 - 0.17*(min(10.,time*1.2 - 4.))));
    if (smoke_res < 0.2) {
        smoke_res = (smoke_res - 0.2)*0.6 + 0.2;
    }

    MY_HIGHP_OR_MEDIUMP number c1p = max(0.,1. - 2.*abs(1.-smoke_res));
    MY_HIGHP_OR_MEDIUMP number c2p = min(1., max(0.,1. - 2.*(INNER_SPREAD*smoke_res)));
    MY_HIGHP_OR_MEDIUMP number cb = 1. - min(1., c1p + c2p);

    MY_HIGHP_OR_MEDIUMP number zone = clamp(TERTIARY_IN_K*(smoke_res - TERTIARY_IN), 0., 1.)
                                     * clamp(1. - TERTIARY_OUT_K*max(0., smoke_res - TERTIARY_OUT), 0., 1.);
    MY_HIGHP_OR_MEDIUMP number gap = clamp(cb*TERTIARY_WIDTH, 0., 1.);
    MY_HIGHP_OR_MEDIUMP vec3 gap_rgb = mix(BLACK.rgb, colour_middle.rgb*tertiary_dim, blend*gap*zone);

    MY_HIGHP_OR_MEDIUMP vec4 ret_col = colour_outside*c1p + colour_inside*c2p + vec4(cb*gap_rgb, cb*colour_inside.a);
    MY_HIGHP_OR_MEDIUMP number mod_flash = max(mid_flash*0.8, max(c1p, c2p)*5. - 4.4) + mid_flash*max(c1p, c2p);

    return ret_col*(1. - mod_flash) + mod_flash*vec4(1., 1., 1., 1.);
}
