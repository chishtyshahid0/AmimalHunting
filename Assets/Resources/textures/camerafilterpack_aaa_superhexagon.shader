Shader "CameraFilterPack/AAA_Super_Hexagon" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_Value ("_Value", Range(0.2, 10)) = 1
		_HexaColor ("_HexaColor", Vector) = (1,1,1,1)
		_BorderSize ("_BorderSize", Range(-0.5, 0.5)) = 0
		_BorderColor ("_BorderColor", Vector) = (1,1,1,1)
		_SpotSize ("_SpotSize", Range(0, 1)) = 0.5
		_AlphaHexa ("_AlphaHexa", Range(0.2, 10)) = 1
		_PositionX ("_PositionX", Range(-0.5, 0.5)) = 0
		_PositionY ("_PositionY", Range(-0.5, 0.5)) = 0
		_Radius ("_Radius", Range(0, 1)) = 0.5
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 8614
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
					uniform highp vec4 _ScreenResolution;
					uniform highp float _Value;
					uniform highp float _BorderSize;
					uniform highp vec4 _BorderColor;
					uniform highp vec4 _HexaColor;
					uniform highp float _AlphaHexa;
					uniform highp float _PositionX;
					uniform highp float _PositionY;
					uniform highp float _Radius;
					uniform highp float _SpotSize;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 result_1;
					  highp vec3 video_2;
					  highp vec2 uv2_3;
					  highp vec4 texel2_4;
					  highp vec4 texel_5;
					  highp vec2 uv_6;
					  uv_6 = xlv_TEXCOORD0;
					  highp float tmpvar_7;
					  tmpvar_7 = ((_Value * _ScreenResolution.x) / 160.0);
					  highp vec2 tmpvar_8;
					  highp vec2 st_9;
					  st_9 = (xlv_TEXCOORD0 * _ScreenResolution.xy);
					  highp vec2 coord_10;
					  highp float tmpvar_11;
					  tmpvar_11 = (0.5 * tmpvar_7);
					  highp float tmpvar_12;
					  tmpvar_12 = (0.8660254 * tmpvar_7);
					  highp float tmpvar_13;
					  tmpvar_13 = (tmpvar_11 / tmpvar_12);
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = (2.0 * tmpvar_12);
					  tmpvar_14.y = (tmpvar_11 + tmpvar_7);
					  highp vec2 tmpvar_15;
					  tmpvar_15 = (st_9 / tmpvar_14);
					  highp vec2 tmpvar_16;
					  tmpvar_16.x = (2.0 * tmpvar_12);
					  tmpvar_16.y = (tmpvar_11 + tmpvar_7);
					  highp vec2 tmpvar_17;
					  tmpvar_17 = (st_9 / tmpvar_16);
					  highp vec2 tmpvar_18;
					  tmpvar_18 = (fract(abs(tmpvar_17)) * tmpvar_16);
					  highp float tmpvar_19;
					  if ((tmpvar_17.x >= 0.0)) {
					    tmpvar_19 = tmpvar_18.x;
					  } else {
					    tmpvar_19 = -(tmpvar_18.x);
					  };
					  highp float tmpvar_20;
					  if ((tmpvar_17.y >= 0.0)) {
					    tmpvar_20 = tmpvar_18.y;
					  } else {
					    tmpvar_20 = -(tmpvar_18.y);
					  };
					  highp float tmpvar_21;
					  tmpvar_21 = (floor(tmpvar_15.y) / 2.0);
					  highp float tmpvar_22;
					  tmpvar_22 = (fract(abs(tmpvar_21)) * 2.0);
					  highp float tmpvar_23;
					  if ((tmpvar_21 >= 0.0)) {
					    tmpvar_23 = tmpvar_22;
					  } else {
					    tmpvar_23 = -(tmpvar_22);
					  };
					  highp vec2 tmpvar_24;
					  tmpvar_24 = floor(tmpvar_15);
					  coord_10 = tmpvar_24;
					  if ((tmpvar_23 > 0.0)) {
					    if ((tmpvar_20 < (tmpvar_11 - (tmpvar_19 * tmpvar_13)))) {
					      coord_10 = (tmpvar_24 - 1.0);
					    } else {
					      if ((tmpvar_20 < (-(tmpvar_11) + (tmpvar_19 * tmpvar_13)))) {
					        coord_10.y = (coord_10.y - 1.0);
					      };
					    };
					  } else {
					    if ((tmpvar_19 > tmpvar_12)) {
					      if ((tmpvar_20 < ((2.0 * tmpvar_11) - (tmpvar_19 * tmpvar_13)))) {
					        coord_10.y = (coord_10.y - 1.0);
					      };
					    } else {
					      if ((tmpvar_20 < (tmpvar_19 * tmpvar_13))) {
					        coord_10.y = (coord_10.y - 1.0);
					      } else {
					        coord_10.x = (coord_10.x - 1.0);
					      };
					    };
					  };
					  highp float tmpvar_25;
					  tmpvar_25 = (coord_10.y / 2.0);
					  highp float tmpvar_26;
					  tmpvar_26 = (fract(abs(tmpvar_25)) * 2.0);
					  highp float tmpvar_27;
					  if ((tmpvar_25 >= 0.0)) {
					    tmpvar_27 = tmpvar_26;
					  } else {
					    tmpvar_27 = -(tmpvar_26);
					  };
					  highp vec2 tmpvar_28;
					  tmpvar_28.x = (((coord_10.x * 2.0) * tmpvar_12) - (tmpvar_27 * tmpvar_12));
					  tmpvar_28.y = (coord_10.y * (tmpvar_11 + tmpvar_7));
					  highp vec2 tmpvar_29;
					  tmpvar_29.x = (tmpvar_12 * 2.0);
					  tmpvar_29.y = tmpvar_7;
					  tmpvar_8 = (tmpvar_28 + tmpvar_29);
					  lowp vec4 tmpvar_30;
					  highp vec2 P_31;
					  P_31 = (tmpvar_8 / _ScreenResolution.xy);
					  tmpvar_30 = texture2D (_MainTex, P_31);
					  texel_5 = tmpvar_30;
					  lowp vec4 tmpvar_32;
					  tmpvar_32 = texture2D (_MainTex, uv_6);
					  texel2_4 = tmpvar_32;
					  highp vec2 uv_33;
					  uv_33 = (uv_6 - vec2(0.5, 0.5));
					  uv_33 = ((uv_33 * 1.2) * (0.8333333 + (
					    (2.0 * uv_33.x)
					   * 
					    ((uv_33.x * uv_33.y) * uv_33.y)
					  )));
					  uv_33 = (uv_33 + vec2(0.5, 0.5));
					  uv_6 = uv_33;
					  highp vec2 tmpvar_34;
					  tmpvar_34.x = (0.5 * sin((_TimeX / 3.0)));
					  tmpvar_34.y = (0.5 * sin((_TimeX / 5.0)));
					  uv2_3 = (uv_33.yy + tmpvar_34);
					  lowp vec3 tmpvar_35;
					  tmpvar_35 = texture2D (_MainTex, uv2_3).xyz;
					  video_2 = tmpvar_35;
					  highp float tmpvar_36;
					  tmpvar_36 = ((1.0 - (
					    (1.804371 * (uv_33.y - 0.5))
					   * 
					    (uv_33.y - 0.5)
					  )) * (1.0 - (
					    (1.804371 * (uv_33.x - 0.5))
					   * 
					    (uv_33.x - 0.5)
					  )));
					  highp float tmpvar_37;
					  tmpvar_37 = ((uv_33.y * 10.0) + _TimeX);
					  highp float tmpvar_38;
					  tmpvar_38 = fract(abs(tmpvar_37));
					  highp float tmpvar_39;
					  if ((tmpvar_37 >= 0.0)) {
					    tmpvar_39 = tmpvar_38;
					  } else {
					    tmpvar_39 = -(tmpvar_38);
					  };
					  video_2 = (video_2 + ((12.0 + tmpvar_39) / 13.0));
					  highp vec2 tmpvar_40;
					  tmpvar_40.x = _PositionX;
					  tmpvar_40.y = _PositionY;
					  highp vec2 x_41;
					  x_41 = (tmpvar_40 - uv_33);
					  highp float tmpvar_42;
					  tmpvar_42 = clamp (((
					    sqrt(dot (x_41, x_41))
					   - _Radius) / (
					    (_Radius + (0.15 * _SpotSize))
					   - _Radius)), 0.0, 1.0);
					  highp float tmpvar_43;
					  tmpvar_43 = (1.0 - (tmpvar_42 * (tmpvar_42 * 
					    (3.0 - (2.0 * tmpvar_42))
					  )));
					  highp vec2 tmpvar_44;
					  tmpvar_44 = abs((tmpvar_8 - (xlv_TEXCOORD0 * _ScreenResolution.xy)));
					  highp float tmpvar_45;
					  tmpvar_45 = (tmpvar_7 * _BorderSize);
					  highp float edge0_46;
					  edge0_46 = (tmpvar_45 - 1.0);
					  highp float tmpvar_47;
					  tmpvar_47 = clamp (((
					    (max (((0.5 * tmpvar_44.x) + (0.8660254 * tmpvar_44.y)), tmpvar_44.x) / 0.8660254)
					   - edge0_46) / (tmpvar_45 - edge0_46)), 0.0, 1.0);
					  result_1.xyz = mix (_BorderColor.xyz, texel_5.xyz, vec3((1.0 - (tmpvar_47 * 
					    (tmpvar_47 * (3.0 - (2.0 * tmpvar_47)))
					  ))));
					  highp float tmpvar_48;
					  tmpvar_48 = (((_TimeX / 4.0) + uv_33.x) + 0.5);
					  highp float tmpvar_49;
					  tmpvar_49 = fract(abs(tmpvar_48));
					  highp float tmpvar_50;
					  if ((tmpvar_48 >= 0.0)) {
					    tmpvar_50 = tmpvar_49;
					  } else {
					    tmpvar_50 = -(tmpvar_49);
					  };
					  highp float tmpvar_51;
					  tmpvar_51 = clamp ((tmpvar_50 / 0.5), 0.0, 1.0);
					  result_1.xyz = (result_1.xyz + vec3((1.0 - (0.5 * 
					    (tmpvar_51 * (tmpvar_51 * (3.0 - (2.0 * tmpvar_51))))
					  ))));
					  result_1.xyz = (result_1.xyz * _HexaColor.xyz);
					  result_1.xyz = (result_1.xyz / (video_2 / 2.0));
					  result_1 = (result_1 / (tmpvar_36 * 2.0));
					  result_1.xyz = mix (result_1.xyz, texel2_4.xyz, vec3(tmpvar_43));
					  result_1.xyz = mix (result_1.xyz, texel2_4.xyz, vec3((1.0 - _AlphaHexa)));
					  result_1.w = 1.0;
					  gl_FragData[0] = result_1;
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
					uniform highp vec4 _ScreenResolution;
					uniform highp float _Value;
					uniform highp float _BorderSize;
					uniform highp vec4 _BorderColor;
					uniform highp vec4 _HexaColor;
					uniform highp float _AlphaHexa;
					uniform highp float _PositionX;
					uniform highp float _PositionY;
					uniform highp float _Radius;
					uniform highp float _SpotSize;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 result_1;
					  highp vec3 video_2;
					  highp vec2 uv2_3;
					  highp vec4 texel2_4;
					  highp vec4 texel_5;
					  highp vec2 uv_6;
					  uv_6 = xlv_TEXCOORD0;
					  highp float tmpvar_7;
					  tmpvar_7 = ((_Value * _ScreenResolution.x) / 160.0);
					  highp vec2 tmpvar_8;
					  highp vec2 st_9;
					  st_9 = (xlv_TEXCOORD0 * _ScreenResolution.xy);
					  highp vec2 coord_10;
					  highp float tmpvar_11;
					  tmpvar_11 = (0.5 * tmpvar_7);
					  highp float tmpvar_12;
					  tmpvar_12 = (0.8660254 * tmpvar_7);
					  highp float tmpvar_13;
					  tmpvar_13 = (tmpvar_11 / tmpvar_12);
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = (2.0 * tmpvar_12);
					  tmpvar_14.y = (tmpvar_11 + tmpvar_7);
					  highp vec2 tmpvar_15;
					  tmpvar_15 = (st_9 / tmpvar_14);
					  highp vec2 tmpvar_16;
					  tmpvar_16.x = (2.0 * tmpvar_12);
					  tmpvar_16.y = (tmpvar_11 + tmpvar_7);
					  highp vec2 tmpvar_17;
					  tmpvar_17 = (st_9 / tmpvar_16);
					  highp vec2 tmpvar_18;
					  tmpvar_18 = (fract(abs(tmpvar_17)) * tmpvar_16);
					  highp float tmpvar_19;
					  if ((tmpvar_17.x >= 0.0)) {
					    tmpvar_19 = tmpvar_18.x;
					  } else {
					    tmpvar_19 = -(tmpvar_18.x);
					  };
					  highp float tmpvar_20;
					  if ((tmpvar_17.y >= 0.0)) {
					    tmpvar_20 = tmpvar_18.y;
					  } else {
					    tmpvar_20 = -(tmpvar_18.y);
					  };
					  highp float tmpvar_21;
					  tmpvar_21 = (floor(tmpvar_15.y) / 2.0);
					  highp float tmpvar_22;
					  tmpvar_22 = (fract(abs(tmpvar_21)) * 2.0);
					  highp float tmpvar_23;
					  if ((tmpvar_21 >= 0.0)) {
					    tmpvar_23 = tmpvar_22;
					  } else {
					    tmpvar_23 = -(tmpvar_22);
					  };
					  highp vec2 tmpvar_24;
					  tmpvar_24 = floor(tmpvar_15);
					  coord_10 = tmpvar_24;
					  if ((tmpvar_23 > 0.0)) {
					    if ((tmpvar_20 < (tmpvar_11 - (tmpvar_19 * tmpvar_13)))) {
					      coord_10 = (tmpvar_24 - 1.0);
					    } else {
					      if ((tmpvar_20 < (-(tmpvar_11) + (tmpvar_19 * tmpvar_13)))) {
					        coord_10.y = (coord_10.y - 1.0);
					      };
					    };
					  } else {
					    if ((tmpvar_19 > tmpvar_12)) {
					      if ((tmpvar_20 < ((2.0 * tmpvar_11) - (tmpvar_19 * tmpvar_13)))) {
					        coord_10.y = (coord_10.y - 1.0);
					      };
					    } else {
					      if ((tmpvar_20 < (tmpvar_19 * tmpvar_13))) {
					        coord_10.y = (coord_10.y - 1.0);
					      } else {
					        coord_10.x = (coord_10.x - 1.0);
					      };
					    };
					  };
					  highp float tmpvar_25;
					  tmpvar_25 = (coord_10.y / 2.0);
					  highp float tmpvar_26;
					  tmpvar_26 = (fract(abs(tmpvar_25)) * 2.0);
					  highp float tmpvar_27;
					  if ((tmpvar_25 >= 0.0)) {
					    tmpvar_27 = tmpvar_26;
					  } else {
					    tmpvar_27 = -(tmpvar_26);
					  };
					  highp vec2 tmpvar_28;
					  tmpvar_28.x = (((coord_10.x * 2.0) * tmpvar_12) - (tmpvar_27 * tmpvar_12));
					  tmpvar_28.y = (coord_10.y * (tmpvar_11 + tmpvar_7));
					  highp vec2 tmpvar_29;
					  tmpvar_29.x = (tmpvar_12 * 2.0);
					  tmpvar_29.y = tmpvar_7;
					  tmpvar_8 = (tmpvar_28 + tmpvar_29);
					  lowp vec4 tmpvar_30;
					  highp vec2 P_31;
					  P_31 = (tmpvar_8 / _ScreenResolution.xy);
					  tmpvar_30 = texture2D (_MainTex, P_31);
					  texel_5 = tmpvar_30;
					  lowp vec4 tmpvar_32;
					  tmpvar_32 = texture2D (_MainTex, uv_6);
					  texel2_4 = tmpvar_32;
					  highp vec2 uv_33;
					  uv_33 = (uv_6 - vec2(0.5, 0.5));
					  uv_33 = ((uv_33 * 1.2) * (0.8333333 + (
					    (2.0 * uv_33.x)
					   * 
					    ((uv_33.x * uv_33.y) * uv_33.y)
					  )));
					  uv_33 = (uv_33 + vec2(0.5, 0.5));
					  uv_6 = uv_33;
					  highp vec2 tmpvar_34;
					  tmpvar_34.x = (0.5 * sin((_TimeX / 3.0)));
					  tmpvar_34.y = (0.5 * sin((_TimeX / 5.0)));
					  uv2_3 = (uv_33.yy + tmpvar_34);
					  lowp vec3 tmpvar_35;
					  tmpvar_35 = texture2D (_MainTex, uv2_3).xyz;
					  video_2 = tmpvar_35;
					  highp float tmpvar_36;
					  tmpvar_36 = ((1.0 - (
					    (1.804371 * (uv_33.y - 0.5))
					   * 
					    (uv_33.y - 0.5)
					  )) * (1.0 - (
					    (1.804371 * (uv_33.x - 0.5))
					   * 
					    (uv_33.x - 0.5)
					  )));
					  highp float tmpvar_37;
					  tmpvar_37 = ((uv_33.y * 10.0) + _TimeX);
					  highp float tmpvar_38;
					  tmpvar_38 = fract(abs(tmpvar_37));
					  highp float tmpvar_39;
					  if ((tmpvar_37 >= 0.0)) {
					    tmpvar_39 = tmpvar_38;
					  } else {
					    tmpvar_39 = -(tmpvar_38);
					  };
					  video_2 = (video_2 + ((12.0 + tmpvar_39) / 13.0));
					  highp vec2 tmpvar_40;
					  tmpvar_40.x = _PositionX;
					  tmpvar_40.y = _PositionY;
					  highp vec2 x_41;
					  x_41 = (tmpvar_40 - uv_33);
					  highp float tmpvar_42;
					  tmpvar_42 = clamp (((
					    sqrt(dot (x_41, x_41))
					   - _Radius) / (
					    (_Radius + (0.15 * _SpotSize))
					   - _Radius)), 0.0, 1.0);
					  highp float tmpvar_43;
					  tmpvar_43 = (1.0 - (tmpvar_42 * (tmpvar_42 * 
					    (3.0 - (2.0 * tmpvar_42))
					  )));
					  highp vec2 tmpvar_44;
					  tmpvar_44 = abs((tmpvar_8 - (xlv_TEXCOORD0 * _ScreenResolution.xy)));
					  highp float tmpvar_45;
					  tmpvar_45 = (tmpvar_7 * _BorderSize);
					  highp float edge0_46;
					  edge0_46 = (tmpvar_45 - 1.0);
					  highp float tmpvar_47;
					  tmpvar_47 = clamp (((
					    (max (((0.5 * tmpvar_44.x) + (0.8660254 * tmpvar_44.y)), tmpvar_44.x) / 0.8660254)
					   - edge0_46) / (tmpvar_45 - edge0_46)), 0.0, 1.0);
					  result_1.xyz = mix (_BorderColor.xyz, texel_5.xyz, vec3((1.0 - (tmpvar_47 * 
					    (tmpvar_47 * (3.0 - (2.0 * tmpvar_47)))
					  ))));
					  highp float tmpvar_48;
					  tmpvar_48 = (((_TimeX / 4.0) + uv_33.x) + 0.5);
					  highp float tmpvar_49;
					  tmpvar_49 = fract(abs(tmpvar_48));
					  highp float tmpvar_50;
					  if ((tmpvar_48 >= 0.0)) {
					    tmpvar_50 = tmpvar_49;
					  } else {
					    tmpvar_50 = -(tmpvar_49);
					  };
					  highp float tmpvar_51;
					  tmpvar_51 = clamp ((tmpvar_50 / 0.5), 0.0, 1.0);
					  result_1.xyz = (result_1.xyz + vec3((1.0 - (0.5 * 
					    (tmpvar_51 * (tmpvar_51 * (3.0 - (2.0 * tmpvar_51))))
					  ))));
					  result_1.xyz = (result_1.xyz * _HexaColor.xyz);
					  result_1.xyz = (result_1.xyz / (video_2 / 2.0));
					  result_1 = (result_1 / (tmpvar_36 * 2.0));
					  result_1.xyz = mix (result_1.xyz, texel2_4.xyz, vec3(tmpvar_43));
					  result_1.xyz = mix (result_1.xyz, texel2_4.xyz, vec3((1.0 - _AlphaHexa)));
					  result_1.w = 1.0;
					  gl_FragData[0] = result_1;
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
					uniform highp vec4 _ScreenResolution;
					uniform highp float _Value;
					uniform highp float _BorderSize;
					uniform highp vec4 _BorderColor;
					uniform highp vec4 _HexaColor;
					uniform highp float _AlphaHexa;
					uniform highp float _PositionX;
					uniform highp float _PositionY;
					uniform highp float _Radius;
					uniform highp float _SpotSize;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 result_1;
					  highp vec3 video_2;
					  highp vec2 uv2_3;
					  highp vec4 texel2_4;
					  highp vec4 texel_5;
					  highp vec2 uv_6;
					  uv_6 = xlv_TEXCOORD0;
					  highp float tmpvar_7;
					  tmpvar_7 = ((_Value * _ScreenResolution.x) / 160.0);
					  highp vec2 tmpvar_8;
					  highp vec2 st_9;
					  st_9 = (xlv_TEXCOORD0 * _ScreenResolution.xy);
					  highp vec2 coord_10;
					  highp float tmpvar_11;
					  tmpvar_11 = (0.5 * tmpvar_7);
					  highp float tmpvar_12;
					  tmpvar_12 = (0.8660254 * tmpvar_7);
					  highp float tmpvar_13;
					  tmpvar_13 = (tmpvar_11 / tmpvar_12);
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = (2.0 * tmpvar_12);
					  tmpvar_14.y = (tmpvar_11 + tmpvar_7);
					  highp vec2 tmpvar_15;
					  tmpvar_15 = (st_9 / tmpvar_14);
					  highp vec2 tmpvar_16;
					  tmpvar_16.x = (2.0 * tmpvar_12);
					  tmpvar_16.y = (tmpvar_11 + tmpvar_7);
					  highp vec2 tmpvar_17;
					  tmpvar_17 = (st_9 / tmpvar_16);
					  highp vec2 tmpvar_18;
					  tmpvar_18 = (fract(abs(tmpvar_17)) * tmpvar_16);
					  highp float tmpvar_19;
					  if ((tmpvar_17.x >= 0.0)) {
					    tmpvar_19 = tmpvar_18.x;
					  } else {
					    tmpvar_19 = -(tmpvar_18.x);
					  };
					  highp float tmpvar_20;
					  if ((tmpvar_17.y >= 0.0)) {
					    tmpvar_20 = tmpvar_18.y;
					  } else {
					    tmpvar_20 = -(tmpvar_18.y);
					  };
					  highp float tmpvar_21;
					  tmpvar_21 = (floor(tmpvar_15.y) / 2.0);
					  highp float tmpvar_22;
					  tmpvar_22 = (fract(abs(tmpvar_21)) * 2.0);
					  highp float tmpvar_23;
					  if ((tmpvar_21 >= 0.0)) {
					    tmpvar_23 = tmpvar_22;
					  } else {
					    tmpvar_23 = -(tmpvar_22);
					  };
					  highp vec2 tmpvar_24;
					  tmpvar_24 = floor(tmpvar_15);
					  coord_10 = tmpvar_24;
					  if ((tmpvar_23 > 0.0)) {
					    if ((tmpvar_20 < (tmpvar_11 - (tmpvar_19 * tmpvar_13)))) {
					      coord_10 = (tmpvar_24 - 1.0);
					    } else {
					      if ((tmpvar_20 < (-(tmpvar_11) + (tmpvar_19 * tmpvar_13)))) {
					        coord_10.y = (coord_10.y - 1.0);
					      };
					    };
					  } else {
					    if ((tmpvar_19 > tmpvar_12)) {
					      if ((tmpvar_20 < ((2.0 * tmpvar_11) - (tmpvar_19 * tmpvar_13)))) {
					        coord_10.y = (coord_10.y - 1.0);
					      };
					    } else {
					      if ((tmpvar_20 < (tmpvar_19 * tmpvar_13))) {
					        coord_10.y = (coord_10.y - 1.0);
					      } else {
					        coord_10.x = (coord_10.x - 1.0);
					      };
					    };
					  };
					  highp float tmpvar_25;
					  tmpvar_25 = (coord_10.y / 2.0);
					  highp float tmpvar_26;
					  tmpvar_26 = (fract(abs(tmpvar_25)) * 2.0);
					  highp float tmpvar_27;
					  if ((tmpvar_25 >= 0.0)) {
					    tmpvar_27 = tmpvar_26;
					  } else {
					    tmpvar_27 = -(tmpvar_26);
					  };
					  highp vec2 tmpvar_28;
					  tmpvar_28.x = (((coord_10.x * 2.0) * tmpvar_12) - (tmpvar_27 * tmpvar_12));
					  tmpvar_28.y = (coord_10.y * (tmpvar_11 + tmpvar_7));
					  highp vec2 tmpvar_29;
					  tmpvar_29.x = (tmpvar_12 * 2.0);
					  tmpvar_29.y = tmpvar_7;
					  tmpvar_8 = (tmpvar_28 + tmpvar_29);
					  lowp vec4 tmpvar_30;
					  highp vec2 P_31;
					  P_31 = (tmpvar_8 / _ScreenResolution.xy);
					  tmpvar_30 = texture2D (_MainTex, P_31);
					  texel_5 = tmpvar_30;
					  lowp vec4 tmpvar_32;
					  tmpvar_32 = texture2D (_MainTex, uv_6);
					  texel2_4 = tmpvar_32;
					  highp vec2 uv_33;
					  uv_33 = (uv_6 - vec2(0.5, 0.5));
					  uv_33 = ((uv_33 * 1.2) * (0.8333333 + (
					    (2.0 * uv_33.x)
					   * 
					    ((uv_33.x * uv_33.y) * uv_33.y)
					  )));
					  uv_33 = (uv_33 + vec2(0.5, 0.5));
					  uv_6 = uv_33;
					  highp vec2 tmpvar_34;
					  tmpvar_34.x = (0.5 * sin((_TimeX / 3.0)));
					  tmpvar_34.y = (0.5 * sin((_TimeX / 5.0)));
					  uv2_3 = (uv_33.yy + tmpvar_34);
					  lowp vec3 tmpvar_35;
					  tmpvar_35 = texture2D (_MainTex, uv2_3).xyz;
					  video_2 = tmpvar_35;
					  highp float tmpvar_36;
					  tmpvar_36 = ((1.0 - (
					    (1.804371 * (uv_33.y - 0.5))
					   * 
					    (uv_33.y - 0.5)
					  )) * (1.0 - (
					    (1.804371 * (uv_33.x - 0.5))
					   * 
					    (uv_33.x - 0.5)
					  )));
					  highp float tmpvar_37;
					  tmpvar_37 = ((uv_33.y * 10.0) + _TimeX);
					  highp float tmpvar_38;
					  tmpvar_38 = fract(abs(tmpvar_37));
					  highp float tmpvar_39;
					  if ((tmpvar_37 >= 0.0)) {
					    tmpvar_39 = tmpvar_38;
					  } else {
					    tmpvar_39 = -(tmpvar_38);
					  };
					  video_2 = (video_2 + ((12.0 + tmpvar_39) / 13.0));
					  highp vec2 tmpvar_40;
					  tmpvar_40.x = _PositionX;
					  tmpvar_40.y = _PositionY;
					  highp vec2 x_41;
					  x_41 = (tmpvar_40 - uv_33);
					  highp float tmpvar_42;
					  tmpvar_42 = clamp (((
					    sqrt(dot (x_41, x_41))
					   - _Radius) / (
					    (_Radius + (0.15 * _SpotSize))
					   - _Radius)), 0.0, 1.0);
					  highp float tmpvar_43;
					  tmpvar_43 = (1.0 - (tmpvar_42 * (tmpvar_42 * 
					    (3.0 - (2.0 * tmpvar_42))
					  )));
					  highp vec2 tmpvar_44;
					  tmpvar_44 = abs((tmpvar_8 - (xlv_TEXCOORD0 * _ScreenResolution.xy)));
					  highp float tmpvar_45;
					  tmpvar_45 = (tmpvar_7 * _BorderSize);
					  highp float edge0_46;
					  edge0_46 = (tmpvar_45 - 1.0);
					  highp float tmpvar_47;
					  tmpvar_47 = clamp (((
					    (max (((0.5 * tmpvar_44.x) + (0.8660254 * tmpvar_44.y)), tmpvar_44.x) / 0.8660254)
					   - edge0_46) / (tmpvar_45 - edge0_46)), 0.0, 1.0);
					  result_1.xyz = mix (_BorderColor.xyz, texel_5.xyz, vec3((1.0 - (tmpvar_47 * 
					    (tmpvar_47 * (3.0 - (2.0 * tmpvar_47)))
					  ))));
					  highp float tmpvar_48;
					  tmpvar_48 = (((_TimeX / 4.0) + uv_33.x) + 0.5);
					  highp float tmpvar_49;
					  tmpvar_49 = fract(abs(tmpvar_48));
					  highp float tmpvar_50;
					  if ((tmpvar_48 >= 0.0)) {
					    tmpvar_50 = tmpvar_49;
					  } else {
					    tmpvar_50 = -(tmpvar_49);
					  };
					  highp float tmpvar_51;
					  tmpvar_51 = clamp ((tmpvar_50 / 0.5), 0.0, 1.0);
					  result_1.xyz = (result_1.xyz + vec3((1.0 - (0.5 * 
					    (tmpvar_51 * (tmpvar_51 * (3.0 - (2.0 * tmpvar_51))))
					  ))));
					  result_1.xyz = (result_1.xyz * _HexaColor.xyz);
					  result_1.xyz = (result_1.xyz / (video_2 / 2.0));
					  result_1 = (result_1 / (tmpvar_36 * 2.0));
					  result_1.xyz = mix (result_1.xyz, texel2_4.xyz, vec3(tmpvar_43));
					  result_1.xyz = mix (result_1.xyz, texel2_4.xyz, vec3((1.0 - _AlphaHexa)));
					  result_1.w = 1.0;
					  gl_FragData[0] = result_1;
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
					uniform 	vec4 _ScreenResolution;
					uniform 	float _Value;
					uniform 	float _BorderSize;
					uniform 	vec4 _BorderColor;
					uniform 	vec4 _HexaColor;
					uniform 	float _AlphaHexa;
					uniform 	float _PositionX;
					uniform 	float _PositionY;
					uniform 	float _Radius;
					uniform 	float _SpotSize;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					mediump vec2 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					bvec4 u_xlatb1;
					vec3 u_xlat2;
					lowp vec3 u_xlat10_2;
					bvec2 u_xlatb2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec3 u_xlat5;
					float u_xlat6;
					vec3 u_xlat7;
					lowp vec3 u_xlat10_7;
					bool u_xlatb7;
					vec2 u_xlat12;
					mediump vec2 u_xlat16_13;
					float u_xlat18;
					mediump float u_xlat16_18;
					bool u_xlatb18;
					float u_xlat19;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _ScreenResolution.xy;
					    u_xlat12.x = _ScreenResolution.x * _Value;
					    u_xlat1.xyz = u_xlat12.xxx * vec3(0.0108253174, 0.00937500037, 0.0108253174);
					    u_xlat0.xyw = u_xlat0.yxy / u_xlat1.yxy;
					    u_xlatb1.xw = greaterThanEqual(u_xlat0.yyyw, (-u_xlat0.yyyw)).xw;
					    u_xlat2.xy = fract(abs(u_xlat0.yw));
					    u_xlat3.xyz = floor(u_xlat0.xyw);
					    u_xlat0.x = (u_xlatb1.x) ? u_xlat2.x : (-u_xlat2.x);
					    u_xlat0.y = (u_xlatb1.w) ? u_xlat2.y : (-u_xlat2.y);
					    u_xlat0.xy = vec2(u_xlat1.z * u_xlat0.x, u_xlat1.y * u_xlat0.y);
					    u_xlat1.xyz = u_xlat12.xxx * vec3(0.00625000009, 0.00312500005, 0.00541265868);
					    u_xlat18 = u_xlat1.y / u_xlat1.z;
					    u_xlat19 = u_xlat18 * u_xlat0.x;
					    u_xlat18 = u_xlat0.x * u_xlat18 + (-u_xlat1.y);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.y<u_xlat18);
					#else
					    u_xlatb18 = u_xlat0.y<u_xlat18;
					#endif
					    u_xlat2.xy = u_xlat12.xx * vec2(0.00312500005, 0.00625000009) + (-vec2(u_xlat19));
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb7 = !!(u_xlat0.y<u_xlat19);
					#else
					    u_xlatb7 = u_xlat0.y<u_xlat19;
					#endif
					    u_xlatb2.xy = lessThan(u_xlat0.yyyy, u_xlat2.xyxx).xy;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat1.z<u_xlat0.x);
					#else
					    u_xlatb0 = u_xlat1.z<u_xlat0.x;
					#endif
					    u_xlat4 = vec4(u_xlat3.y + float(-1.0), u_xlat3.z + float(-1.0), u_xlat3.y + float(-1.0), u_xlat3.z + float(0.0));
					    u_xlat5.z = (u_xlatb2.y) ? u_xlat4.y : u_xlat3.z;
					    u_xlat5.xy = vec2(u_xlat3.y + float(0.0), u_xlat3.z + float(-1.0));
					    u_xlat7.xz = (bool(u_xlatb7)) ? u_xlat5.xy : u_xlat4.zw;
					    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat5.xz : u_xlat7.xz;
					    u_xlat3.w = (u_xlatb18) ? u_xlat4.y : u_xlat3.z;
					    u_xlat7.xz = (u_xlatb2.x) ? u_xlat4.xy : u_xlat3.yw;
					    u_xlat18 = u_xlat3.x * 0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2.x = !!(u_xlat18>=(-u_xlat18));
					#else
					    u_xlatb2.x = u_xlat18>=(-u_xlat18);
					#endif
					    u_xlat18 = fract(abs(u_xlat18));
					    u_xlat18 = (u_xlatb2.x) ? u_xlat18 : (-u_xlat18);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(0.0<u_xlat18);
					#else
					    u_xlatb18 = 0.0<u_xlat18;
					#endif
					    u_xlat0.xy = (bool(u_xlatb18)) ? u_xlat7.xz : u_xlat0.xy;
					    u_xlat18 = u_xlat0.y * 0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb7 = !!(u_xlat18>=(-u_xlat18));
					#else
					    u_xlatb7 = u_xlat18>=(-u_xlat18);
					#endif
					    u_xlat18 = fract(abs(u_xlat18));
					    u_xlat18 = (u_xlatb7) ? u_xlat18 : (-u_xlat18);
					    u_xlat18 = dot(vec2(u_xlat18), u_xlat1.zz);
					    u_xlat0.x = dot(u_xlat0.xx, u_xlat1.zz);
					    u_xlat2.x = (-u_xlat18) + u_xlat0.x;
					    u_xlat0.x = u_xlat12.x * 0.00937500037;
					    u_xlat2.y = u_xlat0.x * u_xlat0.y;
					    u_xlat0.xy = u_xlat12.xx * vec2(0.0108253174, 0.00625000009) + u_xlat2.xy;
					    u_xlat12.xy = (-vs_TEXCOORD0.xy) * _ScreenResolution.xy + u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy / _ScreenResolution.xy;
					    u_xlat10_7.xyz = texture(_MainTex, u_xlat0.xy).xyz;
					    u_xlat7.xyz = u_xlat10_7.xyz + (-_BorderColor.xyz);
					    u_xlat0.x = dot(abs(u_xlat12.xy), vec2(0.5, 0.866025388));
					    u_xlat0.x = max(abs(u_xlat12.x), u_xlat0.x);
					    u_xlat6 = u_xlat1.x * _BorderSize + -1.0;
					    u_xlat12.x = u_xlat1.x * _BorderSize + (-u_xlat6);
					    u_xlat0.x = u_xlat0.x * 1.15470052 + (-u_xlat6);
					    u_xlat6 = float(1.0) / u_xlat12.x;
					    u_xlat0.x = u_xlat6 * u_xlat0.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat6 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat6) * u_xlat0.x + 1.0;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz + _BorderColor.xyz;
					    u_xlat16_1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_13.xy = u_xlat16_1.xy * u_xlat16_1.xy;
					    u_xlat16_1.xy = u_xlat16_1.yx * vec2(1.20000005, 1.20000005);
					    u_xlat16_18 = dot(u_xlat16_13.yy, u_xlat16_13.xx);
					    u_xlat16_18 = u_xlat16_18 + 0.833333313;
					    u_xlat16_13.xy = u_xlat16_1.yx * vec2(u_xlat16_18) + vec2(0.5, 0.5);
					    u_xlat16_1.xy = vec2(u_xlat16_18) * u_xlat16_1.xy;
					    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_1.xy;
					    u_xlat16_1.xy = (-u_xlat16_1.xy) * vec2(1.80437076, 1.80437076) + vec2(1.0, 1.0);
					    u_xlat16_18 = dot(u_xlat16_1.xx, u_xlat16_1.yy);
					    u_xlat1.x = _TimeX * 0.25 + u_xlat16_13.x;
					    u_xlat1.x = u_xlat1.x + 0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb7 = !!(u_xlat1.x>=(-u_xlat1.x));
					#else
					    u_xlatb7 = u_xlat1.x>=(-u_xlat1.x);
					#endif
					    u_xlat1.x = fract(abs(u_xlat1.x));
					    u_xlat1.x = (u_xlatb7) ? u_xlat1.x : (-u_xlat1.x);
					    u_xlat1.x = u_xlat1.x + u_xlat1.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
					#else
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					#endif
					    u_xlat7.x = u_xlat1.x * -2.0 + 3.0;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * u_xlat7.x;
					    u_xlat1.x = (-u_xlat1.x) * 0.5 + 1.0;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xxx;
					    u_xlat0.xyz = u_xlat0.xyz * _HexaColor.xyz;
					    u_xlat1.x = u_xlat16_13.y * 10.0 + _TimeX;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb7 = !!(u_xlat1.x>=(-u_xlat1.x));
					#else
					    u_xlatb7 = u_xlat1.x>=(-u_xlat1.x);
					#endif
					    u_xlat1.x = fract(abs(u_xlat1.x));
					    u_xlat1.x = (u_xlatb7) ? u_xlat1.x : (-u_xlat1.x);
					    u_xlat1.x = u_xlat1.x + 12.0;
					    u_xlat2.xy = vec2(_TimeX) * vec2(0.333333343, 0.200000003);
					    u_xlat2.xy = sin(u_xlat2.xy);
					    u_xlat2.xy = u_xlat2.xy * vec2(0.5, 0.5) + u_xlat16_13.yy;
					    u_xlat7.xy = vec2((-u_xlat16_13.x) + float(_PositionX), (-u_xlat16_13.y) + float(_PositionY));
					    u_xlat7.x = dot(u_xlat7.xy, u_xlat7.xy);
					    u_xlat7.x = sqrt(u_xlat7.x);
					    u_xlat7.x = u_xlat7.x + (-_Radius);
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat2.xy).xyz;
					    u_xlat1.xzw = u_xlat1.xxx * vec3(0.0769230798, 0.0769230798, 0.0769230798) + u_xlat10_2.xyz;
					    u_xlat1.xzw = u_xlat1.xzw * vec3(0.5, 0.5, 0.5);
					    u_xlat0.xyz = u_xlat0.xyz / u_xlat1.xzw;
					    u_xlat0.xyz = u_xlat0.xyz / vec3(u_xlat16_18);
					    u_xlat10_1.xzw = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat2.xyz = (-u_xlat0.xyz) + u_xlat10_1.xzw;
					    u_xlat18 = _SpotSize * 0.150000006;
					    u_xlat18 = float(1.0) / u_xlat18;
					    u_xlat18 = u_xlat18 * u_xlat7.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
					#else
					    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
					#endif
					    u_xlat7.x = u_xlat18 * -2.0 + 3.0;
					    u_xlat18 = u_xlat18 * u_xlat18;
					    u_xlat18 = (-u_xlat7.x) * u_xlat18 + 1.0;
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat10_1.xzw;
					    u_xlat18 = (-_AlphaHexa) + 1.0;
					    SV_Target0.xyz = vec3(u_xlat18) * u_xlat1.xyz + u_xlat0.xyz;
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
					uniform 	vec4 _ScreenResolution;
					uniform 	float _Value;
					uniform 	float _BorderSize;
					uniform 	vec4 _BorderColor;
					uniform 	vec4 _HexaColor;
					uniform 	float _AlphaHexa;
					uniform 	float _PositionX;
					uniform 	float _PositionY;
					uniform 	float _Radius;
					uniform 	float _SpotSize;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					mediump vec2 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					bvec4 u_xlatb1;
					vec3 u_xlat2;
					lowp vec3 u_xlat10_2;
					bvec2 u_xlatb2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec3 u_xlat5;
					float u_xlat6;
					vec3 u_xlat7;
					lowp vec3 u_xlat10_7;
					bool u_xlatb7;
					vec2 u_xlat12;
					mediump vec2 u_xlat16_13;
					float u_xlat18;
					mediump float u_xlat16_18;
					bool u_xlatb18;
					float u_xlat19;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _ScreenResolution.xy;
					    u_xlat12.x = _ScreenResolution.x * _Value;
					    u_xlat1.xyz = u_xlat12.xxx * vec3(0.0108253174, 0.00937500037, 0.0108253174);
					    u_xlat0.xyw = u_xlat0.yxy / u_xlat1.yxy;
					    u_xlatb1.xw = greaterThanEqual(u_xlat0.yyyw, (-u_xlat0.yyyw)).xw;
					    u_xlat2.xy = fract(abs(u_xlat0.yw));
					    u_xlat3.xyz = floor(u_xlat0.xyw);
					    u_xlat0.x = (u_xlatb1.x) ? u_xlat2.x : (-u_xlat2.x);
					    u_xlat0.y = (u_xlatb1.w) ? u_xlat2.y : (-u_xlat2.y);
					    u_xlat0.xy = vec2(u_xlat1.z * u_xlat0.x, u_xlat1.y * u_xlat0.y);
					    u_xlat1.xyz = u_xlat12.xxx * vec3(0.00625000009, 0.00312500005, 0.00541265868);
					    u_xlat18 = u_xlat1.y / u_xlat1.z;
					    u_xlat19 = u_xlat18 * u_xlat0.x;
					    u_xlat18 = u_xlat0.x * u_xlat18 + (-u_xlat1.y);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.y<u_xlat18);
					#else
					    u_xlatb18 = u_xlat0.y<u_xlat18;
					#endif
					    u_xlat2.xy = u_xlat12.xx * vec2(0.00312500005, 0.00625000009) + (-vec2(u_xlat19));
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb7 = !!(u_xlat0.y<u_xlat19);
					#else
					    u_xlatb7 = u_xlat0.y<u_xlat19;
					#endif
					    u_xlatb2.xy = lessThan(u_xlat0.yyyy, u_xlat2.xyxx).xy;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat1.z<u_xlat0.x);
					#else
					    u_xlatb0 = u_xlat1.z<u_xlat0.x;
					#endif
					    u_xlat4 = vec4(u_xlat3.y + float(-1.0), u_xlat3.z + float(-1.0), u_xlat3.y + float(-1.0), u_xlat3.z + float(0.0));
					    u_xlat5.z = (u_xlatb2.y) ? u_xlat4.y : u_xlat3.z;
					    u_xlat5.xy = vec2(u_xlat3.y + float(0.0), u_xlat3.z + float(-1.0));
					    u_xlat7.xz = (bool(u_xlatb7)) ? u_xlat5.xy : u_xlat4.zw;
					    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat5.xz : u_xlat7.xz;
					    u_xlat3.w = (u_xlatb18) ? u_xlat4.y : u_xlat3.z;
					    u_xlat7.xz = (u_xlatb2.x) ? u_xlat4.xy : u_xlat3.yw;
					    u_xlat18 = u_xlat3.x * 0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2.x = !!(u_xlat18>=(-u_xlat18));
					#else
					    u_xlatb2.x = u_xlat18>=(-u_xlat18);
					#endif
					    u_xlat18 = fract(abs(u_xlat18));
					    u_xlat18 = (u_xlatb2.x) ? u_xlat18 : (-u_xlat18);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(0.0<u_xlat18);
					#else
					    u_xlatb18 = 0.0<u_xlat18;
					#endif
					    u_xlat0.xy = (bool(u_xlatb18)) ? u_xlat7.xz : u_xlat0.xy;
					    u_xlat18 = u_xlat0.y * 0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb7 = !!(u_xlat18>=(-u_xlat18));
					#else
					    u_xlatb7 = u_xlat18>=(-u_xlat18);
					#endif
					    u_xlat18 = fract(abs(u_xlat18));
					    u_xlat18 = (u_xlatb7) ? u_xlat18 : (-u_xlat18);
					    u_xlat18 = dot(vec2(u_xlat18), u_xlat1.zz);
					    u_xlat0.x = dot(u_xlat0.xx, u_xlat1.zz);
					    u_xlat2.x = (-u_xlat18) + u_xlat0.x;
					    u_xlat0.x = u_xlat12.x * 0.00937500037;
					    u_xlat2.y = u_xlat0.x * u_xlat0.y;
					    u_xlat0.xy = u_xlat12.xx * vec2(0.0108253174, 0.00625000009) + u_xlat2.xy;
					    u_xlat12.xy = (-vs_TEXCOORD0.xy) * _ScreenResolution.xy + u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy / _ScreenResolution.xy;
					    u_xlat10_7.xyz = texture(_MainTex, u_xlat0.xy).xyz;
					    u_xlat7.xyz = u_xlat10_7.xyz + (-_BorderColor.xyz);
					    u_xlat0.x = dot(abs(u_xlat12.xy), vec2(0.5, 0.866025388));
					    u_xlat0.x = max(abs(u_xlat12.x), u_xlat0.x);
					    u_xlat6 = u_xlat1.x * _BorderSize + -1.0;
					    u_xlat12.x = u_xlat1.x * _BorderSize + (-u_xlat6);
					    u_xlat0.x = u_xlat0.x * 1.15470052 + (-u_xlat6);
					    u_xlat6 = float(1.0) / u_xlat12.x;
					    u_xlat0.x = u_xlat6 * u_xlat0.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat6 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat6) * u_xlat0.x + 1.0;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz + _BorderColor.xyz;
					    u_xlat16_1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_13.xy = u_xlat16_1.xy * u_xlat16_1.xy;
					    u_xlat16_1.xy = u_xlat16_1.yx * vec2(1.20000005, 1.20000005);
					    u_xlat16_18 = dot(u_xlat16_13.yy, u_xlat16_13.xx);
					    u_xlat16_18 = u_xlat16_18 + 0.833333313;
					    u_xlat16_13.xy = u_xlat16_1.yx * vec2(u_xlat16_18) + vec2(0.5, 0.5);
					    u_xlat16_1.xy = vec2(u_xlat16_18) * u_xlat16_1.xy;
					    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_1.xy;
					    u_xlat16_1.xy = (-u_xlat16_1.xy) * vec2(1.80437076, 1.80437076) + vec2(1.0, 1.0);
					    u_xlat16_18 = dot(u_xlat16_1.xx, u_xlat16_1.yy);
					    u_xlat1.x = _TimeX * 0.25 + u_xlat16_13.x;
					    u_xlat1.x = u_xlat1.x + 0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb7 = !!(u_xlat1.x>=(-u_xlat1.x));
					#else
					    u_xlatb7 = u_xlat1.x>=(-u_xlat1.x);
					#endif
					    u_xlat1.x = fract(abs(u_xlat1.x));
					    u_xlat1.x = (u_xlatb7) ? u_xlat1.x : (-u_xlat1.x);
					    u_xlat1.x = u_xlat1.x + u_xlat1.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
					#else
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					#endif
					    u_xlat7.x = u_xlat1.x * -2.0 + 3.0;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * u_xlat7.x;
					    u_xlat1.x = (-u_xlat1.x) * 0.5 + 1.0;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xxx;
					    u_xlat0.xyz = u_xlat0.xyz * _HexaColor.xyz;
					    u_xlat1.x = u_xlat16_13.y * 10.0 + _TimeX;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb7 = !!(u_xlat1.x>=(-u_xlat1.x));
					#else
					    u_xlatb7 = u_xlat1.x>=(-u_xlat1.x);
					#endif
					    u_xlat1.x = fract(abs(u_xlat1.x));
					    u_xlat1.x = (u_xlatb7) ? u_xlat1.x : (-u_xlat1.x);
					    u_xlat1.x = u_xlat1.x + 12.0;
					    u_xlat2.xy = vec2(_TimeX) * vec2(0.333333343, 0.200000003);
					    u_xlat2.xy = sin(u_xlat2.xy);
					    u_xlat2.xy = u_xlat2.xy * vec2(0.5, 0.5) + u_xlat16_13.yy;
					    u_xlat7.xy = vec2((-u_xlat16_13.x) + float(_PositionX), (-u_xlat16_13.y) + float(_PositionY));
					    u_xlat7.x = dot(u_xlat7.xy, u_xlat7.xy);
					    u_xlat7.x = sqrt(u_xlat7.x);
					    u_xlat7.x = u_xlat7.x + (-_Radius);
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat2.xy).xyz;
					    u_xlat1.xzw = u_xlat1.xxx * vec3(0.0769230798, 0.0769230798, 0.0769230798) + u_xlat10_2.xyz;
					    u_xlat1.xzw = u_xlat1.xzw * vec3(0.5, 0.5, 0.5);
					    u_xlat0.xyz = u_xlat0.xyz / u_xlat1.xzw;
					    u_xlat0.xyz = u_xlat0.xyz / vec3(u_xlat16_18);
					    u_xlat10_1.xzw = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat2.xyz = (-u_xlat0.xyz) + u_xlat10_1.xzw;
					    u_xlat18 = _SpotSize * 0.150000006;
					    u_xlat18 = float(1.0) / u_xlat18;
					    u_xlat18 = u_xlat18 * u_xlat7.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
					#else
					    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
					#endif
					    u_xlat7.x = u_xlat18 * -2.0 + 3.0;
					    u_xlat18 = u_xlat18 * u_xlat18;
					    u_xlat18 = (-u_xlat7.x) * u_xlat18 + 1.0;
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat10_1.xzw;
					    u_xlat18 = (-_AlphaHexa) + 1.0;
					    SV_Target0.xyz = vec3(u_xlat18) * u_xlat1.xyz + u_xlat0.xyz;
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
					uniform 	vec4 _ScreenResolution;
					uniform 	float _Value;
					uniform 	float _BorderSize;
					uniform 	vec4 _BorderColor;
					uniform 	vec4 _HexaColor;
					uniform 	float _AlphaHexa;
					uniform 	float _PositionX;
					uniform 	float _PositionY;
					uniform 	float _Radius;
					uniform 	float _SpotSize;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					mediump vec2 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					bvec4 u_xlatb1;
					vec3 u_xlat2;
					lowp vec3 u_xlat10_2;
					bvec2 u_xlatb2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec3 u_xlat5;
					float u_xlat6;
					vec3 u_xlat7;
					lowp vec3 u_xlat10_7;
					bool u_xlatb7;
					vec2 u_xlat12;
					mediump vec2 u_xlat16_13;
					float u_xlat18;
					mediump float u_xlat16_18;
					bool u_xlatb18;
					float u_xlat19;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _ScreenResolution.xy;
					    u_xlat12.x = _ScreenResolution.x * _Value;
					    u_xlat1.xyz = u_xlat12.xxx * vec3(0.0108253174, 0.00937500037, 0.0108253174);
					    u_xlat0.xyw = u_xlat0.yxy / u_xlat1.yxy;
					    u_xlatb1.xw = greaterThanEqual(u_xlat0.yyyw, (-u_xlat0.yyyw)).xw;
					    u_xlat2.xy = fract(abs(u_xlat0.yw));
					    u_xlat3.xyz = floor(u_xlat0.xyw);
					    u_xlat0.x = (u_xlatb1.x) ? u_xlat2.x : (-u_xlat2.x);
					    u_xlat0.y = (u_xlatb1.w) ? u_xlat2.y : (-u_xlat2.y);
					    u_xlat0.xy = vec2(u_xlat1.z * u_xlat0.x, u_xlat1.y * u_xlat0.y);
					    u_xlat1.xyz = u_xlat12.xxx * vec3(0.00625000009, 0.00312500005, 0.00541265868);
					    u_xlat18 = u_xlat1.y / u_xlat1.z;
					    u_xlat19 = u_xlat18 * u_xlat0.x;
					    u_xlat18 = u_xlat0.x * u_xlat18 + (-u_xlat1.y);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.y<u_xlat18);
					#else
					    u_xlatb18 = u_xlat0.y<u_xlat18;
					#endif
					    u_xlat2.xy = u_xlat12.xx * vec2(0.00312500005, 0.00625000009) + (-vec2(u_xlat19));
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb7 = !!(u_xlat0.y<u_xlat19);
					#else
					    u_xlatb7 = u_xlat0.y<u_xlat19;
					#endif
					    u_xlatb2.xy = lessThan(u_xlat0.yyyy, u_xlat2.xyxx).xy;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat1.z<u_xlat0.x);
					#else
					    u_xlatb0 = u_xlat1.z<u_xlat0.x;
					#endif
					    u_xlat4 = vec4(u_xlat3.y + float(-1.0), u_xlat3.z + float(-1.0), u_xlat3.y + float(-1.0), u_xlat3.z + float(0.0));
					    u_xlat5.z = (u_xlatb2.y) ? u_xlat4.y : u_xlat3.z;
					    u_xlat5.xy = vec2(u_xlat3.y + float(0.0), u_xlat3.z + float(-1.0));
					    u_xlat7.xz = (bool(u_xlatb7)) ? u_xlat5.xy : u_xlat4.zw;
					    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat5.xz : u_xlat7.xz;
					    u_xlat3.w = (u_xlatb18) ? u_xlat4.y : u_xlat3.z;
					    u_xlat7.xz = (u_xlatb2.x) ? u_xlat4.xy : u_xlat3.yw;
					    u_xlat18 = u_xlat3.x * 0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2.x = !!(u_xlat18>=(-u_xlat18));
					#else
					    u_xlatb2.x = u_xlat18>=(-u_xlat18);
					#endif
					    u_xlat18 = fract(abs(u_xlat18));
					    u_xlat18 = (u_xlatb2.x) ? u_xlat18 : (-u_xlat18);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(0.0<u_xlat18);
					#else
					    u_xlatb18 = 0.0<u_xlat18;
					#endif
					    u_xlat0.xy = (bool(u_xlatb18)) ? u_xlat7.xz : u_xlat0.xy;
					    u_xlat18 = u_xlat0.y * 0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb7 = !!(u_xlat18>=(-u_xlat18));
					#else
					    u_xlatb7 = u_xlat18>=(-u_xlat18);
					#endif
					    u_xlat18 = fract(abs(u_xlat18));
					    u_xlat18 = (u_xlatb7) ? u_xlat18 : (-u_xlat18);
					    u_xlat18 = dot(vec2(u_xlat18), u_xlat1.zz);
					    u_xlat0.x = dot(u_xlat0.xx, u_xlat1.zz);
					    u_xlat2.x = (-u_xlat18) + u_xlat0.x;
					    u_xlat0.x = u_xlat12.x * 0.00937500037;
					    u_xlat2.y = u_xlat0.x * u_xlat0.y;
					    u_xlat0.xy = u_xlat12.xx * vec2(0.0108253174, 0.00625000009) + u_xlat2.xy;
					    u_xlat12.xy = (-vs_TEXCOORD0.xy) * _ScreenResolution.xy + u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy / _ScreenResolution.xy;
					    u_xlat10_7.xyz = texture(_MainTex, u_xlat0.xy).xyz;
					    u_xlat7.xyz = u_xlat10_7.xyz + (-_BorderColor.xyz);
					    u_xlat0.x = dot(abs(u_xlat12.xy), vec2(0.5, 0.866025388));
					    u_xlat0.x = max(abs(u_xlat12.x), u_xlat0.x);
					    u_xlat6 = u_xlat1.x * _BorderSize + -1.0;
					    u_xlat12.x = u_xlat1.x * _BorderSize + (-u_xlat6);
					    u_xlat0.x = u_xlat0.x * 1.15470052 + (-u_xlat6);
					    u_xlat6 = float(1.0) / u_xlat12.x;
					    u_xlat0.x = u_xlat6 * u_xlat0.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat6 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat6) * u_xlat0.x + 1.0;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz + _BorderColor.xyz;
					    u_xlat16_1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_13.xy = u_xlat16_1.xy * u_xlat16_1.xy;
					    u_xlat16_1.xy = u_xlat16_1.yx * vec2(1.20000005, 1.20000005);
					    u_xlat16_18 = dot(u_xlat16_13.yy, u_xlat16_13.xx);
					    u_xlat16_18 = u_xlat16_18 + 0.833333313;
					    u_xlat16_13.xy = u_xlat16_1.yx * vec2(u_xlat16_18) + vec2(0.5, 0.5);
					    u_xlat16_1.xy = vec2(u_xlat16_18) * u_xlat16_1.xy;
					    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_1.xy;
					    u_xlat16_1.xy = (-u_xlat16_1.xy) * vec2(1.80437076, 1.80437076) + vec2(1.0, 1.0);
					    u_xlat16_18 = dot(u_xlat16_1.xx, u_xlat16_1.yy);
					    u_xlat1.x = _TimeX * 0.25 + u_xlat16_13.x;
					    u_xlat1.x = u_xlat1.x + 0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb7 = !!(u_xlat1.x>=(-u_xlat1.x));
					#else
					    u_xlatb7 = u_xlat1.x>=(-u_xlat1.x);
					#endif
					    u_xlat1.x = fract(abs(u_xlat1.x));
					    u_xlat1.x = (u_xlatb7) ? u_xlat1.x : (-u_xlat1.x);
					    u_xlat1.x = u_xlat1.x + u_xlat1.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
					#else
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					#endif
					    u_xlat7.x = u_xlat1.x * -2.0 + 3.0;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * u_xlat7.x;
					    u_xlat1.x = (-u_xlat1.x) * 0.5 + 1.0;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xxx;
					    u_xlat0.xyz = u_xlat0.xyz * _HexaColor.xyz;
					    u_xlat1.x = u_xlat16_13.y * 10.0 + _TimeX;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb7 = !!(u_xlat1.x>=(-u_xlat1.x));
					#else
					    u_xlatb7 = u_xlat1.x>=(-u_xlat1.x);
					#endif
					    u_xlat1.x = fract(abs(u_xlat1.x));
					    u_xlat1.x = (u_xlatb7) ? u_xlat1.x : (-u_xlat1.x);
					    u_xlat1.x = u_xlat1.x + 12.0;
					    u_xlat2.xy = vec2(_TimeX) * vec2(0.333333343, 0.200000003);
					    u_xlat2.xy = sin(u_xlat2.xy);
					    u_xlat2.xy = u_xlat2.xy * vec2(0.5, 0.5) + u_xlat16_13.yy;
					    u_xlat7.xy = vec2((-u_xlat16_13.x) + float(_PositionX), (-u_xlat16_13.y) + float(_PositionY));
					    u_xlat7.x = dot(u_xlat7.xy, u_xlat7.xy);
					    u_xlat7.x = sqrt(u_xlat7.x);
					    u_xlat7.x = u_xlat7.x + (-_Radius);
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat2.xy).xyz;
					    u_xlat1.xzw = u_xlat1.xxx * vec3(0.0769230798, 0.0769230798, 0.0769230798) + u_xlat10_2.xyz;
					    u_xlat1.xzw = u_xlat1.xzw * vec3(0.5, 0.5, 0.5);
					    u_xlat0.xyz = u_xlat0.xyz / u_xlat1.xzw;
					    u_xlat0.xyz = u_xlat0.xyz / vec3(u_xlat16_18);
					    u_xlat10_1.xzw = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat2.xyz = (-u_xlat0.xyz) + u_xlat10_1.xzw;
					    u_xlat18 = _SpotSize * 0.150000006;
					    u_xlat18 = float(1.0) / u_xlat18;
					    u_xlat18 = u_xlat18 * u_xlat7.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
					#else
					    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
					#endif
					    u_xlat7.x = u_xlat18 * -2.0 + 3.0;
					    u_xlat18 = u_xlat18 * u_xlat18;
					    u_xlat18 = (-u_xlat7.x) * u_xlat18 + 1.0;
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat10_1.xzw;
					    u_xlat18 = (-_AlphaHexa) + 1.0;
					    SV_Target0.xyz = vec3(u_xlat18) * u_xlat1.xyz + u_xlat0.xyz;
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