Shader "CameraFilterPack/FX_Dot_Circle" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_Value ("_Value", Range(4, 32)) = 7
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 6661
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
					uniform highp float _Value;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 color_1;
					  highp vec4 texel_2;
					  highp int tmpvar_3;
					  tmpvar_3 = int(_Value);
					  highp float tmpvar_4;
					  tmpvar_4 = (0.375 * float(tmpvar_3));
					  highp vec2 tmpvar_5;
					  highp vec2 tmpvar_6;
					  tmpvar_6 = (xlv_TEXCOORD0 * _ScreenResolution.xy);
					  tmpvar_5 = (floor((tmpvar_6 / 
					    float(tmpvar_3)
					  )) * float(tmpvar_3));
					  highp vec2 tmpvar_7;
					  tmpvar_7 = (tmpvar_5 / _ScreenResolution.xy);
					  highp float tmpvar_8;
					  highp vec2 x_9;
					  x_9 = ((tmpvar_5 + (
					    float(tmpvar_3)
					   / 2.0)) - tmpvar_6);
					  tmpvar_8 = sqrt(dot (x_9, x_9));
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, tmpvar_7);
					  texel_2 = tmpvar_10;
					  color_1 = texel_2;
					  if ((tmpvar_8 > tmpvar_4)) {
					    color_1 = vec4(0.25, 0.25, 0.25, 0.25);
					  };
					  gl_FragData[0] = color_1;
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
					uniform highp float _Value;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 color_1;
					  highp vec4 texel_2;
					  highp int tmpvar_3;
					  tmpvar_3 = int(_Value);
					  highp float tmpvar_4;
					  tmpvar_4 = (0.375 * float(tmpvar_3));
					  highp vec2 tmpvar_5;
					  highp vec2 tmpvar_6;
					  tmpvar_6 = (xlv_TEXCOORD0 * _ScreenResolution.xy);
					  tmpvar_5 = (floor((tmpvar_6 / 
					    float(tmpvar_3)
					  )) * float(tmpvar_3));
					  highp vec2 tmpvar_7;
					  tmpvar_7 = (tmpvar_5 / _ScreenResolution.xy);
					  highp float tmpvar_8;
					  highp vec2 x_9;
					  x_9 = ((tmpvar_5 + (
					    float(tmpvar_3)
					   / 2.0)) - tmpvar_6);
					  tmpvar_8 = sqrt(dot (x_9, x_9));
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, tmpvar_7);
					  texel_2 = tmpvar_10;
					  color_1 = texel_2;
					  if ((tmpvar_8 > tmpvar_4)) {
					    color_1 = vec4(0.25, 0.25, 0.25, 0.25);
					  };
					  gl_FragData[0] = color_1;
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
					uniform highp float _Value;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 color_1;
					  highp vec4 texel_2;
					  highp int tmpvar_3;
					  tmpvar_3 = int(_Value);
					  highp float tmpvar_4;
					  tmpvar_4 = (0.375 * float(tmpvar_3));
					  highp vec2 tmpvar_5;
					  highp vec2 tmpvar_6;
					  tmpvar_6 = (xlv_TEXCOORD0 * _ScreenResolution.xy);
					  tmpvar_5 = (floor((tmpvar_6 / 
					    float(tmpvar_3)
					  )) * float(tmpvar_3));
					  highp vec2 tmpvar_7;
					  tmpvar_7 = (tmpvar_5 / _ScreenResolution.xy);
					  highp float tmpvar_8;
					  highp vec2 x_9;
					  x_9 = ((tmpvar_5 + (
					    float(tmpvar_3)
					   / 2.0)) - tmpvar_6);
					  tmpvar_8 = sqrt(dot (x_9, x_9));
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, tmpvar_7);
					  texel_2 = tmpvar_10;
					  color_1 = texel_2;
					  if ((tmpvar_8 > tmpvar_4)) {
					    color_1 = vec4(0.25, 0.25, 0.25, 0.25);
					  };
					  gl_FragData[0] = color_1;
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
					uniform 	float _Value;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					bool u_xlatb1;
					float u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _ScreenResolution.xy;
					    u_xlat4 = trunc(_Value);
					    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat4);
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlat1.xy = vec2(u_xlat4) * vec2(0.5, 0.375);
					    u_xlat1.xz = u_xlat0.xy * vec2(u_xlat4) + u_xlat1.xx;
					    u_xlat0.xy = vec2(u_xlat4) * u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy / _ScreenResolution.xy;
					    u_xlat0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat1.xz = (-vs_TEXCOORD0.xy) * _ScreenResolution.xy + u_xlat1.xz;
					    u_xlat1.x = dot(u_xlat1.xz, u_xlat1.xz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(u_xlat1.y<u_xlat1.x);
					#else
					    u_xlatb1 = u_xlat1.y<u_xlat1.x;
					#endif
					    SV_Target0 = (bool(u_xlatb1)) ? vec4(0.25, 0.25, 0.25, 0.25) : u_xlat0;
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
					uniform 	float _Value;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					bool u_xlatb1;
					float u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _ScreenResolution.xy;
					    u_xlat4 = trunc(_Value);
					    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat4);
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlat1.xy = vec2(u_xlat4) * vec2(0.5, 0.375);
					    u_xlat1.xz = u_xlat0.xy * vec2(u_xlat4) + u_xlat1.xx;
					    u_xlat0.xy = vec2(u_xlat4) * u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy / _ScreenResolution.xy;
					    u_xlat0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat1.xz = (-vs_TEXCOORD0.xy) * _ScreenResolution.xy + u_xlat1.xz;
					    u_xlat1.x = dot(u_xlat1.xz, u_xlat1.xz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(u_xlat1.y<u_xlat1.x);
					#else
					    u_xlatb1 = u_xlat1.y<u_xlat1.x;
					#endif
					    SV_Target0 = (bool(u_xlatb1)) ? vec4(0.25, 0.25, 0.25, 0.25) : u_xlat0;
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
					uniform 	float _Value;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					bool u_xlatb1;
					float u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _ScreenResolution.xy;
					    u_xlat4 = trunc(_Value);
					    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat4);
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlat1.xy = vec2(u_xlat4) * vec2(0.5, 0.375);
					    u_xlat1.xz = u_xlat0.xy * vec2(u_xlat4) + u_xlat1.xx;
					    u_xlat0.xy = vec2(u_xlat4) * u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy / _ScreenResolution.xy;
					    u_xlat0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat1.xz = (-vs_TEXCOORD0.xy) * _ScreenResolution.xy + u_xlat1.xz;
					    u_xlat1.x = dot(u_xlat1.xz, u_xlat1.xz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(u_xlat1.y<u_xlat1.x);
					#else
					    u_xlatb1 = u_xlat1.y<u_xlat1.x;
					#endif
					    SV_Target0 = (bool(u_xlatb1)) ? vec4(0.25, 0.25, 0.25, 0.25) : u_xlat0;
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