Shader "CameraFilterPack/Distortion_Dream" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(1, 10)) = 1
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 8967
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 pixel_1;
					  highp vec4 pixel2_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  highp float tmpvar_4;
					  tmpvar_4 = (_TimeX * 0.75);
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = sin(tmpvar_4);
					  tmpvar_5.y = cos(tmpvar_4);
					  lowp vec4 tmpvar_6;
					  highp vec2 P_7;
					  P_7 = (((uv_3 + tmpvar_5) * 0.15) * _Distortion);
					  tmpvar_6 = texture2D (_MainTex, P_7);
					  pixel2_2 = tmpvar_6;
					  highp vec2 tmpvar_8;
					  tmpvar_8.x = (pixel2_2.x * 0.05);
					  tmpvar_8.y = 0.0;
					  lowp vec4 tmpvar_9;
					  highp vec2 P_10;
					  P_10 = (uv_3 + tmpvar_8);
					  tmpvar_9 = texture2D (_MainTex, P_10);
					  pixel_1 = tmpvar_9;
					  gl_FragData[0] = pixel_1;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 pixel_1;
					  highp vec4 pixel2_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  highp float tmpvar_4;
					  tmpvar_4 = (_TimeX * 0.75);
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = sin(tmpvar_4);
					  tmpvar_5.y = cos(tmpvar_4);
					  lowp vec4 tmpvar_6;
					  highp vec2 P_7;
					  P_7 = (((uv_3 + tmpvar_5) * 0.15) * _Distortion);
					  tmpvar_6 = texture2D (_MainTex, P_7);
					  pixel2_2 = tmpvar_6;
					  highp vec2 tmpvar_8;
					  tmpvar_8.x = (pixel2_2.x * 0.05);
					  tmpvar_8.y = 0.0;
					  lowp vec4 tmpvar_9;
					  highp vec2 P_10;
					  P_10 = (uv_3 + tmpvar_8);
					  tmpvar_9 = texture2D (_MainTex, P_10);
					  pixel_1 = tmpvar_9;
					  gl_FragData[0] = pixel_1;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 pixel_1;
					  highp vec4 pixel2_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  highp float tmpvar_4;
					  tmpvar_4 = (_TimeX * 0.75);
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = sin(tmpvar_4);
					  tmpvar_5.y = cos(tmpvar_4);
					  lowp vec4 tmpvar_6;
					  highp vec2 P_7;
					  P_7 = (((uv_3 + tmpvar_5) * 0.15) * _Distortion);
					  tmpvar_6 = texture2D (_MainTex, P_7);
					  pixel2_2 = tmpvar_6;
					  highp vec2 tmpvar_8;
					  tmpvar_8.x = (pixel2_2.x * 0.05);
					  tmpvar_8.y = 0.0;
					  lowp vec4 tmpvar_9;
					  highp vec2 P_10;
					  P_10 = (uv_3 + tmpvar_8);
					  tmpvar_9 = texture2D (_MainTex, P_10);
					  pixel_1 = tmpvar_9;
					  gl_FragData[0] = pixel_1;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					lowp float u_xlat10_0;
					float u_xlat1;
					void main()
					{
					    u_xlat0.x = _TimeX * 0.75;
					    u_xlat1 = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.y = u_xlat1;
					    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Distortion, _Distortion));
					    u_xlat0.xy = u_xlat0.xy * vec2(0.150000006, 0.150000006);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy).x;
					    u_xlat0.x = u_xlat10_0 * 0.0500000007;
					    u_xlat0.y = 0.0;
					    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
					    SV_Target0 = texture(_MainTex, u_xlat0.xy);
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					lowp float u_xlat10_0;
					float u_xlat1;
					void main()
					{
					    u_xlat0.x = _TimeX * 0.75;
					    u_xlat1 = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.y = u_xlat1;
					    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Distortion, _Distortion));
					    u_xlat0.xy = u_xlat0.xy * vec2(0.150000006, 0.150000006);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy).x;
					    u_xlat0.x = u_xlat10_0 * 0.0500000007;
					    u_xlat0.y = 0.0;
					    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
					    SV_Target0 = texture(_MainTex, u_xlat0.xy);
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					lowp float u_xlat10_0;
					float u_xlat1;
					void main()
					{
					    u_xlat0.x = _TimeX * 0.75;
					    u_xlat1 = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.y = u_xlat1;
					    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Distortion, _Distortion));
					    u_xlat0.xy = u_xlat0.xy * vec2(0.150000006, 0.150000006);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy).x;
					    u_xlat0.x = u_xlat10_0 * 0.0500000007;
					    u_xlat0.y = 0.0;
					    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
					    SV_Target0 = texture(_MainTex, u_xlat0.xy);
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