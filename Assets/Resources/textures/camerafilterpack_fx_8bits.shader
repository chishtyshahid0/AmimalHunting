Shader "CameraFilterPack/FX_8bits" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(1, 10)) = 1
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 5954
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
					  highp float best1_1;
					  highp float best0_2;
					  highp vec3 dst1_3;
					  highp vec3 dst0_4;
					  highp vec3 src_5;
					  highp vec2 q_6;
					  q_6 = xlv_TEXCOORD0;
					  lowp vec3 tmpvar_7;
					  tmpvar_7 = texture2D (_MainTex, q_6).xyz;
					  src_5 = tmpvar_7;
					  dst0_4 = vec3(0.0, 0.0, 0.0);
					  dst1_3 = vec3(0.0, 0.0, 0.0);
					  best0_2 = 1000.0;
					  best1_1 = 1000.0;
					  src_5 = (src_5 + _Distortion);
					  highp vec3 tmpvar_8;
					  tmpvar_8 = (src_5 * (src_5 * src_5));
					  highp float tmpvar_9;
					  tmpvar_9 = dot (tmpvar_8, tmpvar_8);
					  if ((tmpvar_9 < 1000.0)) {
					    best1_1 = 1000.0;
					    dst1_3 = vec3(0.0, 0.0, 0.0);
					    best0_2 = tmpvar_9;
					    dst0_4 = vec3(0.0, 0.0, 0.0);
					  };
					  highp vec3 tmpvar_10;
					  tmpvar_10 = ((src_5 * (src_5 * src_5)) - vec3(0.248747, 0.0272115, 0.01792688));
					  highp float tmpvar_11;
					  tmpvar_11 = dot (tmpvar_10, tmpvar_10);
					  if ((tmpvar_11 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_11;
					    dst0_4 = vec3(0.6289063, 0.3007813, 0.2617188);
					  };
					  highp vec3 tmpvar_12;
					  tmpvar_12 = ((src_5 * (src_5 * src_5)) - vec3(0.07099009, 0.4285013, 0.4768372));
					  highp float tmpvar_13;
					  tmpvar_13 = dot (tmpvar_12, tmpvar_12);
					  if ((tmpvar_13 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_13;
					    dst0_4 = vec3(0.4140625, 0.7539063, 0.78125);
					  };
					  highp vec3 tmpvar_14;
					  tmpvar_14 = ((src_5 * (src_5 * src_5)) - vec3(0.2534108, 0.03924986, 0.2677516));
					  highp float tmpvar_15;
					  tmpvar_15 = dot (tmpvar_14, tmpvar_14);
					  if ((tmpvar_15 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_15;
					    dst0_4 = vec3(0.6328125, 0.3398438, 0.6445313);
					  };
					  highp vec3 tmpvar_16;
					  tmpvar_16 = ((src_5 * (src_5 * src_5)) - vec3(0.04641342, 0.3086161, 0.05110356));
					  highp float tmpvar_17;
					  tmpvar_17 = dot (tmpvar_16, tmpvar_16);
					  if ((tmpvar_17 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_17;
					    dst0_4 = vec3(0.359375, 0.6757813, 0.3710938);
					  };
					  highp vec3 tmpvar_18;
					  tmpvar_18 = ((src_5 * (src_5 * src_5)) - vec3(0.02938743, 0.01874161, 0.226284));
					  highp float tmpvar_19;
					  tmpvar_19 = dot (tmpvar_18, tmpvar_18);
					  if ((tmpvar_19 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_19;
					    dst0_4 = vec3(0.3085938, 0.265625, 0.609375);
					  };
					  highp vec3 tmpvar_20;
					  tmpvar_20 = ((src_5 * (src_5 * src_5)) - vec3(0.4986184, 0.584146, 0.1532646));
					  highp float tmpvar_21;
					  tmpvar_21 = dot (tmpvar_20, tmpvar_20);
					  if ((tmpvar_21 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_21;
					    dst0_4 = vec3(0.7929688, 0.8359375, 0.5351563);
					  };
					  highp vec3 tmpvar_22;
					  tmpvar_22 = ((src_5 * (src_5 * src_5)) - vec3(0.2581327, 0.06704712, 0.01162958));
					  highp float tmpvar_23;
					  tmpvar_23 = dot (tmpvar_22, tmpvar_22);
					  if ((tmpvar_23 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_23;
					    dst0_4 = vec3(0.6367188, 0.40625, 0.2265625);
					  };
					  highp vec3 tmpvar_24;
					  tmpvar_24 = ((src_5 * (src_5 * src_5)) - vec3(0.07933378, 0.03408118, 7.933378e-05));
					  highp float tmpvar_25;
					  tmpvar_25 = dot (tmpvar_24, tmpvar_24);
					  if ((tmpvar_25 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_25;
					    dst0_4 = vec3(0.4296875, 0.3242188, 0.04296875);
					  };
					  highp vec3 tmpvar_26;
					  tmpvar_26 = ((src_5 * (src_5 * src_5)) - vec3(0.5060234, 0.1220932, 0.09793234));
					  highp float tmpvar_27;
					  tmpvar_27 = dot (tmpvar_26, tmpvar_26);
					  if ((tmpvar_27 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_27;
					    dst0_4 = vec3(0.796875, 0.4960938, 0.4609375);
					  };
					  highp vec3 tmpvar_28;
					  tmpvar_28 = ((src_5 * (src_5 * src_5)) - vec3(0.05783435, 0.05783435, 0.05783435));
					  highp float tmpvar_29;
					  tmpvar_29 = dot (tmpvar_28, tmpvar_28);
					  if ((tmpvar_29 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_29;
					    dst0_4 = vec3(0.3867188, 0.3867188, 0.3867188);
					  };
					  highp vec3 tmpvar_30;
					  tmpvar_30 = ((src_5 * (src_5 * src_5)) - vec3(0.1600754, 0.1600754, 0.1600754));
					  highp float tmpvar_31;
					  tmpvar_31 = dot (tmpvar_30, tmpvar_30);
					  if ((tmpvar_31 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_31;
					    dst0_4 = vec3(0.5429688, 0.5429688, 0.5429688);
					  };
					  highp vec3 tmpvar_32;
					  tmpvar_32 = ((src_5 * (src_5 * src_5)) - vec3(0.2219603, 0.6972007, 0.2306637));
					  highp float tmpvar_33;
					  tmpvar_33 = dot (tmpvar_32, tmpvar_32);
					  if ((tmpvar_33 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_33;
					    dst0_4 = vec3(0.6054688, 0.8867188, 0.6132813);
					  };
					  highp vec3 tmpvar_34;
					  tmpvar_34 = ((src_5 * (src_5 * src_5)) - vec3(0.1566453, 0.1220932, 0.5135016));
					  highp float tmpvar_35;
					  tmpvar_35 = dot (tmpvar_34, tmpvar_34);
					  if ((tmpvar_35 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_35;
					    dst0_4 = vec3(0.5390625, 0.4960938, 0.8007813);
					  };
					  highp vec3 tmpvar_36;
					  tmpvar_36 = ((src_5 * (src_5 * src_5)) - vec3(0.3194437, 0.3194437, 0.3194437));
					  highp float tmpvar_37;
					  tmpvar_37 = dot (tmpvar_36, tmpvar_36);
					  if ((tmpvar_37 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_37;
					    dst0_4 = vec3(0.6835938, 0.6835938, 0.6835938);
					  };
					  highp vec3 tmpvar_38;
					  tmpvar_38 = ((src_5 * (src_5 * src_5)) - vec3(1.0, 1.0, 1.0));
					  highp float tmpvar_39;
					  tmpvar_39 = dot (tmpvar_38, tmpvar_38);
					  if ((tmpvar_39 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_39;
					    dst0_4 = vec3(1.0, 1.0, 1.0);
					  };
					  highp float tmpvar_40;
					  highp float x_41;
					  x_41 = (q_6.x + q_6.y);
					  tmpvar_40 = (x_41 - (floor(
					    (x_41 * 0.5)
					  ) * 2.0));
					  highp vec2 p_42;
					  p_42 = (q_6 * 0.5);
					  highp float tmpvar_43;
					  tmpvar_43 = fract(((10000.0 * 
					    sin(((17.0 * p_42.x) + (p_42.y * 0.1)))
					  ) * (0.1 + 
					    abs(sin(((p_42.y * 13.0) + p_42.x)))
					  )));
					  highp vec3 tmpvar_44;
					  if ((tmpvar_40 > ((tmpvar_43 * 0.75) + (best1_1 / 
					    (best0_2 + best1_1)
					  )))) {
					    tmpvar_44 = dst1_3;
					  } else {
					    tmpvar_44 = dst0_4;
					  };
					  highp vec4 tmpvar_45;
					  tmpvar_45.w = 1.0;
					  tmpvar_45.xyz = tmpvar_44;
					  gl_FragData[0] = tmpvar_45;
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
					  highp float best1_1;
					  highp float best0_2;
					  highp vec3 dst1_3;
					  highp vec3 dst0_4;
					  highp vec3 src_5;
					  highp vec2 q_6;
					  q_6 = xlv_TEXCOORD0;
					  lowp vec3 tmpvar_7;
					  tmpvar_7 = texture2D (_MainTex, q_6).xyz;
					  src_5 = tmpvar_7;
					  dst0_4 = vec3(0.0, 0.0, 0.0);
					  dst1_3 = vec3(0.0, 0.0, 0.0);
					  best0_2 = 1000.0;
					  best1_1 = 1000.0;
					  src_5 = (src_5 + _Distortion);
					  highp vec3 tmpvar_8;
					  tmpvar_8 = (src_5 * (src_5 * src_5));
					  highp float tmpvar_9;
					  tmpvar_9 = dot (tmpvar_8, tmpvar_8);
					  if ((tmpvar_9 < 1000.0)) {
					    best1_1 = 1000.0;
					    dst1_3 = vec3(0.0, 0.0, 0.0);
					    best0_2 = tmpvar_9;
					    dst0_4 = vec3(0.0, 0.0, 0.0);
					  };
					  highp vec3 tmpvar_10;
					  tmpvar_10 = ((src_5 * (src_5 * src_5)) - vec3(0.248747, 0.0272115, 0.01792688));
					  highp float tmpvar_11;
					  tmpvar_11 = dot (tmpvar_10, tmpvar_10);
					  if ((tmpvar_11 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_11;
					    dst0_4 = vec3(0.6289063, 0.3007813, 0.2617188);
					  };
					  highp vec3 tmpvar_12;
					  tmpvar_12 = ((src_5 * (src_5 * src_5)) - vec3(0.07099009, 0.4285013, 0.4768372));
					  highp float tmpvar_13;
					  tmpvar_13 = dot (tmpvar_12, tmpvar_12);
					  if ((tmpvar_13 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_13;
					    dst0_4 = vec3(0.4140625, 0.7539063, 0.78125);
					  };
					  highp vec3 tmpvar_14;
					  tmpvar_14 = ((src_5 * (src_5 * src_5)) - vec3(0.2534108, 0.03924986, 0.2677516));
					  highp float tmpvar_15;
					  tmpvar_15 = dot (tmpvar_14, tmpvar_14);
					  if ((tmpvar_15 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_15;
					    dst0_4 = vec3(0.6328125, 0.3398438, 0.6445313);
					  };
					  highp vec3 tmpvar_16;
					  tmpvar_16 = ((src_5 * (src_5 * src_5)) - vec3(0.04641342, 0.3086161, 0.05110356));
					  highp float tmpvar_17;
					  tmpvar_17 = dot (tmpvar_16, tmpvar_16);
					  if ((tmpvar_17 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_17;
					    dst0_4 = vec3(0.359375, 0.6757813, 0.3710938);
					  };
					  highp vec3 tmpvar_18;
					  tmpvar_18 = ((src_5 * (src_5 * src_5)) - vec3(0.02938743, 0.01874161, 0.226284));
					  highp float tmpvar_19;
					  tmpvar_19 = dot (tmpvar_18, tmpvar_18);
					  if ((tmpvar_19 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_19;
					    dst0_4 = vec3(0.3085938, 0.265625, 0.609375);
					  };
					  highp vec3 tmpvar_20;
					  tmpvar_20 = ((src_5 * (src_5 * src_5)) - vec3(0.4986184, 0.584146, 0.1532646));
					  highp float tmpvar_21;
					  tmpvar_21 = dot (tmpvar_20, tmpvar_20);
					  if ((tmpvar_21 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_21;
					    dst0_4 = vec3(0.7929688, 0.8359375, 0.5351563);
					  };
					  highp vec3 tmpvar_22;
					  tmpvar_22 = ((src_5 * (src_5 * src_5)) - vec3(0.2581327, 0.06704712, 0.01162958));
					  highp float tmpvar_23;
					  tmpvar_23 = dot (tmpvar_22, tmpvar_22);
					  if ((tmpvar_23 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_23;
					    dst0_4 = vec3(0.6367188, 0.40625, 0.2265625);
					  };
					  highp vec3 tmpvar_24;
					  tmpvar_24 = ((src_5 * (src_5 * src_5)) - vec3(0.07933378, 0.03408118, 7.933378e-05));
					  highp float tmpvar_25;
					  tmpvar_25 = dot (tmpvar_24, tmpvar_24);
					  if ((tmpvar_25 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_25;
					    dst0_4 = vec3(0.4296875, 0.3242188, 0.04296875);
					  };
					  highp vec3 tmpvar_26;
					  tmpvar_26 = ((src_5 * (src_5 * src_5)) - vec3(0.5060234, 0.1220932, 0.09793234));
					  highp float tmpvar_27;
					  tmpvar_27 = dot (tmpvar_26, tmpvar_26);
					  if ((tmpvar_27 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_27;
					    dst0_4 = vec3(0.796875, 0.4960938, 0.4609375);
					  };
					  highp vec3 tmpvar_28;
					  tmpvar_28 = ((src_5 * (src_5 * src_5)) - vec3(0.05783435, 0.05783435, 0.05783435));
					  highp float tmpvar_29;
					  tmpvar_29 = dot (tmpvar_28, tmpvar_28);
					  if ((tmpvar_29 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_29;
					    dst0_4 = vec3(0.3867188, 0.3867188, 0.3867188);
					  };
					  highp vec3 tmpvar_30;
					  tmpvar_30 = ((src_5 * (src_5 * src_5)) - vec3(0.1600754, 0.1600754, 0.1600754));
					  highp float tmpvar_31;
					  tmpvar_31 = dot (tmpvar_30, tmpvar_30);
					  if ((tmpvar_31 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_31;
					    dst0_4 = vec3(0.5429688, 0.5429688, 0.5429688);
					  };
					  highp vec3 tmpvar_32;
					  tmpvar_32 = ((src_5 * (src_5 * src_5)) - vec3(0.2219603, 0.6972007, 0.2306637));
					  highp float tmpvar_33;
					  tmpvar_33 = dot (tmpvar_32, tmpvar_32);
					  if ((tmpvar_33 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_33;
					    dst0_4 = vec3(0.6054688, 0.8867188, 0.6132813);
					  };
					  highp vec3 tmpvar_34;
					  tmpvar_34 = ((src_5 * (src_5 * src_5)) - vec3(0.1566453, 0.1220932, 0.5135016));
					  highp float tmpvar_35;
					  tmpvar_35 = dot (tmpvar_34, tmpvar_34);
					  if ((tmpvar_35 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_35;
					    dst0_4 = vec3(0.5390625, 0.4960938, 0.8007813);
					  };
					  highp vec3 tmpvar_36;
					  tmpvar_36 = ((src_5 * (src_5 * src_5)) - vec3(0.3194437, 0.3194437, 0.3194437));
					  highp float tmpvar_37;
					  tmpvar_37 = dot (tmpvar_36, tmpvar_36);
					  if ((tmpvar_37 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_37;
					    dst0_4 = vec3(0.6835938, 0.6835938, 0.6835938);
					  };
					  highp vec3 tmpvar_38;
					  tmpvar_38 = ((src_5 * (src_5 * src_5)) - vec3(1.0, 1.0, 1.0));
					  highp float tmpvar_39;
					  tmpvar_39 = dot (tmpvar_38, tmpvar_38);
					  if ((tmpvar_39 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_39;
					    dst0_4 = vec3(1.0, 1.0, 1.0);
					  };
					  highp float tmpvar_40;
					  highp float x_41;
					  x_41 = (q_6.x + q_6.y);
					  tmpvar_40 = (x_41 - (floor(
					    (x_41 * 0.5)
					  ) * 2.0));
					  highp vec2 p_42;
					  p_42 = (q_6 * 0.5);
					  highp float tmpvar_43;
					  tmpvar_43 = fract(((10000.0 * 
					    sin(((17.0 * p_42.x) + (p_42.y * 0.1)))
					  ) * (0.1 + 
					    abs(sin(((p_42.y * 13.0) + p_42.x)))
					  )));
					  highp vec3 tmpvar_44;
					  if ((tmpvar_40 > ((tmpvar_43 * 0.75) + (best1_1 / 
					    (best0_2 + best1_1)
					  )))) {
					    tmpvar_44 = dst1_3;
					  } else {
					    tmpvar_44 = dst0_4;
					  };
					  highp vec4 tmpvar_45;
					  tmpvar_45.w = 1.0;
					  tmpvar_45.xyz = tmpvar_44;
					  gl_FragData[0] = tmpvar_45;
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
					  highp float best1_1;
					  highp float best0_2;
					  highp vec3 dst1_3;
					  highp vec3 dst0_4;
					  highp vec3 src_5;
					  highp vec2 q_6;
					  q_6 = xlv_TEXCOORD0;
					  lowp vec3 tmpvar_7;
					  tmpvar_7 = texture2D (_MainTex, q_6).xyz;
					  src_5 = tmpvar_7;
					  dst0_4 = vec3(0.0, 0.0, 0.0);
					  dst1_3 = vec3(0.0, 0.0, 0.0);
					  best0_2 = 1000.0;
					  best1_1 = 1000.0;
					  src_5 = (src_5 + _Distortion);
					  highp vec3 tmpvar_8;
					  tmpvar_8 = (src_5 * (src_5 * src_5));
					  highp float tmpvar_9;
					  tmpvar_9 = dot (tmpvar_8, tmpvar_8);
					  if ((tmpvar_9 < 1000.0)) {
					    best1_1 = 1000.0;
					    dst1_3 = vec3(0.0, 0.0, 0.0);
					    best0_2 = tmpvar_9;
					    dst0_4 = vec3(0.0, 0.0, 0.0);
					  };
					  highp vec3 tmpvar_10;
					  tmpvar_10 = ((src_5 * (src_5 * src_5)) - vec3(0.248747, 0.0272115, 0.01792688));
					  highp float tmpvar_11;
					  tmpvar_11 = dot (tmpvar_10, tmpvar_10);
					  if ((tmpvar_11 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_11;
					    dst0_4 = vec3(0.6289063, 0.3007813, 0.2617188);
					  };
					  highp vec3 tmpvar_12;
					  tmpvar_12 = ((src_5 * (src_5 * src_5)) - vec3(0.07099009, 0.4285013, 0.4768372));
					  highp float tmpvar_13;
					  tmpvar_13 = dot (tmpvar_12, tmpvar_12);
					  if ((tmpvar_13 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_13;
					    dst0_4 = vec3(0.4140625, 0.7539063, 0.78125);
					  };
					  highp vec3 tmpvar_14;
					  tmpvar_14 = ((src_5 * (src_5 * src_5)) - vec3(0.2534108, 0.03924986, 0.2677516));
					  highp float tmpvar_15;
					  tmpvar_15 = dot (tmpvar_14, tmpvar_14);
					  if ((tmpvar_15 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_15;
					    dst0_4 = vec3(0.6328125, 0.3398438, 0.6445313);
					  };
					  highp vec3 tmpvar_16;
					  tmpvar_16 = ((src_5 * (src_5 * src_5)) - vec3(0.04641342, 0.3086161, 0.05110356));
					  highp float tmpvar_17;
					  tmpvar_17 = dot (tmpvar_16, tmpvar_16);
					  if ((tmpvar_17 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_17;
					    dst0_4 = vec3(0.359375, 0.6757813, 0.3710938);
					  };
					  highp vec3 tmpvar_18;
					  tmpvar_18 = ((src_5 * (src_5 * src_5)) - vec3(0.02938743, 0.01874161, 0.226284));
					  highp float tmpvar_19;
					  tmpvar_19 = dot (tmpvar_18, tmpvar_18);
					  if ((tmpvar_19 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_19;
					    dst0_4 = vec3(0.3085938, 0.265625, 0.609375);
					  };
					  highp vec3 tmpvar_20;
					  tmpvar_20 = ((src_5 * (src_5 * src_5)) - vec3(0.4986184, 0.584146, 0.1532646));
					  highp float tmpvar_21;
					  tmpvar_21 = dot (tmpvar_20, tmpvar_20);
					  if ((tmpvar_21 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_21;
					    dst0_4 = vec3(0.7929688, 0.8359375, 0.5351563);
					  };
					  highp vec3 tmpvar_22;
					  tmpvar_22 = ((src_5 * (src_5 * src_5)) - vec3(0.2581327, 0.06704712, 0.01162958));
					  highp float tmpvar_23;
					  tmpvar_23 = dot (tmpvar_22, tmpvar_22);
					  if ((tmpvar_23 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_23;
					    dst0_4 = vec3(0.6367188, 0.40625, 0.2265625);
					  };
					  highp vec3 tmpvar_24;
					  tmpvar_24 = ((src_5 * (src_5 * src_5)) - vec3(0.07933378, 0.03408118, 7.933378e-05));
					  highp float tmpvar_25;
					  tmpvar_25 = dot (tmpvar_24, tmpvar_24);
					  if ((tmpvar_25 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_25;
					    dst0_4 = vec3(0.4296875, 0.3242188, 0.04296875);
					  };
					  highp vec3 tmpvar_26;
					  tmpvar_26 = ((src_5 * (src_5 * src_5)) - vec3(0.5060234, 0.1220932, 0.09793234));
					  highp float tmpvar_27;
					  tmpvar_27 = dot (tmpvar_26, tmpvar_26);
					  if ((tmpvar_27 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_27;
					    dst0_4 = vec3(0.796875, 0.4960938, 0.4609375);
					  };
					  highp vec3 tmpvar_28;
					  tmpvar_28 = ((src_5 * (src_5 * src_5)) - vec3(0.05783435, 0.05783435, 0.05783435));
					  highp float tmpvar_29;
					  tmpvar_29 = dot (tmpvar_28, tmpvar_28);
					  if ((tmpvar_29 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_29;
					    dst0_4 = vec3(0.3867188, 0.3867188, 0.3867188);
					  };
					  highp vec3 tmpvar_30;
					  tmpvar_30 = ((src_5 * (src_5 * src_5)) - vec3(0.1600754, 0.1600754, 0.1600754));
					  highp float tmpvar_31;
					  tmpvar_31 = dot (tmpvar_30, tmpvar_30);
					  if ((tmpvar_31 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_31;
					    dst0_4 = vec3(0.5429688, 0.5429688, 0.5429688);
					  };
					  highp vec3 tmpvar_32;
					  tmpvar_32 = ((src_5 * (src_5 * src_5)) - vec3(0.2219603, 0.6972007, 0.2306637));
					  highp float tmpvar_33;
					  tmpvar_33 = dot (tmpvar_32, tmpvar_32);
					  if ((tmpvar_33 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_33;
					    dst0_4 = vec3(0.6054688, 0.8867188, 0.6132813);
					  };
					  highp vec3 tmpvar_34;
					  tmpvar_34 = ((src_5 * (src_5 * src_5)) - vec3(0.1566453, 0.1220932, 0.5135016));
					  highp float tmpvar_35;
					  tmpvar_35 = dot (tmpvar_34, tmpvar_34);
					  if ((tmpvar_35 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_35;
					    dst0_4 = vec3(0.5390625, 0.4960938, 0.8007813);
					  };
					  highp vec3 tmpvar_36;
					  tmpvar_36 = ((src_5 * (src_5 * src_5)) - vec3(0.3194437, 0.3194437, 0.3194437));
					  highp float tmpvar_37;
					  tmpvar_37 = dot (tmpvar_36, tmpvar_36);
					  if ((tmpvar_37 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_37;
					    dst0_4 = vec3(0.6835938, 0.6835938, 0.6835938);
					  };
					  highp vec3 tmpvar_38;
					  tmpvar_38 = ((src_5 * (src_5 * src_5)) - vec3(1.0, 1.0, 1.0));
					  highp float tmpvar_39;
					  tmpvar_39 = dot (tmpvar_38, tmpvar_38);
					  if ((tmpvar_39 < best0_2)) {
					    best1_1 = best0_2;
					    dst1_3 = dst0_4;
					    best0_2 = tmpvar_39;
					    dst0_4 = vec3(1.0, 1.0, 1.0);
					  };
					  highp float tmpvar_40;
					  highp float x_41;
					  x_41 = (q_6.x + q_6.y);
					  tmpvar_40 = (x_41 - (floor(
					    (x_41 * 0.5)
					  ) * 2.0));
					  highp vec2 p_42;
					  p_42 = (q_6 * 0.5);
					  highp float tmpvar_43;
					  tmpvar_43 = fract(((10000.0 * 
					    sin(((17.0 * p_42.x) + (p_42.y * 0.1)))
					  ) * (0.1 + 
					    abs(sin(((p_42.y * 13.0) + p_42.x)))
					  )));
					  highp vec3 tmpvar_44;
					  if ((tmpvar_40 > ((tmpvar_43 * 0.75) + (best1_1 / 
					    (best0_2 + best1_1)
					  )))) {
					    tmpvar_44 = dst1_3;
					  } else {
					    tmpvar_44 = dst0_4;
					  };
					  highp vec4 tmpvar_45;
					  tmpvar_45.w = 1.0;
					  tmpvar_45.xyz = tmpvar_44;
					  gl_FragData[0] = tmpvar_45;
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
					vec3 u_xlat0;
					vec3 u_xlat1;
					mediump float u_xlat16_1;
					lowp vec3 u_xlat10_1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat7;
					float u_xlat18;
					bool u_xlatb18;
					bool u_xlatb19;
					void main()
					{
					    u_xlat0.z = 1000.0;
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat1.xyz = u_xlat10_1.xyz + vec3(vec3(_Distortion, _Distortion, _Distortion));
					    u_xlat2.xyz = u_xlat1.xyz * u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat0.y = min(u_xlat18, 1000.0);
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.248746932, -0.0272114873, -0.0179268718);
					    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat3.xyz = mix(vec3(0.0, 0.0, 0.0), vec3(0.62890625, 0.30078125, 0.26171875), vec3(bvec3(u_xlatb18)));
					    u_xlat4.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.0709900856, -0.428501189, -0.476837158);
					    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.253410816, -0.0392498374, -0.267751515);
					    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb19 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb19 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb19)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = mix(vec3(0.0, 0.0, 0.0), u_xlat3.xyz, vec3(bvec3(u_xlatb18)));
					    u_xlat3.xyz = (bool(u_xlatb18)) ? vec3(0.4140625, 0.75390625, 0.78125) : u_xlat3.xyz;
					    u_xlat4.xyz = (bool(u_xlatb19)) ? u_xlat3.xyz : u_xlat4.xyz;
					    u_xlat3.xyz = (bool(u_xlatb19)) ? vec3(0.6328125, 0.33984375, 0.64453125) : u_xlat3.xyz;
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.0464134216, -0.308615983, -0.0511035323);
					    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat4.xyz;
					    u_xlat3.xyz = (bool(u_xlatb18)) ? vec3(0.359375, 0.67578125, 0.37109375) : u_xlat3.xyz;
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.0293874145, -0.0187416077, -0.226284027);
					    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat4.xyz;
					    u_xlat3.xyz = (bool(u_xlatb18)) ? vec3(0.30859375, 0.265625, 0.609375) : u_xlat3.xyz;
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.498618305, -0.584146023, -0.153264582);
					    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat4.xyz;
					    u_xlat3.xyz = (bool(u_xlatb18)) ? vec3(0.79296875, 0.8359375, 0.53515625) : u_xlat3.xyz;
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.258132637, -0.0670471191, -0.0116295815);
					    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat4.xyz;
					    u_xlat3.xyz = (bool(u_xlatb18)) ? vec3(0.63671875, 0.40625, 0.2265625) : u_xlat3.xyz;
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.0793337822, -0.034081161, -7.93337822e-005);
					    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat4.xyz;
					    u_xlat3.xyz = (bool(u_xlatb18)) ? vec3(0.4296875, 0.32421875, 0.04296875) : u_xlat3.xyz;
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.506023407, -0.122093141, -0.0979323387);
					    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat4.xyz;
					    u_xlat3.xyz = (bool(u_xlatb18)) ? vec3(0.796875, 0.49609375, 0.4609375) : u_xlat3.xyz;
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.0578343272, -0.0578343272, -0.0578343272);
					    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat4.xyz;
					    u_xlat3.xyz = (bool(u_xlatb18)) ? vec3(0.38671875, 0.38671875, 0.38671875) : u_xlat3.xyz;
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.160075366, -0.160075366, -0.160075366);
					    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat4.xyz;
					    u_xlat3.xyz = (bool(u_xlatb18)) ? vec3(0.54296875, 0.54296875, 0.54296875) : u_xlat3.xyz;
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.221960247, -0.697200477, -0.230663598);
					    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat4.xyz;
					    u_xlat3.xyz = (bool(u_xlatb18)) ? vec3(0.60546875, 0.88671875, 0.61328125) : u_xlat3.xyz;
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.156645298, -0.122093141, -0.513501465);
					    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat4.xyz;
					    u_xlat3.xyz = (bool(u_xlatb18)) ? vec3(0.5390625, 0.49609375, 0.80078125) : u_xlat3.xyz;
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.319443643, -0.319443643, -0.319443643);
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat1.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat4.xyz;
					    u_xlat2.xyz = (bool(u_xlatb18)) ? vec3(0.68359375, 0.68359375, 0.68359375) : u_xlat3.xyz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat1.x<u_xlat1.y);
					#else
					    u_xlatb18 = u_xlat1.x<u_xlat1.y;
					#endif
					    u_xlat1.xy = (bool(u_xlatb18)) ? u_xlat1.xy : u_xlat1.yz;
					    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat2.xyz : u_xlat0.xyz;
					    u_xlat2.xyz = (bool(u_xlatb18)) ? vec3(1.0, 1.0, 1.0) : u_xlat2.xyz;
					    u_xlat18 = u_xlat1.y + u_xlat1.x;
					    u_xlat18 = u_xlat1.y / u_xlat18;
					    u_xlat1.x = dot(vs_TEXCOORD0.xy, vec2(8.5, 0.0500000007));
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 10000.0;
					    u_xlat7 = dot(vs_TEXCOORD0.yx, vec2(6.5, 0.5));
					    u_xlat7 = sin(u_xlat7);
					    u_xlat7 = abs(u_xlat7) + 0.100000001;
					    u_xlat1.x = u_xlat7 * u_xlat1.x;
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat18 = u_xlat1.x * 0.75 + u_xlat18;
					    u_xlat16_1 = vs_TEXCOORD0.y + vs_TEXCOORD0.x;
					    u_xlat7 = u_xlat16_1 * 0.5;
					    u_xlat7 = floor(u_xlat7);
					    u_xlat1.x = (-u_xlat7) * 2.0 + u_xlat16_1;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat18<u_xlat1.x);
					#else
					    u_xlatb18 = u_xlat18<u_xlat1.x;
					#endif
					    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat2.xyz;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					mediump float u_xlat16_1;
					lowp vec3 u_xlat10_1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat7;
					float u_xlat18;
					bool u_xlatb18;
					bool u_xlatb19;
					void main()
					{
					    u_xlat0.z = 1000.0;
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat1.xyz = u_xlat10_1.xyz + vec3(vec3(_Distortion, _Distortion, _Distortion));
					    u_xlat2.xyz = u_xlat1.xyz * u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat0.y = min(u_xlat18, 1000.0);
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.248746932, -0.0272114873, -0.0179268718);
					    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat3.xyz = mix(vec3(0.0, 0.0, 0.0), vec3(0.62890625, 0.30078125, 0.26171875), vec3(bvec3(u_xlatb18)));
					    u_xlat4.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.0709900856, -0.428501189, -0.476837158);
					    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.253410816, -0.0392498374, -0.267751515);
					    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb19 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb19 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb19)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = mix(vec3(0.0, 0.0, 0.0), u_xlat3.xyz, vec3(bvec3(u_xlatb18)));
					    u_xlat3.xyz = (bool(u_xlatb18)) ? vec3(0.4140625, 0.75390625, 0.78125) : u_xlat3.xyz;
					    u_xlat4.xyz = (bool(u_xlatb19)) ? u_xlat3.xyz : u_xlat4.xyz;
					    u_xlat3.xyz = (bool(u_xlatb19)) ? vec3(0.6328125, 0.33984375, 0.64453125) : u_xlat3.xyz;
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.0464134216, -0.308615983, -0.0511035323);
					    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat4.xyz;
					    u_xlat3.xyz = (bool(u_xlatb18)) ? vec3(0.359375, 0.67578125, 0.37109375) : u_xlat3.xyz;
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.0293874145, -0.0187416077, -0.226284027);
					    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat4.xyz;
					    u_xlat3.xyz = (bool(u_xlatb18)) ? vec3(0.30859375, 0.265625, 0.609375) : u_xlat3.xyz;
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.498618305, -0.584146023, -0.153264582);
					    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat4.xyz;
					    u_xlat3.xyz = (bool(u_xlatb18)) ? vec3(0.79296875, 0.8359375, 0.53515625) : u_xlat3.xyz;
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.258132637, -0.0670471191, -0.0116295815);
					    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat4.xyz;
					    u_xlat3.xyz = (bool(u_xlatb18)) ? vec3(0.63671875, 0.40625, 0.2265625) : u_xlat3.xyz;
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.0793337822, -0.034081161, -7.93337822e-005);
					    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat4.xyz;
					    u_xlat3.xyz = (bool(u_xlatb18)) ? vec3(0.4296875, 0.32421875, 0.04296875) : u_xlat3.xyz;
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.506023407, -0.122093141, -0.0979323387);
					    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat4.xyz;
					    u_xlat3.xyz = (bool(u_xlatb18)) ? vec3(0.796875, 0.49609375, 0.4609375) : u_xlat3.xyz;
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.0578343272, -0.0578343272, -0.0578343272);
					    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat4.xyz;
					    u_xlat3.xyz = (bool(u_xlatb18)) ? vec3(0.38671875, 0.38671875, 0.38671875) : u_xlat3.xyz;
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.160075366, -0.160075366, -0.160075366);
					    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat4.xyz;
					    u_xlat3.xyz = (bool(u_xlatb18)) ? vec3(0.54296875, 0.54296875, 0.54296875) : u_xlat3.xyz;
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.221960247, -0.697200477, -0.230663598);
					    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat4.xyz;
					    u_xlat3.xyz = (bool(u_xlatb18)) ? vec3(0.60546875, 0.88671875, 0.61328125) : u_xlat3.xyz;
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.156645298, -0.122093141, -0.513501465);
					    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat4.xyz;
					    u_xlat3.xyz = (bool(u_xlatb18)) ? vec3(0.5390625, 0.49609375, 0.80078125) : u_xlat3.xyz;
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.319443643, -0.319443643, -0.319443643);
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat1.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat4.xyz;
					    u_xlat2.xyz = (bool(u_xlatb18)) ? vec3(0.68359375, 0.68359375, 0.68359375) : u_xlat3.xyz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat1.x<u_xlat1.y);
					#else
					    u_xlatb18 = u_xlat1.x<u_xlat1.y;
					#endif
					    u_xlat1.xy = (bool(u_xlatb18)) ? u_xlat1.xy : u_xlat1.yz;
					    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat2.xyz : u_xlat0.xyz;
					    u_xlat2.xyz = (bool(u_xlatb18)) ? vec3(1.0, 1.0, 1.0) : u_xlat2.xyz;
					    u_xlat18 = u_xlat1.y + u_xlat1.x;
					    u_xlat18 = u_xlat1.y / u_xlat18;
					    u_xlat1.x = dot(vs_TEXCOORD0.xy, vec2(8.5, 0.0500000007));
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 10000.0;
					    u_xlat7 = dot(vs_TEXCOORD0.yx, vec2(6.5, 0.5));
					    u_xlat7 = sin(u_xlat7);
					    u_xlat7 = abs(u_xlat7) + 0.100000001;
					    u_xlat1.x = u_xlat7 * u_xlat1.x;
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat18 = u_xlat1.x * 0.75 + u_xlat18;
					    u_xlat16_1 = vs_TEXCOORD0.y + vs_TEXCOORD0.x;
					    u_xlat7 = u_xlat16_1 * 0.5;
					    u_xlat7 = floor(u_xlat7);
					    u_xlat1.x = (-u_xlat7) * 2.0 + u_xlat16_1;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat18<u_xlat1.x);
					#else
					    u_xlatb18 = u_xlat18<u_xlat1.x;
					#endif
					    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat2.xyz;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					mediump float u_xlat16_1;
					lowp vec3 u_xlat10_1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat7;
					float u_xlat18;
					bool u_xlatb18;
					bool u_xlatb19;
					void main()
					{
					    u_xlat0.z = 1000.0;
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat1.xyz = u_xlat10_1.xyz + vec3(vec3(_Distortion, _Distortion, _Distortion));
					    u_xlat2.xyz = u_xlat1.xyz * u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat0.y = min(u_xlat18, 1000.0);
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.248746932, -0.0272114873, -0.0179268718);
					    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat3.xyz = mix(vec3(0.0, 0.0, 0.0), vec3(0.62890625, 0.30078125, 0.26171875), vec3(bvec3(u_xlatb18)));
					    u_xlat4.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.0709900856, -0.428501189, -0.476837158);
					    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.253410816, -0.0392498374, -0.267751515);
					    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb19 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb19 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb19)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = mix(vec3(0.0, 0.0, 0.0), u_xlat3.xyz, vec3(bvec3(u_xlatb18)));
					    u_xlat3.xyz = (bool(u_xlatb18)) ? vec3(0.4140625, 0.75390625, 0.78125) : u_xlat3.xyz;
					    u_xlat4.xyz = (bool(u_xlatb19)) ? u_xlat3.xyz : u_xlat4.xyz;
					    u_xlat3.xyz = (bool(u_xlatb19)) ? vec3(0.6328125, 0.33984375, 0.64453125) : u_xlat3.xyz;
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.0464134216, -0.308615983, -0.0511035323);
					    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat4.xyz;
					    u_xlat3.xyz = (bool(u_xlatb18)) ? vec3(0.359375, 0.67578125, 0.37109375) : u_xlat3.xyz;
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.0293874145, -0.0187416077, -0.226284027);
					    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat4.xyz;
					    u_xlat3.xyz = (bool(u_xlatb18)) ? vec3(0.30859375, 0.265625, 0.609375) : u_xlat3.xyz;
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.498618305, -0.584146023, -0.153264582);
					    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat4.xyz;
					    u_xlat3.xyz = (bool(u_xlatb18)) ? vec3(0.79296875, 0.8359375, 0.53515625) : u_xlat3.xyz;
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.258132637, -0.0670471191, -0.0116295815);
					    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat4.xyz;
					    u_xlat3.xyz = (bool(u_xlatb18)) ? vec3(0.63671875, 0.40625, 0.2265625) : u_xlat3.xyz;
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.0793337822, -0.034081161, -7.93337822e-005);
					    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat4.xyz;
					    u_xlat3.xyz = (bool(u_xlatb18)) ? vec3(0.4296875, 0.32421875, 0.04296875) : u_xlat3.xyz;
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.506023407, -0.122093141, -0.0979323387);
					    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat4.xyz;
					    u_xlat3.xyz = (bool(u_xlatb18)) ? vec3(0.796875, 0.49609375, 0.4609375) : u_xlat3.xyz;
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.0578343272, -0.0578343272, -0.0578343272);
					    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat4.xyz;
					    u_xlat3.xyz = (bool(u_xlatb18)) ? vec3(0.38671875, 0.38671875, 0.38671875) : u_xlat3.xyz;
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.160075366, -0.160075366, -0.160075366);
					    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat4.xyz;
					    u_xlat3.xyz = (bool(u_xlatb18)) ? vec3(0.54296875, 0.54296875, 0.54296875) : u_xlat3.xyz;
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.221960247, -0.697200477, -0.230663598);
					    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat4.xyz;
					    u_xlat3.xyz = (bool(u_xlatb18)) ? vec3(0.60546875, 0.88671875, 0.61328125) : u_xlat3.xyz;
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.156645298, -0.122093141, -0.513501465);
					    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat0.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat4.xyz;
					    u_xlat3.xyz = (bool(u_xlatb18)) ? vec3(0.5390625, 0.49609375, 0.80078125) : u_xlat3.xyz;
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-0.319443643, -0.319443643, -0.319443643);
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x<u_xlat0.y);
					#else
					    u_xlatb18 = u_xlat0.x<u_xlat0.y;
					#endif
					    u_xlat1.yz = (bool(u_xlatb18)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat4.xyz;
					    u_xlat2.xyz = (bool(u_xlatb18)) ? vec3(0.68359375, 0.68359375, 0.68359375) : u_xlat3.xyz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat1.x<u_xlat1.y);
					#else
					    u_xlatb18 = u_xlat1.x<u_xlat1.y;
					#endif
					    u_xlat1.xy = (bool(u_xlatb18)) ? u_xlat1.xy : u_xlat1.yz;
					    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat2.xyz : u_xlat0.xyz;
					    u_xlat2.xyz = (bool(u_xlatb18)) ? vec3(1.0, 1.0, 1.0) : u_xlat2.xyz;
					    u_xlat18 = u_xlat1.y + u_xlat1.x;
					    u_xlat18 = u_xlat1.y / u_xlat18;
					    u_xlat1.x = dot(vs_TEXCOORD0.xy, vec2(8.5, 0.0500000007));
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 10000.0;
					    u_xlat7 = dot(vs_TEXCOORD0.yx, vec2(6.5, 0.5));
					    u_xlat7 = sin(u_xlat7);
					    u_xlat7 = abs(u_xlat7) + 0.100000001;
					    u_xlat1.x = u_xlat7 * u_xlat1.x;
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat18 = u_xlat1.x * 0.75 + u_xlat18;
					    u_xlat16_1 = vs_TEXCOORD0.y + vs_TEXCOORD0.x;
					    u_xlat7 = u_xlat16_1 * 0.5;
					    u_xlat7 = floor(u_xlat7);
					    u_xlat1.x = (-u_xlat7) * 2.0 + u_xlat16_1;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat18<u_xlat1.x);
					#else
					    u_xlatb18 = u_xlat18<u_xlat1.x;
					#endif
					    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat2.xyz;
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