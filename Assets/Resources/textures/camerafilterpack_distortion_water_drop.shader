Shader "CameraFilterPack/Distortion_Water_Drop" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_CenterX ("_CenterX", Range(-1, 1)) = 0
		_CenterY ("_CenterY", Range(-1, 1)) = 0
		_WaveIntensity ("_WaveIntensity", Range(0, 10)) = 0
		_NumberOfWaves ("_NumberOfWaves", Range(0, 10)) = 0
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 58145
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
					uniform highp float _CenterX;
					uniform highp float _CenterY;
					uniform highp float _WaveIntensity;
					uniform highp int _NumberOfWaves;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec2 tmpvar_2;
					  tmpvar_2.x = (0.5 + (_CenterX * 0.5));
					  tmpvar_2.y = (0.5 - (_CenterY * 0.5));
					  highp vec2 tmpvar_3;
					  tmpvar_3 = (xlv_TEXCOORD0 - tmpvar_2);
					  highp float tmpvar_4;
					  tmpvar_4 = sqrt(dot (tmpvar_3, tmpvar_3));
					  highp float wave_5;
					  wave_5 = ((sin(
					    (((8.0 * float(
					      (3 + _NumberOfWaves)
					    )) * tmpvar_4) + (-(_TimeX) * 5.0))
					  ) + 1.0) * 0.5);
					  wave_5 = (wave_5 - 0.3);
					  wave_5 = (wave_5 * (wave_5 * wave_5));
					  lowp vec4 tmpvar_6;
					  highp vec2 P_7;
					  P_7 = (xlv_TEXCOORD0 + ((
					    -(normalize(tmpvar_3))
					   * 
					    ((wave_5 * _WaveIntensity) / 3.0)
					  ) / (1.0 + 
					    (5.0 * tmpvar_4)
					  )));
					  tmpvar_6 = texture2D (_MainTex, P_7);
					  tmpvar_1 = tmpvar_6;
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
					uniform highp float _CenterX;
					uniform highp float _CenterY;
					uniform highp float _WaveIntensity;
					uniform highp int _NumberOfWaves;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec2 tmpvar_2;
					  tmpvar_2.x = (0.5 + (_CenterX * 0.5));
					  tmpvar_2.y = (0.5 - (_CenterY * 0.5));
					  highp vec2 tmpvar_3;
					  tmpvar_3 = (xlv_TEXCOORD0 - tmpvar_2);
					  highp float tmpvar_4;
					  tmpvar_4 = sqrt(dot (tmpvar_3, tmpvar_3));
					  highp float wave_5;
					  wave_5 = ((sin(
					    (((8.0 * float(
					      (3 + _NumberOfWaves)
					    )) * tmpvar_4) + (-(_TimeX) * 5.0))
					  ) + 1.0) * 0.5);
					  wave_5 = (wave_5 - 0.3);
					  wave_5 = (wave_5 * (wave_5 * wave_5));
					  lowp vec4 tmpvar_6;
					  highp vec2 P_7;
					  P_7 = (xlv_TEXCOORD0 + ((
					    -(normalize(tmpvar_3))
					   * 
					    ((wave_5 * _WaveIntensity) / 3.0)
					  ) / (1.0 + 
					    (5.0 * tmpvar_4)
					  )));
					  tmpvar_6 = texture2D (_MainTex, P_7);
					  tmpvar_1 = tmpvar_6;
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
					uniform highp float _CenterX;
					uniform highp float _CenterY;
					uniform highp float _WaveIntensity;
					uniform highp int _NumberOfWaves;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec2 tmpvar_2;
					  tmpvar_2.x = (0.5 + (_CenterX * 0.5));
					  tmpvar_2.y = (0.5 - (_CenterY * 0.5));
					  highp vec2 tmpvar_3;
					  tmpvar_3 = (xlv_TEXCOORD0 - tmpvar_2);
					  highp float tmpvar_4;
					  tmpvar_4 = sqrt(dot (tmpvar_3, tmpvar_3));
					  highp float wave_5;
					  wave_5 = ((sin(
					    (((8.0 * float(
					      (3 + _NumberOfWaves)
					    )) * tmpvar_4) + (-(_TimeX) * 5.0))
					  ) + 1.0) * 0.5);
					  wave_5 = (wave_5 - 0.3);
					  wave_5 = (wave_5 * (wave_5 * wave_5));
					  lowp vec4 tmpvar_6;
					  highp vec2 P_7;
					  P_7 = (xlv_TEXCOORD0 + ((
					    -(normalize(tmpvar_3))
					   * 
					    ((wave_5 * _WaveIntensity) / 3.0)
					  ) / (1.0 + 
					    (5.0 * tmpvar_4)
					  )));
					  tmpvar_6 = texture2D (_MainTex, P_7);
					  tmpvar_1 = tmpvar_6;
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
					uniform 	float _CenterX;
					uniform 	float _CenterY;
					uniform 	float _WaveIntensity;
					uniform 	int _NumberOfWaves;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					int u_xlati0;
					vec2 u_xlat1;
					vec2 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlati0 = _NumberOfWaves + 3;
					    u_xlat0.x = float(u_xlati0);
					    u_xlat2.x = _CenterX * 0.5 + 0.5;
					    u_xlat1.x = (-u_xlat2.x);
					    u_xlat2.x = (-_CenterY) * 0.5 + 0.5;
					    u_xlat1.y = (-u_xlat2.x);
					    u_xlat2.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
					    u_xlat6 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat1.x = sqrt(u_xlat6);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat2.xy = vec2(u_xlat6) * u_xlat2.xy;
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat6 = u_xlat1.x * 5.0 + 1.0;
					    u_xlat1.x = _TimeX * -5.0;
					    u_xlat0.x = u_xlat0.x * 8.0 + u_xlat1.x;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + 1.0;
					    u_xlat0.x = u_xlat0.x * 0.5 + -0.300000012;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * _WaveIntensity;
					    u_xlat0.x = u_xlat0.x * 0.333333343;
					    u_xlat0.xy = u_xlat0.xx * (-u_xlat2.xy);
					    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat6);
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
					uniform 	float _CenterX;
					uniform 	float _CenterY;
					uniform 	float _WaveIntensity;
					uniform 	int _NumberOfWaves;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					int u_xlati0;
					vec2 u_xlat1;
					vec2 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlati0 = _NumberOfWaves + 3;
					    u_xlat0.x = float(u_xlati0);
					    u_xlat2.x = _CenterX * 0.5 + 0.5;
					    u_xlat1.x = (-u_xlat2.x);
					    u_xlat2.x = (-_CenterY) * 0.5 + 0.5;
					    u_xlat1.y = (-u_xlat2.x);
					    u_xlat2.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
					    u_xlat6 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat1.x = sqrt(u_xlat6);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat2.xy = vec2(u_xlat6) * u_xlat2.xy;
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat6 = u_xlat1.x * 5.0 + 1.0;
					    u_xlat1.x = _TimeX * -5.0;
					    u_xlat0.x = u_xlat0.x * 8.0 + u_xlat1.x;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + 1.0;
					    u_xlat0.x = u_xlat0.x * 0.5 + -0.300000012;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * _WaveIntensity;
					    u_xlat0.x = u_xlat0.x * 0.333333343;
					    u_xlat0.xy = u_xlat0.xx * (-u_xlat2.xy);
					    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat6);
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
					uniform 	float _CenterX;
					uniform 	float _CenterY;
					uniform 	float _WaveIntensity;
					uniform 	int _NumberOfWaves;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					int u_xlati0;
					vec2 u_xlat1;
					vec2 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlati0 = _NumberOfWaves + 3;
					    u_xlat0.x = float(u_xlati0);
					    u_xlat2.x = _CenterX * 0.5 + 0.5;
					    u_xlat1.x = (-u_xlat2.x);
					    u_xlat2.x = (-_CenterY) * 0.5 + 0.5;
					    u_xlat1.y = (-u_xlat2.x);
					    u_xlat2.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
					    u_xlat6 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat1.x = sqrt(u_xlat6);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat2.xy = vec2(u_xlat6) * u_xlat2.xy;
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat6 = u_xlat1.x * 5.0 + 1.0;
					    u_xlat1.x = _TimeX * -5.0;
					    u_xlat0.x = u_xlat0.x * 8.0 + u_xlat1.x;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + 1.0;
					    u_xlat0.x = u_xlat0.x * 0.5 + -0.300000012;
					    u_xlat1.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * _WaveIntensity;
					    u_xlat0.x = u_xlat0.x * 0.333333343;
					    u_xlat0.xy = u_xlat0.xx * (-u_xlat2.xy);
					    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat6);
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