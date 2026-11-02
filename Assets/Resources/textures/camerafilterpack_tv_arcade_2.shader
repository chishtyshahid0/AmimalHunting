Shader "CameraFilterPack/TV_ARCADE_2" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 48780
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
					uniform highp float _Value;
					uniform highp float _Value2;
					uniform highp float _Value3;
					uniform highp vec4 _ScreenResolution;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  highp vec4 text_2;
					  highp vec3 col_3;
					  highp vec2 uv_4;
					  highp vec2 q_5;
					  q_5 = xlv_TEXCOORD0;
					  highp vec2 uv_6;
					  uv_6 = ((q_5 - 0.5) * 2.0);
					  uv_6 = (uv_6 * 1.1);
					  highp float tmpvar_7;
					  tmpvar_7 = (abs(uv_6.y) * 0.2);
					  uv_6.x = (uv_6.x * (1.0 + (tmpvar_7 * tmpvar_7)));
					  highp float tmpvar_8;
					  tmpvar_8 = (abs(uv_6.x) * 0.25);
					  uv_6.y = (uv_6.y * (1.0 + (tmpvar_8 * tmpvar_8)));
					  uv_6 = ((uv_6 / 2.0) + 0.5);
					  uv_6 = ((uv_6 * 0.92) + 0.04);
					  highp float tmpvar_9;
					  tmpvar_9 = (((
					    sin(((0.3 * _TimeX) + (uv_6.y * 21.0)))
					   * 
					    sin(((0.7 * _TimeX) + (uv_6.y * 29.0)))
					  ) * sin(
					    ((0.3 + (0.33 * _TimeX)) + (uv_6.y * 31.0))
					  )) * 0.0017);
					  highp vec2 tmpvar_10;
					  tmpvar_10.x = ((tmpvar_9 + uv_6.x) + 0.001);
					  tmpvar_10.y = (uv_6.y + 0.001);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_MainTex, tmpvar_10);
					  text_2 = tmpvar_11;
					  col_3 = (text_2.xyz + 0.05);
					  highp vec2 tmpvar_12;
					  tmpvar_12.x = (uv_6.x * (_ScreenResolution.x / _ScreenResolution.y));
					  tmpvar_12.y = (uv_6.y * _Value);
					  highp float tmpvar_13;
					  tmpvar_13 = (clamp ((
					    (tmpvar_12.y - fract((-(_TimeX) * _Value2)))
					   - 0.05), 0.0, 0.1) * 10.0);
					  highp vec2 tmpvar_14;
					  tmpvar_14.y = 0.0;
					  highp float tmpvar_15;
					  tmpvar_15 = (tmpvar_13 - 0.5);
					  tmpvar_14.x = ((sin(
					    (tmpvar_13 * 10.0)
					  ) * (
					    (-4.0 * (tmpvar_15 * tmpvar_15))
					   + 1.0)) * 0.02);
					  uv_4 = (uv_6 + tmpvar_14);
					  highp vec2 tmpvar_16;
					  tmpvar_16.y = -0.02;
					  tmpvar_16.x = (tmpvar_9 + 0.025);
					  lowp vec4 tmpvar_17;
					  highp vec2 P_18;
					  P_18 = ((0.75 * tmpvar_16) + (uv_4 + vec2(0.001, 0.001)));
					  tmpvar_17 = texture2D (_MainTex, P_18);
					  text_2 = tmpvar_17;
					  col_3.x = (col_3.x + (0.08 * text_2.x));
					  col_3.y = (col_3.y + (0.05 * text_2.y));
					  col_3.z = (col_3.z + (0.08 * text_2.z));
					  col_3 = (clamp ((
					    (col_3 * 0.6)
					   + 
					    ((0.4 * col_3) * col_3)
					  ), vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0)) * pow ((
					    (((16.0 * uv_4.x) * uv_4.y) * (1.0 - uv_4.x))
					   * 
					    (1.0 - uv_4.y)
					  ), 0.3));
					  col_3 = (col_3 * vec3(2.66, 2.94, 2.66));
					  col_3 = (col_3 * (0.4 + (0.7 * 
					    (pow (clamp ((0.35 + 
					      (0.35 * sin(((3.5 * _TimeX) + (
					        (uv_4.y * _ScreenResolution.y)
					       * 1.5))))
					    ), 0.0, 1.0), 1.7) * _Value3)
					  )));
					  col_3 = (col_3 * (1.0 + (0.01 * 
					    sin((110.0 * _TimeX))
					  )));
					  if (((uv_4.x < 0.0) || (uv_4.x > 1.0))) {
					    col_3 = vec3(0.0, 0.0, 0.0);
					  };
					  if (((uv_4.y < 0.0) || (uv_4.y > 1.0))) {
					    col_3 = vec3(0.0, 0.0, 0.0);
					  };
					  highp float tmpvar_19;
					  tmpvar_19 = (xlv_TEXCOORD0.x * _ScreenResolution.x);
					  highp float tmpvar_20;
					  tmpvar_20 = fract(abs(tmpvar_19));
					  highp float tmpvar_21;
					  if ((tmpvar_19 >= 0.0)) {
					    tmpvar_21 = tmpvar_20;
					  } else {
					    tmpvar_21 = -(tmpvar_20);
					  };
					  col_3 = (col_3 * (1.0 - (0.65 * 
					    clamp ((tmpvar_21 - 1.0), 0.0, 1.0)
					  )));
					  highp vec4 tmpvar_22;
					  tmpvar_22.w = 1.0;
					  tmpvar_22.xyz = col_3;
					  tmpvar_1 = tmpvar_22;
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
					uniform highp float _TimeX;
					uniform highp float _Value;
					uniform highp float _Value2;
					uniform highp float _Value3;
					uniform highp vec4 _ScreenResolution;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  highp vec4 text_2;
					  highp vec3 col_3;
					  highp vec2 uv_4;
					  highp vec2 q_5;
					  q_5 = xlv_TEXCOORD0;
					  highp vec2 uv_6;
					  uv_6 = ((q_5 - 0.5) * 2.0);
					  uv_6 = (uv_6 * 1.1);
					  highp float tmpvar_7;
					  tmpvar_7 = (abs(uv_6.y) * 0.2);
					  uv_6.x = (uv_6.x * (1.0 + (tmpvar_7 * tmpvar_7)));
					  highp float tmpvar_8;
					  tmpvar_8 = (abs(uv_6.x) * 0.25);
					  uv_6.y = (uv_6.y * (1.0 + (tmpvar_8 * tmpvar_8)));
					  uv_6 = ((uv_6 / 2.0) + 0.5);
					  uv_6 = ((uv_6 * 0.92) + 0.04);
					  highp float tmpvar_9;
					  tmpvar_9 = (((
					    sin(((0.3 * _TimeX) + (uv_6.y * 21.0)))
					   * 
					    sin(((0.7 * _TimeX) + (uv_6.y * 29.0)))
					  ) * sin(
					    ((0.3 + (0.33 * _TimeX)) + (uv_6.y * 31.0))
					  )) * 0.0017);
					  highp vec2 tmpvar_10;
					  tmpvar_10.x = ((tmpvar_9 + uv_6.x) + 0.001);
					  tmpvar_10.y = (uv_6.y + 0.001);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_MainTex, tmpvar_10);
					  text_2 = tmpvar_11;
					  col_3 = (text_2.xyz + 0.05);
					  highp vec2 tmpvar_12;
					  tmpvar_12.x = (uv_6.x * (_ScreenResolution.x / _ScreenResolution.y));
					  tmpvar_12.y = (uv_6.y * _Value);
					  highp float tmpvar_13;
					  tmpvar_13 = (clamp ((
					    (tmpvar_12.y - fract((-(_TimeX) * _Value2)))
					   - 0.05), 0.0, 0.1) * 10.0);
					  highp vec2 tmpvar_14;
					  tmpvar_14.y = 0.0;
					  highp float tmpvar_15;
					  tmpvar_15 = (tmpvar_13 - 0.5);
					  tmpvar_14.x = ((sin(
					    (tmpvar_13 * 10.0)
					  ) * (
					    (-4.0 * (tmpvar_15 * tmpvar_15))
					   + 1.0)) * 0.02);
					  uv_4 = (uv_6 + tmpvar_14);
					  highp vec2 tmpvar_16;
					  tmpvar_16.y = -0.02;
					  tmpvar_16.x = (tmpvar_9 + 0.025);
					  lowp vec4 tmpvar_17;
					  highp vec2 P_18;
					  P_18 = ((0.75 * tmpvar_16) + (uv_4 + vec2(0.001, 0.001)));
					  tmpvar_17 = texture2D (_MainTex, P_18);
					  text_2 = tmpvar_17;
					  col_3.x = (col_3.x + (0.08 * text_2.x));
					  col_3.y = (col_3.y + (0.05 * text_2.y));
					  col_3.z = (col_3.z + (0.08 * text_2.z));
					  col_3 = (clamp ((
					    (col_3 * 0.6)
					   + 
					    ((0.4 * col_3) * col_3)
					  ), vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0)) * pow ((
					    (((16.0 * uv_4.x) * uv_4.y) * (1.0 - uv_4.x))
					   * 
					    (1.0 - uv_4.y)
					  ), 0.3));
					  col_3 = (col_3 * vec3(2.66, 2.94, 2.66));
					  col_3 = (col_3 * (0.4 + (0.7 * 
					    (pow (clamp ((0.35 + 
					      (0.35 * sin(((3.5 * _TimeX) + (
					        (uv_4.y * _ScreenResolution.y)
					       * 1.5))))
					    ), 0.0, 1.0), 1.7) * _Value3)
					  )));
					  col_3 = (col_3 * (1.0 + (0.01 * 
					    sin((110.0 * _TimeX))
					  )));
					  if (((uv_4.x < 0.0) || (uv_4.x > 1.0))) {
					    col_3 = vec3(0.0, 0.0, 0.0);
					  };
					  if (((uv_4.y < 0.0) || (uv_4.y > 1.0))) {
					    col_3 = vec3(0.0, 0.0, 0.0);
					  };
					  highp float tmpvar_19;
					  tmpvar_19 = (xlv_TEXCOORD0.x * _ScreenResolution.x);
					  highp float tmpvar_20;
					  tmpvar_20 = fract(abs(tmpvar_19));
					  highp float tmpvar_21;
					  if ((tmpvar_19 >= 0.0)) {
					    tmpvar_21 = tmpvar_20;
					  } else {
					    tmpvar_21 = -(tmpvar_20);
					  };
					  col_3 = (col_3 * (1.0 - (0.65 * 
					    clamp ((tmpvar_21 - 1.0), 0.0, 1.0)
					  )));
					  highp vec4 tmpvar_22;
					  tmpvar_22.w = 1.0;
					  tmpvar_22.xyz = col_3;
					  tmpvar_1 = tmpvar_22;
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
					uniform highp float _TimeX;
					uniform highp float _Value;
					uniform highp float _Value2;
					uniform highp float _Value3;
					uniform highp vec4 _ScreenResolution;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  highp vec4 text_2;
					  highp vec3 col_3;
					  highp vec2 uv_4;
					  highp vec2 q_5;
					  q_5 = xlv_TEXCOORD0;
					  highp vec2 uv_6;
					  uv_6 = ((q_5 - 0.5) * 2.0);
					  uv_6 = (uv_6 * 1.1);
					  highp float tmpvar_7;
					  tmpvar_7 = (abs(uv_6.y) * 0.2);
					  uv_6.x = (uv_6.x * (1.0 + (tmpvar_7 * tmpvar_7)));
					  highp float tmpvar_8;
					  tmpvar_8 = (abs(uv_6.x) * 0.25);
					  uv_6.y = (uv_6.y * (1.0 + (tmpvar_8 * tmpvar_8)));
					  uv_6 = ((uv_6 / 2.0) + 0.5);
					  uv_6 = ((uv_6 * 0.92) + 0.04);
					  highp float tmpvar_9;
					  tmpvar_9 = (((
					    sin(((0.3 * _TimeX) + (uv_6.y * 21.0)))
					   * 
					    sin(((0.7 * _TimeX) + (uv_6.y * 29.0)))
					  ) * sin(
					    ((0.3 + (0.33 * _TimeX)) + (uv_6.y * 31.0))
					  )) * 0.0017);
					  highp vec2 tmpvar_10;
					  tmpvar_10.x = ((tmpvar_9 + uv_6.x) + 0.001);
					  tmpvar_10.y = (uv_6.y + 0.001);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_MainTex, tmpvar_10);
					  text_2 = tmpvar_11;
					  col_3 = (text_2.xyz + 0.05);
					  highp vec2 tmpvar_12;
					  tmpvar_12.x = (uv_6.x * (_ScreenResolution.x / _ScreenResolution.y));
					  tmpvar_12.y = (uv_6.y * _Value);
					  highp float tmpvar_13;
					  tmpvar_13 = (clamp ((
					    (tmpvar_12.y - fract((-(_TimeX) * _Value2)))
					   - 0.05), 0.0, 0.1) * 10.0);
					  highp vec2 tmpvar_14;
					  tmpvar_14.y = 0.0;
					  highp float tmpvar_15;
					  tmpvar_15 = (tmpvar_13 - 0.5);
					  tmpvar_14.x = ((sin(
					    (tmpvar_13 * 10.0)
					  ) * (
					    (-4.0 * (tmpvar_15 * tmpvar_15))
					   + 1.0)) * 0.02);
					  uv_4 = (uv_6 + tmpvar_14);
					  highp vec2 tmpvar_16;
					  tmpvar_16.y = -0.02;
					  tmpvar_16.x = (tmpvar_9 + 0.025);
					  lowp vec4 tmpvar_17;
					  highp vec2 P_18;
					  P_18 = ((0.75 * tmpvar_16) + (uv_4 + vec2(0.001, 0.001)));
					  tmpvar_17 = texture2D (_MainTex, P_18);
					  text_2 = tmpvar_17;
					  col_3.x = (col_3.x + (0.08 * text_2.x));
					  col_3.y = (col_3.y + (0.05 * text_2.y));
					  col_3.z = (col_3.z + (0.08 * text_2.z));
					  col_3 = (clamp ((
					    (col_3 * 0.6)
					   + 
					    ((0.4 * col_3) * col_3)
					  ), vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0)) * pow ((
					    (((16.0 * uv_4.x) * uv_4.y) * (1.0 - uv_4.x))
					   * 
					    (1.0 - uv_4.y)
					  ), 0.3));
					  col_3 = (col_3 * vec3(2.66, 2.94, 2.66));
					  col_3 = (col_3 * (0.4 + (0.7 * 
					    (pow (clamp ((0.35 + 
					      (0.35 * sin(((3.5 * _TimeX) + (
					        (uv_4.y * _ScreenResolution.y)
					       * 1.5))))
					    ), 0.0, 1.0), 1.7) * _Value3)
					  )));
					  col_3 = (col_3 * (1.0 + (0.01 * 
					    sin((110.0 * _TimeX))
					  )));
					  if (((uv_4.x < 0.0) || (uv_4.x > 1.0))) {
					    col_3 = vec3(0.0, 0.0, 0.0);
					  };
					  if (((uv_4.y < 0.0) || (uv_4.y > 1.0))) {
					    col_3 = vec3(0.0, 0.0, 0.0);
					  };
					  highp float tmpvar_19;
					  tmpvar_19 = (xlv_TEXCOORD0.x * _ScreenResolution.x);
					  highp float tmpvar_20;
					  tmpvar_20 = fract(abs(tmpvar_19));
					  highp float tmpvar_21;
					  if ((tmpvar_19 >= 0.0)) {
					    tmpvar_21 = tmpvar_20;
					  } else {
					    tmpvar_21 = -(tmpvar_20);
					  };
					  col_3 = (col_3 * (1.0 - (0.65 * 
					    clamp ((tmpvar_21 - 1.0), 0.0, 1.0)
					  )));
					  highp vec4 tmpvar_22;
					  tmpvar_22.w = 1.0;
					  tmpvar_22.xyz = col_3;
					  tmpvar_1 = tmpvar_22;
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
					uniform 	float _TimeX;
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	vec4 _ScreenResolution;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					ivec2 u_xlati0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_1;
					lowp vec3 u_xlat10_1;
					vec2 u_xlat2;
					mediump vec3 u_xlat16_2;
					lowp vec3 u_xlat10_2;
					vec2 u_xlat4;
					mediump vec2 u_xlat16_4;
					float u_xlat5;
					float u_xlat6;
					vec2 u_xlat7;
					vec2 u_xlat8;
					ivec2 u_xlati8;
					float u_xlat9;
					float u_xlat12;
					mediump float u_xlat16_12;
					void main()
					{
					    u_xlat0.x = _Value2 * (-_TimeX);
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat16_4.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_4.xy = u_xlat16_4.xy * vec2(2.20000005, 2.20000005);
					    u_xlat16_12 = abs(u_xlat16_4.y) * 0.200000003;
					    u_xlat16_12 = u_xlat16_12 * u_xlat16_12 + 1.0;
					    u_xlat1.x = u_xlat16_12 * u_xlat16_4.x;
					    u_xlat4.x = abs(u_xlat1.x) * 0.25;
					    u_xlat4.x = u_xlat4.x * u_xlat4.x + 1.0;
					    u_xlat1.y = u_xlat4.x * u_xlat16_4.y;
					    u_xlat4.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
					    u_xlat1.yzw = u_xlat4.xyy * vec3(0.920000017, 0.920000017, 0.920000017) + vec3(0.0399999991, 0.0399999991, 0.0409999974);
					    u_xlat0.x = u_xlat1.z * _Value + (-u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + -0.0500000007;
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = min(u_xlat0.x, 0.100000001);
					    u_xlat12 = u_xlat0.x * 10.0 + -0.5;
					    u_xlat0.x = u_xlat0.x * 100.0;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat12 * -4.0 + 1.0;
					    u_xlat0.x = u_xlat12 * u_xlat0.x;
					    u_xlat2.x = u_xlat0.x * 0.0199999996;
					    u_xlat7.x = u_xlat4.y * 0.920000017;
					    u_xlat7.y = u_xlat4.x * 0.920000017 + 0.0399999991;
					    u_xlat0.y = u_xlat4.y * 0.920000017 + -0.0149999997;
					    u_xlat2.y = 0.0399999991;
					    u_xlat8.xy = u_xlat2.xy + u_xlat7.yx;
					    u_xlat2.xy = u_xlat1.zz * vec2(21.0, 29.0);
					    u_xlat2.xy = vec2(_TimeX) * vec2(0.300000012, 0.699999988) + u_xlat2.xy;
					    u_xlat2.xy = sin(u_xlat2.xy);
					    u_xlat2.x = u_xlat2.y * u_xlat2.x;
					    u_xlat6 = _TimeX * 0.330000013 + 0.300000012;
					    u_xlat9 = u_xlat1.z * 31.0 + u_xlat6;
					    u_xlat9 = sin(u_xlat9);
					    u_xlat9 = u_xlat9 * u_xlat2.x;
					    u_xlat2.x = u_xlat9 * 0.00170000002 + 0.0250000004;
					    u_xlat5 = u_xlat9 * 0.00170000002 + u_xlat1.y;
					    u_xlat1.x = u_xlat5 + 0.00100000005;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat1.xw).xyz;
					    u_xlat16_1.xyz = u_xlat10_1.xyz + vec3(0.0500000007, 0.0500000007, 0.0500000007);
					    u_xlat0.x = u_xlat2.x * 0.75 + u_xlat8.x;
					    u_xlat0.xy = u_xlat0.xy + vec2(0.00100000005, 0.0409999974);
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = u_xlat10_2.xyz * vec3(0.0799999982, 0.0500000007, 0.0799999982) + u_xlat16_1.xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
					    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.600000024, 0.600000024, 0.600000024) + u_xlat16_2.xyz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
					#else
					    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
					#endif
					    u_xlat0.x = u_xlat8.x * u_xlat8.y;
					    u_xlat0.x = u_xlat0.x * 16.0;
					    u_xlat2.xy = (-u_xlat8.xy) + vec2(1.0, 1.0);
					    u_xlat0.x = u_xlat0.x * u_xlat2.x;
					    u_xlat0.x = u_xlat2.y * u_xlat0.x;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.300000012;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.66000009, 2.94000006, 2.66000009);
					    u_xlat0.x = u_xlat8.y * _ScreenResolution.y;
					    u_xlat4.x = _TimeX * 3.5;
					    u_xlat0.x = u_xlat0.x * 1.5 + u_xlat4.x;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.349999994 + 0.349999994;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 1.70000005;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _Value3;
					    u_xlat0.x = u_xlat0.x * 0.699999988 + 0.400000006;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlat0.x = _TimeX * 110.0;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.00999999978 + 1.0;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlati0.xy = ivec2(uvec2(lessThan(u_xlat8.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy) * 0xFFFFFFFFu);
					    u_xlati8.xy = ivec2(uvec2(lessThan(vec4(1.0, 1.0, 1.0, 1.0), u_xlat8.xyxy).xy) * 0xFFFFFFFFu);
					    u_xlati0.xy = ivec2(uvec2(u_xlati8.xy) | uvec2(u_xlati0.xy));
					    u_xlati0.x = int(uint(u_xlati0.y) | uint(u_xlati0.x));
					    u_xlat0.xyz = (u_xlati0.x != 0) ? vec3(0.0, 0.0, 0.0) : u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz;
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
					uniform 	float _Value3;
					uniform 	vec4 _ScreenResolution;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					ivec2 u_xlati0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_1;
					lowp vec3 u_xlat10_1;
					vec2 u_xlat2;
					mediump vec3 u_xlat16_2;
					lowp vec3 u_xlat10_2;
					vec2 u_xlat4;
					mediump vec2 u_xlat16_4;
					float u_xlat5;
					float u_xlat6;
					vec2 u_xlat7;
					vec2 u_xlat8;
					ivec2 u_xlati8;
					float u_xlat9;
					float u_xlat12;
					mediump float u_xlat16_12;
					void main()
					{
					    u_xlat0.x = _Value2 * (-_TimeX);
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat16_4.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_4.xy = u_xlat16_4.xy * vec2(2.20000005, 2.20000005);
					    u_xlat16_12 = abs(u_xlat16_4.y) * 0.200000003;
					    u_xlat16_12 = u_xlat16_12 * u_xlat16_12 + 1.0;
					    u_xlat1.x = u_xlat16_12 * u_xlat16_4.x;
					    u_xlat4.x = abs(u_xlat1.x) * 0.25;
					    u_xlat4.x = u_xlat4.x * u_xlat4.x + 1.0;
					    u_xlat1.y = u_xlat4.x * u_xlat16_4.y;
					    u_xlat4.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
					    u_xlat1.yzw = u_xlat4.xyy * vec3(0.920000017, 0.920000017, 0.920000017) + vec3(0.0399999991, 0.0399999991, 0.0409999974);
					    u_xlat0.x = u_xlat1.z * _Value + (-u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + -0.0500000007;
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = min(u_xlat0.x, 0.100000001);
					    u_xlat12 = u_xlat0.x * 10.0 + -0.5;
					    u_xlat0.x = u_xlat0.x * 100.0;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat12 * -4.0 + 1.0;
					    u_xlat0.x = u_xlat12 * u_xlat0.x;
					    u_xlat2.x = u_xlat0.x * 0.0199999996;
					    u_xlat7.x = u_xlat4.y * 0.920000017;
					    u_xlat7.y = u_xlat4.x * 0.920000017 + 0.0399999991;
					    u_xlat0.y = u_xlat4.y * 0.920000017 + -0.0149999997;
					    u_xlat2.y = 0.0399999991;
					    u_xlat8.xy = u_xlat2.xy + u_xlat7.yx;
					    u_xlat2.xy = u_xlat1.zz * vec2(21.0, 29.0);
					    u_xlat2.xy = vec2(_TimeX) * vec2(0.300000012, 0.699999988) + u_xlat2.xy;
					    u_xlat2.xy = sin(u_xlat2.xy);
					    u_xlat2.x = u_xlat2.y * u_xlat2.x;
					    u_xlat6 = _TimeX * 0.330000013 + 0.300000012;
					    u_xlat9 = u_xlat1.z * 31.0 + u_xlat6;
					    u_xlat9 = sin(u_xlat9);
					    u_xlat9 = u_xlat9 * u_xlat2.x;
					    u_xlat2.x = u_xlat9 * 0.00170000002 + 0.0250000004;
					    u_xlat5 = u_xlat9 * 0.00170000002 + u_xlat1.y;
					    u_xlat1.x = u_xlat5 + 0.00100000005;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat1.xw).xyz;
					    u_xlat16_1.xyz = u_xlat10_1.xyz + vec3(0.0500000007, 0.0500000007, 0.0500000007);
					    u_xlat0.x = u_xlat2.x * 0.75 + u_xlat8.x;
					    u_xlat0.xy = u_xlat0.xy + vec2(0.00100000005, 0.0409999974);
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = u_xlat10_2.xyz * vec3(0.0799999982, 0.0500000007, 0.0799999982) + u_xlat16_1.xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
					    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.600000024, 0.600000024, 0.600000024) + u_xlat16_2.xyz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
					#else
					    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
					#endif
					    u_xlat0.x = u_xlat8.x * u_xlat8.y;
					    u_xlat0.x = u_xlat0.x * 16.0;
					    u_xlat2.xy = (-u_xlat8.xy) + vec2(1.0, 1.0);
					    u_xlat0.x = u_xlat0.x * u_xlat2.x;
					    u_xlat0.x = u_xlat2.y * u_xlat0.x;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.300000012;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.66000009, 2.94000006, 2.66000009);
					    u_xlat0.x = u_xlat8.y * _ScreenResolution.y;
					    u_xlat4.x = _TimeX * 3.5;
					    u_xlat0.x = u_xlat0.x * 1.5 + u_xlat4.x;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.349999994 + 0.349999994;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 1.70000005;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _Value3;
					    u_xlat0.x = u_xlat0.x * 0.699999988 + 0.400000006;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlat0.x = _TimeX * 110.0;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.00999999978 + 1.0;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlati0.xy = ivec2(uvec2(lessThan(u_xlat8.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy) * 0xFFFFFFFFu);
					    u_xlati8.xy = ivec2(uvec2(lessThan(vec4(1.0, 1.0, 1.0, 1.0), u_xlat8.xyxy).xy) * 0xFFFFFFFFu);
					    u_xlati0.xy = ivec2(uvec2(u_xlati8.xy) | uvec2(u_xlati0.xy));
					    u_xlati0.x = int(uint(u_xlati0.y) | uint(u_xlati0.x));
					    u_xlat0.xyz = (u_xlati0.x != 0) ? vec3(0.0, 0.0, 0.0) : u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz;
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
					uniform 	float _Value3;
					uniform 	vec4 _ScreenResolution;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					ivec2 u_xlati0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_1;
					lowp vec3 u_xlat10_1;
					vec2 u_xlat2;
					mediump vec3 u_xlat16_2;
					lowp vec3 u_xlat10_2;
					vec2 u_xlat4;
					mediump vec2 u_xlat16_4;
					float u_xlat5;
					float u_xlat6;
					vec2 u_xlat7;
					vec2 u_xlat8;
					ivec2 u_xlati8;
					float u_xlat9;
					float u_xlat12;
					mediump float u_xlat16_12;
					void main()
					{
					    u_xlat0.x = _Value2 * (-_TimeX);
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat16_4.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_4.xy = u_xlat16_4.xy * vec2(2.20000005, 2.20000005);
					    u_xlat16_12 = abs(u_xlat16_4.y) * 0.200000003;
					    u_xlat16_12 = u_xlat16_12 * u_xlat16_12 + 1.0;
					    u_xlat1.x = u_xlat16_12 * u_xlat16_4.x;
					    u_xlat4.x = abs(u_xlat1.x) * 0.25;
					    u_xlat4.x = u_xlat4.x * u_xlat4.x + 1.0;
					    u_xlat1.y = u_xlat4.x * u_xlat16_4.y;
					    u_xlat4.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
					    u_xlat1.yzw = u_xlat4.xyy * vec3(0.920000017, 0.920000017, 0.920000017) + vec3(0.0399999991, 0.0399999991, 0.0409999974);
					    u_xlat0.x = u_xlat1.z * _Value + (-u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + -0.0500000007;
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = min(u_xlat0.x, 0.100000001);
					    u_xlat12 = u_xlat0.x * 10.0 + -0.5;
					    u_xlat0.x = u_xlat0.x * 100.0;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat12 * -4.0 + 1.0;
					    u_xlat0.x = u_xlat12 * u_xlat0.x;
					    u_xlat2.x = u_xlat0.x * 0.0199999996;
					    u_xlat7.x = u_xlat4.y * 0.920000017;
					    u_xlat7.y = u_xlat4.x * 0.920000017 + 0.0399999991;
					    u_xlat0.y = u_xlat4.y * 0.920000017 + -0.0149999997;
					    u_xlat2.y = 0.0399999991;
					    u_xlat8.xy = u_xlat2.xy + u_xlat7.yx;
					    u_xlat2.xy = u_xlat1.zz * vec2(21.0, 29.0);
					    u_xlat2.xy = vec2(_TimeX) * vec2(0.300000012, 0.699999988) + u_xlat2.xy;
					    u_xlat2.xy = sin(u_xlat2.xy);
					    u_xlat2.x = u_xlat2.y * u_xlat2.x;
					    u_xlat6 = _TimeX * 0.330000013 + 0.300000012;
					    u_xlat9 = u_xlat1.z * 31.0 + u_xlat6;
					    u_xlat9 = sin(u_xlat9);
					    u_xlat9 = u_xlat9 * u_xlat2.x;
					    u_xlat2.x = u_xlat9 * 0.00170000002 + 0.0250000004;
					    u_xlat5 = u_xlat9 * 0.00170000002 + u_xlat1.y;
					    u_xlat1.x = u_xlat5 + 0.00100000005;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat1.xw).xyz;
					    u_xlat16_1.xyz = u_xlat10_1.xyz + vec3(0.0500000007, 0.0500000007, 0.0500000007);
					    u_xlat0.x = u_xlat2.x * 0.75 + u_xlat8.x;
					    u_xlat0.xy = u_xlat0.xy + vec2(0.00100000005, 0.0409999974);
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = u_xlat10_2.xyz * vec3(0.0799999982, 0.0500000007, 0.0799999982) + u_xlat16_1.xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
					    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.600000024, 0.600000024, 0.600000024) + u_xlat16_2.xyz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
					#else
					    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
					#endif
					    u_xlat0.x = u_xlat8.x * u_xlat8.y;
					    u_xlat0.x = u_xlat0.x * 16.0;
					    u_xlat2.xy = (-u_xlat8.xy) + vec2(1.0, 1.0);
					    u_xlat0.x = u_xlat0.x * u_xlat2.x;
					    u_xlat0.x = u_xlat2.y * u_xlat0.x;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.300000012;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.66000009, 2.94000006, 2.66000009);
					    u_xlat0.x = u_xlat8.y * _ScreenResolution.y;
					    u_xlat4.x = _TimeX * 3.5;
					    u_xlat0.x = u_xlat0.x * 1.5 + u_xlat4.x;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.349999994 + 0.349999994;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 1.70000005;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _Value3;
					    u_xlat0.x = u_xlat0.x * 0.699999988 + 0.400000006;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlat0.x = _TimeX * 110.0;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.00999999978 + 1.0;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlati0.xy = ivec2(uvec2(lessThan(u_xlat8.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy) * 0xFFFFFFFFu);
					    u_xlati8.xy = ivec2(uvec2(lessThan(vec4(1.0, 1.0, 1.0, 1.0), u_xlat8.xyxy).xy) * 0xFFFFFFFFu);
					    u_xlati0.xy = ivec2(uvec2(u_xlati8.xy) | uvec2(u_xlati0.xy));
					    u_xlati0.x = int(uint(u_xlati0.y) | uint(u_xlati0.x));
					    u_xlat0.xyz = (u_xlati0.x != 0) ? vec3(0.0, 0.0, 0.0) : u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz;
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