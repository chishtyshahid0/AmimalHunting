Shader "CameraFilterPack/Blur_Steam" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_Radius ("_Radius", Range(0, 1)) = 0.1
		_Quality ("_Quality", Range(0, 1)) = 0.75
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 38211
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
					uniform highp float _Radius;
					uniform highp float _Quality;
					highp float xlat_mutable_Quality;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  xlat_mutable_Quality = _Quality;
					  highp vec4 tmpvar_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  highp float r_3;
					  lowp vec4 col_4;
					  col_4 = vec4(0.0, 0.0, 0.0, 0.0);
					  if ((_Quality == 1.0)) {
					    xlat_mutable_Quality = 0.99;
					  };
					  r_3 = 0.0;
					  while (true) {
					    highp float a_5;
					    if ((r_3 >= 1.0)) {
					      break;
					    };
					    a_5 = 0.0;
					    while (true) {
					      if ((a_5 >= 1.0)) {
					        break;
					      };
					      highp vec2 tmpvar_6;
					      tmpvar_6.x = cos((a_5 * 6.283184));
					      tmpvar_6.y = sin((a_5 * 6.283184));
					      highp vec4 tmpvar_7;
					      tmpvar_7.zw = vec2(0.0, 0.0);
					      tmpvar_7.xy = (uv_2 + (tmpvar_6 * (r_3 * _Radius)));
					      col_4 = (col_4 + impl_low_texture2DLodEXT (_MainTex, tmpvar_7.xy, 0.0));
					      a_5 = (a_5 + (1.0 - xlat_mutable_Quality));
					    };
					    r_3 = (r_3 + (1.0 - xlat_mutable_Quality));
					  };
					  col_4 = (col_4 * ((1.0 - xlat_mutable_Quality) * (1.0 - xlat_mutable_Quality)));
					  tmpvar_1 = col_4;
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
					uniform highp float _Radius;
					uniform highp float _Quality;
					highp float xlat_mutable_Quality;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  xlat_mutable_Quality = _Quality;
					  highp vec4 tmpvar_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  highp float r_3;
					  lowp vec4 col_4;
					  col_4 = vec4(0.0, 0.0, 0.0, 0.0);
					  if ((_Quality == 1.0)) {
					    xlat_mutable_Quality = 0.99;
					  };
					  r_3 = 0.0;
					  while (true) {
					    highp float a_5;
					    if ((r_3 >= 1.0)) {
					      break;
					    };
					    a_5 = 0.0;
					    while (true) {
					      if ((a_5 >= 1.0)) {
					        break;
					      };
					      highp vec2 tmpvar_6;
					      tmpvar_6.x = cos((a_5 * 6.283184));
					      tmpvar_6.y = sin((a_5 * 6.283184));
					      highp vec4 tmpvar_7;
					      tmpvar_7.zw = vec2(0.0, 0.0);
					      tmpvar_7.xy = (uv_2 + (tmpvar_6 * (r_3 * _Radius)));
					      col_4 = (col_4 + impl_low_texture2DLodEXT (_MainTex, tmpvar_7.xy, 0.0));
					      a_5 = (a_5 + (1.0 - xlat_mutable_Quality));
					    };
					    r_3 = (r_3 + (1.0 - xlat_mutable_Quality));
					  };
					  col_4 = (col_4 * ((1.0 - xlat_mutable_Quality) * (1.0 - xlat_mutable_Quality)));
					  tmpvar_1 = col_4;
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
					uniform highp float _Radius;
					uniform highp float _Quality;
					highp float xlat_mutable_Quality;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  xlat_mutable_Quality = _Quality;
					  highp vec4 tmpvar_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  highp float r_3;
					  lowp vec4 col_4;
					  col_4 = vec4(0.0, 0.0, 0.0, 0.0);
					  if ((_Quality == 1.0)) {
					    xlat_mutable_Quality = 0.99;
					  };
					  r_3 = 0.0;
					  while (true) {
					    highp float a_5;
					    if ((r_3 >= 1.0)) {
					      break;
					    };
					    a_5 = 0.0;
					    while (true) {
					      if ((a_5 >= 1.0)) {
					        break;
					      };
					      highp vec2 tmpvar_6;
					      tmpvar_6.x = cos((a_5 * 6.283184));
					      tmpvar_6.y = sin((a_5 * 6.283184));
					      highp vec4 tmpvar_7;
					      tmpvar_7.zw = vec2(0.0, 0.0);
					      tmpvar_7.xy = (uv_2 + (tmpvar_6 * (r_3 * _Radius)));
					      col_4 = (col_4 + impl_low_texture2DLodEXT (_MainTex, tmpvar_7.xy, 0.0));
					      a_5 = (a_5 + (1.0 - xlat_mutable_Quality));
					    };
					    r_3 = (r_3 + (1.0 - xlat_mutable_Quality));
					  };
					  col_4 = (col_4 * ((1.0 - xlat_mutable_Quality) * (1.0 - xlat_mutable_Quality)));
					  tmpvar_1 = col_4;
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
					uniform 	float _Radius;
					uniform 	float _Quality;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					mediump vec4 u_xlat16_2;
					lowp vec4 u_xlat10_2;
					vec2 u_xlat3;
					lowp vec4 u_xlat10_3;
					bool u_xlatb3;
					vec2 u_xlat4;
					float u_xlat5;
					float u_xlat10;
					bool u_xlatb10;
					float u_xlat15;
					void main()
					{
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(_Quality==1.0);
					#else
					    u_xlatb0 = _Quality==1.0;
					#endif
					    u_xlat5 = (-_Quality) + 1.0;
					    u_xlat0 = (u_xlatb0) ? 0.00999999046 : u_xlat5;
					    u_xlat10_1.x = float(0.0);
					    u_xlat10_1.y = float(0.0);
					    u_xlat10_1.z = float(0.0);
					    u_xlat10_1.w = float(0.0);
					    u_xlat5 = 0.0;
					    while(true){
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb10 = !!(u_xlat5>=1.0);
					#else
					        u_xlatb10 = u_xlat5>=1.0;
					#endif
					        if(u_xlatb10){break;}
					        u_xlat10 = u_xlat5 * _Radius;
					        u_xlat10_2 = u_xlat10_1;
					        u_xlat15 = 0.0;
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb3 = !!(u_xlat15>=1.0);
					#else
					            u_xlatb3 = u_xlat15>=1.0;
					#endif
					            if(u_xlatb3){break;}
					            u_xlat3.x = u_xlat15 * 6.28318405;
					            u_xlat4.x = cos(u_xlat3.x);
					            u_xlat3.x = sin(u_xlat3.x);
					            u_xlat4.y = u_xlat3.x;
					            u_xlat3.xy = u_xlat4.xy * vec2(u_xlat10) + vs_TEXCOORD0.xy;
					            u_xlat10_3 = textureLod(_MainTex, u_xlat3.xy, 0.0);
					            u_xlat16_2 = u_xlat10_2 + u_xlat10_3;
					            u_xlat15 = u_xlat0 + u_xlat15;
					            u_xlat10_2 = u_xlat16_2;
					        }
					        u_xlat10_1 = u_xlat10_2;
					        u_xlat5 = u_xlat0 + u_xlat5;
					    }
					    u_xlat0 = u_xlat0 * u_xlat0;
					    SV_Target0 = vec4(u_xlat0) * u_xlat10_1;
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
					uniform 	float _Radius;
					uniform 	float _Quality;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					mediump vec4 u_xlat16_2;
					lowp vec4 u_xlat10_2;
					vec2 u_xlat3;
					lowp vec4 u_xlat10_3;
					bool u_xlatb3;
					vec2 u_xlat4;
					float u_xlat5;
					float u_xlat10;
					bool u_xlatb10;
					float u_xlat15;
					void main()
					{
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(_Quality==1.0);
					#else
					    u_xlatb0 = _Quality==1.0;
					#endif
					    u_xlat5 = (-_Quality) + 1.0;
					    u_xlat0 = (u_xlatb0) ? 0.00999999046 : u_xlat5;
					    u_xlat10_1.x = float(0.0);
					    u_xlat10_1.y = float(0.0);
					    u_xlat10_1.z = float(0.0);
					    u_xlat10_1.w = float(0.0);
					    u_xlat5 = 0.0;
					    while(true){
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb10 = !!(u_xlat5>=1.0);
					#else
					        u_xlatb10 = u_xlat5>=1.0;
					#endif
					        if(u_xlatb10){break;}
					        u_xlat10 = u_xlat5 * _Radius;
					        u_xlat10_2 = u_xlat10_1;
					        u_xlat15 = 0.0;
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb3 = !!(u_xlat15>=1.0);
					#else
					            u_xlatb3 = u_xlat15>=1.0;
					#endif
					            if(u_xlatb3){break;}
					            u_xlat3.x = u_xlat15 * 6.28318405;
					            u_xlat4.x = cos(u_xlat3.x);
					            u_xlat3.x = sin(u_xlat3.x);
					            u_xlat4.y = u_xlat3.x;
					            u_xlat3.xy = u_xlat4.xy * vec2(u_xlat10) + vs_TEXCOORD0.xy;
					            u_xlat10_3 = textureLod(_MainTex, u_xlat3.xy, 0.0);
					            u_xlat16_2 = u_xlat10_2 + u_xlat10_3;
					            u_xlat15 = u_xlat0 + u_xlat15;
					            u_xlat10_2 = u_xlat16_2;
					        }
					        u_xlat10_1 = u_xlat10_2;
					        u_xlat5 = u_xlat0 + u_xlat5;
					    }
					    u_xlat0 = u_xlat0 * u_xlat0;
					    SV_Target0 = vec4(u_xlat0) * u_xlat10_1;
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
					uniform 	float _Radius;
					uniform 	float _Quality;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					bool u_xlatb0;
					lowp vec4 u_xlat10_1;
					mediump vec4 u_xlat16_2;
					lowp vec4 u_xlat10_2;
					vec2 u_xlat3;
					lowp vec4 u_xlat10_3;
					bool u_xlatb3;
					vec2 u_xlat4;
					float u_xlat5;
					float u_xlat10;
					bool u_xlatb10;
					float u_xlat15;
					void main()
					{
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(_Quality==1.0);
					#else
					    u_xlatb0 = _Quality==1.0;
					#endif
					    u_xlat5 = (-_Quality) + 1.0;
					    u_xlat0 = (u_xlatb0) ? 0.00999999046 : u_xlat5;
					    u_xlat10_1.x = float(0.0);
					    u_xlat10_1.y = float(0.0);
					    u_xlat10_1.z = float(0.0);
					    u_xlat10_1.w = float(0.0);
					    u_xlat5 = 0.0;
					    while(true){
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb10 = !!(u_xlat5>=1.0);
					#else
					        u_xlatb10 = u_xlat5>=1.0;
					#endif
					        if(u_xlatb10){break;}
					        u_xlat10 = u_xlat5 * _Radius;
					        u_xlat10_2 = u_xlat10_1;
					        u_xlat15 = 0.0;
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb3 = !!(u_xlat15>=1.0);
					#else
					            u_xlatb3 = u_xlat15>=1.0;
					#endif
					            if(u_xlatb3){break;}
					            u_xlat3.x = u_xlat15 * 6.28318405;
					            u_xlat4.x = cos(u_xlat3.x);
					            u_xlat3.x = sin(u_xlat3.x);
					            u_xlat4.y = u_xlat3.x;
					            u_xlat3.xy = u_xlat4.xy * vec2(u_xlat10) + vs_TEXCOORD0.xy;
					            u_xlat10_3 = textureLod(_MainTex, u_xlat3.xy, 0.0);
					            u_xlat16_2 = u_xlat10_2 + u_xlat10_3;
					            u_xlat15 = u_xlat0 + u_xlat15;
					            u_xlat10_2 = u_xlat16_2;
					        }
					        u_xlat10_1 = u_xlat10_2;
					        u_xlat5 = u_xlat0 + u_xlat5;
					    }
					    u_xlat0 = u_xlat0 * u_xlat0;
					    SV_Target0 = vec4(u_xlat0) * u_xlat10_1;
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