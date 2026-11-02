Shader "CameraFilterPack/TV_Old_Movie" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(1, 10)) = 1
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 10207
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp float vI_1;
					  highp vec3 image_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  highp float tmpvar_4;
					  tmpvar_4 = float(int((_TimeX * 15.0)));
					  highp vec2 tmpvar_5;
					  tmpvar_5.y = 1.0;
					  tmpvar_5.x = tmpvar_4;
					  highp vec2 tmpvar_6;
					  tmpvar_6.y = 1.0;
					  tmpvar_6.x = (tmpvar_4 + 23.0);
					  highp vec2 tmpvar_7;
					  tmpvar_7.x = fract((sin(
					    dot (tmpvar_5, vec2(12.9898, 78.233))
					  ) * 43758.55));
					  tmpvar_7.y = fract((sin(
					    dot (tmpvar_6, vec2(12.9898, 78.233))
					  ) * 43758.55));
					  highp vec2 tmpvar_8;
					  tmpvar_8 = (uv_3 + (0.002 * tmpvar_7));
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = texture2D (_MainTex, tmpvar_8).xyz;
					  image_2 = tmpvar_9;
					  highp vec3 tmpvar_10;
					  tmpvar_10 = (dot (vec3(0.2126, 0.7152, 0.0722), image_2) * vec3(0.7, 0.7, 0.7));
					  highp vec2 tmpvar_11;
					  tmpvar_11.y = 1.0;
					  tmpvar_11.x = (tmpvar_4 + 8.0);
					  highp float tmpvar_12;
					  tmpvar_12 = fract((sin(
					    dot (tmpvar_11, vec2(12.9898, 78.233))
					  ) * 43758.55));
					  vI_1 = ((16.0 * (
					    ((uv_3.x * (1.0 - uv_3.x)) * uv_3.y)
					   * 
					    (1.0 - uv_3.y)
					  )) * mix (0.7, 1.0, (tmpvar_12 + 0.5)));
					  vI_1 = (vI_1 + (1.0 + (0.4 * tmpvar_12)));
					  vI_1 = (vI_1 * pow ((
					    (((16.0 * uv_3.x) * (1.0 - uv_3.x)) * uv_3.y)
					   * 
					    (1.0 - uv_3.y)
					  ), 0.4));
					  highp int tmpvar_13;
					  tmpvar_13 = int((8.0 * tmpvar_12));
					  if ((0 < tmpvar_13)) {
					    highp float l_14;
					    highp vec2 tmpvar_15;
					    tmpvar_15.y = 1.0;
					    tmpvar_15.x = (7.0 + tmpvar_4);
					    highp float tmpvar_16;
					    tmpvar_16 = fract((sin(
					      dot (tmpvar_15, vec2(12.9898, 78.233))
					    ) * 43758.55));
					    highp float tmpvar_17;
					    tmpvar_17 = (0.01 * tmpvar_16);
					    highp float tmpvar_18;
					    tmpvar_18 = (tmpvar_16 - 0.5);
					    if ((tmpvar_16 > 0.2)) {
					      l_14 = pow (abs((
					        ((tmpvar_16 * uv_3.x) + (tmpvar_17 * uv_3.y))
					       + tmpvar_18)), 0.125);
					    } else {
					      l_14 = (2.0 - pow (abs(
					        (((tmpvar_16 * uv_3.x) + (tmpvar_17 * uv_3.y)) + tmpvar_18)
					      ), 0.125));
					    };
					    vI_1 = (vI_1 * mix (0.5, 1.0, l_14));
					  };
					  if ((1 < tmpvar_13)) {
					    highp float l_19;
					    highp vec2 tmpvar_20;
					    tmpvar_20.y = 1.0;
					    tmpvar_20.x = (24.0 + tmpvar_4);
					    highp float tmpvar_21;
					    tmpvar_21 = fract((sin(
					      dot (tmpvar_20, vec2(12.9898, 78.233))
					    ) * 43758.55));
					    highp float tmpvar_22;
					    tmpvar_22 = (0.01 * tmpvar_21);
					    highp float tmpvar_23;
					    tmpvar_23 = (tmpvar_21 - 0.5);
					    if ((tmpvar_21 > 0.2)) {
					      l_19 = pow (abs((
					        ((tmpvar_21 * uv_3.x) + (tmpvar_22 * uv_3.y))
					       + tmpvar_23)), 0.125);
					    } else {
					      l_19 = (2.0 - pow (abs(
					        (((tmpvar_21 * uv_3.x) + (tmpvar_22 * uv_3.y)) + tmpvar_23)
					      ), 0.125));
					    };
					    vI_1 = (vI_1 * mix (0.5, 1.0, l_19));
					  };
					  highp vec2 tmpvar_24;
					  tmpvar_24.y = 1.0;
					  tmpvar_24.x = (tmpvar_4 + 18.0);
					  highp int tmpvar_25;
					  tmpvar_25 = int(max ((
					    (8.0 * fract((sin(
					      dot (tmpvar_24, vec2(12.9898, 78.233))
					    ) * 43758.55)))
					   - 2.0), 0.0));
					  if ((0 < tmpvar_25)) {
					    highp float seed_26;
					    seed_26 = (tmpvar_4 + 6.0);
					    highp float v_27;
					    highp vec2 tmpvar_28;
					    tmpvar_28.y = 1.0;
					    tmpvar_28.x = seed_26;
					    highp float tmpvar_29;
					    tmpvar_29 = fract((sin(
					      dot (tmpvar_28, vec2(12.9898, 78.233))
					    ) * 43758.55));
					    highp vec2 tmpvar_30;
					    tmpvar_30.y = 1.0;
					    tmpvar_30.x = (seed_26 + 1.0);
					    highp vec2 tmpvar_31;
					    tmpvar_31.y = 1.0;
					    tmpvar_31.x = (seed_26 + 2.0);
					    highp float tmpvar_32;
					    tmpvar_32 = (0.01 * fract((
					      sin(dot (tmpvar_31, vec2(12.9898, 78.233)))
					     * 43758.55)));
					    highp vec2 tmpvar_33;
					    tmpvar_33.x = tmpvar_29;
					    tmpvar_33.y = fract((sin(
					      dot (tmpvar_30, vec2(12.9898, 78.233))
					    ) * 43758.55));
					    highp vec2 tmpvar_34;
					    tmpvar_34 = (tmpvar_33 - uv_3);
					    highp float y_over_x_35;
					    y_over_x_35 = (tmpvar_34.y / tmpvar_34.x);
					    highp float tmpvar_36;
					    tmpvar_36 = (min (abs(y_over_x_35), 1.0) / max (abs(y_over_x_35), 1.0));
					    highp float tmpvar_37;
					    tmpvar_37 = (tmpvar_36 * tmpvar_36);
					    tmpvar_37 = (((
					      ((((
					        ((((-0.01213232 * tmpvar_37) + 0.05368138) * tmpvar_37) - 0.1173503)
					       * tmpvar_37) + 0.1938925) * tmpvar_37) - 0.3326756)
					     * tmpvar_37) + 0.9999793) * tmpvar_36);
					    tmpvar_37 = (tmpvar_37 + (float(
					      (abs(y_over_x_35) > 1.0)
					    ) * (
					      (tmpvar_37 * -2.0)
					     + 1.570796)));
					    v_27 = 1.0;
					    highp float tmpvar_38;
					    tmpvar_38 = ((tmpvar_32 * tmpvar_32) * ((
					      sin(((6.2831 * (tmpvar_37 * 
					        sign(y_over_x_35)
					      )) * tmpvar_29))
					     * 0.1) + 1.0));
					    highp float tmpvar_39;
					    tmpvar_39 = dot (tmpvar_34, tmpvar_34);
					    if ((tmpvar_39 < tmpvar_38)) {
					      v_27 = 0.2;
					    } else {
					      v_27 = pow ((dot (tmpvar_34, tmpvar_34) - tmpvar_38), 0.0625);
					    };
					    vI_1 = (vI_1 * mix ((0.3 + 
					      (0.2 * (1.0 - (tmpvar_32 / 0.02)))
					    ), 1.0, v_27));
					  };
					  if ((1 < tmpvar_25)) {
					    highp float seed_40;
					    seed_40 = (25.0 + tmpvar_4);
					    highp float v_41;
					    highp vec2 tmpvar_42;
					    tmpvar_42.y = 1.0;
					    tmpvar_42.x = seed_40;
					    highp float tmpvar_43;
					    tmpvar_43 = fract((sin(
					      dot (tmpvar_42, vec2(12.9898, 78.233))
					    ) * 43758.55));
					    highp vec2 tmpvar_44;
					    tmpvar_44.y = 1.0;
					    tmpvar_44.x = (seed_40 + 1.0);
					    highp vec2 tmpvar_45;
					    tmpvar_45.y = 1.0;
					    tmpvar_45.x = (seed_40 + 2.0);
					    highp float tmpvar_46;
					    tmpvar_46 = (0.01 * fract((
					      sin(dot (tmpvar_45, vec2(12.9898, 78.233)))
					     * 43758.55)));
					    highp vec2 tmpvar_47;
					    tmpvar_47.x = tmpvar_43;
					    tmpvar_47.y = fract((sin(
					      dot (tmpvar_44, vec2(12.9898, 78.233))
					    ) * 43758.55));
					    highp vec2 tmpvar_48;
					    tmpvar_48 = (tmpvar_47 - uv_3);
					    highp float y_over_x_49;
					    y_over_x_49 = (tmpvar_48.y / tmpvar_48.x);
					    highp float tmpvar_50;
					    tmpvar_50 = (min (abs(y_over_x_49), 1.0) / max (abs(y_over_x_49), 1.0));
					    highp float tmpvar_51;
					    tmpvar_51 = (tmpvar_50 * tmpvar_50);
					    tmpvar_51 = (((
					      ((((
					        ((((-0.01213232 * tmpvar_51) + 0.05368138) * tmpvar_51) - 0.1173503)
					       * tmpvar_51) + 0.1938925) * tmpvar_51) - 0.3326756)
					     * tmpvar_51) + 0.9999793) * tmpvar_50);
					    tmpvar_51 = (tmpvar_51 + (float(
					      (abs(y_over_x_49) > 1.0)
					    ) * (
					      (tmpvar_51 * -2.0)
					     + 1.570796)));
					    v_41 = 1.0;
					    highp float tmpvar_52;
					    tmpvar_52 = ((tmpvar_46 * tmpvar_46) * ((
					      sin(((6.2831 * (tmpvar_51 * 
					        sign(y_over_x_49)
					      )) * tmpvar_43))
					     * 0.1) + 1.0));
					    highp float tmpvar_53;
					    tmpvar_53 = dot (tmpvar_48, tmpvar_48);
					    if ((tmpvar_53 < tmpvar_52)) {
					      v_41 = 0.2;
					    } else {
					      v_41 = pow ((dot (tmpvar_48, tmpvar_48) - tmpvar_52), 0.0625);
					    };
					    vI_1 = (vI_1 * mix ((0.3 + 
					      (0.2 * (1.0 - (tmpvar_46 / 0.02)))
					    ), 1.0, v_41));
					  };
					  highp vec4 tmpvar_54;
					  tmpvar_54.w = 1.0;
					  tmpvar_54.xyz = (tmpvar_10 * vI_1);
					  gl_FragData[0] = tmpvar_54;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp float vI_1;
					  highp vec3 image_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  highp float tmpvar_4;
					  tmpvar_4 = float(int((_TimeX * 15.0)));
					  highp vec2 tmpvar_5;
					  tmpvar_5.y = 1.0;
					  tmpvar_5.x = tmpvar_4;
					  highp vec2 tmpvar_6;
					  tmpvar_6.y = 1.0;
					  tmpvar_6.x = (tmpvar_4 + 23.0);
					  highp vec2 tmpvar_7;
					  tmpvar_7.x = fract((sin(
					    dot (tmpvar_5, vec2(12.9898, 78.233))
					  ) * 43758.55));
					  tmpvar_7.y = fract((sin(
					    dot (tmpvar_6, vec2(12.9898, 78.233))
					  ) * 43758.55));
					  highp vec2 tmpvar_8;
					  tmpvar_8 = (uv_3 + (0.002 * tmpvar_7));
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = texture2D (_MainTex, tmpvar_8).xyz;
					  image_2 = tmpvar_9;
					  highp vec3 tmpvar_10;
					  tmpvar_10 = (dot (vec3(0.2126, 0.7152, 0.0722), image_2) * vec3(0.7, 0.7, 0.7));
					  highp vec2 tmpvar_11;
					  tmpvar_11.y = 1.0;
					  tmpvar_11.x = (tmpvar_4 + 8.0);
					  highp float tmpvar_12;
					  tmpvar_12 = fract((sin(
					    dot (tmpvar_11, vec2(12.9898, 78.233))
					  ) * 43758.55));
					  vI_1 = ((16.0 * (
					    ((uv_3.x * (1.0 - uv_3.x)) * uv_3.y)
					   * 
					    (1.0 - uv_3.y)
					  )) * mix (0.7, 1.0, (tmpvar_12 + 0.5)));
					  vI_1 = (vI_1 + (1.0 + (0.4 * tmpvar_12)));
					  vI_1 = (vI_1 * pow ((
					    (((16.0 * uv_3.x) * (1.0 - uv_3.x)) * uv_3.y)
					   * 
					    (1.0 - uv_3.y)
					  ), 0.4));
					  highp int tmpvar_13;
					  tmpvar_13 = int((8.0 * tmpvar_12));
					  if ((0 < tmpvar_13)) {
					    highp float l_14;
					    highp vec2 tmpvar_15;
					    tmpvar_15.y = 1.0;
					    tmpvar_15.x = (7.0 + tmpvar_4);
					    highp float tmpvar_16;
					    tmpvar_16 = fract((sin(
					      dot (tmpvar_15, vec2(12.9898, 78.233))
					    ) * 43758.55));
					    highp float tmpvar_17;
					    tmpvar_17 = (0.01 * tmpvar_16);
					    highp float tmpvar_18;
					    tmpvar_18 = (tmpvar_16 - 0.5);
					    if ((tmpvar_16 > 0.2)) {
					      l_14 = pow (abs((
					        ((tmpvar_16 * uv_3.x) + (tmpvar_17 * uv_3.y))
					       + tmpvar_18)), 0.125);
					    } else {
					      l_14 = (2.0 - pow (abs(
					        (((tmpvar_16 * uv_3.x) + (tmpvar_17 * uv_3.y)) + tmpvar_18)
					      ), 0.125));
					    };
					    vI_1 = (vI_1 * mix (0.5, 1.0, l_14));
					  };
					  if ((1 < tmpvar_13)) {
					    highp float l_19;
					    highp vec2 tmpvar_20;
					    tmpvar_20.y = 1.0;
					    tmpvar_20.x = (24.0 + tmpvar_4);
					    highp float tmpvar_21;
					    tmpvar_21 = fract((sin(
					      dot (tmpvar_20, vec2(12.9898, 78.233))
					    ) * 43758.55));
					    highp float tmpvar_22;
					    tmpvar_22 = (0.01 * tmpvar_21);
					    highp float tmpvar_23;
					    tmpvar_23 = (tmpvar_21 - 0.5);
					    if ((tmpvar_21 > 0.2)) {
					      l_19 = pow (abs((
					        ((tmpvar_21 * uv_3.x) + (tmpvar_22 * uv_3.y))
					       + tmpvar_23)), 0.125);
					    } else {
					      l_19 = (2.0 - pow (abs(
					        (((tmpvar_21 * uv_3.x) + (tmpvar_22 * uv_3.y)) + tmpvar_23)
					      ), 0.125));
					    };
					    vI_1 = (vI_1 * mix (0.5, 1.0, l_19));
					  };
					  highp vec2 tmpvar_24;
					  tmpvar_24.y = 1.0;
					  tmpvar_24.x = (tmpvar_4 + 18.0);
					  highp int tmpvar_25;
					  tmpvar_25 = int(max ((
					    (8.0 * fract((sin(
					      dot (tmpvar_24, vec2(12.9898, 78.233))
					    ) * 43758.55)))
					   - 2.0), 0.0));
					  if ((0 < tmpvar_25)) {
					    highp float seed_26;
					    seed_26 = (tmpvar_4 + 6.0);
					    highp float v_27;
					    highp vec2 tmpvar_28;
					    tmpvar_28.y = 1.0;
					    tmpvar_28.x = seed_26;
					    highp float tmpvar_29;
					    tmpvar_29 = fract((sin(
					      dot (tmpvar_28, vec2(12.9898, 78.233))
					    ) * 43758.55));
					    highp vec2 tmpvar_30;
					    tmpvar_30.y = 1.0;
					    tmpvar_30.x = (seed_26 + 1.0);
					    highp vec2 tmpvar_31;
					    tmpvar_31.y = 1.0;
					    tmpvar_31.x = (seed_26 + 2.0);
					    highp float tmpvar_32;
					    tmpvar_32 = (0.01 * fract((
					      sin(dot (tmpvar_31, vec2(12.9898, 78.233)))
					     * 43758.55)));
					    highp vec2 tmpvar_33;
					    tmpvar_33.x = tmpvar_29;
					    tmpvar_33.y = fract((sin(
					      dot (tmpvar_30, vec2(12.9898, 78.233))
					    ) * 43758.55));
					    highp vec2 tmpvar_34;
					    tmpvar_34 = (tmpvar_33 - uv_3);
					    highp float y_over_x_35;
					    y_over_x_35 = (tmpvar_34.y / tmpvar_34.x);
					    highp float tmpvar_36;
					    tmpvar_36 = (min (abs(y_over_x_35), 1.0) / max (abs(y_over_x_35), 1.0));
					    highp float tmpvar_37;
					    tmpvar_37 = (tmpvar_36 * tmpvar_36);
					    tmpvar_37 = (((
					      ((((
					        ((((-0.01213232 * tmpvar_37) + 0.05368138) * tmpvar_37) - 0.1173503)
					       * tmpvar_37) + 0.1938925) * tmpvar_37) - 0.3326756)
					     * tmpvar_37) + 0.9999793) * tmpvar_36);
					    tmpvar_37 = (tmpvar_37 + (float(
					      (abs(y_over_x_35) > 1.0)
					    ) * (
					      (tmpvar_37 * -2.0)
					     + 1.570796)));
					    v_27 = 1.0;
					    highp float tmpvar_38;
					    tmpvar_38 = ((tmpvar_32 * tmpvar_32) * ((
					      sin(((6.2831 * (tmpvar_37 * 
					        sign(y_over_x_35)
					      )) * tmpvar_29))
					     * 0.1) + 1.0));
					    highp float tmpvar_39;
					    tmpvar_39 = dot (tmpvar_34, tmpvar_34);
					    if ((tmpvar_39 < tmpvar_38)) {
					      v_27 = 0.2;
					    } else {
					      v_27 = pow ((dot (tmpvar_34, tmpvar_34) - tmpvar_38), 0.0625);
					    };
					    vI_1 = (vI_1 * mix ((0.3 + 
					      (0.2 * (1.0 - (tmpvar_32 / 0.02)))
					    ), 1.0, v_27));
					  };
					  if ((1 < tmpvar_25)) {
					    highp float seed_40;
					    seed_40 = (25.0 + tmpvar_4);
					    highp float v_41;
					    highp vec2 tmpvar_42;
					    tmpvar_42.y = 1.0;
					    tmpvar_42.x = seed_40;
					    highp float tmpvar_43;
					    tmpvar_43 = fract((sin(
					      dot (tmpvar_42, vec2(12.9898, 78.233))
					    ) * 43758.55));
					    highp vec2 tmpvar_44;
					    tmpvar_44.y = 1.0;
					    tmpvar_44.x = (seed_40 + 1.0);
					    highp vec2 tmpvar_45;
					    tmpvar_45.y = 1.0;
					    tmpvar_45.x = (seed_40 + 2.0);
					    highp float tmpvar_46;
					    tmpvar_46 = (0.01 * fract((
					      sin(dot (tmpvar_45, vec2(12.9898, 78.233)))
					     * 43758.55)));
					    highp vec2 tmpvar_47;
					    tmpvar_47.x = tmpvar_43;
					    tmpvar_47.y = fract((sin(
					      dot (tmpvar_44, vec2(12.9898, 78.233))
					    ) * 43758.55));
					    highp vec2 tmpvar_48;
					    tmpvar_48 = (tmpvar_47 - uv_3);
					    highp float y_over_x_49;
					    y_over_x_49 = (tmpvar_48.y / tmpvar_48.x);
					    highp float tmpvar_50;
					    tmpvar_50 = (min (abs(y_over_x_49), 1.0) / max (abs(y_over_x_49), 1.0));
					    highp float tmpvar_51;
					    tmpvar_51 = (tmpvar_50 * tmpvar_50);
					    tmpvar_51 = (((
					      ((((
					        ((((-0.01213232 * tmpvar_51) + 0.05368138) * tmpvar_51) - 0.1173503)
					       * tmpvar_51) + 0.1938925) * tmpvar_51) - 0.3326756)
					     * tmpvar_51) + 0.9999793) * tmpvar_50);
					    tmpvar_51 = (tmpvar_51 + (float(
					      (abs(y_over_x_49) > 1.0)
					    ) * (
					      (tmpvar_51 * -2.0)
					     + 1.570796)));
					    v_41 = 1.0;
					    highp float tmpvar_52;
					    tmpvar_52 = ((tmpvar_46 * tmpvar_46) * ((
					      sin(((6.2831 * (tmpvar_51 * 
					        sign(y_over_x_49)
					      )) * tmpvar_43))
					     * 0.1) + 1.0));
					    highp float tmpvar_53;
					    tmpvar_53 = dot (tmpvar_48, tmpvar_48);
					    if ((tmpvar_53 < tmpvar_52)) {
					      v_41 = 0.2;
					    } else {
					      v_41 = pow ((dot (tmpvar_48, tmpvar_48) - tmpvar_52), 0.0625);
					    };
					    vI_1 = (vI_1 * mix ((0.3 + 
					      (0.2 * (1.0 - (tmpvar_46 / 0.02)))
					    ), 1.0, v_41));
					  };
					  highp vec4 tmpvar_54;
					  tmpvar_54.w = 1.0;
					  tmpvar_54.xyz = (tmpvar_10 * vI_1);
					  gl_FragData[0] = tmpvar_54;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp float vI_1;
					  highp vec3 image_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  highp float tmpvar_4;
					  tmpvar_4 = float(int((_TimeX * 15.0)));
					  highp vec2 tmpvar_5;
					  tmpvar_5.y = 1.0;
					  tmpvar_5.x = tmpvar_4;
					  highp vec2 tmpvar_6;
					  tmpvar_6.y = 1.0;
					  tmpvar_6.x = (tmpvar_4 + 23.0);
					  highp vec2 tmpvar_7;
					  tmpvar_7.x = fract((sin(
					    dot (tmpvar_5, vec2(12.9898, 78.233))
					  ) * 43758.55));
					  tmpvar_7.y = fract((sin(
					    dot (tmpvar_6, vec2(12.9898, 78.233))
					  ) * 43758.55));
					  highp vec2 tmpvar_8;
					  tmpvar_8 = (uv_3 + (0.002 * tmpvar_7));
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = texture2D (_MainTex, tmpvar_8).xyz;
					  image_2 = tmpvar_9;
					  highp vec3 tmpvar_10;
					  tmpvar_10 = (dot (vec3(0.2126, 0.7152, 0.0722), image_2) * vec3(0.7, 0.7, 0.7));
					  highp vec2 tmpvar_11;
					  tmpvar_11.y = 1.0;
					  tmpvar_11.x = (tmpvar_4 + 8.0);
					  highp float tmpvar_12;
					  tmpvar_12 = fract((sin(
					    dot (tmpvar_11, vec2(12.9898, 78.233))
					  ) * 43758.55));
					  vI_1 = ((16.0 * (
					    ((uv_3.x * (1.0 - uv_3.x)) * uv_3.y)
					   * 
					    (1.0 - uv_3.y)
					  )) * mix (0.7, 1.0, (tmpvar_12 + 0.5)));
					  vI_1 = (vI_1 + (1.0 + (0.4 * tmpvar_12)));
					  vI_1 = (vI_1 * pow ((
					    (((16.0 * uv_3.x) * (1.0 - uv_3.x)) * uv_3.y)
					   * 
					    (1.0 - uv_3.y)
					  ), 0.4));
					  highp int tmpvar_13;
					  tmpvar_13 = int((8.0 * tmpvar_12));
					  if ((0 < tmpvar_13)) {
					    highp float l_14;
					    highp vec2 tmpvar_15;
					    tmpvar_15.y = 1.0;
					    tmpvar_15.x = (7.0 + tmpvar_4);
					    highp float tmpvar_16;
					    tmpvar_16 = fract((sin(
					      dot (tmpvar_15, vec2(12.9898, 78.233))
					    ) * 43758.55));
					    highp float tmpvar_17;
					    tmpvar_17 = (0.01 * tmpvar_16);
					    highp float tmpvar_18;
					    tmpvar_18 = (tmpvar_16 - 0.5);
					    if ((tmpvar_16 > 0.2)) {
					      l_14 = pow (abs((
					        ((tmpvar_16 * uv_3.x) + (tmpvar_17 * uv_3.y))
					       + tmpvar_18)), 0.125);
					    } else {
					      l_14 = (2.0 - pow (abs(
					        (((tmpvar_16 * uv_3.x) + (tmpvar_17 * uv_3.y)) + tmpvar_18)
					      ), 0.125));
					    };
					    vI_1 = (vI_1 * mix (0.5, 1.0, l_14));
					  };
					  if ((1 < tmpvar_13)) {
					    highp float l_19;
					    highp vec2 tmpvar_20;
					    tmpvar_20.y = 1.0;
					    tmpvar_20.x = (24.0 + tmpvar_4);
					    highp float tmpvar_21;
					    tmpvar_21 = fract((sin(
					      dot (tmpvar_20, vec2(12.9898, 78.233))
					    ) * 43758.55));
					    highp float tmpvar_22;
					    tmpvar_22 = (0.01 * tmpvar_21);
					    highp float tmpvar_23;
					    tmpvar_23 = (tmpvar_21 - 0.5);
					    if ((tmpvar_21 > 0.2)) {
					      l_19 = pow (abs((
					        ((tmpvar_21 * uv_3.x) + (tmpvar_22 * uv_3.y))
					       + tmpvar_23)), 0.125);
					    } else {
					      l_19 = (2.0 - pow (abs(
					        (((tmpvar_21 * uv_3.x) + (tmpvar_22 * uv_3.y)) + tmpvar_23)
					      ), 0.125));
					    };
					    vI_1 = (vI_1 * mix (0.5, 1.0, l_19));
					  };
					  highp vec2 tmpvar_24;
					  tmpvar_24.y = 1.0;
					  tmpvar_24.x = (tmpvar_4 + 18.0);
					  highp int tmpvar_25;
					  tmpvar_25 = int(max ((
					    (8.0 * fract((sin(
					      dot (tmpvar_24, vec2(12.9898, 78.233))
					    ) * 43758.55)))
					   - 2.0), 0.0));
					  if ((0 < tmpvar_25)) {
					    highp float seed_26;
					    seed_26 = (tmpvar_4 + 6.0);
					    highp float v_27;
					    highp vec2 tmpvar_28;
					    tmpvar_28.y = 1.0;
					    tmpvar_28.x = seed_26;
					    highp float tmpvar_29;
					    tmpvar_29 = fract((sin(
					      dot (tmpvar_28, vec2(12.9898, 78.233))
					    ) * 43758.55));
					    highp vec2 tmpvar_30;
					    tmpvar_30.y = 1.0;
					    tmpvar_30.x = (seed_26 + 1.0);
					    highp vec2 tmpvar_31;
					    tmpvar_31.y = 1.0;
					    tmpvar_31.x = (seed_26 + 2.0);
					    highp float tmpvar_32;
					    tmpvar_32 = (0.01 * fract((
					      sin(dot (tmpvar_31, vec2(12.9898, 78.233)))
					     * 43758.55)));
					    highp vec2 tmpvar_33;
					    tmpvar_33.x = tmpvar_29;
					    tmpvar_33.y = fract((sin(
					      dot (tmpvar_30, vec2(12.9898, 78.233))
					    ) * 43758.55));
					    highp vec2 tmpvar_34;
					    tmpvar_34 = (tmpvar_33 - uv_3);
					    highp float y_over_x_35;
					    y_over_x_35 = (tmpvar_34.y / tmpvar_34.x);
					    highp float tmpvar_36;
					    tmpvar_36 = (min (abs(y_over_x_35), 1.0) / max (abs(y_over_x_35), 1.0));
					    highp float tmpvar_37;
					    tmpvar_37 = (tmpvar_36 * tmpvar_36);
					    tmpvar_37 = (((
					      ((((
					        ((((-0.01213232 * tmpvar_37) + 0.05368138) * tmpvar_37) - 0.1173503)
					       * tmpvar_37) + 0.1938925) * tmpvar_37) - 0.3326756)
					     * tmpvar_37) + 0.9999793) * tmpvar_36);
					    tmpvar_37 = (tmpvar_37 + (float(
					      (abs(y_over_x_35) > 1.0)
					    ) * (
					      (tmpvar_37 * -2.0)
					     + 1.570796)));
					    v_27 = 1.0;
					    highp float tmpvar_38;
					    tmpvar_38 = ((tmpvar_32 * tmpvar_32) * ((
					      sin(((6.2831 * (tmpvar_37 * 
					        sign(y_over_x_35)
					      )) * tmpvar_29))
					     * 0.1) + 1.0));
					    highp float tmpvar_39;
					    tmpvar_39 = dot (tmpvar_34, tmpvar_34);
					    if ((tmpvar_39 < tmpvar_38)) {
					      v_27 = 0.2;
					    } else {
					      v_27 = pow ((dot (tmpvar_34, tmpvar_34) - tmpvar_38), 0.0625);
					    };
					    vI_1 = (vI_1 * mix ((0.3 + 
					      (0.2 * (1.0 - (tmpvar_32 / 0.02)))
					    ), 1.0, v_27));
					  };
					  if ((1 < tmpvar_25)) {
					    highp float seed_40;
					    seed_40 = (25.0 + tmpvar_4);
					    highp float v_41;
					    highp vec2 tmpvar_42;
					    tmpvar_42.y = 1.0;
					    tmpvar_42.x = seed_40;
					    highp float tmpvar_43;
					    tmpvar_43 = fract((sin(
					      dot (tmpvar_42, vec2(12.9898, 78.233))
					    ) * 43758.55));
					    highp vec2 tmpvar_44;
					    tmpvar_44.y = 1.0;
					    tmpvar_44.x = (seed_40 + 1.0);
					    highp vec2 tmpvar_45;
					    tmpvar_45.y = 1.0;
					    tmpvar_45.x = (seed_40 + 2.0);
					    highp float tmpvar_46;
					    tmpvar_46 = (0.01 * fract((
					      sin(dot (tmpvar_45, vec2(12.9898, 78.233)))
					     * 43758.55)));
					    highp vec2 tmpvar_47;
					    tmpvar_47.x = tmpvar_43;
					    tmpvar_47.y = fract((sin(
					      dot (tmpvar_44, vec2(12.9898, 78.233))
					    ) * 43758.55));
					    highp vec2 tmpvar_48;
					    tmpvar_48 = (tmpvar_47 - uv_3);
					    highp float y_over_x_49;
					    y_over_x_49 = (tmpvar_48.y / tmpvar_48.x);
					    highp float tmpvar_50;
					    tmpvar_50 = (min (abs(y_over_x_49), 1.0) / max (abs(y_over_x_49), 1.0));
					    highp float tmpvar_51;
					    tmpvar_51 = (tmpvar_50 * tmpvar_50);
					    tmpvar_51 = (((
					      ((((
					        ((((-0.01213232 * tmpvar_51) + 0.05368138) * tmpvar_51) - 0.1173503)
					       * tmpvar_51) + 0.1938925) * tmpvar_51) - 0.3326756)
					     * tmpvar_51) + 0.9999793) * tmpvar_50);
					    tmpvar_51 = (tmpvar_51 + (float(
					      (abs(y_over_x_49) > 1.0)
					    ) * (
					      (tmpvar_51 * -2.0)
					     + 1.570796)));
					    v_41 = 1.0;
					    highp float tmpvar_52;
					    tmpvar_52 = ((tmpvar_46 * tmpvar_46) * ((
					      sin(((6.2831 * (tmpvar_51 * 
					        sign(y_over_x_49)
					      )) * tmpvar_43))
					     * 0.1) + 1.0));
					    highp float tmpvar_53;
					    tmpvar_53 = dot (tmpvar_48, tmpvar_48);
					    if ((tmpvar_53 < tmpvar_52)) {
					      v_41 = 0.2;
					    } else {
					      v_41 = pow ((dot (tmpvar_48, tmpvar_48) - tmpvar_52), 0.0625);
					    };
					    vI_1 = (vI_1 * mix ((0.3 + 
					      (0.2 * (1.0 - (tmpvar_46 / 0.02)))
					    ), 1.0, v_41));
					  };
					  highp vec4 tmpvar_54;
					  tmpvar_54.w = 1.0;
					  tmpvar_54.xyz = (tmpvar_10 * vI_1);
					  gl_FragData[0] = tmpvar_54;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					vec2 u_xlat1;
					mediump vec2 u_xlat16_1;
					lowp vec3 u_xlat10_1;
					vec4 u_xlat2;
					bool u_xlatb2;
					float u_xlat3;
					float u_xlat4;
					vec3 u_xlat5;
					int u_xlati5;
					bvec2 u_xlatb5;
					vec2 u_xlat6;
					float u_xlat7;
					bool u_xlatb7;
					vec2 u_xlat8;
					float u_xlat9;
					mediump float u_xlat16_9;
					bool u_xlatb9;
					float u_xlat10;
					bool u_xlatb11;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat13;
					mediump float u_xlat16_13;
					bool u_xlatb13;
					float u_xlat14;
					bool u_xlatb14;
					void main()
					{
					    u_xlat0.x = _TimeX * 15.0;
					    u_xlat0.x = trunc(u_xlat0.x);
					    u_xlat0.y = 1.0;
					    u_xlat1.x = dot(u_xlat0.xy, vec2(12.9898005, 78.2330017));
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat0.zw = u_xlat0.xx + vec2(23.0, 8.0);
					    u_xlat8.x = dot(u_xlat0.zy, vec2(12.9898005, 78.2330017));
					    u_xlat8.x = sin(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x * 43758.5469;
					    u_xlat1.y = fract(u_xlat8.x);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.00200000009, 0.00200000009) + vs_TEXCOORD0.xy;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat8.x = dot(vec3(0.212599993, 0.715200007, 0.0722000003), u_xlat10_1.xyz);
					    u_xlat12 = dot(u_xlat0.wy, vec2(12.9898005, 78.2330017));
					    u_xlat8.y = sin(u_xlat12);
					    u_xlat8.xy = u_xlat8.xy * vec2(0.699999988, 43758.5469);
					    u_xlat12 = fract(u_xlat8.y);
					    u_xlat16_1.xy = (-vs_TEXCOORD0.xy) + vec2(1.0, 1.0);
					    u_xlat16_9 = u_xlat16_1.x * vs_TEXCOORD0.x;
					    u_xlat16_9 = u_xlat16_9 * vs_TEXCOORD0.y;
					    u_xlat16_9 = u_xlat16_1.y * u_xlat16_9;
					    u_xlat16_9 = u_xlat16_9 * 16.0;
					    u_xlat13 = u_xlat12 + 0.5;
					    u_xlat13 = u_xlat13 * 0.300000012 + 0.699999988;
					    u_xlat2.xy = vec2(u_xlat12) * vec2(0.400000006, 8.0);
					    u_xlat9 = u_xlat16_9 * u_xlat13 + u_xlat2.x;
					    u_xlat9 = u_xlat9 + 1.0;
					    u_xlat16_13 = vs_TEXCOORD0.x * 16.0;
					    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_13;
					    u_xlat16_1.x = u_xlat16_1.x * vs_TEXCOORD0.y;
					    u_xlat16_1.x = u_xlat16_1.y * u_xlat16_1.x;
					    u_xlat16_1.x = log2(u_xlat16_1.x);
					    u_xlat16_1.x = u_xlat16_1.x * 0.400000006;
					    u_xlat16_1.x = exp2(u_xlat16_1.x);
					    u_xlat1.x = u_xlat16_1.x * u_xlat9;
					    u_xlati5 = int(u_xlat2.y);
					    u_xlatb5.xy = lessThan(ivec4(0, 1, 0, 0), ivec4(u_xlati5)).xy;
					    u_xlat2 = u_xlat0.xyxy + vec4(7.0, 0.0, 24.0, 0.0);
					    u_xlat13 = dot(u_xlat2.xy, vec2(12.9898005, 78.2330017));
					    u_xlat13 = sin(u_xlat13);
					    u_xlat13 = u_xlat13 * 43758.5469;
					    u_xlat2.y = fract(u_xlat13);
					    u_xlat13 = u_xlat2.y * 0.00999999978;
					    u_xlat3 = u_xlat2.y + -0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb7 = !!(0.200000003<u_xlat2.y);
					#else
					    u_xlatb7 = 0.200000003<u_xlat2.y;
					#endif
					    u_xlat13 = u_xlat13 * vs_TEXCOORD0.y;
					    u_xlat13 = u_xlat2.y * vs_TEXCOORD0.x + u_xlat13;
					    u_xlat13 = u_xlat3 + u_xlat13;
					    u_xlat13 = log2(abs(u_xlat13));
					    u_xlat13 = u_xlat13 * 0.125;
					    u_xlat13 = exp2(u_xlat13);
					    u_xlat3 = (-u_xlat13) + 2.0;
					    u_xlat13 = (u_xlatb7) ? u_xlat13 : u_xlat3;
					    u_xlat13 = u_xlat13 * 0.5 + 0.5;
					    u_xlat13 = u_xlat13 * u_xlat1.x;
					    u_xlat1.x = (u_xlatb5.x) ? u_xlat13 : u_xlat1.x;
					    u_xlat5.x = dot(u_xlat2.zw, vec2(12.9898005, 78.2330017));
					    u_xlat5.x = sin(u_xlat5.x);
					    u_xlat5.x = u_xlat5.x * 43758.5469;
					    u_xlat5.x = fract(u_xlat5.x);
					    u_xlat13 = u_xlat5.x * 0.00999999978;
					    u_xlat10 = u_xlat5.x + -0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb14 = !!(0.200000003<u_xlat5.x);
					#else
					    u_xlatb14 = 0.200000003<u_xlat5.x;
					#endif
					    u_xlat13 = u_xlat13 * vs_TEXCOORD0.y;
					    u_xlat5.x = u_xlat5.x * vs_TEXCOORD0.x + u_xlat13;
					    u_xlat5.x = u_xlat10 + u_xlat5.x;
					    u_xlat5.x = log2(abs(u_xlat5.x));
					    u_xlat5.x = u_xlat5.x * 0.125;
					    u_xlat5.x = exp2(u_xlat5.x);
					    u_xlat13 = (-u_xlat5.x) + 2.0;
					    u_xlat5.x = (u_xlatb14) ? u_xlat5.x : u_xlat13;
					    u_xlat5.x = u_xlat5.x * 0.5 + 0.5;
					    u_xlat5.x = u_xlat5.x * u_xlat1.x;
					    u_xlat1.x = (u_xlatb5.y) ? u_xlat5.x : u_xlat1.x;
					    u_xlat5.xy = u_xlat0.xy + vec2(18.0, 0.0);
					    u_xlat5.x = dot(u_xlat5.xy, vec2(12.9898005, 78.2330017));
					    u_xlat5.x = sin(u_xlat5.x);
					    u_xlat5.x = u_xlat5.x * 43758.5469;
					    u_xlat5.x = fract(u_xlat5.x);
					    u_xlat5.x = u_xlat5.x * 8.0 + -2.0;
					    u_xlat5.x = max(u_xlat5.x, 0.0);
					    u_xlati5 = int(u_xlat5.x);
					    u_xlatb5.xy = lessThan(ivec4(0, 1, 0, 0), ivec4(u_xlati5)).xy;
					    if(u_xlatb5.x){
					        u_xlat5.xz = u_xlat0.xy + vec2(6.0, 0.0);
					        u_xlat5.x = dot(u_xlat5.xz, vec2(12.9898005, 78.2330017));
					        u_xlat5.x = sin(u_xlat5.x);
					        u_xlat5.x = u_xlat5.x * 43758.5469;
					        u_xlat2.x = fract(u_xlat5.x);
					        u_xlat5.x = u_xlat12 * 0.00999999978;
					        u_xlat6.xy = u_xlat2.xy + (-vs_TEXCOORD0.xy);
					        u_xlat13 = u_xlat6.y / u_xlat6.x;
					        u_xlat14 = min(abs(u_xlat13), 1.0);
					        u_xlat3 = max(abs(u_xlat13), 1.0);
					        u_xlat3 = float(1.0) / u_xlat3;
					        u_xlat14 = u_xlat14 * u_xlat3;
					        u_xlat3 = u_xlat14 * u_xlat14;
					        u_xlat7 = u_xlat3 * 0.0208350997 + -0.0851330012;
					        u_xlat7 = u_xlat3 * u_xlat7 + 0.180141002;
					        u_xlat7 = u_xlat3 * u_xlat7 + -0.330299497;
					        u_xlat3 = u_xlat3 * u_xlat7 + 0.999866009;
					        u_xlat7 = u_xlat14 * u_xlat3;
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb11 = !!(1.0<abs(u_xlat13));
					#else
					        u_xlatb11 = 1.0<abs(u_xlat13);
					#endif
					        u_xlat7 = u_xlat7 * -2.0 + 1.57079637;
					        u_xlat7 = u_xlatb11 ? u_xlat7 : float(0.0);
					        u_xlat14 = u_xlat14 * u_xlat3 + u_xlat7;
					        u_xlat13 = min(u_xlat13, 1.0);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb13 = !!(u_xlat13<(-u_xlat13));
					#else
					        u_xlatb13 = u_xlat13<(-u_xlat13);
					#endif
					        u_xlat13 = (u_xlatb13) ? (-u_xlat14) : u_xlat14;
					        u_xlat5.x = u_xlat5.x * u_xlat5.x;
					        u_xlat13 = u_xlat13 * u_xlat2.x;
					        u_xlat13 = u_xlat13 * 6.28310013;
					        u_xlat13 = sin(u_xlat13);
					        u_xlat13 = u_xlat13 * 0.100000001 + 1.0;
					        u_xlat2.x = u_xlat13 * u_xlat5.x;
					        u_xlat6.x = dot(u_xlat6.xy, u_xlat6.xy);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb2 = !!(u_xlat6.x<u_xlat2.x);
					#else
					        u_xlatb2 = u_xlat6.x<u_xlat2.x;
					#endif
					        u_xlat5.x = (-u_xlat5.x) * u_xlat13 + u_xlat6.x;
					        u_xlat5.x = log2(u_xlat5.x);
					        u_xlat5.x = u_xlat5.x * 0.0625;
					        u_xlat5.x = exp2(u_xlat5.x);
					        u_xlat5.x = (u_xlatb2) ? 0.200000003 : u_xlat5.x;
					        u_xlat12 = (-u_xlat12) * 0.5 + 1.0;
					        u_xlat12 = u_xlat12 * 0.200000003 + 0.300000012;
					        u_xlat13 = (-u_xlat12) + 1.0;
					        u_xlat12 = u_xlat5.x * u_xlat13 + u_xlat12;
					        u_xlat1.x = u_xlat12 * u_xlat1.x;
					    //ENDIF
					    }
					    if(u_xlatb5.y){
					        u_xlat2 = u_xlat0.xyxy + vec4(25.0, 0.0, 26.0, 0.0);
					        u_xlat12 = dot(u_xlat2.xy, vec2(12.9898005, 78.2330017));
					        u_xlat12 = sin(u_xlat12);
					        u_xlat12 = u_xlat12 * 43758.5469;
					        u_xlat2.x = fract(u_xlat12);
					        u_xlat12 = dot(u_xlat2.zw, vec2(12.9898005, 78.2330017));
					        u_xlat12 = sin(u_xlat12);
					        u_xlat12 = u_xlat12 * 43758.5469;
					        u_xlat2.y = fract(u_xlat12);
					        u_xlat0.xy = u_xlat0.xy + vec2(27.0, 0.0);
					        u_xlat0.x = dot(u_xlat0.xy, vec2(12.9898005, 78.2330017));
					        u_xlat0.x = sin(u_xlat0.x);
					        u_xlat0.x = u_xlat0.x * 43758.5469;
					        u_xlat0.x = fract(u_xlat0.x);
					        u_xlat4 = u_xlat0.x * 0.00999999978;
					        u_xlat5.xy = u_xlat2.xy + (-vs_TEXCOORD0.xy);
					        u_xlat12 = u_xlat5.y / u_xlat5.x;
					        u_xlat13 = min(abs(u_xlat12), 1.0);
					        u_xlat6.x = max(abs(u_xlat12), 1.0);
					        u_xlat6.x = float(1.0) / u_xlat6.x;
					        u_xlat13 = u_xlat13 * u_xlat6.x;
					        u_xlat6.x = u_xlat13 * u_xlat13;
					        u_xlat10 = u_xlat6.x * 0.0208350997 + -0.0851330012;
					        u_xlat10 = u_xlat6.x * u_xlat10 + 0.180141002;
					        u_xlat10 = u_xlat6.x * u_xlat10 + -0.330299497;
					        u_xlat6.x = u_xlat6.x * u_xlat10 + 0.999866009;
					        u_xlat10 = u_xlat13 * u_xlat6.x;
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb14 = !!(1.0<abs(u_xlat12));
					#else
					        u_xlatb14 = 1.0<abs(u_xlat12);
					#endif
					        u_xlat10 = u_xlat10 * -2.0 + 1.57079637;
					        u_xlat10 = u_xlatb14 ? u_xlat10 : float(0.0);
					        u_xlat13 = u_xlat13 * u_xlat6.x + u_xlat10;
					        u_xlat12 = min(u_xlat12, 1.0);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb12 = !!(u_xlat12<(-u_xlat12));
					#else
					        u_xlatb12 = u_xlat12<(-u_xlat12);
					#endif
					        u_xlat12 = (u_xlatb12) ? (-u_xlat13) : u_xlat13;
					        u_xlat4 = u_xlat4 * u_xlat4;
					        u_xlat12 = u_xlat12 * u_xlat2.x;
					        u_xlat12 = u_xlat12 * 6.28310013;
					        u_xlat12 = sin(u_xlat12);
					        u_xlat12 = u_xlat12 * 0.100000001 + 1.0;
					        u_xlat13 = u_xlat12 * u_xlat4;
					        u_xlat5.x = dot(u_xlat5.xy, u_xlat5.xy);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb9 = !!(u_xlat5.x<u_xlat13);
					#else
					        u_xlatb9 = u_xlat5.x<u_xlat13;
					#endif
					        u_xlat4 = (-u_xlat4) * u_xlat12 + u_xlat5.x;
					        u_xlat4 = log2(u_xlat4);
					        u_xlat4 = u_xlat4 * 0.0625;
					        u_xlat4 = exp2(u_xlat4);
					        u_xlat4 = (u_xlatb9) ? 0.200000003 : u_xlat4;
					        u_xlat0.x = (-u_xlat0.x) * 0.5 + 1.0;
					        u_xlat0.x = u_xlat0.x * 0.200000003 + 0.300000012;
					        u_xlat12 = (-u_xlat0.x) + 1.0;
					        u_xlat0.x = u_xlat4 * u_xlat12 + u_xlat0.x;
					        u_xlat1.x = u_xlat0.x * u_xlat1.x;
					    //ENDIF
					    }
					    SV_Target0.xyz = u_xlat8.xxx * u_xlat1.xxx;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					vec2 u_xlat1;
					mediump vec2 u_xlat16_1;
					lowp vec3 u_xlat10_1;
					vec4 u_xlat2;
					bool u_xlatb2;
					float u_xlat3;
					float u_xlat4;
					vec3 u_xlat5;
					int u_xlati5;
					bvec2 u_xlatb5;
					vec2 u_xlat6;
					float u_xlat7;
					bool u_xlatb7;
					vec2 u_xlat8;
					float u_xlat9;
					mediump float u_xlat16_9;
					bool u_xlatb9;
					float u_xlat10;
					bool u_xlatb11;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat13;
					mediump float u_xlat16_13;
					bool u_xlatb13;
					float u_xlat14;
					bool u_xlatb14;
					void main()
					{
					    u_xlat0.x = _TimeX * 15.0;
					    u_xlat0.x = trunc(u_xlat0.x);
					    u_xlat0.y = 1.0;
					    u_xlat1.x = dot(u_xlat0.xy, vec2(12.9898005, 78.2330017));
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat0.zw = u_xlat0.xx + vec2(23.0, 8.0);
					    u_xlat8.x = dot(u_xlat0.zy, vec2(12.9898005, 78.2330017));
					    u_xlat8.x = sin(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x * 43758.5469;
					    u_xlat1.y = fract(u_xlat8.x);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.00200000009, 0.00200000009) + vs_TEXCOORD0.xy;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat8.x = dot(vec3(0.212599993, 0.715200007, 0.0722000003), u_xlat10_1.xyz);
					    u_xlat12 = dot(u_xlat0.wy, vec2(12.9898005, 78.2330017));
					    u_xlat8.y = sin(u_xlat12);
					    u_xlat8.xy = u_xlat8.xy * vec2(0.699999988, 43758.5469);
					    u_xlat12 = fract(u_xlat8.y);
					    u_xlat16_1.xy = (-vs_TEXCOORD0.xy) + vec2(1.0, 1.0);
					    u_xlat16_9 = u_xlat16_1.x * vs_TEXCOORD0.x;
					    u_xlat16_9 = u_xlat16_9 * vs_TEXCOORD0.y;
					    u_xlat16_9 = u_xlat16_1.y * u_xlat16_9;
					    u_xlat16_9 = u_xlat16_9 * 16.0;
					    u_xlat13 = u_xlat12 + 0.5;
					    u_xlat13 = u_xlat13 * 0.300000012 + 0.699999988;
					    u_xlat2.xy = vec2(u_xlat12) * vec2(0.400000006, 8.0);
					    u_xlat9 = u_xlat16_9 * u_xlat13 + u_xlat2.x;
					    u_xlat9 = u_xlat9 + 1.0;
					    u_xlat16_13 = vs_TEXCOORD0.x * 16.0;
					    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_13;
					    u_xlat16_1.x = u_xlat16_1.x * vs_TEXCOORD0.y;
					    u_xlat16_1.x = u_xlat16_1.y * u_xlat16_1.x;
					    u_xlat16_1.x = log2(u_xlat16_1.x);
					    u_xlat16_1.x = u_xlat16_1.x * 0.400000006;
					    u_xlat16_1.x = exp2(u_xlat16_1.x);
					    u_xlat1.x = u_xlat16_1.x * u_xlat9;
					    u_xlati5 = int(u_xlat2.y);
					    u_xlatb5.xy = lessThan(ivec4(0, 1, 0, 0), ivec4(u_xlati5)).xy;
					    u_xlat2 = u_xlat0.xyxy + vec4(7.0, 0.0, 24.0, 0.0);
					    u_xlat13 = dot(u_xlat2.xy, vec2(12.9898005, 78.2330017));
					    u_xlat13 = sin(u_xlat13);
					    u_xlat13 = u_xlat13 * 43758.5469;
					    u_xlat2.y = fract(u_xlat13);
					    u_xlat13 = u_xlat2.y * 0.00999999978;
					    u_xlat3 = u_xlat2.y + -0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb7 = !!(0.200000003<u_xlat2.y);
					#else
					    u_xlatb7 = 0.200000003<u_xlat2.y;
					#endif
					    u_xlat13 = u_xlat13 * vs_TEXCOORD0.y;
					    u_xlat13 = u_xlat2.y * vs_TEXCOORD0.x + u_xlat13;
					    u_xlat13 = u_xlat3 + u_xlat13;
					    u_xlat13 = log2(abs(u_xlat13));
					    u_xlat13 = u_xlat13 * 0.125;
					    u_xlat13 = exp2(u_xlat13);
					    u_xlat3 = (-u_xlat13) + 2.0;
					    u_xlat13 = (u_xlatb7) ? u_xlat13 : u_xlat3;
					    u_xlat13 = u_xlat13 * 0.5 + 0.5;
					    u_xlat13 = u_xlat13 * u_xlat1.x;
					    u_xlat1.x = (u_xlatb5.x) ? u_xlat13 : u_xlat1.x;
					    u_xlat5.x = dot(u_xlat2.zw, vec2(12.9898005, 78.2330017));
					    u_xlat5.x = sin(u_xlat5.x);
					    u_xlat5.x = u_xlat5.x * 43758.5469;
					    u_xlat5.x = fract(u_xlat5.x);
					    u_xlat13 = u_xlat5.x * 0.00999999978;
					    u_xlat10 = u_xlat5.x + -0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb14 = !!(0.200000003<u_xlat5.x);
					#else
					    u_xlatb14 = 0.200000003<u_xlat5.x;
					#endif
					    u_xlat13 = u_xlat13 * vs_TEXCOORD0.y;
					    u_xlat5.x = u_xlat5.x * vs_TEXCOORD0.x + u_xlat13;
					    u_xlat5.x = u_xlat10 + u_xlat5.x;
					    u_xlat5.x = log2(abs(u_xlat5.x));
					    u_xlat5.x = u_xlat5.x * 0.125;
					    u_xlat5.x = exp2(u_xlat5.x);
					    u_xlat13 = (-u_xlat5.x) + 2.0;
					    u_xlat5.x = (u_xlatb14) ? u_xlat5.x : u_xlat13;
					    u_xlat5.x = u_xlat5.x * 0.5 + 0.5;
					    u_xlat5.x = u_xlat5.x * u_xlat1.x;
					    u_xlat1.x = (u_xlatb5.y) ? u_xlat5.x : u_xlat1.x;
					    u_xlat5.xy = u_xlat0.xy + vec2(18.0, 0.0);
					    u_xlat5.x = dot(u_xlat5.xy, vec2(12.9898005, 78.2330017));
					    u_xlat5.x = sin(u_xlat5.x);
					    u_xlat5.x = u_xlat5.x * 43758.5469;
					    u_xlat5.x = fract(u_xlat5.x);
					    u_xlat5.x = u_xlat5.x * 8.0 + -2.0;
					    u_xlat5.x = max(u_xlat5.x, 0.0);
					    u_xlati5 = int(u_xlat5.x);
					    u_xlatb5.xy = lessThan(ivec4(0, 1, 0, 0), ivec4(u_xlati5)).xy;
					    if(u_xlatb5.x){
					        u_xlat5.xz = u_xlat0.xy + vec2(6.0, 0.0);
					        u_xlat5.x = dot(u_xlat5.xz, vec2(12.9898005, 78.2330017));
					        u_xlat5.x = sin(u_xlat5.x);
					        u_xlat5.x = u_xlat5.x * 43758.5469;
					        u_xlat2.x = fract(u_xlat5.x);
					        u_xlat5.x = u_xlat12 * 0.00999999978;
					        u_xlat6.xy = u_xlat2.xy + (-vs_TEXCOORD0.xy);
					        u_xlat13 = u_xlat6.y / u_xlat6.x;
					        u_xlat14 = min(abs(u_xlat13), 1.0);
					        u_xlat3 = max(abs(u_xlat13), 1.0);
					        u_xlat3 = float(1.0) / u_xlat3;
					        u_xlat14 = u_xlat14 * u_xlat3;
					        u_xlat3 = u_xlat14 * u_xlat14;
					        u_xlat7 = u_xlat3 * 0.0208350997 + -0.0851330012;
					        u_xlat7 = u_xlat3 * u_xlat7 + 0.180141002;
					        u_xlat7 = u_xlat3 * u_xlat7 + -0.330299497;
					        u_xlat3 = u_xlat3 * u_xlat7 + 0.999866009;
					        u_xlat7 = u_xlat14 * u_xlat3;
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb11 = !!(1.0<abs(u_xlat13));
					#else
					        u_xlatb11 = 1.0<abs(u_xlat13);
					#endif
					        u_xlat7 = u_xlat7 * -2.0 + 1.57079637;
					        u_xlat7 = u_xlatb11 ? u_xlat7 : float(0.0);
					        u_xlat14 = u_xlat14 * u_xlat3 + u_xlat7;
					        u_xlat13 = min(u_xlat13, 1.0);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb13 = !!(u_xlat13<(-u_xlat13));
					#else
					        u_xlatb13 = u_xlat13<(-u_xlat13);
					#endif
					        u_xlat13 = (u_xlatb13) ? (-u_xlat14) : u_xlat14;
					        u_xlat5.x = u_xlat5.x * u_xlat5.x;
					        u_xlat13 = u_xlat13 * u_xlat2.x;
					        u_xlat13 = u_xlat13 * 6.28310013;
					        u_xlat13 = sin(u_xlat13);
					        u_xlat13 = u_xlat13 * 0.100000001 + 1.0;
					        u_xlat2.x = u_xlat13 * u_xlat5.x;
					        u_xlat6.x = dot(u_xlat6.xy, u_xlat6.xy);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb2 = !!(u_xlat6.x<u_xlat2.x);
					#else
					        u_xlatb2 = u_xlat6.x<u_xlat2.x;
					#endif
					        u_xlat5.x = (-u_xlat5.x) * u_xlat13 + u_xlat6.x;
					        u_xlat5.x = log2(u_xlat5.x);
					        u_xlat5.x = u_xlat5.x * 0.0625;
					        u_xlat5.x = exp2(u_xlat5.x);
					        u_xlat5.x = (u_xlatb2) ? 0.200000003 : u_xlat5.x;
					        u_xlat12 = (-u_xlat12) * 0.5 + 1.0;
					        u_xlat12 = u_xlat12 * 0.200000003 + 0.300000012;
					        u_xlat13 = (-u_xlat12) + 1.0;
					        u_xlat12 = u_xlat5.x * u_xlat13 + u_xlat12;
					        u_xlat1.x = u_xlat12 * u_xlat1.x;
					    //ENDIF
					    }
					    if(u_xlatb5.y){
					        u_xlat2 = u_xlat0.xyxy + vec4(25.0, 0.0, 26.0, 0.0);
					        u_xlat12 = dot(u_xlat2.xy, vec2(12.9898005, 78.2330017));
					        u_xlat12 = sin(u_xlat12);
					        u_xlat12 = u_xlat12 * 43758.5469;
					        u_xlat2.x = fract(u_xlat12);
					        u_xlat12 = dot(u_xlat2.zw, vec2(12.9898005, 78.2330017));
					        u_xlat12 = sin(u_xlat12);
					        u_xlat12 = u_xlat12 * 43758.5469;
					        u_xlat2.y = fract(u_xlat12);
					        u_xlat0.xy = u_xlat0.xy + vec2(27.0, 0.0);
					        u_xlat0.x = dot(u_xlat0.xy, vec2(12.9898005, 78.2330017));
					        u_xlat0.x = sin(u_xlat0.x);
					        u_xlat0.x = u_xlat0.x * 43758.5469;
					        u_xlat0.x = fract(u_xlat0.x);
					        u_xlat4 = u_xlat0.x * 0.00999999978;
					        u_xlat5.xy = u_xlat2.xy + (-vs_TEXCOORD0.xy);
					        u_xlat12 = u_xlat5.y / u_xlat5.x;
					        u_xlat13 = min(abs(u_xlat12), 1.0);
					        u_xlat6.x = max(abs(u_xlat12), 1.0);
					        u_xlat6.x = float(1.0) / u_xlat6.x;
					        u_xlat13 = u_xlat13 * u_xlat6.x;
					        u_xlat6.x = u_xlat13 * u_xlat13;
					        u_xlat10 = u_xlat6.x * 0.0208350997 + -0.0851330012;
					        u_xlat10 = u_xlat6.x * u_xlat10 + 0.180141002;
					        u_xlat10 = u_xlat6.x * u_xlat10 + -0.330299497;
					        u_xlat6.x = u_xlat6.x * u_xlat10 + 0.999866009;
					        u_xlat10 = u_xlat13 * u_xlat6.x;
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb14 = !!(1.0<abs(u_xlat12));
					#else
					        u_xlatb14 = 1.0<abs(u_xlat12);
					#endif
					        u_xlat10 = u_xlat10 * -2.0 + 1.57079637;
					        u_xlat10 = u_xlatb14 ? u_xlat10 : float(0.0);
					        u_xlat13 = u_xlat13 * u_xlat6.x + u_xlat10;
					        u_xlat12 = min(u_xlat12, 1.0);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb12 = !!(u_xlat12<(-u_xlat12));
					#else
					        u_xlatb12 = u_xlat12<(-u_xlat12);
					#endif
					        u_xlat12 = (u_xlatb12) ? (-u_xlat13) : u_xlat13;
					        u_xlat4 = u_xlat4 * u_xlat4;
					        u_xlat12 = u_xlat12 * u_xlat2.x;
					        u_xlat12 = u_xlat12 * 6.28310013;
					        u_xlat12 = sin(u_xlat12);
					        u_xlat12 = u_xlat12 * 0.100000001 + 1.0;
					        u_xlat13 = u_xlat12 * u_xlat4;
					        u_xlat5.x = dot(u_xlat5.xy, u_xlat5.xy);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb9 = !!(u_xlat5.x<u_xlat13);
					#else
					        u_xlatb9 = u_xlat5.x<u_xlat13;
					#endif
					        u_xlat4 = (-u_xlat4) * u_xlat12 + u_xlat5.x;
					        u_xlat4 = log2(u_xlat4);
					        u_xlat4 = u_xlat4 * 0.0625;
					        u_xlat4 = exp2(u_xlat4);
					        u_xlat4 = (u_xlatb9) ? 0.200000003 : u_xlat4;
					        u_xlat0.x = (-u_xlat0.x) * 0.5 + 1.0;
					        u_xlat0.x = u_xlat0.x * 0.200000003 + 0.300000012;
					        u_xlat12 = (-u_xlat0.x) + 1.0;
					        u_xlat0.x = u_xlat4 * u_xlat12 + u_xlat0.x;
					        u_xlat1.x = u_xlat0.x * u_xlat1.x;
					    //ENDIF
					    }
					    SV_Target0.xyz = u_xlat8.xxx * u_xlat1.xxx;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					vec2 u_xlat1;
					mediump vec2 u_xlat16_1;
					lowp vec3 u_xlat10_1;
					vec4 u_xlat2;
					bool u_xlatb2;
					float u_xlat3;
					float u_xlat4;
					vec3 u_xlat5;
					int u_xlati5;
					bvec2 u_xlatb5;
					vec2 u_xlat6;
					float u_xlat7;
					bool u_xlatb7;
					vec2 u_xlat8;
					float u_xlat9;
					mediump float u_xlat16_9;
					bool u_xlatb9;
					float u_xlat10;
					bool u_xlatb11;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat13;
					mediump float u_xlat16_13;
					bool u_xlatb13;
					float u_xlat14;
					bool u_xlatb14;
					void main()
					{
					    u_xlat0.x = _TimeX * 15.0;
					    u_xlat0.x = trunc(u_xlat0.x);
					    u_xlat0.y = 1.0;
					    u_xlat1.x = dot(u_xlat0.xy, vec2(12.9898005, 78.2330017));
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat0.zw = u_xlat0.xx + vec2(23.0, 8.0);
					    u_xlat8.x = dot(u_xlat0.zy, vec2(12.9898005, 78.2330017));
					    u_xlat8.x = sin(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x * 43758.5469;
					    u_xlat1.y = fract(u_xlat8.x);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.00200000009, 0.00200000009) + vs_TEXCOORD0.xy;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat8.x = dot(vec3(0.212599993, 0.715200007, 0.0722000003), u_xlat10_1.xyz);
					    u_xlat12 = dot(u_xlat0.wy, vec2(12.9898005, 78.2330017));
					    u_xlat8.y = sin(u_xlat12);
					    u_xlat8.xy = u_xlat8.xy * vec2(0.699999988, 43758.5469);
					    u_xlat12 = fract(u_xlat8.y);
					    u_xlat16_1.xy = (-vs_TEXCOORD0.xy) + vec2(1.0, 1.0);
					    u_xlat16_9 = u_xlat16_1.x * vs_TEXCOORD0.x;
					    u_xlat16_9 = u_xlat16_9 * vs_TEXCOORD0.y;
					    u_xlat16_9 = u_xlat16_1.y * u_xlat16_9;
					    u_xlat16_9 = u_xlat16_9 * 16.0;
					    u_xlat13 = u_xlat12 + 0.5;
					    u_xlat13 = u_xlat13 * 0.300000012 + 0.699999988;
					    u_xlat2.xy = vec2(u_xlat12) * vec2(0.400000006, 8.0);
					    u_xlat9 = u_xlat16_9 * u_xlat13 + u_xlat2.x;
					    u_xlat9 = u_xlat9 + 1.0;
					    u_xlat16_13 = vs_TEXCOORD0.x * 16.0;
					    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_13;
					    u_xlat16_1.x = u_xlat16_1.x * vs_TEXCOORD0.y;
					    u_xlat16_1.x = u_xlat16_1.y * u_xlat16_1.x;
					    u_xlat16_1.x = log2(u_xlat16_1.x);
					    u_xlat16_1.x = u_xlat16_1.x * 0.400000006;
					    u_xlat16_1.x = exp2(u_xlat16_1.x);
					    u_xlat1.x = u_xlat16_1.x * u_xlat9;
					    u_xlati5 = int(u_xlat2.y);
					    u_xlatb5.xy = lessThan(ivec4(0, 1, 0, 0), ivec4(u_xlati5)).xy;
					    u_xlat2 = u_xlat0.xyxy + vec4(7.0, 0.0, 24.0, 0.0);
					    u_xlat13 = dot(u_xlat2.xy, vec2(12.9898005, 78.2330017));
					    u_xlat13 = sin(u_xlat13);
					    u_xlat13 = u_xlat13 * 43758.5469;
					    u_xlat2.y = fract(u_xlat13);
					    u_xlat13 = u_xlat2.y * 0.00999999978;
					    u_xlat3 = u_xlat2.y + -0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb7 = !!(0.200000003<u_xlat2.y);
					#else
					    u_xlatb7 = 0.200000003<u_xlat2.y;
					#endif
					    u_xlat13 = u_xlat13 * vs_TEXCOORD0.y;
					    u_xlat13 = u_xlat2.y * vs_TEXCOORD0.x + u_xlat13;
					    u_xlat13 = u_xlat3 + u_xlat13;
					    u_xlat13 = log2(abs(u_xlat13));
					    u_xlat13 = u_xlat13 * 0.125;
					    u_xlat13 = exp2(u_xlat13);
					    u_xlat3 = (-u_xlat13) + 2.0;
					    u_xlat13 = (u_xlatb7) ? u_xlat13 : u_xlat3;
					    u_xlat13 = u_xlat13 * 0.5 + 0.5;
					    u_xlat13 = u_xlat13 * u_xlat1.x;
					    u_xlat1.x = (u_xlatb5.x) ? u_xlat13 : u_xlat1.x;
					    u_xlat5.x = dot(u_xlat2.zw, vec2(12.9898005, 78.2330017));
					    u_xlat5.x = sin(u_xlat5.x);
					    u_xlat5.x = u_xlat5.x * 43758.5469;
					    u_xlat5.x = fract(u_xlat5.x);
					    u_xlat13 = u_xlat5.x * 0.00999999978;
					    u_xlat10 = u_xlat5.x + -0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb14 = !!(0.200000003<u_xlat5.x);
					#else
					    u_xlatb14 = 0.200000003<u_xlat5.x;
					#endif
					    u_xlat13 = u_xlat13 * vs_TEXCOORD0.y;
					    u_xlat5.x = u_xlat5.x * vs_TEXCOORD0.x + u_xlat13;
					    u_xlat5.x = u_xlat10 + u_xlat5.x;
					    u_xlat5.x = log2(abs(u_xlat5.x));
					    u_xlat5.x = u_xlat5.x * 0.125;
					    u_xlat5.x = exp2(u_xlat5.x);
					    u_xlat13 = (-u_xlat5.x) + 2.0;
					    u_xlat5.x = (u_xlatb14) ? u_xlat5.x : u_xlat13;
					    u_xlat5.x = u_xlat5.x * 0.5 + 0.5;
					    u_xlat5.x = u_xlat5.x * u_xlat1.x;
					    u_xlat1.x = (u_xlatb5.y) ? u_xlat5.x : u_xlat1.x;
					    u_xlat5.xy = u_xlat0.xy + vec2(18.0, 0.0);
					    u_xlat5.x = dot(u_xlat5.xy, vec2(12.9898005, 78.2330017));
					    u_xlat5.x = sin(u_xlat5.x);
					    u_xlat5.x = u_xlat5.x * 43758.5469;
					    u_xlat5.x = fract(u_xlat5.x);
					    u_xlat5.x = u_xlat5.x * 8.0 + -2.0;
					    u_xlat5.x = max(u_xlat5.x, 0.0);
					    u_xlati5 = int(u_xlat5.x);
					    u_xlatb5.xy = lessThan(ivec4(0, 1, 0, 0), ivec4(u_xlati5)).xy;
					    if(u_xlatb5.x){
					        u_xlat5.xz = u_xlat0.xy + vec2(6.0, 0.0);
					        u_xlat5.x = dot(u_xlat5.xz, vec2(12.9898005, 78.2330017));
					        u_xlat5.x = sin(u_xlat5.x);
					        u_xlat5.x = u_xlat5.x * 43758.5469;
					        u_xlat2.x = fract(u_xlat5.x);
					        u_xlat5.x = u_xlat12 * 0.00999999978;
					        u_xlat6.xy = u_xlat2.xy + (-vs_TEXCOORD0.xy);
					        u_xlat13 = u_xlat6.y / u_xlat6.x;
					        u_xlat14 = min(abs(u_xlat13), 1.0);
					        u_xlat3 = max(abs(u_xlat13), 1.0);
					        u_xlat3 = float(1.0) / u_xlat3;
					        u_xlat14 = u_xlat14 * u_xlat3;
					        u_xlat3 = u_xlat14 * u_xlat14;
					        u_xlat7 = u_xlat3 * 0.0208350997 + -0.0851330012;
					        u_xlat7 = u_xlat3 * u_xlat7 + 0.180141002;
					        u_xlat7 = u_xlat3 * u_xlat7 + -0.330299497;
					        u_xlat3 = u_xlat3 * u_xlat7 + 0.999866009;
					        u_xlat7 = u_xlat14 * u_xlat3;
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb11 = !!(1.0<abs(u_xlat13));
					#else
					        u_xlatb11 = 1.0<abs(u_xlat13);
					#endif
					        u_xlat7 = u_xlat7 * -2.0 + 1.57079637;
					        u_xlat7 = u_xlatb11 ? u_xlat7 : float(0.0);
					        u_xlat14 = u_xlat14 * u_xlat3 + u_xlat7;
					        u_xlat13 = min(u_xlat13, 1.0);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb13 = !!(u_xlat13<(-u_xlat13));
					#else
					        u_xlatb13 = u_xlat13<(-u_xlat13);
					#endif
					        u_xlat13 = (u_xlatb13) ? (-u_xlat14) : u_xlat14;
					        u_xlat5.x = u_xlat5.x * u_xlat5.x;
					        u_xlat13 = u_xlat13 * u_xlat2.x;
					        u_xlat13 = u_xlat13 * 6.28310013;
					        u_xlat13 = sin(u_xlat13);
					        u_xlat13 = u_xlat13 * 0.100000001 + 1.0;
					        u_xlat2.x = u_xlat13 * u_xlat5.x;
					        u_xlat6.x = dot(u_xlat6.xy, u_xlat6.xy);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb2 = !!(u_xlat6.x<u_xlat2.x);
					#else
					        u_xlatb2 = u_xlat6.x<u_xlat2.x;
					#endif
					        u_xlat5.x = (-u_xlat5.x) * u_xlat13 + u_xlat6.x;
					        u_xlat5.x = log2(u_xlat5.x);
					        u_xlat5.x = u_xlat5.x * 0.0625;
					        u_xlat5.x = exp2(u_xlat5.x);
					        u_xlat5.x = (u_xlatb2) ? 0.200000003 : u_xlat5.x;
					        u_xlat12 = (-u_xlat12) * 0.5 + 1.0;
					        u_xlat12 = u_xlat12 * 0.200000003 + 0.300000012;
					        u_xlat13 = (-u_xlat12) + 1.0;
					        u_xlat12 = u_xlat5.x * u_xlat13 + u_xlat12;
					        u_xlat1.x = u_xlat12 * u_xlat1.x;
					    //ENDIF
					    }
					    if(u_xlatb5.y){
					        u_xlat2 = u_xlat0.xyxy + vec4(25.0, 0.0, 26.0, 0.0);
					        u_xlat12 = dot(u_xlat2.xy, vec2(12.9898005, 78.2330017));
					        u_xlat12 = sin(u_xlat12);
					        u_xlat12 = u_xlat12 * 43758.5469;
					        u_xlat2.x = fract(u_xlat12);
					        u_xlat12 = dot(u_xlat2.zw, vec2(12.9898005, 78.2330017));
					        u_xlat12 = sin(u_xlat12);
					        u_xlat12 = u_xlat12 * 43758.5469;
					        u_xlat2.y = fract(u_xlat12);
					        u_xlat0.xy = u_xlat0.xy + vec2(27.0, 0.0);
					        u_xlat0.x = dot(u_xlat0.xy, vec2(12.9898005, 78.2330017));
					        u_xlat0.x = sin(u_xlat0.x);
					        u_xlat0.x = u_xlat0.x * 43758.5469;
					        u_xlat0.x = fract(u_xlat0.x);
					        u_xlat4 = u_xlat0.x * 0.00999999978;
					        u_xlat5.xy = u_xlat2.xy + (-vs_TEXCOORD0.xy);
					        u_xlat12 = u_xlat5.y / u_xlat5.x;
					        u_xlat13 = min(abs(u_xlat12), 1.0);
					        u_xlat6.x = max(abs(u_xlat12), 1.0);
					        u_xlat6.x = float(1.0) / u_xlat6.x;
					        u_xlat13 = u_xlat13 * u_xlat6.x;
					        u_xlat6.x = u_xlat13 * u_xlat13;
					        u_xlat10 = u_xlat6.x * 0.0208350997 + -0.0851330012;
					        u_xlat10 = u_xlat6.x * u_xlat10 + 0.180141002;
					        u_xlat10 = u_xlat6.x * u_xlat10 + -0.330299497;
					        u_xlat6.x = u_xlat6.x * u_xlat10 + 0.999866009;
					        u_xlat10 = u_xlat13 * u_xlat6.x;
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb14 = !!(1.0<abs(u_xlat12));
					#else
					        u_xlatb14 = 1.0<abs(u_xlat12);
					#endif
					        u_xlat10 = u_xlat10 * -2.0 + 1.57079637;
					        u_xlat10 = u_xlatb14 ? u_xlat10 : float(0.0);
					        u_xlat13 = u_xlat13 * u_xlat6.x + u_xlat10;
					        u_xlat12 = min(u_xlat12, 1.0);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb12 = !!(u_xlat12<(-u_xlat12));
					#else
					        u_xlatb12 = u_xlat12<(-u_xlat12);
					#endif
					        u_xlat12 = (u_xlatb12) ? (-u_xlat13) : u_xlat13;
					        u_xlat4 = u_xlat4 * u_xlat4;
					        u_xlat12 = u_xlat12 * u_xlat2.x;
					        u_xlat12 = u_xlat12 * 6.28310013;
					        u_xlat12 = sin(u_xlat12);
					        u_xlat12 = u_xlat12 * 0.100000001 + 1.0;
					        u_xlat13 = u_xlat12 * u_xlat4;
					        u_xlat5.x = dot(u_xlat5.xy, u_xlat5.xy);
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb9 = !!(u_xlat5.x<u_xlat13);
					#else
					        u_xlatb9 = u_xlat5.x<u_xlat13;
					#endif
					        u_xlat4 = (-u_xlat4) * u_xlat12 + u_xlat5.x;
					        u_xlat4 = log2(u_xlat4);
					        u_xlat4 = u_xlat4 * 0.0625;
					        u_xlat4 = exp2(u_xlat4);
					        u_xlat4 = (u_xlatb9) ? 0.200000003 : u_xlat4;
					        u_xlat0.x = (-u_xlat0.x) * 0.5 + 1.0;
					        u_xlat0.x = u_xlat0.x * 0.200000003 + 0.300000012;
					        u_xlat12 = (-u_xlat0.x) + 1.0;
					        u_xlat0.x = u_xlat4 * u_xlat12 + u_xlat0.x;
					        u_xlat1.x = u_xlat0.x * u_xlat1.x;
					    //ENDIF
					    }
					    SV_Target0.xyz = u_xlat8.xxx * u_xlat1.xxx;
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