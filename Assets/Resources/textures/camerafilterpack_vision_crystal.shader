Shader "CameraFilterPack/Vision_Crystal" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 57186
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
					uniform highp vec4 _Time;
					uniform sampler2D _MainTex;
					uniform highp float _Value;
					uniform highp float _Value2;
					uniform highp float _Value3;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec2 p_1;
					  highp vec2 uv_2;
					  highp float z_3;
					  highp vec3 c_4;
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = _Value2;
					  tmpvar_5.y = _Value3;
					  highp vec2 tmpvar_6;
					  tmpvar_6 = (xlv_TEXCOORD0 + tmpvar_5);
					  c_4 = vec3(0.0, 0.0, 0.0);
					  p_1 = (tmpvar_6 - 0.5);
					  z_3 = ((_Time * 20.0).x + 0.07);
					  highp float tmpvar_7;
					  tmpvar_7 = sqrt(dot (p_1, p_1));
					  uv_2 = (tmpvar_6 + ((
					    (p_1 / tmpvar_7)
					   * 
					    (sin(z_3) + _Value)
					  ) * abs(
					    sin(((tmpvar_7 * 9.0) - (z_3 * 2.0)))
					  )));
					  highp vec2 tmpvar_8;
					  tmpvar_8 = fract(abs(uv_2));
					  highp float tmpvar_9;
					  if ((uv_2.x >= 0.0)) {
					    tmpvar_9 = tmpvar_8.x;
					  } else {
					    tmpvar_9 = -(tmpvar_8.x);
					  };
					  highp float tmpvar_10;
					  if ((uv_2.y >= 0.0)) {
					    tmpvar_10 = tmpvar_8.y;
					  } else {
					    tmpvar_10 = -(tmpvar_8.y);
					  };
					  highp vec2 tmpvar_11;
					  tmpvar_11.x = tmpvar_9;
					  tmpvar_11.y = tmpvar_10;
					  highp vec2 tmpvar_12;
					  tmpvar_12 = abs((tmpvar_11 - 0.5));
					  c_4.x = (0.01 / sqrt(dot (tmpvar_12, tmpvar_12)));
					  p_1 = (tmpvar_6 - 0.5);
					  z_3 += 0.07;
					  highp float tmpvar_13;
					  tmpvar_13 = sqrt(dot (p_1, p_1));
					  uv_2 = (tmpvar_6 + ((
					    (p_1 / tmpvar_13)
					   * 
					    (sin(z_3) + _Value)
					  ) * abs(
					    sin(((tmpvar_13 * 9.0) - (z_3 * 2.0)))
					  )));
					  highp vec2 tmpvar_14;
					  tmpvar_14 = fract(abs(uv_2));
					  highp float tmpvar_15;
					  if ((uv_2.x >= 0.0)) {
					    tmpvar_15 = tmpvar_14.x;
					  } else {
					    tmpvar_15 = -(tmpvar_14.x);
					  };
					  highp float tmpvar_16;
					  if ((uv_2.y >= 0.0)) {
					    tmpvar_16 = tmpvar_14.y;
					  } else {
					    tmpvar_16 = -(tmpvar_14.y);
					  };
					  highp vec2 tmpvar_17;
					  tmpvar_17.x = tmpvar_15;
					  tmpvar_17.y = tmpvar_16;
					  highp vec2 tmpvar_18;
					  tmpvar_18 = abs((tmpvar_17 - 0.5));
					  c_4.y = (0.01 / sqrt(dot (tmpvar_18, tmpvar_18)));
					  p_1 = (tmpvar_6 - 0.5);
					  z_3 += 0.07;
					  highp float tmpvar_19;
					  tmpvar_19 = sqrt(dot (p_1, p_1));
					  uv_2 = (tmpvar_6 + ((
					    (p_1 / tmpvar_19)
					   * 
					    (sin(z_3) + _Value)
					  ) * abs(
					    sin(((tmpvar_19 * 9.0) - (z_3 * 2.0)))
					  )));
					  highp vec2 tmpvar_20;
					  tmpvar_20 = fract(abs(uv_2));
					  highp float tmpvar_21;
					  if ((uv_2.x >= 0.0)) {
					    tmpvar_21 = tmpvar_20.x;
					  } else {
					    tmpvar_21 = -(tmpvar_20.x);
					  };
					  highp float tmpvar_22;
					  if ((uv_2.y >= 0.0)) {
					    tmpvar_22 = tmpvar_20.y;
					  } else {
					    tmpvar_22 = -(tmpvar_20.y);
					  };
					  highp vec2 tmpvar_23;
					  tmpvar_23.x = tmpvar_21;
					  tmpvar_23.y = tmpvar_22;
					  highp vec2 tmpvar_24;
					  tmpvar_24 = abs((tmpvar_23 - 0.5));
					  c_4.z = (0.01 / sqrt(dot (tmpvar_24, tmpvar_24)));
					  lowp vec4 tmpvar_25;
					  tmpvar_25 = texture2D (_MainTex, xlv_TEXCOORD0);
					  c_4 = (c_4 + tmpvar_25.xyz);
					  highp vec4 tmpvar_26;
					  tmpvar_26.w = 1.0;
					  tmpvar_26.xyz = (c_4 / tmpvar_19);
					  gl_FragData[0] = tmpvar_26;
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
					uniform highp vec4 _Time;
					uniform sampler2D _MainTex;
					uniform highp float _Value;
					uniform highp float _Value2;
					uniform highp float _Value3;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec2 p_1;
					  highp vec2 uv_2;
					  highp float z_3;
					  highp vec3 c_4;
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = _Value2;
					  tmpvar_5.y = _Value3;
					  highp vec2 tmpvar_6;
					  tmpvar_6 = (xlv_TEXCOORD0 + tmpvar_5);
					  c_4 = vec3(0.0, 0.0, 0.0);
					  p_1 = (tmpvar_6 - 0.5);
					  z_3 = ((_Time * 20.0).x + 0.07);
					  highp float tmpvar_7;
					  tmpvar_7 = sqrt(dot (p_1, p_1));
					  uv_2 = (tmpvar_6 + ((
					    (p_1 / tmpvar_7)
					   * 
					    (sin(z_3) + _Value)
					  ) * abs(
					    sin(((tmpvar_7 * 9.0) - (z_3 * 2.0)))
					  )));
					  highp vec2 tmpvar_8;
					  tmpvar_8 = fract(abs(uv_2));
					  highp float tmpvar_9;
					  if ((uv_2.x >= 0.0)) {
					    tmpvar_9 = tmpvar_8.x;
					  } else {
					    tmpvar_9 = -(tmpvar_8.x);
					  };
					  highp float tmpvar_10;
					  if ((uv_2.y >= 0.0)) {
					    tmpvar_10 = tmpvar_8.y;
					  } else {
					    tmpvar_10 = -(tmpvar_8.y);
					  };
					  highp vec2 tmpvar_11;
					  tmpvar_11.x = tmpvar_9;
					  tmpvar_11.y = tmpvar_10;
					  highp vec2 tmpvar_12;
					  tmpvar_12 = abs((tmpvar_11 - 0.5));
					  c_4.x = (0.01 / sqrt(dot (tmpvar_12, tmpvar_12)));
					  p_1 = (tmpvar_6 - 0.5);
					  z_3 += 0.07;
					  highp float tmpvar_13;
					  tmpvar_13 = sqrt(dot (p_1, p_1));
					  uv_2 = (tmpvar_6 + ((
					    (p_1 / tmpvar_13)
					   * 
					    (sin(z_3) + _Value)
					  ) * abs(
					    sin(((tmpvar_13 * 9.0) - (z_3 * 2.0)))
					  )));
					  highp vec2 tmpvar_14;
					  tmpvar_14 = fract(abs(uv_2));
					  highp float tmpvar_15;
					  if ((uv_2.x >= 0.0)) {
					    tmpvar_15 = tmpvar_14.x;
					  } else {
					    tmpvar_15 = -(tmpvar_14.x);
					  };
					  highp float tmpvar_16;
					  if ((uv_2.y >= 0.0)) {
					    tmpvar_16 = tmpvar_14.y;
					  } else {
					    tmpvar_16 = -(tmpvar_14.y);
					  };
					  highp vec2 tmpvar_17;
					  tmpvar_17.x = tmpvar_15;
					  tmpvar_17.y = tmpvar_16;
					  highp vec2 tmpvar_18;
					  tmpvar_18 = abs((tmpvar_17 - 0.5));
					  c_4.y = (0.01 / sqrt(dot (tmpvar_18, tmpvar_18)));
					  p_1 = (tmpvar_6 - 0.5);
					  z_3 += 0.07;
					  highp float tmpvar_19;
					  tmpvar_19 = sqrt(dot (p_1, p_1));
					  uv_2 = (tmpvar_6 + ((
					    (p_1 / tmpvar_19)
					   * 
					    (sin(z_3) + _Value)
					  ) * abs(
					    sin(((tmpvar_19 * 9.0) - (z_3 * 2.0)))
					  )));
					  highp vec2 tmpvar_20;
					  tmpvar_20 = fract(abs(uv_2));
					  highp float tmpvar_21;
					  if ((uv_2.x >= 0.0)) {
					    tmpvar_21 = tmpvar_20.x;
					  } else {
					    tmpvar_21 = -(tmpvar_20.x);
					  };
					  highp float tmpvar_22;
					  if ((uv_2.y >= 0.0)) {
					    tmpvar_22 = tmpvar_20.y;
					  } else {
					    tmpvar_22 = -(tmpvar_20.y);
					  };
					  highp vec2 tmpvar_23;
					  tmpvar_23.x = tmpvar_21;
					  tmpvar_23.y = tmpvar_22;
					  highp vec2 tmpvar_24;
					  tmpvar_24 = abs((tmpvar_23 - 0.5));
					  c_4.z = (0.01 / sqrt(dot (tmpvar_24, tmpvar_24)));
					  lowp vec4 tmpvar_25;
					  tmpvar_25 = texture2D (_MainTex, xlv_TEXCOORD0);
					  c_4 = (c_4 + tmpvar_25.xyz);
					  highp vec4 tmpvar_26;
					  tmpvar_26.w = 1.0;
					  tmpvar_26.xyz = (c_4 / tmpvar_19);
					  gl_FragData[0] = tmpvar_26;
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
					uniform highp vec4 _Time;
					uniform sampler2D _MainTex;
					uniform highp float _Value;
					uniform highp float _Value2;
					uniform highp float _Value3;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec2 p_1;
					  highp vec2 uv_2;
					  highp float z_3;
					  highp vec3 c_4;
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = _Value2;
					  tmpvar_5.y = _Value3;
					  highp vec2 tmpvar_6;
					  tmpvar_6 = (xlv_TEXCOORD0 + tmpvar_5);
					  c_4 = vec3(0.0, 0.0, 0.0);
					  p_1 = (tmpvar_6 - 0.5);
					  z_3 = ((_Time * 20.0).x + 0.07);
					  highp float tmpvar_7;
					  tmpvar_7 = sqrt(dot (p_1, p_1));
					  uv_2 = (tmpvar_6 + ((
					    (p_1 / tmpvar_7)
					   * 
					    (sin(z_3) + _Value)
					  ) * abs(
					    sin(((tmpvar_7 * 9.0) - (z_3 * 2.0)))
					  )));
					  highp vec2 tmpvar_8;
					  tmpvar_8 = fract(abs(uv_2));
					  highp float tmpvar_9;
					  if ((uv_2.x >= 0.0)) {
					    tmpvar_9 = tmpvar_8.x;
					  } else {
					    tmpvar_9 = -(tmpvar_8.x);
					  };
					  highp float tmpvar_10;
					  if ((uv_2.y >= 0.0)) {
					    tmpvar_10 = tmpvar_8.y;
					  } else {
					    tmpvar_10 = -(tmpvar_8.y);
					  };
					  highp vec2 tmpvar_11;
					  tmpvar_11.x = tmpvar_9;
					  tmpvar_11.y = tmpvar_10;
					  highp vec2 tmpvar_12;
					  tmpvar_12 = abs((tmpvar_11 - 0.5));
					  c_4.x = (0.01 / sqrt(dot (tmpvar_12, tmpvar_12)));
					  p_1 = (tmpvar_6 - 0.5);
					  z_3 += 0.07;
					  highp float tmpvar_13;
					  tmpvar_13 = sqrt(dot (p_1, p_1));
					  uv_2 = (tmpvar_6 + ((
					    (p_1 / tmpvar_13)
					   * 
					    (sin(z_3) + _Value)
					  ) * abs(
					    sin(((tmpvar_13 * 9.0) - (z_3 * 2.0)))
					  )));
					  highp vec2 tmpvar_14;
					  tmpvar_14 = fract(abs(uv_2));
					  highp float tmpvar_15;
					  if ((uv_2.x >= 0.0)) {
					    tmpvar_15 = tmpvar_14.x;
					  } else {
					    tmpvar_15 = -(tmpvar_14.x);
					  };
					  highp float tmpvar_16;
					  if ((uv_2.y >= 0.0)) {
					    tmpvar_16 = tmpvar_14.y;
					  } else {
					    tmpvar_16 = -(tmpvar_14.y);
					  };
					  highp vec2 tmpvar_17;
					  tmpvar_17.x = tmpvar_15;
					  tmpvar_17.y = tmpvar_16;
					  highp vec2 tmpvar_18;
					  tmpvar_18 = abs((tmpvar_17 - 0.5));
					  c_4.y = (0.01 / sqrt(dot (tmpvar_18, tmpvar_18)));
					  p_1 = (tmpvar_6 - 0.5);
					  z_3 += 0.07;
					  highp float tmpvar_19;
					  tmpvar_19 = sqrt(dot (p_1, p_1));
					  uv_2 = (tmpvar_6 + ((
					    (p_1 / tmpvar_19)
					   * 
					    (sin(z_3) + _Value)
					  ) * abs(
					    sin(((tmpvar_19 * 9.0) - (z_3 * 2.0)))
					  )));
					  highp vec2 tmpvar_20;
					  tmpvar_20 = fract(abs(uv_2));
					  highp float tmpvar_21;
					  if ((uv_2.x >= 0.0)) {
					    tmpvar_21 = tmpvar_20.x;
					  } else {
					    tmpvar_21 = -(tmpvar_20.x);
					  };
					  highp float tmpvar_22;
					  if ((uv_2.y >= 0.0)) {
					    tmpvar_22 = tmpvar_20.y;
					  } else {
					    tmpvar_22 = -(tmpvar_20.y);
					  };
					  highp vec2 tmpvar_23;
					  tmpvar_23.x = tmpvar_21;
					  tmpvar_23.y = tmpvar_22;
					  highp vec2 tmpvar_24;
					  tmpvar_24 = abs((tmpvar_23 - 0.5));
					  c_4.z = (0.01 / sqrt(dot (tmpvar_24, tmpvar_24)));
					  lowp vec4 tmpvar_25;
					  tmpvar_25 = texture2D (_MainTex, xlv_TEXCOORD0);
					  c_4 = (c_4 + tmpvar_25.xyz);
					  highp vec4 tmpvar_26;
					  tmpvar_26.w = 1.0;
					  tmpvar_26.xyz = (c_4 / tmpvar_19);
					  gl_FragData[0] = tmpvar_26;
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
					uniform 	vec4 _Time;
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					bvec2 u_xlatb0;
					vec4 u_xlat1;
					lowp vec3 u_xlat10_1;
					bvec4 u_xlatb1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec2 u_xlat9;
					vec2 u_xlat10;
					float u_xlat12;
					void main()
					{
					    u_xlat0.xyz = _Time.xxx * vec3(20.0, 20.0, 20.0) + vec3(0.0700000003, 0.140000001, 0.210000008);
					    u_xlat1.xyz = sin(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + vec3(vec3(_Value, _Value, _Value));
					    u_xlat2.xy = vec2(vs_TEXCOORD0.x + float(_Value2), vs_TEXCOORD0.y + float(_Value3));
					    u_xlat10.xy = u_xlat2.xy + vec2(-0.5, -0.5);
					    u_xlat12 = dot(u_xlat10.xy, u_xlat10.xy);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat10.xy = u_xlat10.xy / vec2(u_xlat12);
					    u_xlat9.xy = u_xlat1.zz * u_xlat10.xy;
					    u_xlat3 = u_xlat1.xxyy * u_xlat10.xyxy;
					    u_xlat0.xyz = vec3(u_xlat12) * vec3(9.0, 9.0, 9.0) + (-u_xlat0.xyz);
					    u_xlat0.xyz = sin(u_xlat0.xyz);
					    u_xlat1.xy = u_xlat9.xy * abs(u_xlat0.zz) + u_xlat2.xy;
					    u_xlat2 = u_xlat3 * abs(u_xlat0.xxyy) + u_xlat2.xyxy;
					    u_xlatb0.xy = greaterThanEqual(u_xlat1.xyxx, (-u_xlat1.xyxx)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    u_xlat0.x = (u_xlatb0.x) ? u_xlat1.x : (-u_xlat1.x);
					    u_xlat0.y = (u_xlatb0.y) ? u_xlat1.y : (-u_xlat1.y);
					    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat0.x = dot(abs(u_xlat0.xy), abs(u_xlat0.xy));
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.z = 0.00999999978 / u_xlat0.x;
					    u_xlatb1 = greaterThanEqual(u_xlat2, (-u_xlat2));
					    u_xlat2 = fract(abs(u_xlat2));
					    u_xlat1.x = (u_xlatb1.x) ? u_xlat2.x : (-u_xlat2.x);
					    u_xlat1.y = (u_xlatb1.y) ? u_xlat2.y : (-u_xlat2.y);
					    u_xlat1.z = (u_xlatb1.z) ? u_xlat2.z : (-u_xlat2.z);
					    u_xlat1.w = (u_xlatb1.w) ? u_xlat2.w : (-u_xlat2.w);
					    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
					    u_xlat1.x = dot(abs(u_xlat1.xy), abs(u_xlat1.xy));
					    u_xlat1.y = dot(abs(u_xlat1.zw), abs(u_xlat1.zw));
					    u_xlat1.xy = sqrt(u_xlat1.xy);
					    u_xlat0.xy = vec2(0.00999999978, 0.00999999978) / u_xlat1.xy;
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat10_1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz / vec3(u_xlat12);
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
					uniform 	vec4 _Time;
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					bvec2 u_xlatb0;
					vec4 u_xlat1;
					lowp vec3 u_xlat10_1;
					bvec4 u_xlatb1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec2 u_xlat9;
					vec2 u_xlat10;
					float u_xlat12;
					void main()
					{
					    u_xlat0.xyz = _Time.xxx * vec3(20.0, 20.0, 20.0) + vec3(0.0700000003, 0.140000001, 0.210000008);
					    u_xlat1.xyz = sin(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + vec3(vec3(_Value, _Value, _Value));
					    u_xlat2.xy = vec2(vs_TEXCOORD0.x + float(_Value2), vs_TEXCOORD0.y + float(_Value3));
					    u_xlat10.xy = u_xlat2.xy + vec2(-0.5, -0.5);
					    u_xlat12 = dot(u_xlat10.xy, u_xlat10.xy);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat10.xy = u_xlat10.xy / vec2(u_xlat12);
					    u_xlat9.xy = u_xlat1.zz * u_xlat10.xy;
					    u_xlat3 = u_xlat1.xxyy * u_xlat10.xyxy;
					    u_xlat0.xyz = vec3(u_xlat12) * vec3(9.0, 9.0, 9.0) + (-u_xlat0.xyz);
					    u_xlat0.xyz = sin(u_xlat0.xyz);
					    u_xlat1.xy = u_xlat9.xy * abs(u_xlat0.zz) + u_xlat2.xy;
					    u_xlat2 = u_xlat3 * abs(u_xlat0.xxyy) + u_xlat2.xyxy;
					    u_xlatb0.xy = greaterThanEqual(u_xlat1.xyxx, (-u_xlat1.xyxx)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    u_xlat0.x = (u_xlatb0.x) ? u_xlat1.x : (-u_xlat1.x);
					    u_xlat0.y = (u_xlatb0.y) ? u_xlat1.y : (-u_xlat1.y);
					    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat0.x = dot(abs(u_xlat0.xy), abs(u_xlat0.xy));
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.z = 0.00999999978 / u_xlat0.x;
					    u_xlatb1 = greaterThanEqual(u_xlat2, (-u_xlat2));
					    u_xlat2 = fract(abs(u_xlat2));
					    u_xlat1.x = (u_xlatb1.x) ? u_xlat2.x : (-u_xlat2.x);
					    u_xlat1.y = (u_xlatb1.y) ? u_xlat2.y : (-u_xlat2.y);
					    u_xlat1.z = (u_xlatb1.z) ? u_xlat2.z : (-u_xlat2.z);
					    u_xlat1.w = (u_xlatb1.w) ? u_xlat2.w : (-u_xlat2.w);
					    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
					    u_xlat1.x = dot(abs(u_xlat1.xy), abs(u_xlat1.xy));
					    u_xlat1.y = dot(abs(u_xlat1.zw), abs(u_xlat1.zw));
					    u_xlat1.xy = sqrt(u_xlat1.xy);
					    u_xlat0.xy = vec2(0.00999999978, 0.00999999978) / u_xlat1.xy;
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat10_1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz / vec3(u_xlat12);
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
					uniform 	vec4 _Time;
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					bvec2 u_xlatb0;
					vec4 u_xlat1;
					lowp vec3 u_xlat10_1;
					bvec4 u_xlatb1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec2 u_xlat9;
					vec2 u_xlat10;
					float u_xlat12;
					void main()
					{
					    u_xlat0.xyz = _Time.xxx * vec3(20.0, 20.0, 20.0) + vec3(0.0700000003, 0.140000001, 0.210000008);
					    u_xlat1.xyz = sin(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + vec3(vec3(_Value, _Value, _Value));
					    u_xlat2.xy = vec2(vs_TEXCOORD0.x + float(_Value2), vs_TEXCOORD0.y + float(_Value3));
					    u_xlat10.xy = u_xlat2.xy + vec2(-0.5, -0.5);
					    u_xlat12 = dot(u_xlat10.xy, u_xlat10.xy);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat10.xy = u_xlat10.xy / vec2(u_xlat12);
					    u_xlat9.xy = u_xlat1.zz * u_xlat10.xy;
					    u_xlat3 = u_xlat1.xxyy * u_xlat10.xyxy;
					    u_xlat0.xyz = vec3(u_xlat12) * vec3(9.0, 9.0, 9.0) + (-u_xlat0.xyz);
					    u_xlat0.xyz = sin(u_xlat0.xyz);
					    u_xlat1.xy = u_xlat9.xy * abs(u_xlat0.zz) + u_xlat2.xy;
					    u_xlat2 = u_xlat3 * abs(u_xlat0.xxyy) + u_xlat2.xyxy;
					    u_xlatb0.xy = greaterThanEqual(u_xlat1.xyxx, (-u_xlat1.xyxx)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    u_xlat0.x = (u_xlatb0.x) ? u_xlat1.x : (-u_xlat1.x);
					    u_xlat0.y = (u_xlatb0.y) ? u_xlat1.y : (-u_xlat1.y);
					    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat0.x = dot(abs(u_xlat0.xy), abs(u_xlat0.xy));
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.z = 0.00999999978 / u_xlat0.x;
					    u_xlatb1 = greaterThanEqual(u_xlat2, (-u_xlat2));
					    u_xlat2 = fract(abs(u_xlat2));
					    u_xlat1.x = (u_xlatb1.x) ? u_xlat2.x : (-u_xlat2.x);
					    u_xlat1.y = (u_xlatb1.y) ? u_xlat2.y : (-u_xlat2.y);
					    u_xlat1.z = (u_xlatb1.z) ? u_xlat2.z : (-u_xlat2.z);
					    u_xlat1.w = (u_xlatb1.w) ? u_xlat2.w : (-u_xlat2.w);
					    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
					    u_xlat1.x = dot(abs(u_xlat1.xy), abs(u_xlat1.xy));
					    u_xlat1.y = dot(abs(u_xlat1.zw), abs(u_xlat1.zw));
					    u_xlat1.xy = sqrt(u_xlat1.xy);
					    u_xlat0.xy = vec2(0.00999999978, 0.00999999978) / u_xlat1.xy;
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat10_1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz / vec3(u_xlat12);
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