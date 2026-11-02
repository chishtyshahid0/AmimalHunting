Shader "CameraFilterPack/Distortion_BlackHole" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_Distortion2 ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_PositionX ("_PositionX", Range(-1, 1)) = 1.5
		_PositionY ("_PositionY", Range(-1, 1)) = 30
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 57132
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
					uniform highp float _Distortion2;
					uniform highp vec4 _ScreenResolution;
					uniform highp float _PositionX;
					uniform highp float _PositionY;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec2 warp_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_3;
					  tmpvar_3.x = ((0.5 + (_PositionX / 2.0)) * _ScreenResolution.x);
					  tmpvar_3.y = ((0.5 - (_PositionY / 2.0)) * _ScreenResolution.y);
					  highp vec2 tmpvar_4;
					  highp vec2 tmpvar_5;
					  tmpvar_5 = (xlv_TEXCOORD0 * _ScreenResolution.xy);
					  tmpvar_4 = (tmpvar_3 - tmpvar_5);
					  highp vec2 tmpvar_6;
					  tmpvar_6 = (((
					    normalize((tmpvar_3 - tmpvar_5))
					   * 
					    pow (sqrt(dot (tmpvar_4, tmpvar_4)), -2.0)
					  ) * _Distortion2) * _Distortion2);
					  warp_1.x = tmpvar_6.x;
					  warp_1.y = -(tmpvar_6.y);
					  uv_2 = (uv_2 + warp_1);
					  highp vec2 tmpvar_7;
					  tmpvar_7 = (tmpvar_3 - tmpvar_5);
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, uv_2);
					  highp vec4 tmpvar_9;
					  tmpvar_9 = (tmpvar_8 * clamp ((
					    (0.1 * sqrt(dot (tmpvar_7, tmpvar_7)))
					   - _Distortion), 0.0, 1.0));
					  gl_FragData[0] = tmpvar_9;
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
					uniform highp float _Distortion2;
					uniform highp vec4 _ScreenResolution;
					uniform highp float _PositionX;
					uniform highp float _PositionY;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec2 warp_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_3;
					  tmpvar_3.x = ((0.5 + (_PositionX / 2.0)) * _ScreenResolution.x);
					  tmpvar_3.y = ((0.5 - (_PositionY / 2.0)) * _ScreenResolution.y);
					  highp vec2 tmpvar_4;
					  highp vec2 tmpvar_5;
					  tmpvar_5 = (xlv_TEXCOORD0 * _ScreenResolution.xy);
					  tmpvar_4 = (tmpvar_3 - tmpvar_5);
					  highp vec2 tmpvar_6;
					  tmpvar_6 = (((
					    normalize((tmpvar_3 - tmpvar_5))
					   * 
					    pow (sqrt(dot (tmpvar_4, tmpvar_4)), -2.0)
					  ) * _Distortion2) * _Distortion2);
					  warp_1.x = tmpvar_6.x;
					  warp_1.y = -(tmpvar_6.y);
					  uv_2 = (uv_2 + warp_1);
					  highp vec2 tmpvar_7;
					  tmpvar_7 = (tmpvar_3 - tmpvar_5);
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, uv_2);
					  highp vec4 tmpvar_9;
					  tmpvar_9 = (tmpvar_8 * clamp ((
					    (0.1 * sqrt(dot (tmpvar_7, tmpvar_7)))
					   - _Distortion), 0.0, 1.0));
					  gl_FragData[0] = tmpvar_9;
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
					uniform highp float _Distortion2;
					uniform highp vec4 _ScreenResolution;
					uniform highp float _PositionX;
					uniform highp float _PositionY;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec2 warp_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_3;
					  tmpvar_3.x = ((0.5 + (_PositionX / 2.0)) * _ScreenResolution.x);
					  tmpvar_3.y = ((0.5 - (_PositionY / 2.0)) * _ScreenResolution.y);
					  highp vec2 tmpvar_4;
					  highp vec2 tmpvar_5;
					  tmpvar_5 = (xlv_TEXCOORD0 * _ScreenResolution.xy);
					  tmpvar_4 = (tmpvar_3 - tmpvar_5);
					  highp vec2 tmpvar_6;
					  tmpvar_6 = (((
					    normalize((tmpvar_3 - tmpvar_5))
					   * 
					    pow (sqrt(dot (tmpvar_4, tmpvar_4)), -2.0)
					  ) * _Distortion2) * _Distortion2);
					  warp_1.x = tmpvar_6.x;
					  warp_1.y = -(tmpvar_6.y);
					  uv_2 = (uv_2 + warp_1);
					  highp vec2 tmpvar_7;
					  tmpvar_7 = (tmpvar_3 - tmpvar_5);
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, uv_2);
					  highp vec4 tmpvar_9;
					  tmpvar_9 = (tmpvar_8 * clamp ((
					    (0.1 * sqrt(dot (tmpvar_7, tmpvar_7)))
					   - _Distortion), 0.0, 1.0));
					  gl_FragData[0] = tmpvar_9;
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
					uniform 	float _Distortion2;
					uniform 	vec4 _ScreenResolution;
					uniform 	float _PositionX;
					uniform 	float _PositionY;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					lowp vec4 u_xlat10_1;
					float u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = _PositionX * 0.5 + 0.5;
					    u_xlat0.z = (-_PositionY) * 0.5 + 0.5;
					    u_xlat0.xy = u_xlat0.xz * _ScreenResolution.xy;
					    u_xlat0.xy = (-vs_TEXCOORD0.xy) * _ScreenResolution.xy + u_xlat0.xy;
					    u_xlat4 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat6 = inversesqrt(u_xlat4);
					    u_xlat0.xy = vec2(u_xlat6) * u_xlat0.xy;
					    u_xlat6 = float(1.0) / u_xlat4;
					    u_xlat4 = sqrt(u_xlat4);
					    u_xlat4 = u_xlat4 * 0.100000001 + (-_Distortion);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat4 = min(max(u_xlat4, 0.0), 1.0);
					#else
					    u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
					#endif
					    u_xlat0.xy = vec2(u_xlat6) * u_xlat0.xy;
					    u_xlat6 = _Distortion2 * _Distortion2;
					    u_xlat1.xy = u_xlat0.xy * vec2(u_xlat6);
					    u_xlat1.z = (-u_xlat1.y);
					    u_xlat0.xy = u_xlat1.xz + vs_TEXCOORD0.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    SV_Target0 = vec4(u_xlat4) * u_xlat10_1;
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
					uniform 	float _Distortion2;
					uniform 	vec4 _ScreenResolution;
					uniform 	float _PositionX;
					uniform 	float _PositionY;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					lowp vec4 u_xlat10_1;
					float u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = _PositionX * 0.5 + 0.5;
					    u_xlat0.z = (-_PositionY) * 0.5 + 0.5;
					    u_xlat0.xy = u_xlat0.xz * _ScreenResolution.xy;
					    u_xlat0.xy = (-vs_TEXCOORD0.xy) * _ScreenResolution.xy + u_xlat0.xy;
					    u_xlat4 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat6 = inversesqrt(u_xlat4);
					    u_xlat0.xy = vec2(u_xlat6) * u_xlat0.xy;
					    u_xlat6 = float(1.0) / u_xlat4;
					    u_xlat4 = sqrt(u_xlat4);
					    u_xlat4 = u_xlat4 * 0.100000001 + (-_Distortion);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat4 = min(max(u_xlat4, 0.0), 1.0);
					#else
					    u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
					#endif
					    u_xlat0.xy = vec2(u_xlat6) * u_xlat0.xy;
					    u_xlat6 = _Distortion2 * _Distortion2;
					    u_xlat1.xy = u_xlat0.xy * vec2(u_xlat6);
					    u_xlat1.z = (-u_xlat1.y);
					    u_xlat0.xy = u_xlat1.xz + vs_TEXCOORD0.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    SV_Target0 = vec4(u_xlat4) * u_xlat10_1;
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
					uniform 	float _Distortion2;
					uniform 	vec4 _ScreenResolution;
					uniform 	float _PositionX;
					uniform 	float _PositionY;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					lowp vec4 u_xlat10_1;
					float u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = _PositionX * 0.5 + 0.5;
					    u_xlat0.z = (-_PositionY) * 0.5 + 0.5;
					    u_xlat0.xy = u_xlat0.xz * _ScreenResolution.xy;
					    u_xlat0.xy = (-vs_TEXCOORD0.xy) * _ScreenResolution.xy + u_xlat0.xy;
					    u_xlat4 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat6 = inversesqrt(u_xlat4);
					    u_xlat0.xy = vec2(u_xlat6) * u_xlat0.xy;
					    u_xlat6 = float(1.0) / u_xlat4;
					    u_xlat4 = sqrt(u_xlat4);
					    u_xlat4 = u_xlat4 * 0.100000001 + (-_Distortion);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat4 = min(max(u_xlat4, 0.0), 1.0);
					#else
					    u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
					#endif
					    u_xlat0.xy = vec2(u_xlat6) * u_xlat0.xy;
					    u_xlat6 = _Distortion2 * _Distortion2;
					    u_xlat1.xy = u_xlat0.xy * vec2(u_xlat6);
					    u_xlat1.z = (-u_xlat1.y);
					    u_xlat0.xy = u_xlat1.xz + vs_TEXCOORD0.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    SV_Target0 = vec4(u_xlat4) * u_xlat10_1;
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