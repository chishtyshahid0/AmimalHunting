Shader "CameraFilterPack/FX_Hexagon_Black" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_Value ("_Value", Range(0.2, 10)) = 1
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 48204
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
					uniform highp vec4 _ScreenResolution;
					uniform highp float _Value;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 texel_1;
					  highp float tmpvar_2;
					  tmpvar_2 = ((_Value * _ScreenResolution.x) / 160.0);
					  highp vec2 tmpvar_3;
					  highp vec2 st_4;
					  st_4 = (xlv_TEXCOORD0 * _ScreenResolution.xy);
					  highp vec2 coord_5;
					  highp float tmpvar_6;
					  tmpvar_6 = (0.5 * tmpvar_2);
					  highp float tmpvar_7;
					  tmpvar_7 = (0.8660254 * tmpvar_2);
					  highp float tmpvar_8;
					  tmpvar_8 = (tmpvar_6 / tmpvar_7);
					  highp vec2 tmpvar_9;
					  tmpvar_9.x = (2.0 * tmpvar_7);
					  tmpvar_9.y = (tmpvar_6 + tmpvar_2);
					  highp vec2 tmpvar_10;
					  tmpvar_10 = (st_4 / tmpvar_9);
					  highp vec2 tmpvar_11;
					  tmpvar_11.x = (2.0 * tmpvar_7);
					  tmpvar_11.y = (tmpvar_6 + tmpvar_2);
					  highp vec2 tmpvar_12;
					  tmpvar_12 = (st_4 / tmpvar_11);
					  highp vec2 tmpvar_13;
					  tmpvar_13 = (fract(abs(tmpvar_12)) * tmpvar_11);
					  highp float tmpvar_14;
					  if ((tmpvar_12.x >= 0.0)) {
					    tmpvar_14 = tmpvar_13.x;
					  } else {
					    tmpvar_14 = -(tmpvar_13.x);
					  };
					  highp float tmpvar_15;
					  if ((tmpvar_12.y >= 0.0)) {
					    tmpvar_15 = tmpvar_13.y;
					  } else {
					    tmpvar_15 = -(tmpvar_13.y);
					  };
					  highp float tmpvar_16;
					  tmpvar_16 = (floor(tmpvar_10.y) / 2.0);
					  highp float tmpvar_17;
					  tmpvar_17 = (fract(abs(tmpvar_16)) * 2.0);
					  highp float tmpvar_18;
					  if ((tmpvar_16 >= 0.0)) {
					    tmpvar_18 = tmpvar_17;
					  } else {
					    tmpvar_18 = -(tmpvar_17);
					  };
					  highp vec2 tmpvar_19;
					  tmpvar_19 = floor(tmpvar_10);
					  coord_5 = tmpvar_19;
					  if ((tmpvar_18 > 0.0)) {
					    if ((tmpvar_15 < (tmpvar_6 - (tmpvar_14 * tmpvar_8)))) {
					      coord_5 = (tmpvar_19 - 1.0);
					    } else {
					      if ((tmpvar_15 < (-(tmpvar_6) + (tmpvar_14 * tmpvar_8)))) {
					        coord_5.y = (coord_5.y - 1.0);
					      };
					    };
					  } else {
					    if ((tmpvar_14 > tmpvar_7)) {
					      if ((tmpvar_15 < ((2.0 * tmpvar_6) - (tmpvar_14 * tmpvar_8)))) {
					        coord_5.y = (coord_5.y - 1.0);
					      };
					    } else {
					      if ((tmpvar_15 < (tmpvar_14 * tmpvar_8))) {
					        coord_5.y = (coord_5.y - 1.0);
					      } else {
					        coord_5.x = (coord_5.x - 1.0);
					      };
					    };
					  };
					  highp float tmpvar_20;
					  tmpvar_20 = (coord_5.y / 2.0);
					  highp float tmpvar_21;
					  tmpvar_21 = (fract(abs(tmpvar_20)) * 2.0);
					  highp float tmpvar_22;
					  if ((tmpvar_20 >= 0.0)) {
					    tmpvar_22 = tmpvar_21;
					  } else {
					    tmpvar_22 = -(tmpvar_21);
					  };
					  highp vec2 tmpvar_23;
					  tmpvar_23.x = (((coord_5.x * 2.0) * tmpvar_7) - (tmpvar_22 * tmpvar_7));
					  tmpvar_23.y = (coord_5.y * (tmpvar_6 + tmpvar_2));
					  highp vec2 tmpvar_24;
					  tmpvar_24.x = (tmpvar_7 * 2.0);
					  tmpvar_24.y = tmpvar_2;
					  tmpvar_3 = (tmpvar_23 + tmpvar_24);
					  lowp vec4 tmpvar_25;
					  highp vec2 P_26;
					  P_26 = (tmpvar_3 / _ScreenResolution.xy);
					  tmpvar_25 = texture2D (_MainTex, P_26);
					  texel_1 = tmpvar_25;
					  highp vec2 tmpvar_27;
					  tmpvar_27 = abs((tmpvar_3 - (xlv_TEXCOORD0 * _ScreenResolution.xy)));
					  highp float edge0_28;
					  edge0_28 = (tmpvar_2 - 1.0);
					  highp float tmpvar_29;
					  tmpvar_29 = clamp (((
					    (max (((0.5 * tmpvar_27.x) + (0.8660254 * tmpvar_27.y)), tmpvar_27.x) / 0.8660254)
					   - edge0_28) / (tmpvar_2 - edge0_28)), 0.0, 1.0);
					  highp vec4 tmpvar_30;
					  tmpvar_30.w = 1.0;
					  tmpvar_30.xyz = (texel_1.xyz * (1.0 - (tmpvar_29 * 
					    (tmpvar_29 * (3.0 - (2.0 * tmpvar_29)))
					  )));
					  gl_FragData[0] = tmpvar_30;
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
					uniform highp float _Value;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 texel_1;
					  highp float tmpvar_2;
					  tmpvar_2 = ((_Value * _ScreenResolution.x) / 160.0);
					  highp vec2 tmpvar_3;
					  highp vec2 st_4;
					  st_4 = (xlv_TEXCOORD0 * _ScreenResolution.xy);
					  highp vec2 coord_5;
					  highp float tmpvar_6;
					  tmpvar_6 = (0.5 * tmpvar_2);
					  highp float tmpvar_7;
					  tmpvar_7 = (0.8660254 * tmpvar_2);
					  highp float tmpvar_8;
					  tmpvar_8 = (tmpvar_6 / tmpvar_7);
					  highp vec2 tmpvar_9;
					  tmpvar_9.x = (2.0 * tmpvar_7);
					  tmpvar_9.y = (tmpvar_6 + tmpvar_2);
					  highp vec2 tmpvar_10;
					  tmpvar_10 = (st_4 / tmpvar_9);
					  highp vec2 tmpvar_11;
					  tmpvar_11.x = (2.0 * tmpvar_7);
					  tmpvar_11.y = (tmpvar_6 + tmpvar_2);
					  highp vec2 tmpvar_12;
					  tmpvar_12 = (st_4 / tmpvar_11);
					  highp vec2 tmpvar_13;
					  tmpvar_13 = (fract(abs(tmpvar_12)) * tmpvar_11);
					  highp float tmpvar_14;
					  if ((tmpvar_12.x >= 0.0)) {
					    tmpvar_14 = tmpvar_13.x;
					  } else {
					    tmpvar_14 = -(tmpvar_13.x);
					  };
					  highp float tmpvar_15;
					  if ((tmpvar_12.y >= 0.0)) {
					    tmpvar_15 = tmpvar_13.y;
					  } else {
					    tmpvar_15 = -(tmpvar_13.y);
					  };
					  highp float tmpvar_16;
					  tmpvar_16 = (floor(tmpvar_10.y) / 2.0);
					  highp float tmpvar_17;
					  tmpvar_17 = (fract(abs(tmpvar_16)) * 2.0);
					  highp float tmpvar_18;
					  if ((tmpvar_16 >= 0.0)) {
					    tmpvar_18 = tmpvar_17;
					  } else {
					    tmpvar_18 = -(tmpvar_17);
					  };
					  highp vec2 tmpvar_19;
					  tmpvar_19 = floor(tmpvar_10);
					  coord_5 = tmpvar_19;
					  if ((tmpvar_18 > 0.0)) {
					    if ((tmpvar_15 < (tmpvar_6 - (tmpvar_14 * tmpvar_8)))) {
					      coord_5 = (tmpvar_19 - 1.0);
					    } else {
					      if ((tmpvar_15 < (-(tmpvar_6) + (tmpvar_14 * tmpvar_8)))) {
					        coord_5.y = (coord_5.y - 1.0);
					      };
					    };
					  } else {
					    if ((tmpvar_14 > tmpvar_7)) {
					      if ((tmpvar_15 < ((2.0 * tmpvar_6) - (tmpvar_14 * tmpvar_8)))) {
					        coord_5.y = (coord_5.y - 1.0);
					      };
					    } else {
					      if ((tmpvar_15 < (tmpvar_14 * tmpvar_8))) {
					        coord_5.y = (coord_5.y - 1.0);
					      } else {
					        coord_5.x = (coord_5.x - 1.0);
					      };
					    };
					  };
					  highp float tmpvar_20;
					  tmpvar_20 = (coord_5.y / 2.0);
					  highp float tmpvar_21;
					  tmpvar_21 = (fract(abs(tmpvar_20)) * 2.0);
					  highp float tmpvar_22;
					  if ((tmpvar_20 >= 0.0)) {
					    tmpvar_22 = tmpvar_21;
					  } else {
					    tmpvar_22 = -(tmpvar_21);
					  };
					  highp vec2 tmpvar_23;
					  tmpvar_23.x = (((coord_5.x * 2.0) * tmpvar_7) - (tmpvar_22 * tmpvar_7));
					  tmpvar_23.y = (coord_5.y * (tmpvar_6 + tmpvar_2));
					  highp vec2 tmpvar_24;
					  tmpvar_24.x = (tmpvar_7 * 2.0);
					  tmpvar_24.y = tmpvar_2;
					  tmpvar_3 = (tmpvar_23 + tmpvar_24);
					  lowp vec4 tmpvar_25;
					  highp vec2 P_26;
					  P_26 = (tmpvar_3 / _ScreenResolution.xy);
					  tmpvar_25 = texture2D (_MainTex, P_26);
					  texel_1 = tmpvar_25;
					  highp vec2 tmpvar_27;
					  tmpvar_27 = abs((tmpvar_3 - (xlv_TEXCOORD0 * _ScreenResolution.xy)));
					  highp float edge0_28;
					  edge0_28 = (tmpvar_2 - 1.0);
					  highp float tmpvar_29;
					  tmpvar_29 = clamp (((
					    (max (((0.5 * tmpvar_27.x) + (0.8660254 * tmpvar_27.y)), tmpvar_27.x) / 0.8660254)
					   - edge0_28) / (tmpvar_2 - edge0_28)), 0.0, 1.0);
					  highp vec4 tmpvar_30;
					  tmpvar_30.w = 1.0;
					  tmpvar_30.xyz = (texel_1.xyz * (1.0 - (tmpvar_29 * 
					    (tmpvar_29 * (3.0 - (2.0 * tmpvar_29)))
					  )));
					  gl_FragData[0] = tmpvar_30;
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
					uniform highp float _Value;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 texel_1;
					  highp float tmpvar_2;
					  tmpvar_2 = ((_Value * _ScreenResolution.x) / 160.0);
					  highp vec2 tmpvar_3;
					  highp vec2 st_4;
					  st_4 = (xlv_TEXCOORD0 * _ScreenResolution.xy);
					  highp vec2 coord_5;
					  highp float tmpvar_6;
					  tmpvar_6 = (0.5 * tmpvar_2);
					  highp float tmpvar_7;
					  tmpvar_7 = (0.8660254 * tmpvar_2);
					  highp float tmpvar_8;
					  tmpvar_8 = (tmpvar_6 / tmpvar_7);
					  highp vec2 tmpvar_9;
					  tmpvar_9.x = (2.0 * tmpvar_7);
					  tmpvar_9.y = (tmpvar_6 + tmpvar_2);
					  highp vec2 tmpvar_10;
					  tmpvar_10 = (st_4 / tmpvar_9);
					  highp vec2 tmpvar_11;
					  tmpvar_11.x = (2.0 * tmpvar_7);
					  tmpvar_11.y = (tmpvar_6 + tmpvar_2);
					  highp vec2 tmpvar_12;
					  tmpvar_12 = (st_4 / tmpvar_11);
					  highp vec2 tmpvar_13;
					  tmpvar_13 = (fract(abs(tmpvar_12)) * tmpvar_11);
					  highp float tmpvar_14;
					  if ((tmpvar_12.x >= 0.0)) {
					    tmpvar_14 = tmpvar_13.x;
					  } else {
					    tmpvar_14 = -(tmpvar_13.x);
					  };
					  highp float tmpvar_15;
					  if ((tmpvar_12.y >= 0.0)) {
					    tmpvar_15 = tmpvar_13.y;
					  } else {
					    tmpvar_15 = -(tmpvar_13.y);
					  };
					  highp float tmpvar_16;
					  tmpvar_16 = (floor(tmpvar_10.y) / 2.0);
					  highp float tmpvar_17;
					  tmpvar_17 = (fract(abs(tmpvar_16)) * 2.0);
					  highp float tmpvar_18;
					  if ((tmpvar_16 >= 0.0)) {
					    tmpvar_18 = tmpvar_17;
					  } else {
					    tmpvar_18 = -(tmpvar_17);
					  };
					  highp vec2 tmpvar_19;
					  tmpvar_19 = floor(tmpvar_10);
					  coord_5 = tmpvar_19;
					  if ((tmpvar_18 > 0.0)) {
					    if ((tmpvar_15 < (tmpvar_6 - (tmpvar_14 * tmpvar_8)))) {
					      coord_5 = (tmpvar_19 - 1.0);
					    } else {
					      if ((tmpvar_15 < (-(tmpvar_6) + (tmpvar_14 * tmpvar_8)))) {
					        coord_5.y = (coord_5.y - 1.0);
					      };
					    };
					  } else {
					    if ((tmpvar_14 > tmpvar_7)) {
					      if ((tmpvar_15 < ((2.0 * tmpvar_6) - (tmpvar_14 * tmpvar_8)))) {
					        coord_5.y = (coord_5.y - 1.0);
					      };
					    } else {
					      if ((tmpvar_15 < (tmpvar_14 * tmpvar_8))) {
					        coord_5.y = (coord_5.y - 1.0);
					      } else {
					        coord_5.x = (coord_5.x - 1.0);
					      };
					    };
					  };
					  highp float tmpvar_20;
					  tmpvar_20 = (coord_5.y / 2.0);
					  highp float tmpvar_21;
					  tmpvar_21 = (fract(abs(tmpvar_20)) * 2.0);
					  highp float tmpvar_22;
					  if ((tmpvar_20 >= 0.0)) {
					    tmpvar_22 = tmpvar_21;
					  } else {
					    tmpvar_22 = -(tmpvar_21);
					  };
					  highp vec2 tmpvar_23;
					  tmpvar_23.x = (((coord_5.x * 2.0) * tmpvar_7) - (tmpvar_22 * tmpvar_7));
					  tmpvar_23.y = (coord_5.y * (tmpvar_6 + tmpvar_2));
					  highp vec2 tmpvar_24;
					  tmpvar_24.x = (tmpvar_7 * 2.0);
					  tmpvar_24.y = tmpvar_2;
					  tmpvar_3 = (tmpvar_23 + tmpvar_24);
					  lowp vec4 tmpvar_25;
					  highp vec2 P_26;
					  P_26 = (tmpvar_3 / _ScreenResolution.xy);
					  tmpvar_25 = texture2D (_MainTex, P_26);
					  texel_1 = tmpvar_25;
					  highp vec2 tmpvar_27;
					  tmpvar_27 = abs((tmpvar_3 - (xlv_TEXCOORD0 * _ScreenResolution.xy)));
					  highp float edge0_28;
					  edge0_28 = (tmpvar_2 - 1.0);
					  highp float tmpvar_29;
					  tmpvar_29 = clamp (((
					    (max (((0.5 * tmpvar_27.x) + (0.8660254 * tmpvar_27.y)), tmpvar_27.x) / 0.8660254)
					   - edge0_28) / (tmpvar_2 - edge0_28)), 0.0, 1.0);
					  highp vec4 tmpvar_30;
					  tmpvar_30.w = 1.0;
					  tmpvar_30.xyz = (texel_1.xyz * (1.0 - (tmpvar_29 * 
					    (tmpvar_29 * (3.0 - (2.0 * tmpvar_29)))
					  )));
					  gl_FragData[0] = tmpvar_30;
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
					uniform 	float _Value;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					bvec4 u_xlatb1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					float u_xlat6;
					float u_xlat10;
					vec2 u_xlat11;
					float u_xlat15;
					bool u_xlatb15;
					bool u_xlatb16;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _ScreenResolution.xy;
					    u_xlat10 = _ScreenResolution.x * _Value;
					    u_xlat1.xyz = vec3(u_xlat10) * vec3(0.0108253174, 0.00937500037, 0.0108253174);
					    u_xlat0.xyw = u_xlat0.yxy / u_xlat1.yxy;
					    u_xlatb1.xw = greaterThanEqual(u_xlat0.yyyw, (-u_xlat0.yyyw)).xw;
					    u_xlat2.xy = fract(abs(u_xlat0.yw));
					    u_xlat3.xyz = floor(u_xlat0.xyw);
					    u_xlat0.x = (u_xlatb1.x) ? u_xlat2.x : (-u_xlat2.x);
					    u_xlat0.y = (u_xlatb1.w) ? u_xlat2.y : (-u_xlat2.y);
					    u_xlat0.xy = vec2(u_xlat1.z * u_xlat0.x, u_xlat1.y * u_xlat0.y);
					    u_xlat1.xy = vec2(u_xlat10) * vec2(0.00312500005, 0.00541265868);
					    u_xlat15 = u_xlat1.x / u_xlat1.y;
					    u_xlat1.z = u_xlat15 * u_xlat0.x;
					    u_xlat15 = u_xlat0.x * u_xlat15 + (-u_xlat1.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb15 = !!(u_xlat0.y<u_xlat15);
					#else
					    u_xlatb15 = u_xlat0.y<u_xlat15;
					#endif
					    u_xlat1.xw = vec2(u_xlat10) * vec2(0.00312500005, 0.00625000009) + (-u_xlat1.zz);
					    u_xlatb1.xzw = lessThan(u_xlat0.yyyy, u_xlat1.xxzw).xzw;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat1.y<u_xlat0.x);
					#else
					    u_xlatb0 = u_xlat1.y<u_xlat0.x;
					#endif
					    u_xlat2 = vec4(u_xlat3.y + float(-1.0), u_xlat3.z + float(-1.0), u_xlat3.y + float(-1.0), u_xlat3.z + float(0.0));
					    u_xlat4.z = (u_xlatb1.w) ? u_xlat2.y : u_xlat3.z;
					    u_xlat4.xy = vec2(u_xlat3.y + float(0.0), u_xlat3.z + float(-1.0));
					    u_xlat11.xy = (u_xlatb1.z) ? u_xlat4.xy : u_xlat2.zw;
					    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat4.xz : u_xlat11.xy;
					    u_xlat3.w = (u_xlatb15) ? u_xlat2.y : u_xlat3.z;
					    u_xlat1.xz = (u_xlatb1.x) ? u_xlat2.xy : u_xlat3.yw;
					    u_xlat15 = u_xlat3.x * 0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb16 = !!(u_xlat15>=(-u_xlat15));
					#else
					    u_xlatb16 = u_xlat15>=(-u_xlat15);
					#endif
					    u_xlat15 = fract(abs(u_xlat15));
					    u_xlat15 = (u_xlatb16) ? u_xlat15 : (-u_xlat15);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb15 = !!(0.0<u_xlat15);
					#else
					    u_xlatb15 = 0.0<u_xlat15;
					#endif
					    u_xlat0.xy = (bool(u_xlatb15)) ? u_xlat1.xz : u_xlat0.xy;
					    u_xlat15 = u_xlat0.y * 0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1.x = !!(u_xlat15>=(-u_xlat15));
					#else
					    u_xlatb1.x = u_xlat15>=(-u_xlat15);
					#endif
					    u_xlat15 = fract(abs(u_xlat15));
					    u_xlat15 = (u_xlatb1.x) ? u_xlat15 : (-u_xlat15);
					    u_xlat15 = dot(vec2(u_xlat15), u_xlat1.yy);
					    u_xlat0.x = dot(u_xlat0.xx, u_xlat1.yy);
					    u_xlat1.x = (-u_xlat15) + u_xlat0.x;
					    u_xlat0.x = u_xlat10 * 0.00937500037;
					    u_xlat1.y = u_xlat0.x * u_xlat0.y;
					    u_xlat0.xy = vec2(u_xlat10) * vec2(0.0108253174, 0.00625000009) + u_xlat1.xy;
					    u_xlat1.xy = (-vs_TEXCOORD0.xy) * _ScreenResolution.xy + u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy / _ScreenResolution.xy;
					    u_xlat10_0.xyw = texture(_MainTex, u_xlat0.xy).xyz;
					    u_xlat6 = dot(abs(u_xlat1.xy), vec2(0.5, 0.866025388));
					    u_xlat1.x = max(abs(u_xlat1.x), u_xlat6);
					    u_xlat6 = u_xlat10 * 0.00625000009 + -1.0;
					    u_xlat10 = u_xlat10 * 0.00625000009 + (-u_xlat6);
					    u_xlat1.x = u_xlat1.x * 1.15470052 + (-u_xlat6);
					    u_xlat10 = float(1.0) / u_xlat10;
					    u_xlat10 = u_xlat10 * u_xlat1.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat10 = min(max(u_xlat10, 0.0), 1.0);
					#else
					    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
					#endif
					    u_xlat1.x = u_xlat10 * -2.0 + 3.0;
					    u_xlat10 = u_xlat10 * u_xlat10;
					    u_xlat10 = (-u_xlat1.x) * u_xlat10 + 1.0;
					    SV_Target0.xyz = vec3(u_xlat10) * u_xlat10_0.xyw;
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
					uniform 	vec4 _ScreenResolution;
					uniform 	float _Value;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					bvec4 u_xlatb1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					float u_xlat6;
					float u_xlat10;
					vec2 u_xlat11;
					float u_xlat15;
					bool u_xlatb15;
					bool u_xlatb16;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _ScreenResolution.xy;
					    u_xlat10 = _ScreenResolution.x * _Value;
					    u_xlat1.xyz = vec3(u_xlat10) * vec3(0.0108253174, 0.00937500037, 0.0108253174);
					    u_xlat0.xyw = u_xlat0.yxy / u_xlat1.yxy;
					    u_xlatb1.xw = greaterThanEqual(u_xlat0.yyyw, (-u_xlat0.yyyw)).xw;
					    u_xlat2.xy = fract(abs(u_xlat0.yw));
					    u_xlat3.xyz = floor(u_xlat0.xyw);
					    u_xlat0.x = (u_xlatb1.x) ? u_xlat2.x : (-u_xlat2.x);
					    u_xlat0.y = (u_xlatb1.w) ? u_xlat2.y : (-u_xlat2.y);
					    u_xlat0.xy = vec2(u_xlat1.z * u_xlat0.x, u_xlat1.y * u_xlat0.y);
					    u_xlat1.xy = vec2(u_xlat10) * vec2(0.00312500005, 0.00541265868);
					    u_xlat15 = u_xlat1.x / u_xlat1.y;
					    u_xlat1.z = u_xlat15 * u_xlat0.x;
					    u_xlat15 = u_xlat0.x * u_xlat15 + (-u_xlat1.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb15 = !!(u_xlat0.y<u_xlat15);
					#else
					    u_xlatb15 = u_xlat0.y<u_xlat15;
					#endif
					    u_xlat1.xw = vec2(u_xlat10) * vec2(0.00312500005, 0.00625000009) + (-u_xlat1.zz);
					    u_xlatb1.xzw = lessThan(u_xlat0.yyyy, u_xlat1.xxzw).xzw;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat1.y<u_xlat0.x);
					#else
					    u_xlatb0 = u_xlat1.y<u_xlat0.x;
					#endif
					    u_xlat2 = vec4(u_xlat3.y + float(-1.0), u_xlat3.z + float(-1.0), u_xlat3.y + float(-1.0), u_xlat3.z + float(0.0));
					    u_xlat4.z = (u_xlatb1.w) ? u_xlat2.y : u_xlat3.z;
					    u_xlat4.xy = vec2(u_xlat3.y + float(0.0), u_xlat3.z + float(-1.0));
					    u_xlat11.xy = (u_xlatb1.z) ? u_xlat4.xy : u_xlat2.zw;
					    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat4.xz : u_xlat11.xy;
					    u_xlat3.w = (u_xlatb15) ? u_xlat2.y : u_xlat3.z;
					    u_xlat1.xz = (u_xlatb1.x) ? u_xlat2.xy : u_xlat3.yw;
					    u_xlat15 = u_xlat3.x * 0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb16 = !!(u_xlat15>=(-u_xlat15));
					#else
					    u_xlatb16 = u_xlat15>=(-u_xlat15);
					#endif
					    u_xlat15 = fract(abs(u_xlat15));
					    u_xlat15 = (u_xlatb16) ? u_xlat15 : (-u_xlat15);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb15 = !!(0.0<u_xlat15);
					#else
					    u_xlatb15 = 0.0<u_xlat15;
					#endif
					    u_xlat0.xy = (bool(u_xlatb15)) ? u_xlat1.xz : u_xlat0.xy;
					    u_xlat15 = u_xlat0.y * 0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1.x = !!(u_xlat15>=(-u_xlat15));
					#else
					    u_xlatb1.x = u_xlat15>=(-u_xlat15);
					#endif
					    u_xlat15 = fract(abs(u_xlat15));
					    u_xlat15 = (u_xlatb1.x) ? u_xlat15 : (-u_xlat15);
					    u_xlat15 = dot(vec2(u_xlat15), u_xlat1.yy);
					    u_xlat0.x = dot(u_xlat0.xx, u_xlat1.yy);
					    u_xlat1.x = (-u_xlat15) + u_xlat0.x;
					    u_xlat0.x = u_xlat10 * 0.00937500037;
					    u_xlat1.y = u_xlat0.x * u_xlat0.y;
					    u_xlat0.xy = vec2(u_xlat10) * vec2(0.0108253174, 0.00625000009) + u_xlat1.xy;
					    u_xlat1.xy = (-vs_TEXCOORD0.xy) * _ScreenResolution.xy + u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy / _ScreenResolution.xy;
					    u_xlat10_0.xyw = texture(_MainTex, u_xlat0.xy).xyz;
					    u_xlat6 = dot(abs(u_xlat1.xy), vec2(0.5, 0.866025388));
					    u_xlat1.x = max(abs(u_xlat1.x), u_xlat6);
					    u_xlat6 = u_xlat10 * 0.00625000009 + -1.0;
					    u_xlat10 = u_xlat10 * 0.00625000009 + (-u_xlat6);
					    u_xlat1.x = u_xlat1.x * 1.15470052 + (-u_xlat6);
					    u_xlat10 = float(1.0) / u_xlat10;
					    u_xlat10 = u_xlat10 * u_xlat1.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat10 = min(max(u_xlat10, 0.0), 1.0);
					#else
					    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
					#endif
					    u_xlat1.x = u_xlat10 * -2.0 + 3.0;
					    u_xlat10 = u_xlat10 * u_xlat10;
					    u_xlat10 = (-u_xlat1.x) * u_xlat10 + 1.0;
					    SV_Target0.xyz = vec3(u_xlat10) * u_xlat10_0.xyw;
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
					uniform 	vec4 _ScreenResolution;
					uniform 	float _Value;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					bvec4 u_xlatb1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					float u_xlat6;
					float u_xlat10;
					vec2 u_xlat11;
					float u_xlat15;
					bool u_xlatb15;
					bool u_xlatb16;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _ScreenResolution.xy;
					    u_xlat10 = _ScreenResolution.x * _Value;
					    u_xlat1.xyz = vec3(u_xlat10) * vec3(0.0108253174, 0.00937500037, 0.0108253174);
					    u_xlat0.xyw = u_xlat0.yxy / u_xlat1.yxy;
					    u_xlatb1.xw = greaterThanEqual(u_xlat0.yyyw, (-u_xlat0.yyyw)).xw;
					    u_xlat2.xy = fract(abs(u_xlat0.yw));
					    u_xlat3.xyz = floor(u_xlat0.xyw);
					    u_xlat0.x = (u_xlatb1.x) ? u_xlat2.x : (-u_xlat2.x);
					    u_xlat0.y = (u_xlatb1.w) ? u_xlat2.y : (-u_xlat2.y);
					    u_xlat0.xy = vec2(u_xlat1.z * u_xlat0.x, u_xlat1.y * u_xlat0.y);
					    u_xlat1.xy = vec2(u_xlat10) * vec2(0.00312500005, 0.00541265868);
					    u_xlat15 = u_xlat1.x / u_xlat1.y;
					    u_xlat1.z = u_xlat15 * u_xlat0.x;
					    u_xlat15 = u_xlat0.x * u_xlat15 + (-u_xlat1.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb15 = !!(u_xlat0.y<u_xlat15);
					#else
					    u_xlatb15 = u_xlat0.y<u_xlat15;
					#endif
					    u_xlat1.xw = vec2(u_xlat10) * vec2(0.00312500005, 0.00625000009) + (-u_xlat1.zz);
					    u_xlatb1.xzw = lessThan(u_xlat0.yyyy, u_xlat1.xxzw).xzw;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat1.y<u_xlat0.x);
					#else
					    u_xlatb0 = u_xlat1.y<u_xlat0.x;
					#endif
					    u_xlat2 = vec4(u_xlat3.y + float(-1.0), u_xlat3.z + float(-1.0), u_xlat3.y + float(-1.0), u_xlat3.z + float(0.0));
					    u_xlat4.z = (u_xlatb1.w) ? u_xlat2.y : u_xlat3.z;
					    u_xlat4.xy = vec2(u_xlat3.y + float(0.0), u_xlat3.z + float(-1.0));
					    u_xlat11.xy = (u_xlatb1.z) ? u_xlat4.xy : u_xlat2.zw;
					    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat4.xz : u_xlat11.xy;
					    u_xlat3.w = (u_xlatb15) ? u_xlat2.y : u_xlat3.z;
					    u_xlat1.xz = (u_xlatb1.x) ? u_xlat2.xy : u_xlat3.yw;
					    u_xlat15 = u_xlat3.x * 0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb16 = !!(u_xlat15>=(-u_xlat15));
					#else
					    u_xlatb16 = u_xlat15>=(-u_xlat15);
					#endif
					    u_xlat15 = fract(abs(u_xlat15));
					    u_xlat15 = (u_xlatb16) ? u_xlat15 : (-u_xlat15);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb15 = !!(0.0<u_xlat15);
					#else
					    u_xlatb15 = 0.0<u_xlat15;
					#endif
					    u_xlat0.xy = (bool(u_xlatb15)) ? u_xlat1.xz : u_xlat0.xy;
					    u_xlat15 = u_xlat0.y * 0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1.x = !!(u_xlat15>=(-u_xlat15));
					#else
					    u_xlatb1.x = u_xlat15>=(-u_xlat15);
					#endif
					    u_xlat15 = fract(abs(u_xlat15));
					    u_xlat15 = (u_xlatb1.x) ? u_xlat15 : (-u_xlat15);
					    u_xlat15 = dot(vec2(u_xlat15), u_xlat1.yy);
					    u_xlat0.x = dot(u_xlat0.xx, u_xlat1.yy);
					    u_xlat1.x = (-u_xlat15) + u_xlat0.x;
					    u_xlat0.x = u_xlat10 * 0.00937500037;
					    u_xlat1.y = u_xlat0.x * u_xlat0.y;
					    u_xlat0.xy = vec2(u_xlat10) * vec2(0.0108253174, 0.00625000009) + u_xlat1.xy;
					    u_xlat1.xy = (-vs_TEXCOORD0.xy) * _ScreenResolution.xy + u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy / _ScreenResolution.xy;
					    u_xlat10_0.xyw = texture(_MainTex, u_xlat0.xy).xyz;
					    u_xlat6 = dot(abs(u_xlat1.xy), vec2(0.5, 0.866025388));
					    u_xlat1.x = max(abs(u_xlat1.x), u_xlat6);
					    u_xlat6 = u_xlat10 * 0.00625000009 + -1.0;
					    u_xlat10 = u_xlat10 * 0.00625000009 + (-u_xlat6);
					    u_xlat1.x = u_xlat1.x * 1.15470052 + (-u_xlat6);
					    u_xlat10 = float(1.0) / u_xlat10;
					    u_xlat10 = u_xlat10 * u_xlat1.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat10 = min(max(u_xlat10, 0.0), 1.0);
					#else
					    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
					#endif
					    u_xlat1.x = u_xlat10 * -2.0 + 3.0;
					    u_xlat10 = u_xlat10 * u_xlat10;
					    u_xlat10 = (-u_xlat1.x) * u_xlat10 + 1.0;
					    SV_Target0.xyz = vec3(u_xlat10) * u_xlat10_0.xyw;
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