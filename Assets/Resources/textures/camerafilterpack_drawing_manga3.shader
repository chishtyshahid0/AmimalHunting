Shader "CameraFilterPack/Drawing_Manga3" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_DotSize ("_DotSize", Range(0, 1)) = 0
		_ColorLevel ("_ColorLevel", Range(0, 10)) = 7
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 18423
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
					uniform highp float _DotSize;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp float rasterPattern_1;
					  highp vec4 color2_2;
					  highp vec3 color_3;
					  highp vec2 uv_4;
					  uv_4 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, uv_4);
					  color2_2 = tmpvar_5;
					  highp float edge0_6;
					  highp float tmpvar_7;
					  tmpvar_7 = (_DotSize / 8.0);
					  edge0_6 = ((0.4 + tmpvar_7) - 0.6);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp ((-(edge0_6) / (
					    ((0.7 + tmpvar_7) - 0.6)
					   - edge0_6)), 0.0, 1.0);
					  color_3 = (color2_2.xyy + (tmpvar_8 * (tmpvar_8 * 
					    (3.0 - (2.0 * tmpvar_8))
					  )));
					  highp float tmpvar_9;
					  highp vec2 sh_10;
					  sh_10 = xlv_TEXCOORD0;
					  highp float d_11;
					  d_11 = ((2136.281 / _DotSize) / 0.6);
					  highp vec2 tmpvar_12;
					  tmpvar_12 = (sh_10 * 0.7071064);
					  tmpvar_9 = ((0.5 + (0.25 * 
					    cos(((tmpvar_12.x + tmpvar_12.y) * d_11))
					  )) + (0.25 * cos(
					    ((tmpvar_12.x - tmpvar_12.y) * d_11)
					  )));
					  rasterPattern_1 = tmpvar_9;
					  if ((color_3.x > 0.3)) {
					    color_3 = (color_3 + (color2_2.xyz - (rasterPattern_1 / 2.0)));
					  };
					  highp vec4 tmpvar_13;
					  tmpvar_13.w = 1.0;
					  tmpvar_13.xyz = color_3;
					  gl_FragData[0] = tmpvar_13;
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
					uniform highp float _DotSize;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp float rasterPattern_1;
					  highp vec4 color2_2;
					  highp vec3 color_3;
					  highp vec2 uv_4;
					  uv_4 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, uv_4);
					  color2_2 = tmpvar_5;
					  highp float edge0_6;
					  highp float tmpvar_7;
					  tmpvar_7 = (_DotSize / 8.0);
					  edge0_6 = ((0.4 + tmpvar_7) - 0.6);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp ((-(edge0_6) / (
					    ((0.7 + tmpvar_7) - 0.6)
					   - edge0_6)), 0.0, 1.0);
					  color_3 = (color2_2.xyy + (tmpvar_8 * (tmpvar_8 * 
					    (3.0 - (2.0 * tmpvar_8))
					  )));
					  highp float tmpvar_9;
					  highp vec2 sh_10;
					  sh_10 = xlv_TEXCOORD0;
					  highp float d_11;
					  d_11 = ((2136.281 / _DotSize) / 0.6);
					  highp vec2 tmpvar_12;
					  tmpvar_12 = (sh_10 * 0.7071064);
					  tmpvar_9 = ((0.5 + (0.25 * 
					    cos(((tmpvar_12.x + tmpvar_12.y) * d_11))
					  )) + (0.25 * cos(
					    ((tmpvar_12.x - tmpvar_12.y) * d_11)
					  )));
					  rasterPattern_1 = tmpvar_9;
					  if ((color_3.x > 0.3)) {
					    color_3 = (color_3 + (color2_2.xyz - (rasterPattern_1 / 2.0)));
					  };
					  highp vec4 tmpvar_13;
					  tmpvar_13.w = 1.0;
					  tmpvar_13.xyz = color_3;
					  gl_FragData[0] = tmpvar_13;
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
					uniform highp float _DotSize;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp float rasterPattern_1;
					  highp vec4 color2_2;
					  highp vec3 color_3;
					  highp vec2 uv_4;
					  uv_4 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, uv_4);
					  color2_2 = tmpvar_5;
					  highp float edge0_6;
					  highp float tmpvar_7;
					  tmpvar_7 = (_DotSize / 8.0);
					  edge0_6 = ((0.4 + tmpvar_7) - 0.6);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp ((-(edge0_6) / (
					    ((0.7 + tmpvar_7) - 0.6)
					   - edge0_6)), 0.0, 1.0);
					  color_3 = (color2_2.xyy + (tmpvar_8 * (tmpvar_8 * 
					    (3.0 - (2.0 * tmpvar_8))
					  )));
					  highp float tmpvar_9;
					  highp vec2 sh_10;
					  sh_10 = xlv_TEXCOORD0;
					  highp float d_11;
					  d_11 = ((2136.281 / _DotSize) / 0.6);
					  highp vec2 tmpvar_12;
					  tmpvar_12 = (sh_10 * 0.7071064);
					  tmpvar_9 = ((0.5 + (0.25 * 
					    cos(((tmpvar_12.x + tmpvar_12.y) * d_11))
					  )) + (0.25 * cos(
					    ((tmpvar_12.x - tmpvar_12.y) * d_11)
					  )));
					  rasterPattern_1 = tmpvar_9;
					  if ((color_3.x > 0.3)) {
					    color_3 = (color_3 + (color2_2.xyz - (rasterPattern_1 / 2.0)));
					  };
					  highp vec4 tmpvar_13;
					  tmpvar_13.w = 1.0;
					  tmpvar_13.xyz = color_3;
					  gl_FragData[0] = tmpvar_13;
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
					uniform 	float _DotSize;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					mediump vec2 u_xlat16_2;
					lowp vec3 u_xlat10_2;
					mediump float u_xlat16_4;
					float u_xlat6;
					bool u_xlatb6;
					void main()
					{
					    u_xlat0.x = 2136.28125 / _DotSize;
					    u_xlat0.x = u_xlat0.x * 1.66666663;
					    u_xlat16_2.xy = vs_TEXCOORD0.xy * vec2(0.707106411, 0.707106411);
					    u_xlat16_2.x = u_xlat16_2.y + u_xlat16_2.x;
					    u_xlat16_4 = vs_TEXCOORD0.x * 0.707106411 + (-u_xlat16_2.y);
					    u_xlat0.z = u_xlat0.x * u_xlat16_4;
					    u_xlat0.x = u_xlat0.x * u_xlat16_2.x;
					    u_xlat0.xy = cos(u_xlat0.xz);
					    u_xlat0.x = u_xlat0.x * 0.25 + 0.5;
					    u_xlat0.x = u_xlat0.y * 0.25 + u_xlat0.x;
					    u_xlat10_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat1.xyz = (-u_xlat0.xxx) * vec3(0.5, 0.5, 0.5) + u_xlat10_2.xyz;
					    u_xlat0.x = _DotSize * 0.125 + -0.200000018;
					    u_xlat0.x = u_xlat0.x * -3.33333349;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat6 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xxx + u_xlat10_2.xyy;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat0.xzz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb6 = !!(0.300000012<u_xlat0.x);
					#else
					    u_xlatb6 = 0.300000012<u_xlat0.x;
					#endif
					    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat0.xyz;
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
					uniform 	float _DotSize;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					mediump vec2 u_xlat16_2;
					lowp vec3 u_xlat10_2;
					mediump float u_xlat16_4;
					float u_xlat6;
					bool u_xlatb6;
					void main()
					{
					    u_xlat0.x = 2136.28125 / _DotSize;
					    u_xlat0.x = u_xlat0.x * 1.66666663;
					    u_xlat16_2.xy = vs_TEXCOORD0.xy * vec2(0.707106411, 0.707106411);
					    u_xlat16_2.x = u_xlat16_2.y + u_xlat16_2.x;
					    u_xlat16_4 = vs_TEXCOORD0.x * 0.707106411 + (-u_xlat16_2.y);
					    u_xlat0.z = u_xlat0.x * u_xlat16_4;
					    u_xlat0.x = u_xlat0.x * u_xlat16_2.x;
					    u_xlat0.xy = cos(u_xlat0.xz);
					    u_xlat0.x = u_xlat0.x * 0.25 + 0.5;
					    u_xlat0.x = u_xlat0.y * 0.25 + u_xlat0.x;
					    u_xlat10_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat1.xyz = (-u_xlat0.xxx) * vec3(0.5, 0.5, 0.5) + u_xlat10_2.xyz;
					    u_xlat0.x = _DotSize * 0.125 + -0.200000018;
					    u_xlat0.x = u_xlat0.x * -3.33333349;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat6 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xxx + u_xlat10_2.xyy;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat0.xzz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb6 = !!(0.300000012<u_xlat0.x);
					#else
					    u_xlatb6 = 0.300000012<u_xlat0.x;
					#endif
					    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat0.xyz;
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
					uniform 	float _DotSize;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					mediump vec2 u_xlat16_2;
					lowp vec3 u_xlat10_2;
					mediump float u_xlat16_4;
					float u_xlat6;
					bool u_xlatb6;
					void main()
					{
					    u_xlat0.x = 2136.28125 / _DotSize;
					    u_xlat0.x = u_xlat0.x * 1.66666663;
					    u_xlat16_2.xy = vs_TEXCOORD0.xy * vec2(0.707106411, 0.707106411);
					    u_xlat16_2.x = u_xlat16_2.y + u_xlat16_2.x;
					    u_xlat16_4 = vs_TEXCOORD0.x * 0.707106411 + (-u_xlat16_2.y);
					    u_xlat0.z = u_xlat0.x * u_xlat16_4;
					    u_xlat0.x = u_xlat0.x * u_xlat16_2.x;
					    u_xlat0.xy = cos(u_xlat0.xz);
					    u_xlat0.x = u_xlat0.x * 0.25 + 0.5;
					    u_xlat0.x = u_xlat0.y * 0.25 + u_xlat0.x;
					    u_xlat10_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat1.xyz = (-u_xlat0.xxx) * vec3(0.5, 0.5, 0.5) + u_xlat10_2.xyz;
					    u_xlat0.x = _DotSize * 0.125 + -0.200000018;
					    u_xlat0.x = u_xlat0.x * -3.33333349;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat6 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xxx + u_xlat10_2.xyy;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat0.xzz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb6 = !!(0.300000012<u_xlat0.x);
					#else
					    u_xlatb6 = 0.300000012<u_xlat0.x;
					#endif
					    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat0.xyz;
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