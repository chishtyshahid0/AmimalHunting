Shader "CameraFilterPack/Drawing_Manga2" {
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
			GpuProgramID 26641
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
					  lowp float rasterPattern_1;
					  highp vec4 color2_2;
					  highp vec3 color_3;
					  highp vec2 uv_4;
					  uv_4 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, uv_4);
					  color2_2 = tmpvar_5;
					  highp float edge0_6;
					  highp float tmpvar_7;
					  tmpvar_7 = (_DotSize / 8.0);
					  edge0_6 = ((0.4 + tmpvar_7) - 0.6);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp ((-(edge0_6) / (
					    ((0.7 + tmpvar_7) - 0.6)
					   - edge0_6)), 0.0, 1.0);
					  color_3 = (color2_2.xyz + (tmpvar_8 * (tmpvar_8 * 
					    (3.0 - (2.0 * tmpvar_8))
					  )));
					  highp float tmpvar_9;
					  highp vec2 sh_10;
					  sh_10 = xlv_TEXCOORD0;
					  highp float d_11;
					  d_11 = ((2136.281 / _DotSize) / 0.6);
					  highp vec2 tmpvar_12;
					  tmpvar_12 = (sh_10 * 0.7071064);
					  tmpvar_9 = ((0.5 + (0.25 * 
					    cos(((tmpvar_12.x + tmpvar_12.y) * d_11))
					  )) + (0.25 * cos(
					    ((tmpvar_12.x - tmpvar_12.y) * d_11)
					  )));
					  rasterPattern_1 = tmpvar_9;
					  if ((color_3.x > 0.3)) {
					    color_3 = (color_3 + rasterPattern_1);
					  };
					  highp vec3 col_13;
					  lowp vec4 tmpvar_14;
					  highp vec2 P_15;
					  P_15 = (uv_4 + vec2(-0.00390625, -0.00390625));
					  tmpvar_14 = texture2D (_MainTex, P_15);
					  highp float tmpvar_16;
					  tmpvar_16 = dot (tmpvar_14, vec4(0.3, 0.59, 0.11, 0.25));
					  lowp vec4 tmpvar_17;
					  highp vec2 P_18;
					  P_18 = (uv_4 + vec2(0.00390625, -0.00390625));
					  tmpvar_17 = texture2D (_MainTex, P_18);
					  highp float tmpvar_19;
					  tmpvar_19 = dot (tmpvar_17, vec4(0.3, 0.59, 0.11, 0.25));
					  lowp vec4 tmpvar_20;
					  highp vec2 P_21;
					  P_21 = (uv_4 + vec2(-0.00390625, 0.0));
					  tmpvar_20 = texture2D (_MainTex, P_21);
					  highp float tmpvar_22;
					  tmpvar_22 = dot (tmpvar_20, vec4(0.3, 0.59, 0.11, 0.25));
					  lowp vec4 tmpvar_23;
					  highp vec2 P_24;
					  P_24 = (uv_4 + vec2(-0.00390625, 0.00390625));
					  tmpvar_23 = texture2D (_MainTex, P_24);
					  highp float tmpvar_25;
					  tmpvar_25 = dot (tmpvar_23, vec4(0.3, 0.59, 0.11, 0.25));
					  lowp vec4 tmpvar_26;
					  highp vec2 P_27;
					  P_27 = (uv_4 + vec2(0.0, 0.00390625));
					  tmpvar_26 = texture2D (_MainTex, P_27);
					  lowp vec4 tmpvar_28;
					  highp vec2 P_29;
					  P_29 = (uv_4 + vec2(0.00390625, 0.00390625));
					  tmpvar_28 = texture2D (_MainTex, P_29);
					  highp float tmpvar_30;
					  tmpvar_30 = dot (tmpvar_28, vec4(0.3, 0.59, 0.11, 0.25));
					  highp float tmpvar_31;
					  tmpvar_31 = (((
					    ((tmpvar_19 + tmpvar_30) + (2.0 * tmpvar_22))
					   - tmpvar_16) - (2.0 * tmpvar_22)) - tmpvar_25);
					  highp float tmpvar_32;
					  tmpvar_32 = (((
					    ((tmpvar_25 + (2.0 * dot (tmpvar_26, vec4(0.3, 0.59, 0.11, 0.25)))) + tmpvar_30)
					   - tmpvar_16) - (2.0 * tmpvar_16)) - tmpvar_19);
					  if ((((tmpvar_31 * tmpvar_31) + (tmpvar_32 * tmpvar_32)) > 0.04)) {
					    col_13 = vec3(-1.0, -1.0, -1.0);
					  } else {
					    col_13 = vec3(0.0, 0.0, 0.0);
					  };
					  color_3 = (color_3 + (col_13.y * rasterPattern_1));
					  highp vec4 tmpvar_33;
					  tmpvar_33.w = 1.0;
					  tmpvar_33.xyz = color_3;
					  gl_FragData[0] = tmpvar_33;
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
					  lowp float rasterPattern_1;
					  highp vec4 color2_2;
					  highp vec3 color_3;
					  highp vec2 uv_4;
					  uv_4 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, uv_4);
					  color2_2 = tmpvar_5;
					  highp float edge0_6;
					  highp float tmpvar_7;
					  tmpvar_7 = (_DotSize / 8.0);
					  edge0_6 = ((0.4 + tmpvar_7) - 0.6);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp ((-(edge0_6) / (
					    ((0.7 + tmpvar_7) - 0.6)
					   - edge0_6)), 0.0, 1.0);
					  color_3 = (color2_2.xyz + (tmpvar_8 * (tmpvar_8 * 
					    (3.0 - (2.0 * tmpvar_8))
					  )));
					  highp float tmpvar_9;
					  highp vec2 sh_10;
					  sh_10 = xlv_TEXCOORD0;
					  highp float d_11;
					  d_11 = ((2136.281 / _DotSize) / 0.6);
					  highp vec2 tmpvar_12;
					  tmpvar_12 = (sh_10 * 0.7071064);
					  tmpvar_9 = ((0.5 + (0.25 * 
					    cos(((tmpvar_12.x + tmpvar_12.y) * d_11))
					  )) + (0.25 * cos(
					    ((tmpvar_12.x - tmpvar_12.y) * d_11)
					  )));
					  rasterPattern_1 = tmpvar_9;
					  if ((color_3.x > 0.3)) {
					    color_3 = (color_3 + rasterPattern_1);
					  };
					  highp vec3 col_13;
					  lowp vec4 tmpvar_14;
					  highp vec2 P_15;
					  P_15 = (uv_4 + vec2(-0.00390625, -0.00390625));
					  tmpvar_14 = texture2D (_MainTex, P_15);
					  highp float tmpvar_16;
					  tmpvar_16 = dot (tmpvar_14, vec4(0.3, 0.59, 0.11, 0.25));
					  lowp vec4 tmpvar_17;
					  highp vec2 P_18;
					  P_18 = (uv_4 + vec2(0.00390625, -0.00390625));
					  tmpvar_17 = texture2D (_MainTex, P_18);
					  highp float tmpvar_19;
					  tmpvar_19 = dot (tmpvar_17, vec4(0.3, 0.59, 0.11, 0.25));
					  lowp vec4 tmpvar_20;
					  highp vec2 P_21;
					  P_21 = (uv_4 + vec2(-0.00390625, 0.0));
					  tmpvar_20 = texture2D (_MainTex, P_21);
					  highp float tmpvar_22;
					  tmpvar_22 = dot (tmpvar_20, vec4(0.3, 0.59, 0.11, 0.25));
					  lowp vec4 tmpvar_23;
					  highp vec2 P_24;
					  P_24 = (uv_4 + vec2(-0.00390625, 0.00390625));
					  tmpvar_23 = texture2D (_MainTex, P_24);
					  highp float tmpvar_25;
					  tmpvar_25 = dot (tmpvar_23, vec4(0.3, 0.59, 0.11, 0.25));
					  lowp vec4 tmpvar_26;
					  highp vec2 P_27;
					  P_27 = (uv_4 + vec2(0.0, 0.00390625));
					  tmpvar_26 = texture2D (_MainTex, P_27);
					  lowp vec4 tmpvar_28;
					  highp vec2 P_29;
					  P_29 = (uv_4 + vec2(0.00390625, 0.00390625));
					  tmpvar_28 = texture2D (_MainTex, P_29);
					  highp float tmpvar_30;
					  tmpvar_30 = dot (tmpvar_28, vec4(0.3, 0.59, 0.11, 0.25));
					  highp float tmpvar_31;
					  tmpvar_31 = (((
					    ((tmpvar_19 + tmpvar_30) + (2.0 * tmpvar_22))
					   - tmpvar_16) - (2.0 * tmpvar_22)) - tmpvar_25);
					  highp float tmpvar_32;
					  tmpvar_32 = (((
					    ((tmpvar_25 + (2.0 * dot (tmpvar_26, vec4(0.3, 0.59, 0.11, 0.25)))) + tmpvar_30)
					   - tmpvar_16) - (2.0 * tmpvar_16)) - tmpvar_19);
					  if ((((tmpvar_31 * tmpvar_31) + (tmpvar_32 * tmpvar_32)) > 0.04)) {
					    col_13 = vec3(-1.0, -1.0, -1.0);
					  } else {
					    col_13 = vec3(0.0, 0.0, 0.0);
					  };
					  color_3 = (color_3 + (col_13.y * rasterPattern_1));
					  highp vec4 tmpvar_33;
					  tmpvar_33.w = 1.0;
					  tmpvar_33.xyz = color_3;
					  gl_FragData[0] = tmpvar_33;
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
					  lowp float rasterPattern_1;
					  highp vec4 color2_2;
					  highp vec3 color_3;
					  highp vec2 uv_4;
					  uv_4 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, uv_4);
					  color2_2 = tmpvar_5;
					  highp float edge0_6;
					  highp float tmpvar_7;
					  tmpvar_7 = (_DotSize / 8.0);
					  edge0_6 = ((0.4 + tmpvar_7) - 0.6);
					  highp float tmpvar_8;
					  tmpvar_8 = clamp ((-(edge0_6) / (
					    ((0.7 + tmpvar_7) - 0.6)
					   - edge0_6)), 0.0, 1.0);
					  color_3 = (color2_2.xyz + (tmpvar_8 * (tmpvar_8 * 
					    (3.0 - (2.0 * tmpvar_8))
					  )));
					  highp float tmpvar_9;
					  highp vec2 sh_10;
					  sh_10 = xlv_TEXCOORD0;
					  highp float d_11;
					  d_11 = ((2136.281 / _DotSize) / 0.6);
					  highp vec2 tmpvar_12;
					  tmpvar_12 = (sh_10 * 0.7071064);
					  tmpvar_9 = ((0.5 + (0.25 * 
					    cos(((tmpvar_12.x + tmpvar_12.y) * d_11))
					  )) + (0.25 * cos(
					    ((tmpvar_12.x - tmpvar_12.y) * d_11)
					  )));
					  rasterPattern_1 = tmpvar_9;
					  if ((color_3.x > 0.3)) {
					    color_3 = (color_3 + rasterPattern_1);
					  };
					  highp vec3 col_13;
					  lowp vec4 tmpvar_14;
					  highp vec2 P_15;
					  P_15 = (uv_4 + vec2(-0.00390625, -0.00390625));
					  tmpvar_14 = texture2D (_MainTex, P_15);
					  highp float tmpvar_16;
					  tmpvar_16 = dot (tmpvar_14, vec4(0.3, 0.59, 0.11, 0.25));
					  lowp vec4 tmpvar_17;
					  highp vec2 P_18;
					  P_18 = (uv_4 + vec2(0.00390625, -0.00390625));
					  tmpvar_17 = texture2D (_MainTex, P_18);
					  highp float tmpvar_19;
					  tmpvar_19 = dot (tmpvar_17, vec4(0.3, 0.59, 0.11, 0.25));
					  lowp vec4 tmpvar_20;
					  highp vec2 P_21;
					  P_21 = (uv_4 + vec2(-0.00390625, 0.0));
					  tmpvar_20 = texture2D (_MainTex, P_21);
					  highp float tmpvar_22;
					  tmpvar_22 = dot (tmpvar_20, vec4(0.3, 0.59, 0.11, 0.25));
					  lowp vec4 tmpvar_23;
					  highp vec2 P_24;
					  P_24 = (uv_4 + vec2(-0.00390625, 0.00390625));
					  tmpvar_23 = texture2D (_MainTex, P_24);
					  highp float tmpvar_25;
					  tmpvar_25 = dot (tmpvar_23, vec4(0.3, 0.59, 0.11, 0.25));
					  lowp vec4 tmpvar_26;
					  highp vec2 P_27;
					  P_27 = (uv_4 + vec2(0.0, 0.00390625));
					  tmpvar_26 = texture2D (_MainTex, P_27);
					  lowp vec4 tmpvar_28;
					  highp vec2 P_29;
					  P_29 = (uv_4 + vec2(0.00390625, 0.00390625));
					  tmpvar_28 = texture2D (_MainTex, P_29);
					  highp float tmpvar_30;
					  tmpvar_30 = dot (tmpvar_28, vec4(0.3, 0.59, 0.11, 0.25));
					  highp float tmpvar_31;
					  tmpvar_31 = (((
					    ((tmpvar_19 + tmpvar_30) + (2.0 * tmpvar_22))
					   - tmpvar_16) - (2.0 * tmpvar_22)) - tmpvar_25);
					  highp float tmpvar_32;
					  tmpvar_32 = (((
					    ((tmpvar_25 + (2.0 * dot (tmpvar_26, vec4(0.3, 0.59, 0.11, 0.25)))) + tmpvar_30)
					   - tmpvar_16) - (2.0 * tmpvar_16)) - tmpvar_19);
					  if ((((tmpvar_31 * tmpvar_31) + (tmpvar_32 * tmpvar_32)) > 0.04)) {
					    col_13 = vec3(-1.0, -1.0, -1.0);
					  } else {
					    col_13 = vec3(0.0, 0.0, 0.0);
					  };
					  color_3 = (color_3 + (col_13.y * rasterPattern_1));
					  highp vec4 tmpvar_33;
					  tmpvar_33.w = 1.0;
					  tmpvar_33.xyz = color_3;
					  gl_FragData[0] = tmpvar_33;
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
					vec4 u_xlat0;
					mediump float u_xlat16_0;
					lowp vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec3 u_xlat2;
					lowp vec4 u_xlat10_2;
					vec3 u_xlat3;
					mediump float u_xlat16_3;
					float u_xlat6;
					mediump vec2 u_xlat16_6;
					bool u_xlatb6;
					float u_xlat9;
					mediump float u_xlat16_9;
					void main()
					{
					    u_xlat0 = vs_TEXCOORD0.xyxy + vec4(0.0, 0.00390625, 0.00390625, 0.00390625);
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_0 = dot(u_xlat10_0, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
					    u_xlat16_3 = dot(u_xlat10_1, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
					    u_xlat1 = vs_TEXCOORD0.xyxy + vec4(-0.00390625, 0.0, -0.00390625, 0.00390625);
					    u_xlat10_2 = texture(_MainTex, u_xlat1.zw);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat16_6.x = dot(u_xlat10_1, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
					    u_xlat16_9 = dot(u_xlat10_2, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
					    u_xlat16_3 = u_xlat16_3 * 2.0 + u_xlat16_9;
					    u_xlat16_3 = u_xlat16_0 + u_xlat16_3;
					    u_xlat1 = vs_TEXCOORD0.xyxy + vec4(-0.00390625, -0.00390625, 0.00390625, -0.00390625);
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat1.x = dot(u_xlat10_1, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
					    u_xlat1.y = dot(u_xlat10_2, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
					    u_xlat3.x = u_xlat16_3 + (-u_xlat1.y);
					    u_xlat0.y = (-u_xlat1.y) * 2.0 + u_xlat3.x;
					    u_xlat0.x = u_xlat16_0 + u_xlat1.x;
					    u_xlat0.x = u_xlat16_6.x * 2.0 + u_xlat0.x;
					    u_xlat0.xy = (-u_xlat1.yx) + u_xlat0.xy;
					    u_xlat0.x = (-u_xlat16_6.x) * 2.0 + u_xlat0.x;
					    u_xlat0.x = (-u_xlat16_9) + u_xlat0.x;
					    u_xlat3.x = u_xlat0.y * u_xlat0.y;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x + u_xlat3.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(0.0399999991<u_xlat0.x);
					#else
					    u_xlatb0 = 0.0399999991<u_xlat0.x;
					#endif
					    u_xlat0.x = u_xlatb0 ? -1.0 : float(0.0);
					    u_xlat3.x = 2136.28125 / _DotSize;
					    u_xlat3.x = u_xlat3.x * 1.66666663;
					    u_xlat16_6.xy = vs_TEXCOORD0.xy * vec2(0.707106411, 0.707106411);
					    u_xlat16_6.x = u_xlat16_6.y + u_xlat16_6.x;
					    u_xlat16_9 = vs_TEXCOORD0.x * 0.707106411 + (-u_xlat16_6.y);
					    u_xlat3.z = u_xlat3.x * u_xlat16_9;
					    u_xlat3.x = u_xlat3.x * u_xlat16_6.x;
					    u_xlat3.xy = cos(u_xlat3.xz);
					    u_xlat3.x = u_xlat3.x * 0.25 + 0.5;
					    u_xlat3.x = u_xlat3.y * 0.25 + u_xlat3.x;
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat6 = _DotSize * 0.125 + -0.200000018;
					    u_xlat6 = u_xlat6 * -3.33333349;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
					#else
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					#endif
					    u_xlat9 = u_xlat6 * -2.0 + 3.0;
					    u_xlat6 = u_xlat6 * u_xlat6;
					    u_xlat1.xyz = vec3(u_xlat9) * vec3(u_xlat6) + u_xlat10_1.xyz;
					    u_xlat2.xyz = u_xlat3.xxx + u_xlat1.xyz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb6 = !!(0.300000012<u_xlat1.x);
					#else
					    u_xlatb6 = 0.300000012<u_xlat1.x;
					#endif
					    u_xlat1.xyz = (bool(u_xlatb6)) ? u_xlat2.xyz : u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat3.xxx + u_xlat1.xyz;
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
					vec4 u_xlat0;
					mediump float u_xlat16_0;
					lowp vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec3 u_xlat2;
					lowp vec4 u_xlat10_2;
					vec3 u_xlat3;
					mediump float u_xlat16_3;
					float u_xlat6;
					mediump vec2 u_xlat16_6;
					bool u_xlatb6;
					float u_xlat9;
					mediump float u_xlat16_9;
					void main()
					{
					    u_xlat0 = vs_TEXCOORD0.xyxy + vec4(0.0, 0.00390625, 0.00390625, 0.00390625);
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_0 = dot(u_xlat10_0, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
					    u_xlat16_3 = dot(u_xlat10_1, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
					    u_xlat1 = vs_TEXCOORD0.xyxy + vec4(-0.00390625, 0.0, -0.00390625, 0.00390625);
					    u_xlat10_2 = texture(_MainTex, u_xlat1.zw);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat16_6.x = dot(u_xlat10_1, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
					    u_xlat16_9 = dot(u_xlat10_2, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
					    u_xlat16_3 = u_xlat16_3 * 2.0 + u_xlat16_9;
					    u_xlat16_3 = u_xlat16_0 + u_xlat16_3;
					    u_xlat1 = vs_TEXCOORD0.xyxy + vec4(-0.00390625, -0.00390625, 0.00390625, -0.00390625);
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat1.x = dot(u_xlat10_1, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
					    u_xlat1.y = dot(u_xlat10_2, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
					    u_xlat3.x = u_xlat16_3 + (-u_xlat1.y);
					    u_xlat0.y = (-u_xlat1.y) * 2.0 + u_xlat3.x;
					    u_xlat0.x = u_xlat16_0 + u_xlat1.x;
					    u_xlat0.x = u_xlat16_6.x * 2.0 + u_xlat0.x;
					    u_xlat0.xy = (-u_xlat1.yx) + u_xlat0.xy;
					    u_xlat0.x = (-u_xlat16_6.x) * 2.0 + u_xlat0.x;
					    u_xlat0.x = (-u_xlat16_9) + u_xlat0.x;
					    u_xlat3.x = u_xlat0.y * u_xlat0.y;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x + u_xlat3.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(0.0399999991<u_xlat0.x);
					#else
					    u_xlatb0 = 0.0399999991<u_xlat0.x;
					#endif
					    u_xlat0.x = u_xlatb0 ? -1.0 : float(0.0);
					    u_xlat3.x = 2136.28125 / _DotSize;
					    u_xlat3.x = u_xlat3.x * 1.66666663;
					    u_xlat16_6.xy = vs_TEXCOORD0.xy * vec2(0.707106411, 0.707106411);
					    u_xlat16_6.x = u_xlat16_6.y + u_xlat16_6.x;
					    u_xlat16_9 = vs_TEXCOORD0.x * 0.707106411 + (-u_xlat16_6.y);
					    u_xlat3.z = u_xlat3.x * u_xlat16_9;
					    u_xlat3.x = u_xlat3.x * u_xlat16_6.x;
					    u_xlat3.xy = cos(u_xlat3.xz);
					    u_xlat3.x = u_xlat3.x * 0.25 + 0.5;
					    u_xlat3.x = u_xlat3.y * 0.25 + u_xlat3.x;
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat6 = _DotSize * 0.125 + -0.200000018;
					    u_xlat6 = u_xlat6 * -3.33333349;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
					#else
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					#endif
					    u_xlat9 = u_xlat6 * -2.0 + 3.0;
					    u_xlat6 = u_xlat6 * u_xlat6;
					    u_xlat1.xyz = vec3(u_xlat9) * vec3(u_xlat6) + u_xlat10_1.xyz;
					    u_xlat2.xyz = u_xlat3.xxx + u_xlat1.xyz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb6 = !!(0.300000012<u_xlat1.x);
					#else
					    u_xlatb6 = 0.300000012<u_xlat1.x;
					#endif
					    u_xlat1.xyz = (bool(u_xlatb6)) ? u_xlat2.xyz : u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat3.xxx + u_xlat1.xyz;
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
					vec4 u_xlat0;
					mediump float u_xlat16_0;
					lowp vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec3 u_xlat2;
					lowp vec4 u_xlat10_2;
					vec3 u_xlat3;
					mediump float u_xlat16_3;
					float u_xlat6;
					mediump vec2 u_xlat16_6;
					bool u_xlatb6;
					float u_xlat9;
					mediump float u_xlat16_9;
					void main()
					{
					    u_xlat0 = vs_TEXCOORD0.xyxy + vec4(0.0, 0.00390625, 0.00390625, 0.00390625);
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_0 = dot(u_xlat10_0, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
					    u_xlat16_3 = dot(u_xlat10_1, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
					    u_xlat1 = vs_TEXCOORD0.xyxy + vec4(-0.00390625, 0.0, -0.00390625, 0.00390625);
					    u_xlat10_2 = texture(_MainTex, u_xlat1.zw);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat16_6.x = dot(u_xlat10_1, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
					    u_xlat16_9 = dot(u_xlat10_2, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
					    u_xlat16_3 = u_xlat16_3 * 2.0 + u_xlat16_9;
					    u_xlat16_3 = u_xlat16_0 + u_xlat16_3;
					    u_xlat1 = vs_TEXCOORD0.xyxy + vec4(-0.00390625, -0.00390625, 0.00390625, -0.00390625);
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat1.x = dot(u_xlat10_1, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
					    u_xlat1.y = dot(u_xlat10_2, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
					    u_xlat3.x = u_xlat16_3 + (-u_xlat1.y);
					    u_xlat0.y = (-u_xlat1.y) * 2.0 + u_xlat3.x;
					    u_xlat0.x = u_xlat16_0 + u_xlat1.x;
					    u_xlat0.x = u_xlat16_6.x * 2.0 + u_xlat0.x;
					    u_xlat0.xy = (-u_xlat1.yx) + u_xlat0.xy;
					    u_xlat0.x = (-u_xlat16_6.x) * 2.0 + u_xlat0.x;
					    u_xlat0.x = (-u_xlat16_9) + u_xlat0.x;
					    u_xlat3.x = u_xlat0.y * u_xlat0.y;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x + u_xlat3.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(0.0399999991<u_xlat0.x);
					#else
					    u_xlatb0 = 0.0399999991<u_xlat0.x;
					#endif
					    u_xlat0.x = u_xlatb0 ? -1.0 : float(0.0);
					    u_xlat3.x = 2136.28125 / _DotSize;
					    u_xlat3.x = u_xlat3.x * 1.66666663;
					    u_xlat16_6.xy = vs_TEXCOORD0.xy * vec2(0.707106411, 0.707106411);
					    u_xlat16_6.x = u_xlat16_6.y + u_xlat16_6.x;
					    u_xlat16_9 = vs_TEXCOORD0.x * 0.707106411 + (-u_xlat16_6.y);
					    u_xlat3.z = u_xlat3.x * u_xlat16_9;
					    u_xlat3.x = u_xlat3.x * u_xlat16_6.x;
					    u_xlat3.xy = cos(u_xlat3.xz);
					    u_xlat3.x = u_xlat3.x * 0.25 + 0.5;
					    u_xlat3.x = u_xlat3.y * 0.25 + u_xlat3.x;
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat6 = _DotSize * 0.125 + -0.200000018;
					    u_xlat6 = u_xlat6 * -3.33333349;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
					#else
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					#endif
					    u_xlat9 = u_xlat6 * -2.0 + 3.0;
					    u_xlat6 = u_xlat6 * u_xlat6;
					    u_xlat1.xyz = vec3(u_xlat9) * vec3(u_xlat6) + u_xlat10_1.xyz;
					    u_xlat2.xyz = u_xlat3.xxx + u_xlat1.xyz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb6 = !!(0.300000012<u_xlat1.x);
					#else
					    u_xlatb6 = 0.300000012<u_xlat1.x;
					#endif
					    u_xlat1.xyz = (bool(u_xlatb6)) ? u_xlat2.xyz : u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat3.xxx + u_xlat1.xyz;
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