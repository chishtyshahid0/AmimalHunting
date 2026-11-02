Shader "CameraFilterPack/TV_Artefact" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Colorisation ("_Colorisation", Range(1, 10)) = 1
		_Parasite ("_Parasite", Range(1, 10)) = 1
		_Noise ("_Noise", Range(1, 10)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 27528
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
					uniform highp float _Colorisation;
					uniform highp float _Parasite;
					uniform highp float _Noise;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 col3_1;
					  highp vec4 col2_2;
					  highp vec4 col1_3;
					  highp vec2 uv_4;
					  uv_4 = xlv_TEXCOORD0;
					  highp float tmpvar_5;
					  highp float tmpvar_6;
					  tmpvar_6 = (_TimeX * 12.0);
					  tmpvar_5 = fract((sin(
					    dot ((uv_4 * floor(tmpvar_6)), vec2(127.1, 311.7))
					  ) * 43758.55));
					  highp vec3 tmpvar_7;
					  tmpvar_7.x = tmpvar_5;
					  tmpvar_7.y = (1.0 - (tmpvar_5 * _Colorisation));
					  tmpvar_7.z = ((tmpvar_5 / 2.0) + 0.5);
					  highp float tmpvar_8;
					  tmpvar_8 = (((
					    pow (fract((sin(
					      dot ((floor((uv_4 * vec2(24.0, 9.0))) * floor(tmpvar_6)), vec2(127.1, 311.7))
					    ) * 43758.55)), 8.0)
					   * _Parasite) * pow (
					    fract((sin(dot (
					      (floor((uv_4 * vec2(8.0, 4.0))) * floor(tmpvar_6))
					    , vec2(127.1, 311.7))) * 43758.55))
					  , 3.0)) - (pow (
					    fract((sin(dot (
					      (vec2(7.2341, 1.0) * floor(tmpvar_6))
					    , vec2(127.1, 311.7))) * 43758.55))
					  , 17.0) * 2.0));
					  lowp vec4 tmpvar_9;
					  tmpvar_9 = texture2D (_MainTex, uv_4);
					  col1_3 = tmpvar_9;
					  highp vec2 tmpvar_10;
					  tmpvar_10.y = 0.0;
					  tmpvar_10.x = ((tmpvar_8 * 0.05) * fract((
					    sin(dot ((vec2(5.0, 1.0) * floor(tmpvar_6)), vec2(127.1, 311.7)))
					   * 43758.55)));
					  lowp vec4 tmpvar_11;
					  highp vec2 P_12;
					  P_12 = (uv_4 + tmpvar_10);
					  tmpvar_11 = texture2D (_MainTex, P_12);
					  col2_2 = tmpvar_11;
					  highp vec2 tmpvar_13;
					  tmpvar_13.y = 0.0;
					  tmpvar_13.x = ((tmpvar_8 * 0.05) * fract((
					    sin(dot ((vec2(31.0, 1.0) * floor(tmpvar_6)), vec2(127.1, 311.7)))
					   * 43758.55)));
					  lowp vec4 tmpvar_14;
					  highp vec2 P_15;
					  P_15 = (uv_4 - tmpvar_13);
					  tmpvar_14 = texture2D (_MainTex, P_15);
					  col3_1 = tmpvar_14;
					  highp vec3 tmpvar_16;
					  tmpvar_16.x = col1_3.x;
					  tmpvar_16.y = col2_2.y;
					  tmpvar_16.z = col3_1.z;
					  highp vec4 tmpvar_17;
					  tmpvar_17.w = 0.2;
					  tmpvar_17.xyz = (tmpvar_16 + ((
					    (tmpvar_7 * _Noise)
					   - 2.0) * 0.08));
					  gl_FragData[0] = tmpvar_17;
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
					uniform highp float _Colorisation;
					uniform highp float _Parasite;
					uniform highp float _Noise;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 col3_1;
					  highp vec4 col2_2;
					  highp vec4 col1_3;
					  highp vec2 uv_4;
					  uv_4 = xlv_TEXCOORD0;
					  highp float tmpvar_5;
					  highp float tmpvar_6;
					  tmpvar_6 = (_TimeX * 12.0);
					  tmpvar_5 = fract((sin(
					    dot ((uv_4 * floor(tmpvar_6)), vec2(127.1, 311.7))
					  ) * 43758.55));
					  highp vec3 tmpvar_7;
					  tmpvar_7.x = tmpvar_5;
					  tmpvar_7.y = (1.0 - (tmpvar_5 * _Colorisation));
					  tmpvar_7.z = ((tmpvar_5 / 2.0) + 0.5);
					  highp float tmpvar_8;
					  tmpvar_8 = (((
					    pow (fract((sin(
					      dot ((floor((uv_4 * vec2(24.0, 9.0))) * floor(tmpvar_6)), vec2(127.1, 311.7))
					    ) * 43758.55)), 8.0)
					   * _Parasite) * pow (
					    fract((sin(dot (
					      (floor((uv_4 * vec2(8.0, 4.0))) * floor(tmpvar_6))
					    , vec2(127.1, 311.7))) * 43758.55))
					  , 3.0)) - (pow (
					    fract((sin(dot (
					      (vec2(7.2341, 1.0) * floor(tmpvar_6))
					    , vec2(127.1, 311.7))) * 43758.55))
					  , 17.0) * 2.0));
					  lowp vec4 tmpvar_9;
					  tmpvar_9 = texture2D (_MainTex, uv_4);
					  col1_3 = tmpvar_9;
					  highp vec2 tmpvar_10;
					  tmpvar_10.y = 0.0;
					  tmpvar_10.x = ((tmpvar_8 * 0.05) * fract((
					    sin(dot ((vec2(5.0, 1.0) * floor(tmpvar_6)), vec2(127.1, 311.7)))
					   * 43758.55)));
					  lowp vec4 tmpvar_11;
					  highp vec2 P_12;
					  P_12 = (uv_4 + tmpvar_10);
					  tmpvar_11 = texture2D (_MainTex, P_12);
					  col2_2 = tmpvar_11;
					  highp vec2 tmpvar_13;
					  tmpvar_13.y = 0.0;
					  tmpvar_13.x = ((tmpvar_8 * 0.05) * fract((
					    sin(dot ((vec2(31.0, 1.0) * floor(tmpvar_6)), vec2(127.1, 311.7)))
					   * 43758.55)));
					  lowp vec4 tmpvar_14;
					  highp vec2 P_15;
					  P_15 = (uv_4 - tmpvar_13);
					  tmpvar_14 = texture2D (_MainTex, P_15);
					  col3_1 = tmpvar_14;
					  highp vec3 tmpvar_16;
					  tmpvar_16.x = col1_3.x;
					  tmpvar_16.y = col2_2.y;
					  tmpvar_16.z = col3_1.z;
					  highp vec4 tmpvar_17;
					  tmpvar_17.w = 0.2;
					  tmpvar_17.xyz = (tmpvar_16 + ((
					    (tmpvar_7 * _Noise)
					   - 2.0) * 0.08));
					  gl_FragData[0] = tmpvar_17;
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
					uniform highp float _Colorisation;
					uniform highp float _Parasite;
					uniform highp float _Noise;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 col3_1;
					  highp vec4 col2_2;
					  highp vec4 col1_3;
					  highp vec2 uv_4;
					  uv_4 = xlv_TEXCOORD0;
					  highp float tmpvar_5;
					  highp float tmpvar_6;
					  tmpvar_6 = (_TimeX * 12.0);
					  tmpvar_5 = fract((sin(
					    dot ((uv_4 * floor(tmpvar_6)), vec2(127.1, 311.7))
					  ) * 43758.55));
					  highp vec3 tmpvar_7;
					  tmpvar_7.x = tmpvar_5;
					  tmpvar_7.y = (1.0 - (tmpvar_5 * _Colorisation));
					  tmpvar_7.z = ((tmpvar_5 / 2.0) + 0.5);
					  highp float tmpvar_8;
					  tmpvar_8 = (((
					    pow (fract((sin(
					      dot ((floor((uv_4 * vec2(24.0, 9.0))) * floor(tmpvar_6)), vec2(127.1, 311.7))
					    ) * 43758.55)), 8.0)
					   * _Parasite) * pow (
					    fract((sin(dot (
					      (floor((uv_4 * vec2(8.0, 4.0))) * floor(tmpvar_6))
					    , vec2(127.1, 311.7))) * 43758.55))
					  , 3.0)) - (pow (
					    fract((sin(dot (
					      (vec2(7.2341, 1.0) * floor(tmpvar_6))
					    , vec2(127.1, 311.7))) * 43758.55))
					  , 17.0) * 2.0));
					  lowp vec4 tmpvar_9;
					  tmpvar_9 = texture2D (_MainTex, uv_4);
					  col1_3 = tmpvar_9;
					  highp vec2 tmpvar_10;
					  tmpvar_10.y = 0.0;
					  tmpvar_10.x = ((tmpvar_8 * 0.05) * fract((
					    sin(dot ((vec2(5.0, 1.0) * floor(tmpvar_6)), vec2(127.1, 311.7)))
					   * 43758.55)));
					  lowp vec4 tmpvar_11;
					  highp vec2 P_12;
					  P_12 = (uv_4 + tmpvar_10);
					  tmpvar_11 = texture2D (_MainTex, P_12);
					  col2_2 = tmpvar_11;
					  highp vec2 tmpvar_13;
					  tmpvar_13.y = 0.0;
					  tmpvar_13.x = ((tmpvar_8 * 0.05) * fract((
					    sin(dot ((vec2(31.0, 1.0) * floor(tmpvar_6)), vec2(127.1, 311.7)))
					   * 43758.55)));
					  lowp vec4 tmpvar_14;
					  highp vec2 P_15;
					  P_15 = (uv_4 - tmpvar_13);
					  tmpvar_14 = texture2D (_MainTex, P_15);
					  col3_1 = tmpvar_14;
					  highp vec3 tmpvar_16;
					  tmpvar_16.x = col1_3.x;
					  tmpvar_16.y = col2_2.y;
					  tmpvar_16.z = col3_1.z;
					  highp vec4 tmpvar_17;
					  tmpvar_17.w = 0.2;
					  tmpvar_17.xyz = (tmpvar_16 + ((
					    (tmpvar_7 * _Noise)
					   - 2.0) * 0.08));
					  gl_FragData[0] = tmpvar_17;
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
					uniform 	float _Colorisation;
					uniform 	float _Parasite;
					uniform 	float _Noise;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec2 u_xlat6;
					void main()
					{
					    u_xlat0 = vs_TEXCOORD0.xyxy * vec4(24.0, 9.0, 8.0, 4.0);
					    u_xlat0 = floor(u_xlat0);
					    u_xlat1.x = _TimeX * 12.0;
					    u_xlat1.x = floor(u_xlat1.x);
					    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
					    u_xlat0.x = dot(u_xlat0.xy, vec2(127.099998, 311.700012));
					    u_xlat0.y = dot(u_xlat0.zw, vec2(127.099998, 311.700012));
					    u_xlat0.xy = sin(u_xlat0.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(43758.5469, 43758.5469);
					    u_xlat0.xy = fract(u_xlat0.xy);
					    u_xlat0.xz = u_xlat0.xy * u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xz * u_xlat0.xy;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _Parasite;
					    u_xlat2 = u_xlat1.xxxx * vec4(7.23409986, 1.0, 5.0, 1.0);
					    u_xlat6.x = dot(u_xlat2.xy, vec2(127.099998, 311.700012));
					    u_xlat6.y = dot(u_xlat2.zw, vec2(127.099998, 311.700012));
					    u_xlat6.xy = sin(u_xlat6.xy);
					    u_xlat6.xy = u_xlat6.xy * vec2(43758.5469, 43758.5469);
					    u_xlat3.yz = fract(u_xlat6.xy);
					    u_xlat6.x = log2(u_xlat3.y);
					    u_xlat6.x = u_xlat6.x * 17.0;
					    u_xlat6.x = exp2(u_xlat6.x);
					    u_xlat6.x = u_xlat6.x + u_xlat6.x;
					    u_xlat0.x = u_xlat0.x * u_xlat0.y + (-u_xlat6.x);
					    u_xlat3.xy = u_xlat1.xx * vec2(31.0, 1.0);
					    u_xlat1.xy = u_xlat1.xx * vs_TEXCOORD0.xy;
					    u_xlat1.x = dot(u_xlat1.xy, vec2(127.099998, 311.700012));
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat3.x = dot(u_xlat3.xy, vec2(127.099998, 311.700012));
					    u_xlat0.y = sin(u_xlat3.x);
					    u_xlat0.xy = u_xlat0.xy * vec2(0.0500000007, 43758.5469);
					    u_xlat3.x = fract(u_xlat0.y);
					    u_xlat2.xz = u_xlat3.zx * u_xlat0.xx;
					    u_xlat2.y = float(0.0);
					    u_xlat2.w = float(0.0);
					    u_xlat0.xy = vec2((-u_xlat2.z) + vs_TEXCOORD0.x, (-u_xlat2.w) + vs_TEXCOORD0.y);
					    u_xlat6.xy = u_xlat2.xy + vs_TEXCOORD0.xy;
					    u_xlat2.y = texture(_MainTex, u_xlat6.xy).y;
					    u_xlat2.z = texture(_MainTex, u_xlat0.xy).z;
					    u_xlat2.x = texture(_MainTex, vs_TEXCOORD0.xy).x;
					    u_xlat1.y = (-u_xlat1.x) * _Colorisation + 1.0;
					    u_xlat1.z = u_xlat1.x * 0.5 + 0.5;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(vec3(_Noise, _Noise, _Noise)) + vec3(-2.0, -2.0, -2.0);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(0.0799999982, 0.0799999982, 0.0799999982) + u_xlat2.xyz;
					    SV_Target0.w = 0.200000003;
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
					uniform 	float _Colorisation;
					uniform 	float _Parasite;
					uniform 	float _Noise;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec2 u_xlat6;
					void main()
					{
					    u_xlat0 = vs_TEXCOORD0.xyxy * vec4(24.0, 9.0, 8.0, 4.0);
					    u_xlat0 = floor(u_xlat0);
					    u_xlat1.x = _TimeX * 12.0;
					    u_xlat1.x = floor(u_xlat1.x);
					    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
					    u_xlat0.x = dot(u_xlat0.xy, vec2(127.099998, 311.700012));
					    u_xlat0.y = dot(u_xlat0.zw, vec2(127.099998, 311.700012));
					    u_xlat0.xy = sin(u_xlat0.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(43758.5469, 43758.5469);
					    u_xlat0.xy = fract(u_xlat0.xy);
					    u_xlat0.xz = u_xlat0.xy * u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xz * u_xlat0.xy;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _Parasite;
					    u_xlat2 = u_xlat1.xxxx * vec4(7.23409986, 1.0, 5.0, 1.0);
					    u_xlat6.x = dot(u_xlat2.xy, vec2(127.099998, 311.700012));
					    u_xlat6.y = dot(u_xlat2.zw, vec2(127.099998, 311.700012));
					    u_xlat6.xy = sin(u_xlat6.xy);
					    u_xlat6.xy = u_xlat6.xy * vec2(43758.5469, 43758.5469);
					    u_xlat3.yz = fract(u_xlat6.xy);
					    u_xlat6.x = log2(u_xlat3.y);
					    u_xlat6.x = u_xlat6.x * 17.0;
					    u_xlat6.x = exp2(u_xlat6.x);
					    u_xlat6.x = u_xlat6.x + u_xlat6.x;
					    u_xlat0.x = u_xlat0.x * u_xlat0.y + (-u_xlat6.x);
					    u_xlat3.xy = u_xlat1.xx * vec2(31.0, 1.0);
					    u_xlat1.xy = u_xlat1.xx * vs_TEXCOORD0.xy;
					    u_xlat1.x = dot(u_xlat1.xy, vec2(127.099998, 311.700012));
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat3.x = dot(u_xlat3.xy, vec2(127.099998, 311.700012));
					    u_xlat0.y = sin(u_xlat3.x);
					    u_xlat0.xy = u_xlat0.xy * vec2(0.0500000007, 43758.5469);
					    u_xlat3.x = fract(u_xlat0.y);
					    u_xlat2.xz = u_xlat3.zx * u_xlat0.xx;
					    u_xlat2.y = float(0.0);
					    u_xlat2.w = float(0.0);
					    u_xlat0.xy = vec2((-u_xlat2.z) + vs_TEXCOORD0.x, (-u_xlat2.w) + vs_TEXCOORD0.y);
					    u_xlat6.xy = u_xlat2.xy + vs_TEXCOORD0.xy;
					    u_xlat2.y = texture(_MainTex, u_xlat6.xy).y;
					    u_xlat2.z = texture(_MainTex, u_xlat0.xy).z;
					    u_xlat2.x = texture(_MainTex, vs_TEXCOORD0.xy).x;
					    u_xlat1.y = (-u_xlat1.x) * _Colorisation + 1.0;
					    u_xlat1.z = u_xlat1.x * 0.5 + 0.5;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(vec3(_Noise, _Noise, _Noise)) + vec3(-2.0, -2.0, -2.0);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(0.0799999982, 0.0799999982, 0.0799999982) + u_xlat2.xyz;
					    SV_Target0.w = 0.200000003;
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
					uniform 	float _Colorisation;
					uniform 	float _Parasite;
					uniform 	float _Noise;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec2 u_xlat6;
					void main()
					{
					    u_xlat0 = vs_TEXCOORD0.xyxy * vec4(24.0, 9.0, 8.0, 4.0);
					    u_xlat0 = floor(u_xlat0);
					    u_xlat1.x = _TimeX * 12.0;
					    u_xlat1.x = floor(u_xlat1.x);
					    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
					    u_xlat0.x = dot(u_xlat0.xy, vec2(127.099998, 311.700012));
					    u_xlat0.y = dot(u_xlat0.zw, vec2(127.099998, 311.700012));
					    u_xlat0.xy = sin(u_xlat0.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(43758.5469, 43758.5469);
					    u_xlat0.xy = fract(u_xlat0.xy);
					    u_xlat0.xz = u_xlat0.xy * u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xz * u_xlat0.xy;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _Parasite;
					    u_xlat2 = u_xlat1.xxxx * vec4(7.23409986, 1.0, 5.0, 1.0);
					    u_xlat6.x = dot(u_xlat2.xy, vec2(127.099998, 311.700012));
					    u_xlat6.y = dot(u_xlat2.zw, vec2(127.099998, 311.700012));
					    u_xlat6.xy = sin(u_xlat6.xy);
					    u_xlat6.xy = u_xlat6.xy * vec2(43758.5469, 43758.5469);
					    u_xlat3.yz = fract(u_xlat6.xy);
					    u_xlat6.x = log2(u_xlat3.y);
					    u_xlat6.x = u_xlat6.x * 17.0;
					    u_xlat6.x = exp2(u_xlat6.x);
					    u_xlat6.x = u_xlat6.x + u_xlat6.x;
					    u_xlat0.x = u_xlat0.x * u_xlat0.y + (-u_xlat6.x);
					    u_xlat3.xy = u_xlat1.xx * vec2(31.0, 1.0);
					    u_xlat1.xy = u_xlat1.xx * vs_TEXCOORD0.xy;
					    u_xlat1.x = dot(u_xlat1.xy, vec2(127.099998, 311.700012));
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat3.x = dot(u_xlat3.xy, vec2(127.099998, 311.700012));
					    u_xlat0.y = sin(u_xlat3.x);
					    u_xlat0.xy = u_xlat0.xy * vec2(0.0500000007, 43758.5469);
					    u_xlat3.x = fract(u_xlat0.y);
					    u_xlat2.xz = u_xlat3.zx * u_xlat0.xx;
					    u_xlat2.y = float(0.0);
					    u_xlat2.w = float(0.0);
					    u_xlat0.xy = vec2((-u_xlat2.z) + vs_TEXCOORD0.x, (-u_xlat2.w) + vs_TEXCOORD0.y);
					    u_xlat6.xy = u_xlat2.xy + vs_TEXCOORD0.xy;
					    u_xlat2.y = texture(_MainTex, u_xlat6.xy).y;
					    u_xlat2.z = texture(_MainTex, u_xlat0.xy).z;
					    u_xlat2.x = texture(_MainTex, vs_TEXCOORD0.xy).x;
					    u_xlat1.y = (-u_xlat1.x) * _Colorisation + 1.0;
					    u_xlat1.z = u_xlat1.x * 0.5 + 0.5;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(vec3(_Noise, _Noise, _Noise)) + vec3(-2.0, -2.0, -2.0);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(0.0799999982, 0.0799999982, 0.0799999982) + u_xlat2.xyz;
					    SV_Target0.w = 0.200000003;
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