Shader "CameraFilterPack/AAA_Super_Computer" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_Value ("_Value", Range(0.2, 10)) = 8.1
		_BorderSize ("_BorderSize", Range(-0.5, 0.5)) = 0
		_BorderColor ("_BorderColor", Vector) = (0,0.5,1,1)
		_SpotSize ("_SpotSize", Range(0, 1)) = 0.5
		_AlphaHexa ("_AlphaHexa", Range(0.2, 10)) = 0.608
		_PositionX ("_PositionX", Range(-0.5, 0.5)) = 0
		_PositionY ("_PositionY", Range(-0.5, 0.5)) = 0
		_Radius ("_Radius", Range(0, 1)) = 0.5
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 32825
			Program "vp"
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
					uniform highp float _BorderSize;
					uniform highp vec4 _BorderColor;
					uniform highp float _AlphaHexa;
					uniform highp float _PositionX;
					uniform highp float _PositionY;
					uniform highp float _Radius;
					uniform highp float _SpotSize;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 col_1;
					  highp float f_3;
					  highp float a_4;
					  highp float v_5;
					  highp float flicker_6;
					  highp vec4 tex_7;
					  highp vec2 uv_8;
					  uv_8 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_9;
					  tmpvar_9 = texture2D (_MainTex, uv_8);
					  tex_7 = tmpvar_9;
					  uv_8 = ((uv_8 - 0.5) * 2.0);
					  highp float p_10;
					  p_10 = (_TimeX * 1.3);
					  highp float tmpvar_11;
					  tmpvar_11 = floor(p_10);
					  flicker_6 = ((mix (
					    fract((sin(tmpvar_11) * 43758.55))
					  , 
					    fract((sin((tmpvar_11 + 1.0)) * 43758.55))
					  , 
					    fract((p_10 * 2345.12))
					  ) * 0.8) + 0.4);
					  v_5 = 0.0;
					  a_4 = 0.6;
					  f_3 = 1.0;
					  for (highp int i_1_2 = 0; i_1_2 < 3; i_1_2++) {
					    highp float v2_12;
					    highp float v1_13;
					    highp float tmpvar_14;
					    highp vec2 x_15;
					    x_15 = ((uv_8 * f_3) + 5.0);
					    highp vec2 res_17;
					    highp vec2 f_18;
					    highp vec2 p_19;
					    p_19 = floor(x_15);
					    f_18 = fract(x_15);
					    res_17 = vec2(8.0, 8.0);
					    for (highp int j_16 = -1; j_16 <= 1; j_16++) {
					      highp vec2 tmpvar_20;
					      tmpvar_20.x = -1.0;
					      tmpvar_20.y = float(j_16);
					      highp vec2 p_21;
					      p_21 = (p_19 + tmpvar_20);
					      highp vec2 tmpvar_22;
					      tmpvar_22.x = sin(((
					        (p_21.x * 591.32)
					       + 
					        (p_21.y * 154.077)
					      ) + _TimeX));
					      tmpvar_22.y = cos(((
					        (p_21.x * 391.32)
					       + 
					        (p_21.y * 49.077)
					      ) + _TimeX));
					      highp vec2 tmpvar_23;
					      tmpvar_23 = ((tmpvar_20 - f_18) + (fract(tmpvar_22) * _BorderSize));
					      highp float tmpvar_24;
					      tmpvar_24 = max (abs(tmpvar_23.x), abs(tmpvar_23.y));
					      if ((tmpvar_24 < res_17.x)) {
					        res_17.y = res_17.x;
					        res_17.x = tmpvar_24;
					      } else {
					        if ((tmpvar_24 < res_17.y)) {
					          res_17.y = tmpvar_24;
					        };
					      };
					      highp vec2 tmpvar_25;
					      tmpvar_25.x = 0.0;
					      tmpvar_25.y = float(j_16);
					      highp vec2 p_26;
					      p_26 = (p_19 + tmpvar_25);
					      highp vec2 tmpvar_27;
					      tmpvar_27.x = sin(((
					        (p_26.x * 591.32)
					       + 
					        (p_26.y * 154.077)
					      ) + _TimeX));
					      tmpvar_27.y = cos(((
					        (p_26.x * 391.32)
					       + 
					        (p_26.y * 49.077)
					      ) + _TimeX));
					      highp vec2 tmpvar_28;
					      tmpvar_28 = ((tmpvar_25 - f_18) + (fract(tmpvar_27) * _BorderSize));
					      highp float tmpvar_29;
					      tmpvar_29 = max (abs(tmpvar_28.x), abs(tmpvar_28.y));
					      if ((tmpvar_29 < res_17.x)) {
					        res_17.y = res_17.x;
					        res_17.x = tmpvar_29;
					      } else {
					        if ((tmpvar_29 < res_17.y)) {
					          res_17.y = tmpvar_29;
					        };
					      };
					      highp vec2 tmpvar_30;
					      tmpvar_30.x = 1.0;
					      tmpvar_30.y = float(j_16);
					      highp vec2 p_31;
					      p_31 = (p_19 + tmpvar_30);
					      highp vec2 tmpvar_32;
					      tmpvar_32.x = sin(((
					        (p_31.x * 591.32)
					       + 
					        (p_31.y * 154.077)
					      ) + _TimeX));
					      tmpvar_32.y = cos(((
					        (p_31.x * 391.32)
					       + 
					        (p_31.y * 49.077)
					      ) + _TimeX));
					      highp vec2 tmpvar_33;
					      tmpvar_33 = ((tmpvar_30 - f_18) + (fract(tmpvar_32) * _BorderSize));
					      highp float tmpvar_34;
					      tmpvar_34 = max (abs(tmpvar_33.x), abs(tmpvar_33.y));
					      if ((tmpvar_34 < res_17.x)) {
					        res_17.y = res_17.x;
					        res_17.x = tmpvar_34;
					      } else {
					        if ((tmpvar_34 < res_17.y)) {
					          res_17.y = tmpvar_34;
					        };
					      };
					    };
					    tmpvar_14 = (res_17.y - (res_17.x * _Value2));
					    v1_13 = tmpvar_14;
					    v2_12 = 0.0;
					    if ((i_1_2 > 0)) {
					      highp float tmpvar_35;
					      highp vec2 x_36;
					      x_36 = (((
					        (uv_8 * f_3)
					       * 0.5) + 50.0) + _TimeX);
					      highp int j_37;
					      highp vec2 res_38;
					      highp vec2 f_39;
					      highp vec2 p_40;
					      p_40 = floor(x_36);
					      f_39 = fract(x_36);
					      res_38 = vec2(8.0, 8.0);
					      j_37 = -1;
					      while (true) {
					        highp int i_41;
					        if ((j_37 > 1)) {
					          break;
					        };
					        i_41 = -1;
					        while (true) {
					          if ((i_41 > 1)) {
					            break;
					          };
					          highp vec2 tmpvar_42;
					          tmpvar_42.x = float(i_41);
					          tmpvar_42.y = float(j_37);
					          highp vec2 p_43;
					          p_43 = (p_40 + tmpvar_42);
					          highp vec2 tmpvar_44;
					          tmpvar_44.x = sin(((
					            (p_43.x * 591.32)
					           + 
					            (p_43.y * 154.077)
					          ) + _TimeX));
					          tmpvar_44.y = cos(((
					            (p_43.x * 391.32)
					           + 
					            (p_43.y * 49.077)
					          ) + _TimeX));
					          highp vec2 tmpvar_45;
					          tmpvar_45 = ((tmpvar_42 - f_39) + (fract(tmpvar_44) * _BorderSize));
					          highp float tmpvar_46;
					          tmpvar_46 = max (abs(tmpvar_45.x), abs(tmpvar_45.y));
					          if ((tmpvar_46 < res_38.x)) {
					            res_38.y = res_38.x;
					            res_38.x = tmpvar_46;
					          } else {
					            if ((tmpvar_46 < res_38.y)) {
					              res_38.y = tmpvar_46;
					            };
					          };
					          i_41++;
					        };
					        j_37++;
					      };
					      tmpvar_35 = (res_38.y - (res_38.x * _Value2));
					      v2_12 = tmpvar_35;
					      highp float tmpvar_47;
					      tmpvar_47 = clamp ((tmpvar_14 / 0.1), 0.0, 1.0);
					      highp float tmpvar_48;
					      tmpvar_48 = clamp ((tmpvar_35 / 0.08), 0.0, 1.0);
					      highp float tmpvar_49;
					      tmpvar_49 = ((1.0 - (tmpvar_47 * 
					        (tmpvar_47 * (3.0 - (2.0 * tmpvar_47)))
					      )) * (0.5 + (1.0 - 
					        (tmpvar_48 * (tmpvar_48 * (3.0 - (2.0 * tmpvar_48))))
					      )));
					      v_5 = (v_5 + (a_4 * (tmpvar_49 * tmpvar_49)));
					    };
					    highp float tmpvar_50;
					    tmpvar_50 = clamp ((tmpvar_14 / 0.3), 0.0, 1.0);
					    v1_13 = (1.0 - (tmpvar_50 * (tmpvar_50 * 
					      (3.0 - (2.0 * tmpvar_50))
					    )));
					    highp float p_51;
					    p_51 = ((v1_13 * 5.5) + 0.1);
					    highp float tmpvar_52;
					    tmpvar_52 = floor(p_51);
					    v2_12 = (a_4 * mix (fract(
					      (sin(tmpvar_52) * 43758.55)
					    ), fract(
					      (sin((tmpvar_52 + 1.0)) * 43758.55)
					    ), fract(
					      (p_51 * 2345.12)
					    )));
					    if ((i_1_2 == 0)) {
					      v_5 = (v_5 + (v2_12 * flicker_6));
					    } else {
					      v_5 = (v_5 + v2_12);
					    };
					    f_3 = (f_3 * 3.0);
					    a_4 = (a_4 * 0.7);
					  };
					  v_5 = (v_5 * (exp(
					    (-0.6 * sqrt(dot (uv_8, uv_8)))
					  ) * 1.2));
					  highp vec3 tmpvar_53;
					  tmpvar_53.x = pow (v_5, 2.5);
					  tmpvar_53.y = pow (v_5, 2.5);
					  tmpvar_53.z = pow (v_5, 2.5);
					  col_1 = ((tmpvar_53 * _Value) * _BorderColor.xyz);
					  highp vec2 tmpvar_54;
					  tmpvar_54.x = _PositionX;
					  tmpvar_54.y = _PositionY;
					  highp vec2 x_55;
					  x_55 = (tmpvar_54 - uv_8);
					  highp float tmpvar_56;
					  tmpvar_56 = clamp (((
					    sqrt(dot (x_55, x_55))
					   - _Radius) / (
					    (_Radius + (0.15 * _SpotSize))
					   - _Radius)), 0.0, 1.0);
					  col_1 = mix ((col_1 + tex_7.xyz), tex_7.xyz, vec3((1.0 - (tmpvar_56 * 
					    (tmpvar_56 * (3.0 - (2.0 * tmpvar_56)))
					  ))));
					  col_1 = mix (col_1, tex_7.xyz, vec3((1.0 - _AlphaHexa)));
					  highp vec4 tmpvar_57;
					  tmpvar_57.w = 1.0;
					  tmpvar_57.xyz = col_1;
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
					uniform highp float _BorderSize;
					uniform highp vec4 _BorderColor;
					uniform highp float _AlphaHexa;
					uniform highp float _PositionX;
					uniform highp float _PositionY;
					uniform highp float _Radius;
					uniform highp float _SpotSize;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 col_1;
					  highp float f_3;
					  highp float a_4;
					  highp float v_5;
					  highp float flicker_6;
					  highp vec4 tex_7;
					  highp vec2 uv_8;
					  uv_8 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_9;
					  tmpvar_9 = texture2D (_MainTex, uv_8);
					  tex_7 = tmpvar_9;
					  uv_8 = ((uv_8 - 0.5) * 2.0);
					  highp float p_10;
					  p_10 = (_TimeX * 1.3);
					  highp float tmpvar_11;
					  tmpvar_11 = floor(p_10);
					  flicker_6 = ((mix (
					    fract((sin(tmpvar_11) * 43758.55))
					  , 
					    fract((sin((tmpvar_11 + 1.0)) * 43758.55))
					  , 
					    fract((p_10 * 2345.12))
					  ) * 0.8) + 0.4);
					  v_5 = 0.0;
					  a_4 = 0.6;
					  f_3 = 1.0;
					  for (highp int i_1_2 = 0; i_1_2 < 3; i_1_2++) {
					    highp float v2_12;
					    highp float v1_13;
					    highp float tmpvar_14;
					    highp vec2 x_15;
					    x_15 = ((uv_8 * f_3) + 5.0);
					    highp vec2 res_17;
					    highp vec2 f_18;
					    highp vec2 p_19;
					    p_19 = floor(x_15);
					    f_18 = fract(x_15);
					    res_17 = vec2(8.0, 8.0);
					    for (highp int j_16 = -1; j_16 <= 1; j_16++) {
					      highp vec2 tmpvar_20;
					      tmpvar_20.x = -1.0;
					      tmpvar_20.y = float(j_16);
					      highp vec2 p_21;
					      p_21 = (p_19 + tmpvar_20);
					      highp vec2 tmpvar_22;
					      tmpvar_22.x = sin(((
					        (p_21.x * 591.32)
					       + 
					        (p_21.y * 154.077)
					      ) + _TimeX));
					      tmpvar_22.y = cos(((
					        (p_21.x * 391.32)
					       + 
					        (p_21.y * 49.077)
					      ) + _TimeX));
					      highp vec2 tmpvar_23;
					      tmpvar_23 = ((tmpvar_20 - f_18) + (fract(tmpvar_22) * _BorderSize));
					      highp float tmpvar_24;
					      tmpvar_24 = max (abs(tmpvar_23.x), abs(tmpvar_23.y));
					      if ((tmpvar_24 < res_17.x)) {
					        res_17.y = res_17.x;
					        res_17.x = tmpvar_24;
					      } else {
					        if ((tmpvar_24 < res_17.y)) {
					          res_17.y = tmpvar_24;
					        };
					      };
					      highp vec2 tmpvar_25;
					      tmpvar_25.x = 0.0;
					      tmpvar_25.y = float(j_16);
					      highp vec2 p_26;
					      p_26 = (p_19 + tmpvar_25);
					      highp vec2 tmpvar_27;
					      tmpvar_27.x = sin(((
					        (p_26.x * 591.32)
					       + 
					        (p_26.y * 154.077)
					      ) + _TimeX));
					      tmpvar_27.y = cos(((
					        (p_26.x * 391.32)
					       + 
					        (p_26.y * 49.077)
					      ) + _TimeX));
					      highp vec2 tmpvar_28;
					      tmpvar_28 = ((tmpvar_25 - f_18) + (fract(tmpvar_27) * _BorderSize));
					      highp float tmpvar_29;
					      tmpvar_29 = max (abs(tmpvar_28.x), abs(tmpvar_28.y));
					      if ((tmpvar_29 < res_17.x)) {
					        res_17.y = res_17.x;
					        res_17.x = tmpvar_29;
					      } else {
					        if ((tmpvar_29 < res_17.y)) {
					          res_17.y = tmpvar_29;
					        };
					      };
					      highp vec2 tmpvar_30;
					      tmpvar_30.x = 1.0;
					      tmpvar_30.y = float(j_16);
					      highp vec2 p_31;
					      p_31 = (p_19 + tmpvar_30);
					      highp vec2 tmpvar_32;
					      tmpvar_32.x = sin(((
					        (p_31.x * 591.32)
					       + 
					        (p_31.y * 154.077)
					      ) + _TimeX));
					      tmpvar_32.y = cos(((
					        (p_31.x * 391.32)
					       + 
					        (p_31.y * 49.077)
					      ) + _TimeX));
					      highp vec2 tmpvar_33;
					      tmpvar_33 = ((tmpvar_30 - f_18) + (fract(tmpvar_32) * _BorderSize));
					      highp float tmpvar_34;
					      tmpvar_34 = max (abs(tmpvar_33.x), abs(tmpvar_33.y));
					      if ((tmpvar_34 < res_17.x)) {
					        res_17.y = res_17.x;
					        res_17.x = tmpvar_34;
					      } else {
					        if ((tmpvar_34 < res_17.y)) {
					          res_17.y = tmpvar_34;
					        };
					      };
					    };
					    tmpvar_14 = (res_17.y - (res_17.x * _Value2));
					    v1_13 = tmpvar_14;
					    v2_12 = 0.0;
					    if ((i_1_2 > 0)) {
					      highp float tmpvar_35;
					      highp vec2 x_36;
					      x_36 = (((
					        (uv_8 * f_3)
					       * 0.5) + 50.0) + _TimeX);
					      highp int j_37;
					      highp vec2 res_38;
					      highp vec2 f_39;
					      highp vec2 p_40;
					      p_40 = floor(x_36);
					      f_39 = fract(x_36);
					      res_38 = vec2(8.0, 8.0);
					      j_37 = -1;
					      while (true) {
					        highp int i_41;
					        if ((j_37 > 1)) {
					          break;
					        };
					        i_41 = -1;
					        while (true) {
					          if ((i_41 > 1)) {
					            break;
					          };
					          highp vec2 tmpvar_42;
					          tmpvar_42.x = float(i_41);
					          tmpvar_42.y = float(j_37);
					          highp vec2 p_43;
					          p_43 = (p_40 + tmpvar_42);
					          highp vec2 tmpvar_44;
					          tmpvar_44.x = sin(((
					            (p_43.x * 591.32)
					           + 
					            (p_43.y * 154.077)
					          ) + _TimeX));
					          tmpvar_44.y = cos(((
					            (p_43.x * 391.32)
					           + 
					            (p_43.y * 49.077)
					          ) + _TimeX));
					          highp vec2 tmpvar_45;
					          tmpvar_45 = ((tmpvar_42 - f_39) + (fract(tmpvar_44) * _BorderSize));
					          highp float tmpvar_46;
					          tmpvar_46 = max (abs(tmpvar_45.x), abs(tmpvar_45.y));
					          if ((tmpvar_46 < res_38.x)) {
					            res_38.y = res_38.x;
					            res_38.x = tmpvar_46;
					          } else {
					            if ((tmpvar_46 < res_38.y)) {
					              res_38.y = tmpvar_46;
					            };
					          };
					          i_41++;
					        };
					        j_37++;
					      };
					      tmpvar_35 = (res_38.y - (res_38.x * _Value2));
					      v2_12 = tmpvar_35;
					      highp float tmpvar_47;
					      tmpvar_47 = clamp ((tmpvar_14 / 0.1), 0.0, 1.0);
					      highp float tmpvar_48;
					      tmpvar_48 = clamp ((tmpvar_35 / 0.08), 0.0, 1.0);
					      highp float tmpvar_49;
					      tmpvar_49 = ((1.0 - (tmpvar_47 * 
					        (tmpvar_47 * (3.0 - (2.0 * tmpvar_47)))
					      )) * (0.5 + (1.0 - 
					        (tmpvar_48 * (tmpvar_48 * (3.0 - (2.0 * tmpvar_48))))
					      )));
					      v_5 = (v_5 + (a_4 * (tmpvar_49 * tmpvar_49)));
					    };
					    highp float tmpvar_50;
					    tmpvar_50 = clamp ((tmpvar_14 / 0.3), 0.0, 1.0);
					    v1_13 = (1.0 - (tmpvar_50 * (tmpvar_50 * 
					      (3.0 - (2.0 * tmpvar_50))
					    )));
					    highp float p_51;
					    p_51 = ((v1_13 * 5.5) + 0.1);
					    highp float tmpvar_52;
					    tmpvar_52 = floor(p_51);
					    v2_12 = (a_4 * mix (fract(
					      (sin(tmpvar_52) * 43758.55)
					    ), fract(
					      (sin((tmpvar_52 + 1.0)) * 43758.55)
					    ), fract(
					      (p_51 * 2345.12)
					    )));
					    if ((i_1_2 == 0)) {
					      v_5 = (v_5 + (v2_12 * flicker_6));
					    } else {
					      v_5 = (v_5 + v2_12);
					    };
					    f_3 = (f_3 * 3.0);
					    a_4 = (a_4 * 0.7);
					  };
					  v_5 = (v_5 * (exp(
					    (-0.6 * sqrt(dot (uv_8, uv_8)))
					  ) * 1.2));
					  highp vec3 tmpvar_53;
					  tmpvar_53.x = pow (v_5, 2.5);
					  tmpvar_53.y = pow (v_5, 2.5);
					  tmpvar_53.z = pow (v_5, 2.5);
					  col_1 = ((tmpvar_53 * _Value) * _BorderColor.xyz);
					  highp vec2 tmpvar_54;
					  tmpvar_54.x = _PositionX;
					  tmpvar_54.y = _PositionY;
					  highp vec2 x_55;
					  x_55 = (tmpvar_54 - uv_8);
					  highp float tmpvar_56;
					  tmpvar_56 = clamp (((
					    sqrt(dot (x_55, x_55))
					   - _Radius) / (
					    (_Radius + (0.15 * _SpotSize))
					   - _Radius)), 0.0, 1.0);
					  col_1 = mix ((col_1 + tex_7.xyz), tex_7.xyz, vec3((1.0 - (tmpvar_56 * 
					    (tmpvar_56 * (3.0 - (2.0 * tmpvar_56)))
					  ))));
					  col_1 = mix (col_1, tex_7.xyz, vec3((1.0 - _AlphaHexa)));
					  highp vec4 tmpvar_57;
					  tmpvar_57.w = 1.0;
					  tmpvar_57.xyz = col_1;
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
					uniform highp float _BorderSize;
					uniform highp vec4 _BorderColor;
					uniform highp float _AlphaHexa;
					uniform highp float _PositionX;
					uniform highp float _PositionY;
					uniform highp float _Radius;
					uniform highp float _SpotSize;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 col_1;
					  highp float f_3;
					  highp float a_4;
					  highp float v_5;
					  highp float flicker_6;
					  highp vec4 tex_7;
					  highp vec2 uv_8;
					  uv_8 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_9;
					  tmpvar_9 = texture2D (_MainTex, uv_8);
					  tex_7 = tmpvar_9;
					  uv_8 = ((uv_8 - 0.5) * 2.0);
					  highp float p_10;
					  p_10 = (_TimeX * 1.3);
					  highp float tmpvar_11;
					  tmpvar_11 = floor(p_10);
					  flicker_6 = ((mix (
					    fract((sin(tmpvar_11) * 43758.55))
					  , 
					    fract((sin((tmpvar_11 + 1.0)) * 43758.55))
					  , 
					    fract((p_10 * 2345.12))
					  ) * 0.8) + 0.4);
					  v_5 = 0.0;
					  a_4 = 0.6;
					  f_3 = 1.0;
					  for (highp int i_1_2 = 0; i_1_2 < 3; i_1_2++) {
					    highp float v2_12;
					    highp float v1_13;
					    highp float tmpvar_14;
					    highp vec2 x_15;
					    x_15 = ((uv_8 * f_3) + 5.0);
					    highp vec2 res_17;
					    highp vec2 f_18;
					    highp vec2 p_19;
					    p_19 = floor(x_15);
					    f_18 = fract(x_15);
					    res_17 = vec2(8.0, 8.0);
					    for (highp int j_16 = -1; j_16 <= 1; j_16++) {
					      highp vec2 tmpvar_20;
					      tmpvar_20.x = -1.0;
					      tmpvar_20.y = float(j_16);
					      highp vec2 p_21;
					      p_21 = (p_19 + tmpvar_20);
					      highp vec2 tmpvar_22;
					      tmpvar_22.x = sin(((
					        (p_21.x * 591.32)
					       + 
					        (p_21.y * 154.077)
					      ) + _TimeX));
					      tmpvar_22.y = cos(((
					        (p_21.x * 391.32)
					       + 
					        (p_21.y * 49.077)
					      ) + _TimeX));
					      highp vec2 tmpvar_23;
					      tmpvar_23 = ((tmpvar_20 - f_18) + (fract(tmpvar_22) * _BorderSize));
					      highp float tmpvar_24;
					      tmpvar_24 = max (abs(tmpvar_23.x), abs(tmpvar_23.y));
					      if ((tmpvar_24 < res_17.x)) {
					        res_17.y = res_17.x;
					        res_17.x = tmpvar_24;
					      } else {
					        if ((tmpvar_24 < res_17.y)) {
					          res_17.y = tmpvar_24;
					        };
					      };
					      highp vec2 tmpvar_25;
					      tmpvar_25.x = 0.0;
					      tmpvar_25.y = float(j_16);
					      highp vec2 p_26;
					      p_26 = (p_19 + tmpvar_25);
					      highp vec2 tmpvar_27;
					      tmpvar_27.x = sin(((
					        (p_26.x * 591.32)
					       + 
					        (p_26.y * 154.077)
					      ) + _TimeX));
					      tmpvar_27.y = cos(((
					        (p_26.x * 391.32)
					       + 
					        (p_26.y * 49.077)
					      ) + _TimeX));
					      highp vec2 tmpvar_28;
					      tmpvar_28 = ((tmpvar_25 - f_18) + (fract(tmpvar_27) * _BorderSize));
					      highp float tmpvar_29;
					      tmpvar_29 = max (abs(tmpvar_28.x), abs(tmpvar_28.y));
					      if ((tmpvar_29 < res_17.x)) {
					        res_17.y = res_17.x;
					        res_17.x = tmpvar_29;
					      } else {
					        if ((tmpvar_29 < res_17.y)) {
					          res_17.y = tmpvar_29;
					        };
					      };
					      highp vec2 tmpvar_30;
					      tmpvar_30.x = 1.0;
					      tmpvar_30.y = float(j_16);
					      highp vec2 p_31;
					      p_31 = (p_19 + tmpvar_30);
					      highp vec2 tmpvar_32;
					      tmpvar_32.x = sin(((
					        (p_31.x * 591.32)
					       + 
					        (p_31.y * 154.077)
					      ) + _TimeX));
					      tmpvar_32.y = cos(((
					        (p_31.x * 391.32)
					       + 
					        (p_31.y * 49.077)
					      ) + _TimeX));
					      highp vec2 tmpvar_33;
					      tmpvar_33 = ((tmpvar_30 - f_18) + (fract(tmpvar_32) * _BorderSize));
					      highp float tmpvar_34;
					      tmpvar_34 = max (abs(tmpvar_33.x), abs(tmpvar_33.y));
					      if ((tmpvar_34 < res_17.x)) {
					        res_17.y = res_17.x;
					        res_17.x = tmpvar_34;
					      } else {
					        if ((tmpvar_34 < res_17.y)) {
					          res_17.y = tmpvar_34;
					        };
					      };
					    };
					    tmpvar_14 = (res_17.y - (res_17.x * _Value2));
					    v1_13 = tmpvar_14;
					    v2_12 = 0.0;
					    if ((i_1_2 > 0)) {
					      highp float tmpvar_35;
					      highp vec2 x_36;
					      x_36 = (((
					        (uv_8 * f_3)
					       * 0.5) + 50.0) + _TimeX);
					      highp int j_37;
					      highp vec2 res_38;
					      highp vec2 f_39;
					      highp vec2 p_40;
					      p_40 = floor(x_36);
					      f_39 = fract(x_36);
					      res_38 = vec2(8.0, 8.0);
					      j_37 = -1;
					      while (true) {
					        highp int i_41;
					        if ((j_37 > 1)) {
					          break;
					        };
					        i_41 = -1;
					        while (true) {
					          if ((i_41 > 1)) {
					            break;
					          };
					          highp vec2 tmpvar_42;
					          tmpvar_42.x = float(i_41);
					          tmpvar_42.y = float(j_37);
					          highp vec2 p_43;
					          p_43 = (p_40 + tmpvar_42);
					          highp vec2 tmpvar_44;
					          tmpvar_44.x = sin(((
					            (p_43.x * 591.32)
					           + 
					            (p_43.y * 154.077)
					          ) + _TimeX));
					          tmpvar_44.y = cos(((
					            (p_43.x * 391.32)
					           + 
					            (p_43.y * 49.077)
					          ) + _TimeX));
					          highp vec2 tmpvar_45;
					          tmpvar_45 = ((tmpvar_42 - f_39) + (fract(tmpvar_44) * _BorderSize));
					          highp float tmpvar_46;
					          tmpvar_46 = max (abs(tmpvar_45.x), abs(tmpvar_45.y));
					          if ((tmpvar_46 < res_38.x)) {
					            res_38.y = res_38.x;
					            res_38.x = tmpvar_46;
					          } else {
					            if ((tmpvar_46 < res_38.y)) {
					              res_38.y = tmpvar_46;
					            };
					          };
					          i_41++;
					        };
					        j_37++;
					      };
					      tmpvar_35 = (res_38.y - (res_38.x * _Value2));
					      v2_12 = tmpvar_35;
					      highp float tmpvar_47;
					      tmpvar_47 = clamp ((tmpvar_14 / 0.1), 0.0, 1.0);
					      highp float tmpvar_48;
					      tmpvar_48 = clamp ((tmpvar_35 / 0.08), 0.0, 1.0);
					      highp float tmpvar_49;
					      tmpvar_49 = ((1.0 - (tmpvar_47 * 
					        (tmpvar_47 * (3.0 - (2.0 * tmpvar_47)))
					      )) * (0.5 + (1.0 - 
					        (tmpvar_48 * (tmpvar_48 * (3.0 - (2.0 * tmpvar_48))))
					      )));
					      v_5 = (v_5 + (a_4 * (tmpvar_49 * tmpvar_49)));
					    };
					    highp float tmpvar_50;
					    tmpvar_50 = clamp ((tmpvar_14 / 0.3), 0.0, 1.0);
					    v1_13 = (1.0 - (tmpvar_50 * (tmpvar_50 * 
					      (3.0 - (2.0 * tmpvar_50))
					    )));
					    highp float p_51;
					    p_51 = ((v1_13 * 5.5) + 0.1);
					    highp float tmpvar_52;
					    tmpvar_52 = floor(p_51);
					    v2_12 = (a_4 * mix (fract(
					      (sin(tmpvar_52) * 43758.55)
					    ), fract(
					      (sin((tmpvar_52 + 1.0)) * 43758.55)
					    ), fract(
					      (p_51 * 2345.12)
					    )));
					    if ((i_1_2 == 0)) {
					      v_5 = (v_5 + (v2_12 * flicker_6));
					    } else {
					      v_5 = (v_5 + v2_12);
					    };
					    f_3 = (f_3 * 3.0);
					    a_4 = (a_4 * 0.7);
					  };
					  v_5 = (v_5 * (exp(
					    (-0.6 * sqrt(dot (uv_8, uv_8)))
					  ) * 1.2));
					  highp vec3 tmpvar_53;
					  tmpvar_53.x = pow (v_5, 2.5);
					  tmpvar_53.y = pow (v_5, 2.5);
					  tmpvar_53.z = pow (v_5, 2.5);
					  col_1 = ((tmpvar_53 * _Value) * _BorderColor.xyz);
					  highp vec2 tmpvar_54;
					  tmpvar_54.x = _PositionX;
					  tmpvar_54.y = _PositionY;
					  highp vec2 x_55;
					  x_55 = (tmpvar_54 - uv_8);
					  highp float tmpvar_56;
					  tmpvar_56 = clamp (((
					    sqrt(dot (x_55, x_55))
					   - _Radius) / (
					    (_Radius + (0.15 * _SpotSize))
					   - _Radius)), 0.0, 1.0);
					  col_1 = mix ((col_1 + tex_7.xyz), tex_7.xyz, vec3((1.0 - (tmpvar_56 * 
					    (tmpvar_56 * (3.0 - (2.0 * tmpvar_56)))
					  ))));
					  col_1 = mix (col_1, tex_7.xyz, vec3((1.0 - _AlphaHexa)));
					  highp vec4 tmpvar_57;
					  tmpvar_57.w = 1.0;
					  tmpvar_57.xyz = col_1;
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
					uniform 	float _BorderSize;
					uniform 	vec4 _BorderColor;
					uniform 	float _AlphaHexa;
					uniform 	float _PositionX;
					uniform 	float _PositionY;
					uniform 	float _Radius;
					uniform 	float _SpotSize;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec3 u_xlat1;
					mediump vec2 u_xlat16_1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					bool u_xlatb3;
					vec2 u_xlat4;
					vec4 u_xlat5;
					int u_xlati5;
					vec3 u_xlat6;
					bvec3 u_xlatb6;
					vec3 u_xlat7;
					int u_xlati7;
					vec3 u_xlat8;
					vec3 u_xlat10;
					vec2 u_xlat11;
					float u_xlat12;
					vec2 u_xlat14;
					bool u_xlatb14;
					vec2 u_xlat16;
					bvec2 u_xlatb16;
					float u_xlat19;
					mediump vec2 u_xlat16_19;
					vec2 u_xlat21;
					vec2 u_xlat22;
					vec2 u_xlat24;
					bool u_xlatb24;
					float u_xlat27;
					mediump float u_xlat16_27;
					int u_xlati29;
					float u_xlat30;
					int u_xlati30;
					bool u_xlatb30;
					int u_xlati32;
					float u_xlat34;
					void main()
					{
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_19.xy = u_xlat16_1.xy + u_xlat16_1.xy;
					    u_xlat2.xy = vec2(_TimeX) * vec2(1.29999995, 3048.65601);
					    u_xlat27 = floor(u_xlat2.x);
					    u_xlat2.x = fract(u_xlat2.y);
					    u_xlat11.x = sin(u_xlat27);
					    u_xlat11.x = u_xlat11.x * 43758.5469;
					    u_xlat11.x = fract(u_xlat11.x);
					    u_xlat27 = u_xlat27 + 1.0;
					    u_xlat27 = sin(u_xlat27);
					    u_xlat27 = u_xlat27 * 43758.5469;
					    u_xlat27 = fract(u_xlat27);
					    u_xlat27 = (-u_xlat11.x) + u_xlat27;
					    u_xlat27 = u_xlat2.x * u_xlat27 + u_xlat11.x;
					    u_xlat27 = u_xlat27 * 0.800000012 + 0.400000006;
					    u_xlat2.x = float(0.0);
					    u_xlat11.x = float(0.600000024);
					    u_xlat11.y = float(1.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<3 ; u_xlati_loop_1++)
					    {
					        u_xlat3.xy = u_xlat16_19.xy * u_xlat11.yy;
					        u_xlat21.xy = u_xlat16_19.xy * u_xlat11.yy + vec2(5.0, 5.0);
					        u_xlat21.xy = floor(u_xlat21.xy);
					        u_xlat4.xy = fract(u_xlat3.xy);
					        u_xlat22.x = float(8.0);
					        u_xlat22.y = float(8.0);
					        for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
					        {
					            u_xlat6.y = float(u_xlati_loop_2);
					            u_xlat14.xy = u_xlat22.xy;
					            for(int u_xlati_loop_3 = int(0xFFFFFFFFu) ; u_xlati_loop_3<=1 ; u_xlati_loop_3++)
					            {
					                u_xlat6.x = float(u_xlati_loop_3);
					                u_xlat24.xy = (-u_xlat4.xy) + u_xlat6.xy;
					                u_xlat7.xy = u_xlat21.xy + u_xlat6.xy;
					                u_xlat6.x = dot(u_xlat7.xy, vec2(591.320007, 154.076996));
					                u_xlat6.x = u_xlat6.x + _TimeX;
					                u_xlat6.x = sin(u_xlat6.x);
					                u_xlat7.x = dot(u_xlat7.xy, vec2(391.320007, 49.0769997));
					                u_xlat7.x = u_xlat7.x + _TimeX;
					                u_xlat7.x = cos(u_xlat7.x);
					                u_xlat8.x = fract(u_xlat6.x);
					                u_xlat8.y = fract(u_xlat7.x);
					                u_xlat6.xz = u_xlat8.xy * vec2(vec2(_BorderSize, _BorderSize)) + u_xlat24.xy;
					                u_xlat7.x = max(abs(u_xlat6.z), abs(u_xlat6.x));
					                u_xlatb6.xz = lessThan(u_xlat7.xxxx, u_xlat14.xxyx).xz;
					                u_xlat7.z = (u_xlatb6.z) ? u_xlat7.x : u_xlat14.y;
					                u_xlat7.y = u_xlat14.x;
					                u_xlat14.xy = (u_xlatb6.x) ? u_xlat7.xy : u_xlat7.yz;
					            }
					            u_xlat22.xy = u_xlat14.xy;
					        }
					        u_xlat21.x = (-u_xlat22.x) * _Value2 + u_xlat22.y;
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb30 = !!(0<u_xlati_loop_1);
					#else
					        u_xlatb30 = 0<u_xlati_loop_1;
					#endif
					        if(u_xlatb30){
					            u_xlat3.xy = u_xlat3.xy * vec2(0.5, 0.5) + vec2(_TimeX);
					            u_xlat4.xy = u_xlat3.xy + vec2(50.0, 50.0);
					            u_xlat4.xy = floor(u_xlat4.xy);
					            u_xlat3.xy = fract(u_xlat3.xy);
					            u_xlat5.x = float(8.0);
					            u_xlat5.w = float(8.0);
					            for(int u_xlati_loop_4 = int(0xFFFFFFFFu) ; u_xlati_loop_4<=1 ; u_xlati_loop_4++)
					            {
					                u_xlat6.y = float(u_xlati_loop_4);
					                u_xlat24.xy = u_xlat5.xw;
					                for(int u_xlati_loop_5 = int(0xFFFFFFFFu) ; u_xlati_loop_5<=1 ; u_xlati_loop_5++)
					                {
					                    u_xlat6.x = float(u_xlati_loop_5);
					                    u_xlat16.xy = (-u_xlat3.xy) + u_xlat6.xy;
					                    u_xlat8.xy = u_xlat4.xy + u_xlat6.xy;
					                    u_xlat6.x = dot(u_xlat8.xy, vec2(591.320007, 154.076996));
					                    u_xlat6.x = u_xlat6.x + _TimeX;
					                    u_xlat6.x = sin(u_xlat6.x);
					                    u_xlat34 = dot(u_xlat8.xy, vec2(391.320007, 49.0769997));
					                    u_xlat34 = u_xlat34 + _TimeX;
					                    u_xlat34 = cos(u_xlat34);
					                    u_xlat8.x = fract(u_xlat6.x);
					                    u_xlat8.y = fract(u_xlat34);
					                    u_xlat16.xy = u_xlat8.xy * vec2(vec2(_BorderSize, _BorderSize)) + u_xlat16.xy;
					                    u_xlat8.x = max(abs(u_xlat16.y), abs(u_xlat16.x));
					                    u_xlatb16.xy = lessThan(u_xlat8.xxxx, u_xlat24.xyxx).xy;
					                    u_xlat8.z = (u_xlatb16.y) ? u_xlat8.x : u_xlat24.y;
					                    u_xlat8.y = u_xlat24.x;
					                    u_xlat24.xy = (u_xlatb16.x) ? u_xlat8.xy : u_xlat8.yz;
					                }
					                u_xlat5.xw = u_xlat24.xy;
					            }
					            u_xlat3.x = (-u_xlat5.x) * _Value2 + u_xlat5.w;
					            u_xlat12 = u_xlat21.x * 10.0;
					#ifdef UNITY_ADRENO_ES3
					            u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					            u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					            u_xlat30 = u_xlat12 * -2.0 + 3.0;
					            u_xlat12 = u_xlat12 * u_xlat12;
					            u_xlat12 = (-u_xlat30) * u_xlat12 + 1.0;
					            u_xlat3.x = u_xlat3.x * 12.5;
					#ifdef UNITY_ADRENO_ES3
					            u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
					#else
					            u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
					#endif
					            u_xlat30 = u_xlat3.x * -2.0 + 3.0;
					            u_xlat3.x = u_xlat3.x * u_xlat3.x;
					            u_xlat3.x = (-u_xlat30) * u_xlat3.x + 1.5;
					            u_xlat3.x = u_xlat3.x * u_xlat12;
					            u_xlat3.x = u_xlat3.x * u_xlat3.x;
					            u_xlat2.x = u_xlat11.x * u_xlat3.x + u_xlat2.x;
					        //ENDIF
					        }
					        u_xlat3.x = u_xlat21.x * 3.33333325;
					#ifdef UNITY_ADRENO_ES3
					        u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
					#else
					        u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
					#endif
					        u_xlat12 = u_xlat3.x * -2.0 + 3.0;
					        u_xlat3.x = u_xlat3.x * u_xlat3.x;
					        u_xlat3.x = (-u_xlat12) * u_xlat3.x + 1.0;
					        u_xlat3.x = u_xlat3.x * 5.5 + 0.100000001;
					        u_xlat12 = floor(u_xlat3.x);
					        u_xlat3.x = u_xlat3.x * 2345.12012;
					        u_xlat21.x = sin(u_xlat12);
					        u_xlat3.z = u_xlat21.x * 43758.5469;
					        u_xlat12 = u_xlat12 + 1.0;
					        u_xlat12 = sin(u_xlat12);
					        u_xlat3.y = u_xlat12 * 43758.5469;
					        u_xlat3.xyz = fract(u_xlat3.xyz);
					        u_xlat12 = (-u_xlat3.z) + u_xlat3.y;
					        u_xlat3.x = u_xlat3.x * u_xlat12 + u_xlat3.z;
					        u_xlat12 = u_xlat11.x * u_xlat3.x;
					        u_xlat12 = u_xlat12 * u_xlat27 + u_xlat2.x;
					        u_xlat3.x = u_xlat11.x * u_xlat3.x + u_xlat2.x;
					        u_xlat2.x = (u_xlati_loop_1 != 0) ? u_xlat3.x : u_xlat12;
					        u_xlat11.xy = u_xlat11.xy * vec2(0.699999988, 3.0);
					    }
					    u_xlat16_27 = dot(u_xlat16_19.xy, u_xlat16_19.xy);
					    u_xlat16_27 = sqrt(u_xlat16_27);
					    u_xlat16_27 = u_xlat16_27 * -0.865617037;
					    u_xlat16_27 = exp2(u_xlat16_27);
					    u_xlat27 = u_xlat2.x * u_xlat16_27;
					    u_xlat27 = u_xlat27 * 1.20000005;
					    u_xlat27 = log2(u_xlat27);
					    u_xlat27 = u_xlat27 * 2.5;
					    u_xlat27 = exp2(u_xlat27);
					    u_xlat27 = u_xlat27 * _Value;
					    u_xlat19 = _SpotSize * 0.150000006;
					    u_xlat1.xy = (-u_xlat16_1.xy) * vec2(2.0, 2.0) + vec2(_PositionX, _PositionY);
					    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x + (-_Radius);
					    u_xlat10.x = float(1.0) / u_xlat19;
					    u_xlat1.x = u_xlat10.x * u_xlat1.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
					#else
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					#endif
					    u_xlat10.x = u_xlat1.x * -2.0 + 3.0;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = (-u_xlat10.x) * u_xlat1.x + 1.0;
					    u_xlat10.xyz = vec3(u_xlat27) * _BorderColor.xyz + u_xlat10_0.xyz;
					    u_xlat2.xyz = u_xlat10_0.xyz + (-u_xlat10.xyz);
					    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat27 = (-_AlphaHexa) + 1.0;
					    u_xlat0.xyz = u_xlat10_0.xyz + (-u_xlat1.xyz);
					    SV_Target0.xyz = vec3(u_xlat27) * u_xlat0.xyz + u_xlat1.xyz;
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
					uniform 	float _BorderSize;
					uniform 	vec4 _BorderColor;
					uniform 	float _AlphaHexa;
					uniform 	float _PositionX;
					uniform 	float _PositionY;
					uniform 	float _Radius;
					uniform 	float _SpotSize;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec3 u_xlat1;
					mediump vec2 u_xlat16_1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					bool u_xlatb3;
					vec2 u_xlat4;
					vec4 u_xlat5;
					int u_xlati5;
					vec3 u_xlat6;
					bvec3 u_xlatb6;
					vec3 u_xlat7;
					int u_xlati7;
					vec3 u_xlat8;
					vec3 u_xlat10;
					vec2 u_xlat11;
					float u_xlat12;
					vec2 u_xlat14;
					bool u_xlatb14;
					vec2 u_xlat16;
					bvec2 u_xlatb16;
					float u_xlat19;
					mediump vec2 u_xlat16_19;
					vec2 u_xlat21;
					vec2 u_xlat22;
					vec2 u_xlat24;
					bool u_xlatb24;
					float u_xlat27;
					mediump float u_xlat16_27;
					int u_xlati29;
					float u_xlat30;
					int u_xlati30;
					bool u_xlatb30;
					int u_xlati32;
					float u_xlat34;
					void main()
					{
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_19.xy = u_xlat16_1.xy + u_xlat16_1.xy;
					    u_xlat2.xy = vec2(_TimeX) * vec2(1.29999995, 3048.65601);
					    u_xlat27 = floor(u_xlat2.x);
					    u_xlat2.x = fract(u_xlat2.y);
					    u_xlat11.x = sin(u_xlat27);
					    u_xlat11.x = u_xlat11.x * 43758.5469;
					    u_xlat11.x = fract(u_xlat11.x);
					    u_xlat27 = u_xlat27 + 1.0;
					    u_xlat27 = sin(u_xlat27);
					    u_xlat27 = u_xlat27 * 43758.5469;
					    u_xlat27 = fract(u_xlat27);
					    u_xlat27 = (-u_xlat11.x) + u_xlat27;
					    u_xlat27 = u_xlat2.x * u_xlat27 + u_xlat11.x;
					    u_xlat27 = u_xlat27 * 0.800000012 + 0.400000006;
					    u_xlat2.x = float(0.0);
					    u_xlat11.x = float(0.600000024);
					    u_xlat11.y = float(1.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<3 ; u_xlati_loop_1++)
					    {
					        u_xlat3.xy = u_xlat16_19.xy * u_xlat11.yy;
					        u_xlat21.xy = u_xlat16_19.xy * u_xlat11.yy + vec2(5.0, 5.0);
					        u_xlat21.xy = floor(u_xlat21.xy);
					        u_xlat4.xy = fract(u_xlat3.xy);
					        u_xlat22.x = float(8.0);
					        u_xlat22.y = float(8.0);
					        for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
					        {
					            u_xlat6.y = float(u_xlati_loop_2);
					            u_xlat14.xy = u_xlat22.xy;
					            for(int u_xlati_loop_3 = int(0xFFFFFFFFu) ; u_xlati_loop_3<=1 ; u_xlati_loop_3++)
					            {
					                u_xlat6.x = float(u_xlati_loop_3);
					                u_xlat24.xy = (-u_xlat4.xy) + u_xlat6.xy;
					                u_xlat7.xy = u_xlat21.xy + u_xlat6.xy;
					                u_xlat6.x = dot(u_xlat7.xy, vec2(591.320007, 154.076996));
					                u_xlat6.x = u_xlat6.x + _TimeX;
					                u_xlat6.x = sin(u_xlat6.x);
					                u_xlat7.x = dot(u_xlat7.xy, vec2(391.320007, 49.0769997));
					                u_xlat7.x = u_xlat7.x + _TimeX;
					                u_xlat7.x = cos(u_xlat7.x);
					                u_xlat8.x = fract(u_xlat6.x);
					                u_xlat8.y = fract(u_xlat7.x);
					                u_xlat6.xz = u_xlat8.xy * vec2(vec2(_BorderSize, _BorderSize)) + u_xlat24.xy;
					                u_xlat7.x = max(abs(u_xlat6.z), abs(u_xlat6.x));
					                u_xlatb6.xz = lessThan(u_xlat7.xxxx, u_xlat14.xxyx).xz;
					                u_xlat7.z = (u_xlatb6.z) ? u_xlat7.x : u_xlat14.y;
					                u_xlat7.y = u_xlat14.x;
					                u_xlat14.xy = (u_xlatb6.x) ? u_xlat7.xy : u_xlat7.yz;
					            }
					            u_xlat22.xy = u_xlat14.xy;
					        }
					        u_xlat21.x = (-u_xlat22.x) * _Value2 + u_xlat22.y;
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb30 = !!(0<u_xlati_loop_1);
					#else
					        u_xlatb30 = 0<u_xlati_loop_1;
					#endif
					        if(u_xlatb30){
					            u_xlat3.xy = u_xlat3.xy * vec2(0.5, 0.5) + vec2(_TimeX);
					            u_xlat4.xy = u_xlat3.xy + vec2(50.0, 50.0);
					            u_xlat4.xy = floor(u_xlat4.xy);
					            u_xlat3.xy = fract(u_xlat3.xy);
					            u_xlat5.x = float(8.0);
					            u_xlat5.w = float(8.0);
					            for(int u_xlati_loop_4 = int(0xFFFFFFFFu) ; u_xlati_loop_4<=1 ; u_xlati_loop_4++)
					            {
					                u_xlat6.y = float(u_xlati_loop_4);
					                u_xlat24.xy = u_xlat5.xw;
					                for(int u_xlati_loop_5 = int(0xFFFFFFFFu) ; u_xlati_loop_5<=1 ; u_xlati_loop_5++)
					                {
					                    u_xlat6.x = float(u_xlati_loop_5);
					                    u_xlat16.xy = (-u_xlat3.xy) + u_xlat6.xy;
					                    u_xlat8.xy = u_xlat4.xy + u_xlat6.xy;
					                    u_xlat6.x = dot(u_xlat8.xy, vec2(591.320007, 154.076996));
					                    u_xlat6.x = u_xlat6.x + _TimeX;
					                    u_xlat6.x = sin(u_xlat6.x);
					                    u_xlat34 = dot(u_xlat8.xy, vec2(391.320007, 49.0769997));
					                    u_xlat34 = u_xlat34 + _TimeX;
					                    u_xlat34 = cos(u_xlat34);
					                    u_xlat8.x = fract(u_xlat6.x);
					                    u_xlat8.y = fract(u_xlat34);
					                    u_xlat16.xy = u_xlat8.xy * vec2(vec2(_BorderSize, _BorderSize)) + u_xlat16.xy;
					                    u_xlat8.x = max(abs(u_xlat16.y), abs(u_xlat16.x));
					                    u_xlatb16.xy = lessThan(u_xlat8.xxxx, u_xlat24.xyxx).xy;
					                    u_xlat8.z = (u_xlatb16.y) ? u_xlat8.x : u_xlat24.y;
					                    u_xlat8.y = u_xlat24.x;
					                    u_xlat24.xy = (u_xlatb16.x) ? u_xlat8.xy : u_xlat8.yz;
					                }
					                u_xlat5.xw = u_xlat24.xy;
					            }
					            u_xlat3.x = (-u_xlat5.x) * _Value2 + u_xlat5.w;
					            u_xlat12 = u_xlat21.x * 10.0;
					#ifdef UNITY_ADRENO_ES3
					            u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					            u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					            u_xlat30 = u_xlat12 * -2.0 + 3.0;
					            u_xlat12 = u_xlat12 * u_xlat12;
					            u_xlat12 = (-u_xlat30) * u_xlat12 + 1.0;
					            u_xlat3.x = u_xlat3.x * 12.5;
					#ifdef UNITY_ADRENO_ES3
					            u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
					#else
					            u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
					#endif
					            u_xlat30 = u_xlat3.x * -2.0 + 3.0;
					            u_xlat3.x = u_xlat3.x * u_xlat3.x;
					            u_xlat3.x = (-u_xlat30) * u_xlat3.x + 1.5;
					            u_xlat3.x = u_xlat3.x * u_xlat12;
					            u_xlat3.x = u_xlat3.x * u_xlat3.x;
					            u_xlat2.x = u_xlat11.x * u_xlat3.x + u_xlat2.x;
					        //ENDIF
					        }
					        u_xlat3.x = u_xlat21.x * 3.33333325;
					#ifdef UNITY_ADRENO_ES3
					        u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
					#else
					        u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
					#endif
					        u_xlat12 = u_xlat3.x * -2.0 + 3.0;
					        u_xlat3.x = u_xlat3.x * u_xlat3.x;
					        u_xlat3.x = (-u_xlat12) * u_xlat3.x + 1.0;
					        u_xlat3.x = u_xlat3.x * 5.5 + 0.100000001;
					        u_xlat12 = floor(u_xlat3.x);
					        u_xlat3.x = u_xlat3.x * 2345.12012;
					        u_xlat21.x = sin(u_xlat12);
					        u_xlat3.z = u_xlat21.x * 43758.5469;
					        u_xlat12 = u_xlat12 + 1.0;
					        u_xlat12 = sin(u_xlat12);
					        u_xlat3.y = u_xlat12 * 43758.5469;
					        u_xlat3.xyz = fract(u_xlat3.xyz);
					        u_xlat12 = (-u_xlat3.z) + u_xlat3.y;
					        u_xlat3.x = u_xlat3.x * u_xlat12 + u_xlat3.z;
					        u_xlat12 = u_xlat11.x * u_xlat3.x;
					        u_xlat12 = u_xlat12 * u_xlat27 + u_xlat2.x;
					        u_xlat3.x = u_xlat11.x * u_xlat3.x + u_xlat2.x;
					        u_xlat2.x = (u_xlati_loop_1 != 0) ? u_xlat3.x : u_xlat12;
					        u_xlat11.xy = u_xlat11.xy * vec2(0.699999988, 3.0);
					    }
					    u_xlat16_27 = dot(u_xlat16_19.xy, u_xlat16_19.xy);
					    u_xlat16_27 = sqrt(u_xlat16_27);
					    u_xlat16_27 = u_xlat16_27 * -0.865617037;
					    u_xlat16_27 = exp2(u_xlat16_27);
					    u_xlat27 = u_xlat2.x * u_xlat16_27;
					    u_xlat27 = u_xlat27 * 1.20000005;
					    u_xlat27 = log2(u_xlat27);
					    u_xlat27 = u_xlat27 * 2.5;
					    u_xlat27 = exp2(u_xlat27);
					    u_xlat27 = u_xlat27 * _Value;
					    u_xlat19 = _SpotSize * 0.150000006;
					    u_xlat1.xy = (-u_xlat16_1.xy) * vec2(2.0, 2.0) + vec2(_PositionX, _PositionY);
					    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x + (-_Radius);
					    u_xlat10.x = float(1.0) / u_xlat19;
					    u_xlat1.x = u_xlat10.x * u_xlat1.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
					#else
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					#endif
					    u_xlat10.x = u_xlat1.x * -2.0 + 3.0;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = (-u_xlat10.x) * u_xlat1.x + 1.0;
					    u_xlat10.xyz = vec3(u_xlat27) * _BorderColor.xyz + u_xlat10_0.xyz;
					    u_xlat2.xyz = u_xlat10_0.xyz + (-u_xlat10.xyz);
					    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat27 = (-_AlphaHexa) + 1.0;
					    u_xlat0.xyz = u_xlat10_0.xyz + (-u_xlat1.xyz);
					    SV_Target0.xyz = vec3(u_xlat27) * u_xlat0.xyz + u_xlat1.xyz;
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
					uniform 	float _BorderSize;
					uniform 	vec4 _BorderColor;
					uniform 	float _AlphaHexa;
					uniform 	float _PositionX;
					uniform 	float _PositionY;
					uniform 	float _Radius;
					uniform 	float _SpotSize;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec3 u_xlat1;
					mediump vec2 u_xlat16_1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					bool u_xlatb3;
					vec2 u_xlat4;
					vec4 u_xlat5;
					int u_xlati5;
					vec3 u_xlat6;
					bvec3 u_xlatb6;
					vec3 u_xlat7;
					int u_xlati7;
					vec3 u_xlat8;
					vec3 u_xlat10;
					vec2 u_xlat11;
					float u_xlat12;
					vec2 u_xlat14;
					bool u_xlatb14;
					vec2 u_xlat16;
					bvec2 u_xlatb16;
					float u_xlat19;
					mediump vec2 u_xlat16_19;
					vec2 u_xlat21;
					vec2 u_xlat22;
					vec2 u_xlat24;
					bool u_xlatb24;
					float u_xlat27;
					mediump float u_xlat16_27;
					int u_xlati29;
					float u_xlat30;
					int u_xlati30;
					bool u_xlatb30;
					int u_xlati32;
					float u_xlat34;
					void main()
					{
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_19.xy = u_xlat16_1.xy + u_xlat16_1.xy;
					    u_xlat2.xy = vec2(_TimeX) * vec2(1.29999995, 3048.65601);
					    u_xlat27 = floor(u_xlat2.x);
					    u_xlat2.x = fract(u_xlat2.y);
					    u_xlat11.x = sin(u_xlat27);
					    u_xlat11.x = u_xlat11.x * 43758.5469;
					    u_xlat11.x = fract(u_xlat11.x);
					    u_xlat27 = u_xlat27 + 1.0;
					    u_xlat27 = sin(u_xlat27);
					    u_xlat27 = u_xlat27 * 43758.5469;
					    u_xlat27 = fract(u_xlat27);
					    u_xlat27 = (-u_xlat11.x) + u_xlat27;
					    u_xlat27 = u_xlat2.x * u_xlat27 + u_xlat11.x;
					    u_xlat27 = u_xlat27 * 0.800000012 + 0.400000006;
					    u_xlat2.x = float(0.0);
					    u_xlat11.x = float(0.600000024);
					    u_xlat11.y = float(1.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<3 ; u_xlati_loop_1++)
					    {
					        u_xlat3.xy = u_xlat16_19.xy * u_xlat11.yy;
					        u_xlat21.xy = u_xlat16_19.xy * u_xlat11.yy + vec2(5.0, 5.0);
					        u_xlat21.xy = floor(u_xlat21.xy);
					        u_xlat4.xy = fract(u_xlat3.xy);
					        u_xlat22.x = float(8.0);
					        u_xlat22.y = float(8.0);
					        for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
					        {
					            u_xlat6.y = float(u_xlati_loop_2);
					            u_xlat14.xy = u_xlat22.xy;
					            for(int u_xlati_loop_3 = int(0xFFFFFFFFu) ; u_xlati_loop_3<=1 ; u_xlati_loop_3++)
					            {
					                u_xlat6.x = float(u_xlati_loop_3);
					                u_xlat24.xy = (-u_xlat4.xy) + u_xlat6.xy;
					                u_xlat7.xy = u_xlat21.xy + u_xlat6.xy;
					                u_xlat6.x = dot(u_xlat7.xy, vec2(591.320007, 154.076996));
					                u_xlat6.x = u_xlat6.x + _TimeX;
					                u_xlat6.x = sin(u_xlat6.x);
					                u_xlat7.x = dot(u_xlat7.xy, vec2(391.320007, 49.0769997));
					                u_xlat7.x = u_xlat7.x + _TimeX;
					                u_xlat7.x = cos(u_xlat7.x);
					                u_xlat8.x = fract(u_xlat6.x);
					                u_xlat8.y = fract(u_xlat7.x);
					                u_xlat6.xz = u_xlat8.xy * vec2(vec2(_BorderSize, _BorderSize)) + u_xlat24.xy;
					                u_xlat7.x = max(abs(u_xlat6.z), abs(u_xlat6.x));
					                u_xlatb6.xz = lessThan(u_xlat7.xxxx, u_xlat14.xxyx).xz;
					                u_xlat7.z = (u_xlatb6.z) ? u_xlat7.x : u_xlat14.y;
					                u_xlat7.y = u_xlat14.x;
					                u_xlat14.xy = (u_xlatb6.x) ? u_xlat7.xy : u_xlat7.yz;
					            }
					            u_xlat22.xy = u_xlat14.xy;
					        }
					        u_xlat21.x = (-u_xlat22.x) * _Value2 + u_xlat22.y;
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb30 = !!(0<u_xlati_loop_1);
					#else
					        u_xlatb30 = 0<u_xlati_loop_1;
					#endif
					        if(u_xlatb30){
					            u_xlat3.xy = u_xlat3.xy * vec2(0.5, 0.5) + vec2(_TimeX);
					            u_xlat4.xy = u_xlat3.xy + vec2(50.0, 50.0);
					            u_xlat4.xy = floor(u_xlat4.xy);
					            u_xlat3.xy = fract(u_xlat3.xy);
					            u_xlat5.x = float(8.0);
					            u_xlat5.w = float(8.0);
					            for(int u_xlati_loop_4 = int(0xFFFFFFFFu) ; u_xlati_loop_4<=1 ; u_xlati_loop_4++)
					            {
					                u_xlat6.y = float(u_xlati_loop_4);
					                u_xlat24.xy = u_xlat5.xw;
					                for(int u_xlati_loop_5 = int(0xFFFFFFFFu) ; u_xlati_loop_5<=1 ; u_xlati_loop_5++)
					                {
					                    u_xlat6.x = float(u_xlati_loop_5);
					                    u_xlat16.xy = (-u_xlat3.xy) + u_xlat6.xy;
					                    u_xlat8.xy = u_xlat4.xy + u_xlat6.xy;
					                    u_xlat6.x = dot(u_xlat8.xy, vec2(591.320007, 154.076996));
					                    u_xlat6.x = u_xlat6.x + _TimeX;
					                    u_xlat6.x = sin(u_xlat6.x);
					                    u_xlat34 = dot(u_xlat8.xy, vec2(391.320007, 49.0769997));
					                    u_xlat34 = u_xlat34 + _TimeX;
					                    u_xlat34 = cos(u_xlat34);
					                    u_xlat8.x = fract(u_xlat6.x);
					                    u_xlat8.y = fract(u_xlat34);
					                    u_xlat16.xy = u_xlat8.xy * vec2(vec2(_BorderSize, _BorderSize)) + u_xlat16.xy;
					                    u_xlat8.x = max(abs(u_xlat16.y), abs(u_xlat16.x));
					                    u_xlatb16.xy = lessThan(u_xlat8.xxxx, u_xlat24.xyxx).xy;
					                    u_xlat8.z = (u_xlatb16.y) ? u_xlat8.x : u_xlat24.y;
					                    u_xlat8.y = u_xlat24.x;
					                    u_xlat24.xy = (u_xlatb16.x) ? u_xlat8.xy : u_xlat8.yz;
					                }
					                u_xlat5.xw = u_xlat24.xy;
					            }
					            u_xlat3.x = (-u_xlat5.x) * _Value2 + u_xlat5.w;
					            u_xlat12 = u_xlat21.x * 10.0;
					#ifdef UNITY_ADRENO_ES3
					            u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					            u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					            u_xlat30 = u_xlat12 * -2.0 + 3.0;
					            u_xlat12 = u_xlat12 * u_xlat12;
					            u_xlat12 = (-u_xlat30) * u_xlat12 + 1.0;
					            u_xlat3.x = u_xlat3.x * 12.5;
					#ifdef UNITY_ADRENO_ES3
					            u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
					#else
					            u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
					#endif
					            u_xlat30 = u_xlat3.x * -2.0 + 3.0;
					            u_xlat3.x = u_xlat3.x * u_xlat3.x;
					            u_xlat3.x = (-u_xlat30) * u_xlat3.x + 1.5;
					            u_xlat3.x = u_xlat3.x * u_xlat12;
					            u_xlat3.x = u_xlat3.x * u_xlat3.x;
					            u_xlat2.x = u_xlat11.x * u_xlat3.x + u_xlat2.x;
					        //ENDIF
					        }
					        u_xlat3.x = u_xlat21.x * 3.33333325;
					#ifdef UNITY_ADRENO_ES3
					        u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
					#else
					        u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
					#endif
					        u_xlat12 = u_xlat3.x * -2.0 + 3.0;
					        u_xlat3.x = u_xlat3.x * u_xlat3.x;
					        u_xlat3.x = (-u_xlat12) * u_xlat3.x + 1.0;
					        u_xlat3.x = u_xlat3.x * 5.5 + 0.100000001;
					        u_xlat12 = floor(u_xlat3.x);
					        u_xlat3.x = u_xlat3.x * 2345.12012;
					        u_xlat21.x = sin(u_xlat12);
					        u_xlat3.z = u_xlat21.x * 43758.5469;
					        u_xlat12 = u_xlat12 + 1.0;
					        u_xlat12 = sin(u_xlat12);
					        u_xlat3.y = u_xlat12 * 43758.5469;
					        u_xlat3.xyz = fract(u_xlat3.xyz);
					        u_xlat12 = (-u_xlat3.z) + u_xlat3.y;
					        u_xlat3.x = u_xlat3.x * u_xlat12 + u_xlat3.z;
					        u_xlat12 = u_xlat11.x * u_xlat3.x;
					        u_xlat12 = u_xlat12 * u_xlat27 + u_xlat2.x;
					        u_xlat3.x = u_xlat11.x * u_xlat3.x + u_xlat2.x;
					        u_xlat2.x = (u_xlati_loop_1 != 0) ? u_xlat3.x : u_xlat12;
					        u_xlat11.xy = u_xlat11.xy * vec2(0.699999988, 3.0);
					    }
					    u_xlat16_27 = dot(u_xlat16_19.xy, u_xlat16_19.xy);
					    u_xlat16_27 = sqrt(u_xlat16_27);
					    u_xlat16_27 = u_xlat16_27 * -0.865617037;
					    u_xlat16_27 = exp2(u_xlat16_27);
					    u_xlat27 = u_xlat2.x * u_xlat16_27;
					    u_xlat27 = u_xlat27 * 1.20000005;
					    u_xlat27 = log2(u_xlat27);
					    u_xlat27 = u_xlat27 * 2.5;
					    u_xlat27 = exp2(u_xlat27);
					    u_xlat27 = u_xlat27 * _Value;
					    u_xlat19 = _SpotSize * 0.150000006;
					    u_xlat1.xy = (-u_xlat16_1.xy) * vec2(2.0, 2.0) + vec2(_PositionX, _PositionY);
					    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x + (-_Radius);
					    u_xlat10.x = float(1.0) / u_xlat19;
					    u_xlat1.x = u_xlat10.x * u_xlat1.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
					#else
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					#endif
					    u_xlat10.x = u_xlat1.x * -2.0 + 3.0;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = (-u_xlat10.x) * u_xlat1.x + 1.0;
					    u_xlat10.xyz = vec3(u_xlat27) * _BorderColor.xyz + u_xlat10_0.xyz;
					    u_xlat2.xyz = u_xlat10_0.xyz + (-u_xlat10.xyz);
					    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat10.xyz;
					    u_xlat27 = (-_AlphaHexa) + 1.0;
					    u_xlat0.xyz = u_xlat10_0.xyz + (-u_xlat1.xyz);
					    SV_Target0.xyz = vec3(u_xlat27) * u_xlat0.xyz + u_xlat1.xyz;
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