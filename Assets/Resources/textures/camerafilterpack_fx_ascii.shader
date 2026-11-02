Shader "CameraFilterPack/FX_Ascii" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 50973
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
					uniform highp vec4 _ScreenResolution;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp float n_1;
					  highp vec3 col_2;
					  highp vec2 tmpvar_3;
					  tmpvar_3 = (xlv_TEXCOORD0 * _ScreenResolution.xy);
					  highp vec2 P_4;
					  P_4 = ((floor(
					    (tmpvar_3 / 8.0)
					  ) * 8.0) / _ScreenResolution.xy);
					  lowp vec3 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, P_4).xyz;
					  col_2 = tmpvar_5;
					  highp float tmpvar_6;
					  tmpvar_6 = ((col_2.x + col_2.z) / 2.0);
					  n_1 = 65536.0;
					  if ((tmpvar_6 > 0.2)) {
					    n_1 = 65600.0;
					  };
					  if ((tmpvar_6 > 0.3)) {
					    n_1 = 332772.0;
					  };
					  if ((tmpvar_6 > 0.4)) {
					    n_1 = 1.525509e+07;
					  };
					  if ((tmpvar_6 > 0.5)) {
					    n_1 = 2.338516e+07;
					  };
					  if ((tmpvar_6 > 0.6)) {
					    n_1 = 1.525201e+07;
					  };
					  if ((tmpvar_6 > 0.7)) {
					    n_1 = 1.319945e+07;
					  };
					  if ((tmpvar_6 > 0.8)) {
					    n_1 = 1.151281e+07;
					  };
					  highp vec2 tmpvar_7;
					  tmpvar_7 = ((tmpvar_3 / 4.0) / vec2(2.0, 2.0));
					  highp vec2 tmpvar_8;
					  tmpvar_8 = (fract(abs(tmpvar_7)) * vec2(2.0, 2.0));
					  highp float tmpvar_9;
					  if ((tmpvar_7.x >= 0.0)) {
					    tmpvar_9 = tmpvar_8.x;
					  } else {
					    tmpvar_9 = -(tmpvar_8.x);
					  };
					  highp float tmpvar_10;
					  if ((tmpvar_7.y >= 0.0)) {
					    tmpvar_10 = tmpvar_8.y;
					  } else {
					    tmpvar_10 = -(tmpvar_8.y);
					  };
					  highp vec2 tmpvar_11;
					  tmpvar_11.x = tmpvar_9;
					  tmpvar_11.y = tmpvar_10;
					  highp vec2 p_12;
					  p_12 = (tmpvar_11 - 1.0);
					  bool tmpvar_13;
					  tmpvar_13 = bool(1);
					  highp float tmpvar_14;
					  highp vec2 tmpvar_15;
					  tmpvar_15 = floor(((p_12 * vec2(4.0, -4.0)) + 2.5));
					  p_12 = tmpvar_15;
					  highp float tmpvar_16;
					  tmpvar_16 = clamp (tmpvar_15.x, 0.0, 4.0);
					  bool tmpvar_17;
					  if ((tmpvar_16 == tmpvar_15.x)) {
					    highp float tmpvar_18;
					    tmpvar_18 = clamp (tmpvar_15.y, 0.0, 4.0);
					    tmpvar_17 = (tmpvar_18 == tmpvar_15.y);
					  } else {
					    tmpvar_17 = bool(0);
					  };
					  if (tmpvar_17) {
					    highp float tmpvar_19;
					    tmpvar_19 = ((n_1 / exp2(
					      (tmpvar_15.x + (5.0 * tmpvar_15.y))
					    )) / 2.0);
					    highp float tmpvar_20;
					    tmpvar_20 = (fract(abs(tmpvar_19)) * 2.0);
					    highp float tmpvar_21;
					    if ((tmpvar_19 >= 0.0)) {
					      tmpvar_21 = tmpvar_20;
					    } else {
					      tmpvar_21 = -(tmpvar_20);
					    };
					    if ((int(tmpvar_21) == 1)) {
					      tmpvar_14 = 1.0;
					      tmpvar_13 = bool(0);
					    };
					  };
					  if (tmpvar_13) {
					    tmpvar_14 = 0.0;
					    tmpvar_13 = bool(0);
					  };
					  col_2 = (col_2 * tmpvar_14);
					  highp vec4 tmpvar_22;
					  tmpvar_22.w = 1.0;
					  tmpvar_22.xyz = col_2;
					  gl_FragData[0] = tmpvar_22;
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
					uniform highp vec4 _ScreenResolution;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp float n_1;
					  highp vec3 col_2;
					  highp vec2 tmpvar_3;
					  tmpvar_3 = (xlv_TEXCOORD0 * _ScreenResolution.xy);
					  highp vec2 P_4;
					  P_4 = ((floor(
					    (tmpvar_3 / 8.0)
					  ) * 8.0) / _ScreenResolution.xy);
					  lowp vec3 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, P_4).xyz;
					  col_2 = tmpvar_5;
					  highp float tmpvar_6;
					  tmpvar_6 = ((col_2.x + col_2.z) / 2.0);
					  n_1 = 65536.0;
					  if ((tmpvar_6 > 0.2)) {
					    n_1 = 65600.0;
					  };
					  if ((tmpvar_6 > 0.3)) {
					    n_1 = 332772.0;
					  };
					  if ((tmpvar_6 > 0.4)) {
					    n_1 = 1.525509e+07;
					  };
					  if ((tmpvar_6 > 0.5)) {
					    n_1 = 2.338516e+07;
					  };
					  if ((tmpvar_6 > 0.6)) {
					    n_1 = 1.525201e+07;
					  };
					  if ((tmpvar_6 > 0.7)) {
					    n_1 = 1.319945e+07;
					  };
					  if ((tmpvar_6 > 0.8)) {
					    n_1 = 1.151281e+07;
					  };
					  highp vec2 tmpvar_7;
					  tmpvar_7 = ((tmpvar_3 / 4.0) / vec2(2.0, 2.0));
					  highp vec2 tmpvar_8;
					  tmpvar_8 = (fract(abs(tmpvar_7)) * vec2(2.0, 2.0));
					  highp float tmpvar_9;
					  if ((tmpvar_7.x >= 0.0)) {
					    tmpvar_9 = tmpvar_8.x;
					  } else {
					    tmpvar_9 = -(tmpvar_8.x);
					  };
					  highp float tmpvar_10;
					  if ((tmpvar_7.y >= 0.0)) {
					    tmpvar_10 = tmpvar_8.y;
					  } else {
					    tmpvar_10 = -(tmpvar_8.y);
					  };
					  highp vec2 tmpvar_11;
					  tmpvar_11.x = tmpvar_9;
					  tmpvar_11.y = tmpvar_10;
					  highp vec2 p_12;
					  p_12 = (tmpvar_11 - 1.0);
					  bool tmpvar_13;
					  tmpvar_13 = bool(1);
					  highp float tmpvar_14;
					  highp vec2 tmpvar_15;
					  tmpvar_15 = floor(((p_12 * vec2(4.0, -4.0)) + 2.5));
					  p_12 = tmpvar_15;
					  highp float tmpvar_16;
					  tmpvar_16 = clamp (tmpvar_15.x, 0.0, 4.0);
					  bool tmpvar_17;
					  if ((tmpvar_16 == tmpvar_15.x)) {
					    highp float tmpvar_18;
					    tmpvar_18 = clamp (tmpvar_15.y, 0.0, 4.0);
					    tmpvar_17 = (tmpvar_18 == tmpvar_15.y);
					  } else {
					    tmpvar_17 = bool(0);
					  };
					  if (tmpvar_17) {
					    highp float tmpvar_19;
					    tmpvar_19 = ((n_1 / exp2(
					      (tmpvar_15.x + (5.0 * tmpvar_15.y))
					    )) / 2.0);
					    highp float tmpvar_20;
					    tmpvar_20 = (fract(abs(tmpvar_19)) * 2.0);
					    highp float tmpvar_21;
					    if ((tmpvar_19 >= 0.0)) {
					      tmpvar_21 = tmpvar_20;
					    } else {
					      tmpvar_21 = -(tmpvar_20);
					    };
					    if ((int(tmpvar_21) == 1)) {
					      tmpvar_14 = 1.0;
					      tmpvar_13 = bool(0);
					    };
					  };
					  if (tmpvar_13) {
					    tmpvar_14 = 0.0;
					    tmpvar_13 = bool(0);
					  };
					  col_2 = (col_2 * tmpvar_14);
					  highp vec4 tmpvar_22;
					  tmpvar_22.w = 1.0;
					  tmpvar_22.xyz = col_2;
					  gl_FragData[0] = tmpvar_22;
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
					uniform highp vec4 _ScreenResolution;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp float n_1;
					  highp vec3 col_2;
					  highp vec2 tmpvar_3;
					  tmpvar_3 = (xlv_TEXCOORD0 * _ScreenResolution.xy);
					  highp vec2 P_4;
					  P_4 = ((floor(
					    (tmpvar_3 / 8.0)
					  ) * 8.0) / _ScreenResolution.xy);
					  lowp vec3 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, P_4).xyz;
					  col_2 = tmpvar_5;
					  highp float tmpvar_6;
					  tmpvar_6 = ((col_2.x + col_2.z) / 2.0);
					  n_1 = 65536.0;
					  if ((tmpvar_6 > 0.2)) {
					    n_1 = 65600.0;
					  };
					  if ((tmpvar_6 > 0.3)) {
					    n_1 = 332772.0;
					  };
					  if ((tmpvar_6 > 0.4)) {
					    n_1 = 1.525509e+07;
					  };
					  if ((tmpvar_6 > 0.5)) {
					    n_1 = 2.338516e+07;
					  };
					  if ((tmpvar_6 > 0.6)) {
					    n_1 = 1.525201e+07;
					  };
					  if ((tmpvar_6 > 0.7)) {
					    n_1 = 1.319945e+07;
					  };
					  if ((tmpvar_6 > 0.8)) {
					    n_1 = 1.151281e+07;
					  };
					  highp vec2 tmpvar_7;
					  tmpvar_7 = ((tmpvar_3 / 4.0) / vec2(2.0, 2.0));
					  highp vec2 tmpvar_8;
					  tmpvar_8 = (fract(abs(tmpvar_7)) * vec2(2.0, 2.0));
					  highp float tmpvar_9;
					  if ((tmpvar_7.x >= 0.0)) {
					    tmpvar_9 = tmpvar_8.x;
					  } else {
					    tmpvar_9 = -(tmpvar_8.x);
					  };
					  highp float tmpvar_10;
					  if ((tmpvar_7.y >= 0.0)) {
					    tmpvar_10 = tmpvar_8.y;
					  } else {
					    tmpvar_10 = -(tmpvar_8.y);
					  };
					  highp vec2 tmpvar_11;
					  tmpvar_11.x = tmpvar_9;
					  tmpvar_11.y = tmpvar_10;
					  highp vec2 p_12;
					  p_12 = (tmpvar_11 - 1.0);
					  bool tmpvar_13;
					  tmpvar_13 = bool(1);
					  highp float tmpvar_14;
					  highp vec2 tmpvar_15;
					  tmpvar_15 = floor(((p_12 * vec2(4.0, -4.0)) + 2.5));
					  p_12 = tmpvar_15;
					  highp float tmpvar_16;
					  tmpvar_16 = clamp (tmpvar_15.x, 0.0, 4.0);
					  bool tmpvar_17;
					  if ((tmpvar_16 == tmpvar_15.x)) {
					    highp float tmpvar_18;
					    tmpvar_18 = clamp (tmpvar_15.y, 0.0, 4.0);
					    tmpvar_17 = (tmpvar_18 == tmpvar_15.y);
					  } else {
					    tmpvar_17 = bool(0);
					  };
					  if (tmpvar_17) {
					    highp float tmpvar_19;
					    tmpvar_19 = ((n_1 / exp2(
					      (tmpvar_15.x + (5.0 * tmpvar_15.y))
					    )) / 2.0);
					    highp float tmpvar_20;
					    tmpvar_20 = (fract(abs(tmpvar_19)) * 2.0);
					    highp float tmpvar_21;
					    if ((tmpvar_19 >= 0.0)) {
					      tmpvar_21 = tmpvar_20;
					    } else {
					      tmpvar_21 = -(tmpvar_20);
					    };
					    if ((int(tmpvar_21) == 1)) {
					      tmpvar_14 = 1.0;
					      tmpvar_13 = bool(0);
					    };
					  };
					  if (tmpvar_13) {
					    tmpvar_14 = 0.0;
					    tmpvar_13 = bool(0);
					  };
					  col_2 = (col_2 * tmpvar_14);
					  highp vec4 tmpvar_22;
					  tmpvar_22.w = 1.0;
					  tmpvar_22.xyz = col_2;
					  gl_FragData[0] = tmpvar_22;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					bvec2 u_xlatb0;
					lowp vec3 u_xlat10_1;
					vec2 u_xlat2;
					bvec4 u_xlatb2;
					bvec3 u_xlatb3;
					vec2 u_xlat8;
					int u_xlati8;
					bool u_xlatb8;
					float u_xlat12;
					bool u_xlatb12;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _ScreenResolution.xy;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.125, 0.125);
					    u_xlat8.xy = floor(u_xlat0.xy);
					    u_xlat8.xy = u_xlat8.xy * vec2(8.0, 8.0);
					    u_xlat8.xy = u_xlat8.xy / _ScreenResolution.xy;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat8.xy).xyz;
					    u_xlat8.x = u_xlat10_1.z + u_xlat10_1.x;
					    u_xlatb2 = lessThan(vec4(0.400000006, 0.600000024, 0.800000012, 1.0), u_xlat8.xxxx);
					    u_xlatb3.xyz = lessThan(vec4(1.20000005, 1.39999998, 1.60000002, 0.0), u_xlat8.xxxx).xyz;
					    u_xlat8.x = (u_xlatb2.x) ? 65600.0 : 65536.0;
					    u_xlat8.x = (u_xlatb2.y) ? 332772.0 : u_xlat8.x;
					    u_xlat8.x = (u_xlatb2.z) ? 15255086.0 : u_xlat8.x;
					    u_xlat8.x = (u_xlatb2.w) ? 23385164.0 : u_xlat8.x;
					    u_xlat8.x = (u_xlatb3.x) ? 15252014.0 : u_xlat8.x;
					    u_xlat8.x = (u_xlatb3.y) ? 13199452.0 : u_xlat8.x;
					    u_xlat8.x = (u_xlatb3.z) ? 11512810.0 : u_xlat8.x;
					    u_xlatb2.xy = greaterThanEqual(u_xlat0.xyxx, (-u_xlat0.xyxx)).xy;
					    u_xlat0.xy = fract(abs(u_xlat0.xy));
					    u_xlat0.x = (u_xlatb2.x) ? u_xlat0.x : (-u_xlat0.x);
					    u_xlat0.y = (u_xlatb2.y) ? u_xlat0.y : (-u_xlat0.y);
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0.xy = u_xlat0.xy * vec2(4.0, -4.0) + vec2(2.5, 2.5);
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlat12 = u_xlat0.y * 5.0 + u_xlat0.x;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat8.x = u_xlat8.x / u_xlat12;
					    u_xlat8.x = u_xlat8.x * 0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb12 = !!(u_xlat8.x>=(-u_xlat8.x));
					#else
					    u_xlatb12 = u_xlat8.x>=(-u_xlat8.x);
					#endif
					    u_xlat8.x = fract(u_xlat8.x);
					    u_xlat8.x = (u_xlatb12) ? u_xlat8.x : (-u_xlat8.x);
					    u_xlat8.x = u_xlat8.x + u_xlat8.x;
					    u_xlati8 = int(u_xlat8.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb8 = !!(u_xlati8==1);
					#else
					    u_xlatb8 = u_xlati8==1;
					#endif
					    u_xlat2.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
					    u_xlat2.xy = min(u_xlat2.xy, vec2(4.0, 4.0));
					    u_xlatb0.xy = equal(u_xlat0.xyxx, u_xlat2.xyxx).xy;
					    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
					    u_xlatb0.x = u_xlatb8 && u_xlatb0.x;
					    u_xlat0.x = u_xlatb0.x ? 1.0 : float(0.0);
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat10_1.xyz;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					bvec2 u_xlatb0;
					lowp vec3 u_xlat10_1;
					vec2 u_xlat2;
					bvec4 u_xlatb2;
					bvec3 u_xlatb3;
					vec2 u_xlat8;
					int u_xlati8;
					bool u_xlatb8;
					float u_xlat12;
					bool u_xlatb12;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _ScreenResolution.xy;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.125, 0.125);
					    u_xlat8.xy = floor(u_xlat0.xy);
					    u_xlat8.xy = u_xlat8.xy * vec2(8.0, 8.0);
					    u_xlat8.xy = u_xlat8.xy / _ScreenResolution.xy;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat8.xy).xyz;
					    u_xlat8.x = u_xlat10_1.z + u_xlat10_1.x;
					    u_xlatb2 = lessThan(vec4(0.400000006, 0.600000024, 0.800000012, 1.0), u_xlat8.xxxx);
					    u_xlatb3.xyz = lessThan(vec4(1.20000005, 1.39999998, 1.60000002, 0.0), u_xlat8.xxxx).xyz;
					    u_xlat8.x = (u_xlatb2.x) ? 65600.0 : 65536.0;
					    u_xlat8.x = (u_xlatb2.y) ? 332772.0 : u_xlat8.x;
					    u_xlat8.x = (u_xlatb2.z) ? 15255086.0 : u_xlat8.x;
					    u_xlat8.x = (u_xlatb2.w) ? 23385164.0 : u_xlat8.x;
					    u_xlat8.x = (u_xlatb3.x) ? 15252014.0 : u_xlat8.x;
					    u_xlat8.x = (u_xlatb3.y) ? 13199452.0 : u_xlat8.x;
					    u_xlat8.x = (u_xlatb3.z) ? 11512810.0 : u_xlat8.x;
					    u_xlatb2.xy = greaterThanEqual(u_xlat0.xyxx, (-u_xlat0.xyxx)).xy;
					    u_xlat0.xy = fract(abs(u_xlat0.xy));
					    u_xlat0.x = (u_xlatb2.x) ? u_xlat0.x : (-u_xlat0.x);
					    u_xlat0.y = (u_xlatb2.y) ? u_xlat0.y : (-u_xlat0.y);
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0.xy = u_xlat0.xy * vec2(4.0, -4.0) + vec2(2.5, 2.5);
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlat12 = u_xlat0.y * 5.0 + u_xlat0.x;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat8.x = u_xlat8.x / u_xlat12;
					    u_xlat8.x = u_xlat8.x * 0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb12 = !!(u_xlat8.x>=(-u_xlat8.x));
					#else
					    u_xlatb12 = u_xlat8.x>=(-u_xlat8.x);
					#endif
					    u_xlat8.x = fract(u_xlat8.x);
					    u_xlat8.x = (u_xlatb12) ? u_xlat8.x : (-u_xlat8.x);
					    u_xlat8.x = u_xlat8.x + u_xlat8.x;
					    u_xlati8 = int(u_xlat8.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb8 = !!(u_xlati8==1);
					#else
					    u_xlatb8 = u_xlati8==1;
					#endif
					    u_xlat2.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
					    u_xlat2.xy = min(u_xlat2.xy, vec2(4.0, 4.0));
					    u_xlatb0.xy = equal(u_xlat0.xyxx, u_xlat2.xyxx).xy;
					    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
					    u_xlatb0.x = u_xlatb8 && u_xlatb0.x;
					    u_xlat0.x = u_xlatb0.x ? 1.0 : float(0.0);
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat10_1.xyz;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					bvec2 u_xlatb0;
					lowp vec3 u_xlat10_1;
					vec2 u_xlat2;
					bvec4 u_xlatb2;
					bvec3 u_xlatb3;
					vec2 u_xlat8;
					int u_xlati8;
					bool u_xlatb8;
					float u_xlat12;
					bool u_xlatb12;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _ScreenResolution.xy;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.125, 0.125);
					    u_xlat8.xy = floor(u_xlat0.xy);
					    u_xlat8.xy = u_xlat8.xy * vec2(8.0, 8.0);
					    u_xlat8.xy = u_xlat8.xy / _ScreenResolution.xy;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat8.xy).xyz;
					    u_xlat8.x = u_xlat10_1.z + u_xlat10_1.x;
					    u_xlatb2 = lessThan(vec4(0.400000006, 0.600000024, 0.800000012, 1.0), u_xlat8.xxxx);
					    u_xlatb3.xyz = lessThan(vec4(1.20000005, 1.39999998, 1.60000002, 0.0), u_xlat8.xxxx).xyz;
					    u_xlat8.x = (u_xlatb2.x) ? 65600.0 : 65536.0;
					    u_xlat8.x = (u_xlatb2.y) ? 332772.0 : u_xlat8.x;
					    u_xlat8.x = (u_xlatb2.z) ? 15255086.0 : u_xlat8.x;
					    u_xlat8.x = (u_xlatb2.w) ? 23385164.0 : u_xlat8.x;
					    u_xlat8.x = (u_xlatb3.x) ? 15252014.0 : u_xlat8.x;
					    u_xlat8.x = (u_xlatb3.y) ? 13199452.0 : u_xlat8.x;
					    u_xlat8.x = (u_xlatb3.z) ? 11512810.0 : u_xlat8.x;
					    u_xlatb2.xy = greaterThanEqual(u_xlat0.xyxx, (-u_xlat0.xyxx)).xy;
					    u_xlat0.xy = fract(abs(u_xlat0.xy));
					    u_xlat0.x = (u_xlatb2.x) ? u_xlat0.x : (-u_xlat0.x);
					    u_xlat0.y = (u_xlatb2.y) ? u_xlat0.y : (-u_xlat0.y);
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0.xy = u_xlat0.xy * vec2(4.0, -4.0) + vec2(2.5, 2.5);
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlat12 = u_xlat0.y * 5.0 + u_xlat0.x;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat8.x = u_xlat8.x / u_xlat12;
					    u_xlat8.x = u_xlat8.x * 0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb12 = !!(u_xlat8.x>=(-u_xlat8.x));
					#else
					    u_xlatb12 = u_xlat8.x>=(-u_xlat8.x);
					#endif
					    u_xlat8.x = fract(u_xlat8.x);
					    u_xlat8.x = (u_xlatb12) ? u_xlat8.x : (-u_xlat8.x);
					    u_xlat8.x = u_xlat8.x + u_xlat8.x;
					    u_xlati8 = int(u_xlat8.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb8 = !!(u_xlati8==1);
					#else
					    u_xlatb8 = u_xlati8==1;
					#endif
					    u_xlat2.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
					    u_xlat2.xy = min(u_xlat2.xy, vec2(4.0, 4.0));
					    u_xlatb0.xy = equal(u_xlat0.xyxx, u_xlat2.xyxx).xy;
					    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
					    u_xlatb0.x = u_xlatb8 && u_xlatb0.x;
					    u_xlat0.x = u_xlatb0.x ? 1.0 : float(0.0);
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat10_1.xyz;
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