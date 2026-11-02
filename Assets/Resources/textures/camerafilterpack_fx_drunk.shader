Shader "CameraFilterPack/FX_Drunk" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_Value ("_Value", Range(0, 20)) = 6
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 13946
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 finalColor_1;
					  lowp vec4 color2_2;
					  lowp vec4 color_3;
					  highp vec2 normalizedCoord3_4;
					  highp vec2 normalizedCoord2_5;
					  highp vec2 normalizedCoord_6;
					  highp float tmpvar_7;
					  tmpvar_7 = (sin((_TimeX * 2.0)) * _Value);
					  highp float tmpvar_8;
					  tmpvar_8 = ((sin(
					    (_TimeX * 1.2)
					  ) + 1.0) / 2.0);
					  highp float tmpvar_9;
					  tmpvar_9 = ((sin(
					    (_TimeX * 1.8)
					  ) + 1.0) / 2.0);
					  highp vec2 tmpvar_10;
					  tmpvar_10.x = 0.0;
					  tmpvar_10.y = tmpvar_7;
					  highp vec2 tmpvar_11;
					  tmpvar_11 = (xlv_TEXCOORD0 + (tmpvar_10 / _ScreenResolution.x));
					  highp vec2 tmpvar_12;
					  tmpvar_12 = fract(abs(tmpvar_11));
					  highp float tmpvar_13;
					  if ((tmpvar_11.x >= 0.0)) {
					    tmpvar_13 = tmpvar_12.x;
					  } else {
					    tmpvar_13 = -(tmpvar_12.x);
					  };
					  highp float tmpvar_14;
					  if ((tmpvar_11.y >= 0.0)) {
					    tmpvar_14 = tmpvar_12.y;
					  } else {
					    tmpvar_14 = -(tmpvar_12.y);
					  };
					  normalizedCoord_6.x = pow (tmpvar_13, mix (1.25, 0.85, tmpvar_8));
					  normalizedCoord_6.y = pow (tmpvar_14, mix (0.85, 1.25, tmpvar_9));
					  highp vec2 tmpvar_15;
					  tmpvar_15.y = 0.0;
					  tmpvar_15.x = tmpvar_7;
					  highp vec2 tmpvar_16;
					  tmpvar_16 = (xlv_TEXCOORD0 + (tmpvar_15 / _ScreenResolution.x));
					  highp vec2 tmpvar_17;
					  tmpvar_17 = fract(abs(tmpvar_16));
					  highp float tmpvar_18;
					  if ((tmpvar_16.x >= 0.0)) {
					    tmpvar_18 = tmpvar_17.x;
					  } else {
					    tmpvar_18 = -(tmpvar_17.x);
					  };
					  highp float tmpvar_19;
					  if ((tmpvar_16.y >= 0.0)) {
					    tmpvar_19 = tmpvar_17.y;
					  } else {
					    tmpvar_19 = -(tmpvar_17.y);
					  };
					  normalizedCoord2_5.x = pow (tmpvar_18, mix (0.95, 1.1, tmpvar_9));
					  normalizedCoord2_5.y = pow (tmpvar_19, mix (1.1, 0.95, tmpvar_8));
					  normalizedCoord3_4 = xlv_TEXCOORD0;
					  color_3.yzw = texture2D (_MainTex, normalizedCoord_6).yzw;
					  lowp vec4 tmpvar_20;
					  tmpvar_20 = texture2D (_MainTex, normalizedCoord2_5);
					  color2_2.yzw = tmpvar_20.yzw;
					  lowp vec4 tmpvar_21;
					  tmpvar_21 = texture2D (_MainTex, normalizedCoord3_4);
					  color_3.x = sqrt(tmpvar_20.x);
					  color2_2.x = color_3.x;
					  highp vec4 tmpvar_22;
					  tmpvar_22 = mix (mix (color_3, color2_2, vec4(mix (0.4, 0.6, tmpvar_8))), tmpvar_21, vec4(0.4, 0.4, 0.4, 0.4));
					  finalColor_1 = tmpvar_22;
					  lowp float tmpvar_23;
					  tmpvar_23 = sqrt(dot (finalColor_1, finalColor_1));
					  if ((tmpvar_23 > 1.4)) {
					    highp vec2 tmpvar_24;
					    tmpvar_24 = mix (finalColor_1.xy, normalizedCoord3_4, vec2(0.5, 0.5));
					    finalColor_1.xy = tmpvar_24;
					  } else {
					    lowp float tmpvar_25;
					    tmpvar_25 = sqrt(dot (finalColor_1, finalColor_1));
					    if ((tmpvar_25 < 0.4)) {
					      highp vec2 tmpvar_26;
					      tmpvar_26 = mix (finalColor_1.yz, normalizedCoord3_4, vec2(0.5, 0.5));
					      finalColor_1.yz = tmpvar_26;
					    };
					  };
					  gl_FragData[0] = finalColor_1;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 finalColor_1;
					  lowp vec4 color2_2;
					  lowp vec4 color_3;
					  highp vec2 normalizedCoord3_4;
					  highp vec2 normalizedCoord2_5;
					  highp vec2 normalizedCoord_6;
					  highp float tmpvar_7;
					  tmpvar_7 = (sin((_TimeX * 2.0)) * _Value);
					  highp float tmpvar_8;
					  tmpvar_8 = ((sin(
					    (_TimeX * 1.2)
					  ) + 1.0) / 2.0);
					  highp float tmpvar_9;
					  tmpvar_9 = ((sin(
					    (_TimeX * 1.8)
					  ) + 1.0) / 2.0);
					  highp vec2 tmpvar_10;
					  tmpvar_10.x = 0.0;
					  tmpvar_10.y = tmpvar_7;
					  highp vec2 tmpvar_11;
					  tmpvar_11 = (xlv_TEXCOORD0 + (tmpvar_10 / _ScreenResolution.x));
					  highp vec2 tmpvar_12;
					  tmpvar_12 = fract(abs(tmpvar_11));
					  highp float tmpvar_13;
					  if ((tmpvar_11.x >= 0.0)) {
					    tmpvar_13 = tmpvar_12.x;
					  } else {
					    tmpvar_13 = -(tmpvar_12.x);
					  };
					  highp float tmpvar_14;
					  if ((tmpvar_11.y >= 0.0)) {
					    tmpvar_14 = tmpvar_12.y;
					  } else {
					    tmpvar_14 = -(tmpvar_12.y);
					  };
					  normalizedCoord_6.x = pow (tmpvar_13, mix (1.25, 0.85, tmpvar_8));
					  normalizedCoord_6.y = pow (tmpvar_14, mix (0.85, 1.25, tmpvar_9));
					  highp vec2 tmpvar_15;
					  tmpvar_15.y = 0.0;
					  tmpvar_15.x = tmpvar_7;
					  highp vec2 tmpvar_16;
					  tmpvar_16 = (xlv_TEXCOORD0 + (tmpvar_15 / _ScreenResolution.x));
					  highp vec2 tmpvar_17;
					  tmpvar_17 = fract(abs(tmpvar_16));
					  highp float tmpvar_18;
					  if ((tmpvar_16.x >= 0.0)) {
					    tmpvar_18 = tmpvar_17.x;
					  } else {
					    tmpvar_18 = -(tmpvar_17.x);
					  };
					  highp float tmpvar_19;
					  if ((tmpvar_16.y >= 0.0)) {
					    tmpvar_19 = tmpvar_17.y;
					  } else {
					    tmpvar_19 = -(tmpvar_17.y);
					  };
					  normalizedCoord2_5.x = pow (tmpvar_18, mix (0.95, 1.1, tmpvar_9));
					  normalizedCoord2_5.y = pow (tmpvar_19, mix (1.1, 0.95, tmpvar_8));
					  normalizedCoord3_4 = xlv_TEXCOORD0;
					  color_3.yzw = texture2D (_MainTex, normalizedCoord_6).yzw;
					  lowp vec4 tmpvar_20;
					  tmpvar_20 = texture2D (_MainTex, normalizedCoord2_5);
					  color2_2.yzw = tmpvar_20.yzw;
					  lowp vec4 tmpvar_21;
					  tmpvar_21 = texture2D (_MainTex, normalizedCoord3_4);
					  color_3.x = sqrt(tmpvar_20.x);
					  color2_2.x = color_3.x;
					  highp vec4 tmpvar_22;
					  tmpvar_22 = mix (mix (color_3, color2_2, vec4(mix (0.4, 0.6, tmpvar_8))), tmpvar_21, vec4(0.4, 0.4, 0.4, 0.4));
					  finalColor_1 = tmpvar_22;
					  lowp float tmpvar_23;
					  tmpvar_23 = sqrt(dot (finalColor_1, finalColor_1));
					  if ((tmpvar_23 > 1.4)) {
					    highp vec2 tmpvar_24;
					    tmpvar_24 = mix (finalColor_1.xy, normalizedCoord3_4, vec2(0.5, 0.5));
					    finalColor_1.xy = tmpvar_24;
					  } else {
					    lowp float tmpvar_25;
					    tmpvar_25 = sqrt(dot (finalColor_1, finalColor_1));
					    if ((tmpvar_25 < 0.4)) {
					      highp vec2 tmpvar_26;
					      tmpvar_26 = mix (finalColor_1.yz, normalizedCoord3_4, vec2(0.5, 0.5));
					      finalColor_1.yz = tmpvar_26;
					    };
					  };
					  gl_FragData[0] = finalColor_1;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 finalColor_1;
					  lowp vec4 color2_2;
					  lowp vec4 color_3;
					  highp vec2 normalizedCoord3_4;
					  highp vec2 normalizedCoord2_5;
					  highp vec2 normalizedCoord_6;
					  highp float tmpvar_7;
					  tmpvar_7 = (sin((_TimeX * 2.0)) * _Value);
					  highp float tmpvar_8;
					  tmpvar_8 = ((sin(
					    (_TimeX * 1.2)
					  ) + 1.0) / 2.0);
					  highp float tmpvar_9;
					  tmpvar_9 = ((sin(
					    (_TimeX * 1.8)
					  ) + 1.0) / 2.0);
					  highp vec2 tmpvar_10;
					  tmpvar_10.x = 0.0;
					  tmpvar_10.y = tmpvar_7;
					  highp vec2 tmpvar_11;
					  tmpvar_11 = (xlv_TEXCOORD0 + (tmpvar_10 / _ScreenResolution.x));
					  highp vec2 tmpvar_12;
					  tmpvar_12 = fract(abs(tmpvar_11));
					  highp float tmpvar_13;
					  if ((tmpvar_11.x >= 0.0)) {
					    tmpvar_13 = tmpvar_12.x;
					  } else {
					    tmpvar_13 = -(tmpvar_12.x);
					  };
					  highp float tmpvar_14;
					  if ((tmpvar_11.y >= 0.0)) {
					    tmpvar_14 = tmpvar_12.y;
					  } else {
					    tmpvar_14 = -(tmpvar_12.y);
					  };
					  normalizedCoord_6.x = pow (tmpvar_13, mix (1.25, 0.85, tmpvar_8));
					  normalizedCoord_6.y = pow (tmpvar_14, mix (0.85, 1.25, tmpvar_9));
					  highp vec2 tmpvar_15;
					  tmpvar_15.y = 0.0;
					  tmpvar_15.x = tmpvar_7;
					  highp vec2 tmpvar_16;
					  tmpvar_16 = (xlv_TEXCOORD0 + (tmpvar_15 / _ScreenResolution.x));
					  highp vec2 tmpvar_17;
					  tmpvar_17 = fract(abs(tmpvar_16));
					  highp float tmpvar_18;
					  if ((tmpvar_16.x >= 0.0)) {
					    tmpvar_18 = tmpvar_17.x;
					  } else {
					    tmpvar_18 = -(tmpvar_17.x);
					  };
					  highp float tmpvar_19;
					  if ((tmpvar_16.y >= 0.0)) {
					    tmpvar_19 = tmpvar_17.y;
					  } else {
					    tmpvar_19 = -(tmpvar_17.y);
					  };
					  normalizedCoord2_5.x = pow (tmpvar_18, mix (0.95, 1.1, tmpvar_9));
					  normalizedCoord2_5.y = pow (tmpvar_19, mix (1.1, 0.95, tmpvar_8));
					  normalizedCoord3_4 = xlv_TEXCOORD0;
					  color_3.yzw = texture2D (_MainTex, normalizedCoord_6).yzw;
					  lowp vec4 tmpvar_20;
					  tmpvar_20 = texture2D (_MainTex, normalizedCoord2_5);
					  color2_2.yzw = tmpvar_20.yzw;
					  lowp vec4 tmpvar_21;
					  tmpvar_21 = texture2D (_MainTex, normalizedCoord3_4);
					  color_3.x = sqrt(tmpvar_20.x);
					  color2_2.x = color_3.x;
					  highp vec4 tmpvar_22;
					  tmpvar_22 = mix (mix (color_3, color2_2, vec4(mix (0.4, 0.6, tmpvar_8))), tmpvar_21, vec4(0.4, 0.4, 0.4, 0.4));
					  finalColor_1 = tmpvar_22;
					  lowp float tmpvar_23;
					  tmpvar_23 = sqrt(dot (finalColor_1, finalColor_1));
					  if ((tmpvar_23 > 1.4)) {
					    highp vec2 tmpvar_24;
					    tmpvar_24 = mix (finalColor_1.xy, normalizedCoord3_4, vec2(0.5, 0.5));
					    finalColor_1.xy = tmpvar_24;
					  } else {
					    lowp float tmpvar_25;
					    tmpvar_25 = sqrt(dot (finalColor_1, finalColor_1));
					    if ((tmpvar_25 < 0.4)) {
					      highp vec2 tmpvar_26;
					      tmpvar_26 = mix (finalColor_1.yz, normalizedCoord3_4, vec2(0.5, 0.5));
					      finalColor_1.yz = tmpvar_26;
					    };
					  };
					  gl_FragData[0] = finalColor_1;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					lowp float u_xlat10_1;
					bvec4 u_xlatb1;
					vec4 u_xlat2;
					bool u_xlatb2;
					lowp vec2 u_xlat10_3;
					mediump vec3 u_xlat16_4;
					lowp vec3 u_xlat10_5;
					bool u_xlatb6;
					void main()
					{
					    u_xlat0.x = _TimeX + _TimeX;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.yz = u_xlat0.xx * vec2(_Value);
					    u_xlat0.x = float(0.0);
					    u_xlat0.w = float(0.0);
					    u_xlat0 = u_xlat0 / _ScreenResolution.xxxx;
					    u_xlat0 = u_xlat0 + vs_TEXCOORD0.xyxy;
					    u_xlatb1 = greaterThanEqual(u_xlat0, (-u_xlat0));
					    u_xlat0 = fract(abs(u_xlat0));
					    u_xlat0.x = (u_xlatb1.x) ? u_xlat0.x : (-u_xlat0.x);
					    u_xlat0.y = (u_xlatb1.y) ? u_xlat0.y : (-u_xlat0.y);
					    u_xlat0.z = (u_xlatb1.z) ? u_xlat0.z : (-u_xlat0.z);
					    u_xlat0.w = (u_xlatb1.w) ? u_xlat0.w : (-u_xlat0.w);
					    u_xlat0 = log2(u_xlat0);
					    u_xlat1 = vec4(_TimeX) * vec4(1.20000005, 1.79999995, 1.79999995, 1.20000005);
					    u_xlat1 = sin(u_xlat1);
					    u_xlat1 = u_xlat1 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat2 = u_xlat1 * vec4(-0.199999988, 0.199999988, 0.0750000179, -0.0750000179) + vec4(1.25, 0.850000024, 0.949999988, 1.10000002);
					    u_xlat1.x = u_xlat1.w * 0.100000009 + 0.400000006;
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat0 = exp2(u_xlat0);
					    u_xlat10_5.xyz = texture(_MainTex, u_xlat0.xy).yzw;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_4.xyz = vec3((-u_xlat10_5.x) + u_xlat10_0.y, (-u_xlat10_5.y) + u_xlat10_0.z, (-u_xlat10_5.z) + u_xlat10_0.w);
					    u_xlat1.yzw = u_xlat1.xxx * u_xlat16_4.xyz + u_xlat10_5.xyz;
					    u_xlat10_1 = sqrt(u_xlat10_0.x);
					    u_xlat1.x = u_xlat10_1;
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0 = (-u_xlat1) + u_xlat10_0;
					    u_xlat0 = u_xlat0 * vec4(0.400000006, 0.400000006, 0.400000006, 0.400000006) + u_xlat1;
					    u_xlat1 = (-u_xlat0.xyyz) + vs_TEXCOORD0.xyxy;
					    u_xlat1 = u_xlat1 * vec4(0.5, 0.5, 0.5, 0.5) + u_xlat0.xyyz;
					    u_xlat10_3.x = dot(u_xlat0, u_xlat0);
					    u_xlat10_3.x = sqrt(u_xlat10_3.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(u_xlat10_3.x<0.400000006);
					#else
					    u_xlatb2 = u_xlat10_3.x<0.400000006;
					#endif
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb6 = !!(1.39999998<u_xlat10_3.x);
					#else
					    u_xlatb6 = 1.39999998<u_xlat10_3.x;
					#endif
					    u_xlat10_3.xy = (bool(u_xlatb2)) ? u_xlat1.zw : u_xlat0.yz;
					    u_xlat1.z = u_xlat0.z;
					    SV_Target0.yz = (bool(u_xlatb6)) ? u_xlat1.yz : u_xlat10_3.xy;
					    SV_Target0.x = (u_xlatb6) ? u_xlat1.x : u_xlat0.x;
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
					uniform 	float _TimeX;
					uniform 	vec4 _ScreenResolution;
					uniform 	float _Value;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					lowp float u_xlat10_1;
					bvec4 u_xlatb1;
					vec4 u_xlat2;
					bool u_xlatb2;
					lowp vec2 u_xlat10_3;
					mediump vec3 u_xlat16_4;
					lowp vec3 u_xlat10_5;
					bool u_xlatb6;
					void main()
					{
					    u_xlat0.x = _TimeX + _TimeX;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.yz = u_xlat0.xx * vec2(_Value);
					    u_xlat0.x = float(0.0);
					    u_xlat0.w = float(0.0);
					    u_xlat0 = u_xlat0 / _ScreenResolution.xxxx;
					    u_xlat0 = u_xlat0 + vs_TEXCOORD0.xyxy;
					    u_xlatb1 = greaterThanEqual(u_xlat0, (-u_xlat0));
					    u_xlat0 = fract(abs(u_xlat0));
					    u_xlat0.x = (u_xlatb1.x) ? u_xlat0.x : (-u_xlat0.x);
					    u_xlat0.y = (u_xlatb1.y) ? u_xlat0.y : (-u_xlat0.y);
					    u_xlat0.z = (u_xlatb1.z) ? u_xlat0.z : (-u_xlat0.z);
					    u_xlat0.w = (u_xlatb1.w) ? u_xlat0.w : (-u_xlat0.w);
					    u_xlat0 = log2(u_xlat0);
					    u_xlat1 = vec4(_TimeX) * vec4(1.20000005, 1.79999995, 1.79999995, 1.20000005);
					    u_xlat1 = sin(u_xlat1);
					    u_xlat1 = u_xlat1 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat2 = u_xlat1 * vec4(-0.199999988, 0.199999988, 0.0750000179, -0.0750000179) + vec4(1.25, 0.850000024, 0.949999988, 1.10000002);
					    u_xlat1.x = u_xlat1.w * 0.100000009 + 0.400000006;
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat0 = exp2(u_xlat0);
					    u_xlat10_5.xyz = texture(_MainTex, u_xlat0.xy).yzw;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_4.xyz = vec3((-u_xlat10_5.x) + u_xlat10_0.y, (-u_xlat10_5.y) + u_xlat10_0.z, (-u_xlat10_5.z) + u_xlat10_0.w);
					    u_xlat1.yzw = u_xlat1.xxx * u_xlat16_4.xyz + u_xlat10_5.xyz;
					    u_xlat10_1 = sqrt(u_xlat10_0.x);
					    u_xlat1.x = u_xlat10_1;
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0 = (-u_xlat1) + u_xlat10_0;
					    u_xlat0 = u_xlat0 * vec4(0.400000006, 0.400000006, 0.400000006, 0.400000006) + u_xlat1;
					    u_xlat1 = (-u_xlat0.xyyz) + vs_TEXCOORD0.xyxy;
					    u_xlat1 = u_xlat1 * vec4(0.5, 0.5, 0.5, 0.5) + u_xlat0.xyyz;
					    u_xlat10_3.x = dot(u_xlat0, u_xlat0);
					    u_xlat10_3.x = sqrt(u_xlat10_3.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(u_xlat10_3.x<0.400000006);
					#else
					    u_xlatb2 = u_xlat10_3.x<0.400000006;
					#endif
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb6 = !!(1.39999998<u_xlat10_3.x);
					#else
					    u_xlatb6 = 1.39999998<u_xlat10_3.x;
					#endif
					    u_xlat10_3.xy = (bool(u_xlatb2)) ? u_xlat1.zw : u_xlat0.yz;
					    u_xlat1.z = u_xlat0.z;
					    SV_Target0.yz = (bool(u_xlatb6)) ? u_xlat1.yz : u_xlat10_3.xy;
					    SV_Target0.x = (u_xlatb6) ? u_xlat1.x : u_xlat0.x;
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
					uniform 	float _TimeX;
					uniform 	vec4 _ScreenResolution;
					uniform 	float _Value;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					lowp float u_xlat10_1;
					bvec4 u_xlatb1;
					vec4 u_xlat2;
					bool u_xlatb2;
					lowp vec2 u_xlat10_3;
					mediump vec3 u_xlat16_4;
					lowp vec3 u_xlat10_5;
					bool u_xlatb6;
					void main()
					{
					    u_xlat0.x = _TimeX + _TimeX;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.yz = u_xlat0.xx * vec2(_Value);
					    u_xlat0.x = float(0.0);
					    u_xlat0.w = float(0.0);
					    u_xlat0 = u_xlat0 / _ScreenResolution.xxxx;
					    u_xlat0 = u_xlat0 + vs_TEXCOORD0.xyxy;
					    u_xlatb1 = greaterThanEqual(u_xlat0, (-u_xlat0));
					    u_xlat0 = fract(abs(u_xlat0));
					    u_xlat0.x = (u_xlatb1.x) ? u_xlat0.x : (-u_xlat0.x);
					    u_xlat0.y = (u_xlatb1.y) ? u_xlat0.y : (-u_xlat0.y);
					    u_xlat0.z = (u_xlatb1.z) ? u_xlat0.z : (-u_xlat0.z);
					    u_xlat0.w = (u_xlatb1.w) ? u_xlat0.w : (-u_xlat0.w);
					    u_xlat0 = log2(u_xlat0);
					    u_xlat1 = vec4(_TimeX) * vec4(1.20000005, 1.79999995, 1.79999995, 1.20000005);
					    u_xlat1 = sin(u_xlat1);
					    u_xlat1 = u_xlat1 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat2 = u_xlat1 * vec4(-0.199999988, 0.199999988, 0.0750000179, -0.0750000179) + vec4(1.25, 0.850000024, 0.949999988, 1.10000002);
					    u_xlat1.x = u_xlat1.w * 0.100000009 + 0.400000006;
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat0 = exp2(u_xlat0);
					    u_xlat10_5.xyz = texture(_MainTex, u_xlat0.xy).yzw;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_4.xyz = vec3((-u_xlat10_5.x) + u_xlat10_0.y, (-u_xlat10_5.y) + u_xlat10_0.z, (-u_xlat10_5.z) + u_xlat10_0.w);
					    u_xlat1.yzw = u_xlat1.xxx * u_xlat16_4.xyz + u_xlat10_5.xyz;
					    u_xlat10_1 = sqrt(u_xlat10_0.x);
					    u_xlat1.x = u_xlat10_1;
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0 = (-u_xlat1) + u_xlat10_0;
					    u_xlat0 = u_xlat0 * vec4(0.400000006, 0.400000006, 0.400000006, 0.400000006) + u_xlat1;
					    u_xlat1 = (-u_xlat0.xyyz) + vs_TEXCOORD0.xyxy;
					    u_xlat1 = u_xlat1 * vec4(0.5, 0.5, 0.5, 0.5) + u_xlat0.xyyz;
					    u_xlat10_3.x = dot(u_xlat0, u_xlat0);
					    u_xlat10_3.x = sqrt(u_xlat10_3.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(u_xlat10_3.x<0.400000006);
					#else
					    u_xlatb2 = u_xlat10_3.x<0.400000006;
					#endif
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb6 = !!(1.39999998<u_xlat10_3.x);
					#else
					    u_xlatb6 = 1.39999998<u_xlat10_3.x;
					#endif
					    u_xlat10_3.xy = (bool(u_xlatb2)) ? u_xlat1.zw : u_xlat0.yz;
					    u_xlat1.z = u_xlat0.z;
					    SV_Target0.yz = (bool(u_xlatb6)) ? u_xlat1.yz : u_xlat10_3.xy;
					    SV_Target0.x = (u_xlatb6) ? u_xlat1.x : u_xlat0.x;
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