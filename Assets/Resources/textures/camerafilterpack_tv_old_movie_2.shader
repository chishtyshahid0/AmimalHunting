Shader "CameraFilterPack/TV_Old_Movie_2" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(1, 10)) = 1
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 49557
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
					uniform highp float _Value;
					uniform highp float _Value2;
					uniform highp float _Value3;
					uniform highp float _Value4;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp float vI_1;
					  highp vec3 oldImage_2;
					  highp vec3 image_3;
					  highp vec2 uv_4;
					  uv_4 = xlv_TEXCOORD0;
					  highp float tmpvar_5;
					  tmpvar_5 = float(int((_TimeX * _Value)));
					  highp vec2 tmpvar_6;
					  tmpvar_6.y = 1.0;
					  tmpvar_6.x = tmpvar_5;
					  highp vec2 tmpvar_7;
					  tmpvar_7.y = 1.0;
					  tmpvar_7.x = (tmpvar_5 + 23.0);
					  highp vec2 tmpvar_8;
					  tmpvar_8.x = fract((sin(
					    dot (tmpvar_6, vec2(12.9898, 78.233))
					  ) * 43758.55));
					  tmpvar_8.y = fract((sin(
					    dot (tmpvar_7, vec2(12.9898, 78.233))
					  ) * 43758.55));
					  highp vec2 tmpvar_9;
					  tmpvar_9 = (uv_4 + (0.002 * tmpvar_8));
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, tmpvar_9).xyz;
					  image_3 = tmpvar_10;
					  highp vec3 tmpvar_11;
					  tmpvar_11.z = 0.7;
					  highp float tmpvar_12;
					  tmpvar_12 = (0.7 + _Value3);
					  tmpvar_11.x = tmpvar_12;
					  tmpvar_11.y = (0.7 + (_Value3 / 2.0));
					  highp vec3 tmpvar_13;
					  tmpvar_13.z = 0.7;
					  tmpvar_13.x = tmpvar_12;
					  tmpvar_13.y = (0.7 + (_Value3 / 8.0));
					  oldImage_2 = (((
					    (dot (vec3(0.2126, 0.7152, 0.0722), image_3) * tmpvar_11)
					   * _Value2) * tmpvar_13) * _Value2);
					  highp vec2 tmpvar_14;
					  tmpvar_14.y = 1.0;
					  tmpvar_14.x = (tmpvar_5 + 8.0);
					  highp float tmpvar_15;
					  tmpvar_15 = fract((sin(
					    dot (tmpvar_14, vec2(12.9898, 78.233))
					  ) * 43758.55));
					  vI_1 = ((16.0 * (
					    ((uv_4.x * (1.0 - uv_4.x)) * uv_4.y)
					   * 
					    (1.0 - uv_4.y)
					  )) * mix (0.7, 1.0, (tmpvar_15 + 0.5)));
					  vI_1 = (vI_1 + (1.0 + (0.4 * tmpvar_15)));
					  vI_1 = (vI_1 * pow ((
					    (((16.0 * uv_4.x) * (1.0 - uv_4.x)) * uv_4.y)
					   * 
					    (1.0 - uv_4.y)
					  ), 0.4));
					  highp int tmpvar_16;
					  tmpvar_16 = int((8.0 * tmpvar_15));
					  if ((0 < tmpvar_16)) {
					    highp float l_17;
					    highp vec2 tmpvar_18;
					    tmpvar_18.y = 1.0;
					    tmpvar_18.x = (7.0 + tmpvar_5);
					    highp float tmpvar_19;
					    tmpvar_19 = fract((sin(
					      dot (tmpvar_18, vec2(12.9898, 78.233))
					    ) * 43758.55));
					    highp float tmpvar_20;
					    tmpvar_20 = (0.01 * tmpvar_19);
					    highp float tmpvar_21;
					    tmpvar_21 = (tmpvar_19 - 0.5);
					    if ((tmpvar_19 > 0.2)) {
					      l_17 = pow (abs((
					        ((tmpvar_19 * uv_4.x) + (tmpvar_20 * uv_4.y))
					       + tmpvar_21)), 0.125);
					    } else {
					      l_17 = (2.0 - pow (abs(
					        (((tmpvar_19 * uv_4.x) + (tmpvar_20 * uv_4.y)) + tmpvar_21)
					      ), 0.125));
					    };
					    vI_1 = (vI_1 * mix ((0.5 - _Value4), 1.0, l_17));
					  };
					  if ((1 < tmpvar_16)) {
					    highp float l_22;
					    highp vec2 tmpvar_23;
					    tmpvar_23.y = 1.0;
					    tmpvar_23.x = (24.0 + tmpvar_5);
					    highp float tmpvar_24;
					    tmpvar_24 = fract((sin(
					      dot (tmpvar_23, vec2(12.9898, 78.233))
					    ) * 43758.55));
					    highp float tmpvar_25;
					    tmpvar_25 = (0.01 * tmpvar_24);
					    highp float tmpvar_26;
					    tmpvar_26 = (tmpvar_24 - 0.5);
					    if ((tmpvar_24 > 0.2)) {
					      l_22 = pow (abs((
					        ((tmpvar_24 * uv_4.x) + (tmpvar_25 * uv_4.y))
					       + tmpvar_26)), 0.125);
					    } else {
					      l_22 = (2.0 - pow (abs(
					        (((tmpvar_24 * uv_4.x) + (tmpvar_25 * uv_4.y)) + tmpvar_26)
					      ), 0.125));
					    };
					    vI_1 = (vI_1 * mix ((0.5 - _Value4), 1.0, l_22));
					  };
					  highp vec2 tmpvar_27;
					  tmpvar_27.y = 1.0;
					  tmpvar_27.x = (tmpvar_5 + 18.0);
					  highp int tmpvar_28;
					  tmpvar_28 = int(max ((
					    (8.0 * fract((sin(
					      dot (tmpvar_27, vec2(12.9898, 78.233))
					    ) * 43758.55)))
					   - 2.0), 0.0));
					  if ((0 < tmpvar_28)) {
					    highp float seed_29;
					    seed_29 = (tmpvar_5 + 6.0);
					    highp float v_30;
					    highp vec2 tmpvar_31;
					    tmpvar_31.y = 1.0;
					    tmpvar_31.x = seed_29;
					    highp float tmpvar_32;
					    tmpvar_32 = fract((sin(
					      dot (tmpvar_31, vec2(12.9898, 78.233))
					    ) * 43758.55));
					    highp vec2 tmpvar_33;
					    tmpvar_33.y = 1.0;
					    tmpvar_33.x = (seed_29 + 1.0);
					    highp vec2 tmpvar_34;
					    tmpvar_34.y = 1.0;
					    tmpvar_34.x = (seed_29 + 2.0);
					    highp float tmpvar_35;
					    tmpvar_35 = (0.01 * fract((
					      sin(dot (tmpvar_34, vec2(12.9898, 78.233)))
					     * 43758.55)));
					    highp vec2 tmpvar_36;
					    tmpvar_36.x = tmpvar_32;
					    tmpvar_36.y = fract((sin(
					      dot (tmpvar_33, vec2(12.9898, 78.233))
					    ) * 43758.55));
					    highp vec2 tmpvar_37;
					    tmpvar_37 = (tmpvar_36 - uv_4);
					    highp float y_over_x_38;
					    y_over_x_38 = (tmpvar_37.y / tmpvar_37.x);
					    highp float tmpvar_39;
					    tmpvar_39 = (min (abs(y_over_x_38), 1.0) / max (abs(y_over_x_38), 1.0));
					    highp float tmpvar_40;
					    tmpvar_40 = (tmpvar_39 * tmpvar_39);
					    tmpvar_40 = (((
					      ((((
					        ((((-0.01213232 * tmpvar_40) + 0.05368138) * tmpvar_40) - 0.1173503)
					       * tmpvar_40) + 0.1938925) * tmpvar_40) - 0.3326756)
					     * tmpvar_40) + 0.9999793) * tmpvar_39);
					    tmpvar_40 = (tmpvar_40 + (float(
					      (abs(y_over_x_38) > 1.0)
					    ) * (
					      (tmpvar_40 * -2.0)
					     + 1.570796)));
					    v_30 = 1.0;
					    highp float tmpvar_41;
					    tmpvar_41 = ((tmpvar_35 * tmpvar_35) * ((
					      sin(((6.2831 * (tmpvar_40 * 
					        sign(y_over_x_38)
					      )) * tmpvar_32))
					     * 0.1) + 1.0));
					    highp float tmpvar_42;
					    tmpvar_42 = dot (tmpvar_37, tmpvar_37);
					    if ((tmpvar_42 < tmpvar_41)) {
					      v_30 = 0.2;
					    } else {
					      v_30 = pow ((dot (tmpvar_37, tmpvar_37) - tmpvar_41), 0.0625);
					    };
					    vI_1 = (vI_1 * mix ((
					      (0.3 + (0.2 * (1.0 - (tmpvar_35 / 0.02))))
					     - _Value4), 1.0, v_30));
					  };
					  if ((1 < tmpvar_28)) {
					    highp float seed_43;
					    seed_43 = (25.0 + tmpvar_5);
					    highp float v_44;
					    highp vec2 tmpvar_45;
					    tmpvar_45.y = 1.0;
					    tmpvar_45.x = seed_43;
					    highp float tmpvar_46;
					    tmpvar_46 = fract((sin(
					      dot (tmpvar_45, vec2(12.9898, 78.233))
					    ) * 43758.55));
					    highp vec2 tmpvar_47;
					    tmpvar_47.y = 1.0;
					    tmpvar_47.x = (seed_43 + 1.0);
					    highp vec2 tmpvar_48;
					    tmpvar_48.y = 1.0;
					    tmpvar_48.x = (seed_43 + 2.0);
					    highp float tmpvar_49;
					    tmpvar_49 = (0.01 * fract((
					      sin(dot (tmpvar_48, vec2(12.9898, 78.233)))
					     * 43758.55)));
					    highp vec2 tmpvar_50;
					    tmpvar_50.x = tmpvar_46;
					    tmpvar_50.y = fract((sin(
					      dot (tmpvar_47, vec2(12.9898, 78.233))
					    ) * 43758.55));
					    highp vec2 tmpvar_51;
					    tmpvar_51 = (tmpvar_50 - uv_4);
					    highp float y_over_x_52;
					    y_over_x_52 = (tmpvar_51.y / tmpvar_51.x);
					    highp float tmpvar_53;
					    tmpvar_53 = (min (abs(y_over_x_52), 1.0) / max (abs(y_over_x_52), 1.0));
					    highp float tmpvar_54;
					    tmpvar_54 = (tmpvar_53 * tmpvar_53);
					    tmpvar_54 = (((
					      ((((
					        ((((-0.01213232 * tmpvar_54) + 0.05368138) * tmpvar_54) - 0.1173503)
					       * tmpvar_54) + 0.1938925) * tmpvar_54) - 0.3326756)
					     * tmpvar_54) + 0.9999793) * tmpvar_53);
					    tmpvar_54 = (tmpvar_54 + (float(
					      (abs(y_over_x_52) > 1.0)
					    ) * (
					      (tmpvar_54 * -2.0)
					     + 1.570796)));
					    v_44 = 1.0;
					    highp float tmpvar_55;
					    tmpvar_55 = ((tmpvar_49 * tmpvar_49) * ((
					      sin(((6.2831 * (tmpvar_54 * 
					        sign(y_over_x_52)
					      )) * tmpvar_46))
					     * 0.1) + 1.0));
					    highp float tmpvar_56;
					    tmpvar_56 = dot (tmpvar_51, tmpvar_51);
					    if ((tmpvar_56 < tmpvar_55)) {
					      v_44 = 0.2;
					    } else {
					      v_44 = pow ((dot (tmpvar_51, tmpvar_51) - tmpvar_55), 0.0625);
					    };
					    vI_1 = (vI_1 * mix ((
					      (0.3 + (0.2 * (1.0 - (tmpvar_49 / 0.02))))
					     - _Value4), 1.0, v_44));
					  };
					  highp vec4 tmpvar_57;
					  tmpvar_57.w = 1.0;
					  tmpvar_57.xyz = (oldImage_2 * vI_1);
					  gl_FragData[0] = tmpvar_57;
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
					uniform highp float _Value;
					uniform highp float _Value2;
					uniform highp float _Value3;
					uniform highp float _Value4;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp float vI_1;
					  highp vec3 oldImage_2;
					  highp vec3 image_3;
					  highp vec2 uv_4;
					  uv_4 = xlv_TEXCOORD0;
					  highp float tmpvar_5;
					  tmpvar_5 = float(int((_TimeX * _Value)));
					  highp vec2 tmpvar_6;
					  tmpvar_6.y = 1.0;
					  tmpvar_6.x = tmpvar_5;
					  highp vec2 tmpvar_7;
					  tmpvar_7.y = 1.0;
					  tmpvar_7.x = (tmpvar_5 + 23.0);
					  highp vec2 tmpvar_8;
					  tmpvar_8.x = fract((sin(
					    dot (tmpvar_6, vec2(12.9898, 78.233))
					  ) * 43758.55));
					  tmpvar_8.y = fract((sin(
					    dot (tmpvar_7, vec2(12.9898, 78.233))
					  ) * 43758.55));
					  highp vec2 tmpvar_9;
					  tmpvar_9 = (uv_4 + (0.002 * tmpvar_8));
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, tmpvar_9).xyz;
					  image_3 = tmpvar_10;
					  highp vec3 tmpvar_11;
					  tmpvar_11.z = 0.7;
					  highp float tmpvar_12;
					  tmpvar_12 = (0.7 + _Value3);
					  tmpvar_11.x = tmpvar_12;
					  tmpvar_11.y = (0.7 + (_Value3 / 2.0));
					  highp vec3 tmpvar_13;
					  tmpvar_13.z = 0.7;
					  tmpvar_13.x = tmpvar_12;
					  tmpvar_13.y = (0.7 + (_Value3 / 8.0));
					  oldImage_2 = (((
					    (dot (vec3(0.2126, 0.7152, 0.0722), image_3) * tmpvar_11)
					   * _Value2) * tmpvar_13) * _Value2);
					  highp vec2 tmpvar_14;
					  tmpvar_14.y = 1.0;
					  tmpvar_14.x = (tmpvar_5 + 8.0);
					  highp float tmpvar_15;
					  tmpvar_15 = fract((sin(
					    dot (tmpvar_14, vec2(12.9898, 78.233))
					  ) * 43758.55));
					  vI_1 = ((16.0 * (
					    ((uv_4.x * (1.0 - uv_4.x)) * uv_4.y)
					   * 
					    (1.0 - uv_4.y)
					  )) * mix (0.7, 1.0, (tmpvar_15 + 0.5)));
					  vI_1 = (vI_1 + (1.0 + (0.4 * tmpvar_15)));
					  vI_1 = (vI_1 * pow ((
					    (((16.0 * uv_4.x) * (1.0 - uv_4.x)) * uv_4.y)
					   * 
					    (1.0 - uv_4.y)
					  ), 0.4));
					  highp int tmpvar_16;
					  tmpvar_16 = int((8.0 * tmpvar_15));
					  if ((0 < tmpvar_16)) {
					    highp float l_17;
					    highp vec2 tmpvar_18;
					    tmpvar_18.y = 1.0;
					    tmpvar_18.x = (7.0 + tmpvar_5);
					    highp float tmpvar_19;
					    tmpvar_19 = fract((sin(
					      dot (tmpvar_18, vec2(12.9898, 78.233))
					    ) * 43758.55));
					    highp float tmpvar_20;
					    tmpvar_20 = (0.01 * tmpvar_19);
					    highp float tmpvar_21;
					    tmpvar_21 = (tmpvar_19 - 0.5);
					    if ((tmpvar_19 > 0.2)) {
					      l_17 = pow (abs((
					        ((tmpvar_19 * uv_4.x) + (tmpvar_20 * uv_4.y))
					       + tmpvar_21)), 0.125);
					    } else {
					      l_17 = (2.0 - pow (abs(
					        (((tmpvar_19 * uv_4.x) + (tmpvar_20 * uv_4.y)) + tmpvar_21)
					      ), 0.125));
					    };
					    vI_1 = (vI_1 * mix ((0.5 - _Value4), 1.0, l_17));
					  };
					  if ((1 < tmpvar_16)) {
					    highp float l_22;
					    highp vec2 tmpvar_23;
					    tmpvar_23.y = 1.0;
					    tmpvar_23.x = (24.0 + tmpvar_5);
					    highp float tmpvar_24;
					    tmpvar_24 = fract((sin(
					      dot (tmpvar_23, vec2(12.9898, 78.233))
					    ) * 43758.55));
					    highp float tmpvar_25;
					    tmpvar_25 = (0.01 * tmpvar_24);
					    highp float tmpvar_26;
					    tmpvar_26 = (tmpvar_24 - 0.5);
					    if ((tmpvar_24 > 0.2)) {
					      l_22 = pow (abs((
					        ((tmpvar_24 * uv_4.x) + (tmpvar_25 * uv_4.y))
					       + tmpvar_26)), 0.125);
					    } else {
					      l_22 = (2.0 - pow (abs(
					        (((tmpvar_24 * uv_4.x) + (tmpvar_25 * uv_4.y)) + tmpvar_26)
					      ), 0.125));
					    };
					    vI_1 = (vI_1 * mix ((0.5 - _Value4), 1.0, l_22));
					  };
					  highp vec2 tmpvar_27;
					  tmpvar_27.y = 1.0;
					  tmpvar_27.x = (tmpvar_5 + 18.0);
					  highp int tmpvar_28;
					  tmpvar_28 = int(max ((
					    (8.0 * fract((sin(
					      dot (tmpvar_27, vec2(12.9898, 78.233))
					    ) * 43758.55)))
					   - 2.0), 0.0));
					  if ((0 < tmpvar_28)) {
					    highp float seed_29;
					    seed_29 = (tmpvar_5 + 6.0);
					    highp float v_30;
					    highp vec2 tmpvar_31;
					    tmpvar_31.y = 1.0;
					    tmpvar_31.x = seed_29;
					    highp float tmpvar_32;
					    tmpvar_32 = fract((sin(
					      dot (tmpvar_31, vec2(12.9898, 78.233))
					    ) * 43758.55));
					    highp vec2 tmpvar_33;
					    tmpvar_33.y = 1.0;
					    tmpvar_33.x = (seed_29 + 1.0);
					    highp vec2 tmpvar_34;
					    tmpvar_34.y = 1.0;
					    tmpvar_34.x = (seed_29 + 2.0);
					    highp float tmpvar_35;
					    tmpvar_35 = (0.01 * fract((
					      sin(dot (tmpvar_34, vec2(12.9898, 78.233)))
					     * 43758.55)));
					    highp vec2 tmpvar_36;
					    tmpvar_36.x = tmpvar_32;
					    tmpvar_36.y = fract((sin(
					      dot (tmpvar_33, vec2(12.9898, 78.233))
					    ) * 43758.55));
					    highp vec2 tmpvar_37;
					    tmpvar_37 = (tmpvar_36 - uv_4);
					    highp float y_over_x_38;
					    y_over_x_38 = (tmpvar_37.y / tmpvar_37.x);
					    highp float tmpvar_39;
					    tmpvar_39 = (min (abs(y_over_x_38), 1.0) / max (abs(y_over_x_38), 1.0));
					    highp float tmpvar_40;
					    tmpvar_40 = (tmpvar_39 * tmpvar_39);
					    tmpvar_40 = (((
					      ((((
					        ((((-0.01213232 * tmpvar_40) + 0.05368138) * tmpvar_40) - 0.1173503)
					       * tmpvar_40) + 0.1938925) * tmpvar_40) - 0.3326756)
					     * tmpvar_40) + 0.9999793) * tmpvar_39);
					    tmpvar_40 = (tmpvar_40 + (float(
					      (abs(y_over_x_38) > 1.0)
					    ) * (
					      (tmpvar_40 * -2.0)
					     + 1.570796)));
					    v_30 = 1.0;
					    highp float tmpvar_41;
					    tmpvar_41 = ((tmpvar_35 * tmpvar_35) * ((
					      sin(((6.2831 * (tmpvar_40 * 
					        sign(y_over_x_38)
					      )) * tmpvar_32))
					     * 0.1) + 1.0));
					    highp float tmpvar_42;
					    tmpvar_42 = dot (tmpvar_37, tmpvar_37);
					    if ((tmpvar_42 < tmpvar_41)) {
					      v_30 = 0.2;
					    } else {
					      v_30 = pow ((dot (tmpvar_37, tmpvar_37) - tmpvar_41), 0.0625);
					    };
					    vI_1 = (vI_1 * mix ((
					      (0.3 + (0.2 * (1.0 - (tmpvar_35 / 0.02))))
					     - _Value4), 1.0, v_30));
					  };
					  if ((1 < tmpvar_28)) {
					    highp float seed_43;
					    seed_43 = (25.0 + tmpvar_5);
					    highp float v_44;
					    highp vec2 tmpvar_45;
					    tmpvar_45.y = 1.0;
					    tmpvar_45.x = seed_43;
					    highp float tmpvar_46;
					    tmpvar_46 = fract((sin(
					      dot (tmpvar_45, vec2(12.9898, 78.233))
					    ) * 43758.55));
					    highp vec2 tmpvar_47;
					    tmpvar_47.y = 1.0;
					    tmpvar_47.x = (seed_43 + 1.0);
					    highp vec2 tmpvar_48;
					    tmpvar_48.y = 1.0;
					    tmpvar_48.x = (seed_43 + 2.0);
					    highp float tmpvar_49;
					    tmpvar_49 = (0.01 * fract((
					      sin(dot (tmpvar_48, vec2(12.9898, 78.233)))
					     * 43758.55)));
					    highp vec2 tmpvar_50;
					    tmpvar_50.x = tmpvar_46;
					    tmpvar_50.y = fract((sin(
					      dot (tmpvar_47, vec2(12.9898, 78.233))
					    ) * 43758.55));
					    highp vec2 tmpvar_51;
					    tmpvar_51 = (tmpvar_50 - uv_4);
					    highp float y_over_x_52;
					    y_over_x_52 = (tmpvar_51.y / tmpvar_51.x);
					    highp float tmpvar_53;
					    tmpvar_53 = (min (abs(y_over_x_52), 1.0) / max (abs(y_over_x_52), 1.0));
					    highp float tmpvar_54;
					    tmpvar_54 = (tmpvar_53 * tmpvar_53);
					    tmpvar_54 = (((
					      ((((
					        ((((-0.01213232 * tmpvar_54) + 0.05368138) * tmpvar_54) - 0.1173503)
					       * tmpvar_54) + 0.1938925) * tmpvar_54) - 0.3326756)
					     * tmpvar_54) + 0.9999793) * tmpvar_53);
					    tmpvar_54 = (tmpvar_54 + (float(
					      (abs(y_over_x_52) > 1.0)
					    ) * (
					      (tmpvar_54 * -2.0)
					     + 1.570796)));
					    v_44 = 1.0;
					    highp float tmpvar_55;
					    tmpvar_55 = ((tmpvar_49 * tmpvar_49) * ((
					      sin(((6.2831 * (tmpvar_54 * 
					        sign(y_over_x_52)
					      )) * tmpvar_46))
					     * 0.1) + 1.0));
					    highp float tmpvar_56;
					    tmpvar_56 = dot (tmpvar_51, tmpvar_51);
					    if ((tmpvar_56 < tmpvar_55)) {
					      v_44 = 0.2;
					    } else {
					      v_44 = pow ((dot (tmpvar_51, tmpvar_51) - tmpvar_55), 0.0625);
					    };
					    vI_1 = (vI_1 * mix ((
					      (0.3 + (0.2 * (1.0 - (tmpvar_49 / 0.02))))
					     - _Value4), 1.0, v_44));
					  };
					  highp vec4 tmpvar_57;
					  tmpvar_57.w = 1.0;
					  tmpvar_57.xyz = (oldImage_2 * vI_1);
					  gl_FragData[0] = tmpvar_57;
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
					uniform highp float _Value;
					uniform highp float _Value2;
					uniform highp float _Value3;
					uniform highp float _Value4;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp float vI_1;
					  highp vec3 oldImage_2;
					  highp vec3 image_3;
					  highp vec2 uv_4;
					  uv_4 = xlv_TEXCOORD0;
					  highp float tmpvar_5;
					  tmpvar_5 = float(int((_TimeX * _Value)));
					  highp vec2 tmpvar_6;
					  tmpvar_6.y = 1.0;
					  tmpvar_6.x = tmpvar_5;
					  highp vec2 tmpvar_7;
					  tmpvar_7.y = 1.0;
					  tmpvar_7.x = (tmpvar_5 + 23.0);
					  highp vec2 tmpvar_8;
					  tmpvar_8.x = fract((sin(
					    dot (tmpvar_6, vec2(12.9898, 78.233))
					  ) * 43758.55));
					  tmpvar_8.y = fract((sin(
					    dot (tmpvar_7, vec2(12.9898, 78.233))
					  ) * 43758.55));
					  highp vec2 tmpvar_9;
					  tmpvar_9 = (uv_4 + (0.002 * tmpvar_8));
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, tmpvar_9).xyz;
					  image_3 = tmpvar_10;
					  highp vec3 tmpvar_11;
					  tmpvar_11.z = 0.7;
					  highp float tmpvar_12;
					  tmpvar_12 = (0.7 + _Value3);
					  tmpvar_11.x = tmpvar_12;
					  tmpvar_11.y = (0.7 + (_Value3 / 2.0));
					  highp vec3 tmpvar_13;
					  tmpvar_13.z = 0.7;
					  tmpvar_13.x = tmpvar_12;
					  tmpvar_13.y = (0.7 + (_Value3 / 8.0));
					  oldImage_2 = (((
					    (dot (vec3(0.2126, 0.7152, 0.0722), image_3) * tmpvar_11)
					   * _Value2) * tmpvar_13) * _Value2);
					  highp vec2 tmpvar_14;
					  tmpvar_14.y = 1.0;
					  tmpvar_14.x = (tmpvar_5 + 8.0);
					  highp float tmpvar_15;
					  tmpvar_15 = fract((sin(
					    dot (tmpvar_14, vec2(12.9898, 78.233))
					  ) * 43758.55));
					  vI_1 = ((16.0 * (
					    ((uv_4.x * (1.0 - uv_4.x)) * uv_4.y)
					   * 
					    (1.0 - uv_4.y)
					  )) * mix (0.7, 1.0, (tmpvar_15 + 0.5)));
					  vI_1 = (vI_1 + (1.0 + (0.4 * tmpvar_15)));
					  vI_1 = (vI_1 * pow ((
					    (((16.0 * uv_4.x) * (1.0 - uv_4.x)) * uv_4.y)
					   * 
					    (1.0 - uv_4.y)
					  ), 0.4));
					  highp int tmpvar_16;
					  tmpvar_16 = int((8.0 * tmpvar_15));
					  if ((0 < tmpvar_16)) {
					    highp float l_17;
					    highp vec2 tmpvar_18;
					    tmpvar_18.y = 1.0;
					    tmpvar_18.x = (7.0 + tmpvar_5);
					    highp float tmpvar_19;
					    tmpvar_19 = fract((sin(
					      dot (tmpvar_18, vec2(12.9898, 78.233))
					    ) * 43758.55));
					    highp float tmpvar_20;
					    tmpvar_20 = (0.01 * tmpvar_19);
					    highp float tmpvar_21;
					    tmpvar_21 = (tmpvar_19 - 0.5);
					    if ((tmpvar_19 > 0.2)) {
					      l_17 = pow (abs((
					        ((tmpvar_19 * uv_4.x) + (tmpvar_20 * uv_4.y))
					       + tmpvar_21)), 0.125);
					    } else {
					      l_17 = (2.0 - pow (abs(
					        (((tmpvar_19 * uv_4.x) + (tmpvar_20 * uv_4.y)) + tmpvar_21)
					      ), 0.125));
					    };
					    vI_1 = (vI_1 * mix ((0.5 - _Value4), 1.0, l_17));
					  };
					  if ((1 < tmpvar_16)) {
					    highp float l_22;
					    highp vec2 tmpvar_23;
					    tmpvar_23.y = 1.0;
					    tmpvar_23.x = (24.0 + tmpvar_5);
					    highp float tmpvar_24;
					    tmpvar_24 = fract((sin(
					      dot (tmpvar_23, vec2(12.9898, 78.233))
					    ) * 43758.55));
					    highp float tmpvar_25;
					    tmpvar_25 = (0.01 * tmpvar_24);
					    highp float tmpvar_26;
					    tmpvar_26 = (tmpvar_24 - 0.5);
					    if ((tmpvar_24 > 0.2)) {
					      l_22 = pow (abs((
					        ((tmpvar_24 * uv_4.x) + (tmpvar_25 * uv_4.y))
					       + tmpvar_26)), 0.125);
					    } else {
					      l_22 = (2.0 - pow (abs(
					        (((tmpvar_24 * uv_4.x) + (tmpvar_25 * uv_4.y)) + tmpvar_26)
					      ), 0.125));
					    };
					    vI_1 = (vI_1 * mix ((0.5 - _Value4), 1.0, l_22));
					  };
					  highp vec2 tmpvar_27;
					  tmpvar_27.y = 1.0;
					  tmpvar_27.x = (tmpvar_5 + 18.0);
					  highp int tmpvar_28;
					  tmpvar_28 = int(max ((
					    (8.0 * fract((sin(
					      dot (tmpvar_27, vec2(12.9898, 78.233))
					    ) * 43758.55)))
					   - 2.0), 0.0));
					  if ((0 < tmpvar_28)) {
					    highp float seed_29;
					    seed_29 = (tmpvar_5 + 6.0);
					    highp float v_30;
					    highp vec2 tmpvar_31;
					    tmpvar_31.y = 1.0;
					    tmpvar_31.x = seed_29;
					    highp float tmpvar_32;
					    tmpvar_32 = fract((sin(
					      dot (tmpvar_31, vec2(12.9898, 78.233))
					    ) * 43758.55));
					    highp vec2 tmpvar_33;
					    tmpvar_33.y = 1.0;
					    tmpvar_33.x = (seed_29 + 1.0);
					    highp vec2 tmpvar_34;
					    tmpvar_34.y = 1.0;
					    tmpvar_34.x = (seed_29 + 2.0);
					    highp float tmpvar_35;
					    tmpvar_35 = (0.01 * fract((
					      sin(dot (tmpvar_34, vec2(12.9898, 78.233)))
					     * 43758.55)));
					    highp vec2 tmpvar_36;
					    tmpvar_36.x = tmpvar_32;
					    tmpvar_36.y = fract((sin(
					      dot (tmpvar_33, vec2(12.9898, 78.233))
					    ) * 43758.55));
					    highp vec2 tmpvar_37;
					    tmpvar_37 = (tmpvar_36 - uv_4);
					    highp float y_over_x_38;
					    y_over_x_38 = (tmpvar_37.y / tmpvar_37.x);
					    highp float tmpvar_39;
					    tmpvar_39 = (min (abs(y_over_x_38), 1.0) / max (abs(y_over_x_38), 1.0));
					    highp float tmpvar_40;
					    tmpvar_40 = (tmpvar_39 * tmpvar_39);
					    tmpvar_40 = (((
					      ((((
					        ((((-0.01213232 * tmpvar_40) + 0.05368138) * tmpvar_40) - 0.1173503)
					       * tmpvar_40) + 0.1938925) * tmpvar_40) - 0.3326756)
					     * tmpvar_40) + 0.9999793) * tmpvar_39);
					    tmpvar_40 = (tmpvar_40 + (float(
					      (abs(y_over_x_38) > 1.0)
					    ) * (
					      (tmpvar_40 * -2.0)
					     + 1.570796)));
					    v_30 = 1.0;
					    highp float tmpvar_41;
					    tmpvar_41 = ((tmpvar_35 * tmpvar_35) * ((
					      sin(((6.2831 * (tmpvar_40 * 
					        sign(y_over_x_38)
					      )) * tmpvar_32))
					     * 0.1) + 1.0));
					    highp float tmpvar_42;
					    tmpvar_42 = dot (tmpvar_37, tmpvar_37);
					    if ((tmpvar_42 < tmpvar_41)) {
					      v_30 = 0.2;
					    } else {
					      v_30 = pow ((dot (tmpvar_37, tmpvar_37) - tmpvar_41), 0.0625);
					    };
					    vI_1 = (vI_1 * mix ((
					      (0.3 + (0.2 * (1.0 - (tmpvar_35 / 0.02))))
					     - _Value4), 1.0, v_30));
					  };
					  if ((1 < tmpvar_28)) {
					    highp float seed_43;
					    seed_43 = (25.0 + tmpvar_5);
					    highp float v_44;
					    highp vec2 tmpvar_45;
					    tmpvar_45.y = 1.0;
					    tmpvar_45.x = seed_43;
					    highp float tmpvar_46;
					    tmpvar_46 = fract((sin(
					      dot (tmpvar_45, vec2(12.9898, 78.233))
					    ) * 43758.55));
					    highp vec2 tmpvar_47;
					    tmpvar_47.y = 1.0;
					    tmpvar_47.x = (seed_43 + 1.0);
					    highp vec2 tmpvar_48;
					    tmpvar_48.y = 1.0;
					    tmpvar_48.x = (seed_43 + 2.0);
					    highp float tmpvar_49;
					    tmpvar_49 = (0.01 * fract((
					      sin(dot (tmpvar_48, vec2(12.9898, 78.233)))
					     * 43758.55)));
					    highp vec2 tmpvar_50;
					    tmpvar_50.x = tmpvar_46;
					    tmpvar_50.y = fract((sin(
					      dot (tmpvar_47, vec2(12.9898, 78.233))
					    ) * 43758.55));
					    highp vec2 tmpvar_51;
					    tmpvar_51 = (tmpvar_50 - uv_4);
					    highp float y_over_x_52;
					    y_over_x_52 = (tmpvar_51.y / tmpvar_51.x);
					    highp float tmpvar_53;
					    tmpvar_53 = (min (abs(y_over_x_52), 1.0) / max (abs(y_over_x_52), 1.0));
					    highp float tmpvar_54;
					    tmpvar_54 = (tmpvar_53 * tmpvar_53);
					    tmpvar_54 = (((
					      ((((
					        ((((-0.01213232 * tmpvar_54) + 0.05368138) * tmpvar_54) - 0.1173503)
					       * tmpvar_54) + 0.1938925) * tmpvar_54) - 0.3326756)
					     * tmpvar_54) + 0.9999793) * tmpvar_53);
					    tmpvar_54 = (tmpvar_54 + (float(
					      (abs(y_over_x_52) > 1.0)
					    ) * (
					      (tmpvar_54 * -2.0)
					     + 1.570796)));
					    v_44 = 1.0;
					    highp float tmpvar_55;
					    tmpvar_55 = ((tmpvar_49 * tmpvar_49) * ((
					      sin(((6.2831 * (tmpvar_54 * 
					        sign(y_over_x_52)
					      )) * tmpvar_46))
					     * 0.1) + 1.0));
					    highp float tmpvar_56;
					    tmpvar_56 = dot (tmpvar_51, tmpvar_51);
					    if ((tmpvar_56 < tmpvar_55)) {
					      v_44 = 0.2;
					    } else {
					      v_44 = pow ((dot (tmpvar_51, tmpvar_51) - tmpvar_55), 0.0625);
					    };
					    vI_1 = (vI_1 * mix ((
					      (0.3 + (0.2 * (1.0 - (tmpvar_49 / 0.02))))
					     - _Value4), 1.0, v_44));
					  };
					  highp vec4 tmpvar_57;
					  tmpvar_57.w = 1.0;
					  tmpvar_57.xyz = (oldImage_2 * vI_1);
					  gl_FragData[0] = tmpvar_57;
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	float _Value4;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					lowp vec3 u_xlat10_1;
					vec4 u_xlat2;
					mediump vec2 u_xlat16_2;
					bvec2 u_xlatb2;
					vec4 u_xlat3;
					bool u_xlatb4;
					float u_xlat5;
					vec2 u_xlat7;
					float u_xlat8;
					bool u_xlatb8;
					float u_xlat10;
					bool u_xlatb10;
					vec2 u_xlat12;
					bool u_xlatb12;
					float u_xlat13;
					float u_xlat15;
					mediump float u_xlat16_15;
					float u_xlat16;
					mediump float u_xlat16_16;
					int u_xlati16;
					bool u_xlatb16;
					float u_xlat17;
					bool u_xlatb17;
					float u_xlat18;
					bool u_xlatb18;
					void main()
					{
					    u_xlat0.x = _Value * _TimeX;
					    u_xlat0.x = trunc(u_xlat0.x);
					    u_xlat0.y = 1.0;
					    u_xlat1.x = dot(u_xlat0.xy, vec2(12.9898005, 78.2330017));
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat0.zw = u_xlat0.xx + vec2(23.0, 8.0);
					    u_xlat10 = dot(u_xlat0.zy, vec2(12.9898005, 78.2330017));
					    u_xlat10 = sin(u_xlat10);
					    u_xlat10 = u_xlat10 * 43758.5469;
					    u_xlat1.y = fract(u_xlat10);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.00200000009, 0.00200000009) + vs_TEXCOORD0.xy;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat1.x = dot(vec3(0.212599993, 0.715200007, 0.0722000003), u_xlat10_1.xyz);
					    u_xlat1.y = _Value2;
					    u_xlat2.xyz = vec3(_Value3, _Value3, _Value2) * vec3(1.0, 0.5, 1.0) + vec3(0.699999988, 0.699999988, 0.0);
					    u_xlat2.xyz = u_xlat1.xxy * u_xlat2.xyz;
					    u_xlat2.xy = u_xlat2.xy * vec2(vec2(_Value2, _Value2));
					    u_xlat1.zw = vec2(vec2(_Value3, _Value3)) * vec2(1.0, 0.125) + vec2(0.699999988, 0.699999988);
					    u_xlat1.xyz = u_xlat1.zwx * u_xlat2.xyz;
					    u_xlat2.x = _Value2;
					    u_xlat2.z = 0.48999998;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxz;
					    u_xlat10 = dot(u_xlat0.wy, vec2(12.9898005, 78.2330017));
					    u_xlat10 = sin(u_xlat10);
					    u_xlat10 = u_xlat10 * 43758.5469;
					    u_xlat10 = fract(u_xlat10);
					    u_xlat16_2.xy = (-vs_TEXCOORD0.xy) + vec2(1.0, 1.0);
					    u_xlat16_15 = u_xlat16_2.x * vs_TEXCOORD0.x;
					    u_xlat16_15 = u_xlat16_15 * vs_TEXCOORD0.y;
					    u_xlat16_15 = u_xlat16_2.y * u_xlat16_15;
					    u_xlat16_15 = u_xlat16_15 * 16.0;
					    u_xlat16 = u_xlat10 + 0.5;
					    u_xlat16 = u_xlat16 * 0.300000012 + 0.699999988;
					    u_xlat12.xy = vec2(u_xlat10) * vec2(0.400000006, 8.0);
					    u_xlat15 = u_xlat16_15 * u_xlat16 + u_xlat12.x;
					    u_xlat15 = u_xlat15 + 1.0;
					    u_xlat16_16 = vs_TEXCOORD0.x * 16.0;
					    u_xlat16_16 = u_xlat16_2.x * u_xlat16_16;
					    u_xlat16_16 = u_xlat16_16 * vs_TEXCOORD0.y;
					    u_xlat16_16 = u_xlat16_2.y * u_xlat16_16;
					    u_xlat16_16 = log2(u_xlat16_16);
					    u_xlat16_16 = u_xlat16_16 * 0.400000006;
					    u_xlat16_16 = exp2(u_xlat16_16);
					    u_xlat15 = u_xlat15 * u_xlat16_16;
					    u_xlati16 = int(u_xlat12.y);
					    u_xlatb2.xy = lessThan(ivec4(0, 1, 0, 0), ivec4(u_xlati16)).xy;
					    u_xlat3 = u_xlat0.xyxy + vec4(7.0, 0.0, 24.0, 0.0);
					    u_xlat16 = dot(u_xlat3.xy, vec2(12.9898005, 78.2330017));
					    u_xlat16 = sin(u_xlat16);
					    u_xlat16 = u_xlat16 * 43758.5469;
					    u_xlat3.y = fract(u_xlat16);
					    u_xlat16 = u_xlat3.y * 0.00999999978;
					    u_xlat12.x = u_xlat3.y + -0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb17 = !!(0.200000003<u_xlat3.y);
					#else
					    u_xlatb17 = 0.200000003<u_xlat3.y;
					#endif
					    u_xlat16 = u_xlat16 * vs_TEXCOORD0.y;
					    u_xlat16 = u_xlat3.y * vs_TEXCOORD0.x + u_xlat16;
					    u_xlat16 = u_xlat12.x + u_xlat16;
					    u_xlat16 = log2(abs(u_xlat16));
					    u_xlat16 = u_xlat16 * 0.125;
					    u_xlat16 = exp2(u_xlat16);
					    u_xlat12.x = (-u_xlat16) + 2.0;
					    u_xlat16 = (u_xlatb17) ? u_xlat16 : u_xlat12.x;
					    u_xlat12.x = (-_Value4) + 0.5;
					    u_xlat17 = (-u_xlat12.x) + 1.0;
					    u_xlat16 = u_xlat16 * u_xlat17 + u_xlat12.x;
					    u_xlat16 = u_xlat15 * u_xlat16;
					    u_xlat15 = (u_xlatb2.x) ? u_xlat16 : u_xlat15;
					    u_xlat16 = dot(u_xlat3.zw, vec2(12.9898005, 78.2330017));
					    u_xlat16 = sin(u_xlat16);
					    u_xlat16 = u_xlat16 * 43758.5469;
					    u_xlat16 = fract(u_xlat16);
					    u_xlat2.x = u_xlat16 * 0.00999999978;
					    u_xlat13 = u_xlat16 + -0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(0.200000003<u_xlat16);
					#else
					    u_xlatb18 = 0.200000003<u_xlat16;
					#endif
					    u_xlat2.x = u_xlat2.x * vs_TEXCOORD0.y;
					    u_xlat16 = u_xlat16 * vs_TEXCOORD0.x + u_xlat2.x;
					    u_xlat16 = u_xlat13 + u_xlat16;
					    u_xlat16 = log2(abs(u_xlat16));
					    u_xlat16 = u_xlat16 * 0.125;
					    u_xlat16 = exp2(u_xlat16);
					    u_xlat2.x = (-u_xlat16) + 2.0;
					    u_xlat16 = (u_xlatb18) ? u_xlat16 : u_xlat2.x;
					    u_xlat16 = u_xlat16 * u_xlat17 + u_xlat12.x;
					    u_xlat16 = u_xlat15 * u_xlat16;
					    u_xlat15 = (u_xlatb2.y) ? u_xlat16 : u_xlat15;
					    u_xlat2.xy = u_xlat0.xy + vec2(18.0, 0.0);
					    u_xlat16 = dot(u_xlat2.xy, vec2(12.9898005, 78.2330017));
					    u_xlat16 = sin(u_xlat16);
					    u_xlat16 = u_xlat16 * 43758.5469;
					    u_xlat16 = fract(u_xlat16);
					    u_xlat16 = u_xlat16 * 8.0 + -2.0;
					    u_xlat16 = max(u_xlat16, 0.0);
					    u_xlati16 = int(u_xlat16);
					    u_xlatb2.xy = lessThan(ivec4(0, 1, 0, 0), ivec4(u_xlati16)).xy;
					    if(u_xlatb2.x){
					        u_xlat2.xz = u_xlat0.xy + vec2(6.0, 0.0);
					        u_xlat16 = dot(u_xlat2.xz, vec2(12.9898005, 78.2330017));
					        u_xlat16 = sin(u_xlat16);
					        u_xlat16 = u_xlat16 * 43758.5469;
					        u_xlat3.x = fract(u_xlat16);
					        u_xlat16 = u_xlat10 * 0.00999999978;
					        u_xlat2.xz = u_xlat3.xy + (-vs_TEXCOORD0.xy);
					        u_xlat17 = u_xlat2.z / u_xlat2.x;
					        u_xlat8 = min(abs(u_xlat17), 1.0);
					        u_xlat13 = max(abs(u_xlat17), 1.0);
					        u_xlat13 = float(1.0) / u_xlat13;
					        u_xlat8 = u_xlat13 * u_xlat8;
					        u_xlat13 = u_xlat8 * u_xlat8;
					        u_xlat18 = u_xlat13 * 0.0208350997 + -0.0851330012;
					        u_xlat18 = u_xlat13 * u_xlat18 + 0.180141002;
					        u_xlat18 = u_xlat13 * u_xlat18 + -0.330299497;
					        u_xlat13 = u_xlat13 * u_xlat18 + 0.999866009;
					        u_xlat18 = u_xlat13 * u_xlat8;
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb4 = !!(1.0<abs(u_xlat17));
					#else
					        u_xlatb4 = 1.0<abs(u_xlat17);
					#endif
					        u_xlat18 = u_xlat18 * -2.0 + 1.57079637;
					        u_xlat18 = u_xlatb4 ? u_xlat18 : float(0.0);
					        u_xlat8 = u_xlat8 * u_xlat13 + u_xlat18;
					        u_xlat17 = min(u_xlat17, 1.0);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb17 = !!(u_xlat17<(-u_xlat17));
					#else
					        u_xlatb17 = u_xlat17<(-u_xlat17);
					#endif
					        u_xlat17 = (u_xlatb17) ? (-u_xlat8) : u_xlat8;
					        u_xlat16 = u_xlat16 * u_xlat16;
					        u_xlat17 = u_xlat17 * u_xlat3.x;
					        u_xlat17 = u_xlat17 * 6.28310013;
					        u_xlat17 = sin(u_xlat17);
					        u_xlat17 = u_xlat17 * 0.100000001 + 1.0;
					        u_xlat3.x = u_xlat16 * u_xlat17;
					        u_xlat2.x = dot(u_xlat2.xz, u_xlat2.xz);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb12 = !!(u_xlat2.x<u_xlat3.x);
					#else
					        u_xlatb12 = u_xlat2.x<u_xlat3.x;
					#endif
					        u_xlat16 = (-u_xlat16) * u_xlat17 + u_xlat2.x;
					        u_xlat16 = log2(u_xlat16);
					        u_xlat16 = u_xlat16 * 0.0625;
					        u_xlat16 = exp2(u_xlat16);
					        u_xlat16 = (u_xlatb12) ? 0.200000003 : u_xlat16;
					        u_xlat10 = (-u_xlat10) * 0.5 + 1.0;
					        u_xlat10 = u_xlat10 * 0.200000003 + (-_Value4);
					        u_xlat10 = u_xlat10 + 0.300000012;
					        u_xlat2.x = (-u_xlat10) + 1.0;
					        u_xlat10 = u_xlat16 * u_xlat2.x + u_xlat10;
					        u_xlat15 = u_xlat10 * u_xlat15;
					    //ENDIF
					    }
					    if(u_xlatb2.y){
					        u_xlat2 = u_xlat0.xyxy + vec4(25.0, 0.0, 26.0, 0.0);
					        u_xlat10 = dot(u_xlat2.xy, vec2(12.9898005, 78.2330017));
					        u_xlat10 = sin(u_xlat10);
					        u_xlat10 = u_xlat10 * 43758.5469;
					        u_xlat2.x = fract(u_xlat10);
					        u_xlat10 = dot(u_xlat2.zw, vec2(12.9898005, 78.2330017));
					        u_xlat10 = sin(u_xlat10);
					        u_xlat10 = u_xlat10 * 43758.5469;
					        u_xlat2.y = fract(u_xlat10);
					        u_xlat0.xy = u_xlat0.xy + vec2(27.0, 0.0);
					        u_xlat0.x = dot(u_xlat0.xy, vec2(12.9898005, 78.2330017));
					        u_xlat0.x = sin(u_xlat0.x);
					        u_xlat0.x = u_xlat0.x * 43758.5469;
					        u_xlat0.x = fract(u_xlat0.x);
					        u_xlat5 = u_xlat0.x * 0.00999999978;
					        u_xlat7.xy = u_xlat2.xy + (-vs_TEXCOORD0.xy);
					        u_xlat10 = u_xlat7.y / u_xlat7.x;
					        u_xlat16 = min(abs(u_xlat10), 1.0);
					        u_xlat17 = max(abs(u_xlat10), 1.0);
					        u_xlat17 = float(1.0) / u_xlat17;
					        u_xlat16 = u_xlat16 * u_xlat17;
					        u_xlat17 = u_xlat16 * u_xlat16;
					        u_xlat3.x = u_xlat17 * 0.0208350997 + -0.0851330012;
					        u_xlat3.x = u_xlat17 * u_xlat3.x + 0.180141002;
					        u_xlat3.x = u_xlat17 * u_xlat3.x + -0.330299497;
					        u_xlat17 = u_xlat17 * u_xlat3.x + 0.999866009;
					        u_xlat3.x = u_xlat16 * u_xlat17;
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb8 = !!(1.0<abs(u_xlat10));
					#else
					        u_xlatb8 = 1.0<abs(u_xlat10);
					#endif
					        u_xlat3.x = u_xlat3.x * -2.0 + 1.57079637;
					        u_xlat3.x = u_xlatb8 ? u_xlat3.x : float(0.0);
					        u_xlat16 = u_xlat16 * u_xlat17 + u_xlat3.x;
					        u_xlat10 = min(u_xlat10, 1.0);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb10 = !!(u_xlat10<(-u_xlat10));
					#else
					        u_xlatb10 = u_xlat10<(-u_xlat10);
					#endif
					        u_xlat10 = (u_xlatb10) ? (-u_xlat16) : u_xlat16;
					        u_xlat5 = u_xlat5 * u_xlat5;
					        u_xlat10 = u_xlat10 * u_xlat2.x;
					        u_xlat10 = u_xlat10 * 6.28310013;
					        u_xlat10 = sin(u_xlat10);
					        u_xlat10 = u_xlat10 * 0.100000001 + 1.0;
					        u_xlat16 = u_xlat10 * u_xlat5;
					        u_xlat2.x = dot(u_xlat7.xy, u_xlat7.xy);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb16 = !!(u_xlat2.x<u_xlat16);
					#else
					        u_xlatb16 = u_xlat2.x<u_xlat16;
					#endif
					        u_xlat5 = (-u_xlat5) * u_xlat10 + u_xlat2.x;
					        u_xlat5 = log2(u_xlat5);
					        u_xlat5 = u_xlat5 * 0.0625;
					        u_xlat5 = exp2(u_xlat5);
					        u_xlat5 = (u_xlatb16) ? 0.200000003 : u_xlat5;
					        u_xlat0.x = (-u_xlat0.x) * 0.5 + 1.0;
					        u_xlat0.x = u_xlat0.x * 0.200000003 + (-_Value4);
					        u_xlat0.x = u_xlat0.x + 0.300000012;
					        u_xlat10 = (-u_xlat0.x) + 1.0;
					        u_xlat0.x = u_xlat5 * u_xlat10 + u_xlat0.x;
					        u_xlat15 = u_xlat0.x * u_xlat15;
					    //ENDIF
					    }
					    SV_Target0.xyz = vec3(u_xlat15) * u_xlat1.xyz;
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
					uniform 	float _TimeX;
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	float _Value4;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					lowp vec3 u_xlat10_1;
					vec4 u_xlat2;
					mediump vec2 u_xlat16_2;
					bvec2 u_xlatb2;
					vec4 u_xlat3;
					bool u_xlatb4;
					float u_xlat5;
					vec2 u_xlat7;
					float u_xlat8;
					bool u_xlatb8;
					float u_xlat10;
					bool u_xlatb10;
					vec2 u_xlat12;
					bool u_xlatb12;
					float u_xlat13;
					float u_xlat15;
					mediump float u_xlat16_15;
					float u_xlat16;
					mediump float u_xlat16_16;
					int u_xlati16;
					bool u_xlatb16;
					float u_xlat17;
					bool u_xlatb17;
					float u_xlat18;
					bool u_xlatb18;
					void main()
					{
					    u_xlat0.x = _Value * _TimeX;
					    u_xlat0.x = trunc(u_xlat0.x);
					    u_xlat0.y = 1.0;
					    u_xlat1.x = dot(u_xlat0.xy, vec2(12.9898005, 78.2330017));
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat0.zw = u_xlat0.xx + vec2(23.0, 8.0);
					    u_xlat10 = dot(u_xlat0.zy, vec2(12.9898005, 78.2330017));
					    u_xlat10 = sin(u_xlat10);
					    u_xlat10 = u_xlat10 * 43758.5469;
					    u_xlat1.y = fract(u_xlat10);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.00200000009, 0.00200000009) + vs_TEXCOORD0.xy;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat1.x = dot(vec3(0.212599993, 0.715200007, 0.0722000003), u_xlat10_1.xyz);
					    u_xlat1.y = _Value2;
					    u_xlat2.xyz = vec3(_Value3, _Value3, _Value2) * vec3(1.0, 0.5, 1.0) + vec3(0.699999988, 0.699999988, 0.0);
					    u_xlat2.xyz = u_xlat1.xxy * u_xlat2.xyz;
					    u_xlat2.xy = u_xlat2.xy * vec2(vec2(_Value2, _Value2));
					    u_xlat1.zw = vec2(vec2(_Value3, _Value3)) * vec2(1.0, 0.125) + vec2(0.699999988, 0.699999988);
					    u_xlat1.xyz = u_xlat1.zwx * u_xlat2.xyz;
					    u_xlat2.x = _Value2;
					    u_xlat2.z = 0.48999998;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxz;
					    u_xlat10 = dot(u_xlat0.wy, vec2(12.9898005, 78.2330017));
					    u_xlat10 = sin(u_xlat10);
					    u_xlat10 = u_xlat10 * 43758.5469;
					    u_xlat10 = fract(u_xlat10);
					    u_xlat16_2.xy = (-vs_TEXCOORD0.xy) + vec2(1.0, 1.0);
					    u_xlat16_15 = u_xlat16_2.x * vs_TEXCOORD0.x;
					    u_xlat16_15 = u_xlat16_15 * vs_TEXCOORD0.y;
					    u_xlat16_15 = u_xlat16_2.y * u_xlat16_15;
					    u_xlat16_15 = u_xlat16_15 * 16.0;
					    u_xlat16 = u_xlat10 + 0.5;
					    u_xlat16 = u_xlat16 * 0.300000012 + 0.699999988;
					    u_xlat12.xy = vec2(u_xlat10) * vec2(0.400000006, 8.0);
					    u_xlat15 = u_xlat16_15 * u_xlat16 + u_xlat12.x;
					    u_xlat15 = u_xlat15 + 1.0;
					    u_xlat16_16 = vs_TEXCOORD0.x * 16.0;
					    u_xlat16_16 = u_xlat16_2.x * u_xlat16_16;
					    u_xlat16_16 = u_xlat16_16 * vs_TEXCOORD0.y;
					    u_xlat16_16 = u_xlat16_2.y * u_xlat16_16;
					    u_xlat16_16 = log2(u_xlat16_16);
					    u_xlat16_16 = u_xlat16_16 * 0.400000006;
					    u_xlat16_16 = exp2(u_xlat16_16);
					    u_xlat15 = u_xlat15 * u_xlat16_16;
					    u_xlati16 = int(u_xlat12.y);
					    u_xlatb2.xy = lessThan(ivec4(0, 1, 0, 0), ivec4(u_xlati16)).xy;
					    u_xlat3 = u_xlat0.xyxy + vec4(7.0, 0.0, 24.0, 0.0);
					    u_xlat16 = dot(u_xlat3.xy, vec2(12.9898005, 78.2330017));
					    u_xlat16 = sin(u_xlat16);
					    u_xlat16 = u_xlat16 * 43758.5469;
					    u_xlat3.y = fract(u_xlat16);
					    u_xlat16 = u_xlat3.y * 0.00999999978;
					    u_xlat12.x = u_xlat3.y + -0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb17 = !!(0.200000003<u_xlat3.y);
					#else
					    u_xlatb17 = 0.200000003<u_xlat3.y;
					#endif
					    u_xlat16 = u_xlat16 * vs_TEXCOORD0.y;
					    u_xlat16 = u_xlat3.y * vs_TEXCOORD0.x + u_xlat16;
					    u_xlat16 = u_xlat12.x + u_xlat16;
					    u_xlat16 = log2(abs(u_xlat16));
					    u_xlat16 = u_xlat16 * 0.125;
					    u_xlat16 = exp2(u_xlat16);
					    u_xlat12.x = (-u_xlat16) + 2.0;
					    u_xlat16 = (u_xlatb17) ? u_xlat16 : u_xlat12.x;
					    u_xlat12.x = (-_Value4) + 0.5;
					    u_xlat17 = (-u_xlat12.x) + 1.0;
					    u_xlat16 = u_xlat16 * u_xlat17 + u_xlat12.x;
					    u_xlat16 = u_xlat15 * u_xlat16;
					    u_xlat15 = (u_xlatb2.x) ? u_xlat16 : u_xlat15;
					    u_xlat16 = dot(u_xlat3.zw, vec2(12.9898005, 78.2330017));
					    u_xlat16 = sin(u_xlat16);
					    u_xlat16 = u_xlat16 * 43758.5469;
					    u_xlat16 = fract(u_xlat16);
					    u_xlat2.x = u_xlat16 * 0.00999999978;
					    u_xlat13 = u_xlat16 + -0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(0.200000003<u_xlat16);
					#else
					    u_xlatb18 = 0.200000003<u_xlat16;
					#endif
					    u_xlat2.x = u_xlat2.x * vs_TEXCOORD0.y;
					    u_xlat16 = u_xlat16 * vs_TEXCOORD0.x + u_xlat2.x;
					    u_xlat16 = u_xlat13 + u_xlat16;
					    u_xlat16 = log2(abs(u_xlat16));
					    u_xlat16 = u_xlat16 * 0.125;
					    u_xlat16 = exp2(u_xlat16);
					    u_xlat2.x = (-u_xlat16) + 2.0;
					    u_xlat16 = (u_xlatb18) ? u_xlat16 : u_xlat2.x;
					    u_xlat16 = u_xlat16 * u_xlat17 + u_xlat12.x;
					    u_xlat16 = u_xlat15 * u_xlat16;
					    u_xlat15 = (u_xlatb2.y) ? u_xlat16 : u_xlat15;
					    u_xlat2.xy = u_xlat0.xy + vec2(18.0, 0.0);
					    u_xlat16 = dot(u_xlat2.xy, vec2(12.9898005, 78.2330017));
					    u_xlat16 = sin(u_xlat16);
					    u_xlat16 = u_xlat16 * 43758.5469;
					    u_xlat16 = fract(u_xlat16);
					    u_xlat16 = u_xlat16 * 8.0 + -2.0;
					    u_xlat16 = max(u_xlat16, 0.0);
					    u_xlati16 = int(u_xlat16);
					    u_xlatb2.xy = lessThan(ivec4(0, 1, 0, 0), ivec4(u_xlati16)).xy;
					    if(u_xlatb2.x){
					        u_xlat2.xz = u_xlat0.xy + vec2(6.0, 0.0);
					        u_xlat16 = dot(u_xlat2.xz, vec2(12.9898005, 78.2330017));
					        u_xlat16 = sin(u_xlat16);
					        u_xlat16 = u_xlat16 * 43758.5469;
					        u_xlat3.x = fract(u_xlat16);
					        u_xlat16 = u_xlat10 * 0.00999999978;
					        u_xlat2.xz = u_xlat3.xy + (-vs_TEXCOORD0.xy);
					        u_xlat17 = u_xlat2.z / u_xlat2.x;
					        u_xlat8 = min(abs(u_xlat17), 1.0);
					        u_xlat13 = max(abs(u_xlat17), 1.0);
					        u_xlat13 = float(1.0) / u_xlat13;
					        u_xlat8 = u_xlat13 * u_xlat8;
					        u_xlat13 = u_xlat8 * u_xlat8;
					        u_xlat18 = u_xlat13 * 0.0208350997 + -0.0851330012;
					        u_xlat18 = u_xlat13 * u_xlat18 + 0.180141002;
					        u_xlat18 = u_xlat13 * u_xlat18 + -0.330299497;
					        u_xlat13 = u_xlat13 * u_xlat18 + 0.999866009;
					        u_xlat18 = u_xlat13 * u_xlat8;
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb4 = !!(1.0<abs(u_xlat17));
					#else
					        u_xlatb4 = 1.0<abs(u_xlat17);
					#endif
					        u_xlat18 = u_xlat18 * -2.0 + 1.57079637;
					        u_xlat18 = u_xlatb4 ? u_xlat18 : float(0.0);
					        u_xlat8 = u_xlat8 * u_xlat13 + u_xlat18;
					        u_xlat17 = min(u_xlat17, 1.0);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb17 = !!(u_xlat17<(-u_xlat17));
					#else
					        u_xlatb17 = u_xlat17<(-u_xlat17);
					#endif
					        u_xlat17 = (u_xlatb17) ? (-u_xlat8) : u_xlat8;
					        u_xlat16 = u_xlat16 * u_xlat16;
					        u_xlat17 = u_xlat17 * u_xlat3.x;
					        u_xlat17 = u_xlat17 * 6.28310013;
					        u_xlat17 = sin(u_xlat17);
					        u_xlat17 = u_xlat17 * 0.100000001 + 1.0;
					        u_xlat3.x = u_xlat16 * u_xlat17;
					        u_xlat2.x = dot(u_xlat2.xz, u_xlat2.xz);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb12 = !!(u_xlat2.x<u_xlat3.x);
					#else
					        u_xlatb12 = u_xlat2.x<u_xlat3.x;
					#endif
					        u_xlat16 = (-u_xlat16) * u_xlat17 + u_xlat2.x;
					        u_xlat16 = log2(u_xlat16);
					        u_xlat16 = u_xlat16 * 0.0625;
					        u_xlat16 = exp2(u_xlat16);
					        u_xlat16 = (u_xlatb12) ? 0.200000003 : u_xlat16;
					        u_xlat10 = (-u_xlat10) * 0.5 + 1.0;
					        u_xlat10 = u_xlat10 * 0.200000003 + (-_Value4);
					        u_xlat10 = u_xlat10 + 0.300000012;
					        u_xlat2.x = (-u_xlat10) + 1.0;
					        u_xlat10 = u_xlat16 * u_xlat2.x + u_xlat10;
					        u_xlat15 = u_xlat10 * u_xlat15;
					    //ENDIF
					    }
					    if(u_xlatb2.y){
					        u_xlat2 = u_xlat0.xyxy + vec4(25.0, 0.0, 26.0, 0.0);
					        u_xlat10 = dot(u_xlat2.xy, vec2(12.9898005, 78.2330017));
					        u_xlat10 = sin(u_xlat10);
					        u_xlat10 = u_xlat10 * 43758.5469;
					        u_xlat2.x = fract(u_xlat10);
					        u_xlat10 = dot(u_xlat2.zw, vec2(12.9898005, 78.2330017));
					        u_xlat10 = sin(u_xlat10);
					        u_xlat10 = u_xlat10 * 43758.5469;
					        u_xlat2.y = fract(u_xlat10);
					        u_xlat0.xy = u_xlat0.xy + vec2(27.0, 0.0);
					        u_xlat0.x = dot(u_xlat0.xy, vec2(12.9898005, 78.2330017));
					        u_xlat0.x = sin(u_xlat0.x);
					        u_xlat0.x = u_xlat0.x * 43758.5469;
					        u_xlat0.x = fract(u_xlat0.x);
					        u_xlat5 = u_xlat0.x * 0.00999999978;
					        u_xlat7.xy = u_xlat2.xy + (-vs_TEXCOORD0.xy);
					        u_xlat10 = u_xlat7.y / u_xlat7.x;
					        u_xlat16 = min(abs(u_xlat10), 1.0);
					        u_xlat17 = max(abs(u_xlat10), 1.0);
					        u_xlat17 = float(1.0) / u_xlat17;
					        u_xlat16 = u_xlat16 * u_xlat17;
					        u_xlat17 = u_xlat16 * u_xlat16;
					        u_xlat3.x = u_xlat17 * 0.0208350997 + -0.0851330012;
					        u_xlat3.x = u_xlat17 * u_xlat3.x + 0.180141002;
					        u_xlat3.x = u_xlat17 * u_xlat3.x + -0.330299497;
					        u_xlat17 = u_xlat17 * u_xlat3.x + 0.999866009;
					        u_xlat3.x = u_xlat16 * u_xlat17;
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb8 = !!(1.0<abs(u_xlat10));
					#else
					        u_xlatb8 = 1.0<abs(u_xlat10);
					#endif
					        u_xlat3.x = u_xlat3.x * -2.0 + 1.57079637;
					        u_xlat3.x = u_xlatb8 ? u_xlat3.x : float(0.0);
					        u_xlat16 = u_xlat16 * u_xlat17 + u_xlat3.x;
					        u_xlat10 = min(u_xlat10, 1.0);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb10 = !!(u_xlat10<(-u_xlat10));
					#else
					        u_xlatb10 = u_xlat10<(-u_xlat10);
					#endif
					        u_xlat10 = (u_xlatb10) ? (-u_xlat16) : u_xlat16;
					        u_xlat5 = u_xlat5 * u_xlat5;
					        u_xlat10 = u_xlat10 * u_xlat2.x;
					        u_xlat10 = u_xlat10 * 6.28310013;
					        u_xlat10 = sin(u_xlat10);
					        u_xlat10 = u_xlat10 * 0.100000001 + 1.0;
					        u_xlat16 = u_xlat10 * u_xlat5;
					        u_xlat2.x = dot(u_xlat7.xy, u_xlat7.xy);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb16 = !!(u_xlat2.x<u_xlat16);
					#else
					        u_xlatb16 = u_xlat2.x<u_xlat16;
					#endif
					        u_xlat5 = (-u_xlat5) * u_xlat10 + u_xlat2.x;
					        u_xlat5 = log2(u_xlat5);
					        u_xlat5 = u_xlat5 * 0.0625;
					        u_xlat5 = exp2(u_xlat5);
					        u_xlat5 = (u_xlatb16) ? 0.200000003 : u_xlat5;
					        u_xlat0.x = (-u_xlat0.x) * 0.5 + 1.0;
					        u_xlat0.x = u_xlat0.x * 0.200000003 + (-_Value4);
					        u_xlat0.x = u_xlat0.x + 0.300000012;
					        u_xlat10 = (-u_xlat0.x) + 1.0;
					        u_xlat0.x = u_xlat5 * u_xlat10 + u_xlat0.x;
					        u_xlat15 = u_xlat0.x * u_xlat15;
					    //ENDIF
					    }
					    SV_Target0.xyz = vec3(u_xlat15) * u_xlat1.xyz;
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
					uniform 	float _TimeX;
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	float _Value4;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					lowp vec3 u_xlat10_1;
					vec4 u_xlat2;
					mediump vec2 u_xlat16_2;
					bvec2 u_xlatb2;
					vec4 u_xlat3;
					bool u_xlatb4;
					float u_xlat5;
					vec2 u_xlat7;
					float u_xlat8;
					bool u_xlatb8;
					float u_xlat10;
					bool u_xlatb10;
					vec2 u_xlat12;
					bool u_xlatb12;
					float u_xlat13;
					float u_xlat15;
					mediump float u_xlat16_15;
					float u_xlat16;
					mediump float u_xlat16_16;
					int u_xlati16;
					bool u_xlatb16;
					float u_xlat17;
					bool u_xlatb17;
					float u_xlat18;
					bool u_xlatb18;
					void main()
					{
					    u_xlat0.x = _Value * _TimeX;
					    u_xlat0.x = trunc(u_xlat0.x);
					    u_xlat0.y = 1.0;
					    u_xlat1.x = dot(u_xlat0.xy, vec2(12.9898005, 78.2330017));
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat0.zw = u_xlat0.xx + vec2(23.0, 8.0);
					    u_xlat10 = dot(u_xlat0.zy, vec2(12.9898005, 78.2330017));
					    u_xlat10 = sin(u_xlat10);
					    u_xlat10 = u_xlat10 * 43758.5469;
					    u_xlat1.y = fract(u_xlat10);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.00200000009, 0.00200000009) + vs_TEXCOORD0.xy;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat1.x = dot(vec3(0.212599993, 0.715200007, 0.0722000003), u_xlat10_1.xyz);
					    u_xlat1.y = _Value2;
					    u_xlat2.xyz = vec3(_Value3, _Value3, _Value2) * vec3(1.0, 0.5, 1.0) + vec3(0.699999988, 0.699999988, 0.0);
					    u_xlat2.xyz = u_xlat1.xxy * u_xlat2.xyz;
					    u_xlat2.xy = u_xlat2.xy * vec2(vec2(_Value2, _Value2));
					    u_xlat1.zw = vec2(vec2(_Value3, _Value3)) * vec2(1.0, 0.125) + vec2(0.699999988, 0.699999988);
					    u_xlat1.xyz = u_xlat1.zwx * u_xlat2.xyz;
					    u_xlat2.x = _Value2;
					    u_xlat2.z = 0.48999998;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxz;
					    u_xlat10 = dot(u_xlat0.wy, vec2(12.9898005, 78.2330017));
					    u_xlat10 = sin(u_xlat10);
					    u_xlat10 = u_xlat10 * 43758.5469;
					    u_xlat10 = fract(u_xlat10);
					    u_xlat16_2.xy = (-vs_TEXCOORD0.xy) + vec2(1.0, 1.0);
					    u_xlat16_15 = u_xlat16_2.x * vs_TEXCOORD0.x;
					    u_xlat16_15 = u_xlat16_15 * vs_TEXCOORD0.y;
					    u_xlat16_15 = u_xlat16_2.y * u_xlat16_15;
					    u_xlat16_15 = u_xlat16_15 * 16.0;
					    u_xlat16 = u_xlat10 + 0.5;
					    u_xlat16 = u_xlat16 * 0.300000012 + 0.699999988;
					    u_xlat12.xy = vec2(u_xlat10) * vec2(0.400000006, 8.0);
					    u_xlat15 = u_xlat16_15 * u_xlat16 + u_xlat12.x;
					    u_xlat15 = u_xlat15 + 1.0;
					    u_xlat16_16 = vs_TEXCOORD0.x * 16.0;
					    u_xlat16_16 = u_xlat16_2.x * u_xlat16_16;
					    u_xlat16_16 = u_xlat16_16 * vs_TEXCOORD0.y;
					    u_xlat16_16 = u_xlat16_2.y * u_xlat16_16;
					    u_xlat16_16 = log2(u_xlat16_16);
					    u_xlat16_16 = u_xlat16_16 * 0.400000006;
					    u_xlat16_16 = exp2(u_xlat16_16);
					    u_xlat15 = u_xlat15 * u_xlat16_16;
					    u_xlati16 = int(u_xlat12.y);
					    u_xlatb2.xy = lessThan(ivec4(0, 1, 0, 0), ivec4(u_xlati16)).xy;
					    u_xlat3 = u_xlat0.xyxy + vec4(7.0, 0.0, 24.0, 0.0);
					    u_xlat16 = dot(u_xlat3.xy, vec2(12.9898005, 78.2330017));
					    u_xlat16 = sin(u_xlat16);
					    u_xlat16 = u_xlat16 * 43758.5469;
					    u_xlat3.y = fract(u_xlat16);
					    u_xlat16 = u_xlat3.y * 0.00999999978;
					    u_xlat12.x = u_xlat3.y + -0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb17 = !!(0.200000003<u_xlat3.y);
					#else
					    u_xlatb17 = 0.200000003<u_xlat3.y;
					#endif
					    u_xlat16 = u_xlat16 * vs_TEXCOORD0.y;
					    u_xlat16 = u_xlat3.y * vs_TEXCOORD0.x + u_xlat16;
					    u_xlat16 = u_xlat12.x + u_xlat16;
					    u_xlat16 = log2(abs(u_xlat16));
					    u_xlat16 = u_xlat16 * 0.125;
					    u_xlat16 = exp2(u_xlat16);
					    u_xlat12.x = (-u_xlat16) + 2.0;
					    u_xlat16 = (u_xlatb17) ? u_xlat16 : u_xlat12.x;
					    u_xlat12.x = (-_Value4) + 0.5;
					    u_xlat17 = (-u_xlat12.x) + 1.0;
					    u_xlat16 = u_xlat16 * u_xlat17 + u_xlat12.x;
					    u_xlat16 = u_xlat15 * u_xlat16;
					    u_xlat15 = (u_xlatb2.x) ? u_xlat16 : u_xlat15;
					    u_xlat16 = dot(u_xlat3.zw, vec2(12.9898005, 78.2330017));
					    u_xlat16 = sin(u_xlat16);
					    u_xlat16 = u_xlat16 * 43758.5469;
					    u_xlat16 = fract(u_xlat16);
					    u_xlat2.x = u_xlat16 * 0.00999999978;
					    u_xlat13 = u_xlat16 + -0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(0.200000003<u_xlat16);
					#else
					    u_xlatb18 = 0.200000003<u_xlat16;
					#endif
					    u_xlat2.x = u_xlat2.x * vs_TEXCOORD0.y;
					    u_xlat16 = u_xlat16 * vs_TEXCOORD0.x + u_xlat2.x;
					    u_xlat16 = u_xlat13 + u_xlat16;
					    u_xlat16 = log2(abs(u_xlat16));
					    u_xlat16 = u_xlat16 * 0.125;
					    u_xlat16 = exp2(u_xlat16);
					    u_xlat2.x = (-u_xlat16) + 2.0;
					    u_xlat16 = (u_xlatb18) ? u_xlat16 : u_xlat2.x;
					    u_xlat16 = u_xlat16 * u_xlat17 + u_xlat12.x;
					    u_xlat16 = u_xlat15 * u_xlat16;
					    u_xlat15 = (u_xlatb2.y) ? u_xlat16 : u_xlat15;
					    u_xlat2.xy = u_xlat0.xy + vec2(18.0, 0.0);
					    u_xlat16 = dot(u_xlat2.xy, vec2(12.9898005, 78.2330017));
					    u_xlat16 = sin(u_xlat16);
					    u_xlat16 = u_xlat16 * 43758.5469;
					    u_xlat16 = fract(u_xlat16);
					    u_xlat16 = u_xlat16 * 8.0 + -2.0;
					    u_xlat16 = max(u_xlat16, 0.0);
					    u_xlati16 = int(u_xlat16);
					    u_xlatb2.xy = lessThan(ivec4(0, 1, 0, 0), ivec4(u_xlati16)).xy;
					    if(u_xlatb2.x){
					        u_xlat2.xz = u_xlat0.xy + vec2(6.0, 0.0);
					        u_xlat16 = dot(u_xlat2.xz, vec2(12.9898005, 78.2330017));
					        u_xlat16 = sin(u_xlat16);
					        u_xlat16 = u_xlat16 * 43758.5469;
					        u_xlat3.x = fract(u_xlat16);
					        u_xlat16 = u_xlat10 * 0.00999999978;
					        u_xlat2.xz = u_xlat3.xy + (-vs_TEXCOORD0.xy);
					        u_xlat17 = u_xlat2.z / u_xlat2.x;
					        u_xlat8 = min(abs(u_xlat17), 1.0);
					        u_xlat13 = max(abs(u_xlat17), 1.0);
					        u_xlat13 = float(1.0) / u_xlat13;
					        u_xlat8 = u_xlat13 * u_xlat8;
					        u_xlat13 = u_xlat8 * u_xlat8;
					        u_xlat18 = u_xlat13 * 0.0208350997 + -0.0851330012;
					        u_xlat18 = u_xlat13 * u_xlat18 + 0.180141002;
					        u_xlat18 = u_xlat13 * u_xlat18 + -0.330299497;
					        u_xlat13 = u_xlat13 * u_xlat18 + 0.999866009;
					        u_xlat18 = u_xlat13 * u_xlat8;
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb4 = !!(1.0<abs(u_xlat17));
					#else
					        u_xlatb4 = 1.0<abs(u_xlat17);
					#endif
					        u_xlat18 = u_xlat18 * -2.0 + 1.57079637;
					        u_xlat18 = u_xlatb4 ? u_xlat18 : float(0.0);
					        u_xlat8 = u_xlat8 * u_xlat13 + u_xlat18;
					        u_xlat17 = min(u_xlat17, 1.0);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb17 = !!(u_xlat17<(-u_xlat17));
					#else
					        u_xlatb17 = u_xlat17<(-u_xlat17);
					#endif
					        u_xlat17 = (u_xlatb17) ? (-u_xlat8) : u_xlat8;
					        u_xlat16 = u_xlat16 * u_xlat16;
					        u_xlat17 = u_xlat17 * u_xlat3.x;
					        u_xlat17 = u_xlat17 * 6.28310013;
					        u_xlat17 = sin(u_xlat17);
					        u_xlat17 = u_xlat17 * 0.100000001 + 1.0;
					        u_xlat3.x = u_xlat16 * u_xlat17;
					        u_xlat2.x = dot(u_xlat2.xz, u_xlat2.xz);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb12 = !!(u_xlat2.x<u_xlat3.x);
					#else
					        u_xlatb12 = u_xlat2.x<u_xlat3.x;
					#endif
					        u_xlat16 = (-u_xlat16) * u_xlat17 + u_xlat2.x;
					        u_xlat16 = log2(u_xlat16);
					        u_xlat16 = u_xlat16 * 0.0625;
					        u_xlat16 = exp2(u_xlat16);
					        u_xlat16 = (u_xlatb12) ? 0.200000003 : u_xlat16;
					        u_xlat10 = (-u_xlat10) * 0.5 + 1.0;
					        u_xlat10 = u_xlat10 * 0.200000003 + (-_Value4);
					        u_xlat10 = u_xlat10 + 0.300000012;
					        u_xlat2.x = (-u_xlat10) + 1.0;
					        u_xlat10 = u_xlat16 * u_xlat2.x + u_xlat10;
					        u_xlat15 = u_xlat10 * u_xlat15;
					    //ENDIF
					    }
					    if(u_xlatb2.y){
					        u_xlat2 = u_xlat0.xyxy + vec4(25.0, 0.0, 26.0, 0.0);
					        u_xlat10 = dot(u_xlat2.xy, vec2(12.9898005, 78.2330017));
					        u_xlat10 = sin(u_xlat10);
					        u_xlat10 = u_xlat10 * 43758.5469;
					        u_xlat2.x = fract(u_xlat10);
					        u_xlat10 = dot(u_xlat2.zw, vec2(12.9898005, 78.2330017));
					        u_xlat10 = sin(u_xlat10);
					        u_xlat10 = u_xlat10 * 43758.5469;
					        u_xlat2.y = fract(u_xlat10);
					        u_xlat0.xy = u_xlat0.xy + vec2(27.0, 0.0);
					        u_xlat0.x = dot(u_xlat0.xy, vec2(12.9898005, 78.2330017));
					        u_xlat0.x = sin(u_xlat0.x);
					        u_xlat0.x = u_xlat0.x * 43758.5469;
					        u_xlat0.x = fract(u_xlat0.x);
					        u_xlat5 = u_xlat0.x * 0.00999999978;
					        u_xlat7.xy = u_xlat2.xy + (-vs_TEXCOORD0.xy);
					        u_xlat10 = u_xlat7.y / u_xlat7.x;
					        u_xlat16 = min(abs(u_xlat10), 1.0);
					        u_xlat17 = max(abs(u_xlat10), 1.0);
					        u_xlat17 = float(1.0) / u_xlat17;
					        u_xlat16 = u_xlat16 * u_xlat17;
					        u_xlat17 = u_xlat16 * u_xlat16;
					        u_xlat3.x = u_xlat17 * 0.0208350997 + -0.0851330012;
					        u_xlat3.x = u_xlat17 * u_xlat3.x + 0.180141002;
					        u_xlat3.x = u_xlat17 * u_xlat3.x + -0.330299497;
					        u_xlat17 = u_xlat17 * u_xlat3.x + 0.999866009;
					        u_xlat3.x = u_xlat16 * u_xlat17;
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb8 = !!(1.0<abs(u_xlat10));
					#else
					        u_xlatb8 = 1.0<abs(u_xlat10);
					#endif
					        u_xlat3.x = u_xlat3.x * -2.0 + 1.57079637;
					        u_xlat3.x = u_xlatb8 ? u_xlat3.x : float(0.0);
					        u_xlat16 = u_xlat16 * u_xlat17 + u_xlat3.x;
					        u_xlat10 = min(u_xlat10, 1.0);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb10 = !!(u_xlat10<(-u_xlat10));
					#else
					        u_xlatb10 = u_xlat10<(-u_xlat10);
					#endif
					        u_xlat10 = (u_xlatb10) ? (-u_xlat16) : u_xlat16;
					        u_xlat5 = u_xlat5 * u_xlat5;
					        u_xlat10 = u_xlat10 * u_xlat2.x;
					        u_xlat10 = u_xlat10 * 6.28310013;
					        u_xlat10 = sin(u_xlat10);
					        u_xlat10 = u_xlat10 * 0.100000001 + 1.0;
					        u_xlat16 = u_xlat10 * u_xlat5;
					        u_xlat2.x = dot(u_xlat7.xy, u_xlat7.xy);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb16 = !!(u_xlat2.x<u_xlat16);
					#else
					        u_xlatb16 = u_xlat2.x<u_xlat16;
					#endif
					        u_xlat5 = (-u_xlat5) * u_xlat10 + u_xlat2.x;
					        u_xlat5 = log2(u_xlat5);
					        u_xlat5 = u_xlat5 * 0.0625;
					        u_xlat5 = exp2(u_xlat5);
					        u_xlat5 = (u_xlatb16) ? 0.200000003 : u_xlat5;
					        u_xlat0.x = (-u_xlat0.x) * 0.5 + 1.0;
					        u_xlat0.x = u_xlat0.x * 0.200000003 + (-_Value4);
					        u_xlat0.x = u_xlat0.x + 0.300000012;
					        u_xlat10 = (-u_xlat0.x) + 1.0;
					        u_xlat0.x = u_xlat5 * u_xlat10 + u_xlat0.x;
					        u_xlat15 = u_xlat0.x * u_xlat15;
					    //ENDIF
					    }
					    SV_Target0.xyz = vec3(u_xlat15) * u_xlat1.xyz;
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