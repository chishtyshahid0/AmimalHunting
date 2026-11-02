Shader "CameraFilterPack/FX_Screens" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 51162
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
					uniform highp float _Value;
					uniform highp float _Value2;
					uniform highp float _Value3;
					uniform highp float _Value4;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec2 r_1;
					  highp vec4 noise_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_4;
					  highp vec2 P_5;
					  P_5 = (floor((uv_3 * _Value)) / _Value);
					  tmpvar_4 = texture2D (_MainTex, P_5);
					  noise_2 = tmpvar_4;
					  highp float x_6;
					  x_6 = (((noise_2.x + noise_2.y) + noise_2.z) + (_TimeX * _Value2));
					  highp float tmpvar_7;
					  highp float x_8;
					  x_8 = (uv_3 * _Value).x;
					  tmpvar_7 = (x_8 - floor(x_8));
					  highp vec2 tmpvar_9;
					  highp float tmpvar_10;
					  tmpvar_10 = (tmpvar_7 - 0.5);
					  tmpvar_9.x = (tmpvar_10 * tmpvar_10);
					  highp float tmpvar_11;
					  tmpvar_11 = (tmpvar_7 - 0.5);
					  tmpvar_9.y = (tmpvar_11 * tmpvar_11);
					  highp vec2 tmpvar_12;
					  tmpvar_12.x = _Value3;
					  tmpvar_12.y = _Value4;
					  r_1 = (tmpvar_9 - tmpvar_12);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_MainTex, uv_3);
					  highp vec4 tmpvar_14;
					  highp float tmpvar_15;
					  tmpvar_15 = min (1.0, (12.0 * dot (r_1, r_1)));
					  tmpvar_14 = ((vec4(0.7, 1.6, 2.8, 1.0) * (
					    min (max (((
					      (1.0 - (x_6 - floor(x_6)))
					     * 3.0) - 1.8), 0.1), 2.0)
					   * 
					    (1.0 - (tmpvar_15 * tmpvar_15))
					  )) + tmpvar_13);
					  gl_FragData[0] = tmpvar_14;
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
					uniform highp float _Value;
					uniform highp float _Value2;
					uniform highp float _Value3;
					uniform highp float _Value4;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec2 r_1;
					  highp vec4 noise_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_4;
					  highp vec2 P_5;
					  P_5 = (floor((uv_3 * _Value)) / _Value);
					  tmpvar_4 = texture2D (_MainTex, P_5);
					  noise_2 = tmpvar_4;
					  highp float x_6;
					  x_6 = (((noise_2.x + noise_2.y) + noise_2.z) + (_TimeX * _Value2));
					  highp float tmpvar_7;
					  highp float x_8;
					  x_8 = (uv_3 * _Value).x;
					  tmpvar_7 = (x_8 - floor(x_8));
					  highp vec2 tmpvar_9;
					  highp float tmpvar_10;
					  tmpvar_10 = (tmpvar_7 - 0.5);
					  tmpvar_9.x = (tmpvar_10 * tmpvar_10);
					  highp float tmpvar_11;
					  tmpvar_11 = (tmpvar_7 - 0.5);
					  tmpvar_9.y = (tmpvar_11 * tmpvar_11);
					  highp vec2 tmpvar_12;
					  tmpvar_12.x = _Value3;
					  tmpvar_12.y = _Value4;
					  r_1 = (tmpvar_9 - tmpvar_12);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_MainTex, uv_3);
					  highp vec4 tmpvar_14;
					  highp float tmpvar_15;
					  tmpvar_15 = min (1.0, (12.0 * dot (r_1, r_1)));
					  tmpvar_14 = ((vec4(0.7, 1.6, 2.8, 1.0) * (
					    min (max (((
					      (1.0 - (x_6 - floor(x_6)))
					     * 3.0) - 1.8), 0.1), 2.0)
					   * 
					    (1.0 - (tmpvar_15 * tmpvar_15))
					  )) + tmpvar_13);
					  gl_FragData[0] = tmpvar_14;
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
					uniform highp float _Value;
					uniform highp float _Value2;
					uniform highp float _Value3;
					uniform highp float _Value4;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec2 r_1;
					  highp vec4 noise_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_4;
					  highp vec2 P_5;
					  P_5 = (floor((uv_3 * _Value)) / _Value);
					  tmpvar_4 = texture2D (_MainTex, P_5);
					  noise_2 = tmpvar_4;
					  highp float x_6;
					  x_6 = (((noise_2.x + noise_2.y) + noise_2.z) + (_TimeX * _Value2));
					  highp float tmpvar_7;
					  highp float x_8;
					  x_8 = (uv_3 * _Value).x;
					  tmpvar_7 = (x_8 - floor(x_8));
					  highp vec2 tmpvar_9;
					  highp float tmpvar_10;
					  tmpvar_10 = (tmpvar_7 - 0.5);
					  tmpvar_9.x = (tmpvar_10 * tmpvar_10);
					  highp float tmpvar_11;
					  tmpvar_11 = (tmpvar_7 - 0.5);
					  tmpvar_9.y = (tmpvar_11 * tmpvar_11);
					  highp vec2 tmpvar_12;
					  tmpvar_12.x = _Value3;
					  tmpvar_12.y = _Value4;
					  r_1 = (tmpvar_9 - tmpvar_12);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_MainTex, uv_3);
					  highp vec4 tmpvar_14;
					  highp float tmpvar_15;
					  tmpvar_15 = min (1.0, (12.0 * dot (r_1, r_1)));
					  tmpvar_14 = ((vec4(0.7, 1.6, 2.8, 1.0) * (
					    min (max (((
					      (1.0 - (x_6 - floor(x_6)))
					     * 3.0) - 1.8), 0.1), 2.0)
					   * 
					    (1.0 - (tmpvar_15 * tmpvar_15))
					  )) + tmpvar_13);
					  gl_FragData[0] = tmpvar_14;
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	float _Value4;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec2 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					mediump float u_xlat16_2;
					lowp vec3 u_xlat10_2;
					float u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(vec2(_Value, _Value));
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlat2.xy = u_xlat0.xy / vec2(vec2(_Value, _Value));
					    u_xlat0.x = vs_TEXCOORD0.x * _Value + (-u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + -0.5;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat2.xy).xyz;
					    u_xlat16_2 = u_xlat10_2.y + u_xlat10_2.x;
					    u_xlat16_2 = u_xlat10_2.z + u_xlat16_2;
					    u_xlat2.x = _TimeX * _Value2 + u_xlat16_2;
					    u_xlat4 = floor(u_xlat2.x);
					    u_xlat2.x = (-u_xlat4) + u_xlat2.x;
					    u_xlat2.x = (-u_xlat2.x) + 1.0;
					    u_xlat2.x = u_xlat2.x * 3.0 + -1.79999995;
					    u_xlat2.x = max(u_xlat2.x, 0.100000001);
					    u_xlat2.x = min(u_xlat2.x, 2.0);
					    u_xlat1.x = (-_Value3);
					    u_xlat1.y = (-_Value4);
					    u_xlat0.xz = u_xlat0.xx * u_xlat0.xx + u_xlat1.xy;
					    u_xlat0.x = dot(u_xlat0.xz, u_xlat0.xz);
					    u_xlat0.x = u_xlat0.x * 12.0;
					    u_xlat0.x = min(u_xlat0.x, 1.0);
					    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
					    u_xlat0.x = u_xlat0.x * u_xlat2.x;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0 = u_xlat0.xxxx * vec4(0.699999988, 1.60000002, 2.79999995, 1.0) + u_xlat10_1;
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	float _Value4;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec2 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					mediump float u_xlat16_2;
					lowp vec3 u_xlat10_2;
					float u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(vec2(_Value, _Value));
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlat2.xy = u_xlat0.xy / vec2(vec2(_Value, _Value));
					    u_xlat0.x = vs_TEXCOORD0.x * _Value + (-u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + -0.5;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat2.xy).xyz;
					    u_xlat16_2 = u_xlat10_2.y + u_xlat10_2.x;
					    u_xlat16_2 = u_xlat10_2.z + u_xlat16_2;
					    u_xlat2.x = _TimeX * _Value2 + u_xlat16_2;
					    u_xlat4 = floor(u_xlat2.x);
					    u_xlat2.x = (-u_xlat4) + u_xlat2.x;
					    u_xlat2.x = (-u_xlat2.x) + 1.0;
					    u_xlat2.x = u_xlat2.x * 3.0 + -1.79999995;
					    u_xlat2.x = max(u_xlat2.x, 0.100000001);
					    u_xlat2.x = min(u_xlat2.x, 2.0);
					    u_xlat1.x = (-_Value3);
					    u_xlat1.y = (-_Value4);
					    u_xlat0.xz = u_xlat0.xx * u_xlat0.xx + u_xlat1.xy;
					    u_xlat0.x = dot(u_xlat0.xz, u_xlat0.xz);
					    u_xlat0.x = u_xlat0.x * 12.0;
					    u_xlat0.x = min(u_xlat0.x, 1.0);
					    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
					    u_xlat0.x = u_xlat0.x * u_xlat2.x;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0 = u_xlat0.xxxx * vec4(0.699999988, 1.60000002, 2.79999995, 1.0) + u_xlat10_1;
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	float _Value4;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec2 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					mediump float u_xlat16_2;
					lowp vec3 u_xlat10_2;
					float u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(vec2(_Value, _Value));
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlat2.xy = u_xlat0.xy / vec2(vec2(_Value, _Value));
					    u_xlat0.x = vs_TEXCOORD0.x * _Value + (-u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + -0.5;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat2.xy).xyz;
					    u_xlat16_2 = u_xlat10_2.y + u_xlat10_2.x;
					    u_xlat16_2 = u_xlat10_2.z + u_xlat16_2;
					    u_xlat2.x = _TimeX * _Value2 + u_xlat16_2;
					    u_xlat4 = floor(u_xlat2.x);
					    u_xlat2.x = (-u_xlat4) + u_xlat2.x;
					    u_xlat2.x = (-u_xlat2.x) + 1.0;
					    u_xlat2.x = u_xlat2.x * 3.0 + -1.79999995;
					    u_xlat2.x = max(u_xlat2.x, 0.100000001);
					    u_xlat2.x = min(u_xlat2.x, 2.0);
					    u_xlat1.x = (-_Value3);
					    u_xlat1.y = (-_Value4);
					    u_xlat0.xz = u_xlat0.xx * u_xlat0.xx + u_xlat1.xy;
					    u_xlat0.x = dot(u_xlat0.xz, u_xlat0.xz);
					    u_xlat0.x = u_xlat0.x * 12.0;
					    u_xlat0.x = min(u_xlat0.x, 1.0);
					    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
					    u_xlat0.x = u_xlat0.x * u_xlat2.x;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0 = u_xlat0.xxxx * vec4(0.699999988, 1.60000002, 2.79999995, 1.0) + u_xlat10_1;
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