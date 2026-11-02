Shader "CameraFilterPack/Distortion_Flush" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 22848
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 col_1;
					  highp float tmpvar_2;
					  tmpvar_2 = (_TimeX / 10.0);
					  highp float tmpvar_3;
					  tmpvar_3 = (fract(abs(tmpvar_2)) * 10.0);
					  highp float tmpvar_4;
					  if ((tmpvar_2 >= 0.0)) {
					    tmpvar_4 = tmpvar_3;
					  } else {
					    tmpvar_4 = -(tmpvar_3);
					  };
					  highp vec2 tmpvar_5;
					  tmpvar_5 = (xlv_TEXCOORD0 - vec2(0.5, 0.5));
					  highp float tmpvar_6;
					  tmpvar_6 = ((pow (
					    ((0.5 - sqrt(dot (tmpvar_5, tmpvar_5))) / 0.7071068)
					  , 0.5) * tmpvar_4) * 5.0);
					  lowp vec4 tmpvar_7;
					  highp vec2 P_8;
					  P_8 = (xlv_TEXCOORD0 + (vec2(float(
					    (((tmpvar_5.x * cos(tmpvar_6)) - (tmpvar_5.y * cos(tmpvar_6))) >= 0.0)
					  )) / 16.0));
					  tmpvar_7 = texture2D (_MainTex, P_8);
					  col_1 = tmpvar_7;
					  gl_FragData[0] = col_1;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 col_1;
					  highp float tmpvar_2;
					  tmpvar_2 = (_TimeX / 10.0);
					  highp float tmpvar_3;
					  tmpvar_3 = (fract(abs(tmpvar_2)) * 10.0);
					  highp float tmpvar_4;
					  if ((tmpvar_2 >= 0.0)) {
					    tmpvar_4 = tmpvar_3;
					  } else {
					    tmpvar_4 = -(tmpvar_3);
					  };
					  highp vec2 tmpvar_5;
					  tmpvar_5 = (xlv_TEXCOORD0 - vec2(0.5, 0.5));
					  highp float tmpvar_6;
					  tmpvar_6 = ((pow (
					    ((0.5 - sqrt(dot (tmpvar_5, tmpvar_5))) / 0.7071068)
					  , 0.5) * tmpvar_4) * 5.0);
					  lowp vec4 tmpvar_7;
					  highp vec2 P_8;
					  P_8 = (xlv_TEXCOORD0 + (vec2(float(
					    (((tmpvar_5.x * cos(tmpvar_6)) - (tmpvar_5.y * cos(tmpvar_6))) >= 0.0)
					  )) / 16.0));
					  tmpvar_7 = texture2D (_MainTex, P_8);
					  col_1 = tmpvar_7;
					  gl_FragData[0] = col_1;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 col_1;
					  highp float tmpvar_2;
					  tmpvar_2 = (_TimeX / 10.0);
					  highp float tmpvar_3;
					  tmpvar_3 = (fract(abs(tmpvar_2)) * 10.0);
					  highp float tmpvar_4;
					  if ((tmpvar_2 >= 0.0)) {
					    tmpvar_4 = tmpvar_3;
					  } else {
					    tmpvar_4 = -(tmpvar_3);
					  };
					  highp vec2 tmpvar_5;
					  tmpvar_5 = (xlv_TEXCOORD0 - vec2(0.5, 0.5));
					  highp float tmpvar_6;
					  tmpvar_6 = ((pow (
					    ((0.5 - sqrt(dot (tmpvar_5, tmpvar_5))) / 0.7071068)
					  , 0.5) * tmpvar_4) * 5.0);
					  lowp vec4 tmpvar_7;
					  highp vec2 P_8;
					  P_8 = (xlv_TEXCOORD0 + (vec2(float(
					    (((tmpvar_5.x * cos(tmpvar_6)) - (tmpvar_5.y * cos(tmpvar_6))) >= 0.0)
					  )) / 16.0));
					  tmpvar_7 = texture2D (_MainTex, P_8);
					  col_1 = tmpvar_7;
					  gl_FragData[0] = col_1;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					mediump vec2 u_xlat16_1;
					bool u_xlatb1;
					float u_xlat2;
					float u_xlat3;
					mediump float u_xlat16_3;
					void main()
					{
					    u_xlat0.x = _TimeX * 0.100000001;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(u_xlat0.x>=(-u_xlat0.x));
					#else
					    u_xlatb1 = u_xlat0.x>=(-u_xlat0.x);
					#endif
					    u_xlat0.x = fract(abs(u_xlat0.x));
					    u_xlat0.x = (u_xlatb1) ? u_xlat0.x : (-u_xlat0.x);
					    u_xlat16_1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_3 = dot(u_xlat16_1.xy, u_xlat16_1.xy);
					    u_xlat16_3 = sqrt(u_xlat16_3);
					    u_xlat0.w = (-u_xlat16_3) + 0.5;
					    u_xlat0.xw = u_xlat0.xw * vec2(10.0, 1.41421354);
					    u_xlat3 = inversesqrt(u_xlat0.w);
					    u_xlat3 = float(1.0) / u_xlat3;
					    u_xlat0.x = u_xlat0.x * u_xlat3;
					    u_xlat0.x = u_xlat0.x * 5.0;
					    u_xlat0.x = cos(u_xlat0.x);
					    u_xlat2 = u_xlat0.x * u_xlat16_1.y;
					    u_xlat0.x = u_xlat16_1.x * u_xlat0.x + (-u_xlat2);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat0.x>=0.0);
					#else
					    u_xlatb0 = u_xlat0.x>=0.0;
					#endif
					    u_xlat0.x = u_xlatb0 ? 0.0625 : float(0.0);
					    u_xlat0.xy = u_xlat0.xx + vs_TEXCOORD0.xy;
					    SV_Target0 = texture(_MainTex, u_xlat0.xy);
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					mediump vec2 u_xlat16_1;
					bool u_xlatb1;
					float u_xlat2;
					float u_xlat3;
					mediump float u_xlat16_3;
					void main()
					{
					    u_xlat0.x = _TimeX * 0.100000001;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(u_xlat0.x>=(-u_xlat0.x));
					#else
					    u_xlatb1 = u_xlat0.x>=(-u_xlat0.x);
					#endif
					    u_xlat0.x = fract(abs(u_xlat0.x));
					    u_xlat0.x = (u_xlatb1) ? u_xlat0.x : (-u_xlat0.x);
					    u_xlat16_1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_3 = dot(u_xlat16_1.xy, u_xlat16_1.xy);
					    u_xlat16_3 = sqrt(u_xlat16_3);
					    u_xlat0.w = (-u_xlat16_3) + 0.5;
					    u_xlat0.xw = u_xlat0.xw * vec2(10.0, 1.41421354);
					    u_xlat3 = inversesqrt(u_xlat0.w);
					    u_xlat3 = float(1.0) / u_xlat3;
					    u_xlat0.x = u_xlat0.x * u_xlat3;
					    u_xlat0.x = u_xlat0.x * 5.0;
					    u_xlat0.x = cos(u_xlat0.x);
					    u_xlat2 = u_xlat0.x * u_xlat16_1.y;
					    u_xlat0.x = u_xlat16_1.x * u_xlat0.x + (-u_xlat2);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat0.x>=0.0);
					#else
					    u_xlatb0 = u_xlat0.x>=0.0;
					#endif
					    u_xlat0.x = u_xlatb0 ? 0.0625 : float(0.0);
					    u_xlat0.xy = u_xlat0.xx + vs_TEXCOORD0.xy;
					    SV_Target0 = texture(_MainTex, u_xlat0.xy);
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					mediump vec2 u_xlat16_1;
					bool u_xlatb1;
					float u_xlat2;
					float u_xlat3;
					mediump float u_xlat16_3;
					void main()
					{
					    u_xlat0.x = _TimeX * 0.100000001;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(u_xlat0.x>=(-u_xlat0.x));
					#else
					    u_xlatb1 = u_xlat0.x>=(-u_xlat0.x);
					#endif
					    u_xlat0.x = fract(abs(u_xlat0.x));
					    u_xlat0.x = (u_xlatb1) ? u_xlat0.x : (-u_xlat0.x);
					    u_xlat16_1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_3 = dot(u_xlat16_1.xy, u_xlat16_1.xy);
					    u_xlat16_3 = sqrt(u_xlat16_3);
					    u_xlat0.w = (-u_xlat16_3) + 0.5;
					    u_xlat0.xw = u_xlat0.xw * vec2(10.0, 1.41421354);
					    u_xlat3 = inversesqrt(u_xlat0.w);
					    u_xlat3 = float(1.0) / u_xlat3;
					    u_xlat0.x = u_xlat0.x * u_xlat3;
					    u_xlat0.x = u_xlat0.x * 5.0;
					    u_xlat0.x = cos(u_xlat0.x);
					    u_xlat2 = u_xlat0.x * u_xlat16_1.y;
					    u_xlat0.x = u_xlat16_1.x * u_xlat0.x + (-u_xlat2);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat0.x>=0.0);
					#else
					    u_xlatb0 = u_xlat0.x>=0.0;
					#endif
					    u_xlat0.x = u_xlatb0 ? 0.0625 : float(0.0);
					    u_xlat0.xy = u_xlat0.xx + vs_TEXCOORD0.xy;
					    SV_Target0 = texture(_MainTex, u_xlat0.xy);
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