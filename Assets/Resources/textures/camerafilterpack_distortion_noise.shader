Shader "CameraFilterPack/Distortion_Noise" {
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
			GpuProgramID 12462
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  highp vec3 tmpvar_3;
					  tmpvar_3.z = 0.0;
					  tmpvar_3.xy = (uv_2 * 10.0);
					  lowp vec4 o3_4;
					  lowp vec4 k4_5;
					  lowp vec4 k3_6;
					  lowp vec4 c_7;
					  lowp vec4 k2_8;
					  lowp vec4 k1_9;
					  lowp vec4 b_10;
					  highp vec3 d_11;
					  highp vec3 tmpvar_12;
					  tmpvar_12 = floor(tmpvar_3);
					  highp vec3 tmpvar_13;
					  tmpvar_13 = (tmpvar_3 - tmpvar_12);
					  d_11 = ((tmpvar_13 * tmpvar_13) * (3.0 - (2.0 * tmpvar_13)));
					  highp vec4 tmpvar_14;
					  tmpvar_14 = (tmpvar_12.xxyy + vec4(0.0, 1.0, 0.0, 1.0));
					  b_10 = tmpvar_14;
					  mediump vec4 x_15;
					  x_15 = b_10.xyxy;
					  mediump vec4 tmpvar_16;
					  mediump vec4 x_17;
					  x_17 = (((x_15 * 34.0) + 1.0) * x_15);
					  tmpvar_16 = (x_17 - (floor(
					    (x_17 * 0.0034602)
					  ) * 289.0));
					  k1_9 = tmpvar_16;
					  mediump vec4 x_18;
					  x_18 = (k1_9.xyxy + b_10.zzww);
					  mediump vec4 tmpvar_19;
					  mediump vec4 x_20;
					  x_20 = (((x_18 * 34.0) + 1.0) * x_18);
					  tmpvar_19 = (x_20 - (floor(
					    (x_20 * 0.0034602)
					  ) * 289.0));
					  k2_8 = tmpvar_19;
					  highp vec4 tmpvar_21;
					  tmpvar_21 = (k2_8 + tmpvar_12.zzzz);
					  c_7 = tmpvar_21;
					  mediump vec4 x_22;
					  x_22 = c_7;
					  mediump vec4 tmpvar_23;
					  mediump vec4 x_24;
					  x_24 = (((x_22 * 34.0) + 1.0) * x_22);
					  tmpvar_23 = (x_24 - (floor(
					    (x_24 * 0.0034602)
					  ) * 289.0));
					  k3_6 = tmpvar_23;
					  mediump vec4 x_25;
					  x_25 = (c_7 + 1.0);
					  mediump vec4 tmpvar_26;
					  mediump vec4 x_27;
					  x_27 = (((x_25 * 34.0) + 1.0) * x_25);
					  tmpvar_26 = (x_27 - (floor(
					    (x_27 * 0.0034602)
					  ) * 289.0));
					  k4_5 = tmpvar_26;
					  lowp vec4 tmpvar_28;
					  tmpvar_28 = fract((k3_6 * 0.0243902));
					  lowp vec4 tmpvar_29;
					  tmpvar_29 = fract((k4_5 * 0.0243902));
					  highp vec4 tmpvar_30;
					  tmpvar_30 = ((tmpvar_29 * d_11.z) + (tmpvar_28 * (1.0 - d_11.z)));
					  o3_4 = tmpvar_30;
					  highp vec2 tmpvar_31;
					  tmpvar_31 = ((o3_4.yw * d_11.x) + (o3_4.xz * (1.0 - d_11.x)));
					  highp vec3 tmpvar_32;
					  tmpvar_32.z = 1.0;
					  tmpvar_32.xy = (uv_2 * 10.0);
					  lowp vec4 o3_33;
					  lowp vec4 k4_34;
					  lowp vec4 k3_35;
					  lowp vec4 c_36;
					  lowp vec4 k2_37;
					  lowp vec4 k1_38;
					  lowp vec4 b_39;
					  highp vec3 d_40;
					  highp vec3 tmpvar_41;
					  tmpvar_41 = floor(tmpvar_32);
					  highp vec3 tmpvar_42;
					  tmpvar_42 = (tmpvar_32 - tmpvar_41);
					  d_40 = ((tmpvar_42 * tmpvar_42) * (3.0 - (2.0 * tmpvar_42)));
					  highp vec4 tmpvar_43;
					  tmpvar_43 = (tmpvar_41.xxyy + vec4(0.0, 1.0, 0.0, 1.0));
					  b_39 = tmpvar_43;
					  mediump vec4 x_44;
					  x_44 = b_39.xyxy;
					  mediump vec4 tmpvar_45;
					  mediump vec4 x_46;
					  x_46 = (((x_44 * 34.0) + 1.0) * x_44);
					  tmpvar_45 = (x_46 - (floor(
					    (x_46 * 0.0034602)
					  ) * 289.0));
					  k1_38 = tmpvar_45;
					  mediump vec4 x_47;
					  x_47 = (k1_38.xyxy + b_39.zzww);
					  mediump vec4 tmpvar_48;
					  mediump vec4 x_49;
					  x_49 = (((x_47 * 34.0) + 1.0) * x_47);
					  tmpvar_48 = (x_49 - (floor(
					    (x_49 * 0.0034602)
					  ) * 289.0));
					  k2_37 = tmpvar_48;
					  highp vec4 tmpvar_50;
					  tmpvar_50 = (k2_37 + tmpvar_41.zzzz);
					  c_36 = tmpvar_50;
					  mediump vec4 x_51;
					  x_51 = c_36;
					  mediump vec4 tmpvar_52;
					  mediump vec4 x_53;
					  x_53 = (((x_51 * 34.0) + 1.0) * x_51);
					  tmpvar_52 = (x_53 - (floor(
					    (x_53 * 0.0034602)
					  ) * 289.0));
					  k3_35 = tmpvar_52;
					  mediump vec4 x_54;
					  x_54 = (c_36 + 1.0);
					  mediump vec4 tmpvar_55;
					  mediump vec4 x_56;
					  x_56 = (((x_54 * 34.0) + 1.0) * x_54);
					  tmpvar_55 = (x_56 - (floor(
					    (x_56 * 0.0034602)
					  ) * 289.0));
					  k4_34 = tmpvar_55;
					  lowp vec4 tmpvar_57;
					  tmpvar_57 = fract((k3_35 * 0.0243902));
					  lowp vec4 tmpvar_58;
					  tmpvar_58 = fract((k4_34 * 0.0243902));
					  highp vec4 tmpvar_59;
					  tmpvar_59 = ((tmpvar_58 * d_40.z) + (tmpvar_57 * (1.0 - d_40.z)));
					  o3_33 = tmpvar_59;
					  highp vec2 tmpvar_60;
					  tmpvar_60 = ((o3_33.yw * d_40.x) + (o3_33.xz * (1.0 - d_40.x)));
					  highp vec2 tmpvar_61;
					  tmpvar_61.x = ((tmpvar_31.y * d_11.y) + (tmpvar_31.x * (1.0 - d_11.y)));
					  tmpvar_61.y = ((tmpvar_60.y * d_40.y) + (tmpvar_60.x * (1.0 - d_40.y)));
					  lowp vec4 tmpvar_62;
					  highp vec2 P_63;
					  P_63 = (uv_2 + ((tmpvar_61 * 0.1) * _Distortion));
					  tmpvar_62 = texture2D (_MainTex, P_63);
					  tmpvar_1 = tmpvar_62;
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
					uniform highp float _Distortion;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  highp vec3 tmpvar_3;
					  tmpvar_3.z = 0.0;
					  tmpvar_3.xy = (uv_2 * 10.0);
					  lowp vec4 o3_4;
					  lowp vec4 k4_5;
					  lowp vec4 k3_6;
					  lowp vec4 c_7;
					  lowp vec4 k2_8;
					  lowp vec4 k1_9;
					  lowp vec4 b_10;
					  highp vec3 d_11;
					  highp vec3 tmpvar_12;
					  tmpvar_12 = floor(tmpvar_3);
					  highp vec3 tmpvar_13;
					  tmpvar_13 = (tmpvar_3 - tmpvar_12);
					  d_11 = ((tmpvar_13 * tmpvar_13) * (3.0 - (2.0 * tmpvar_13)));
					  highp vec4 tmpvar_14;
					  tmpvar_14 = (tmpvar_12.xxyy + vec4(0.0, 1.0, 0.0, 1.0));
					  b_10 = tmpvar_14;
					  mediump vec4 x_15;
					  x_15 = b_10.xyxy;
					  mediump vec4 tmpvar_16;
					  mediump vec4 x_17;
					  x_17 = (((x_15 * 34.0) + 1.0) * x_15);
					  tmpvar_16 = (x_17 - (floor(
					    (x_17 * 0.0034602)
					  ) * 289.0));
					  k1_9 = tmpvar_16;
					  mediump vec4 x_18;
					  x_18 = (k1_9.xyxy + b_10.zzww);
					  mediump vec4 tmpvar_19;
					  mediump vec4 x_20;
					  x_20 = (((x_18 * 34.0) + 1.0) * x_18);
					  tmpvar_19 = (x_20 - (floor(
					    (x_20 * 0.0034602)
					  ) * 289.0));
					  k2_8 = tmpvar_19;
					  highp vec4 tmpvar_21;
					  tmpvar_21 = (k2_8 + tmpvar_12.zzzz);
					  c_7 = tmpvar_21;
					  mediump vec4 x_22;
					  x_22 = c_7;
					  mediump vec4 tmpvar_23;
					  mediump vec4 x_24;
					  x_24 = (((x_22 * 34.0) + 1.0) * x_22);
					  tmpvar_23 = (x_24 - (floor(
					    (x_24 * 0.0034602)
					  ) * 289.0));
					  k3_6 = tmpvar_23;
					  mediump vec4 x_25;
					  x_25 = (c_7 + 1.0);
					  mediump vec4 tmpvar_26;
					  mediump vec4 x_27;
					  x_27 = (((x_25 * 34.0) + 1.0) * x_25);
					  tmpvar_26 = (x_27 - (floor(
					    (x_27 * 0.0034602)
					  ) * 289.0));
					  k4_5 = tmpvar_26;
					  lowp vec4 tmpvar_28;
					  tmpvar_28 = fract((k3_6 * 0.0243902));
					  lowp vec4 tmpvar_29;
					  tmpvar_29 = fract((k4_5 * 0.0243902));
					  highp vec4 tmpvar_30;
					  tmpvar_30 = ((tmpvar_29 * d_11.z) + (tmpvar_28 * (1.0 - d_11.z)));
					  o3_4 = tmpvar_30;
					  highp vec2 tmpvar_31;
					  tmpvar_31 = ((o3_4.yw * d_11.x) + (o3_4.xz * (1.0 - d_11.x)));
					  highp vec3 tmpvar_32;
					  tmpvar_32.z = 1.0;
					  tmpvar_32.xy = (uv_2 * 10.0);
					  lowp vec4 o3_33;
					  lowp vec4 k4_34;
					  lowp vec4 k3_35;
					  lowp vec4 c_36;
					  lowp vec4 k2_37;
					  lowp vec4 k1_38;
					  lowp vec4 b_39;
					  highp vec3 d_40;
					  highp vec3 tmpvar_41;
					  tmpvar_41 = floor(tmpvar_32);
					  highp vec3 tmpvar_42;
					  tmpvar_42 = (tmpvar_32 - tmpvar_41);
					  d_40 = ((tmpvar_42 * tmpvar_42) * (3.0 - (2.0 * tmpvar_42)));
					  highp vec4 tmpvar_43;
					  tmpvar_43 = (tmpvar_41.xxyy + vec4(0.0, 1.0, 0.0, 1.0));
					  b_39 = tmpvar_43;
					  mediump vec4 x_44;
					  x_44 = b_39.xyxy;
					  mediump vec4 tmpvar_45;
					  mediump vec4 x_46;
					  x_46 = (((x_44 * 34.0) + 1.0) * x_44);
					  tmpvar_45 = (x_46 - (floor(
					    (x_46 * 0.0034602)
					  ) * 289.0));
					  k1_38 = tmpvar_45;
					  mediump vec4 x_47;
					  x_47 = (k1_38.xyxy + b_39.zzww);
					  mediump vec4 tmpvar_48;
					  mediump vec4 x_49;
					  x_49 = (((x_47 * 34.0) + 1.0) * x_47);
					  tmpvar_48 = (x_49 - (floor(
					    (x_49 * 0.0034602)
					  ) * 289.0));
					  k2_37 = tmpvar_48;
					  highp vec4 tmpvar_50;
					  tmpvar_50 = (k2_37 + tmpvar_41.zzzz);
					  c_36 = tmpvar_50;
					  mediump vec4 x_51;
					  x_51 = c_36;
					  mediump vec4 tmpvar_52;
					  mediump vec4 x_53;
					  x_53 = (((x_51 * 34.0) + 1.0) * x_51);
					  tmpvar_52 = (x_53 - (floor(
					    (x_53 * 0.0034602)
					  ) * 289.0));
					  k3_35 = tmpvar_52;
					  mediump vec4 x_54;
					  x_54 = (c_36 + 1.0);
					  mediump vec4 tmpvar_55;
					  mediump vec4 x_56;
					  x_56 = (((x_54 * 34.0) + 1.0) * x_54);
					  tmpvar_55 = (x_56 - (floor(
					    (x_56 * 0.0034602)
					  ) * 289.0));
					  k4_34 = tmpvar_55;
					  lowp vec4 tmpvar_57;
					  tmpvar_57 = fract((k3_35 * 0.0243902));
					  lowp vec4 tmpvar_58;
					  tmpvar_58 = fract((k4_34 * 0.0243902));
					  highp vec4 tmpvar_59;
					  tmpvar_59 = ((tmpvar_58 * d_40.z) + (tmpvar_57 * (1.0 - d_40.z)));
					  o3_33 = tmpvar_59;
					  highp vec2 tmpvar_60;
					  tmpvar_60 = ((o3_33.yw * d_40.x) + (o3_33.xz * (1.0 - d_40.x)));
					  highp vec2 tmpvar_61;
					  tmpvar_61.x = ((tmpvar_31.y * d_11.y) + (tmpvar_31.x * (1.0 - d_11.y)));
					  tmpvar_61.y = ((tmpvar_60.y * d_40.y) + (tmpvar_60.x * (1.0 - d_40.y)));
					  lowp vec4 tmpvar_62;
					  highp vec2 P_63;
					  P_63 = (uv_2 + ((tmpvar_61 * 0.1) * _Distortion));
					  tmpvar_62 = texture2D (_MainTex, P_63);
					  tmpvar_1 = tmpvar_62;
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
					uniform highp float _Distortion;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  highp vec3 tmpvar_3;
					  tmpvar_3.z = 0.0;
					  tmpvar_3.xy = (uv_2 * 10.0);
					  lowp vec4 o3_4;
					  lowp vec4 k4_5;
					  lowp vec4 k3_6;
					  lowp vec4 c_7;
					  lowp vec4 k2_8;
					  lowp vec4 k1_9;
					  lowp vec4 b_10;
					  highp vec3 d_11;
					  highp vec3 tmpvar_12;
					  tmpvar_12 = floor(tmpvar_3);
					  highp vec3 tmpvar_13;
					  tmpvar_13 = (tmpvar_3 - tmpvar_12);
					  d_11 = ((tmpvar_13 * tmpvar_13) * (3.0 - (2.0 * tmpvar_13)));
					  highp vec4 tmpvar_14;
					  tmpvar_14 = (tmpvar_12.xxyy + vec4(0.0, 1.0, 0.0, 1.0));
					  b_10 = tmpvar_14;
					  mediump vec4 x_15;
					  x_15 = b_10.xyxy;
					  mediump vec4 tmpvar_16;
					  mediump vec4 x_17;
					  x_17 = (((x_15 * 34.0) + 1.0) * x_15);
					  tmpvar_16 = (x_17 - (floor(
					    (x_17 * 0.0034602)
					  ) * 289.0));
					  k1_9 = tmpvar_16;
					  mediump vec4 x_18;
					  x_18 = (k1_9.xyxy + b_10.zzww);
					  mediump vec4 tmpvar_19;
					  mediump vec4 x_20;
					  x_20 = (((x_18 * 34.0) + 1.0) * x_18);
					  tmpvar_19 = (x_20 - (floor(
					    (x_20 * 0.0034602)
					  ) * 289.0));
					  k2_8 = tmpvar_19;
					  highp vec4 tmpvar_21;
					  tmpvar_21 = (k2_8 + tmpvar_12.zzzz);
					  c_7 = tmpvar_21;
					  mediump vec4 x_22;
					  x_22 = c_7;
					  mediump vec4 tmpvar_23;
					  mediump vec4 x_24;
					  x_24 = (((x_22 * 34.0) + 1.0) * x_22);
					  tmpvar_23 = (x_24 - (floor(
					    (x_24 * 0.0034602)
					  ) * 289.0));
					  k3_6 = tmpvar_23;
					  mediump vec4 x_25;
					  x_25 = (c_7 + 1.0);
					  mediump vec4 tmpvar_26;
					  mediump vec4 x_27;
					  x_27 = (((x_25 * 34.0) + 1.0) * x_25);
					  tmpvar_26 = (x_27 - (floor(
					    (x_27 * 0.0034602)
					  ) * 289.0));
					  k4_5 = tmpvar_26;
					  lowp vec4 tmpvar_28;
					  tmpvar_28 = fract((k3_6 * 0.0243902));
					  lowp vec4 tmpvar_29;
					  tmpvar_29 = fract((k4_5 * 0.0243902));
					  highp vec4 tmpvar_30;
					  tmpvar_30 = ((tmpvar_29 * d_11.z) + (tmpvar_28 * (1.0 - d_11.z)));
					  o3_4 = tmpvar_30;
					  highp vec2 tmpvar_31;
					  tmpvar_31 = ((o3_4.yw * d_11.x) + (o3_4.xz * (1.0 - d_11.x)));
					  highp vec3 tmpvar_32;
					  tmpvar_32.z = 1.0;
					  tmpvar_32.xy = (uv_2 * 10.0);
					  lowp vec4 o3_33;
					  lowp vec4 k4_34;
					  lowp vec4 k3_35;
					  lowp vec4 c_36;
					  lowp vec4 k2_37;
					  lowp vec4 k1_38;
					  lowp vec4 b_39;
					  highp vec3 d_40;
					  highp vec3 tmpvar_41;
					  tmpvar_41 = floor(tmpvar_32);
					  highp vec3 tmpvar_42;
					  tmpvar_42 = (tmpvar_32 - tmpvar_41);
					  d_40 = ((tmpvar_42 * tmpvar_42) * (3.0 - (2.0 * tmpvar_42)));
					  highp vec4 tmpvar_43;
					  tmpvar_43 = (tmpvar_41.xxyy + vec4(0.0, 1.0, 0.0, 1.0));
					  b_39 = tmpvar_43;
					  mediump vec4 x_44;
					  x_44 = b_39.xyxy;
					  mediump vec4 tmpvar_45;
					  mediump vec4 x_46;
					  x_46 = (((x_44 * 34.0) + 1.0) * x_44);
					  tmpvar_45 = (x_46 - (floor(
					    (x_46 * 0.0034602)
					  ) * 289.0));
					  k1_38 = tmpvar_45;
					  mediump vec4 x_47;
					  x_47 = (k1_38.xyxy + b_39.zzww);
					  mediump vec4 tmpvar_48;
					  mediump vec4 x_49;
					  x_49 = (((x_47 * 34.0) + 1.0) * x_47);
					  tmpvar_48 = (x_49 - (floor(
					    (x_49 * 0.0034602)
					  ) * 289.0));
					  k2_37 = tmpvar_48;
					  highp vec4 tmpvar_50;
					  tmpvar_50 = (k2_37 + tmpvar_41.zzzz);
					  c_36 = tmpvar_50;
					  mediump vec4 x_51;
					  x_51 = c_36;
					  mediump vec4 tmpvar_52;
					  mediump vec4 x_53;
					  x_53 = (((x_51 * 34.0) + 1.0) * x_51);
					  tmpvar_52 = (x_53 - (floor(
					    (x_53 * 0.0034602)
					  ) * 289.0));
					  k3_35 = tmpvar_52;
					  mediump vec4 x_54;
					  x_54 = (c_36 + 1.0);
					  mediump vec4 tmpvar_55;
					  mediump vec4 x_56;
					  x_56 = (((x_54 * 34.0) + 1.0) * x_54);
					  tmpvar_55 = (x_56 - (floor(
					    (x_56 * 0.0034602)
					  ) * 289.0));
					  k4_34 = tmpvar_55;
					  lowp vec4 tmpvar_57;
					  tmpvar_57 = fract((k3_35 * 0.0243902));
					  lowp vec4 tmpvar_58;
					  tmpvar_58 = fract((k4_34 * 0.0243902));
					  highp vec4 tmpvar_59;
					  tmpvar_59 = ((tmpvar_58 * d_40.z) + (tmpvar_57 * (1.0 - d_40.z)));
					  o3_33 = tmpvar_59;
					  highp vec2 tmpvar_60;
					  tmpvar_60 = ((o3_33.yw * d_40.x) + (o3_33.xz * (1.0 - d_40.x)));
					  highp vec2 tmpvar_61;
					  tmpvar_61.x = ((tmpvar_31.y * d_11.y) + (tmpvar_31.x * (1.0 - d_11.y)));
					  tmpvar_61.y = ((tmpvar_60.y * d_40.y) + (tmpvar_60.x * (1.0 - d_40.y)));
					  lowp vec4 tmpvar_62;
					  highp vec2 P_63;
					  P_63 = (uv_2 + ((tmpvar_61 * 0.1) * _Distortion));
					  tmpvar_62 = texture2D (_MainTex, P_63);
					  tmpvar_1 = tmpvar_62;
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
					uniform 	float _Distortion;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					mediump vec4 u_xlat16_2;
					lowp vec4 u_xlat10_2;
					mediump vec4 u_xlat16_3;
					vec2 u_xlat4;
					vec2 u_xlat5;
					vec2 u_xlat12;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(10.0, 10.0);
					    u_xlat0 = floor(u_xlat0.xxyy);
					    u_xlat1 = u_xlat0 + vec4(0.0, 1.0, 0.0, 1.0);
					    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(10.0, 10.0) + (-u_xlat0.yw);
					    u_xlat16_2 = u_xlat1.xyxy * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat16_2 = u_xlat1.xyxy * u_xlat16_2;
					    u_xlat16_3 = vec4(u_xlat16_2.z * float(0.00346020004), u_xlat16_2.w * float(0.00346020004), u_xlat16_2.z * float(0.00346020004), u_xlat16_2.w * float(0.00346020004));
					    u_xlat16_3 = floor(u_xlat16_3);
					    u_xlat16_2 = (-u_xlat16_3) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat16_2;
					    u_xlat10_1 = vec4(u_xlat1.z + u_xlat16_2.x, u_xlat1.z + u_xlat16_2.y, u_xlat1.w + u_xlat16_2.z, u_xlat1.w + u_xlat16_2.w);
					    u_xlat16_2 = u_xlat10_1 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat16_1 = u_xlat10_1 * u_xlat16_2;
					    u_xlat16_2 = u_xlat16_1 * vec4(0.00346020004, 0.00346020004, 0.00346020004, 0.00346020004);
					    u_xlat16_2 = floor(u_xlat16_2);
					    u_xlat16_1 = (-u_xlat16_2) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat16_1;
					    u_xlat16_2 = u_xlat16_1 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat16_2 = u_xlat16_1 * u_xlat16_2;
					    u_xlat16_1 = u_xlat16_1 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat16_3 = u_xlat16_2 * vec4(0.00346020004, 0.00346020004, 0.00346020004, 0.00346020004);
					    u_xlat16_3 = floor(u_xlat16_3);
					    u_xlat16_2 = (-u_xlat16_3) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat16_2;
					    u_xlat10_2 = u_xlat16_2 * vec4(0.0243902002, 0.0243902002, 0.0243902002, 0.0243902002);
					    u_xlat10_2 = fract(u_xlat10_2);
					    u_xlat12.xy = u_xlat0.xy * u_xlat0.xy;
					    u_xlat0.xy = (-u_xlat0.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
					    u_xlat4.xy = (-u_xlat12.xy) * u_xlat0.xy + vec2(1.0, 1.0);
					    u_xlat0.xy = u_xlat0.xy * u_xlat12.xy;
					    u_xlat12.xy = u_xlat10_2.xz * u_xlat4.xx;
					    u_xlat12.xy = u_xlat10_2.yw * u_xlat0.xx + u_xlat12.xy;
					    u_xlat12.x = u_xlat4.y * u_xlat12.x;
					    u_xlat5.x = u_xlat12.y * u_xlat0.y + u_xlat12.x;
					    u_xlat16_2 = u_xlat16_1 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat16_1 = u_xlat16_1 * u_xlat16_2;
					    u_xlat16_2 = u_xlat16_1 * vec4(0.00346020004, 0.00346020004, 0.00346020004, 0.00346020004);
					    u_xlat16_2 = floor(u_xlat16_2);
					    u_xlat16_1 = (-u_xlat16_2) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat16_1;
					    u_xlat10_1 = u_xlat16_1 * vec4(0.0243902002, 0.0243902002, 0.0243902002, 0.0243902002);
					    u_xlat10_1 = fract(u_xlat10_1);
					    u_xlat12.xy = u_xlat4.xx * u_xlat10_1.xz;
					    u_xlat0.xz = u_xlat10_1.yw * u_xlat0.xx + u_xlat12.xy;
					    u_xlat0.x = u_xlat4.y * u_xlat0.x;
					    u_xlat5.y = u_xlat0.z * u_xlat0.y + u_xlat0.x;
					    u_xlat0.xy = u_xlat5.xy * vec2(vec2(_Distortion, _Distortion));
					    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + vs_TEXCOORD0.xy;
					    SV_Target0 = texture(_MainTex, u_xlat0.xy);
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					mediump vec4 u_xlat16_2;
					lowp vec4 u_xlat10_2;
					mediump vec4 u_xlat16_3;
					vec2 u_xlat4;
					vec2 u_xlat5;
					vec2 u_xlat12;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(10.0, 10.0);
					    u_xlat0 = floor(u_xlat0.xxyy);
					    u_xlat1 = u_xlat0 + vec4(0.0, 1.0, 0.0, 1.0);
					    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(10.0, 10.0) + (-u_xlat0.yw);
					    u_xlat16_2 = u_xlat1.xyxy * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat16_2 = u_xlat1.xyxy * u_xlat16_2;
					    u_xlat16_3 = vec4(u_xlat16_2.z * float(0.00346020004), u_xlat16_2.w * float(0.00346020004), u_xlat16_2.z * float(0.00346020004), u_xlat16_2.w * float(0.00346020004));
					    u_xlat16_3 = floor(u_xlat16_3);
					    u_xlat16_2 = (-u_xlat16_3) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat16_2;
					    u_xlat10_1 = vec4(u_xlat1.z + u_xlat16_2.x, u_xlat1.z + u_xlat16_2.y, u_xlat1.w + u_xlat16_2.z, u_xlat1.w + u_xlat16_2.w);
					    u_xlat16_2 = u_xlat10_1 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat16_1 = u_xlat10_1 * u_xlat16_2;
					    u_xlat16_2 = u_xlat16_1 * vec4(0.00346020004, 0.00346020004, 0.00346020004, 0.00346020004);
					    u_xlat16_2 = floor(u_xlat16_2);
					    u_xlat16_1 = (-u_xlat16_2) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat16_1;
					    u_xlat16_2 = u_xlat16_1 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat16_2 = u_xlat16_1 * u_xlat16_2;
					    u_xlat16_1 = u_xlat16_1 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat16_3 = u_xlat16_2 * vec4(0.00346020004, 0.00346020004, 0.00346020004, 0.00346020004);
					    u_xlat16_3 = floor(u_xlat16_3);
					    u_xlat16_2 = (-u_xlat16_3) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat16_2;
					    u_xlat10_2 = u_xlat16_2 * vec4(0.0243902002, 0.0243902002, 0.0243902002, 0.0243902002);
					    u_xlat10_2 = fract(u_xlat10_2);
					    u_xlat12.xy = u_xlat0.xy * u_xlat0.xy;
					    u_xlat0.xy = (-u_xlat0.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
					    u_xlat4.xy = (-u_xlat12.xy) * u_xlat0.xy + vec2(1.0, 1.0);
					    u_xlat0.xy = u_xlat0.xy * u_xlat12.xy;
					    u_xlat12.xy = u_xlat10_2.xz * u_xlat4.xx;
					    u_xlat12.xy = u_xlat10_2.yw * u_xlat0.xx + u_xlat12.xy;
					    u_xlat12.x = u_xlat4.y * u_xlat12.x;
					    u_xlat5.x = u_xlat12.y * u_xlat0.y + u_xlat12.x;
					    u_xlat16_2 = u_xlat16_1 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat16_1 = u_xlat16_1 * u_xlat16_2;
					    u_xlat16_2 = u_xlat16_1 * vec4(0.00346020004, 0.00346020004, 0.00346020004, 0.00346020004);
					    u_xlat16_2 = floor(u_xlat16_2);
					    u_xlat16_1 = (-u_xlat16_2) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat16_1;
					    u_xlat10_1 = u_xlat16_1 * vec4(0.0243902002, 0.0243902002, 0.0243902002, 0.0243902002);
					    u_xlat10_1 = fract(u_xlat10_1);
					    u_xlat12.xy = u_xlat4.xx * u_xlat10_1.xz;
					    u_xlat0.xz = u_xlat10_1.yw * u_xlat0.xx + u_xlat12.xy;
					    u_xlat0.x = u_xlat4.y * u_xlat0.x;
					    u_xlat5.y = u_xlat0.z * u_xlat0.y + u_xlat0.x;
					    u_xlat0.xy = u_xlat5.xy * vec2(vec2(_Distortion, _Distortion));
					    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + vs_TEXCOORD0.xy;
					    SV_Target0 = texture(_MainTex, u_xlat0.xy);
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					mediump vec4 u_xlat16_2;
					lowp vec4 u_xlat10_2;
					mediump vec4 u_xlat16_3;
					vec2 u_xlat4;
					vec2 u_xlat5;
					vec2 u_xlat12;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(10.0, 10.0);
					    u_xlat0 = floor(u_xlat0.xxyy);
					    u_xlat1 = u_xlat0 + vec4(0.0, 1.0, 0.0, 1.0);
					    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(10.0, 10.0) + (-u_xlat0.yw);
					    u_xlat16_2 = u_xlat1.xyxy * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat16_2 = u_xlat1.xyxy * u_xlat16_2;
					    u_xlat16_3 = vec4(u_xlat16_2.z * float(0.00346020004), u_xlat16_2.w * float(0.00346020004), u_xlat16_2.z * float(0.00346020004), u_xlat16_2.w * float(0.00346020004));
					    u_xlat16_3 = floor(u_xlat16_3);
					    u_xlat16_2 = (-u_xlat16_3) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat16_2;
					    u_xlat10_1 = vec4(u_xlat1.z + u_xlat16_2.x, u_xlat1.z + u_xlat16_2.y, u_xlat1.w + u_xlat16_2.z, u_xlat1.w + u_xlat16_2.w);
					    u_xlat16_2 = u_xlat10_1 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat16_1 = u_xlat10_1 * u_xlat16_2;
					    u_xlat16_2 = u_xlat16_1 * vec4(0.00346020004, 0.00346020004, 0.00346020004, 0.00346020004);
					    u_xlat16_2 = floor(u_xlat16_2);
					    u_xlat16_1 = (-u_xlat16_2) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat16_1;
					    u_xlat16_2 = u_xlat16_1 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat16_2 = u_xlat16_1 * u_xlat16_2;
					    u_xlat16_1 = u_xlat16_1 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat16_3 = u_xlat16_2 * vec4(0.00346020004, 0.00346020004, 0.00346020004, 0.00346020004);
					    u_xlat16_3 = floor(u_xlat16_3);
					    u_xlat16_2 = (-u_xlat16_3) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat16_2;
					    u_xlat10_2 = u_xlat16_2 * vec4(0.0243902002, 0.0243902002, 0.0243902002, 0.0243902002);
					    u_xlat10_2 = fract(u_xlat10_2);
					    u_xlat12.xy = u_xlat0.xy * u_xlat0.xy;
					    u_xlat0.xy = (-u_xlat0.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
					    u_xlat4.xy = (-u_xlat12.xy) * u_xlat0.xy + vec2(1.0, 1.0);
					    u_xlat0.xy = u_xlat0.xy * u_xlat12.xy;
					    u_xlat12.xy = u_xlat10_2.xz * u_xlat4.xx;
					    u_xlat12.xy = u_xlat10_2.yw * u_xlat0.xx + u_xlat12.xy;
					    u_xlat12.x = u_xlat4.y * u_xlat12.x;
					    u_xlat5.x = u_xlat12.y * u_xlat0.y + u_xlat12.x;
					    u_xlat16_2 = u_xlat16_1 * vec4(34.0, 34.0, 34.0, 34.0) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat16_1 = u_xlat16_1 * u_xlat16_2;
					    u_xlat16_2 = u_xlat16_1 * vec4(0.00346020004, 0.00346020004, 0.00346020004, 0.00346020004);
					    u_xlat16_2 = floor(u_xlat16_2);
					    u_xlat16_1 = (-u_xlat16_2) * vec4(289.0, 289.0, 289.0, 289.0) + u_xlat16_1;
					    u_xlat10_1 = u_xlat16_1 * vec4(0.0243902002, 0.0243902002, 0.0243902002, 0.0243902002);
					    u_xlat10_1 = fract(u_xlat10_1);
					    u_xlat12.xy = u_xlat4.xx * u_xlat10_1.xz;
					    u_xlat0.xz = u_xlat10_1.yw * u_xlat0.xx + u_xlat12.xy;
					    u_xlat0.x = u_xlat4.y * u_xlat0.x;
					    u_xlat5.y = u_xlat0.z * u_xlat0.y + u_xlat0.x;
					    u_xlat0.xy = u_xlat5.xy * vec2(vec2(_Distortion, _Distortion));
					    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + vs_TEXCOORD0.xy;
					    SV_Target0 = texture(_MainTex, u_xlat0.xy);
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