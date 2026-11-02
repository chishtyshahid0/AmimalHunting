Shader "CameraFilterPack/Vision_Warp" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 31532
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
					uniform highp float _TimeX;
					uniform highp float _Value;
					uniform highp float _Value2;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 fColor_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_3;
					  tmpvar_3 = abs((uv_2 - 0.5));
					  highp float tmpvar_4;
					  tmpvar_4 = sin(((
					    sqrt(dot (tmpvar_3, tmpvar_3))
					   - 
					    (_TimeX / 3.0)
					  ) * 5.0));
					  highp float r_5;
					  r_5 = (tmpvar_4 * tmpvar_4);
					  highp float tmpvar_6;
					  highp float tmpvar_7;
					  tmpvar_7 = sin((r_5 / 0.01));
					  highp float tmpvar_8;
					  tmpvar_8 = (r_5 / 0.01);
					  highp float tmpvar_9;
					  tmpvar_9 = abs(tmpvar_8);
					  if ((tmpvar_9 <= 0.1)) {
					    tmpvar_6 = 1.0;
					  } else {
					    tmpvar_6 = abs((tmpvar_7 / tmpvar_8));
					  };
					  highp vec4 tmpvar_10;
					  tmpvar_10.w = 1.0;
					  tmpvar_10.x = tmpvar_6;
					  tmpvar_10.y = tmpvar_6;
					  tmpvar_10.z = tmpvar_6;
					  fColor_1.w = tmpvar_10.w;
					  highp vec2 x_11;
					  x_11 = (vec2(0.5, 0.5) - uv_2);
					  highp float tmpvar_12;
					  tmpvar_12 = clamp (((
					    sqrt(dot (x_11, x_11))
					   - _Value) / (
					    ((_Value - 0.05) - _Value2)
					   - _Value)), 0.0, 1.0);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_MainTex, uv_2);
					  highp vec4 tmpvar_14;
					  tmpvar_14.w = 0.0;
					  tmpvar_14.xyz = tmpvar_10.xyz;
					  fColor_1.xyz = mix (tmpvar_13, tmpvar_14, vec4((1.0 - (tmpvar_12 * 
					    (tmpvar_12 * (3.0 - (2.0 * tmpvar_12)))
					  )))).xyz;
					  gl_FragData[0] = fColor_1;
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
					uniform highp float _TimeX;
					uniform highp float _Value;
					uniform highp float _Value2;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 fColor_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_3;
					  tmpvar_3 = abs((uv_2 - 0.5));
					  highp float tmpvar_4;
					  tmpvar_4 = sin(((
					    sqrt(dot (tmpvar_3, tmpvar_3))
					   - 
					    (_TimeX / 3.0)
					  ) * 5.0));
					  highp float r_5;
					  r_5 = (tmpvar_4 * tmpvar_4);
					  highp float tmpvar_6;
					  highp float tmpvar_7;
					  tmpvar_7 = sin((r_5 / 0.01));
					  highp float tmpvar_8;
					  tmpvar_8 = (r_5 / 0.01);
					  highp float tmpvar_9;
					  tmpvar_9 = abs(tmpvar_8);
					  if ((tmpvar_9 <= 0.1)) {
					    tmpvar_6 = 1.0;
					  } else {
					    tmpvar_6 = abs((tmpvar_7 / tmpvar_8));
					  };
					  highp vec4 tmpvar_10;
					  tmpvar_10.w = 1.0;
					  tmpvar_10.x = tmpvar_6;
					  tmpvar_10.y = tmpvar_6;
					  tmpvar_10.z = tmpvar_6;
					  fColor_1.w = tmpvar_10.w;
					  highp vec2 x_11;
					  x_11 = (vec2(0.5, 0.5) - uv_2);
					  highp float tmpvar_12;
					  tmpvar_12 = clamp (((
					    sqrt(dot (x_11, x_11))
					   - _Value) / (
					    ((_Value - 0.05) - _Value2)
					   - _Value)), 0.0, 1.0);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_MainTex, uv_2);
					  highp vec4 tmpvar_14;
					  tmpvar_14.w = 0.0;
					  tmpvar_14.xyz = tmpvar_10.xyz;
					  fColor_1.xyz = mix (tmpvar_13, tmpvar_14, vec4((1.0 - (tmpvar_12 * 
					    (tmpvar_12 * (3.0 - (2.0 * tmpvar_12)))
					  )))).xyz;
					  gl_FragData[0] = fColor_1;
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
					uniform highp float _TimeX;
					uniform highp float _Value;
					uniform highp float _Value2;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 fColor_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_3;
					  tmpvar_3 = abs((uv_2 - 0.5));
					  highp float tmpvar_4;
					  tmpvar_4 = sin(((
					    sqrt(dot (tmpvar_3, tmpvar_3))
					   - 
					    (_TimeX / 3.0)
					  ) * 5.0));
					  highp float r_5;
					  r_5 = (tmpvar_4 * tmpvar_4);
					  highp float tmpvar_6;
					  highp float tmpvar_7;
					  tmpvar_7 = sin((r_5 / 0.01));
					  highp float tmpvar_8;
					  tmpvar_8 = (r_5 / 0.01);
					  highp float tmpvar_9;
					  tmpvar_9 = abs(tmpvar_8);
					  if ((tmpvar_9 <= 0.1)) {
					    tmpvar_6 = 1.0;
					  } else {
					    tmpvar_6 = abs((tmpvar_7 / tmpvar_8));
					  };
					  highp vec4 tmpvar_10;
					  tmpvar_10.w = 1.0;
					  tmpvar_10.x = tmpvar_6;
					  tmpvar_10.y = tmpvar_6;
					  tmpvar_10.z = tmpvar_6;
					  fColor_1.w = tmpvar_10.w;
					  highp vec2 x_11;
					  x_11 = (vec2(0.5, 0.5) - uv_2);
					  highp float tmpvar_12;
					  tmpvar_12 = clamp (((
					    sqrt(dot (x_11, x_11))
					   - _Value) / (
					    ((_Value - 0.05) - _Value2)
					   - _Value)), 0.0, 1.0);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_MainTex, uv_2);
					  highp vec4 tmpvar_14;
					  tmpvar_14.w = 0.0;
					  tmpvar_14.xyz = tmpvar_10.xyz;
					  fColor_1.xyz = mix (tmpvar_13, tmpvar_14, vec4((1.0 - (tmpvar_12 * 
					    (tmpvar_12 * (3.0 - (2.0 * tmpvar_12)))
					  )))).xyz;
					  gl_FragData[0] = fColor_1;
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec2 u_xlat16_0;
					lowp vec3 u_xlat10_1;
					vec3 u_xlat2;
					mediump vec2 u_xlat16_2;
					bool u_xlatb2;
					float u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat16_0.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
					    u_xlat16_0.x = dot(u_xlat16_0.xy, u_xlat16_0.xy);
					    u_xlat0.x = sqrt(u_xlat16_0.x);
					    u_xlat0.y = _Value + -0.0500000007;
					    u_xlat0.xy = vec2(u_xlat0.x + (-float(_Value)), u_xlat0.y + (-float(_Value2)));
					    u_xlat2.x = u_xlat0.y + (-_Value);
					    u_xlat2.x = float(1.0) / u_xlat2.x;
					    u_xlat0.x = u_xlat2.x * u_xlat0.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat2.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat2.x) * u_xlat0.x + 1.0;
					    u_xlat16_2.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_2.x = dot(abs(u_xlat16_2.xy), abs(u_xlat16_2.xy));
					    u_xlat16_2.x = sqrt(u_xlat16_2.x);
					    u_xlat2.x = (-_TimeX) * 0.333333343 + u_xlat16_2.x;
					    u_xlat2.x = u_xlat2.x * 5.0;
					    u_xlat2.x = sin(u_xlat2.x);
					    u_xlat2.x = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat2.x * 99.9999924;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(0.00100000005>=u_xlat2.x);
					#else
					    u_xlatb2 = 0.00100000005>=u_xlat2.x;
					#endif
					    u_xlat6 = sin(u_xlat4);
					    u_xlat4 = u_xlat6 / u_xlat4;
					    u_xlat2.x = (u_xlatb2) ? 1.0 : abs(u_xlat4);
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat2.xyz = u_xlat2.xxx + (-u_xlat10_1.xyz);
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat10_1.xyz;
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
					uniform 	float _TimeX;
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec2 u_xlat16_0;
					lowp vec3 u_xlat10_1;
					vec3 u_xlat2;
					mediump vec2 u_xlat16_2;
					bool u_xlatb2;
					float u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat16_0.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
					    u_xlat16_0.x = dot(u_xlat16_0.xy, u_xlat16_0.xy);
					    u_xlat0.x = sqrt(u_xlat16_0.x);
					    u_xlat0.y = _Value + -0.0500000007;
					    u_xlat0.xy = vec2(u_xlat0.x + (-float(_Value)), u_xlat0.y + (-float(_Value2)));
					    u_xlat2.x = u_xlat0.y + (-_Value);
					    u_xlat2.x = float(1.0) / u_xlat2.x;
					    u_xlat0.x = u_xlat2.x * u_xlat0.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat2.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat2.x) * u_xlat0.x + 1.0;
					    u_xlat16_2.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_2.x = dot(abs(u_xlat16_2.xy), abs(u_xlat16_2.xy));
					    u_xlat16_2.x = sqrt(u_xlat16_2.x);
					    u_xlat2.x = (-_TimeX) * 0.333333343 + u_xlat16_2.x;
					    u_xlat2.x = u_xlat2.x * 5.0;
					    u_xlat2.x = sin(u_xlat2.x);
					    u_xlat2.x = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat2.x * 99.9999924;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(0.00100000005>=u_xlat2.x);
					#else
					    u_xlatb2 = 0.00100000005>=u_xlat2.x;
					#endif
					    u_xlat6 = sin(u_xlat4);
					    u_xlat4 = u_xlat6 / u_xlat4;
					    u_xlat2.x = (u_xlatb2) ? 1.0 : abs(u_xlat4);
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat2.xyz = u_xlat2.xxx + (-u_xlat10_1.xyz);
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat10_1.xyz;
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
					uniform 	float _TimeX;
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec2 u_xlat16_0;
					lowp vec3 u_xlat10_1;
					vec3 u_xlat2;
					mediump vec2 u_xlat16_2;
					bool u_xlatb2;
					float u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat16_0.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
					    u_xlat16_0.x = dot(u_xlat16_0.xy, u_xlat16_0.xy);
					    u_xlat0.x = sqrt(u_xlat16_0.x);
					    u_xlat0.y = _Value + -0.0500000007;
					    u_xlat0.xy = vec2(u_xlat0.x + (-float(_Value)), u_xlat0.y + (-float(_Value2)));
					    u_xlat2.x = u_xlat0.y + (-_Value);
					    u_xlat2.x = float(1.0) / u_xlat2.x;
					    u_xlat0.x = u_xlat2.x * u_xlat0.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat2.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat2.x) * u_xlat0.x + 1.0;
					    u_xlat16_2.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_2.x = dot(abs(u_xlat16_2.xy), abs(u_xlat16_2.xy));
					    u_xlat16_2.x = sqrt(u_xlat16_2.x);
					    u_xlat2.x = (-_TimeX) * 0.333333343 + u_xlat16_2.x;
					    u_xlat2.x = u_xlat2.x * 5.0;
					    u_xlat2.x = sin(u_xlat2.x);
					    u_xlat2.x = u_xlat2.x * u_xlat2.x;
					    u_xlat4 = u_xlat2.x * 99.9999924;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(0.00100000005>=u_xlat2.x);
					#else
					    u_xlatb2 = 0.00100000005>=u_xlat2.x;
					#endif
					    u_xlat6 = sin(u_xlat4);
					    u_xlat4 = u_xlat6 / u_xlat4;
					    u_xlat2.x = (u_xlatb2) ? 1.0 : abs(u_xlat4);
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat2.xyz = u_xlat2.xxx + (-u_xlat10_1.xyz);
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat10_1.xyz;
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