Shader "CameraFilterPack/TV_LED" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(1, 10)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 47246
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
					uniform highp float _Size;
					uniform highp vec4 _ScreenResolution;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 sum_1;
					  highp vec3 col_2;
					  highp vec2 tmpvar_3;
					  tmpvar_3 = (xlv_TEXCOORD0 * _ScreenResolution.xy);
					  highp vec2 tmpvar_4;
					  tmpvar_4 = (floor((tmpvar_3 / _Size)) * _Size);
					  highp vec2 tmpvar_5;
					  tmpvar_5 = (tmpvar_3 / vec2(_Size));
					  highp vec2 tmpvar_6;
					  tmpvar_6 = (fract(abs(tmpvar_5)) * vec2(_Size));
					  highp float tmpvar_7;
					  if ((tmpvar_5.x >= 0.0)) {
					    tmpvar_7 = tmpvar_6.x;
					  } else {
					    tmpvar_7 = -(tmpvar_6.x);
					  };
					  highp float tmpvar_8;
					  if ((tmpvar_5.y >= 0.0)) {
					    tmpvar_8 = tmpvar_6.y;
					  } else {
					    tmpvar_8 = -(tmpvar_6.y);
					  };
					  col_2 = vec3(0.0, 0.0, 0.0);
					  highp vec2 P_9;
					  P_9 = (tmpvar_4 / _ScreenResolution.xy);
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, P_9).xyz;
					  sum_1 = tmpvar_10;
					  highp float tmpvar_11;
					  tmpvar_11 = clamp ((sin(
					    ((tmpvar_3.y * 6.0) + (_TimeX * 5.6))
					  ) + 1.25), 0.0, 1.0);
					  if ((tmpvar_8 < ((_Size / 3.0) * 3.0))) {
					    if ((tmpvar_7 < (_Size / 3.0))) {
					      col_2.x = sum_1.x;
					    } else {
					      if ((tmpvar_7 < ((_Size / 3.0) * 2.0))) {
					        col_2.y = sum_1.y;
					      } else {
					        col_2.z = sum_1.z;
					      };
					    };
					  };
					  col_2 = (sum_1 + col_2);
					  highp vec3 tmpvar_12;
					  tmpvar_12 = mix ((col_2 - 0.2), col_2, vec3((tmpvar_11 / 2.0)));
					  col_2 = tmpvar_12;
					  highp vec4 tmpvar_13;
					  tmpvar_13.w = 1.0;
					  tmpvar_13.xyz = tmpvar_12;
					  gl_FragData[0] = tmpvar_13;
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
					uniform highp float _Size;
					uniform highp vec4 _ScreenResolution;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 sum_1;
					  highp vec3 col_2;
					  highp vec2 tmpvar_3;
					  tmpvar_3 = (xlv_TEXCOORD0 * _ScreenResolution.xy);
					  highp vec2 tmpvar_4;
					  tmpvar_4 = (floor((tmpvar_3 / _Size)) * _Size);
					  highp vec2 tmpvar_5;
					  tmpvar_5 = (tmpvar_3 / vec2(_Size));
					  highp vec2 tmpvar_6;
					  tmpvar_6 = (fract(abs(tmpvar_5)) * vec2(_Size));
					  highp float tmpvar_7;
					  if ((tmpvar_5.x >= 0.0)) {
					    tmpvar_7 = tmpvar_6.x;
					  } else {
					    tmpvar_7 = -(tmpvar_6.x);
					  };
					  highp float tmpvar_8;
					  if ((tmpvar_5.y >= 0.0)) {
					    tmpvar_8 = tmpvar_6.y;
					  } else {
					    tmpvar_8 = -(tmpvar_6.y);
					  };
					  col_2 = vec3(0.0, 0.0, 0.0);
					  highp vec2 P_9;
					  P_9 = (tmpvar_4 / _ScreenResolution.xy);
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, P_9).xyz;
					  sum_1 = tmpvar_10;
					  highp float tmpvar_11;
					  tmpvar_11 = clamp ((sin(
					    ((tmpvar_3.y * 6.0) + (_TimeX * 5.6))
					  ) + 1.25), 0.0, 1.0);
					  if ((tmpvar_8 < ((_Size / 3.0) * 3.0))) {
					    if ((tmpvar_7 < (_Size / 3.0))) {
					      col_2.x = sum_1.x;
					    } else {
					      if ((tmpvar_7 < ((_Size / 3.0) * 2.0))) {
					        col_2.y = sum_1.y;
					      } else {
					        col_2.z = sum_1.z;
					      };
					    };
					  };
					  col_2 = (sum_1 + col_2);
					  highp vec3 tmpvar_12;
					  tmpvar_12 = mix ((col_2 - 0.2), col_2, vec3((tmpvar_11 / 2.0)));
					  col_2 = tmpvar_12;
					  highp vec4 tmpvar_13;
					  tmpvar_13.w = 1.0;
					  tmpvar_13.xyz = tmpvar_12;
					  gl_FragData[0] = tmpvar_13;
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
					uniform highp float _Size;
					uniform highp vec4 _ScreenResolution;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 sum_1;
					  highp vec3 col_2;
					  highp vec2 tmpvar_3;
					  tmpvar_3 = (xlv_TEXCOORD0 * _ScreenResolution.xy);
					  highp vec2 tmpvar_4;
					  tmpvar_4 = (floor((tmpvar_3 / _Size)) * _Size);
					  highp vec2 tmpvar_5;
					  tmpvar_5 = (tmpvar_3 / vec2(_Size));
					  highp vec2 tmpvar_6;
					  tmpvar_6 = (fract(abs(tmpvar_5)) * vec2(_Size));
					  highp float tmpvar_7;
					  if ((tmpvar_5.x >= 0.0)) {
					    tmpvar_7 = tmpvar_6.x;
					  } else {
					    tmpvar_7 = -(tmpvar_6.x);
					  };
					  highp float tmpvar_8;
					  if ((tmpvar_5.y >= 0.0)) {
					    tmpvar_8 = tmpvar_6.y;
					  } else {
					    tmpvar_8 = -(tmpvar_6.y);
					  };
					  col_2 = vec3(0.0, 0.0, 0.0);
					  highp vec2 P_9;
					  P_9 = (tmpvar_4 / _ScreenResolution.xy);
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, P_9).xyz;
					  sum_1 = tmpvar_10;
					  highp float tmpvar_11;
					  tmpvar_11 = clamp ((sin(
					    ((tmpvar_3.y * 6.0) + (_TimeX * 5.6))
					  ) + 1.25), 0.0, 1.0);
					  if ((tmpvar_8 < ((_Size / 3.0) * 3.0))) {
					    if ((tmpvar_7 < (_Size / 3.0))) {
					      col_2.x = sum_1.x;
					    } else {
					      if ((tmpvar_7 < ((_Size / 3.0) * 2.0))) {
					        col_2.y = sum_1.y;
					      } else {
					        col_2.z = sum_1.z;
					      };
					    };
					  };
					  col_2 = (sum_1 + col_2);
					  highp vec3 tmpvar_12;
					  tmpvar_12 = mix ((col_2 - 0.2), col_2, vec3((tmpvar_11 / 2.0)));
					  col_2 = tmpvar_12;
					  highp vec4 tmpvar_13;
					  tmpvar_13.w = 1.0;
					  tmpvar_13.xyz = tmpvar_12;
					  gl_FragData[0] = tmpvar_13;
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
					uniform 	float _Size;
					uniform 	vec4 _ScreenResolution;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					bvec2 u_xlatb2;
					lowp vec3 u_xlat10_3;
					vec3 u_xlat4;
					vec2 u_xlat5;
					vec2 u_xlat6;
					bvec2 u_xlatb7;
					vec2 u_xlat12;
					float u_xlat15;
					void main()
					{
					    u_xlat5.y = 0.0;
					    u_xlat6.x = 0.0;
					    u_xlat0.xw = vs_TEXCOORD0.xy * _ScreenResolution.xy;
					    u_xlat1.xw = u_xlat0.xw / vec2(vec2(_Size, _Size));
					    u_xlatb2.xy = greaterThanEqual(u_xlat1.xwxx, (-u_xlat1.xwxx)).xy;
					    u_xlat12.xy = fract(abs(u_xlat1.xw));
					    u_xlat1.xw = floor(u_xlat1.xw);
					    u_xlat1.xw = u_xlat1.xw * vec2(vec2(_Size, _Size));
					    u_xlat1.xw = u_xlat1.xw / _ScreenResolution.xy;
					    u_xlat10_3.xyz = texture(_MainTex, u_xlat1.xw).xyz;
					    u_xlat1.x = (u_xlatb2.x) ? u_xlat12.x : (-u_xlat12.x);
					    u_xlat1.w = (u_xlatb2.y) ? u_xlat12.y : (-u_xlat12.y);
					    u_xlat1.xw = u_xlat1.xw * vec2(vec2(_Size, _Size));
					    u_xlat2.xyz = vec3(_TimeX, _Size, _Size) * vec3(5.5999999, 0.333333343, 0.666666687);
					    u_xlatb7.xy = lessThan(u_xlat1.xxxx, u_xlat2.yzyy).xy;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat1.w<_Size);
					#else
					    u_xlatb0 = u_xlat1.w<_Size;
					#endif
					    u_xlat15 = u_xlat0.w * 6.0 + u_xlat2.x;
					    u_xlat15 = sin(u_xlat15);
					    u_xlat15 = u_xlat15 + 1.25;
					    u_xlat15 = min(u_xlat15, 1.0);
					    u_xlat15 = u_xlat15 * 0.5;
					    u_xlat5.x = u_xlat10_3.y;
					    u_xlat6.y = u_xlat10_3.z;
					    u_xlat1.yz = (u_xlatb7.y) ? u_xlat5.xy : u_xlat6.xy;
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat1.x = 0.0;
					    u_xlat4.x = u_xlat10_3.x;
					    u_xlat1.xyz = (u_xlatb7.x) ? u_xlat4.xyz : u_xlat1.xyz;
					    u_xlat0.xyz = mix(vec3(0.0, 0.0, 0.0), u_xlat1.xyz, vec3(bvec3(u_xlatb0)));
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat10_3.xyz;
					    u_xlat1.xyz = u_xlat0.xyz + vec3(-0.200000003, -0.200000003, -0.200000003);
					    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    SV_Target0.xyz = vec3(u_xlat15) * u_xlat0.xyz + u_xlat1.xyz;
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
					uniform 	float _Size;
					uniform 	vec4 _ScreenResolution;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					bvec2 u_xlatb2;
					lowp vec3 u_xlat10_3;
					vec3 u_xlat4;
					vec2 u_xlat5;
					vec2 u_xlat6;
					bvec2 u_xlatb7;
					vec2 u_xlat12;
					float u_xlat15;
					void main()
					{
					    u_xlat5.y = 0.0;
					    u_xlat6.x = 0.0;
					    u_xlat0.xw = vs_TEXCOORD0.xy * _ScreenResolution.xy;
					    u_xlat1.xw = u_xlat0.xw / vec2(vec2(_Size, _Size));
					    u_xlatb2.xy = greaterThanEqual(u_xlat1.xwxx, (-u_xlat1.xwxx)).xy;
					    u_xlat12.xy = fract(abs(u_xlat1.xw));
					    u_xlat1.xw = floor(u_xlat1.xw);
					    u_xlat1.xw = u_xlat1.xw * vec2(vec2(_Size, _Size));
					    u_xlat1.xw = u_xlat1.xw / _ScreenResolution.xy;
					    u_xlat10_3.xyz = texture(_MainTex, u_xlat1.xw).xyz;
					    u_xlat1.x = (u_xlatb2.x) ? u_xlat12.x : (-u_xlat12.x);
					    u_xlat1.w = (u_xlatb2.y) ? u_xlat12.y : (-u_xlat12.y);
					    u_xlat1.xw = u_xlat1.xw * vec2(vec2(_Size, _Size));
					    u_xlat2.xyz = vec3(_TimeX, _Size, _Size) * vec3(5.5999999, 0.333333343, 0.666666687);
					    u_xlatb7.xy = lessThan(u_xlat1.xxxx, u_xlat2.yzyy).xy;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat1.w<_Size);
					#else
					    u_xlatb0 = u_xlat1.w<_Size;
					#endif
					    u_xlat15 = u_xlat0.w * 6.0 + u_xlat2.x;
					    u_xlat15 = sin(u_xlat15);
					    u_xlat15 = u_xlat15 + 1.25;
					    u_xlat15 = min(u_xlat15, 1.0);
					    u_xlat15 = u_xlat15 * 0.5;
					    u_xlat5.x = u_xlat10_3.y;
					    u_xlat6.y = u_xlat10_3.z;
					    u_xlat1.yz = (u_xlatb7.y) ? u_xlat5.xy : u_xlat6.xy;
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat1.x = 0.0;
					    u_xlat4.x = u_xlat10_3.x;
					    u_xlat1.xyz = (u_xlatb7.x) ? u_xlat4.xyz : u_xlat1.xyz;
					    u_xlat0.xyz = mix(vec3(0.0, 0.0, 0.0), u_xlat1.xyz, vec3(bvec3(u_xlatb0)));
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat10_3.xyz;
					    u_xlat1.xyz = u_xlat0.xyz + vec3(-0.200000003, -0.200000003, -0.200000003);
					    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    SV_Target0.xyz = vec3(u_xlat15) * u_xlat0.xyz + u_xlat1.xyz;
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
					uniform 	float _Size;
					uniform 	vec4 _ScreenResolution;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					bvec2 u_xlatb2;
					lowp vec3 u_xlat10_3;
					vec3 u_xlat4;
					vec2 u_xlat5;
					vec2 u_xlat6;
					bvec2 u_xlatb7;
					vec2 u_xlat12;
					float u_xlat15;
					void main()
					{
					    u_xlat5.y = 0.0;
					    u_xlat6.x = 0.0;
					    u_xlat0.xw = vs_TEXCOORD0.xy * _ScreenResolution.xy;
					    u_xlat1.xw = u_xlat0.xw / vec2(vec2(_Size, _Size));
					    u_xlatb2.xy = greaterThanEqual(u_xlat1.xwxx, (-u_xlat1.xwxx)).xy;
					    u_xlat12.xy = fract(abs(u_xlat1.xw));
					    u_xlat1.xw = floor(u_xlat1.xw);
					    u_xlat1.xw = u_xlat1.xw * vec2(vec2(_Size, _Size));
					    u_xlat1.xw = u_xlat1.xw / _ScreenResolution.xy;
					    u_xlat10_3.xyz = texture(_MainTex, u_xlat1.xw).xyz;
					    u_xlat1.x = (u_xlatb2.x) ? u_xlat12.x : (-u_xlat12.x);
					    u_xlat1.w = (u_xlatb2.y) ? u_xlat12.y : (-u_xlat12.y);
					    u_xlat1.xw = u_xlat1.xw * vec2(vec2(_Size, _Size));
					    u_xlat2.xyz = vec3(_TimeX, _Size, _Size) * vec3(5.5999999, 0.333333343, 0.666666687);
					    u_xlatb7.xy = lessThan(u_xlat1.xxxx, u_xlat2.yzyy).xy;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat1.w<_Size);
					#else
					    u_xlatb0 = u_xlat1.w<_Size;
					#endif
					    u_xlat15 = u_xlat0.w * 6.0 + u_xlat2.x;
					    u_xlat15 = sin(u_xlat15);
					    u_xlat15 = u_xlat15 + 1.25;
					    u_xlat15 = min(u_xlat15, 1.0);
					    u_xlat15 = u_xlat15 * 0.5;
					    u_xlat5.x = u_xlat10_3.y;
					    u_xlat6.y = u_xlat10_3.z;
					    u_xlat1.yz = (u_xlatb7.y) ? u_xlat5.xy : u_xlat6.xy;
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat1.x = 0.0;
					    u_xlat4.x = u_xlat10_3.x;
					    u_xlat1.xyz = (u_xlatb7.x) ? u_xlat4.xyz : u_xlat1.xyz;
					    u_xlat0.xyz = mix(vec3(0.0, 0.0, 0.0), u_xlat1.xyz, vec3(bvec3(u_xlatb0)));
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat10_3.xyz;
					    u_xlat1.xyz = u_xlat0.xyz + vec3(-0.200000003, -0.200000003, -0.200000003);
					    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    SV_Target0.xyz = vec3(u_xlat15) * u_xlat0.xyz + u_xlat1.xyz;
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