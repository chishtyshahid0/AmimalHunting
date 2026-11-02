Shader "CameraFilterPack/Blur_Movie" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_Radius ("_Radius", Range(0, 1000)) = 700
		_Factor ("_Factor", Range(0, 1000)) = 200
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 39928
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
					uniform highp float _Radius;
					uniform highp float _Factor;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec2 tmpvar_1;
					  tmpvar_1 = xlv_TEXCOORD0;
					  highp vec4 accumW_3;
					  highp vec4 accumColx_4;
					  highp float radius_5;
					  highp float factor_6;
					  factor_6 = ((_Factor / _ScreenResolution.y) * 64.0);
					  radius_5 = ((_Radius / _ScreenResolution.x) * 2.0);
					  accumColx_4 = vec4(0.0, 0.0, 0.0, 0.0);
					  accumW_3 = vec4(0.0, 0.0, 0.0, 0.0);
					  for (highp float j_2 = -5.0; j_2 < 5.0; j_2 += 1.0) {
					    for (highp float u_7 = -5.0; u_7 < 5.0; u_7 += 1.0) {
					      highp vec2 tmpvar_8;
					      tmpvar_8.x = (u_7 + j_2);
					      tmpvar_8.y = (j_2 - u_7);
					      highp vec4 tmpvar_9;
					      tmpvar_9.zw = vec2(0.0, 0.0);
					      tmpvar_9.xy = (tmpvar_1 + ((
					        (1.0/(_ScreenResolution.xy))
					       * tmpvar_8) * radius_5));
					      highp vec4 tmpvar_10;
					      lowp vec4 tmpvar_11;
					      tmpvar_11 = impl_low_texture2DLodEXT (_MainTex, tmpvar_9.xy, 0.0);
					      tmpvar_10 = tmpvar_11;
					      highp vec4 tmpvar_12;
					      tmpvar_12 = (1.0 + ((tmpvar_10 * tmpvar_10) * (tmpvar_10 * factor_6)));
					      accumColx_4 = (accumColx_4 + (tmpvar_10 * tmpvar_12));
					      accumW_3 = (accumW_3 + tmpvar_12);
					    };
					  };
					  accumColx_4 = (accumColx_4 / accumW_3);
					  gl_FragData[0] = accumColx_4;
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
					uniform highp float _Radius;
					uniform highp float _Factor;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec2 tmpvar_1;
					  tmpvar_1 = xlv_TEXCOORD0;
					  highp vec4 accumW_3;
					  highp vec4 accumColx_4;
					  highp float radius_5;
					  highp float factor_6;
					  factor_6 = ((_Factor / _ScreenResolution.y) * 64.0);
					  radius_5 = ((_Radius / _ScreenResolution.x) * 2.0);
					  accumColx_4 = vec4(0.0, 0.0, 0.0, 0.0);
					  accumW_3 = vec4(0.0, 0.0, 0.0, 0.0);
					  for (highp float j_2 = -5.0; j_2 < 5.0; j_2 += 1.0) {
					    for (highp float u_7 = -5.0; u_7 < 5.0; u_7 += 1.0) {
					      highp vec2 tmpvar_8;
					      tmpvar_8.x = (u_7 + j_2);
					      tmpvar_8.y = (j_2 - u_7);
					      highp vec4 tmpvar_9;
					      tmpvar_9.zw = vec2(0.0, 0.0);
					      tmpvar_9.xy = (tmpvar_1 + ((
					        (1.0/(_ScreenResolution.xy))
					       * tmpvar_8) * radius_5));
					      highp vec4 tmpvar_10;
					      lowp vec4 tmpvar_11;
					      tmpvar_11 = impl_low_texture2DLodEXT (_MainTex, tmpvar_9.xy, 0.0);
					      tmpvar_10 = tmpvar_11;
					      highp vec4 tmpvar_12;
					      tmpvar_12 = (1.0 + ((tmpvar_10 * tmpvar_10) * (tmpvar_10 * factor_6)));
					      accumColx_4 = (accumColx_4 + (tmpvar_10 * tmpvar_12));
					      accumW_3 = (accumW_3 + tmpvar_12);
					    };
					  };
					  accumColx_4 = (accumColx_4 / accumW_3);
					  gl_FragData[0] = accumColx_4;
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
					uniform highp float _Radius;
					uniform highp float _Factor;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec2 tmpvar_1;
					  tmpvar_1 = xlv_TEXCOORD0;
					  highp vec4 accumW_3;
					  highp vec4 accumColx_4;
					  highp float radius_5;
					  highp float factor_6;
					  factor_6 = ((_Factor / _ScreenResolution.y) * 64.0);
					  radius_5 = ((_Radius / _ScreenResolution.x) * 2.0);
					  accumColx_4 = vec4(0.0, 0.0, 0.0, 0.0);
					  accumW_3 = vec4(0.0, 0.0, 0.0, 0.0);
					  for (highp float j_2 = -5.0; j_2 < 5.0; j_2 += 1.0) {
					    for (highp float u_7 = -5.0; u_7 < 5.0; u_7 += 1.0) {
					      highp vec2 tmpvar_8;
					      tmpvar_8.x = (u_7 + j_2);
					      tmpvar_8.y = (j_2 - u_7);
					      highp vec4 tmpvar_9;
					      tmpvar_9.zw = vec2(0.0, 0.0);
					      tmpvar_9.xy = (tmpvar_1 + ((
					        (1.0/(_ScreenResolution.xy))
					       * tmpvar_8) * radius_5));
					      highp vec4 tmpvar_10;
					      lowp vec4 tmpvar_11;
					      tmpvar_11 = impl_low_texture2DLodEXT (_MainTex, tmpvar_9.xy, 0.0);
					      tmpvar_10 = tmpvar_11;
					      highp vec4 tmpvar_12;
					      tmpvar_12 = (1.0 + ((tmpvar_10 * tmpvar_10) * (tmpvar_10 * factor_6)));
					      accumColx_4 = (accumColx_4 + (tmpvar_10 * tmpvar_12));
					      accumW_3 = (accumW_3 + tmpvar_12);
					    };
					  };
					  accumColx_4 = (accumColx_4 / accumW_3);
					  gl_FragData[0] = accumColx_4;
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
					uniform 	float _Radius;
					uniform 	float _Factor;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec2 u_xlat6;
					lowp vec4 u_xlat10_6;
					vec4 u_xlat7;
					mediump vec4 u_xlat16_7;
					float u_xlat8;
					float u_xlat11;
					bool u_xlatb11;
					vec2 u_xlat16;
					vec2 u_xlat19;
					bool u_xlatb19;
					void main()
					{
					    u_xlat0.xy = vec2(_Factor, _Radius) / _ScreenResolution.yx;
					    u_xlat0.x = u_xlat0.x * 64.0;
					    u_xlat8 = u_xlat0.y + u_xlat0.y;
					    u_xlat16.xy = vec2(1.0, 1.0) / _ScreenResolution.xy;
					    u_xlat1.x = float(0.0);
					    u_xlat1.y = float(0.0);
					    u_xlat1.z = float(0.0);
					    u_xlat1.w = float(0.0);
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.w = float(0.0);
					    u_xlat3 = -5.0;
					    while(true){
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb11 = !!(u_xlat3>=5.0);
					#else
					        u_xlatb11 = u_xlat3>=5.0;
					#endif
					        if(u_xlatb11){break;}
					        u_xlat4 = u_xlat1;
					        u_xlat5 = u_xlat2;
					        u_xlat11 = -5.0;
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb19 = !!(u_xlat11>=5.0);
					#else
					            u_xlatb19 = u_xlat11>=5.0;
					#endif
					            if(u_xlatb19){break;}
					            u_xlat6.x = u_xlat3 + u_xlat11;
					            u_xlat6.y = (-u_xlat11) + u_xlat3;
					            u_xlat19.xy = u_xlat16.xy * u_xlat6.xy;
					            u_xlat19.xy = u_xlat19.xy * vec2(u_xlat8) + vs_TEXCOORD0.xy;
					            u_xlat10_6 = textureLod(_MainTex, u_xlat19.xy, 0.0);
					            u_xlat16_7 = u_xlat10_6 * u_xlat10_6;
					            u_xlat16_7 = u_xlat10_6 * u_xlat16_7;
					            u_xlat7 = u_xlat16_7 * u_xlat0.xxxx + vec4(1.0, 1.0, 1.0, 1.0);
					            u_xlat4 = u_xlat10_6 * u_xlat7 + u_xlat4;
					            u_xlat5 = u_xlat5 + u_xlat7;
					            u_xlat11 = u_xlat11 + 1.0;
					        }
					        u_xlat1 = u_xlat4;
					        u_xlat2 = u_xlat5;
					        u_xlat3 = u_xlat3 + 1.0;
					    }
					    SV_Target0 = u_xlat1 / u_xlat2;
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
					uniform 	float _Radius;
					uniform 	float _Factor;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec2 u_xlat6;
					lowp vec4 u_xlat10_6;
					vec4 u_xlat7;
					mediump vec4 u_xlat16_7;
					float u_xlat8;
					float u_xlat11;
					bool u_xlatb11;
					vec2 u_xlat16;
					vec2 u_xlat19;
					bool u_xlatb19;
					void main()
					{
					    u_xlat0.xy = vec2(_Factor, _Radius) / _ScreenResolution.yx;
					    u_xlat0.x = u_xlat0.x * 64.0;
					    u_xlat8 = u_xlat0.y + u_xlat0.y;
					    u_xlat16.xy = vec2(1.0, 1.0) / _ScreenResolution.xy;
					    u_xlat1.x = float(0.0);
					    u_xlat1.y = float(0.0);
					    u_xlat1.z = float(0.0);
					    u_xlat1.w = float(0.0);
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.w = float(0.0);
					    u_xlat3 = -5.0;
					    while(true){
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb11 = !!(u_xlat3>=5.0);
					#else
					        u_xlatb11 = u_xlat3>=5.0;
					#endif
					        if(u_xlatb11){break;}
					        u_xlat4 = u_xlat1;
					        u_xlat5 = u_xlat2;
					        u_xlat11 = -5.0;
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb19 = !!(u_xlat11>=5.0);
					#else
					            u_xlatb19 = u_xlat11>=5.0;
					#endif
					            if(u_xlatb19){break;}
					            u_xlat6.x = u_xlat3 + u_xlat11;
					            u_xlat6.y = (-u_xlat11) + u_xlat3;
					            u_xlat19.xy = u_xlat16.xy * u_xlat6.xy;
					            u_xlat19.xy = u_xlat19.xy * vec2(u_xlat8) + vs_TEXCOORD0.xy;
					            u_xlat10_6 = textureLod(_MainTex, u_xlat19.xy, 0.0);
					            u_xlat16_7 = u_xlat10_6 * u_xlat10_6;
					            u_xlat16_7 = u_xlat10_6 * u_xlat16_7;
					            u_xlat7 = u_xlat16_7 * u_xlat0.xxxx + vec4(1.0, 1.0, 1.0, 1.0);
					            u_xlat4 = u_xlat10_6 * u_xlat7 + u_xlat4;
					            u_xlat5 = u_xlat5 + u_xlat7;
					            u_xlat11 = u_xlat11 + 1.0;
					        }
					        u_xlat1 = u_xlat4;
					        u_xlat2 = u_xlat5;
					        u_xlat3 = u_xlat3 + 1.0;
					    }
					    SV_Target0 = u_xlat1 / u_xlat2;
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
					uniform 	float _Radius;
					uniform 	float _Factor;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec2 u_xlat6;
					lowp vec4 u_xlat10_6;
					vec4 u_xlat7;
					mediump vec4 u_xlat16_7;
					float u_xlat8;
					float u_xlat11;
					bool u_xlatb11;
					vec2 u_xlat16;
					vec2 u_xlat19;
					bool u_xlatb19;
					void main()
					{
					    u_xlat0.xy = vec2(_Factor, _Radius) / _ScreenResolution.yx;
					    u_xlat0.x = u_xlat0.x * 64.0;
					    u_xlat8 = u_xlat0.y + u_xlat0.y;
					    u_xlat16.xy = vec2(1.0, 1.0) / _ScreenResolution.xy;
					    u_xlat1.x = float(0.0);
					    u_xlat1.y = float(0.0);
					    u_xlat1.z = float(0.0);
					    u_xlat1.w = float(0.0);
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.w = float(0.0);
					    u_xlat3 = -5.0;
					    while(true){
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb11 = !!(u_xlat3>=5.0);
					#else
					        u_xlatb11 = u_xlat3>=5.0;
					#endif
					        if(u_xlatb11){break;}
					        u_xlat4 = u_xlat1;
					        u_xlat5 = u_xlat2;
					        u_xlat11 = -5.0;
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb19 = !!(u_xlat11>=5.0);
					#else
					            u_xlatb19 = u_xlat11>=5.0;
					#endif
					            if(u_xlatb19){break;}
					            u_xlat6.x = u_xlat3 + u_xlat11;
					            u_xlat6.y = (-u_xlat11) + u_xlat3;
					            u_xlat19.xy = u_xlat16.xy * u_xlat6.xy;
					            u_xlat19.xy = u_xlat19.xy * vec2(u_xlat8) + vs_TEXCOORD0.xy;
					            u_xlat10_6 = textureLod(_MainTex, u_xlat19.xy, 0.0);
					            u_xlat16_7 = u_xlat10_6 * u_xlat10_6;
					            u_xlat16_7 = u_xlat10_6 * u_xlat16_7;
					            u_xlat7 = u_xlat16_7 * u_xlat0.xxxx + vec4(1.0, 1.0, 1.0, 1.0);
					            u_xlat4 = u_xlat10_6 * u_xlat7 + u_xlat4;
					            u_xlat5 = u_xlat5 + u_xlat7;
					            u_xlat11 = u_xlat11 + 1.0;
					        }
					        u_xlat1 = u_xlat4;
					        u_xlat2 = u_xlat5;
					        u_xlat3 = u_xlat3 + 1.0;
					    }
					    SV_Target0 = u_xlat1 / u_xlat2;
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