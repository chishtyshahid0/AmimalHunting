Shader "CameraFilterPack/FX_Spot" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_PositionX ("_PositionX", Range(-0.5, 0.5)) = 0
		_PositionY ("_PositionY", Range(-0.5, 0.5)) = 0
		_Radius ("_Radius", Range(0, 1)) = 0.5
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 58837
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
					uniform highp float _PositionX;
					uniform highp float _PositionY;
					uniform highp float _Radius;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  highp vec4 tex_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, uv_3);
					  tex_2 = tmpvar_4;
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = _PositionX;
					  tmpvar_5.y = _PositionY;
					  highp vec2 x_6;
					  x_6 = (tmpvar_5 - uv_3);
					  highp float tmpvar_7;
					  tmpvar_7 = clamp (((
					    sqrt(dot (x_6, x_6))
					   - _Radius) / (
					    (_Radius + 0.15)
					   - _Radius)), 0.0, 1.0);
					  highp vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = ((1.0 - (tmpvar_7 * 
					    (tmpvar_7 * (3.0 - (2.0 * tmpvar_7)))
					  )) * tex_2.xyz);
					  tmpvar_1 = tmpvar_8;
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
					uniform highp float _PositionX;
					uniform highp float _PositionY;
					uniform highp float _Radius;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  highp vec4 tex_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, uv_3);
					  tex_2 = tmpvar_4;
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = _PositionX;
					  tmpvar_5.y = _PositionY;
					  highp vec2 x_6;
					  x_6 = (tmpvar_5 - uv_3);
					  highp float tmpvar_7;
					  tmpvar_7 = clamp (((
					    sqrt(dot (x_6, x_6))
					   - _Radius) / (
					    (_Radius + 0.15)
					   - _Radius)), 0.0, 1.0);
					  highp vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = ((1.0 - (tmpvar_7 * 
					    (tmpvar_7 * (3.0 - (2.0 * tmpvar_7)))
					  )) * tex_2.xyz);
					  tmpvar_1 = tmpvar_8;
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
					uniform highp float _PositionX;
					uniform highp float _PositionY;
					uniform highp float _Radius;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  highp vec4 tex_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, uv_3);
					  tex_2 = tmpvar_4;
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = _PositionX;
					  tmpvar_5.y = _PositionY;
					  highp vec2 x_6;
					  x_6 = (tmpvar_5 - uv_3);
					  highp float tmpvar_7;
					  tmpvar_7 = clamp (((
					    sqrt(dot (x_6, x_6))
					   - _Radius) / (
					    (_Radius + 0.15)
					   - _Radius)), 0.0, 1.0);
					  highp vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = ((1.0 - (tmpvar_7 * 
					    (tmpvar_7 * (3.0 - (2.0 * tmpvar_7)))
					  )) * tex_2.xyz);
					  tmpvar_1 = tmpvar_8;
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
					uniform 	float _PositionX;
					uniform 	float _PositionY;
					uniform 	float _Radius;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					float u_xlat1;
					lowp vec3 u_xlat10_1;
					void main()
					{
					    u_xlat0.xy = vec2((-vs_TEXCOORD0.x) + float(_PositionX), (-vs_TEXCOORD0.y) + float(_PositionY));
					    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + (-_Radius);
					    u_xlat0.x = u_xlat0.x * 6.66666651;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat1 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat1) * u_xlat0.x + 1.0;
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat0.xyz = u_xlat10_1.xyz * u_xlat0.xxx;
					    SV_Target0.xyz = u_xlat0.xyz;
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
					uniform 	float _PositionX;
					uniform 	float _PositionY;
					uniform 	float _Radius;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					float u_xlat1;
					lowp vec3 u_xlat10_1;
					void main()
					{
					    u_xlat0.xy = vec2((-vs_TEXCOORD0.x) + float(_PositionX), (-vs_TEXCOORD0.y) + float(_PositionY));
					    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + (-_Radius);
					    u_xlat0.x = u_xlat0.x * 6.66666651;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat1 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat1) * u_xlat0.x + 1.0;
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat0.xyz = u_xlat10_1.xyz * u_xlat0.xxx;
					    SV_Target0.xyz = u_xlat0.xyz;
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
					uniform 	float _PositionX;
					uniform 	float _PositionY;
					uniform 	float _Radius;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					float u_xlat1;
					lowp vec3 u_xlat10_1;
					void main()
					{
					    u_xlat0.xy = vec2((-vs_TEXCOORD0.x) + float(_PositionX), (-vs_TEXCOORD0.y) + float(_PositionY));
					    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + (-_Radius);
					    u_xlat0.x = u_xlat0.x * 6.66666651;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat1 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat1) * u_xlat0.x + 1.0;
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat0.xyz = u_xlat10_1.xyz * u_xlat0.xxx;
					    SV_Target0.xyz = u_xlat0.xyz;
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