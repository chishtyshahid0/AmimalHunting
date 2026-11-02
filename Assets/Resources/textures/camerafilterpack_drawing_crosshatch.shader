Shader "CameraFilterPack/Drawing_Crosshatch" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 10)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 39177
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
					uniform highp float _Distortion;
					uniform highp vec4 _ScreenResolution;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp float g_1;
					  highp float gy_2;
					  highp float gx_3;
					  highp float brightestChannel_4;
					  highp float dimmestChannel_5;
					  highp float brightness_6;
					  lowp vec4 tex_7;
					  lowp vec3 res_8;
					  highp vec2 tmpvar_9;
					  tmpvar_9 = (1.0/(_ScreenResolution.xy));
					  res_8 = vec3(1.0, 1.0, 1.0);
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_7 = tmpvar_10;
					  lowp float tmpvar_11;
					  tmpvar_11 = (((0.2126 * tmpvar_10.x) + (0.7152 * tmpvar_10.y)) + (0.0722 * tmpvar_10.z));
					  brightness_6 = tmpvar_11;
					  lowp float tmpvar_12;
					  tmpvar_12 = min (min (tmpvar_10.x, tmpvar_10.y), tmpvar_10.z);
					  dimmestChannel_5 = tmpvar_12;
					  lowp float tmpvar_13;
					  tmpvar_13 = max (max (tmpvar_10.x, tmpvar_10.y), tmpvar_10.z);
					  brightestChannel_4 = tmpvar_13;
					  highp float tmpvar_14;
					  tmpvar_14 = (brightestChannel_4 - dimmestChannel_5);
					  if ((tmpvar_14 > 0.1)) {
					    tex_7 = (tmpvar_10 * (1.0/(brightestChannel_4)));
					  } else {
					    tex_7.xyz = vec3(1.0, 1.0, 1.0);
					  };
					  highp vec2 tmpvar_15;
					  tmpvar_15 = (xlv_TEXCOORD0 * _ScreenResolution.xy);
					  highp float tmpvar_16;
					  tmpvar_16 = (tmpvar_15.x + tmpvar_15.y);
					  highp float tmpvar_17;
					  tmpvar_17 = (tmpvar_15.x - tmpvar_15.y);
					  if ((brightness_6 < 0.8)) {
					    highp float tmpvar_18;
					    tmpvar_18 = (tmpvar_16 - (floor(
					      (tmpvar_16 * 0.1)
					    ) * 10.0));
					    if ((tmpvar_18 <= _Distortion)) {
					      res_8 = (tex_7.xyz * 0.8);
					    };
					  };
					  if ((brightness_6 < 0.6)) {
					    highp float tmpvar_19;
					    tmpvar_19 = (tmpvar_17 - (floor(
					      (tmpvar_17 * 0.1)
					    ) * 10.0));
					    if ((tmpvar_19 <= _Distortion)) {
					      res_8 = (tex_7.xyz * 0.6);
					    };
					  };
					  if ((brightness_6 < 0.3)) {
					    highp float tmpvar_20;
					    highp float x_21;
					    x_21 = (tmpvar_16 - 5.0);
					    tmpvar_20 = (x_21 - (floor(
					      (x_21 * 0.1)
					    ) * 10.0));
					    if ((tmpvar_20 <= _Distortion)) {
					      res_8 = (tex_7.xyz * 0.3);
					    };
					  };
					  if ((brightness_6 < 0.15)) {
					    highp float tmpvar_22;
					    highp float x_23;
					    x_23 = (tmpvar_17 - 5.0);
					    tmpvar_22 = (x_23 - (floor(
					      (x_23 * 0.1)
					    ) * 10.0));
					    if ((tmpvar_22 <= _Distortion)) {
					      res_8 = vec3(0.0, 0.0, 0.0);
					    };
					  };
					  highp float tmpvar_24;
					  lowp vec4 tmpvar_25;
					  highp vec2 P_26;
					  P_26 = ((tmpvar_15 + vec2(-1.0, -1.0)) * tmpvar_9);
					  tmpvar_25 = texture2D (_MainTex, P_26);
					  tmpvar_24 = (((0.2126 * tmpvar_25.x) + (0.7152 * tmpvar_25.y)) + (0.0722 * tmpvar_25.z));
					  gx_3 = -(tmpvar_24);
					  gy_2 = -(tmpvar_24);
					  highp float tmpvar_27;
					  lowp vec4 tmpvar_28;
					  highp vec2 P_29;
					  P_29 = ((tmpvar_15 + vec2(-1.0, 0.0)) * tmpvar_9);
					  tmpvar_28 = texture2D (_MainTex, P_29);
					  tmpvar_27 = (((0.2126 * tmpvar_28.x) + (0.7152 * tmpvar_28.y)) + (0.0722 * tmpvar_28.z));
					  gx_3 = (gx_3 + (-2.0 * tmpvar_27));
					  gx_3 = (gx_3 - tmpvar_27);
					  highp float tmpvar_30;
					  lowp vec4 tmpvar_31;
					  highp vec2 P_32;
					  P_32 = ((tmpvar_15 + vec2(1.0, -1.0)) * tmpvar_9);
					  tmpvar_31 = texture2D (_MainTex, P_32);
					  tmpvar_30 = (((0.2126 * tmpvar_31.x) + (0.7152 * tmpvar_31.y)) + (0.0722 * tmpvar_31.z));
					  gx_3 = (gx_3 + tmpvar_30);
					  gy_2 = (gy_2 - tmpvar_30);
					  highp float tmpvar_33;
					  lowp vec4 tmpvar_34;
					  highp vec2 P_35;
					  P_35 = ((tmpvar_15 + vec2(1.0, 0.0)) * tmpvar_9);
					  tmpvar_34 = texture2D (_MainTex, P_35);
					  tmpvar_33 = (((0.2126 * tmpvar_34.x) + (0.7152 * tmpvar_34.y)) + (0.0722 * tmpvar_34.z));
					  gx_3 = (gx_3 + (2.0 * tmpvar_33));
					  highp float tmpvar_36;
					  lowp vec4 tmpvar_37;
					  highp vec2 P_38;
					  P_38 = ((tmpvar_15 + vec2(1.0, 1.0)) * tmpvar_9);
					  tmpvar_37 = texture2D (_MainTex, P_38);
					  tmpvar_36 = (((0.2126 * tmpvar_37.x) + (0.7152 * tmpvar_37.y)) + (0.0722 * tmpvar_37.z));
					  gx_3 = (gx_3 + tmpvar_36);
					  highp float tmpvar_39;
					  lowp vec4 tmpvar_40;
					  highp vec2 P_41;
					  P_41 = ((tmpvar_15 + vec2(1.0, 1.0)) * tmpvar_9);
					  tmpvar_40 = texture2D (_MainTex, P_41);
					  tmpvar_39 = (((0.2126 * tmpvar_40.x) + (0.7152 * tmpvar_40.y)) + (0.0722 * tmpvar_40.z));
					  gy_2 = (gy_2 + tmpvar_39);
					  highp float tmpvar_42;
					  lowp vec4 tmpvar_43;
					  highp vec2 P_44;
					  P_44 = ((tmpvar_15 + vec2(0.0, -1.0)) * tmpvar_9);
					  tmpvar_43 = texture2D (_MainTex, P_44);
					  tmpvar_42 = (((0.2126 * tmpvar_43.x) + (0.7152 * tmpvar_43.y)) + (0.0722 * tmpvar_43.z));
					  gy_2 = (gy_2 + (-2.0 * tmpvar_42));
					  highp float tmpvar_45;
					  lowp vec4 tmpvar_46;
					  highp vec2 P_47;
					  P_47 = ((tmpvar_15 + vec2(-1.0, 1.0)) * tmpvar_9);
					  tmpvar_46 = texture2D (_MainTex, P_47);
					  tmpvar_45 = (((0.2126 * tmpvar_46.x) + (0.7152 * tmpvar_46.y)) + (0.0722 * tmpvar_46.z));
					  gy_2 = (gy_2 + tmpvar_45);
					  highp float tmpvar_48;
					  lowp vec4 tmpvar_49;
					  highp vec2 P_50;
					  P_50 = ((tmpvar_15 + vec2(0.0, 1.0)) * tmpvar_9);
					  tmpvar_49 = texture2D (_MainTex, P_50);
					  tmpvar_48 = (((0.2126 * tmpvar_49.x) + (0.7152 * tmpvar_49.y)) + (0.0722 * tmpvar_49.z));
					  gy_2 = (gy_2 + (2.0 * tmpvar_48));
					  highp float tmpvar_51;
					  tmpvar_51 = ((gx_3 * gx_3) + (gy_2 * gy_2));
					  g_1 = tmpvar_51;
					  res_8 = (res_8 * (1.0 - g_1));
					  lowp vec4 tmpvar_52;
					  tmpvar_52.w = 1.0;
					  tmpvar_52.xyz = res_8;
					  gl_FragData[0] = tmpvar_52;
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
					uniform highp float _Distortion;
					uniform highp vec4 _ScreenResolution;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp float g_1;
					  highp float gy_2;
					  highp float gx_3;
					  highp float brightestChannel_4;
					  highp float dimmestChannel_5;
					  highp float brightness_6;
					  lowp vec4 tex_7;
					  lowp vec3 res_8;
					  highp vec2 tmpvar_9;
					  tmpvar_9 = (1.0/(_ScreenResolution.xy));
					  res_8 = vec3(1.0, 1.0, 1.0);
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_7 = tmpvar_10;
					  lowp float tmpvar_11;
					  tmpvar_11 = (((0.2126 * tmpvar_10.x) + (0.7152 * tmpvar_10.y)) + (0.0722 * tmpvar_10.z));
					  brightness_6 = tmpvar_11;
					  lowp float tmpvar_12;
					  tmpvar_12 = min (min (tmpvar_10.x, tmpvar_10.y), tmpvar_10.z);
					  dimmestChannel_5 = tmpvar_12;
					  lowp float tmpvar_13;
					  tmpvar_13 = max (max (tmpvar_10.x, tmpvar_10.y), tmpvar_10.z);
					  brightestChannel_4 = tmpvar_13;
					  highp float tmpvar_14;
					  tmpvar_14 = (brightestChannel_4 - dimmestChannel_5);
					  if ((tmpvar_14 > 0.1)) {
					    tex_7 = (tmpvar_10 * (1.0/(brightestChannel_4)));
					  } else {
					    tex_7.xyz = vec3(1.0, 1.0, 1.0);
					  };
					  highp vec2 tmpvar_15;
					  tmpvar_15 = (xlv_TEXCOORD0 * _ScreenResolution.xy);
					  highp float tmpvar_16;
					  tmpvar_16 = (tmpvar_15.x + tmpvar_15.y);
					  highp float tmpvar_17;
					  tmpvar_17 = (tmpvar_15.x - tmpvar_15.y);
					  if ((brightness_6 < 0.8)) {
					    highp float tmpvar_18;
					    tmpvar_18 = (tmpvar_16 - (floor(
					      (tmpvar_16 * 0.1)
					    ) * 10.0));
					    if ((tmpvar_18 <= _Distortion)) {
					      res_8 = (tex_7.xyz * 0.8);
					    };
					  };
					  if ((brightness_6 < 0.6)) {
					    highp float tmpvar_19;
					    tmpvar_19 = (tmpvar_17 - (floor(
					      (tmpvar_17 * 0.1)
					    ) * 10.0));
					    if ((tmpvar_19 <= _Distortion)) {
					      res_8 = (tex_7.xyz * 0.6);
					    };
					  };
					  if ((brightness_6 < 0.3)) {
					    highp float tmpvar_20;
					    highp float x_21;
					    x_21 = (tmpvar_16 - 5.0);
					    tmpvar_20 = (x_21 - (floor(
					      (x_21 * 0.1)
					    ) * 10.0));
					    if ((tmpvar_20 <= _Distortion)) {
					      res_8 = (tex_7.xyz * 0.3);
					    };
					  };
					  if ((brightness_6 < 0.15)) {
					    highp float tmpvar_22;
					    highp float x_23;
					    x_23 = (tmpvar_17 - 5.0);
					    tmpvar_22 = (x_23 - (floor(
					      (x_23 * 0.1)
					    ) * 10.0));
					    if ((tmpvar_22 <= _Distortion)) {
					      res_8 = vec3(0.0, 0.0, 0.0);
					    };
					  };
					  highp float tmpvar_24;
					  lowp vec4 tmpvar_25;
					  highp vec2 P_26;
					  P_26 = ((tmpvar_15 + vec2(-1.0, -1.0)) * tmpvar_9);
					  tmpvar_25 = texture2D (_MainTex, P_26);
					  tmpvar_24 = (((0.2126 * tmpvar_25.x) + (0.7152 * tmpvar_25.y)) + (0.0722 * tmpvar_25.z));
					  gx_3 = -(tmpvar_24);
					  gy_2 = -(tmpvar_24);
					  highp float tmpvar_27;
					  lowp vec4 tmpvar_28;
					  highp vec2 P_29;
					  P_29 = ((tmpvar_15 + vec2(-1.0, 0.0)) * tmpvar_9);
					  tmpvar_28 = texture2D (_MainTex, P_29);
					  tmpvar_27 = (((0.2126 * tmpvar_28.x) + (0.7152 * tmpvar_28.y)) + (0.0722 * tmpvar_28.z));
					  gx_3 = (gx_3 + (-2.0 * tmpvar_27));
					  gx_3 = (gx_3 - tmpvar_27);
					  highp float tmpvar_30;
					  lowp vec4 tmpvar_31;
					  highp vec2 P_32;
					  P_32 = ((tmpvar_15 + vec2(1.0, -1.0)) * tmpvar_9);
					  tmpvar_31 = texture2D (_MainTex, P_32);
					  tmpvar_30 = (((0.2126 * tmpvar_31.x) + (0.7152 * tmpvar_31.y)) + (0.0722 * tmpvar_31.z));
					  gx_3 = (gx_3 + tmpvar_30);
					  gy_2 = (gy_2 - tmpvar_30);
					  highp float tmpvar_33;
					  lowp vec4 tmpvar_34;
					  highp vec2 P_35;
					  P_35 = ((tmpvar_15 + vec2(1.0, 0.0)) * tmpvar_9);
					  tmpvar_34 = texture2D (_MainTex, P_35);
					  tmpvar_33 = (((0.2126 * tmpvar_34.x) + (0.7152 * tmpvar_34.y)) + (0.0722 * tmpvar_34.z));
					  gx_3 = (gx_3 + (2.0 * tmpvar_33));
					  highp float tmpvar_36;
					  lowp vec4 tmpvar_37;
					  highp vec2 P_38;
					  P_38 = ((tmpvar_15 + vec2(1.0, 1.0)) * tmpvar_9);
					  tmpvar_37 = texture2D (_MainTex, P_38);
					  tmpvar_36 = (((0.2126 * tmpvar_37.x) + (0.7152 * tmpvar_37.y)) + (0.0722 * tmpvar_37.z));
					  gx_3 = (gx_3 + tmpvar_36);
					  highp float tmpvar_39;
					  lowp vec4 tmpvar_40;
					  highp vec2 P_41;
					  P_41 = ((tmpvar_15 + vec2(1.0, 1.0)) * tmpvar_9);
					  tmpvar_40 = texture2D (_MainTex, P_41);
					  tmpvar_39 = (((0.2126 * tmpvar_40.x) + (0.7152 * tmpvar_40.y)) + (0.0722 * tmpvar_40.z));
					  gy_2 = (gy_2 + tmpvar_39);
					  highp float tmpvar_42;
					  lowp vec4 tmpvar_43;
					  highp vec2 P_44;
					  P_44 = ((tmpvar_15 + vec2(0.0, -1.0)) * tmpvar_9);
					  tmpvar_43 = texture2D (_MainTex, P_44);
					  tmpvar_42 = (((0.2126 * tmpvar_43.x) + (0.7152 * tmpvar_43.y)) + (0.0722 * tmpvar_43.z));
					  gy_2 = (gy_2 + (-2.0 * tmpvar_42));
					  highp float tmpvar_45;
					  lowp vec4 tmpvar_46;
					  highp vec2 P_47;
					  P_47 = ((tmpvar_15 + vec2(-1.0, 1.0)) * tmpvar_9);
					  tmpvar_46 = texture2D (_MainTex, P_47);
					  tmpvar_45 = (((0.2126 * tmpvar_46.x) + (0.7152 * tmpvar_46.y)) + (0.0722 * tmpvar_46.z));
					  gy_2 = (gy_2 + tmpvar_45);
					  highp float tmpvar_48;
					  lowp vec4 tmpvar_49;
					  highp vec2 P_50;
					  P_50 = ((tmpvar_15 + vec2(0.0, 1.0)) * tmpvar_9);
					  tmpvar_49 = texture2D (_MainTex, P_50);
					  tmpvar_48 = (((0.2126 * tmpvar_49.x) + (0.7152 * tmpvar_49.y)) + (0.0722 * tmpvar_49.z));
					  gy_2 = (gy_2 + (2.0 * tmpvar_48));
					  highp float tmpvar_51;
					  tmpvar_51 = ((gx_3 * gx_3) + (gy_2 * gy_2));
					  g_1 = tmpvar_51;
					  res_8 = (res_8 * (1.0 - g_1));
					  lowp vec4 tmpvar_52;
					  tmpvar_52.w = 1.0;
					  tmpvar_52.xyz = res_8;
					  gl_FragData[0] = tmpvar_52;
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
					uniform highp float _Distortion;
					uniform highp vec4 _ScreenResolution;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp float g_1;
					  highp float gy_2;
					  highp float gx_3;
					  highp float brightestChannel_4;
					  highp float dimmestChannel_5;
					  highp float brightness_6;
					  lowp vec4 tex_7;
					  lowp vec3 res_8;
					  highp vec2 tmpvar_9;
					  tmpvar_9 = (1.0/(_ScreenResolution.xy));
					  res_8 = vec3(1.0, 1.0, 1.0);
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_7 = tmpvar_10;
					  lowp float tmpvar_11;
					  tmpvar_11 = (((0.2126 * tmpvar_10.x) + (0.7152 * tmpvar_10.y)) + (0.0722 * tmpvar_10.z));
					  brightness_6 = tmpvar_11;
					  lowp float tmpvar_12;
					  tmpvar_12 = min (min (tmpvar_10.x, tmpvar_10.y), tmpvar_10.z);
					  dimmestChannel_5 = tmpvar_12;
					  lowp float tmpvar_13;
					  tmpvar_13 = max (max (tmpvar_10.x, tmpvar_10.y), tmpvar_10.z);
					  brightestChannel_4 = tmpvar_13;
					  highp float tmpvar_14;
					  tmpvar_14 = (brightestChannel_4 - dimmestChannel_5);
					  if ((tmpvar_14 > 0.1)) {
					    tex_7 = (tmpvar_10 * (1.0/(brightestChannel_4)));
					  } else {
					    tex_7.xyz = vec3(1.0, 1.0, 1.0);
					  };
					  highp vec2 tmpvar_15;
					  tmpvar_15 = (xlv_TEXCOORD0 * _ScreenResolution.xy);
					  highp float tmpvar_16;
					  tmpvar_16 = (tmpvar_15.x + tmpvar_15.y);
					  highp float tmpvar_17;
					  tmpvar_17 = (tmpvar_15.x - tmpvar_15.y);
					  if ((brightness_6 < 0.8)) {
					    highp float tmpvar_18;
					    tmpvar_18 = (tmpvar_16 - (floor(
					      (tmpvar_16 * 0.1)
					    ) * 10.0));
					    if ((tmpvar_18 <= _Distortion)) {
					      res_8 = (tex_7.xyz * 0.8);
					    };
					  };
					  if ((brightness_6 < 0.6)) {
					    highp float tmpvar_19;
					    tmpvar_19 = (tmpvar_17 - (floor(
					      (tmpvar_17 * 0.1)
					    ) * 10.0));
					    if ((tmpvar_19 <= _Distortion)) {
					      res_8 = (tex_7.xyz * 0.6);
					    };
					  };
					  if ((brightness_6 < 0.3)) {
					    highp float tmpvar_20;
					    highp float x_21;
					    x_21 = (tmpvar_16 - 5.0);
					    tmpvar_20 = (x_21 - (floor(
					      (x_21 * 0.1)
					    ) * 10.0));
					    if ((tmpvar_20 <= _Distortion)) {
					      res_8 = (tex_7.xyz * 0.3);
					    };
					  };
					  if ((brightness_6 < 0.15)) {
					    highp float tmpvar_22;
					    highp float x_23;
					    x_23 = (tmpvar_17 - 5.0);
					    tmpvar_22 = (x_23 - (floor(
					      (x_23 * 0.1)
					    ) * 10.0));
					    if ((tmpvar_22 <= _Distortion)) {
					      res_8 = vec3(0.0, 0.0, 0.0);
					    };
					  };
					  highp float tmpvar_24;
					  lowp vec4 tmpvar_25;
					  highp vec2 P_26;
					  P_26 = ((tmpvar_15 + vec2(-1.0, -1.0)) * tmpvar_9);
					  tmpvar_25 = texture2D (_MainTex, P_26);
					  tmpvar_24 = (((0.2126 * tmpvar_25.x) + (0.7152 * tmpvar_25.y)) + (0.0722 * tmpvar_25.z));
					  gx_3 = -(tmpvar_24);
					  gy_2 = -(tmpvar_24);
					  highp float tmpvar_27;
					  lowp vec4 tmpvar_28;
					  highp vec2 P_29;
					  P_29 = ((tmpvar_15 + vec2(-1.0, 0.0)) * tmpvar_9);
					  tmpvar_28 = texture2D (_MainTex, P_29);
					  tmpvar_27 = (((0.2126 * tmpvar_28.x) + (0.7152 * tmpvar_28.y)) + (0.0722 * tmpvar_28.z));
					  gx_3 = (gx_3 + (-2.0 * tmpvar_27));
					  gx_3 = (gx_3 - tmpvar_27);
					  highp float tmpvar_30;
					  lowp vec4 tmpvar_31;
					  highp vec2 P_32;
					  P_32 = ((tmpvar_15 + vec2(1.0, -1.0)) * tmpvar_9);
					  tmpvar_31 = texture2D (_MainTex, P_32);
					  tmpvar_30 = (((0.2126 * tmpvar_31.x) + (0.7152 * tmpvar_31.y)) + (0.0722 * tmpvar_31.z));
					  gx_3 = (gx_3 + tmpvar_30);
					  gy_2 = (gy_2 - tmpvar_30);
					  highp float tmpvar_33;
					  lowp vec4 tmpvar_34;
					  highp vec2 P_35;
					  P_35 = ((tmpvar_15 + vec2(1.0, 0.0)) * tmpvar_9);
					  tmpvar_34 = texture2D (_MainTex, P_35);
					  tmpvar_33 = (((0.2126 * tmpvar_34.x) + (0.7152 * tmpvar_34.y)) + (0.0722 * tmpvar_34.z));
					  gx_3 = (gx_3 + (2.0 * tmpvar_33));
					  highp float tmpvar_36;
					  lowp vec4 tmpvar_37;
					  highp vec2 P_38;
					  P_38 = ((tmpvar_15 + vec2(1.0, 1.0)) * tmpvar_9);
					  tmpvar_37 = texture2D (_MainTex, P_38);
					  tmpvar_36 = (((0.2126 * tmpvar_37.x) + (0.7152 * tmpvar_37.y)) + (0.0722 * tmpvar_37.z));
					  gx_3 = (gx_3 + tmpvar_36);
					  highp float tmpvar_39;
					  lowp vec4 tmpvar_40;
					  highp vec2 P_41;
					  P_41 = ((tmpvar_15 + vec2(1.0, 1.0)) * tmpvar_9);
					  tmpvar_40 = texture2D (_MainTex, P_41);
					  tmpvar_39 = (((0.2126 * tmpvar_40.x) + (0.7152 * tmpvar_40.y)) + (0.0722 * tmpvar_40.z));
					  gy_2 = (gy_2 + tmpvar_39);
					  highp float tmpvar_42;
					  lowp vec4 tmpvar_43;
					  highp vec2 P_44;
					  P_44 = ((tmpvar_15 + vec2(0.0, -1.0)) * tmpvar_9);
					  tmpvar_43 = texture2D (_MainTex, P_44);
					  tmpvar_42 = (((0.2126 * tmpvar_43.x) + (0.7152 * tmpvar_43.y)) + (0.0722 * tmpvar_43.z));
					  gy_2 = (gy_2 + (-2.0 * tmpvar_42));
					  highp float tmpvar_45;
					  lowp vec4 tmpvar_46;
					  highp vec2 P_47;
					  P_47 = ((tmpvar_15 + vec2(-1.0, 1.0)) * tmpvar_9);
					  tmpvar_46 = texture2D (_MainTex, P_47);
					  tmpvar_45 = (((0.2126 * tmpvar_46.x) + (0.7152 * tmpvar_46.y)) + (0.0722 * tmpvar_46.z));
					  gy_2 = (gy_2 + tmpvar_45);
					  highp float tmpvar_48;
					  lowp vec4 tmpvar_49;
					  highp vec2 P_50;
					  P_50 = ((tmpvar_15 + vec2(0.0, 1.0)) * tmpvar_9);
					  tmpvar_49 = texture2D (_MainTex, P_50);
					  tmpvar_48 = (((0.2126 * tmpvar_49.x) + (0.7152 * tmpvar_49.y)) + (0.0722 * tmpvar_49.z));
					  gy_2 = (gy_2 + (2.0 * tmpvar_48));
					  highp float tmpvar_51;
					  tmpvar_51 = ((gx_3 * gx_3) + (gy_2 * gy_2));
					  g_1 = tmpvar_51;
					  res_8 = (res_8 * (1.0 - g_1));
					  lowp vec4 tmpvar_52;
					  tmpvar_52.w = 1.0;
					  tmpvar_52.xyz = res_8;
					  gl_FragData[0] = tmpvar_52;
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
					uniform 	float _Distortion;
					uniform 	vec4 _ScreenResolution;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					lowp float u_xlat10_1;
					bvec4 u_xlatb1;
					vec4 u_xlat2;
					mediump float u_xlat16_2;
					lowp vec3 u_xlat10_2;
					lowp vec3 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					lowp vec3 u_xlat10_6;
					mediump float u_xlat16_7;
					lowp float u_xlat10_8;
					lowp float u_xlat10_11;
					float u_xlat14;
					bool u_xlatb14;
					lowp float u_xlat10_18;
					float u_xlat21;
					lowp float u_xlat10_24;
					void main()
					{
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1 = min(u_xlat10_0.y, u_xlat10_0.x);
					    u_xlat10_1 = min(u_xlat10_0.z, u_xlat10_1);
					    u_xlat10_8 = max(u_xlat10_0.y, u_xlat10_0.x);
					    u_xlat10_8 = max(u_xlat10_0.z, u_xlat10_8);
					    u_xlat21 = (-u_xlat10_1) + u_xlat10_8;
					    u_xlat16_2 = float(1.0) / u_xlat10_8;
					    u_xlat2.xyz = u_xlat10_0.xyz * vec3(u_xlat16_2);
					    u_xlat10_1 = dot(u_xlat10_0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlatb1 = lessThan(vec4(u_xlat10_1), vec4(0.800000012, 0.600000024, 0.300000012, 0.150000006));
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(0.100000001<u_xlat21);
					#else
					    u_xlatb0 = 0.100000001<u_xlat21;
					#endif
					    u_xlat10_3.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : vec3(1.0, 1.0, 1.0);
					    u_xlat10_4.xyz = u_xlat10_3.xyz * vec3(0.600000024, 0.600000024, 0.600000024);
					    u_xlat10_5.xyz = u_xlat10_3.xyz * vec3(0.800000012, 0.800000012, 0.800000012);
					    u_xlat10_3.xyz = u_xlat10_3.xyz * vec3(0.300000012, 0.300000012, 0.300000012);
					    u_xlat0.xy = vs_TEXCOORD0.xy * _ScreenResolution.xy;
					    u_xlat0.x = u_xlat0.y + u_xlat0.x;
					    u_xlat0.y = vs_TEXCOORD0.x * _ScreenResolution.x + (-u_xlat0.y);
					    u_xlat14 = u_xlat0.x * 0.100000001;
					    u_xlat14 = floor(u_xlat14);
					    u_xlat14 = (-u_xlat14) * 10.0 + u_xlat0.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb14 = !!(_Distortion>=u_xlat14);
					#else
					    u_xlatb14 = _Distortion>=u_xlat14;
					#endif
					    u_xlat10_5.xyz = (bool(u_xlatb14)) ? u_xlat10_5.xyz : vec3(1.0, 1.0, 1.0);
					    u_xlat10_5.xyz = (u_xlatb1.x) ? u_xlat10_5.xyz : vec3(1.0, 1.0, 1.0);
					    u_xlat14 = u_xlat0.y * 0.100000001;
					    u_xlat14 = floor(u_xlat14);
					    u_xlat14 = (-u_xlat14) * 10.0 + u_xlat0.y;
					    u_xlat0.xy = u_xlat0.xy + vec2(-5.0, -5.0);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb14 = !!(_Distortion>=u_xlat14);
					#else
					    u_xlatb14 = _Distortion>=u_xlat14;
					#endif
					    u_xlat10_4.xyz = (bool(u_xlatb14)) ? u_xlat10_4.xyz : u_xlat10_5.xyz;
					    u_xlat10_4.xyz = (u_xlatb1.y) ? u_xlat10_4.xyz : u_xlat10_5.xyz;
					    u_xlat14 = u_xlat0.x * 0.100000001;
					    u_xlat14 = floor(u_xlat14);
					    u_xlat0.x = (-u_xlat14) * 10.0 + u_xlat0.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(_Distortion>=u_xlat0.x);
					#else
					    u_xlatb0 = _Distortion>=u_xlat0.x;
					#endif
					    u_xlat10_3.xyz = (bool(u_xlatb0)) ? u_xlat10_3.xyz : u_xlat10_4.xyz;
					    u_xlat10_3.xyz = (u_xlatb1.z) ? u_xlat10_3.xyz : u_xlat10_4.xyz;
					    u_xlat0.x = u_xlat0.y * 0.100000001;
					    u_xlat0.x = floor(u_xlat0.x);
					    u_xlat0.x = (-u_xlat0.x) * 10.0 + u_xlat0.y;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(_Distortion>=u_xlat0.x);
					#else
					    u_xlatb0 = _Distortion>=u_xlat0.x;
					#endif
					    u_xlat10_4.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : u_xlat10_3.xyz;
					    u_xlat10_3.xyz = (u_xlatb1.w) ? u_xlat10_4.xyz : u_xlat10_3.xyz;
					    u_xlat0 = vs_TEXCOORD0.xyxy * _ScreenResolution.xyxy + vec4(-1.0, -1.0, -1.0, 0.0);
					    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / _ScreenResolution.xyxy;
					    u_xlat0 = u_xlat0 * u_xlat1;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat0.xy).xyz;
					    u_xlat10_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
					    u_xlat10_24 = dot(u_xlat10_0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat10_4.x = dot(u_xlat10_2.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat0 = vs_TEXCOORD0.xyxy * _ScreenResolution.xyxy + vec4(1.0, -1.0, 1.0, 0.0);
					    u_xlat0 = u_xlat1 * u_xlat0;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat0.xy).xyz;
					    u_xlat10_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
					    u_xlat10_11 = dot(u_xlat10_0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat10_18 = dot(u_xlat10_2.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat0.x = (-u_xlat10_18) + (-u_xlat10_4.x);
					    u_xlat16_7 = u_xlat10_24 * -2.0 + (-u_xlat10_4.x);
					    u_xlat16_7 = (-u_xlat10_24) + u_xlat16_7;
					    u_xlat16_7 = u_xlat10_18 + u_xlat16_7;
					    u_xlat0.y = 2.0 * u_xlat10_11 + u_xlat16_7;
					    u_xlat2 = vs_TEXCOORD0.xyxy * _ScreenResolution.xyxy + vec4(1.0, 1.0, 0.0, -1.0);
					    u_xlat2 = u_xlat1 * u_xlat2;
					    u_xlat10_6.xyz = texture(_MainTex, u_xlat2.xy).xyz;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat2.zw).xyz;
					    u_xlat10_24 = dot(u_xlat10_2.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat10_4.x = dot(u_xlat10_6.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat0.xy = u_xlat0.xy + u_xlat10_4.xx;
					    u_xlat0.x = u_xlat10_24 * -2.0 + u_xlat0.x;
					    u_xlat2 = vs_TEXCOORD0.xyxy * _ScreenResolution.xyxy + vec4(-1.0, 1.0, 0.0, 1.0);
					    u_xlat1 = u_xlat1 * u_xlat2;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat10_6.xyz = texture(_MainTex, u_xlat1.zw).xyz;
					    u_xlat10_24 = dot(u_xlat10_6.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat10_4.x = dot(u_xlat10_2.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat0.x = u_xlat0.x + u_xlat10_4.x;
					    u_xlat0.x = 2.0 * u_xlat10_24 + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.y * u_xlat0.y + u_xlat0.x;
					    u_xlat10_24 = (-u_xlat0.x) + 1.0;
					    SV_Target0.xyz = vec3(u_xlat10_24) * u_xlat10_3.xyz;
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
					uniform 	float _Distortion;
					uniform 	vec4 _ScreenResolution;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					lowp float u_xlat10_1;
					bvec4 u_xlatb1;
					vec4 u_xlat2;
					mediump float u_xlat16_2;
					lowp vec3 u_xlat10_2;
					lowp vec3 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					lowp vec3 u_xlat10_6;
					mediump float u_xlat16_7;
					lowp float u_xlat10_8;
					lowp float u_xlat10_11;
					float u_xlat14;
					bool u_xlatb14;
					lowp float u_xlat10_18;
					float u_xlat21;
					lowp float u_xlat10_24;
					void main()
					{
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1 = min(u_xlat10_0.y, u_xlat10_0.x);
					    u_xlat10_1 = min(u_xlat10_0.z, u_xlat10_1);
					    u_xlat10_8 = max(u_xlat10_0.y, u_xlat10_0.x);
					    u_xlat10_8 = max(u_xlat10_0.z, u_xlat10_8);
					    u_xlat21 = (-u_xlat10_1) + u_xlat10_8;
					    u_xlat16_2 = float(1.0) / u_xlat10_8;
					    u_xlat2.xyz = u_xlat10_0.xyz * vec3(u_xlat16_2);
					    u_xlat10_1 = dot(u_xlat10_0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlatb1 = lessThan(vec4(u_xlat10_1), vec4(0.800000012, 0.600000024, 0.300000012, 0.150000006));
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(0.100000001<u_xlat21);
					#else
					    u_xlatb0 = 0.100000001<u_xlat21;
					#endif
					    u_xlat10_3.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : vec3(1.0, 1.0, 1.0);
					    u_xlat10_4.xyz = u_xlat10_3.xyz * vec3(0.600000024, 0.600000024, 0.600000024);
					    u_xlat10_5.xyz = u_xlat10_3.xyz * vec3(0.800000012, 0.800000012, 0.800000012);
					    u_xlat10_3.xyz = u_xlat10_3.xyz * vec3(0.300000012, 0.300000012, 0.300000012);
					    u_xlat0.xy = vs_TEXCOORD0.xy * _ScreenResolution.xy;
					    u_xlat0.x = u_xlat0.y + u_xlat0.x;
					    u_xlat0.y = vs_TEXCOORD0.x * _ScreenResolution.x + (-u_xlat0.y);
					    u_xlat14 = u_xlat0.x * 0.100000001;
					    u_xlat14 = floor(u_xlat14);
					    u_xlat14 = (-u_xlat14) * 10.0 + u_xlat0.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb14 = !!(_Distortion>=u_xlat14);
					#else
					    u_xlatb14 = _Distortion>=u_xlat14;
					#endif
					    u_xlat10_5.xyz = (bool(u_xlatb14)) ? u_xlat10_5.xyz : vec3(1.0, 1.0, 1.0);
					    u_xlat10_5.xyz = (u_xlatb1.x) ? u_xlat10_5.xyz : vec3(1.0, 1.0, 1.0);
					    u_xlat14 = u_xlat0.y * 0.100000001;
					    u_xlat14 = floor(u_xlat14);
					    u_xlat14 = (-u_xlat14) * 10.0 + u_xlat0.y;
					    u_xlat0.xy = u_xlat0.xy + vec2(-5.0, -5.0);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb14 = !!(_Distortion>=u_xlat14);
					#else
					    u_xlatb14 = _Distortion>=u_xlat14;
					#endif
					    u_xlat10_4.xyz = (bool(u_xlatb14)) ? u_xlat10_4.xyz : u_xlat10_5.xyz;
					    u_xlat10_4.xyz = (u_xlatb1.y) ? u_xlat10_4.xyz : u_xlat10_5.xyz;
					    u_xlat14 = u_xlat0.x * 0.100000001;
					    u_xlat14 = floor(u_xlat14);
					    u_xlat0.x = (-u_xlat14) * 10.0 + u_xlat0.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(_Distortion>=u_xlat0.x);
					#else
					    u_xlatb0 = _Distortion>=u_xlat0.x;
					#endif
					    u_xlat10_3.xyz = (bool(u_xlatb0)) ? u_xlat10_3.xyz : u_xlat10_4.xyz;
					    u_xlat10_3.xyz = (u_xlatb1.z) ? u_xlat10_3.xyz : u_xlat10_4.xyz;
					    u_xlat0.x = u_xlat0.y * 0.100000001;
					    u_xlat0.x = floor(u_xlat0.x);
					    u_xlat0.x = (-u_xlat0.x) * 10.0 + u_xlat0.y;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(_Distortion>=u_xlat0.x);
					#else
					    u_xlatb0 = _Distortion>=u_xlat0.x;
					#endif
					    u_xlat10_4.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : u_xlat10_3.xyz;
					    u_xlat10_3.xyz = (u_xlatb1.w) ? u_xlat10_4.xyz : u_xlat10_3.xyz;
					    u_xlat0 = vs_TEXCOORD0.xyxy * _ScreenResolution.xyxy + vec4(-1.0, -1.0, -1.0, 0.0);
					    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / _ScreenResolution.xyxy;
					    u_xlat0 = u_xlat0 * u_xlat1;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat0.xy).xyz;
					    u_xlat10_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
					    u_xlat10_24 = dot(u_xlat10_0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat10_4.x = dot(u_xlat10_2.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat0 = vs_TEXCOORD0.xyxy * _ScreenResolution.xyxy + vec4(1.0, -1.0, 1.0, 0.0);
					    u_xlat0 = u_xlat1 * u_xlat0;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat0.xy).xyz;
					    u_xlat10_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
					    u_xlat10_11 = dot(u_xlat10_0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat10_18 = dot(u_xlat10_2.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat0.x = (-u_xlat10_18) + (-u_xlat10_4.x);
					    u_xlat16_7 = u_xlat10_24 * -2.0 + (-u_xlat10_4.x);
					    u_xlat16_7 = (-u_xlat10_24) + u_xlat16_7;
					    u_xlat16_7 = u_xlat10_18 + u_xlat16_7;
					    u_xlat0.y = 2.0 * u_xlat10_11 + u_xlat16_7;
					    u_xlat2 = vs_TEXCOORD0.xyxy * _ScreenResolution.xyxy + vec4(1.0, 1.0, 0.0, -1.0);
					    u_xlat2 = u_xlat1 * u_xlat2;
					    u_xlat10_6.xyz = texture(_MainTex, u_xlat2.xy).xyz;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat2.zw).xyz;
					    u_xlat10_24 = dot(u_xlat10_2.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat10_4.x = dot(u_xlat10_6.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat0.xy = u_xlat0.xy + u_xlat10_4.xx;
					    u_xlat0.x = u_xlat10_24 * -2.0 + u_xlat0.x;
					    u_xlat2 = vs_TEXCOORD0.xyxy * _ScreenResolution.xyxy + vec4(-1.0, 1.0, 0.0, 1.0);
					    u_xlat1 = u_xlat1 * u_xlat2;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat10_6.xyz = texture(_MainTex, u_xlat1.zw).xyz;
					    u_xlat10_24 = dot(u_xlat10_6.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat10_4.x = dot(u_xlat10_2.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat0.x = u_xlat0.x + u_xlat10_4.x;
					    u_xlat0.x = 2.0 * u_xlat10_24 + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.y * u_xlat0.y + u_xlat0.x;
					    u_xlat10_24 = (-u_xlat0.x) + 1.0;
					    SV_Target0.xyz = vec3(u_xlat10_24) * u_xlat10_3.xyz;
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
					uniform 	float _Distortion;
					uniform 	vec4 _ScreenResolution;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					lowp float u_xlat10_1;
					bvec4 u_xlatb1;
					vec4 u_xlat2;
					mediump float u_xlat16_2;
					lowp vec3 u_xlat10_2;
					lowp vec3 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					lowp vec3 u_xlat10_6;
					mediump float u_xlat16_7;
					lowp float u_xlat10_8;
					lowp float u_xlat10_11;
					float u_xlat14;
					bool u_xlatb14;
					lowp float u_xlat10_18;
					float u_xlat21;
					lowp float u_xlat10_24;
					void main()
					{
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1 = min(u_xlat10_0.y, u_xlat10_0.x);
					    u_xlat10_1 = min(u_xlat10_0.z, u_xlat10_1);
					    u_xlat10_8 = max(u_xlat10_0.y, u_xlat10_0.x);
					    u_xlat10_8 = max(u_xlat10_0.z, u_xlat10_8);
					    u_xlat21 = (-u_xlat10_1) + u_xlat10_8;
					    u_xlat16_2 = float(1.0) / u_xlat10_8;
					    u_xlat2.xyz = u_xlat10_0.xyz * vec3(u_xlat16_2);
					    u_xlat10_1 = dot(u_xlat10_0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlatb1 = lessThan(vec4(u_xlat10_1), vec4(0.800000012, 0.600000024, 0.300000012, 0.150000006));
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(0.100000001<u_xlat21);
					#else
					    u_xlatb0 = 0.100000001<u_xlat21;
					#endif
					    u_xlat10_3.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : vec3(1.0, 1.0, 1.0);
					    u_xlat10_4.xyz = u_xlat10_3.xyz * vec3(0.600000024, 0.600000024, 0.600000024);
					    u_xlat10_5.xyz = u_xlat10_3.xyz * vec3(0.800000012, 0.800000012, 0.800000012);
					    u_xlat10_3.xyz = u_xlat10_3.xyz * vec3(0.300000012, 0.300000012, 0.300000012);
					    u_xlat0.xy = vs_TEXCOORD0.xy * _ScreenResolution.xy;
					    u_xlat0.x = u_xlat0.y + u_xlat0.x;
					    u_xlat0.y = vs_TEXCOORD0.x * _ScreenResolution.x + (-u_xlat0.y);
					    u_xlat14 = u_xlat0.x * 0.100000001;
					    u_xlat14 = floor(u_xlat14);
					    u_xlat14 = (-u_xlat14) * 10.0 + u_xlat0.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb14 = !!(_Distortion>=u_xlat14);
					#else
					    u_xlatb14 = _Distortion>=u_xlat14;
					#endif
					    u_xlat10_5.xyz = (bool(u_xlatb14)) ? u_xlat10_5.xyz : vec3(1.0, 1.0, 1.0);
					    u_xlat10_5.xyz = (u_xlatb1.x) ? u_xlat10_5.xyz : vec3(1.0, 1.0, 1.0);
					    u_xlat14 = u_xlat0.y * 0.100000001;
					    u_xlat14 = floor(u_xlat14);
					    u_xlat14 = (-u_xlat14) * 10.0 + u_xlat0.y;
					    u_xlat0.xy = u_xlat0.xy + vec2(-5.0, -5.0);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb14 = !!(_Distortion>=u_xlat14);
					#else
					    u_xlatb14 = _Distortion>=u_xlat14;
					#endif
					    u_xlat10_4.xyz = (bool(u_xlatb14)) ? u_xlat10_4.xyz : u_xlat10_5.xyz;
					    u_xlat10_4.xyz = (u_xlatb1.y) ? u_xlat10_4.xyz : u_xlat10_5.xyz;
					    u_xlat14 = u_xlat0.x * 0.100000001;
					    u_xlat14 = floor(u_xlat14);
					    u_xlat0.x = (-u_xlat14) * 10.0 + u_xlat0.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(_Distortion>=u_xlat0.x);
					#else
					    u_xlatb0 = _Distortion>=u_xlat0.x;
					#endif
					    u_xlat10_3.xyz = (bool(u_xlatb0)) ? u_xlat10_3.xyz : u_xlat10_4.xyz;
					    u_xlat10_3.xyz = (u_xlatb1.z) ? u_xlat10_3.xyz : u_xlat10_4.xyz;
					    u_xlat0.x = u_xlat0.y * 0.100000001;
					    u_xlat0.x = floor(u_xlat0.x);
					    u_xlat0.x = (-u_xlat0.x) * 10.0 + u_xlat0.y;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(_Distortion>=u_xlat0.x);
					#else
					    u_xlatb0 = _Distortion>=u_xlat0.x;
					#endif
					    u_xlat10_4.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : u_xlat10_3.xyz;
					    u_xlat10_3.xyz = (u_xlatb1.w) ? u_xlat10_4.xyz : u_xlat10_3.xyz;
					    u_xlat0 = vs_TEXCOORD0.xyxy * _ScreenResolution.xyxy + vec4(-1.0, -1.0, -1.0, 0.0);
					    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / _ScreenResolution.xyxy;
					    u_xlat0 = u_xlat0 * u_xlat1;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat0.xy).xyz;
					    u_xlat10_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
					    u_xlat10_24 = dot(u_xlat10_0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat10_4.x = dot(u_xlat10_2.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat0 = vs_TEXCOORD0.xyxy * _ScreenResolution.xyxy + vec4(1.0, -1.0, 1.0, 0.0);
					    u_xlat0 = u_xlat1 * u_xlat0;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat0.xy).xyz;
					    u_xlat10_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
					    u_xlat10_11 = dot(u_xlat10_0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat10_18 = dot(u_xlat10_2.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat0.x = (-u_xlat10_18) + (-u_xlat10_4.x);
					    u_xlat16_7 = u_xlat10_24 * -2.0 + (-u_xlat10_4.x);
					    u_xlat16_7 = (-u_xlat10_24) + u_xlat16_7;
					    u_xlat16_7 = u_xlat10_18 + u_xlat16_7;
					    u_xlat0.y = 2.0 * u_xlat10_11 + u_xlat16_7;
					    u_xlat2 = vs_TEXCOORD0.xyxy * _ScreenResolution.xyxy + vec4(1.0, 1.0, 0.0, -1.0);
					    u_xlat2 = u_xlat1 * u_xlat2;
					    u_xlat10_6.xyz = texture(_MainTex, u_xlat2.xy).xyz;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat2.zw).xyz;
					    u_xlat10_24 = dot(u_xlat10_2.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat10_4.x = dot(u_xlat10_6.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat0.xy = u_xlat0.xy + u_xlat10_4.xx;
					    u_xlat0.x = u_xlat10_24 * -2.0 + u_xlat0.x;
					    u_xlat2 = vs_TEXCOORD0.xyxy * _ScreenResolution.xyxy + vec4(-1.0, 1.0, 0.0, 1.0);
					    u_xlat1 = u_xlat1 * u_xlat2;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat10_6.xyz = texture(_MainTex, u_xlat1.zw).xyz;
					    u_xlat10_24 = dot(u_xlat10_6.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat10_4.x = dot(u_xlat10_2.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat0.x = u_xlat0.x + u_xlat10_4.x;
					    u_xlat0.x = 2.0 * u_xlat10_24 + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.y * u_xlat0.y + u_xlat0.x;
					    u_xlat10_24 = (-u_xlat0.x) + 1.0;
					    SV_Target0.xyz = vec3(u_xlat10_24) * u_xlat10_3.xyz;
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