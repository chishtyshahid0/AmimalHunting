Shader "CameraFilterPack/Vision_Warp2" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 22297
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
					uniform highp float _Value3;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 fc_1;
					  highp vec4 fColor_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_4;
					  tmpvar_4 = abs((uv_3 - 0.5));
					  highp float tmpvar_5;
					  tmpvar_5 = sin(((
					    sqrt(dot (tmpvar_4, tmpvar_4))
					   - 
					    (_TimeX / 3.0)
					  ) * 5.0));
					  highp float r_6;
					  r_6 = (tmpvar_5 * tmpvar_5);
					  highp float tmpvar_7;
					  highp float tmpvar_8;
					  tmpvar_8 = sin((r_6 / 0.01));
					  highp float tmpvar_9;
					  tmpvar_9 = (r_6 / 0.01);
					  highp float tmpvar_10;
					  tmpvar_10 = abs(tmpvar_9);
					  if ((tmpvar_10 <= 0.1)) {
					    tmpvar_7 = 1.0;
					  } else {
					    tmpvar_7 = abs((tmpvar_8 / tmpvar_9));
					  };
					  highp vec4 tmpvar_11;
					  tmpvar_11.w = 1.0;
					  tmpvar_11.x = tmpvar_7;
					  tmpvar_11.y = tmpvar_7;
					  tmpvar_11.z = tmpvar_7;
					  fColor_2.w = tmpvar_11.w;
					  highp vec2 x_12;
					  x_12 = (vec2(0.5, 0.5) - uv_3);
					  highp float tmpvar_13;
					  tmpvar_13 = clamp (((
					    sqrt(dot (x_12, x_12))
					   - _Value) / (
					    ((_Value - 0.05) - _Value2)
					   - _Value)), 0.0, 1.0);
					  fColor_2.xyz = (vec3(tmpvar_7) * vec3((1.0 - (tmpvar_13 * 
					    (tmpvar_13 * (3.0 - (2.0 * tmpvar_13)))
					  ))));
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = (fColor_2.x * _Value3);
					  tmpvar_14.y = (fColor_2.x * _Value3);
					  highp vec2 P_15;
					  P_15 = (uv_3 - tmpvar_14);
					  lowp vec3 tmpvar_16;
					  tmpvar_16 = texture2D (_MainTex, P_15).xyz;
					  fc_1 = tmpvar_16;
					  highp vec4 tmpvar_17;
					  tmpvar_17.w = 1.0;
					  tmpvar_17.xyz = fc_1;
					  gl_FragData[0] = tmpvar_17;
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
					uniform highp float _Value3;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 fc_1;
					  highp vec4 fColor_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_4;
					  tmpvar_4 = abs((uv_3 - 0.5));
					  highp float tmpvar_5;
					  tmpvar_5 = sin(((
					    sqrt(dot (tmpvar_4, tmpvar_4))
					   - 
					    (_TimeX / 3.0)
					  ) * 5.0));
					  highp float r_6;
					  r_6 = (tmpvar_5 * tmpvar_5);
					  highp float tmpvar_7;
					  highp float tmpvar_8;
					  tmpvar_8 = sin((r_6 / 0.01));
					  highp float tmpvar_9;
					  tmpvar_9 = (r_6 / 0.01);
					  highp float tmpvar_10;
					  tmpvar_10 = abs(tmpvar_9);
					  if ((tmpvar_10 <= 0.1)) {
					    tmpvar_7 = 1.0;
					  } else {
					    tmpvar_7 = abs((tmpvar_8 / tmpvar_9));
					  };
					  highp vec4 tmpvar_11;
					  tmpvar_11.w = 1.0;
					  tmpvar_11.x = tmpvar_7;
					  tmpvar_11.y = tmpvar_7;
					  tmpvar_11.z = tmpvar_7;
					  fColor_2.w = tmpvar_11.w;
					  highp vec2 x_12;
					  x_12 = (vec2(0.5, 0.5) - uv_3);
					  highp float tmpvar_13;
					  tmpvar_13 = clamp (((
					    sqrt(dot (x_12, x_12))
					   - _Value) / (
					    ((_Value - 0.05) - _Value2)
					   - _Value)), 0.0, 1.0);
					  fColor_2.xyz = (vec3(tmpvar_7) * vec3((1.0 - (tmpvar_13 * 
					    (tmpvar_13 * (3.0 - (2.0 * tmpvar_13)))
					  ))));
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = (fColor_2.x * _Value3);
					  tmpvar_14.y = (fColor_2.x * _Value3);
					  highp vec2 P_15;
					  P_15 = (uv_3 - tmpvar_14);
					  lowp vec3 tmpvar_16;
					  tmpvar_16 = texture2D (_MainTex, P_15).xyz;
					  fc_1 = tmpvar_16;
					  highp vec4 tmpvar_17;
					  tmpvar_17.w = 1.0;
					  tmpvar_17.xyz = fc_1;
					  gl_FragData[0] = tmpvar_17;
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
					uniform highp float _Value3;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 fc_1;
					  highp vec4 fColor_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_4;
					  tmpvar_4 = abs((uv_3 - 0.5));
					  highp float tmpvar_5;
					  tmpvar_5 = sin(((
					    sqrt(dot (tmpvar_4, tmpvar_4))
					   - 
					    (_TimeX / 3.0)
					  ) * 5.0));
					  highp float r_6;
					  r_6 = (tmpvar_5 * tmpvar_5);
					  highp float tmpvar_7;
					  highp float tmpvar_8;
					  tmpvar_8 = sin((r_6 / 0.01));
					  highp float tmpvar_9;
					  tmpvar_9 = (r_6 / 0.01);
					  highp float tmpvar_10;
					  tmpvar_10 = abs(tmpvar_9);
					  if ((tmpvar_10 <= 0.1)) {
					    tmpvar_7 = 1.0;
					  } else {
					    tmpvar_7 = abs((tmpvar_8 / tmpvar_9));
					  };
					  highp vec4 tmpvar_11;
					  tmpvar_11.w = 1.0;
					  tmpvar_11.x = tmpvar_7;
					  tmpvar_11.y = tmpvar_7;
					  tmpvar_11.z = tmpvar_7;
					  fColor_2.w = tmpvar_11.w;
					  highp vec2 x_12;
					  x_12 = (vec2(0.5, 0.5) - uv_3);
					  highp float tmpvar_13;
					  tmpvar_13 = clamp (((
					    sqrt(dot (x_12, x_12))
					   - _Value) / (
					    ((_Value - 0.05) - _Value2)
					   - _Value)), 0.0, 1.0);
					  fColor_2.xyz = (vec3(tmpvar_7) * vec3((1.0 - (tmpvar_13 * 
					    (tmpvar_13 * (3.0 - (2.0 * tmpvar_13)))
					  ))));
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = (fColor_2.x * _Value3);
					  tmpvar_14.y = (fColor_2.x * _Value3);
					  highp vec2 P_15;
					  P_15 = (uv_3 - tmpvar_14);
					  lowp vec3 tmpvar_16;
					  tmpvar_16 = texture2D (_MainTex, P_15).xyz;
					  fc_1 = tmpvar_16;
					  highp vec4 tmpvar_17;
					  tmpvar_17.w = 1.0;
					  tmpvar_17.xyz = fc_1;
					  gl_FragData[0] = tmpvar_17;
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
					uniform 	float _Value3;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec2 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					bool u_xlatb0;
					vec2 u_xlat1;
					mediump vec2 u_xlat16_1;
					float u_xlat2;
					void main()
					{
					    u_xlat16_0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_0.x = dot(abs(u_xlat16_0.xy), abs(u_xlat16_0.xy));
					    u_xlat16_0.x = sqrt(u_xlat16_0.x);
					    u_xlat0.x = (-_TimeX) * 0.333333343 + u_xlat16_0.x;
					    u_xlat0.x = u_xlat0.x * 5.0;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat1.x = u_xlat0.x * 99.9999924;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(0.00100000005>=u_xlat0.x);
					#else
					    u_xlatb0 = 0.00100000005>=u_xlat0.x;
					#endif
					    u_xlat2 = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat2 / u_xlat1.x;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : abs(u_xlat1.x);
					    u_xlat16_1.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
					    u_xlat16_1.x = dot(u_xlat16_1.xy, u_xlat16_1.xy);
					    u_xlat1.x = sqrt(u_xlat16_1.x);
					    u_xlat1.y = _Value + -0.0500000007;
					    u_xlat1.xy = vec2(u_xlat1.x + (-float(_Value)), u_xlat1.y + (-float(_Value2)));
					    u_xlat2 = u_xlat1.y + (-_Value);
					    u_xlat2 = float(1.0) / u_xlat2;
					    u_xlat1.x = u_xlat2 * u_xlat1.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
					#else
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					#endif
					    u_xlat2 = u_xlat1.x * -2.0 + 3.0;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = (-u_xlat2) * u_xlat1.x + 1.0;
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xy = (-u_xlat0.xx) * vec2(vec2(_Value3, _Value3)) + vs_TEXCOORD0.xy;
					    u_xlat10_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz;
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
					uniform 	float _Value3;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec2 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					bool u_xlatb0;
					vec2 u_xlat1;
					mediump vec2 u_xlat16_1;
					float u_xlat2;
					void main()
					{
					    u_xlat16_0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_0.x = dot(abs(u_xlat16_0.xy), abs(u_xlat16_0.xy));
					    u_xlat16_0.x = sqrt(u_xlat16_0.x);
					    u_xlat0.x = (-_TimeX) * 0.333333343 + u_xlat16_0.x;
					    u_xlat0.x = u_xlat0.x * 5.0;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat1.x = u_xlat0.x * 99.9999924;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(0.00100000005>=u_xlat0.x);
					#else
					    u_xlatb0 = 0.00100000005>=u_xlat0.x;
					#endif
					    u_xlat2 = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat2 / u_xlat1.x;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : abs(u_xlat1.x);
					    u_xlat16_1.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
					    u_xlat16_1.x = dot(u_xlat16_1.xy, u_xlat16_1.xy);
					    u_xlat1.x = sqrt(u_xlat16_1.x);
					    u_xlat1.y = _Value + -0.0500000007;
					    u_xlat1.xy = vec2(u_xlat1.x + (-float(_Value)), u_xlat1.y + (-float(_Value2)));
					    u_xlat2 = u_xlat1.y + (-_Value);
					    u_xlat2 = float(1.0) / u_xlat2;
					    u_xlat1.x = u_xlat2 * u_xlat1.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
					#else
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					#endif
					    u_xlat2 = u_xlat1.x * -2.0 + 3.0;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = (-u_xlat2) * u_xlat1.x + 1.0;
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xy = (-u_xlat0.xx) * vec2(vec2(_Value3, _Value3)) + vs_TEXCOORD0.xy;
					    u_xlat10_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz;
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
					uniform 	float _Value3;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec2 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					bool u_xlatb0;
					vec2 u_xlat1;
					mediump vec2 u_xlat16_1;
					float u_xlat2;
					void main()
					{
					    u_xlat16_0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_0.x = dot(abs(u_xlat16_0.xy), abs(u_xlat16_0.xy));
					    u_xlat16_0.x = sqrt(u_xlat16_0.x);
					    u_xlat0.x = (-_TimeX) * 0.333333343 + u_xlat16_0.x;
					    u_xlat0.x = u_xlat0.x * 5.0;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat1.x = u_xlat0.x * 99.9999924;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(0.00100000005>=u_xlat0.x);
					#else
					    u_xlatb0 = 0.00100000005>=u_xlat0.x;
					#endif
					    u_xlat2 = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat2 / u_xlat1.x;
					    u_xlat0.x = (u_xlatb0) ? 1.0 : abs(u_xlat1.x);
					    u_xlat16_1.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
					    u_xlat16_1.x = dot(u_xlat16_1.xy, u_xlat16_1.xy);
					    u_xlat1.x = sqrt(u_xlat16_1.x);
					    u_xlat1.y = _Value + -0.0500000007;
					    u_xlat1.xy = vec2(u_xlat1.x + (-float(_Value)), u_xlat1.y + (-float(_Value2)));
					    u_xlat2 = u_xlat1.y + (-_Value);
					    u_xlat2 = float(1.0) / u_xlat2;
					    u_xlat1.x = u_xlat2 * u_xlat1.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
					#else
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					#endif
					    u_xlat2 = u_xlat1.x * -2.0 + 3.0;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = (-u_xlat2) * u_xlat1.x + 1.0;
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xy = (-u_xlat0.xx) * vec2(vec2(_Value3, _Value3)) + vs_TEXCOORD0.xy;
					    u_xlat10_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz;
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