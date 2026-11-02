Shader "CameraFilterPack/Distortion_ShockWave" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 60883
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 Color_1;
					  highp float Change_2;
					  highp float ScaleDiff_3;
					  highp vec2 texCoord_4;
					  highp float tmpvar_5;
					  tmpvar_5 = (_TimeX * _Value3);
					  highp float tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * ((tmpvar_5 - 
					    floor(tmpvar_5)
					  ) / tmpvar_5));
					  highp vec2 tmpvar_7;
					  tmpvar_7.x = _Value;
					  tmpvar_7.y = _Value2;
					  texCoord_4 = xlv_TEXCOORD0;
					  highp float tmpvar_8;
					  highp vec2 tmpvar_9;
					  tmpvar_9 = (texCoord_4 - tmpvar_7);
					  tmpvar_8 = sqrt(dot (tmpvar_9, tmpvar_9));
					  ScaleDiff_3 = 1.0;
					  Change_2 = 0.0;
					  if (((tmpvar_8 <= (tmpvar_6 + 0.1)) && (tmpvar_8 >= (tmpvar_6 - 0.1)))) {
					    highp float tmpvar_10;
					    tmpvar_10 = (tmpvar_8 - tmpvar_6);
					    ScaleDiff_3 = (1.0 - pow (abs(
					      (tmpvar_10 * 10.0)
					    ), 0.8));
					    Change_2 = 1.0;
					    texCoord_4 = (texCoord_4 + ((
					      normalize((texCoord_4 - tmpvar_7))
					     * 
					      (tmpvar_10 * ScaleDiff_3)
					    ) / (
					      (tmpvar_6 * tmpvar_8)
					     * 40.0)));
					  };
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_MainTex, texCoord_4);
					  Color_1 = tmpvar_11;
					  Color_1 = (Color_1 + ((
					    (Color_1 * ScaleDiff_3)
					   / 
					    ((tmpvar_6 * tmpvar_8) * 40.0)
					  ) * Change_2));
					  gl_FragData[0] = Color_1;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 Color_1;
					  highp float Change_2;
					  highp float ScaleDiff_3;
					  highp vec2 texCoord_4;
					  highp float tmpvar_5;
					  tmpvar_5 = (_TimeX * _Value3);
					  highp float tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * ((tmpvar_5 - 
					    floor(tmpvar_5)
					  ) / tmpvar_5));
					  highp vec2 tmpvar_7;
					  tmpvar_7.x = _Value;
					  tmpvar_7.y = _Value2;
					  texCoord_4 = xlv_TEXCOORD0;
					  highp float tmpvar_8;
					  highp vec2 tmpvar_9;
					  tmpvar_9 = (texCoord_4 - tmpvar_7);
					  tmpvar_8 = sqrt(dot (tmpvar_9, tmpvar_9));
					  ScaleDiff_3 = 1.0;
					  Change_2 = 0.0;
					  if (((tmpvar_8 <= (tmpvar_6 + 0.1)) && (tmpvar_8 >= (tmpvar_6 - 0.1)))) {
					    highp float tmpvar_10;
					    tmpvar_10 = (tmpvar_8 - tmpvar_6);
					    ScaleDiff_3 = (1.0 - pow (abs(
					      (tmpvar_10 * 10.0)
					    ), 0.8));
					    Change_2 = 1.0;
					    texCoord_4 = (texCoord_4 + ((
					      normalize((texCoord_4 - tmpvar_7))
					     * 
					      (tmpvar_10 * ScaleDiff_3)
					    ) / (
					      (tmpvar_6 * tmpvar_8)
					     * 40.0)));
					  };
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_MainTex, texCoord_4);
					  Color_1 = tmpvar_11;
					  Color_1 = (Color_1 + ((
					    (Color_1 * ScaleDiff_3)
					   / 
					    ((tmpvar_6 * tmpvar_8) * 40.0)
					  ) * Change_2));
					  gl_FragData[0] = Color_1;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 Color_1;
					  highp float Change_2;
					  highp float ScaleDiff_3;
					  highp vec2 texCoord_4;
					  highp float tmpvar_5;
					  tmpvar_5 = (_TimeX * _Value3);
					  highp float tmpvar_6;
					  tmpvar_6 = (tmpvar_5 * ((tmpvar_5 - 
					    floor(tmpvar_5)
					  ) / tmpvar_5));
					  highp vec2 tmpvar_7;
					  tmpvar_7.x = _Value;
					  tmpvar_7.y = _Value2;
					  texCoord_4 = xlv_TEXCOORD0;
					  highp float tmpvar_8;
					  highp vec2 tmpvar_9;
					  tmpvar_9 = (texCoord_4 - tmpvar_7);
					  tmpvar_8 = sqrt(dot (tmpvar_9, tmpvar_9));
					  ScaleDiff_3 = 1.0;
					  Change_2 = 0.0;
					  if (((tmpvar_8 <= (tmpvar_6 + 0.1)) && (tmpvar_8 >= (tmpvar_6 - 0.1)))) {
					    highp float tmpvar_10;
					    tmpvar_10 = (tmpvar_8 - tmpvar_6);
					    ScaleDiff_3 = (1.0 - pow (abs(
					      (tmpvar_10 * 10.0)
					    ), 0.8));
					    Change_2 = 1.0;
					    texCoord_4 = (texCoord_4 + ((
					      normalize((texCoord_4 - tmpvar_7))
					     * 
					      (tmpvar_10 * ScaleDiff_3)
					    ) / (
					      (tmpvar_6 * tmpvar_8)
					     * 40.0)));
					  };
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_MainTex, texCoord_4);
					  Color_1 = tmpvar_11;
					  Color_1 = (Color_1 + ((
					    (Color_1 * ScaleDiff_3)
					   / 
					    ((tmpvar_6 * tmpvar_8) * 40.0)
					  ) * Change_2));
					  gl_FragData[0] = Color_1;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					lowp vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec2 u_xlat3;
					bool u_xlatb3;
					vec2 u_xlat4;
					float u_xlat6;
					vec2 u_xlat8;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = vec2(vs_TEXCOORD0.x + (-float(_Value)), vs_TEXCOORD0.y + (-float(_Value2)));
					    u_xlat6 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat9 = inversesqrt(u_xlat6);
					    u_xlat6 = sqrt(u_xlat6);
					    u_xlat0.xy = vec2(u_xlat9) * u_xlat0.xy;
					    u_xlat9 = _Value3 * _TimeX;
					    u_xlat9 = floor(u_xlat9);
					    u_xlat9 = _TimeX * _Value3 + (-u_xlat9);
					    u_xlat1 = (-u_xlat9) + u_xlat6;
					    u_xlat4.x = u_xlat1 * 10.0;
					    u_xlat4.x = log2(abs(u_xlat4.x));
					    u_xlat4.x = u_xlat4.x * 0.800000012;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlat8.x = (-u_xlat4.x) + 1.0;
					    u_xlat1 = u_xlat1 * u_xlat8.x;
					    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat1);
					    u_xlat1 = u_xlat6 * u_xlat9;
					    u_xlat4.xy = vec2(u_xlat9) + vec2(0.100000001, -0.100000001);
					    u_xlat9 = u_xlat1 * 40.0;
					    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat9);
					    u_xlat2.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat4.x>=u_xlat6);
					#else
					    u_xlatb0 = u_xlat4.x>=u_xlat6;
					#endif
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb3 = !!(u_xlat6>=u_xlat4.y);
					#else
					    u_xlatb3 = u_xlat6>=u_xlat4.y;
					#endif
					    u_xlatb0 = u_xlatb3 && u_xlatb0;
					    u_xlat3.xy = (bool(u_xlatb0)) ? u_xlat2.xy : vs_TEXCOORD0.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat3.xy);
					    u_xlat8.y = 1.0;
					    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat8.xy : vec2(1.0, 0.0);
					    u_xlat2 = u_xlat0.xxxx * u_xlat10_1;
					    u_xlat2 = u_xlat2 / vec4(u_xlat9);
					    SV_Target0 = u_xlat2 * u_xlat0.yyyy + u_xlat10_1;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					lowp vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec2 u_xlat3;
					bool u_xlatb3;
					vec2 u_xlat4;
					float u_xlat6;
					vec2 u_xlat8;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = vec2(vs_TEXCOORD0.x + (-float(_Value)), vs_TEXCOORD0.y + (-float(_Value2)));
					    u_xlat6 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat9 = inversesqrt(u_xlat6);
					    u_xlat6 = sqrt(u_xlat6);
					    u_xlat0.xy = vec2(u_xlat9) * u_xlat0.xy;
					    u_xlat9 = _Value3 * _TimeX;
					    u_xlat9 = floor(u_xlat9);
					    u_xlat9 = _TimeX * _Value3 + (-u_xlat9);
					    u_xlat1 = (-u_xlat9) + u_xlat6;
					    u_xlat4.x = u_xlat1 * 10.0;
					    u_xlat4.x = log2(abs(u_xlat4.x));
					    u_xlat4.x = u_xlat4.x * 0.800000012;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlat8.x = (-u_xlat4.x) + 1.0;
					    u_xlat1 = u_xlat1 * u_xlat8.x;
					    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat1);
					    u_xlat1 = u_xlat6 * u_xlat9;
					    u_xlat4.xy = vec2(u_xlat9) + vec2(0.100000001, -0.100000001);
					    u_xlat9 = u_xlat1 * 40.0;
					    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat9);
					    u_xlat2.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat4.x>=u_xlat6);
					#else
					    u_xlatb0 = u_xlat4.x>=u_xlat6;
					#endif
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb3 = !!(u_xlat6>=u_xlat4.y);
					#else
					    u_xlatb3 = u_xlat6>=u_xlat4.y;
					#endif
					    u_xlatb0 = u_xlatb3 && u_xlatb0;
					    u_xlat3.xy = (bool(u_xlatb0)) ? u_xlat2.xy : vs_TEXCOORD0.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat3.xy);
					    u_xlat8.y = 1.0;
					    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat8.xy : vec2(1.0, 0.0);
					    u_xlat2 = u_xlat0.xxxx * u_xlat10_1;
					    u_xlat2 = u_xlat2 / vec4(u_xlat9);
					    SV_Target0 = u_xlat2 * u_xlat0.yyyy + u_xlat10_1;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					lowp vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec2 u_xlat3;
					bool u_xlatb3;
					vec2 u_xlat4;
					float u_xlat6;
					vec2 u_xlat8;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = vec2(vs_TEXCOORD0.x + (-float(_Value)), vs_TEXCOORD0.y + (-float(_Value2)));
					    u_xlat6 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat9 = inversesqrt(u_xlat6);
					    u_xlat6 = sqrt(u_xlat6);
					    u_xlat0.xy = vec2(u_xlat9) * u_xlat0.xy;
					    u_xlat9 = _Value3 * _TimeX;
					    u_xlat9 = floor(u_xlat9);
					    u_xlat9 = _TimeX * _Value3 + (-u_xlat9);
					    u_xlat1 = (-u_xlat9) + u_xlat6;
					    u_xlat4.x = u_xlat1 * 10.0;
					    u_xlat4.x = log2(abs(u_xlat4.x));
					    u_xlat4.x = u_xlat4.x * 0.800000012;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlat8.x = (-u_xlat4.x) + 1.0;
					    u_xlat1 = u_xlat1 * u_xlat8.x;
					    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat1);
					    u_xlat1 = u_xlat6 * u_xlat9;
					    u_xlat4.xy = vec2(u_xlat9) + vec2(0.100000001, -0.100000001);
					    u_xlat9 = u_xlat1 * 40.0;
					    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat9);
					    u_xlat2.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat4.x>=u_xlat6);
					#else
					    u_xlatb0 = u_xlat4.x>=u_xlat6;
					#endif
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb3 = !!(u_xlat6>=u_xlat4.y);
					#else
					    u_xlatb3 = u_xlat6>=u_xlat4.y;
					#endif
					    u_xlatb0 = u_xlatb3 && u_xlatb0;
					    u_xlat3.xy = (bool(u_xlatb0)) ? u_xlat2.xy : vs_TEXCOORD0.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat3.xy);
					    u_xlat8.y = 1.0;
					    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat8.xy : vec2(1.0, 0.0);
					    u_xlat2 = u_xlat0.xxxx * u_xlat10_1;
					    u_xlat2 = u_xlat2 / vec4(u_xlat9);
					    SV_Target0 = u_xlat2 * u_xlat0.yyyy + u_xlat10_1;
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