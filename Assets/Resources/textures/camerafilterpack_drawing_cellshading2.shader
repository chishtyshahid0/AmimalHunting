Shader "CameraFilterPack/Drawing_CellShading2" {
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
			GpuProgramID 5162
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
					uniform highp float _Distortion;
					uniform highp vec4 _ScreenResolution;
					uniform highp float _EdgeSize;
					uniform highp float _ColorLevel;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  mediump vec2 tmpvar_2;
					  tmpvar_2 = xlv_TEXCOORD0;
					  lowp vec4 sum_3;
					  lowp vec4 color_4;
					  lowp vec4 rgbx_5;
					  highp float Z_7;
					  highp vec3 final_colour_8;
					  highp float kernel_9[6];
					  final_colour_8 = vec3(0.0, 0.0, 0.0);
					  kernel_9[0] = 0.0;
					  kernel_9[1] = 0.0;
					  kernel_9[2] = 0.0;
					  kernel_9[3] = 0.0;
					  kernel_9[4] = 0.0;
					  kernel_9[5] = 0.0;
					  kernel_9[2] = 0.4;
					  kernel_9[2] = 0.4;
					  kernel_9[(2 - 1)] = 0.4;
					  kernel_9[(2 + 1)] = 0.4;
					  kernel_9[(2 - 2)] = 0.4;
					  kernel_9[(2 + 2)] = 0.4;
					  Z_7 = kernel_9[0];
					  Z_7 = (Z_7 + kernel_9[1]);
					  Z_7 = (Z_7 + kernel_9[2]);
					  Z_7 = (Z_7 + kernel_9[3]);
					  Z_7 = (Z_7 + kernel_9[4]);
					  Z_7 = (Z_7 + kernel_9[5]);
					  for (highp int u_6 = -2; u_6 <= 2; u_6++) {
					    highp vec2 tmpvar_10;
					    tmpvar_10.x = ((float(u_6) * _Distortion) * 2.0);
					    tmpvar_10.y = (-4.0 * _Distortion);
					    highp vec4 tmpvar_11;
					    tmpvar_11.zw = vec2(0.0, 0.0);
					    tmpvar_11.xy = (((tmpvar_2 * _ScreenResolution.xy) + tmpvar_10) / _ScreenResolution.xy);
					    lowp vec4 tmpvar_12;
					    tmpvar_12 = impl_low_texture2DLodEXT (_MainTex, tmpvar_11.xy, 0.0);
					    final_colour_8 = (final_colour_8 + ((kernel_9[0] * kernel_9[
					      (2 + u_6)
					    ]) * tmpvar_12.xyz));
					    highp vec2 tmpvar_13;
					    tmpvar_13.x = ((float(u_6) * _Distortion) * 2.0);
					    tmpvar_13.y = (-(_Distortion) * 2.0);
					    highp vec4 tmpvar_14;
					    tmpvar_14.zw = vec2(0.0, 0.0);
					    tmpvar_14.xy = (((tmpvar_2 * _ScreenResolution.xy) + tmpvar_13) / _ScreenResolution.xy);
					    lowp vec4 tmpvar_15;
					    tmpvar_15 = impl_low_texture2DLodEXT (_MainTex, tmpvar_14.xy, 0.0);
					    final_colour_8 = (final_colour_8 + ((kernel_9[1] * kernel_9[
					      (2 + u_6)
					    ]) * tmpvar_15.xyz));
					    highp vec2 tmpvar_16;
					    tmpvar_16.x = ((float(u_6) * _Distortion) * 2.0);
					    tmpvar_16.y = 0.0;
					    highp vec4 tmpvar_17;
					    tmpvar_17.zw = vec2(0.0, 0.0);
					    tmpvar_17.xy = (((tmpvar_2 * _ScreenResolution.xy) + tmpvar_16) / _ScreenResolution.xy);
					    lowp vec4 tmpvar_18;
					    tmpvar_18 = impl_low_texture2DLodEXT (_MainTex, tmpvar_17.xy, 0.0);
					    final_colour_8 = (final_colour_8 + ((kernel_9[2] * kernel_9[
					      (2 + u_6)
					    ]) * tmpvar_18.xyz));
					    highp vec2 tmpvar_19;
					    tmpvar_19.x = ((float(u_6) * _Distortion) * 2.0);
					    tmpvar_19.y = (_Distortion * 2.0);
					    highp vec4 tmpvar_20;
					    tmpvar_20.zw = vec2(0.0, 0.0);
					    tmpvar_20.xy = (((tmpvar_2 * _ScreenResolution.xy) + tmpvar_19) / _ScreenResolution.xy);
					    lowp vec4 tmpvar_21;
					    tmpvar_21 = impl_low_texture2DLodEXT (_MainTex, tmpvar_20.xy, 0.0);
					    final_colour_8 = (final_colour_8 + ((kernel_9[3] * kernel_9[
					      (2 + u_6)
					    ]) * tmpvar_21.xyz));
					    highp vec2 tmpvar_22;
					    tmpvar_22.x = ((float(u_6) * _Distortion) * 2.0);
					    tmpvar_22.y = (4.0 * _Distortion);
					    highp vec4 tmpvar_23;
					    tmpvar_23.zw = vec2(0.0, 0.0);
					    tmpvar_23.xy = (((tmpvar_2 * _ScreenResolution.xy) + tmpvar_22) / _ScreenResolution.xy);
					    lowp vec4 tmpvar_24;
					    tmpvar_24 = impl_low_texture2DLodEXT (_MainTex, tmpvar_23.xy, 0.0);
					    final_colour_8 = (final_colour_8 + ((kernel_9[4] * kernel_9[
					      (2 + u_6)
					    ]) * tmpvar_24.xyz));
					  };
					  highp vec4 tmpvar_25;
					  tmpvar_25.w = 1.0;
					  tmpvar_25.xyz = (final_colour_8 / (Z_7 * Z_7));
					  rgbx_5 = tmpvar_25;
					  highp vec4 tmpvar_26;
					  tmpvar_26.zw = vec2(0.0, 0.0);
					  highp vec2 tmpvar_27;
					  tmpvar_27 = (xlv_TEXCOORD0 * _ScreenResolution.xy);
					  tmpvar_26.xy = ((tmpvar_27 + vec2(1.0, 1.0)) / _ScreenResolution.xy);
					  color_4 = impl_low_texture2DLodEXT (_MainTex, tmpvar_26.xy, 0.0);
					  highp vec4 tmpvar_28;
					  tmpvar_28.zw = vec2(0.0, 0.0);
					  tmpvar_28.xy = ((tmpvar_27 + vec2(0.0, 1.0)) / _ScreenResolution.xy);
					  color_4 = (color_4 + impl_low_texture2DLodEXT (_MainTex, tmpvar_28.xy, 0.0));
					  highp vec4 tmpvar_29;
					  tmpvar_29.zw = vec2(0.0, 0.0);
					  tmpvar_29.xy = ((tmpvar_27 + vec2(-1.0, 1.0)) / _ScreenResolution.xy);
					  color_4 = (color_4 + impl_low_texture2DLodEXT (_MainTex, tmpvar_29.xy, 0.0));
					  highp vec4 tmpvar_30;
					  tmpvar_30.zw = vec2(0.0, 0.0);
					  tmpvar_30.xy = ((tmpvar_27 + vec2(1.0, 0.0)) / _ScreenResolution.xy);
					  color_4 = (color_4 + impl_low_texture2DLodEXT (_MainTex, tmpvar_30.xy, 0.0));
					  highp vec4 tmpvar_31;
					  tmpvar_31.zw = vec2(0.0, 0.0);
					  tmpvar_31.xy = (tmpvar_27 / _ScreenResolution.xy);
					  color_4 = (color_4 + impl_low_texture2DLodEXT (_MainTex, tmpvar_31.xy, 0.0));
					  highp vec4 tmpvar_32;
					  tmpvar_32.zw = vec2(0.0, 0.0);
					  tmpvar_32.xy = ((tmpvar_27 + vec2(-1.0, 0.0)) / _ScreenResolution.xy);
					  color_4 = (color_4 + impl_low_texture2DLodEXT (_MainTex, tmpvar_32.xy, 0.0));
					  highp vec4 tmpvar_33;
					  tmpvar_33.zw = vec2(0.0, 0.0);
					  tmpvar_33.xy = ((tmpvar_27 + vec2(1.0, -1.0)) / _ScreenResolution.xy);
					  color_4 = (color_4 + impl_low_texture2DLodEXT (_MainTex, tmpvar_33.xy, 0.0));
					  highp vec4 tmpvar_34;
					  tmpvar_34.zw = vec2(0.0, 0.0);
					  tmpvar_34.xy = ((tmpvar_27 + vec2(0.0, -1.0)) / _ScreenResolution.xy);
					  color_4 = (color_4 + impl_low_texture2DLodEXT (_MainTex, tmpvar_34.xy, 0.0));
					  highp vec4 tmpvar_35;
					  tmpvar_35.zw = vec2(0.0, 0.0);
					  tmpvar_35.xy = ((tmpvar_27 + vec2(-1.0, -1.0)) / _ScreenResolution.xy);
					  color_4 = (color_4 + impl_low_texture2DLodEXT (_MainTex, tmpvar_35.xy, 0.0));
					  color_4 = (color_4 / 9.0);
					  color_4 = (floor((7.0 * color_4)) / _ColorLevel);
					  highp vec4 tmpvar_36;
					  lowp vec4 color_37;
					  highp vec4 tmpvar_38;
					  tmpvar_38.zw = vec2(0.0, 0.0);
					  tmpvar_38.xy = ((tmpvar_27 + vec2(1.0, 2.0)) / _ScreenResolution.xy);
					  color_37 = impl_low_texture2DLodEXT (_MainTex, tmpvar_38.xy, 0.0);
					  highp vec4 tmpvar_39;
					  tmpvar_39.zw = vec2(0.0, 0.0);
					  tmpvar_39.xy = ((tmpvar_27 + vec2(0.0, 2.0)) / _ScreenResolution.xy);
					  color_37 = (color_37 + impl_low_texture2DLodEXT (_MainTex, tmpvar_39.xy, 0.0));
					  highp vec4 tmpvar_40;
					  tmpvar_40.zw = vec2(0.0, 0.0);
					  tmpvar_40.xy = ((tmpvar_27 + vec2(-1.0, 2.0)) / _ScreenResolution.xy);
					  color_37 = (color_37 + impl_low_texture2DLodEXT (_MainTex, tmpvar_40.xy, 0.0));
					  highp vec4 tmpvar_41;
					  tmpvar_41.zw = vec2(0.0, 0.0);
					  tmpvar_41.xy = ((tmpvar_27 + vec2(1.0, 1.0)) / _ScreenResolution.xy);
					  color_37 = (color_37 + impl_low_texture2DLodEXT (_MainTex, tmpvar_41.xy, 0.0));
					  highp vec4 tmpvar_42;
					  tmpvar_42.zw = vec2(0.0, 0.0);
					  tmpvar_42.xy = ((tmpvar_27 + vec2(0.0, 1.0)) / _ScreenResolution.xy);
					  color_37 = (color_37 + impl_low_texture2DLodEXT (_MainTex, tmpvar_42.xy, 0.0));
					  highp vec4 tmpvar_43;
					  tmpvar_43.zw = vec2(0.0, 0.0);
					  tmpvar_43.xy = ((tmpvar_27 + vec2(-1.0, 1.0)) / _ScreenResolution.xy);
					  color_37 = (color_37 + impl_low_texture2DLodEXT (_MainTex, tmpvar_43.xy, 0.0));
					  highp vec4 tmpvar_44;
					  tmpvar_44.zw = vec2(0.0, 0.0);
					  tmpvar_44.xy = ((tmpvar_27 + vec2(1.0, 0.0)) / _ScreenResolution.xy);
					  color_37 = (color_37 + impl_low_texture2DLodEXT (_MainTex, tmpvar_44.xy, 0.0));
					  highp vec4 tmpvar_45;
					  tmpvar_45.zw = vec2(0.0, 0.0);
					  tmpvar_45.xy = (tmpvar_27 / _ScreenResolution.xy);
					  color_37 = (color_37 + impl_low_texture2DLodEXT (_MainTex, tmpvar_45.xy, 0.0));
					  highp vec4 tmpvar_46;
					  tmpvar_46.zw = vec2(0.0, 0.0);
					  tmpvar_46.xy = ((tmpvar_27 + vec2(-1.0, 0.0)) / _ScreenResolution.xy);
					  color_37 = (color_37 + impl_low_texture2DLodEXT (_MainTex, tmpvar_46.xy, 0.0));
					  tmpvar_36 = (color_37 / 9.0);
					  highp vec4 tmpvar_47;
					  lowp vec4 color_48;
					  highp vec4 tmpvar_49;
					  tmpvar_49.zw = vec2(0.0, 0.0);
					  tmpvar_49.xy = ((tmpvar_27 + vec2(1.0, 0.0)) / _ScreenResolution.xy);
					  color_48 = impl_low_texture2DLodEXT (_MainTex, tmpvar_49.xy, 0.0);
					  highp vec4 tmpvar_50;
					  tmpvar_50.zw = vec2(0.0, 0.0);
					  tmpvar_50.xy = (tmpvar_27 / _ScreenResolution.xy);
					  color_48 = (color_48 + impl_low_texture2DLodEXT (_MainTex, tmpvar_50.xy, 0.0));
					  highp vec4 tmpvar_51;
					  tmpvar_51.zw = vec2(0.0, 0.0);
					  tmpvar_51.xy = ((tmpvar_27 + vec2(-1.0, 0.0)) / _ScreenResolution.xy);
					  color_48 = (color_48 + impl_low_texture2DLodEXT (_MainTex, tmpvar_51.xy, 0.0));
					  highp vec4 tmpvar_52;
					  tmpvar_52.zw = vec2(0.0, 0.0);
					  tmpvar_52.xy = ((tmpvar_27 + vec2(1.0, -1.0)) / _ScreenResolution.xy);
					  color_48 = (color_48 + impl_low_texture2DLodEXT (_MainTex, tmpvar_52.xy, 0.0));
					  highp vec4 tmpvar_53;
					  tmpvar_53.zw = vec2(0.0, 0.0);
					  tmpvar_53.xy = ((tmpvar_27 + vec2(0.0, -1.0)) / _ScreenResolution.xy);
					  color_48 = (color_48 + impl_low_texture2DLodEXT (_MainTex, tmpvar_53.xy, 0.0));
					  highp vec4 tmpvar_54;
					  tmpvar_54.zw = vec2(0.0, 0.0);
					  tmpvar_54.xy = ((tmpvar_27 + vec2(-1.0, -1.0)) / _ScreenResolution.xy);
					  color_48 = (color_48 + impl_low_texture2DLodEXT (_MainTex, tmpvar_54.xy, 0.0));
					  highp vec4 tmpvar_55;
					  tmpvar_55.zw = vec2(0.0, 0.0);
					  tmpvar_55.xy = ((tmpvar_27 + vec2(1.0, -2.0)) / _ScreenResolution.xy);
					  color_48 = (color_48 + impl_low_texture2DLodEXT (_MainTex, tmpvar_55.xy, 0.0));
					  highp vec4 tmpvar_56;
					  tmpvar_56.zw = vec2(0.0, 0.0);
					  tmpvar_56.xy = ((tmpvar_27 + vec2(0.0, -2.0)) / _ScreenResolution.xy);
					  color_48 = (color_48 + impl_low_texture2DLodEXT (_MainTex, tmpvar_56.xy, 0.0));
					  highp vec4 tmpvar_57;
					  tmpvar_57.zw = vec2(0.0, 0.0);
					  tmpvar_57.xy = ((tmpvar_27 + vec2(-1.0, -2.0)) / _ScreenResolution.xy);
					  color_48 = (color_48 + impl_low_texture2DLodEXT (_MainTex, tmpvar_57.xy, 0.0));
					  tmpvar_47 = (color_48 / 9.0);
					  highp vec4 tmpvar_58;
					  tmpvar_58 = abs((tmpvar_36 - tmpvar_47));
					  sum_3 = tmpvar_58;
					  highp vec4 tmpvar_59;
					  lowp vec4 color_60;
					  highp vec4 tmpvar_61;
					  tmpvar_61.zw = vec2(0.0, 0.0);
					  tmpvar_61.xy = ((tmpvar_27 + vec2(2.0, 1.0)) / _ScreenResolution.xy);
					  color_60 = impl_low_texture2DLodEXT (_MainTex, tmpvar_61.xy, 0.0);
					  highp vec4 tmpvar_62;
					  tmpvar_62.zw = vec2(0.0, 0.0);
					  tmpvar_62.xy = ((tmpvar_27 + vec2(1.0, 1.0)) / _ScreenResolution.xy);
					  color_60 = (color_60 + impl_low_texture2DLodEXT (_MainTex, tmpvar_62.xy, 0.0));
					  highp vec4 tmpvar_63;
					  tmpvar_63.zw = vec2(0.0, 0.0);
					  tmpvar_63.xy = ((tmpvar_27 + vec2(0.0, 1.0)) / _ScreenResolution.xy);
					  color_60 = (color_60 + impl_low_texture2DLodEXT (_MainTex, tmpvar_63.xy, 0.0));
					  highp vec4 tmpvar_64;
					  tmpvar_64.zw = vec2(0.0, 0.0);
					  tmpvar_64.xy = ((tmpvar_27 + vec2(2.0, 0.0)) / _ScreenResolution.xy);
					  color_60 = (color_60 + impl_low_texture2DLodEXT (_MainTex, tmpvar_64.xy, 0.0));
					  highp vec4 tmpvar_65;
					  tmpvar_65.zw = vec2(0.0, 0.0);
					  tmpvar_65.xy = ((tmpvar_27 + vec2(1.0, 0.0)) / _ScreenResolution.xy);
					  color_60 = (color_60 + impl_low_texture2DLodEXT (_MainTex, tmpvar_65.xy, 0.0));
					  highp vec4 tmpvar_66;
					  tmpvar_66.zw = vec2(0.0, 0.0);
					  tmpvar_66.xy = (tmpvar_27 / _ScreenResolution.xy);
					  color_60 = (color_60 + impl_low_texture2DLodEXT (_MainTex, tmpvar_66.xy, 0.0));
					  highp vec4 tmpvar_67;
					  tmpvar_67.zw = vec2(0.0, 0.0);
					  tmpvar_67.xy = ((tmpvar_27 + vec2(2.0, -1.0)) / _ScreenResolution.xy);
					  color_60 = (color_60 + impl_low_texture2DLodEXT (_MainTex, tmpvar_67.xy, 0.0));
					  highp vec4 tmpvar_68;
					  tmpvar_68.zw = vec2(0.0, 0.0);
					  tmpvar_68.xy = ((tmpvar_27 + vec2(1.0, -1.0)) / _ScreenResolution.xy);
					  color_60 = (color_60 + impl_low_texture2DLodEXT (_MainTex, tmpvar_68.xy, 0.0));
					  highp vec4 tmpvar_69;
					  tmpvar_69.zw = vec2(0.0, 0.0);
					  tmpvar_69.xy = ((tmpvar_27 + vec2(0.0, -1.0)) / _ScreenResolution.xy);
					  color_60 = (color_60 + impl_low_texture2DLodEXT (_MainTex, tmpvar_69.xy, 0.0));
					  tmpvar_59 = (color_60 / 9.0);
					  highp vec4 tmpvar_70;
					  lowp vec4 color_71;
					  highp vec4 tmpvar_72;
					  tmpvar_72.zw = vec2(0.0, 0.0);
					  tmpvar_72.xy = ((tmpvar_27 + vec2(0.0, 1.0)) / _ScreenResolution.xy);
					  color_71 = impl_low_texture2DLodEXT (_MainTex, tmpvar_72.xy, 0.0);
					  highp vec4 tmpvar_73;
					  tmpvar_73.zw = vec2(0.0, 0.0);
					  tmpvar_73.xy = ((tmpvar_27 + vec2(-1.0, 1.0)) / _ScreenResolution.xy);
					  color_71 = (color_71 + impl_low_texture2DLodEXT (_MainTex, tmpvar_73.xy, 0.0));
					  highp vec4 tmpvar_74;
					  tmpvar_74.zw = vec2(0.0, 0.0);
					  tmpvar_74.xy = ((tmpvar_27 + vec2(-2.0, 1.0)) / _ScreenResolution.xy);
					  color_71 = (color_71 + impl_low_texture2DLodEXT (_MainTex, tmpvar_74.xy, 0.0));
					  highp vec4 tmpvar_75;
					  tmpvar_75.zw = vec2(0.0, 0.0);
					  tmpvar_75.xy = (tmpvar_27 / _ScreenResolution.xy);
					  color_71 = (color_71 + impl_low_texture2DLodEXT (_MainTex, tmpvar_75.xy, 0.0));
					  highp vec4 tmpvar_76;
					  tmpvar_76.zw = vec2(0.0, 0.0);
					  tmpvar_76.xy = ((tmpvar_27 + vec2(-1.0, 0.0)) / _ScreenResolution.xy);
					  color_71 = (color_71 + impl_low_texture2DLodEXT (_MainTex, tmpvar_76.xy, 0.0));
					  highp vec4 tmpvar_77;
					  tmpvar_77.zw = vec2(0.0, 0.0);
					  tmpvar_77.xy = ((tmpvar_27 + vec2(-2.0, 0.0)) / _ScreenResolution.xy);
					  color_71 = (color_71 + impl_low_texture2DLodEXT (_MainTex, tmpvar_77.xy, 0.0));
					  highp vec4 tmpvar_78;
					  tmpvar_78.zw = vec2(0.0, 0.0);
					  tmpvar_78.xy = ((tmpvar_27 + vec2(0.0, -1.0)) / _ScreenResolution.xy);
					  color_71 = (color_71 + impl_low_texture2DLodEXT (_MainTex, tmpvar_78.xy, 0.0));
					  highp vec4 tmpvar_79;
					  tmpvar_79.zw = vec2(0.0, 0.0);
					  tmpvar_79.xy = ((tmpvar_27 + vec2(-1.0, -1.0)) / _ScreenResolution.xy);
					  color_71 = (color_71 + impl_low_texture2DLodEXT (_MainTex, tmpvar_79.xy, 0.0));
					  highp vec4 tmpvar_80;
					  tmpvar_80.zw = vec2(0.0, 0.0);
					  tmpvar_80.xy = ((tmpvar_27 + vec2(-2.0, -1.0)) / _ScreenResolution.xy);
					  color_71 = (color_71 + impl_low_texture2DLodEXT (_MainTex, tmpvar_80.xy, 0.0));
					  tmpvar_70 = (color_71 / 9.0);
					  highp vec4 tmpvar_81;
					  tmpvar_81 = abs((tmpvar_59 - tmpvar_70));
					  sum_3 = (sum_3 + tmpvar_81);
					  sum_3 = (sum_3 / 2.0);
					  highp vec4 tmpvar_82;
					  lowp vec4 y_83;
					  y_83 = (rgbx_5 * 2.0);
					  tmpvar_82 = mix (color_4, y_83, vec4(_Distortion));
					  color_4 = tmpvar_82;
					  highp float tmpvar_84;
					  tmpvar_84 = (_EdgeSize + 0.05);
					  lowp float tmpvar_85;
					  tmpvar_85 = sqrt(dot (sum_3, sum_3));
					  if ((tmpvar_85 > tmpvar_84)) {
					    color_4.xyz = vec3(0.0, 0.0, 0.0);
					  };
					  tmpvar_1 = color_4;
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
					uniform highp float _Distortion;
					uniform highp vec4 _ScreenResolution;
					uniform highp float _EdgeSize;
					uniform highp float _ColorLevel;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  mediump vec2 tmpvar_2;
					  tmpvar_2 = xlv_TEXCOORD0;
					  lowp vec4 sum_3;
					  lowp vec4 color_4;
					  lowp vec4 rgbx_5;
					  highp float Z_7;
					  highp vec3 final_colour_8;
					  highp float kernel_9[6];
					  final_colour_8 = vec3(0.0, 0.0, 0.0);
					  kernel_9[0] = 0.0;
					  kernel_9[1] = 0.0;
					  kernel_9[2] = 0.0;
					  kernel_9[3] = 0.0;
					  kernel_9[4] = 0.0;
					  kernel_9[5] = 0.0;
					  kernel_9[2] = 0.4;
					  kernel_9[2] = 0.4;
					  kernel_9[(2 - 1)] = 0.4;
					  kernel_9[(2 + 1)] = 0.4;
					  kernel_9[(2 - 2)] = 0.4;
					  kernel_9[(2 + 2)] = 0.4;
					  Z_7 = kernel_9[0];
					  Z_7 = (Z_7 + kernel_9[1]);
					  Z_7 = (Z_7 + kernel_9[2]);
					  Z_7 = (Z_7 + kernel_9[3]);
					  Z_7 = (Z_7 + kernel_9[4]);
					  Z_7 = (Z_7 + kernel_9[5]);
					  for (highp int u_6 = -2; u_6 <= 2; u_6++) {
					    highp vec2 tmpvar_10;
					    tmpvar_10.x = ((float(u_6) * _Distortion) * 2.0);
					    tmpvar_10.y = (-4.0 * _Distortion);
					    highp vec4 tmpvar_11;
					    tmpvar_11.zw = vec2(0.0, 0.0);
					    tmpvar_11.xy = (((tmpvar_2 * _ScreenResolution.xy) + tmpvar_10) / _ScreenResolution.xy);
					    lowp vec4 tmpvar_12;
					    tmpvar_12 = impl_low_texture2DLodEXT (_MainTex, tmpvar_11.xy, 0.0);
					    final_colour_8 = (final_colour_8 + ((kernel_9[0] * kernel_9[
					      (2 + u_6)
					    ]) * tmpvar_12.xyz));
					    highp vec2 tmpvar_13;
					    tmpvar_13.x = ((float(u_6) * _Distortion) * 2.0);
					    tmpvar_13.y = (-(_Distortion) * 2.0);
					    highp vec4 tmpvar_14;
					    tmpvar_14.zw = vec2(0.0, 0.0);
					    tmpvar_14.xy = (((tmpvar_2 * _ScreenResolution.xy) + tmpvar_13) / _ScreenResolution.xy);
					    lowp vec4 tmpvar_15;
					    tmpvar_15 = impl_low_texture2DLodEXT (_MainTex, tmpvar_14.xy, 0.0);
					    final_colour_8 = (final_colour_8 + ((kernel_9[1] * kernel_9[
					      (2 + u_6)
					    ]) * tmpvar_15.xyz));
					    highp vec2 tmpvar_16;
					    tmpvar_16.x = ((float(u_6) * _Distortion) * 2.0);
					    tmpvar_16.y = 0.0;
					    highp vec4 tmpvar_17;
					    tmpvar_17.zw = vec2(0.0, 0.0);
					    tmpvar_17.xy = (((tmpvar_2 * _ScreenResolution.xy) + tmpvar_16) / _ScreenResolution.xy);
					    lowp vec4 tmpvar_18;
					    tmpvar_18 = impl_low_texture2DLodEXT (_MainTex, tmpvar_17.xy, 0.0);
					    final_colour_8 = (final_colour_8 + ((kernel_9[2] * kernel_9[
					      (2 + u_6)
					    ]) * tmpvar_18.xyz));
					    highp vec2 tmpvar_19;
					    tmpvar_19.x = ((float(u_6) * _Distortion) * 2.0);
					    tmpvar_19.y = (_Distortion * 2.0);
					    highp vec4 tmpvar_20;
					    tmpvar_20.zw = vec2(0.0, 0.0);
					    tmpvar_20.xy = (((tmpvar_2 * _ScreenResolution.xy) + tmpvar_19) / _ScreenResolution.xy);
					    lowp vec4 tmpvar_21;
					    tmpvar_21 = impl_low_texture2DLodEXT (_MainTex, tmpvar_20.xy, 0.0);
					    final_colour_8 = (final_colour_8 + ((kernel_9[3] * kernel_9[
					      (2 + u_6)
					    ]) * tmpvar_21.xyz));
					    highp vec2 tmpvar_22;
					    tmpvar_22.x = ((float(u_6) * _Distortion) * 2.0);
					    tmpvar_22.y = (4.0 * _Distortion);
					    highp vec4 tmpvar_23;
					    tmpvar_23.zw = vec2(0.0, 0.0);
					    tmpvar_23.xy = (((tmpvar_2 * _ScreenResolution.xy) + tmpvar_22) / _ScreenResolution.xy);
					    lowp vec4 tmpvar_24;
					    tmpvar_24 = impl_low_texture2DLodEXT (_MainTex, tmpvar_23.xy, 0.0);
					    final_colour_8 = (final_colour_8 + ((kernel_9[4] * kernel_9[
					      (2 + u_6)
					    ]) * tmpvar_24.xyz));
					  };
					  highp vec4 tmpvar_25;
					  tmpvar_25.w = 1.0;
					  tmpvar_25.xyz = (final_colour_8 / (Z_7 * Z_7));
					  rgbx_5 = tmpvar_25;
					  highp vec4 tmpvar_26;
					  tmpvar_26.zw = vec2(0.0, 0.0);
					  highp vec2 tmpvar_27;
					  tmpvar_27 = (xlv_TEXCOORD0 * _ScreenResolution.xy);
					  tmpvar_26.xy = ((tmpvar_27 + vec2(1.0, 1.0)) / _ScreenResolution.xy);
					  color_4 = impl_low_texture2DLodEXT (_MainTex, tmpvar_26.xy, 0.0);
					  highp vec4 tmpvar_28;
					  tmpvar_28.zw = vec2(0.0, 0.0);
					  tmpvar_28.xy = ((tmpvar_27 + vec2(0.0, 1.0)) / _ScreenResolution.xy);
					  color_4 = (color_4 + impl_low_texture2DLodEXT (_MainTex, tmpvar_28.xy, 0.0));
					  highp vec4 tmpvar_29;
					  tmpvar_29.zw = vec2(0.0, 0.0);
					  tmpvar_29.xy = ((tmpvar_27 + vec2(-1.0, 1.0)) / _ScreenResolution.xy);
					  color_4 = (color_4 + impl_low_texture2DLodEXT (_MainTex, tmpvar_29.xy, 0.0));
					  highp vec4 tmpvar_30;
					  tmpvar_30.zw = vec2(0.0, 0.0);
					  tmpvar_30.xy = ((tmpvar_27 + vec2(1.0, 0.0)) / _ScreenResolution.xy);
					  color_4 = (color_4 + impl_low_texture2DLodEXT (_MainTex, tmpvar_30.xy, 0.0));
					  highp vec4 tmpvar_31;
					  tmpvar_31.zw = vec2(0.0, 0.0);
					  tmpvar_31.xy = (tmpvar_27 / _ScreenResolution.xy);
					  color_4 = (color_4 + impl_low_texture2DLodEXT (_MainTex, tmpvar_31.xy, 0.0));
					  highp vec4 tmpvar_32;
					  tmpvar_32.zw = vec2(0.0, 0.0);
					  tmpvar_32.xy = ((tmpvar_27 + vec2(-1.0, 0.0)) / _ScreenResolution.xy);
					  color_4 = (color_4 + impl_low_texture2DLodEXT (_MainTex, tmpvar_32.xy, 0.0));
					  highp vec4 tmpvar_33;
					  tmpvar_33.zw = vec2(0.0, 0.0);
					  tmpvar_33.xy = ((tmpvar_27 + vec2(1.0, -1.0)) / _ScreenResolution.xy);
					  color_4 = (color_4 + impl_low_texture2DLodEXT (_MainTex, tmpvar_33.xy, 0.0));
					  highp vec4 tmpvar_34;
					  tmpvar_34.zw = vec2(0.0, 0.0);
					  tmpvar_34.xy = ((tmpvar_27 + vec2(0.0, -1.0)) / _ScreenResolution.xy);
					  color_4 = (color_4 + impl_low_texture2DLodEXT (_MainTex, tmpvar_34.xy, 0.0));
					  highp vec4 tmpvar_35;
					  tmpvar_35.zw = vec2(0.0, 0.0);
					  tmpvar_35.xy = ((tmpvar_27 + vec2(-1.0, -1.0)) / _ScreenResolution.xy);
					  color_4 = (color_4 + impl_low_texture2DLodEXT (_MainTex, tmpvar_35.xy, 0.0));
					  color_4 = (color_4 / 9.0);
					  color_4 = (floor((7.0 * color_4)) / _ColorLevel);
					  highp vec4 tmpvar_36;
					  lowp vec4 color_37;
					  highp vec4 tmpvar_38;
					  tmpvar_38.zw = vec2(0.0, 0.0);
					  tmpvar_38.xy = ((tmpvar_27 + vec2(1.0, 2.0)) / _ScreenResolution.xy);
					  color_37 = impl_low_texture2DLodEXT (_MainTex, tmpvar_38.xy, 0.0);
					  highp vec4 tmpvar_39;
					  tmpvar_39.zw = vec2(0.0, 0.0);
					  tmpvar_39.xy = ((tmpvar_27 + vec2(0.0, 2.0)) / _ScreenResolution.xy);
					  color_37 = (color_37 + impl_low_texture2DLodEXT (_MainTex, tmpvar_39.xy, 0.0));
					  highp vec4 tmpvar_40;
					  tmpvar_40.zw = vec2(0.0, 0.0);
					  tmpvar_40.xy = ((tmpvar_27 + vec2(-1.0, 2.0)) / _ScreenResolution.xy);
					  color_37 = (color_37 + impl_low_texture2DLodEXT (_MainTex, tmpvar_40.xy, 0.0));
					  highp vec4 tmpvar_41;
					  tmpvar_41.zw = vec2(0.0, 0.0);
					  tmpvar_41.xy = ((tmpvar_27 + vec2(1.0, 1.0)) / _ScreenResolution.xy);
					  color_37 = (color_37 + impl_low_texture2DLodEXT (_MainTex, tmpvar_41.xy, 0.0));
					  highp vec4 tmpvar_42;
					  tmpvar_42.zw = vec2(0.0, 0.0);
					  tmpvar_42.xy = ((tmpvar_27 + vec2(0.0, 1.0)) / _ScreenResolution.xy);
					  color_37 = (color_37 + impl_low_texture2DLodEXT (_MainTex, tmpvar_42.xy, 0.0));
					  highp vec4 tmpvar_43;
					  tmpvar_43.zw = vec2(0.0, 0.0);
					  tmpvar_43.xy = ((tmpvar_27 + vec2(-1.0, 1.0)) / _ScreenResolution.xy);
					  color_37 = (color_37 + impl_low_texture2DLodEXT (_MainTex, tmpvar_43.xy, 0.0));
					  highp vec4 tmpvar_44;
					  tmpvar_44.zw = vec2(0.0, 0.0);
					  tmpvar_44.xy = ((tmpvar_27 + vec2(1.0, 0.0)) / _ScreenResolution.xy);
					  color_37 = (color_37 + impl_low_texture2DLodEXT (_MainTex, tmpvar_44.xy, 0.0));
					  highp vec4 tmpvar_45;
					  tmpvar_45.zw = vec2(0.0, 0.0);
					  tmpvar_45.xy = (tmpvar_27 / _ScreenResolution.xy);
					  color_37 = (color_37 + impl_low_texture2DLodEXT (_MainTex, tmpvar_45.xy, 0.0));
					  highp vec4 tmpvar_46;
					  tmpvar_46.zw = vec2(0.0, 0.0);
					  tmpvar_46.xy = ((tmpvar_27 + vec2(-1.0, 0.0)) / _ScreenResolution.xy);
					  color_37 = (color_37 + impl_low_texture2DLodEXT (_MainTex, tmpvar_46.xy, 0.0));
					  tmpvar_36 = (color_37 / 9.0);
					  highp vec4 tmpvar_47;
					  lowp vec4 color_48;
					  highp vec4 tmpvar_49;
					  tmpvar_49.zw = vec2(0.0, 0.0);
					  tmpvar_49.xy = ((tmpvar_27 + vec2(1.0, 0.0)) / _ScreenResolution.xy);
					  color_48 = impl_low_texture2DLodEXT (_MainTex, tmpvar_49.xy, 0.0);
					  highp vec4 tmpvar_50;
					  tmpvar_50.zw = vec2(0.0, 0.0);
					  tmpvar_50.xy = (tmpvar_27 / _ScreenResolution.xy);
					  color_48 = (color_48 + impl_low_texture2DLodEXT (_MainTex, tmpvar_50.xy, 0.0));
					  highp vec4 tmpvar_51;
					  tmpvar_51.zw = vec2(0.0, 0.0);
					  tmpvar_51.xy = ((tmpvar_27 + vec2(-1.0, 0.0)) / _ScreenResolution.xy);
					  color_48 = (color_48 + impl_low_texture2DLodEXT (_MainTex, tmpvar_51.xy, 0.0));
					  highp vec4 tmpvar_52;
					  tmpvar_52.zw = vec2(0.0, 0.0);
					  tmpvar_52.xy = ((tmpvar_27 + vec2(1.0, -1.0)) / _ScreenResolution.xy);
					  color_48 = (color_48 + impl_low_texture2DLodEXT (_MainTex, tmpvar_52.xy, 0.0));
					  highp vec4 tmpvar_53;
					  tmpvar_53.zw = vec2(0.0, 0.0);
					  tmpvar_53.xy = ((tmpvar_27 + vec2(0.0, -1.0)) / _ScreenResolution.xy);
					  color_48 = (color_48 + impl_low_texture2DLodEXT (_MainTex, tmpvar_53.xy, 0.0));
					  highp vec4 tmpvar_54;
					  tmpvar_54.zw = vec2(0.0, 0.0);
					  tmpvar_54.xy = ((tmpvar_27 + vec2(-1.0, -1.0)) / _ScreenResolution.xy);
					  color_48 = (color_48 + impl_low_texture2DLodEXT (_MainTex, tmpvar_54.xy, 0.0));
					  highp vec4 tmpvar_55;
					  tmpvar_55.zw = vec2(0.0, 0.0);
					  tmpvar_55.xy = ((tmpvar_27 + vec2(1.0, -2.0)) / _ScreenResolution.xy);
					  color_48 = (color_48 + impl_low_texture2DLodEXT (_MainTex, tmpvar_55.xy, 0.0));
					  highp vec4 tmpvar_56;
					  tmpvar_56.zw = vec2(0.0, 0.0);
					  tmpvar_56.xy = ((tmpvar_27 + vec2(0.0, -2.0)) / _ScreenResolution.xy);
					  color_48 = (color_48 + impl_low_texture2DLodEXT (_MainTex, tmpvar_56.xy, 0.0));
					  highp vec4 tmpvar_57;
					  tmpvar_57.zw = vec2(0.0, 0.0);
					  tmpvar_57.xy = ((tmpvar_27 + vec2(-1.0, -2.0)) / _ScreenResolution.xy);
					  color_48 = (color_48 + impl_low_texture2DLodEXT (_MainTex, tmpvar_57.xy, 0.0));
					  tmpvar_47 = (color_48 / 9.0);
					  highp vec4 tmpvar_58;
					  tmpvar_58 = abs((tmpvar_36 - tmpvar_47));
					  sum_3 = tmpvar_58;
					  highp vec4 tmpvar_59;
					  lowp vec4 color_60;
					  highp vec4 tmpvar_61;
					  tmpvar_61.zw = vec2(0.0, 0.0);
					  tmpvar_61.xy = ((tmpvar_27 + vec2(2.0, 1.0)) / _ScreenResolution.xy);
					  color_60 = impl_low_texture2DLodEXT (_MainTex, tmpvar_61.xy, 0.0);
					  highp vec4 tmpvar_62;
					  tmpvar_62.zw = vec2(0.0, 0.0);
					  tmpvar_62.xy = ((tmpvar_27 + vec2(1.0, 1.0)) / _ScreenResolution.xy);
					  color_60 = (color_60 + impl_low_texture2DLodEXT (_MainTex, tmpvar_62.xy, 0.0));
					  highp vec4 tmpvar_63;
					  tmpvar_63.zw = vec2(0.0, 0.0);
					  tmpvar_63.xy = ((tmpvar_27 + vec2(0.0, 1.0)) / _ScreenResolution.xy);
					  color_60 = (color_60 + impl_low_texture2DLodEXT (_MainTex, tmpvar_63.xy, 0.0));
					  highp vec4 tmpvar_64;
					  tmpvar_64.zw = vec2(0.0, 0.0);
					  tmpvar_64.xy = ((tmpvar_27 + vec2(2.0, 0.0)) / _ScreenResolution.xy);
					  color_60 = (color_60 + impl_low_texture2DLodEXT (_MainTex, tmpvar_64.xy, 0.0));
					  highp vec4 tmpvar_65;
					  tmpvar_65.zw = vec2(0.0, 0.0);
					  tmpvar_65.xy = ((tmpvar_27 + vec2(1.0, 0.0)) / _ScreenResolution.xy);
					  color_60 = (color_60 + impl_low_texture2DLodEXT (_MainTex, tmpvar_65.xy, 0.0));
					  highp vec4 tmpvar_66;
					  tmpvar_66.zw = vec2(0.0, 0.0);
					  tmpvar_66.xy = (tmpvar_27 / _ScreenResolution.xy);
					  color_60 = (color_60 + impl_low_texture2DLodEXT (_MainTex, tmpvar_66.xy, 0.0));
					  highp vec4 tmpvar_67;
					  tmpvar_67.zw = vec2(0.0, 0.0);
					  tmpvar_67.xy = ((tmpvar_27 + vec2(2.0, -1.0)) / _ScreenResolution.xy);
					  color_60 = (color_60 + impl_low_texture2DLodEXT (_MainTex, tmpvar_67.xy, 0.0));
					  highp vec4 tmpvar_68;
					  tmpvar_68.zw = vec2(0.0, 0.0);
					  tmpvar_68.xy = ((tmpvar_27 + vec2(1.0, -1.0)) / _ScreenResolution.xy);
					  color_60 = (color_60 + impl_low_texture2DLodEXT (_MainTex, tmpvar_68.xy, 0.0));
					  highp vec4 tmpvar_69;
					  tmpvar_69.zw = vec2(0.0, 0.0);
					  tmpvar_69.xy = ((tmpvar_27 + vec2(0.0, -1.0)) / _ScreenResolution.xy);
					  color_60 = (color_60 + impl_low_texture2DLodEXT (_MainTex, tmpvar_69.xy, 0.0));
					  tmpvar_59 = (color_60 / 9.0);
					  highp vec4 tmpvar_70;
					  lowp vec4 color_71;
					  highp vec4 tmpvar_72;
					  tmpvar_72.zw = vec2(0.0, 0.0);
					  tmpvar_72.xy = ((tmpvar_27 + vec2(0.0, 1.0)) / _ScreenResolution.xy);
					  color_71 = impl_low_texture2DLodEXT (_MainTex, tmpvar_72.xy, 0.0);
					  highp vec4 tmpvar_73;
					  tmpvar_73.zw = vec2(0.0, 0.0);
					  tmpvar_73.xy = ((tmpvar_27 + vec2(-1.0, 1.0)) / _ScreenResolution.xy);
					  color_71 = (color_71 + impl_low_texture2DLodEXT (_MainTex, tmpvar_73.xy, 0.0));
					  highp vec4 tmpvar_74;
					  tmpvar_74.zw = vec2(0.0, 0.0);
					  tmpvar_74.xy = ((tmpvar_27 + vec2(-2.0, 1.0)) / _ScreenResolution.xy);
					  color_71 = (color_71 + impl_low_texture2DLodEXT (_MainTex, tmpvar_74.xy, 0.0));
					  highp vec4 tmpvar_75;
					  tmpvar_75.zw = vec2(0.0, 0.0);
					  tmpvar_75.xy = (tmpvar_27 / _ScreenResolution.xy);
					  color_71 = (color_71 + impl_low_texture2DLodEXT (_MainTex, tmpvar_75.xy, 0.0));
					  highp vec4 tmpvar_76;
					  tmpvar_76.zw = vec2(0.0, 0.0);
					  tmpvar_76.xy = ((tmpvar_27 + vec2(-1.0, 0.0)) / _ScreenResolution.xy);
					  color_71 = (color_71 + impl_low_texture2DLodEXT (_MainTex, tmpvar_76.xy, 0.0));
					  highp vec4 tmpvar_77;
					  tmpvar_77.zw = vec2(0.0, 0.0);
					  tmpvar_77.xy = ((tmpvar_27 + vec2(-2.0, 0.0)) / _ScreenResolution.xy);
					  color_71 = (color_71 + impl_low_texture2DLodEXT (_MainTex, tmpvar_77.xy, 0.0));
					  highp vec4 tmpvar_78;
					  tmpvar_78.zw = vec2(0.0, 0.0);
					  tmpvar_78.xy = ((tmpvar_27 + vec2(0.0, -1.0)) / _ScreenResolution.xy);
					  color_71 = (color_71 + impl_low_texture2DLodEXT (_MainTex, tmpvar_78.xy, 0.0));
					  highp vec4 tmpvar_79;
					  tmpvar_79.zw = vec2(0.0, 0.0);
					  tmpvar_79.xy = ((tmpvar_27 + vec2(-1.0, -1.0)) / _ScreenResolution.xy);
					  color_71 = (color_71 + impl_low_texture2DLodEXT (_MainTex, tmpvar_79.xy, 0.0));
					  highp vec4 tmpvar_80;
					  tmpvar_80.zw = vec2(0.0, 0.0);
					  tmpvar_80.xy = ((tmpvar_27 + vec2(-2.0, -1.0)) / _ScreenResolution.xy);
					  color_71 = (color_71 + impl_low_texture2DLodEXT (_MainTex, tmpvar_80.xy, 0.0));
					  tmpvar_70 = (color_71 / 9.0);
					  highp vec4 tmpvar_81;
					  tmpvar_81 = abs((tmpvar_59 - tmpvar_70));
					  sum_3 = (sum_3 + tmpvar_81);
					  sum_3 = (sum_3 / 2.0);
					  highp vec4 tmpvar_82;
					  lowp vec4 y_83;
					  y_83 = (rgbx_5 * 2.0);
					  tmpvar_82 = mix (color_4, y_83, vec4(_Distortion));
					  color_4 = tmpvar_82;
					  highp float tmpvar_84;
					  tmpvar_84 = (_EdgeSize + 0.05);
					  lowp float tmpvar_85;
					  tmpvar_85 = sqrt(dot (sum_3, sum_3));
					  if ((tmpvar_85 > tmpvar_84)) {
					    color_4.xyz = vec3(0.0, 0.0, 0.0);
					  };
					  tmpvar_1 = color_4;
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
					uniform highp float _Distortion;
					uniform highp vec4 _ScreenResolution;
					uniform highp float _EdgeSize;
					uniform highp float _ColorLevel;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  mediump vec2 tmpvar_2;
					  tmpvar_2 = xlv_TEXCOORD0;
					  lowp vec4 sum_3;
					  lowp vec4 color_4;
					  lowp vec4 rgbx_5;
					  highp float Z_7;
					  highp vec3 final_colour_8;
					  highp float kernel_9[6];
					  final_colour_8 = vec3(0.0, 0.0, 0.0);
					  kernel_9[0] = 0.0;
					  kernel_9[1] = 0.0;
					  kernel_9[2] = 0.0;
					  kernel_9[3] = 0.0;
					  kernel_9[4] = 0.0;
					  kernel_9[5] = 0.0;
					  kernel_9[2] = 0.4;
					  kernel_9[2] = 0.4;
					  kernel_9[(2 - 1)] = 0.4;
					  kernel_9[(2 + 1)] = 0.4;
					  kernel_9[(2 - 2)] = 0.4;
					  kernel_9[(2 + 2)] = 0.4;
					  Z_7 = kernel_9[0];
					  Z_7 = (Z_7 + kernel_9[1]);
					  Z_7 = (Z_7 + kernel_9[2]);
					  Z_7 = (Z_7 + kernel_9[3]);
					  Z_7 = (Z_7 + kernel_9[4]);
					  Z_7 = (Z_7 + kernel_9[5]);
					  for (highp int u_6 = -2; u_6 <= 2; u_6++) {
					    highp vec2 tmpvar_10;
					    tmpvar_10.x = ((float(u_6) * _Distortion) * 2.0);
					    tmpvar_10.y = (-4.0 * _Distortion);
					    highp vec4 tmpvar_11;
					    tmpvar_11.zw = vec2(0.0, 0.0);
					    tmpvar_11.xy = (((tmpvar_2 * _ScreenResolution.xy) + tmpvar_10) / _ScreenResolution.xy);
					    lowp vec4 tmpvar_12;
					    tmpvar_12 = impl_low_texture2DLodEXT (_MainTex, tmpvar_11.xy, 0.0);
					    final_colour_8 = (final_colour_8 + ((kernel_9[0] * kernel_9[
					      (2 + u_6)
					    ]) * tmpvar_12.xyz));
					    highp vec2 tmpvar_13;
					    tmpvar_13.x = ((float(u_6) * _Distortion) * 2.0);
					    tmpvar_13.y = (-(_Distortion) * 2.0);
					    highp vec4 tmpvar_14;
					    tmpvar_14.zw = vec2(0.0, 0.0);
					    tmpvar_14.xy = (((tmpvar_2 * _ScreenResolution.xy) + tmpvar_13) / _ScreenResolution.xy);
					    lowp vec4 tmpvar_15;
					    tmpvar_15 = impl_low_texture2DLodEXT (_MainTex, tmpvar_14.xy, 0.0);
					    final_colour_8 = (final_colour_8 + ((kernel_9[1] * kernel_9[
					      (2 + u_6)
					    ]) * tmpvar_15.xyz));
					    highp vec2 tmpvar_16;
					    tmpvar_16.x = ((float(u_6) * _Distortion) * 2.0);
					    tmpvar_16.y = 0.0;
					    highp vec4 tmpvar_17;
					    tmpvar_17.zw = vec2(0.0, 0.0);
					    tmpvar_17.xy = (((tmpvar_2 * _ScreenResolution.xy) + tmpvar_16) / _ScreenResolution.xy);
					    lowp vec4 tmpvar_18;
					    tmpvar_18 = impl_low_texture2DLodEXT (_MainTex, tmpvar_17.xy, 0.0);
					    final_colour_8 = (final_colour_8 + ((kernel_9[2] * kernel_9[
					      (2 + u_6)
					    ]) * tmpvar_18.xyz));
					    highp vec2 tmpvar_19;
					    tmpvar_19.x = ((float(u_6) * _Distortion) * 2.0);
					    tmpvar_19.y = (_Distortion * 2.0);
					    highp vec4 tmpvar_20;
					    tmpvar_20.zw = vec2(0.0, 0.0);
					    tmpvar_20.xy = (((tmpvar_2 * _ScreenResolution.xy) + tmpvar_19) / _ScreenResolution.xy);
					    lowp vec4 tmpvar_21;
					    tmpvar_21 = impl_low_texture2DLodEXT (_MainTex, tmpvar_20.xy, 0.0);
					    final_colour_8 = (final_colour_8 + ((kernel_9[3] * kernel_9[
					      (2 + u_6)
					    ]) * tmpvar_21.xyz));
					    highp vec2 tmpvar_22;
					    tmpvar_22.x = ((float(u_6) * _Distortion) * 2.0);
					    tmpvar_22.y = (4.0 * _Distortion);
					    highp vec4 tmpvar_23;
					    tmpvar_23.zw = vec2(0.0, 0.0);
					    tmpvar_23.xy = (((tmpvar_2 * _ScreenResolution.xy) + tmpvar_22) / _ScreenResolution.xy);
					    lowp vec4 tmpvar_24;
					    tmpvar_24 = impl_low_texture2DLodEXT (_MainTex, tmpvar_23.xy, 0.0);
					    final_colour_8 = (final_colour_8 + ((kernel_9[4] * kernel_9[
					      (2 + u_6)
					    ]) * tmpvar_24.xyz));
					  };
					  highp vec4 tmpvar_25;
					  tmpvar_25.w = 1.0;
					  tmpvar_25.xyz = (final_colour_8 / (Z_7 * Z_7));
					  rgbx_5 = tmpvar_25;
					  highp vec4 tmpvar_26;
					  tmpvar_26.zw = vec2(0.0, 0.0);
					  highp vec2 tmpvar_27;
					  tmpvar_27 = (xlv_TEXCOORD0 * _ScreenResolution.xy);
					  tmpvar_26.xy = ((tmpvar_27 + vec2(1.0, 1.0)) / _ScreenResolution.xy);
					  color_4 = impl_low_texture2DLodEXT (_MainTex, tmpvar_26.xy, 0.0);
					  highp vec4 tmpvar_28;
					  tmpvar_28.zw = vec2(0.0, 0.0);
					  tmpvar_28.xy = ((tmpvar_27 + vec2(0.0, 1.0)) / _ScreenResolution.xy);
					  color_4 = (color_4 + impl_low_texture2DLodEXT (_MainTex, tmpvar_28.xy, 0.0));
					  highp vec4 tmpvar_29;
					  tmpvar_29.zw = vec2(0.0, 0.0);
					  tmpvar_29.xy = ((tmpvar_27 + vec2(-1.0, 1.0)) / _ScreenResolution.xy);
					  color_4 = (color_4 + impl_low_texture2DLodEXT (_MainTex, tmpvar_29.xy, 0.0));
					  highp vec4 tmpvar_30;
					  tmpvar_30.zw = vec2(0.0, 0.0);
					  tmpvar_30.xy = ((tmpvar_27 + vec2(1.0, 0.0)) / _ScreenResolution.xy);
					  color_4 = (color_4 + impl_low_texture2DLodEXT (_MainTex, tmpvar_30.xy, 0.0));
					  highp vec4 tmpvar_31;
					  tmpvar_31.zw = vec2(0.0, 0.0);
					  tmpvar_31.xy = (tmpvar_27 / _ScreenResolution.xy);
					  color_4 = (color_4 + impl_low_texture2DLodEXT (_MainTex, tmpvar_31.xy, 0.0));
					  highp vec4 tmpvar_32;
					  tmpvar_32.zw = vec2(0.0, 0.0);
					  tmpvar_32.xy = ((tmpvar_27 + vec2(-1.0, 0.0)) / _ScreenResolution.xy);
					  color_4 = (color_4 + impl_low_texture2DLodEXT (_MainTex, tmpvar_32.xy, 0.0));
					  highp vec4 tmpvar_33;
					  tmpvar_33.zw = vec2(0.0, 0.0);
					  tmpvar_33.xy = ((tmpvar_27 + vec2(1.0, -1.0)) / _ScreenResolution.xy);
					  color_4 = (color_4 + impl_low_texture2DLodEXT (_MainTex, tmpvar_33.xy, 0.0));
					  highp vec4 tmpvar_34;
					  tmpvar_34.zw = vec2(0.0, 0.0);
					  tmpvar_34.xy = ((tmpvar_27 + vec2(0.0, -1.0)) / _ScreenResolution.xy);
					  color_4 = (color_4 + impl_low_texture2DLodEXT (_MainTex, tmpvar_34.xy, 0.0));
					  highp vec4 tmpvar_35;
					  tmpvar_35.zw = vec2(0.0, 0.0);
					  tmpvar_35.xy = ((tmpvar_27 + vec2(-1.0, -1.0)) / _ScreenResolution.xy);
					  color_4 = (color_4 + impl_low_texture2DLodEXT (_MainTex, tmpvar_35.xy, 0.0));
					  color_4 = (color_4 / 9.0);
					  color_4 = (floor((7.0 * color_4)) / _ColorLevel);
					  highp vec4 tmpvar_36;
					  lowp vec4 color_37;
					  highp vec4 tmpvar_38;
					  tmpvar_38.zw = vec2(0.0, 0.0);
					  tmpvar_38.xy = ((tmpvar_27 + vec2(1.0, 2.0)) / _ScreenResolution.xy);
					  color_37 = impl_low_texture2DLodEXT (_MainTex, tmpvar_38.xy, 0.0);
					  highp vec4 tmpvar_39;
					  tmpvar_39.zw = vec2(0.0, 0.0);
					  tmpvar_39.xy = ((tmpvar_27 + vec2(0.0, 2.0)) / _ScreenResolution.xy);
					  color_37 = (color_37 + impl_low_texture2DLodEXT (_MainTex, tmpvar_39.xy, 0.0));
					  highp vec4 tmpvar_40;
					  tmpvar_40.zw = vec2(0.0, 0.0);
					  tmpvar_40.xy = ((tmpvar_27 + vec2(-1.0, 2.0)) / _ScreenResolution.xy);
					  color_37 = (color_37 + impl_low_texture2DLodEXT (_MainTex, tmpvar_40.xy, 0.0));
					  highp vec4 tmpvar_41;
					  tmpvar_41.zw = vec2(0.0, 0.0);
					  tmpvar_41.xy = ((tmpvar_27 + vec2(1.0, 1.0)) / _ScreenResolution.xy);
					  color_37 = (color_37 + impl_low_texture2DLodEXT (_MainTex, tmpvar_41.xy, 0.0));
					  highp vec4 tmpvar_42;
					  tmpvar_42.zw = vec2(0.0, 0.0);
					  tmpvar_42.xy = ((tmpvar_27 + vec2(0.0, 1.0)) / _ScreenResolution.xy);
					  color_37 = (color_37 + impl_low_texture2DLodEXT (_MainTex, tmpvar_42.xy, 0.0));
					  highp vec4 tmpvar_43;
					  tmpvar_43.zw = vec2(0.0, 0.0);
					  tmpvar_43.xy = ((tmpvar_27 + vec2(-1.0, 1.0)) / _ScreenResolution.xy);
					  color_37 = (color_37 + impl_low_texture2DLodEXT (_MainTex, tmpvar_43.xy, 0.0));
					  highp vec4 tmpvar_44;
					  tmpvar_44.zw = vec2(0.0, 0.0);
					  tmpvar_44.xy = ((tmpvar_27 + vec2(1.0, 0.0)) / _ScreenResolution.xy);
					  color_37 = (color_37 + impl_low_texture2DLodEXT (_MainTex, tmpvar_44.xy, 0.0));
					  highp vec4 tmpvar_45;
					  tmpvar_45.zw = vec2(0.0, 0.0);
					  tmpvar_45.xy = (tmpvar_27 / _ScreenResolution.xy);
					  color_37 = (color_37 + impl_low_texture2DLodEXT (_MainTex, tmpvar_45.xy, 0.0));
					  highp vec4 tmpvar_46;
					  tmpvar_46.zw = vec2(0.0, 0.0);
					  tmpvar_46.xy = ((tmpvar_27 + vec2(-1.0, 0.0)) / _ScreenResolution.xy);
					  color_37 = (color_37 + impl_low_texture2DLodEXT (_MainTex, tmpvar_46.xy, 0.0));
					  tmpvar_36 = (color_37 / 9.0);
					  highp vec4 tmpvar_47;
					  lowp vec4 color_48;
					  highp vec4 tmpvar_49;
					  tmpvar_49.zw = vec2(0.0, 0.0);
					  tmpvar_49.xy = ((tmpvar_27 + vec2(1.0, 0.0)) / _ScreenResolution.xy);
					  color_48 = impl_low_texture2DLodEXT (_MainTex, tmpvar_49.xy, 0.0);
					  highp vec4 tmpvar_50;
					  tmpvar_50.zw = vec2(0.0, 0.0);
					  tmpvar_50.xy = (tmpvar_27 / _ScreenResolution.xy);
					  color_48 = (color_48 + impl_low_texture2DLodEXT (_MainTex, tmpvar_50.xy, 0.0));
					  highp vec4 tmpvar_51;
					  tmpvar_51.zw = vec2(0.0, 0.0);
					  tmpvar_51.xy = ((tmpvar_27 + vec2(-1.0, 0.0)) / _ScreenResolution.xy);
					  color_48 = (color_48 + impl_low_texture2DLodEXT (_MainTex, tmpvar_51.xy, 0.0));
					  highp vec4 tmpvar_52;
					  tmpvar_52.zw = vec2(0.0, 0.0);
					  tmpvar_52.xy = ((tmpvar_27 + vec2(1.0, -1.0)) / _ScreenResolution.xy);
					  color_48 = (color_48 + impl_low_texture2DLodEXT (_MainTex, tmpvar_52.xy, 0.0));
					  highp vec4 tmpvar_53;
					  tmpvar_53.zw = vec2(0.0, 0.0);
					  tmpvar_53.xy = ((tmpvar_27 + vec2(0.0, -1.0)) / _ScreenResolution.xy);
					  color_48 = (color_48 + impl_low_texture2DLodEXT (_MainTex, tmpvar_53.xy, 0.0));
					  highp vec4 tmpvar_54;
					  tmpvar_54.zw = vec2(0.0, 0.0);
					  tmpvar_54.xy = ((tmpvar_27 + vec2(-1.0, -1.0)) / _ScreenResolution.xy);
					  color_48 = (color_48 + impl_low_texture2DLodEXT (_MainTex, tmpvar_54.xy, 0.0));
					  highp vec4 tmpvar_55;
					  tmpvar_55.zw = vec2(0.0, 0.0);
					  tmpvar_55.xy = ((tmpvar_27 + vec2(1.0, -2.0)) / _ScreenResolution.xy);
					  color_48 = (color_48 + impl_low_texture2DLodEXT (_MainTex, tmpvar_55.xy, 0.0));
					  highp vec4 tmpvar_56;
					  tmpvar_56.zw = vec2(0.0, 0.0);
					  tmpvar_56.xy = ((tmpvar_27 + vec2(0.0, -2.0)) / _ScreenResolution.xy);
					  color_48 = (color_48 + impl_low_texture2DLodEXT (_MainTex, tmpvar_56.xy, 0.0));
					  highp vec4 tmpvar_57;
					  tmpvar_57.zw = vec2(0.0, 0.0);
					  tmpvar_57.xy = ((tmpvar_27 + vec2(-1.0, -2.0)) / _ScreenResolution.xy);
					  color_48 = (color_48 + impl_low_texture2DLodEXT (_MainTex, tmpvar_57.xy, 0.0));
					  tmpvar_47 = (color_48 / 9.0);
					  highp vec4 tmpvar_58;
					  tmpvar_58 = abs((tmpvar_36 - tmpvar_47));
					  sum_3 = tmpvar_58;
					  highp vec4 tmpvar_59;
					  lowp vec4 color_60;
					  highp vec4 tmpvar_61;
					  tmpvar_61.zw = vec2(0.0, 0.0);
					  tmpvar_61.xy = ((tmpvar_27 + vec2(2.0, 1.0)) / _ScreenResolution.xy);
					  color_60 = impl_low_texture2DLodEXT (_MainTex, tmpvar_61.xy, 0.0);
					  highp vec4 tmpvar_62;
					  tmpvar_62.zw = vec2(0.0, 0.0);
					  tmpvar_62.xy = ((tmpvar_27 + vec2(1.0, 1.0)) / _ScreenResolution.xy);
					  color_60 = (color_60 + impl_low_texture2DLodEXT (_MainTex, tmpvar_62.xy, 0.0));
					  highp vec4 tmpvar_63;
					  tmpvar_63.zw = vec2(0.0, 0.0);
					  tmpvar_63.xy = ((tmpvar_27 + vec2(0.0, 1.0)) / _ScreenResolution.xy);
					  color_60 = (color_60 + impl_low_texture2DLodEXT (_MainTex, tmpvar_63.xy, 0.0));
					  highp vec4 tmpvar_64;
					  tmpvar_64.zw = vec2(0.0, 0.0);
					  tmpvar_64.xy = ((tmpvar_27 + vec2(2.0, 0.0)) / _ScreenResolution.xy);
					  color_60 = (color_60 + impl_low_texture2DLodEXT (_MainTex, tmpvar_64.xy, 0.0));
					  highp vec4 tmpvar_65;
					  tmpvar_65.zw = vec2(0.0, 0.0);
					  tmpvar_65.xy = ((tmpvar_27 + vec2(1.0, 0.0)) / _ScreenResolution.xy);
					  color_60 = (color_60 + impl_low_texture2DLodEXT (_MainTex, tmpvar_65.xy, 0.0));
					  highp vec4 tmpvar_66;
					  tmpvar_66.zw = vec2(0.0, 0.0);
					  tmpvar_66.xy = (tmpvar_27 / _ScreenResolution.xy);
					  color_60 = (color_60 + impl_low_texture2DLodEXT (_MainTex, tmpvar_66.xy, 0.0));
					  highp vec4 tmpvar_67;
					  tmpvar_67.zw = vec2(0.0, 0.0);
					  tmpvar_67.xy = ((tmpvar_27 + vec2(2.0, -1.0)) / _ScreenResolution.xy);
					  color_60 = (color_60 + impl_low_texture2DLodEXT (_MainTex, tmpvar_67.xy, 0.0));
					  highp vec4 tmpvar_68;
					  tmpvar_68.zw = vec2(0.0, 0.0);
					  tmpvar_68.xy = ((tmpvar_27 + vec2(1.0, -1.0)) / _ScreenResolution.xy);
					  color_60 = (color_60 + impl_low_texture2DLodEXT (_MainTex, tmpvar_68.xy, 0.0));
					  highp vec4 tmpvar_69;
					  tmpvar_69.zw = vec2(0.0, 0.0);
					  tmpvar_69.xy = ((tmpvar_27 + vec2(0.0, -1.0)) / _ScreenResolution.xy);
					  color_60 = (color_60 + impl_low_texture2DLodEXT (_MainTex, tmpvar_69.xy, 0.0));
					  tmpvar_59 = (color_60 / 9.0);
					  highp vec4 tmpvar_70;
					  lowp vec4 color_71;
					  highp vec4 tmpvar_72;
					  tmpvar_72.zw = vec2(0.0, 0.0);
					  tmpvar_72.xy = ((tmpvar_27 + vec2(0.0, 1.0)) / _ScreenResolution.xy);
					  color_71 = impl_low_texture2DLodEXT (_MainTex, tmpvar_72.xy, 0.0);
					  highp vec4 tmpvar_73;
					  tmpvar_73.zw = vec2(0.0, 0.0);
					  tmpvar_73.xy = ((tmpvar_27 + vec2(-1.0, 1.0)) / _ScreenResolution.xy);
					  color_71 = (color_71 + impl_low_texture2DLodEXT (_MainTex, tmpvar_73.xy, 0.0));
					  highp vec4 tmpvar_74;
					  tmpvar_74.zw = vec2(0.0, 0.0);
					  tmpvar_74.xy = ((tmpvar_27 + vec2(-2.0, 1.0)) / _ScreenResolution.xy);
					  color_71 = (color_71 + impl_low_texture2DLodEXT (_MainTex, tmpvar_74.xy, 0.0));
					  highp vec4 tmpvar_75;
					  tmpvar_75.zw = vec2(0.0, 0.0);
					  tmpvar_75.xy = (tmpvar_27 / _ScreenResolution.xy);
					  color_71 = (color_71 + impl_low_texture2DLodEXT (_MainTex, tmpvar_75.xy, 0.0));
					  highp vec4 tmpvar_76;
					  tmpvar_76.zw = vec2(0.0, 0.0);
					  tmpvar_76.xy = ((tmpvar_27 + vec2(-1.0, 0.0)) / _ScreenResolution.xy);
					  color_71 = (color_71 + impl_low_texture2DLodEXT (_MainTex, tmpvar_76.xy, 0.0));
					  highp vec4 tmpvar_77;
					  tmpvar_77.zw = vec2(0.0, 0.0);
					  tmpvar_77.xy = ((tmpvar_27 + vec2(-2.0, 0.0)) / _ScreenResolution.xy);
					  color_71 = (color_71 + impl_low_texture2DLodEXT (_MainTex, tmpvar_77.xy, 0.0));
					  highp vec4 tmpvar_78;
					  tmpvar_78.zw = vec2(0.0, 0.0);
					  tmpvar_78.xy = ((tmpvar_27 + vec2(0.0, -1.0)) / _ScreenResolution.xy);
					  color_71 = (color_71 + impl_low_texture2DLodEXT (_MainTex, tmpvar_78.xy, 0.0));
					  highp vec4 tmpvar_79;
					  tmpvar_79.zw = vec2(0.0, 0.0);
					  tmpvar_79.xy = ((tmpvar_27 + vec2(-1.0, -1.0)) / _ScreenResolution.xy);
					  color_71 = (color_71 + impl_low_texture2DLodEXT (_MainTex, tmpvar_79.xy, 0.0));
					  highp vec4 tmpvar_80;
					  tmpvar_80.zw = vec2(0.0, 0.0);
					  tmpvar_80.xy = ((tmpvar_27 + vec2(-2.0, -1.0)) / _ScreenResolution.xy);
					  color_71 = (color_71 + impl_low_texture2DLodEXT (_MainTex, tmpvar_80.xy, 0.0));
					  tmpvar_70 = (color_71 / 9.0);
					  highp vec4 tmpvar_81;
					  tmpvar_81 = abs((tmpvar_59 - tmpvar_70));
					  sum_3 = (sum_3 + tmpvar_81);
					  sum_3 = (sum_3 / 2.0);
					  highp vec4 tmpvar_82;
					  lowp vec4 y_83;
					  y_83 = (rgbx_5 * 2.0);
					  tmpvar_82 = mix (color_4, y_83, vec4(_Distortion));
					  color_4 = tmpvar_82;
					  highp float tmpvar_84;
					  tmpvar_84 = (_EdgeSize + 0.05);
					  lowp float tmpvar_85;
					  tmpvar_85 = sqrt(dot (sum_3, sum_3));
					  if ((tmpvar_85 > tmpvar_84)) {
					    color_4.xyz = vec3(0.0, 0.0, 0.0);
					  };
					  tmpvar_1 = color_4;
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
					uniform 	vec4 _ScreenResolution;
					uniform 	float _EdgeSize;
					uniform 	float _ColorLevel;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					ivec2 u_xlati1;
					bool u_xlatb1;
					vec2 u_xlat2;
					mediump vec4 u_xlat16_2;
					lowp vec4 u_xlat10_2;
					vec4 u_xlat3;
					mediump vec4 u_xlat16_3;
					lowp vec4 u_xlat10_3;
					int u_xlati3;
					bool u_xlatb3;
					mediump vec4 u_xlat16_4;
					lowp vec4 u_xlat10_4;
					mediump vec4 u_xlat16_5;
					lowp vec4 u_xlat10_5;
					bool u_xlatb5;
					vec4 u_xlat6;
					int u_xlati6;
					bool u_xlatb6;
					lowp vec4 u_xlat10_7;
					lowp vec3 u_xlat10_8;
					vec2 u_xlat11;
					float u_xlat19;
					int u_xlati19;
					float u_xlat20;
					ivec2 u_xlati20;
					int u_xlati21;
					int u_xlati24;
					int u_xlati27;
					float u_xlat28;
					bool u_xlatb28;
					bool u_xlatb30;
					int u_xlati33;
					bool u_xlatb33;
					vec4 TempArray0[6];
					void main()
					{
					    TempArray0[5].x = 0.0;
					    TempArray0[2].x = 0.400000006;
					    TempArray0[1].x = 0.400000006;
					    TempArray0[3].x = 0.400000006;
					    TempArray0[0].x = 0.400000006;
					    TempArray0[4].x = 0.400000006;
					    u_xlat0.x = float(0.0);
					    u_xlat0.y = float(0.0);
					    u_xlat0.z = float(0.0);
					    u_xlati27 = int(int(0xFFFFFFFEu));
					    while(true){
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb1 = !!(2<u_xlati27);
					#else
					        u_xlatb1 = 2<u_xlati27;
					#endif
					        if(u_xlatb1){break;}
					        u_xlati1.xy = ivec2(u_xlati27) + ivec2(2, 1);
					        u_xlat1.x = TempArray0[u_xlati1.x].x;
					        u_xlat19 = float(u_xlati27);
					        u_xlat2.x = dot(vec2(u_xlat19), vec2(vec2(_Distortion, _Distortion)));
					        u_xlat3.xyz = u_xlat0.xyz;
					        u_xlati19 = int(0xFFFFFFFEu);
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb28 = !!(2<u_xlati19);
					#else
					            u_xlatb28 = 2<u_xlati19;
					#endif
					            if(u_xlatb28){break;}
					            u_xlati20.xy = ivec2(u_xlati19) + ivec2(2, 1);
					            u_xlat28 = TempArray0[u_xlati20.x].x;
					            u_xlat28 = u_xlat1.x * u_xlat28;
					            u_xlat20 = float(u_xlati19);
					            u_xlat2.y = dot(vec2(u_xlat20), vec2(vec2(_Distortion, _Distortion)));
					            u_xlat11.xy = vs_TEXCOORD0.xy * _ScreenResolution.xy + u_xlat2.xy;
					            u_xlat11.xy = u_xlat11.xy / _ScreenResolution.xy;
					            u_xlat10_4.xyz = textureLod(_MainTex, u_xlat11.xy, 0.0).xyz;
					            u_xlat3.xyz = vec3(u_xlat28) * u_xlat10_4.xyz + u_xlat3.xyz;
					            u_xlati19 = u_xlati20.y;
					        }
					        u_xlat0.xyz = u_xlat3.xyz;
					        u_xlati27 = u_xlati1.y;
					    }
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
					    u_xlat10_1.x = float(0.0);
					    u_xlat10_1.y = float(0.0);
					    u_xlat10_1.z = float(0.0);
					    u_xlat10_1.w = float(0.0);
					    for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
					    {
					        u_xlat3.y = float((-u_xlati_loop_1));
					        u_xlat10_2 = u_xlat10_1;
					        u_xlati21 = int(0xFFFFFFFFu);
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb30 = !!(1<u_xlati21);
					#else
					            u_xlatb30 = 1<u_xlati21;
					#endif
					            if(u_xlatb30){break;}
					            u_xlat3.x = float((-u_xlati21));
					            u_xlat3.xw = vs_TEXCOORD0.xy * _ScreenResolution.xy + u_xlat3.xy;
					            u_xlat3.xw = u_xlat3.xw / _ScreenResolution.xy;
					            u_xlat10_4 = textureLod(_MainTex, u_xlat3.xw, 0.0);
					            u_xlat16_2 = u_xlat10_2 + u_xlat10_4;
					            u_xlati21 = u_xlati21 + 1;
					            u_xlat10_2 = u_xlat16_2;
					        }
					        u_xlat10_1 = u_xlat10_2;
					    }
					    u_xlat10_1 = u_xlat10_1 * vec4(0.777777791, 0.777777791, 0.777777791, 0.777777791);
					    u_xlat10_1 = floor(u_xlat10_1);
					    u_xlat1 = u_xlat10_1 / vec4(vec4(_ColorLevel, _ColorLevel, _ColorLevel, _ColorLevel));
					    u_xlat10_2.x = float(0.0);
					    u_xlat10_2.y = float(0.0);
					    u_xlat10_2.z = float(0.0);
					    u_xlat10_2.w = float(0.0);
					    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
					    {
					        u_xlati3 = (-u_xlati_loop_2) + 1;
					        u_xlat3.y = float(u_xlati3);
					        u_xlat10_4 = u_xlat10_2;
					        u_xlati21 = int(0xFFFFFFFFu);
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb30 = !!(1<u_xlati21);
					#else
					            u_xlatb30 = 1<u_xlati21;
					#endif
					            if(u_xlatb30){break;}
					            u_xlat3.x = float((-u_xlati21));
					            u_xlat3.xw = vs_TEXCOORD0.xy * _ScreenResolution.xy + u_xlat3.xy;
					            u_xlat3.xw = u_xlat3.xw / _ScreenResolution.xy;
					            u_xlat10_5 = textureLod(_MainTex, u_xlat3.xw, 0.0);
					            u_xlat16_4 = u_xlat10_4 + u_xlat10_5;
					            u_xlati21 = u_xlati21 + 1;
					            u_xlat10_4 = u_xlat16_4;
					        }
					        u_xlat10_2 = u_xlat10_4;
					    }
					    u_xlat10_3.x = float(0.0);
					    u_xlat10_3.y = float(0.0);
					    u_xlat10_3.z = float(0.0);
					    u_xlat10_3.w = float(0.0);
					    for(int u_xlati_loop_3 = int(0xFFFFFFFFu) ; u_xlati_loop_3<=1 ; u_xlati_loop_3++)
					    {
					        u_xlati6 = (-u_xlati_loop_3) + int(0xFFFFFFFFu);
					        u_xlat6.y = float(u_xlati6);
					        u_xlat10_4 = u_xlat10_3;
					        u_xlati24 = int(0xFFFFFFFFu);
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb33 = !!(1<u_xlati24);
					#else
					            u_xlatb33 = 1<u_xlati24;
					#endif
					            if(u_xlatb33){break;}
					            u_xlat6.x = float((-u_xlati24));
					            u_xlat6.xw = vs_TEXCOORD0.xy * _ScreenResolution.xy + u_xlat6.xy;
					            u_xlat6.xw = u_xlat6.xw / _ScreenResolution.xy;
					            u_xlat10_5 = textureLod(_MainTex, u_xlat6.xw, 0.0);
					            u_xlat16_4 = u_xlat10_4 + u_xlat10_5;
					            u_xlati24 = u_xlati24 + 1;
					            u_xlat10_4 = u_xlat16_4;
					        }
					        u_xlat10_3 = u_xlat10_4;
					    }
					    u_xlat10_3 = u_xlat10_3 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112);
					    u_xlat16_2 = u_xlat10_2 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112) + (-u_xlat10_3);
					    u_xlat10_3.x = float(0.0);
					    u_xlat10_3.y = float(0.0);
					    u_xlat10_3.z = float(0.0);
					    u_xlat10_3.w = float(0.0);
					    for(int u_xlati_loop_4 = int(0xFFFFFFFFu) ; u_xlati_loop_4<=1 ; u_xlati_loop_4++)
					    {
					        u_xlat6.y = float((-u_xlati_loop_4));
					        u_xlat10_4 = u_xlat10_3;
					        u_xlati24 = int(0xFFFFFFFFu);
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb33 = !!(1<u_xlati24);
					#else
					            u_xlatb33 = 1<u_xlati24;
					#endif
					            if(u_xlatb33){break;}
					            u_xlati33 = (-u_xlati24) + 1;
					            u_xlat6.x = float(u_xlati33);
					            u_xlat6.xw = vs_TEXCOORD0.xy * _ScreenResolution.xy + u_xlat6.xy;
					            u_xlat6.xw = u_xlat6.xw / _ScreenResolution.xy;
					            u_xlat10_5 = textureLod(_MainTex, u_xlat6.xw, 0.0);
					            u_xlat16_4 = u_xlat10_4 + u_xlat10_5;
					            u_xlati24 = u_xlati24 + 1;
					            u_xlat10_4 = u_xlat16_4;
					        }
					        u_xlat10_3 = u_xlat10_4;
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
					    u_xlat10_0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0);
					    u_xlat10_0.w = 2.0;
					    u_xlat0 = (-u_xlat1) + u_xlat10_0;
					    u_xlat0 = vec4(vec4(_Distortion, _Distortion, _Distortion, _Distortion)) * u_xlat0 + u_xlat1;
					    u_xlat6.x = _EdgeSize + 0.0500000007;
					    u_xlat10_8.x = dot(u_xlat10_2, u_xlat10_2);
					    u_xlat10_8.x = sqrt(u_xlat10_8.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb6 = !!(u_xlat6.x<u_xlat10_8.x);
					#else
					    u_xlatb6 = u_xlat6.x<u_xlat10_8.x;
					#endif
					    u_xlat10_8.xyz = (bool(u_xlatb6)) ? vec3(0.0, 0.0, 0.0) : u_xlat0.xyz;
					    SV_Target0.xyz = u_xlat10_8.xyz;
					    SV_Target0.w = u_xlat0.w;
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
					uniform 	vec4 _ScreenResolution;
					uniform 	float _EdgeSize;
					uniform 	float _ColorLevel;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					ivec2 u_xlati1;
					bool u_xlatb1;
					vec2 u_xlat2;
					mediump vec4 u_xlat16_2;
					lowp vec4 u_xlat10_2;
					vec4 u_xlat3;
					mediump vec4 u_xlat16_3;
					lowp vec4 u_xlat10_3;
					int u_xlati3;
					bool u_xlatb3;
					mediump vec4 u_xlat16_4;
					lowp vec4 u_xlat10_4;
					mediump vec4 u_xlat16_5;
					lowp vec4 u_xlat10_5;
					bool u_xlatb5;
					vec4 u_xlat6;
					int u_xlati6;
					bool u_xlatb6;
					lowp vec4 u_xlat10_7;
					lowp vec3 u_xlat10_8;
					vec2 u_xlat11;
					float u_xlat19;
					int u_xlati19;
					float u_xlat20;
					ivec2 u_xlati20;
					int u_xlati21;
					int u_xlati24;
					int u_xlati27;
					float u_xlat28;
					bool u_xlatb28;
					bool u_xlatb30;
					int u_xlati33;
					bool u_xlatb33;
					vec4 TempArray0[6];
					void main()
					{
					    TempArray0[5].x = 0.0;
					    TempArray0[2].x = 0.400000006;
					    TempArray0[1].x = 0.400000006;
					    TempArray0[3].x = 0.400000006;
					    TempArray0[0].x = 0.400000006;
					    TempArray0[4].x = 0.400000006;
					    u_xlat0.x = float(0.0);
					    u_xlat0.y = float(0.0);
					    u_xlat0.z = float(0.0);
					    u_xlati27 = int(int(0xFFFFFFFEu));
					    while(true){
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb1 = !!(2<u_xlati27);
					#else
					        u_xlatb1 = 2<u_xlati27;
					#endif
					        if(u_xlatb1){break;}
					        u_xlati1.xy = ivec2(u_xlati27) + ivec2(2, 1);
					        u_xlat1.x = TempArray0[u_xlati1.x].x;
					        u_xlat19 = float(u_xlati27);
					        u_xlat2.x = dot(vec2(u_xlat19), vec2(vec2(_Distortion, _Distortion)));
					        u_xlat3.xyz = u_xlat0.xyz;
					        u_xlati19 = int(0xFFFFFFFEu);
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb28 = !!(2<u_xlati19);
					#else
					            u_xlatb28 = 2<u_xlati19;
					#endif
					            if(u_xlatb28){break;}
					            u_xlati20.xy = ivec2(u_xlati19) + ivec2(2, 1);
					            u_xlat28 = TempArray0[u_xlati20.x].x;
					            u_xlat28 = u_xlat1.x * u_xlat28;
					            u_xlat20 = float(u_xlati19);
					            u_xlat2.y = dot(vec2(u_xlat20), vec2(vec2(_Distortion, _Distortion)));
					            u_xlat11.xy = vs_TEXCOORD0.xy * _ScreenResolution.xy + u_xlat2.xy;
					            u_xlat11.xy = u_xlat11.xy / _ScreenResolution.xy;
					            u_xlat10_4.xyz = textureLod(_MainTex, u_xlat11.xy, 0.0).xyz;
					            u_xlat3.xyz = vec3(u_xlat28) * u_xlat10_4.xyz + u_xlat3.xyz;
					            u_xlati19 = u_xlati20.y;
					        }
					        u_xlat0.xyz = u_xlat3.xyz;
					        u_xlati27 = u_xlati1.y;
					    }
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
					    u_xlat10_1.x = float(0.0);
					    u_xlat10_1.y = float(0.0);
					    u_xlat10_1.z = float(0.0);
					    u_xlat10_1.w = float(0.0);
					    for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
					    {
					        u_xlat3.y = float((-u_xlati_loop_1));
					        u_xlat10_2 = u_xlat10_1;
					        u_xlati21 = int(0xFFFFFFFFu);
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb30 = !!(1<u_xlati21);
					#else
					            u_xlatb30 = 1<u_xlati21;
					#endif
					            if(u_xlatb30){break;}
					            u_xlat3.x = float((-u_xlati21));
					            u_xlat3.xw = vs_TEXCOORD0.xy * _ScreenResolution.xy + u_xlat3.xy;
					            u_xlat3.xw = u_xlat3.xw / _ScreenResolution.xy;
					            u_xlat10_4 = textureLod(_MainTex, u_xlat3.xw, 0.0);
					            u_xlat16_2 = u_xlat10_2 + u_xlat10_4;
					            u_xlati21 = u_xlati21 + 1;
					            u_xlat10_2 = u_xlat16_2;
					        }
					        u_xlat10_1 = u_xlat10_2;
					    }
					    u_xlat10_1 = u_xlat10_1 * vec4(0.777777791, 0.777777791, 0.777777791, 0.777777791);
					    u_xlat10_1 = floor(u_xlat10_1);
					    u_xlat1 = u_xlat10_1 / vec4(vec4(_ColorLevel, _ColorLevel, _ColorLevel, _ColorLevel));
					    u_xlat10_2.x = float(0.0);
					    u_xlat10_2.y = float(0.0);
					    u_xlat10_2.z = float(0.0);
					    u_xlat10_2.w = float(0.0);
					    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
					    {
					        u_xlati3 = (-u_xlati_loop_2) + 1;
					        u_xlat3.y = float(u_xlati3);
					        u_xlat10_4 = u_xlat10_2;
					        u_xlati21 = int(0xFFFFFFFFu);
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb30 = !!(1<u_xlati21);
					#else
					            u_xlatb30 = 1<u_xlati21;
					#endif
					            if(u_xlatb30){break;}
					            u_xlat3.x = float((-u_xlati21));
					            u_xlat3.xw = vs_TEXCOORD0.xy * _ScreenResolution.xy + u_xlat3.xy;
					            u_xlat3.xw = u_xlat3.xw / _ScreenResolution.xy;
					            u_xlat10_5 = textureLod(_MainTex, u_xlat3.xw, 0.0);
					            u_xlat16_4 = u_xlat10_4 + u_xlat10_5;
					            u_xlati21 = u_xlati21 + 1;
					            u_xlat10_4 = u_xlat16_4;
					        }
					        u_xlat10_2 = u_xlat10_4;
					    }
					    u_xlat10_3.x = float(0.0);
					    u_xlat10_3.y = float(0.0);
					    u_xlat10_3.z = float(0.0);
					    u_xlat10_3.w = float(0.0);
					    for(int u_xlati_loop_3 = int(0xFFFFFFFFu) ; u_xlati_loop_3<=1 ; u_xlati_loop_3++)
					    {
					        u_xlati6 = (-u_xlati_loop_3) + int(0xFFFFFFFFu);
					        u_xlat6.y = float(u_xlati6);
					        u_xlat10_4 = u_xlat10_3;
					        u_xlati24 = int(0xFFFFFFFFu);
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb33 = !!(1<u_xlati24);
					#else
					            u_xlatb33 = 1<u_xlati24;
					#endif
					            if(u_xlatb33){break;}
					            u_xlat6.x = float((-u_xlati24));
					            u_xlat6.xw = vs_TEXCOORD0.xy * _ScreenResolution.xy + u_xlat6.xy;
					            u_xlat6.xw = u_xlat6.xw / _ScreenResolution.xy;
					            u_xlat10_5 = textureLod(_MainTex, u_xlat6.xw, 0.0);
					            u_xlat16_4 = u_xlat10_4 + u_xlat10_5;
					            u_xlati24 = u_xlati24 + 1;
					            u_xlat10_4 = u_xlat16_4;
					        }
					        u_xlat10_3 = u_xlat10_4;
					    }
					    u_xlat10_3 = u_xlat10_3 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112);
					    u_xlat16_2 = u_xlat10_2 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112) + (-u_xlat10_3);
					    u_xlat10_3.x = float(0.0);
					    u_xlat10_3.y = float(0.0);
					    u_xlat10_3.z = float(0.0);
					    u_xlat10_3.w = float(0.0);
					    for(int u_xlati_loop_4 = int(0xFFFFFFFFu) ; u_xlati_loop_4<=1 ; u_xlati_loop_4++)
					    {
					        u_xlat6.y = float((-u_xlati_loop_4));
					        u_xlat10_4 = u_xlat10_3;
					        u_xlati24 = int(0xFFFFFFFFu);
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb33 = !!(1<u_xlati24);
					#else
					            u_xlatb33 = 1<u_xlati24;
					#endif
					            if(u_xlatb33){break;}
					            u_xlati33 = (-u_xlati24) + 1;
					            u_xlat6.x = float(u_xlati33);
					            u_xlat6.xw = vs_TEXCOORD0.xy * _ScreenResolution.xy + u_xlat6.xy;
					            u_xlat6.xw = u_xlat6.xw / _ScreenResolution.xy;
					            u_xlat10_5 = textureLod(_MainTex, u_xlat6.xw, 0.0);
					            u_xlat16_4 = u_xlat10_4 + u_xlat10_5;
					            u_xlati24 = u_xlati24 + 1;
					            u_xlat10_4 = u_xlat16_4;
					        }
					        u_xlat10_3 = u_xlat10_4;
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
					    u_xlat10_0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0);
					    u_xlat10_0.w = 2.0;
					    u_xlat0 = (-u_xlat1) + u_xlat10_0;
					    u_xlat0 = vec4(vec4(_Distortion, _Distortion, _Distortion, _Distortion)) * u_xlat0 + u_xlat1;
					    u_xlat6.x = _EdgeSize + 0.0500000007;
					    u_xlat10_8.x = dot(u_xlat10_2, u_xlat10_2);
					    u_xlat10_8.x = sqrt(u_xlat10_8.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb6 = !!(u_xlat6.x<u_xlat10_8.x);
					#else
					    u_xlatb6 = u_xlat6.x<u_xlat10_8.x;
					#endif
					    u_xlat10_8.xyz = (bool(u_xlatb6)) ? vec3(0.0, 0.0, 0.0) : u_xlat0.xyz;
					    SV_Target0.xyz = u_xlat10_8.xyz;
					    SV_Target0.w = u_xlat0.w;
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
					uniform 	vec4 _ScreenResolution;
					uniform 	float _EdgeSize;
					uniform 	float _ColorLevel;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					ivec2 u_xlati1;
					bool u_xlatb1;
					vec2 u_xlat2;
					mediump vec4 u_xlat16_2;
					lowp vec4 u_xlat10_2;
					vec4 u_xlat3;
					mediump vec4 u_xlat16_3;
					lowp vec4 u_xlat10_3;
					int u_xlati3;
					bool u_xlatb3;
					mediump vec4 u_xlat16_4;
					lowp vec4 u_xlat10_4;
					mediump vec4 u_xlat16_5;
					lowp vec4 u_xlat10_5;
					bool u_xlatb5;
					vec4 u_xlat6;
					int u_xlati6;
					bool u_xlatb6;
					lowp vec4 u_xlat10_7;
					lowp vec3 u_xlat10_8;
					vec2 u_xlat11;
					float u_xlat19;
					int u_xlati19;
					float u_xlat20;
					ivec2 u_xlati20;
					int u_xlati21;
					int u_xlati24;
					int u_xlati27;
					float u_xlat28;
					bool u_xlatb28;
					bool u_xlatb30;
					int u_xlati33;
					bool u_xlatb33;
					vec4 TempArray0[6];
					void main()
					{
					    TempArray0[5].x = 0.0;
					    TempArray0[2].x = 0.400000006;
					    TempArray0[1].x = 0.400000006;
					    TempArray0[3].x = 0.400000006;
					    TempArray0[0].x = 0.400000006;
					    TempArray0[4].x = 0.400000006;
					    u_xlat0.x = float(0.0);
					    u_xlat0.y = float(0.0);
					    u_xlat0.z = float(0.0);
					    u_xlati27 = int(int(0xFFFFFFFEu));
					    while(true){
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb1 = !!(2<u_xlati27);
					#else
					        u_xlatb1 = 2<u_xlati27;
					#endif
					        if(u_xlatb1){break;}
					        u_xlati1.xy = ivec2(u_xlati27) + ivec2(2, 1);
					        u_xlat1.x = TempArray0[u_xlati1.x].x;
					        u_xlat19 = float(u_xlati27);
					        u_xlat2.x = dot(vec2(u_xlat19), vec2(vec2(_Distortion, _Distortion)));
					        u_xlat3.xyz = u_xlat0.xyz;
					        u_xlati19 = int(0xFFFFFFFEu);
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb28 = !!(2<u_xlati19);
					#else
					            u_xlatb28 = 2<u_xlati19;
					#endif
					            if(u_xlatb28){break;}
					            u_xlati20.xy = ivec2(u_xlati19) + ivec2(2, 1);
					            u_xlat28 = TempArray0[u_xlati20.x].x;
					            u_xlat28 = u_xlat1.x * u_xlat28;
					            u_xlat20 = float(u_xlati19);
					            u_xlat2.y = dot(vec2(u_xlat20), vec2(vec2(_Distortion, _Distortion)));
					            u_xlat11.xy = vs_TEXCOORD0.xy * _ScreenResolution.xy + u_xlat2.xy;
					            u_xlat11.xy = u_xlat11.xy / _ScreenResolution.xy;
					            u_xlat10_4.xyz = textureLod(_MainTex, u_xlat11.xy, 0.0).xyz;
					            u_xlat3.xyz = vec3(u_xlat28) * u_xlat10_4.xyz + u_xlat3.xyz;
					            u_xlati19 = u_xlati20.y;
					        }
					        u_xlat0.xyz = u_xlat3.xyz;
					        u_xlati27 = u_xlati1.y;
					    }
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
					    u_xlat10_1.x = float(0.0);
					    u_xlat10_1.y = float(0.0);
					    u_xlat10_1.z = float(0.0);
					    u_xlat10_1.w = float(0.0);
					    for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
					    {
					        u_xlat3.y = float((-u_xlati_loop_1));
					        u_xlat10_2 = u_xlat10_1;
					        u_xlati21 = int(0xFFFFFFFFu);
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb30 = !!(1<u_xlati21);
					#else
					            u_xlatb30 = 1<u_xlati21;
					#endif
					            if(u_xlatb30){break;}
					            u_xlat3.x = float((-u_xlati21));
					            u_xlat3.xw = vs_TEXCOORD0.xy * _ScreenResolution.xy + u_xlat3.xy;
					            u_xlat3.xw = u_xlat3.xw / _ScreenResolution.xy;
					            u_xlat10_4 = textureLod(_MainTex, u_xlat3.xw, 0.0);
					            u_xlat16_2 = u_xlat10_2 + u_xlat10_4;
					            u_xlati21 = u_xlati21 + 1;
					            u_xlat10_2 = u_xlat16_2;
					        }
					        u_xlat10_1 = u_xlat10_2;
					    }
					    u_xlat10_1 = u_xlat10_1 * vec4(0.777777791, 0.777777791, 0.777777791, 0.777777791);
					    u_xlat10_1 = floor(u_xlat10_1);
					    u_xlat1 = u_xlat10_1 / vec4(vec4(_ColorLevel, _ColorLevel, _ColorLevel, _ColorLevel));
					    u_xlat10_2.x = float(0.0);
					    u_xlat10_2.y = float(0.0);
					    u_xlat10_2.z = float(0.0);
					    u_xlat10_2.w = float(0.0);
					    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
					    {
					        u_xlati3 = (-u_xlati_loop_2) + 1;
					        u_xlat3.y = float(u_xlati3);
					        u_xlat10_4 = u_xlat10_2;
					        u_xlati21 = int(0xFFFFFFFFu);
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb30 = !!(1<u_xlati21);
					#else
					            u_xlatb30 = 1<u_xlati21;
					#endif
					            if(u_xlatb30){break;}
					            u_xlat3.x = float((-u_xlati21));
					            u_xlat3.xw = vs_TEXCOORD0.xy * _ScreenResolution.xy + u_xlat3.xy;
					            u_xlat3.xw = u_xlat3.xw / _ScreenResolution.xy;
					            u_xlat10_5 = textureLod(_MainTex, u_xlat3.xw, 0.0);
					            u_xlat16_4 = u_xlat10_4 + u_xlat10_5;
					            u_xlati21 = u_xlati21 + 1;
					            u_xlat10_4 = u_xlat16_4;
					        }
					        u_xlat10_2 = u_xlat10_4;
					    }
					    u_xlat10_3.x = float(0.0);
					    u_xlat10_3.y = float(0.0);
					    u_xlat10_3.z = float(0.0);
					    u_xlat10_3.w = float(0.0);
					    for(int u_xlati_loop_3 = int(0xFFFFFFFFu) ; u_xlati_loop_3<=1 ; u_xlati_loop_3++)
					    {
					        u_xlati6 = (-u_xlati_loop_3) + int(0xFFFFFFFFu);
					        u_xlat6.y = float(u_xlati6);
					        u_xlat10_4 = u_xlat10_3;
					        u_xlati24 = int(0xFFFFFFFFu);
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb33 = !!(1<u_xlati24);
					#else
					            u_xlatb33 = 1<u_xlati24;
					#endif
					            if(u_xlatb33){break;}
					            u_xlat6.x = float((-u_xlati24));
					            u_xlat6.xw = vs_TEXCOORD0.xy * _ScreenResolution.xy + u_xlat6.xy;
					            u_xlat6.xw = u_xlat6.xw / _ScreenResolution.xy;
					            u_xlat10_5 = textureLod(_MainTex, u_xlat6.xw, 0.0);
					            u_xlat16_4 = u_xlat10_4 + u_xlat10_5;
					            u_xlati24 = u_xlati24 + 1;
					            u_xlat10_4 = u_xlat16_4;
					        }
					        u_xlat10_3 = u_xlat10_4;
					    }
					    u_xlat10_3 = u_xlat10_3 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112);
					    u_xlat16_2 = u_xlat10_2 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112) + (-u_xlat10_3);
					    u_xlat10_3.x = float(0.0);
					    u_xlat10_3.y = float(0.0);
					    u_xlat10_3.z = float(0.0);
					    u_xlat10_3.w = float(0.0);
					    for(int u_xlati_loop_4 = int(0xFFFFFFFFu) ; u_xlati_loop_4<=1 ; u_xlati_loop_4++)
					    {
					        u_xlat6.y = float((-u_xlati_loop_4));
					        u_xlat10_4 = u_xlat10_3;
					        u_xlati24 = int(0xFFFFFFFFu);
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb33 = !!(1<u_xlati24);
					#else
					            u_xlatb33 = 1<u_xlati24;
					#endif
					            if(u_xlatb33){break;}
					            u_xlati33 = (-u_xlati24) + 1;
					            u_xlat6.x = float(u_xlati33);
					            u_xlat6.xw = vs_TEXCOORD0.xy * _ScreenResolution.xy + u_xlat6.xy;
					            u_xlat6.xw = u_xlat6.xw / _ScreenResolution.xy;
					            u_xlat10_5 = textureLod(_MainTex, u_xlat6.xw, 0.0);
					            u_xlat16_4 = u_xlat10_4 + u_xlat10_5;
					            u_xlati24 = u_xlati24 + 1;
					            u_xlat10_4 = u_xlat16_4;
					        }
					        u_xlat10_3 = u_xlat10_4;
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
					    u_xlat10_0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0);
					    u_xlat10_0.w = 2.0;
					    u_xlat0 = (-u_xlat1) + u_xlat10_0;
					    u_xlat0 = vec4(vec4(_Distortion, _Distortion, _Distortion, _Distortion)) * u_xlat0 + u_xlat1;
					    u_xlat6.x = _EdgeSize + 0.0500000007;
					    u_xlat10_8.x = dot(u_xlat10_2, u_xlat10_2);
					    u_xlat10_8.x = sqrt(u_xlat10_8.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb6 = !!(u_xlat6.x<u_xlat10_8.x);
					#else
					    u_xlatb6 = u_xlat6.x<u_xlat10_8.x;
					#endif
					    u_xlat10_8.xyz = (bool(u_xlatb6)) ? vec3(0.0, 0.0, 0.0) : u_xlat0.xyz;
					    SV_Target0.xyz = u_xlat10_8.xyz;
					    SV_Target0.w = u_xlat0.w;
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