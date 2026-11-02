Shader "CameraFilterPack/Light_Water" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 57371
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
					uniform highp float _Alpha;
					uniform highp float _Distance;
					uniform highp float _Size;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 sum_1;
					  highp float c_2;
					  highp vec2 w_3;
					  highp vec2 uv_4;
					  uv_4 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_5;
					  tmpvar_5 = (((uv_4 - 1.2) * _Distance) - vec2(10.0, 10.0));
					  highp float tmpvar_6;
					  tmpvar_6 = (_TimeX * -2.0);
					  highp vec2 tmpvar_7;
					  tmpvar_7.x = (cos((tmpvar_6 - tmpvar_5.x)) + sin((tmpvar_6 + tmpvar_5.y)));
					  tmpvar_7.y = (sin((tmpvar_6 - tmpvar_5.y)) + cos((tmpvar_6 + tmpvar_5.x)));
					  w_3 = (tmpvar_5 + tmpvar_7);
					  highp vec2 tmpvar_8;
					  tmpvar_8.x = (tmpvar_5.x / (sin(
					    (w_3.x + tmpvar_6)
					  ) / 0.01));
					  tmpvar_8.y = (tmpvar_5.y / (cos(
					    (w_3.y + tmpvar_6)
					  ) / 0.01));
					  c_2 = (0.2 + (1.2 / sqrt(
					    dot (tmpvar_8, tmpvar_8)
					  )));
					  c_2 = (c_2 / 1.5);
					  c_2 = (1.5 - sqrt((c_2 * _Size)));
					  highp float tmpvar_9;
					  tmpvar_9 = (c_2 * c_2);
					  highp vec4 tmpvar_10;
					  tmpvar_10.w = 999.0;
					  tmpvar_10.x = tmpvar_9;
					  tmpvar_10.y = tmpvar_9;
					  tmpvar_10.z = tmpvar_9;
					  highp vec3 tmpvar_11;
					  tmpvar_11 = ((tmpvar_10 + vec4(0.0, 0.3, 0.5, 1.0)).xyz * _Alpha);
					  highp vec2 tmpvar_12;
					  tmpvar_12.y = 0.0;
					  tmpvar_12.x = (tmpvar_11.x / 3.5);
					  lowp vec4 tmpvar_13;
					  highp vec2 P_14;
					  P_14 = (uv_4 + tmpvar_12);
					  tmpvar_13 = texture2D (_MainTex, P_14);
					  sum_1 = tmpvar_13;
					  sum_1.xyz = (sum_1.xyz + tmpvar_11);
					  gl_FragData[0] = sum_1;
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
					uniform highp float _Alpha;
					uniform highp float _Distance;
					uniform highp float _Size;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 sum_1;
					  highp float c_2;
					  highp vec2 w_3;
					  highp vec2 uv_4;
					  uv_4 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_5;
					  tmpvar_5 = (((uv_4 - 1.2) * _Distance) - vec2(10.0, 10.0));
					  highp float tmpvar_6;
					  tmpvar_6 = (_TimeX * -2.0);
					  highp vec2 tmpvar_7;
					  tmpvar_7.x = (cos((tmpvar_6 - tmpvar_5.x)) + sin((tmpvar_6 + tmpvar_5.y)));
					  tmpvar_7.y = (sin((tmpvar_6 - tmpvar_5.y)) + cos((tmpvar_6 + tmpvar_5.x)));
					  w_3 = (tmpvar_5 + tmpvar_7);
					  highp vec2 tmpvar_8;
					  tmpvar_8.x = (tmpvar_5.x / (sin(
					    (w_3.x + tmpvar_6)
					  ) / 0.01));
					  tmpvar_8.y = (tmpvar_5.y / (cos(
					    (w_3.y + tmpvar_6)
					  ) / 0.01));
					  c_2 = (0.2 + (1.2 / sqrt(
					    dot (tmpvar_8, tmpvar_8)
					  )));
					  c_2 = (c_2 / 1.5);
					  c_2 = (1.5 - sqrt((c_2 * _Size)));
					  highp float tmpvar_9;
					  tmpvar_9 = (c_2 * c_2);
					  highp vec4 tmpvar_10;
					  tmpvar_10.w = 999.0;
					  tmpvar_10.x = tmpvar_9;
					  tmpvar_10.y = tmpvar_9;
					  tmpvar_10.z = tmpvar_9;
					  highp vec3 tmpvar_11;
					  tmpvar_11 = ((tmpvar_10 + vec4(0.0, 0.3, 0.5, 1.0)).xyz * _Alpha);
					  highp vec2 tmpvar_12;
					  tmpvar_12.y = 0.0;
					  tmpvar_12.x = (tmpvar_11.x / 3.5);
					  lowp vec4 tmpvar_13;
					  highp vec2 P_14;
					  P_14 = (uv_4 + tmpvar_12);
					  tmpvar_13 = texture2D (_MainTex, P_14);
					  sum_1 = tmpvar_13;
					  sum_1.xyz = (sum_1.xyz + tmpvar_11);
					  gl_FragData[0] = sum_1;
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
					uniform highp float _Alpha;
					uniform highp float _Distance;
					uniform highp float _Size;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 sum_1;
					  highp float c_2;
					  highp vec2 w_3;
					  highp vec2 uv_4;
					  uv_4 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_5;
					  tmpvar_5 = (((uv_4 - 1.2) * _Distance) - vec2(10.0, 10.0));
					  highp float tmpvar_6;
					  tmpvar_6 = (_TimeX * -2.0);
					  highp vec2 tmpvar_7;
					  tmpvar_7.x = (cos((tmpvar_6 - tmpvar_5.x)) + sin((tmpvar_6 + tmpvar_5.y)));
					  tmpvar_7.y = (sin((tmpvar_6 - tmpvar_5.y)) + cos((tmpvar_6 + tmpvar_5.x)));
					  w_3 = (tmpvar_5 + tmpvar_7);
					  highp vec2 tmpvar_8;
					  tmpvar_8.x = (tmpvar_5.x / (sin(
					    (w_3.x + tmpvar_6)
					  ) / 0.01));
					  tmpvar_8.y = (tmpvar_5.y / (cos(
					    (w_3.y + tmpvar_6)
					  ) / 0.01));
					  c_2 = (0.2 + (1.2 / sqrt(
					    dot (tmpvar_8, tmpvar_8)
					  )));
					  c_2 = (c_2 / 1.5);
					  c_2 = (1.5 - sqrt((c_2 * _Size)));
					  highp float tmpvar_9;
					  tmpvar_9 = (c_2 * c_2);
					  highp vec4 tmpvar_10;
					  tmpvar_10.w = 999.0;
					  tmpvar_10.x = tmpvar_9;
					  tmpvar_10.y = tmpvar_9;
					  tmpvar_10.z = tmpvar_9;
					  highp vec3 tmpvar_11;
					  tmpvar_11 = ((tmpvar_10 + vec4(0.0, 0.3, 0.5, 1.0)).xyz * _Alpha);
					  highp vec2 tmpvar_12;
					  tmpvar_12.y = 0.0;
					  tmpvar_12.x = (tmpvar_11.x / 3.5);
					  lowp vec4 tmpvar_13;
					  highp vec2 P_14;
					  P_14 = (uv_4 + tmpvar_12);
					  tmpvar_13 = texture2D (_MainTex, P_14);
					  sum_1 = tmpvar_13;
					  sum_1.xyz = (sum_1.xyz + tmpvar_11);
					  gl_FragData[0] = sum_1;
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
					uniform 	float _Alpha;
					uniform 	float _Distance;
					uniform 	float _Size;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec2 u_xlat16_0;
					vec2 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					float u_xlat3;
					vec2 u_xlat6;
					float u_xlat9;
					void main()
					{
					    u_xlat16_0.xy = vs_TEXCOORD0.xy + vec2(-1.20000005, -1.20000005);
					    u_xlat0.xy = u_xlat16_0.xy * vec2(vec2(_Distance, _Distance)) + vec2(-10.0, -10.0);
					    u_xlat6.xy = vec2(_TimeX) * vec2(-2.0, -2.0) + (-u_xlat0.xy);
					    u_xlat6.x = cos(u_xlat6.x);
					    u_xlat6.y = sin(u_xlat6.y);
					    u_xlat1.xy = vec2(_TimeX) * vec2(-2.0, -2.0) + u_xlat0.yx;
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.y = cos(u_xlat1.y);
					    u_xlat2.xy = u_xlat6.xy + u_xlat1.xy;
					    u_xlat6.xy = u_xlat0.xy + u_xlat2.xy;
					    u_xlat6.xy = vec2(_TimeX) * vec2(-2.0, -2.0) + u_xlat6.xy;
					    u_xlat6.x = sin(u_xlat6.x);
					    u_xlat9 = cos(u_xlat6.y);
					    u_xlat9 = u_xlat9 * 100.0;
					    u_xlat1.y = u_xlat0.y / u_xlat9;
					    u_xlat3 = u_xlat6.x * 100.0;
					    u_xlat1.x = u_xlat0.x / u_xlat3;
					    u_xlat0.x = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = 1.20000005 / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + 0.200000003;
					    u_xlat0.x = u_xlat0.x * _Size;
					    u_xlat0.x = u_xlat0.x * 0.666666687;
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = (-u_xlat0.x) + 1.5;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat0.xxx + vec3(0.0, 0.300000012, 0.5);
					    u_xlat9 = u_xlat0.x * _Alpha;
					    u_xlat1.x = u_xlat9 * 0.285714298;
					    u_xlat1.y = 0.0;
					    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(_Alpha) + u_xlat10_1.xyz;
					    SV_Target0.w = u_xlat10_1.w;
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
					uniform 	float _Alpha;
					uniform 	float _Distance;
					uniform 	float _Size;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec2 u_xlat16_0;
					vec2 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					float u_xlat3;
					vec2 u_xlat6;
					float u_xlat9;
					void main()
					{
					    u_xlat16_0.xy = vs_TEXCOORD0.xy + vec2(-1.20000005, -1.20000005);
					    u_xlat0.xy = u_xlat16_0.xy * vec2(vec2(_Distance, _Distance)) + vec2(-10.0, -10.0);
					    u_xlat6.xy = vec2(_TimeX) * vec2(-2.0, -2.0) + (-u_xlat0.xy);
					    u_xlat6.x = cos(u_xlat6.x);
					    u_xlat6.y = sin(u_xlat6.y);
					    u_xlat1.xy = vec2(_TimeX) * vec2(-2.0, -2.0) + u_xlat0.yx;
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.y = cos(u_xlat1.y);
					    u_xlat2.xy = u_xlat6.xy + u_xlat1.xy;
					    u_xlat6.xy = u_xlat0.xy + u_xlat2.xy;
					    u_xlat6.xy = vec2(_TimeX) * vec2(-2.0, -2.0) + u_xlat6.xy;
					    u_xlat6.x = sin(u_xlat6.x);
					    u_xlat9 = cos(u_xlat6.y);
					    u_xlat9 = u_xlat9 * 100.0;
					    u_xlat1.y = u_xlat0.y / u_xlat9;
					    u_xlat3 = u_xlat6.x * 100.0;
					    u_xlat1.x = u_xlat0.x / u_xlat3;
					    u_xlat0.x = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = 1.20000005 / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + 0.200000003;
					    u_xlat0.x = u_xlat0.x * _Size;
					    u_xlat0.x = u_xlat0.x * 0.666666687;
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = (-u_xlat0.x) + 1.5;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat0.xxx + vec3(0.0, 0.300000012, 0.5);
					    u_xlat9 = u_xlat0.x * _Alpha;
					    u_xlat1.x = u_xlat9 * 0.285714298;
					    u_xlat1.y = 0.0;
					    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(_Alpha) + u_xlat10_1.xyz;
					    SV_Target0.w = u_xlat10_1.w;
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
					uniform 	float _Alpha;
					uniform 	float _Distance;
					uniform 	float _Size;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec2 u_xlat16_0;
					vec2 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					float u_xlat3;
					vec2 u_xlat6;
					float u_xlat9;
					void main()
					{
					    u_xlat16_0.xy = vs_TEXCOORD0.xy + vec2(-1.20000005, -1.20000005);
					    u_xlat0.xy = u_xlat16_0.xy * vec2(vec2(_Distance, _Distance)) + vec2(-10.0, -10.0);
					    u_xlat6.xy = vec2(_TimeX) * vec2(-2.0, -2.0) + (-u_xlat0.xy);
					    u_xlat6.x = cos(u_xlat6.x);
					    u_xlat6.y = sin(u_xlat6.y);
					    u_xlat1.xy = vec2(_TimeX) * vec2(-2.0, -2.0) + u_xlat0.yx;
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.y = cos(u_xlat1.y);
					    u_xlat2.xy = u_xlat6.xy + u_xlat1.xy;
					    u_xlat6.xy = u_xlat0.xy + u_xlat2.xy;
					    u_xlat6.xy = vec2(_TimeX) * vec2(-2.0, -2.0) + u_xlat6.xy;
					    u_xlat6.x = sin(u_xlat6.x);
					    u_xlat9 = cos(u_xlat6.y);
					    u_xlat9 = u_xlat9 * 100.0;
					    u_xlat1.y = u_xlat0.y / u_xlat9;
					    u_xlat3 = u_xlat6.x * 100.0;
					    u_xlat1.x = u_xlat0.x / u_xlat3;
					    u_xlat0.x = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = 1.20000005 / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + 0.200000003;
					    u_xlat0.x = u_xlat0.x * _Size;
					    u_xlat0.x = u_xlat0.x * 0.666666687;
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = (-u_xlat0.x) + 1.5;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat0.xxx + vec3(0.0, 0.300000012, 0.5);
					    u_xlat9 = u_xlat0.x * _Alpha;
					    u_xlat1.x = u_xlat9 * 0.285714298;
					    u_xlat1.y = 0.0;
					    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(_Alpha) + u_xlat10_1.xyz;
					    SV_Target0.w = u_xlat10_1.w;
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