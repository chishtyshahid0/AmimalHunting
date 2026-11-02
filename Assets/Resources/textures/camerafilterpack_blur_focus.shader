Shader "CameraFilterPack/Blur_Focus" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Size ("Size", Range(0, 1)) = 1
		_Circle ("Circle", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_CenterX ("_CenterX", Range(-1, 1)) = 0
		_CenterY ("_CenterY", Range(-1, 1)) = 0
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 32559
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
					uniform highp float _CenterX;
					uniform highp float _CenterY;
					uniform highp float _Circle;
					uniform highp float _Size;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 tx_3;
					  highp vec2 uv_4;
					  uv_4 = xlv_TEXCOORD0;
					  tx_3 = vec4(0.0, 0.0, 0.0, 0.0);
					  for (highp float u_2 = 0.0; u_2 < _Size; u_2 += 0.2) {
					    highp vec2 tmpvar_5;
					    tmpvar_5.x = (0.5 + (_CenterX / 2.0));
					    tmpvar_5.y = (0.5 + (_CenterY / 2.0));
					    highp vec2 tmpvar_6;
					    tmpvar_6 = (uv_4 - tmpvar_5);
					    highp vec4 tmpvar_7;
					    tmpvar_7.zw = vec2(0.0, 0.0);
					    tmpvar_7.xy = (uv_4 + ((tmpvar_6 * 
					      dot (tmpvar_6, tmpvar_6)
					    ) * (u_2 / _Circle)));
					    tx_3 = (tx_3 + impl_low_texture2DLodEXT (_MainTex, tmpvar_7.xy, 0.0));
					  };
					  tx_3 = (tx_3 / (_Size * 5.0));
					  lowp vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tx_3.xyz;
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
					uniform highp float _CenterX;
					uniform highp float _CenterY;
					uniform highp float _Circle;
					uniform highp float _Size;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 tx_3;
					  highp vec2 uv_4;
					  uv_4 = xlv_TEXCOORD0;
					  tx_3 = vec4(0.0, 0.0, 0.0, 0.0);
					  for (highp float u_2 = 0.0; u_2 < _Size; u_2 += 0.2) {
					    highp vec2 tmpvar_5;
					    tmpvar_5.x = (0.5 + (_CenterX / 2.0));
					    tmpvar_5.y = (0.5 + (_CenterY / 2.0));
					    highp vec2 tmpvar_6;
					    tmpvar_6 = (uv_4 - tmpvar_5);
					    highp vec4 tmpvar_7;
					    tmpvar_7.zw = vec2(0.0, 0.0);
					    tmpvar_7.xy = (uv_4 + ((tmpvar_6 * 
					      dot (tmpvar_6, tmpvar_6)
					    ) * (u_2 / _Circle)));
					    tx_3 = (tx_3 + impl_low_texture2DLodEXT (_MainTex, tmpvar_7.xy, 0.0));
					  };
					  tx_3 = (tx_3 / (_Size * 5.0));
					  lowp vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tx_3.xyz;
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
					uniform highp float _CenterX;
					uniform highp float _CenterY;
					uniform highp float _Circle;
					uniform highp float _Size;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 tx_3;
					  highp vec2 uv_4;
					  uv_4 = xlv_TEXCOORD0;
					  tx_3 = vec4(0.0, 0.0, 0.0, 0.0);
					  for (highp float u_2 = 0.0; u_2 < _Size; u_2 += 0.2) {
					    highp vec2 tmpvar_5;
					    tmpvar_5.x = (0.5 + (_CenterX / 2.0));
					    tmpvar_5.y = (0.5 + (_CenterY / 2.0));
					    highp vec2 tmpvar_6;
					    tmpvar_6 = (uv_4 - tmpvar_5);
					    highp vec4 tmpvar_7;
					    tmpvar_7.zw = vec2(0.0, 0.0);
					    tmpvar_7.xy = (uv_4 + ((tmpvar_6 * 
					      dot (tmpvar_6, tmpvar_6)
					    ) * (u_2 / _Circle)));
					    tx_3 = (tx_3 + impl_low_texture2DLodEXT (_MainTex, tmpvar_7.xy, 0.0));
					  };
					  tx_3 = (tx_3 / (_Size * 5.0));
					  lowp vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = tx_3.xyz;
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
					uniform 	float _CenterX;
					uniform 	float _CenterY;
					uniform 	float _Circle;
					uniform 	float _Size;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					lowp vec3 u_xlat10_1;
					vec2 u_xlat2;
					lowp vec3 u_xlat10_2;
					bool u_xlatb2;
					vec2 u_xlat3;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = _Size * 5.0;
					    u_xlat3.xy = vec2(_CenterX, _CenterY) * vec2(0.5, 0.5) + vec2(0.5, 0.5);
					    u_xlat3.xy = (-u_xlat3.xy) + vs_TEXCOORD0.xy;
					    u_xlat9 = dot(u_xlat3.xy, u_xlat3.xy);
					    u_xlat3.xy = vec2(u_xlat9) * u_xlat3.xy;
					    u_xlat10_1.x = float(0.0);
					    u_xlat10_1.y = float(0.0);
					    u_xlat10_1.z = float(0.0);
					    u_xlat9 = 0.0;
					    while(true){
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb2 = !!(u_xlat9>=_Size);
					#else
					        u_xlatb2 = u_xlat9>=_Size;
					#endif
					        if(u_xlatb2){break;}
					        u_xlat2.x = u_xlat9 / _Circle;
					        u_xlat2.xy = u_xlat3.xy * u_xlat2.xx + vs_TEXCOORD0.xy;
					        u_xlat10_2.xyz = textureLod(_MainTex, u_xlat2.xy, 0.0).xyz;
					        u_xlat10_1.xyz = u_xlat10_1.xyz + u_xlat10_2.xyz;
					        u_xlat9 = u_xlat9 + 0.200000003;
					    }
					    SV_Target0.xyz = u_xlat10_1.xyz / vec3(u_xlat0);
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
					uniform 	float _CenterX;
					uniform 	float _CenterY;
					uniform 	float _Circle;
					uniform 	float _Size;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					lowp vec3 u_xlat10_1;
					vec2 u_xlat2;
					lowp vec3 u_xlat10_2;
					bool u_xlatb2;
					vec2 u_xlat3;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = _Size * 5.0;
					    u_xlat3.xy = vec2(_CenterX, _CenterY) * vec2(0.5, 0.5) + vec2(0.5, 0.5);
					    u_xlat3.xy = (-u_xlat3.xy) + vs_TEXCOORD0.xy;
					    u_xlat9 = dot(u_xlat3.xy, u_xlat3.xy);
					    u_xlat3.xy = vec2(u_xlat9) * u_xlat3.xy;
					    u_xlat10_1.x = float(0.0);
					    u_xlat10_1.y = float(0.0);
					    u_xlat10_1.z = float(0.0);
					    u_xlat9 = 0.0;
					    while(true){
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb2 = !!(u_xlat9>=_Size);
					#else
					        u_xlatb2 = u_xlat9>=_Size;
					#endif
					        if(u_xlatb2){break;}
					        u_xlat2.x = u_xlat9 / _Circle;
					        u_xlat2.xy = u_xlat3.xy * u_xlat2.xx + vs_TEXCOORD0.xy;
					        u_xlat10_2.xyz = textureLod(_MainTex, u_xlat2.xy, 0.0).xyz;
					        u_xlat10_1.xyz = u_xlat10_1.xyz + u_xlat10_2.xyz;
					        u_xlat9 = u_xlat9 + 0.200000003;
					    }
					    SV_Target0.xyz = u_xlat10_1.xyz / vec3(u_xlat0);
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
					uniform 	float _CenterX;
					uniform 	float _CenterY;
					uniform 	float _Circle;
					uniform 	float _Size;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					lowp vec3 u_xlat10_1;
					vec2 u_xlat2;
					lowp vec3 u_xlat10_2;
					bool u_xlatb2;
					vec2 u_xlat3;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = _Size * 5.0;
					    u_xlat3.xy = vec2(_CenterX, _CenterY) * vec2(0.5, 0.5) + vec2(0.5, 0.5);
					    u_xlat3.xy = (-u_xlat3.xy) + vs_TEXCOORD0.xy;
					    u_xlat9 = dot(u_xlat3.xy, u_xlat3.xy);
					    u_xlat3.xy = vec2(u_xlat9) * u_xlat3.xy;
					    u_xlat10_1.x = float(0.0);
					    u_xlat10_1.y = float(0.0);
					    u_xlat10_1.z = float(0.0);
					    u_xlat9 = 0.0;
					    while(true){
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb2 = !!(u_xlat9>=_Size);
					#else
					        u_xlatb2 = u_xlat9>=_Size;
					#endif
					        if(u_xlatb2){break;}
					        u_xlat2.x = u_xlat9 / _Circle;
					        u_xlat2.xy = u_xlat3.xy * u_xlat2.xx + vs_TEXCOORD0.xy;
					        u_xlat10_2.xyz = textureLod(_MainTex, u_xlat2.xy, 0.0).xyz;
					        u_xlat10_1.xyz = u_xlat10_1.xyz + u_xlat10_2.xyz;
					        u_xlat9 = u_xlat9 + 0.200000003;
					    }
					    SV_Target0.xyz = u_xlat10_1.xyz / vec3(u_xlat0);
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