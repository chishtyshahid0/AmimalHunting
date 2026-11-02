Shader "CameraFilterPack/Drawing_Comics" {
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
			GpuProgramID 51585
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
					  highp vec3 brtColor_1;
					  highp vec3 color_2;
					  lowp vec3 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
					  color_2 = tmpvar_3;
					  brtColor_1 = color_2;
					  highp float tmpvar_4;
					  tmpvar_4 = clamp (((color_2.x - _DotSize) / (
					    (0.1 + _DotSize)
					   - _DotSize)), 0.0, 1.0);
					  color_2 = vec3((tmpvar_4 * (tmpvar_4 * (3.0 - 
					    (2.0 * tmpvar_4)
					  ))));
					  highp vec3 tmpvar_5;
					  tmpvar_5 = mix (vec3(0.5, 0.5, 0.5), (brtColor_1 * vec3(8.88, 8.88, 8.88)), vec3(8.39, 8.39, 8.39));
					  if ((((tmpvar_5.x > 0.9) && (tmpvar_5.y < 0.4)) && (tmpvar_5.z < 0.4))) {
					    color_2 = vec3(1.0, 0.0, 0.0);
					  };
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = color_2;
					  gl_FragData[0] = tmpvar_6;
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
					  highp vec3 brtColor_1;
					  highp vec3 color_2;
					  lowp vec3 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
					  color_2 = tmpvar_3;
					  brtColor_1 = color_2;
					  highp float tmpvar_4;
					  tmpvar_4 = clamp (((color_2.x - _DotSize) / (
					    (0.1 + _DotSize)
					   - _DotSize)), 0.0, 1.0);
					  color_2 = vec3((tmpvar_4 * (tmpvar_4 * (3.0 - 
					    (2.0 * tmpvar_4)
					  ))));
					  highp vec3 tmpvar_5;
					  tmpvar_5 = mix (vec3(0.5, 0.5, 0.5), (brtColor_1 * vec3(8.88, 8.88, 8.88)), vec3(8.39, 8.39, 8.39));
					  if ((((tmpvar_5.x > 0.9) && (tmpvar_5.y < 0.4)) && (tmpvar_5.z < 0.4))) {
					    color_2 = vec3(1.0, 0.0, 0.0);
					  };
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = color_2;
					  gl_FragData[0] = tmpvar_6;
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
					  highp vec3 brtColor_1;
					  highp vec3 color_2;
					  lowp vec3 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
					  color_2 = tmpvar_3;
					  brtColor_1 = color_2;
					  highp float tmpvar_4;
					  tmpvar_4 = clamp (((color_2.x - _DotSize) / (
					    (0.1 + _DotSize)
					   - _DotSize)), 0.0, 1.0);
					  color_2 = vec3((tmpvar_4 * (tmpvar_4 * (3.0 - 
					    (2.0 * tmpvar_4)
					  ))));
					  highp vec3 tmpvar_5;
					  tmpvar_5 = mix (vec3(0.5, 0.5, 0.5), (brtColor_1 * vec3(8.88, 8.88, 8.88)), vec3(8.39, 8.39, 8.39));
					  if ((((tmpvar_5.x > 0.9) && (tmpvar_5.y < 0.4)) && (tmpvar_5.z < 0.4))) {
					    color_2 = vec3(1.0, 0.0, 0.0);
					  };
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = color_2;
					  gl_FragData[0] = tmpvar_6;
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
					float u_xlat0;
					lowp vec3 u_xlat10_0;
					vec3 u_xlat1;
					mediump vec3 u_xlat16_1;
					bool u_xlatb1;
					float u_xlat2;
					bvec2 u_xlatb2;
					void main()
					{
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(8.88000011, 8.88000011, 8.88000011) + vec3(-0.5, -0.5, -0.5);
					    u_xlat0 = u_xlat10_0.x + (-_DotSize);
					    u_xlat0 = u_xlat0 * 10.0;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
					#else
					    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
					#endif
					    u_xlat1.xyz = u_xlat16_1.xyz * vec3(8.39000034, 8.39000034, 8.39000034) + vec3(0.5, 0.5, 0.5);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(0.899999976<u_xlat1.x);
					#else
					    u_xlatb1 = 0.899999976<u_xlat1.x;
					#endif
					    u_xlatb2.xy = lessThan(u_xlat1.yzyz, vec4(0.400000006, 0.400000006, 0.400000006, 0.400000006)).xy;
					    u_xlatb1 = u_xlatb2.x && u_xlatb1;
					    u_xlatb1 = u_xlatb2.y && u_xlatb1;
					    u_xlat2 = u_xlat0 * -2.0 + 3.0;
					    u_xlat0 = u_xlat0 * u_xlat0;
					    u_xlat0 = u_xlat0 * u_xlat2;
					    SV_Target0.xyz = (bool(u_xlatb1)) ? vec3(1.0, 0.0, 0.0) : vec3(u_xlat0);
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
					float u_xlat0;
					lowp vec3 u_xlat10_0;
					vec3 u_xlat1;
					mediump vec3 u_xlat16_1;
					bool u_xlatb1;
					float u_xlat2;
					bvec2 u_xlatb2;
					void main()
					{
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(8.88000011, 8.88000011, 8.88000011) + vec3(-0.5, -0.5, -0.5);
					    u_xlat0 = u_xlat10_0.x + (-_DotSize);
					    u_xlat0 = u_xlat0 * 10.0;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
					#else
					    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
					#endif
					    u_xlat1.xyz = u_xlat16_1.xyz * vec3(8.39000034, 8.39000034, 8.39000034) + vec3(0.5, 0.5, 0.5);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(0.899999976<u_xlat1.x);
					#else
					    u_xlatb1 = 0.899999976<u_xlat1.x;
					#endif
					    u_xlatb2.xy = lessThan(u_xlat1.yzyz, vec4(0.400000006, 0.400000006, 0.400000006, 0.400000006)).xy;
					    u_xlatb1 = u_xlatb2.x && u_xlatb1;
					    u_xlatb1 = u_xlatb2.y && u_xlatb1;
					    u_xlat2 = u_xlat0 * -2.0 + 3.0;
					    u_xlat0 = u_xlat0 * u_xlat0;
					    u_xlat0 = u_xlat0 * u_xlat2;
					    SV_Target0.xyz = (bool(u_xlatb1)) ? vec3(1.0, 0.0, 0.0) : vec3(u_xlat0);
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
					float u_xlat0;
					lowp vec3 u_xlat10_0;
					vec3 u_xlat1;
					mediump vec3 u_xlat16_1;
					bool u_xlatb1;
					float u_xlat2;
					bvec2 u_xlatb2;
					void main()
					{
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(8.88000011, 8.88000011, 8.88000011) + vec3(-0.5, -0.5, -0.5);
					    u_xlat0 = u_xlat10_0.x + (-_DotSize);
					    u_xlat0 = u_xlat0 * 10.0;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
					#else
					    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
					#endif
					    u_xlat1.xyz = u_xlat16_1.xyz * vec3(8.39000034, 8.39000034, 8.39000034) + vec3(0.5, 0.5, 0.5);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(0.899999976<u_xlat1.x);
					#else
					    u_xlatb1 = 0.899999976<u_xlat1.x;
					#endif
					    u_xlatb2.xy = lessThan(u_xlat1.yzyz, vec4(0.400000006, 0.400000006, 0.400000006, 0.400000006)).xy;
					    u_xlatb1 = u_xlatb2.x && u_xlatb1;
					    u_xlatb1 = u_xlatb2.y && u_xlatb1;
					    u_xlat2 = u_xlat0 * -2.0 + 3.0;
					    u_xlat0 = u_xlat0 * u_xlat0;
					    u_xlat0 = u_xlat0 * u_xlat2;
					    SV_Target0.xyz = (bool(u_xlatb1)) ? vec3(1.0, 0.0, 0.0) : vec3(u_xlat0);
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