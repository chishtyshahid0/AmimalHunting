Shader "CameraFilterPack/Edge_Edge_filter" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_RedAmplifier ("_RedAmplifier", Range(0, 10)) = 0
		_GreenAmplifier ("_GreenAmplifier", Range(0, 10)) = 2
		_BlueAmplifier ("_BlueAmplifier", Range(0, 10)) = 0
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 42338
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
					uniform highp vec4 _ScreenResolution;
					uniform highp float _RedAmplifier;
					uniform highp float _GreenAmplifier;
					uniform highp float _BlueAmplifier;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 color_2;
					  lowp vec4 sum_3;
					  highp vec4 tmpvar_4;
					  lowp vec4 tmpvar_5;
					  highp vec2 P_6;
					  highp vec2 tmpvar_7;
					  tmpvar_7 = (xlv_TEXCOORD0 * _ScreenResolution.xy);
					  P_6 = ((tmpvar_7 + vec2(0.0, 1.0)) / _ScreenResolution.xy);
					  tmpvar_5 = texture2D (_MainTex, P_6);
					  tmpvar_4 = tmpvar_5;
					  highp vec4 tmpvar_8;
					  lowp vec4 tmpvar_9;
					  highp vec2 P_10;
					  P_10 = ((tmpvar_7 + vec2(0.0, -1.0)) / _ScreenResolution.xy);
					  tmpvar_9 = texture2D (_MainTex, P_10);
					  tmpvar_8 = tmpvar_9;
					  highp vec4 tmpvar_11;
					  tmpvar_11 = abs((tmpvar_4 - tmpvar_8));
					  sum_3 = tmpvar_11;
					  highp vec4 tmpvar_12;
					  lowp vec4 tmpvar_13;
					  highp vec2 P_14;
					  P_14 = ((tmpvar_7 + vec2(1.0, 0.0)) / _ScreenResolution.xy);
					  tmpvar_13 = texture2D (_MainTex, P_14);
					  tmpvar_12 = tmpvar_13;
					  highp vec4 tmpvar_15;
					  lowp vec4 tmpvar_16;
					  highp vec2 P_17;
					  P_17 = ((tmpvar_7 + vec2(-1.0, 0.0)) / _ScreenResolution.xy);
					  tmpvar_16 = texture2D (_MainTex, P_17);
					  tmpvar_15 = tmpvar_16;
					  highp vec4 tmpvar_18;
					  tmpvar_18 = abs((tmpvar_12 - tmpvar_15));
					  sum_3 = (sum_3 + tmpvar_18);
					  sum_3 = (sum_3 / 2.0);
					  highp vec4 tmpvar_19;
					  lowp vec4 tmpvar_20;
					  highp vec2 P_21;
					  P_21 = (tmpvar_7 / _ScreenResolution.xy);
					  tmpvar_20 = texture2D (_MainTex, P_21);
					  tmpvar_19 = tmpvar_20;
					  color_2 = tmpvar_19;
					  color_2.x = (color_2.x + (sqrt(
					    dot (sum_3, sum_3)
					  ) * _RedAmplifier));
					  color_2.y = (color_2.y + (sqrt(
					    dot (sum_3, sum_3)
					  ) * _GreenAmplifier));
					  color_2.z = (color_2.z + (sqrt(
					    dot (sum_3, sum_3)
					  ) * _BlueAmplifier));
					  tmpvar_1 = color_2;
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
					uniform highp vec4 _ScreenResolution;
					uniform highp float _RedAmplifier;
					uniform highp float _GreenAmplifier;
					uniform highp float _BlueAmplifier;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 color_2;
					  lowp vec4 sum_3;
					  highp vec4 tmpvar_4;
					  lowp vec4 tmpvar_5;
					  highp vec2 P_6;
					  highp vec2 tmpvar_7;
					  tmpvar_7 = (xlv_TEXCOORD0 * _ScreenResolution.xy);
					  P_6 = ((tmpvar_7 + vec2(0.0, 1.0)) / _ScreenResolution.xy);
					  tmpvar_5 = texture2D (_MainTex, P_6);
					  tmpvar_4 = tmpvar_5;
					  highp vec4 tmpvar_8;
					  lowp vec4 tmpvar_9;
					  highp vec2 P_10;
					  P_10 = ((tmpvar_7 + vec2(0.0, -1.0)) / _ScreenResolution.xy);
					  tmpvar_9 = texture2D (_MainTex, P_10);
					  tmpvar_8 = tmpvar_9;
					  highp vec4 tmpvar_11;
					  tmpvar_11 = abs((tmpvar_4 - tmpvar_8));
					  sum_3 = tmpvar_11;
					  highp vec4 tmpvar_12;
					  lowp vec4 tmpvar_13;
					  highp vec2 P_14;
					  P_14 = ((tmpvar_7 + vec2(1.0, 0.0)) / _ScreenResolution.xy);
					  tmpvar_13 = texture2D (_MainTex, P_14);
					  tmpvar_12 = tmpvar_13;
					  highp vec4 tmpvar_15;
					  lowp vec4 tmpvar_16;
					  highp vec2 P_17;
					  P_17 = ((tmpvar_7 + vec2(-1.0, 0.0)) / _ScreenResolution.xy);
					  tmpvar_16 = texture2D (_MainTex, P_17);
					  tmpvar_15 = tmpvar_16;
					  highp vec4 tmpvar_18;
					  tmpvar_18 = abs((tmpvar_12 - tmpvar_15));
					  sum_3 = (sum_3 + tmpvar_18);
					  sum_3 = (sum_3 / 2.0);
					  highp vec4 tmpvar_19;
					  lowp vec4 tmpvar_20;
					  highp vec2 P_21;
					  P_21 = (tmpvar_7 / _ScreenResolution.xy);
					  tmpvar_20 = texture2D (_MainTex, P_21);
					  tmpvar_19 = tmpvar_20;
					  color_2 = tmpvar_19;
					  color_2.x = (color_2.x + (sqrt(
					    dot (sum_3, sum_3)
					  ) * _RedAmplifier));
					  color_2.y = (color_2.y + (sqrt(
					    dot (sum_3, sum_3)
					  ) * _GreenAmplifier));
					  color_2.z = (color_2.z + (sqrt(
					    dot (sum_3, sum_3)
					  ) * _BlueAmplifier));
					  tmpvar_1 = color_2;
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
					uniform highp vec4 _ScreenResolution;
					uniform highp float _RedAmplifier;
					uniform highp float _GreenAmplifier;
					uniform highp float _BlueAmplifier;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 color_2;
					  lowp vec4 sum_3;
					  highp vec4 tmpvar_4;
					  lowp vec4 tmpvar_5;
					  highp vec2 P_6;
					  highp vec2 tmpvar_7;
					  tmpvar_7 = (xlv_TEXCOORD0 * _ScreenResolution.xy);
					  P_6 = ((tmpvar_7 + vec2(0.0, 1.0)) / _ScreenResolution.xy);
					  tmpvar_5 = texture2D (_MainTex, P_6);
					  tmpvar_4 = tmpvar_5;
					  highp vec4 tmpvar_8;
					  lowp vec4 tmpvar_9;
					  highp vec2 P_10;
					  P_10 = ((tmpvar_7 + vec2(0.0, -1.0)) / _ScreenResolution.xy);
					  tmpvar_9 = texture2D (_MainTex, P_10);
					  tmpvar_8 = tmpvar_9;
					  highp vec4 tmpvar_11;
					  tmpvar_11 = abs((tmpvar_4 - tmpvar_8));
					  sum_3 = tmpvar_11;
					  highp vec4 tmpvar_12;
					  lowp vec4 tmpvar_13;
					  highp vec2 P_14;
					  P_14 = ((tmpvar_7 + vec2(1.0, 0.0)) / _ScreenResolution.xy);
					  tmpvar_13 = texture2D (_MainTex, P_14);
					  tmpvar_12 = tmpvar_13;
					  highp vec4 tmpvar_15;
					  lowp vec4 tmpvar_16;
					  highp vec2 P_17;
					  P_17 = ((tmpvar_7 + vec2(-1.0, 0.0)) / _ScreenResolution.xy);
					  tmpvar_16 = texture2D (_MainTex, P_17);
					  tmpvar_15 = tmpvar_16;
					  highp vec4 tmpvar_18;
					  tmpvar_18 = abs((tmpvar_12 - tmpvar_15));
					  sum_3 = (sum_3 + tmpvar_18);
					  sum_3 = (sum_3 / 2.0);
					  highp vec4 tmpvar_19;
					  lowp vec4 tmpvar_20;
					  highp vec2 P_21;
					  P_21 = (tmpvar_7 / _ScreenResolution.xy);
					  tmpvar_20 = texture2D (_MainTex, P_21);
					  tmpvar_19 = tmpvar_20;
					  color_2 = tmpvar_19;
					  color_2.x = (color_2.x + (sqrt(
					    dot (sum_3, sum_3)
					  ) * _RedAmplifier));
					  color_2.y = (color_2.y + (sqrt(
					    dot (sum_3, sum_3)
					  ) * _GreenAmplifier));
					  color_2.z = (color_2.z + (sqrt(
					    dot (sum_3, sum_3)
					  ) * _BlueAmplifier));
					  tmpvar_1 = color_2;
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
					uniform 	vec4 _ScreenResolution;
					uniform 	float _RedAmplifier;
					uniform 	float _GreenAmplifier;
					uniform 	float _BlueAmplifier;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					lowp vec4 u_xlat10_2;
					lowp float u_xlat10_3;
					void main()
					{
					    u_xlat0 = vs_TEXCOORD0.xyxy * _ScreenResolution.xyxy + vec4(0.0, 1.0, 0.0, -1.0);
					    u_xlat0 = u_xlat0 / _ScreenResolution.xyxy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_0 = (-u_xlat10_0) + u_xlat10_1;
					    u_xlat1 = vs_TEXCOORD0.xyxy * _ScreenResolution.xyxy + vec4(1.0, 0.0, -1.0, 0.0);
					    u_xlat1 = u_xlat1 / _ScreenResolution.xyxy;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_1 = (-u_xlat10_1) + u_xlat10_2;
					    u_xlat16_0 = abs(u_xlat16_0) + abs(u_xlat16_1);
					    u_xlat10_0 = u_xlat16_0 * vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat10_3 = dot(u_xlat10_0, u_xlat10_0);
					    u_xlat10_3 = sqrt(u_xlat10_3);
					    u_xlat1.xy = vs_TEXCOORD0.xy * _ScreenResolution.xy;
					    u_xlat1.xy = u_xlat1.xy / _ScreenResolution.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat1.xy);
					    SV_Target0.xyz = vec3(u_xlat10_3) * vec3(_RedAmplifier, _GreenAmplifier, _BlueAmplifier) + u_xlat10_0.xyz;
					    SV_Target0.w = u_xlat10_0.w;
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
					uniform 	vec4 _ScreenResolution;
					uniform 	float _RedAmplifier;
					uniform 	float _GreenAmplifier;
					uniform 	float _BlueAmplifier;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					lowp vec4 u_xlat10_2;
					lowp float u_xlat10_3;
					void main()
					{
					    u_xlat0 = vs_TEXCOORD0.xyxy * _ScreenResolution.xyxy + vec4(0.0, 1.0, 0.0, -1.0);
					    u_xlat0 = u_xlat0 / _ScreenResolution.xyxy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_0 = (-u_xlat10_0) + u_xlat10_1;
					    u_xlat1 = vs_TEXCOORD0.xyxy * _ScreenResolution.xyxy + vec4(1.0, 0.0, -1.0, 0.0);
					    u_xlat1 = u_xlat1 / _ScreenResolution.xyxy;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_1 = (-u_xlat10_1) + u_xlat10_2;
					    u_xlat16_0 = abs(u_xlat16_0) + abs(u_xlat16_1);
					    u_xlat10_0 = u_xlat16_0 * vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat10_3 = dot(u_xlat10_0, u_xlat10_0);
					    u_xlat10_3 = sqrt(u_xlat10_3);
					    u_xlat1.xy = vs_TEXCOORD0.xy * _ScreenResolution.xy;
					    u_xlat1.xy = u_xlat1.xy / _ScreenResolution.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat1.xy);
					    SV_Target0.xyz = vec3(u_xlat10_3) * vec3(_RedAmplifier, _GreenAmplifier, _BlueAmplifier) + u_xlat10_0.xyz;
					    SV_Target0.w = u_xlat10_0.w;
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
					uniform 	vec4 _ScreenResolution;
					uniform 	float _RedAmplifier;
					uniform 	float _GreenAmplifier;
					uniform 	float _BlueAmplifier;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					lowp vec4 u_xlat10_2;
					lowp float u_xlat10_3;
					void main()
					{
					    u_xlat0 = vs_TEXCOORD0.xyxy * _ScreenResolution.xyxy + vec4(0.0, 1.0, 0.0, -1.0);
					    u_xlat0 = u_xlat0 / _ScreenResolution.xyxy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_0 = (-u_xlat10_0) + u_xlat10_1;
					    u_xlat1 = vs_TEXCOORD0.xyxy * _ScreenResolution.xyxy + vec4(1.0, 0.0, -1.0, 0.0);
					    u_xlat1 = u_xlat1 / _ScreenResolution.xyxy;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_1 = (-u_xlat10_1) + u_xlat10_2;
					    u_xlat16_0 = abs(u_xlat16_0) + abs(u_xlat16_1);
					    u_xlat10_0 = u_xlat16_0 * vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat10_3 = dot(u_xlat10_0, u_xlat10_0);
					    u_xlat10_3 = sqrt(u_xlat10_3);
					    u_xlat1.xy = vs_TEXCOORD0.xy * _ScreenResolution.xy;
					    u_xlat1.xy = u_xlat1.xy / _ScreenResolution.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat1.xy);
					    SV_Target0.xyz = vec3(u_xlat10_3) * vec3(_RedAmplifier, _GreenAmplifier, _BlueAmplifier) + u_xlat10_0.xyz;
					    SV_Target0.w = u_xlat10_0.w;
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