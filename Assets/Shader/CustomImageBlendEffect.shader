Shader "Custom/ImageBlendEffect" {
	Properties {
		_MainTex ("Base", 2D) = "" {}
		_BlendTex ("Image", 2D) = "" {}
		_BumpMap ("Normalmap", 2D) = "bump" {}
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			Fog {
				Mode Off
			}
			GpuProgramID 53706
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec2 tmpvar_1;
					  tmpvar_1 = _glesMultiTexCoord0.xy;
					  highp vec2 tmpvar_2;
					  tmpvar_2 = tmpvar_1;
					  gl_Position = (glstate_matrix_mvp * _glesVertex);
					  xlv_TEXCOORD0 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform sampler2D _BlendTex;
					uniform sampler2D _BumpMap;
					uniform highp float _BlendAmount;
					uniform highp float _EdgeSharpness;
					uniform highp float _Distortion;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec4 tmpvar_1;
					  highp vec4 overlayColor_2;
					  highp vec4 mainColor_3;
					  mediump vec2 bump_4;
					  highp vec4 blendColor_5;
					  lowp vec4 tmpvar_6;
					  tmpvar_6 = texture2D (_BlendTex, xlv_TEXCOORD0);
					  blendColor_5 = tmpvar_6;
					  blendColor_5.w = (blendColor_5.w + ((_BlendAmount * 2.0) - 1.0));
					  blendColor_5.w = clamp (((blendColor_5.w * _EdgeSharpness) - (
					    (_EdgeSharpness - 1.0)
					   * 0.5)), 0.0, 1.0);
					  lowp vec2 tmpvar_7;
					  tmpvar_7 = ((texture2D (_BumpMap, xlv_TEXCOORD0).xyz * 2.0) - 1.0).xy;
					  bump_4 = tmpvar_7;
					  lowp vec4 tmpvar_8;
					  highp vec2 P_9;
					  P_9 = (xlv_TEXCOORD0 + ((bump_4 * blendColor_5.w) * _Distortion));
					  tmpvar_8 = texture2D (_MainTex, P_9);
					  mainColor_3 = tmpvar_8;
					  overlayColor_2.w = blendColor_5.w;
					  overlayColor_2.xyz = ((mainColor_3.xyz * (blendColor_5.xyz + 0.5)) * 1.2);
					  highp vec4 tmpvar_10;
					  tmpvar_10 = mix (blendColor_5, overlayColor_2, vec4(0.3, 0.3, 0.3, 0.3));
					  blendColor_5 = tmpvar_10;
					  mainColor_3.xyz = (mainColor_3.xyz * (1.0 - (tmpvar_10.w * 0.5)));
					  highp vec4 tmpvar_11;
					  tmpvar_11 = mix (mainColor_3, tmpvar_10, tmpvar_10.wwww);
					  tmpvar_1 = tmpvar_11;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec2 tmpvar_1;
					  tmpvar_1 = _glesMultiTexCoord0.xy;
					  highp vec2 tmpvar_2;
					  tmpvar_2 = tmpvar_1;
					  gl_Position = (glstate_matrix_mvp * _glesVertex);
					  xlv_TEXCOORD0 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform sampler2D _BlendTex;
					uniform sampler2D _BumpMap;
					uniform highp float _BlendAmount;
					uniform highp float _EdgeSharpness;
					uniform highp float _Distortion;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec4 tmpvar_1;
					  highp vec4 overlayColor_2;
					  highp vec4 mainColor_3;
					  mediump vec2 bump_4;
					  highp vec4 blendColor_5;
					  lowp vec4 tmpvar_6;
					  tmpvar_6 = texture2D (_BlendTex, xlv_TEXCOORD0);
					  blendColor_5 = tmpvar_6;
					  blendColor_5.w = (blendColor_5.w + ((_BlendAmount * 2.0) - 1.0));
					  blendColor_5.w = clamp (((blendColor_5.w * _EdgeSharpness) - (
					    (_EdgeSharpness - 1.0)
					   * 0.5)), 0.0, 1.0);
					  lowp vec2 tmpvar_7;
					  tmpvar_7 = ((texture2D (_BumpMap, xlv_TEXCOORD0).xyz * 2.0) - 1.0).xy;
					  bump_4 = tmpvar_7;
					  lowp vec4 tmpvar_8;
					  highp vec2 P_9;
					  P_9 = (xlv_TEXCOORD0 + ((bump_4 * blendColor_5.w) * _Distortion));
					  tmpvar_8 = texture2D (_MainTex, P_9);
					  mainColor_3 = tmpvar_8;
					  overlayColor_2.w = blendColor_5.w;
					  overlayColor_2.xyz = ((mainColor_3.xyz * (blendColor_5.xyz + 0.5)) * 1.2);
					  highp vec4 tmpvar_10;
					  tmpvar_10 = mix (blendColor_5, overlayColor_2, vec4(0.3, 0.3, 0.3, 0.3));
					  blendColor_5 = tmpvar_10;
					  mainColor_3.xyz = (mainColor_3.xyz * (1.0 - (tmpvar_10.w * 0.5)));
					  highp vec4 tmpvar_11;
					  tmpvar_11 = mix (mainColor_3, tmpvar_10, tmpvar_10.wwww);
					  tmpvar_1 = tmpvar_11;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec2 tmpvar_1;
					  tmpvar_1 = _glesMultiTexCoord0.xy;
					  highp vec2 tmpvar_2;
					  tmpvar_2 = tmpvar_1;
					  gl_Position = (glstate_matrix_mvp * _glesVertex);
					  xlv_TEXCOORD0 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform sampler2D _BlendTex;
					uniform sampler2D _BumpMap;
					uniform highp float _BlendAmount;
					uniform highp float _EdgeSharpness;
					uniform highp float _Distortion;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec4 tmpvar_1;
					  highp vec4 overlayColor_2;
					  highp vec4 mainColor_3;
					  mediump vec2 bump_4;
					  highp vec4 blendColor_5;
					  lowp vec4 tmpvar_6;
					  tmpvar_6 = texture2D (_BlendTex, xlv_TEXCOORD0);
					  blendColor_5 = tmpvar_6;
					  blendColor_5.w = (blendColor_5.w + ((_BlendAmount * 2.0) - 1.0));
					  blendColor_5.w = clamp (((blendColor_5.w * _EdgeSharpness) - (
					    (_EdgeSharpness - 1.0)
					   * 0.5)), 0.0, 1.0);
					  lowp vec2 tmpvar_7;
					  tmpvar_7 = ((texture2D (_BumpMap, xlv_TEXCOORD0).xyz * 2.0) - 1.0).xy;
					  bump_4 = tmpvar_7;
					  lowp vec4 tmpvar_8;
					  highp vec2 P_9;
					  P_9 = (xlv_TEXCOORD0 + ((bump_4 * blendColor_5.w) * _Distortion));
					  tmpvar_8 = texture2D (_MainTex, P_9);
					  mainColor_3 = tmpvar_8;
					  overlayColor_2.w = blendColor_5.w;
					  overlayColor_2.xyz = ((mainColor_3.xyz * (blendColor_5.xyz + 0.5)) * 1.2);
					  highp vec4 tmpvar_10;
					  tmpvar_10 = mix (blendColor_5, overlayColor_2, vec4(0.3, 0.3, 0.3, 0.3));
					  blendColor_5 = tmpvar_10;
					  mainColor_3.xyz = (mainColor_3.xyz * (1.0 - (tmpvar_10.w * 0.5)));
					  highp vec4 tmpvar_11;
					  tmpvar_11 = mix (mainColor_3, tmpvar_10, tmpvar_10.wwww);
					  tmpvar_1 = tmpvar_11;
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
					in mediump vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	float _BlendAmount;
					uniform 	float _EdgeSharpness;
					uniform 	float _Distortion;
					uniform lowp sampler2D _BlendTex;
					uniform lowp sampler2D _BumpMap;
					uniform lowp sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec2 u_xlat10_0;
					vec4 u_xlat1;
					lowp vec2 u_xlat10_1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					void main()
					{
					    u_xlat10_0.xy = texture(_BumpMap, vs_TEXCOORD0.xy).xy;
					    u_xlat10_1.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0.x = _EdgeSharpness + -1.0;
					    u_xlat0.x = u_xlat0.x * 0.5;
					    u_xlat2 = texture(_BlendTex, vs_TEXCOORD0.xy);
					    u_xlat4 = _BlendAmount * 2.0 + u_xlat2.w;
					    u_xlat4 = u_xlat4 + -1.0;
					    u_xlat2.w = u_xlat4 * _EdgeSharpness + (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat2.w = min(max(u_xlat2.w, 0.0), 1.0);
					#else
					    u_xlat2.w = clamp(u_xlat2.w, 0.0, 1.0);
					#endif
					    u_xlat0.xy = u_xlat10_1.xy * u_xlat2.ww;
					    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Distortion, _Distortion)) + vs_TEXCOORD0.xy;
					    u_xlat0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat3.xyz = u_xlat2.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = u_xlat0.xyz * u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat3.xyz * vec3(1.20000005, 1.20000005, 1.20000005) + (-u_xlat2.xyz);
					    u_xlat1.xyz = u_xlat3.xyz * vec3(0.300000012, 0.300000012, 0.300000012);
					    u_xlat1.w = 0.0;
					    u_xlat1 = u_xlat1 + u_xlat2;
					    u_xlat2.x = (-u_xlat1.w) * 0.5 + 1.0;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xxx;
					    u_xlat2 = (-u_xlat0) + u_xlat1;
					    u_xlat0 = u_xlat1.wwww * u_xlat2 + u_xlat0;
					    SV_Target0 = u_xlat0;
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
					in mediump vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	float _BlendAmount;
					uniform 	float _EdgeSharpness;
					uniform 	float _Distortion;
					uniform lowp sampler2D _BlendTex;
					uniform lowp sampler2D _BumpMap;
					uniform lowp sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec2 u_xlat10_0;
					vec4 u_xlat1;
					lowp vec2 u_xlat10_1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					void main()
					{
					    u_xlat10_0.xy = texture(_BumpMap, vs_TEXCOORD0.xy).xy;
					    u_xlat10_1.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0.x = _EdgeSharpness + -1.0;
					    u_xlat0.x = u_xlat0.x * 0.5;
					    u_xlat2 = texture(_BlendTex, vs_TEXCOORD0.xy);
					    u_xlat4 = _BlendAmount * 2.0 + u_xlat2.w;
					    u_xlat4 = u_xlat4 + -1.0;
					    u_xlat2.w = u_xlat4 * _EdgeSharpness + (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat2.w = min(max(u_xlat2.w, 0.0), 1.0);
					#else
					    u_xlat2.w = clamp(u_xlat2.w, 0.0, 1.0);
					#endif
					    u_xlat0.xy = u_xlat10_1.xy * u_xlat2.ww;
					    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Distortion, _Distortion)) + vs_TEXCOORD0.xy;
					    u_xlat0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat3.xyz = u_xlat2.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = u_xlat0.xyz * u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat3.xyz * vec3(1.20000005, 1.20000005, 1.20000005) + (-u_xlat2.xyz);
					    u_xlat1.xyz = u_xlat3.xyz * vec3(0.300000012, 0.300000012, 0.300000012);
					    u_xlat1.w = 0.0;
					    u_xlat1 = u_xlat1 + u_xlat2;
					    u_xlat2.x = (-u_xlat1.w) * 0.5 + 1.0;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xxx;
					    u_xlat2 = (-u_xlat0) + u_xlat1;
					    u_xlat0 = u_xlat1.wwww * u_xlat2 + u_xlat0;
					    SV_Target0 = u_xlat0;
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
					in mediump vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	float _BlendAmount;
					uniform 	float _EdgeSharpness;
					uniform 	float _Distortion;
					uniform lowp sampler2D _BlendTex;
					uniform lowp sampler2D _BumpMap;
					uniform lowp sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec2 u_xlat10_0;
					vec4 u_xlat1;
					lowp vec2 u_xlat10_1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					void main()
					{
					    u_xlat10_0.xy = texture(_BumpMap, vs_TEXCOORD0.xy).xy;
					    u_xlat10_1.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0.x = _EdgeSharpness + -1.0;
					    u_xlat0.x = u_xlat0.x * 0.5;
					    u_xlat2 = texture(_BlendTex, vs_TEXCOORD0.xy);
					    u_xlat4 = _BlendAmount * 2.0 + u_xlat2.w;
					    u_xlat4 = u_xlat4 + -1.0;
					    u_xlat2.w = u_xlat4 * _EdgeSharpness + (-u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat2.w = min(max(u_xlat2.w, 0.0), 1.0);
					#else
					    u_xlat2.w = clamp(u_xlat2.w, 0.0, 1.0);
					#endif
					    u_xlat0.xy = u_xlat10_1.xy * u_xlat2.ww;
					    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Distortion, _Distortion)) + vs_TEXCOORD0.xy;
					    u_xlat0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat3.xyz = u_xlat2.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = u_xlat0.xyz * u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat3.xyz * vec3(1.20000005, 1.20000005, 1.20000005) + (-u_xlat2.xyz);
					    u_xlat1.xyz = u_xlat3.xyz * vec3(0.300000012, 0.300000012, 0.300000012);
					    u_xlat1.w = 0.0;
					    u_xlat1 = u_xlat1 + u_xlat2;
					    u_xlat2.x = (-u_xlat1.w) * 0.5 + 1.0;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xxx;
					    u_xlat2 = (-u_xlat0) + u_xlat1;
					    u_xlat0 = u_xlat1.wwww * u_xlat2 + u_xlat0;
					    SV_Target0 = u_xlat0;
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