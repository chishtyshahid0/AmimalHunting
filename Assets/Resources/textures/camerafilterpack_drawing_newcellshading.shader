Shader "CameraFilterPack/Drawing_NewCellShading" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_Threshold ("_Threshold", Range(0, 1)) = 0
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 59618
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
					#extension GL_EXT_shader_texture_lod : enable
					lowp vec4 impl_low_texture2DLodEXT(lowp sampler2D sampler, highp vec2 coord, mediump float lod)
					{
					#if defined(GL_EXT_shader_texture_lod)
						return texture2DLodEXT(sampler, coord, lod);
					#else
						return texture2D(sampler, coord, lod);
					#endif
					}
					
					uniform sampler2D _MainTex;
					uniform highp vec4 _ScreenResolution;
					uniform highp float _Threshold;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 color_1;
					  color_1 = vec4(0.0, 0.0, 0.0, 0.0);
					  highp float tmpvar_2;
					  tmpvar_2 = (xlv_TEXCOORD0.x * _ScreenResolution.x);
					  highp float tmpvar_3;
					  tmpvar_3 = (xlv_TEXCOORD0.y * _ScreenResolution.y);
					  highp float tmpvar_4;
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = (tmpvar_2 - 1.0);
					  tmpvar_5.y = (tmpvar_3 - 1.0);
					  highp vec4 tmpvar_6;
					  tmpvar_6.zw = vec2(0.0, 0.0);
					  tmpvar_6.xy = (tmpvar_5 / _ScreenResolution.xy);
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = impl_low_texture2DLodEXT (_MainTex, tmpvar_6.xy, 0.0);
					  tmpvar_4 = tmpvar_7.x;
					  highp float tmpvar_8;
					  highp vec2 tmpvar_9;
					  tmpvar_9.x = (tmpvar_2 - 1.0);
					  tmpvar_9.y = tmpvar_3;
					  highp vec4 tmpvar_10;
					  tmpvar_10.zw = vec2(0.0, 0.0);
					  tmpvar_10.xy = (tmpvar_9 / _ScreenResolution.xy);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = impl_low_texture2DLodEXT (_MainTex, tmpvar_10.xy, 0.0);
					  tmpvar_8 = tmpvar_11.x;
					  highp float tmpvar_12;
					  highp vec2 tmpvar_13;
					  tmpvar_13.x = (tmpvar_2 - 1.0);
					  tmpvar_13.y = (tmpvar_3 + 1.0);
					  highp vec4 tmpvar_14;
					  tmpvar_14.zw = vec2(0.0, 0.0);
					  tmpvar_14.xy = (tmpvar_13 / _ScreenResolution.xy);
					  lowp vec4 tmpvar_15;
					  tmpvar_15 = impl_low_texture2DLodEXT (_MainTex, tmpvar_14.xy, 0.0);
					  tmpvar_12 = tmpvar_15.x;
					  highp float tmpvar_16;
					  highp vec2 tmpvar_17;
					  tmpvar_17.x = (tmpvar_2 + 1.0);
					  tmpvar_17.y = (tmpvar_3 - 1.0);
					  highp vec4 tmpvar_18;
					  tmpvar_18.zw = vec2(0.0, 0.0);
					  tmpvar_18.xy = (tmpvar_17 / _ScreenResolution.xy);
					  lowp vec4 tmpvar_19;
					  tmpvar_19 = impl_low_texture2DLodEXT (_MainTex, tmpvar_18.xy, 0.0);
					  tmpvar_16 = tmpvar_19.x;
					  highp float tmpvar_20;
					  highp vec2 tmpvar_21;
					  tmpvar_21.x = (tmpvar_2 + 1.0);
					  tmpvar_21.y = tmpvar_3;
					  highp vec4 tmpvar_22;
					  tmpvar_22.zw = vec2(0.0, 0.0);
					  tmpvar_22.xy = (tmpvar_21 / _ScreenResolution.xy);
					  lowp vec4 tmpvar_23;
					  tmpvar_23 = impl_low_texture2DLodEXT (_MainTex, tmpvar_22.xy, 0.0);
					  tmpvar_20 = tmpvar_23.x;
					  highp float tmpvar_24;
					  highp vec2 tmpvar_25;
					  tmpvar_25.x = (tmpvar_2 + 1.0);
					  tmpvar_25.y = (tmpvar_3 + 1.0);
					  highp vec4 tmpvar_26;
					  tmpvar_26.zw = vec2(0.0, 0.0);
					  tmpvar_26.xy = (tmpvar_25 / _ScreenResolution.xy);
					  lowp vec4 tmpvar_27;
					  tmpvar_27 = impl_low_texture2DLodEXT (_MainTex, tmpvar_26.xy, 0.0);
					  tmpvar_24 = tmpvar_27.x;
					  highp float tmpvar_28;
					  highp vec2 tmpvar_29;
					  tmpvar_29.x = (tmpvar_2 - 1.0);
					  tmpvar_29.y = (tmpvar_3 - 1.0);
					  highp vec4 tmpvar_30;
					  tmpvar_30.zw = vec2(0.0, 0.0);
					  tmpvar_30.xy = (tmpvar_29 / _ScreenResolution.xy);
					  lowp vec4 tmpvar_31;
					  tmpvar_31 = impl_low_texture2DLodEXT (_MainTex, tmpvar_30.xy, 0.0);
					  tmpvar_28 = tmpvar_31.x;
					  highp float tmpvar_32;
					  highp vec2 tmpvar_33;
					  tmpvar_33.x = tmpvar_2;
					  tmpvar_33.y = (tmpvar_3 - 1.0);
					  highp vec4 tmpvar_34;
					  tmpvar_34.zw = vec2(0.0, 0.0);
					  tmpvar_34.xy = (tmpvar_33 / _ScreenResolution.xy);
					  lowp vec4 tmpvar_35;
					  tmpvar_35 = impl_low_texture2DLodEXT (_MainTex, tmpvar_34.xy, 0.0);
					  tmpvar_32 = tmpvar_35.x;
					  highp float tmpvar_36;
					  highp vec2 tmpvar_37;
					  tmpvar_37.x = (tmpvar_2 + 1.0);
					  tmpvar_37.y = (tmpvar_3 - 1.0);
					  highp vec4 tmpvar_38;
					  tmpvar_38.zw = vec2(0.0, 0.0);
					  tmpvar_38.xy = (tmpvar_37 / _ScreenResolution.xy);
					  lowp vec4 tmpvar_39;
					  tmpvar_39 = impl_low_texture2DLodEXT (_MainTex, tmpvar_38.xy, 0.0);
					  tmpvar_36 = tmpvar_39.x;
					  highp float tmpvar_40;
					  highp vec2 tmpvar_41;
					  tmpvar_41.x = (tmpvar_2 - 1.0);
					  tmpvar_41.y = (tmpvar_3 + 1.0);
					  highp vec4 tmpvar_42;
					  tmpvar_42.zw = vec2(0.0, 0.0);
					  tmpvar_42.xy = (tmpvar_41 / _ScreenResolution.xy);
					  lowp vec4 tmpvar_43;
					  tmpvar_43 = impl_low_texture2DLodEXT (_MainTex, tmpvar_42.xy, 0.0);
					  tmpvar_40 = tmpvar_43.x;
					  highp float tmpvar_44;
					  highp vec2 tmpvar_45;
					  tmpvar_45.x = tmpvar_2;
					  tmpvar_45.y = (tmpvar_3 + 1.0);
					  highp vec4 tmpvar_46;
					  tmpvar_46.zw = vec2(0.0, 0.0);
					  tmpvar_46.xy = (tmpvar_45 / _ScreenResolution.xy);
					  lowp vec4 tmpvar_47;
					  tmpvar_47 = impl_low_texture2DLodEXT (_MainTex, tmpvar_46.xy, 0.0);
					  tmpvar_44 = tmpvar_47.x;
					  highp float tmpvar_48;
					  highp vec2 tmpvar_49;
					  tmpvar_49.x = (tmpvar_2 + 1.0);
					  tmpvar_49.y = (tmpvar_3 + 1.0);
					  highp vec4 tmpvar_50;
					  tmpvar_50.zw = vec2(0.0, 0.0);
					  tmpvar_50.xy = (tmpvar_49 / _ScreenResolution.xy);
					  lowp vec4 tmpvar_51;
					  tmpvar_51 = impl_low_texture2DLodEXT (_MainTex, tmpvar_50.xy, 0.0);
					  tmpvar_48 = tmpvar_51.x;
					  highp vec2 tmpvar_52;
					  tmpvar_52.x = (((
					    ((-(tmpvar_4) - (2.0 * tmpvar_8)) - tmpvar_12)
					   + tmpvar_16) + (2.0 * tmpvar_20)) + tmpvar_24);
					  tmpvar_52.y = (((
					    ((tmpvar_28 + (2.0 * tmpvar_32)) + tmpvar_36)
					   - tmpvar_40) - (2.0 * tmpvar_44)) - tmpvar_48);
					  highp float tmpvar_53;
					  tmpvar_53 = sqrt(dot (tmpvar_52, tmpvar_52));
					  if ((tmpvar_53 > _Threshold)) {
					    color_1 = vec4(0.0, 0.0, 0.0, 0.0);
					  } else {
					    highp vec2 tmpvar_54;
					    tmpvar_54.x = tmpvar_2;
					    tmpvar_54.y = tmpvar_3;
					    highp vec4 tmpvar_55;
					    tmpvar_55.zw = vec2(0.0, 0.0);
					    tmpvar_55.xy = (tmpvar_54 / _ScreenResolution.xy);
					    color_1 = impl_low_texture2DLodEXT (_MainTex, tmpvar_55.xy, 0.0);
					  };
					  gl_FragData[0] = color_1;
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
					#extension GL_EXT_shader_texture_lod : enable
					lowp vec4 impl_low_texture2DLodEXT(lowp sampler2D sampler, highp vec2 coord, mediump float lod)
					{
					#if defined(GL_EXT_shader_texture_lod)
						return texture2DLodEXT(sampler, coord, lod);
					#else
						return texture2D(sampler, coord, lod);
					#endif
					}
					
					uniform sampler2D _MainTex;
					uniform highp vec4 _ScreenResolution;
					uniform highp float _Threshold;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 color_1;
					  color_1 = vec4(0.0, 0.0, 0.0, 0.0);
					  highp float tmpvar_2;
					  tmpvar_2 = (xlv_TEXCOORD0.x * _ScreenResolution.x);
					  highp float tmpvar_3;
					  tmpvar_3 = (xlv_TEXCOORD0.y * _ScreenResolution.y);
					  highp float tmpvar_4;
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = (tmpvar_2 - 1.0);
					  tmpvar_5.y = (tmpvar_3 - 1.0);
					  highp vec4 tmpvar_6;
					  tmpvar_6.zw = vec2(0.0, 0.0);
					  tmpvar_6.xy = (tmpvar_5 / _ScreenResolution.xy);
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = impl_low_texture2DLodEXT (_MainTex, tmpvar_6.xy, 0.0);
					  tmpvar_4 = tmpvar_7.x;
					  highp float tmpvar_8;
					  highp vec2 tmpvar_9;
					  tmpvar_9.x = (tmpvar_2 - 1.0);
					  tmpvar_9.y = tmpvar_3;
					  highp vec4 tmpvar_10;
					  tmpvar_10.zw = vec2(0.0, 0.0);
					  tmpvar_10.xy = (tmpvar_9 / _ScreenResolution.xy);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = impl_low_texture2DLodEXT (_MainTex, tmpvar_10.xy, 0.0);
					  tmpvar_8 = tmpvar_11.x;
					  highp float tmpvar_12;
					  highp vec2 tmpvar_13;
					  tmpvar_13.x = (tmpvar_2 - 1.0);
					  tmpvar_13.y = (tmpvar_3 + 1.0);
					  highp vec4 tmpvar_14;
					  tmpvar_14.zw = vec2(0.0, 0.0);
					  tmpvar_14.xy = (tmpvar_13 / _ScreenResolution.xy);
					  lowp vec4 tmpvar_15;
					  tmpvar_15 = impl_low_texture2DLodEXT (_MainTex, tmpvar_14.xy, 0.0);
					  tmpvar_12 = tmpvar_15.x;
					  highp float tmpvar_16;
					  highp vec2 tmpvar_17;
					  tmpvar_17.x = (tmpvar_2 + 1.0);
					  tmpvar_17.y = (tmpvar_3 - 1.0);
					  highp vec4 tmpvar_18;
					  tmpvar_18.zw = vec2(0.0, 0.0);
					  tmpvar_18.xy = (tmpvar_17 / _ScreenResolution.xy);
					  lowp vec4 tmpvar_19;
					  tmpvar_19 = impl_low_texture2DLodEXT (_MainTex, tmpvar_18.xy, 0.0);
					  tmpvar_16 = tmpvar_19.x;
					  highp float tmpvar_20;
					  highp vec2 tmpvar_21;
					  tmpvar_21.x = (tmpvar_2 + 1.0);
					  tmpvar_21.y = tmpvar_3;
					  highp vec4 tmpvar_22;
					  tmpvar_22.zw = vec2(0.0, 0.0);
					  tmpvar_22.xy = (tmpvar_21 / _ScreenResolution.xy);
					  lowp vec4 tmpvar_23;
					  tmpvar_23 = impl_low_texture2DLodEXT (_MainTex, tmpvar_22.xy, 0.0);
					  tmpvar_20 = tmpvar_23.x;
					  highp float tmpvar_24;
					  highp vec2 tmpvar_25;
					  tmpvar_25.x = (tmpvar_2 + 1.0);
					  tmpvar_25.y = (tmpvar_3 + 1.0);
					  highp vec4 tmpvar_26;
					  tmpvar_26.zw = vec2(0.0, 0.0);
					  tmpvar_26.xy = (tmpvar_25 / _ScreenResolution.xy);
					  lowp vec4 tmpvar_27;
					  tmpvar_27 = impl_low_texture2DLodEXT (_MainTex, tmpvar_26.xy, 0.0);
					  tmpvar_24 = tmpvar_27.x;
					  highp float tmpvar_28;
					  highp vec2 tmpvar_29;
					  tmpvar_29.x = (tmpvar_2 - 1.0);
					  tmpvar_29.y = (tmpvar_3 - 1.0);
					  highp vec4 tmpvar_30;
					  tmpvar_30.zw = vec2(0.0, 0.0);
					  tmpvar_30.xy = (tmpvar_29 / _ScreenResolution.xy);
					  lowp vec4 tmpvar_31;
					  tmpvar_31 = impl_low_texture2DLodEXT (_MainTex, tmpvar_30.xy, 0.0);
					  tmpvar_28 = tmpvar_31.x;
					  highp float tmpvar_32;
					  highp vec2 tmpvar_33;
					  tmpvar_33.x = tmpvar_2;
					  tmpvar_33.y = (tmpvar_3 - 1.0);
					  highp vec4 tmpvar_34;
					  tmpvar_34.zw = vec2(0.0, 0.0);
					  tmpvar_34.xy = (tmpvar_33 / _ScreenResolution.xy);
					  lowp vec4 tmpvar_35;
					  tmpvar_35 = impl_low_texture2DLodEXT (_MainTex, tmpvar_34.xy, 0.0);
					  tmpvar_32 = tmpvar_35.x;
					  highp float tmpvar_36;
					  highp vec2 tmpvar_37;
					  tmpvar_37.x = (tmpvar_2 + 1.0);
					  tmpvar_37.y = (tmpvar_3 - 1.0);
					  highp vec4 tmpvar_38;
					  tmpvar_38.zw = vec2(0.0, 0.0);
					  tmpvar_38.xy = (tmpvar_37 / _ScreenResolution.xy);
					  lowp vec4 tmpvar_39;
					  tmpvar_39 = impl_low_texture2DLodEXT (_MainTex, tmpvar_38.xy, 0.0);
					  tmpvar_36 = tmpvar_39.x;
					  highp float tmpvar_40;
					  highp vec2 tmpvar_41;
					  tmpvar_41.x = (tmpvar_2 - 1.0);
					  tmpvar_41.y = (tmpvar_3 + 1.0);
					  highp vec4 tmpvar_42;
					  tmpvar_42.zw = vec2(0.0, 0.0);
					  tmpvar_42.xy = (tmpvar_41 / _ScreenResolution.xy);
					  lowp vec4 tmpvar_43;
					  tmpvar_43 = impl_low_texture2DLodEXT (_MainTex, tmpvar_42.xy, 0.0);
					  tmpvar_40 = tmpvar_43.x;
					  highp float tmpvar_44;
					  highp vec2 tmpvar_45;
					  tmpvar_45.x = tmpvar_2;
					  tmpvar_45.y = (tmpvar_3 + 1.0);
					  highp vec4 tmpvar_46;
					  tmpvar_46.zw = vec2(0.0, 0.0);
					  tmpvar_46.xy = (tmpvar_45 / _ScreenResolution.xy);
					  lowp vec4 tmpvar_47;
					  tmpvar_47 = impl_low_texture2DLodEXT (_MainTex, tmpvar_46.xy, 0.0);
					  tmpvar_44 = tmpvar_47.x;
					  highp float tmpvar_48;
					  highp vec2 tmpvar_49;
					  tmpvar_49.x = (tmpvar_2 + 1.0);
					  tmpvar_49.y = (tmpvar_3 + 1.0);
					  highp vec4 tmpvar_50;
					  tmpvar_50.zw = vec2(0.0, 0.0);
					  tmpvar_50.xy = (tmpvar_49 / _ScreenResolution.xy);
					  lowp vec4 tmpvar_51;
					  tmpvar_51 = impl_low_texture2DLodEXT (_MainTex, tmpvar_50.xy, 0.0);
					  tmpvar_48 = tmpvar_51.x;
					  highp vec2 tmpvar_52;
					  tmpvar_52.x = (((
					    ((-(tmpvar_4) - (2.0 * tmpvar_8)) - tmpvar_12)
					   + tmpvar_16) + (2.0 * tmpvar_20)) + tmpvar_24);
					  tmpvar_52.y = (((
					    ((tmpvar_28 + (2.0 * tmpvar_32)) + tmpvar_36)
					   - tmpvar_40) - (2.0 * tmpvar_44)) - tmpvar_48);
					  highp float tmpvar_53;
					  tmpvar_53 = sqrt(dot (tmpvar_52, tmpvar_52));
					  if ((tmpvar_53 > _Threshold)) {
					    color_1 = vec4(0.0, 0.0, 0.0, 0.0);
					  } else {
					    highp vec2 tmpvar_54;
					    tmpvar_54.x = tmpvar_2;
					    tmpvar_54.y = tmpvar_3;
					    highp vec4 tmpvar_55;
					    tmpvar_55.zw = vec2(0.0, 0.0);
					    tmpvar_55.xy = (tmpvar_54 / _ScreenResolution.xy);
					    color_1 = impl_low_texture2DLodEXT (_MainTex, tmpvar_55.xy, 0.0);
					  };
					  gl_FragData[0] = color_1;
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
					#extension GL_EXT_shader_texture_lod : enable
					lowp vec4 impl_low_texture2DLodEXT(lowp sampler2D sampler, highp vec2 coord, mediump float lod)
					{
					#if defined(GL_EXT_shader_texture_lod)
						return texture2DLodEXT(sampler, coord, lod);
					#else
						return texture2D(sampler, coord, lod);
					#endif
					}
					
					uniform sampler2D _MainTex;
					uniform highp vec4 _ScreenResolution;
					uniform highp float _Threshold;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 color_1;
					  color_1 = vec4(0.0, 0.0, 0.0, 0.0);
					  highp float tmpvar_2;
					  tmpvar_2 = (xlv_TEXCOORD0.x * _ScreenResolution.x);
					  highp float tmpvar_3;
					  tmpvar_3 = (xlv_TEXCOORD0.y * _ScreenResolution.y);
					  highp float tmpvar_4;
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = (tmpvar_2 - 1.0);
					  tmpvar_5.y = (tmpvar_3 - 1.0);
					  highp vec4 tmpvar_6;
					  tmpvar_6.zw = vec2(0.0, 0.0);
					  tmpvar_6.xy = (tmpvar_5 / _ScreenResolution.xy);
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = impl_low_texture2DLodEXT (_MainTex, tmpvar_6.xy, 0.0);
					  tmpvar_4 = tmpvar_7.x;
					  highp float tmpvar_8;
					  highp vec2 tmpvar_9;
					  tmpvar_9.x = (tmpvar_2 - 1.0);
					  tmpvar_9.y = tmpvar_3;
					  highp vec4 tmpvar_10;
					  tmpvar_10.zw = vec2(0.0, 0.0);
					  tmpvar_10.xy = (tmpvar_9 / _ScreenResolution.xy);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = impl_low_texture2DLodEXT (_MainTex, tmpvar_10.xy, 0.0);
					  tmpvar_8 = tmpvar_11.x;
					  highp float tmpvar_12;
					  highp vec2 tmpvar_13;
					  tmpvar_13.x = (tmpvar_2 - 1.0);
					  tmpvar_13.y = (tmpvar_3 + 1.0);
					  highp vec4 tmpvar_14;
					  tmpvar_14.zw = vec2(0.0, 0.0);
					  tmpvar_14.xy = (tmpvar_13 / _ScreenResolution.xy);
					  lowp vec4 tmpvar_15;
					  tmpvar_15 = impl_low_texture2DLodEXT (_MainTex, tmpvar_14.xy, 0.0);
					  tmpvar_12 = tmpvar_15.x;
					  highp float tmpvar_16;
					  highp vec2 tmpvar_17;
					  tmpvar_17.x = (tmpvar_2 + 1.0);
					  tmpvar_17.y = (tmpvar_3 - 1.0);
					  highp vec4 tmpvar_18;
					  tmpvar_18.zw = vec2(0.0, 0.0);
					  tmpvar_18.xy = (tmpvar_17 / _ScreenResolution.xy);
					  lowp vec4 tmpvar_19;
					  tmpvar_19 = impl_low_texture2DLodEXT (_MainTex, tmpvar_18.xy, 0.0);
					  tmpvar_16 = tmpvar_19.x;
					  highp float tmpvar_20;
					  highp vec2 tmpvar_21;
					  tmpvar_21.x = (tmpvar_2 + 1.0);
					  tmpvar_21.y = tmpvar_3;
					  highp vec4 tmpvar_22;
					  tmpvar_22.zw = vec2(0.0, 0.0);
					  tmpvar_22.xy = (tmpvar_21 / _ScreenResolution.xy);
					  lowp vec4 tmpvar_23;
					  tmpvar_23 = impl_low_texture2DLodEXT (_MainTex, tmpvar_22.xy, 0.0);
					  tmpvar_20 = tmpvar_23.x;
					  highp float tmpvar_24;
					  highp vec2 tmpvar_25;
					  tmpvar_25.x = (tmpvar_2 + 1.0);
					  tmpvar_25.y = (tmpvar_3 + 1.0);
					  highp vec4 tmpvar_26;
					  tmpvar_26.zw = vec2(0.0, 0.0);
					  tmpvar_26.xy = (tmpvar_25 / _ScreenResolution.xy);
					  lowp vec4 tmpvar_27;
					  tmpvar_27 = impl_low_texture2DLodEXT (_MainTex, tmpvar_26.xy, 0.0);
					  tmpvar_24 = tmpvar_27.x;
					  highp float tmpvar_28;
					  highp vec2 tmpvar_29;
					  tmpvar_29.x = (tmpvar_2 - 1.0);
					  tmpvar_29.y = (tmpvar_3 - 1.0);
					  highp vec4 tmpvar_30;
					  tmpvar_30.zw = vec2(0.0, 0.0);
					  tmpvar_30.xy = (tmpvar_29 / _ScreenResolution.xy);
					  lowp vec4 tmpvar_31;
					  tmpvar_31 = impl_low_texture2DLodEXT (_MainTex, tmpvar_30.xy, 0.0);
					  tmpvar_28 = tmpvar_31.x;
					  highp float tmpvar_32;
					  highp vec2 tmpvar_33;
					  tmpvar_33.x = tmpvar_2;
					  tmpvar_33.y = (tmpvar_3 - 1.0);
					  highp vec4 tmpvar_34;
					  tmpvar_34.zw = vec2(0.0, 0.0);
					  tmpvar_34.xy = (tmpvar_33 / _ScreenResolution.xy);
					  lowp vec4 tmpvar_35;
					  tmpvar_35 = impl_low_texture2DLodEXT (_MainTex, tmpvar_34.xy, 0.0);
					  tmpvar_32 = tmpvar_35.x;
					  highp float tmpvar_36;
					  highp vec2 tmpvar_37;
					  tmpvar_37.x = (tmpvar_2 + 1.0);
					  tmpvar_37.y = (tmpvar_3 - 1.0);
					  highp vec4 tmpvar_38;
					  tmpvar_38.zw = vec2(0.0, 0.0);
					  tmpvar_38.xy = (tmpvar_37 / _ScreenResolution.xy);
					  lowp vec4 tmpvar_39;
					  tmpvar_39 = impl_low_texture2DLodEXT (_MainTex, tmpvar_38.xy, 0.0);
					  tmpvar_36 = tmpvar_39.x;
					  highp float tmpvar_40;
					  highp vec2 tmpvar_41;
					  tmpvar_41.x = (tmpvar_2 - 1.0);
					  tmpvar_41.y = (tmpvar_3 + 1.0);
					  highp vec4 tmpvar_42;
					  tmpvar_42.zw = vec2(0.0, 0.0);
					  tmpvar_42.xy = (tmpvar_41 / _ScreenResolution.xy);
					  lowp vec4 tmpvar_43;
					  tmpvar_43 = impl_low_texture2DLodEXT (_MainTex, tmpvar_42.xy, 0.0);
					  tmpvar_40 = tmpvar_43.x;
					  highp float tmpvar_44;
					  highp vec2 tmpvar_45;
					  tmpvar_45.x = tmpvar_2;
					  tmpvar_45.y = (tmpvar_3 + 1.0);
					  highp vec4 tmpvar_46;
					  tmpvar_46.zw = vec2(0.0, 0.0);
					  tmpvar_46.xy = (tmpvar_45 / _ScreenResolution.xy);
					  lowp vec4 tmpvar_47;
					  tmpvar_47 = impl_low_texture2DLodEXT (_MainTex, tmpvar_46.xy, 0.0);
					  tmpvar_44 = tmpvar_47.x;
					  highp float tmpvar_48;
					  highp vec2 tmpvar_49;
					  tmpvar_49.x = (tmpvar_2 + 1.0);
					  tmpvar_49.y = (tmpvar_3 + 1.0);
					  highp vec4 tmpvar_50;
					  tmpvar_50.zw = vec2(0.0, 0.0);
					  tmpvar_50.xy = (tmpvar_49 / _ScreenResolution.xy);
					  lowp vec4 tmpvar_51;
					  tmpvar_51 = impl_low_texture2DLodEXT (_MainTex, tmpvar_50.xy, 0.0);
					  tmpvar_48 = tmpvar_51.x;
					  highp vec2 tmpvar_52;
					  tmpvar_52.x = (((
					    ((-(tmpvar_4) - (2.0 * tmpvar_8)) - tmpvar_12)
					   + tmpvar_16) + (2.0 * tmpvar_20)) + tmpvar_24);
					  tmpvar_52.y = (((
					    ((tmpvar_28 + (2.0 * tmpvar_32)) + tmpvar_36)
					   - tmpvar_40) - (2.0 * tmpvar_44)) - tmpvar_48);
					  highp float tmpvar_53;
					  tmpvar_53 = sqrt(dot (tmpvar_52, tmpvar_52));
					  if ((tmpvar_53 > _Threshold)) {
					    color_1 = vec4(0.0, 0.0, 0.0, 0.0);
					  } else {
					    highp vec2 tmpvar_54;
					    tmpvar_54.x = tmpvar_2;
					    tmpvar_54.y = tmpvar_3;
					    highp vec4 tmpvar_55;
					    tmpvar_55.zw = vec2(0.0, 0.0);
					    tmpvar_55.xy = (tmpvar_54 / _ScreenResolution.xy);
					    color_1 = impl_low_texture2DLodEXT (_MainTex, tmpvar_55.xy, 0.0);
					  };
					  gl_FragData[0] = color_1;
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
					uniform 	float _Threshold;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					lowp float u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					lowp float u_xlat10_5;
					float u_xlat8;
					mediump float u_xlat16_8;
					lowp float u_xlat10_8;
					bool u_xlatb8;
					lowp float u_xlat10_9;
					lowp float u_xlat10_12;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _ScreenResolution.xy;
					    u_xlat1 = vs_TEXCOORD0.xyyx * _ScreenResolution.xyyx + vec4(-1.0, -1.0, 1.0, 1.0);
					    u_xlat2 = u_xlat1.xyxz / _ScreenResolution.xyxy;
					    u_xlat10_1 = textureLod(_MainTex, u_xlat2.xy, 0.0).x;
					    u_xlat0.zw = vs_TEXCOORD0.xx * _ScreenResolution.xx + vec2(-1.0, 1.0);
					    u_xlat3 = vec4(u_xlat0.z / _ScreenResolution.x, u_xlat0.y / _ScreenResolution.y, u_xlat0.w / _ScreenResolution.x, u_xlat0.y / _ScreenResolution.y);
					    u_xlat10_8 = textureLod(_MainTex, u_xlat3.xy, 0.0).x;
					    u_xlat16_8 = (-u_xlat10_8) * 2.0 + (-u_xlat10_1);
					    u_xlat10_12 = textureLod(_MainTex, u_xlat2.zw, 0.0).x;
					    u_xlat16_8 = (-u_xlat10_12) + u_xlat16_8;
					    u_xlat2 = vec4(u_xlat1.w / _ScreenResolution.x, u_xlat1.y / _ScreenResolution.y, u_xlat1.w / _ScreenResolution.x, u_xlat1.z / _ScreenResolution.y);
					    u_xlat10_5 = textureLod(_MainTex, u_xlat2.xy, 0.0).x;
					    u_xlat16_8 = u_xlat16_8 + u_xlat10_5;
					    u_xlat10_9 = textureLod(_MainTex, u_xlat3.zw, 0.0).x;
					    u_xlat16_8 = u_xlat10_9 * 2.0 + u_xlat16_8;
					    u_xlat10_9 = textureLod(_MainTex, u_xlat2.zw, 0.0).x;
					    u_xlat2.x = u_xlat16_8 + u_xlat10_9;
					    u_xlat3 = vs_TEXCOORD0.xyxy * _ScreenResolution.xyxy + vec4(0.0, -1.0, 0.0, 1.0);
					    u_xlat3 = u_xlat3 / _ScreenResolution.xyxy;
					    u_xlat10_8 = textureLod(_MainTex, u_xlat3.xy, 0.0).x;
					    u_xlat16_8 = u_xlat10_8 * 2.0 + u_xlat10_1;
					    u_xlat16_8 = u_xlat10_5 + u_xlat16_8;
					    u_xlat16_8 = (-u_xlat10_12) + u_xlat16_8;
					    u_xlat10_12 = textureLod(_MainTex, u_xlat3.zw, 0.0).x;
					    u_xlat16_8 = (-u_xlat10_12) * 2.0 + u_xlat16_8;
					    u_xlat2.y = (-u_xlat10_9) + u_xlat16_8;
					    u_xlat8 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat8 = sqrt(u_xlat8);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb8 = !!(_Threshold<u_xlat8);
					#else
					    u_xlatb8 = _Threshold<u_xlat8;
					#endif
					    if(u_xlatb8){
					        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    } else {
					        u_xlat0.xy = u_xlat0.xy / _ScreenResolution.xy;
					        u_xlat10_0 = textureLod(_MainTex, u_xlat0.xy, 0.0);
					        SV_Target0 = u_xlat10_0;
					    //ENDIF
					    }
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
					uniform 	float _Threshold;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					lowp float u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					lowp float u_xlat10_5;
					float u_xlat8;
					mediump float u_xlat16_8;
					lowp float u_xlat10_8;
					bool u_xlatb8;
					lowp float u_xlat10_9;
					lowp float u_xlat10_12;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _ScreenResolution.xy;
					    u_xlat1 = vs_TEXCOORD0.xyyx * _ScreenResolution.xyyx + vec4(-1.0, -1.0, 1.0, 1.0);
					    u_xlat2 = u_xlat1.xyxz / _ScreenResolution.xyxy;
					    u_xlat10_1 = textureLod(_MainTex, u_xlat2.xy, 0.0).x;
					    u_xlat0.zw = vs_TEXCOORD0.xx * _ScreenResolution.xx + vec2(-1.0, 1.0);
					    u_xlat3 = vec4(u_xlat0.z / _ScreenResolution.x, u_xlat0.y / _ScreenResolution.y, u_xlat0.w / _ScreenResolution.x, u_xlat0.y / _ScreenResolution.y);
					    u_xlat10_8 = textureLod(_MainTex, u_xlat3.xy, 0.0).x;
					    u_xlat16_8 = (-u_xlat10_8) * 2.0 + (-u_xlat10_1);
					    u_xlat10_12 = textureLod(_MainTex, u_xlat2.zw, 0.0).x;
					    u_xlat16_8 = (-u_xlat10_12) + u_xlat16_8;
					    u_xlat2 = vec4(u_xlat1.w / _ScreenResolution.x, u_xlat1.y / _ScreenResolution.y, u_xlat1.w / _ScreenResolution.x, u_xlat1.z / _ScreenResolution.y);
					    u_xlat10_5 = textureLod(_MainTex, u_xlat2.xy, 0.0).x;
					    u_xlat16_8 = u_xlat16_8 + u_xlat10_5;
					    u_xlat10_9 = textureLod(_MainTex, u_xlat3.zw, 0.0).x;
					    u_xlat16_8 = u_xlat10_9 * 2.0 + u_xlat16_8;
					    u_xlat10_9 = textureLod(_MainTex, u_xlat2.zw, 0.0).x;
					    u_xlat2.x = u_xlat16_8 + u_xlat10_9;
					    u_xlat3 = vs_TEXCOORD0.xyxy * _ScreenResolution.xyxy + vec4(0.0, -1.0, 0.0, 1.0);
					    u_xlat3 = u_xlat3 / _ScreenResolution.xyxy;
					    u_xlat10_8 = textureLod(_MainTex, u_xlat3.xy, 0.0).x;
					    u_xlat16_8 = u_xlat10_8 * 2.0 + u_xlat10_1;
					    u_xlat16_8 = u_xlat10_5 + u_xlat16_8;
					    u_xlat16_8 = (-u_xlat10_12) + u_xlat16_8;
					    u_xlat10_12 = textureLod(_MainTex, u_xlat3.zw, 0.0).x;
					    u_xlat16_8 = (-u_xlat10_12) * 2.0 + u_xlat16_8;
					    u_xlat2.y = (-u_xlat10_9) + u_xlat16_8;
					    u_xlat8 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat8 = sqrt(u_xlat8);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb8 = !!(_Threshold<u_xlat8);
					#else
					    u_xlatb8 = _Threshold<u_xlat8;
					#endif
					    if(u_xlatb8){
					        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    } else {
					        u_xlat0.xy = u_xlat0.xy / _ScreenResolution.xy;
					        u_xlat10_0 = textureLod(_MainTex, u_xlat0.xy, 0.0);
					        SV_Target0 = u_xlat10_0;
					    //ENDIF
					    }
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
					uniform 	float _Threshold;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					lowp float u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					lowp float u_xlat10_5;
					float u_xlat8;
					mediump float u_xlat16_8;
					lowp float u_xlat10_8;
					bool u_xlatb8;
					lowp float u_xlat10_9;
					lowp float u_xlat10_12;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _ScreenResolution.xy;
					    u_xlat1 = vs_TEXCOORD0.xyyx * _ScreenResolution.xyyx + vec4(-1.0, -1.0, 1.0, 1.0);
					    u_xlat2 = u_xlat1.xyxz / _ScreenResolution.xyxy;
					    u_xlat10_1 = textureLod(_MainTex, u_xlat2.xy, 0.0).x;
					    u_xlat0.zw = vs_TEXCOORD0.xx * _ScreenResolution.xx + vec2(-1.0, 1.0);
					    u_xlat3 = vec4(u_xlat0.z / _ScreenResolution.x, u_xlat0.y / _ScreenResolution.y, u_xlat0.w / _ScreenResolution.x, u_xlat0.y / _ScreenResolution.y);
					    u_xlat10_8 = textureLod(_MainTex, u_xlat3.xy, 0.0).x;
					    u_xlat16_8 = (-u_xlat10_8) * 2.0 + (-u_xlat10_1);
					    u_xlat10_12 = textureLod(_MainTex, u_xlat2.zw, 0.0).x;
					    u_xlat16_8 = (-u_xlat10_12) + u_xlat16_8;
					    u_xlat2 = vec4(u_xlat1.w / _ScreenResolution.x, u_xlat1.y / _ScreenResolution.y, u_xlat1.w / _ScreenResolution.x, u_xlat1.z / _ScreenResolution.y);
					    u_xlat10_5 = textureLod(_MainTex, u_xlat2.xy, 0.0).x;
					    u_xlat16_8 = u_xlat16_8 + u_xlat10_5;
					    u_xlat10_9 = textureLod(_MainTex, u_xlat3.zw, 0.0).x;
					    u_xlat16_8 = u_xlat10_9 * 2.0 + u_xlat16_8;
					    u_xlat10_9 = textureLod(_MainTex, u_xlat2.zw, 0.0).x;
					    u_xlat2.x = u_xlat16_8 + u_xlat10_9;
					    u_xlat3 = vs_TEXCOORD0.xyxy * _ScreenResolution.xyxy + vec4(0.0, -1.0, 0.0, 1.0);
					    u_xlat3 = u_xlat3 / _ScreenResolution.xyxy;
					    u_xlat10_8 = textureLod(_MainTex, u_xlat3.xy, 0.0).x;
					    u_xlat16_8 = u_xlat10_8 * 2.0 + u_xlat10_1;
					    u_xlat16_8 = u_xlat10_5 + u_xlat16_8;
					    u_xlat16_8 = (-u_xlat10_12) + u_xlat16_8;
					    u_xlat10_12 = textureLod(_MainTex, u_xlat3.zw, 0.0).x;
					    u_xlat16_8 = (-u_xlat10_12) * 2.0 + u_xlat16_8;
					    u_xlat2.y = (-u_xlat10_9) + u_xlat16_8;
					    u_xlat8 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat8 = sqrt(u_xlat8);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb8 = !!(_Threshold<u_xlat8);
					#else
					    u_xlatb8 = _Threshold<u_xlat8;
					#endif
					    if(u_xlatb8){
					        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    } else {
					        u_xlat0.xy = u_xlat0.xy / _ScreenResolution.xy;
					        u_xlat10_0 = textureLod(_MainTex, u_xlat0.xy, 0.0);
					        SV_Target0 = u_xlat10_0;
					    //ENDIF
					    }
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