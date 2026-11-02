Shader "CameraFilterPack/Drawing_CellShading" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_EdgeSize ("_EdgeSize", Range(0, 1)) = 0
		_ColorLevel ("_ColorLevel", Range(0, 10)) = 7
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 22426
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
					uniform highp float _EdgeSize;
					uniform highp float _ColorLevel;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 sum_2;
					  lowp vec4 color_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.zw = vec2(0.0, 0.0);
					  highp vec2 tmpvar_5;
					  tmpvar_5 = (xlv_TEXCOORD0 * _ScreenResolution.xy);
					  tmpvar_4.xy = ((tmpvar_5 + vec2(1.0, 1.0)) / _ScreenResolution.xy);
					  color_3 = impl_low_texture2DLodEXT (_MainTex, tmpvar_4.xy, 0.0);
					  highp vec4 tmpvar_6;
					  tmpvar_6.zw = vec2(0.0, 0.0);
					  tmpvar_6.xy = ((tmpvar_5 + vec2(0.0, 1.0)) / _ScreenResolution.xy);
					  color_3 = (color_3 + impl_low_texture2DLodEXT (_MainTex, tmpvar_6.xy, 0.0));
					  highp vec4 tmpvar_7;
					  tmpvar_7.zw = vec2(0.0, 0.0);
					  tmpvar_7.xy = ((tmpvar_5 + vec2(-1.0, 1.0)) / _ScreenResolution.xy);
					  color_3 = (color_3 + impl_low_texture2DLodEXT (_MainTex, tmpvar_7.xy, 0.0));
					  highp vec4 tmpvar_8;
					  tmpvar_8.zw = vec2(0.0, 0.0);
					  tmpvar_8.xy = ((tmpvar_5 + vec2(1.0, 0.0)) / _ScreenResolution.xy);
					  color_3 = (color_3 + impl_low_texture2DLodEXT (_MainTex, tmpvar_8.xy, 0.0));
					  highp vec4 tmpvar_9;
					  tmpvar_9.zw = vec2(0.0, 0.0);
					  tmpvar_9.xy = (tmpvar_5 / _ScreenResolution.xy);
					  color_3 = (color_3 + impl_low_texture2DLodEXT (_MainTex, tmpvar_9.xy, 0.0));
					  highp vec4 tmpvar_10;
					  tmpvar_10.zw = vec2(0.0, 0.0);
					  tmpvar_10.xy = ((tmpvar_5 + vec2(-1.0, 0.0)) / _ScreenResolution.xy);
					  color_3 = (color_3 + impl_low_texture2DLodEXT (_MainTex, tmpvar_10.xy, 0.0));
					  highp vec4 tmpvar_11;
					  tmpvar_11.zw = vec2(0.0, 0.0);
					  tmpvar_11.xy = ((tmpvar_5 + vec2(1.0, -1.0)) / _ScreenResolution.xy);
					  color_3 = (color_3 + impl_low_texture2DLodEXT (_MainTex, tmpvar_11.xy, 0.0));
					  highp vec4 tmpvar_12;
					  tmpvar_12.zw = vec2(0.0, 0.0);
					  tmpvar_12.xy = ((tmpvar_5 + vec2(0.0, -1.0)) / _ScreenResolution.xy);
					  color_3 = (color_3 + impl_low_texture2DLodEXT (_MainTex, tmpvar_12.xy, 0.0));
					  highp vec4 tmpvar_13;
					  tmpvar_13.zw = vec2(0.0, 0.0);
					  tmpvar_13.xy = ((tmpvar_5 + vec2(-1.0, -1.0)) / _ScreenResolution.xy);
					  color_3 = (color_3 + impl_low_texture2DLodEXT (_MainTex, tmpvar_13.xy, 0.0));
					  color_3 = (color_3 / 9.0);
					  lowp vec4 tmpvar_14;
					  tmpvar_14.yzw = color_3.yzw;
					  tmpvar_14.x = (floor((7.0 * color_3.x)) / _ColorLevel);
					  lowp vec4 tmpvar_15;
					  tmpvar_15.xzw = tmpvar_14.xzw;
					  tmpvar_15.y = (floor((7.0 * color_3.y)) / _ColorLevel);
					  lowp vec4 tmpvar_16;
					  tmpvar_16.xyw = tmpvar_15.xyw;
					  tmpvar_16.z = (floor((7.0 * color_3.z)) / _ColorLevel);
					  color_3 = tmpvar_16;
					  highp vec4 tmpvar_17;
					  lowp vec4 color_18;
					  highp vec4 tmpvar_19;
					  tmpvar_19.zw = vec2(0.0, 0.0);
					  tmpvar_19.xy = ((tmpvar_5 + vec2(1.0, 2.0)) / _ScreenResolution.xy);
					  color_18 = impl_low_texture2DLodEXT (_MainTex, tmpvar_19.xy, 0.0);
					  highp vec4 tmpvar_20;
					  tmpvar_20.zw = vec2(0.0, 0.0);
					  tmpvar_20.xy = ((tmpvar_5 + vec2(0.0, 2.0)) / _ScreenResolution.xy);
					  color_18 = (color_18 + impl_low_texture2DLodEXT (_MainTex, tmpvar_20.xy, 0.0));
					  highp vec4 tmpvar_21;
					  tmpvar_21.zw = vec2(0.0, 0.0);
					  tmpvar_21.xy = ((tmpvar_5 + vec2(-1.0, 2.0)) / _ScreenResolution.xy);
					  color_18 = (color_18 + impl_low_texture2DLodEXT (_MainTex, tmpvar_21.xy, 0.0));
					  highp vec4 tmpvar_22;
					  tmpvar_22.zw = vec2(0.0, 0.0);
					  tmpvar_22.xy = ((tmpvar_5 + vec2(1.0, 1.0)) / _ScreenResolution.xy);
					  color_18 = (color_18 + impl_low_texture2DLodEXT (_MainTex, tmpvar_22.xy, 0.0));
					  highp vec4 tmpvar_23;
					  tmpvar_23.zw = vec2(0.0, 0.0);
					  tmpvar_23.xy = ((tmpvar_5 + vec2(0.0, 1.0)) / _ScreenResolution.xy);
					  color_18 = (color_18 + impl_low_texture2DLodEXT (_MainTex, tmpvar_23.xy, 0.0));
					  highp vec4 tmpvar_24;
					  tmpvar_24.zw = vec2(0.0, 0.0);
					  tmpvar_24.xy = ((tmpvar_5 + vec2(-1.0, 1.0)) / _ScreenResolution.xy);
					  color_18 = (color_18 + impl_low_texture2DLodEXT (_MainTex, tmpvar_24.xy, 0.0));
					  highp vec4 tmpvar_25;
					  tmpvar_25.zw = vec2(0.0, 0.0);
					  tmpvar_25.xy = ((tmpvar_5 + vec2(1.0, 0.0)) / _ScreenResolution.xy);
					  color_18 = (color_18 + impl_low_texture2DLodEXT (_MainTex, tmpvar_25.xy, 0.0));
					  highp vec4 tmpvar_26;
					  tmpvar_26.zw = vec2(0.0, 0.0);
					  tmpvar_26.xy = (tmpvar_5 / _ScreenResolution.xy);
					  color_18 = (color_18 + impl_low_texture2DLodEXT (_MainTex, tmpvar_26.xy, 0.0));
					  highp vec4 tmpvar_27;
					  tmpvar_27.zw = vec2(0.0, 0.0);
					  tmpvar_27.xy = ((tmpvar_5 + vec2(-1.0, 0.0)) / _ScreenResolution.xy);
					  color_18 = (color_18 + impl_low_texture2DLodEXT (_MainTex, tmpvar_27.xy, 0.0));
					  tmpvar_17 = (color_18 / 9.0);
					  highp vec4 tmpvar_28;
					  lowp vec4 color_29;
					  highp vec4 tmpvar_30;
					  tmpvar_30.zw = vec2(0.0, 0.0);
					  tmpvar_30.xy = ((tmpvar_5 + vec2(1.0, 0.0)) / _ScreenResolution.xy);
					  color_29 = impl_low_texture2DLodEXT (_MainTex, tmpvar_30.xy, 0.0);
					  highp vec4 tmpvar_31;
					  tmpvar_31.zw = vec2(0.0, 0.0);
					  tmpvar_31.xy = (tmpvar_5 / _ScreenResolution.xy);
					  color_29 = (color_29 + impl_low_texture2DLodEXT (_MainTex, tmpvar_31.xy, 0.0));
					  highp vec4 tmpvar_32;
					  tmpvar_32.zw = vec2(0.0, 0.0);
					  tmpvar_32.xy = ((tmpvar_5 + vec2(-1.0, 0.0)) / _ScreenResolution.xy);
					  color_29 = (color_29 + impl_low_texture2DLodEXT (_MainTex, tmpvar_32.xy, 0.0));
					  highp vec4 tmpvar_33;
					  tmpvar_33.zw = vec2(0.0, 0.0);
					  tmpvar_33.xy = ((tmpvar_5 + vec2(1.0, -1.0)) / _ScreenResolution.xy);
					  color_29 = (color_29 + impl_low_texture2DLodEXT (_MainTex, tmpvar_33.xy, 0.0));
					  highp vec4 tmpvar_34;
					  tmpvar_34.zw = vec2(0.0, 0.0);
					  tmpvar_34.xy = ((tmpvar_5 + vec2(0.0, -1.0)) / _ScreenResolution.xy);
					  color_29 = (color_29 + impl_low_texture2DLodEXT (_MainTex, tmpvar_34.xy, 0.0));
					  highp vec4 tmpvar_35;
					  tmpvar_35.zw = vec2(0.0, 0.0);
					  tmpvar_35.xy = ((tmpvar_5 + vec2(-1.0, -1.0)) / _ScreenResolution.xy);
					  color_29 = (color_29 + impl_low_texture2DLodEXT (_MainTex, tmpvar_35.xy, 0.0));
					  highp vec4 tmpvar_36;
					  tmpvar_36.zw = vec2(0.0, 0.0);
					  tmpvar_36.xy = ((tmpvar_5 + vec2(1.0, -2.0)) / _ScreenResolution.xy);
					  color_29 = (color_29 + impl_low_texture2DLodEXT (_MainTex, tmpvar_36.xy, 0.0));
					  highp vec4 tmpvar_37;
					  tmpvar_37.zw = vec2(0.0, 0.0);
					  tmpvar_37.xy = ((tmpvar_5 + vec2(0.0, -2.0)) / _ScreenResolution.xy);
					  color_29 = (color_29 + impl_low_texture2DLodEXT (_MainTex, tmpvar_37.xy, 0.0));
					  highp vec4 tmpvar_38;
					  tmpvar_38.zw = vec2(0.0, 0.0);
					  tmpvar_38.xy = ((tmpvar_5 + vec2(-1.0, -2.0)) / _ScreenResolution.xy);
					  color_29 = (color_29 + impl_low_texture2DLodEXT (_MainTex, tmpvar_38.xy, 0.0));
					  tmpvar_28 = (color_29 / 9.0);
					  highp vec4 tmpvar_39;
					  tmpvar_39 = abs((tmpvar_17 - tmpvar_28));
					  sum_2 = tmpvar_39;
					  highp vec4 tmpvar_40;
					  lowp vec4 color_41;
					  highp vec4 tmpvar_42;
					  tmpvar_42.zw = vec2(0.0, 0.0);
					  tmpvar_42.xy = ((tmpvar_5 + vec2(2.0, 1.0)) / _ScreenResolution.xy);
					  color_41 = impl_low_texture2DLodEXT (_MainTex, tmpvar_42.xy, 0.0);
					  highp vec4 tmpvar_43;
					  tmpvar_43.zw = vec2(0.0, 0.0);
					  tmpvar_43.xy = ((tmpvar_5 + vec2(1.0, 1.0)) / _ScreenResolution.xy);
					  color_41 = (color_41 + impl_low_texture2DLodEXT (_MainTex, tmpvar_43.xy, 0.0));
					  highp vec4 tmpvar_44;
					  tmpvar_44.zw = vec2(0.0, 0.0);
					  tmpvar_44.xy = ((tmpvar_5 + vec2(0.0, 1.0)) / _ScreenResolution.xy);
					  color_41 = (color_41 + impl_low_texture2DLodEXT (_MainTex, tmpvar_44.xy, 0.0));
					  highp vec4 tmpvar_45;
					  tmpvar_45.zw = vec2(0.0, 0.0);
					  tmpvar_45.xy = ((tmpvar_5 + vec2(2.0, 0.0)) / _ScreenResolution.xy);
					  color_41 = (color_41 + impl_low_texture2DLodEXT (_MainTex, tmpvar_45.xy, 0.0));
					  highp vec4 tmpvar_46;
					  tmpvar_46.zw = vec2(0.0, 0.0);
					  tmpvar_46.xy = ((tmpvar_5 + vec2(1.0, 0.0)) / _ScreenResolution.xy);
					  color_41 = (color_41 + impl_low_texture2DLodEXT (_MainTex, tmpvar_46.xy, 0.0));
					  highp vec4 tmpvar_47;
					  tmpvar_47.zw = vec2(0.0, 0.0);
					  tmpvar_47.xy = (tmpvar_5 / _ScreenResolution.xy);
					  color_41 = (color_41 + impl_low_texture2DLodEXT (_MainTex, tmpvar_47.xy, 0.0));
					  highp vec4 tmpvar_48;
					  tmpvar_48.zw = vec2(0.0, 0.0);
					  tmpvar_48.xy = ((tmpvar_5 + vec2(2.0, -1.0)) / _ScreenResolution.xy);
					  color_41 = (color_41 + impl_low_texture2DLodEXT (_MainTex, tmpvar_48.xy, 0.0));
					  highp vec4 tmpvar_49;
					  tmpvar_49.zw = vec2(0.0, 0.0);
					  tmpvar_49.xy = ((tmpvar_5 + vec2(1.0, -1.0)) / _ScreenResolution.xy);
					  color_41 = (color_41 + impl_low_texture2DLodEXT (_MainTex, tmpvar_49.xy, 0.0));
					  highp vec4 tmpvar_50;
					  tmpvar_50.zw = vec2(0.0, 0.0);
					  tmpvar_50.xy = ((tmpvar_5 + vec2(0.0, -1.0)) / _ScreenResolution.xy);
					  color_41 = (color_41 + impl_low_texture2DLodEXT (_MainTex, tmpvar_50.xy, 0.0));
					  tmpvar_40 = (color_41 / 9.0);
					  highp vec4 tmpvar_51;
					  lowp vec4 color_52;
					  highp vec4 tmpvar_53;
					  tmpvar_53.zw = vec2(0.0, 0.0);
					  tmpvar_53.xy = ((tmpvar_5 + vec2(0.0, 1.0)) / _ScreenResolution.xy);
					  color_52 = impl_low_texture2DLodEXT (_MainTex, tmpvar_53.xy, 0.0);
					  highp vec4 tmpvar_54;
					  tmpvar_54.zw = vec2(0.0, 0.0);
					  tmpvar_54.xy = ((tmpvar_5 + vec2(-1.0, 1.0)) / _ScreenResolution.xy);
					  color_52 = (color_52 + impl_low_texture2DLodEXT (_MainTex, tmpvar_54.xy, 0.0));
					  highp vec4 tmpvar_55;
					  tmpvar_55.zw = vec2(0.0, 0.0);
					  tmpvar_55.xy = ((tmpvar_5 + vec2(-2.0, 1.0)) / _ScreenResolution.xy);
					  color_52 = (color_52 + impl_low_texture2DLodEXT (_MainTex, tmpvar_55.xy, 0.0));
					  highp vec4 tmpvar_56;
					  tmpvar_56.zw = vec2(0.0, 0.0);
					  tmpvar_56.xy = (tmpvar_5 / _ScreenResolution.xy);
					  color_52 = (color_52 + impl_low_texture2DLodEXT (_MainTex, tmpvar_56.xy, 0.0));
					  highp vec4 tmpvar_57;
					  tmpvar_57.zw = vec2(0.0, 0.0);
					  tmpvar_57.xy = ((tmpvar_5 + vec2(-1.0, 0.0)) / _ScreenResolution.xy);
					  color_52 = (color_52 + impl_low_texture2DLodEXT (_MainTex, tmpvar_57.xy, 0.0));
					  highp vec4 tmpvar_58;
					  tmpvar_58.zw = vec2(0.0, 0.0);
					  tmpvar_58.xy = ((tmpvar_5 + vec2(-2.0, 0.0)) / _ScreenResolution.xy);
					  color_52 = (color_52 + impl_low_texture2DLodEXT (_MainTex, tmpvar_58.xy, 0.0));
					  highp vec4 tmpvar_59;
					  tmpvar_59.zw = vec2(0.0, 0.0);
					  tmpvar_59.xy = ((tmpvar_5 + vec2(0.0, -1.0)) / _ScreenResolution.xy);
					  color_52 = (color_52 + impl_low_texture2DLodEXT (_MainTex, tmpvar_59.xy, 0.0));
					  highp vec4 tmpvar_60;
					  tmpvar_60.zw = vec2(0.0, 0.0);
					  tmpvar_60.xy = ((tmpvar_5 + vec2(-1.0, -1.0)) / _ScreenResolution.xy);
					  color_52 = (color_52 + impl_low_texture2DLodEXT (_MainTex, tmpvar_60.xy, 0.0));
					  highp vec4 tmpvar_61;
					  tmpvar_61.zw = vec2(0.0, 0.0);
					  tmpvar_61.xy = ((tmpvar_5 + vec2(-2.0, -1.0)) / _ScreenResolution.xy);
					  color_52 = (color_52 + impl_low_texture2DLodEXT (_MainTex, tmpvar_61.xy, 0.0));
					  tmpvar_51 = (color_52 / 9.0);
					  highp vec4 tmpvar_62;
					  tmpvar_62 = abs((tmpvar_40 - tmpvar_51));
					  sum_2 = (sum_2 + tmpvar_62);
					  sum_2 = (sum_2 / 2.0);
					  highp float tmpvar_63;
					  tmpvar_63 = (_EdgeSize + 0.05);
					  lowp float tmpvar_64;
					  tmpvar_64 = sqrt(dot (sum_2, sum_2));
					  if ((tmpvar_64 > tmpvar_63)) {
					    color_3.xyz = vec3(0.0, 0.0, 0.0);
					  };
					  tmpvar_1 = color_3;
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
					uniform highp float _EdgeSize;
					uniform highp float _ColorLevel;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 sum_2;
					  lowp vec4 color_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.zw = vec2(0.0, 0.0);
					  highp vec2 tmpvar_5;
					  tmpvar_5 = (xlv_TEXCOORD0 * _ScreenResolution.xy);
					  tmpvar_4.xy = ((tmpvar_5 + vec2(1.0, 1.0)) / _ScreenResolution.xy);
					  color_3 = impl_low_texture2DLodEXT (_MainTex, tmpvar_4.xy, 0.0);
					  highp vec4 tmpvar_6;
					  tmpvar_6.zw = vec2(0.0, 0.0);
					  tmpvar_6.xy = ((tmpvar_5 + vec2(0.0, 1.0)) / _ScreenResolution.xy);
					  color_3 = (color_3 + impl_low_texture2DLodEXT (_MainTex, tmpvar_6.xy, 0.0));
					  highp vec4 tmpvar_7;
					  tmpvar_7.zw = vec2(0.0, 0.0);
					  tmpvar_7.xy = ((tmpvar_5 + vec2(-1.0, 1.0)) / _ScreenResolution.xy);
					  color_3 = (color_3 + impl_low_texture2DLodEXT (_MainTex, tmpvar_7.xy, 0.0));
					  highp vec4 tmpvar_8;
					  tmpvar_8.zw = vec2(0.0, 0.0);
					  tmpvar_8.xy = ((tmpvar_5 + vec2(1.0, 0.0)) / _ScreenResolution.xy);
					  color_3 = (color_3 + impl_low_texture2DLodEXT (_MainTex, tmpvar_8.xy, 0.0));
					  highp vec4 tmpvar_9;
					  tmpvar_9.zw = vec2(0.0, 0.0);
					  tmpvar_9.xy = (tmpvar_5 / _ScreenResolution.xy);
					  color_3 = (color_3 + impl_low_texture2DLodEXT (_MainTex, tmpvar_9.xy, 0.0));
					  highp vec4 tmpvar_10;
					  tmpvar_10.zw = vec2(0.0, 0.0);
					  tmpvar_10.xy = ((tmpvar_5 + vec2(-1.0, 0.0)) / _ScreenResolution.xy);
					  color_3 = (color_3 + impl_low_texture2DLodEXT (_MainTex, tmpvar_10.xy, 0.0));
					  highp vec4 tmpvar_11;
					  tmpvar_11.zw = vec2(0.0, 0.0);
					  tmpvar_11.xy = ((tmpvar_5 + vec2(1.0, -1.0)) / _ScreenResolution.xy);
					  color_3 = (color_3 + impl_low_texture2DLodEXT (_MainTex, tmpvar_11.xy, 0.0));
					  highp vec4 tmpvar_12;
					  tmpvar_12.zw = vec2(0.0, 0.0);
					  tmpvar_12.xy = ((tmpvar_5 + vec2(0.0, -1.0)) / _ScreenResolution.xy);
					  color_3 = (color_3 + impl_low_texture2DLodEXT (_MainTex, tmpvar_12.xy, 0.0));
					  highp vec4 tmpvar_13;
					  tmpvar_13.zw = vec2(0.0, 0.0);
					  tmpvar_13.xy = ((tmpvar_5 + vec2(-1.0, -1.0)) / _ScreenResolution.xy);
					  color_3 = (color_3 + impl_low_texture2DLodEXT (_MainTex, tmpvar_13.xy, 0.0));
					  color_3 = (color_3 / 9.0);
					  lowp vec4 tmpvar_14;
					  tmpvar_14.yzw = color_3.yzw;
					  tmpvar_14.x = (floor((7.0 * color_3.x)) / _ColorLevel);
					  lowp vec4 tmpvar_15;
					  tmpvar_15.xzw = tmpvar_14.xzw;
					  tmpvar_15.y = (floor((7.0 * color_3.y)) / _ColorLevel);
					  lowp vec4 tmpvar_16;
					  tmpvar_16.xyw = tmpvar_15.xyw;
					  tmpvar_16.z = (floor((7.0 * color_3.z)) / _ColorLevel);
					  color_3 = tmpvar_16;
					  highp vec4 tmpvar_17;
					  lowp vec4 color_18;
					  highp vec4 tmpvar_19;
					  tmpvar_19.zw = vec2(0.0, 0.0);
					  tmpvar_19.xy = ((tmpvar_5 + vec2(1.0, 2.0)) / _ScreenResolution.xy);
					  color_18 = impl_low_texture2DLodEXT (_MainTex, tmpvar_19.xy, 0.0);
					  highp vec4 tmpvar_20;
					  tmpvar_20.zw = vec2(0.0, 0.0);
					  tmpvar_20.xy = ((tmpvar_5 + vec2(0.0, 2.0)) / _ScreenResolution.xy);
					  color_18 = (color_18 + impl_low_texture2DLodEXT (_MainTex, tmpvar_20.xy, 0.0));
					  highp vec4 tmpvar_21;
					  tmpvar_21.zw = vec2(0.0, 0.0);
					  tmpvar_21.xy = ((tmpvar_5 + vec2(-1.0, 2.0)) / _ScreenResolution.xy);
					  color_18 = (color_18 + impl_low_texture2DLodEXT (_MainTex, tmpvar_21.xy, 0.0));
					  highp vec4 tmpvar_22;
					  tmpvar_22.zw = vec2(0.0, 0.0);
					  tmpvar_22.xy = ((tmpvar_5 + vec2(1.0, 1.0)) / _ScreenResolution.xy);
					  color_18 = (color_18 + impl_low_texture2DLodEXT (_MainTex, tmpvar_22.xy, 0.0));
					  highp vec4 tmpvar_23;
					  tmpvar_23.zw = vec2(0.0, 0.0);
					  tmpvar_23.xy = ((tmpvar_5 + vec2(0.0, 1.0)) / _ScreenResolution.xy);
					  color_18 = (color_18 + impl_low_texture2DLodEXT (_MainTex, tmpvar_23.xy, 0.0));
					  highp vec4 tmpvar_24;
					  tmpvar_24.zw = vec2(0.0, 0.0);
					  tmpvar_24.xy = ((tmpvar_5 + vec2(-1.0, 1.0)) / _ScreenResolution.xy);
					  color_18 = (color_18 + impl_low_texture2DLodEXT (_MainTex, tmpvar_24.xy, 0.0));
					  highp vec4 tmpvar_25;
					  tmpvar_25.zw = vec2(0.0, 0.0);
					  tmpvar_25.xy = ((tmpvar_5 + vec2(1.0, 0.0)) / _ScreenResolution.xy);
					  color_18 = (color_18 + impl_low_texture2DLodEXT (_MainTex, tmpvar_25.xy, 0.0));
					  highp vec4 tmpvar_26;
					  tmpvar_26.zw = vec2(0.0, 0.0);
					  tmpvar_26.xy = (tmpvar_5 / _ScreenResolution.xy);
					  color_18 = (color_18 + impl_low_texture2DLodEXT (_MainTex, tmpvar_26.xy, 0.0));
					  highp vec4 tmpvar_27;
					  tmpvar_27.zw = vec2(0.0, 0.0);
					  tmpvar_27.xy = ((tmpvar_5 + vec2(-1.0, 0.0)) / _ScreenResolution.xy);
					  color_18 = (color_18 + impl_low_texture2DLodEXT (_MainTex, tmpvar_27.xy, 0.0));
					  tmpvar_17 = (color_18 / 9.0);
					  highp vec4 tmpvar_28;
					  lowp vec4 color_29;
					  highp vec4 tmpvar_30;
					  tmpvar_30.zw = vec2(0.0, 0.0);
					  tmpvar_30.xy = ((tmpvar_5 + vec2(1.0, 0.0)) / _ScreenResolution.xy);
					  color_29 = impl_low_texture2DLodEXT (_MainTex, tmpvar_30.xy, 0.0);
					  highp vec4 tmpvar_31;
					  tmpvar_31.zw = vec2(0.0, 0.0);
					  tmpvar_31.xy = (tmpvar_5 / _ScreenResolution.xy);
					  color_29 = (color_29 + impl_low_texture2DLodEXT (_MainTex, tmpvar_31.xy, 0.0));
					  highp vec4 tmpvar_32;
					  tmpvar_32.zw = vec2(0.0, 0.0);
					  tmpvar_32.xy = ((tmpvar_5 + vec2(-1.0, 0.0)) / _ScreenResolution.xy);
					  color_29 = (color_29 + impl_low_texture2DLodEXT (_MainTex, tmpvar_32.xy, 0.0));
					  highp vec4 tmpvar_33;
					  tmpvar_33.zw = vec2(0.0, 0.0);
					  tmpvar_33.xy = ((tmpvar_5 + vec2(1.0, -1.0)) / _ScreenResolution.xy);
					  color_29 = (color_29 + impl_low_texture2DLodEXT (_MainTex, tmpvar_33.xy, 0.0));
					  highp vec4 tmpvar_34;
					  tmpvar_34.zw = vec2(0.0, 0.0);
					  tmpvar_34.xy = ((tmpvar_5 + vec2(0.0, -1.0)) / _ScreenResolution.xy);
					  color_29 = (color_29 + impl_low_texture2DLodEXT (_MainTex, tmpvar_34.xy, 0.0));
					  highp vec4 tmpvar_35;
					  tmpvar_35.zw = vec2(0.0, 0.0);
					  tmpvar_35.xy = ((tmpvar_5 + vec2(-1.0, -1.0)) / _ScreenResolution.xy);
					  color_29 = (color_29 + impl_low_texture2DLodEXT (_MainTex, tmpvar_35.xy, 0.0));
					  highp vec4 tmpvar_36;
					  tmpvar_36.zw = vec2(0.0, 0.0);
					  tmpvar_36.xy = ((tmpvar_5 + vec2(1.0, -2.0)) / _ScreenResolution.xy);
					  color_29 = (color_29 + impl_low_texture2DLodEXT (_MainTex, tmpvar_36.xy, 0.0));
					  highp vec4 tmpvar_37;
					  tmpvar_37.zw = vec2(0.0, 0.0);
					  tmpvar_37.xy = ((tmpvar_5 + vec2(0.0, -2.0)) / _ScreenResolution.xy);
					  color_29 = (color_29 + impl_low_texture2DLodEXT (_MainTex, tmpvar_37.xy, 0.0));
					  highp vec4 tmpvar_38;
					  tmpvar_38.zw = vec2(0.0, 0.0);
					  tmpvar_38.xy = ((tmpvar_5 + vec2(-1.0, -2.0)) / _ScreenResolution.xy);
					  color_29 = (color_29 + impl_low_texture2DLodEXT (_MainTex, tmpvar_38.xy, 0.0));
					  tmpvar_28 = (color_29 / 9.0);
					  highp vec4 tmpvar_39;
					  tmpvar_39 = abs((tmpvar_17 - tmpvar_28));
					  sum_2 = tmpvar_39;
					  highp vec4 tmpvar_40;
					  lowp vec4 color_41;
					  highp vec4 tmpvar_42;
					  tmpvar_42.zw = vec2(0.0, 0.0);
					  tmpvar_42.xy = ((tmpvar_5 + vec2(2.0, 1.0)) / _ScreenResolution.xy);
					  color_41 = impl_low_texture2DLodEXT (_MainTex, tmpvar_42.xy, 0.0);
					  highp vec4 tmpvar_43;
					  tmpvar_43.zw = vec2(0.0, 0.0);
					  tmpvar_43.xy = ((tmpvar_5 + vec2(1.0, 1.0)) / _ScreenResolution.xy);
					  color_41 = (color_41 + impl_low_texture2DLodEXT (_MainTex, tmpvar_43.xy, 0.0));
					  highp vec4 tmpvar_44;
					  tmpvar_44.zw = vec2(0.0, 0.0);
					  tmpvar_44.xy = ((tmpvar_5 + vec2(0.0, 1.0)) / _ScreenResolution.xy);
					  color_41 = (color_41 + impl_low_texture2DLodEXT (_MainTex, tmpvar_44.xy, 0.0));
					  highp vec4 tmpvar_45;
					  tmpvar_45.zw = vec2(0.0, 0.0);
					  tmpvar_45.xy = ((tmpvar_5 + vec2(2.0, 0.0)) / _ScreenResolution.xy);
					  color_41 = (color_41 + impl_low_texture2DLodEXT (_MainTex, tmpvar_45.xy, 0.0));
					  highp vec4 tmpvar_46;
					  tmpvar_46.zw = vec2(0.0, 0.0);
					  tmpvar_46.xy = ((tmpvar_5 + vec2(1.0, 0.0)) / _ScreenResolution.xy);
					  color_41 = (color_41 + impl_low_texture2DLodEXT (_MainTex, tmpvar_46.xy, 0.0));
					  highp vec4 tmpvar_47;
					  tmpvar_47.zw = vec2(0.0, 0.0);
					  tmpvar_47.xy = (tmpvar_5 / _ScreenResolution.xy);
					  color_41 = (color_41 + impl_low_texture2DLodEXT (_MainTex, tmpvar_47.xy, 0.0));
					  highp vec4 tmpvar_48;
					  tmpvar_48.zw = vec2(0.0, 0.0);
					  tmpvar_48.xy = ((tmpvar_5 + vec2(2.0, -1.0)) / _ScreenResolution.xy);
					  color_41 = (color_41 + impl_low_texture2DLodEXT (_MainTex, tmpvar_48.xy, 0.0));
					  highp vec4 tmpvar_49;
					  tmpvar_49.zw = vec2(0.0, 0.0);
					  tmpvar_49.xy = ((tmpvar_5 + vec2(1.0, -1.0)) / _ScreenResolution.xy);
					  color_41 = (color_41 + impl_low_texture2DLodEXT (_MainTex, tmpvar_49.xy, 0.0));
					  highp vec4 tmpvar_50;
					  tmpvar_50.zw = vec2(0.0, 0.0);
					  tmpvar_50.xy = ((tmpvar_5 + vec2(0.0, -1.0)) / _ScreenResolution.xy);
					  color_41 = (color_41 + impl_low_texture2DLodEXT (_MainTex, tmpvar_50.xy, 0.0));
					  tmpvar_40 = (color_41 / 9.0);
					  highp vec4 tmpvar_51;
					  lowp vec4 color_52;
					  highp vec4 tmpvar_53;
					  tmpvar_53.zw = vec2(0.0, 0.0);
					  tmpvar_53.xy = ((tmpvar_5 + vec2(0.0, 1.0)) / _ScreenResolution.xy);
					  color_52 = impl_low_texture2DLodEXT (_MainTex, tmpvar_53.xy, 0.0);
					  highp vec4 tmpvar_54;
					  tmpvar_54.zw = vec2(0.0, 0.0);
					  tmpvar_54.xy = ((tmpvar_5 + vec2(-1.0, 1.0)) / _ScreenResolution.xy);
					  color_52 = (color_52 + impl_low_texture2DLodEXT (_MainTex, tmpvar_54.xy, 0.0));
					  highp vec4 tmpvar_55;
					  tmpvar_55.zw = vec2(0.0, 0.0);
					  tmpvar_55.xy = ((tmpvar_5 + vec2(-2.0, 1.0)) / _ScreenResolution.xy);
					  color_52 = (color_52 + impl_low_texture2DLodEXT (_MainTex, tmpvar_55.xy, 0.0));
					  highp vec4 tmpvar_56;
					  tmpvar_56.zw = vec2(0.0, 0.0);
					  tmpvar_56.xy = (tmpvar_5 / _ScreenResolution.xy);
					  color_52 = (color_52 + impl_low_texture2DLodEXT (_MainTex, tmpvar_56.xy, 0.0));
					  highp vec4 tmpvar_57;
					  tmpvar_57.zw = vec2(0.0, 0.0);
					  tmpvar_57.xy = ((tmpvar_5 + vec2(-1.0, 0.0)) / _ScreenResolution.xy);
					  color_52 = (color_52 + impl_low_texture2DLodEXT (_MainTex, tmpvar_57.xy, 0.0));
					  highp vec4 tmpvar_58;
					  tmpvar_58.zw = vec2(0.0, 0.0);
					  tmpvar_58.xy = ((tmpvar_5 + vec2(-2.0, 0.0)) / _ScreenResolution.xy);
					  color_52 = (color_52 + impl_low_texture2DLodEXT (_MainTex, tmpvar_58.xy, 0.0));
					  highp vec4 tmpvar_59;
					  tmpvar_59.zw = vec2(0.0, 0.0);
					  tmpvar_59.xy = ((tmpvar_5 + vec2(0.0, -1.0)) / _ScreenResolution.xy);
					  color_52 = (color_52 + impl_low_texture2DLodEXT (_MainTex, tmpvar_59.xy, 0.0));
					  highp vec4 tmpvar_60;
					  tmpvar_60.zw = vec2(0.0, 0.0);
					  tmpvar_60.xy = ((tmpvar_5 + vec2(-1.0, -1.0)) / _ScreenResolution.xy);
					  color_52 = (color_52 + impl_low_texture2DLodEXT (_MainTex, tmpvar_60.xy, 0.0));
					  highp vec4 tmpvar_61;
					  tmpvar_61.zw = vec2(0.0, 0.0);
					  tmpvar_61.xy = ((tmpvar_5 + vec2(-2.0, -1.0)) / _ScreenResolution.xy);
					  color_52 = (color_52 + impl_low_texture2DLodEXT (_MainTex, tmpvar_61.xy, 0.0));
					  tmpvar_51 = (color_52 / 9.0);
					  highp vec4 tmpvar_62;
					  tmpvar_62 = abs((tmpvar_40 - tmpvar_51));
					  sum_2 = (sum_2 + tmpvar_62);
					  sum_2 = (sum_2 / 2.0);
					  highp float tmpvar_63;
					  tmpvar_63 = (_EdgeSize + 0.05);
					  lowp float tmpvar_64;
					  tmpvar_64 = sqrt(dot (sum_2, sum_2));
					  if ((tmpvar_64 > tmpvar_63)) {
					    color_3.xyz = vec3(0.0, 0.0, 0.0);
					  };
					  tmpvar_1 = color_3;
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
					uniform highp float _EdgeSize;
					uniform highp float _ColorLevel;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 sum_2;
					  lowp vec4 color_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.zw = vec2(0.0, 0.0);
					  highp vec2 tmpvar_5;
					  tmpvar_5 = (xlv_TEXCOORD0 * _ScreenResolution.xy);
					  tmpvar_4.xy = ((tmpvar_5 + vec2(1.0, 1.0)) / _ScreenResolution.xy);
					  color_3 = impl_low_texture2DLodEXT (_MainTex, tmpvar_4.xy, 0.0);
					  highp vec4 tmpvar_6;
					  tmpvar_6.zw = vec2(0.0, 0.0);
					  tmpvar_6.xy = ((tmpvar_5 + vec2(0.0, 1.0)) / _ScreenResolution.xy);
					  color_3 = (color_3 + impl_low_texture2DLodEXT (_MainTex, tmpvar_6.xy, 0.0));
					  highp vec4 tmpvar_7;
					  tmpvar_7.zw = vec2(0.0, 0.0);
					  tmpvar_7.xy = ((tmpvar_5 + vec2(-1.0, 1.0)) / _ScreenResolution.xy);
					  color_3 = (color_3 + impl_low_texture2DLodEXT (_MainTex, tmpvar_7.xy, 0.0));
					  highp vec4 tmpvar_8;
					  tmpvar_8.zw = vec2(0.0, 0.0);
					  tmpvar_8.xy = ((tmpvar_5 + vec2(1.0, 0.0)) / _ScreenResolution.xy);
					  color_3 = (color_3 + impl_low_texture2DLodEXT (_MainTex, tmpvar_8.xy, 0.0));
					  highp vec4 tmpvar_9;
					  tmpvar_9.zw = vec2(0.0, 0.0);
					  tmpvar_9.xy = (tmpvar_5 / _ScreenResolution.xy);
					  color_3 = (color_3 + impl_low_texture2DLodEXT (_MainTex, tmpvar_9.xy, 0.0));
					  highp vec4 tmpvar_10;
					  tmpvar_10.zw = vec2(0.0, 0.0);
					  tmpvar_10.xy = ((tmpvar_5 + vec2(-1.0, 0.0)) / _ScreenResolution.xy);
					  color_3 = (color_3 + impl_low_texture2DLodEXT (_MainTex, tmpvar_10.xy, 0.0));
					  highp vec4 tmpvar_11;
					  tmpvar_11.zw = vec2(0.0, 0.0);
					  tmpvar_11.xy = ((tmpvar_5 + vec2(1.0, -1.0)) / _ScreenResolution.xy);
					  color_3 = (color_3 + impl_low_texture2DLodEXT (_MainTex, tmpvar_11.xy, 0.0));
					  highp vec4 tmpvar_12;
					  tmpvar_12.zw = vec2(0.0, 0.0);
					  tmpvar_12.xy = ((tmpvar_5 + vec2(0.0, -1.0)) / _ScreenResolution.xy);
					  color_3 = (color_3 + impl_low_texture2DLodEXT (_MainTex, tmpvar_12.xy, 0.0));
					  highp vec4 tmpvar_13;
					  tmpvar_13.zw = vec2(0.0, 0.0);
					  tmpvar_13.xy = ((tmpvar_5 + vec2(-1.0, -1.0)) / _ScreenResolution.xy);
					  color_3 = (color_3 + impl_low_texture2DLodEXT (_MainTex, tmpvar_13.xy, 0.0));
					  color_3 = (color_3 / 9.0);
					  lowp vec4 tmpvar_14;
					  tmpvar_14.yzw = color_3.yzw;
					  tmpvar_14.x = (floor((7.0 * color_3.x)) / _ColorLevel);
					  lowp vec4 tmpvar_15;
					  tmpvar_15.xzw = tmpvar_14.xzw;
					  tmpvar_15.y = (floor((7.0 * color_3.y)) / _ColorLevel);
					  lowp vec4 tmpvar_16;
					  tmpvar_16.xyw = tmpvar_15.xyw;
					  tmpvar_16.z = (floor((7.0 * color_3.z)) / _ColorLevel);
					  color_3 = tmpvar_16;
					  highp vec4 tmpvar_17;
					  lowp vec4 color_18;
					  highp vec4 tmpvar_19;
					  tmpvar_19.zw = vec2(0.0, 0.0);
					  tmpvar_19.xy = ((tmpvar_5 + vec2(1.0, 2.0)) / _ScreenResolution.xy);
					  color_18 = impl_low_texture2DLodEXT (_MainTex, tmpvar_19.xy, 0.0);
					  highp vec4 tmpvar_20;
					  tmpvar_20.zw = vec2(0.0, 0.0);
					  tmpvar_20.xy = ((tmpvar_5 + vec2(0.0, 2.0)) / _ScreenResolution.xy);
					  color_18 = (color_18 + impl_low_texture2DLodEXT (_MainTex, tmpvar_20.xy, 0.0));
					  highp vec4 tmpvar_21;
					  tmpvar_21.zw = vec2(0.0, 0.0);
					  tmpvar_21.xy = ((tmpvar_5 + vec2(-1.0, 2.0)) / _ScreenResolution.xy);
					  color_18 = (color_18 + impl_low_texture2DLodEXT (_MainTex, tmpvar_21.xy, 0.0));
					  highp vec4 tmpvar_22;
					  tmpvar_22.zw = vec2(0.0, 0.0);
					  tmpvar_22.xy = ((tmpvar_5 + vec2(1.0, 1.0)) / _ScreenResolution.xy);
					  color_18 = (color_18 + impl_low_texture2DLodEXT (_MainTex, tmpvar_22.xy, 0.0));
					  highp vec4 tmpvar_23;
					  tmpvar_23.zw = vec2(0.0, 0.0);
					  tmpvar_23.xy = ((tmpvar_5 + vec2(0.0, 1.0)) / _ScreenResolution.xy);
					  color_18 = (color_18 + impl_low_texture2DLodEXT (_MainTex, tmpvar_23.xy, 0.0));
					  highp vec4 tmpvar_24;
					  tmpvar_24.zw = vec2(0.0, 0.0);
					  tmpvar_24.xy = ((tmpvar_5 + vec2(-1.0, 1.0)) / _ScreenResolution.xy);
					  color_18 = (color_18 + impl_low_texture2DLodEXT (_MainTex, tmpvar_24.xy, 0.0));
					  highp vec4 tmpvar_25;
					  tmpvar_25.zw = vec2(0.0, 0.0);
					  tmpvar_25.xy = ((tmpvar_5 + vec2(1.0, 0.0)) / _ScreenResolution.xy);
					  color_18 = (color_18 + impl_low_texture2DLodEXT (_MainTex, tmpvar_25.xy, 0.0));
					  highp vec4 tmpvar_26;
					  tmpvar_26.zw = vec2(0.0, 0.0);
					  tmpvar_26.xy = (tmpvar_5 / _ScreenResolution.xy);
					  color_18 = (color_18 + impl_low_texture2DLodEXT (_MainTex, tmpvar_26.xy, 0.0));
					  highp vec4 tmpvar_27;
					  tmpvar_27.zw = vec2(0.0, 0.0);
					  tmpvar_27.xy = ((tmpvar_5 + vec2(-1.0, 0.0)) / _ScreenResolution.xy);
					  color_18 = (color_18 + impl_low_texture2DLodEXT (_MainTex, tmpvar_27.xy, 0.0));
					  tmpvar_17 = (color_18 / 9.0);
					  highp vec4 tmpvar_28;
					  lowp vec4 color_29;
					  highp vec4 tmpvar_30;
					  tmpvar_30.zw = vec2(0.0, 0.0);
					  tmpvar_30.xy = ((tmpvar_5 + vec2(1.0, 0.0)) / _ScreenResolution.xy);
					  color_29 = impl_low_texture2DLodEXT (_MainTex, tmpvar_30.xy, 0.0);
					  highp vec4 tmpvar_31;
					  tmpvar_31.zw = vec2(0.0, 0.0);
					  tmpvar_31.xy = (tmpvar_5 / _ScreenResolution.xy);
					  color_29 = (color_29 + impl_low_texture2DLodEXT (_MainTex, tmpvar_31.xy, 0.0));
					  highp vec4 tmpvar_32;
					  tmpvar_32.zw = vec2(0.0, 0.0);
					  tmpvar_32.xy = ((tmpvar_5 + vec2(-1.0, 0.0)) / _ScreenResolution.xy);
					  color_29 = (color_29 + impl_low_texture2DLodEXT (_MainTex, tmpvar_32.xy, 0.0));
					  highp vec4 tmpvar_33;
					  tmpvar_33.zw = vec2(0.0, 0.0);
					  tmpvar_33.xy = ((tmpvar_5 + vec2(1.0, -1.0)) / _ScreenResolution.xy);
					  color_29 = (color_29 + impl_low_texture2DLodEXT (_MainTex, tmpvar_33.xy, 0.0));
					  highp vec4 tmpvar_34;
					  tmpvar_34.zw = vec2(0.0, 0.0);
					  tmpvar_34.xy = ((tmpvar_5 + vec2(0.0, -1.0)) / _ScreenResolution.xy);
					  color_29 = (color_29 + impl_low_texture2DLodEXT (_MainTex, tmpvar_34.xy, 0.0));
					  highp vec4 tmpvar_35;
					  tmpvar_35.zw = vec2(0.0, 0.0);
					  tmpvar_35.xy = ((tmpvar_5 + vec2(-1.0, -1.0)) / _ScreenResolution.xy);
					  color_29 = (color_29 + impl_low_texture2DLodEXT (_MainTex, tmpvar_35.xy, 0.0));
					  highp vec4 tmpvar_36;
					  tmpvar_36.zw = vec2(0.0, 0.0);
					  tmpvar_36.xy = ((tmpvar_5 + vec2(1.0, -2.0)) / _ScreenResolution.xy);
					  color_29 = (color_29 + impl_low_texture2DLodEXT (_MainTex, tmpvar_36.xy, 0.0));
					  highp vec4 tmpvar_37;
					  tmpvar_37.zw = vec2(0.0, 0.0);
					  tmpvar_37.xy = ((tmpvar_5 + vec2(0.0, -2.0)) / _ScreenResolution.xy);
					  color_29 = (color_29 + impl_low_texture2DLodEXT (_MainTex, tmpvar_37.xy, 0.0));
					  highp vec4 tmpvar_38;
					  tmpvar_38.zw = vec2(0.0, 0.0);
					  tmpvar_38.xy = ((tmpvar_5 + vec2(-1.0, -2.0)) / _ScreenResolution.xy);
					  color_29 = (color_29 + impl_low_texture2DLodEXT (_MainTex, tmpvar_38.xy, 0.0));
					  tmpvar_28 = (color_29 / 9.0);
					  highp vec4 tmpvar_39;
					  tmpvar_39 = abs((tmpvar_17 - tmpvar_28));
					  sum_2 = tmpvar_39;
					  highp vec4 tmpvar_40;
					  lowp vec4 color_41;
					  highp vec4 tmpvar_42;
					  tmpvar_42.zw = vec2(0.0, 0.0);
					  tmpvar_42.xy = ((tmpvar_5 + vec2(2.0, 1.0)) / _ScreenResolution.xy);
					  color_41 = impl_low_texture2DLodEXT (_MainTex, tmpvar_42.xy, 0.0);
					  highp vec4 tmpvar_43;
					  tmpvar_43.zw = vec2(0.0, 0.0);
					  tmpvar_43.xy = ((tmpvar_5 + vec2(1.0, 1.0)) / _ScreenResolution.xy);
					  color_41 = (color_41 + impl_low_texture2DLodEXT (_MainTex, tmpvar_43.xy, 0.0));
					  highp vec4 tmpvar_44;
					  tmpvar_44.zw = vec2(0.0, 0.0);
					  tmpvar_44.xy = ((tmpvar_5 + vec2(0.0, 1.0)) / _ScreenResolution.xy);
					  color_41 = (color_41 + impl_low_texture2DLodEXT (_MainTex, tmpvar_44.xy, 0.0));
					  highp vec4 tmpvar_45;
					  tmpvar_45.zw = vec2(0.0, 0.0);
					  tmpvar_45.xy = ((tmpvar_5 + vec2(2.0, 0.0)) / _ScreenResolution.xy);
					  color_41 = (color_41 + impl_low_texture2DLodEXT (_MainTex, tmpvar_45.xy, 0.0));
					  highp vec4 tmpvar_46;
					  tmpvar_46.zw = vec2(0.0, 0.0);
					  tmpvar_46.xy = ((tmpvar_5 + vec2(1.0, 0.0)) / _ScreenResolution.xy);
					  color_41 = (color_41 + impl_low_texture2DLodEXT (_MainTex, tmpvar_46.xy, 0.0));
					  highp vec4 tmpvar_47;
					  tmpvar_47.zw = vec2(0.0, 0.0);
					  tmpvar_47.xy = (tmpvar_5 / _ScreenResolution.xy);
					  color_41 = (color_41 + impl_low_texture2DLodEXT (_MainTex, tmpvar_47.xy, 0.0));
					  highp vec4 tmpvar_48;
					  tmpvar_48.zw = vec2(0.0, 0.0);
					  tmpvar_48.xy = ((tmpvar_5 + vec2(2.0, -1.0)) / _ScreenResolution.xy);
					  color_41 = (color_41 + impl_low_texture2DLodEXT (_MainTex, tmpvar_48.xy, 0.0));
					  highp vec4 tmpvar_49;
					  tmpvar_49.zw = vec2(0.0, 0.0);
					  tmpvar_49.xy = ((tmpvar_5 + vec2(1.0, -1.0)) / _ScreenResolution.xy);
					  color_41 = (color_41 + impl_low_texture2DLodEXT (_MainTex, tmpvar_49.xy, 0.0));
					  highp vec4 tmpvar_50;
					  tmpvar_50.zw = vec2(0.0, 0.0);
					  tmpvar_50.xy = ((tmpvar_5 + vec2(0.0, -1.0)) / _ScreenResolution.xy);
					  color_41 = (color_41 + impl_low_texture2DLodEXT (_MainTex, tmpvar_50.xy, 0.0));
					  tmpvar_40 = (color_41 / 9.0);
					  highp vec4 tmpvar_51;
					  lowp vec4 color_52;
					  highp vec4 tmpvar_53;
					  tmpvar_53.zw = vec2(0.0, 0.0);
					  tmpvar_53.xy = ((tmpvar_5 + vec2(0.0, 1.0)) / _ScreenResolution.xy);
					  color_52 = impl_low_texture2DLodEXT (_MainTex, tmpvar_53.xy, 0.0);
					  highp vec4 tmpvar_54;
					  tmpvar_54.zw = vec2(0.0, 0.0);
					  tmpvar_54.xy = ((tmpvar_5 + vec2(-1.0, 1.0)) / _ScreenResolution.xy);
					  color_52 = (color_52 + impl_low_texture2DLodEXT (_MainTex, tmpvar_54.xy, 0.0));
					  highp vec4 tmpvar_55;
					  tmpvar_55.zw = vec2(0.0, 0.0);
					  tmpvar_55.xy = ((tmpvar_5 + vec2(-2.0, 1.0)) / _ScreenResolution.xy);
					  color_52 = (color_52 + impl_low_texture2DLodEXT (_MainTex, tmpvar_55.xy, 0.0));
					  highp vec4 tmpvar_56;
					  tmpvar_56.zw = vec2(0.0, 0.0);
					  tmpvar_56.xy = (tmpvar_5 / _ScreenResolution.xy);
					  color_52 = (color_52 + impl_low_texture2DLodEXT (_MainTex, tmpvar_56.xy, 0.0));
					  highp vec4 tmpvar_57;
					  tmpvar_57.zw = vec2(0.0, 0.0);
					  tmpvar_57.xy = ((tmpvar_5 + vec2(-1.0, 0.0)) / _ScreenResolution.xy);
					  color_52 = (color_52 + impl_low_texture2DLodEXT (_MainTex, tmpvar_57.xy, 0.0));
					  highp vec4 tmpvar_58;
					  tmpvar_58.zw = vec2(0.0, 0.0);
					  tmpvar_58.xy = ((tmpvar_5 + vec2(-2.0, 0.0)) / _ScreenResolution.xy);
					  color_52 = (color_52 + impl_low_texture2DLodEXT (_MainTex, tmpvar_58.xy, 0.0));
					  highp vec4 tmpvar_59;
					  tmpvar_59.zw = vec2(0.0, 0.0);
					  tmpvar_59.xy = ((tmpvar_5 + vec2(0.0, -1.0)) / _ScreenResolution.xy);
					  color_52 = (color_52 + impl_low_texture2DLodEXT (_MainTex, tmpvar_59.xy, 0.0));
					  highp vec4 tmpvar_60;
					  tmpvar_60.zw = vec2(0.0, 0.0);
					  tmpvar_60.xy = ((tmpvar_5 + vec2(-1.0, -1.0)) / _ScreenResolution.xy);
					  color_52 = (color_52 + impl_low_texture2DLodEXT (_MainTex, tmpvar_60.xy, 0.0));
					  highp vec4 tmpvar_61;
					  tmpvar_61.zw = vec2(0.0, 0.0);
					  tmpvar_61.xy = ((tmpvar_5 + vec2(-2.0, -1.0)) / _ScreenResolution.xy);
					  color_52 = (color_52 + impl_low_texture2DLodEXT (_MainTex, tmpvar_61.xy, 0.0));
					  tmpvar_51 = (color_52 / 9.0);
					  highp vec4 tmpvar_62;
					  tmpvar_62 = abs((tmpvar_40 - tmpvar_51));
					  sum_2 = (sum_2 + tmpvar_62);
					  sum_2 = (sum_2 / 2.0);
					  highp float tmpvar_63;
					  tmpvar_63 = (_EdgeSize + 0.05);
					  lowp float tmpvar_64;
					  tmpvar_64 = sqrt(dot (sum_2, sum_2));
					  if ((tmpvar_64 > tmpvar_63)) {
					    color_3.xyz = vec3(0.0, 0.0, 0.0);
					  };
					  tmpvar_1 = color_3;
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
					uniform 	float _EdgeSize;
					uniform 	float _ColorLevel;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					lowp vec4 u_xlat10_0;
					vec3 u_xlat1;
					int u_xlati1;
					vec2 u_xlat2;
					mediump vec4 u_xlat16_2;
					lowp vec4 u_xlat10_2;
					mediump vec4 u_xlat16_3;
					lowp vec4 u_xlat10_3;
					vec4 u_xlat4;
					lowp vec4 u_xlat10_4;
					int u_xlati4;
					bool u_xlatb4;
					mediump vec4 u_xlat16_5;
					lowp vec4 u_xlat10_5;
					vec4 u_xlat6;
					lowp vec4 u_xlat10_6;
					bool u_xlatb6;
					lowp vec4 u_xlat10_7;
					lowp float u_xlat10_8;
					int u_xlati10;
					bool u_xlatb10;
					vec2 u_xlat19;
					bool u_xlatb19;
					int u_xlati22;
					int u_xlati24;
					float u_xlat28;
					int u_xlati28;
					bool u_xlatb28;
					int u_xlati31;
					bool u_xlatb31;
					int u_xlati33;
					bool u_xlatb33;
					void main()
					{
					    u_xlat10_0.x = float(0.0);
					    u_xlat10_0.y = float(0.0);
					    u_xlat10_0.z = float(0.0);
					    u_xlat10_0.w = float(0.0);
					    for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
					    {
					        u_xlat2.y = float((-u_xlati_loop_1));
					        u_xlat10_3 = u_xlat10_0.yzwx;
					        u_xlati10 = int(0xFFFFFFFFu);
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb19 = !!(1<u_xlati10);
					#else
					            u_xlatb19 = 1<u_xlati10;
					#endif
					            if(u_xlatb19){break;}
					            u_xlat2.x = float((-u_xlati10));
					            u_xlat19.xy = vs_TEXCOORD0.xy * _ScreenResolution.xy + u_xlat2.xy;
					            u_xlat19.xy = u_xlat19.xy / _ScreenResolution.xy;
					            u_xlat10_4 = textureLod(_MainTex, u_xlat19.xy, 0.0);
					            u_xlat16_3 = u_xlat10_3 + u_xlat10_4;
					            u_xlati10 = u_xlati10 + 1;
					            u_xlat10_3 = u_xlat16_3;
					        }
					        u_xlat10_0 = u_xlat10_3.wxyz;
					    }
					    u_xlat10_0 = u_xlat10_0.yzwx * vec4(0.777777791, 0.777777791, 0.777777791, 0.111111112);
					    u_xlat10_3.xyz = floor(u_xlat10_0.xyz);
					    u_xlat1.xyz = u_xlat10_3.xyz / vec3(vec3(_ColorLevel, _ColorLevel, _ColorLevel));
					    u_xlat10_2.x = float(0.0);
					    u_xlat10_2.y = float(0.0);
					    u_xlat10_2.z = float(0.0);
					    u_xlat10_2.w = float(0.0);
					    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
					    {
					        u_xlati4 = (-u_xlati_loop_2) + 1;
					        u_xlat4.y = float(u_xlati4);
					        u_xlat10_3 = u_xlat10_2;
					        u_xlati22 = int(0xFFFFFFFFu);
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb31 = !!(1<u_xlati22);
					#else
					            u_xlatb31 = 1<u_xlati22;
					#endif
					            if(u_xlatb31){break;}
					            u_xlat4.x = float((-u_xlati22));
					            u_xlat4.xw = vs_TEXCOORD0.xy * _ScreenResolution.xy + u_xlat4.xy;
					            u_xlat4.xw = u_xlat4.xw / _ScreenResolution.xy;
					            u_xlat10_5 = textureLod(_MainTex, u_xlat4.xw, 0.0);
					            u_xlat16_3 = u_xlat10_3 + u_xlat10_5;
					            u_xlati22 = u_xlati22 + 1;
					            u_xlat10_3 = u_xlat16_3;
					        }
					        u_xlat10_2 = u_xlat10_3;
					    }
					    u_xlat10_3.x = float(0.0);
					    u_xlat10_3.y = float(0.0);
					    u_xlat10_3.z = float(0.0);
					    u_xlat10_3.w = float(0.0);
					    for(int u_xlati_loop_3 = int(0xFFFFFFFFu) ; u_xlati_loop_3<=1 ; u_xlati_loop_3++)
					    {
					        u_xlati4 = (-u_xlati_loop_3) + int(0xFFFFFFFFu);
					        u_xlat4.y = float(u_xlati4);
					        u_xlat10_5 = u_xlat10_3;
					        u_xlati22 = int(0xFFFFFFFFu);
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb31 = !!(1<u_xlati22);
					#else
					            u_xlatb31 = 1<u_xlati22;
					#endif
					            if(u_xlatb31){break;}
					            u_xlat4.x = float((-u_xlati22));
					            u_xlat4.xw = vs_TEXCOORD0.xy * _ScreenResolution.xy + u_xlat4.xy;
					            u_xlat4.xw = u_xlat4.xw / _ScreenResolution.xy;
					            u_xlat10_6 = textureLod(_MainTex, u_xlat4.xw, 0.0);
					            u_xlat16_5 = u_xlat10_5 + u_xlat10_6;
					            u_xlati22 = u_xlati22 + 1;
					            u_xlat10_5 = u_xlat16_5;
					        }
					        u_xlat10_3 = u_xlat10_5;
					    }
					    u_xlat10_3 = u_xlat10_3 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112);
					    u_xlat16_2 = u_xlat10_2 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112) + (-u_xlat10_3);
					    u_xlat10_3.x = float(0.0);
					    u_xlat10_3.y = float(0.0);
					    u_xlat10_3.z = float(0.0);
					    u_xlat10_3.w = float(0.0);
					    for(int u_xlati_loop_4 = int(0xFFFFFFFFu) ; u_xlati_loop_4<=1 ; u_xlati_loop_4++)
					    {
					        u_xlat4.y = float((-u_xlati_loop_4));
					        u_xlat10_5 = u_xlat10_3;
					        u_xlati22 = int(0xFFFFFFFFu);
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb31 = !!(1<u_xlati22);
					#else
					            u_xlatb31 = 1<u_xlati22;
					#endif
					            if(u_xlatb31){break;}
					            u_xlati31 = (-u_xlati22) + 1;
					            u_xlat4.x = float(u_xlati31);
					            u_xlat4.xw = vs_TEXCOORD0.xy * _ScreenResolution.xy + u_xlat4.xy;
					            u_xlat4.xw = u_xlat4.xw / _ScreenResolution.xy;
					            u_xlat10_6 = textureLod(_MainTex, u_xlat4.xw, 0.0);
					            u_xlat16_5 = u_xlat10_5 + u_xlat10_6;
					            u_xlati22 = u_xlati22 + 1;
					            u_xlat10_5 = u_xlat16_5;
					        }
					        u_xlat10_3 = u_xlat10_5;
					    }
					    u_xlat10_4.x = float(0.0);
					    u_xlat10_4.y = float(0.0);
					    u_xlat10_4.z = float(0.0);
					    u_xlat10_4.w = float(0.0);
					    for(int u_xlati_loop_5 = int(0xFFFFFFFFu) ; u_xlati_loop_5<=1 ; u_xlati_loop_5++)
					    {
					        u_xlat6.y = float((-u_xlati_loop_5));
					        u_xlat10_5 = u_xlat10_4;
					        u_xlati24 = int(0xFFFFFFFFu);
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb33 = !!(1<u_xlati24);
					#else
					            u_xlatb33 = 1<u_xlati24;
					#endif
					            if(u_xlatb33){break;}
					            u_xlati33 = (-u_xlati24) + int(0xFFFFFFFFu);
					            u_xlat6.x = float(u_xlati33);
					            u_xlat6.xw = vs_TEXCOORD0.xy * _ScreenResolution.xy + u_xlat6.xy;
					            u_xlat6.xw = u_xlat6.xw / _ScreenResolution.xy;
					            u_xlat10_7 = textureLod(_MainTex, u_xlat6.xw, 0.0);
					            u_xlat16_5 = u_xlat10_5 + u_xlat10_7;
					            u_xlati24 = u_xlati24 + 1;
					            u_xlat10_5 = u_xlat16_5;
					        }
					        u_xlat10_4 = u_xlat10_5;
					    }
					    u_xlat10_4 = u_xlat10_4 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112);
					    u_xlat16_3 = u_xlat10_3 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112) + (-u_xlat10_4);
					    u_xlat16_2 = abs(u_xlat16_2) + abs(u_xlat16_3);
					    u_xlat10_2 = u_xlat16_2 * vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat28 = _EdgeSize + 0.0500000007;
					    u_xlat10_8 = dot(u_xlat10_2, u_xlat10_2);
					    u_xlat10_8 = sqrt(u_xlat10_8);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb28 = !!(u_xlat28<u_xlat10_8);
					#else
					    u_xlatb28 = u_xlat28<u_xlat10_8;
					#endif
					    u_xlat10_0.xyz = (bool(u_xlatb28)) ? vec3(0.0, 0.0, 0.0) : u_xlat1.xyz;
					    SV_Target0 = u_xlat10_0;
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
					uniform 	float _EdgeSize;
					uniform 	float _ColorLevel;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					lowp vec4 u_xlat10_0;
					vec3 u_xlat1;
					int u_xlati1;
					vec2 u_xlat2;
					mediump vec4 u_xlat16_2;
					lowp vec4 u_xlat10_2;
					mediump vec4 u_xlat16_3;
					lowp vec4 u_xlat10_3;
					vec4 u_xlat4;
					lowp vec4 u_xlat10_4;
					int u_xlati4;
					bool u_xlatb4;
					mediump vec4 u_xlat16_5;
					lowp vec4 u_xlat10_5;
					vec4 u_xlat6;
					lowp vec4 u_xlat10_6;
					bool u_xlatb6;
					lowp vec4 u_xlat10_7;
					lowp float u_xlat10_8;
					int u_xlati10;
					bool u_xlatb10;
					vec2 u_xlat19;
					bool u_xlatb19;
					int u_xlati22;
					int u_xlati24;
					float u_xlat28;
					int u_xlati28;
					bool u_xlatb28;
					int u_xlati31;
					bool u_xlatb31;
					int u_xlati33;
					bool u_xlatb33;
					void main()
					{
					    u_xlat10_0.x = float(0.0);
					    u_xlat10_0.y = float(0.0);
					    u_xlat10_0.z = float(0.0);
					    u_xlat10_0.w = float(0.0);
					    for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
					    {
					        u_xlat2.y = float((-u_xlati_loop_1));
					        u_xlat10_3 = u_xlat10_0.yzwx;
					        u_xlati10 = int(0xFFFFFFFFu);
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb19 = !!(1<u_xlati10);
					#else
					            u_xlatb19 = 1<u_xlati10;
					#endif
					            if(u_xlatb19){break;}
					            u_xlat2.x = float((-u_xlati10));
					            u_xlat19.xy = vs_TEXCOORD0.xy * _ScreenResolution.xy + u_xlat2.xy;
					            u_xlat19.xy = u_xlat19.xy / _ScreenResolution.xy;
					            u_xlat10_4 = textureLod(_MainTex, u_xlat19.xy, 0.0);
					            u_xlat16_3 = u_xlat10_3 + u_xlat10_4;
					            u_xlati10 = u_xlati10 + 1;
					            u_xlat10_3 = u_xlat16_3;
					        }
					        u_xlat10_0 = u_xlat10_3.wxyz;
					    }
					    u_xlat10_0 = u_xlat10_0.yzwx * vec4(0.777777791, 0.777777791, 0.777777791, 0.111111112);
					    u_xlat10_3.xyz = floor(u_xlat10_0.xyz);
					    u_xlat1.xyz = u_xlat10_3.xyz / vec3(vec3(_ColorLevel, _ColorLevel, _ColorLevel));
					    u_xlat10_2.x = float(0.0);
					    u_xlat10_2.y = float(0.0);
					    u_xlat10_2.z = float(0.0);
					    u_xlat10_2.w = float(0.0);
					    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
					    {
					        u_xlati4 = (-u_xlati_loop_2) + 1;
					        u_xlat4.y = float(u_xlati4);
					        u_xlat10_3 = u_xlat10_2;
					        u_xlati22 = int(0xFFFFFFFFu);
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb31 = !!(1<u_xlati22);
					#else
					            u_xlatb31 = 1<u_xlati22;
					#endif
					            if(u_xlatb31){break;}
					            u_xlat4.x = float((-u_xlati22));
					            u_xlat4.xw = vs_TEXCOORD0.xy * _ScreenResolution.xy + u_xlat4.xy;
					            u_xlat4.xw = u_xlat4.xw / _ScreenResolution.xy;
					            u_xlat10_5 = textureLod(_MainTex, u_xlat4.xw, 0.0);
					            u_xlat16_3 = u_xlat10_3 + u_xlat10_5;
					            u_xlati22 = u_xlati22 + 1;
					            u_xlat10_3 = u_xlat16_3;
					        }
					        u_xlat10_2 = u_xlat10_3;
					    }
					    u_xlat10_3.x = float(0.0);
					    u_xlat10_3.y = float(0.0);
					    u_xlat10_3.z = float(0.0);
					    u_xlat10_3.w = float(0.0);
					    for(int u_xlati_loop_3 = int(0xFFFFFFFFu) ; u_xlati_loop_3<=1 ; u_xlati_loop_3++)
					    {
					        u_xlati4 = (-u_xlati_loop_3) + int(0xFFFFFFFFu);
					        u_xlat4.y = float(u_xlati4);
					        u_xlat10_5 = u_xlat10_3;
					        u_xlati22 = int(0xFFFFFFFFu);
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb31 = !!(1<u_xlati22);
					#else
					            u_xlatb31 = 1<u_xlati22;
					#endif
					            if(u_xlatb31){break;}
					            u_xlat4.x = float((-u_xlati22));
					            u_xlat4.xw = vs_TEXCOORD0.xy * _ScreenResolution.xy + u_xlat4.xy;
					            u_xlat4.xw = u_xlat4.xw / _ScreenResolution.xy;
					            u_xlat10_6 = textureLod(_MainTex, u_xlat4.xw, 0.0);
					            u_xlat16_5 = u_xlat10_5 + u_xlat10_6;
					            u_xlati22 = u_xlati22 + 1;
					            u_xlat10_5 = u_xlat16_5;
					        }
					        u_xlat10_3 = u_xlat10_5;
					    }
					    u_xlat10_3 = u_xlat10_3 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112);
					    u_xlat16_2 = u_xlat10_2 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112) + (-u_xlat10_3);
					    u_xlat10_3.x = float(0.0);
					    u_xlat10_3.y = float(0.0);
					    u_xlat10_3.z = float(0.0);
					    u_xlat10_3.w = float(0.0);
					    for(int u_xlati_loop_4 = int(0xFFFFFFFFu) ; u_xlati_loop_4<=1 ; u_xlati_loop_4++)
					    {
					        u_xlat4.y = float((-u_xlati_loop_4));
					        u_xlat10_5 = u_xlat10_3;
					        u_xlati22 = int(0xFFFFFFFFu);
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb31 = !!(1<u_xlati22);
					#else
					            u_xlatb31 = 1<u_xlati22;
					#endif
					            if(u_xlatb31){break;}
					            u_xlati31 = (-u_xlati22) + 1;
					            u_xlat4.x = float(u_xlati31);
					            u_xlat4.xw = vs_TEXCOORD0.xy * _ScreenResolution.xy + u_xlat4.xy;
					            u_xlat4.xw = u_xlat4.xw / _ScreenResolution.xy;
					            u_xlat10_6 = textureLod(_MainTex, u_xlat4.xw, 0.0);
					            u_xlat16_5 = u_xlat10_5 + u_xlat10_6;
					            u_xlati22 = u_xlati22 + 1;
					            u_xlat10_5 = u_xlat16_5;
					        }
					        u_xlat10_3 = u_xlat10_5;
					    }
					    u_xlat10_4.x = float(0.0);
					    u_xlat10_4.y = float(0.0);
					    u_xlat10_4.z = float(0.0);
					    u_xlat10_4.w = float(0.0);
					    for(int u_xlati_loop_5 = int(0xFFFFFFFFu) ; u_xlati_loop_5<=1 ; u_xlati_loop_5++)
					    {
					        u_xlat6.y = float((-u_xlati_loop_5));
					        u_xlat10_5 = u_xlat10_4;
					        u_xlati24 = int(0xFFFFFFFFu);
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb33 = !!(1<u_xlati24);
					#else
					            u_xlatb33 = 1<u_xlati24;
					#endif
					            if(u_xlatb33){break;}
					            u_xlati33 = (-u_xlati24) + int(0xFFFFFFFFu);
					            u_xlat6.x = float(u_xlati33);
					            u_xlat6.xw = vs_TEXCOORD0.xy * _ScreenResolution.xy + u_xlat6.xy;
					            u_xlat6.xw = u_xlat6.xw / _ScreenResolution.xy;
					            u_xlat10_7 = textureLod(_MainTex, u_xlat6.xw, 0.0);
					            u_xlat16_5 = u_xlat10_5 + u_xlat10_7;
					            u_xlati24 = u_xlati24 + 1;
					            u_xlat10_5 = u_xlat16_5;
					        }
					        u_xlat10_4 = u_xlat10_5;
					    }
					    u_xlat10_4 = u_xlat10_4 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112);
					    u_xlat16_3 = u_xlat10_3 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112) + (-u_xlat10_4);
					    u_xlat16_2 = abs(u_xlat16_2) + abs(u_xlat16_3);
					    u_xlat10_2 = u_xlat16_2 * vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat28 = _EdgeSize + 0.0500000007;
					    u_xlat10_8 = dot(u_xlat10_2, u_xlat10_2);
					    u_xlat10_8 = sqrt(u_xlat10_8);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb28 = !!(u_xlat28<u_xlat10_8);
					#else
					    u_xlatb28 = u_xlat28<u_xlat10_8;
					#endif
					    u_xlat10_0.xyz = (bool(u_xlatb28)) ? vec3(0.0, 0.0, 0.0) : u_xlat1.xyz;
					    SV_Target0 = u_xlat10_0;
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
					uniform 	float _EdgeSize;
					uniform 	float _ColorLevel;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					lowp vec4 u_xlat10_0;
					vec3 u_xlat1;
					int u_xlati1;
					vec2 u_xlat2;
					mediump vec4 u_xlat16_2;
					lowp vec4 u_xlat10_2;
					mediump vec4 u_xlat16_3;
					lowp vec4 u_xlat10_3;
					vec4 u_xlat4;
					lowp vec4 u_xlat10_4;
					int u_xlati4;
					bool u_xlatb4;
					mediump vec4 u_xlat16_5;
					lowp vec4 u_xlat10_5;
					vec4 u_xlat6;
					lowp vec4 u_xlat10_6;
					bool u_xlatb6;
					lowp vec4 u_xlat10_7;
					lowp float u_xlat10_8;
					int u_xlati10;
					bool u_xlatb10;
					vec2 u_xlat19;
					bool u_xlatb19;
					int u_xlati22;
					int u_xlati24;
					float u_xlat28;
					int u_xlati28;
					bool u_xlatb28;
					int u_xlati31;
					bool u_xlatb31;
					int u_xlati33;
					bool u_xlatb33;
					void main()
					{
					    u_xlat10_0.x = float(0.0);
					    u_xlat10_0.y = float(0.0);
					    u_xlat10_0.z = float(0.0);
					    u_xlat10_0.w = float(0.0);
					    for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
					    {
					        u_xlat2.y = float((-u_xlati_loop_1));
					        u_xlat10_3 = u_xlat10_0.yzwx;
					        u_xlati10 = int(0xFFFFFFFFu);
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb19 = !!(1<u_xlati10);
					#else
					            u_xlatb19 = 1<u_xlati10;
					#endif
					            if(u_xlatb19){break;}
					            u_xlat2.x = float((-u_xlati10));
					            u_xlat19.xy = vs_TEXCOORD0.xy * _ScreenResolution.xy + u_xlat2.xy;
					            u_xlat19.xy = u_xlat19.xy / _ScreenResolution.xy;
					            u_xlat10_4 = textureLod(_MainTex, u_xlat19.xy, 0.0);
					            u_xlat16_3 = u_xlat10_3 + u_xlat10_4;
					            u_xlati10 = u_xlati10 + 1;
					            u_xlat10_3 = u_xlat16_3;
					        }
					        u_xlat10_0 = u_xlat10_3.wxyz;
					    }
					    u_xlat10_0 = u_xlat10_0.yzwx * vec4(0.777777791, 0.777777791, 0.777777791, 0.111111112);
					    u_xlat10_3.xyz = floor(u_xlat10_0.xyz);
					    u_xlat1.xyz = u_xlat10_3.xyz / vec3(vec3(_ColorLevel, _ColorLevel, _ColorLevel));
					    u_xlat10_2.x = float(0.0);
					    u_xlat10_2.y = float(0.0);
					    u_xlat10_2.z = float(0.0);
					    u_xlat10_2.w = float(0.0);
					    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
					    {
					        u_xlati4 = (-u_xlati_loop_2) + 1;
					        u_xlat4.y = float(u_xlati4);
					        u_xlat10_3 = u_xlat10_2;
					        u_xlati22 = int(0xFFFFFFFFu);
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb31 = !!(1<u_xlati22);
					#else
					            u_xlatb31 = 1<u_xlati22;
					#endif
					            if(u_xlatb31){break;}
					            u_xlat4.x = float((-u_xlati22));
					            u_xlat4.xw = vs_TEXCOORD0.xy * _ScreenResolution.xy + u_xlat4.xy;
					            u_xlat4.xw = u_xlat4.xw / _ScreenResolution.xy;
					            u_xlat10_5 = textureLod(_MainTex, u_xlat4.xw, 0.0);
					            u_xlat16_3 = u_xlat10_3 + u_xlat10_5;
					            u_xlati22 = u_xlati22 + 1;
					            u_xlat10_3 = u_xlat16_3;
					        }
					        u_xlat10_2 = u_xlat10_3;
					    }
					    u_xlat10_3.x = float(0.0);
					    u_xlat10_3.y = float(0.0);
					    u_xlat10_3.z = float(0.0);
					    u_xlat10_3.w = float(0.0);
					    for(int u_xlati_loop_3 = int(0xFFFFFFFFu) ; u_xlati_loop_3<=1 ; u_xlati_loop_3++)
					    {
					        u_xlati4 = (-u_xlati_loop_3) + int(0xFFFFFFFFu);
					        u_xlat4.y = float(u_xlati4);
					        u_xlat10_5 = u_xlat10_3;
					        u_xlati22 = int(0xFFFFFFFFu);
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb31 = !!(1<u_xlati22);
					#else
					            u_xlatb31 = 1<u_xlati22;
					#endif
					            if(u_xlatb31){break;}
					            u_xlat4.x = float((-u_xlati22));
					            u_xlat4.xw = vs_TEXCOORD0.xy * _ScreenResolution.xy + u_xlat4.xy;
					            u_xlat4.xw = u_xlat4.xw / _ScreenResolution.xy;
					            u_xlat10_6 = textureLod(_MainTex, u_xlat4.xw, 0.0);
					            u_xlat16_5 = u_xlat10_5 + u_xlat10_6;
					            u_xlati22 = u_xlati22 + 1;
					            u_xlat10_5 = u_xlat16_5;
					        }
					        u_xlat10_3 = u_xlat10_5;
					    }
					    u_xlat10_3 = u_xlat10_3 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112);
					    u_xlat16_2 = u_xlat10_2 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112) + (-u_xlat10_3);
					    u_xlat10_3.x = float(0.0);
					    u_xlat10_3.y = float(0.0);
					    u_xlat10_3.z = float(0.0);
					    u_xlat10_3.w = float(0.0);
					    for(int u_xlati_loop_4 = int(0xFFFFFFFFu) ; u_xlati_loop_4<=1 ; u_xlati_loop_4++)
					    {
					        u_xlat4.y = float((-u_xlati_loop_4));
					        u_xlat10_5 = u_xlat10_3;
					        u_xlati22 = int(0xFFFFFFFFu);
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb31 = !!(1<u_xlati22);
					#else
					            u_xlatb31 = 1<u_xlati22;
					#endif
					            if(u_xlatb31){break;}
					            u_xlati31 = (-u_xlati22) + 1;
					            u_xlat4.x = float(u_xlati31);
					            u_xlat4.xw = vs_TEXCOORD0.xy * _ScreenResolution.xy + u_xlat4.xy;
					            u_xlat4.xw = u_xlat4.xw / _ScreenResolution.xy;
					            u_xlat10_6 = textureLod(_MainTex, u_xlat4.xw, 0.0);
					            u_xlat16_5 = u_xlat10_5 + u_xlat10_6;
					            u_xlati22 = u_xlati22 + 1;
					            u_xlat10_5 = u_xlat16_5;
					        }
					        u_xlat10_3 = u_xlat10_5;
					    }
					    u_xlat10_4.x = float(0.0);
					    u_xlat10_4.y = float(0.0);
					    u_xlat10_4.z = float(0.0);
					    u_xlat10_4.w = float(0.0);
					    for(int u_xlati_loop_5 = int(0xFFFFFFFFu) ; u_xlati_loop_5<=1 ; u_xlati_loop_5++)
					    {
					        u_xlat6.y = float((-u_xlati_loop_5));
					        u_xlat10_5 = u_xlat10_4;
					        u_xlati24 = int(0xFFFFFFFFu);
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb33 = !!(1<u_xlati24);
					#else
					            u_xlatb33 = 1<u_xlati24;
					#endif
					            if(u_xlatb33){break;}
					            u_xlati33 = (-u_xlati24) + int(0xFFFFFFFFu);
					            u_xlat6.x = float(u_xlati33);
					            u_xlat6.xw = vs_TEXCOORD0.xy * _ScreenResolution.xy + u_xlat6.xy;
					            u_xlat6.xw = u_xlat6.xw / _ScreenResolution.xy;
					            u_xlat10_7 = textureLod(_MainTex, u_xlat6.xw, 0.0);
					            u_xlat16_5 = u_xlat10_5 + u_xlat10_7;
					            u_xlati24 = u_xlati24 + 1;
					            u_xlat10_5 = u_xlat16_5;
					        }
					        u_xlat10_4 = u_xlat10_5;
					    }
					    u_xlat10_4 = u_xlat10_4 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112);
					    u_xlat16_3 = u_xlat10_3 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112) + (-u_xlat10_4);
					    u_xlat16_2 = abs(u_xlat16_2) + abs(u_xlat16_3);
					    u_xlat10_2 = u_xlat16_2 * vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat28 = _EdgeSize + 0.0500000007;
					    u_xlat10_8 = dot(u_xlat10_2, u_xlat10_2);
					    u_xlat10_8 = sqrt(u_xlat10_8);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb28 = !!(u_xlat28<u_xlat10_8);
					#else
					    u_xlatb28 = u_xlat28<u_xlat10_8;
					#endif
					    u_xlat10_0.xyz = (bool(u_xlatb28)) ? vec3(0.0, 0.0, 0.0) : u_xlat1.xyz;
					    SV_Target0 = u_xlat10_0;
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