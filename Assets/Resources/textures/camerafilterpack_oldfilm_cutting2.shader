Shader "CameraFilterPack/OldFilm_Cutting2" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_MainTex2 ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 41484
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
					uniform sampler2D _MainTex2;
					uniform highp float _TimeX;
					uniform highp float _Speed;
					uniform highp float _Value;
					uniform highp float _Value2;
					uniform highp float _Value3;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  highp vec3 oldfilm_2;
					  highp vec3 col_3;
					  highp vec2 uv_4;
					  uv_4 = xlv_TEXCOORD0;
					  highp float tmpvar_5;
					  tmpvar_5 = float(int((_TimeX * 15.0)));
					  highp vec2 tmpvar_6;
					  tmpvar_6.x = (fract((
					    sin(dot (vec2(tmpvar_5), vec2(12.9898, 78.233)))
					   * 43758.55)) * -2.0);
					  tmpvar_6.y = fract((sin(
					    dot (vec2((tmpvar_5 + 23.0)), vec2(12.9898, 78.233))
					  ) * 43758.55));
					  highp vec2 tmpvar_7;
					  tmpvar_7 = (uv_4 + (0.004 * tmpvar_6));
					  lowp vec3 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, tmpvar_7).xyz;
					  col_3 = tmpvar_8;
					  highp vec2 tmpvar_9;
					  tmpvar_9.x = fract((sin(
					    dot (vec2(tmpvar_5), vec2(12.9898, 78.233))
					  ) * 43758.55));
					  tmpvar_9.y = fract((sin(
					    dot (vec2((tmpvar_5 + 23.0)), vec2(12.9898, 78.233))
					  ) * 43758.55));
					  uv_4.y = (uv_4 + (0.01 * tmpvar_9)).y;
					  uv_4.x = (uv_4.x + (_TimeX * _Speed));
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex2, uv_4).xyz;
					  oldfilm_2 = tmpvar_10;
					  uv_4 = xlv_TEXCOORD0;
					  col_3 = (mix (col_3, (1.0 - col_3), vec3(_Value3)) * (pow (
					    ((((16.0 * uv_4.x) * (1.0 - uv_4.x)) * uv_4.y) * (1.0 - uv_4.y))
					  , 0.4) + _Value2));
					  highp vec3 tmpvar_11;
					  tmpvar_11 = (((2.0 * oldfilm_2) + vec3(dot (vec3(0.2126, 0.7152, 0.0722), col_3))) - _Value);
					  col_3 = tmpvar_11;
					  highp vec4 tmpvar_12;
					  tmpvar_12.w = 1.0;
					  tmpvar_12.xyz = tmpvar_11;
					  tmpvar_1 = tmpvar_12;
					  gl_FragData[0] = tmpvar_1;
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
					uniform sampler2D _MainTex2;
					uniform highp float _TimeX;
					uniform highp float _Speed;
					uniform highp float _Value;
					uniform highp float _Value2;
					uniform highp float _Value3;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  highp vec3 oldfilm_2;
					  highp vec3 col_3;
					  highp vec2 uv_4;
					  uv_4 = xlv_TEXCOORD0;
					  highp float tmpvar_5;
					  tmpvar_5 = float(int((_TimeX * 15.0)));
					  highp vec2 tmpvar_6;
					  tmpvar_6.x = (fract((
					    sin(dot (vec2(tmpvar_5), vec2(12.9898, 78.233)))
					   * 43758.55)) * -2.0);
					  tmpvar_6.y = fract((sin(
					    dot (vec2((tmpvar_5 + 23.0)), vec2(12.9898, 78.233))
					  ) * 43758.55));
					  highp vec2 tmpvar_7;
					  tmpvar_7 = (uv_4 + (0.004 * tmpvar_6));
					  lowp vec3 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, tmpvar_7).xyz;
					  col_3 = tmpvar_8;
					  highp vec2 tmpvar_9;
					  tmpvar_9.x = fract((sin(
					    dot (vec2(tmpvar_5), vec2(12.9898, 78.233))
					  ) * 43758.55));
					  tmpvar_9.y = fract((sin(
					    dot (vec2((tmpvar_5 + 23.0)), vec2(12.9898, 78.233))
					  ) * 43758.55));
					  uv_4.y = (uv_4 + (0.01 * tmpvar_9)).y;
					  uv_4.x = (uv_4.x + (_TimeX * _Speed));
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex2, uv_4).xyz;
					  oldfilm_2 = tmpvar_10;
					  uv_4 = xlv_TEXCOORD0;
					  col_3 = (mix (col_3, (1.0 - col_3), vec3(_Value3)) * (pow (
					    ((((16.0 * uv_4.x) * (1.0 - uv_4.x)) * uv_4.y) * (1.0 - uv_4.y))
					  , 0.4) + _Value2));
					  highp vec3 tmpvar_11;
					  tmpvar_11 = (((2.0 * oldfilm_2) + vec3(dot (vec3(0.2126, 0.7152, 0.0722), col_3))) - _Value);
					  col_3 = tmpvar_11;
					  highp vec4 tmpvar_12;
					  tmpvar_12.w = 1.0;
					  tmpvar_12.xyz = tmpvar_11;
					  tmpvar_1 = tmpvar_12;
					  gl_FragData[0] = tmpvar_1;
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
					uniform sampler2D _MainTex2;
					uniform highp float _TimeX;
					uniform highp float _Speed;
					uniform highp float _Value;
					uniform highp float _Value2;
					uniform highp float _Value3;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  highp vec3 oldfilm_2;
					  highp vec3 col_3;
					  highp vec2 uv_4;
					  uv_4 = xlv_TEXCOORD0;
					  highp float tmpvar_5;
					  tmpvar_5 = float(int((_TimeX * 15.0)));
					  highp vec2 tmpvar_6;
					  tmpvar_6.x = (fract((
					    sin(dot (vec2(tmpvar_5), vec2(12.9898, 78.233)))
					   * 43758.55)) * -2.0);
					  tmpvar_6.y = fract((sin(
					    dot (vec2((tmpvar_5 + 23.0)), vec2(12.9898, 78.233))
					  ) * 43758.55));
					  highp vec2 tmpvar_7;
					  tmpvar_7 = (uv_4 + (0.004 * tmpvar_6));
					  lowp vec3 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, tmpvar_7).xyz;
					  col_3 = tmpvar_8;
					  highp vec2 tmpvar_9;
					  tmpvar_9.x = fract((sin(
					    dot (vec2(tmpvar_5), vec2(12.9898, 78.233))
					  ) * 43758.55));
					  tmpvar_9.y = fract((sin(
					    dot (vec2((tmpvar_5 + 23.0)), vec2(12.9898, 78.233))
					  ) * 43758.55));
					  uv_4.y = (uv_4 + (0.01 * tmpvar_9)).y;
					  uv_4.x = (uv_4.x + (_TimeX * _Speed));
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex2, uv_4).xyz;
					  oldfilm_2 = tmpvar_10;
					  uv_4 = xlv_TEXCOORD0;
					  col_3 = (mix (col_3, (1.0 - col_3), vec3(_Value3)) * (pow (
					    ((((16.0 * uv_4.x) * (1.0 - uv_4.x)) * uv_4.y) * (1.0 - uv_4.y))
					  , 0.4) + _Value2));
					  highp vec3 tmpvar_11;
					  tmpvar_11 = (((2.0 * oldfilm_2) + vec3(dot (vec3(0.2126, 0.7152, 0.0722), col_3))) - _Value);
					  col_3 = tmpvar_11;
					  highp vec4 tmpvar_12;
					  tmpvar_12.w = 1.0;
					  tmpvar_12.xyz = tmpvar_11;
					  tmpvar_1 = tmpvar_12;
					  gl_FragData[0] = tmpvar_1;
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
					uniform 	float _Speed;
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _MainTex2;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump float u_xlat16_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					mediump vec2 u_xlat16_3;
					lowp vec3 u_xlat10_3;
					float u_xlat6;
					void main()
					{
					    u_xlat16_0 = vs_TEXCOORD0.x * 16.0;
					    u_xlat16_3.xy = (-vs_TEXCOORD0.xy) + vec2(1.0, 1.0);
					    u_xlat16_0 = u_xlat16_3.x * u_xlat16_0;
					    u_xlat16_0 = u_xlat16_0 * vs_TEXCOORD0.y;
					    u_xlat16_0 = u_xlat16_3.y * u_xlat16_0;
					    u_xlat16_0 = log2(u_xlat16_0);
					    u_xlat16_0 = u_xlat16_0 * 0.400000006;
					    u_xlat16_0 = exp2(u_xlat16_0);
					    u_xlat0.x = u_xlat16_0 + _Value2;
					    u_xlat3.x = _TimeX * 15.0;
					    u_xlat3.x = trunc(u_xlat3.x);
					    u_xlat6 = u_xlat3.x + 23.0;
					    u_xlat3.x = dot(u_xlat3.xx, vec2(12.9898005, 78.2330017));
					    u_xlat3.x = sin(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat3.x);
					    u_xlat3.x = dot(vec2(u_xlat6), vec2(12.9898005, 78.2330017));
					    u_xlat3.x = sin(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x * 43758.5469;
					    u_xlat1.y = fract(u_xlat3.x);
					    u_xlat1.xyw = u_xlat1.xyy * vec3(-0.00800000038, 0.00400000019, 0.00999999978) + vs_TEXCOORD0.xyy;
					    u_xlat10_3.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat16_2.xyz = u_xlat10_3.xyz * vec3(-2.0, -2.0, -2.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat3.xyz = vec3(_Value3) * u_xlat16_2.xyz + u_xlat10_3.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
					    u_xlat0.x = dot(vec3(0.212599993, 0.715200007, 0.0722000003), u_xlat0.xyz);
					    u_xlat1.z = _TimeX * _Speed + vs_TEXCOORD0.x;
					    u_xlat10_3.xyz = texture(_MainTex2, u_xlat1.zw).xyz;
					    u_xlat0.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + u_xlat0.xxx;
					    u_xlat0.xyz = u_xlat0.xyz + (-vec3(vec3(_Value, _Value, _Value)));
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target0.w = 1.0;
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
					uniform 	float _Speed;
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _MainTex2;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump float u_xlat16_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					mediump vec2 u_xlat16_3;
					lowp vec3 u_xlat10_3;
					float u_xlat6;
					void main()
					{
					    u_xlat16_0 = vs_TEXCOORD0.x * 16.0;
					    u_xlat16_3.xy = (-vs_TEXCOORD0.xy) + vec2(1.0, 1.0);
					    u_xlat16_0 = u_xlat16_3.x * u_xlat16_0;
					    u_xlat16_0 = u_xlat16_0 * vs_TEXCOORD0.y;
					    u_xlat16_0 = u_xlat16_3.y * u_xlat16_0;
					    u_xlat16_0 = log2(u_xlat16_0);
					    u_xlat16_0 = u_xlat16_0 * 0.400000006;
					    u_xlat16_0 = exp2(u_xlat16_0);
					    u_xlat0.x = u_xlat16_0 + _Value2;
					    u_xlat3.x = _TimeX * 15.0;
					    u_xlat3.x = trunc(u_xlat3.x);
					    u_xlat6 = u_xlat3.x + 23.0;
					    u_xlat3.x = dot(u_xlat3.xx, vec2(12.9898005, 78.2330017));
					    u_xlat3.x = sin(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat3.x);
					    u_xlat3.x = dot(vec2(u_xlat6), vec2(12.9898005, 78.2330017));
					    u_xlat3.x = sin(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x * 43758.5469;
					    u_xlat1.y = fract(u_xlat3.x);
					    u_xlat1.xyw = u_xlat1.xyy * vec3(-0.00800000038, 0.00400000019, 0.00999999978) + vs_TEXCOORD0.xyy;
					    u_xlat10_3.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat16_2.xyz = u_xlat10_3.xyz * vec3(-2.0, -2.0, -2.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat3.xyz = vec3(_Value3) * u_xlat16_2.xyz + u_xlat10_3.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
					    u_xlat0.x = dot(vec3(0.212599993, 0.715200007, 0.0722000003), u_xlat0.xyz);
					    u_xlat1.z = _TimeX * _Speed + vs_TEXCOORD0.x;
					    u_xlat10_3.xyz = texture(_MainTex2, u_xlat1.zw).xyz;
					    u_xlat0.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + u_xlat0.xxx;
					    u_xlat0.xyz = u_xlat0.xyz + (-vec3(vec3(_Value, _Value, _Value)));
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target0.w = 1.0;
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
					uniform 	float _Speed;
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _MainTex2;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump float u_xlat16_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					mediump vec2 u_xlat16_3;
					lowp vec3 u_xlat10_3;
					float u_xlat6;
					void main()
					{
					    u_xlat16_0 = vs_TEXCOORD0.x * 16.0;
					    u_xlat16_3.xy = (-vs_TEXCOORD0.xy) + vec2(1.0, 1.0);
					    u_xlat16_0 = u_xlat16_3.x * u_xlat16_0;
					    u_xlat16_0 = u_xlat16_0 * vs_TEXCOORD0.y;
					    u_xlat16_0 = u_xlat16_3.y * u_xlat16_0;
					    u_xlat16_0 = log2(u_xlat16_0);
					    u_xlat16_0 = u_xlat16_0 * 0.400000006;
					    u_xlat16_0 = exp2(u_xlat16_0);
					    u_xlat0.x = u_xlat16_0 + _Value2;
					    u_xlat3.x = _TimeX * 15.0;
					    u_xlat3.x = trunc(u_xlat3.x);
					    u_xlat6 = u_xlat3.x + 23.0;
					    u_xlat3.x = dot(u_xlat3.xx, vec2(12.9898005, 78.2330017));
					    u_xlat3.x = sin(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat3.x);
					    u_xlat3.x = dot(vec2(u_xlat6), vec2(12.9898005, 78.2330017));
					    u_xlat3.x = sin(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x * 43758.5469;
					    u_xlat1.y = fract(u_xlat3.x);
					    u_xlat1.xyw = u_xlat1.xyy * vec3(-0.00800000038, 0.00400000019, 0.00999999978) + vs_TEXCOORD0.xyy;
					    u_xlat10_3.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat16_2.xyz = u_xlat10_3.xyz * vec3(-2.0, -2.0, -2.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat3.xyz = vec3(_Value3) * u_xlat16_2.xyz + u_xlat10_3.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
					    u_xlat0.x = dot(vec3(0.212599993, 0.715200007, 0.0722000003), u_xlat0.xyz);
					    u_xlat1.z = _TimeX * _Speed + vs_TEXCOORD0.x;
					    u_xlat10_3.xyz = texture(_MainTex2, u_xlat1.zw).xyz;
					    u_xlat0.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + u_xlat0.xxx;
					    u_xlat0.xyz = u_xlat0.xyz + (-vec3(vec3(_Value, _Value, _Value)));
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target0.w = 1.0;
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