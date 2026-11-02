Shader "CameraFilterPack/TV_Chromatical2" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 32379
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 col_1;
					  highp vec3 aberration_2;
					  highp vec2 q_3;
					  q_3 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_4;
					  tmpvar_4 = (0.5 + ((q_3 - 0.5) * (0.9 + 
					    (0.1 * sin((0.2 * _TimeX)))
					  )));
					  aberration_2 = (vec3(0.019, 0.0, -0.019) * (abs(
					    (tmpvar_4.x - 0.5)
					  ) * _Value));
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = (tmpvar_4.x + aberration_2.x);
					  tmpvar_5.y = tmpvar_4.y;
					  lowp vec4 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex, tmpvar_5);
					  col_1.x = tmpvar_6.x;
					  highp vec2 tmpvar_7;
					  tmpvar_7.x = (tmpvar_4.x + aberration_2.y);
					  tmpvar_7.y = tmpvar_4.y;
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, tmpvar_7);
					  col_1.y = tmpvar_8.y;
					  highp vec2 tmpvar_9;
					  tmpvar_9.x = (tmpvar_4.x + aberration_2.z);
					  tmpvar_9.y = tmpvar_4.y;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, tmpvar_9);
					  col_1.z = tmpvar_10.z;
					  highp vec4 tmpvar_11;
					  tmpvar_11.w = 1.0;
					  tmpvar_11.xyz = col_1;
					  gl_FragData[0] = tmpvar_11;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 col_1;
					  highp vec3 aberration_2;
					  highp vec2 q_3;
					  q_3 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_4;
					  tmpvar_4 = (0.5 + ((q_3 - 0.5) * (0.9 + 
					    (0.1 * sin((0.2 * _TimeX)))
					  )));
					  aberration_2 = (vec3(0.019, 0.0, -0.019) * (abs(
					    (tmpvar_4.x - 0.5)
					  ) * _Value));
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = (tmpvar_4.x + aberration_2.x);
					  tmpvar_5.y = tmpvar_4.y;
					  lowp vec4 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex, tmpvar_5);
					  col_1.x = tmpvar_6.x;
					  highp vec2 tmpvar_7;
					  tmpvar_7.x = (tmpvar_4.x + aberration_2.y);
					  tmpvar_7.y = tmpvar_4.y;
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, tmpvar_7);
					  col_1.y = tmpvar_8.y;
					  highp vec2 tmpvar_9;
					  tmpvar_9.x = (tmpvar_4.x + aberration_2.z);
					  tmpvar_9.y = tmpvar_4.y;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, tmpvar_9);
					  col_1.z = tmpvar_10.z;
					  highp vec4 tmpvar_11;
					  tmpvar_11.w = 1.0;
					  tmpvar_11.xyz = col_1;
					  gl_FragData[0] = tmpvar_11;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 col_1;
					  highp vec3 aberration_2;
					  highp vec2 q_3;
					  q_3 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_4;
					  tmpvar_4 = (0.5 + ((q_3 - 0.5) * (0.9 + 
					    (0.1 * sin((0.2 * _TimeX)))
					  )));
					  aberration_2 = (vec3(0.019, 0.0, -0.019) * (abs(
					    (tmpvar_4.x - 0.5)
					  ) * _Value));
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = (tmpvar_4.x + aberration_2.x);
					  tmpvar_5.y = tmpvar_4.y;
					  lowp vec4 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex, tmpvar_5);
					  col_1.x = tmpvar_6.x;
					  highp vec2 tmpvar_7;
					  tmpvar_7.x = (tmpvar_4.x + aberration_2.y);
					  tmpvar_7.y = tmpvar_4.y;
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, tmpvar_7);
					  col_1.y = tmpvar_8.y;
					  highp vec2 tmpvar_9;
					  tmpvar_9.x = (tmpvar_4.x + aberration_2.z);
					  tmpvar_9.y = tmpvar_4.y;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, tmpvar_9);
					  col_1.z = tmpvar_10.z;
					  highp vec4 tmpvar_11;
					  tmpvar_11.w = 1.0;
					  tmpvar_11.xyz = col_1;
					  gl_FragData[0] = tmpvar_11;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					mediump vec2 u_xlat16_2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = _TimeX * 0.200000003;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.100000001 + 0.899999976;
					    u_xlat16_2.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat6 = u_xlat0.x * u_xlat16_2.x;
					    u_xlat1.zw = u_xlat16_2.xy * u_xlat0.xx + vec2(0.5, 0.5);
					    u_xlat0.x = abs(u_xlat6) * _Value;
					    u_xlat1.xy = u_xlat0.xx * vec2(0.0189999994, -0.0189999994) + u_xlat1.zz;
					    u_xlat0.x = texture(_MainTex, u_xlat1.xw).x;
					    u_xlat0.y = texture(_MainTex, u_xlat1.yw).z;
					    u_xlat0.z = texture(_MainTex, u_xlat1.zw).y;
					    SV_Target0.xyz = u_xlat0.xzy;
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
					uniform 	float _Value;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					mediump vec2 u_xlat16_2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = _TimeX * 0.200000003;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.100000001 + 0.899999976;
					    u_xlat16_2.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat6 = u_xlat0.x * u_xlat16_2.x;
					    u_xlat1.zw = u_xlat16_2.xy * u_xlat0.xx + vec2(0.5, 0.5);
					    u_xlat0.x = abs(u_xlat6) * _Value;
					    u_xlat1.xy = u_xlat0.xx * vec2(0.0189999994, -0.0189999994) + u_xlat1.zz;
					    u_xlat0.x = texture(_MainTex, u_xlat1.xw).x;
					    u_xlat0.y = texture(_MainTex, u_xlat1.yw).z;
					    u_xlat0.z = texture(_MainTex, u_xlat1.zw).y;
					    SV_Target0.xyz = u_xlat0.xzy;
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
					uniform 	float _Value;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					mediump vec2 u_xlat16_2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = _TimeX * 0.200000003;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.100000001 + 0.899999976;
					    u_xlat16_2.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat6 = u_xlat0.x * u_xlat16_2.x;
					    u_xlat1.zw = u_xlat16_2.xy * u_xlat0.xx + vec2(0.5, 0.5);
					    u_xlat0.x = abs(u_xlat6) * _Value;
					    u_xlat1.xy = u_xlat0.xx * vec2(0.0189999994, -0.0189999994) + u_xlat1.zz;
					    u_xlat0.x = texture(_MainTex, u_xlat1.xw).x;
					    u_xlat0.y = texture(_MainTex, u_xlat1.yw).z;
					    u_xlat0.z = texture(_MainTex, u_xlat1.zw).y;
					    SV_Target0.xyz = u_xlat0.xzy;
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