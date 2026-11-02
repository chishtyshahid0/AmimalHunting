Shader "CameraFilterPack/FX_Psycho" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 1
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 38523
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
					  highp vec4 x_1;
					  highp vec4 tx_2;
					  highp vec2 xy_3;
					  xy_3 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xy_3);
					  tx_2 = tmpvar_4;
					  highp vec4 x_5;
					  x_5 = (tx_2 + (_TimeX * 0.5));
					  x_1 = (floor((
					    (x_5 - floor(x_5))
					   * 8.0)) * _Distortion);
					  highp vec4 tmpvar_6;
					  tmpvar_6 = (x_1 - (floor(
					    (x_1 * vec4(0.5, 0.5, 0.5, 0.5))
					  ) * vec4(2.0, 2.0, 2.0, 2.0)));
					  x_1 = tmpvar_6;
					  highp vec4 tmpvar_7;
					  tmpvar_7.xyz = tmpvar_6.xyz;
					  tmpvar_7.w = tx_2.w;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 x_1;
					  highp vec4 tx_2;
					  highp vec2 xy_3;
					  xy_3 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xy_3);
					  tx_2 = tmpvar_4;
					  highp vec4 x_5;
					  x_5 = (tx_2 + (_TimeX * 0.5));
					  x_1 = (floor((
					    (x_5 - floor(x_5))
					   * 8.0)) * _Distortion);
					  highp vec4 tmpvar_6;
					  tmpvar_6 = (x_1 - (floor(
					    (x_1 * vec4(0.5, 0.5, 0.5, 0.5))
					  ) * vec4(2.0, 2.0, 2.0, 2.0)));
					  x_1 = tmpvar_6;
					  highp vec4 tmpvar_7;
					  tmpvar_7.xyz = tmpvar_6.xyz;
					  tmpvar_7.w = tx_2.w;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 x_1;
					  highp vec4 tx_2;
					  highp vec2 xy_3;
					  xy_3 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xy_3);
					  tx_2 = tmpvar_4;
					  highp vec4 x_5;
					  x_5 = (tx_2 + (_TimeX * 0.5));
					  x_1 = (floor((
					    (x_5 - floor(x_5))
					   * 8.0)) * _Distortion);
					  highp vec4 tmpvar_6;
					  tmpvar_6 = (x_1 - (floor(
					    (x_1 * vec4(0.5, 0.5, 0.5, 0.5))
					  ) * vec4(2.0, 2.0, 2.0, 2.0)));
					  x_1 = tmpvar_6;
					  highp vec4 tmpvar_7;
					  tmpvar_7.xyz = tmpvar_6.xyz;
					  tmpvar_7.w = tx_2.w;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					vec3 u_xlat1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.xyz = vec3(_TimeX) * vec3(0.5, 0.5, 0.5) + u_xlat10_0.xyz;
					    SV_Target0.w = u_xlat10_0.w;
					    u_xlat1.xyz = floor(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(8.0, 8.0, 8.0);
					    u_xlat0.xyz = floor(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Distortion, _Distortion, _Distortion));
					    u_xlat1.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat1.xyz = floor(u_xlat1.xyz);
					    SV_Target0.xyz = (-u_xlat1.xyz) * vec3(2.0, 2.0, 2.0) + u_xlat0.xyz;
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
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					vec3 u_xlat1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.xyz = vec3(_TimeX) * vec3(0.5, 0.5, 0.5) + u_xlat10_0.xyz;
					    SV_Target0.w = u_xlat10_0.w;
					    u_xlat1.xyz = floor(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(8.0, 8.0, 8.0);
					    u_xlat0.xyz = floor(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Distortion, _Distortion, _Distortion));
					    u_xlat1.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat1.xyz = floor(u_xlat1.xyz);
					    SV_Target0.xyz = (-u_xlat1.xyz) * vec3(2.0, 2.0, 2.0) + u_xlat0.xyz;
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
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					vec3 u_xlat1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.xyz = vec3(_TimeX) * vec3(0.5, 0.5, 0.5) + u_xlat10_0.xyz;
					    SV_Target0.w = u_xlat10_0.w;
					    u_xlat1.xyz = floor(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(8.0, 8.0, 8.0);
					    u_xlat0.xyz = floor(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Distortion, _Distortion, _Distortion));
					    u_xlat1.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat1.xyz = floor(u_xlat1.xyz);
					    SV_Target0.xyz = (-u_xlat1.xyz) * vec3(2.0, 2.0, 2.0) + u_xlat0.xyz;
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