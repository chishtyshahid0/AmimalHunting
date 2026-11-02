Shader "CameraFilterPack/Gradients_Rainbow" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 9198
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
					  highp vec3 c_6;
					  highp float tmpvar_7;
					  tmpvar_7 = (1.0 - pow ((
					    abs((vec3(tmpvar_5) - vec3(0.65, 0.5, 0.2)))
					   * vec3(3.0, 3.0, 5.0)), vec3(1.5, 1.3, 1.7))).x;
					  highp vec3 tmpvar_8;
					  tmpvar_8.x = tmpvar_7;
					  tmpvar_8.y = tmpvar_7;
					  tmpvar_8.z = tmpvar_7;
					  c_6.yz = tmpvar_8.yz;
					  highp float s_9;
					  s_9 = (abs((tmpvar_5 - 0.04)) * 5.0);
					  c_6.x = max ((0.15 - (s_9 * s_9)), tmpvar_7);
					  highp float tmpvar_10;
					  if ((tmpvar_5 < 0.5)) {
					    highp float tmpvar_11;
					    tmpvar_11 = clamp (((tmpvar_5 - 0.04) / 0.41), 0.0, 1.0);
					    tmpvar_10 = (tmpvar_11 * (tmpvar_11 * (3.0 - 
					      (2.0 * tmpvar_11)
					    )));
					  } else {
					    tmpvar_10 = c_6.y;
					  };
					  c_6.y = tmpvar_10;
					  highp vec4 tmpvar_12;
					  tmpvar_12.w = 0.0;
					  tmpvar_12.xyz = clamp (c_6, vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0));
					  highp vec4 tmpvar_13;
					  tmpvar_13.w = 1.0;
					  tmpvar_13.xyz = mix (tc_1, tmpvar_12, vec4(_Value2)).xyz;
					  tc_1 = tmpvar_13;
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
					  highp vec3 c_6;
					  highp float tmpvar_7;
					  tmpvar_7 = (1.0 - pow ((
					    abs((vec3(tmpvar_5) - vec3(0.65, 0.5, 0.2)))
					   * vec3(3.0, 3.0, 5.0)), vec3(1.5, 1.3, 1.7))).x;
					  highp vec3 tmpvar_8;
					  tmpvar_8.x = tmpvar_7;
					  tmpvar_8.y = tmpvar_7;
					  tmpvar_8.z = tmpvar_7;
					  c_6.yz = tmpvar_8.yz;
					  highp float s_9;
					  s_9 = (abs((tmpvar_5 - 0.04)) * 5.0);
					  c_6.x = max ((0.15 - (s_9 * s_9)), tmpvar_7);
					  highp float tmpvar_10;
					  if ((tmpvar_5 < 0.5)) {
					    highp float tmpvar_11;
					    tmpvar_11 = clamp (((tmpvar_5 - 0.04) / 0.41), 0.0, 1.0);
					    tmpvar_10 = (tmpvar_11 * (tmpvar_11 * (3.0 - 
					      (2.0 * tmpvar_11)
					    )));
					  } else {
					    tmpvar_10 = c_6.y;
					  };
					  c_6.y = tmpvar_10;
					  highp vec4 tmpvar_12;
					  tmpvar_12.w = 0.0;
					  tmpvar_12.xyz = clamp (c_6, vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0));
					  highp vec4 tmpvar_13;
					  tmpvar_13.w = 1.0;
					  tmpvar_13.xyz = mix (tc_1, tmpvar_12, vec4(_Value2)).xyz;
					  tc_1 = tmpvar_13;
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
					  highp vec3 c_6;
					  highp float tmpvar_7;
					  tmpvar_7 = (1.0 - pow ((
					    abs((vec3(tmpvar_5) - vec3(0.65, 0.5, 0.2)))
					   * vec3(3.0, 3.0, 5.0)), vec3(1.5, 1.3, 1.7))).x;
					  highp vec3 tmpvar_8;
					  tmpvar_8.x = tmpvar_7;
					  tmpvar_8.y = tmpvar_7;
					  tmpvar_8.z = tmpvar_7;
					  c_6.yz = tmpvar_8.yz;
					  highp float s_9;
					  s_9 = (abs((tmpvar_5 - 0.04)) * 5.0);
					  c_6.x = max ((0.15 - (s_9 * s_9)), tmpvar_7);
					  highp float tmpvar_10;
					  if ((tmpvar_5 < 0.5)) {
					    highp float tmpvar_11;
					    tmpvar_11 = clamp (((tmpvar_5 - 0.04) / 0.41), 0.0, 1.0);
					    tmpvar_10 = (tmpvar_11 * (tmpvar_11 * (3.0 - 
					      (2.0 * tmpvar_11)
					    )));
					  } else {
					    tmpvar_10 = c_6.y;
					  };
					  c_6.y = tmpvar_10;
					  highp vec4 tmpvar_12;
					  tmpvar_12.w = 0.0;
					  tmpvar_12.xyz = clamp (c_6, vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0));
					  highp vec4 tmpvar_13;
					  tmpvar_13.w = 1.0;
					  tmpvar_13.xyz = mix (tc_1, tmpvar_12, vec4(_Value2)).xyz;
					  tc_1 = tmpvar_13;
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					lowp vec3 u_xlat10_0;
					vec3 u_xlat1;
					mediump float u_xlat16_1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat7;
					float u_xlat9;
					mediump float u_xlat16_9;
					bool u_xlatb9;
					float u_xlat10;
					void main()
					{
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_9 = dot(u_xlat10_0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat16_1 = u_xlat16_9 * -2.0 + 1.0;
					    u_xlat9 = _Value * u_xlat16_1 + u_xlat16_9;
					    u_xlat1.xy = vec2(u_xlat9) + vec2(-0.649999976, -0.0399999991);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb9 = !!(u_xlat9<0.5);
					#else
					    u_xlatb9 = u_xlat9<0.5;
					#endif
					    u_xlat7 = u_xlat1.y * 2.43902445;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
					#else
					    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
					#endif
					    u_xlat1.xy = abs(u_xlat1.xy) * vec2(3.0, 5.0);
					    u_xlat10 = u_xlat7 * -2.0 + 3.0;
					    u_xlat7 = u_xlat7 * u_xlat7;
					    u_xlat7 = u_xlat7 * u_xlat10;
					    u_xlat1.x = log2(u_xlat1.x);
					    u_xlat4 = (-u_xlat1.y) * u_xlat1.y + 0.150000006;
					    u_xlat1.x = u_xlat1.x * 1.5;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat2.z = (-u_xlat1.x) + 1.0;
					    u_xlat2.y = (u_xlatb9) ? u_xlat7 : u_xlat2.z;
					    u_xlat2.x = max(u_xlat4, u_xlat2.z);
					    u_xlat2.xyz = u_xlat2.xyz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
					#else
					    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
					#endif
					    u_xlat1.xyz = (-u_xlat10_0.xyz) + u_xlat2.xyz;
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
					float u_xlat4;
					float u_xlat7;
					float u_xlat9;
					mediump float u_xlat16_9;
					bool u_xlatb9;
					float u_xlat10;
					void main()
					{
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_9 = dot(u_xlat10_0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat16_1 = u_xlat16_9 * -2.0 + 1.0;
					    u_xlat9 = _Value * u_xlat16_1 + u_xlat16_9;
					    u_xlat1.xy = vec2(u_xlat9) + vec2(-0.649999976, -0.0399999991);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb9 = !!(u_xlat9<0.5);
					#else
					    u_xlatb9 = u_xlat9<0.5;
					#endif
					    u_xlat7 = u_xlat1.y * 2.43902445;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
					#else
					    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
					#endif
					    u_xlat1.xy = abs(u_xlat1.xy) * vec2(3.0, 5.0);
					    u_xlat10 = u_xlat7 * -2.0 + 3.0;
					    u_xlat7 = u_xlat7 * u_xlat7;
					    u_xlat7 = u_xlat7 * u_xlat10;
					    u_xlat1.x = log2(u_xlat1.x);
					    u_xlat4 = (-u_xlat1.y) * u_xlat1.y + 0.150000006;
					    u_xlat1.x = u_xlat1.x * 1.5;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat2.z = (-u_xlat1.x) + 1.0;
					    u_xlat2.y = (u_xlatb9) ? u_xlat7 : u_xlat2.z;
					    u_xlat2.x = max(u_xlat4, u_xlat2.z);
					    u_xlat2.xyz = u_xlat2.xyz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
					#else
					    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
					#endif
					    u_xlat1.xyz = (-u_xlat10_0.xyz) + u_xlat2.xyz;
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
					float u_xlat4;
					float u_xlat7;
					float u_xlat9;
					mediump float u_xlat16_9;
					bool u_xlatb9;
					float u_xlat10;
					void main()
					{
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_9 = dot(u_xlat10_0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat16_1 = u_xlat16_9 * -2.0 + 1.0;
					    u_xlat9 = _Value * u_xlat16_1 + u_xlat16_9;
					    u_xlat1.xy = vec2(u_xlat9) + vec2(-0.649999976, -0.0399999991);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb9 = !!(u_xlat9<0.5);
					#else
					    u_xlatb9 = u_xlat9<0.5;
					#endif
					    u_xlat7 = u_xlat1.y * 2.43902445;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
					#else
					    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
					#endif
					    u_xlat1.xy = abs(u_xlat1.xy) * vec2(3.0, 5.0);
					    u_xlat10 = u_xlat7 * -2.0 + 3.0;
					    u_xlat7 = u_xlat7 * u_xlat7;
					    u_xlat7 = u_xlat7 * u_xlat10;
					    u_xlat1.x = log2(u_xlat1.x);
					    u_xlat4 = (-u_xlat1.y) * u_xlat1.y + 0.150000006;
					    u_xlat1.x = u_xlat1.x * 1.5;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat2.z = (-u_xlat1.x) + 1.0;
					    u_xlat2.y = (u_xlatb9) ? u_xlat7 : u_xlat2.z;
					    u_xlat2.x = max(u_xlat4, u_xlat2.z);
					    u_xlat2.xyz = u_xlat2.xyz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
					#else
					    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
					#endif
					    u_xlat1.xyz = (-u_xlat10_0.xyz) + u_xlat2.xyz;
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