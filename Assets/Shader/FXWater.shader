Shader "FX/Water" {
	Properties {
		_WaveScale ("Wave scale", Range(0.02, 0.15)) = 0.063
		_ReflDistort ("Reflection distort", Range(0, 1.5)) = 0.44
		_RefrDistort ("Refraction distort", Range(0, 1.5)) = 0.4
		_RefrColor ("Refraction color", Vector) = (0.34,0.85,0.92,1)
		[NoScaleOffset] _Fresnel ("Fresnel (A) ", 2D) = "gray" {}
		[NoScaleOffset] _BumpMap ("Normalmap ", 2D) = "bump" {}
		WaveSpeed ("Wave speed (map1 x,y; map2 x,y)", Vector) = (19,9,-16,-7)
		[NoScaleOffset] _ReflectiveColor ("Reflective color (RGB) fresnel (A) ", 2D) = "" {}
		_HorizonColor ("Simple water horizon color", Vector) = (0.172,0.463,0.435,1)
		[HideInInspector] _ReflectionTex ("Internal Reflection", 2D) = "" {}
		[HideInInspector] _RefractionTex ("Internal Refraction", 2D) = "" {}
	}
	SubShader {
		Tags { "RenderType" = "Opaque" "WaterMode" = "Refractive" }
		Pass {
			Tags { "RenderType" = "Opaque" "WaterMode" = "Refractive" }
			ZClip Off
			GpuProgramID 28477
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					Keywords { "WATER_REFRACTIVE" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp vec4 _ProjectionParams;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp vec4 _WaveScale4;
					uniform highp vec4 _WaveOffset;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  highp vec4 temp_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
					  highp vec4 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
					  temp_1 = ((tmpvar_3.xzxz * _WaveScale4) + _WaveOffset);
					  highp vec4 o_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5 = (tmpvar_2 * 0.5);
					  highp vec2 tmpvar_6;
					  tmpvar_6.x = tmpvar_5.x;
					  tmpvar_6.y = (tmpvar_5.y * _ProjectionParams.x);
					  o_4.xy = (tmpvar_6 + tmpvar_5.w);
					  o_4.zw = tmpvar_2.zw;
					  gl_Position = tmpvar_2;
					  xlv_TEXCOORD0 = o_4;
					  xlv_TEXCOORD1 = temp_1.xy;
					  xlv_TEXCOORD2 = temp_1.wz;
					  xlv_TEXCOORD3 = (_WorldSpaceCameraPos - tmpvar_3.xyz).xzy;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp float _ReflDistort;
					uniform highp float _RefrDistort;
					uniform sampler2D _ReflectionTex;
					uniform sampler2D _Fresnel;
					uniform sampler2D _RefractionTex;
					uniform highp vec4 _RefrColor;
					uniform sampler2D _BumpMap;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  mediump float fresnel_1;
					  mediump vec4 refr_2;
					  highp vec4 uv2_3;
					  mediump vec4 refl_4;
					  highp vec4 uv1_5;
					  mediump float fresnelFac_6;
					  mediump vec3 bump2_7;
					  mediump vec3 bump1_8;
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = ((texture2D (_BumpMap, xlv_TEXCOORD1).xyz * 2.0) - 1.0);
					  bump1_8 = tmpvar_9;
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = ((texture2D (_BumpMap, xlv_TEXCOORD2).xyz * 2.0) - 1.0);
					  bump2_7 = tmpvar_10;
					  mediump vec3 tmpvar_11;
					  tmpvar_11 = ((bump1_8 + bump2_7) * 0.5);
					  highp float tmpvar_12;
					  tmpvar_12 = dot (normalize(xlv_TEXCOORD3), tmpvar_11);
					  fresnelFac_6 = tmpvar_12;
					  uv1_5.zw = xlv_TEXCOORD0.zw;
					  uv1_5.xy = (xlv_TEXCOORD0.xy + (tmpvar_11 * _ReflDistort).xy);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2DProj (_ReflectionTex, uv1_5);
					  refl_4 = tmpvar_13;
					  uv2_3.zw = xlv_TEXCOORD0.zw;
					  uv2_3.xy = (xlv_TEXCOORD0.xy - (tmpvar_11 * _RefrDistort).xy);
					  lowp vec4 tmpvar_14;
					  tmpvar_14 = texture2DProj (_RefractionTex, uv2_3);
					  highp vec4 tmpvar_15;
					  tmpvar_15 = (tmpvar_14 * _RefrColor);
					  refr_2 = tmpvar_15;
					  lowp float tmpvar_16;
					  tmpvar_16 = texture2D (_Fresnel, vec2(fresnelFac_6)).w;
					  fresnel_1 = tmpvar_16;
					  gl_FragData[0] = mix (refr_2, refl_4, vec4(fresnel_1));
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "WATER_REFRACTIVE" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp vec4 _ProjectionParams;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp vec4 _WaveScale4;
					uniform highp vec4 _WaveOffset;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  highp vec4 temp_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
					  highp vec4 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
					  temp_1 = ((tmpvar_3.xzxz * _WaveScale4) + _WaveOffset);
					  highp vec4 o_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5 = (tmpvar_2 * 0.5);
					  highp vec2 tmpvar_6;
					  tmpvar_6.x = tmpvar_5.x;
					  tmpvar_6.y = (tmpvar_5.y * _ProjectionParams.x);
					  o_4.xy = (tmpvar_6 + tmpvar_5.w);
					  o_4.zw = tmpvar_2.zw;
					  gl_Position = tmpvar_2;
					  xlv_TEXCOORD0 = o_4;
					  xlv_TEXCOORD1 = temp_1.xy;
					  xlv_TEXCOORD2 = temp_1.wz;
					  xlv_TEXCOORD3 = (_WorldSpaceCameraPos - tmpvar_3.xyz).xzy;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp float _ReflDistort;
					uniform highp float _RefrDistort;
					uniform sampler2D _ReflectionTex;
					uniform sampler2D _Fresnel;
					uniform sampler2D _RefractionTex;
					uniform highp vec4 _RefrColor;
					uniform sampler2D _BumpMap;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  mediump float fresnel_1;
					  mediump vec4 refr_2;
					  highp vec4 uv2_3;
					  mediump vec4 refl_4;
					  highp vec4 uv1_5;
					  mediump float fresnelFac_6;
					  mediump vec3 bump2_7;
					  mediump vec3 bump1_8;
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = ((texture2D (_BumpMap, xlv_TEXCOORD1).xyz * 2.0) - 1.0);
					  bump1_8 = tmpvar_9;
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = ((texture2D (_BumpMap, xlv_TEXCOORD2).xyz * 2.0) - 1.0);
					  bump2_7 = tmpvar_10;
					  mediump vec3 tmpvar_11;
					  tmpvar_11 = ((bump1_8 + bump2_7) * 0.5);
					  highp float tmpvar_12;
					  tmpvar_12 = dot (normalize(xlv_TEXCOORD3), tmpvar_11);
					  fresnelFac_6 = tmpvar_12;
					  uv1_5.zw = xlv_TEXCOORD0.zw;
					  uv1_5.xy = (xlv_TEXCOORD0.xy + (tmpvar_11 * _ReflDistort).xy);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2DProj (_ReflectionTex, uv1_5);
					  refl_4 = tmpvar_13;
					  uv2_3.zw = xlv_TEXCOORD0.zw;
					  uv2_3.xy = (xlv_TEXCOORD0.xy - (tmpvar_11 * _RefrDistort).xy);
					  lowp vec4 tmpvar_14;
					  tmpvar_14 = texture2DProj (_RefractionTex, uv2_3);
					  highp vec4 tmpvar_15;
					  tmpvar_15 = (tmpvar_14 * _RefrColor);
					  refr_2 = tmpvar_15;
					  lowp float tmpvar_16;
					  tmpvar_16 = texture2D (_Fresnel, vec2(fresnelFac_6)).w;
					  fresnel_1 = tmpvar_16;
					  gl_FragData[0] = mix (refr_2, refl_4, vec4(fresnel_1));
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "WATER_REFRACTIVE" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp vec4 _ProjectionParams;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp vec4 _WaveScale4;
					uniform highp vec4 _WaveOffset;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  highp vec4 temp_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
					  highp vec4 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
					  temp_1 = ((tmpvar_3.xzxz * _WaveScale4) + _WaveOffset);
					  highp vec4 o_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5 = (tmpvar_2 * 0.5);
					  highp vec2 tmpvar_6;
					  tmpvar_6.x = tmpvar_5.x;
					  tmpvar_6.y = (tmpvar_5.y * _ProjectionParams.x);
					  o_4.xy = (tmpvar_6 + tmpvar_5.w);
					  o_4.zw = tmpvar_2.zw;
					  gl_Position = tmpvar_2;
					  xlv_TEXCOORD0 = o_4;
					  xlv_TEXCOORD1 = temp_1.xy;
					  xlv_TEXCOORD2 = temp_1.wz;
					  xlv_TEXCOORD3 = (_WorldSpaceCameraPos - tmpvar_3.xyz).xzy;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp float _ReflDistort;
					uniform highp float _RefrDistort;
					uniform sampler2D _ReflectionTex;
					uniform sampler2D _Fresnel;
					uniform sampler2D _RefractionTex;
					uniform highp vec4 _RefrColor;
					uniform sampler2D _BumpMap;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  mediump float fresnel_1;
					  mediump vec4 refr_2;
					  highp vec4 uv2_3;
					  mediump vec4 refl_4;
					  highp vec4 uv1_5;
					  mediump float fresnelFac_6;
					  mediump vec3 bump2_7;
					  mediump vec3 bump1_8;
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = ((texture2D (_BumpMap, xlv_TEXCOORD1).xyz * 2.0) - 1.0);
					  bump1_8 = tmpvar_9;
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = ((texture2D (_BumpMap, xlv_TEXCOORD2).xyz * 2.0) - 1.0);
					  bump2_7 = tmpvar_10;
					  mediump vec3 tmpvar_11;
					  tmpvar_11 = ((bump1_8 + bump2_7) * 0.5);
					  highp float tmpvar_12;
					  tmpvar_12 = dot (normalize(xlv_TEXCOORD3), tmpvar_11);
					  fresnelFac_6 = tmpvar_12;
					  uv1_5.zw = xlv_TEXCOORD0.zw;
					  uv1_5.xy = (xlv_TEXCOORD0.xy + (tmpvar_11 * _ReflDistort).xy);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2DProj (_ReflectionTex, uv1_5);
					  refl_4 = tmpvar_13;
					  uv2_3.zw = xlv_TEXCOORD0.zw;
					  uv2_3.xy = (xlv_TEXCOORD0.xy - (tmpvar_11 * _RefrDistort).xy);
					  lowp vec4 tmpvar_14;
					  tmpvar_14 = texture2DProj (_RefractionTex, uv2_3);
					  highp vec4 tmpvar_15;
					  tmpvar_15 = (tmpvar_14 * _RefrColor);
					  refr_2 = tmpvar_15;
					  lowp float tmpvar_16;
					  tmpvar_16 = texture2D (_Fresnel, vec2(fresnelFac_6)).w;
					  fresnel_1 = tmpvar_16;
					  gl_FragData[0] = mix (refr_2, refl_4, vec4(fresnel_1));
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "WATER_REFRACTIVE" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 _WaveScale4;
					uniform 	vec4 _WaveOffset;
					in highp vec4 in_POSITION0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec2 vs_TEXCOORD1;
					highp  vec4 phase0_Output0_2;
					out highp vec2 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xzzx;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0].xzzx * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2].xzzx * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3].xzzx * in_POSITION0.wwww + u_xlat0;
					    phase0_Output0_2 = u_xlat0 * _WaveScale4.xywz + _WaveOffset.xywz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xzy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xzy * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xzy * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xzy * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xzy;
					vs_TEXCOORD1 = phase0_Output0_2.xy;
					vs_TEXCOORD2 = phase0_Output0_2.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	float _ReflDistort;
					uniform 	float _RefrDistort;
					uniform 	vec4 _RefrColor;
					uniform lowp sampler2D _BumpMap;
					uniform lowp sampler2D _ReflectionTex;
					uniform lowp sampler2D _RefractionTex;
					uniform lowp sampler2D _Fresnel;
					in highp vec4 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					in highp vec2 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					lowp float u_xlat10_3;
					void main()
					{
					    u_xlat10_0.xyz = texture(_BumpMap, vs_TEXCOORD1.xy).xyz;
					    u_xlat10_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat10_0.xyz = texture(_BumpMap, vs_TEXCOORD2.xy).xyz;
					    u_xlat10_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + u_xlat10_1.xyz;
					    u_xlat16_2.xyz = u_xlat10_1.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat0.xy = u_xlat16_2.xy * vec2(_ReflDistort) + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_0 = texture(_ReflectionTex, u_xlat0.xy);
					    u_xlat3.xy = (-u_xlat16_2.xy) * vec2(vec2(_RefrDistort, _RefrDistort)) + vs_TEXCOORD0.xy;
					    u_xlat3.xy = u_xlat3.xy / vs_TEXCOORD0.ww;
					    u_xlat10_1 = texture(_RefractionTex, u_xlat3.xy);
					    u_xlat16_0 = (-u_xlat10_1) * _RefrColor + u_xlat10_0;
					    u_xlat1 = u_xlat10_1 * _RefrColor;
					    u_xlat3.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat3.x = inversesqrt(u_xlat3.x);
					    u_xlat3.xyz = u_xlat3.xxx * vs_TEXCOORD3.xyz;
					    u_xlat3.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
					    u_xlat10_3 = texture(_Fresnel, u_xlat3.xx).w;
					    SV_Target0 = vec4(u_xlat10_3) * u_xlat16_0 + u_xlat1;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "WATER_REFRACTIVE" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 _WaveScale4;
					uniform 	vec4 _WaveOffset;
					in highp vec4 in_POSITION0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec2 vs_TEXCOORD1;
					highp  vec4 phase0_Output0_2;
					out highp vec2 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xzzx;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0].xzzx * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2].xzzx * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3].xzzx * in_POSITION0.wwww + u_xlat0;
					    phase0_Output0_2 = u_xlat0 * _WaveScale4.xywz + _WaveOffset.xywz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xzy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xzy * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xzy * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xzy * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xzy;
					vs_TEXCOORD1 = phase0_Output0_2.xy;
					vs_TEXCOORD2 = phase0_Output0_2.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	float _ReflDistort;
					uniform 	float _RefrDistort;
					uniform 	vec4 _RefrColor;
					uniform lowp sampler2D _BumpMap;
					uniform lowp sampler2D _ReflectionTex;
					uniform lowp sampler2D _RefractionTex;
					uniform lowp sampler2D _Fresnel;
					in highp vec4 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					in highp vec2 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					lowp float u_xlat10_3;
					void main()
					{
					    u_xlat10_0.xyz = texture(_BumpMap, vs_TEXCOORD1.xy).xyz;
					    u_xlat10_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat10_0.xyz = texture(_BumpMap, vs_TEXCOORD2.xy).xyz;
					    u_xlat10_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + u_xlat10_1.xyz;
					    u_xlat16_2.xyz = u_xlat10_1.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat0.xy = u_xlat16_2.xy * vec2(_ReflDistort) + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_0 = texture(_ReflectionTex, u_xlat0.xy);
					    u_xlat3.xy = (-u_xlat16_2.xy) * vec2(vec2(_RefrDistort, _RefrDistort)) + vs_TEXCOORD0.xy;
					    u_xlat3.xy = u_xlat3.xy / vs_TEXCOORD0.ww;
					    u_xlat10_1 = texture(_RefractionTex, u_xlat3.xy);
					    u_xlat16_0 = (-u_xlat10_1) * _RefrColor + u_xlat10_0;
					    u_xlat1 = u_xlat10_1 * _RefrColor;
					    u_xlat3.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat3.x = inversesqrt(u_xlat3.x);
					    u_xlat3.xyz = u_xlat3.xxx * vs_TEXCOORD3.xyz;
					    u_xlat3.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
					    u_xlat10_3 = texture(_Fresnel, u_xlat3.xx).w;
					    SV_Target0 = vec4(u_xlat10_3) * u_xlat16_0 + u_xlat1;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "WATER_REFRACTIVE" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 _WaveScale4;
					uniform 	vec4 _WaveOffset;
					in highp vec4 in_POSITION0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec2 vs_TEXCOORD1;
					highp  vec4 phase0_Output0_2;
					out highp vec2 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xzzx;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0].xzzx * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2].xzzx * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3].xzzx * in_POSITION0.wwww + u_xlat0;
					    phase0_Output0_2 = u_xlat0 * _WaveScale4.xywz + _WaveOffset.xywz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xzy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xzy * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xzy * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xzy * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xzy;
					vs_TEXCOORD1 = phase0_Output0_2.xy;
					vs_TEXCOORD2 = phase0_Output0_2.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	float _ReflDistort;
					uniform 	float _RefrDistort;
					uniform 	vec4 _RefrColor;
					uniform lowp sampler2D _BumpMap;
					uniform lowp sampler2D _ReflectionTex;
					uniform lowp sampler2D _RefractionTex;
					uniform lowp sampler2D _Fresnel;
					in highp vec4 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					in highp vec2 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					lowp float u_xlat10_3;
					void main()
					{
					    u_xlat10_0.xyz = texture(_BumpMap, vs_TEXCOORD1.xy).xyz;
					    u_xlat10_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat10_0.xyz = texture(_BumpMap, vs_TEXCOORD2.xy).xyz;
					    u_xlat10_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + u_xlat10_1.xyz;
					    u_xlat16_2.xyz = u_xlat10_1.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat0.xy = u_xlat16_2.xy * vec2(_ReflDistort) + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_0 = texture(_ReflectionTex, u_xlat0.xy);
					    u_xlat3.xy = (-u_xlat16_2.xy) * vec2(vec2(_RefrDistort, _RefrDistort)) + vs_TEXCOORD0.xy;
					    u_xlat3.xy = u_xlat3.xy / vs_TEXCOORD0.ww;
					    u_xlat10_1 = texture(_RefractionTex, u_xlat3.xy);
					    u_xlat16_0 = (-u_xlat10_1) * _RefrColor + u_xlat10_0;
					    u_xlat1 = u_xlat10_1 * _RefrColor;
					    u_xlat3.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat3.x = inversesqrt(u_xlat3.x);
					    u_xlat3.xyz = u_xlat3.xxx * vs_TEXCOORD3.xyz;
					    u_xlat3.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
					    u_xlat10_3 = texture(_Fresnel, u_xlat3.xx).w;
					    SV_Target0 = vec4(u_xlat10_3) * u_xlat16_0 + u_xlat1;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP2" "WATER_REFRACTIVE" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp vec4 _ProjectionParams;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _WaveScale4;
					uniform highp vec4 _WaveOffset;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD4;
					void main ()
					{
					  highp vec4 temp_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
					  highp vec4 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
					  temp_1 = ((tmpvar_3.xzxz * _WaveScale4) + _WaveOffset);
					  highp vec4 o_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5 = (tmpvar_2 * 0.5);
					  highp vec2 tmpvar_6;
					  tmpvar_6.x = tmpvar_5.x;
					  tmpvar_6.y = (tmpvar_5.y * _ProjectionParams.x);
					  o_4.xy = (tmpvar_6 + tmpvar_5.w);
					  o_4.zw = tmpvar_2.zw;
					  highp float tmpvar_7;
					  tmpvar_7 = (unity_FogParams.x * tmpvar_2.z);
					  gl_Position = tmpvar_2;
					  xlv_TEXCOORD0 = o_4;
					  xlv_TEXCOORD1 = temp_1.xy;
					  xlv_TEXCOORD2 = temp_1.wz;
					  xlv_TEXCOORD3 = (_WorldSpaceCameraPos - tmpvar_3.xyz).xzy;
					  xlv_TEXCOORD4 = exp2((-(tmpvar_7) * tmpvar_7));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform highp float _ReflDistort;
					uniform highp float _RefrDistort;
					uniform sampler2D _ReflectionTex;
					uniform sampler2D _Fresnel;
					uniform sampler2D _RefractionTex;
					uniform highp vec4 _RefrColor;
					uniform sampler2D _BumpMap;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD4;
					void main ()
					{
					  mediump float fresnel_1;
					  mediump vec4 color_2;
					  mediump vec4 refr_3;
					  highp vec4 uv2_4;
					  mediump vec4 refl_5;
					  highp vec4 uv1_6;
					  mediump float fresnelFac_7;
					  mediump vec3 bump2_8;
					  mediump vec3 bump1_9;
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = ((texture2D (_BumpMap, xlv_TEXCOORD1).xyz * 2.0) - 1.0);
					  bump1_9 = tmpvar_10;
					  lowp vec3 tmpvar_11;
					  tmpvar_11 = ((texture2D (_BumpMap, xlv_TEXCOORD2).xyz * 2.0) - 1.0);
					  bump2_8 = tmpvar_11;
					  mediump vec3 tmpvar_12;
					  tmpvar_12 = ((bump1_9 + bump2_8) * 0.5);
					  highp float tmpvar_13;
					  tmpvar_13 = dot (normalize(xlv_TEXCOORD3), tmpvar_12);
					  fresnelFac_7 = tmpvar_13;
					  uv1_6.zw = xlv_TEXCOORD0.zw;
					  uv1_6.xy = (xlv_TEXCOORD0.xy + (tmpvar_12 * _ReflDistort).xy);
					  lowp vec4 tmpvar_14;
					  tmpvar_14 = texture2DProj (_ReflectionTex, uv1_6);
					  refl_5 = tmpvar_14;
					  uv2_4.zw = xlv_TEXCOORD0.zw;
					  uv2_4.xy = (xlv_TEXCOORD0.xy - (tmpvar_12 * _RefrDistort).xy);
					  lowp vec4 tmpvar_15;
					  tmpvar_15 = texture2DProj (_RefractionTex, uv2_4);
					  highp vec4 tmpvar_16;
					  tmpvar_16 = (tmpvar_15 * _RefrColor);
					  refr_3 = tmpvar_16;
					  lowp float tmpvar_17;
					  tmpvar_17 = texture2D (_Fresnel, vec2(fresnelFac_7)).w;
					  fresnel_1 = tmpvar_17;
					  mediump vec4 tmpvar_18;
					  tmpvar_18 = mix (refr_3, refl_5, vec4(fresnel_1));
					  color_2.w = tmpvar_18.w;
					  highp float tmpvar_19;
					  tmpvar_19 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
					  color_2.xyz = mix (unity_FogColor.xyz, tmpvar_18.xyz, vec3(tmpvar_19));
					  gl_FragData[0] = color_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP2" "WATER_REFRACTIVE" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp vec4 _ProjectionParams;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _WaveScale4;
					uniform highp vec4 _WaveOffset;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD4;
					void main ()
					{
					  highp vec4 temp_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
					  highp vec4 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
					  temp_1 = ((tmpvar_3.xzxz * _WaveScale4) + _WaveOffset);
					  highp vec4 o_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5 = (tmpvar_2 * 0.5);
					  highp vec2 tmpvar_6;
					  tmpvar_6.x = tmpvar_5.x;
					  tmpvar_6.y = (tmpvar_5.y * _ProjectionParams.x);
					  o_4.xy = (tmpvar_6 + tmpvar_5.w);
					  o_4.zw = tmpvar_2.zw;
					  highp float tmpvar_7;
					  tmpvar_7 = (unity_FogParams.x * tmpvar_2.z);
					  gl_Position = tmpvar_2;
					  xlv_TEXCOORD0 = o_4;
					  xlv_TEXCOORD1 = temp_1.xy;
					  xlv_TEXCOORD2 = temp_1.wz;
					  xlv_TEXCOORD3 = (_WorldSpaceCameraPos - tmpvar_3.xyz).xzy;
					  xlv_TEXCOORD4 = exp2((-(tmpvar_7) * tmpvar_7));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform highp float _ReflDistort;
					uniform highp float _RefrDistort;
					uniform sampler2D _ReflectionTex;
					uniform sampler2D _Fresnel;
					uniform sampler2D _RefractionTex;
					uniform highp vec4 _RefrColor;
					uniform sampler2D _BumpMap;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD4;
					void main ()
					{
					  mediump float fresnel_1;
					  mediump vec4 color_2;
					  mediump vec4 refr_3;
					  highp vec4 uv2_4;
					  mediump vec4 refl_5;
					  highp vec4 uv1_6;
					  mediump float fresnelFac_7;
					  mediump vec3 bump2_8;
					  mediump vec3 bump1_9;
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = ((texture2D (_BumpMap, xlv_TEXCOORD1).xyz * 2.0) - 1.0);
					  bump1_9 = tmpvar_10;
					  lowp vec3 tmpvar_11;
					  tmpvar_11 = ((texture2D (_BumpMap, xlv_TEXCOORD2).xyz * 2.0) - 1.0);
					  bump2_8 = tmpvar_11;
					  mediump vec3 tmpvar_12;
					  tmpvar_12 = ((bump1_9 + bump2_8) * 0.5);
					  highp float tmpvar_13;
					  tmpvar_13 = dot (normalize(xlv_TEXCOORD3), tmpvar_12);
					  fresnelFac_7 = tmpvar_13;
					  uv1_6.zw = xlv_TEXCOORD0.zw;
					  uv1_6.xy = (xlv_TEXCOORD0.xy + (tmpvar_12 * _ReflDistort).xy);
					  lowp vec4 tmpvar_14;
					  tmpvar_14 = texture2DProj (_ReflectionTex, uv1_6);
					  refl_5 = tmpvar_14;
					  uv2_4.zw = xlv_TEXCOORD0.zw;
					  uv2_4.xy = (xlv_TEXCOORD0.xy - (tmpvar_12 * _RefrDistort).xy);
					  lowp vec4 tmpvar_15;
					  tmpvar_15 = texture2DProj (_RefractionTex, uv2_4);
					  highp vec4 tmpvar_16;
					  tmpvar_16 = (tmpvar_15 * _RefrColor);
					  refr_3 = tmpvar_16;
					  lowp float tmpvar_17;
					  tmpvar_17 = texture2D (_Fresnel, vec2(fresnelFac_7)).w;
					  fresnel_1 = tmpvar_17;
					  mediump vec4 tmpvar_18;
					  tmpvar_18 = mix (refr_3, refl_5, vec4(fresnel_1));
					  color_2.w = tmpvar_18.w;
					  highp float tmpvar_19;
					  tmpvar_19 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
					  color_2.xyz = mix (unity_FogColor.xyz, tmpvar_18.xyz, vec3(tmpvar_19));
					  gl_FragData[0] = color_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP2" "WATER_REFRACTIVE" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp vec4 _ProjectionParams;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _WaveScale4;
					uniform highp vec4 _WaveOffset;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD4;
					void main ()
					{
					  highp vec4 temp_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
					  highp vec4 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
					  temp_1 = ((tmpvar_3.xzxz * _WaveScale4) + _WaveOffset);
					  highp vec4 o_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5 = (tmpvar_2 * 0.5);
					  highp vec2 tmpvar_6;
					  tmpvar_6.x = tmpvar_5.x;
					  tmpvar_6.y = (tmpvar_5.y * _ProjectionParams.x);
					  o_4.xy = (tmpvar_6 + tmpvar_5.w);
					  o_4.zw = tmpvar_2.zw;
					  highp float tmpvar_7;
					  tmpvar_7 = (unity_FogParams.x * tmpvar_2.z);
					  gl_Position = tmpvar_2;
					  xlv_TEXCOORD0 = o_4;
					  xlv_TEXCOORD1 = temp_1.xy;
					  xlv_TEXCOORD2 = temp_1.wz;
					  xlv_TEXCOORD3 = (_WorldSpaceCameraPos - tmpvar_3.xyz).xzy;
					  xlv_TEXCOORD4 = exp2((-(tmpvar_7) * tmpvar_7));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform highp float _ReflDistort;
					uniform highp float _RefrDistort;
					uniform sampler2D _ReflectionTex;
					uniform sampler2D _Fresnel;
					uniform sampler2D _RefractionTex;
					uniform highp vec4 _RefrColor;
					uniform sampler2D _BumpMap;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD4;
					void main ()
					{
					  mediump float fresnel_1;
					  mediump vec4 color_2;
					  mediump vec4 refr_3;
					  highp vec4 uv2_4;
					  mediump vec4 refl_5;
					  highp vec4 uv1_6;
					  mediump float fresnelFac_7;
					  mediump vec3 bump2_8;
					  mediump vec3 bump1_9;
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = ((texture2D (_BumpMap, xlv_TEXCOORD1).xyz * 2.0) - 1.0);
					  bump1_9 = tmpvar_10;
					  lowp vec3 tmpvar_11;
					  tmpvar_11 = ((texture2D (_BumpMap, xlv_TEXCOORD2).xyz * 2.0) - 1.0);
					  bump2_8 = tmpvar_11;
					  mediump vec3 tmpvar_12;
					  tmpvar_12 = ((bump1_9 + bump2_8) * 0.5);
					  highp float tmpvar_13;
					  tmpvar_13 = dot (normalize(xlv_TEXCOORD3), tmpvar_12);
					  fresnelFac_7 = tmpvar_13;
					  uv1_6.zw = xlv_TEXCOORD0.zw;
					  uv1_6.xy = (xlv_TEXCOORD0.xy + (tmpvar_12 * _ReflDistort).xy);
					  lowp vec4 tmpvar_14;
					  tmpvar_14 = texture2DProj (_ReflectionTex, uv1_6);
					  refl_5 = tmpvar_14;
					  uv2_4.zw = xlv_TEXCOORD0.zw;
					  uv2_4.xy = (xlv_TEXCOORD0.xy - (tmpvar_12 * _RefrDistort).xy);
					  lowp vec4 tmpvar_15;
					  tmpvar_15 = texture2DProj (_RefractionTex, uv2_4);
					  highp vec4 tmpvar_16;
					  tmpvar_16 = (tmpvar_15 * _RefrColor);
					  refr_3 = tmpvar_16;
					  lowp float tmpvar_17;
					  tmpvar_17 = texture2D (_Fresnel, vec2(fresnelFac_7)).w;
					  fresnel_1 = tmpvar_17;
					  mediump vec4 tmpvar_18;
					  tmpvar_18 = mix (refr_3, refl_5, vec4(fresnel_1));
					  color_2.w = tmpvar_18.w;
					  highp float tmpvar_19;
					  tmpvar_19 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
					  color_2.xyz = mix (unity_FogColor.xyz, tmpvar_18.xyz, vec3(tmpvar_19));
					  gl_FragData[0] = color_2;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "FOG_EXP2" "WATER_REFRACTIVE" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _WaveScale4;
					uniform 	vec4 _WaveOffset;
					in highp vec4 in_POSITION0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec2 vs_TEXCOORD1;
					highp  vec4 phase0_Output0_2;
					out highp vec2 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					out highp float vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD4 = exp2(u_xlat0.x);
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xzzx;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0].xzzx * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2].xzzx * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3].xzzx * in_POSITION0.wwww + u_xlat0;
					    phase0_Output0_2 = u_xlat0 * _WaveScale4.xywz + _WaveOffset.xywz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xzy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xzy * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xzy * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xzy * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xzy;
					vs_TEXCOORD1 = phase0_Output0_2.xy;
					vs_TEXCOORD2 = phase0_Output0_2.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	lowp vec4 unity_FogColor;
					uniform 	float _ReflDistort;
					uniform 	float _RefrDistort;
					uniform 	vec4 _RefrColor;
					uniform lowp sampler2D _BumpMap;
					uniform lowp sampler2D _ReflectionTex;
					uniform lowp sampler2D _RefractionTex;
					uniform lowp sampler2D _Fresnel;
					in highp vec4 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					in highp vec2 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					in highp float vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					mediump vec3 u_xlat16_3;
					lowp float u_xlat10_3;
					float u_xlat15;
					void main()
					{
					    u_xlat10_0.xyz = texture(_BumpMap, vs_TEXCOORD1.xy).xyz;
					    u_xlat10_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat10_0.xyz = texture(_BumpMap, vs_TEXCOORD2.xy).xyz;
					    u_xlat10_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + u_xlat10_1.xyz;
					    u_xlat16_2.xyz = u_xlat10_1.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat0.xy = u_xlat16_2.xy * vec2(_ReflDistort) + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_0 = texture(_ReflectionTex, u_xlat0.xy);
					    u_xlat3.xy = (-u_xlat16_2.xy) * vec2(vec2(_RefrDistort, _RefrDistort)) + vs_TEXCOORD0.xy;
					    u_xlat3.xy = u_xlat3.xy / vs_TEXCOORD0.ww;
					    u_xlat10_1 = texture(_RefractionTex, u_xlat3.xy);
					    u_xlat16_0 = (-u_xlat10_1) * _RefrColor + u_xlat10_0;
					    u_xlat1 = u_xlat10_1 * _RefrColor;
					    u_xlat3.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat3.x = inversesqrt(u_xlat3.x);
					    u_xlat3.xyz = u_xlat3.xxx * vs_TEXCOORD3.xyz;
					    u_xlat3.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
					    u_xlat10_3 = texture(_Fresnel, u_xlat3.xx).w;
					    u_xlat16_0 = vec4(u_xlat10_3) * u_xlat16_0 + u_xlat1;
					    u_xlat16_3.xyz = u_xlat16_0.xyz + (-unity_FogColor.xyz);
					    SV_Target0.w = u_xlat16_0.w;
					    u_xlat15 = vs_TEXCOORD4;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
					#else
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					#endif
					    u_xlat3.xyz = vec3(u_xlat15) * u_xlat16_3.xyz + unity_FogColor.xyz;
					    SV_Target0.xyz = u_xlat3.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "FOG_EXP2" "WATER_REFRACTIVE" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _WaveScale4;
					uniform 	vec4 _WaveOffset;
					in highp vec4 in_POSITION0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec2 vs_TEXCOORD1;
					highp  vec4 phase0_Output0_2;
					out highp vec2 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					out highp float vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD4 = exp2(u_xlat0.x);
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xzzx;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0].xzzx * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2].xzzx * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3].xzzx * in_POSITION0.wwww + u_xlat0;
					    phase0_Output0_2 = u_xlat0 * _WaveScale4.xywz + _WaveOffset.xywz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xzy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xzy * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xzy * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xzy * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xzy;
					vs_TEXCOORD1 = phase0_Output0_2.xy;
					vs_TEXCOORD2 = phase0_Output0_2.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	lowp vec4 unity_FogColor;
					uniform 	float _ReflDistort;
					uniform 	float _RefrDistort;
					uniform 	vec4 _RefrColor;
					uniform lowp sampler2D _BumpMap;
					uniform lowp sampler2D _ReflectionTex;
					uniform lowp sampler2D _RefractionTex;
					uniform lowp sampler2D _Fresnel;
					in highp vec4 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					in highp vec2 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					in highp float vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					mediump vec3 u_xlat16_3;
					lowp float u_xlat10_3;
					float u_xlat15;
					void main()
					{
					    u_xlat10_0.xyz = texture(_BumpMap, vs_TEXCOORD1.xy).xyz;
					    u_xlat10_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat10_0.xyz = texture(_BumpMap, vs_TEXCOORD2.xy).xyz;
					    u_xlat10_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + u_xlat10_1.xyz;
					    u_xlat16_2.xyz = u_xlat10_1.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat0.xy = u_xlat16_2.xy * vec2(_ReflDistort) + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_0 = texture(_ReflectionTex, u_xlat0.xy);
					    u_xlat3.xy = (-u_xlat16_2.xy) * vec2(vec2(_RefrDistort, _RefrDistort)) + vs_TEXCOORD0.xy;
					    u_xlat3.xy = u_xlat3.xy / vs_TEXCOORD0.ww;
					    u_xlat10_1 = texture(_RefractionTex, u_xlat3.xy);
					    u_xlat16_0 = (-u_xlat10_1) * _RefrColor + u_xlat10_0;
					    u_xlat1 = u_xlat10_1 * _RefrColor;
					    u_xlat3.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat3.x = inversesqrt(u_xlat3.x);
					    u_xlat3.xyz = u_xlat3.xxx * vs_TEXCOORD3.xyz;
					    u_xlat3.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
					    u_xlat10_3 = texture(_Fresnel, u_xlat3.xx).w;
					    u_xlat16_0 = vec4(u_xlat10_3) * u_xlat16_0 + u_xlat1;
					    u_xlat16_3.xyz = u_xlat16_0.xyz + (-unity_FogColor.xyz);
					    SV_Target0.w = u_xlat16_0.w;
					    u_xlat15 = vs_TEXCOORD4;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
					#else
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					#endif
					    u_xlat3.xyz = vec3(u_xlat15) * u_xlat16_3.xyz + unity_FogColor.xyz;
					    SV_Target0.xyz = u_xlat3.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "FOG_EXP2" "WATER_REFRACTIVE" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _WaveScale4;
					uniform 	vec4 _WaveOffset;
					in highp vec4 in_POSITION0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec2 vs_TEXCOORD1;
					highp  vec4 phase0_Output0_2;
					out highp vec2 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					out highp float vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD4 = exp2(u_xlat0.x);
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xzzx;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0].xzzx * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2].xzzx * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3].xzzx * in_POSITION0.wwww + u_xlat0;
					    phase0_Output0_2 = u_xlat0 * _WaveScale4.xywz + _WaveOffset.xywz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xzy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xzy * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xzy * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xzy * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xzy;
					vs_TEXCOORD1 = phase0_Output0_2.xy;
					vs_TEXCOORD2 = phase0_Output0_2.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	lowp vec4 unity_FogColor;
					uniform 	float _ReflDistort;
					uniform 	float _RefrDistort;
					uniform 	vec4 _RefrColor;
					uniform lowp sampler2D _BumpMap;
					uniform lowp sampler2D _ReflectionTex;
					uniform lowp sampler2D _RefractionTex;
					uniform lowp sampler2D _Fresnel;
					in highp vec4 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					in highp vec2 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					in highp float vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					mediump vec3 u_xlat16_3;
					lowp float u_xlat10_3;
					float u_xlat15;
					void main()
					{
					    u_xlat10_0.xyz = texture(_BumpMap, vs_TEXCOORD1.xy).xyz;
					    u_xlat10_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat10_0.xyz = texture(_BumpMap, vs_TEXCOORD2.xy).xyz;
					    u_xlat10_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + u_xlat10_1.xyz;
					    u_xlat16_2.xyz = u_xlat10_1.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat0.xy = u_xlat16_2.xy * vec2(_ReflDistort) + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_0 = texture(_ReflectionTex, u_xlat0.xy);
					    u_xlat3.xy = (-u_xlat16_2.xy) * vec2(vec2(_RefrDistort, _RefrDistort)) + vs_TEXCOORD0.xy;
					    u_xlat3.xy = u_xlat3.xy / vs_TEXCOORD0.ww;
					    u_xlat10_1 = texture(_RefractionTex, u_xlat3.xy);
					    u_xlat16_0 = (-u_xlat10_1) * _RefrColor + u_xlat10_0;
					    u_xlat1 = u_xlat10_1 * _RefrColor;
					    u_xlat3.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat3.x = inversesqrt(u_xlat3.x);
					    u_xlat3.xyz = u_xlat3.xxx * vs_TEXCOORD3.xyz;
					    u_xlat3.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
					    u_xlat10_3 = texture(_Fresnel, u_xlat3.xx).w;
					    u_xlat16_0 = vec4(u_xlat10_3) * u_xlat16_0 + u_xlat1;
					    u_xlat16_3.xyz = u_xlat16_0.xyz + (-unity_FogColor.xyz);
					    SV_Target0.w = u_xlat16_0.w;
					    u_xlat15 = vs_TEXCOORD4;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
					#else
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					#endif
					    u_xlat3.xyz = vec3(u_xlat15) * u_xlat16_3.xyz + unity_FogColor.xyz;
					    SV_Target0.xyz = u_xlat3.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "WATER_REFLECTIVE" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp vec4 _ProjectionParams;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp vec4 _WaveScale4;
					uniform highp vec4 _WaveOffset;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  highp vec4 temp_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
					  highp vec4 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
					  temp_1 = ((tmpvar_3.xzxz * _WaveScale4) + _WaveOffset);
					  highp vec4 o_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5 = (tmpvar_2 * 0.5);
					  highp vec2 tmpvar_6;
					  tmpvar_6.x = tmpvar_5.x;
					  tmpvar_6.y = (tmpvar_5.y * _ProjectionParams.x);
					  o_4.xy = (tmpvar_6 + tmpvar_5.w);
					  o_4.zw = tmpvar_2.zw;
					  gl_Position = tmpvar_2;
					  xlv_TEXCOORD0 = o_4;
					  xlv_TEXCOORD1 = temp_1.xy;
					  xlv_TEXCOORD2 = temp_1.wz;
					  xlv_TEXCOORD3 = (_WorldSpaceCameraPos - tmpvar_3.xyz).xzy;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp float _ReflDistort;
					uniform sampler2D _ReflectionTex;
					uniform sampler2D _ReflectiveColor;
					uniform sampler2D _BumpMap;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  mediump vec4 water_1;
					  mediump vec4 color_2;
					  mediump vec4 refl_3;
					  highp vec4 uv1_4;
					  mediump float fresnelFac_5;
					  mediump vec3 bump2_6;
					  mediump vec3 bump1_7;
					  lowp vec3 tmpvar_8;
					  tmpvar_8 = ((texture2D (_BumpMap, xlv_TEXCOORD1).xyz * 2.0) - 1.0);
					  bump1_7 = tmpvar_8;
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = ((texture2D (_BumpMap, xlv_TEXCOORD2).xyz * 2.0) - 1.0);
					  bump2_6 = tmpvar_9;
					  mediump vec3 tmpvar_10;
					  tmpvar_10 = ((bump1_7 + bump2_6) * 0.5);
					  highp float tmpvar_11;
					  tmpvar_11 = dot (normalize(xlv_TEXCOORD3), tmpvar_10);
					  fresnelFac_5 = tmpvar_11;
					  uv1_4.zw = xlv_TEXCOORD0.zw;
					  uv1_4.xy = (xlv_TEXCOORD0.xy + (tmpvar_10 * _ReflDistort).xy);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2DProj (_ReflectionTex, uv1_4);
					  refl_3 = tmpvar_12;
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_ReflectiveColor, vec2(fresnelFac_5));
					  water_1 = tmpvar_13;
					  color_2.xyz = mix (water_1.xyz, refl_3.xyz, water_1.www);
					  color_2.w = (refl_3.w * water_1.w);
					  gl_FragData[0] = color_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "WATER_REFLECTIVE" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp vec4 _ProjectionParams;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp vec4 _WaveScale4;
					uniform highp vec4 _WaveOffset;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  highp vec4 temp_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
					  highp vec4 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
					  temp_1 = ((tmpvar_3.xzxz * _WaveScale4) + _WaveOffset);
					  highp vec4 o_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5 = (tmpvar_2 * 0.5);
					  highp vec2 tmpvar_6;
					  tmpvar_6.x = tmpvar_5.x;
					  tmpvar_6.y = (tmpvar_5.y * _ProjectionParams.x);
					  o_4.xy = (tmpvar_6 + tmpvar_5.w);
					  o_4.zw = tmpvar_2.zw;
					  gl_Position = tmpvar_2;
					  xlv_TEXCOORD0 = o_4;
					  xlv_TEXCOORD1 = temp_1.xy;
					  xlv_TEXCOORD2 = temp_1.wz;
					  xlv_TEXCOORD3 = (_WorldSpaceCameraPos - tmpvar_3.xyz).xzy;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp float _ReflDistort;
					uniform sampler2D _ReflectionTex;
					uniform sampler2D _ReflectiveColor;
					uniform sampler2D _BumpMap;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  mediump vec4 water_1;
					  mediump vec4 color_2;
					  mediump vec4 refl_3;
					  highp vec4 uv1_4;
					  mediump float fresnelFac_5;
					  mediump vec3 bump2_6;
					  mediump vec3 bump1_7;
					  lowp vec3 tmpvar_8;
					  tmpvar_8 = ((texture2D (_BumpMap, xlv_TEXCOORD1).xyz * 2.0) - 1.0);
					  bump1_7 = tmpvar_8;
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = ((texture2D (_BumpMap, xlv_TEXCOORD2).xyz * 2.0) - 1.0);
					  bump2_6 = tmpvar_9;
					  mediump vec3 tmpvar_10;
					  tmpvar_10 = ((bump1_7 + bump2_6) * 0.5);
					  highp float tmpvar_11;
					  tmpvar_11 = dot (normalize(xlv_TEXCOORD3), tmpvar_10);
					  fresnelFac_5 = tmpvar_11;
					  uv1_4.zw = xlv_TEXCOORD0.zw;
					  uv1_4.xy = (xlv_TEXCOORD0.xy + (tmpvar_10 * _ReflDistort).xy);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2DProj (_ReflectionTex, uv1_4);
					  refl_3 = tmpvar_12;
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_ReflectiveColor, vec2(fresnelFac_5));
					  water_1 = tmpvar_13;
					  color_2.xyz = mix (water_1.xyz, refl_3.xyz, water_1.www);
					  color_2.w = (refl_3.w * water_1.w);
					  gl_FragData[0] = color_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "WATER_REFLECTIVE" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp vec4 _ProjectionParams;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp vec4 _WaveScale4;
					uniform highp vec4 _WaveOffset;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  highp vec4 temp_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
					  highp vec4 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
					  temp_1 = ((tmpvar_3.xzxz * _WaveScale4) + _WaveOffset);
					  highp vec4 o_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5 = (tmpvar_2 * 0.5);
					  highp vec2 tmpvar_6;
					  tmpvar_6.x = tmpvar_5.x;
					  tmpvar_6.y = (tmpvar_5.y * _ProjectionParams.x);
					  o_4.xy = (tmpvar_6 + tmpvar_5.w);
					  o_4.zw = tmpvar_2.zw;
					  gl_Position = tmpvar_2;
					  xlv_TEXCOORD0 = o_4;
					  xlv_TEXCOORD1 = temp_1.xy;
					  xlv_TEXCOORD2 = temp_1.wz;
					  xlv_TEXCOORD3 = (_WorldSpaceCameraPos - tmpvar_3.xyz).xzy;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp float _ReflDistort;
					uniform sampler2D _ReflectionTex;
					uniform sampler2D _ReflectiveColor;
					uniform sampler2D _BumpMap;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  mediump vec4 water_1;
					  mediump vec4 color_2;
					  mediump vec4 refl_3;
					  highp vec4 uv1_4;
					  mediump float fresnelFac_5;
					  mediump vec3 bump2_6;
					  mediump vec3 bump1_7;
					  lowp vec3 tmpvar_8;
					  tmpvar_8 = ((texture2D (_BumpMap, xlv_TEXCOORD1).xyz * 2.0) - 1.0);
					  bump1_7 = tmpvar_8;
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = ((texture2D (_BumpMap, xlv_TEXCOORD2).xyz * 2.0) - 1.0);
					  bump2_6 = tmpvar_9;
					  mediump vec3 tmpvar_10;
					  tmpvar_10 = ((bump1_7 + bump2_6) * 0.5);
					  highp float tmpvar_11;
					  tmpvar_11 = dot (normalize(xlv_TEXCOORD3), tmpvar_10);
					  fresnelFac_5 = tmpvar_11;
					  uv1_4.zw = xlv_TEXCOORD0.zw;
					  uv1_4.xy = (xlv_TEXCOORD0.xy + (tmpvar_10 * _ReflDistort).xy);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2DProj (_ReflectionTex, uv1_4);
					  refl_3 = tmpvar_12;
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_ReflectiveColor, vec2(fresnelFac_5));
					  water_1 = tmpvar_13;
					  color_2.xyz = mix (water_1.xyz, refl_3.xyz, water_1.www);
					  color_2.w = (refl_3.w * water_1.w);
					  gl_FragData[0] = color_2;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "WATER_REFLECTIVE" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 _WaveScale4;
					uniform 	vec4 _WaveOffset;
					in highp vec4 in_POSITION0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec2 vs_TEXCOORD1;
					highp  vec4 phase0_Output0_2;
					out highp vec2 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xzzx;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0].xzzx * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2].xzzx * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3].xzzx * in_POSITION0.wwww + u_xlat0;
					    phase0_Output0_2 = u_xlat0 * _WaveScale4.xywz + _WaveOffset.xywz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xzy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xzy * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xzy * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xzy * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xzy;
					vs_TEXCOORD1 = phase0_Output0_2.xy;
					vs_TEXCOORD2 = phase0_Output0_2.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	float _ReflDistort;
					uniform lowp sampler2D _BumpMap;
					uniform lowp sampler2D _ReflectionTex;
					uniform lowp sampler2D _ReflectiveColor;
					in highp vec4 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					in highp vec2 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec2 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					void main()
					{
					    u_xlat10_0.xyz = texture(_BumpMap, vs_TEXCOORD1.xy).xyz;
					    u_xlat10_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat10_0.xyz = texture(_BumpMap, vs_TEXCOORD2.xy).xyz;
					    u_xlat10_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + u_xlat10_1.xyz;
					    u_xlat16_2.xyz = u_xlat10_1.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat0.xy = u_xlat16_2.xy * vec2(_ReflDistort) + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_0 = texture(_ReflectionTex, u_xlat0.xy);
					    u_xlat3.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat3.x = inversesqrt(u_xlat3.x);
					    u_xlat3.xyz = u_xlat3.xxx * vs_TEXCOORD3.xyz;
					    u_xlat3.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
					    u_xlat10_1 = texture(_ReflectiveColor, u_xlat3.xx);
					    u_xlat16_2.xyz = u_xlat10_0.xyz + (-u_xlat10_1.xyz);
					    SV_Target0.w = u_xlat10_0.w * u_xlat10_1.w;
					    SV_Target0.xyz = u_xlat10_1.www * u_xlat16_2.xyz + u_xlat10_1.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "WATER_REFLECTIVE" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 _WaveScale4;
					uniform 	vec4 _WaveOffset;
					in highp vec4 in_POSITION0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec2 vs_TEXCOORD1;
					highp  vec4 phase0_Output0_2;
					out highp vec2 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xzzx;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0].xzzx * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2].xzzx * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3].xzzx * in_POSITION0.wwww + u_xlat0;
					    phase0_Output0_2 = u_xlat0 * _WaveScale4.xywz + _WaveOffset.xywz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xzy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xzy * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xzy * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xzy * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xzy;
					vs_TEXCOORD1 = phase0_Output0_2.xy;
					vs_TEXCOORD2 = phase0_Output0_2.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	float _ReflDistort;
					uniform lowp sampler2D _BumpMap;
					uniform lowp sampler2D _ReflectionTex;
					uniform lowp sampler2D _ReflectiveColor;
					in highp vec4 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					in highp vec2 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec2 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					void main()
					{
					    u_xlat10_0.xyz = texture(_BumpMap, vs_TEXCOORD1.xy).xyz;
					    u_xlat10_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat10_0.xyz = texture(_BumpMap, vs_TEXCOORD2.xy).xyz;
					    u_xlat10_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + u_xlat10_1.xyz;
					    u_xlat16_2.xyz = u_xlat10_1.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat0.xy = u_xlat16_2.xy * vec2(_ReflDistort) + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_0 = texture(_ReflectionTex, u_xlat0.xy);
					    u_xlat3.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat3.x = inversesqrt(u_xlat3.x);
					    u_xlat3.xyz = u_xlat3.xxx * vs_TEXCOORD3.xyz;
					    u_xlat3.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
					    u_xlat10_1 = texture(_ReflectiveColor, u_xlat3.xx);
					    u_xlat16_2.xyz = u_xlat10_0.xyz + (-u_xlat10_1.xyz);
					    SV_Target0.w = u_xlat10_0.w * u_xlat10_1.w;
					    SV_Target0.xyz = u_xlat10_1.www * u_xlat16_2.xyz + u_xlat10_1.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "WATER_REFLECTIVE" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 _WaveScale4;
					uniform 	vec4 _WaveOffset;
					in highp vec4 in_POSITION0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec2 vs_TEXCOORD1;
					highp  vec4 phase0_Output0_2;
					out highp vec2 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xzzx;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0].xzzx * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2].xzzx * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3].xzzx * in_POSITION0.wwww + u_xlat0;
					    phase0_Output0_2 = u_xlat0 * _WaveScale4.xywz + _WaveOffset.xywz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xzy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xzy * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xzy * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xzy * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xzy;
					vs_TEXCOORD1 = phase0_Output0_2.xy;
					vs_TEXCOORD2 = phase0_Output0_2.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	float _ReflDistort;
					uniform lowp sampler2D _BumpMap;
					uniform lowp sampler2D _ReflectionTex;
					uniform lowp sampler2D _ReflectiveColor;
					in highp vec4 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					in highp vec2 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec2 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					void main()
					{
					    u_xlat10_0.xyz = texture(_BumpMap, vs_TEXCOORD1.xy).xyz;
					    u_xlat10_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat10_0.xyz = texture(_BumpMap, vs_TEXCOORD2.xy).xyz;
					    u_xlat10_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + u_xlat10_1.xyz;
					    u_xlat16_2.xyz = u_xlat10_1.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat0.xy = u_xlat16_2.xy * vec2(_ReflDistort) + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_0 = texture(_ReflectionTex, u_xlat0.xy);
					    u_xlat3.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat3.x = inversesqrt(u_xlat3.x);
					    u_xlat3.xyz = u_xlat3.xxx * vs_TEXCOORD3.xyz;
					    u_xlat3.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
					    u_xlat10_1 = texture(_ReflectiveColor, u_xlat3.xx);
					    u_xlat16_2.xyz = u_xlat10_0.xyz + (-u_xlat10_1.xyz);
					    SV_Target0.w = u_xlat10_0.w * u_xlat10_1.w;
					    SV_Target0.xyz = u_xlat10_1.www * u_xlat16_2.xyz + u_xlat10_1.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP2" "WATER_REFLECTIVE" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp vec4 _ProjectionParams;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _WaveScale4;
					uniform highp vec4 _WaveOffset;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD4;
					void main ()
					{
					  highp vec4 temp_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
					  highp vec4 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
					  temp_1 = ((tmpvar_3.xzxz * _WaveScale4) + _WaveOffset);
					  highp vec4 o_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5 = (tmpvar_2 * 0.5);
					  highp vec2 tmpvar_6;
					  tmpvar_6.x = tmpvar_5.x;
					  tmpvar_6.y = (tmpvar_5.y * _ProjectionParams.x);
					  o_4.xy = (tmpvar_6 + tmpvar_5.w);
					  o_4.zw = tmpvar_2.zw;
					  highp float tmpvar_7;
					  tmpvar_7 = (unity_FogParams.x * tmpvar_2.z);
					  gl_Position = tmpvar_2;
					  xlv_TEXCOORD0 = o_4;
					  xlv_TEXCOORD1 = temp_1.xy;
					  xlv_TEXCOORD2 = temp_1.wz;
					  xlv_TEXCOORD3 = (_WorldSpaceCameraPos - tmpvar_3.xyz).xzy;
					  xlv_TEXCOORD4 = exp2((-(tmpvar_7) * tmpvar_7));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform highp float _ReflDistort;
					uniform sampler2D _ReflectionTex;
					uniform sampler2D _ReflectiveColor;
					uniform sampler2D _BumpMap;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD4;
					void main ()
					{
					  mediump vec4 water_1;
					  mediump vec4 color_2;
					  mediump vec4 refl_3;
					  highp vec4 uv1_4;
					  mediump float fresnelFac_5;
					  mediump vec3 bump2_6;
					  mediump vec3 bump1_7;
					  lowp vec3 tmpvar_8;
					  tmpvar_8 = ((texture2D (_BumpMap, xlv_TEXCOORD1).xyz * 2.0) - 1.0);
					  bump1_7 = tmpvar_8;
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = ((texture2D (_BumpMap, xlv_TEXCOORD2).xyz * 2.0) - 1.0);
					  bump2_6 = tmpvar_9;
					  mediump vec3 tmpvar_10;
					  tmpvar_10 = ((bump1_7 + bump2_6) * 0.5);
					  highp float tmpvar_11;
					  tmpvar_11 = dot (normalize(xlv_TEXCOORD3), tmpvar_10);
					  fresnelFac_5 = tmpvar_11;
					  uv1_4.zw = xlv_TEXCOORD0.zw;
					  uv1_4.xy = (xlv_TEXCOORD0.xy + (tmpvar_10 * _ReflDistort).xy);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2DProj (_ReflectionTex, uv1_4);
					  refl_3 = tmpvar_12;
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_ReflectiveColor, vec2(fresnelFac_5));
					  water_1 = tmpvar_13;
					  color_2.xyz = mix (water_1.xyz, refl_3.xyz, water_1.www);
					  color_2.w = (refl_3.w * water_1.w);
					  highp float tmpvar_14;
					  tmpvar_14 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
					  color_2.xyz = mix (unity_FogColor.xyz, color_2.xyz, vec3(tmpvar_14));
					  gl_FragData[0] = color_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP2" "WATER_REFLECTIVE" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp vec4 _ProjectionParams;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _WaveScale4;
					uniform highp vec4 _WaveOffset;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD4;
					void main ()
					{
					  highp vec4 temp_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
					  highp vec4 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
					  temp_1 = ((tmpvar_3.xzxz * _WaveScale4) + _WaveOffset);
					  highp vec4 o_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5 = (tmpvar_2 * 0.5);
					  highp vec2 tmpvar_6;
					  tmpvar_6.x = tmpvar_5.x;
					  tmpvar_6.y = (tmpvar_5.y * _ProjectionParams.x);
					  o_4.xy = (tmpvar_6 + tmpvar_5.w);
					  o_4.zw = tmpvar_2.zw;
					  highp float tmpvar_7;
					  tmpvar_7 = (unity_FogParams.x * tmpvar_2.z);
					  gl_Position = tmpvar_2;
					  xlv_TEXCOORD0 = o_4;
					  xlv_TEXCOORD1 = temp_1.xy;
					  xlv_TEXCOORD2 = temp_1.wz;
					  xlv_TEXCOORD3 = (_WorldSpaceCameraPos - tmpvar_3.xyz).xzy;
					  xlv_TEXCOORD4 = exp2((-(tmpvar_7) * tmpvar_7));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform highp float _ReflDistort;
					uniform sampler2D _ReflectionTex;
					uniform sampler2D _ReflectiveColor;
					uniform sampler2D _BumpMap;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD4;
					void main ()
					{
					  mediump vec4 water_1;
					  mediump vec4 color_2;
					  mediump vec4 refl_3;
					  highp vec4 uv1_4;
					  mediump float fresnelFac_5;
					  mediump vec3 bump2_6;
					  mediump vec3 bump1_7;
					  lowp vec3 tmpvar_8;
					  tmpvar_8 = ((texture2D (_BumpMap, xlv_TEXCOORD1).xyz * 2.0) - 1.0);
					  bump1_7 = tmpvar_8;
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = ((texture2D (_BumpMap, xlv_TEXCOORD2).xyz * 2.0) - 1.0);
					  bump2_6 = tmpvar_9;
					  mediump vec3 tmpvar_10;
					  tmpvar_10 = ((bump1_7 + bump2_6) * 0.5);
					  highp float tmpvar_11;
					  tmpvar_11 = dot (normalize(xlv_TEXCOORD3), tmpvar_10);
					  fresnelFac_5 = tmpvar_11;
					  uv1_4.zw = xlv_TEXCOORD0.zw;
					  uv1_4.xy = (xlv_TEXCOORD0.xy + (tmpvar_10 * _ReflDistort).xy);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2DProj (_ReflectionTex, uv1_4);
					  refl_3 = tmpvar_12;
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_ReflectiveColor, vec2(fresnelFac_5));
					  water_1 = tmpvar_13;
					  color_2.xyz = mix (water_1.xyz, refl_3.xyz, water_1.www);
					  color_2.w = (refl_3.w * water_1.w);
					  highp float tmpvar_14;
					  tmpvar_14 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
					  color_2.xyz = mix (unity_FogColor.xyz, color_2.xyz, vec3(tmpvar_14));
					  gl_FragData[0] = color_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP2" "WATER_REFLECTIVE" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp vec4 _ProjectionParams;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _WaveScale4;
					uniform highp vec4 _WaveOffset;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD4;
					void main ()
					{
					  highp vec4 temp_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
					  highp vec4 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
					  temp_1 = ((tmpvar_3.xzxz * _WaveScale4) + _WaveOffset);
					  highp vec4 o_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5 = (tmpvar_2 * 0.5);
					  highp vec2 tmpvar_6;
					  tmpvar_6.x = tmpvar_5.x;
					  tmpvar_6.y = (tmpvar_5.y * _ProjectionParams.x);
					  o_4.xy = (tmpvar_6 + tmpvar_5.w);
					  o_4.zw = tmpvar_2.zw;
					  highp float tmpvar_7;
					  tmpvar_7 = (unity_FogParams.x * tmpvar_2.z);
					  gl_Position = tmpvar_2;
					  xlv_TEXCOORD0 = o_4;
					  xlv_TEXCOORD1 = temp_1.xy;
					  xlv_TEXCOORD2 = temp_1.wz;
					  xlv_TEXCOORD3 = (_WorldSpaceCameraPos - tmpvar_3.xyz).xzy;
					  xlv_TEXCOORD4 = exp2((-(tmpvar_7) * tmpvar_7));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform highp float _ReflDistort;
					uniform sampler2D _ReflectionTex;
					uniform sampler2D _ReflectiveColor;
					uniform sampler2D _BumpMap;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD4;
					void main ()
					{
					  mediump vec4 water_1;
					  mediump vec4 color_2;
					  mediump vec4 refl_3;
					  highp vec4 uv1_4;
					  mediump float fresnelFac_5;
					  mediump vec3 bump2_6;
					  mediump vec3 bump1_7;
					  lowp vec3 tmpvar_8;
					  tmpvar_8 = ((texture2D (_BumpMap, xlv_TEXCOORD1).xyz * 2.0) - 1.0);
					  bump1_7 = tmpvar_8;
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = ((texture2D (_BumpMap, xlv_TEXCOORD2).xyz * 2.0) - 1.0);
					  bump2_6 = tmpvar_9;
					  mediump vec3 tmpvar_10;
					  tmpvar_10 = ((bump1_7 + bump2_6) * 0.5);
					  highp float tmpvar_11;
					  tmpvar_11 = dot (normalize(xlv_TEXCOORD3), tmpvar_10);
					  fresnelFac_5 = tmpvar_11;
					  uv1_4.zw = xlv_TEXCOORD0.zw;
					  uv1_4.xy = (xlv_TEXCOORD0.xy + (tmpvar_10 * _ReflDistort).xy);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2DProj (_ReflectionTex, uv1_4);
					  refl_3 = tmpvar_12;
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_ReflectiveColor, vec2(fresnelFac_5));
					  water_1 = tmpvar_13;
					  color_2.xyz = mix (water_1.xyz, refl_3.xyz, water_1.www);
					  color_2.w = (refl_3.w * water_1.w);
					  highp float tmpvar_14;
					  tmpvar_14 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
					  color_2.xyz = mix (unity_FogColor.xyz, color_2.xyz, vec3(tmpvar_14));
					  gl_FragData[0] = color_2;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "FOG_EXP2" "WATER_REFLECTIVE" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _WaveScale4;
					uniform 	vec4 _WaveOffset;
					in highp vec4 in_POSITION0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec2 vs_TEXCOORD1;
					highp  vec4 phase0_Output0_2;
					out highp vec2 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					out highp float vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD4 = exp2(u_xlat0.x);
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xzzx;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0].xzzx * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2].xzzx * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3].xzzx * in_POSITION0.wwww + u_xlat0;
					    phase0_Output0_2 = u_xlat0 * _WaveScale4.xywz + _WaveOffset.xywz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xzy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xzy * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xzy * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xzy * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xzy;
					vs_TEXCOORD1 = phase0_Output0_2.xy;
					vs_TEXCOORD2 = phase0_Output0_2.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	lowp vec4 unity_FogColor;
					uniform 	float _ReflDistort;
					uniform lowp sampler2D _BumpMap;
					uniform lowp sampler2D _ReflectionTex;
					uniform lowp sampler2D _ReflectiveColor;
					in highp vec4 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					in highp vec2 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					in highp float vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					float u_xlat12;
					void main()
					{
					    u_xlat10_0.xyz = texture(_BumpMap, vs_TEXCOORD1.xy).xyz;
					    u_xlat10_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat10_0.xyz = texture(_BumpMap, vs_TEXCOORD2.xy).xyz;
					    u_xlat10_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + u_xlat10_1.xyz;
					    u_xlat16_2.xyz = u_xlat10_1.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat0.xy = u_xlat16_2.xy * vec2(_ReflDistort) + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_0 = texture(_ReflectionTex, u_xlat0.xy);
					    u_xlat3.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat3.x = inversesqrt(u_xlat3.x);
					    u_xlat3.xyz = u_xlat3.xxx * vs_TEXCOORD3.xyz;
					    u_xlat3.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
					    u_xlat10_1 = texture(_ReflectiveColor, u_xlat3.xx);
					    u_xlat16_2.xyz = u_xlat10_0.xyz + (-u_xlat10_1.xyz);
					    SV_Target0.w = u_xlat10_0.w * u_xlat10_1.w;
					    u_xlat16_2.xyz = u_xlat10_1.www * u_xlat16_2.xyz + u_xlat10_1.xyz;
					    u_xlat16_0.xyz = u_xlat16_2.xyz + (-unity_FogColor.xyz);
					    u_xlat12 = vs_TEXCOORD4;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat16_0.xyz + unity_FogColor.xyz;
					    SV_Target0.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "FOG_EXP2" "WATER_REFLECTIVE" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _WaveScale4;
					uniform 	vec4 _WaveOffset;
					in highp vec4 in_POSITION0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec2 vs_TEXCOORD1;
					highp  vec4 phase0_Output0_2;
					out highp vec2 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					out highp float vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD4 = exp2(u_xlat0.x);
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xzzx;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0].xzzx * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2].xzzx * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3].xzzx * in_POSITION0.wwww + u_xlat0;
					    phase0_Output0_2 = u_xlat0 * _WaveScale4.xywz + _WaveOffset.xywz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xzy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xzy * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xzy * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xzy * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xzy;
					vs_TEXCOORD1 = phase0_Output0_2.xy;
					vs_TEXCOORD2 = phase0_Output0_2.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	lowp vec4 unity_FogColor;
					uniform 	float _ReflDistort;
					uniform lowp sampler2D _BumpMap;
					uniform lowp sampler2D _ReflectionTex;
					uniform lowp sampler2D _ReflectiveColor;
					in highp vec4 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					in highp vec2 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					in highp float vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					float u_xlat12;
					void main()
					{
					    u_xlat10_0.xyz = texture(_BumpMap, vs_TEXCOORD1.xy).xyz;
					    u_xlat10_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat10_0.xyz = texture(_BumpMap, vs_TEXCOORD2.xy).xyz;
					    u_xlat10_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + u_xlat10_1.xyz;
					    u_xlat16_2.xyz = u_xlat10_1.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat0.xy = u_xlat16_2.xy * vec2(_ReflDistort) + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_0 = texture(_ReflectionTex, u_xlat0.xy);
					    u_xlat3.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat3.x = inversesqrt(u_xlat3.x);
					    u_xlat3.xyz = u_xlat3.xxx * vs_TEXCOORD3.xyz;
					    u_xlat3.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
					    u_xlat10_1 = texture(_ReflectiveColor, u_xlat3.xx);
					    u_xlat16_2.xyz = u_xlat10_0.xyz + (-u_xlat10_1.xyz);
					    SV_Target0.w = u_xlat10_0.w * u_xlat10_1.w;
					    u_xlat16_2.xyz = u_xlat10_1.www * u_xlat16_2.xyz + u_xlat10_1.xyz;
					    u_xlat16_0.xyz = u_xlat16_2.xyz + (-unity_FogColor.xyz);
					    u_xlat12 = vs_TEXCOORD4;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat16_0.xyz + unity_FogColor.xyz;
					    SV_Target0.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "FOG_EXP2" "WATER_REFLECTIVE" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _WaveScale4;
					uniform 	vec4 _WaveOffset;
					in highp vec4 in_POSITION0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec2 vs_TEXCOORD1;
					highp  vec4 phase0_Output0_2;
					out highp vec2 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					out highp float vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD0.zw = u_xlat0.zw;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD4 = exp2(u_xlat0.x);
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xzzx;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0].xzzx * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2].xzzx * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3].xzzx * in_POSITION0.wwww + u_xlat0;
					    phase0_Output0_2 = u_xlat0 * _WaveScale4.xywz + _WaveOffset.xywz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xzy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xzy * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xzy * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xzy * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xzy;
					vs_TEXCOORD1 = phase0_Output0_2.xy;
					vs_TEXCOORD2 = phase0_Output0_2.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	lowp vec4 unity_FogColor;
					uniform 	float _ReflDistort;
					uniform lowp sampler2D _BumpMap;
					uniform lowp sampler2D _ReflectionTex;
					uniform lowp sampler2D _ReflectiveColor;
					in highp vec4 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					in highp vec2 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					in highp float vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					float u_xlat12;
					void main()
					{
					    u_xlat10_0.xyz = texture(_BumpMap, vs_TEXCOORD1.xy).xyz;
					    u_xlat10_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat10_0.xyz = texture(_BumpMap, vs_TEXCOORD2.xy).xyz;
					    u_xlat10_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + u_xlat10_1.xyz;
					    u_xlat16_2.xyz = u_xlat10_1.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat0.xy = u_xlat16_2.xy * vec2(_ReflDistort) + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_0 = texture(_ReflectionTex, u_xlat0.xy);
					    u_xlat3.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat3.x = inversesqrt(u_xlat3.x);
					    u_xlat3.xyz = u_xlat3.xxx * vs_TEXCOORD3.xyz;
					    u_xlat3.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
					    u_xlat10_1 = texture(_ReflectiveColor, u_xlat3.xx);
					    u_xlat16_2.xyz = u_xlat10_0.xyz + (-u_xlat10_1.xyz);
					    SV_Target0.w = u_xlat10_0.w * u_xlat10_1.w;
					    u_xlat16_2.xyz = u_xlat10_1.www * u_xlat16_2.xyz + u_xlat10_1.xyz;
					    u_xlat16_0.xyz = u_xlat16_2.xyz + (-unity_FogColor.xyz);
					    u_xlat12 = vs_TEXCOORD4;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat16_0.xyz + unity_FogColor.xyz;
					    SV_Target0.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "WATER_SIMPLE" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp vec4 _WaveScale4;
					uniform highp vec4 _WaveOffset;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  highp vec4 temp_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2 = (unity_ObjectToWorld * _glesVertex);
					  temp_1 = ((tmpvar_2.xzxz * _WaveScale4) + _WaveOffset);
					  gl_Position = (glstate_matrix_mvp * _glesVertex);
					  xlv_TEXCOORD0 = temp_1.xy;
					  xlv_TEXCOORD1 = temp_1.wz;
					  xlv_TEXCOORD2 = (_WorldSpaceCameraPos - tmpvar_2.xyz).xzy;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _ReflectiveColor;
					uniform highp vec4 _HorizonColor;
					uniform sampler2D _BumpMap;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec4 water_1;
					  mediump vec4 color_2;
					  mediump float fresnelFac_3;
					  mediump vec3 bump2_4;
					  mediump vec3 bump1_5;
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = ((texture2D (_BumpMap, xlv_TEXCOORD0).xyz * 2.0) - 1.0);
					  bump1_5 = tmpvar_6;
					  lowp vec3 tmpvar_7;
					  tmpvar_7 = ((texture2D (_BumpMap, xlv_TEXCOORD1).xyz * 2.0) - 1.0);
					  bump2_4 = tmpvar_7;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = ((bump1_5 + bump2_4) * 0.5);
					  highp float tmpvar_9;
					  tmpvar_9 = dot (normalize(xlv_TEXCOORD2), tmpvar_8);
					  fresnelFac_3 = tmpvar_9;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_ReflectiveColor, vec2(fresnelFac_3));
					  water_1 = tmpvar_10;
					  highp vec3 tmpvar_11;
					  tmpvar_11 = mix (water_1.xyz, _HorizonColor.xyz, water_1.www);
					  color_2.xyz = tmpvar_11;
					  color_2.w = _HorizonColor.w;
					  gl_FragData[0] = color_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "WATER_SIMPLE" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp vec4 _WaveScale4;
					uniform highp vec4 _WaveOffset;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  highp vec4 temp_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2 = (unity_ObjectToWorld * _glesVertex);
					  temp_1 = ((tmpvar_2.xzxz * _WaveScale4) + _WaveOffset);
					  gl_Position = (glstate_matrix_mvp * _glesVertex);
					  xlv_TEXCOORD0 = temp_1.xy;
					  xlv_TEXCOORD1 = temp_1.wz;
					  xlv_TEXCOORD2 = (_WorldSpaceCameraPos - tmpvar_2.xyz).xzy;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _ReflectiveColor;
					uniform highp vec4 _HorizonColor;
					uniform sampler2D _BumpMap;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec4 water_1;
					  mediump vec4 color_2;
					  mediump float fresnelFac_3;
					  mediump vec3 bump2_4;
					  mediump vec3 bump1_5;
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = ((texture2D (_BumpMap, xlv_TEXCOORD0).xyz * 2.0) - 1.0);
					  bump1_5 = tmpvar_6;
					  lowp vec3 tmpvar_7;
					  tmpvar_7 = ((texture2D (_BumpMap, xlv_TEXCOORD1).xyz * 2.0) - 1.0);
					  bump2_4 = tmpvar_7;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = ((bump1_5 + bump2_4) * 0.5);
					  highp float tmpvar_9;
					  tmpvar_9 = dot (normalize(xlv_TEXCOORD2), tmpvar_8);
					  fresnelFac_3 = tmpvar_9;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_ReflectiveColor, vec2(fresnelFac_3));
					  water_1 = tmpvar_10;
					  highp vec3 tmpvar_11;
					  tmpvar_11 = mix (water_1.xyz, _HorizonColor.xyz, water_1.www);
					  color_2.xyz = tmpvar_11;
					  color_2.w = _HorizonColor.w;
					  gl_FragData[0] = color_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "WATER_SIMPLE" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp vec4 _WaveScale4;
					uniform highp vec4 _WaveOffset;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  highp vec4 temp_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2 = (unity_ObjectToWorld * _glesVertex);
					  temp_1 = ((tmpvar_2.xzxz * _WaveScale4) + _WaveOffset);
					  gl_Position = (glstate_matrix_mvp * _glesVertex);
					  xlv_TEXCOORD0 = temp_1.xy;
					  xlv_TEXCOORD1 = temp_1.wz;
					  xlv_TEXCOORD2 = (_WorldSpaceCameraPos - tmpvar_2.xyz).xzy;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _ReflectiveColor;
					uniform highp vec4 _HorizonColor;
					uniform sampler2D _BumpMap;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec4 water_1;
					  mediump vec4 color_2;
					  mediump float fresnelFac_3;
					  mediump vec3 bump2_4;
					  mediump vec3 bump1_5;
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = ((texture2D (_BumpMap, xlv_TEXCOORD0).xyz * 2.0) - 1.0);
					  bump1_5 = tmpvar_6;
					  lowp vec3 tmpvar_7;
					  tmpvar_7 = ((texture2D (_BumpMap, xlv_TEXCOORD1).xyz * 2.0) - 1.0);
					  bump2_4 = tmpvar_7;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = ((bump1_5 + bump2_4) * 0.5);
					  highp float tmpvar_9;
					  tmpvar_9 = dot (normalize(xlv_TEXCOORD2), tmpvar_8);
					  fresnelFac_3 = tmpvar_9;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_ReflectiveColor, vec2(fresnelFac_3));
					  water_1 = tmpvar_10;
					  highp vec3 tmpvar_11;
					  tmpvar_11 = mix (water_1.xyz, _HorizonColor.xyz, water_1.www);
					  color_2.xyz = tmpvar_11;
					  color_2.w = _HorizonColor.w;
					  gl_FragData[0] = color_2;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "WATER_SIMPLE" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 _WaveScale4;
					uniform 	vec4 _WaveOffset;
					in highp vec4 in_POSITION0;
					out highp vec2 vs_TEXCOORD0;
					highp  vec4 phase0_Output0_1;
					out highp vec2 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xzzx;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0].xzzx * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2].xzzx * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3].xzzx * in_POSITION0.wwww + u_xlat0;
					    phase0_Output0_1 = u_xlat0 * _WaveScale4.xywz + _WaveOffset.xywz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xzy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xzy * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xzy * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xzy * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xzy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec4 _HorizonColor;
					uniform lowp sampler2D _BumpMap;
					uniform lowp sampler2D _ReflectiveColor;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec3 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					void main()
					{
					    u_xlat10_0.xyz = texture(_BumpMap, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat10_0.xyz = texture(_BumpMap, vs_TEXCOORD1.xy).xyz;
					    u_xlat10_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + u_xlat10_1.xyz;
					    u_xlat16_2.xyz = u_xlat10_1.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat16_2.xyz);
					    u_xlat10_0 = texture(_ReflectiveColor, u_xlat0.xx);
					    u_xlat3.xyz = (-u_xlat10_0.xyz) + _HorizonColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.www * u_xlat3.xyz + u_xlat10_0.xyz;
					    u_xlat0.w = _HorizonColor.w;
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "WATER_SIMPLE" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 _WaveScale4;
					uniform 	vec4 _WaveOffset;
					in highp vec4 in_POSITION0;
					out highp vec2 vs_TEXCOORD0;
					highp  vec4 phase0_Output0_1;
					out highp vec2 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xzzx;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0].xzzx * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2].xzzx * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3].xzzx * in_POSITION0.wwww + u_xlat0;
					    phase0_Output0_1 = u_xlat0 * _WaveScale4.xywz + _WaveOffset.xywz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xzy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xzy * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xzy * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xzy * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xzy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec4 _HorizonColor;
					uniform lowp sampler2D _BumpMap;
					uniform lowp sampler2D _ReflectiveColor;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec3 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					void main()
					{
					    u_xlat10_0.xyz = texture(_BumpMap, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat10_0.xyz = texture(_BumpMap, vs_TEXCOORD1.xy).xyz;
					    u_xlat10_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + u_xlat10_1.xyz;
					    u_xlat16_2.xyz = u_xlat10_1.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat16_2.xyz);
					    u_xlat10_0 = texture(_ReflectiveColor, u_xlat0.xx);
					    u_xlat3.xyz = (-u_xlat10_0.xyz) + _HorizonColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.www * u_xlat3.xyz + u_xlat10_0.xyz;
					    u_xlat0.w = _HorizonColor.w;
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "WATER_SIMPLE" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 _WaveScale4;
					uniform 	vec4 _WaveOffset;
					in highp vec4 in_POSITION0;
					out highp vec2 vs_TEXCOORD0;
					highp  vec4 phase0_Output0_1;
					out highp vec2 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xzzx;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0].xzzx * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2].xzzx * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3].xzzx * in_POSITION0.wwww + u_xlat0;
					    phase0_Output0_1 = u_xlat0 * _WaveScale4.xywz + _WaveOffset.xywz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xzy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xzy * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xzy * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xzy * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xzy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec4 _HorizonColor;
					uniform lowp sampler2D _BumpMap;
					uniform lowp sampler2D _ReflectiveColor;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec3 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					void main()
					{
					    u_xlat10_0.xyz = texture(_BumpMap, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat10_0.xyz = texture(_BumpMap, vs_TEXCOORD1.xy).xyz;
					    u_xlat10_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + u_xlat10_1.xyz;
					    u_xlat16_2.xyz = u_xlat10_1.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat16_2.xyz);
					    u_xlat10_0 = texture(_ReflectiveColor, u_xlat0.xx);
					    u_xlat3.xyz = (-u_xlat10_0.xyz) + _HorizonColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.www * u_xlat3.xyz + u_xlat10_0.xyz;
					    u_xlat0.w = _HorizonColor.w;
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP2" "WATER_SIMPLE" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _WaveScale4;
					uniform highp vec4 _WaveOffset;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD4;
					void main ()
					{
					  highp vec4 temp_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
					  highp vec4 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
					  temp_1 = ((tmpvar_3.xzxz * _WaveScale4) + _WaveOffset);
					  highp float tmpvar_4;
					  tmpvar_4 = (unity_FogParams.x * tmpvar_2.z);
					  gl_Position = tmpvar_2;
					  xlv_TEXCOORD0 = temp_1.xy;
					  xlv_TEXCOORD1 = temp_1.wz;
					  xlv_TEXCOORD2 = (_WorldSpaceCameraPos - tmpvar_3.xyz).xzy;
					  xlv_TEXCOORD4 = exp2((-(tmpvar_4) * tmpvar_4));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _ReflectiveColor;
					uniform highp vec4 _HorizonColor;
					uniform sampler2D _BumpMap;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD4;
					void main ()
					{
					  mediump vec4 water_1;
					  mediump vec4 color_2;
					  mediump float fresnelFac_3;
					  mediump vec3 bump2_4;
					  mediump vec3 bump1_5;
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = ((texture2D (_BumpMap, xlv_TEXCOORD0).xyz * 2.0) - 1.0);
					  bump1_5 = tmpvar_6;
					  lowp vec3 tmpvar_7;
					  tmpvar_7 = ((texture2D (_BumpMap, xlv_TEXCOORD1).xyz * 2.0) - 1.0);
					  bump2_4 = tmpvar_7;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = ((bump1_5 + bump2_4) * 0.5);
					  highp float tmpvar_9;
					  tmpvar_9 = dot (normalize(xlv_TEXCOORD2), tmpvar_8);
					  fresnelFac_3 = tmpvar_9;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_ReflectiveColor, vec2(fresnelFac_3));
					  water_1 = tmpvar_10;
					  highp vec3 tmpvar_11;
					  tmpvar_11 = mix (water_1.xyz, _HorizonColor.xyz, water_1.www);
					  color_2.xyz = tmpvar_11;
					  color_2.w = _HorizonColor.w;
					  highp float tmpvar_12;
					  tmpvar_12 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
					  color_2.xyz = mix (unity_FogColor.xyz, color_2.xyz, vec3(tmpvar_12));
					  gl_FragData[0] = color_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP2" "WATER_SIMPLE" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _WaveScale4;
					uniform highp vec4 _WaveOffset;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD4;
					void main ()
					{
					  highp vec4 temp_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
					  highp vec4 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
					  temp_1 = ((tmpvar_3.xzxz * _WaveScale4) + _WaveOffset);
					  highp float tmpvar_4;
					  tmpvar_4 = (unity_FogParams.x * tmpvar_2.z);
					  gl_Position = tmpvar_2;
					  xlv_TEXCOORD0 = temp_1.xy;
					  xlv_TEXCOORD1 = temp_1.wz;
					  xlv_TEXCOORD2 = (_WorldSpaceCameraPos - tmpvar_3.xyz).xzy;
					  xlv_TEXCOORD4 = exp2((-(tmpvar_4) * tmpvar_4));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _ReflectiveColor;
					uniform highp vec4 _HorizonColor;
					uniform sampler2D _BumpMap;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD4;
					void main ()
					{
					  mediump vec4 water_1;
					  mediump vec4 color_2;
					  mediump float fresnelFac_3;
					  mediump vec3 bump2_4;
					  mediump vec3 bump1_5;
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = ((texture2D (_BumpMap, xlv_TEXCOORD0).xyz * 2.0) - 1.0);
					  bump1_5 = tmpvar_6;
					  lowp vec3 tmpvar_7;
					  tmpvar_7 = ((texture2D (_BumpMap, xlv_TEXCOORD1).xyz * 2.0) - 1.0);
					  bump2_4 = tmpvar_7;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = ((bump1_5 + bump2_4) * 0.5);
					  highp float tmpvar_9;
					  tmpvar_9 = dot (normalize(xlv_TEXCOORD2), tmpvar_8);
					  fresnelFac_3 = tmpvar_9;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_ReflectiveColor, vec2(fresnelFac_3));
					  water_1 = tmpvar_10;
					  highp vec3 tmpvar_11;
					  tmpvar_11 = mix (water_1.xyz, _HorizonColor.xyz, water_1.www);
					  color_2.xyz = tmpvar_11;
					  color_2.w = _HorizonColor.w;
					  highp float tmpvar_12;
					  tmpvar_12 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
					  color_2.xyz = mix (unity_FogColor.xyz, color_2.xyz, vec3(tmpvar_12));
					  gl_FragData[0] = color_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP2" "WATER_SIMPLE" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _WaveScale4;
					uniform highp vec4 _WaveOffset;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD4;
					void main ()
					{
					  highp vec4 temp_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
					  highp vec4 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
					  temp_1 = ((tmpvar_3.xzxz * _WaveScale4) + _WaveOffset);
					  highp float tmpvar_4;
					  tmpvar_4 = (unity_FogParams.x * tmpvar_2.z);
					  gl_Position = tmpvar_2;
					  xlv_TEXCOORD0 = temp_1.xy;
					  xlv_TEXCOORD1 = temp_1.wz;
					  xlv_TEXCOORD2 = (_WorldSpaceCameraPos - tmpvar_3.xyz).xzy;
					  xlv_TEXCOORD4 = exp2((-(tmpvar_4) * tmpvar_4));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _ReflectiveColor;
					uniform highp vec4 _HorizonColor;
					uniform sampler2D _BumpMap;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp float xlv_TEXCOORD4;
					void main ()
					{
					  mediump vec4 water_1;
					  mediump vec4 color_2;
					  mediump float fresnelFac_3;
					  mediump vec3 bump2_4;
					  mediump vec3 bump1_5;
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = ((texture2D (_BumpMap, xlv_TEXCOORD0).xyz * 2.0) - 1.0);
					  bump1_5 = tmpvar_6;
					  lowp vec3 tmpvar_7;
					  tmpvar_7 = ((texture2D (_BumpMap, xlv_TEXCOORD1).xyz * 2.0) - 1.0);
					  bump2_4 = tmpvar_7;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = ((bump1_5 + bump2_4) * 0.5);
					  highp float tmpvar_9;
					  tmpvar_9 = dot (normalize(xlv_TEXCOORD2), tmpvar_8);
					  fresnelFac_3 = tmpvar_9;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_ReflectiveColor, vec2(fresnelFac_3));
					  water_1 = tmpvar_10;
					  highp vec3 tmpvar_11;
					  tmpvar_11 = mix (water_1.xyz, _HorizonColor.xyz, water_1.www);
					  color_2.xyz = tmpvar_11;
					  color_2.w = _HorizonColor.w;
					  highp float tmpvar_12;
					  tmpvar_12 = clamp (xlv_TEXCOORD4, 0.0, 1.0);
					  color_2.xyz = mix (unity_FogColor.xyz, color_2.xyz, vec3(tmpvar_12));
					  gl_FragData[0] = color_2;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "FOG_EXP2" "WATER_SIMPLE" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _WaveScale4;
					uniform 	vec4 _WaveOffset;
					in highp vec4 in_POSITION0;
					out highp vec2 vs_TEXCOORD0;
					highp  vec4 phase0_Output0_1;
					out highp vec2 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp float vs_TEXCOORD4;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD4 = exp2(u_xlat0.x);
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xzzx;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0].xzzx * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2].xzzx * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3].xzzx * in_POSITION0.wwww + u_xlat0;
					    phase0_Output0_1 = u_xlat0 * _WaveScale4.xywz + _WaveOffset.xywz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xzy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xzy * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xzy * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xzy * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xzy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	lowp vec4 unity_FogColor;
					uniform 	vec4 _HorizonColor;
					uniform lowp sampler2D _BumpMap;
					uniform lowp sampler2D _ReflectiveColor;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in highp float vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec3 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					float u_xlat12;
					void main()
					{
					    u_xlat10_0.xyz = texture(_BumpMap, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat10_0.xyz = texture(_BumpMap, vs_TEXCOORD1.xy).xyz;
					    u_xlat10_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + u_xlat10_1.xyz;
					    u_xlat16_2.xyz = u_xlat10_1.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat16_2.xyz);
					    u_xlat10_0 = texture(_ReflectiveColor, u_xlat0.xx);
					    u_xlat3.xyz = (-u_xlat10_0.xyz) + _HorizonColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.www * u_xlat3.xyz + u_xlat10_0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
					    u_xlat12 = vs_TEXCOORD4;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz + unity_FogColor.xyz;
					    u_xlat0.w = _HorizonColor.w;
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "FOG_EXP2" "WATER_SIMPLE" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _WaveScale4;
					uniform 	vec4 _WaveOffset;
					in highp vec4 in_POSITION0;
					out highp vec2 vs_TEXCOORD0;
					highp  vec4 phase0_Output0_1;
					out highp vec2 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp float vs_TEXCOORD4;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD4 = exp2(u_xlat0.x);
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xzzx;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0].xzzx * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2].xzzx * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3].xzzx * in_POSITION0.wwww + u_xlat0;
					    phase0_Output0_1 = u_xlat0 * _WaveScale4.xywz + _WaveOffset.xywz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xzy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xzy * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xzy * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xzy * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xzy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	lowp vec4 unity_FogColor;
					uniform 	vec4 _HorizonColor;
					uniform lowp sampler2D _BumpMap;
					uniform lowp sampler2D _ReflectiveColor;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in highp float vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec3 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					float u_xlat12;
					void main()
					{
					    u_xlat10_0.xyz = texture(_BumpMap, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat10_0.xyz = texture(_BumpMap, vs_TEXCOORD1.xy).xyz;
					    u_xlat10_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + u_xlat10_1.xyz;
					    u_xlat16_2.xyz = u_xlat10_1.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat16_2.xyz);
					    u_xlat10_0 = texture(_ReflectiveColor, u_xlat0.xx);
					    u_xlat3.xyz = (-u_xlat10_0.xyz) + _HorizonColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.www * u_xlat3.xyz + u_xlat10_0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
					    u_xlat12 = vs_TEXCOORD4;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz + unity_FogColor.xyz;
					    u_xlat0.w = _HorizonColor.w;
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "FOG_EXP2" "WATER_SIMPLE" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _WaveScale4;
					uniform 	vec4 _WaveOffset;
					in highp vec4 in_POSITION0;
					out highp vec2 vs_TEXCOORD0;
					highp  vec4 phase0_Output0_1;
					out highp vec2 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp float vs_TEXCOORD4;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD4 = exp2(u_xlat0.x);
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xzzx;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0].xzzx * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2].xzzx * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3].xzzx * in_POSITION0.wwww + u_xlat0;
					    phase0_Output0_1 = u_xlat0 * _WaveScale4.xywz + _WaveOffset.xywz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xzy;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xzy * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xzy * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xzy * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xzy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	lowp vec4 unity_FogColor;
					uniform 	vec4 _HorizonColor;
					uniform lowp sampler2D _BumpMap;
					uniform lowp sampler2D _ReflectiveColor;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in highp float vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec3 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					float u_xlat12;
					void main()
					{
					    u_xlat10_0.xyz = texture(_BumpMap, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat10_0.xyz = texture(_BumpMap, vs_TEXCOORD1.xy).xyz;
					    u_xlat10_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + u_xlat10_1.xyz;
					    u_xlat16_2.xyz = u_xlat10_1.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat16_2.xyz);
					    u_xlat10_0 = texture(_ReflectiveColor, u_xlat0.xx);
					    u_xlat3.xyz = (-u_xlat10_0.xyz) + _HorizonColor.xyz;
					    u_xlat0.xyz = u_xlat10_0.www * u_xlat3.xyz + u_xlat10_0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
					    u_xlat12 = vs_TEXCOORD4;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz + unity_FogColor.xyz;
					    u_xlat0.w = _HorizonColor.w;
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles hw_tier00 " {
					Keywords { "WATER_REFRACTIVE" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "WATER_REFRACTIVE" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "WATER_REFRACTIVE" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "WATER_REFRACTIVE" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "WATER_REFRACTIVE" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "WATER_REFRACTIVE" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP2" "WATER_REFRACTIVE" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP2" "WATER_REFRACTIVE" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP2" "WATER_REFRACTIVE" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "FOG_EXP2" "WATER_REFRACTIVE" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "FOG_EXP2" "WATER_REFRACTIVE" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "FOG_EXP2" "WATER_REFRACTIVE" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "WATER_REFLECTIVE" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "WATER_REFLECTIVE" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "WATER_REFLECTIVE" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "WATER_REFLECTIVE" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "WATER_REFLECTIVE" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "WATER_REFLECTIVE" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP2" "WATER_REFLECTIVE" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP2" "WATER_REFLECTIVE" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP2" "WATER_REFLECTIVE" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "FOG_EXP2" "WATER_REFLECTIVE" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "FOG_EXP2" "WATER_REFLECTIVE" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "FOG_EXP2" "WATER_REFLECTIVE" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "WATER_SIMPLE" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "WATER_SIMPLE" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "WATER_SIMPLE" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "WATER_SIMPLE" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "WATER_SIMPLE" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "WATER_SIMPLE" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP2" "WATER_SIMPLE" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP2" "WATER_SIMPLE" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP2" "WATER_SIMPLE" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "FOG_EXP2" "WATER_SIMPLE" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "FOG_EXP2" "WATER_SIMPLE" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "FOG_EXP2" "WATER_SIMPLE" }
					"!!GLES3"
				}
			}
		}
	}
}