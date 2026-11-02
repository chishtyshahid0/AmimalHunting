Shader "CameraFilterPack/Distortion_Half_Sphere" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_SphereSize ("_SphereSize", Range(1, 10)) = 1
		_SpherePositionX ("_SpherePositionX", Range(-1, 1)) = 0
		_SpherePositionY ("_SpherePositionY", Range(-1, 1)) = 0
		_Strength ("_Strength", Range(1, 10)) = 5
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 14277
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
					uniform highp float _SphereSize;
					uniform highp float _SpherePositionX;
					uniform highp float _SpherePositionY;
					uniform highp float _Strength;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec2 uv_lense_distorted_2;
					  highp vec2 tmpvar_3;
					  tmpvar_3.x = 1.0;
					  tmpvar_3.y = (_ScreenResolution.y / _ScreenResolution.x);
					  highp vec2 tmpvar_4;
					  tmpvar_4 = (0.5 + ((xlv_TEXCOORD0 - 0.5) * tmpvar_3));
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = (0.5 + (_SpherePositionX / 2.0));
					  tmpvar_5.y = (0.5 - (_SpherePositionY / 2.0));
					  highp float radius_6;
					  radius_6 = (0.1 * _SphereSize);
					  highp float refractivity_7;
					  refractivity_7 = (1.075 * _Strength);
					  highp float rad_8;
					  highp vec2 tmpvar_9;
					  tmpvar_9 = (tmpvar_4 - tmpvar_5);
					  rad_8 = sqrt(dot (tmpvar_9, tmpvar_9));
					  highp float tmpvar_10;
					  if ((tmpvar_9.y > 0.0)) {
					    highp float y_over_x_11;
					    y_over_x_11 = (tmpvar_9.x / tmpvar_9.y);
					    highp float tmpvar_12;
					    tmpvar_12 = (min (abs(y_over_x_11), 1.0) / max (abs(y_over_x_11), 1.0));
					    highp float tmpvar_13;
					    tmpvar_13 = (tmpvar_12 * tmpvar_12);
					    tmpvar_13 = (((
					      ((((
					        ((((-0.01213232 * tmpvar_13) + 0.05368138) * tmpvar_13) - 0.1173503)
					       * tmpvar_13) + 0.1938925) * tmpvar_13) - 0.3326756)
					     * tmpvar_13) + 0.9999793) * tmpvar_12);
					    tmpvar_13 = (tmpvar_13 + (float(
					      (abs(y_over_x_11) > 1.0)
					    ) * (
					      (tmpvar_13 * -2.0)
					     + 1.570796)));
					    tmpvar_10 = (tmpvar_13 * sign(y_over_x_11));
					  } else {
					    if (((tmpvar_9.x >= 0.0) && (tmpvar_9.y < 0.0))) {
					      highp float y_over_x_14;
					      y_over_x_14 = (tmpvar_9.x / tmpvar_9.y);
					      highp float tmpvar_15;
					      tmpvar_15 = (min (abs(y_over_x_14), 1.0) / max (abs(y_over_x_14), 1.0));
					      highp float tmpvar_16;
					      tmpvar_16 = (tmpvar_15 * tmpvar_15);
					      tmpvar_16 = (((
					        ((((
					          ((((-0.01213232 * tmpvar_16) + 0.05368138) * tmpvar_16) - 0.1173503)
					         * tmpvar_16) + 0.1938925) * tmpvar_16) - 0.3326756)
					       * tmpvar_16) + 0.9999793) * tmpvar_15);
					      tmpvar_16 = (tmpvar_16 + (float(
					        (abs(y_over_x_14) > 1.0)
					      ) * (
					        (tmpvar_16 * -2.0)
					       + 1.570796)));
					      tmpvar_10 = ((tmpvar_16 * sign(y_over_x_14)) + 3.14);
					    } else {
					      if (((tmpvar_9.x < 0.0) && (tmpvar_9.y < 0.0))) {
					        highp float y_over_x_17;
					        y_over_x_17 = (tmpvar_9.x / tmpvar_9.y);
					        highp float tmpvar_18;
					        tmpvar_18 = (min (abs(y_over_x_17), 1.0) / max (abs(y_over_x_17), 1.0));
					        highp float tmpvar_19;
					        tmpvar_19 = (tmpvar_18 * tmpvar_18);
					        tmpvar_19 = (((
					          ((((
					            ((((-0.01213232 * tmpvar_19) + 0.05368138) * tmpvar_19) - 0.1173503)
					           * tmpvar_19) + 0.1938925) * tmpvar_19) - 0.3326756)
					         * tmpvar_19) + 0.9999793) * tmpvar_18);
					        tmpvar_19 = (tmpvar_19 + (float(
					          (abs(y_over_x_17) > 1.0)
					        ) * (
					          (tmpvar_19 * -2.0)
					         + 1.570796)));
					        tmpvar_10 = ((tmpvar_19 * sign(y_over_x_17)) - 3.14);
					      } else {
					        if (((tmpvar_9.x > 0.0) && (tmpvar_9.y == 0.0))) {
					          tmpvar_10 = 1.57;
					        } else {
					          if (((tmpvar_9.x < 0.0) && (tmpvar_9.y == 0.0))) {
					            tmpvar_10 = -1.57;
					          } else {
					            if (((tmpvar_9.x == 0.0) && (tmpvar_9.y == 0.0))) {
					              tmpvar_10 = 1.57;
					            } else {
					              tmpvar_10 = 1.57;
					            };
					          };
					        };
					      };
					    };
					  };
					  highp float tmpvar_20;
					  tmpvar_20 = clamp ((1.0 - (rad_8 / radius_6)), 0.0, 1.0);
					  highp float tmpvar_21;
					  highp float tmpvar_22;
					  tmpvar_22 = (tmpvar_20 - 1.0);
					  tmpvar_21 = sqrt((1.0 - (tmpvar_22 * tmpvar_22)));
					  highp float y_23;
					  y_23 = (1.0 - tmpvar_20);
					  highp float tmpvar_24;
					  if ((tmpvar_21 > 0.0)) {
					    highp float y_over_x_25;
					    y_over_x_25 = (y_23 / tmpvar_21);
					    highp float tmpvar_26;
					    tmpvar_26 = (min (abs(y_over_x_25), 1.0) / max (abs(y_over_x_25), 1.0));
					    highp float tmpvar_27;
					    tmpvar_27 = (tmpvar_26 * tmpvar_26);
					    tmpvar_27 = (((
					      ((((
					        ((((-0.01213232 * tmpvar_27) + 0.05368138) * tmpvar_27) - 0.1173503)
					       * tmpvar_27) + 0.1938925) * tmpvar_27) - 0.3326756)
					     * tmpvar_27) + 0.9999793) * tmpvar_26);
					    tmpvar_27 = (tmpvar_27 + (float(
					      (abs(y_over_x_25) > 1.0)
					    ) * (
					      (tmpvar_27 * -2.0)
					     + 1.570796)));
					    tmpvar_24 = (tmpvar_27 * sign(y_over_x_25));
					  } else {
					    if (((y_23 >= 0.0) && (tmpvar_21 < 0.0))) {
					      highp float y_over_x_28;
					      y_over_x_28 = (y_23 / tmpvar_21);
					      highp float tmpvar_29;
					      tmpvar_29 = (min (abs(y_over_x_28), 1.0) / max (abs(y_over_x_28), 1.0));
					      highp float tmpvar_30;
					      tmpvar_30 = (tmpvar_29 * tmpvar_29);
					      tmpvar_30 = (((
					        ((((
					          ((((-0.01213232 * tmpvar_30) + 0.05368138) * tmpvar_30) - 0.1173503)
					         * tmpvar_30) + 0.1938925) * tmpvar_30) - 0.3326756)
					       * tmpvar_30) + 0.9999793) * tmpvar_29);
					      tmpvar_30 = (tmpvar_30 + (float(
					        (abs(y_over_x_28) > 1.0)
					      ) * (
					        (tmpvar_30 * -2.0)
					       + 1.570796)));
					      tmpvar_24 = ((tmpvar_30 * sign(y_over_x_28)) + 3.14);
					    } else {
					      if (((y_23 < 0.0) && (tmpvar_21 < 0.0))) {
					        highp float y_over_x_31;
					        y_over_x_31 = (y_23 / tmpvar_21);
					        highp float tmpvar_32;
					        tmpvar_32 = (min (abs(y_over_x_31), 1.0) / max (abs(y_over_x_31), 1.0));
					        highp float tmpvar_33;
					        tmpvar_33 = (tmpvar_32 * tmpvar_32);
					        tmpvar_33 = (((
					          ((((
					            ((((-0.01213232 * tmpvar_33) + 0.05368138) * tmpvar_33) - 0.1173503)
					           * tmpvar_33) + 0.1938925) * tmpvar_33) - 0.3326756)
					         * tmpvar_33) + 0.9999793) * tmpvar_32);
					        tmpvar_33 = (tmpvar_33 + (float(
					          (abs(y_over_x_31) > 1.0)
					        ) * (
					          (tmpvar_33 * -2.0)
					         + 1.570796)));
					        tmpvar_24 = ((tmpvar_33 * sign(y_over_x_31)) - 3.14);
					      } else {
					        if (((y_23 > 0.0) && (tmpvar_21 == 0.0))) {
					          tmpvar_24 = 1.57;
					        } else {
					          if (((y_23 < 0.0) && (tmpvar_21 == 0.0))) {
					            tmpvar_24 = -1.57;
					          } else {
					            if (((y_23 == 0.0) && (tmpvar_21 == 0.0))) {
					              tmpvar_24 = 1.57;
					            } else {
					              tmpvar_24 = 1.57;
					            };
					          };
					        };
					      };
					    };
					  };
					  highp float x_34;
					  x_34 = (sin(tmpvar_24) / refractivity_7);
					  highp float tmpvar_35;
					  tmpvar_35 = (tmpvar_24 - (sign(x_34) * (1.570796 - 
					    (sqrt((1.0 - abs(x_34))) * (1.570796 + (abs(x_34) * (-0.2146018 + 
					      (abs(x_34) * (0.08656672 + (abs(x_34) * -0.03102955)))
					    ))))
					  )));
					  highp vec2 tmpvar_36;
					  tmpvar_36.x = sin(tmpvar_10);
					  tmpvar_36.y = cos(tmpvar_10);
					  highp vec2 x_37;
					  x_37 = (tmpvar_4 - tmpvar_5);
					  highp float t_38;
					  t_38 = float((sqrt(
					    dot (x_37, x_37)
					  ) < radius_6));
					  uv_lense_distorted_2 = (0.5 + ((
					    ((tmpvar_4 * (1.0 - t_38)) + ((tmpvar_5 + (
					      (tmpvar_36 * ((1.0 - tmpvar_20) - ((
					        sin(tmpvar_35)
					       * tmpvar_21) / cos(tmpvar_35))))
					     * radius_6)) * t_38))
					   - 0.5) / tmpvar_3));
					  lowp vec4 tmpvar_39;
					  tmpvar_39 = texture2D (_MainTex, uv_lense_distorted_2);
					  tmpvar_1 = tmpvar_39;
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
					uniform highp float _SphereSize;
					uniform highp float _SpherePositionX;
					uniform highp float _SpherePositionY;
					uniform highp float _Strength;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec2 uv_lense_distorted_2;
					  highp vec2 tmpvar_3;
					  tmpvar_3.x = 1.0;
					  tmpvar_3.y = (_ScreenResolution.y / _ScreenResolution.x);
					  highp vec2 tmpvar_4;
					  tmpvar_4 = (0.5 + ((xlv_TEXCOORD0 - 0.5) * tmpvar_3));
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = (0.5 + (_SpherePositionX / 2.0));
					  tmpvar_5.y = (0.5 - (_SpherePositionY / 2.0));
					  highp float radius_6;
					  radius_6 = (0.1 * _SphereSize);
					  highp float refractivity_7;
					  refractivity_7 = (1.075 * _Strength);
					  highp float rad_8;
					  highp vec2 tmpvar_9;
					  tmpvar_9 = (tmpvar_4 - tmpvar_5);
					  rad_8 = sqrt(dot (tmpvar_9, tmpvar_9));
					  highp float tmpvar_10;
					  if ((tmpvar_9.y > 0.0)) {
					    highp float y_over_x_11;
					    y_over_x_11 = (tmpvar_9.x / tmpvar_9.y);
					    highp float tmpvar_12;
					    tmpvar_12 = (min (abs(y_over_x_11), 1.0) / max (abs(y_over_x_11), 1.0));
					    highp float tmpvar_13;
					    tmpvar_13 = (tmpvar_12 * tmpvar_12);
					    tmpvar_13 = (((
					      ((((
					        ((((-0.01213232 * tmpvar_13) + 0.05368138) * tmpvar_13) - 0.1173503)
					       * tmpvar_13) + 0.1938925) * tmpvar_13) - 0.3326756)
					     * tmpvar_13) + 0.9999793) * tmpvar_12);
					    tmpvar_13 = (tmpvar_13 + (float(
					      (abs(y_over_x_11) > 1.0)
					    ) * (
					      (tmpvar_13 * -2.0)
					     + 1.570796)));
					    tmpvar_10 = (tmpvar_13 * sign(y_over_x_11));
					  } else {
					    if (((tmpvar_9.x >= 0.0) && (tmpvar_9.y < 0.0))) {
					      highp float y_over_x_14;
					      y_over_x_14 = (tmpvar_9.x / tmpvar_9.y);
					      highp float tmpvar_15;
					      tmpvar_15 = (min (abs(y_over_x_14), 1.0) / max (abs(y_over_x_14), 1.0));
					      highp float tmpvar_16;
					      tmpvar_16 = (tmpvar_15 * tmpvar_15);
					      tmpvar_16 = (((
					        ((((
					          ((((-0.01213232 * tmpvar_16) + 0.05368138) * tmpvar_16) - 0.1173503)
					         * tmpvar_16) + 0.1938925) * tmpvar_16) - 0.3326756)
					       * tmpvar_16) + 0.9999793) * tmpvar_15);
					      tmpvar_16 = (tmpvar_16 + (float(
					        (abs(y_over_x_14) > 1.0)
					      ) * (
					        (tmpvar_16 * -2.0)
					       + 1.570796)));
					      tmpvar_10 = ((tmpvar_16 * sign(y_over_x_14)) + 3.14);
					    } else {
					      if (((tmpvar_9.x < 0.0) && (tmpvar_9.y < 0.0))) {
					        highp float y_over_x_17;
					        y_over_x_17 = (tmpvar_9.x / tmpvar_9.y);
					        highp float tmpvar_18;
					        tmpvar_18 = (min (abs(y_over_x_17), 1.0) / max (abs(y_over_x_17), 1.0));
					        highp float tmpvar_19;
					        tmpvar_19 = (tmpvar_18 * tmpvar_18);
					        tmpvar_19 = (((
					          ((((
					            ((((-0.01213232 * tmpvar_19) + 0.05368138) * tmpvar_19) - 0.1173503)
					           * tmpvar_19) + 0.1938925) * tmpvar_19) - 0.3326756)
					         * tmpvar_19) + 0.9999793) * tmpvar_18);
					        tmpvar_19 = (tmpvar_19 + (float(
					          (abs(y_over_x_17) > 1.0)
					        ) * (
					          (tmpvar_19 * -2.0)
					         + 1.570796)));
					        tmpvar_10 = ((tmpvar_19 * sign(y_over_x_17)) - 3.14);
					      } else {
					        if (((tmpvar_9.x > 0.0) && (tmpvar_9.y == 0.0))) {
					          tmpvar_10 = 1.57;
					        } else {
					          if (((tmpvar_9.x < 0.0) && (tmpvar_9.y == 0.0))) {
					            tmpvar_10 = -1.57;
					          } else {
					            if (((tmpvar_9.x == 0.0) && (tmpvar_9.y == 0.0))) {
					              tmpvar_10 = 1.57;
					            } else {
					              tmpvar_10 = 1.57;
					            };
					          };
					        };
					      };
					    };
					  };
					  highp float tmpvar_20;
					  tmpvar_20 = clamp ((1.0 - (rad_8 / radius_6)), 0.0, 1.0);
					  highp float tmpvar_21;
					  highp float tmpvar_22;
					  tmpvar_22 = (tmpvar_20 - 1.0);
					  tmpvar_21 = sqrt((1.0 - (tmpvar_22 * tmpvar_22)));
					  highp float y_23;
					  y_23 = (1.0 - tmpvar_20);
					  highp float tmpvar_24;
					  if ((tmpvar_21 > 0.0)) {
					    highp float y_over_x_25;
					    y_over_x_25 = (y_23 / tmpvar_21);
					    highp float tmpvar_26;
					    tmpvar_26 = (min (abs(y_over_x_25), 1.0) / max (abs(y_over_x_25), 1.0));
					    highp float tmpvar_27;
					    tmpvar_27 = (tmpvar_26 * tmpvar_26);
					    tmpvar_27 = (((
					      ((((
					        ((((-0.01213232 * tmpvar_27) + 0.05368138) * tmpvar_27) - 0.1173503)
					       * tmpvar_27) + 0.1938925) * tmpvar_27) - 0.3326756)
					     * tmpvar_27) + 0.9999793) * tmpvar_26);
					    tmpvar_27 = (tmpvar_27 + (float(
					      (abs(y_over_x_25) > 1.0)
					    ) * (
					      (tmpvar_27 * -2.0)
					     + 1.570796)));
					    tmpvar_24 = (tmpvar_27 * sign(y_over_x_25));
					  } else {
					    if (((y_23 >= 0.0) && (tmpvar_21 < 0.0))) {
					      highp float y_over_x_28;
					      y_over_x_28 = (y_23 / tmpvar_21);
					      highp float tmpvar_29;
					      tmpvar_29 = (min (abs(y_over_x_28), 1.0) / max (abs(y_over_x_28), 1.0));
					      highp float tmpvar_30;
					      tmpvar_30 = (tmpvar_29 * tmpvar_29);
					      tmpvar_30 = (((
					        ((((
					          ((((-0.01213232 * tmpvar_30) + 0.05368138) * tmpvar_30) - 0.1173503)
					         * tmpvar_30) + 0.1938925) * tmpvar_30) - 0.3326756)
					       * tmpvar_30) + 0.9999793) * tmpvar_29);
					      tmpvar_30 = (tmpvar_30 + (float(
					        (abs(y_over_x_28) > 1.0)
					      ) * (
					        (tmpvar_30 * -2.0)
					       + 1.570796)));
					      tmpvar_24 = ((tmpvar_30 * sign(y_over_x_28)) + 3.14);
					    } else {
					      if (((y_23 < 0.0) && (tmpvar_21 < 0.0))) {
					        highp float y_over_x_31;
					        y_over_x_31 = (y_23 / tmpvar_21);
					        highp float tmpvar_32;
					        tmpvar_32 = (min (abs(y_over_x_31), 1.0) / max (abs(y_over_x_31), 1.0));
					        highp float tmpvar_33;
					        tmpvar_33 = (tmpvar_32 * tmpvar_32);
					        tmpvar_33 = (((
					          ((((
					            ((((-0.01213232 * tmpvar_33) + 0.05368138) * tmpvar_33) - 0.1173503)
					           * tmpvar_33) + 0.1938925) * tmpvar_33) - 0.3326756)
					         * tmpvar_33) + 0.9999793) * tmpvar_32);
					        tmpvar_33 = (tmpvar_33 + (float(
					          (abs(y_over_x_31) > 1.0)
					        ) * (
					          (tmpvar_33 * -2.0)
					         + 1.570796)));
					        tmpvar_24 = ((tmpvar_33 * sign(y_over_x_31)) - 3.14);
					      } else {
					        if (((y_23 > 0.0) && (tmpvar_21 == 0.0))) {
					          tmpvar_24 = 1.57;
					        } else {
					          if (((y_23 < 0.0) && (tmpvar_21 == 0.0))) {
					            tmpvar_24 = -1.57;
					          } else {
					            if (((y_23 == 0.0) && (tmpvar_21 == 0.0))) {
					              tmpvar_24 = 1.57;
					            } else {
					              tmpvar_24 = 1.57;
					            };
					          };
					        };
					      };
					    };
					  };
					  highp float x_34;
					  x_34 = (sin(tmpvar_24) / refractivity_7);
					  highp float tmpvar_35;
					  tmpvar_35 = (tmpvar_24 - (sign(x_34) * (1.570796 - 
					    (sqrt((1.0 - abs(x_34))) * (1.570796 + (abs(x_34) * (-0.2146018 + 
					      (abs(x_34) * (0.08656672 + (abs(x_34) * -0.03102955)))
					    ))))
					  )));
					  highp vec2 tmpvar_36;
					  tmpvar_36.x = sin(tmpvar_10);
					  tmpvar_36.y = cos(tmpvar_10);
					  highp vec2 x_37;
					  x_37 = (tmpvar_4 - tmpvar_5);
					  highp float t_38;
					  t_38 = float((sqrt(
					    dot (x_37, x_37)
					  ) < radius_6));
					  uv_lense_distorted_2 = (0.5 + ((
					    ((tmpvar_4 * (1.0 - t_38)) + ((tmpvar_5 + (
					      (tmpvar_36 * ((1.0 - tmpvar_20) - ((
					        sin(tmpvar_35)
					       * tmpvar_21) / cos(tmpvar_35))))
					     * radius_6)) * t_38))
					   - 0.5) / tmpvar_3));
					  lowp vec4 tmpvar_39;
					  tmpvar_39 = texture2D (_MainTex, uv_lense_distorted_2);
					  tmpvar_1 = tmpvar_39;
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
					uniform highp float _SphereSize;
					uniform highp float _SpherePositionX;
					uniform highp float _SpherePositionY;
					uniform highp float _Strength;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec2 uv_lense_distorted_2;
					  highp vec2 tmpvar_3;
					  tmpvar_3.x = 1.0;
					  tmpvar_3.y = (_ScreenResolution.y / _ScreenResolution.x);
					  highp vec2 tmpvar_4;
					  tmpvar_4 = (0.5 + ((xlv_TEXCOORD0 - 0.5) * tmpvar_3));
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = (0.5 + (_SpherePositionX / 2.0));
					  tmpvar_5.y = (0.5 - (_SpherePositionY / 2.0));
					  highp float radius_6;
					  radius_6 = (0.1 * _SphereSize);
					  highp float refractivity_7;
					  refractivity_7 = (1.075 * _Strength);
					  highp float rad_8;
					  highp vec2 tmpvar_9;
					  tmpvar_9 = (tmpvar_4 - tmpvar_5);
					  rad_8 = sqrt(dot (tmpvar_9, tmpvar_9));
					  highp float tmpvar_10;
					  if ((tmpvar_9.y > 0.0)) {
					    highp float y_over_x_11;
					    y_over_x_11 = (tmpvar_9.x / tmpvar_9.y);
					    highp float tmpvar_12;
					    tmpvar_12 = (min (abs(y_over_x_11), 1.0) / max (abs(y_over_x_11), 1.0));
					    highp float tmpvar_13;
					    tmpvar_13 = (tmpvar_12 * tmpvar_12);
					    tmpvar_13 = (((
					      ((((
					        ((((-0.01213232 * tmpvar_13) + 0.05368138) * tmpvar_13) - 0.1173503)
					       * tmpvar_13) + 0.1938925) * tmpvar_13) - 0.3326756)
					     * tmpvar_13) + 0.9999793) * tmpvar_12);
					    tmpvar_13 = (tmpvar_13 + (float(
					      (abs(y_over_x_11) > 1.0)
					    ) * (
					      (tmpvar_13 * -2.0)
					     + 1.570796)));
					    tmpvar_10 = (tmpvar_13 * sign(y_over_x_11));
					  } else {
					    if (((tmpvar_9.x >= 0.0) && (tmpvar_9.y < 0.0))) {
					      highp float y_over_x_14;
					      y_over_x_14 = (tmpvar_9.x / tmpvar_9.y);
					      highp float tmpvar_15;
					      tmpvar_15 = (min (abs(y_over_x_14), 1.0) / max (abs(y_over_x_14), 1.0));
					      highp float tmpvar_16;
					      tmpvar_16 = (tmpvar_15 * tmpvar_15);
					      tmpvar_16 = (((
					        ((((
					          ((((-0.01213232 * tmpvar_16) + 0.05368138) * tmpvar_16) - 0.1173503)
					         * tmpvar_16) + 0.1938925) * tmpvar_16) - 0.3326756)
					       * tmpvar_16) + 0.9999793) * tmpvar_15);
					      tmpvar_16 = (tmpvar_16 + (float(
					        (abs(y_over_x_14) > 1.0)
					      ) * (
					        (tmpvar_16 * -2.0)
					       + 1.570796)));
					      tmpvar_10 = ((tmpvar_16 * sign(y_over_x_14)) + 3.14);
					    } else {
					      if (((tmpvar_9.x < 0.0) && (tmpvar_9.y < 0.0))) {
					        highp float y_over_x_17;
					        y_over_x_17 = (tmpvar_9.x / tmpvar_9.y);
					        highp float tmpvar_18;
					        tmpvar_18 = (min (abs(y_over_x_17), 1.0) / max (abs(y_over_x_17), 1.0));
					        highp float tmpvar_19;
					        tmpvar_19 = (tmpvar_18 * tmpvar_18);
					        tmpvar_19 = (((
					          ((((
					            ((((-0.01213232 * tmpvar_19) + 0.05368138) * tmpvar_19) - 0.1173503)
					           * tmpvar_19) + 0.1938925) * tmpvar_19) - 0.3326756)
					         * tmpvar_19) + 0.9999793) * tmpvar_18);
					        tmpvar_19 = (tmpvar_19 + (float(
					          (abs(y_over_x_17) > 1.0)
					        ) * (
					          (tmpvar_19 * -2.0)
					         + 1.570796)));
					        tmpvar_10 = ((tmpvar_19 * sign(y_over_x_17)) - 3.14);
					      } else {
					        if (((tmpvar_9.x > 0.0) && (tmpvar_9.y == 0.0))) {
					          tmpvar_10 = 1.57;
					        } else {
					          if (((tmpvar_9.x < 0.0) && (tmpvar_9.y == 0.0))) {
					            tmpvar_10 = -1.57;
					          } else {
					            if (((tmpvar_9.x == 0.0) && (tmpvar_9.y == 0.0))) {
					              tmpvar_10 = 1.57;
					            } else {
					              tmpvar_10 = 1.57;
					            };
					          };
					        };
					      };
					    };
					  };
					  highp float tmpvar_20;
					  tmpvar_20 = clamp ((1.0 - (rad_8 / radius_6)), 0.0, 1.0);
					  highp float tmpvar_21;
					  highp float tmpvar_22;
					  tmpvar_22 = (tmpvar_20 - 1.0);
					  tmpvar_21 = sqrt((1.0 - (tmpvar_22 * tmpvar_22)));
					  highp float y_23;
					  y_23 = (1.0 - tmpvar_20);
					  highp float tmpvar_24;
					  if ((tmpvar_21 > 0.0)) {
					    highp float y_over_x_25;
					    y_over_x_25 = (y_23 / tmpvar_21);
					    highp float tmpvar_26;
					    tmpvar_26 = (min (abs(y_over_x_25), 1.0) / max (abs(y_over_x_25), 1.0));
					    highp float tmpvar_27;
					    tmpvar_27 = (tmpvar_26 * tmpvar_26);
					    tmpvar_27 = (((
					      ((((
					        ((((-0.01213232 * tmpvar_27) + 0.05368138) * tmpvar_27) - 0.1173503)
					       * tmpvar_27) + 0.1938925) * tmpvar_27) - 0.3326756)
					     * tmpvar_27) + 0.9999793) * tmpvar_26);
					    tmpvar_27 = (tmpvar_27 + (float(
					      (abs(y_over_x_25) > 1.0)
					    ) * (
					      (tmpvar_27 * -2.0)
					     + 1.570796)));
					    tmpvar_24 = (tmpvar_27 * sign(y_over_x_25));
					  } else {
					    if (((y_23 >= 0.0) && (tmpvar_21 < 0.0))) {
					      highp float y_over_x_28;
					      y_over_x_28 = (y_23 / tmpvar_21);
					      highp float tmpvar_29;
					      tmpvar_29 = (min (abs(y_over_x_28), 1.0) / max (abs(y_over_x_28), 1.0));
					      highp float tmpvar_30;
					      tmpvar_30 = (tmpvar_29 * tmpvar_29);
					      tmpvar_30 = (((
					        ((((
					          ((((-0.01213232 * tmpvar_30) + 0.05368138) * tmpvar_30) - 0.1173503)
					         * tmpvar_30) + 0.1938925) * tmpvar_30) - 0.3326756)
					       * tmpvar_30) + 0.9999793) * tmpvar_29);
					      tmpvar_30 = (tmpvar_30 + (float(
					        (abs(y_over_x_28) > 1.0)
					      ) * (
					        (tmpvar_30 * -2.0)
					       + 1.570796)));
					      tmpvar_24 = ((tmpvar_30 * sign(y_over_x_28)) + 3.14);
					    } else {
					      if (((y_23 < 0.0) && (tmpvar_21 < 0.0))) {
					        highp float y_over_x_31;
					        y_over_x_31 = (y_23 / tmpvar_21);
					        highp float tmpvar_32;
					        tmpvar_32 = (min (abs(y_over_x_31), 1.0) / max (abs(y_over_x_31), 1.0));
					        highp float tmpvar_33;
					        tmpvar_33 = (tmpvar_32 * tmpvar_32);
					        tmpvar_33 = (((
					          ((((
					            ((((-0.01213232 * tmpvar_33) + 0.05368138) * tmpvar_33) - 0.1173503)
					           * tmpvar_33) + 0.1938925) * tmpvar_33) - 0.3326756)
					         * tmpvar_33) + 0.9999793) * tmpvar_32);
					        tmpvar_33 = (tmpvar_33 + (float(
					          (abs(y_over_x_31) > 1.0)
					        ) * (
					          (tmpvar_33 * -2.0)
					         + 1.570796)));
					        tmpvar_24 = ((tmpvar_33 * sign(y_over_x_31)) - 3.14);
					      } else {
					        if (((y_23 > 0.0) && (tmpvar_21 == 0.0))) {
					          tmpvar_24 = 1.57;
					        } else {
					          if (((y_23 < 0.0) && (tmpvar_21 == 0.0))) {
					            tmpvar_24 = -1.57;
					          } else {
					            if (((y_23 == 0.0) && (tmpvar_21 == 0.0))) {
					              tmpvar_24 = 1.57;
					            } else {
					              tmpvar_24 = 1.57;
					            };
					          };
					        };
					      };
					    };
					  };
					  highp float x_34;
					  x_34 = (sin(tmpvar_24) / refractivity_7);
					  highp float tmpvar_35;
					  tmpvar_35 = (tmpvar_24 - (sign(x_34) * (1.570796 - 
					    (sqrt((1.0 - abs(x_34))) * (1.570796 + (abs(x_34) * (-0.2146018 + 
					      (abs(x_34) * (0.08656672 + (abs(x_34) * -0.03102955)))
					    ))))
					  )));
					  highp vec2 tmpvar_36;
					  tmpvar_36.x = sin(tmpvar_10);
					  tmpvar_36.y = cos(tmpvar_10);
					  highp vec2 x_37;
					  x_37 = (tmpvar_4 - tmpvar_5);
					  highp float t_38;
					  t_38 = float((sqrt(
					    dot (x_37, x_37)
					  ) < radius_6));
					  uv_lense_distorted_2 = (0.5 + ((
					    ((tmpvar_4 * (1.0 - t_38)) + ((tmpvar_5 + (
					      (tmpvar_36 * ((1.0 - tmpvar_20) - ((
					        sin(tmpvar_35)
					       * tmpvar_21) / cos(tmpvar_35))))
					     * radius_6)) * t_38))
					   - 0.5) / tmpvar_3));
					  lowp vec4 tmpvar_39;
					  tmpvar_39 = texture2D (_MainTex, uv_lense_distorted_2);
					  tmpvar_1 = tmpvar_39;
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
					uniform 	float _SphereSize;
					uniform 	float _SpherePositionX;
					uniform 	float _SpherePositionY;
					uniform 	float _Strength;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec2 u_xlat16_1;
					vec2 u_xlat2;
					bool u_xlatb2;
					vec2 u_xlat3;
					bool u_xlatb3;
					vec2 u_xlat4;
					bool u_xlatb4;
					float u_xlat5;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat9;
					bool u_xlatb9;
					float u_xlat10;
					bool u_xlatb10;
					vec2 u_xlat12;
					vec2 u_xlat14;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					float u_xlat21;
					bool u_xlatb21;
					float u_xlat22;
					bool u_xlatb22;
					void main()
					{
					    u_xlat0.y = _ScreenResolution.y / _ScreenResolution.x;
					    u_xlat16_1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat0.x = 1.0;
					    u_xlat12.xy = u_xlat16_1.xy * u_xlat0.xy + vec2(0.5, 0.5);
					    u_xlat2.xy = vec2(_SphereSize, _Strength) * vec2(0.100000001, 1.07500005);
					    u_xlat14.x = _SpherePositionX * 0.5 + 0.5;
					    u_xlat14.y = (-_SpherePositionY) * 0.5 + 0.5;
					    u_xlat3.xy = (-u_xlat14.xy);
					    u_xlat3.xy = u_xlat12.xy + u_xlat3.xy;
					    u_xlat15 = dot(u_xlat3.xy, u_xlat3.xy);
					    u_xlat15 = sqrt(u_xlat15);
					    u_xlat21 = u_xlat3.x / u_xlat3.y;
					    u_xlat4.x = min(abs(u_xlat21), 1.0);
					    u_xlat10 = max(abs(u_xlat21), 1.0);
					    u_xlat10 = float(1.0) / u_xlat10;
					    u_xlat4.x = u_xlat10 * u_xlat4.x;
					    u_xlat10 = u_xlat4.x * u_xlat4.x;
					    u_xlat16 = u_xlat10 * 0.0208350997 + -0.0851330012;
					    u_xlat16 = u_xlat10 * u_xlat16 + 0.180141002;
					    u_xlat16 = u_xlat10 * u_xlat16 + -0.330299497;
					    u_xlat10 = u_xlat10 * u_xlat16 + 0.999866009;
					    u_xlat16 = u_xlat10 * u_xlat4.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb22 = !!(1.0<abs(u_xlat21));
					#else
					    u_xlatb22 = 1.0<abs(u_xlat21);
					#endif
					    u_xlat16 = u_xlat16 * -2.0 + 1.57079637;
					    u_xlat16 = u_xlatb22 ? u_xlat16 : float(0.0);
					    u_xlat4.x = u_xlat4.x * u_xlat10 + u_xlat16;
					    u_xlat21 = min(u_xlat21, 1.0);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb21 = !!(u_xlat21<(-u_xlat21));
					#else
					    u_xlatb21 = u_xlat21<(-u_xlat21);
					#endif
					    u_xlat21 = (u_xlatb21) ? (-u_xlat4.x) : u_xlat4.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb4 = !!(0.0>=u_xlat3.y);
					#else
					    u_xlatb4 = 0.0>=u_xlat3.y;
					#endif
					    if(u_xlatb4){
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb4 = !!(u_xlat3.x>=0.0);
					#else
					        u_xlatb4 = u_xlat3.x>=0.0;
					#endif
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb10 = !!(u_xlat3.y<0.0);
					#else
					        u_xlatb10 = u_xlat3.y<0.0;
					#endif
					        u_xlatb4 = u_xlatb10 && u_xlatb4;
					        if(!u_xlatb4){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb16 = !!(u_xlat3.x<0.0);
					#else
					            u_xlatb16 = u_xlat3.x<0.0;
					#endif
					            u_xlatb10 = u_xlatb10 && u_xlatb16;
					            u_xlat22 = u_xlat21 + -3.1400001;
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb3 = !!(0.0<u_xlat3.x);
					#else
					            u_xlatb3 = 0.0<u_xlat3.x;
					#endif
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb9 = !!(u_xlat3.y==0.0);
					#else
					            u_xlatb9 = u_xlat3.y==0.0;
					#endif
					            u_xlatb3 = u_xlatb9 && u_xlatb3;
					            u_xlatb9 = u_xlatb9 && u_xlatb16;
					            u_xlat9 = (u_xlatb9) ? -1.57000005 : 1.57000005;
					            u_xlat3.x = (u_xlatb3) ? 1.57000005 : u_xlat9;
					            u_xlat21 = (u_xlatb10) ? u_xlat22 : u_xlat3.x;
					        } else {
					            u_xlat3.x = u_xlat21 + 3.1400001;
					            u_xlat21 = (u_xlatb4) ? u_xlat3.x : u_xlat21;
					        //ENDIF
					        }
					    //ENDIF
					    }
					    u_xlat3.x = u_xlat15 / u_xlat2.x;
					    u_xlat3.x = (-u_xlat3.x) + 1.0;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
					#else
					    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
					#endif
					    u_xlat9 = u_xlat3.x + -1.0;
					    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
					    u_xlat9 = sqrt(u_xlat9);
					    u_xlat3.x = (-u_xlat3.x) + 1.0;
					    u_xlat4.x = u_xlat3.x / u_xlat9;
					    u_xlat10 = min(u_xlat4.x, 1.0);
					    u_xlat16 = max(u_xlat4.x, 1.0);
					    u_xlat16 = float(1.0) / u_xlat16;
					    u_xlat10 = u_xlat16 * u_xlat10;
					    u_xlat16 = u_xlat10 * u_xlat10;
					    u_xlat22 = u_xlat16 * 0.0208350997 + -0.0851330012;
					    u_xlat22 = u_xlat16 * u_xlat22 + 0.180141002;
					    u_xlat22 = u_xlat16 * u_xlat22 + -0.330299497;
					    u_xlat16 = u_xlat16 * u_xlat22 + 0.999866009;
					    u_xlat22 = u_xlat16 * u_xlat10;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb4 = !!(1.0<u_xlat4.x);
					#else
					    u_xlatb4 = 1.0<u_xlat4.x;
					#endif
					    u_xlat22 = u_xlat22 * -2.0 + 1.57079637;
					    u_xlat4.x = u_xlatb4 ? u_xlat22 : float(0.0);
					    u_xlat4.x = u_xlat10 * u_xlat16 + u_xlat4.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb10 = !!(0.0>=u_xlat9);
					#else
					    u_xlatb10 = 0.0>=u_xlat9;
					#endif
					    u_xlat4.x = (u_xlatb10) ? 1.57000005 : u_xlat4.x;
					    u_xlat10 = sin(u_xlat4.x);
					    u_xlat8.x = u_xlat10 / u_xlat2.y;
					    u_xlat10 = -abs(u_xlat8.x) + 1.0;
					    u_xlat10 = sqrt(u_xlat10);
					    u_xlat16 = abs(u_xlat8.x) * -0.0187292993 + 0.0742610022;
					    u_xlat16 = u_xlat16 * abs(u_xlat8.x) + -0.212114394;
					    u_xlat16 = u_xlat16 * abs(u_xlat8.x) + 1.57072878;
					    u_xlat22 = u_xlat10 * u_xlat16;
					    u_xlat22 = u_xlat22 * -2.0 + 3.14159274;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb8 = !!(u_xlat8.x<(-u_xlat8.x));
					#else
					    u_xlatb8 = u_xlat8.x<(-u_xlat8.x);
					#endif
					    u_xlat8.x = u_xlatb8 ? u_xlat22 : float(0.0);
					    u_xlat8.x = u_xlat16 * u_xlat10 + u_xlat8.x;
					    u_xlat8.x = (-u_xlat8.x) + 1.57079637;
					    u_xlat8.x = (-u_xlat8.x) + u_xlat4.x;
					    u_xlat4.x = sin(u_xlat8.x);
					    u_xlat5 = cos(u_xlat8.x);
					    u_xlat8.x = u_xlat9 * u_xlat4.x;
					    u_xlat8.x = u_xlat8.x / u_xlat5;
					    u_xlat8.x = (-u_xlat8.x) + u_xlat3.x;
					    u_xlat3.x = sin(u_xlat21);
					    u_xlat4.x = cos(u_xlat21);
					    u_xlat3.y = u_xlat4.x;
					    u_xlat3.xy = u_xlat8.xx * u_xlat3.xy;
					    u_xlat4.x = u_xlat3.x * u_xlat2.x + u_xlat14.x;
					    u_xlat4.y = u_xlat3.y * u_xlat2.x + u_xlat14.y;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(u_xlat15<u_xlat2.x);
					#else
					    u_xlatb2 = u_xlat15<u_xlat2.x;
					#endif
					    u_xlat8.x = u_xlatb2 ? 1.0 : float(0.0);
					    u_xlat2.x = (u_xlatb2) ? 0.0 : 1.0;
					    u_xlat8.xy = u_xlat8.xx * u_xlat4.xy;
					    u_xlat12.xy = u_xlat12.xy * u_xlat2.xx + u_xlat8.xy;
					    u_xlat12.xy = u_xlat12.xy + vec2(-0.5, -0.5);
					    u_xlat0.xy = u_xlat12.xy / u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
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
					uniform 	vec4 _ScreenResolution;
					uniform 	float _SphereSize;
					uniform 	float _SpherePositionX;
					uniform 	float _SpherePositionY;
					uniform 	float _Strength;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec2 u_xlat16_1;
					vec2 u_xlat2;
					bool u_xlatb2;
					vec2 u_xlat3;
					bool u_xlatb3;
					vec2 u_xlat4;
					bool u_xlatb4;
					float u_xlat5;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat9;
					bool u_xlatb9;
					float u_xlat10;
					bool u_xlatb10;
					vec2 u_xlat12;
					vec2 u_xlat14;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					float u_xlat21;
					bool u_xlatb21;
					float u_xlat22;
					bool u_xlatb22;
					void main()
					{
					    u_xlat0.y = _ScreenResolution.y / _ScreenResolution.x;
					    u_xlat16_1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat0.x = 1.0;
					    u_xlat12.xy = u_xlat16_1.xy * u_xlat0.xy + vec2(0.5, 0.5);
					    u_xlat2.xy = vec2(_SphereSize, _Strength) * vec2(0.100000001, 1.07500005);
					    u_xlat14.x = _SpherePositionX * 0.5 + 0.5;
					    u_xlat14.y = (-_SpherePositionY) * 0.5 + 0.5;
					    u_xlat3.xy = (-u_xlat14.xy);
					    u_xlat3.xy = u_xlat12.xy + u_xlat3.xy;
					    u_xlat15 = dot(u_xlat3.xy, u_xlat3.xy);
					    u_xlat15 = sqrt(u_xlat15);
					    u_xlat21 = u_xlat3.x / u_xlat3.y;
					    u_xlat4.x = min(abs(u_xlat21), 1.0);
					    u_xlat10 = max(abs(u_xlat21), 1.0);
					    u_xlat10 = float(1.0) / u_xlat10;
					    u_xlat4.x = u_xlat10 * u_xlat4.x;
					    u_xlat10 = u_xlat4.x * u_xlat4.x;
					    u_xlat16 = u_xlat10 * 0.0208350997 + -0.0851330012;
					    u_xlat16 = u_xlat10 * u_xlat16 + 0.180141002;
					    u_xlat16 = u_xlat10 * u_xlat16 + -0.330299497;
					    u_xlat10 = u_xlat10 * u_xlat16 + 0.999866009;
					    u_xlat16 = u_xlat10 * u_xlat4.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb22 = !!(1.0<abs(u_xlat21));
					#else
					    u_xlatb22 = 1.0<abs(u_xlat21);
					#endif
					    u_xlat16 = u_xlat16 * -2.0 + 1.57079637;
					    u_xlat16 = u_xlatb22 ? u_xlat16 : float(0.0);
					    u_xlat4.x = u_xlat4.x * u_xlat10 + u_xlat16;
					    u_xlat21 = min(u_xlat21, 1.0);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb21 = !!(u_xlat21<(-u_xlat21));
					#else
					    u_xlatb21 = u_xlat21<(-u_xlat21);
					#endif
					    u_xlat21 = (u_xlatb21) ? (-u_xlat4.x) : u_xlat4.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb4 = !!(0.0>=u_xlat3.y);
					#else
					    u_xlatb4 = 0.0>=u_xlat3.y;
					#endif
					    if(u_xlatb4){
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb4 = !!(u_xlat3.x>=0.0);
					#else
					        u_xlatb4 = u_xlat3.x>=0.0;
					#endif
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb10 = !!(u_xlat3.y<0.0);
					#else
					        u_xlatb10 = u_xlat3.y<0.0;
					#endif
					        u_xlatb4 = u_xlatb10 && u_xlatb4;
					        if(!u_xlatb4){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb16 = !!(u_xlat3.x<0.0);
					#else
					            u_xlatb16 = u_xlat3.x<0.0;
					#endif
					            u_xlatb10 = u_xlatb10 && u_xlatb16;
					            u_xlat22 = u_xlat21 + -3.1400001;
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb3 = !!(0.0<u_xlat3.x);
					#else
					            u_xlatb3 = 0.0<u_xlat3.x;
					#endif
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb9 = !!(u_xlat3.y==0.0);
					#else
					            u_xlatb9 = u_xlat3.y==0.0;
					#endif
					            u_xlatb3 = u_xlatb9 && u_xlatb3;
					            u_xlatb9 = u_xlatb9 && u_xlatb16;
					            u_xlat9 = (u_xlatb9) ? -1.57000005 : 1.57000005;
					            u_xlat3.x = (u_xlatb3) ? 1.57000005 : u_xlat9;
					            u_xlat21 = (u_xlatb10) ? u_xlat22 : u_xlat3.x;
					        } else {
					            u_xlat3.x = u_xlat21 + 3.1400001;
					            u_xlat21 = (u_xlatb4) ? u_xlat3.x : u_xlat21;
					        //ENDIF
					        }
					    //ENDIF
					    }
					    u_xlat3.x = u_xlat15 / u_xlat2.x;
					    u_xlat3.x = (-u_xlat3.x) + 1.0;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
					#else
					    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
					#endif
					    u_xlat9 = u_xlat3.x + -1.0;
					    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
					    u_xlat9 = sqrt(u_xlat9);
					    u_xlat3.x = (-u_xlat3.x) + 1.0;
					    u_xlat4.x = u_xlat3.x / u_xlat9;
					    u_xlat10 = min(u_xlat4.x, 1.0);
					    u_xlat16 = max(u_xlat4.x, 1.0);
					    u_xlat16 = float(1.0) / u_xlat16;
					    u_xlat10 = u_xlat16 * u_xlat10;
					    u_xlat16 = u_xlat10 * u_xlat10;
					    u_xlat22 = u_xlat16 * 0.0208350997 + -0.0851330012;
					    u_xlat22 = u_xlat16 * u_xlat22 + 0.180141002;
					    u_xlat22 = u_xlat16 * u_xlat22 + -0.330299497;
					    u_xlat16 = u_xlat16 * u_xlat22 + 0.999866009;
					    u_xlat22 = u_xlat16 * u_xlat10;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb4 = !!(1.0<u_xlat4.x);
					#else
					    u_xlatb4 = 1.0<u_xlat4.x;
					#endif
					    u_xlat22 = u_xlat22 * -2.0 + 1.57079637;
					    u_xlat4.x = u_xlatb4 ? u_xlat22 : float(0.0);
					    u_xlat4.x = u_xlat10 * u_xlat16 + u_xlat4.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb10 = !!(0.0>=u_xlat9);
					#else
					    u_xlatb10 = 0.0>=u_xlat9;
					#endif
					    u_xlat4.x = (u_xlatb10) ? 1.57000005 : u_xlat4.x;
					    u_xlat10 = sin(u_xlat4.x);
					    u_xlat8.x = u_xlat10 / u_xlat2.y;
					    u_xlat10 = -abs(u_xlat8.x) + 1.0;
					    u_xlat10 = sqrt(u_xlat10);
					    u_xlat16 = abs(u_xlat8.x) * -0.0187292993 + 0.0742610022;
					    u_xlat16 = u_xlat16 * abs(u_xlat8.x) + -0.212114394;
					    u_xlat16 = u_xlat16 * abs(u_xlat8.x) + 1.57072878;
					    u_xlat22 = u_xlat10 * u_xlat16;
					    u_xlat22 = u_xlat22 * -2.0 + 3.14159274;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb8 = !!(u_xlat8.x<(-u_xlat8.x));
					#else
					    u_xlatb8 = u_xlat8.x<(-u_xlat8.x);
					#endif
					    u_xlat8.x = u_xlatb8 ? u_xlat22 : float(0.0);
					    u_xlat8.x = u_xlat16 * u_xlat10 + u_xlat8.x;
					    u_xlat8.x = (-u_xlat8.x) + 1.57079637;
					    u_xlat8.x = (-u_xlat8.x) + u_xlat4.x;
					    u_xlat4.x = sin(u_xlat8.x);
					    u_xlat5 = cos(u_xlat8.x);
					    u_xlat8.x = u_xlat9 * u_xlat4.x;
					    u_xlat8.x = u_xlat8.x / u_xlat5;
					    u_xlat8.x = (-u_xlat8.x) + u_xlat3.x;
					    u_xlat3.x = sin(u_xlat21);
					    u_xlat4.x = cos(u_xlat21);
					    u_xlat3.y = u_xlat4.x;
					    u_xlat3.xy = u_xlat8.xx * u_xlat3.xy;
					    u_xlat4.x = u_xlat3.x * u_xlat2.x + u_xlat14.x;
					    u_xlat4.y = u_xlat3.y * u_xlat2.x + u_xlat14.y;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(u_xlat15<u_xlat2.x);
					#else
					    u_xlatb2 = u_xlat15<u_xlat2.x;
					#endif
					    u_xlat8.x = u_xlatb2 ? 1.0 : float(0.0);
					    u_xlat2.x = (u_xlatb2) ? 0.0 : 1.0;
					    u_xlat8.xy = u_xlat8.xx * u_xlat4.xy;
					    u_xlat12.xy = u_xlat12.xy * u_xlat2.xx + u_xlat8.xy;
					    u_xlat12.xy = u_xlat12.xy + vec2(-0.5, -0.5);
					    u_xlat0.xy = u_xlat12.xy / u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
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
					uniform 	vec4 _ScreenResolution;
					uniform 	float _SphereSize;
					uniform 	float _SpherePositionX;
					uniform 	float _SpherePositionY;
					uniform 	float _Strength;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec2 u_xlat16_1;
					vec2 u_xlat2;
					bool u_xlatb2;
					vec2 u_xlat3;
					bool u_xlatb3;
					vec2 u_xlat4;
					bool u_xlatb4;
					float u_xlat5;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat9;
					bool u_xlatb9;
					float u_xlat10;
					bool u_xlatb10;
					vec2 u_xlat12;
					vec2 u_xlat14;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					float u_xlat21;
					bool u_xlatb21;
					float u_xlat22;
					bool u_xlatb22;
					void main()
					{
					    u_xlat0.y = _ScreenResolution.y / _ScreenResolution.x;
					    u_xlat16_1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat0.x = 1.0;
					    u_xlat12.xy = u_xlat16_1.xy * u_xlat0.xy + vec2(0.5, 0.5);
					    u_xlat2.xy = vec2(_SphereSize, _Strength) * vec2(0.100000001, 1.07500005);
					    u_xlat14.x = _SpherePositionX * 0.5 + 0.5;
					    u_xlat14.y = (-_SpherePositionY) * 0.5 + 0.5;
					    u_xlat3.xy = (-u_xlat14.xy);
					    u_xlat3.xy = u_xlat12.xy + u_xlat3.xy;
					    u_xlat15 = dot(u_xlat3.xy, u_xlat3.xy);
					    u_xlat15 = sqrt(u_xlat15);
					    u_xlat21 = u_xlat3.x / u_xlat3.y;
					    u_xlat4.x = min(abs(u_xlat21), 1.0);
					    u_xlat10 = max(abs(u_xlat21), 1.0);
					    u_xlat10 = float(1.0) / u_xlat10;
					    u_xlat4.x = u_xlat10 * u_xlat4.x;
					    u_xlat10 = u_xlat4.x * u_xlat4.x;
					    u_xlat16 = u_xlat10 * 0.0208350997 + -0.0851330012;
					    u_xlat16 = u_xlat10 * u_xlat16 + 0.180141002;
					    u_xlat16 = u_xlat10 * u_xlat16 + -0.330299497;
					    u_xlat10 = u_xlat10 * u_xlat16 + 0.999866009;
					    u_xlat16 = u_xlat10 * u_xlat4.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb22 = !!(1.0<abs(u_xlat21));
					#else
					    u_xlatb22 = 1.0<abs(u_xlat21);
					#endif
					    u_xlat16 = u_xlat16 * -2.0 + 1.57079637;
					    u_xlat16 = u_xlatb22 ? u_xlat16 : float(0.0);
					    u_xlat4.x = u_xlat4.x * u_xlat10 + u_xlat16;
					    u_xlat21 = min(u_xlat21, 1.0);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb21 = !!(u_xlat21<(-u_xlat21));
					#else
					    u_xlatb21 = u_xlat21<(-u_xlat21);
					#endif
					    u_xlat21 = (u_xlatb21) ? (-u_xlat4.x) : u_xlat4.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb4 = !!(0.0>=u_xlat3.y);
					#else
					    u_xlatb4 = 0.0>=u_xlat3.y;
					#endif
					    if(u_xlatb4){
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb4 = !!(u_xlat3.x>=0.0);
					#else
					        u_xlatb4 = u_xlat3.x>=0.0;
					#endif
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb10 = !!(u_xlat3.y<0.0);
					#else
					        u_xlatb10 = u_xlat3.y<0.0;
					#endif
					        u_xlatb4 = u_xlatb10 && u_xlatb4;
					        if(!u_xlatb4){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb16 = !!(u_xlat3.x<0.0);
					#else
					            u_xlatb16 = u_xlat3.x<0.0;
					#endif
					            u_xlatb10 = u_xlatb10 && u_xlatb16;
					            u_xlat22 = u_xlat21 + -3.1400001;
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb3 = !!(0.0<u_xlat3.x);
					#else
					            u_xlatb3 = 0.0<u_xlat3.x;
					#endif
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb9 = !!(u_xlat3.y==0.0);
					#else
					            u_xlatb9 = u_xlat3.y==0.0;
					#endif
					            u_xlatb3 = u_xlatb9 && u_xlatb3;
					            u_xlatb9 = u_xlatb9 && u_xlatb16;
					            u_xlat9 = (u_xlatb9) ? -1.57000005 : 1.57000005;
					            u_xlat3.x = (u_xlatb3) ? 1.57000005 : u_xlat9;
					            u_xlat21 = (u_xlatb10) ? u_xlat22 : u_xlat3.x;
					        } else {
					            u_xlat3.x = u_xlat21 + 3.1400001;
					            u_xlat21 = (u_xlatb4) ? u_xlat3.x : u_xlat21;
					        //ENDIF
					        }
					    //ENDIF
					    }
					    u_xlat3.x = u_xlat15 / u_xlat2.x;
					    u_xlat3.x = (-u_xlat3.x) + 1.0;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
					#else
					    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
					#endif
					    u_xlat9 = u_xlat3.x + -1.0;
					    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
					    u_xlat9 = sqrt(u_xlat9);
					    u_xlat3.x = (-u_xlat3.x) + 1.0;
					    u_xlat4.x = u_xlat3.x / u_xlat9;
					    u_xlat10 = min(u_xlat4.x, 1.0);
					    u_xlat16 = max(u_xlat4.x, 1.0);
					    u_xlat16 = float(1.0) / u_xlat16;
					    u_xlat10 = u_xlat16 * u_xlat10;
					    u_xlat16 = u_xlat10 * u_xlat10;
					    u_xlat22 = u_xlat16 * 0.0208350997 + -0.0851330012;
					    u_xlat22 = u_xlat16 * u_xlat22 + 0.180141002;
					    u_xlat22 = u_xlat16 * u_xlat22 + -0.330299497;
					    u_xlat16 = u_xlat16 * u_xlat22 + 0.999866009;
					    u_xlat22 = u_xlat16 * u_xlat10;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb4 = !!(1.0<u_xlat4.x);
					#else
					    u_xlatb4 = 1.0<u_xlat4.x;
					#endif
					    u_xlat22 = u_xlat22 * -2.0 + 1.57079637;
					    u_xlat4.x = u_xlatb4 ? u_xlat22 : float(0.0);
					    u_xlat4.x = u_xlat10 * u_xlat16 + u_xlat4.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb10 = !!(0.0>=u_xlat9);
					#else
					    u_xlatb10 = 0.0>=u_xlat9;
					#endif
					    u_xlat4.x = (u_xlatb10) ? 1.57000005 : u_xlat4.x;
					    u_xlat10 = sin(u_xlat4.x);
					    u_xlat8.x = u_xlat10 / u_xlat2.y;
					    u_xlat10 = -abs(u_xlat8.x) + 1.0;
					    u_xlat10 = sqrt(u_xlat10);
					    u_xlat16 = abs(u_xlat8.x) * -0.0187292993 + 0.0742610022;
					    u_xlat16 = u_xlat16 * abs(u_xlat8.x) + -0.212114394;
					    u_xlat16 = u_xlat16 * abs(u_xlat8.x) + 1.57072878;
					    u_xlat22 = u_xlat10 * u_xlat16;
					    u_xlat22 = u_xlat22 * -2.0 + 3.14159274;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb8 = !!(u_xlat8.x<(-u_xlat8.x));
					#else
					    u_xlatb8 = u_xlat8.x<(-u_xlat8.x);
					#endif
					    u_xlat8.x = u_xlatb8 ? u_xlat22 : float(0.0);
					    u_xlat8.x = u_xlat16 * u_xlat10 + u_xlat8.x;
					    u_xlat8.x = (-u_xlat8.x) + 1.57079637;
					    u_xlat8.x = (-u_xlat8.x) + u_xlat4.x;
					    u_xlat4.x = sin(u_xlat8.x);
					    u_xlat5 = cos(u_xlat8.x);
					    u_xlat8.x = u_xlat9 * u_xlat4.x;
					    u_xlat8.x = u_xlat8.x / u_xlat5;
					    u_xlat8.x = (-u_xlat8.x) + u_xlat3.x;
					    u_xlat3.x = sin(u_xlat21);
					    u_xlat4.x = cos(u_xlat21);
					    u_xlat3.y = u_xlat4.x;
					    u_xlat3.xy = u_xlat8.xx * u_xlat3.xy;
					    u_xlat4.x = u_xlat3.x * u_xlat2.x + u_xlat14.x;
					    u_xlat4.y = u_xlat3.y * u_xlat2.x + u_xlat14.y;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(u_xlat15<u_xlat2.x);
					#else
					    u_xlatb2 = u_xlat15<u_xlat2.x;
					#endif
					    u_xlat8.x = u_xlatb2 ? 1.0 : float(0.0);
					    u_xlat2.x = (u_xlatb2) ? 0.0 : 1.0;
					    u_xlat8.xy = u_xlat8.xx * u_xlat4.xy;
					    u_xlat12.xy = u_xlat12.xy * u_xlat2.xx + u_xlat8.xy;
					    u_xlat12.xy = u_xlat12.xy + vec2(-0.5, -0.5);
					    u_xlat0.xy = u_xlat12.xy / u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
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