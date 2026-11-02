Shader "CameraFilterPack/Pixelisation_OilPaint" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_Value ("_Value", Range(0, 5)) = 1
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 31889
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
					uniform highp float _Value;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp float sigma2_1;
					  highp float min_sigma2_2;
					  highp vec4 ccolor_3;
					  highp vec3 c_4;
					  highp vec3 s2_5;
					  highp vec3 s0_6;
					  highp vec3 m2_7;
					  highp vec3 m0_8;
					  highp vec2 uv_9;
					  highp vec2 tmpvar_10;
					  tmpvar_10 = (vec2(_Value) / _ScreenResolution.xy);
					  uv_9 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_11;
					  highp vec2 P_12;
					  P_12 = (uv_9 + (vec2(-4.0, -4.0) * tmpvar_10));
					  tmpvar_11 = texture2D (_MainTex, P_12);
					  c_4 = tmpvar_11.xyz;
					  m0_8 = c_4;
					  s0_6 = (c_4 * c_4);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_MainTex, uv_9);
					  c_4 = tmpvar_13.xyz;
					  m2_7 = c_4;
					  s2_5 = (c_4 * c_4);
					  lowp vec4 tmpvar_14;
					  highp vec2 P_15;
					  P_15 = (uv_9 + (vec2(-3.0, -3.0) * tmpvar_10));
					  tmpvar_14 = texture2D (_MainTex, P_15);
					  c_4 = tmpvar_14.xyz;
					  m0_8 = (m0_8 + c_4);
					  s0_6 = (s0_6 + (c_4 * c_4));
					  lowp vec4 tmpvar_16;
					  highp vec2 P_17;
					  P_17 = (uv_9 + (vec2(1.0, 0.0) * tmpvar_10));
					  tmpvar_16 = texture2D (_MainTex, P_17);
					  c_4 = tmpvar_16.xyz;
					  m2_7 = (m2_7 + c_4);
					  s2_5 = (s2_5 + (c_4 * c_4));
					  lowp vec4 tmpvar_18;
					  highp vec2 P_19;
					  P_19 = (uv_9 + (vec2(-2.0, -2.0) * tmpvar_10));
					  tmpvar_18 = texture2D (_MainTex, P_19);
					  c_4 = tmpvar_18.xyz;
					  m0_8 = (m0_8 + c_4);
					  s0_6 = (s0_6 + (c_4 * c_4));
					  lowp vec4 tmpvar_20;
					  highp vec2 P_21;
					  P_21 = (uv_9 + (vec2(2.0, 0.0) * tmpvar_10));
					  tmpvar_20 = texture2D (_MainTex, P_21);
					  c_4 = tmpvar_20.xyz;
					  m2_7 = (m2_7 + c_4);
					  s2_5 = (s2_5 + (c_4 * c_4));
					  lowp vec4 tmpvar_22;
					  highp vec2 P_23;
					  P_23 = (uv_9 + (vec2(-4.0, -3.0) * tmpvar_10));
					  tmpvar_22 = texture2D (_MainTex, P_23);
					  c_4 = tmpvar_22.xyz;
					  m0_8 = (m0_8 + c_4);
					  s0_6 = (s0_6 + (c_4 * c_4));
					  lowp vec4 tmpvar_24;
					  highp vec2 P_25;
					  P_25 = (uv_9 + (vec2(0.0, 1.0) * tmpvar_10));
					  tmpvar_24 = texture2D (_MainTex, P_25);
					  c_4 = tmpvar_24.xyz;
					  m2_7 = (m2_7 + c_4);
					  s2_5 = (s2_5 + (c_4 * c_4));
					  lowp vec4 tmpvar_26;
					  highp vec2 P_27;
					  P_27 = (uv_9 + (vec2(-3.0, -3.0) * tmpvar_10));
					  tmpvar_26 = texture2D (_MainTex, P_27);
					  c_4 = tmpvar_26.xyz;
					  m0_8 = (m0_8 + c_4);
					  s0_6 = (s0_6 + (c_4 * c_4));
					  lowp vec4 tmpvar_28;
					  highp vec2 P_29;
					  P_29 = (uv_9 + tmpvar_10);
					  tmpvar_28 = texture2D (_MainTex, P_29);
					  c_4 = tmpvar_28.xyz;
					  m2_7 = (m2_7 + c_4);
					  s2_5 = (s2_5 + (c_4 * c_4));
					  lowp vec4 tmpvar_30;
					  highp vec2 P_31;
					  P_31 = (uv_9 + (vec2(-2.0, -3.0) * tmpvar_10));
					  tmpvar_30 = texture2D (_MainTex, P_31);
					  c_4 = tmpvar_30.xyz;
					  m0_8 = (m0_8 + c_4);
					  s0_6 = (s0_6 + (c_4 * c_4));
					  lowp vec4 tmpvar_32;
					  highp vec2 P_33;
					  P_33 = (uv_9 + (vec2(2.0, 1.0) * tmpvar_10));
					  tmpvar_32 = texture2D (_MainTex, P_33);
					  c_4 = tmpvar_32.xyz;
					  m2_7 = (m2_7 + c_4);
					  s2_5 = (s2_5 + (c_4 * c_4));
					  lowp vec4 tmpvar_34;
					  highp vec2 P_35;
					  P_35 = (uv_9 + (vec2(-4.0, -2.0) * tmpvar_10));
					  tmpvar_34 = texture2D (_MainTex, P_35);
					  c_4 = tmpvar_34.xyz;
					  m0_8 = (m0_8 + c_4);
					  s0_6 = (s0_6 + (c_4 * c_4));
					  lowp vec4 tmpvar_36;
					  highp vec2 P_37;
					  P_37 = (uv_9 + (vec2(0.0, 2.0) * tmpvar_10));
					  tmpvar_36 = texture2D (_MainTex, P_37);
					  c_4 = tmpvar_36.xyz;
					  m2_7 = (m2_7 + c_4);
					  s2_5 = (s2_5 + (c_4 * c_4));
					  lowp vec4 tmpvar_38;
					  highp vec2 P_39;
					  P_39 = (uv_9 + (vec2(-3.0, -2.0) * tmpvar_10));
					  tmpvar_38 = texture2D (_MainTex, P_39);
					  c_4 = tmpvar_38.xyz;
					  m0_8 = (m0_8 + c_4);
					  s0_6 = (s0_6 + (c_4 * c_4));
					  lowp vec4 tmpvar_40;
					  highp vec2 P_41;
					  P_41 = (uv_9 + (vec2(1.0, 2.0) * tmpvar_10));
					  tmpvar_40 = texture2D (_MainTex, P_41);
					  c_4 = tmpvar_40.xyz;
					  m2_7 = (m2_7 + c_4);
					  s2_5 = (s2_5 + (c_4 * c_4));
					  lowp vec4 tmpvar_42;
					  highp vec2 P_43;
					  P_43 = (uv_9 + (vec2(-2.0, -3.0) * tmpvar_10));
					  tmpvar_42 = texture2D (_MainTex, P_43);
					  c_4 = tmpvar_42.xyz;
					  m0_8 = (m0_8 + c_4);
					  s0_6 = (s0_6 + (c_4 * c_4));
					  lowp vec4 tmpvar_44;
					  highp vec2 P_45;
					  P_45 = (uv_9 + (vec2(2.0, 2.0) * tmpvar_10));
					  tmpvar_44 = texture2D (_MainTex, P_45);
					  c_4 = tmpvar_44.xyz;
					  m2_7 = (m2_7 + c_4);
					  s2_5 = (s2_5 + (c_4 * c_4));
					  ccolor_3 = vec4(0.0, 0.0, 0.0, 0.0);
					  min_sigma2_2 = 100.0;
					  m0_8 = (m0_8 / 9.0);
					  highp vec3 tmpvar_46;
					  tmpvar_46 = abs(((s0_6 / 9.0) - (m0_8 * m0_8)));
					  s0_6 = tmpvar_46;
					  highp float tmpvar_47;
					  tmpvar_47 = ((tmpvar_46.x + tmpvar_46.y) + tmpvar_46.z);
					  sigma2_1 = tmpvar_47;
					  if ((tmpvar_47 < 100.0)) {
					    min_sigma2_2 = tmpvar_47;
					    highp vec4 tmpvar_48;
					    tmpvar_48.w = 1.0;
					    tmpvar_48.xyz = m0_8;
					    ccolor_3 = tmpvar_48;
					  };
					  m2_7 = (m2_7 / 9.0);
					  highp vec3 tmpvar_49;
					  tmpvar_49 = abs(((s2_5 / 9.0) - (m2_7 * m2_7)));
					  s2_5 = tmpvar_49;
					  sigma2_1 = ((tmpvar_49.x + tmpvar_49.y) + tmpvar_49.z);
					  if ((sigma2_1 < min_sigma2_2)) {
					    min_sigma2_2 = sigma2_1;
					    highp vec4 tmpvar_50;
					    tmpvar_50.w = 1.0;
					    tmpvar_50.xyz = m2_7;
					    ccolor_3 = tmpvar_50;
					  };
					  gl_FragData[0] = ccolor_3;
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
					uniform highp float _Value;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp float sigma2_1;
					  highp float min_sigma2_2;
					  highp vec4 ccolor_3;
					  highp vec3 c_4;
					  highp vec3 s2_5;
					  highp vec3 s0_6;
					  highp vec3 m2_7;
					  highp vec3 m0_8;
					  highp vec2 uv_9;
					  highp vec2 tmpvar_10;
					  tmpvar_10 = (vec2(_Value) / _ScreenResolution.xy);
					  uv_9 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_11;
					  highp vec2 P_12;
					  P_12 = (uv_9 + (vec2(-4.0, -4.0) * tmpvar_10));
					  tmpvar_11 = texture2D (_MainTex, P_12);
					  c_4 = tmpvar_11.xyz;
					  m0_8 = c_4;
					  s0_6 = (c_4 * c_4);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_MainTex, uv_9);
					  c_4 = tmpvar_13.xyz;
					  m2_7 = c_4;
					  s2_5 = (c_4 * c_4);
					  lowp vec4 tmpvar_14;
					  highp vec2 P_15;
					  P_15 = (uv_9 + (vec2(-3.0, -3.0) * tmpvar_10));
					  tmpvar_14 = texture2D (_MainTex, P_15);
					  c_4 = tmpvar_14.xyz;
					  m0_8 = (m0_8 + c_4);
					  s0_6 = (s0_6 + (c_4 * c_4));
					  lowp vec4 tmpvar_16;
					  highp vec2 P_17;
					  P_17 = (uv_9 + (vec2(1.0, 0.0) * tmpvar_10));
					  tmpvar_16 = texture2D (_MainTex, P_17);
					  c_4 = tmpvar_16.xyz;
					  m2_7 = (m2_7 + c_4);
					  s2_5 = (s2_5 + (c_4 * c_4));
					  lowp vec4 tmpvar_18;
					  highp vec2 P_19;
					  P_19 = (uv_9 + (vec2(-2.0, -2.0) * tmpvar_10));
					  tmpvar_18 = texture2D (_MainTex, P_19);
					  c_4 = tmpvar_18.xyz;
					  m0_8 = (m0_8 + c_4);
					  s0_6 = (s0_6 + (c_4 * c_4));
					  lowp vec4 tmpvar_20;
					  highp vec2 P_21;
					  P_21 = (uv_9 + (vec2(2.0, 0.0) * tmpvar_10));
					  tmpvar_20 = texture2D (_MainTex, P_21);
					  c_4 = tmpvar_20.xyz;
					  m2_7 = (m2_7 + c_4);
					  s2_5 = (s2_5 + (c_4 * c_4));
					  lowp vec4 tmpvar_22;
					  highp vec2 P_23;
					  P_23 = (uv_9 + (vec2(-4.0, -3.0) * tmpvar_10));
					  tmpvar_22 = texture2D (_MainTex, P_23);
					  c_4 = tmpvar_22.xyz;
					  m0_8 = (m0_8 + c_4);
					  s0_6 = (s0_6 + (c_4 * c_4));
					  lowp vec4 tmpvar_24;
					  highp vec2 P_25;
					  P_25 = (uv_9 + (vec2(0.0, 1.0) * tmpvar_10));
					  tmpvar_24 = texture2D (_MainTex, P_25);
					  c_4 = tmpvar_24.xyz;
					  m2_7 = (m2_7 + c_4);
					  s2_5 = (s2_5 + (c_4 * c_4));
					  lowp vec4 tmpvar_26;
					  highp vec2 P_27;
					  P_27 = (uv_9 + (vec2(-3.0, -3.0) * tmpvar_10));
					  tmpvar_26 = texture2D (_MainTex, P_27);
					  c_4 = tmpvar_26.xyz;
					  m0_8 = (m0_8 + c_4);
					  s0_6 = (s0_6 + (c_4 * c_4));
					  lowp vec4 tmpvar_28;
					  highp vec2 P_29;
					  P_29 = (uv_9 + tmpvar_10);
					  tmpvar_28 = texture2D (_MainTex, P_29);
					  c_4 = tmpvar_28.xyz;
					  m2_7 = (m2_7 + c_4);
					  s2_5 = (s2_5 + (c_4 * c_4));
					  lowp vec4 tmpvar_30;
					  highp vec2 P_31;
					  P_31 = (uv_9 + (vec2(-2.0, -3.0) * tmpvar_10));
					  tmpvar_30 = texture2D (_MainTex, P_31);
					  c_4 = tmpvar_30.xyz;
					  m0_8 = (m0_8 + c_4);
					  s0_6 = (s0_6 + (c_4 * c_4));
					  lowp vec4 tmpvar_32;
					  highp vec2 P_33;
					  P_33 = (uv_9 + (vec2(2.0, 1.0) * tmpvar_10));
					  tmpvar_32 = texture2D (_MainTex, P_33);
					  c_4 = tmpvar_32.xyz;
					  m2_7 = (m2_7 + c_4);
					  s2_5 = (s2_5 + (c_4 * c_4));
					  lowp vec4 tmpvar_34;
					  highp vec2 P_35;
					  P_35 = (uv_9 + (vec2(-4.0, -2.0) * tmpvar_10));
					  tmpvar_34 = texture2D (_MainTex, P_35);
					  c_4 = tmpvar_34.xyz;
					  m0_8 = (m0_8 + c_4);
					  s0_6 = (s0_6 + (c_4 * c_4));
					  lowp vec4 tmpvar_36;
					  highp vec2 P_37;
					  P_37 = (uv_9 + (vec2(0.0, 2.0) * tmpvar_10));
					  tmpvar_36 = texture2D (_MainTex, P_37);
					  c_4 = tmpvar_36.xyz;
					  m2_7 = (m2_7 + c_4);
					  s2_5 = (s2_5 + (c_4 * c_4));
					  lowp vec4 tmpvar_38;
					  highp vec2 P_39;
					  P_39 = (uv_9 + (vec2(-3.0, -2.0) * tmpvar_10));
					  tmpvar_38 = texture2D (_MainTex, P_39);
					  c_4 = tmpvar_38.xyz;
					  m0_8 = (m0_8 + c_4);
					  s0_6 = (s0_6 + (c_4 * c_4));
					  lowp vec4 tmpvar_40;
					  highp vec2 P_41;
					  P_41 = (uv_9 + (vec2(1.0, 2.0) * tmpvar_10));
					  tmpvar_40 = texture2D (_MainTex, P_41);
					  c_4 = tmpvar_40.xyz;
					  m2_7 = (m2_7 + c_4);
					  s2_5 = (s2_5 + (c_4 * c_4));
					  lowp vec4 tmpvar_42;
					  highp vec2 P_43;
					  P_43 = (uv_9 + (vec2(-2.0, -3.0) * tmpvar_10));
					  tmpvar_42 = texture2D (_MainTex, P_43);
					  c_4 = tmpvar_42.xyz;
					  m0_8 = (m0_8 + c_4);
					  s0_6 = (s0_6 + (c_4 * c_4));
					  lowp vec4 tmpvar_44;
					  highp vec2 P_45;
					  P_45 = (uv_9 + (vec2(2.0, 2.0) * tmpvar_10));
					  tmpvar_44 = texture2D (_MainTex, P_45);
					  c_4 = tmpvar_44.xyz;
					  m2_7 = (m2_7 + c_4);
					  s2_5 = (s2_5 + (c_4 * c_4));
					  ccolor_3 = vec4(0.0, 0.0, 0.0, 0.0);
					  min_sigma2_2 = 100.0;
					  m0_8 = (m0_8 / 9.0);
					  highp vec3 tmpvar_46;
					  tmpvar_46 = abs(((s0_6 / 9.0) - (m0_8 * m0_8)));
					  s0_6 = tmpvar_46;
					  highp float tmpvar_47;
					  tmpvar_47 = ((tmpvar_46.x + tmpvar_46.y) + tmpvar_46.z);
					  sigma2_1 = tmpvar_47;
					  if ((tmpvar_47 < 100.0)) {
					    min_sigma2_2 = tmpvar_47;
					    highp vec4 tmpvar_48;
					    tmpvar_48.w = 1.0;
					    tmpvar_48.xyz = m0_8;
					    ccolor_3 = tmpvar_48;
					  };
					  m2_7 = (m2_7 / 9.0);
					  highp vec3 tmpvar_49;
					  tmpvar_49 = abs(((s2_5 / 9.0) - (m2_7 * m2_7)));
					  s2_5 = tmpvar_49;
					  sigma2_1 = ((tmpvar_49.x + tmpvar_49.y) + tmpvar_49.z);
					  if ((sigma2_1 < min_sigma2_2)) {
					    min_sigma2_2 = sigma2_1;
					    highp vec4 tmpvar_50;
					    tmpvar_50.w = 1.0;
					    tmpvar_50.xyz = m2_7;
					    ccolor_3 = tmpvar_50;
					  };
					  gl_FragData[0] = ccolor_3;
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
					uniform highp float _Value;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp float sigma2_1;
					  highp float min_sigma2_2;
					  highp vec4 ccolor_3;
					  highp vec3 c_4;
					  highp vec3 s2_5;
					  highp vec3 s0_6;
					  highp vec3 m2_7;
					  highp vec3 m0_8;
					  highp vec2 uv_9;
					  highp vec2 tmpvar_10;
					  tmpvar_10 = (vec2(_Value) / _ScreenResolution.xy);
					  uv_9 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_11;
					  highp vec2 P_12;
					  P_12 = (uv_9 + (vec2(-4.0, -4.0) * tmpvar_10));
					  tmpvar_11 = texture2D (_MainTex, P_12);
					  c_4 = tmpvar_11.xyz;
					  m0_8 = c_4;
					  s0_6 = (c_4 * c_4);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_MainTex, uv_9);
					  c_4 = tmpvar_13.xyz;
					  m2_7 = c_4;
					  s2_5 = (c_4 * c_4);
					  lowp vec4 tmpvar_14;
					  highp vec2 P_15;
					  P_15 = (uv_9 + (vec2(-3.0, -3.0) * tmpvar_10));
					  tmpvar_14 = texture2D (_MainTex, P_15);
					  c_4 = tmpvar_14.xyz;
					  m0_8 = (m0_8 + c_4);
					  s0_6 = (s0_6 + (c_4 * c_4));
					  lowp vec4 tmpvar_16;
					  highp vec2 P_17;
					  P_17 = (uv_9 + (vec2(1.0, 0.0) * tmpvar_10));
					  tmpvar_16 = texture2D (_MainTex, P_17);
					  c_4 = tmpvar_16.xyz;
					  m2_7 = (m2_7 + c_4);
					  s2_5 = (s2_5 + (c_4 * c_4));
					  lowp vec4 tmpvar_18;
					  highp vec2 P_19;
					  P_19 = (uv_9 + (vec2(-2.0, -2.0) * tmpvar_10));
					  tmpvar_18 = texture2D (_MainTex, P_19);
					  c_4 = tmpvar_18.xyz;
					  m0_8 = (m0_8 + c_4);
					  s0_6 = (s0_6 + (c_4 * c_4));
					  lowp vec4 tmpvar_20;
					  highp vec2 P_21;
					  P_21 = (uv_9 + (vec2(2.0, 0.0) * tmpvar_10));
					  tmpvar_20 = texture2D (_MainTex, P_21);
					  c_4 = tmpvar_20.xyz;
					  m2_7 = (m2_7 + c_4);
					  s2_5 = (s2_5 + (c_4 * c_4));
					  lowp vec4 tmpvar_22;
					  highp vec2 P_23;
					  P_23 = (uv_9 + (vec2(-4.0, -3.0) * tmpvar_10));
					  tmpvar_22 = texture2D (_MainTex, P_23);
					  c_4 = tmpvar_22.xyz;
					  m0_8 = (m0_8 + c_4);
					  s0_6 = (s0_6 + (c_4 * c_4));
					  lowp vec4 tmpvar_24;
					  highp vec2 P_25;
					  P_25 = (uv_9 + (vec2(0.0, 1.0) * tmpvar_10));
					  tmpvar_24 = texture2D (_MainTex, P_25);
					  c_4 = tmpvar_24.xyz;
					  m2_7 = (m2_7 + c_4);
					  s2_5 = (s2_5 + (c_4 * c_4));
					  lowp vec4 tmpvar_26;
					  highp vec2 P_27;
					  P_27 = (uv_9 + (vec2(-3.0, -3.0) * tmpvar_10));
					  tmpvar_26 = texture2D (_MainTex, P_27);
					  c_4 = tmpvar_26.xyz;
					  m0_8 = (m0_8 + c_4);
					  s0_6 = (s0_6 + (c_4 * c_4));
					  lowp vec4 tmpvar_28;
					  highp vec2 P_29;
					  P_29 = (uv_9 + tmpvar_10);
					  tmpvar_28 = texture2D (_MainTex, P_29);
					  c_4 = tmpvar_28.xyz;
					  m2_7 = (m2_7 + c_4);
					  s2_5 = (s2_5 + (c_4 * c_4));
					  lowp vec4 tmpvar_30;
					  highp vec2 P_31;
					  P_31 = (uv_9 + (vec2(-2.0, -3.0) * tmpvar_10));
					  tmpvar_30 = texture2D (_MainTex, P_31);
					  c_4 = tmpvar_30.xyz;
					  m0_8 = (m0_8 + c_4);
					  s0_6 = (s0_6 + (c_4 * c_4));
					  lowp vec4 tmpvar_32;
					  highp vec2 P_33;
					  P_33 = (uv_9 + (vec2(2.0, 1.0) * tmpvar_10));
					  tmpvar_32 = texture2D (_MainTex, P_33);
					  c_4 = tmpvar_32.xyz;
					  m2_7 = (m2_7 + c_4);
					  s2_5 = (s2_5 + (c_4 * c_4));
					  lowp vec4 tmpvar_34;
					  highp vec2 P_35;
					  P_35 = (uv_9 + (vec2(-4.0, -2.0) * tmpvar_10));
					  tmpvar_34 = texture2D (_MainTex, P_35);
					  c_4 = tmpvar_34.xyz;
					  m0_8 = (m0_8 + c_4);
					  s0_6 = (s0_6 + (c_4 * c_4));
					  lowp vec4 tmpvar_36;
					  highp vec2 P_37;
					  P_37 = (uv_9 + (vec2(0.0, 2.0) * tmpvar_10));
					  tmpvar_36 = texture2D (_MainTex, P_37);
					  c_4 = tmpvar_36.xyz;
					  m2_7 = (m2_7 + c_4);
					  s2_5 = (s2_5 + (c_4 * c_4));
					  lowp vec4 tmpvar_38;
					  highp vec2 P_39;
					  P_39 = (uv_9 + (vec2(-3.0, -2.0) * tmpvar_10));
					  tmpvar_38 = texture2D (_MainTex, P_39);
					  c_4 = tmpvar_38.xyz;
					  m0_8 = (m0_8 + c_4);
					  s0_6 = (s0_6 + (c_4 * c_4));
					  lowp vec4 tmpvar_40;
					  highp vec2 P_41;
					  P_41 = (uv_9 + (vec2(1.0, 2.0) * tmpvar_10));
					  tmpvar_40 = texture2D (_MainTex, P_41);
					  c_4 = tmpvar_40.xyz;
					  m2_7 = (m2_7 + c_4);
					  s2_5 = (s2_5 + (c_4 * c_4));
					  lowp vec4 tmpvar_42;
					  highp vec2 P_43;
					  P_43 = (uv_9 + (vec2(-2.0, -3.0) * tmpvar_10));
					  tmpvar_42 = texture2D (_MainTex, P_43);
					  c_4 = tmpvar_42.xyz;
					  m0_8 = (m0_8 + c_4);
					  s0_6 = (s0_6 + (c_4 * c_4));
					  lowp vec4 tmpvar_44;
					  highp vec2 P_45;
					  P_45 = (uv_9 + (vec2(2.0, 2.0) * tmpvar_10));
					  tmpvar_44 = texture2D (_MainTex, P_45);
					  c_4 = tmpvar_44.xyz;
					  m2_7 = (m2_7 + c_4);
					  s2_5 = (s2_5 + (c_4 * c_4));
					  ccolor_3 = vec4(0.0, 0.0, 0.0, 0.0);
					  min_sigma2_2 = 100.0;
					  m0_8 = (m0_8 / 9.0);
					  highp vec3 tmpvar_46;
					  tmpvar_46 = abs(((s0_6 / 9.0) - (m0_8 * m0_8)));
					  s0_6 = tmpvar_46;
					  highp float tmpvar_47;
					  tmpvar_47 = ((tmpvar_46.x + tmpvar_46.y) + tmpvar_46.z);
					  sigma2_1 = tmpvar_47;
					  if ((tmpvar_47 < 100.0)) {
					    min_sigma2_2 = tmpvar_47;
					    highp vec4 tmpvar_48;
					    tmpvar_48.w = 1.0;
					    tmpvar_48.xyz = m0_8;
					    ccolor_3 = tmpvar_48;
					  };
					  m2_7 = (m2_7 / 9.0);
					  highp vec3 tmpvar_49;
					  tmpvar_49 = abs(((s2_5 / 9.0) - (m2_7 * m2_7)));
					  s2_5 = tmpvar_49;
					  sigma2_1 = ((tmpvar_49.x + tmpvar_49.y) + tmpvar_49.z);
					  if ((sigma2_1 < min_sigma2_2)) {
					    min_sigma2_2 = sigma2_1;
					    highp vec4 tmpvar_50;
					    tmpvar_50.w = 1.0;
					    tmpvar_50.xyz = m2_7;
					    ccolor_3 = tmpvar_50;
					  };
					  gl_FragData[0] = ccolor_3;
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
					uniform 	float _Value;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_1;
					lowp vec3 u_xlat10_1;
					vec4 u_xlat2;
					mediump vec3 u_xlat16_2;
					lowp vec3 u_xlat10_2;
					vec4 u_xlat3;
					mediump vec3 u_xlat16_3;
					lowp vec3 u_xlat10_3;
					vec4 u_xlat4;
					mediump vec3 u_xlat16_4;
					lowp vec3 u_xlat10_4;
					vec4 u_xlat5;
					lowp vec3 u_xlat10_5;
					vec4 u_xlat6;
					lowp vec3 u_xlat10_6;
					vec4 u_xlat7;
					lowp vec3 u_xlat10_7;
					vec4 u_xlat8;
					mediump vec3 u_xlat16_8;
					lowp vec3 u_xlat10_8;
					vec3 u_xlat9;
					mediump vec3 u_xlat16_9;
					lowp vec3 u_xlat10_9;
					bool u_xlatb9;
					float u_xlat18;
					vec2 u_xlat19;
					void main()
					{
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat1.xy = vec2(_Value) / _ScreenResolution.xy;
					    u_xlat2 = u_xlat1.xyxy * vec4(1.0, 0.0, -2.0, -2.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_3.xyz = texture(_MainTex, u_xlat2.xy).xyz;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat2.zw).xyz;
					    u_xlat16_4.xyz = u_xlat10_3.xyz * u_xlat10_3.xyz;
					    u_xlat16_3.xyz = u_xlat10_0.xyz + u_xlat10_3.xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz * u_xlat10_0.xyz + u_xlat16_4.xyz;
					    u_xlat4 = u_xlat1.xyxy * vec4(2.0, 0.0, -4.0, -3.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_5.xyz = texture(_MainTex, u_xlat4.xy).xyz;
					    u_xlat10_4.xyz = texture(_MainTex, u_xlat4.zw).xyz;
					    u_xlat16_0.xyz = u_xlat10_5.xyz * u_xlat10_5.xyz + u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat10_5.xyz;
					    u_xlat5 = u_xlat1.xyxy * vec4(0.0, 1.0, -2.0, -3.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_6.xyz = texture(_MainTex, u_xlat5.xy).xyz;
					    u_xlat10_5.xyz = texture(_MainTex, u_xlat5.zw).xyz;
					    u_xlat16_0.xyz = u_xlat10_6.xyz * u_xlat10_6.xyz + u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat10_6.xyz;
					    u_xlat19.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
					    u_xlat10_6.xyz = texture(_MainTex, u_xlat19.xy).xyz;
					    u_xlat16_0.xyz = u_xlat10_6.xyz * u_xlat10_6.xyz + u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat10_6.xyz;
					    u_xlat6 = u_xlat1.xyxy * vec4(2.0, 1.0, -4.0, -2.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_7.xyz = texture(_MainTex, u_xlat6.xy).xyz;
					    u_xlat10_6.xyz = texture(_MainTex, u_xlat6.zw).xyz;
					    u_xlat16_0.xyz = u_xlat10_7.xyz * u_xlat10_7.xyz + u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat10_7.xyz;
					    u_xlat7 = u_xlat1.xyxy * vec4(0.0, 2.0, -3.0, -2.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_8.xyz = texture(_MainTex, u_xlat7.xy).xyz;
					    u_xlat10_7.xyz = texture(_MainTex, u_xlat7.zw).xyz;
					    u_xlat16_0.xyz = u_xlat10_8.xyz * u_xlat10_8.xyz + u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat10_8.xyz;
					    u_xlat19.xy = u_xlat1.xy * vec2(1.0, 2.0) + vs_TEXCOORD0.xy;
					    u_xlat10_8.xyz = texture(_MainTex, u_xlat19.xy).xyz;
					    u_xlat16_0.xyz = u_xlat10_8.xyz * u_xlat10_8.xyz + u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat10_8.xyz;
					    u_xlat19.xy = u_xlat1.xy * vec2(2.0, 2.0) + vs_TEXCOORD0.xy;
					    u_xlat8 = u_xlat1.xyxy * vec4(-4.0, -4.0, -3.0, -3.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat19.xy).xyz;
					    u_xlat16_0.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz + u_xlat16_0.xyz;
					    u_xlat16_1.xyz = u_xlat10_1.xyz + u_xlat16_3.xyz;
					    u_xlat1.xyz = u_xlat16_1.xyz * vec3(0.111111112, 0.111111112, 0.111111112);
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat16_0.xyz * vec3(0.111111112, 0.111111112, 0.111111112) + (-u_xlat3.xyz);
					    u_xlat0.x = abs(u_xlat0.y) + abs(u_xlat0.x);
					    u_xlat0.x = abs(u_xlat0.z) + u_xlat0.x;
					    u_xlat10_9.xyz = texture(_MainTex, u_xlat8.xy).xyz;
					    u_xlat10_3.xyz = texture(_MainTex, u_xlat8.zw).xyz;
					    u_xlat16_8.xyz = u_xlat10_3.xyz * u_xlat10_3.xyz;
					    u_xlat16_8.xyz = u_xlat10_9.xyz * u_xlat10_9.xyz + u_xlat16_8.xyz;
					    u_xlat16_9.xyz = u_xlat10_9.xyz + u_xlat10_3.xyz;
					    u_xlat16_9.xyz = u_xlat10_2.xyz + u_xlat16_9.xyz;
					    u_xlat16_2.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz + u_xlat16_8.xyz;
					    u_xlat16_2.xyz = u_xlat10_4.xyz * u_xlat10_4.xyz + u_xlat16_2.xyz;
					    u_xlat16_9.xyz = u_xlat10_4.xyz + u_xlat16_9.xyz;
					    u_xlat16_9.xyz = u_xlat10_3.xyz + u_xlat16_9.xyz;
					    u_xlat16_2.xyz = u_xlat10_3.xyz * u_xlat10_3.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_5.xyz * u_xlat10_5.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_6.xyz * u_xlat10_6.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_7.xyz * u_xlat10_7.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_5.xyz * u_xlat10_5.xyz + u_xlat16_2.xyz;
					    u_xlat16_9.xyz = u_xlat10_5.xyz + u_xlat16_9.xyz;
					    u_xlat16_9.xyz = u_xlat10_6.xyz + u_xlat16_9.xyz;
					    u_xlat16_9.xyz = u_xlat10_7.xyz + u_xlat16_9.xyz;
					    u_xlat16_9.xyz = u_xlat10_5.xyz + u_xlat16_9.xyz;
					    u_xlat3.xyz = u_xlat16_9.xyz * vec3(0.111111112, 0.111111112, 0.111111112);
					    u_xlat9.xyz = u_xlat3.xyz * u_xlat3.xyz;
					    u_xlat9.xyz = u_xlat16_2.xyz * vec3(0.111111112, 0.111111112, 0.111111112) + (-u_xlat9.xyz);
					    u_xlat9.x = abs(u_xlat9.y) + abs(u_xlat9.x);
					    u_xlat9.x = abs(u_xlat9.z) + u_xlat9.x;
					    u_xlat18 = min(u_xlat9.x, 100.0);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb9 = !!(u_xlat9.x<100.0);
					#else
					    u_xlatb9 = u_xlat9.x<100.0;
					#endif
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat0.x<u_xlat18);
					#else
					    u_xlatb0 = u_xlat0.x<u_xlat18;
					#endif
					    u_xlat3.w = 1.0;
					    u_xlat2 = mix(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3, vec4(bvec4(u_xlatb9)));
					    u_xlat1.w = 1.0;
					    SV_Target0 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat2;
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
					uniform 	float _Value;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_1;
					lowp vec3 u_xlat10_1;
					vec4 u_xlat2;
					mediump vec3 u_xlat16_2;
					lowp vec3 u_xlat10_2;
					vec4 u_xlat3;
					mediump vec3 u_xlat16_3;
					lowp vec3 u_xlat10_3;
					vec4 u_xlat4;
					mediump vec3 u_xlat16_4;
					lowp vec3 u_xlat10_4;
					vec4 u_xlat5;
					lowp vec3 u_xlat10_5;
					vec4 u_xlat6;
					lowp vec3 u_xlat10_6;
					vec4 u_xlat7;
					lowp vec3 u_xlat10_7;
					vec4 u_xlat8;
					mediump vec3 u_xlat16_8;
					lowp vec3 u_xlat10_8;
					vec3 u_xlat9;
					mediump vec3 u_xlat16_9;
					lowp vec3 u_xlat10_9;
					bool u_xlatb9;
					float u_xlat18;
					vec2 u_xlat19;
					void main()
					{
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat1.xy = vec2(_Value) / _ScreenResolution.xy;
					    u_xlat2 = u_xlat1.xyxy * vec4(1.0, 0.0, -2.0, -2.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_3.xyz = texture(_MainTex, u_xlat2.xy).xyz;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat2.zw).xyz;
					    u_xlat16_4.xyz = u_xlat10_3.xyz * u_xlat10_3.xyz;
					    u_xlat16_3.xyz = u_xlat10_0.xyz + u_xlat10_3.xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz * u_xlat10_0.xyz + u_xlat16_4.xyz;
					    u_xlat4 = u_xlat1.xyxy * vec4(2.0, 0.0, -4.0, -3.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_5.xyz = texture(_MainTex, u_xlat4.xy).xyz;
					    u_xlat10_4.xyz = texture(_MainTex, u_xlat4.zw).xyz;
					    u_xlat16_0.xyz = u_xlat10_5.xyz * u_xlat10_5.xyz + u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat10_5.xyz;
					    u_xlat5 = u_xlat1.xyxy * vec4(0.0, 1.0, -2.0, -3.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_6.xyz = texture(_MainTex, u_xlat5.xy).xyz;
					    u_xlat10_5.xyz = texture(_MainTex, u_xlat5.zw).xyz;
					    u_xlat16_0.xyz = u_xlat10_6.xyz * u_xlat10_6.xyz + u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat10_6.xyz;
					    u_xlat19.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
					    u_xlat10_6.xyz = texture(_MainTex, u_xlat19.xy).xyz;
					    u_xlat16_0.xyz = u_xlat10_6.xyz * u_xlat10_6.xyz + u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat10_6.xyz;
					    u_xlat6 = u_xlat1.xyxy * vec4(2.0, 1.0, -4.0, -2.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_7.xyz = texture(_MainTex, u_xlat6.xy).xyz;
					    u_xlat10_6.xyz = texture(_MainTex, u_xlat6.zw).xyz;
					    u_xlat16_0.xyz = u_xlat10_7.xyz * u_xlat10_7.xyz + u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat10_7.xyz;
					    u_xlat7 = u_xlat1.xyxy * vec4(0.0, 2.0, -3.0, -2.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_8.xyz = texture(_MainTex, u_xlat7.xy).xyz;
					    u_xlat10_7.xyz = texture(_MainTex, u_xlat7.zw).xyz;
					    u_xlat16_0.xyz = u_xlat10_8.xyz * u_xlat10_8.xyz + u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat10_8.xyz;
					    u_xlat19.xy = u_xlat1.xy * vec2(1.0, 2.0) + vs_TEXCOORD0.xy;
					    u_xlat10_8.xyz = texture(_MainTex, u_xlat19.xy).xyz;
					    u_xlat16_0.xyz = u_xlat10_8.xyz * u_xlat10_8.xyz + u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat10_8.xyz;
					    u_xlat19.xy = u_xlat1.xy * vec2(2.0, 2.0) + vs_TEXCOORD0.xy;
					    u_xlat8 = u_xlat1.xyxy * vec4(-4.0, -4.0, -3.0, -3.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat19.xy).xyz;
					    u_xlat16_0.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz + u_xlat16_0.xyz;
					    u_xlat16_1.xyz = u_xlat10_1.xyz + u_xlat16_3.xyz;
					    u_xlat1.xyz = u_xlat16_1.xyz * vec3(0.111111112, 0.111111112, 0.111111112);
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat16_0.xyz * vec3(0.111111112, 0.111111112, 0.111111112) + (-u_xlat3.xyz);
					    u_xlat0.x = abs(u_xlat0.y) + abs(u_xlat0.x);
					    u_xlat0.x = abs(u_xlat0.z) + u_xlat0.x;
					    u_xlat10_9.xyz = texture(_MainTex, u_xlat8.xy).xyz;
					    u_xlat10_3.xyz = texture(_MainTex, u_xlat8.zw).xyz;
					    u_xlat16_8.xyz = u_xlat10_3.xyz * u_xlat10_3.xyz;
					    u_xlat16_8.xyz = u_xlat10_9.xyz * u_xlat10_9.xyz + u_xlat16_8.xyz;
					    u_xlat16_9.xyz = u_xlat10_9.xyz + u_xlat10_3.xyz;
					    u_xlat16_9.xyz = u_xlat10_2.xyz + u_xlat16_9.xyz;
					    u_xlat16_2.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz + u_xlat16_8.xyz;
					    u_xlat16_2.xyz = u_xlat10_4.xyz * u_xlat10_4.xyz + u_xlat16_2.xyz;
					    u_xlat16_9.xyz = u_xlat10_4.xyz + u_xlat16_9.xyz;
					    u_xlat16_9.xyz = u_xlat10_3.xyz + u_xlat16_9.xyz;
					    u_xlat16_2.xyz = u_xlat10_3.xyz * u_xlat10_3.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_5.xyz * u_xlat10_5.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_6.xyz * u_xlat10_6.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_7.xyz * u_xlat10_7.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_5.xyz * u_xlat10_5.xyz + u_xlat16_2.xyz;
					    u_xlat16_9.xyz = u_xlat10_5.xyz + u_xlat16_9.xyz;
					    u_xlat16_9.xyz = u_xlat10_6.xyz + u_xlat16_9.xyz;
					    u_xlat16_9.xyz = u_xlat10_7.xyz + u_xlat16_9.xyz;
					    u_xlat16_9.xyz = u_xlat10_5.xyz + u_xlat16_9.xyz;
					    u_xlat3.xyz = u_xlat16_9.xyz * vec3(0.111111112, 0.111111112, 0.111111112);
					    u_xlat9.xyz = u_xlat3.xyz * u_xlat3.xyz;
					    u_xlat9.xyz = u_xlat16_2.xyz * vec3(0.111111112, 0.111111112, 0.111111112) + (-u_xlat9.xyz);
					    u_xlat9.x = abs(u_xlat9.y) + abs(u_xlat9.x);
					    u_xlat9.x = abs(u_xlat9.z) + u_xlat9.x;
					    u_xlat18 = min(u_xlat9.x, 100.0);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb9 = !!(u_xlat9.x<100.0);
					#else
					    u_xlatb9 = u_xlat9.x<100.0;
					#endif
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat0.x<u_xlat18);
					#else
					    u_xlatb0 = u_xlat0.x<u_xlat18;
					#endif
					    u_xlat3.w = 1.0;
					    u_xlat2 = mix(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3, vec4(bvec4(u_xlatb9)));
					    u_xlat1.w = 1.0;
					    SV_Target0 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat2;
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
					uniform 	float _Value;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_1;
					lowp vec3 u_xlat10_1;
					vec4 u_xlat2;
					mediump vec3 u_xlat16_2;
					lowp vec3 u_xlat10_2;
					vec4 u_xlat3;
					mediump vec3 u_xlat16_3;
					lowp vec3 u_xlat10_3;
					vec4 u_xlat4;
					mediump vec3 u_xlat16_4;
					lowp vec3 u_xlat10_4;
					vec4 u_xlat5;
					lowp vec3 u_xlat10_5;
					vec4 u_xlat6;
					lowp vec3 u_xlat10_6;
					vec4 u_xlat7;
					lowp vec3 u_xlat10_7;
					vec4 u_xlat8;
					mediump vec3 u_xlat16_8;
					lowp vec3 u_xlat10_8;
					vec3 u_xlat9;
					mediump vec3 u_xlat16_9;
					lowp vec3 u_xlat10_9;
					bool u_xlatb9;
					float u_xlat18;
					vec2 u_xlat19;
					void main()
					{
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat1.xy = vec2(_Value) / _ScreenResolution.xy;
					    u_xlat2 = u_xlat1.xyxy * vec4(1.0, 0.0, -2.0, -2.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_3.xyz = texture(_MainTex, u_xlat2.xy).xyz;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat2.zw).xyz;
					    u_xlat16_4.xyz = u_xlat10_3.xyz * u_xlat10_3.xyz;
					    u_xlat16_3.xyz = u_xlat10_0.xyz + u_xlat10_3.xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz * u_xlat10_0.xyz + u_xlat16_4.xyz;
					    u_xlat4 = u_xlat1.xyxy * vec4(2.0, 0.0, -4.0, -3.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_5.xyz = texture(_MainTex, u_xlat4.xy).xyz;
					    u_xlat10_4.xyz = texture(_MainTex, u_xlat4.zw).xyz;
					    u_xlat16_0.xyz = u_xlat10_5.xyz * u_xlat10_5.xyz + u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat10_5.xyz;
					    u_xlat5 = u_xlat1.xyxy * vec4(0.0, 1.0, -2.0, -3.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_6.xyz = texture(_MainTex, u_xlat5.xy).xyz;
					    u_xlat10_5.xyz = texture(_MainTex, u_xlat5.zw).xyz;
					    u_xlat16_0.xyz = u_xlat10_6.xyz * u_xlat10_6.xyz + u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat10_6.xyz;
					    u_xlat19.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
					    u_xlat10_6.xyz = texture(_MainTex, u_xlat19.xy).xyz;
					    u_xlat16_0.xyz = u_xlat10_6.xyz * u_xlat10_6.xyz + u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat10_6.xyz;
					    u_xlat6 = u_xlat1.xyxy * vec4(2.0, 1.0, -4.0, -2.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_7.xyz = texture(_MainTex, u_xlat6.xy).xyz;
					    u_xlat10_6.xyz = texture(_MainTex, u_xlat6.zw).xyz;
					    u_xlat16_0.xyz = u_xlat10_7.xyz * u_xlat10_7.xyz + u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat10_7.xyz;
					    u_xlat7 = u_xlat1.xyxy * vec4(0.0, 2.0, -3.0, -2.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_8.xyz = texture(_MainTex, u_xlat7.xy).xyz;
					    u_xlat10_7.xyz = texture(_MainTex, u_xlat7.zw).xyz;
					    u_xlat16_0.xyz = u_xlat10_8.xyz * u_xlat10_8.xyz + u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat10_8.xyz;
					    u_xlat19.xy = u_xlat1.xy * vec2(1.0, 2.0) + vs_TEXCOORD0.xy;
					    u_xlat10_8.xyz = texture(_MainTex, u_xlat19.xy).xyz;
					    u_xlat16_0.xyz = u_xlat10_8.xyz * u_xlat10_8.xyz + u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat10_8.xyz;
					    u_xlat19.xy = u_xlat1.xy * vec2(2.0, 2.0) + vs_TEXCOORD0.xy;
					    u_xlat8 = u_xlat1.xyxy * vec4(-4.0, -4.0, -3.0, -3.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat19.xy).xyz;
					    u_xlat16_0.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz + u_xlat16_0.xyz;
					    u_xlat16_1.xyz = u_xlat10_1.xyz + u_xlat16_3.xyz;
					    u_xlat1.xyz = u_xlat16_1.xyz * vec3(0.111111112, 0.111111112, 0.111111112);
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat16_0.xyz * vec3(0.111111112, 0.111111112, 0.111111112) + (-u_xlat3.xyz);
					    u_xlat0.x = abs(u_xlat0.y) + abs(u_xlat0.x);
					    u_xlat0.x = abs(u_xlat0.z) + u_xlat0.x;
					    u_xlat10_9.xyz = texture(_MainTex, u_xlat8.xy).xyz;
					    u_xlat10_3.xyz = texture(_MainTex, u_xlat8.zw).xyz;
					    u_xlat16_8.xyz = u_xlat10_3.xyz * u_xlat10_3.xyz;
					    u_xlat16_8.xyz = u_xlat10_9.xyz * u_xlat10_9.xyz + u_xlat16_8.xyz;
					    u_xlat16_9.xyz = u_xlat10_9.xyz + u_xlat10_3.xyz;
					    u_xlat16_9.xyz = u_xlat10_2.xyz + u_xlat16_9.xyz;
					    u_xlat16_2.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz + u_xlat16_8.xyz;
					    u_xlat16_2.xyz = u_xlat10_4.xyz * u_xlat10_4.xyz + u_xlat16_2.xyz;
					    u_xlat16_9.xyz = u_xlat10_4.xyz + u_xlat16_9.xyz;
					    u_xlat16_9.xyz = u_xlat10_3.xyz + u_xlat16_9.xyz;
					    u_xlat16_2.xyz = u_xlat10_3.xyz * u_xlat10_3.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_5.xyz * u_xlat10_5.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_6.xyz * u_xlat10_6.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_7.xyz * u_xlat10_7.xyz + u_xlat16_2.xyz;
					    u_xlat16_2.xyz = u_xlat10_5.xyz * u_xlat10_5.xyz + u_xlat16_2.xyz;
					    u_xlat16_9.xyz = u_xlat10_5.xyz + u_xlat16_9.xyz;
					    u_xlat16_9.xyz = u_xlat10_6.xyz + u_xlat16_9.xyz;
					    u_xlat16_9.xyz = u_xlat10_7.xyz + u_xlat16_9.xyz;
					    u_xlat16_9.xyz = u_xlat10_5.xyz + u_xlat16_9.xyz;
					    u_xlat3.xyz = u_xlat16_9.xyz * vec3(0.111111112, 0.111111112, 0.111111112);
					    u_xlat9.xyz = u_xlat3.xyz * u_xlat3.xyz;
					    u_xlat9.xyz = u_xlat16_2.xyz * vec3(0.111111112, 0.111111112, 0.111111112) + (-u_xlat9.xyz);
					    u_xlat9.x = abs(u_xlat9.y) + abs(u_xlat9.x);
					    u_xlat9.x = abs(u_xlat9.z) + u_xlat9.x;
					    u_xlat18 = min(u_xlat9.x, 100.0);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb9 = !!(u_xlat9.x<100.0);
					#else
					    u_xlatb9 = u_xlat9.x<100.0;
					#endif
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat0.x<u_xlat18);
					#else
					    u_xlatb0 = u_xlat0.x<u_xlat18;
					#endif
					    u_xlat3.w = 1.0;
					    u_xlat2 = mix(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3, vec4(bvec4(u_xlatb9)));
					    u_xlat1.w = 1.0;
					    SV_Target0 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat2;
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