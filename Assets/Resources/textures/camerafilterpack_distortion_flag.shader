Shader "CameraFilterPack/Distortion_Flag" {
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
			GpuProgramID 58864
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
					  highp vec4 tmpvar_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_3;
					  tmpvar_3.x = ((_Distortion * (
					    ((0.0266 * sin((
					      (uv_2.y + _TimeX)
					     * 4.0))) + (0.003 * sin((
					      (uv_2.y + _TimeX)
					     * 8.0))))
					   + 
					    (0.0025 * sin(((uv_2.y + _TimeX) * 40.0)))
					  )) + 0.11);
					  tmpvar_3.y = ((_Distortion * (
					    ((0.05 * sin((
					      (uv_2.y + _TimeX)
					     * 5.0))) + (0.01 * sin((
					      (uv_2.x + _TimeX)
					     * 10.0))))
					   + 
					    (0.004 * sin(((uv_2.x + _TimeX) * 30.0)))
					  )) + 0.11);
					  lowp vec4 tmpvar_4;
					  highp vec2 P_5;
					  P_5 = (0.79 * (uv_2 + tmpvar_3));
					  tmpvar_4 = texture2D (_MainTex, P_5);
					  tmpvar_1 = tmpvar_4;
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
					uniform highp float _TimeX;
					uniform highp float _Distortion;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_3;
					  tmpvar_3.x = ((_Distortion * (
					    ((0.0266 * sin((
					      (uv_2.y + _TimeX)
					     * 4.0))) + (0.003 * sin((
					      (uv_2.y + _TimeX)
					     * 8.0))))
					   + 
					    (0.0025 * sin(((uv_2.y + _TimeX) * 40.0)))
					  )) + 0.11);
					  tmpvar_3.y = ((_Distortion * (
					    ((0.05 * sin((
					      (uv_2.y + _TimeX)
					     * 5.0))) + (0.01 * sin((
					      (uv_2.x + _TimeX)
					     * 10.0))))
					   + 
					    (0.004 * sin(((uv_2.x + _TimeX) * 30.0)))
					  )) + 0.11);
					  lowp vec4 tmpvar_4;
					  highp vec2 P_5;
					  P_5 = (0.79 * (uv_2 + tmpvar_3));
					  tmpvar_4 = texture2D (_MainTex, P_5);
					  tmpvar_1 = tmpvar_4;
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
					uniform highp float _TimeX;
					uniform highp float _Distortion;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_3;
					  tmpvar_3.x = ((_Distortion * (
					    ((0.0266 * sin((
					      (uv_2.y + _TimeX)
					     * 4.0))) + (0.003 * sin((
					      (uv_2.y + _TimeX)
					     * 8.0))))
					   + 
					    (0.0025 * sin(((uv_2.y + _TimeX) * 40.0)))
					  )) + 0.11);
					  tmpvar_3.y = ((_Distortion * (
					    ((0.05 * sin((
					      (uv_2.y + _TimeX)
					     * 5.0))) + (0.01 * sin((
					      (uv_2.x + _TimeX)
					     * 10.0))))
					   + 
					    (0.004 * sin(((uv_2.x + _TimeX) * 30.0)))
					  )) + 0.11);
					  lowp vec4 tmpvar_4;
					  highp vec2 P_5;
					  P_5 = (0.79 * (uv_2 + tmpvar_3));
					  tmpvar_4 = texture2D (_MainTex, P_5);
					  tmpvar_1 = tmpvar_4;
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
					uniform 	float _Distortion;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.yx + vec2(_TimeX);
					    u_xlat2.xy = u_xlat0.yy * vec2(10.0, 30.0);
					    u_xlat1 = u_xlat0.xxxx * vec4(4.0, 8.0, 40.0, 5.0);
					    u_xlat1 = sin(u_xlat1);
					    u_xlat0.xy = sin(u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * 0.0100000007;
					    u_xlat0.x = u_xlat1.w * 0.0500000007 + u_xlat0.x;
					    u_xlat0.x = u_xlat0.y * 0.00400000019 + u_xlat0.x;
					    u_xlat0.y = _Distortion * u_xlat0.x + 0.109999999;
					    u_xlat4.xy = u_xlat1.xy * vec2(0.0265999995, 0.00300000003);
					    u_xlat4.x = u_xlat4.y + u_xlat4.x;
					    u_xlat4.x = u_xlat1.z * 0.00250000018 + u_xlat4.x;
					    u_xlat0.x = _Distortion * u_xlat4.x + 0.109999999;
					    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.790000021, 0.790000021);
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
					vec4 u_xlat1;
					vec2 u_xlat2;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.yx + vec2(_TimeX);
					    u_xlat2.xy = u_xlat0.yy * vec2(10.0, 30.0);
					    u_xlat1 = u_xlat0.xxxx * vec4(4.0, 8.0, 40.0, 5.0);
					    u_xlat1 = sin(u_xlat1);
					    u_xlat0.xy = sin(u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * 0.0100000007;
					    u_xlat0.x = u_xlat1.w * 0.0500000007 + u_xlat0.x;
					    u_xlat0.x = u_xlat0.y * 0.00400000019 + u_xlat0.x;
					    u_xlat0.y = _Distortion * u_xlat0.x + 0.109999999;
					    u_xlat4.xy = u_xlat1.xy * vec2(0.0265999995, 0.00300000003);
					    u_xlat4.x = u_xlat4.y + u_xlat4.x;
					    u_xlat4.x = u_xlat1.z * 0.00250000018 + u_xlat4.x;
					    u_xlat0.x = _Distortion * u_xlat4.x + 0.109999999;
					    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.790000021, 0.790000021);
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
					vec4 u_xlat1;
					vec2 u_xlat2;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.yx + vec2(_TimeX);
					    u_xlat2.xy = u_xlat0.yy * vec2(10.0, 30.0);
					    u_xlat1 = u_xlat0.xxxx * vec4(4.0, 8.0, 40.0, 5.0);
					    u_xlat1 = sin(u_xlat1);
					    u_xlat0.xy = sin(u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * 0.0100000007;
					    u_xlat0.x = u_xlat1.w * 0.0500000007 + u_xlat0.x;
					    u_xlat0.x = u_xlat0.y * 0.00400000019 + u_xlat0.x;
					    u_xlat0.y = _Distortion * u_xlat0.x + 0.109999999;
					    u_xlat4.xy = u_xlat1.xy * vec2(0.0265999995, 0.00300000003);
					    u_xlat4.x = u_xlat4.y + u_xlat4.x;
					    u_xlat4.x = u_xlat1.z * 0.00250000018 + u_xlat4.x;
					    u_xlat0.x = _Distortion * u_xlat4.x + 0.109999999;
					    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.790000021, 0.790000021);
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