Shader "CameraFilterPack/FX_Hexagon" {
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
			GpuProgramID 21913
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec2 coord_1;
					  coord_1 = xlv_TEXCOORD0;
					  highp vec2 r_2;
					  highp float tmpvar_3;
					  tmpvar_3 = floor((coord_1.x / 0.027714));
					  highp float tmpvar_4;
					  tmpvar_4 = (tmpvar_3 / 2.0);
					  highp float tmpvar_5;
					  tmpvar_5 = (fract(abs(tmpvar_4)) * 2.0);
					  highp float tmpvar_6;
					  if ((tmpvar_4 >= 0.0)) {
					    tmpvar_6 = tmpvar_5;
					  } else {
					    tmpvar_6 = -(tmpvar_5);
					  };
					  highp float tmpvar_7;
					  tmpvar_7 = (coord_1.y - (tmpvar_6 * 0.016));
					  highp float tmpvar_8;
					  tmpvar_8 = floor((31.25 * tmpvar_7));
					  highp float tmpvar_9;
					  tmpvar_9 = (coord_1.x - (tmpvar_3 * 0.027714));
					  highp float tmpvar_10;
					  tmpvar_10 = (tmpvar_7 - (tmpvar_8 * 0.032));
					  highp float tmpvar_11;
					  if ((tmpvar_10 > 0.016)) {
					    tmpvar_11 = 1.0;
					  } else {
					    tmpvar_11 = 0.0;
					  };
					  highp float tmpvar_12;
					  tmpvar_12 = (0.01847609 * abs((0.5 - 
					    (tmpvar_10 / 0.032)
					  )));
					  if ((tmpvar_9 > tmpvar_12)) {
					    r_2.x = tmpvar_3;
					    r_2.y = tmpvar_8;
					  } else {
					    r_2.x = (tmpvar_3 - 1.0);
					    highp float tmpvar_13;
					    tmpvar_13 = (r_2.x / 2.0);
					    highp float tmpvar_14;
					    tmpvar_14 = (fract(abs(tmpvar_13)) * 2.0);
					    highp float tmpvar_15;
					    if ((tmpvar_13 >= 0.0)) {
					      tmpvar_15 = tmpvar_14;
					    } else {
					      tmpvar_15 = -(tmpvar_14);
					    };
					    r_2.y = ((tmpvar_8 - tmpvar_15) + tmpvar_11);
					  };
					  highp vec2 r_16;
					  r_16.x = (r_2.x * 0.02771281);
					  highp float tmpvar_17;
					  tmpvar_17 = (r_2.x / 2.0);
					  highp float tmpvar_18;
					  tmpvar_18 = (fract(abs(tmpvar_17)) * 2.0);
					  highp float tmpvar_19;
					  if ((tmpvar_17 >= 0.0)) {
					    tmpvar_19 = tmpvar_18;
					  } else {
					    tmpvar_19 = -(tmpvar_18);
					  };
					  r_16.y = ((r_2.y * 0.032) + ((tmpvar_19 * 0.032) / 2.0));
					  lowp vec4 tmpvar_20;
					  tmpvar_20 = texture2D (_MainTex, r_16);
					  gl_FragData[0] = tmpvar_20;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec2 coord_1;
					  coord_1 = xlv_TEXCOORD0;
					  highp vec2 r_2;
					  highp float tmpvar_3;
					  tmpvar_3 = floor((coord_1.x / 0.027714));
					  highp float tmpvar_4;
					  tmpvar_4 = (tmpvar_3 / 2.0);
					  highp float tmpvar_5;
					  tmpvar_5 = (fract(abs(tmpvar_4)) * 2.0);
					  highp float tmpvar_6;
					  if ((tmpvar_4 >= 0.0)) {
					    tmpvar_6 = tmpvar_5;
					  } else {
					    tmpvar_6 = -(tmpvar_5);
					  };
					  highp float tmpvar_7;
					  tmpvar_7 = (coord_1.y - (tmpvar_6 * 0.016));
					  highp float tmpvar_8;
					  tmpvar_8 = floor((31.25 * tmpvar_7));
					  highp float tmpvar_9;
					  tmpvar_9 = (coord_1.x - (tmpvar_3 * 0.027714));
					  highp float tmpvar_10;
					  tmpvar_10 = (tmpvar_7 - (tmpvar_8 * 0.032));
					  highp float tmpvar_11;
					  if ((tmpvar_10 > 0.016)) {
					    tmpvar_11 = 1.0;
					  } else {
					    tmpvar_11 = 0.0;
					  };
					  highp float tmpvar_12;
					  tmpvar_12 = (0.01847609 * abs((0.5 - 
					    (tmpvar_10 / 0.032)
					  )));
					  if ((tmpvar_9 > tmpvar_12)) {
					    r_2.x = tmpvar_3;
					    r_2.y = tmpvar_8;
					  } else {
					    r_2.x = (tmpvar_3 - 1.0);
					    highp float tmpvar_13;
					    tmpvar_13 = (r_2.x / 2.0);
					    highp float tmpvar_14;
					    tmpvar_14 = (fract(abs(tmpvar_13)) * 2.0);
					    highp float tmpvar_15;
					    if ((tmpvar_13 >= 0.0)) {
					      tmpvar_15 = tmpvar_14;
					    } else {
					      tmpvar_15 = -(tmpvar_14);
					    };
					    r_2.y = ((tmpvar_8 - tmpvar_15) + tmpvar_11);
					  };
					  highp vec2 r_16;
					  r_16.x = (r_2.x * 0.02771281);
					  highp float tmpvar_17;
					  tmpvar_17 = (r_2.x / 2.0);
					  highp float tmpvar_18;
					  tmpvar_18 = (fract(abs(tmpvar_17)) * 2.0);
					  highp float tmpvar_19;
					  if ((tmpvar_17 >= 0.0)) {
					    tmpvar_19 = tmpvar_18;
					  } else {
					    tmpvar_19 = -(tmpvar_18);
					  };
					  r_16.y = ((r_2.y * 0.032) + ((tmpvar_19 * 0.032) / 2.0));
					  lowp vec4 tmpvar_20;
					  tmpvar_20 = texture2D (_MainTex, r_16);
					  gl_FragData[0] = tmpvar_20;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec2 coord_1;
					  coord_1 = xlv_TEXCOORD0;
					  highp vec2 r_2;
					  highp float tmpvar_3;
					  tmpvar_3 = floor((coord_1.x / 0.027714));
					  highp float tmpvar_4;
					  tmpvar_4 = (tmpvar_3 / 2.0);
					  highp float tmpvar_5;
					  tmpvar_5 = (fract(abs(tmpvar_4)) * 2.0);
					  highp float tmpvar_6;
					  if ((tmpvar_4 >= 0.0)) {
					    tmpvar_6 = tmpvar_5;
					  } else {
					    tmpvar_6 = -(tmpvar_5);
					  };
					  highp float tmpvar_7;
					  tmpvar_7 = (coord_1.y - (tmpvar_6 * 0.016));
					  highp float tmpvar_8;
					  tmpvar_8 = floor((31.25 * tmpvar_7));
					  highp float tmpvar_9;
					  tmpvar_9 = (coord_1.x - (tmpvar_3 * 0.027714));
					  highp float tmpvar_10;
					  tmpvar_10 = (tmpvar_7 - (tmpvar_8 * 0.032));
					  highp float tmpvar_11;
					  if ((tmpvar_10 > 0.016)) {
					    tmpvar_11 = 1.0;
					  } else {
					    tmpvar_11 = 0.0;
					  };
					  highp float tmpvar_12;
					  tmpvar_12 = (0.01847609 * abs((0.5 - 
					    (tmpvar_10 / 0.032)
					  )));
					  if ((tmpvar_9 > tmpvar_12)) {
					    r_2.x = tmpvar_3;
					    r_2.y = tmpvar_8;
					  } else {
					    r_2.x = (tmpvar_3 - 1.0);
					    highp float tmpvar_13;
					    tmpvar_13 = (r_2.x / 2.0);
					    highp float tmpvar_14;
					    tmpvar_14 = (fract(abs(tmpvar_13)) * 2.0);
					    highp float tmpvar_15;
					    if ((tmpvar_13 >= 0.0)) {
					      tmpvar_15 = tmpvar_14;
					    } else {
					      tmpvar_15 = -(tmpvar_14);
					    };
					    r_2.y = ((tmpvar_8 - tmpvar_15) + tmpvar_11);
					  };
					  highp vec2 r_16;
					  r_16.x = (r_2.x * 0.02771281);
					  highp float tmpvar_17;
					  tmpvar_17 = (r_2.x / 2.0);
					  highp float tmpvar_18;
					  tmpvar_18 = (fract(abs(tmpvar_17)) * 2.0);
					  highp float tmpvar_19;
					  if ((tmpvar_17 >= 0.0)) {
					    tmpvar_19 = tmpvar_18;
					  } else {
					    tmpvar_19 = -(tmpvar_18);
					  };
					  r_16.y = ((r_2.y * 0.032) + ((tmpvar_19 * 0.032) / 2.0));
					  lowp vec4 tmpvar_20;
					  tmpvar_20 = texture2D (_MainTex, r_16);
					  gl_FragData[0] = tmpvar_20;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					vec3 u_xlat1;
					bool u_xlatb1;
					float u_xlat2;
					bool u_xlatb2;
					float u_xlat6;
					float u_xlat9;
					bool u_xlatb9;
					float u_xlat10;
					bool u_xlatb10;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD0.x * 36.0828476;
					    u_xlat0.xz = floor(u_xlat0.xx);
					    u_xlat1.xz = u_xlat0.zz + vec2(-1.0, -1.0);
					    u_xlat9 = u_xlat1.z * 0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb10 = !!(u_xlat9>=(-u_xlat9));
					#else
					    u_xlatb10 = u_xlat9>=(-u_xlat9);
					#endif
					    u_xlat9 = fract(abs(u_xlat9));
					    u_xlat9 = (u_xlatb10) ? u_xlat9 : (-u_xlat9);
					    u_xlat10 = u_xlat0.z * 0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(u_xlat10>=(-u_xlat10));
					#else
					    u_xlatb2 = u_xlat10>=(-u_xlat10);
					#endif
					    u_xlat10 = fract(abs(u_xlat10));
					    u_xlat10 = (u_xlatb2) ? u_xlat10 : (-u_xlat10);
					    u_xlat10 = (-u_xlat10) * 0.0320000015 + vs_TEXCOORD0.y;
					    u_xlat2 = u_xlat10 * 31.25;
					    u_xlat0.y = floor(u_xlat2);
					    u_xlat9 = (-u_xlat9) * 2.0 + u_xlat0.y;
					    u_xlat10 = (-u_xlat0.y) * 0.0320000015 + u_xlat10;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(0.0160000008<u_xlat10);
					#else
					    u_xlatb2 = 0.0160000008<u_xlat10;
					#endif
					    u_xlat10 = (-u_xlat10) * 31.2499981 + 0.5;
					    u_xlat10 = abs(u_xlat10) * 0.0184760932;
					    u_xlat2 = u_xlatb2 ? 1.0 : float(0.0);
					    u_xlat1.y = u_xlat9 + u_xlat2;
					    u_xlat9 = (-u_xlat0.z) * 0.0277139992 + vs_TEXCOORD0.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb9 = !!(u_xlat10<u_xlat9);
					#else
					    u_xlatb9 = u_xlat10<u_xlat9;
					#endif
					    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0277128126, 0.0320000015, 0.5);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(u_xlat0.z>=(-u_xlat0.z));
					#else
					    u_xlatb1 = u_xlat0.z>=(-u_xlat0.z);
					#endif
					    u_xlat6 = fract(abs(u_xlat0.z));
					    u_xlat6 = (u_xlatb1) ? u_xlat6 : (-u_xlat6);
					    u_xlat0.w = u_xlat6 * 0.0320000015 + u_xlat0.y;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xw);
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					vec3 u_xlat1;
					bool u_xlatb1;
					float u_xlat2;
					bool u_xlatb2;
					float u_xlat6;
					float u_xlat9;
					bool u_xlatb9;
					float u_xlat10;
					bool u_xlatb10;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD0.x * 36.0828476;
					    u_xlat0.xz = floor(u_xlat0.xx);
					    u_xlat1.xz = u_xlat0.zz + vec2(-1.0, -1.0);
					    u_xlat9 = u_xlat1.z * 0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb10 = !!(u_xlat9>=(-u_xlat9));
					#else
					    u_xlatb10 = u_xlat9>=(-u_xlat9);
					#endif
					    u_xlat9 = fract(abs(u_xlat9));
					    u_xlat9 = (u_xlatb10) ? u_xlat9 : (-u_xlat9);
					    u_xlat10 = u_xlat0.z * 0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(u_xlat10>=(-u_xlat10));
					#else
					    u_xlatb2 = u_xlat10>=(-u_xlat10);
					#endif
					    u_xlat10 = fract(abs(u_xlat10));
					    u_xlat10 = (u_xlatb2) ? u_xlat10 : (-u_xlat10);
					    u_xlat10 = (-u_xlat10) * 0.0320000015 + vs_TEXCOORD0.y;
					    u_xlat2 = u_xlat10 * 31.25;
					    u_xlat0.y = floor(u_xlat2);
					    u_xlat9 = (-u_xlat9) * 2.0 + u_xlat0.y;
					    u_xlat10 = (-u_xlat0.y) * 0.0320000015 + u_xlat10;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(0.0160000008<u_xlat10);
					#else
					    u_xlatb2 = 0.0160000008<u_xlat10;
					#endif
					    u_xlat10 = (-u_xlat10) * 31.2499981 + 0.5;
					    u_xlat10 = abs(u_xlat10) * 0.0184760932;
					    u_xlat2 = u_xlatb2 ? 1.0 : float(0.0);
					    u_xlat1.y = u_xlat9 + u_xlat2;
					    u_xlat9 = (-u_xlat0.z) * 0.0277139992 + vs_TEXCOORD0.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb9 = !!(u_xlat10<u_xlat9);
					#else
					    u_xlatb9 = u_xlat10<u_xlat9;
					#endif
					    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0277128126, 0.0320000015, 0.5);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(u_xlat0.z>=(-u_xlat0.z));
					#else
					    u_xlatb1 = u_xlat0.z>=(-u_xlat0.z);
					#endif
					    u_xlat6 = fract(abs(u_xlat0.z));
					    u_xlat6 = (u_xlatb1) ? u_xlat6 : (-u_xlat6);
					    u_xlat0.w = u_xlat6 * 0.0320000015 + u_xlat0.y;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xw);
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					vec3 u_xlat1;
					bool u_xlatb1;
					float u_xlat2;
					bool u_xlatb2;
					float u_xlat6;
					float u_xlat9;
					bool u_xlatb9;
					float u_xlat10;
					bool u_xlatb10;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD0.x * 36.0828476;
					    u_xlat0.xz = floor(u_xlat0.xx);
					    u_xlat1.xz = u_xlat0.zz + vec2(-1.0, -1.0);
					    u_xlat9 = u_xlat1.z * 0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb10 = !!(u_xlat9>=(-u_xlat9));
					#else
					    u_xlatb10 = u_xlat9>=(-u_xlat9);
					#endif
					    u_xlat9 = fract(abs(u_xlat9));
					    u_xlat9 = (u_xlatb10) ? u_xlat9 : (-u_xlat9);
					    u_xlat10 = u_xlat0.z * 0.5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(u_xlat10>=(-u_xlat10));
					#else
					    u_xlatb2 = u_xlat10>=(-u_xlat10);
					#endif
					    u_xlat10 = fract(abs(u_xlat10));
					    u_xlat10 = (u_xlatb2) ? u_xlat10 : (-u_xlat10);
					    u_xlat10 = (-u_xlat10) * 0.0320000015 + vs_TEXCOORD0.y;
					    u_xlat2 = u_xlat10 * 31.25;
					    u_xlat0.y = floor(u_xlat2);
					    u_xlat9 = (-u_xlat9) * 2.0 + u_xlat0.y;
					    u_xlat10 = (-u_xlat0.y) * 0.0320000015 + u_xlat10;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb2 = !!(0.0160000008<u_xlat10);
					#else
					    u_xlatb2 = 0.0160000008<u_xlat10;
					#endif
					    u_xlat10 = (-u_xlat10) * 31.2499981 + 0.5;
					    u_xlat10 = abs(u_xlat10) * 0.0184760932;
					    u_xlat2 = u_xlatb2 ? 1.0 : float(0.0);
					    u_xlat1.y = u_xlat9 + u_xlat2;
					    u_xlat9 = (-u_xlat0.z) * 0.0277139992 + vs_TEXCOORD0.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb9 = !!(u_xlat10<u_xlat9);
					#else
					    u_xlatb9 = u_xlat10<u_xlat9;
					#endif
					    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0277128126, 0.0320000015, 0.5);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(u_xlat0.z>=(-u_xlat0.z));
					#else
					    u_xlatb1 = u_xlat0.z>=(-u_xlat0.z);
					#endif
					    u_xlat6 = fract(abs(u_xlat0.z));
					    u_xlat6 = (u_xlatb1) ? u_xlat6 : (-u_xlat6);
					    u_xlat0.w = u_xlat6 * 0.0320000015 + u_xlat0.y;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xw);
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