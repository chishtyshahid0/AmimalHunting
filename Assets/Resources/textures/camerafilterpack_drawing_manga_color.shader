Shader "CameraFilterPack/Drawing_Manga_Color" {
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
			GpuProgramID 28351
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
					  highp vec2 resText_1;
					  highp float lum_2;
					  highp vec3 color_3;
					  highp vec2 uv_4;
					  uv_4 = xlv_TEXCOORD0;
					  lowp vec3 tmpvar_5;
					  tmpvar_5 = (texture2D (_MainTex, uv_4) * 2.0).xyz;
					  color_3 = tmpvar_5;
					  highp float tmpvar_6;
					  highp vec2 sh_7;
					  sh_7 = xlv_TEXCOORD0;
					  highp float d_8;
					  d_8 = ((2136.281 / _DotSize) / 1.6);
					  highp vec2 tmpvar_9;
					  tmpvar_9 = (sh_7 * 0.7071064);
					  tmpvar_6 = ((0.5 + (0.25 * 
					    cos(((tmpvar_9.x + tmpvar_9.y) * d_8))
					  )) + (0.25 * cos(
					    ((tmpvar_9.x - tmpvar_9.y) * d_8)
					  )));
					  highp vec3 col_10;
					  highp float tmpvar_11;
					  tmpvar_11 = (0.001953125 * _DotSize);
					  highp vec2 tmpvar_12;
					  tmpvar_12.x = -(tmpvar_11);
					  tmpvar_12.y = -(tmpvar_11);
					  lowp vec4 tmpvar_13;
					  highp vec2 P_14;
					  P_14 = (uv_4 + tmpvar_12);
					  tmpvar_13 = texture2D (_MainTex, P_14);
					  highp float tmpvar_15;
					  tmpvar_15 = dot (tmpvar_13, vec4(0.1125, 0.22125, 0.04125, 0.25));
					  highp vec2 tmpvar_16;
					  tmpvar_16.x = tmpvar_11;
					  tmpvar_16.y = -(tmpvar_11);
					  lowp vec4 tmpvar_17;
					  highp vec2 P_18;
					  P_18 = (uv_4 + tmpvar_16);
					  tmpvar_17 = texture2D (_MainTex, P_18);
					  highp float tmpvar_19;
					  tmpvar_19 = dot (tmpvar_17, vec4(0.1125, 0.22125, 0.04125, 0.25));
					  highp float tmpvar_20;
					  tmpvar_20 = (((
					    ((tmpvar_19 + tmpvar_19) + (2.0 * tmpvar_19))
					   - tmpvar_15) - (2.0 * tmpvar_15)) - tmpvar_15);
					  highp float tmpvar_21;
					  tmpvar_21 = (((
					    ((tmpvar_15 + (2.0 * tmpvar_15)) + tmpvar_19)
					   - tmpvar_15) - (2.0 * tmpvar_15)) - tmpvar_19);
					  if ((((tmpvar_20 * tmpvar_20) + (tmpvar_21 * tmpvar_21)) > 0.04)) {
					    col_10 = vec3(-1.0, -1.0, -1.0);
					  } else {
					    col_10 = vec3(0.0, 0.0, 0.0);
					  };
					  color_3 = (color_3 + (col_10 * tmpvar_6));
					  color_3 = (color_3 / 2.0);
					  lum_2 = (floor((2.8 * color_3.x)) / 2.8);
					  mediump vec2 tmpvar_22;
					  tmpvar_22 = (xlv_TEXCOORD0 * 480.0);
					  resText_1 = tmpvar_22;
					  highp float tmpvar_23;
					  tmpvar_23 = sin(((
					    (6.3 * (resText_1.x + resText_1.y))
					   * lum_2) / 2.0));
					  highp float tmpvar_24;
					  tmpvar_24 = sin(((
					    (6.3 * (resText_1.x - resText_1.y))
					   * lum_2) / 2.0));
					  highp float tmpvar_25;
					  if ((color_3.y > color_3.x)) {
					    tmpvar_25 = tmpvar_24;
					  } else {
					    tmpvar_25 = tmpvar_23;
					  };
					  color_3 = (color_3 - (vec3(tmpvar_25) / 8.0));
					  highp vec4 tmpvar_26;
					  tmpvar_26.w = 1.0;
					  tmpvar_26.xyz = color_3;
					  gl_FragData[0] = tmpvar_26;
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
					  highp vec2 resText_1;
					  highp float lum_2;
					  highp vec3 color_3;
					  highp vec2 uv_4;
					  uv_4 = xlv_TEXCOORD0;
					  lowp vec3 tmpvar_5;
					  tmpvar_5 = (texture2D (_MainTex, uv_4) * 2.0).xyz;
					  color_3 = tmpvar_5;
					  highp float tmpvar_6;
					  highp vec2 sh_7;
					  sh_7 = xlv_TEXCOORD0;
					  highp float d_8;
					  d_8 = ((2136.281 / _DotSize) / 1.6);
					  highp vec2 tmpvar_9;
					  tmpvar_9 = (sh_7 * 0.7071064);
					  tmpvar_6 = ((0.5 + (0.25 * 
					    cos(((tmpvar_9.x + tmpvar_9.y) * d_8))
					  )) + (0.25 * cos(
					    ((tmpvar_9.x - tmpvar_9.y) * d_8)
					  )));
					  highp vec3 col_10;
					  highp float tmpvar_11;
					  tmpvar_11 = (0.001953125 * _DotSize);
					  highp vec2 tmpvar_12;
					  tmpvar_12.x = -(tmpvar_11);
					  tmpvar_12.y = -(tmpvar_11);
					  lowp vec4 tmpvar_13;
					  highp vec2 P_14;
					  P_14 = (uv_4 + tmpvar_12);
					  tmpvar_13 = texture2D (_MainTex, P_14);
					  highp float tmpvar_15;
					  tmpvar_15 = dot (tmpvar_13, vec4(0.1125, 0.22125, 0.04125, 0.25));
					  highp vec2 tmpvar_16;
					  tmpvar_16.x = tmpvar_11;
					  tmpvar_16.y = -(tmpvar_11);
					  lowp vec4 tmpvar_17;
					  highp vec2 P_18;
					  P_18 = (uv_4 + tmpvar_16);
					  tmpvar_17 = texture2D (_MainTex, P_18);
					  highp float tmpvar_19;
					  tmpvar_19 = dot (tmpvar_17, vec4(0.1125, 0.22125, 0.04125, 0.25));
					  highp float tmpvar_20;
					  tmpvar_20 = (((
					    ((tmpvar_19 + tmpvar_19) + (2.0 * tmpvar_19))
					   - tmpvar_15) - (2.0 * tmpvar_15)) - tmpvar_15);
					  highp float tmpvar_21;
					  tmpvar_21 = (((
					    ((tmpvar_15 + (2.0 * tmpvar_15)) + tmpvar_19)
					   - tmpvar_15) - (2.0 * tmpvar_15)) - tmpvar_19);
					  if ((((tmpvar_20 * tmpvar_20) + (tmpvar_21 * tmpvar_21)) > 0.04)) {
					    col_10 = vec3(-1.0, -1.0, -1.0);
					  } else {
					    col_10 = vec3(0.0, 0.0, 0.0);
					  };
					  color_3 = (color_3 + (col_10 * tmpvar_6));
					  color_3 = (color_3 / 2.0);
					  lum_2 = (floor((2.8 * color_3.x)) / 2.8);
					  mediump vec2 tmpvar_22;
					  tmpvar_22 = (xlv_TEXCOORD0 * 480.0);
					  resText_1 = tmpvar_22;
					  highp float tmpvar_23;
					  tmpvar_23 = sin(((
					    (6.3 * (resText_1.x + resText_1.y))
					   * lum_2) / 2.0));
					  highp float tmpvar_24;
					  tmpvar_24 = sin(((
					    (6.3 * (resText_1.x - resText_1.y))
					   * lum_2) / 2.0));
					  highp float tmpvar_25;
					  if ((color_3.y > color_3.x)) {
					    tmpvar_25 = tmpvar_24;
					  } else {
					    tmpvar_25 = tmpvar_23;
					  };
					  color_3 = (color_3 - (vec3(tmpvar_25) / 8.0));
					  highp vec4 tmpvar_26;
					  tmpvar_26.w = 1.0;
					  tmpvar_26.xyz = color_3;
					  gl_FragData[0] = tmpvar_26;
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
					  highp vec2 resText_1;
					  highp float lum_2;
					  highp vec3 color_3;
					  highp vec2 uv_4;
					  uv_4 = xlv_TEXCOORD0;
					  lowp vec3 tmpvar_5;
					  tmpvar_5 = (texture2D (_MainTex, uv_4) * 2.0).xyz;
					  color_3 = tmpvar_5;
					  highp float tmpvar_6;
					  highp vec2 sh_7;
					  sh_7 = xlv_TEXCOORD0;
					  highp float d_8;
					  d_8 = ((2136.281 / _DotSize) / 1.6);
					  highp vec2 tmpvar_9;
					  tmpvar_9 = (sh_7 * 0.7071064);
					  tmpvar_6 = ((0.5 + (0.25 * 
					    cos(((tmpvar_9.x + tmpvar_9.y) * d_8))
					  )) + (0.25 * cos(
					    ((tmpvar_9.x - tmpvar_9.y) * d_8)
					  )));
					  highp vec3 col_10;
					  highp float tmpvar_11;
					  tmpvar_11 = (0.001953125 * _DotSize);
					  highp vec2 tmpvar_12;
					  tmpvar_12.x = -(tmpvar_11);
					  tmpvar_12.y = -(tmpvar_11);
					  lowp vec4 tmpvar_13;
					  highp vec2 P_14;
					  P_14 = (uv_4 + tmpvar_12);
					  tmpvar_13 = texture2D (_MainTex, P_14);
					  highp float tmpvar_15;
					  tmpvar_15 = dot (tmpvar_13, vec4(0.1125, 0.22125, 0.04125, 0.25));
					  highp vec2 tmpvar_16;
					  tmpvar_16.x = tmpvar_11;
					  tmpvar_16.y = -(tmpvar_11);
					  lowp vec4 tmpvar_17;
					  highp vec2 P_18;
					  P_18 = (uv_4 + tmpvar_16);
					  tmpvar_17 = texture2D (_MainTex, P_18);
					  highp float tmpvar_19;
					  tmpvar_19 = dot (tmpvar_17, vec4(0.1125, 0.22125, 0.04125, 0.25));
					  highp float tmpvar_20;
					  tmpvar_20 = (((
					    ((tmpvar_19 + tmpvar_19) + (2.0 * tmpvar_19))
					   - tmpvar_15) - (2.0 * tmpvar_15)) - tmpvar_15);
					  highp float tmpvar_21;
					  tmpvar_21 = (((
					    ((tmpvar_15 + (2.0 * tmpvar_15)) + tmpvar_19)
					   - tmpvar_15) - (2.0 * tmpvar_15)) - tmpvar_19);
					  if ((((tmpvar_20 * tmpvar_20) + (tmpvar_21 * tmpvar_21)) > 0.04)) {
					    col_10 = vec3(-1.0, -1.0, -1.0);
					  } else {
					    col_10 = vec3(0.0, 0.0, 0.0);
					  };
					  color_3 = (color_3 + (col_10 * tmpvar_6));
					  color_3 = (color_3 / 2.0);
					  lum_2 = (floor((2.8 * color_3.x)) / 2.8);
					  mediump vec2 tmpvar_22;
					  tmpvar_22 = (xlv_TEXCOORD0 * 480.0);
					  resText_1 = tmpvar_22;
					  highp float tmpvar_23;
					  tmpvar_23 = sin(((
					    (6.3 * (resText_1.x + resText_1.y))
					   * lum_2) / 2.0));
					  highp float tmpvar_24;
					  tmpvar_24 = sin(((
					    (6.3 * (resText_1.x - resText_1.y))
					   * lum_2) / 2.0));
					  highp float tmpvar_25;
					  if ((color_3.y > color_3.x)) {
					    tmpvar_25 = tmpvar_24;
					  } else {
					    tmpvar_25 = tmpvar_23;
					  };
					  color_3 = (color_3 - (vec3(tmpvar_25) / 8.0));
					  highp vec4 tmpvar_26;
					  tmpvar_26.w = 1.0;
					  tmpvar_26.xyz = color_3;
					  gl_FragData[0] = tmpvar_26;
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
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					bool u_xlatb1;
					mediump vec2 u_xlat16_2;
					vec2 u_xlat3;
					mediump vec2 u_xlat16_3;
					bool u_xlatb3;
					float u_xlat4;
					mediump float u_xlat16_4;
					vec2 u_xlat6;
					mediump float u_xlat16_6;
					float u_xlat7;
					mediump float u_xlat16_7;
					float u_xlat9;
					void main()
					{
					    u_xlat0.x = 2136.28125 / _DotSize;
					    u_xlat0.x = u_xlat0.x * 0.625;
					    u_xlat16_3.xy = vs_TEXCOORD0.xy * vec2(0.707106411, 0.707106411);
					    u_xlat16_3.x = u_xlat16_3.y + u_xlat16_3.x;
					    u_xlat16_6 = vs_TEXCOORD0.x * 0.707106411 + (-u_xlat16_3.y);
					    u_xlat0.z = u_xlat0.x * u_xlat16_6;
					    u_xlat0.x = u_xlat0.x * u_xlat16_3.x;
					    u_xlat0.xy = cos(u_xlat0.xz);
					    u_xlat0.x = u_xlat0.x * 0.25 + 0.5;
					    u_xlat0.x = u_xlat0.y * 0.25 + u_xlat0.x;
					    u_xlat3.xy = vec2(_DotSize) * vec2(0.001953125, -0.001953125) + vs_TEXCOORD0.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat3.xy);
					    u_xlat16_3.x = dot(u_xlat10_1, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat6.xy = (-vec2(_DotSize)) * vec2(0.001953125, 0.001953125) + vs_TEXCOORD0.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat6.xy);
					    u_xlat16_6 = dot(u_xlat10_1, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat16_3.x = u_xlat16_3.x * 4.0 + (-u_xlat16_6);
					    u_xlat16_3.x = u_xlat16_6 * -3.0 + u_xlat16_3.x;
					    u_xlat3.x = u_xlat16_3.x * u_xlat16_3.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb3 = !!(0.0399999991<u_xlat3.x);
					#else
					    u_xlatb3 = 0.0399999991<u_xlat3.x;
					#endif
					    u_xlat3.x = u_xlatb3 ? -1.0 : float(0.0);
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_1 = u_xlat10_1.xyzx + u_xlat10_1.xyzx;
					    u_xlat0 = u_xlat3.xxxx * u_xlat0.xxxx + u_xlat16_1;
					    u_xlat0 = u_xlat0 * vec4(0.5, 0.5, 0.5, 1.39999998);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb1 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat9 = floor(u_xlat0.w);
					    u_xlat9 = u_xlat9 * 0.357142866;
					    u_xlat16_2.xy = vs_TEXCOORD0.xy * vec2(480.0, 480.0);
					    u_xlat16_4 = u_xlat16_2.y + u_xlat16_2.x;
					    u_xlat16_7 = vs_TEXCOORD0.x * 480.0 + (-u_xlat16_2.y);
					    u_xlat7 = u_xlat9 * u_xlat16_7;
					    u_xlat9 = u_xlat9 * u_xlat16_4;
					    u_xlat9 = u_xlat9 * 3.1500001;
					    u_xlat9 = sin(u_xlat9);
					    u_xlat4 = u_xlat7 * 3.1500001;
					    u_xlat4 = sin(u_xlat4);
					    u_xlat9 = (u_xlatb1) ? u_xlat4 : u_xlat9;
					    SV_Target0.xyz = (-vec3(u_xlat9)) * vec3(0.125, 0.125, 0.125) + u_xlat0.xyz;
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
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					bool u_xlatb1;
					mediump vec2 u_xlat16_2;
					vec2 u_xlat3;
					mediump vec2 u_xlat16_3;
					bool u_xlatb3;
					float u_xlat4;
					mediump float u_xlat16_4;
					vec2 u_xlat6;
					mediump float u_xlat16_6;
					float u_xlat7;
					mediump float u_xlat16_7;
					float u_xlat9;
					void main()
					{
					    u_xlat0.x = 2136.28125 / _DotSize;
					    u_xlat0.x = u_xlat0.x * 0.625;
					    u_xlat16_3.xy = vs_TEXCOORD0.xy * vec2(0.707106411, 0.707106411);
					    u_xlat16_3.x = u_xlat16_3.y + u_xlat16_3.x;
					    u_xlat16_6 = vs_TEXCOORD0.x * 0.707106411 + (-u_xlat16_3.y);
					    u_xlat0.z = u_xlat0.x * u_xlat16_6;
					    u_xlat0.x = u_xlat0.x * u_xlat16_3.x;
					    u_xlat0.xy = cos(u_xlat0.xz);
					    u_xlat0.x = u_xlat0.x * 0.25 + 0.5;
					    u_xlat0.x = u_xlat0.y * 0.25 + u_xlat0.x;
					    u_xlat3.xy = vec2(_DotSize) * vec2(0.001953125, -0.001953125) + vs_TEXCOORD0.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat3.xy);
					    u_xlat16_3.x = dot(u_xlat10_1, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat6.xy = (-vec2(_DotSize)) * vec2(0.001953125, 0.001953125) + vs_TEXCOORD0.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat6.xy);
					    u_xlat16_6 = dot(u_xlat10_1, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat16_3.x = u_xlat16_3.x * 4.0 + (-u_xlat16_6);
					    u_xlat16_3.x = u_xlat16_6 * -3.0 + u_xlat16_3.x;
					    u_xlat3.x = u_xlat16_3.x * u_xlat16_3.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb3 = !!(0.0399999991<u_xlat3.x);
					#else
					    u_xlatb3 = 0.0399999991<u_xlat3.x;
					#endif
					    u_xlat3.x = u_xlatb3 ? -1.0 : float(0.0);
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_1 = u_xlat10_1.xyzx + u_xlat10_1.xyzx;
					    u_xlat0 = u_xlat3.xxxx * u_xlat0.xxxx + u_xlat16_1;
					    u_xlat0 = u_xlat0 * vec4(0.5, 0.5, 0.5, 1.39999998);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb1 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat9 = floor(u_xlat0.w);
					    u_xlat9 = u_xlat9 * 0.357142866;
					    u_xlat16_2.xy = vs_TEXCOORD0.xy * vec2(480.0, 480.0);
					    u_xlat16_4 = u_xlat16_2.y + u_xlat16_2.x;
					    u_xlat16_7 = vs_TEXCOORD0.x * 480.0 + (-u_xlat16_2.y);
					    u_xlat7 = u_xlat9 * u_xlat16_7;
					    u_xlat9 = u_xlat9 * u_xlat16_4;
					    u_xlat9 = u_xlat9 * 3.1500001;
					    u_xlat9 = sin(u_xlat9);
					    u_xlat4 = u_xlat7 * 3.1500001;
					    u_xlat4 = sin(u_xlat4);
					    u_xlat9 = (u_xlatb1) ? u_xlat4 : u_xlat9;
					    SV_Target0.xyz = (-vec3(u_xlat9)) * vec3(0.125, 0.125, 0.125) + u_xlat0.xyz;
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
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					bool u_xlatb1;
					mediump vec2 u_xlat16_2;
					vec2 u_xlat3;
					mediump vec2 u_xlat16_3;
					bool u_xlatb3;
					float u_xlat4;
					mediump float u_xlat16_4;
					vec2 u_xlat6;
					mediump float u_xlat16_6;
					float u_xlat7;
					mediump float u_xlat16_7;
					float u_xlat9;
					void main()
					{
					    u_xlat0.x = 2136.28125 / _DotSize;
					    u_xlat0.x = u_xlat0.x * 0.625;
					    u_xlat16_3.xy = vs_TEXCOORD0.xy * vec2(0.707106411, 0.707106411);
					    u_xlat16_3.x = u_xlat16_3.y + u_xlat16_3.x;
					    u_xlat16_6 = vs_TEXCOORD0.x * 0.707106411 + (-u_xlat16_3.y);
					    u_xlat0.z = u_xlat0.x * u_xlat16_6;
					    u_xlat0.x = u_xlat0.x * u_xlat16_3.x;
					    u_xlat0.xy = cos(u_xlat0.xz);
					    u_xlat0.x = u_xlat0.x * 0.25 + 0.5;
					    u_xlat0.x = u_xlat0.y * 0.25 + u_xlat0.x;
					    u_xlat3.xy = vec2(_DotSize) * vec2(0.001953125, -0.001953125) + vs_TEXCOORD0.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat3.xy);
					    u_xlat16_3.x = dot(u_xlat10_1, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat6.xy = (-vec2(_DotSize)) * vec2(0.001953125, 0.001953125) + vs_TEXCOORD0.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat6.xy);
					    u_xlat16_6 = dot(u_xlat10_1, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat16_3.x = u_xlat16_3.x * 4.0 + (-u_xlat16_6);
					    u_xlat16_3.x = u_xlat16_6 * -3.0 + u_xlat16_3.x;
					    u_xlat3.x = u_xlat16_3.x * u_xlat16_3.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb3 = !!(0.0399999991<u_xlat3.x);
					#else
					    u_xlatb3 = 0.0399999991<u_xlat3.x;
					#endif
					    u_xlat3.x = u_xlatb3 ? -1.0 : float(0.0);
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_1 = u_xlat10_1.xyzx + u_xlat10_1.xyzx;
					    u_xlat0 = u_xlat3.xxxx * u_xlat0.xxxx + u_xlat16_1;
					    u_xlat0 = u_xlat0 * vec4(0.5, 0.5, 0.5, 1.39999998);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb1 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat9 = floor(u_xlat0.w);
					    u_xlat9 = u_xlat9 * 0.357142866;
					    u_xlat16_2.xy = vs_TEXCOORD0.xy * vec2(480.0, 480.0);
					    u_xlat16_4 = u_xlat16_2.y + u_xlat16_2.x;
					    u_xlat16_7 = vs_TEXCOORD0.x * 480.0 + (-u_xlat16_2.y);
					    u_xlat7 = u_xlat9 * u_xlat16_7;
					    u_xlat9 = u_xlat9 * u_xlat16_4;
					    u_xlat9 = u_xlat9 * 3.1500001;
					    u_xlat9 = sin(u_xlat9);
					    u_xlat4 = u_xlat7 * 3.1500001;
					    u_xlat4 = sin(u_xlat4);
					    u_xlat9 = (u_xlatb1) ? u_xlat4 : u_xlat9;
					    SV_Target0.xyz = (-vec3(u_xlat9)) * vec3(0.125, 0.125, 0.125) + u_xlat0.xyz;
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