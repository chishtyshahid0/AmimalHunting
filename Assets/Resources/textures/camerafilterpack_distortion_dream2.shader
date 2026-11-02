Shader "CameraFilterPack/Distortion_Dream2" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 100)) = 10
		_Distortion ("_Speed", Range(0, 30)) = 5
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 59313
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
					uniform highp float _Distortion;
					uniform highp float _Speed;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec2 uv_1;
					  uv_1 = xlv_TEXCOORD0;
					  highp float time_2;
					  time_2 = (_Speed * _TimeX);
					  highp float tmpvar_3;
					  tmpvar_3 = (1.0 + (0.5 * sin(
					    (time_2 + (uv_1.x * _Distortion))
					  )));
					  highp float tmpvar_4;
					  tmpvar_4 = (1.0 + (0.5 * cos(
					    (time_2 + (uv_1.y * _Distortion))
					  )));
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = (tmpvar_3 + sin(tmpvar_4));
					  tmpvar_5.y = (tmpvar_4 + cos(tmpvar_3));
					  uv_1 = (uv_1 + (0.02 * tmpvar_5));
					  highp vec2 P_6;
					  P_6 = (uv_1 * 0.9);
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = texture2D (_MainTex, P_6);
					  gl_FragData[0] = tmpvar_7;
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
					uniform highp float _Distortion;
					uniform highp float _Speed;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec2 uv_1;
					  uv_1 = xlv_TEXCOORD0;
					  highp float time_2;
					  time_2 = (_Speed * _TimeX);
					  highp float tmpvar_3;
					  tmpvar_3 = (1.0 + (0.5 * sin(
					    (time_2 + (uv_1.x * _Distortion))
					  )));
					  highp float tmpvar_4;
					  tmpvar_4 = (1.0 + (0.5 * cos(
					    (time_2 + (uv_1.y * _Distortion))
					  )));
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = (tmpvar_3 + sin(tmpvar_4));
					  tmpvar_5.y = (tmpvar_4 + cos(tmpvar_3));
					  uv_1 = (uv_1 + (0.02 * tmpvar_5));
					  highp vec2 P_6;
					  P_6 = (uv_1 * 0.9);
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = texture2D (_MainTex, P_6);
					  gl_FragData[0] = tmpvar_7;
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
					uniform highp float _Distortion;
					uniform highp float _Speed;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec2 uv_1;
					  uv_1 = xlv_TEXCOORD0;
					  highp float time_2;
					  time_2 = (_Speed * _TimeX);
					  highp float tmpvar_3;
					  tmpvar_3 = (1.0 + (0.5 * sin(
					    (time_2 + (uv_1.x * _Distortion))
					  )));
					  highp float tmpvar_4;
					  tmpvar_4 = (1.0 + (0.5 * cos(
					    (time_2 + (uv_1.y * _Distortion))
					  )));
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = (tmpvar_3 + sin(tmpvar_4));
					  tmpvar_5.y = (tmpvar_4 + cos(tmpvar_3));
					  uv_1 = (uv_1 + (0.02 * tmpvar_5));
					  highp vec2 P_6;
					  P_6 = (uv_1 * 0.9);
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = texture2D (_MainTex, P_6);
					  gl_FragData[0] = tmpvar_7;
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
					uniform 	float _Distortion;
					uniform 	float _Speed;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec2 u_xlat0;
					lowp vec4 u_xlat10_0;
					vec2 u_xlat1;
					float u_xlat2;
					float u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(vec2(_Distortion, _Distortion));
					    u_xlat0.xy = vec2(vec2(_Speed, _Speed)) * vec2(_TimeX) + u_xlat0.xy;
					    u_xlat2 = cos(u_xlat0.y);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.5 + 1.0;
					    u_xlat2 = u_xlat2 * 0.5 + 1.0;
					    u_xlat4 = sin(u_xlat2);
					    u_xlat1.x = u_xlat4 + u_xlat0.x;
					    u_xlat0.x = cos(u_xlat0.x);
					    u_xlat1.y = u_xlat0.x + u_xlat2;
					    u_xlat0.xy = u_xlat1.xy * vec2(0.0199999996, 0.0199999996) + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.899999976, 0.899999976);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    SV_Target0 = u_xlat10_0;
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
					uniform 	float _Distortion;
					uniform 	float _Speed;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec2 u_xlat0;
					lowp vec4 u_xlat10_0;
					vec2 u_xlat1;
					float u_xlat2;
					float u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(vec2(_Distortion, _Distortion));
					    u_xlat0.xy = vec2(vec2(_Speed, _Speed)) * vec2(_TimeX) + u_xlat0.xy;
					    u_xlat2 = cos(u_xlat0.y);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.5 + 1.0;
					    u_xlat2 = u_xlat2 * 0.5 + 1.0;
					    u_xlat4 = sin(u_xlat2);
					    u_xlat1.x = u_xlat4 + u_xlat0.x;
					    u_xlat0.x = cos(u_xlat0.x);
					    u_xlat1.y = u_xlat0.x + u_xlat2;
					    u_xlat0.xy = u_xlat1.xy * vec2(0.0199999996, 0.0199999996) + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.899999976, 0.899999976);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    SV_Target0 = u_xlat10_0;
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
					uniform 	float _Distortion;
					uniform 	float _Speed;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec2 u_xlat0;
					lowp vec4 u_xlat10_0;
					vec2 u_xlat1;
					float u_xlat2;
					float u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(vec2(_Distortion, _Distortion));
					    u_xlat0.xy = vec2(vec2(_Speed, _Speed)) * vec2(_TimeX) + u_xlat0.xy;
					    u_xlat2 = cos(u_xlat0.y);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.5 + 1.0;
					    u_xlat2 = u_xlat2 * 0.5 + 1.0;
					    u_xlat4 = sin(u_xlat2);
					    u_xlat1.x = u_xlat4 + u_xlat0.x;
					    u_xlat0.x = cos(u_xlat0.x);
					    u_xlat1.y = u_xlat0.x + u_xlat2;
					    u_xlat0.xy = u_xlat1.xy * vec2(0.0199999996, 0.0199999996) + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.899999976, 0.899999976);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    SV_Target0 = u_xlat10_0;
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