Shader "CameraFilterPack/TV_Video3D" {
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
			GpuProgramID 14033
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 col_1;
					  highp float height_3;
					  highp vec2 p2_4;
					  highp vec2 uv_5;
					  uv_5 = xlv_TEXCOORD0;
					  uv_5 = (floor((uv_5 * 500.0)) / 500.0);
					  p2_4 = vec2(0.0, 0.0);
					  height_3 = 0.0;
					  for (highp int l_2 = 0; l_2 < 80; l_2++) {
					    highp float tmpvar_6;
					    tmpvar_6 = (uv_5.y - (float(l_2) * 0.002));
					    highp vec2 tmpvar_7;
					    tmpvar_7.x = uv_5.x;
					    tmpvar_7.y = (tmpvar_6 * 2.0);
					    highp vec2 tmpvar_8;
					    tmpvar_8 = (tmpvar_7 + vec2(0.75, 0.375));
					    highp float tmpvar_9;
					    highp vec2 p_10;
					    p_10 = (tmpvar_8 * 0.4);
					    lowp vec4 tmpvar_11;
					    tmpvar_11 = texture2D (_MainTex, p_10);
					    tmpvar_9 = (tmpvar_11.x * 0.2);
					    if (((tmpvar_6 + tmpvar_9) > uv_5.y)) {
					      p2_4 = tmpvar_8;
					      height_3 = tmpvar_9;
					    };
					  };
					  highp vec2 P_12;
					  P_12 = (p2_4 * 0.4);
					  lowp vec3 tmpvar_13;
					  tmpvar_13 = texture2D (_MainTex, P_12).xyz;
					  col_1 = tmpvar_13;
					  highp float tmpvar_14;
					  highp vec2 p_15;
					  p_15 = (p2_4 + vec2(0.0, 0.004));
					  p_15 = (p_15 * 0.4);
					  lowp vec4 tmpvar_16;
					  tmpvar_16 = texture2D (_MainTex, p_15);
					  tmpvar_14 = (tmpvar_16.x * 0.2);
					  highp float tmpvar_17;
					  highp vec2 p_18;
					  p_18 = (p2_4 - vec2(0.0, 0.004));
					  p_18 = (p_18 * 0.4);
					  lowp vec4 tmpvar_19;
					  tmpvar_19 = texture2D (_MainTex, p_18);
					  tmpvar_17 = (tmpvar_19.x * 0.2);
					  highp float tmpvar_20;
					  highp vec2 p_21;
					  p_21 = (p2_4 + vec2(0.004, 0.0));
					  p_21 = (p_21 * 0.4);
					  lowp vec4 tmpvar_22;
					  tmpvar_22 = texture2D (_MainTex, p_21);
					  tmpvar_20 = (tmpvar_22.x * 0.2);
					  highp float tmpvar_23;
					  highp vec2 p_24;
					  p_24 = (p2_4 - vec2(0.004, 0.0));
					  p_24 = (p_24 * 0.4);
					  lowp vec4 tmpvar_25;
					  tmpvar_25 = texture2D (_MainTex, p_24);
					  tmpvar_23 = (tmpvar_25.x * 0.2);
					  highp vec3 tmpvar_26;
					  tmpvar_26.x = 0.0;
					  tmpvar_26.y = 0.008;
					  tmpvar_26.z = max (0.003, (tmpvar_14 - tmpvar_17));
					  highp vec3 tmpvar_27;
					  tmpvar_27.y = 0.0;
					  tmpvar_27.x = 0.008;
					  tmpvar_27.z = max (0.003, (tmpvar_20 - tmpvar_23));
					  col_1 = (col_1 * max (0.2, dot (
					    normalize(((tmpvar_26.yzx * tmpvar_27.zxy) - (tmpvar_26.zxy * tmpvar_27.yzx)))
					  , vec3(0.7071068, 0.0, -0.7071068))));
					  highp float tmpvar_28;
					  highp vec2 p_29;
					  p_29 = (p2_4 + vec2(0.0, 0.004));
					  p_29 = (p_29 * 0.4);
					  lowp vec4 tmpvar_30;
					  tmpvar_30 = texture2D (_MainTex, p_29);
					  tmpvar_28 = (tmpvar_30.x * 0.2);
					  highp float tmpvar_31;
					  highp vec2 p_32;
					  p_32 = (p2_4 - vec2(0.0, 0.004));
					  p_32 = (p_32 * 0.4);
					  lowp vec4 tmpvar_33;
					  tmpvar_33 = texture2D (_MainTex, p_32);
					  tmpvar_31 = (tmpvar_33.x * 0.2);
					  highp float tmpvar_34;
					  highp vec2 p_35;
					  p_35 = (p2_4 + vec2(0.004, 0.0));
					  p_35 = (p_35 * 0.4);
					  lowp vec4 tmpvar_36;
					  tmpvar_36 = texture2D (_MainTex, p_35);
					  tmpvar_34 = (tmpvar_36.x * 0.2);
					  highp float tmpvar_37;
					  highp vec2 p_38;
					  p_38 = (p2_4 - vec2(0.004, 0.0));
					  p_38 = (p_38 * 0.4);
					  lowp vec4 tmpvar_39;
					  tmpvar_39 = texture2D (_MainTex, p_38);
					  tmpvar_37 = (tmpvar_39.x * 0.2);
					  highp vec3 tmpvar_40;
					  tmpvar_40.x = 0.0;
					  tmpvar_40.y = 0.008;
					  tmpvar_40.z = max (0.003, (tmpvar_28 - tmpvar_31));
					  highp vec3 tmpvar_41;
					  tmpvar_41.y = 0.0;
					  tmpvar_41.x = 0.008;
					  tmpvar_41.z = max (0.003, (tmpvar_34 - tmpvar_37));
					  col_1 = (col_1 * (1.0 + pow (
					    max (0.0, dot (normalize((
					      (tmpvar_40.yzx * tmpvar_41.zxy)
					     - 
					      (tmpvar_40.zxy * tmpvar_41.yzx)
					    )), vec3(0.7071068, 0.0, -0.7071068)))
					  , 6.0)));
					  highp vec3 tmpvar_42;
					  tmpvar_42.x = ((uv_5.x * 0.8) - 0.4);
					  tmpvar_42.y = uv_5.y;
					  tmpvar_42.z = height_3;
					  highp float tmpvar_43;
					  highp float tmpvar_44;
					  tmpvar_44 = max (0.0, sqrt(dot (tmpvar_42, tmpvar_42)));
					  tmpvar_43 = (tmpvar_44 * tmpvar_44);
					  highp vec3 tmpvar_45;
					  tmpvar_45 = ((col_1 * (1.0 - tmpvar_43)) + (vec3(0.8, 0.8, 0.8) * tmpvar_43));
					  col_1 = tmpvar_45;
					  highp vec4 tmpvar_46;
					  tmpvar_46.w = 1.0;
					  tmpvar_46.xyz = tmpvar_45;
					  gl_FragData[0] = tmpvar_46;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 col_1;
					  highp float height_3;
					  highp vec2 p2_4;
					  highp vec2 uv_5;
					  uv_5 = xlv_TEXCOORD0;
					  uv_5 = (floor((uv_5 * 500.0)) / 500.0);
					  p2_4 = vec2(0.0, 0.0);
					  height_3 = 0.0;
					  for (highp int l_2 = 0; l_2 < 80; l_2++) {
					    highp float tmpvar_6;
					    tmpvar_6 = (uv_5.y - (float(l_2) * 0.002));
					    highp vec2 tmpvar_7;
					    tmpvar_7.x = uv_5.x;
					    tmpvar_7.y = (tmpvar_6 * 2.0);
					    highp vec2 tmpvar_8;
					    tmpvar_8 = (tmpvar_7 + vec2(0.75, 0.375));
					    highp float tmpvar_9;
					    highp vec2 p_10;
					    p_10 = (tmpvar_8 * 0.4);
					    lowp vec4 tmpvar_11;
					    tmpvar_11 = texture2D (_MainTex, p_10);
					    tmpvar_9 = (tmpvar_11.x * 0.2);
					    if (((tmpvar_6 + tmpvar_9) > uv_5.y)) {
					      p2_4 = tmpvar_8;
					      height_3 = tmpvar_9;
					    };
					  };
					  highp vec2 P_12;
					  P_12 = (p2_4 * 0.4);
					  lowp vec3 tmpvar_13;
					  tmpvar_13 = texture2D (_MainTex, P_12).xyz;
					  col_1 = tmpvar_13;
					  highp float tmpvar_14;
					  highp vec2 p_15;
					  p_15 = (p2_4 + vec2(0.0, 0.004));
					  p_15 = (p_15 * 0.4);
					  lowp vec4 tmpvar_16;
					  tmpvar_16 = texture2D (_MainTex, p_15);
					  tmpvar_14 = (tmpvar_16.x * 0.2);
					  highp float tmpvar_17;
					  highp vec2 p_18;
					  p_18 = (p2_4 - vec2(0.0, 0.004));
					  p_18 = (p_18 * 0.4);
					  lowp vec4 tmpvar_19;
					  tmpvar_19 = texture2D (_MainTex, p_18);
					  tmpvar_17 = (tmpvar_19.x * 0.2);
					  highp float tmpvar_20;
					  highp vec2 p_21;
					  p_21 = (p2_4 + vec2(0.004, 0.0));
					  p_21 = (p_21 * 0.4);
					  lowp vec4 tmpvar_22;
					  tmpvar_22 = texture2D (_MainTex, p_21);
					  tmpvar_20 = (tmpvar_22.x * 0.2);
					  highp float tmpvar_23;
					  highp vec2 p_24;
					  p_24 = (p2_4 - vec2(0.004, 0.0));
					  p_24 = (p_24 * 0.4);
					  lowp vec4 tmpvar_25;
					  tmpvar_25 = texture2D (_MainTex, p_24);
					  tmpvar_23 = (tmpvar_25.x * 0.2);
					  highp vec3 tmpvar_26;
					  tmpvar_26.x = 0.0;
					  tmpvar_26.y = 0.008;
					  tmpvar_26.z = max (0.003, (tmpvar_14 - tmpvar_17));
					  highp vec3 tmpvar_27;
					  tmpvar_27.y = 0.0;
					  tmpvar_27.x = 0.008;
					  tmpvar_27.z = max (0.003, (tmpvar_20 - tmpvar_23));
					  col_1 = (col_1 * max (0.2, dot (
					    normalize(((tmpvar_26.yzx * tmpvar_27.zxy) - (tmpvar_26.zxy * tmpvar_27.yzx)))
					  , vec3(0.7071068, 0.0, -0.7071068))));
					  highp float tmpvar_28;
					  highp vec2 p_29;
					  p_29 = (p2_4 + vec2(0.0, 0.004));
					  p_29 = (p_29 * 0.4);
					  lowp vec4 tmpvar_30;
					  tmpvar_30 = texture2D (_MainTex, p_29);
					  tmpvar_28 = (tmpvar_30.x * 0.2);
					  highp float tmpvar_31;
					  highp vec2 p_32;
					  p_32 = (p2_4 - vec2(0.0, 0.004));
					  p_32 = (p_32 * 0.4);
					  lowp vec4 tmpvar_33;
					  tmpvar_33 = texture2D (_MainTex, p_32);
					  tmpvar_31 = (tmpvar_33.x * 0.2);
					  highp float tmpvar_34;
					  highp vec2 p_35;
					  p_35 = (p2_4 + vec2(0.004, 0.0));
					  p_35 = (p_35 * 0.4);
					  lowp vec4 tmpvar_36;
					  tmpvar_36 = texture2D (_MainTex, p_35);
					  tmpvar_34 = (tmpvar_36.x * 0.2);
					  highp float tmpvar_37;
					  highp vec2 p_38;
					  p_38 = (p2_4 - vec2(0.004, 0.0));
					  p_38 = (p_38 * 0.4);
					  lowp vec4 tmpvar_39;
					  tmpvar_39 = texture2D (_MainTex, p_38);
					  tmpvar_37 = (tmpvar_39.x * 0.2);
					  highp vec3 tmpvar_40;
					  tmpvar_40.x = 0.0;
					  tmpvar_40.y = 0.008;
					  tmpvar_40.z = max (0.003, (tmpvar_28 - tmpvar_31));
					  highp vec3 tmpvar_41;
					  tmpvar_41.y = 0.0;
					  tmpvar_41.x = 0.008;
					  tmpvar_41.z = max (0.003, (tmpvar_34 - tmpvar_37));
					  col_1 = (col_1 * (1.0 + pow (
					    max (0.0, dot (normalize((
					      (tmpvar_40.yzx * tmpvar_41.zxy)
					     - 
					      (tmpvar_40.zxy * tmpvar_41.yzx)
					    )), vec3(0.7071068, 0.0, -0.7071068)))
					  , 6.0)));
					  highp vec3 tmpvar_42;
					  tmpvar_42.x = ((uv_5.x * 0.8) - 0.4);
					  tmpvar_42.y = uv_5.y;
					  tmpvar_42.z = height_3;
					  highp float tmpvar_43;
					  highp float tmpvar_44;
					  tmpvar_44 = max (0.0, sqrt(dot (tmpvar_42, tmpvar_42)));
					  tmpvar_43 = (tmpvar_44 * tmpvar_44);
					  highp vec3 tmpvar_45;
					  tmpvar_45 = ((col_1 * (1.0 - tmpvar_43)) + (vec3(0.8, 0.8, 0.8) * tmpvar_43));
					  col_1 = tmpvar_45;
					  highp vec4 tmpvar_46;
					  tmpvar_46.w = 1.0;
					  tmpvar_46.xyz = tmpvar_45;
					  gl_FragData[0] = tmpvar_46;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 col_1;
					  highp float height_3;
					  highp vec2 p2_4;
					  highp vec2 uv_5;
					  uv_5 = xlv_TEXCOORD0;
					  uv_5 = (floor((uv_5 * 500.0)) / 500.0);
					  p2_4 = vec2(0.0, 0.0);
					  height_3 = 0.0;
					  for (highp int l_2 = 0; l_2 < 80; l_2++) {
					    highp float tmpvar_6;
					    tmpvar_6 = (uv_5.y - (float(l_2) * 0.002));
					    highp vec2 tmpvar_7;
					    tmpvar_7.x = uv_5.x;
					    tmpvar_7.y = (tmpvar_6 * 2.0);
					    highp vec2 tmpvar_8;
					    tmpvar_8 = (tmpvar_7 + vec2(0.75, 0.375));
					    highp float tmpvar_9;
					    highp vec2 p_10;
					    p_10 = (tmpvar_8 * 0.4);
					    lowp vec4 tmpvar_11;
					    tmpvar_11 = texture2D (_MainTex, p_10);
					    tmpvar_9 = (tmpvar_11.x * 0.2);
					    if (((tmpvar_6 + tmpvar_9) > uv_5.y)) {
					      p2_4 = tmpvar_8;
					      height_3 = tmpvar_9;
					    };
					  };
					  highp vec2 P_12;
					  P_12 = (p2_4 * 0.4);
					  lowp vec3 tmpvar_13;
					  tmpvar_13 = texture2D (_MainTex, P_12).xyz;
					  col_1 = tmpvar_13;
					  highp float tmpvar_14;
					  highp vec2 p_15;
					  p_15 = (p2_4 + vec2(0.0, 0.004));
					  p_15 = (p_15 * 0.4);
					  lowp vec4 tmpvar_16;
					  tmpvar_16 = texture2D (_MainTex, p_15);
					  tmpvar_14 = (tmpvar_16.x * 0.2);
					  highp float tmpvar_17;
					  highp vec2 p_18;
					  p_18 = (p2_4 - vec2(0.0, 0.004));
					  p_18 = (p_18 * 0.4);
					  lowp vec4 tmpvar_19;
					  tmpvar_19 = texture2D (_MainTex, p_18);
					  tmpvar_17 = (tmpvar_19.x * 0.2);
					  highp float tmpvar_20;
					  highp vec2 p_21;
					  p_21 = (p2_4 + vec2(0.004, 0.0));
					  p_21 = (p_21 * 0.4);
					  lowp vec4 tmpvar_22;
					  tmpvar_22 = texture2D (_MainTex, p_21);
					  tmpvar_20 = (tmpvar_22.x * 0.2);
					  highp float tmpvar_23;
					  highp vec2 p_24;
					  p_24 = (p2_4 - vec2(0.004, 0.0));
					  p_24 = (p_24 * 0.4);
					  lowp vec4 tmpvar_25;
					  tmpvar_25 = texture2D (_MainTex, p_24);
					  tmpvar_23 = (tmpvar_25.x * 0.2);
					  highp vec3 tmpvar_26;
					  tmpvar_26.x = 0.0;
					  tmpvar_26.y = 0.008;
					  tmpvar_26.z = max (0.003, (tmpvar_14 - tmpvar_17));
					  highp vec3 tmpvar_27;
					  tmpvar_27.y = 0.0;
					  tmpvar_27.x = 0.008;
					  tmpvar_27.z = max (0.003, (tmpvar_20 - tmpvar_23));
					  col_1 = (col_1 * max (0.2, dot (
					    normalize(((tmpvar_26.yzx * tmpvar_27.zxy) - (tmpvar_26.zxy * tmpvar_27.yzx)))
					  , vec3(0.7071068, 0.0, -0.7071068))));
					  highp float tmpvar_28;
					  highp vec2 p_29;
					  p_29 = (p2_4 + vec2(0.0, 0.004));
					  p_29 = (p_29 * 0.4);
					  lowp vec4 tmpvar_30;
					  tmpvar_30 = texture2D (_MainTex, p_29);
					  tmpvar_28 = (tmpvar_30.x * 0.2);
					  highp float tmpvar_31;
					  highp vec2 p_32;
					  p_32 = (p2_4 - vec2(0.0, 0.004));
					  p_32 = (p_32 * 0.4);
					  lowp vec4 tmpvar_33;
					  tmpvar_33 = texture2D (_MainTex, p_32);
					  tmpvar_31 = (tmpvar_33.x * 0.2);
					  highp float tmpvar_34;
					  highp vec2 p_35;
					  p_35 = (p2_4 + vec2(0.004, 0.0));
					  p_35 = (p_35 * 0.4);
					  lowp vec4 tmpvar_36;
					  tmpvar_36 = texture2D (_MainTex, p_35);
					  tmpvar_34 = (tmpvar_36.x * 0.2);
					  highp float tmpvar_37;
					  highp vec2 p_38;
					  p_38 = (p2_4 - vec2(0.004, 0.0));
					  p_38 = (p_38 * 0.4);
					  lowp vec4 tmpvar_39;
					  tmpvar_39 = texture2D (_MainTex, p_38);
					  tmpvar_37 = (tmpvar_39.x * 0.2);
					  highp vec3 tmpvar_40;
					  tmpvar_40.x = 0.0;
					  tmpvar_40.y = 0.008;
					  tmpvar_40.z = max (0.003, (tmpvar_28 - tmpvar_31));
					  highp vec3 tmpvar_41;
					  tmpvar_41.y = 0.0;
					  tmpvar_41.x = 0.008;
					  tmpvar_41.z = max (0.003, (tmpvar_34 - tmpvar_37));
					  col_1 = (col_1 * (1.0 + pow (
					    max (0.0, dot (normalize((
					      (tmpvar_40.yzx * tmpvar_41.zxy)
					     - 
					      (tmpvar_40.zxy * tmpvar_41.yzx)
					    )), vec3(0.7071068, 0.0, -0.7071068)))
					  , 6.0)));
					  highp vec3 tmpvar_42;
					  tmpvar_42.x = ((uv_5.x * 0.8) - 0.4);
					  tmpvar_42.y = uv_5.y;
					  tmpvar_42.z = height_3;
					  highp float tmpvar_43;
					  highp float tmpvar_44;
					  tmpvar_44 = max (0.0, sqrt(dot (tmpvar_42, tmpvar_42)));
					  tmpvar_43 = (tmpvar_44 * tmpvar_44);
					  highp vec3 tmpvar_45;
					  tmpvar_45 = ((col_1 * (1.0 - tmpvar_43)) + (vec3(0.8, 0.8, 0.8) * tmpvar_43));
					  col_1 = tmpvar_45;
					  highp vec4 tmpvar_46;
					  tmpvar_46.w = 1.0;
					  tmpvar_46.xyz = tmpvar_45;
					  gl_FragData[0] = tmpvar_46;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump float u_xlat16_0;
					lowp float u_xlat10_0;
					int u_xlati0;
					vec4 u_xlat1;
					lowp vec3 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat5;
					vec2 u_xlat11;
					lowp float u_xlat10_11;
					float u_xlat15;
					mediump float u_xlat16_15;
					lowp float u_xlat10_15;
					bool u_xlatb15;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD0.xyx * vec3(500.0, 500.0, 500.0);
					    u_xlat0.xyz = floor(u_xlat0.xyz);
					    u_xlat1.xy = u_xlat0.xy * vec2(0.00200000009, 0.00200000009);
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    u_xlat2.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<80 ; u_xlati_loop_1++)
					    {
					        u_xlat15 = float(u_xlati_loop_1);
					        u_xlat15 = (-u_xlat15) * 0.00200000009 + u_xlat1.y;
					        u_xlat1.w = u_xlat15 + u_xlat15;
					        u_xlat3.xy = u_xlat1.xw + vec2(0.75, 0.375);
					        u_xlat11.xy = u_xlat3.xy * vec2(0.400000006, 0.400000006);
					        u_xlat10_11 = texture(_MainTex, u_xlat11.xy).x;
					        u_xlat3.z = u_xlat10_11 * 0.200000003;
					        u_xlat15 = u_xlat10_11 * 0.200000003 + u_xlat15;
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb15 = !!(u_xlat1.y<u_xlat15);
					#else
					        u_xlatb15 = u_xlat1.y<u_xlat15;
					#endif
					        u_xlat2.xyz = (bool(u_xlatb15)) ? u_xlat3.xyz : u_xlat2.xyz;
					    }
					    u_xlat0.xw = u_xlat2.xy * vec2(0.400000006, 0.400000006);
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat0.xw).xyz;
					    u_xlat3 = u_xlat2.xyxy + vec4(0.0, 0.00400000019, -0.0, -0.00400000019);
					    u_xlat3 = u_xlat3 * vec4(0.400000006, 0.400000006, 0.400000006, 0.400000006);
					    u_xlat10_0 = texture(_MainTex, u_xlat3.xy).x;
					    u_xlat10_15 = texture(_MainTex, u_xlat3.zw).x;
					    u_xlat16_15 = u_xlat10_15 * 0.200000003;
					    u_xlat16_0 = u_xlat10_0 * 0.200000003 + (-u_xlat16_15);
					    u_xlat3.y = max(u_xlat16_0, 0.00300000003);
					    u_xlat4 = u_xlat2.xyxy + vec4(0.00400000019, 0.0, -0.00400000019, -0.0);
					    u_xlat4 = u_xlat4 * vec4(0.400000006, 0.400000006, 0.400000006, 0.400000006);
					    u_xlat10_0 = texture(_MainTex, u_xlat4.xy).x;
					    u_xlat10_15 = texture(_MainTex, u_xlat4.zw).x;
					    u_xlat16_15 = u_xlat10_15 * 0.200000003;
					    u_xlat16_0 = u_xlat10_0 * 0.200000003 + (-u_xlat16_15);
					    u_xlat3.x = max(u_xlat16_0, 0.00300000003);
					    u_xlat3.xy = u_xlat3.xy * vec2(0.00800000038, 0.00800000038);
					    u_xlat3.z = -6.40000071e-005;
					    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xw = u_xlat0.xx * u_xlat3.xz;
					    u_xlat0.x = dot(u_xlat0.xw, vec2(0.707106769, -0.707106769));
					    u_xlat15 = max(u_xlat0.x, 0.200000003);
					    u_xlat1.xyz = vec3(u_xlat15) * u_xlat10_1.xyz;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat15 = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat15 + 1.0;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlat2.xy = u_xlat0.zy * vec2(0.00160000008, 0.00200000009) + vec2(-0.400000006, 0.0);
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat5 = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = u_xlat0.x * 0.800000012;
					    SV_Target0.xyz = u_xlat1.xyz * vec3(u_xlat5) + u_xlat0.xxx;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump float u_xlat16_0;
					lowp float u_xlat10_0;
					int u_xlati0;
					vec4 u_xlat1;
					lowp vec3 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat5;
					vec2 u_xlat11;
					lowp float u_xlat10_11;
					float u_xlat15;
					mediump float u_xlat16_15;
					lowp float u_xlat10_15;
					bool u_xlatb15;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD0.xyx * vec3(500.0, 500.0, 500.0);
					    u_xlat0.xyz = floor(u_xlat0.xyz);
					    u_xlat1.xy = u_xlat0.xy * vec2(0.00200000009, 0.00200000009);
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    u_xlat2.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<80 ; u_xlati_loop_1++)
					    {
					        u_xlat15 = float(u_xlati_loop_1);
					        u_xlat15 = (-u_xlat15) * 0.00200000009 + u_xlat1.y;
					        u_xlat1.w = u_xlat15 + u_xlat15;
					        u_xlat3.xy = u_xlat1.xw + vec2(0.75, 0.375);
					        u_xlat11.xy = u_xlat3.xy * vec2(0.400000006, 0.400000006);
					        u_xlat10_11 = texture(_MainTex, u_xlat11.xy).x;
					        u_xlat3.z = u_xlat10_11 * 0.200000003;
					        u_xlat15 = u_xlat10_11 * 0.200000003 + u_xlat15;
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb15 = !!(u_xlat1.y<u_xlat15);
					#else
					        u_xlatb15 = u_xlat1.y<u_xlat15;
					#endif
					        u_xlat2.xyz = (bool(u_xlatb15)) ? u_xlat3.xyz : u_xlat2.xyz;
					    }
					    u_xlat0.xw = u_xlat2.xy * vec2(0.400000006, 0.400000006);
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat0.xw).xyz;
					    u_xlat3 = u_xlat2.xyxy + vec4(0.0, 0.00400000019, -0.0, -0.00400000019);
					    u_xlat3 = u_xlat3 * vec4(0.400000006, 0.400000006, 0.400000006, 0.400000006);
					    u_xlat10_0 = texture(_MainTex, u_xlat3.xy).x;
					    u_xlat10_15 = texture(_MainTex, u_xlat3.zw).x;
					    u_xlat16_15 = u_xlat10_15 * 0.200000003;
					    u_xlat16_0 = u_xlat10_0 * 0.200000003 + (-u_xlat16_15);
					    u_xlat3.y = max(u_xlat16_0, 0.00300000003);
					    u_xlat4 = u_xlat2.xyxy + vec4(0.00400000019, 0.0, -0.00400000019, -0.0);
					    u_xlat4 = u_xlat4 * vec4(0.400000006, 0.400000006, 0.400000006, 0.400000006);
					    u_xlat10_0 = texture(_MainTex, u_xlat4.xy).x;
					    u_xlat10_15 = texture(_MainTex, u_xlat4.zw).x;
					    u_xlat16_15 = u_xlat10_15 * 0.200000003;
					    u_xlat16_0 = u_xlat10_0 * 0.200000003 + (-u_xlat16_15);
					    u_xlat3.x = max(u_xlat16_0, 0.00300000003);
					    u_xlat3.xy = u_xlat3.xy * vec2(0.00800000038, 0.00800000038);
					    u_xlat3.z = -6.40000071e-005;
					    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xw = u_xlat0.xx * u_xlat3.xz;
					    u_xlat0.x = dot(u_xlat0.xw, vec2(0.707106769, -0.707106769));
					    u_xlat15 = max(u_xlat0.x, 0.200000003);
					    u_xlat1.xyz = vec3(u_xlat15) * u_xlat10_1.xyz;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat15 = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat15 + 1.0;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlat2.xy = u_xlat0.zy * vec2(0.00160000008, 0.00200000009) + vec2(-0.400000006, 0.0);
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat5 = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = u_xlat0.x * 0.800000012;
					    SV_Target0.xyz = u_xlat1.xyz * vec3(u_xlat5) + u_xlat0.xxx;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump float u_xlat16_0;
					lowp float u_xlat10_0;
					int u_xlati0;
					vec4 u_xlat1;
					lowp vec3 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat5;
					vec2 u_xlat11;
					lowp float u_xlat10_11;
					float u_xlat15;
					mediump float u_xlat16_15;
					lowp float u_xlat10_15;
					bool u_xlatb15;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD0.xyx * vec3(500.0, 500.0, 500.0);
					    u_xlat0.xyz = floor(u_xlat0.xyz);
					    u_xlat1.xy = u_xlat0.xy * vec2(0.00200000009, 0.00200000009);
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    u_xlat2.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<80 ; u_xlati_loop_1++)
					    {
					        u_xlat15 = float(u_xlati_loop_1);
					        u_xlat15 = (-u_xlat15) * 0.00200000009 + u_xlat1.y;
					        u_xlat1.w = u_xlat15 + u_xlat15;
					        u_xlat3.xy = u_xlat1.xw + vec2(0.75, 0.375);
					        u_xlat11.xy = u_xlat3.xy * vec2(0.400000006, 0.400000006);
					        u_xlat10_11 = texture(_MainTex, u_xlat11.xy).x;
					        u_xlat3.z = u_xlat10_11 * 0.200000003;
					        u_xlat15 = u_xlat10_11 * 0.200000003 + u_xlat15;
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb15 = !!(u_xlat1.y<u_xlat15);
					#else
					        u_xlatb15 = u_xlat1.y<u_xlat15;
					#endif
					        u_xlat2.xyz = (bool(u_xlatb15)) ? u_xlat3.xyz : u_xlat2.xyz;
					    }
					    u_xlat0.xw = u_xlat2.xy * vec2(0.400000006, 0.400000006);
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat0.xw).xyz;
					    u_xlat3 = u_xlat2.xyxy + vec4(0.0, 0.00400000019, -0.0, -0.00400000019);
					    u_xlat3 = u_xlat3 * vec4(0.400000006, 0.400000006, 0.400000006, 0.400000006);
					    u_xlat10_0 = texture(_MainTex, u_xlat3.xy).x;
					    u_xlat10_15 = texture(_MainTex, u_xlat3.zw).x;
					    u_xlat16_15 = u_xlat10_15 * 0.200000003;
					    u_xlat16_0 = u_xlat10_0 * 0.200000003 + (-u_xlat16_15);
					    u_xlat3.y = max(u_xlat16_0, 0.00300000003);
					    u_xlat4 = u_xlat2.xyxy + vec4(0.00400000019, 0.0, -0.00400000019, -0.0);
					    u_xlat4 = u_xlat4 * vec4(0.400000006, 0.400000006, 0.400000006, 0.400000006);
					    u_xlat10_0 = texture(_MainTex, u_xlat4.xy).x;
					    u_xlat10_15 = texture(_MainTex, u_xlat4.zw).x;
					    u_xlat16_15 = u_xlat10_15 * 0.200000003;
					    u_xlat16_0 = u_xlat10_0 * 0.200000003 + (-u_xlat16_15);
					    u_xlat3.x = max(u_xlat16_0, 0.00300000003);
					    u_xlat3.xy = u_xlat3.xy * vec2(0.00800000038, 0.00800000038);
					    u_xlat3.z = -6.40000071e-005;
					    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xw = u_xlat0.xx * u_xlat3.xz;
					    u_xlat0.x = dot(u_xlat0.xw, vec2(0.707106769, -0.707106769));
					    u_xlat15 = max(u_xlat0.x, 0.200000003);
					    u_xlat1.xyz = vec3(u_xlat15) * u_xlat10_1.xyz;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat15 = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat15 + 1.0;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlat2.xy = u_xlat0.zy * vec2(0.00160000008, 0.00200000009) + vec2(-0.400000006, 0.0);
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat5 = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = u_xlat0.x * 0.800000012;
					    SV_Target0.xyz = u_xlat1.xyz * vec3(u_xlat5) + u_xlat0.xxx;
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