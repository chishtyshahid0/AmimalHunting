Shader "CameraFilterPack/FX_Glitch1" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 64128
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					varying mediump vec2 xlv_TEXCOORD0;
					varying lowp vec4 xlv_COLOR;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp vec2 tmpvar_2;
					  tmpvar_2 = _glesMultiTexCoord0.xy;
					  mediump vec2 tmpvar_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_3 = tmpvar_2;
					  tmpvar_4 = tmpvar_1;
					  xlv_TEXCOORD0 = tmpvar_3;
					  gl_Position = (glstate_matrix_mvp * _glesVertex);
					  xlv_COLOR = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform highp float _TimeX;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 sample_yuv_1;
					  highp vec4 xlat_varsample_2;
					  highp vec2 uv_nm_3;
					  highp float vt_rnd_4;
					  highp vec2 uv_5;
					  uv_5 = xlv_TEXCOORD0;
					  highp float tmpvar_6;
					  tmpvar_6 = (16.0 * fract((
					    sin(dot (((
					      floor((uv_5.yy * vec2(16.0, 16.0)))
					     / vec2(16.0, 16.0)) + (150.0 * 
					      (floor((_TimeX * 4.0)) / 4.0)
					    )), vec2(12.9898, 78.233)))
					   * 43758.55)));
					  highp float tmpvar_7;
					  tmpvar_7 = (5.0 * (floor(
					    (_TimeX * tmpvar_6)
					  ) / tmpvar_6));
					  vt_rnd_4 = ((0.5 * fract(
					    (sin(dot ((
					      floor(((uv_5.yy + tmpvar_7) * vec2(11.0, 11.0)))
					     / vec2(11.0, 11.0)), vec2(12.9898, 78.233))) * 43758.55)
					  )) + (0.5 * fract(
					    (sin(dot ((
					      floor(((uv_5.yy + tmpvar_7) * vec2(7.0, 7.0)))
					     / vec2(7.0, 7.0)), vec2(12.9898, 78.233))) * 43758.55)
					  )));
					  vt_rnd_4 = ((vt_rnd_4 * 2.0) - 1.0);
					  vt_rnd_4 = (sign(vt_rnd_4) * clamp ((
					    (abs(vt_rnd_4) - 0.6)
					   / 0.4), 0.0, 1.0));
					  highp vec2 tmpvar_8;
					  tmpvar_8.y = 0.0;
					  tmpvar_8.x = (0.1 * vt_rnd_4);
					  highp vec2 tmpvar_9;
					  tmpvar_9 = clamp ((uv_5 + tmpvar_8), vec2(0.0, 0.0), vec2(1.0, 1.0));
					  uv_nm_3 = tmpvar_9;
					  highp float tmpvar_10;
					  tmpvar_10 = fract((sin(
					    dot (vec2((floor((_TimeX * 8.0)) / 8.0)), vec2(12.9898, 78.233))
					  ) * 43758.55));
					  highp float tmpvar_11;
					  tmpvar_11 = mix (1.0, 0.975, clamp (0.4, 0.0, 1.0));
					  highp float tmpvar_12;
					  if ((tmpvar_10 > tmpvar_11)) {
					    tmpvar_12 = (1.0 - tmpvar_9.y);
					  } else {
					    tmpvar_12 = tmpvar_9.y;
					  };
					  uv_nm_3.y = tmpvar_12;
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_MainTex, uv_nm_3);
					  xlat_varsample_2 = tmpvar_13;
					  highp vec3 yuv_14;
					  yuv_14.x = dot (xlat_varsample_2.xyz, vec3(0.299, 0.587, 0.114));
					  yuv_14.y = dot (xlat_varsample_2.xyz, vec3(-0.14713, -0.28886, 0.436));
					  yuv_14.z = dot (xlat_varsample_2.xyz, vec3(0.615, -0.51499, -0.10001));
					  sample_yuv_1.x = yuv_14.x;
					  sample_yuv_1.y = (yuv_14.y / (1.0 - (
					    (3.0 * abs(vt_rnd_4))
					   * 
					    clamp ((0.5 - vt_rnd_4), 0.0, 1.0)
					  )));
					  sample_yuv_1.z = (yuv_14.z + ((0.125 * vt_rnd_4) * clamp (
					    (vt_rnd_4 - 0.5)
					  , 0.0, 1.0)));
					  highp vec3 rgb_15;
					  rgb_15.x = (yuv_14.x + (sample_yuv_1.z * 1.13983));
					  rgb_15.y = (yuv_14.x + dot (vec2(-0.39465, -0.5806), sample_yuv_1.yz));
					  rgb_15.z = (yuv_14.x + (sample_yuv_1.y * 2.03211));
					  highp vec4 tmpvar_16;
					  tmpvar_16.xyz = rgb_15;
					  tmpvar_16.w = xlat_varsample_2.w;
					  gl_FragData[0] = tmpvar_16;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					varying mediump vec2 xlv_TEXCOORD0;
					varying lowp vec4 xlv_COLOR;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp vec2 tmpvar_2;
					  tmpvar_2 = _glesMultiTexCoord0.xy;
					  mediump vec2 tmpvar_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_3 = tmpvar_2;
					  tmpvar_4 = tmpvar_1;
					  xlv_TEXCOORD0 = tmpvar_3;
					  gl_Position = (glstate_matrix_mvp * _glesVertex);
					  xlv_COLOR = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform highp float _TimeX;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 sample_yuv_1;
					  highp vec4 xlat_varsample_2;
					  highp vec2 uv_nm_3;
					  highp float vt_rnd_4;
					  highp vec2 uv_5;
					  uv_5 = xlv_TEXCOORD0;
					  highp float tmpvar_6;
					  tmpvar_6 = (16.0 * fract((
					    sin(dot (((
					      floor((uv_5.yy * vec2(16.0, 16.0)))
					     / vec2(16.0, 16.0)) + (150.0 * 
					      (floor((_TimeX * 4.0)) / 4.0)
					    )), vec2(12.9898, 78.233)))
					   * 43758.55)));
					  highp float tmpvar_7;
					  tmpvar_7 = (5.0 * (floor(
					    (_TimeX * tmpvar_6)
					  ) / tmpvar_6));
					  vt_rnd_4 = ((0.5 * fract(
					    (sin(dot ((
					      floor(((uv_5.yy + tmpvar_7) * vec2(11.0, 11.0)))
					     / vec2(11.0, 11.0)), vec2(12.9898, 78.233))) * 43758.55)
					  )) + (0.5 * fract(
					    (sin(dot ((
					      floor(((uv_5.yy + tmpvar_7) * vec2(7.0, 7.0)))
					     / vec2(7.0, 7.0)), vec2(12.9898, 78.233))) * 43758.55)
					  )));
					  vt_rnd_4 = ((vt_rnd_4 * 2.0) - 1.0);
					  vt_rnd_4 = (sign(vt_rnd_4) * clamp ((
					    (abs(vt_rnd_4) - 0.6)
					   / 0.4), 0.0, 1.0));
					  highp vec2 tmpvar_8;
					  tmpvar_8.y = 0.0;
					  tmpvar_8.x = (0.1 * vt_rnd_4);
					  highp vec2 tmpvar_9;
					  tmpvar_9 = clamp ((uv_5 + tmpvar_8), vec2(0.0, 0.0), vec2(1.0, 1.0));
					  uv_nm_3 = tmpvar_9;
					  highp float tmpvar_10;
					  tmpvar_10 = fract((sin(
					    dot (vec2((floor((_TimeX * 8.0)) / 8.0)), vec2(12.9898, 78.233))
					  ) * 43758.55));
					  highp float tmpvar_11;
					  tmpvar_11 = mix (1.0, 0.975, clamp (0.4, 0.0, 1.0));
					  highp float tmpvar_12;
					  if ((tmpvar_10 > tmpvar_11)) {
					    tmpvar_12 = (1.0 - tmpvar_9.y);
					  } else {
					    tmpvar_12 = tmpvar_9.y;
					  };
					  uv_nm_3.y = tmpvar_12;
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_MainTex, uv_nm_3);
					  xlat_varsample_2 = tmpvar_13;
					  highp vec3 yuv_14;
					  yuv_14.x = dot (xlat_varsample_2.xyz, vec3(0.299, 0.587, 0.114));
					  yuv_14.y = dot (xlat_varsample_2.xyz, vec3(-0.14713, -0.28886, 0.436));
					  yuv_14.z = dot (xlat_varsample_2.xyz, vec3(0.615, -0.51499, -0.10001));
					  sample_yuv_1.x = yuv_14.x;
					  sample_yuv_1.y = (yuv_14.y / (1.0 - (
					    (3.0 * abs(vt_rnd_4))
					   * 
					    clamp ((0.5 - vt_rnd_4), 0.0, 1.0)
					  )));
					  sample_yuv_1.z = (yuv_14.z + ((0.125 * vt_rnd_4) * clamp (
					    (vt_rnd_4 - 0.5)
					  , 0.0, 1.0)));
					  highp vec3 rgb_15;
					  rgb_15.x = (yuv_14.x + (sample_yuv_1.z * 1.13983));
					  rgb_15.y = (yuv_14.x + dot (vec2(-0.39465, -0.5806), sample_yuv_1.yz));
					  rgb_15.z = (yuv_14.x + (sample_yuv_1.y * 2.03211));
					  highp vec4 tmpvar_16;
					  tmpvar_16.xyz = rgb_15;
					  tmpvar_16.w = xlat_varsample_2.w;
					  gl_FragData[0] = tmpvar_16;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					varying mediump vec2 xlv_TEXCOORD0;
					varying lowp vec4 xlv_COLOR;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp vec2 tmpvar_2;
					  tmpvar_2 = _glesMultiTexCoord0.xy;
					  mediump vec2 tmpvar_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_3 = tmpvar_2;
					  tmpvar_4 = tmpvar_1;
					  xlv_TEXCOORD0 = tmpvar_3;
					  gl_Position = (glstate_matrix_mvp * _glesVertex);
					  xlv_COLOR = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform highp float _TimeX;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 sample_yuv_1;
					  highp vec4 xlat_varsample_2;
					  highp vec2 uv_nm_3;
					  highp float vt_rnd_4;
					  highp vec2 uv_5;
					  uv_5 = xlv_TEXCOORD0;
					  highp float tmpvar_6;
					  tmpvar_6 = (16.0 * fract((
					    sin(dot (((
					      floor((uv_5.yy * vec2(16.0, 16.0)))
					     / vec2(16.0, 16.0)) + (150.0 * 
					      (floor((_TimeX * 4.0)) / 4.0)
					    )), vec2(12.9898, 78.233)))
					   * 43758.55)));
					  highp float tmpvar_7;
					  tmpvar_7 = (5.0 * (floor(
					    (_TimeX * tmpvar_6)
					  ) / tmpvar_6));
					  vt_rnd_4 = ((0.5 * fract(
					    (sin(dot ((
					      floor(((uv_5.yy + tmpvar_7) * vec2(11.0, 11.0)))
					     / vec2(11.0, 11.0)), vec2(12.9898, 78.233))) * 43758.55)
					  )) + (0.5 * fract(
					    (sin(dot ((
					      floor(((uv_5.yy + tmpvar_7) * vec2(7.0, 7.0)))
					     / vec2(7.0, 7.0)), vec2(12.9898, 78.233))) * 43758.55)
					  )));
					  vt_rnd_4 = ((vt_rnd_4 * 2.0) - 1.0);
					  vt_rnd_4 = (sign(vt_rnd_4) * clamp ((
					    (abs(vt_rnd_4) - 0.6)
					   / 0.4), 0.0, 1.0));
					  highp vec2 tmpvar_8;
					  tmpvar_8.y = 0.0;
					  tmpvar_8.x = (0.1 * vt_rnd_4);
					  highp vec2 tmpvar_9;
					  tmpvar_9 = clamp ((uv_5 + tmpvar_8), vec2(0.0, 0.0), vec2(1.0, 1.0));
					  uv_nm_3 = tmpvar_9;
					  highp float tmpvar_10;
					  tmpvar_10 = fract((sin(
					    dot (vec2((floor((_TimeX * 8.0)) / 8.0)), vec2(12.9898, 78.233))
					  ) * 43758.55));
					  highp float tmpvar_11;
					  tmpvar_11 = mix (1.0, 0.975, clamp (0.4, 0.0, 1.0));
					  highp float tmpvar_12;
					  if ((tmpvar_10 > tmpvar_11)) {
					    tmpvar_12 = (1.0 - tmpvar_9.y);
					  } else {
					    tmpvar_12 = tmpvar_9.y;
					  };
					  uv_nm_3.y = tmpvar_12;
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_MainTex, uv_nm_3);
					  xlat_varsample_2 = tmpvar_13;
					  highp vec3 yuv_14;
					  yuv_14.x = dot (xlat_varsample_2.xyz, vec3(0.299, 0.587, 0.114));
					  yuv_14.y = dot (xlat_varsample_2.xyz, vec3(-0.14713, -0.28886, 0.436));
					  yuv_14.z = dot (xlat_varsample_2.xyz, vec3(0.615, -0.51499, -0.10001));
					  sample_yuv_1.x = yuv_14.x;
					  sample_yuv_1.y = (yuv_14.y / (1.0 - (
					    (3.0 * abs(vt_rnd_4))
					   * 
					    clamp ((0.5 - vt_rnd_4), 0.0, 1.0)
					  )));
					  sample_yuv_1.z = (yuv_14.z + ((0.125 * vt_rnd_4) * clamp (
					    (vt_rnd_4 - 0.5)
					  , 0.0, 1.0)));
					  highp vec3 rgb_15;
					  rgb_15.x = (yuv_14.x + (sample_yuv_1.z * 1.13983));
					  rgb_15.y = (yuv_14.x + dot (vec2(-0.39465, -0.5806), sample_yuv_1.yz));
					  rgb_15.z = (yuv_14.x + (sample_yuv_1.y * 2.03211));
					  highp vec4 tmpvar_16;
					  tmpvar_16.xyz = rgb_15;
					  tmpvar_16.w = xlat_varsample_2.w;
					  gl_FragData[0] = tmpvar_16;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					in highp vec4 in_POSITION0;
					in highp vec4 in_COLOR0;
					in highp vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out lowp vec4 vs_COLOR0;
					vec4 u_xlat0;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	float _TimeX;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					lowp vec4 u_xlat10_2;
					vec2 u_xlat3;
					vec2 u_xlat4;
					mediump float u_xlat16_4;
					ivec2 u_xlati4;
					float u_xlat8;
					int u_xlati8;
					float u_xlat12;
					int u_xlati12;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD0.y * 16.0;
					    u_xlat0.yz = vec2(_TimeX) * vec2(4.0, 8.0);
					    u_xlat0.xyz = floor(u_xlat0.xyz);
					    u_xlat4.xy = vec2(u_xlat0.y * float(37.5), u_xlat0.z * float(0.125));
					    u_xlat0.x = u_xlat0.x * 0.0625 + u_xlat4.x;
					    u_xlat4.x = dot(u_xlat4.yy, vec2(12.9898005, 78.2330017));
					    u_xlat4.x = sin(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x * 43758.5469;
					    u_xlat0.y = fract(u_xlat4.x);
					    u_xlat0.x = dot(u_xlat0.xx, vec2(12.9898005, 78.2330017));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43758.5469;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 16.0;
					    u_xlat8 = u_xlat0.x * _TimeX;
					    u_xlat8 = floor(u_xlat8);
					    u_xlat0.x = u_xlat8 / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * 5.0 + vs_TEXCOORD0.y;
					    u_xlat0.xz = u_xlat0.xx * vec2(11.0, 7.0);
					    u_xlat0.xz = floor(u_xlat0.xz);
					    u_xlat0.xz = u_xlat0.xz * vec2(0.0909090936, 0.142857149);
					    u_xlat0.z = dot(u_xlat0.zz, vec2(12.9898005, 78.2330017));
					    u_xlat0.x = dot(u_xlat0.xx, vec2(12.9898005, 78.2330017));
					    u_xlat0.xz = sin(u_xlat0.xz);
					    u_xlat0.xz = u_xlat0.xz * vec2(43758.5469, 43758.5469);
					    u_xlat0.xz = fract(u_xlat0.xz);
					    u_xlat8 = u_xlat0.z * 0.5;
					    u_xlat0.x = u_xlat0.x * 0.5 + u_xlat8;
					    u_xlat0.x = u_xlat0.x * 2.0 + -1.0;
					    u_xlati4.xy = ivec2(uvec2(lessThan(vec4(0.99000001, 0.0, 0.0, 0.0), u_xlat0.yxyy).xy) * 0xFFFFFFFFu);
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = u_xlat0.x<0.0; u_xlati12 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
					#else
					    u_xlati12 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
					#endif
					    u_xlat0.x = abs(u_xlat0.x) + -0.600000024;
					    u_xlat0.x = u_xlat0.x * 2.5;
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlati8 = (-u_xlati4.y) + u_xlati12;
					    u_xlat8 = float(u_xlati8);
					    u_xlat12 = (-u_xlat8) * u_xlat0.x + 0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					    u_xlat1.x = u_xlat0.x * u_xlat8;
					    u_xlat0.x = u_xlat8 * u_xlat0.x + -0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat8 = abs(u_xlat1.x) * 3.0;
					    u_xlat1.xy = u_xlat1.xx * vec2(0.100000001, 0.125);
					    u_xlat8 = (-u_xlat8) * u_xlat12 + 1.0;
					    u_xlat1.z = 0.0;
					    u_xlat2.xy = u_xlat1.xz + vs_TEXCOORD0.xy;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
					#else
					    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
					#endif
					    u_xlat12 = (-u_xlat2.y) + 1.0;
					    u_xlat2.z = (u_xlati4.x != 0) ? u_xlat12 : u_xlat2.y;
					    u_xlat10_2 = texture(_MainTex, u_xlat2.xz);
					    u_xlat16_4 = dot(u_xlat10_2.xyz, vec3(-0.147129998, -0.288859993, 0.43599999));
					    u_xlat3.x = u_xlat16_4 / u_xlat8;
					    u_xlat16_4 = dot(u_xlat10_2.xyz, vec3(0.61500001, -0.514989972, -0.10001));
					    u_xlat3.y = u_xlat1.y * u_xlat0.x + u_xlat16_4;
					    u_xlat0.x = dot(vec2(-0.394650012, -0.580600023), u_xlat3.xy);
					    u_xlat16_4 = dot(u_xlat10_2.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    SV_Target0.w = u_xlat10_2.w;
					    SV_Target0.y = u_xlat0.x + u_xlat16_4;
					    SV_Target0.xz = u_xlat3.yx * vec2(1.13982999, 2.03210998) + vec2(u_xlat16_4);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					in highp vec4 in_POSITION0;
					in highp vec4 in_COLOR0;
					in highp vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out lowp vec4 vs_COLOR0;
					vec4 u_xlat0;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	float _TimeX;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					lowp vec4 u_xlat10_2;
					vec2 u_xlat3;
					vec2 u_xlat4;
					mediump float u_xlat16_4;
					ivec2 u_xlati4;
					float u_xlat8;
					int u_xlati8;
					float u_xlat12;
					int u_xlati12;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD0.y * 16.0;
					    u_xlat0.yz = vec2(_TimeX) * vec2(4.0, 8.0);
					    u_xlat0.xyz = floor(u_xlat0.xyz);
					    u_xlat4.xy = vec2(u_xlat0.y * float(37.5), u_xlat0.z * float(0.125));
					    u_xlat0.x = u_xlat0.x * 0.0625 + u_xlat4.x;
					    u_xlat4.x = dot(u_xlat4.yy, vec2(12.9898005, 78.2330017));
					    u_xlat4.x = sin(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x * 43758.5469;
					    u_xlat0.y = fract(u_xlat4.x);
					    u_xlat0.x = dot(u_xlat0.xx, vec2(12.9898005, 78.2330017));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43758.5469;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 16.0;
					    u_xlat8 = u_xlat0.x * _TimeX;
					    u_xlat8 = floor(u_xlat8);
					    u_xlat0.x = u_xlat8 / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * 5.0 + vs_TEXCOORD0.y;
					    u_xlat0.xz = u_xlat0.xx * vec2(11.0, 7.0);
					    u_xlat0.xz = floor(u_xlat0.xz);
					    u_xlat0.xz = u_xlat0.xz * vec2(0.0909090936, 0.142857149);
					    u_xlat0.z = dot(u_xlat0.zz, vec2(12.9898005, 78.2330017));
					    u_xlat0.x = dot(u_xlat0.xx, vec2(12.9898005, 78.2330017));
					    u_xlat0.xz = sin(u_xlat0.xz);
					    u_xlat0.xz = u_xlat0.xz * vec2(43758.5469, 43758.5469);
					    u_xlat0.xz = fract(u_xlat0.xz);
					    u_xlat8 = u_xlat0.z * 0.5;
					    u_xlat0.x = u_xlat0.x * 0.5 + u_xlat8;
					    u_xlat0.x = u_xlat0.x * 2.0 + -1.0;
					    u_xlati4.xy = ivec2(uvec2(lessThan(vec4(0.99000001, 0.0, 0.0, 0.0), u_xlat0.yxyy).xy) * 0xFFFFFFFFu);
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = u_xlat0.x<0.0; u_xlati12 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
					#else
					    u_xlati12 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
					#endif
					    u_xlat0.x = abs(u_xlat0.x) + -0.600000024;
					    u_xlat0.x = u_xlat0.x * 2.5;
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlati8 = (-u_xlati4.y) + u_xlati12;
					    u_xlat8 = float(u_xlati8);
					    u_xlat12 = (-u_xlat8) * u_xlat0.x + 0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					    u_xlat1.x = u_xlat0.x * u_xlat8;
					    u_xlat0.x = u_xlat8 * u_xlat0.x + -0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat8 = abs(u_xlat1.x) * 3.0;
					    u_xlat1.xy = u_xlat1.xx * vec2(0.100000001, 0.125);
					    u_xlat8 = (-u_xlat8) * u_xlat12 + 1.0;
					    u_xlat1.z = 0.0;
					    u_xlat2.xy = u_xlat1.xz + vs_TEXCOORD0.xy;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
					#else
					    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
					#endif
					    u_xlat12 = (-u_xlat2.y) + 1.0;
					    u_xlat2.z = (u_xlati4.x != 0) ? u_xlat12 : u_xlat2.y;
					    u_xlat10_2 = texture(_MainTex, u_xlat2.xz);
					    u_xlat16_4 = dot(u_xlat10_2.xyz, vec3(-0.147129998, -0.288859993, 0.43599999));
					    u_xlat3.x = u_xlat16_4 / u_xlat8;
					    u_xlat16_4 = dot(u_xlat10_2.xyz, vec3(0.61500001, -0.514989972, -0.10001));
					    u_xlat3.y = u_xlat1.y * u_xlat0.x + u_xlat16_4;
					    u_xlat0.x = dot(vec2(-0.394650012, -0.580600023), u_xlat3.xy);
					    u_xlat16_4 = dot(u_xlat10_2.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    SV_Target0.w = u_xlat10_2.w;
					    SV_Target0.y = u_xlat0.x + u_xlat16_4;
					    SV_Target0.xz = u_xlat3.yx * vec2(1.13982999, 2.03210998) + vec2(u_xlat16_4);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					in highp vec4 in_POSITION0;
					in highp vec4 in_COLOR0;
					in highp vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out lowp vec4 vs_COLOR0;
					vec4 u_xlat0;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	float _TimeX;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					lowp vec4 u_xlat10_2;
					vec2 u_xlat3;
					vec2 u_xlat4;
					mediump float u_xlat16_4;
					ivec2 u_xlati4;
					float u_xlat8;
					int u_xlati8;
					float u_xlat12;
					int u_xlati12;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD0.y * 16.0;
					    u_xlat0.yz = vec2(_TimeX) * vec2(4.0, 8.0);
					    u_xlat0.xyz = floor(u_xlat0.xyz);
					    u_xlat4.xy = vec2(u_xlat0.y * float(37.5), u_xlat0.z * float(0.125));
					    u_xlat0.x = u_xlat0.x * 0.0625 + u_xlat4.x;
					    u_xlat4.x = dot(u_xlat4.yy, vec2(12.9898005, 78.2330017));
					    u_xlat4.x = sin(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x * 43758.5469;
					    u_xlat0.y = fract(u_xlat4.x);
					    u_xlat0.x = dot(u_xlat0.xx, vec2(12.9898005, 78.2330017));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43758.5469;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 16.0;
					    u_xlat8 = u_xlat0.x * _TimeX;
					    u_xlat8 = floor(u_xlat8);
					    u_xlat0.x = u_xlat8 / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * 5.0 + vs_TEXCOORD0.y;
					    u_xlat0.xz = u_xlat0.xx * vec2(11.0, 7.0);
					    u_xlat0.xz = floor(u_xlat0.xz);
					    u_xlat0.xz = u_xlat0.xz * vec2(0.0909090936, 0.142857149);
					    u_xlat0.z = dot(u_xlat0.zz, vec2(12.9898005, 78.2330017));
					    u_xlat0.x = dot(u_xlat0.xx, vec2(12.9898005, 78.2330017));
					    u_xlat0.xz = sin(u_xlat0.xz);
					    u_xlat0.xz = u_xlat0.xz * vec2(43758.5469, 43758.5469);
					    u_xlat0.xz = fract(u_xlat0.xz);
					    u_xlat8 = u_xlat0.z * 0.5;
					    u_xlat0.x = u_xlat0.x * 0.5 + u_xlat8;
					    u_xlat0.x = u_xlat0.x * 2.0 + -1.0;
					    u_xlati4.xy = ivec2(uvec2(lessThan(vec4(0.99000001, 0.0, 0.0, 0.0), u_xlat0.yxyy).xy) * 0xFFFFFFFFu);
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = u_xlat0.x<0.0; u_xlati12 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
					#else
					    u_xlati12 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
					#endif
					    u_xlat0.x = abs(u_xlat0.x) + -0.600000024;
					    u_xlat0.x = u_xlat0.x * 2.5;
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlati8 = (-u_xlati4.y) + u_xlati12;
					    u_xlat8 = float(u_xlati8);
					    u_xlat12 = (-u_xlat8) * u_xlat0.x + 0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					    u_xlat1.x = u_xlat0.x * u_xlat8;
					    u_xlat0.x = u_xlat8 * u_xlat0.x + -0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat8 = abs(u_xlat1.x) * 3.0;
					    u_xlat1.xy = u_xlat1.xx * vec2(0.100000001, 0.125);
					    u_xlat8 = (-u_xlat8) * u_xlat12 + 1.0;
					    u_xlat1.z = 0.0;
					    u_xlat2.xy = u_xlat1.xz + vs_TEXCOORD0.xy;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
					#else
					    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
					#endif
					    u_xlat12 = (-u_xlat2.y) + 1.0;
					    u_xlat2.z = (u_xlati4.x != 0) ? u_xlat12 : u_xlat2.y;
					    u_xlat10_2 = texture(_MainTex, u_xlat2.xz);
					    u_xlat16_4 = dot(u_xlat10_2.xyz, vec3(-0.147129998, -0.288859993, 0.43599999));
					    u_xlat3.x = u_xlat16_4 / u_xlat8;
					    u_xlat16_4 = dot(u_xlat10_2.xyz, vec3(0.61500001, -0.514989972, -0.10001));
					    u_xlat3.y = u_xlat1.y * u_xlat0.x + u_xlat16_4;
					    u_xlat0.x = dot(vec2(-0.394650012, -0.580600023), u_xlat3.xy);
					    u_xlat16_4 = dot(u_xlat10_2.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    SV_Target0.w = u_xlat10_2.w;
					    SV_Target0.y = u_xlat0.x + u_xlat16_4;
					    SV_Target0.xz = u_xlat3.yx * vec2(1.13982999, 2.03210998) + vec2(u_xlat16_4);
					    return;
					}
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!GLES3"
				}
			}
		}
	}
}