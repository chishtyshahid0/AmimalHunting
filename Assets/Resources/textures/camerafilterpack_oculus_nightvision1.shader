Shader "CameraFilterPack/Oculus_NightVision1" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(1, 10)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_Vignette ("_Vignette", Range(0, 100)) = 1.5
		_Linecount ("_Linecount", Range(1, 150)) = 90
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 54906
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
					uniform highp float _Vignette;
					uniform highp float _Linecount;
					highp vec2 xlat_mutablepos;
					highp vec2 xlat_mutableuv;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  xlat_mutableuv = xlv_TEXCOORD0;
					  xlat_mutablepos = xlv_TEXCOORD0;
					  xlat_mutableuv.y = (floor((xlat_mutableuv.y * _Linecount)) / _Linecount);
					  highp float lum_1;
					  highp vec4 tmpvar_2;
					  highp vec4 v_3;
					  lowp vec4 tmpvar_4;
					  highp vec2 P_5;
					  highp vec2 tmpvar_6;
					  tmpvar_6 = (_TimeX * vec2(9.0, 7.0));
					  P_5 = (xlat_mutableuv + tmpvar_6);
					  tmpvar_4 = texture2D (_MainTex, P_5);
					  v_3 = tmpvar_4;
					  lowp vec4 tmpvar_7;
					  highp vec2 P_8;
					  P_8 = (xlat_mutableuv + (vec2(0.01, 0.0) * v_3.x));
					  tmpvar_7 = texture2D (_MainTex, P_8);
					  tmpvar_2 = tmpvar_7;
					  highp vec4 v_9;
					  lowp vec4 tmpvar_10;
					  highp vec2 P_11;
					  P_11 = (xlat_mutableuv + tmpvar_6);
					  tmpvar_10 = texture2D (_MainTex, P_11);
					  v_9 = tmpvar_10;
					  lum_1 = (((
					    (0.2 * tmpvar_2.x)
					   + 
					    (0.5 * tmpvar_2.y)
					  ) + (0.3 * tmpvar_2.z)) * ((0.3 * v_9.x) + 0.7));
					  highp float phase_12;
					  phase_12 = (xlat_mutablepos.y * _Linecount);
					  phase_12 = (phase_12 * 2.0);
					  highp float tmpvar_13;
					  tmpvar_13 = (phase_12 / 2.0);
					  highp float tmpvar_14;
					  tmpvar_14 = (fract(abs(tmpvar_13)) * 2.0);
					  highp float tmpvar_15;
					  if ((tmpvar_13 >= 0.0)) {
					    tmpvar_15 = tmpvar_14;
					  } else {
					    tmpvar_15 = -(tmpvar_14);
					  };
					  highp float i_16;
					  i_16 = (pow ((1.0 - 
					    abs((tmpvar_15 - 1.0))
					  ), (
					    (2.0 * (1.0 - lum_1))
					   + 0.5)) * lum_1);
					  highp vec4 tmpvar_17;
					  i_16 = (clamp (i_16, 0.0, 1.0) * 2.0);
					  if ((i_16 < 1.0)) {
					    tmpvar_17 = (((1.0 - i_16) * vec4(0.0, 0.1, 0.0, 1.0)) + (i_16 * vec4(0.2, 0.5, 0.1, 1.0)));
					  } else {
					    i_16 = (i_16 - 1.0);
					    tmpvar_17 = (((1.0 - i_16) * vec4(0.2, 0.5, 0.1, 1.0)) + (i_16 * vec4(0.9, 1.0, 0.6, 1.0)));
					  };
					  highp float tmpvar_18;
					  tmpvar_18 = (_Vignette * abs((xlat_mutablepos.x - 0.5)));
					  highp float tmpvar_19;
					  tmpvar_19 = (_Vignette * abs((xlat_mutablepos.y - 0.5)));
					  highp vec4 tmpvar_20;
					  tmpvar_20 = (tmpvar_17 * ((1.0 - 
					    (tmpvar_18 * tmpvar_18)
					  ) - (tmpvar_19 * tmpvar_19)));
					  gl_FragData[0] = tmpvar_20;
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
					uniform highp float _Vignette;
					uniform highp float _Linecount;
					highp vec2 xlat_mutablepos;
					highp vec2 xlat_mutableuv;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  xlat_mutableuv = xlv_TEXCOORD0;
					  xlat_mutablepos = xlv_TEXCOORD0;
					  xlat_mutableuv.y = (floor((xlat_mutableuv.y * _Linecount)) / _Linecount);
					  highp float lum_1;
					  highp vec4 tmpvar_2;
					  highp vec4 v_3;
					  lowp vec4 tmpvar_4;
					  highp vec2 P_5;
					  highp vec2 tmpvar_6;
					  tmpvar_6 = (_TimeX * vec2(9.0, 7.0));
					  P_5 = (xlat_mutableuv + tmpvar_6);
					  tmpvar_4 = texture2D (_MainTex, P_5);
					  v_3 = tmpvar_4;
					  lowp vec4 tmpvar_7;
					  highp vec2 P_8;
					  P_8 = (xlat_mutableuv + (vec2(0.01, 0.0) * v_3.x));
					  tmpvar_7 = texture2D (_MainTex, P_8);
					  tmpvar_2 = tmpvar_7;
					  highp vec4 v_9;
					  lowp vec4 tmpvar_10;
					  highp vec2 P_11;
					  P_11 = (xlat_mutableuv + tmpvar_6);
					  tmpvar_10 = texture2D (_MainTex, P_11);
					  v_9 = tmpvar_10;
					  lum_1 = (((
					    (0.2 * tmpvar_2.x)
					   + 
					    (0.5 * tmpvar_2.y)
					  ) + (0.3 * tmpvar_2.z)) * ((0.3 * v_9.x) + 0.7));
					  highp float phase_12;
					  phase_12 = (xlat_mutablepos.y * _Linecount);
					  phase_12 = (phase_12 * 2.0);
					  highp float tmpvar_13;
					  tmpvar_13 = (phase_12 / 2.0);
					  highp float tmpvar_14;
					  tmpvar_14 = (fract(abs(tmpvar_13)) * 2.0);
					  highp float tmpvar_15;
					  if ((tmpvar_13 >= 0.0)) {
					    tmpvar_15 = tmpvar_14;
					  } else {
					    tmpvar_15 = -(tmpvar_14);
					  };
					  highp float i_16;
					  i_16 = (pow ((1.0 - 
					    abs((tmpvar_15 - 1.0))
					  ), (
					    (2.0 * (1.0 - lum_1))
					   + 0.5)) * lum_1);
					  highp vec4 tmpvar_17;
					  i_16 = (clamp (i_16, 0.0, 1.0) * 2.0);
					  if ((i_16 < 1.0)) {
					    tmpvar_17 = (((1.0 - i_16) * vec4(0.0, 0.1, 0.0, 1.0)) + (i_16 * vec4(0.2, 0.5, 0.1, 1.0)));
					  } else {
					    i_16 = (i_16 - 1.0);
					    tmpvar_17 = (((1.0 - i_16) * vec4(0.2, 0.5, 0.1, 1.0)) + (i_16 * vec4(0.9, 1.0, 0.6, 1.0)));
					  };
					  highp float tmpvar_18;
					  tmpvar_18 = (_Vignette * abs((xlat_mutablepos.x - 0.5)));
					  highp float tmpvar_19;
					  tmpvar_19 = (_Vignette * abs((xlat_mutablepos.y - 0.5)));
					  highp vec4 tmpvar_20;
					  tmpvar_20 = (tmpvar_17 * ((1.0 - 
					    (tmpvar_18 * tmpvar_18)
					  ) - (tmpvar_19 * tmpvar_19)));
					  gl_FragData[0] = tmpvar_20;
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
					uniform highp float _Vignette;
					uniform highp float _Linecount;
					highp vec2 xlat_mutablepos;
					highp vec2 xlat_mutableuv;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  xlat_mutableuv = xlv_TEXCOORD0;
					  xlat_mutablepos = xlv_TEXCOORD0;
					  xlat_mutableuv.y = (floor((xlat_mutableuv.y * _Linecount)) / _Linecount);
					  highp float lum_1;
					  highp vec4 tmpvar_2;
					  highp vec4 v_3;
					  lowp vec4 tmpvar_4;
					  highp vec2 P_5;
					  highp vec2 tmpvar_6;
					  tmpvar_6 = (_TimeX * vec2(9.0, 7.0));
					  P_5 = (xlat_mutableuv + tmpvar_6);
					  tmpvar_4 = texture2D (_MainTex, P_5);
					  v_3 = tmpvar_4;
					  lowp vec4 tmpvar_7;
					  highp vec2 P_8;
					  P_8 = (xlat_mutableuv + (vec2(0.01, 0.0) * v_3.x));
					  tmpvar_7 = texture2D (_MainTex, P_8);
					  tmpvar_2 = tmpvar_7;
					  highp vec4 v_9;
					  lowp vec4 tmpvar_10;
					  highp vec2 P_11;
					  P_11 = (xlat_mutableuv + tmpvar_6);
					  tmpvar_10 = texture2D (_MainTex, P_11);
					  v_9 = tmpvar_10;
					  lum_1 = (((
					    (0.2 * tmpvar_2.x)
					   + 
					    (0.5 * tmpvar_2.y)
					  ) + (0.3 * tmpvar_2.z)) * ((0.3 * v_9.x) + 0.7));
					  highp float phase_12;
					  phase_12 = (xlat_mutablepos.y * _Linecount);
					  phase_12 = (phase_12 * 2.0);
					  highp float tmpvar_13;
					  tmpvar_13 = (phase_12 / 2.0);
					  highp float tmpvar_14;
					  tmpvar_14 = (fract(abs(tmpvar_13)) * 2.0);
					  highp float tmpvar_15;
					  if ((tmpvar_13 >= 0.0)) {
					    tmpvar_15 = tmpvar_14;
					  } else {
					    tmpvar_15 = -(tmpvar_14);
					  };
					  highp float i_16;
					  i_16 = (pow ((1.0 - 
					    abs((tmpvar_15 - 1.0))
					  ), (
					    (2.0 * (1.0 - lum_1))
					   + 0.5)) * lum_1);
					  highp vec4 tmpvar_17;
					  i_16 = (clamp (i_16, 0.0, 1.0) * 2.0);
					  if ((i_16 < 1.0)) {
					    tmpvar_17 = (((1.0 - i_16) * vec4(0.0, 0.1, 0.0, 1.0)) + (i_16 * vec4(0.2, 0.5, 0.1, 1.0)));
					  } else {
					    i_16 = (i_16 - 1.0);
					    tmpvar_17 = (((1.0 - i_16) * vec4(0.2, 0.5, 0.1, 1.0)) + (i_16 * vec4(0.9, 1.0, 0.6, 1.0)));
					  };
					  highp float tmpvar_18;
					  tmpvar_18 = (_Vignette * abs((xlat_mutablepos.x - 0.5)));
					  highp float tmpvar_19;
					  tmpvar_19 = (_Vignette * abs((xlat_mutablepos.y - 0.5)));
					  highp vec4 tmpvar_20;
					  tmpvar_20 = (tmpvar_17 * ((1.0 - 
					    (tmpvar_18 * tmpvar_18)
					  ) - (tmpvar_19 * tmpvar_19)));
					  gl_FragData[0] = tmpvar_20;
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
					uniform 	float _Vignette;
					uniform 	float _Linecount;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					mediump vec2 u_xlat16_1;
					lowp vec3 u_xlat10_1;
					vec4 u_xlat2;
					float u_xlat3;
					mediump float u_xlat16_3;
					lowp float u_xlat10_3;
					bool u_xlatb3;
					float u_xlat6;
					mediump float u_xlat16_6;
					mediump float u_xlat16_9;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD0.y * _Linecount;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb3 = !!(u_xlat0.x>=(-u_xlat0.x));
					#else
					    u_xlatb3 = u_xlat0.x>=(-u_xlat0.x);
					#endif
					    u_xlat6 = fract(abs(u_xlat0.x));
					    u_xlat0.x = floor(u_xlat0.x);
					    u_xlat1.y = u_xlat0.x / _Linecount;
					    u_xlat0.x = (u_xlatb3) ? u_xlat6 : (-u_xlat6);
					    u_xlat0.x = u_xlat0.x * 2.0 + -1.0;
					    u_xlat0.x = -abs(u_xlat0.x) + 1.0;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat2.y = _TimeX * 7.0 + u_xlat1.y;
					    u_xlat2.x = _TimeX * 9.0 + vs_TEXCOORD0.x;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy).x;
					    u_xlat1.x = u_xlat10_3 * 0.0100000007 + vs_TEXCOORD0.x;
					    u_xlat16_3 = u_xlat10_3 * 0.300000012 + 0.699999988;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat16_6 = dot(u_xlat10_1.xyz, vec3(0.200000003, 0.5, 0.300000012));
					    u_xlat16_9 = (-u_xlat16_6) * u_xlat16_3 + 1.0;
					    u_xlat16_3 = u_xlat16_3 * u_xlat16_6;
					    u_xlat16_6 = u_xlat16_9 * 2.0 + 0.5;
					    u_xlat0.x = u_xlat0.x * u_xlat16_6;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat16_3 * u_xlat0.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat3 = (-u_xlat0.x) * 2.0 + 1.0;
					    u_xlat1 = u_xlat0.xxxx * vec4(0.400000006, 1.0, 0.200000003, 2.0);
					    u_xlat1 = vec4(u_xlat3) * vec4(0.0, 0.100000001, 0.0, 1.0) + u_xlat1;
					    u_xlat3 = u_xlat0.x * 2.0 + -1.0;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat0.x<0.5);
					#else
					    u_xlatb0 = u_xlat0.x<0.5;
					#endif
					    u_xlat6 = (-u_xlat3) + 1.0;
					    u_xlat2 = vec4(u_xlat3) * vec4(0.899999976, 1.0, 0.600000024, 1.0);
					    u_xlat2 = vec4(u_xlat6) * vec4(0.200000003, 0.5, 0.100000001, 1.0) + u_xlat2;
					    u_xlat0 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat2;
					    u_xlat16_1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.xy = abs(u_xlat16_1.xy) * vec2(_Vignette);
					    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
					    u_xlat1.x = (-u_xlat1.y) * u_xlat1.y + u_xlat1.x;
					    SV_Target0 = u_xlat0 * u_xlat1.xxxx;
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
					uniform 	float _Vignette;
					uniform 	float _Linecount;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					mediump vec2 u_xlat16_1;
					lowp vec3 u_xlat10_1;
					vec4 u_xlat2;
					float u_xlat3;
					mediump float u_xlat16_3;
					lowp float u_xlat10_3;
					bool u_xlatb3;
					float u_xlat6;
					mediump float u_xlat16_6;
					mediump float u_xlat16_9;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD0.y * _Linecount;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb3 = !!(u_xlat0.x>=(-u_xlat0.x));
					#else
					    u_xlatb3 = u_xlat0.x>=(-u_xlat0.x);
					#endif
					    u_xlat6 = fract(abs(u_xlat0.x));
					    u_xlat0.x = floor(u_xlat0.x);
					    u_xlat1.y = u_xlat0.x / _Linecount;
					    u_xlat0.x = (u_xlatb3) ? u_xlat6 : (-u_xlat6);
					    u_xlat0.x = u_xlat0.x * 2.0 + -1.0;
					    u_xlat0.x = -abs(u_xlat0.x) + 1.0;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat2.y = _TimeX * 7.0 + u_xlat1.y;
					    u_xlat2.x = _TimeX * 9.0 + vs_TEXCOORD0.x;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy).x;
					    u_xlat1.x = u_xlat10_3 * 0.0100000007 + vs_TEXCOORD0.x;
					    u_xlat16_3 = u_xlat10_3 * 0.300000012 + 0.699999988;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat16_6 = dot(u_xlat10_1.xyz, vec3(0.200000003, 0.5, 0.300000012));
					    u_xlat16_9 = (-u_xlat16_6) * u_xlat16_3 + 1.0;
					    u_xlat16_3 = u_xlat16_3 * u_xlat16_6;
					    u_xlat16_6 = u_xlat16_9 * 2.0 + 0.5;
					    u_xlat0.x = u_xlat0.x * u_xlat16_6;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat16_3 * u_xlat0.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat3 = (-u_xlat0.x) * 2.0 + 1.0;
					    u_xlat1 = u_xlat0.xxxx * vec4(0.400000006, 1.0, 0.200000003, 2.0);
					    u_xlat1 = vec4(u_xlat3) * vec4(0.0, 0.100000001, 0.0, 1.0) + u_xlat1;
					    u_xlat3 = u_xlat0.x * 2.0 + -1.0;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat0.x<0.5);
					#else
					    u_xlatb0 = u_xlat0.x<0.5;
					#endif
					    u_xlat6 = (-u_xlat3) + 1.0;
					    u_xlat2 = vec4(u_xlat3) * vec4(0.899999976, 1.0, 0.600000024, 1.0);
					    u_xlat2 = vec4(u_xlat6) * vec4(0.200000003, 0.5, 0.100000001, 1.0) + u_xlat2;
					    u_xlat0 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat2;
					    u_xlat16_1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.xy = abs(u_xlat16_1.xy) * vec2(_Vignette);
					    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
					    u_xlat1.x = (-u_xlat1.y) * u_xlat1.y + u_xlat1.x;
					    SV_Target0 = u_xlat0 * u_xlat1.xxxx;
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
					uniform 	float _Vignette;
					uniform 	float _Linecount;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					mediump vec2 u_xlat16_1;
					lowp vec3 u_xlat10_1;
					vec4 u_xlat2;
					float u_xlat3;
					mediump float u_xlat16_3;
					lowp float u_xlat10_3;
					bool u_xlatb3;
					float u_xlat6;
					mediump float u_xlat16_6;
					mediump float u_xlat16_9;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD0.y * _Linecount;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb3 = !!(u_xlat0.x>=(-u_xlat0.x));
					#else
					    u_xlatb3 = u_xlat0.x>=(-u_xlat0.x);
					#endif
					    u_xlat6 = fract(abs(u_xlat0.x));
					    u_xlat0.x = floor(u_xlat0.x);
					    u_xlat1.y = u_xlat0.x / _Linecount;
					    u_xlat0.x = (u_xlatb3) ? u_xlat6 : (-u_xlat6);
					    u_xlat0.x = u_xlat0.x * 2.0 + -1.0;
					    u_xlat0.x = -abs(u_xlat0.x) + 1.0;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat2.y = _TimeX * 7.0 + u_xlat1.y;
					    u_xlat2.x = _TimeX * 9.0 + vs_TEXCOORD0.x;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy).x;
					    u_xlat1.x = u_xlat10_3 * 0.0100000007 + vs_TEXCOORD0.x;
					    u_xlat16_3 = u_xlat10_3 * 0.300000012 + 0.699999988;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat16_6 = dot(u_xlat10_1.xyz, vec3(0.200000003, 0.5, 0.300000012));
					    u_xlat16_9 = (-u_xlat16_6) * u_xlat16_3 + 1.0;
					    u_xlat16_3 = u_xlat16_3 * u_xlat16_6;
					    u_xlat16_6 = u_xlat16_9 * 2.0 + 0.5;
					    u_xlat0.x = u_xlat0.x * u_xlat16_6;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat16_3 * u_xlat0.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat3 = (-u_xlat0.x) * 2.0 + 1.0;
					    u_xlat1 = u_xlat0.xxxx * vec4(0.400000006, 1.0, 0.200000003, 2.0);
					    u_xlat1 = vec4(u_xlat3) * vec4(0.0, 0.100000001, 0.0, 1.0) + u_xlat1;
					    u_xlat3 = u_xlat0.x * 2.0 + -1.0;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat0.x<0.5);
					#else
					    u_xlatb0 = u_xlat0.x<0.5;
					#endif
					    u_xlat6 = (-u_xlat3) + 1.0;
					    u_xlat2 = vec4(u_xlat3) * vec4(0.899999976, 1.0, 0.600000024, 1.0);
					    u_xlat2 = vec4(u_xlat6) * vec4(0.200000003, 0.5, 0.100000001, 1.0) + u_xlat2;
					    u_xlat0 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat2;
					    u_xlat16_1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.xy = abs(u_xlat16_1.xy) * vec2(_Vignette);
					    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
					    u_xlat1.x = (-u_xlat1.y) * u_xlat1.y + u_xlat1.x;
					    SV_Target0 = u_xlat0 * u_xlat1.xxxx;
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