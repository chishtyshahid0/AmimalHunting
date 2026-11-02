Shader "CameraFilterPack/Blur_Noise" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_Level ("_Level", Range(1, 16)) = 4
		_Distance ("_Distance", Vector) = (30,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 56358
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
					#extension GL_EXT_shader_texture_lod : enable
					lowp vec4 impl_low_texture2DLodEXT(lowp sampler2D sampler, highp vec2 coord, mediump float lod)
					{
					#if defined(GL_EXT_shader_texture_lod)
						return texture2DLodEXT(sampler, coord, lod);
					#else
						return texture2D(sampler, coord, lod);
					#endif
					}
					
					uniform sampler2D _MainTex;
					uniform highp float _TimeX;
					uniform highp vec4 _ScreenResolution;
					uniform highp float _Level;
					uniform highp vec4 _Distance;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 sum_2;
					  highp vec2 p_3;
					  highp vec2 stepfloat_4;
					  highp int num_samples_5;
					  highp vec2 uv_6;
					  uv_6 = xlv_TEXCOORD0;
					  highp int tmpvar_7;
					  tmpvar_7 = int(_Level);
					  num_samples_5 = tmpvar_7;
					  highp float tmpvar_8;
					  tmpvar_8 = float(tmpvar_7);
					  highp vec2 tmpvar_9;
					  tmpvar_9 = (_Distance.xy / _ScreenResolution.xy);
					  highp vec2 tmpvar_10;
					  tmpvar_10 = (uv_6 - (0.5 * tmpvar_9));
					  highp vec2 tmpvar_11;
					  tmpvar_11 = (((uv_6 + 
					    (0.5 * tmpvar_9)
					  ) - tmpvar_10) / (tmpvar_8 - 1.0));
					  stepfloat_4 = tmpvar_11;
					  p_3 = (tmpvar_10 + ((
					    fract((sin(dot (
					      (uv_6 + fract(_TimeX))
					    , vec2(12.9898, 78.233))) * 43758.55))
					   - 0.5) * tmpvar_11));
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = impl_low_texture2DLodEXT (_MainTex, p_3, 0.0);
					  highp vec4 tmpvar_13;
					  tmpvar_13 = tmpvar_12;
					  sum_2 = tmpvar_13;
					  for (highp int i_1_1 = 1; i_1_1 < num_samples_5; i_1_1++) {
					    p_3 = (p_3 + stepfloat_4);
					    lowp vec4 tmpvar_14;
					    tmpvar_14 = impl_low_texture2DLodEXT (_MainTex, p_3, 0.0);
					    sum_2 = (sum_2 + tmpvar_14);
					  };
					  sum_2 = (sum_2 / tmpvar_8);
					  gl_FragData[0] = sum_2;
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
					#extension GL_EXT_shader_texture_lod : enable
					lowp vec4 impl_low_texture2DLodEXT(lowp sampler2D sampler, highp vec2 coord, mediump float lod)
					{
					#if defined(GL_EXT_shader_texture_lod)
						return texture2DLodEXT(sampler, coord, lod);
					#else
						return texture2D(sampler, coord, lod);
					#endif
					}
					
					uniform sampler2D _MainTex;
					uniform highp float _TimeX;
					uniform highp vec4 _ScreenResolution;
					uniform highp float _Level;
					uniform highp vec4 _Distance;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 sum_2;
					  highp vec2 p_3;
					  highp vec2 stepfloat_4;
					  highp int num_samples_5;
					  highp vec2 uv_6;
					  uv_6 = xlv_TEXCOORD0;
					  highp int tmpvar_7;
					  tmpvar_7 = int(_Level);
					  num_samples_5 = tmpvar_7;
					  highp float tmpvar_8;
					  tmpvar_8 = float(tmpvar_7);
					  highp vec2 tmpvar_9;
					  tmpvar_9 = (_Distance.xy / _ScreenResolution.xy);
					  highp vec2 tmpvar_10;
					  tmpvar_10 = (uv_6 - (0.5 * tmpvar_9));
					  highp vec2 tmpvar_11;
					  tmpvar_11 = (((uv_6 + 
					    (0.5 * tmpvar_9)
					  ) - tmpvar_10) / (tmpvar_8 - 1.0));
					  stepfloat_4 = tmpvar_11;
					  p_3 = (tmpvar_10 + ((
					    fract((sin(dot (
					      (uv_6 + fract(_TimeX))
					    , vec2(12.9898, 78.233))) * 43758.55))
					   - 0.5) * tmpvar_11));
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = impl_low_texture2DLodEXT (_MainTex, p_3, 0.0);
					  highp vec4 tmpvar_13;
					  tmpvar_13 = tmpvar_12;
					  sum_2 = tmpvar_13;
					  for (highp int i_1_1 = 1; i_1_1 < num_samples_5; i_1_1++) {
					    p_3 = (p_3 + stepfloat_4);
					    lowp vec4 tmpvar_14;
					    tmpvar_14 = impl_low_texture2DLodEXT (_MainTex, p_3, 0.0);
					    sum_2 = (sum_2 + tmpvar_14);
					  };
					  sum_2 = (sum_2 / tmpvar_8);
					  gl_FragData[0] = sum_2;
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
					#extension GL_EXT_shader_texture_lod : enable
					lowp vec4 impl_low_texture2DLodEXT(lowp sampler2D sampler, highp vec2 coord, mediump float lod)
					{
					#if defined(GL_EXT_shader_texture_lod)
						return texture2DLodEXT(sampler, coord, lod);
					#else
						return texture2D(sampler, coord, lod);
					#endif
					}
					
					uniform sampler2D _MainTex;
					uniform highp float _TimeX;
					uniform highp vec4 _ScreenResolution;
					uniform highp float _Level;
					uniform highp vec4 _Distance;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 sum_2;
					  highp vec2 p_3;
					  highp vec2 stepfloat_4;
					  highp int num_samples_5;
					  highp vec2 uv_6;
					  uv_6 = xlv_TEXCOORD0;
					  highp int tmpvar_7;
					  tmpvar_7 = int(_Level);
					  num_samples_5 = tmpvar_7;
					  highp float tmpvar_8;
					  tmpvar_8 = float(tmpvar_7);
					  highp vec2 tmpvar_9;
					  tmpvar_9 = (_Distance.xy / _ScreenResolution.xy);
					  highp vec2 tmpvar_10;
					  tmpvar_10 = (uv_6 - (0.5 * tmpvar_9));
					  highp vec2 tmpvar_11;
					  tmpvar_11 = (((uv_6 + 
					    (0.5 * tmpvar_9)
					  ) - tmpvar_10) / (tmpvar_8 - 1.0));
					  stepfloat_4 = tmpvar_11;
					  p_3 = (tmpvar_10 + ((
					    fract((sin(dot (
					      (uv_6 + fract(_TimeX))
					    , vec2(12.9898, 78.233))) * 43758.55))
					   - 0.5) * tmpvar_11));
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = impl_low_texture2DLodEXT (_MainTex, p_3, 0.0);
					  highp vec4 tmpvar_13;
					  tmpvar_13 = tmpvar_12;
					  sum_2 = tmpvar_13;
					  for (highp int i_1_1 = 1; i_1_1 < num_samples_5; i_1_1++) {
					    p_3 = (p_3 + stepfloat_4);
					    lowp vec4 tmpvar_14;
					    tmpvar_14 = impl_low_texture2DLodEXT (_MainTex, p_3, 0.0);
					    sum_2 = (sum_2 + tmpvar_14);
					  };
					  sum_2 = (sum_2 / tmpvar_8);
					  gl_FragData[0] = sum_2;
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
					uniform 	vec4 _ScreenResolution;
					uniform 	float _Level;
					uniform 	vec4 _Distance;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					vec2 u_xlat1;
					lowp vec4 u_xlat10_2;
					vec4 u_xlat3;
					int u_xlati4;
					lowp vec4 u_xlat10_5;
					int u_xlati6;
					bool u_xlatb10;
					vec2 u_xlat13;
					void main()
					{
					    u_xlat0.x = fract(_TimeX);
					    u_xlat0.xy = u_xlat0.xx + vs_TEXCOORD0.xy;
					    u_xlat0.x = dot(u_xlat0.xy, vec2(12.9898005, 78.2330017));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43758.5469;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlati6 = int(_Level);
					    u_xlat0.z = trunc(_Level);
					    u_xlat1.xy = _Distance.xy / _ScreenResolution.xy;
					    u_xlat13.xy = (-u_xlat1.xy) * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
					    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
					    u_xlat1.xy = (-u_xlat13.xy) + u_xlat1.xy;
					    u_xlat0.xw = u_xlat0.xz + vec2(-0.5, -1.0);
					    u_xlat1.xy = u_xlat1.xy / u_xlat0.ww;
					    u_xlat0.xw = u_xlat0.xx * u_xlat1.xy + u_xlat13.xy;
					    u_xlat10_2 = textureLod(_MainTex, u_xlat0.xw, 0.0);
					    u_xlat3 = u_xlat10_2;
					    u_xlat13.xy = u_xlat0.xw;
					    for(int u_xlati_loop_1 = 1 ; u_xlati_loop_1<u_xlati6 ; u_xlati_loop_1++)
					    {
					        u_xlat13.xy = u_xlat1.xy + u_xlat13.xy;
					        u_xlat10_5 = textureLod(_MainTex, u_xlat13.xy, 0.0);
					        u_xlat3 = u_xlat3 + u_xlat10_5;
					    }
					    SV_Target0 = u_xlat3 / u_xlat0.zzzz;
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
					uniform 	vec4 _ScreenResolution;
					uniform 	float _Level;
					uniform 	vec4 _Distance;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					vec2 u_xlat1;
					lowp vec4 u_xlat10_2;
					vec4 u_xlat3;
					int u_xlati4;
					lowp vec4 u_xlat10_5;
					int u_xlati6;
					bool u_xlatb10;
					vec2 u_xlat13;
					void main()
					{
					    u_xlat0.x = fract(_TimeX);
					    u_xlat0.xy = u_xlat0.xx + vs_TEXCOORD0.xy;
					    u_xlat0.x = dot(u_xlat0.xy, vec2(12.9898005, 78.2330017));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43758.5469;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlati6 = int(_Level);
					    u_xlat0.z = trunc(_Level);
					    u_xlat1.xy = _Distance.xy / _ScreenResolution.xy;
					    u_xlat13.xy = (-u_xlat1.xy) * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
					    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
					    u_xlat1.xy = (-u_xlat13.xy) + u_xlat1.xy;
					    u_xlat0.xw = u_xlat0.xz + vec2(-0.5, -1.0);
					    u_xlat1.xy = u_xlat1.xy / u_xlat0.ww;
					    u_xlat0.xw = u_xlat0.xx * u_xlat1.xy + u_xlat13.xy;
					    u_xlat10_2 = textureLod(_MainTex, u_xlat0.xw, 0.0);
					    u_xlat3 = u_xlat10_2;
					    u_xlat13.xy = u_xlat0.xw;
					    for(int u_xlati_loop_1 = 1 ; u_xlati_loop_1<u_xlati6 ; u_xlati_loop_1++)
					    {
					        u_xlat13.xy = u_xlat1.xy + u_xlat13.xy;
					        u_xlat10_5 = textureLod(_MainTex, u_xlat13.xy, 0.0);
					        u_xlat3 = u_xlat3 + u_xlat10_5;
					    }
					    SV_Target0 = u_xlat3 / u_xlat0.zzzz;
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
					uniform 	vec4 _ScreenResolution;
					uniform 	float _Level;
					uniform 	vec4 _Distance;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					vec2 u_xlat1;
					lowp vec4 u_xlat10_2;
					vec4 u_xlat3;
					int u_xlati4;
					lowp vec4 u_xlat10_5;
					int u_xlati6;
					bool u_xlatb10;
					vec2 u_xlat13;
					void main()
					{
					    u_xlat0.x = fract(_TimeX);
					    u_xlat0.xy = u_xlat0.xx + vs_TEXCOORD0.xy;
					    u_xlat0.x = dot(u_xlat0.xy, vec2(12.9898005, 78.2330017));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43758.5469;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlati6 = int(_Level);
					    u_xlat0.z = trunc(_Level);
					    u_xlat1.xy = _Distance.xy / _ScreenResolution.xy;
					    u_xlat13.xy = (-u_xlat1.xy) * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
					    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
					    u_xlat1.xy = (-u_xlat13.xy) + u_xlat1.xy;
					    u_xlat0.xw = u_xlat0.xz + vec2(-0.5, -1.0);
					    u_xlat1.xy = u_xlat1.xy / u_xlat0.ww;
					    u_xlat0.xw = u_xlat0.xx * u_xlat1.xy + u_xlat13.xy;
					    u_xlat10_2 = textureLod(_MainTex, u_xlat0.xw, 0.0);
					    u_xlat3 = u_xlat10_2;
					    u_xlat13.xy = u_xlat0.xw;
					    for(int u_xlati_loop_1 = 1 ; u_xlati_loop_1<u_xlati6 ; u_xlati_loop_1++)
					    {
					        u_xlat13.xy = u_xlat1.xy + u_xlat13.xy;
					        u_xlat10_5 = textureLod(_MainTex, u_xlat13.xy, 0.0);
					        u_xlat3 = u_xlat3 + u_xlat10_5;
					    }
					    SV_Target0 = u_xlat3 / u_xlat0.zzzz;
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