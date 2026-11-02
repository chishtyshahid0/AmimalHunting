Shader "CameraFilterPack/Gradients_Desert" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 21206
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
					uniform highp float _Value;
					uniform highp float _Value2;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tc_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, uv_2);
					  tc_1 = tmpvar_3;
					  highp float tmpvar_4;
					  tmpvar_4 = (((0.2126 * tc_1.x) + (0.7152 * tc_1.y)) + (0.0722 * tc_1.z));
					  highp float tmpvar_5;
					  tmpvar_5 = mix (tmpvar_4, (1.0 - tmpvar_4), _Value);
					  highp float tmpvar_6;
					  tmpvar_6 = sqrt(clamp ((1.0 - 
					    ((tmpvar_5 - 0.4) / 0.6)
					  ), 0.0, 1.0));
					  highp float tmpvar_7;
					  tmpvar_7 = clamp (((tmpvar_5 - 0.4) / 0.5), 0.0, 1.0);
					  highp vec3 tmpvar_8;
					  tmpvar_8.z = 1.0;
					  tmpvar_8.x = tmpvar_6;
					  tmpvar_8.y = tmpvar_6;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = sqrt((mix (vec3(1.0, 1.0, 1.0), vec3(0.0, 0.8, 1.0), vec3(
					    (tmpvar_7 * (tmpvar_7 * (3.0 - (2.0 * tmpvar_7))))
					  )) * tmpvar_8));
					  highp vec3 tmpvar_10;
					  tmpvar_10.xz = vec2(0.85, 0.5);
					  tmpvar_10.y = (0.75 + max ((0.8 - 
					    (tmpvar_5 * 20.0)
					  ), 0.0));
					  highp float s_11;
					  s_11 = (tmpvar_5 / 0.4);
					  highp vec3 tmpvar_12;
					  tmpvar_12 = mix (vec3(0.7, 0.3, 0.0), tmpvar_10, vec3((s_11 * s_11)));
					  highp vec3 tmpvar_13;
					  if ((tmpvar_5 > 0.4)) {
					    tmpvar_13 = tmpvar_9;
					  } else {
					    tmpvar_13 = tmpvar_12;
					  };
					  highp vec4 tmpvar_14;
					  tmpvar_14.w = 0.0;
					  tmpvar_14.xyz = (clamp (tmpvar_13, vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0)) * clamp ((1.5 * 
					    (1.0 - abs((tmpvar_5 - 0.4)))
					  ), 0.0, 1.0));
					  highp vec4 tmpvar_15;
					  tmpvar_15.w = 1.0;
					  tmpvar_15.xyz = mix (tc_1, tmpvar_14, vec4(_Value2)).xyz;
					  tc_1 = tmpvar_15;
					  gl_FragData[0] = tmpvar_15;
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
					uniform highp float _Value;
					uniform highp float _Value2;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tc_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, uv_2);
					  tc_1 = tmpvar_3;
					  highp float tmpvar_4;
					  tmpvar_4 = (((0.2126 * tc_1.x) + (0.7152 * tc_1.y)) + (0.0722 * tc_1.z));
					  highp float tmpvar_5;
					  tmpvar_5 = mix (tmpvar_4, (1.0 - tmpvar_4), _Value);
					  highp float tmpvar_6;
					  tmpvar_6 = sqrt(clamp ((1.0 - 
					    ((tmpvar_5 - 0.4) / 0.6)
					  ), 0.0, 1.0));
					  highp float tmpvar_7;
					  tmpvar_7 = clamp (((tmpvar_5 - 0.4) / 0.5), 0.0, 1.0);
					  highp vec3 tmpvar_8;
					  tmpvar_8.z = 1.0;
					  tmpvar_8.x = tmpvar_6;
					  tmpvar_8.y = tmpvar_6;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = sqrt((mix (vec3(1.0, 1.0, 1.0), vec3(0.0, 0.8, 1.0), vec3(
					    (tmpvar_7 * (tmpvar_7 * (3.0 - (2.0 * tmpvar_7))))
					  )) * tmpvar_8));
					  highp vec3 tmpvar_10;
					  tmpvar_10.xz = vec2(0.85, 0.5);
					  tmpvar_10.y = (0.75 + max ((0.8 - 
					    (tmpvar_5 * 20.0)
					  ), 0.0));
					  highp float s_11;
					  s_11 = (tmpvar_5 / 0.4);
					  highp vec3 tmpvar_12;
					  tmpvar_12 = mix (vec3(0.7, 0.3, 0.0), tmpvar_10, vec3((s_11 * s_11)));
					  highp vec3 tmpvar_13;
					  if ((tmpvar_5 > 0.4)) {
					    tmpvar_13 = tmpvar_9;
					  } else {
					    tmpvar_13 = tmpvar_12;
					  };
					  highp vec4 tmpvar_14;
					  tmpvar_14.w = 0.0;
					  tmpvar_14.xyz = (clamp (tmpvar_13, vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0)) * clamp ((1.5 * 
					    (1.0 - abs((tmpvar_5 - 0.4)))
					  ), 0.0, 1.0));
					  highp vec4 tmpvar_15;
					  tmpvar_15.w = 1.0;
					  tmpvar_15.xyz = mix (tc_1, tmpvar_14, vec4(_Value2)).xyz;
					  tc_1 = tmpvar_15;
					  gl_FragData[0] = tmpvar_15;
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
					uniform highp float _Value;
					uniform highp float _Value2;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tc_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, uv_2);
					  tc_1 = tmpvar_3;
					  highp float tmpvar_4;
					  tmpvar_4 = (((0.2126 * tc_1.x) + (0.7152 * tc_1.y)) + (0.0722 * tc_1.z));
					  highp float tmpvar_5;
					  tmpvar_5 = mix (tmpvar_4, (1.0 - tmpvar_4), _Value);
					  highp float tmpvar_6;
					  tmpvar_6 = sqrt(clamp ((1.0 - 
					    ((tmpvar_5 - 0.4) / 0.6)
					  ), 0.0, 1.0));
					  highp float tmpvar_7;
					  tmpvar_7 = clamp (((tmpvar_5 - 0.4) / 0.5), 0.0, 1.0);
					  highp vec3 tmpvar_8;
					  tmpvar_8.z = 1.0;
					  tmpvar_8.x = tmpvar_6;
					  tmpvar_8.y = tmpvar_6;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = sqrt((mix (vec3(1.0, 1.0, 1.0), vec3(0.0, 0.8, 1.0), vec3(
					    (tmpvar_7 * (tmpvar_7 * (3.0 - (2.0 * tmpvar_7))))
					  )) * tmpvar_8));
					  highp vec3 tmpvar_10;
					  tmpvar_10.xz = vec2(0.85, 0.5);
					  tmpvar_10.y = (0.75 + max ((0.8 - 
					    (tmpvar_5 * 20.0)
					  ), 0.0));
					  highp float s_11;
					  s_11 = (tmpvar_5 / 0.4);
					  highp vec3 tmpvar_12;
					  tmpvar_12 = mix (vec3(0.7, 0.3, 0.0), tmpvar_10, vec3((s_11 * s_11)));
					  highp vec3 tmpvar_13;
					  if ((tmpvar_5 > 0.4)) {
					    tmpvar_13 = tmpvar_9;
					  } else {
					    tmpvar_13 = tmpvar_12;
					  };
					  highp vec4 tmpvar_14;
					  tmpvar_14.w = 0.0;
					  tmpvar_14.xyz = (clamp (tmpvar_13, vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0)) * clamp ((1.5 * 
					    (1.0 - abs((tmpvar_5 - 0.4)))
					  ), 0.0, 1.0));
					  highp vec4 tmpvar_15;
					  tmpvar_15.w = 1.0;
					  tmpvar_15.xyz = mix (tc_1, tmpvar_14, vec4(_Value2)).xyz;
					  tc_1 = tmpvar_15;
					  gl_FragData[0] = tmpvar_15;
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					lowp vec3 u_xlat10_0;
					vec3 u_xlat1;
					mediump float u_xlat16_1;
					vec3 u_xlat2;
					vec3 u_xlat4;
					float u_xlat7;
					float u_xlat9;
					mediump float u_xlat16_9;
					bool u_xlatb9;
					float u_xlat10;
					float u_xlat11;
					void main()
					{
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_9 = dot(u_xlat10_0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat16_1 = u_xlat16_9 * -2.0 + 1.0;
					    u_xlat9 = _Value * u_xlat16_1 + u_xlat16_9;
					    u_xlat1.x = u_xlat9 + -0.400000006;
					    u_xlat2.x = u_xlat1.x * 2.00000024;
					    u_xlat2.x = u_xlat2.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
					#else
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					#endif
					    u_xlat4.x = u_xlat2.x * -2.0 + 3.0;
					    u_xlat7 = u_xlat2.x * u_xlat2.x;
					    u_xlat4.x = u_xlat7 * u_xlat4.x;
					    u_xlat4.xy = u_xlat4.xx * vec2(-1.0, -0.199999988) + vec2(1.0, 1.0);
					    u_xlat10 = (-u_xlat1.x) * 1.66666663 + 1.0;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat10 = min(max(u_xlat10, 0.0), 1.0);
					#else
					    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
					#endif
					    u_xlat1.x = -abs(u_xlat1.x) + 1.0;
					    u_xlat1.x = u_xlat1.x * 1.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
					#else
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					#endif
					    u_xlat10 = sqrt(u_xlat10);
					    u_xlat2.xy = vec2(u_xlat10) * u_xlat4.xy;
					    u_xlat2.z = 1.0;
					    u_xlat4.xyz = sqrt(u_xlat2.xyz);
					    u_xlat2.x = float(-0.699999988);
					    u_xlat2.z = float(-0.0);
					    u_xlat11 = (-u_xlat9) * 20.0 + 0.800000012;
					    u_xlat2.y = max(u_xlat11, 0.0);
					    u_xlat2.xyz = u_xlat2.xyz + vec3(0.850000024, 0.449999988, 0.5);
					    u_xlat11 = u_xlat9 * 2.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb9 = !!(0.400000006<u_xlat9);
					#else
					    u_xlatb9 = 0.400000006<u_xlat9;
					#endif
					    u_xlat11 = u_xlat11 * u_xlat11;
					    u_xlat2.xyz = vec3(u_xlat11) * u_xlat2.xyz + vec3(0.699999988, 0.300000012, 0.0);
					    u_xlat4.xyz = (bool(u_xlatb9)) ? u_xlat4.xyz : u_xlat2.xyz;
					    u_xlat4.xyz = min(u_xlat4.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.xxx + (-u_xlat10_0.xyz);
					    SV_Target0.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat1.xyz + u_xlat10_0.xyz;
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					lowp vec3 u_xlat10_0;
					vec3 u_xlat1;
					mediump float u_xlat16_1;
					vec3 u_xlat2;
					vec3 u_xlat4;
					float u_xlat7;
					float u_xlat9;
					mediump float u_xlat16_9;
					bool u_xlatb9;
					float u_xlat10;
					float u_xlat11;
					void main()
					{
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_9 = dot(u_xlat10_0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat16_1 = u_xlat16_9 * -2.0 + 1.0;
					    u_xlat9 = _Value * u_xlat16_1 + u_xlat16_9;
					    u_xlat1.x = u_xlat9 + -0.400000006;
					    u_xlat2.x = u_xlat1.x * 2.00000024;
					    u_xlat2.x = u_xlat2.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
					#else
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					#endif
					    u_xlat4.x = u_xlat2.x * -2.0 + 3.0;
					    u_xlat7 = u_xlat2.x * u_xlat2.x;
					    u_xlat4.x = u_xlat7 * u_xlat4.x;
					    u_xlat4.xy = u_xlat4.xx * vec2(-1.0, -0.199999988) + vec2(1.0, 1.0);
					    u_xlat10 = (-u_xlat1.x) * 1.66666663 + 1.0;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat10 = min(max(u_xlat10, 0.0), 1.0);
					#else
					    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
					#endif
					    u_xlat1.x = -abs(u_xlat1.x) + 1.0;
					    u_xlat1.x = u_xlat1.x * 1.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
					#else
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					#endif
					    u_xlat10 = sqrt(u_xlat10);
					    u_xlat2.xy = vec2(u_xlat10) * u_xlat4.xy;
					    u_xlat2.z = 1.0;
					    u_xlat4.xyz = sqrt(u_xlat2.xyz);
					    u_xlat2.x = float(-0.699999988);
					    u_xlat2.z = float(-0.0);
					    u_xlat11 = (-u_xlat9) * 20.0 + 0.800000012;
					    u_xlat2.y = max(u_xlat11, 0.0);
					    u_xlat2.xyz = u_xlat2.xyz + vec3(0.850000024, 0.449999988, 0.5);
					    u_xlat11 = u_xlat9 * 2.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb9 = !!(0.400000006<u_xlat9);
					#else
					    u_xlatb9 = 0.400000006<u_xlat9;
					#endif
					    u_xlat11 = u_xlat11 * u_xlat11;
					    u_xlat2.xyz = vec3(u_xlat11) * u_xlat2.xyz + vec3(0.699999988, 0.300000012, 0.0);
					    u_xlat4.xyz = (bool(u_xlatb9)) ? u_xlat4.xyz : u_xlat2.xyz;
					    u_xlat4.xyz = min(u_xlat4.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.xxx + (-u_xlat10_0.xyz);
					    SV_Target0.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat1.xyz + u_xlat10_0.xyz;
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					lowp vec3 u_xlat10_0;
					vec3 u_xlat1;
					mediump float u_xlat16_1;
					vec3 u_xlat2;
					vec3 u_xlat4;
					float u_xlat7;
					float u_xlat9;
					mediump float u_xlat16_9;
					bool u_xlatb9;
					float u_xlat10;
					float u_xlat11;
					void main()
					{
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_9 = dot(u_xlat10_0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat16_1 = u_xlat16_9 * -2.0 + 1.0;
					    u_xlat9 = _Value * u_xlat16_1 + u_xlat16_9;
					    u_xlat1.x = u_xlat9 + -0.400000006;
					    u_xlat2.x = u_xlat1.x * 2.00000024;
					    u_xlat2.x = u_xlat2.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
					#else
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					#endif
					    u_xlat4.x = u_xlat2.x * -2.0 + 3.0;
					    u_xlat7 = u_xlat2.x * u_xlat2.x;
					    u_xlat4.x = u_xlat7 * u_xlat4.x;
					    u_xlat4.xy = u_xlat4.xx * vec2(-1.0, -0.199999988) + vec2(1.0, 1.0);
					    u_xlat10 = (-u_xlat1.x) * 1.66666663 + 1.0;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat10 = min(max(u_xlat10, 0.0), 1.0);
					#else
					    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
					#endif
					    u_xlat1.x = -abs(u_xlat1.x) + 1.0;
					    u_xlat1.x = u_xlat1.x * 1.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
					#else
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					#endif
					    u_xlat10 = sqrt(u_xlat10);
					    u_xlat2.xy = vec2(u_xlat10) * u_xlat4.xy;
					    u_xlat2.z = 1.0;
					    u_xlat4.xyz = sqrt(u_xlat2.xyz);
					    u_xlat2.x = float(-0.699999988);
					    u_xlat2.z = float(-0.0);
					    u_xlat11 = (-u_xlat9) * 20.0 + 0.800000012;
					    u_xlat2.y = max(u_xlat11, 0.0);
					    u_xlat2.xyz = u_xlat2.xyz + vec3(0.850000024, 0.449999988, 0.5);
					    u_xlat11 = u_xlat9 * 2.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb9 = !!(0.400000006<u_xlat9);
					#else
					    u_xlatb9 = 0.400000006<u_xlat9;
					#endif
					    u_xlat11 = u_xlat11 * u_xlat11;
					    u_xlat2.xyz = vec3(u_xlat11) * u_xlat2.xyz + vec3(0.699999988, 0.300000012, 0.0);
					    u_xlat4.xyz = (bool(u_xlatb9)) ? u_xlat4.xyz : u_xlat2.xyz;
					    u_xlat4.xyz = min(u_xlat4.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.xxx + (-u_xlat10_0.xyz);
					    SV_Target0.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat1.xyz + u_xlat10_0.xyz;
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