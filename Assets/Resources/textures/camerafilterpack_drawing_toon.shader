Shader "CameraFilterPack/Drawing_Toon" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_DotSize ("_DotSize", Range(0, 1)) = 0
		_ColorLevel ("_ColorLevel", Range(0, 10)) = 7
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 48979
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
					uniform highp float _Distortion;
					uniform highp float _DotSize;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec3 color_1;
					  lowp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  lowp vec3 tmpvar_3;
					  tmpvar_3 = (normalize(texture2D (_MainTex, uv_2)).xyz * 2.5);
					  highp vec3 color_4;
					  color_4 = tmpvar_3;
					  color_4 = (floor((
					    pow (color_4, vec3(0.65, 0.65, 0.65))
					   * 5.0)) / 5.0);
					  highp vec3 tmpvar_5;
					  tmpvar_5 = pow (color_4, vec3(1.538462, 1.538462, 1.538462));
					  color_4 = tmpvar_5;
					  color_1 = (tmpvar_5 * _Distortion);
					  highp vec2 uv_6;
					  uv_6 = uv_2;
					  highp vec3 col_7;
					  highp float tmpvar_8;
					  tmpvar_8 = (0.001953125 * _DotSize);
					  highp vec2 tmpvar_9;
					  tmpvar_9.x = -(tmpvar_8);
					  tmpvar_9.y = -(tmpvar_8);
					  lowp vec4 tmpvar_10;
					  highp vec2 P_11;
					  P_11 = (uv_6 + tmpvar_9);
					  tmpvar_10 = texture2D (_MainTex, P_11);
					  highp float tmpvar_12;
					  tmpvar_12 = dot (tmpvar_10, vec4(0.1125, 0.22125, 0.04125, 0.25));
					  highp vec2 tmpvar_13;
					  tmpvar_13.x = tmpvar_8;
					  tmpvar_13.y = -(tmpvar_8);
					  lowp vec4 tmpvar_14;
					  highp vec2 P_15;
					  P_15 = (uv_6 + tmpvar_13);
					  tmpvar_14 = texture2D (_MainTex, P_15);
					  highp float tmpvar_16;
					  tmpvar_16 = dot (tmpvar_14, vec4(0.1125, 0.22125, 0.04125, 0.25));
					  highp vec2 tmpvar_17;
					  tmpvar_17.y = 0.0;
					  tmpvar_17.x = -(tmpvar_8);
					  lowp vec4 tmpvar_18;
					  highp vec2 P_19;
					  P_19 = (uv_6 + tmpvar_17);
					  tmpvar_18 = texture2D (_MainTex, P_19);
					  highp float tmpvar_20;
					  tmpvar_20 = dot (tmpvar_18, vec4(0.1125, 0.22125, 0.04125, 0.25));
					  highp vec2 tmpvar_21;
					  tmpvar_21.x = -(tmpvar_8);
					  tmpvar_21.y = tmpvar_8;
					  lowp vec4 tmpvar_22;
					  highp vec2 P_23;
					  P_23 = (uv_6 + tmpvar_21);
					  tmpvar_22 = texture2D (_MainTex, P_23);
					  highp float tmpvar_24;
					  tmpvar_24 = dot (tmpvar_22, vec4(0.1125, 0.22125, 0.04125, 0.25));
					  highp vec2 tmpvar_25;
					  tmpvar_25.x = 0.0;
					  tmpvar_25.y = tmpvar_8;
					  lowp vec4 tmpvar_26;
					  highp vec2 P_27;
					  P_27 = (uv_6 + tmpvar_25);
					  tmpvar_26 = texture2D (_MainTex, P_27);
					  lowp vec4 tmpvar_28;
					  highp vec2 P_29;
					  P_29 = (uv_6 + vec2(tmpvar_8));
					  tmpvar_28 = texture2D (_MainTex, P_29);
					  highp float tmpvar_30;
					  tmpvar_30 = dot (tmpvar_28, vec4(0.1125, 0.22125, 0.04125, 0.25));
					  highp float tmpvar_31;
					  tmpvar_31 = (((
					    ((tmpvar_16 + tmpvar_30) + (2.0 * tmpvar_20))
					   - tmpvar_12) - (2.0 * tmpvar_20)) - tmpvar_24);
					  highp float tmpvar_32;
					  tmpvar_32 = (((
					    ((tmpvar_24 + (2.0 * dot (tmpvar_26, vec4(0.1125, 0.22125, 0.04125, 0.25)))) + tmpvar_30)
					   - tmpvar_12) - (2.0 * tmpvar_12)) - tmpvar_16);
					  if ((((tmpvar_31 * tmpvar_31) + (tmpvar_32 * tmpvar_32)) > 0.04)) {
					    col_7 = vec3(-1.0, -1.0, -1.0);
					  } else {
					    col_7 = vec3(0.0, 0.0, 0.0);
					  };
					  color_1 = (color_1 + col_7);
					  highp vec3 color_33;
					  color_33 = color_1;
					  if ((color_33.y > ((color_33.x + color_33.z) * 12.8))) {
					    color_33 = vec3(0.0, 0.0, 0.0);
					  };
					  color_33 = (((0.2126 * color_33.xxx) + (0.7152 * color_33.yyy)) + (0.0722 * color_33.zzz));
					  if ((color_33.x <= 0.95)) {
					    if ((color_33.x > 0.75)) {
					      color_33.x = (color_33.x * 0.9);
					    } else {
					      if ((color_33.x > 0.5)) {
					        color_33.x = (color_33.x * 0.7);
					        color_33.y = (color_33.y * 0.9);
					      } else {
					        if ((color_33.x > 0.25)) {
					          color_33.x = (color_33.x * 0.5);
					          color_33.y = (color_33.y * 0.75);
					        } else {
					          color_33.x = (color_33.x * 0.25);
					          color_33.y = (color_33.y * 0.5);
					        };
					      };
					    };
					  };
					  color_1 = color_33;
					  lowp vec4 tmpvar_34;
					  tmpvar_34.w = 1.0;
					  tmpvar_34.xyz = color_1;
					  gl_FragData[0] = tmpvar_34;
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
					uniform highp float _Distortion;
					uniform highp float _DotSize;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec3 color_1;
					  lowp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  lowp vec3 tmpvar_3;
					  tmpvar_3 = (normalize(texture2D (_MainTex, uv_2)).xyz * 2.5);
					  highp vec3 color_4;
					  color_4 = tmpvar_3;
					  color_4 = (floor((
					    pow (color_4, vec3(0.65, 0.65, 0.65))
					   * 5.0)) / 5.0);
					  highp vec3 tmpvar_5;
					  tmpvar_5 = pow (color_4, vec3(1.538462, 1.538462, 1.538462));
					  color_4 = tmpvar_5;
					  color_1 = (tmpvar_5 * _Distortion);
					  highp vec2 uv_6;
					  uv_6 = uv_2;
					  highp vec3 col_7;
					  highp float tmpvar_8;
					  tmpvar_8 = (0.001953125 * _DotSize);
					  highp vec2 tmpvar_9;
					  tmpvar_9.x = -(tmpvar_8);
					  tmpvar_9.y = -(tmpvar_8);
					  lowp vec4 tmpvar_10;
					  highp vec2 P_11;
					  P_11 = (uv_6 + tmpvar_9);
					  tmpvar_10 = texture2D (_MainTex, P_11);
					  highp float tmpvar_12;
					  tmpvar_12 = dot (tmpvar_10, vec4(0.1125, 0.22125, 0.04125, 0.25));
					  highp vec2 tmpvar_13;
					  tmpvar_13.x = tmpvar_8;
					  tmpvar_13.y = -(tmpvar_8);
					  lowp vec4 tmpvar_14;
					  highp vec2 P_15;
					  P_15 = (uv_6 + tmpvar_13);
					  tmpvar_14 = texture2D (_MainTex, P_15);
					  highp float tmpvar_16;
					  tmpvar_16 = dot (tmpvar_14, vec4(0.1125, 0.22125, 0.04125, 0.25));
					  highp vec2 tmpvar_17;
					  tmpvar_17.y = 0.0;
					  tmpvar_17.x = -(tmpvar_8);
					  lowp vec4 tmpvar_18;
					  highp vec2 P_19;
					  P_19 = (uv_6 + tmpvar_17);
					  tmpvar_18 = texture2D (_MainTex, P_19);
					  highp float tmpvar_20;
					  tmpvar_20 = dot (tmpvar_18, vec4(0.1125, 0.22125, 0.04125, 0.25));
					  highp vec2 tmpvar_21;
					  tmpvar_21.x = -(tmpvar_8);
					  tmpvar_21.y = tmpvar_8;
					  lowp vec4 tmpvar_22;
					  highp vec2 P_23;
					  P_23 = (uv_6 + tmpvar_21);
					  tmpvar_22 = texture2D (_MainTex, P_23);
					  highp float tmpvar_24;
					  tmpvar_24 = dot (tmpvar_22, vec4(0.1125, 0.22125, 0.04125, 0.25));
					  highp vec2 tmpvar_25;
					  tmpvar_25.x = 0.0;
					  tmpvar_25.y = tmpvar_8;
					  lowp vec4 tmpvar_26;
					  highp vec2 P_27;
					  P_27 = (uv_6 + tmpvar_25);
					  tmpvar_26 = texture2D (_MainTex, P_27);
					  lowp vec4 tmpvar_28;
					  highp vec2 P_29;
					  P_29 = (uv_6 + vec2(tmpvar_8));
					  tmpvar_28 = texture2D (_MainTex, P_29);
					  highp float tmpvar_30;
					  tmpvar_30 = dot (tmpvar_28, vec4(0.1125, 0.22125, 0.04125, 0.25));
					  highp float tmpvar_31;
					  tmpvar_31 = (((
					    ((tmpvar_16 + tmpvar_30) + (2.0 * tmpvar_20))
					   - tmpvar_12) - (2.0 * tmpvar_20)) - tmpvar_24);
					  highp float tmpvar_32;
					  tmpvar_32 = (((
					    ((tmpvar_24 + (2.0 * dot (tmpvar_26, vec4(0.1125, 0.22125, 0.04125, 0.25)))) + tmpvar_30)
					   - tmpvar_12) - (2.0 * tmpvar_12)) - tmpvar_16);
					  if ((((tmpvar_31 * tmpvar_31) + (tmpvar_32 * tmpvar_32)) > 0.04)) {
					    col_7 = vec3(-1.0, -1.0, -1.0);
					  } else {
					    col_7 = vec3(0.0, 0.0, 0.0);
					  };
					  color_1 = (color_1 + col_7);
					  highp vec3 color_33;
					  color_33 = color_1;
					  if ((color_33.y > ((color_33.x + color_33.z) * 12.8))) {
					    color_33 = vec3(0.0, 0.0, 0.0);
					  };
					  color_33 = (((0.2126 * color_33.xxx) + (0.7152 * color_33.yyy)) + (0.0722 * color_33.zzz));
					  if ((color_33.x <= 0.95)) {
					    if ((color_33.x > 0.75)) {
					      color_33.x = (color_33.x * 0.9);
					    } else {
					      if ((color_33.x > 0.5)) {
					        color_33.x = (color_33.x * 0.7);
					        color_33.y = (color_33.y * 0.9);
					      } else {
					        if ((color_33.x > 0.25)) {
					          color_33.x = (color_33.x * 0.5);
					          color_33.y = (color_33.y * 0.75);
					        } else {
					          color_33.x = (color_33.x * 0.25);
					          color_33.y = (color_33.y * 0.5);
					        };
					      };
					    };
					  };
					  color_1 = color_33;
					  lowp vec4 tmpvar_34;
					  tmpvar_34.w = 1.0;
					  tmpvar_34.xyz = color_1;
					  gl_FragData[0] = tmpvar_34;
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
					uniform highp float _Distortion;
					uniform highp float _DotSize;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec3 color_1;
					  lowp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  lowp vec3 tmpvar_3;
					  tmpvar_3 = (normalize(texture2D (_MainTex, uv_2)).xyz * 2.5);
					  highp vec3 color_4;
					  color_4 = tmpvar_3;
					  color_4 = (floor((
					    pow (color_4, vec3(0.65, 0.65, 0.65))
					   * 5.0)) / 5.0);
					  highp vec3 tmpvar_5;
					  tmpvar_5 = pow (color_4, vec3(1.538462, 1.538462, 1.538462));
					  color_4 = tmpvar_5;
					  color_1 = (tmpvar_5 * _Distortion);
					  highp vec2 uv_6;
					  uv_6 = uv_2;
					  highp vec3 col_7;
					  highp float tmpvar_8;
					  tmpvar_8 = (0.001953125 * _DotSize);
					  highp vec2 tmpvar_9;
					  tmpvar_9.x = -(tmpvar_8);
					  tmpvar_9.y = -(tmpvar_8);
					  lowp vec4 tmpvar_10;
					  highp vec2 P_11;
					  P_11 = (uv_6 + tmpvar_9);
					  tmpvar_10 = texture2D (_MainTex, P_11);
					  highp float tmpvar_12;
					  tmpvar_12 = dot (tmpvar_10, vec4(0.1125, 0.22125, 0.04125, 0.25));
					  highp vec2 tmpvar_13;
					  tmpvar_13.x = tmpvar_8;
					  tmpvar_13.y = -(tmpvar_8);
					  lowp vec4 tmpvar_14;
					  highp vec2 P_15;
					  P_15 = (uv_6 + tmpvar_13);
					  tmpvar_14 = texture2D (_MainTex, P_15);
					  highp float tmpvar_16;
					  tmpvar_16 = dot (tmpvar_14, vec4(0.1125, 0.22125, 0.04125, 0.25));
					  highp vec2 tmpvar_17;
					  tmpvar_17.y = 0.0;
					  tmpvar_17.x = -(tmpvar_8);
					  lowp vec4 tmpvar_18;
					  highp vec2 P_19;
					  P_19 = (uv_6 + tmpvar_17);
					  tmpvar_18 = texture2D (_MainTex, P_19);
					  highp float tmpvar_20;
					  tmpvar_20 = dot (tmpvar_18, vec4(0.1125, 0.22125, 0.04125, 0.25));
					  highp vec2 tmpvar_21;
					  tmpvar_21.x = -(tmpvar_8);
					  tmpvar_21.y = tmpvar_8;
					  lowp vec4 tmpvar_22;
					  highp vec2 P_23;
					  P_23 = (uv_6 + tmpvar_21);
					  tmpvar_22 = texture2D (_MainTex, P_23);
					  highp float tmpvar_24;
					  tmpvar_24 = dot (tmpvar_22, vec4(0.1125, 0.22125, 0.04125, 0.25));
					  highp vec2 tmpvar_25;
					  tmpvar_25.x = 0.0;
					  tmpvar_25.y = tmpvar_8;
					  lowp vec4 tmpvar_26;
					  highp vec2 P_27;
					  P_27 = (uv_6 + tmpvar_25);
					  tmpvar_26 = texture2D (_MainTex, P_27);
					  lowp vec4 tmpvar_28;
					  highp vec2 P_29;
					  P_29 = (uv_6 + vec2(tmpvar_8));
					  tmpvar_28 = texture2D (_MainTex, P_29);
					  highp float tmpvar_30;
					  tmpvar_30 = dot (tmpvar_28, vec4(0.1125, 0.22125, 0.04125, 0.25));
					  highp float tmpvar_31;
					  tmpvar_31 = (((
					    ((tmpvar_16 + tmpvar_30) + (2.0 * tmpvar_20))
					   - tmpvar_12) - (2.0 * tmpvar_20)) - tmpvar_24);
					  highp float tmpvar_32;
					  tmpvar_32 = (((
					    ((tmpvar_24 + (2.0 * dot (tmpvar_26, vec4(0.1125, 0.22125, 0.04125, 0.25)))) + tmpvar_30)
					   - tmpvar_12) - (2.0 * tmpvar_12)) - tmpvar_16);
					  if ((((tmpvar_31 * tmpvar_31) + (tmpvar_32 * tmpvar_32)) > 0.04)) {
					    col_7 = vec3(-1.0, -1.0, -1.0);
					  } else {
					    col_7 = vec3(0.0, 0.0, 0.0);
					  };
					  color_1 = (color_1 + col_7);
					  highp vec3 color_33;
					  color_33 = color_1;
					  if ((color_33.y > ((color_33.x + color_33.z) * 12.8))) {
					    color_33 = vec3(0.0, 0.0, 0.0);
					  };
					  color_33 = (((0.2126 * color_33.xxx) + (0.7152 * color_33.yyy)) + (0.0722 * color_33.zzz));
					  if ((color_33.x <= 0.95)) {
					    if ((color_33.x > 0.75)) {
					      color_33.x = (color_33.x * 0.9);
					    } else {
					      if ((color_33.x > 0.5)) {
					        color_33.x = (color_33.x * 0.7);
					        color_33.y = (color_33.y * 0.9);
					      } else {
					        if ((color_33.x > 0.25)) {
					          color_33.x = (color_33.x * 0.5);
					          color_33.y = (color_33.y * 0.75);
					        } else {
					          color_33.x = (color_33.x * 0.25);
					          color_33.y = (color_33.y * 0.5);
					        };
					      };
					    };
					  };
					  color_1 = color_33;
					  lowp vec4 tmpvar_34;
					  tmpvar_34.w = 1.0;
					  tmpvar_34.xyz = color_1;
					  gl_FragData[0] = tmpvar_34;
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
					uniform 	float _DotSize;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump float u_xlat16_0;
					lowp vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					mediump float u_xlat16_1;
					lowp vec4 u_xlat10_1;
					vec4 u_xlat2;
					lowp vec4 u_xlat10_2;
					bvec4 u_xlatb2;
					lowp vec4 u_xlat10_3;
					vec3 u_xlat4;
					mediump vec3 u_xlat16_4;
					mediump float u_xlat16_8;
					mediump float u_xlat16_9;
					float u_xlat12;
					mediump float u_xlat16_12;
					bool u_xlatb12;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD0.x;
					    u_xlat0.yzw = vec3(_DotSize) * vec3(0.001953125, 0.001953125, 0.001953125) + vs_TEXCOORD0.yxy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_0 = dot(u_xlat10_0, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat16_4.x = dot(u_xlat10_1, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat1.w = _DotSize * 0.001953125 + vs_TEXCOORD0.y;
					    u_xlat1.xz = (-vec2(_DotSize)) * vec2(0.001953125, 0.001953125) + vs_TEXCOORD0.xx;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_8 = dot(u_xlat10_2, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat16_4.x = u_xlat16_4.x * 2.0 + u_xlat16_8;
					    u_xlat16_4.x = u_xlat16_0 + u_xlat16_4.x;
					    u_xlat2.xyw = (-vec3(_DotSize)) * vec3(0.001953125, 0.001953125, 0.001953125) + vs_TEXCOORD0.xyy;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat16_12 = dot(u_xlat10_3, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat16_4.x = (-u_xlat16_12) + u_xlat16_4.x;
					    u_xlat16_4.x = (-u_xlat16_12) * 2.0 + u_xlat16_4.x;
					    u_xlat2.z = _DotSize * 0.001953125 + vs_TEXCOORD0.x;
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_9 = dot(u_xlat10_2, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat16_4.x = u_xlat16_4.x + (-u_xlat16_9);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_9;
					    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
					    u_xlat1.y = vs_TEXCOORD0.y;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat16_1 = dot(u_xlat10_1, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat16_0 = u_xlat16_1 * 2.0 + u_xlat16_0;
					    u_xlat16_0 = (-u_xlat16_12) + u_xlat16_0;
					    u_xlat16_0 = (-u_xlat16_1) * 2.0 + u_xlat16_0;
					    u_xlat16_0 = (-u_xlat16_8) + u_xlat16_0;
					    u_xlat0.x = u_xlat16_0 * u_xlat16_0 + u_xlat16_4.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(0.0399999991<u_xlat0.x);
					#else
					    u_xlatb0 = 0.0399999991<u_xlat0.x;
					#endif
					    u_xlat0.x = u_xlatb0 ? -1.0 : float(0.0);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_4.x = dot(u_xlat10_1, u_xlat10_1);
					    u_xlat16_4.x = inversesqrt(u_xlat16_4.x);
					    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat10_1.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.5, 2.5, 2.5);
					    u_xlat16_4.xyz = log2(u_xlat16_4.xyz);
					    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.649999976, 0.649999976, 0.649999976);
					    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
					    u_xlat4.xyz = u_xlat16_4.xyz * vec3(5.0, 5.0, 5.0);
					    u_xlat4.xyz = floor(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.200000003, 0.200000003, 0.200000003);
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.53846157, 1.53846157, 1.53846157);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat0.xyz = u_xlat4.xyz * vec3(vec3(_Distortion, _Distortion, _Distortion)) + u_xlat0.xxx;
					    u_xlat12 = u_xlat0.z + u_xlat0.x;
					    u_xlat12 = u_xlat12 * 12.8000002;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb12 = !!(u_xlat12<u_xlat0.y);
					#else
					    u_xlatb12 = u_xlat12<u_xlat0.y;
					#endif
					    u_xlat0.xyz = (bool(u_xlatb12)) ? vec3(0.0, 0.0, 0.0) : u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat1 = u_xlat0.xxxx * vec4(0.899999976, 0.699999988, 0.5, 0.75);
					    u_xlat0.yzw = u_xlat0.xxx * vec3(0.25, 0.5, 0.899999976);
					    u_xlatb2 = lessThan(vec4(0.949999988, 0.75, 0.5, 0.25), u_xlat0.xxxx);
					    u_xlat4.xy = (u_xlatb2.w) ? u_xlat1.zw : u_xlat0.yz;
					    u_xlat4.xy = (u_xlatb2.z) ? u_xlat1.yx : u_xlat4.xy;
					    u_xlat4.xy = (u_xlatb2.y) ? u_xlat0.wx : u_xlat4.xy;
					    u_xlat0.yz = (u_xlatb2.x) ? u_xlat0.xx : u_xlat4.xy;
					    SV_Target0.xyz = u_xlat0.yzx;
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
					uniform 	float _Distortion;
					uniform 	float _DotSize;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump float u_xlat16_0;
					lowp vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					mediump float u_xlat16_1;
					lowp vec4 u_xlat10_1;
					vec4 u_xlat2;
					lowp vec4 u_xlat10_2;
					bvec4 u_xlatb2;
					lowp vec4 u_xlat10_3;
					vec3 u_xlat4;
					mediump vec3 u_xlat16_4;
					mediump float u_xlat16_8;
					mediump float u_xlat16_9;
					float u_xlat12;
					mediump float u_xlat16_12;
					bool u_xlatb12;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD0.x;
					    u_xlat0.yzw = vec3(_DotSize) * vec3(0.001953125, 0.001953125, 0.001953125) + vs_TEXCOORD0.yxy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_0 = dot(u_xlat10_0, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat16_4.x = dot(u_xlat10_1, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat1.w = _DotSize * 0.001953125 + vs_TEXCOORD0.y;
					    u_xlat1.xz = (-vec2(_DotSize)) * vec2(0.001953125, 0.001953125) + vs_TEXCOORD0.xx;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_8 = dot(u_xlat10_2, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat16_4.x = u_xlat16_4.x * 2.0 + u_xlat16_8;
					    u_xlat16_4.x = u_xlat16_0 + u_xlat16_4.x;
					    u_xlat2.xyw = (-vec3(_DotSize)) * vec3(0.001953125, 0.001953125, 0.001953125) + vs_TEXCOORD0.xyy;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat16_12 = dot(u_xlat10_3, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat16_4.x = (-u_xlat16_12) + u_xlat16_4.x;
					    u_xlat16_4.x = (-u_xlat16_12) * 2.0 + u_xlat16_4.x;
					    u_xlat2.z = _DotSize * 0.001953125 + vs_TEXCOORD0.x;
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_9 = dot(u_xlat10_2, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat16_4.x = u_xlat16_4.x + (-u_xlat16_9);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_9;
					    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
					    u_xlat1.y = vs_TEXCOORD0.y;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat16_1 = dot(u_xlat10_1, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat16_0 = u_xlat16_1 * 2.0 + u_xlat16_0;
					    u_xlat16_0 = (-u_xlat16_12) + u_xlat16_0;
					    u_xlat16_0 = (-u_xlat16_1) * 2.0 + u_xlat16_0;
					    u_xlat16_0 = (-u_xlat16_8) + u_xlat16_0;
					    u_xlat0.x = u_xlat16_0 * u_xlat16_0 + u_xlat16_4.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(0.0399999991<u_xlat0.x);
					#else
					    u_xlatb0 = 0.0399999991<u_xlat0.x;
					#endif
					    u_xlat0.x = u_xlatb0 ? -1.0 : float(0.0);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_4.x = dot(u_xlat10_1, u_xlat10_1);
					    u_xlat16_4.x = inversesqrt(u_xlat16_4.x);
					    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat10_1.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.5, 2.5, 2.5);
					    u_xlat16_4.xyz = log2(u_xlat16_4.xyz);
					    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.649999976, 0.649999976, 0.649999976);
					    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
					    u_xlat4.xyz = u_xlat16_4.xyz * vec3(5.0, 5.0, 5.0);
					    u_xlat4.xyz = floor(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.200000003, 0.200000003, 0.200000003);
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.53846157, 1.53846157, 1.53846157);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat0.xyz = u_xlat4.xyz * vec3(vec3(_Distortion, _Distortion, _Distortion)) + u_xlat0.xxx;
					    u_xlat12 = u_xlat0.z + u_xlat0.x;
					    u_xlat12 = u_xlat12 * 12.8000002;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb12 = !!(u_xlat12<u_xlat0.y);
					#else
					    u_xlatb12 = u_xlat12<u_xlat0.y;
					#endif
					    u_xlat0.xyz = (bool(u_xlatb12)) ? vec3(0.0, 0.0, 0.0) : u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat1 = u_xlat0.xxxx * vec4(0.899999976, 0.699999988, 0.5, 0.75);
					    u_xlat0.yzw = u_xlat0.xxx * vec3(0.25, 0.5, 0.899999976);
					    u_xlatb2 = lessThan(vec4(0.949999988, 0.75, 0.5, 0.25), u_xlat0.xxxx);
					    u_xlat4.xy = (u_xlatb2.w) ? u_xlat1.zw : u_xlat0.yz;
					    u_xlat4.xy = (u_xlatb2.z) ? u_xlat1.yx : u_xlat4.xy;
					    u_xlat4.xy = (u_xlatb2.y) ? u_xlat0.wx : u_xlat4.xy;
					    u_xlat0.yz = (u_xlatb2.x) ? u_xlat0.xx : u_xlat4.xy;
					    SV_Target0.xyz = u_xlat0.yzx;
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
					uniform 	float _Distortion;
					uniform 	float _DotSize;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump float u_xlat16_0;
					lowp vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					mediump float u_xlat16_1;
					lowp vec4 u_xlat10_1;
					vec4 u_xlat2;
					lowp vec4 u_xlat10_2;
					bvec4 u_xlatb2;
					lowp vec4 u_xlat10_3;
					vec3 u_xlat4;
					mediump vec3 u_xlat16_4;
					mediump float u_xlat16_8;
					mediump float u_xlat16_9;
					float u_xlat12;
					mediump float u_xlat16_12;
					bool u_xlatb12;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD0.x;
					    u_xlat0.yzw = vec3(_DotSize) * vec3(0.001953125, 0.001953125, 0.001953125) + vs_TEXCOORD0.yxy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_0 = dot(u_xlat10_0, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat16_4.x = dot(u_xlat10_1, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat1.w = _DotSize * 0.001953125 + vs_TEXCOORD0.y;
					    u_xlat1.xz = (-vec2(_DotSize)) * vec2(0.001953125, 0.001953125) + vs_TEXCOORD0.xx;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_8 = dot(u_xlat10_2, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat16_4.x = u_xlat16_4.x * 2.0 + u_xlat16_8;
					    u_xlat16_4.x = u_xlat16_0 + u_xlat16_4.x;
					    u_xlat2.xyw = (-vec3(_DotSize)) * vec3(0.001953125, 0.001953125, 0.001953125) + vs_TEXCOORD0.xyy;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat16_12 = dot(u_xlat10_3, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat16_4.x = (-u_xlat16_12) + u_xlat16_4.x;
					    u_xlat16_4.x = (-u_xlat16_12) * 2.0 + u_xlat16_4.x;
					    u_xlat2.z = _DotSize * 0.001953125 + vs_TEXCOORD0.x;
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_9 = dot(u_xlat10_2, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat16_4.x = u_xlat16_4.x + (-u_xlat16_9);
					    u_xlat16_0 = u_xlat16_0 + u_xlat16_9;
					    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
					    u_xlat1.y = vs_TEXCOORD0.y;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat16_1 = dot(u_xlat10_1, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat16_0 = u_xlat16_1 * 2.0 + u_xlat16_0;
					    u_xlat16_0 = (-u_xlat16_12) + u_xlat16_0;
					    u_xlat16_0 = (-u_xlat16_1) * 2.0 + u_xlat16_0;
					    u_xlat16_0 = (-u_xlat16_8) + u_xlat16_0;
					    u_xlat0.x = u_xlat16_0 * u_xlat16_0 + u_xlat16_4.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(0.0399999991<u_xlat0.x);
					#else
					    u_xlatb0 = 0.0399999991<u_xlat0.x;
					#endif
					    u_xlat0.x = u_xlatb0 ? -1.0 : float(0.0);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_4.x = dot(u_xlat10_1, u_xlat10_1);
					    u_xlat16_4.x = inversesqrt(u_xlat16_4.x);
					    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat10_1.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.5, 2.5, 2.5);
					    u_xlat16_4.xyz = log2(u_xlat16_4.xyz);
					    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.649999976, 0.649999976, 0.649999976);
					    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
					    u_xlat4.xyz = u_xlat16_4.xyz * vec3(5.0, 5.0, 5.0);
					    u_xlat4.xyz = floor(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.200000003, 0.200000003, 0.200000003);
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.53846157, 1.53846157, 1.53846157);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat0.xyz = u_xlat4.xyz * vec3(vec3(_Distortion, _Distortion, _Distortion)) + u_xlat0.xxx;
					    u_xlat12 = u_xlat0.z + u_xlat0.x;
					    u_xlat12 = u_xlat12 * 12.8000002;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb12 = !!(u_xlat12<u_xlat0.y);
					#else
					    u_xlatb12 = u_xlat12<u_xlat0.y;
					#endif
					    u_xlat0.xyz = (bool(u_xlatb12)) ? vec3(0.0, 0.0, 0.0) : u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat1 = u_xlat0.xxxx * vec4(0.899999976, 0.699999988, 0.5, 0.75);
					    u_xlat0.yzw = u_xlat0.xxx * vec3(0.25, 0.5, 0.899999976);
					    u_xlatb2 = lessThan(vec4(0.949999988, 0.75, 0.5, 0.25), u_xlat0.xxxx);
					    u_xlat4.xy = (u_xlatb2.w) ? u_xlat1.zw : u_xlat0.yz;
					    u_xlat4.xy = (u_xlatb2.z) ? u_xlat1.yx : u_xlat4.xy;
					    u_xlat4.xy = (u_xlatb2.y) ? u_xlat0.wx : u_xlat4.xy;
					    u_xlat0.yz = (u_xlatb2.x) ? u_xlat0.xx : u_xlat4.xy;
					    SV_Target0.xyz = u_xlat0.yzx;
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