Shader "CameraFilterPack/Antialiasing_FXAA" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			GpuProgramID 38683
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
					  lowp vec4 tmpvar_1;
					  highp float lumaB_2;
					  mediump float rcpDirMin_3;
					  mediump float dirReduce_4;
					  highp vec2 dir_5;
					  mediump float lumaM_6;
					  mediump float lumaSE_7;
					  mediump float lumaSW_8;
					  mediump float lumaNE_9;
					  mediump float lumaNW_10;
					  highp vec2 tmpvar_11;
					  tmpvar_11 = (1.0/(_ScreenResolution.xy));
					  highp vec2 P_12;
					  P_12 = (xlv_TEXCOORD0 - tmpvar_11);
					  highp vec2 P_13;
					  P_13 = (xlv_TEXCOORD0 + (vec2(1.0, -1.0) * tmpvar_11));
					  highp vec2 P_14;
					  P_14 = (xlv_TEXCOORD0 + (vec2(-1.0, 1.0) * tmpvar_11));
					  highp vec2 P_15;
					  P_15 = (xlv_TEXCOORD0 + tmpvar_11);
					  lowp float tmpvar_16;
					  tmpvar_16 = dot (texture2D (_MainTex, P_12).xyz, vec3(0.299, 0.587, 0.114));
					  lumaNW_10 = tmpvar_16;
					  lowp float tmpvar_17;
					  tmpvar_17 = dot (texture2D (_MainTex, P_13).xyz, vec3(0.299, 0.587, 0.114));
					  lumaNE_9 = tmpvar_17;
					  lowp float tmpvar_18;
					  tmpvar_18 = dot (texture2D (_MainTex, P_14).xyz, vec3(0.299, 0.587, 0.114));
					  lumaSW_8 = tmpvar_18;
					  lowp float tmpvar_19;
					  tmpvar_19 = dot (texture2D (_MainTex, P_15).xyz, vec3(0.299, 0.587, 0.114));
					  lumaSE_7 = tmpvar_19;
					  lowp float tmpvar_20;
					  tmpvar_20 = dot (texture2D (_MainTex, xlv_TEXCOORD0).xyz, vec3(0.299, 0.587, 0.114));
					  lumaM_6 = tmpvar_20;
					  mediump float tmpvar_21;
					  tmpvar_21 = min (min (lumaM_6, lumaNW_10), min (min (lumaNE_9, lumaSW_8), lumaSE_7));
					  mediump float tmpvar_22;
					  tmpvar_22 = max (max (lumaM_6, lumaNW_10), max (max (lumaNE_9, lumaSW_8), lumaSE_7));
					  dir_5.x = ((lumaSW_8 + lumaSE_7) - (lumaNW_10 + lumaNE_9));
					  dir_5.y = ((lumaNW_10 + lumaSW_8) - (lumaNE_9 + lumaSE_7));
					  highp float tmpvar_23;
					  mediump float x_24;
					  x_24 = (((lumaNW_10 + lumaNE_9) + (lumaSW_8 + lumaSE_7)) * 0.03125);
					  tmpvar_23 = max (x_24, 0.0078125);
					  dirReduce_4 = tmpvar_23;
					  highp float tmpvar_25;
					  tmpvar_25 = (1.0/((min (
					    abs(dir_5.x)
					  , 
					    abs(dir_5.y)
					  ) + dirReduce_4)));
					  rcpDirMin_3 = tmpvar_25;
					  dir_5 = (min (vec2(8.0, 8.0), max (vec2(-8.0, -8.0), 
					    (dir_5 * rcpDirMin_3)
					  )) * tmpvar_11);
					  highp vec2 P_26;
					  P_26 = (xlv_TEXCOORD0 + (dir_5 * -0.1666667));
					  highp vec2 P_27;
					  P_27 = (xlv_TEXCOORD0 + (dir_5 * 0.1666667));
					  lowp vec3 tmpvar_28;
					  tmpvar_28 = (0.5 * (texture2D (_MainTex, P_26).xyz + texture2D (_MainTex, P_27).xyz));
					  highp vec2 P_29;
					  P_29 = (xlv_TEXCOORD0 + (dir_5 * -0.5));
					  highp vec2 P_30;
					  P_30 = (xlv_TEXCOORD0 + (dir_5 * 0.5));
					  lowp vec3 tmpvar_31;
					  tmpvar_31 = ((tmpvar_28 * 0.5) + (0.25 * (texture2D (_MainTex, P_29).xyz + texture2D (_MainTex, P_30).xyz)));
					  lowp float tmpvar_32;
					  tmpvar_32 = dot (tmpvar_31, vec3(0.299, 0.587, 0.114));
					  lumaB_2 = tmpvar_32;
					  if (((lumaB_2 < tmpvar_21) || (lumaB_2 > tmpvar_22))) {
					    lowp vec4 tmpvar_33;
					    tmpvar_33.w = 1.0;
					    tmpvar_33.xyz = tmpvar_28;
					    tmpvar_1 = tmpvar_33;
					  } else {
					    lowp vec4 tmpvar_34;
					    tmpvar_34.w = 1.0;
					    tmpvar_34.xyz = tmpvar_31;
					    tmpvar_1 = tmpvar_34;
					  };
					  gl_FragData[0] = tmpvar_1;
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
					  lowp vec4 tmpvar_1;
					  highp float lumaB_2;
					  mediump float rcpDirMin_3;
					  mediump float dirReduce_4;
					  highp vec2 dir_5;
					  mediump float lumaM_6;
					  mediump float lumaSE_7;
					  mediump float lumaSW_8;
					  mediump float lumaNE_9;
					  mediump float lumaNW_10;
					  highp vec2 tmpvar_11;
					  tmpvar_11 = (1.0/(_ScreenResolution.xy));
					  highp vec2 P_12;
					  P_12 = (xlv_TEXCOORD0 - tmpvar_11);
					  highp vec2 P_13;
					  P_13 = (xlv_TEXCOORD0 + (vec2(1.0, -1.0) * tmpvar_11));
					  highp vec2 P_14;
					  P_14 = (xlv_TEXCOORD0 + (vec2(-1.0, 1.0) * tmpvar_11));
					  highp vec2 P_15;
					  P_15 = (xlv_TEXCOORD0 + tmpvar_11);
					  lowp float tmpvar_16;
					  tmpvar_16 = dot (texture2D (_MainTex, P_12).xyz, vec3(0.299, 0.587, 0.114));
					  lumaNW_10 = tmpvar_16;
					  lowp float tmpvar_17;
					  tmpvar_17 = dot (texture2D (_MainTex, P_13).xyz, vec3(0.299, 0.587, 0.114));
					  lumaNE_9 = tmpvar_17;
					  lowp float tmpvar_18;
					  tmpvar_18 = dot (texture2D (_MainTex, P_14).xyz, vec3(0.299, 0.587, 0.114));
					  lumaSW_8 = tmpvar_18;
					  lowp float tmpvar_19;
					  tmpvar_19 = dot (texture2D (_MainTex, P_15).xyz, vec3(0.299, 0.587, 0.114));
					  lumaSE_7 = tmpvar_19;
					  lowp float tmpvar_20;
					  tmpvar_20 = dot (texture2D (_MainTex, xlv_TEXCOORD0).xyz, vec3(0.299, 0.587, 0.114));
					  lumaM_6 = tmpvar_20;
					  mediump float tmpvar_21;
					  tmpvar_21 = min (min (lumaM_6, lumaNW_10), min (min (lumaNE_9, lumaSW_8), lumaSE_7));
					  mediump float tmpvar_22;
					  tmpvar_22 = max (max (lumaM_6, lumaNW_10), max (max (lumaNE_9, lumaSW_8), lumaSE_7));
					  dir_5.x = ((lumaSW_8 + lumaSE_7) - (lumaNW_10 + lumaNE_9));
					  dir_5.y = ((lumaNW_10 + lumaSW_8) - (lumaNE_9 + lumaSE_7));
					  highp float tmpvar_23;
					  mediump float x_24;
					  x_24 = (((lumaNW_10 + lumaNE_9) + (lumaSW_8 + lumaSE_7)) * 0.03125);
					  tmpvar_23 = max (x_24, 0.0078125);
					  dirReduce_4 = tmpvar_23;
					  highp float tmpvar_25;
					  tmpvar_25 = (1.0/((min (
					    abs(dir_5.x)
					  , 
					    abs(dir_5.y)
					  ) + dirReduce_4)));
					  rcpDirMin_3 = tmpvar_25;
					  dir_5 = (min (vec2(8.0, 8.0), max (vec2(-8.0, -8.0), 
					    (dir_5 * rcpDirMin_3)
					  )) * tmpvar_11);
					  highp vec2 P_26;
					  P_26 = (xlv_TEXCOORD0 + (dir_5 * -0.1666667));
					  highp vec2 P_27;
					  P_27 = (xlv_TEXCOORD0 + (dir_5 * 0.1666667));
					  lowp vec3 tmpvar_28;
					  tmpvar_28 = (0.5 * (texture2D (_MainTex, P_26).xyz + texture2D (_MainTex, P_27).xyz));
					  highp vec2 P_29;
					  P_29 = (xlv_TEXCOORD0 + (dir_5 * -0.5));
					  highp vec2 P_30;
					  P_30 = (xlv_TEXCOORD0 + (dir_5 * 0.5));
					  lowp vec3 tmpvar_31;
					  tmpvar_31 = ((tmpvar_28 * 0.5) + (0.25 * (texture2D (_MainTex, P_29).xyz + texture2D (_MainTex, P_30).xyz)));
					  lowp float tmpvar_32;
					  tmpvar_32 = dot (tmpvar_31, vec3(0.299, 0.587, 0.114));
					  lumaB_2 = tmpvar_32;
					  if (((lumaB_2 < tmpvar_21) || (lumaB_2 > tmpvar_22))) {
					    lowp vec4 tmpvar_33;
					    tmpvar_33.w = 1.0;
					    tmpvar_33.xyz = tmpvar_28;
					    tmpvar_1 = tmpvar_33;
					  } else {
					    lowp vec4 tmpvar_34;
					    tmpvar_34.w = 1.0;
					    tmpvar_34.xyz = tmpvar_31;
					    tmpvar_1 = tmpvar_34;
					  };
					  gl_FragData[0] = tmpvar_1;
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
					  lowp vec4 tmpvar_1;
					  highp float lumaB_2;
					  mediump float rcpDirMin_3;
					  mediump float dirReduce_4;
					  highp vec2 dir_5;
					  mediump float lumaM_6;
					  mediump float lumaSE_7;
					  mediump float lumaSW_8;
					  mediump float lumaNE_9;
					  mediump float lumaNW_10;
					  highp vec2 tmpvar_11;
					  tmpvar_11 = (1.0/(_ScreenResolution.xy));
					  highp vec2 P_12;
					  P_12 = (xlv_TEXCOORD0 - tmpvar_11);
					  highp vec2 P_13;
					  P_13 = (xlv_TEXCOORD0 + (vec2(1.0, -1.0) * tmpvar_11));
					  highp vec2 P_14;
					  P_14 = (xlv_TEXCOORD0 + (vec2(-1.0, 1.0) * tmpvar_11));
					  highp vec2 P_15;
					  P_15 = (xlv_TEXCOORD0 + tmpvar_11);
					  lowp float tmpvar_16;
					  tmpvar_16 = dot (texture2D (_MainTex, P_12).xyz, vec3(0.299, 0.587, 0.114));
					  lumaNW_10 = tmpvar_16;
					  lowp float tmpvar_17;
					  tmpvar_17 = dot (texture2D (_MainTex, P_13).xyz, vec3(0.299, 0.587, 0.114));
					  lumaNE_9 = tmpvar_17;
					  lowp float tmpvar_18;
					  tmpvar_18 = dot (texture2D (_MainTex, P_14).xyz, vec3(0.299, 0.587, 0.114));
					  lumaSW_8 = tmpvar_18;
					  lowp float tmpvar_19;
					  tmpvar_19 = dot (texture2D (_MainTex, P_15).xyz, vec3(0.299, 0.587, 0.114));
					  lumaSE_7 = tmpvar_19;
					  lowp float tmpvar_20;
					  tmpvar_20 = dot (texture2D (_MainTex, xlv_TEXCOORD0).xyz, vec3(0.299, 0.587, 0.114));
					  lumaM_6 = tmpvar_20;
					  mediump float tmpvar_21;
					  tmpvar_21 = min (min (lumaM_6, lumaNW_10), min (min (lumaNE_9, lumaSW_8), lumaSE_7));
					  mediump float tmpvar_22;
					  tmpvar_22 = max (max (lumaM_6, lumaNW_10), max (max (lumaNE_9, lumaSW_8), lumaSE_7));
					  dir_5.x = ((lumaSW_8 + lumaSE_7) - (lumaNW_10 + lumaNE_9));
					  dir_5.y = ((lumaNW_10 + lumaSW_8) - (lumaNE_9 + lumaSE_7));
					  highp float tmpvar_23;
					  mediump float x_24;
					  x_24 = (((lumaNW_10 + lumaNE_9) + (lumaSW_8 + lumaSE_7)) * 0.03125);
					  tmpvar_23 = max (x_24, 0.0078125);
					  dirReduce_4 = tmpvar_23;
					  highp float tmpvar_25;
					  tmpvar_25 = (1.0/((min (
					    abs(dir_5.x)
					  , 
					    abs(dir_5.y)
					  ) + dirReduce_4)));
					  rcpDirMin_3 = tmpvar_25;
					  dir_5 = (min (vec2(8.0, 8.0), max (vec2(-8.0, -8.0), 
					    (dir_5 * rcpDirMin_3)
					  )) * tmpvar_11);
					  highp vec2 P_26;
					  P_26 = (xlv_TEXCOORD0 + (dir_5 * -0.1666667));
					  highp vec2 P_27;
					  P_27 = (xlv_TEXCOORD0 + (dir_5 * 0.1666667));
					  lowp vec3 tmpvar_28;
					  tmpvar_28 = (0.5 * (texture2D (_MainTex, P_26).xyz + texture2D (_MainTex, P_27).xyz));
					  highp vec2 P_29;
					  P_29 = (xlv_TEXCOORD0 + (dir_5 * -0.5));
					  highp vec2 P_30;
					  P_30 = (xlv_TEXCOORD0 + (dir_5 * 0.5));
					  lowp vec3 tmpvar_31;
					  tmpvar_31 = ((tmpvar_28 * 0.5) + (0.25 * (texture2D (_MainTex, P_29).xyz + texture2D (_MainTex, P_30).xyz)));
					  lowp float tmpvar_32;
					  tmpvar_32 = dot (tmpvar_31, vec3(0.299, 0.587, 0.114));
					  lumaB_2 = tmpvar_32;
					  if (((lumaB_2 < tmpvar_21) || (lumaB_2 > tmpvar_22))) {
					    lowp vec4 tmpvar_33;
					    tmpvar_33.w = 1.0;
					    tmpvar_33.xyz = tmpvar_28;
					    tmpvar_1 = tmpvar_33;
					  } else {
					    lowp vec4 tmpvar_34;
					    tmpvar_34.w = 1.0;
					    tmpvar_34.xyz = tmpvar_31;
					    tmpvar_1 = tmpvar_34;
					  };
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
					layout(location = 0) out lowp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					lowp vec3 u_xlat10_1;
					vec4 u_xlat2;
					mediump vec3 u_xlat16_2;
					lowp vec3 u_xlat10_2;
					lowp vec3 u_xlat10_3;
					vec2 u_xlat4;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					lowp vec4 u_xlat10_6;
					lowp float u_xlat10_7;
					mediump vec2 u_xlat16_8;
					mediump vec2 u_xlat16_9;
					mediump float u_xlat16_12;
					mediump vec2 u_xlat16_18;
					mediump vec2 u_xlat16_28;
					int u_xlati30;
					int u_xlati32;
					mediump float u_xlat16_38;
					void main()
					{
					    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / _ScreenResolution.xyxy;
					    u_xlat1.xy = vec2((-u_xlat0.z) + vs_TEXCOORD0.x, (-u_xlat0.w) + vs_TEXCOORD0.y);
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat2 = u_xlat0.zwzw * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_3.xyz = texture(_MainTex, u_xlat2.xy).xyz;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat2.zw).xyz;
					    u_xlat4.xy = vec2(u_xlat0.z + vs_TEXCOORD0.x, u_xlat0.w + vs_TEXCOORD0.y);
					    u_xlat10_4.xyz = texture(_MainTex, u_xlat4.xy).xyz;
					    u_xlat10_5.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_6.x = dot(u_xlat10_1.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat10_6.y = dot(u_xlat10_3.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat10_6.z = dot(u_xlat10_2.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat10_6.w = dot(u_xlat10_4.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat10_7 = dot(u_xlat10_5.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat16_8.xy = min(u_xlat10_6.yw, u_xlat10_6.xz);
					    u_xlat16_8.x = min(u_xlat16_8.y, u_xlat16_8.x);
					    u_xlat16_8.x = min(u_xlat10_7, u_xlat16_8.x);
					    u_xlat16_18.xy = max(u_xlat10_6.yw, u_xlat10_6.xz);
					    u_xlat16_18.x = max(u_xlat16_18.y, u_xlat16_18.x);
					    u_xlat16_18.x = max(u_xlat10_7, u_xlat16_18.x);
					    u_xlat16_28.xy = vec2(u_xlat10_6.y + u_xlat10_6.x, u_xlat10_6.w + u_xlat10_6.z);
					    u_xlat16_38 = (-u_xlat16_28.y) + u_xlat16_28.x;
					    u_xlat16_1.xz = (-vec2(u_xlat16_38));
					    u_xlat16_9.xy = vec2(u_xlat10_6.z + u_xlat10_6.x, u_xlat10_6.w + u_xlat10_6.y);
					    u_xlat16_1.yw = (-u_xlat16_9.yy) + u_xlat16_9.xx;
					    u_xlat16_28.x = u_xlat10_6.z + u_xlat16_28.x;
					    u_xlat16_28.x = u_xlat10_6.w + u_xlat16_28.x;
					    u_xlat16_28.x = u_xlat16_28.x * 0.03125;
					    u_xlat16_2.x = max(u_xlat16_28.x, 0.0078125);
					    u_xlat16_12 = min(abs(u_xlat16_1.w), abs(u_xlat16_38));
					    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_12;
					    u_xlat16_2.x = float(1.0) / u_xlat16_2.x;
					    u_xlat16_1 = u_xlat16_1 * u_xlat16_2.xxxx;
					    u_xlat16_1 = max(u_xlat16_1, vec4(-8.0, -8.0, -8.0, -8.0));
					    u_xlat16_1 = min(u_xlat16_1, vec4(8.0, 8.0, 8.0, 8.0));
					    u_xlat0 = u_xlat0 * u_xlat16_1;
					    u_xlat1 = u_xlat0.zwzw * vec4(-0.166666672, -0.166666672, 0.166666672, 0.166666672) + vs_TEXCOORD0.xyxy;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat10_3.xyz = texture(_MainTex, u_xlat1.zw).xyz;
					    u_xlat16_2.xyz = u_xlat10_2.xyz + u_xlat10_3.xyz;
					    u_xlat0 = u_xlat0 * vec4(-0.5, -0.5, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
					    u_xlat10_3.xyz = texture(_MainTex, u_xlat0.xy).xyz;
					    u_xlat10_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat10_3.xyz;
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.25, 0.25, 0.25);
					    u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_0.xyz;
					    u_xlat10_6.x = dot(u_xlat16_0.xyz, vec3(0.298999995, 0.587000012, 0.114));
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = u_xlat10_6.x<u_xlat16_8.x; u_xlati30 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
					#else
					    u_xlati30 = int((u_xlat10_6.x<u_xlat16_8.x) ? 0xFFFFFFFFu : uint(0u));
					#endif
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = u_xlat16_18.x<u_xlat10_6.x; u_xlati32 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
					#else
					    u_xlati32 = int((u_xlat16_18.x<u_xlat10_6.x) ? 0xFFFFFFFFu : uint(0u));
					#endif
					    u_xlati30 = int(uint(u_xlati30) | uint(u_xlati32));
					    if(u_xlati30 != 0) {
					        u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
					        SV_Target0.xyz = u_xlat16_2.xyz;
					        SV_Target0.w = 1.0;
					        return;
					    } else {
					        SV_Target0.xyz = u_xlat16_0.xyz;
					        SV_Target0.w = 1.0;
					        return;
					    //ENDIF
					    }
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
					layout(location = 0) out lowp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					lowp vec3 u_xlat10_1;
					vec4 u_xlat2;
					mediump vec3 u_xlat16_2;
					lowp vec3 u_xlat10_2;
					lowp vec3 u_xlat10_3;
					vec2 u_xlat4;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					lowp vec4 u_xlat10_6;
					lowp float u_xlat10_7;
					mediump vec2 u_xlat16_8;
					mediump vec2 u_xlat16_9;
					mediump float u_xlat16_12;
					mediump vec2 u_xlat16_18;
					mediump vec2 u_xlat16_28;
					int u_xlati30;
					int u_xlati32;
					mediump float u_xlat16_38;
					void main()
					{
					    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / _ScreenResolution.xyxy;
					    u_xlat1.xy = vec2((-u_xlat0.z) + vs_TEXCOORD0.x, (-u_xlat0.w) + vs_TEXCOORD0.y);
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat2 = u_xlat0.zwzw * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_3.xyz = texture(_MainTex, u_xlat2.xy).xyz;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat2.zw).xyz;
					    u_xlat4.xy = vec2(u_xlat0.z + vs_TEXCOORD0.x, u_xlat0.w + vs_TEXCOORD0.y);
					    u_xlat10_4.xyz = texture(_MainTex, u_xlat4.xy).xyz;
					    u_xlat10_5.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_6.x = dot(u_xlat10_1.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat10_6.y = dot(u_xlat10_3.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat10_6.z = dot(u_xlat10_2.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat10_6.w = dot(u_xlat10_4.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat10_7 = dot(u_xlat10_5.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat16_8.xy = min(u_xlat10_6.yw, u_xlat10_6.xz);
					    u_xlat16_8.x = min(u_xlat16_8.y, u_xlat16_8.x);
					    u_xlat16_8.x = min(u_xlat10_7, u_xlat16_8.x);
					    u_xlat16_18.xy = max(u_xlat10_6.yw, u_xlat10_6.xz);
					    u_xlat16_18.x = max(u_xlat16_18.y, u_xlat16_18.x);
					    u_xlat16_18.x = max(u_xlat10_7, u_xlat16_18.x);
					    u_xlat16_28.xy = vec2(u_xlat10_6.y + u_xlat10_6.x, u_xlat10_6.w + u_xlat10_6.z);
					    u_xlat16_38 = (-u_xlat16_28.y) + u_xlat16_28.x;
					    u_xlat16_1.xz = (-vec2(u_xlat16_38));
					    u_xlat16_9.xy = vec2(u_xlat10_6.z + u_xlat10_6.x, u_xlat10_6.w + u_xlat10_6.y);
					    u_xlat16_1.yw = (-u_xlat16_9.yy) + u_xlat16_9.xx;
					    u_xlat16_28.x = u_xlat10_6.z + u_xlat16_28.x;
					    u_xlat16_28.x = u_xlat10_6.w + u_xlat16_28.x;
					    u_xlat16_28.x = u_xlat16_28.x * 0.03125;
					    u_xlat16_2.x = max(u_xlat16_28.x, 0.0078125);
					    u_xlat16_12 = min(abs(u_xlat16_1.w), abs(u_xlat16_38));
					    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_12;
					    u_xlat16_2.x = float(1.0) / u_xlat16_2.x;
					    u_xlat16_1 = u_xlat16_1 * u_xlat16_2.xxxx;
					    u_xlat16_1 = max(u_xlat16_1, vec4(-8.0, -8.0, -8.0, -8.0));
					    u_xlat16_1 = min(u_xlat16_1, vec4(8.0, 8.0, 8.0, 8.0));
					    u_xlat0 = u_xlat0 * u_xlat16_1;
					    u_xlat1 = u_xlat0.zwzw * vec4(-0.166666672, -0.166666672, 0.166666672, 0.166666672) + vs_TEXCOORD0.xyxy;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat10_3.xyz = texture(_MainTex, u_xlat1.zw).xyz;
					    u_xlat16_2.xyz = u_xlat10_2.xyz + u_xlat10_3.xyz;
					    u_xlat0 = u_xlat0 * vec4(-0.5, -0.5, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
					    u_xlat10_3.xyz = texture(_MainTex, u_xlat0.xy).xyz;
					    u_xlat10_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat10_3.xyz;
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.25, 0.25, 0.25);
					    u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_0.xyz;
					    u_xlat10_6.x = dot(u_xlat16_0.xyz, vec3(0.298999995, 0.587000012, 0.114));
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = u_xlat10_6.x<u_xlat16_8.x; u_xlati30 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
					#else
					    u_xlati30 = int((u_xlat10_6.x<u_xlat16_8.x) ? 0xFFFFFFFFu : uint(0u));
					#endif
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = u_xlat16_18.x<u_xlat10_6.x; u_xlati32 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
					#else
					    u_xlati32 = int((u_xlat16_18.x<u_xlat10_6.x) ? 0xFFFFFFFFu : uint(0u));
					#endif
					    u_xlati30 = int(uint(u_xlati30) | uint(u_xlati32));
					    if(u_xlati30 != 0) {
					        u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
					        SV_Target0.xyz = u_xlat16_2.xyz;
					        SV_Target0.w = 1.0;
					        return;
					    } else {
					        SV_Target0.xyz = u_xlat16_0.xyz;
					        SV_Target0.w = 1.0;
					        return;
					    //ENDIF
					    }
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
					layout(location = 0) out lowp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					lowp vec3 u_xlat10_1;
					vec4 u_xlat2;
					mediump vec3 u_xlat16_2;
					lowp vec3 u_xlat10_2;
					lowp vec3 u_xlat10_3;
					vec2 u_xlat4;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					lowp vec4 u_xlat10_6;
					lowp float u_xlat10_7;
					mediump vec2 u_xlat16_8;
					mediump vec2 u_xlat16_9;
					mediump float u_xlat16_12;
					mediump vec2 u_xlat16_18;
					mediump vec2 u_xlat16_28;
					int u_xlati30;
					int u_xlati32;
					mediump float u_xlat16_38;
					void main()
					{
					    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / _ScreenResolution.xyxy;
					    u_xlat1.xy = vec2((-u_xlat0.z) + vs_TEXCOORD0.x, (-u_xlat0.w) + vs_TEXCOORD0.y);
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat2 = u_xlat0.zwzw * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_3.xyz = texture(_MainTex, u_xlat2.xy).xyz;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat2.zw).xyz;
					    u_xlat4.xy = vec2(u_xlat0.z + vs_TEXCOORD0.x, u_xlat0.w + vs_TEXCOORD0.y);
					    u_xlat10_4.xyz = texture(_MainTex, u_xlat4.xy).xyz;
					    u_xlat10_5.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_6.x = dot(u_xlat10_1.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat10_6.y = dot(u_xlat10_3.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat10_6.z = dot(u_xlat10_2.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat10_6.w = dot(u_xlat10_4.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat10_7 = dot(u_xlat10_5.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat16_8.xy = min(u_xlat10_6.yw, u_xlat10_6.xz);
					    u_xlat16_8.x = min(u_xlat16_8.y, u_xlat16_8.x);
					    u_xlat16_8.x = min(u_xlat10_7, u_xlat16_8.x);
					    u_xlat16_18.xy = max(u_xlat10_6.yw, u_xlat10_6.xz);
					    u_xlat16_18.x = max(u_xlat16_18.y, u_xlat16_18.x);
					    u_xlat16_18.x = max(u_xlat10_7, u_xlat16_18.x);
					    u_xlat16_28.xy = vec2(u_xlat10_6.y + u_xlat10_6.x, u_xlat10_6.w + u_xlat10_6.z);
					    u_xlat16_38 = (-u_xlat16_28.y) + u_xlat16_28.x;
					    u_xlat16_1.xz = (-vec2(u_xlat16_38));
					    u_xlat16_9.xy = vec2(u_xlat10_6.z + u_xlat10_6.x, u_xlat10_6.w + u_xlat10_6.y);
					    u_xlat16_1.yw = (-u_xlat16_9.yy) + u_xlat16_9.xx;
					    u_xlat16_28.x = u_xlat10_6.z + u_xlat16_28.x;
					    u_xlat16_28.x = u_xlat10_6.w + u_xlat16_28.x;
					    u_xlat16_28.x = u_xlat16_28.x * 0.03125;
					    u_xlat16_2.x = max(u_xlat16_28.x, 0.0078125);
					    u_xlat16_12 = min(abs(u_xlat16_1.w), abs(u_xlat16_38));
					    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_12;
					    u_xlat16_2.x = float(1.0) / u_xlat16_2.x;
					    u_xlat16_1 = u_xlat16_1 * u_xlat16_2.xxxx;
					    u_xlat16_1 = max(u_xlat16_1, vec4(-8.0, -8.0, -8.0, -8.0));
					    u_xlat16_1 = min(u_xlat16_1, vec4(8.0, 8.0, 8.0, 8.0));
					    u_xlat0 = u_xlat0 * u_xlat16_1;
					    u_xlat1 = u_xlat0.zwzw * vec4(-0.166666672, -0.166666672, 0.166666672, 0.166666672) + vs_TEXCOORD0.xyxy;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat10_3.xyz = texture(_MainTex, u_xlat1.zw).xyz;
					    u_xlat16_2.xyz = u_xlat10_2.xyz + u_xlat10_3.xyz;
					    u_xlat0 = u_xlat0 * vec4(-0.5, -0.5, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
					    u_xlat10_3.xyz = texture(_MainTex, u_xlat0.xy).xyz;
					    u_xlat10_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat10_3.xyz;
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.25, 0.25, 0.25);
					    u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_0.xyz;
					    u_xlat10_6.x = dot(u_xlat16_0.xyz, vec3(0.298999995, 0.587000012, 0.114));
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = u_xlat10_6.x<u_xlat16_8.x; u_xlati30 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
					#else
					    u_xlati30 = int((u_xlat10_6.x<u_xlat16_8.x) ? 0xFFFFFFFFu : uint(0u));
					#endif
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = u_xlat16_18.x<u_xlat10_6.x; u_xlati32 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
					#else
					    u_xlati32 = int((u_xlat16_18.x<u_xlat10_6.x) ? 0xFFFFFFFFu : uint(0u));
					#endif
					    u_xlati30 = int(uint(u_xlati30) | uint(u_xlati32));
					    if(u_xlati30 != 0) {
					        u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
					        SV_Target0.xyz = u_xlat16_2.xyz;
					        SV_Target0.w = 1.0;
					        return;
					    } else {
					        SV_Target0.xyz = u_xlat16_0.xyz;
					        SV_Target0.w = 1.0;
					        return;
					    //ENDIF
					    }
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