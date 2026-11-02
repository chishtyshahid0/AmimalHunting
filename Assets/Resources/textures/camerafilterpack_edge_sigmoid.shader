Shader "CameraFilterPack/Edge_Sigmoid" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_Gain ("_Gain", Range(1, 10)) = 3
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 41892
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
					uniform highp vec4 _ScreenResolution;
					uniform highp float _Gain;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 c_1;
					  lowp vec4 colorSum_3;
					  highp vec2 p_4;
					  highp vec2 uv_5;
					  uv_5 = xlv_TEXCOORD0;
					  p_4 = (1.0/(_ScreenResolution.xy));
					  colorSum_3 = vec4(0.0, 0.0, 0.0, 0.0);
					  for (highp int a_2 = -1; float(a_2) <= 1.0; a_2++) {
					    for (highp int b_6 = -1; float(b_6) <= 1.0; b_6++) {
					      if (((float(b_6) == 0.0) && (float(a_2) == 0.0))) {
					        highp vec2 tmpvar_7;
					        tmpvar_7.x = float(b_6);
					        tmpvar_7.y = float(a_2);
					        highp vec4 tmpvar_8;
					        tmpvar_8.zw = vec2(0.0, 0.0);
					        tmpvar_8.xy = (uv_5 + (p_4 * tmpvar_7));
					        colorSum_3 = (colorSum_3 + (impl_low_texture2DLodEXT (_MainTex, tmpvar_8.xy, 0.0) * 8.0));
					      } else {
					        highp vec2 tmpvar_9;
					        tmpvar_9.x = float(b_6);
					        tmpvar_9.y = float(a_2);
					        highp vec4 tmpvar_10;
					        tmpvar_10.zw = vec2(0.0, 0.0);
					        tmpvar_10.xy = (uv_5 + (p_4 * tmpvar_9));
					        colorSum_3 = (colorSum_3 - impl_low_texture2DLodEXT (_MainTex, tmpvar_10.xy, 0.0));
					      };
					    };
					  };
					  lowp vec3 tmpvar_11;
					  tmpvar_11 = colorSum_3.xyz;
					  c_1 = tmpvar_11;
					  highp float tmpvar_12;
					  tmpvar_12 = ((1.0 - (1.0/(
					    (1.0 + exp((-9.0 * (
					      (((c_1.x + c_1.y) + c_1.z) / (10.0 - _Gain))
					     - 0.18))))
					  ))) * 2.0);
					  highp vec4 tmpvar_13;
					  tmpvar_13.w = 1.0;
					  tmpvar_13.x = tmpvar_12;
					  tmpvar_13.y = tmpvar_12;
					  tmpvar_13.z = tmpvar_12;
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
					uniform highp vec4 _ScreenResolution;
					uniform highp float _Gain;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 c_1;
					  lowp vec4 colorSum_3;
					  highp vec2 p_4;
					  highp vec2 uv_5;
					  uv_5 = xlv_TEXCOORD0;
					  p_4 = (1.0/(_ScreenResolution.xy));
					  colorSum_3 = vec4(0.0, 0.0, 0.0, 0.0);
					  for (highp int a_2 = -1; float(a_2) <= 1.0; a_2++) {
					    for (highp int b_6 = -1; float(b_6) <= 1.0; b_6++) {
					      if (((float(b_6) == 0.0) && (float(a_2) == 0.0))) {
					        highp vec2 tmpvar_7;
					        tmpvar_7.x = float(b_6);
					        tmpvar_7.y = float(a_2);
					        highp vec4 tmpvar_8;
					        tmpvar_8.zw = vec2(0.0, 0.0);
					        tmpvar_8.xy = (uv_5 + (p_4 * tmpvar_7));
					        colorSum_3 = (colorSum_3 + (impl_low_texture2DLodEXT (_MainTex, tmpvar_8.xy, 0.0) * 8.0));
					      } else {
					        highp vec2 tmpvar_9;
					        tmpvar_9.x = float(b_6);
					        tmpvar_9.y = float(a_2);
					        highp vec4 tmpvar_10;
					        tmpvar_10.zw = vec2(0.0, 0.0);
					        tmpvar_10.xy = (uv_5 + (p_4 * tmpvar_9));
					        colorSum_3 = (colorSum_3 - impl_low_texture2DLodEXT (_MainTex, tmpvar_10.xy, 0.0));
					      };
					    };
					  };
					  lowp vec3 tmpvar_11;
					  tmpvar_11 = colorSum_3.xyz;
					  c_1 = tmpvar_11;
					  highp float tmpvar_12;
					  tmpvar_12 = ((1.0 - (1.0/(
					    (1.0 + exp((-9.0 * (
					      (((c_1.x + c_1.y) + c_1.z) / (10.0 - _Gain))
					     - 0.18))))
					  ))) * 2.0);
					  highp vec4 tmpvar_13;
					  tmpvar_13.w = 1.0;
					  tmpvar_13.x = tmpvar_12;
					  tmpvar_13.y = tmpvar_12;
					  tmpvar_13.z = tmpvar_12;
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
					uniform highp vec4 _ScreenResolution;
					uniform highp float _Gain;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 c_1;
					  lowp vec4 colorSum_3;
					  highp vec2 p_4;
					  highp vec2 uv_5;
					  uv_5 = xlv_TEXCOORD0;
					  p_4 = (1.0/(_ScreenResolution.xy));
					  colorSum_3 = vec4(0.0, 0.0, 0.0, 0.0);
					  for (highp int a_2 = -1; float(a_2) <= 1.0; a_2++) {
					    for (highp int b_6 = -1; float(b_6) <= 1.0; b_6++) {
					      if (((float(b_6) == 0.0) && (float(a_2) == 0.0))) {
					        highp vec2 tmpvar_7;
					        tmpvar_7.x = float(b_6);
					        tmpvar_7.y = float(a_2);
					        highp vec4 tmpvar_8;
					        tmpvar_8.zw = vec2(0.0, 0.0);
					        tmpvar_8.xy = (uv_5 + (p_4 * tmpvar_7));
					        colorSum_3 = (colorSum_3 + (impl_low_texture2DLodEXT (_MainTex, tmpvar_8.xy, 0.0) * 8.0));
					      } else {
					        highp vec2 tmpvar_9;
					        tmpvar_9.x = float(b_6);
					        tmpvar_9.y = float(a_2);
					        highp vec4 tmpvar_10;
					        tmpvar_10.zw = vec2(0.0, 0.0);
					        tmpvar_10.xy = (uv_5 + (p_4 * tmpvar_9));
					        colorSum_3 = (colorSum_3 - impl_low_texture2DLodEXT (_MainTex, tmpvar_10.xy, 0.0));
					      };
					    };
					  };
					  lowp vec3 tmpvar_11;
					  tmpvar_11 = colorSum_3.xyz;
					  c_1 = tmpvar_11;
					  highp float tmpvar_12;
					  tmpvar_12 = ((1.0 - (1.0/(
					    (1.0 + exp((-9.0 * (
					      (((c_1.x + c_1.y) + c_1.z) / (10.0 - _Gain))
					     - 0.18))))
					  ))) * 2.0);
					  highp vec4 tmpvar_13;
					  tmpvar_13.w = 1.0;
					  tmpvar_13.x = tmpvar_12;
					  tmpvar_13.y = tmpvar_12;
					  tmpvar_13.z = tmpvar_12;
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
					uniform 	vec4 _ScreenResolution;
					uniform 	float _Gain;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump float u_xlat16_0;
					lowp vec3 u_xlat10_1;
					bool u_xlatb2;
					vec4 u_xlat3;
					mediump vec3 u_xlat16_4;
					lowp vec3 u_xlat10_4;
					vec2 u_xlat5;
					lowp vec3 u_xlat10_5;
					float u_xlat6;
					int u_xlati8;
					int u_xlati12;
					float u_xlat14;
					float u_xlat18;
					bool u_xlatb20;
					void main()
					{
					    u_xlat0.xy = vec2(1.0, 1.0) / _ScreenResolution.xy;
					    u_xlat10_1.x = float(0.0);
					    u_xlat10_1.y = float(0.0);
					    u_xlat10_1.z = float(0.0);
					    u_xlati12 = int(0xFFFFFFFFu);
					    while(true){
					        u_xlat18 = float(u_xlati12);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb2 = !!(1.0<u_xlat18);
					#else
					        u_xlatb2 = 1.0<u_xlat18;
					#endif
					        if(u_xlatb2){break;}
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb2 = !!(u_xlat18==0.0);
					#else
					        u_xlatb2 = u_xlat18==0.0;
					#endif
					        u_xlat3.yw = vec2(ivec2(u_xlati12));
					        u_xlat10_4.xyz = u_xlat10_1.xyz;
					        u_xlati8 = int(0xFFFFFFFFu);
					        while(true){
					            u_xlat14 = float(u_xlati8);
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb20 = !!(1.0<u_xlat14);
					#else
					            u_xlatb20 = 1.0<u_xlat14;
					#endif
					            if(u_xlatb20){break;}
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb20 = !!(u_xlat14==0.0);
					#else
					            u_xlatb20 = u_xlat14==0.0;
					#endif
					            u_xlatb20 = u_xlatb2 && u_xlatb20;
					            if(u_xlatb20){
					                u_xlat3.x = float(u_xlati8);
					                u_xlat5.xy = u_xlat0.xy * u_xlat3.xy + vs_TEXCOORD0.xy;
					                u_xlat10_5.xyz = textureLod(_MainTex, u_xlat5.xy, 0.0).xyz;
					                u_xlat16_4.xyz = u_xlat10_5.xyz * vec3(8.0, 8.0, 8.0) + u_xlat10_4.xyz;
					                u_xlat10_4.xyz = u_xlat16_4.xyz;
					            } else {
					                u_xlat3.z = float(u_xlati8);
					                u_xlat3.xz = u_xlat0.xy * u_xlat3.zw + vs_TEXCOORD0.xy;
					                u_xlat10_5.xyz = textureLod(_MainTex, u_xlat3.xz, 0.0).xyz;
					                u_xlat16_4.xyz = u_xlat10_4.xyz + (-u_xlat10_5.xyz);
					                u_xlat10_4.xyz = u_xlat16_4.xyz;
					            //ENDIF
					            }
					            u_xlat14 = u_xlat14 + 1.0;
					            u_xlati8 = int(u_xlat14);
					        }
					        u_xlat10_1.xyz = u_xlat10_4.xyz;
					        u_xlat18 = u_xlat18 + 1.0;
					        u_xlati12 = int(u_xlat18);
					    }
					    u_xlat16_0 = u_xlat10_1.y + u_xlat10_1.x;
					    u_xlat16_0 = u_xlat10_1.z + u_xlat16_0;
					    u_xlat6 = (-_Gain) + 10.0;
					    u_xlat0.x = u_xlat16_0 / u_xlat6;
					    u_xlat0.x = u_xlat0.x + -0.180000007;
					    u_xlat0.x = u_xlat0.x * -12.9842558;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + 1.0;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    SV_Target0.xyz = u_xlat0.xxx + u_xlat0.xxx;
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
					uniform 	vec4 _ScreenResolution;
					uniform 	float _Gain;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump float u_xlat16_0;
					lowp vec3 u_xlat10_1;
					bool u_xlatb2;
					vec4 u_xlat3;
					mediump vec3 u_xlat16_4;
					lowp vec3 u_xlat10_4;
					vec2 u_xlat5;
					lowp vec3 u_xlat10_5;
					float u_xlat6;
					int u_xlati8;
					int u_xlati12;
					float u_xlat14;
					float u_xlat18;
					bool u_xlatb20;
					void main()
					{
					    u_xlat0.xy = vec2(1.0, 1.0) / _ScreenResolution.xy;
					    u_xlat10_1.x = float(0.0);
					    u_xlat10_1.y = float(0.0);
					    u_xlat10_1.z = float(0.0);
					    u_xlati12 = int(0xFFFFFFFFu);
					    while(true){
					        u_xlat18 = float(u_xlati12);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb2 = !!(1.0<u_xlat18);
					#else
					        u_xlatb2 = 1.0<u_xlat18;
					#endif
					        if(u_xlatb2){break;}
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb2 = !!(u_xlat18==0.0);
					#else
					        u_xlatb2 = u_xlat18==0.0;
					#endif
					        u_xlat3.yw = vec2(ivec2(u_xlati12));
					        u_xlat10_4.xyz = u_xlat10_1.xyz;
					        u_xlati8 = int(0xFFFFFFFFu);
					        while(true){
					            u_xlat14 = float(u_xlati8);
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb20 = !!(1.0<u_xlat14);
					#else
					            u_xlatb20 = 1.0<u_xlat14;
					#endif
					            if(u_xlatb20){break;}
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb20 = !!(u_xlat14==0.0);
					#else
					            u_xlatb20 = u_xlat14==0.0;
					#endif
					            u_xlatb20 = u_xlatb2 && u_xlatb20;
					            if(u_xlatb20){
					                u_xlat3.x = float(u_xlati8);
					                u_xlat5.xy = u_xlat0.xy * u_xlat3.xy + vs_TEXCOORD0.xy;
					                u_xlat10_5.xyz = textureLod(_MainTex, u_xlat5.xy, 0.0).xyz;
					                u_xlat16_4.xyz = u_xlat10_5.xyz * vec3(8.0, 8.0, 8.0) + u_xlat10_4.xyz;
					                u_xlat10_4.xyz = u_xlat16_4.xyz;
					            } else {
					                u_xlat3.z = float(u_xlati8);
					                u_xlat3.xz = u_xlat0.xy * u_xlat3.zw + vs_TEXCOORD0.xy;
					                u_xlat10_5.xyz = textureLod(_MainTex, u_xlat3.xz, 0.0).xyz;
					                u_xlat16_4.xyz = u_xlat10_4.xyz + (-u_xlat10_5.xyz);
					                u_xlat10_4.xyz = u_xlat16_4.xyz;
					            //ENDIF
					            }
					            u_xlat14 = u_xlat14 + 1.0;
					            u_xlati8 = int(u_xlat14);
					        }
					        u_xlat10_1.xyz = u_xlat10_4.xyz;
					        u_xlat18 = u_xlat18 + 1.0;
					        u_xlati12 = int(u_xlat18);
					    }
					    u_xlat16_0 = u_xlat10_1.y + u_xlat10_1.x;
					    u_xlat16_0 = u_xlat10_1.z + u_xlat16_0;
					    u_xlat6 = (-_Gain) + 10.0;
					    u_xlat0.x = u_xlat16_0 / u_xlat6;
					    u_xlat0.x = u_xlat0.x + -0.180000007;
					    u_xlat0.x = u_xlat0.x * -12.9842558;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + 1.0;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    SV_Target0.xyz = u_xlat0.xxx + u_xlat0.xxx;
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
					uniform 	vec4 _ScreenResolution;
					uniform 	float _Gain;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump float u_xlat16_0;
					lowp vec3 u_xlat10_1;
					bool u_xlatb2;
					vec4 u_xlat3;
					mediump vec3 u_xlat16_4;
					lowp vec3 u_xlat10_4;
					vec2 u_xlat5;
					lowp vec3 u_xlat10_5;
					float u_xlat6;
					int u_xlati8;
					int u_xlati12;
					float u_xlat14;
					float u_xlat18;
					bool u_xlatb20;
					void main()
					{
					    u_xlat0.xy = vec2(1.0, 1.0) / _ScreenResolution.xy;
					    u_xlat10_1.x = float(0.0);
					    u_xlat10_1.y = float(0.0);
					    u_xlat10_1.z = float(0.0);
					    u_xlati12 = int(0xFFFFFFFFu);
					    while(true){
					        u_xlat18 = float(u_xlati12);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb2 = !!(1.0<u_xlat18);
					#else
					        u_xlatb2 = 1.0<u_xlat18;
					#endif
					        if(u_xlatb2){break;}
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb2 = !!(u_xlat18==0.0);
					#else
					        u_xlatb2 = u_xlat18==0.0;
					#endif
					        u_xlat3.yw = vec2(ivec2(u_xlati12));
					        u_xlat10_4.xyz = u_xlat10_1.xyz;
					        u_xlati8 = int(0xFFFFFFFFu);
					        while(true){
					            u_xlat14 = float(u_xlati8);
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb20 = !!(1.0<u_xlat14);
					#else
					            u_xlatb20 = 1.0<u_xlat14;
					#endif
					            if(u_xlatb20){break;}
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb20 = !!(u_xlat14==0.0);
					#else
					            u_xlatb20 = u_xlat14==0.0;
					#endif
					            u_xlatb20 = u_xlatb2 && u_xlatb20;
					            if(u_xlatb20){
					                u_xlat3.x = float(u_xlati8);
					                u_xlat5.xy = u_xlat0.xy * u_xlat3.xy + vs_TEXCOORD0.xy;
					                u_xlat10_5.xyz = textureLod(_MainTex, u_xlat5.xy, 0.0).xyz;
					                u_xlat16_4.xyz = u_xlat10_5.xyz * vec3(8.0, 8.0, 8.0) + u_xlat10_4.xyz;
					                u_xlat10_4.xyz = u_xlat16_4.xyz;
					            } else {
					                u_xlat3.z = float(u_xlati8);
					                u_xlat3.xz = u_xlat0.xy * u_xlat3.zw + vs_TEXCOORD0.xy;
					                u_xlat10_5.xyz = textureLod(_MainTex, u_xlat3.xz, 0.0).xyz;
					                u_xlat16_4.xyz = u_xlat10_4.xyz + (-u_xlat10_5.xyz);
					                u_xlat10_4.xyz = u_xlat16_4.xyz;
					            //ENDIF
					            }
					            u_xlat14 = u_xlat14 + 1.0;
					            u_xlati8 = int(u_xlat14);
					        }
					        u_xlat10_1.xyz = u_xlat10_4.xyz;
					        u_xlat18 = u_xlat18 + 1.0;
					        u_xlati12 = int(u_xlat18);
					    }
					    u_xlat16_0 = u_xlat10_1.y + u_xlat10_1.x;
					    u_xlat16_0 = u_xlat10_1.z + u_xlat16_0;
					    u_xlat6 = (-_Gain) + 10.0;
					    u_xlat0.x = u_xlat16_0 / u_xlat6;
					    u_xlat0.x = u_xlat0.x + -0.180000007;
					    u_xlat0.x = u_xlat0.x * -12.9842558;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + 1.0;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    SV_Target0.xyz = u_xlat0.xxx + u_xlat0.xxx;
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