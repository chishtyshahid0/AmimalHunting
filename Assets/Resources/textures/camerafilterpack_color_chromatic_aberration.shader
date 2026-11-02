Shader "CameraFilterPack/Color_Chromatic_Aberration" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(-0.02, 0.02)) = 0.02
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 16762
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
					uniform highp float _Distortion;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec4 col_1;
					  highp vec2 p_2;
					  p_2 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, p_2);
					  col_1.yw = tmpvar_3.yw;
					  highp vec2 tmpvar_4;
					  tmpvar_4.y = 0.0;
					  tmpvar_4.x = _Distortion;
					  lowp vec4 tmpvar_5;
					  highp vec2 P_6;
					  P_6 = (p_2 + tmpvar_4);
					  tmpvar_5 = texture2D (_MainTex, P_6);
					  col_1.x = tmpvar_5.x;
					  lowp vec4 tmpvar_7;
					  highp vec2 P_8;
					  P_8 = (p_2 + tmpvar_4.yx);
					  tmpvar_7 = texture2D (_MainTex, P_8);
					  col_1.z = tmpvar_7.z;
					  gl_FragData[0] = col_1;
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
					uniform highp float _Distortion;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec4 col_1;
					  highp vec2 p_2;
					  p_2 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, p_2);
					  col_1.yw = tmpvar_3.yw;
					  highp vec2 tmpvar_4;
					  tmpvar_4.y = 0.0;
					  tmpvar_4.x = _Distortion;
					  lowp vec4 tmpvar_5;
					  highp vec2 P_6;
					  P_6 = (p_2 + tmpvar_4);
					  tmpvar_5 = texture2D (_MainTex, P_6);
					  col_1.x = tmpvar_5.x;
					  lowp vec4 tmpvar_7;
					  highp vec2 P_8;
					  P_8 = (p_2 + tmpvar_4.yx);
					  tmpvar_7 = texture2D (_MainTex, P_8);
					  col_1.z = tmpvar_7.z;
					  gl_FragData[0] = col_1;
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
					uniform highp float _Distortion;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec4 col_1;
					  highp vec2 p_2;
					  p_2 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, p_2);
					  col_1.yw = tmpvar_3.yw;
					  highp vec2 tmpvar_4;
					  tmpvar_4.y = 0.0;
					  tmpvar_4.x = _Distortion;
					  lowp vec4 tmpvar_5;
					  highp vec2 P_6;
					  P_6 = (p_2 + tmpvar_4);
					  tmpvar_5 = texture2D (_MainTex, P_6);
					  col_1.x = tmpvar_5.x;
					  lowp vec4 tmpvar_7;
					  highp vec2 P_8;
					  P_8 = (p_2 + tmpvar_4.yx);
					  tmpvar_7 = texture2D (_MainTex, P_8);
					  col_1.z = tmpvar_7.z;
					  gl_FragData[0] = col_1;
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
					uniform 	float _Distortion;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0.y = _Distortion;
					    u_xlat0.x = 0.0;
					    u_xlat0 = u_xlat0.yxxy + vs_TEXCOORD0.xyxy;
					    u_xlat1.x = texture(_MainTex, u_xlat0.xy).x;
					    u_xlat1.z = texture(_MainTex, u_xlat0.zw).z;
					    u_xlat1.yw = texture(_MainTex, vs_TEXCOORD0.xy).yw;
					    SV_Target0 = u_xlat1;
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
					uniform 	float _Distortion;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0.y = _Distortion;
					    u_xlat0.x = 0.0;
					    u_xlat0 = u_xlat0.yxxy + vs_TEXCOORD0.xyxy;
					    u_xlat1.x = texture(_MainTex, u_xlat0.xy).x;
					    u_xlat1.z = texture(_MainTex, u_xlat0.zw).z;
					    u_xlat1.yw = texture(_MainTex, vs_TEXCOORD0.xy).yw;
					    SV_Target0 = u_xlat1;
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
					uniform 	float _Distortion;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0.y = _Distortion;
					    u_xlat0.x = 0.0;
					    u_xlat0 = u_xlat0.yxxy + vs_TEXCOORD0.xyxy;
					    u_xlat1.x = texture(_MainTex, u_xlat0.xy).x;
					    u_xlat1.z = texture(_MainTex, u_xlat0.zw).z;
					    u_xlat1.yw = texture(_MainTex, vs_TEXCOORD0.xy).yw;
					    SV_Target0 = u_xlat1;
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