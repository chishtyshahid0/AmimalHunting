Shader "CameraFilterPack/Vision_Tunnel" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 3710
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
					uniform highp float _Value;
					uniform highp float _Value2;
					uniform highp float _Value3;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 col_1;
					  highp vec2 uv_2;
					  highp vec2 p_3;
					  mediump vec2 tmpvar_4;
					  tmpvar_4 = (-1.0 + (2.0 * xlv_TEXCOORD0));
					  p_3 = tmpvar_4;
					  highp float tmpvar_5;
					  tmpvar_5 = sqrt(dot (p_3, p_3));
					  highp float tmpvar_6;
					  highp float tmpvar_7;
					  tmpvar_7 = (min (abs(
					    (p_3.y / p_3.x)
					  ), 1.0) / max (abs(
					    (p_3.y / p_3.x)
					  ), 1.0));
					  highp float tmpvar_8;
					  tmpvar_8 = (tmpvar_7 * tmpvar_7);
					  tmpvar_8 = (((
					    ((((
					      ((((-0.01213232 * tmpvar_8) + 0.05368138) * tmpvar_8) - 0.1173503)
					     * tmpvar_8) + 0.1938925) * tmpvar_8) - 0.3326756)
					   * tmpvar_8) + 0.9999793) * tmpvar_7);
					  tmpvar_8 = (tmpvar_8 + (float(
					    (abs((p_3.y / p_3.x)) > 1.0)
					  ) * (
					    (tmpvar_8 * -2.0)
					   + 1.570796)));
					  tmpvar_6 = (tmpvar_8 * sign((p_3.y / p_3.x)));
					  if ((abs(p_3.x) > (1e-08 * abs(p_3.y)))) {
					    if ((p_3.x < 0.0)) {
					      if ((p_3.y >= 0.0)) {
					        tmpvar_6 += 3.141593;
					      } else {
					        tmpvar_6 = (tmpvar_6 - 3.141593);
					      };
					    };
					  } else {
					    tmpvar_6 = (sign(p_3.y) * 1.570796);
					  };
					  uv_2.x = (0.8 - (0.1 / tmpvar_5));
					  highp float x_9;
					  x_9 = (tmpvar_6 / 3.1416);
					  uv_2.y = (x_9 - (_Value3 * floor(
					    (x_9 / _Value3)
					  )));
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, uv_2).xyz;
					  col_1 = tmpvar_10;
					  highp float tmpvar_11;
					  tmpvar_11 = clamp ((tmpvar_5 / 0.5), 0.0, 1.0);
					  col_1 = (col_1 * (tmpvar_11 * (tmpvar_11 * 
					    (3.0 - (2.0 * tmpvar_11))
					  )));
					  mediump float tmpvar_12;
					  mediump vec2 x_13;
					  x_13 = (vec2(0.5, 0.5) - xlv_TEXCOORD0);
					  tmpvar_12 = sqrt(dot (x_13, x_13));
					  highp float tmpvar_14;
					  tmpvar_14 = clamp (((tmpvar_12 - _Value) / (
					    ((_Value - 0.05) - _Value2)
					   - _Value)), 0.0, 1.0);
					  lowp vec4 tmpvar_15;
					  tmpvar_15 = texture2D (_MainTex, xlv_TEXCOORD0);
					  highp vec4 tmpvar_16;
					  tmpvar_16.w = 0.0;
					  tmpvar_16.xyz = col_1;
					  highp vec4 tmpvar_17;
					  tmpvar_17.w = 1.0;
					  tmpvar_17.xyz = mix (tmpvar_15, tmpvar_16, vec4((1.0 - (tmpvar_14 * 
					    (tmpvar_14 * (3.0 - (2.0 * tmpvar_14)))
					  )))).xyz;
					  gl_FragData[0] = tmpvar_17;
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
					uniform highp float _Value;
					uniform highp float _Value2;
					uniform highp float _Value3;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 col_1;
					  highp vec2 uv_2;
					  highp vec2 p_3;
					  mediump vec2 tmpvar_4;
					  tmpvar_4 = (-1.0 + (2.0 * xlv_TEXCOORD0));
					  p_3 = tmpvar_4;
					  highp float tmpvar_5;
					  tmpvar_5 = sqrt(dot (p_3, p_3));
					  highp float tmpvar_6;
					  highp float tmpvar_7;
					  tmpvar_7 = (min (abs(
					    (p_3.y / p_3.x)
					  ), 1.0) / max (abs(
					    (p_3.y / p_3.x)
					  ), 1.0));
					  highp float tmpvar_8;
					  tmpvar_8 = (tmpvar_7 * tmpvar_7);
					  tmpvar_8 = (((
					    ((((
					      ((((-0.01213232 * tmpvar_8) + 0.05368138) * tmpvar_8) - 0.1173503)
					     * tmpvar_8) + 0.1938925) * tmpvar_8) - 0.3326756)
					   * tmpvar_8) + 0.9999793) * tmpvar_7);
					  tmpvar_8 = (tmpvar_8 + (float(
					    (abs((p_3.y / p_3.x)) > 1.0)
					  ) * (
					    (tmpvar_8 * -2.0)
					   + 1.570796)));
					  tmpvar_6 = (tmpvar_8 * sign((p_3.y / p_3.x)));
					  if ((abs(p_3.x) > (1e-08 * abs(p_3.y)))) {
					    if ((p_3.x < 0.0)) {
					      if ((p_3.y >= 0.0)) {
					        tmpvar_6 += 3.141593;
					      } else {
					        tmpvar_6 = (tmpvar_6 - 3.141593);
					      };
					    };
					  } else {
					    tmpvar_6 = (sign(p_3.y) * 1.570796);
					  };
					  uv_2.x = (0.8 - (0.1 / tmpvar_5));
					  highp float x_9;
					  x_9 = (tmpvar_6 / 3.1416);
					  uv_2.y = (x_9 - (_Value3 * floor(
					    (x_9 / _Value3)
					  )));
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, uv_2).xyz;
					  col_1 = tmpvar_10;
					  highp float tmpvar_11;
					  tmpvar_11 = clamp ((tmpvar_5 / 0.5), 0.0, 1.0);
					  col_1 = (col_1 * (tmpvar_11 * (tmpvar_11 * 
					    (3.0 - (2.0 * tmpvar_11))
					  )));
					  mediump float tmpvar_12;
					  mediump vec2 x_13;
					  x_13 = (vec2(0.5, 0.5) - xlv_TEXCOORD0);
					  tmpvar_12 = sqrt(dot (x_13, x_13));
					  highp float tmpvar_14;
					  tmpvar_14 = clamp (((tmpvar_12 - _Value) / (
					    ((_Value - 0.05) - _Value2)
					   - _Value)), 0.0, 1.0);
					  lowp vec4 tmpvar_15;
					  tmpvar_15 = texture2D (_MainTex, xlv_TEXCOORD0);
					  highp vec4 tmpvar_16;
					  tmpvar_16.w = 0.0;
					  tmpvar_16.xyz = col_1;
					  highp vec4 tmpvar_17;
					  tmpvar_17.w = 1.0;
					  tmpvar_17.xyz = mix (tmpvar_15, tmpvar_16, vec4((1.0 - (tmpvar_14 * 
					    (tmpvar_14 * (3.0 - (2.0 * tmpvar_14)))
					  )))).xyz;
					  gl_FragData[0] = tmpvar_17;
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
					uniform highp float _Value;
					uniform highp float _Value2;
					uniform highp float _Value3;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 col_1;
					  highp vec2 uv_2;
					  highp vec2 p_3;
					  mediump vec2 tmpvar_4;
					  tmpvar_4 = (-1.0 + (2.0 * xlv_TEXCOORD0));
					  p_3 = tmpvar_4;
					  highp float tmpvar_5;
					  tmpvar_5 = sqrt(dot (p_3, p_3));
					  highp float tmpvar_6;
					  highp float tmpvar_7;
					  tmpvar_7 = (min (abs(
					    (p_3.y / p_3.x)
					  ), 1.0) / max (abs(
					    (p_3.y / p_3.x)
					  ), 1.0));
					  highp float tmpvar_8;
					  tmpvar_8 = (tmpvar_7 * tmpvar_7);
					  tmpvar_8 = (((
					    ((((
					      ((((-0.01213232 * tmpvar_8) + 0.05368138) * tmpvar_8) - 0.1173503)
					     * tmpvar_8) + 0.1938925) * tmpvar_8) - 0.3326756)
					   * tmpvar_8) + 0.9999793) * tmpvar_7);
					  tmpvar_8 = (tmpvar_8 + (float(
					    (abs((p_3.y / p_3.x)) > 1.0)
					  ) * (
					    (tmpvar_8 * -2.0)
					   + 1.570796)));
					  tmpvar_6 = (tmpvar_8 * sign((p_3.y / p_3.x)));
					  if ((abs(p_3.x) > (1e-08 * abs(p_3.y)))) {
					    if ((p_3.x < 0.0)) {
					      if ((p_3.y >= 0.0)) {
					        tmpvar_6 += 3.141593;
					      } else {
					        tmpvar_6 = (tmpvar_6 - 3.141593);
					      };
					    };
					  } else {
					    tmpvar_6 = (sign(p_3.y) * 1.570796);
					  };
					  uv_2.x = (0.8 - (0.1 / tmpvar_5));
					  highp float x_9;
					  x_9 = (tmpvar_6 / 3.1416);
					  uv_2.y = (x_9 - (_Value3 * floor(
					    (x_9 / _Value3)
					  )));
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, uv_2).xyz;
					  col_1 = tmpvar_10;
					  highp float tmpvar_11;
					  tmpvar_11 = clamp ((tmpvar_5 / 0.5), 0.0, 1.0);
					  col_1 = (col_1 * (tmpvar_11 * (tmpvar_11 * 
					    (3.0 - (2.0 * tmpvar_11))
					  )));
					  mediump float tmpvar_12;
					  mediump vec2 x_13;
					  x_13 = (vec2(0.5, 0.5) - xlv_TEXCOORD0);
					  tmpvar_12 = sqrt(dot (x_13, x_13));
					  highp float tmpvar_14;
					  tmpvar_14 = clamp (((tmpvar_12 - _Value) / (
					    ((_Value - 0.05) - _Value2)
					   - _Value)), 0.0, 1.0);
					  lowp vec4 tmpvar_15;
					  tmpvar_15 = texture2D (_MainTex, xlv_TEXCOORD0);
					  highp vec4 tmpvar_16;
					  tmpvar_16.w = 0.0;
					  tmpvar_16.xyz = col_1;
					  highp vec4 tmpvar_17;
					  tmpvar_17.w = 1.0;
					  tmpvar_17.xyz = mix (tmpvar_15, tmpvar_16, vec4((1.0 - (tmpvar_14 * 
					    (tmpvar_14 * (3.0 - (2.0 * tmpvar_14)))
					  )))).xyz;
					  gl_FragData[0] = tmpvar_17;
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump vec2 u_xlat16_0;
					vec2 u_xlat1;
					mediump vec3 u_xlat16_1;
					lowp vec3 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec3 u_xlat10_2;
					mediump vec2 u_xlat16_3;
					float u_xlat5;
					mediump float u_xlat16_5;
					bool u_xlatb5;
					float u_xlat9;
					mediump float u_xlat16_9;
					bool u_xlatb9;
					float u_xlat13;
					mediump float u_xlat16_13;
					bool u_xlatb13;
					float u_xlat14;
					void main()
					{
					    u_xlat16_0.xy = vs_TEXCOORD0.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat16_1.x = max(abs(u_xlat16_0.y), abs(u_xlat16_0.x));
					    u_xlat16_1.x = float(1.0) / u_xlat16_1.x;
					    u_xlat16_5 = min(abs(u_xlat16_0.y), abs(u_xlat16_0.x));
					    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_5;
					    u_xlat16_5 = u_xlat16_1.x * u_xlat16_1.x;
					    u_xlat16_9 = u_xlat16_5 * 0.0208350997 + -0.0851330012;
					    u_xlat16_9 = u_xlat16_5 * u_xlat16_9 + 0.180141002;
					    u_xlat16_9 = u_xlat16_5 * u_xlat16_9 + -0.330299497;
					    u_xlat16_5 = u_xlat16_5 * u_xlat16_9 + 0.999866009;
					    u_xlat16_9 = u_xlat16_5 * u_xlat16_1.x;
					    u_xlat9 = u_xlat16_9 * -2.0 + 1.57079637;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb13 = !!(abs(u_xlat16_0.y)<abs(u_xlat16_0.x));
					#else
					    u_xlatb13 = abs(u_xlat16_0.y)<abs(u_xlat16_0.x);
					#endif
					    u_xlat9 = u_xlatb13 ? u_xlat9 : float(0.0);
					    u_xlat1.x = u_xlat16_1.x * u_xlat16_5 + u_xlat9;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb5 = !!(u_xlat16_0.y<(-u_xlat16_0.y));
					#else
					    u_xlatb5 = u_xlat16_0.y<(-u_xlat16_0.y);
					#endif
					    u_xlat5 = u_xlatb5 ? -3.14159274 : float(0.0);
					    u_xlat1.x = u_xlat5 + u_xlat1.x;
					    u_xlat5 = min(u_xlat16_0.y, u_xlat16_0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb5 = !!(u_xlat5<(-u_xlat5));
					#else
					    u_xlatb5 = u_xlat5<(-u_xlat5);
					#endif
					    u_xlat9 = max(u_xlat16_0.y, u_xlat16_0.x);
					    u_xlat16_13 = dot(u_xlat16_0.xy, u_xlat16_0.xy);
					    u_xlat16_13 = sqrt(u_xlat16_13);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb9 = !!(u_xlat9>=(-u_xlat9));
					#else
					    u_xlatb9 = u_xlat9>=(-u_xlat9);
					#endif
					    u_xlatb5 = u_xlatb9 && u_xlatb5;
					    u_xlat1.x = (u_xlatb5) ? (-u_xlat1.x) : u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * 0.318309158;
					    u_xlat5 = u_xlat1.x / _Value3;
					    u_xlat5 = floor(u_xlat5);
					    u_xlat1.y = (-_Value3) * u_xlat5 + u_xlat1.x;
					    u_xlat16_9 = 0.100000001 / u_xlat16_13;
					    u_xlat16_13 = u_xlat16_13 + u_xlat16_13;
					    u_xlat16_13 = min(u_xlat16_13, 1.0);
					    u_xlat1.x = (-u_xlat16_9) + 0.800000012;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat16_2 = u_xlat16_13 * -2.0 + 3.0;
					    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
					    u_xlat16_13 = u_xlat16_13 * u_xlat16_2;
					    u_xlat10_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_1.xyz = u_xlat10_1.xyz * vec3(u_xlat16_13) + (-u_xlat10_2.xyz);
					    u_xlat16_3.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
					    u_xlat16_13 = dot(u_xlat16_3.xy, u_xlat16_3.xy);
					    u_xlat16_13 = sqrt(u_xlat16_13);
					    u_xlat13 = u_xlat16_13 + (-_Value);
					    u_xlat14 = _Value + -0.0500000007;
					    u_xlat14 = u_xlat14 + (-_Value2);
					    u_xlat14 = u_xlat14 + (-_Value);
					    u_xlat14 = float(1.0) / u_xlat14;
					    u_xlat13 = u_xlat13 * u_xlat14;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat13 = min(max(u_xlat13, 0.0), 1.0);
					#else
					    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
					#endif
					    u_xlat14 = u_xlat13 * -2.0 + 3.0;
					    u_xlat13 = u_xlat13 * u_xlat13;
					    u_xlat13 = (-u_xlat14) * u_xlat13 + 1.0;
					    SV_Target0.xyz = vec3(u_xlat13) * u_xlat16_1.xyz + u_xlat10_2.xyz;
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump vec2 u_xlat16_0;
					vec2 u_xlat1;
					mediump vec3 u_xlat16_1;
					lowp vec3 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec3 u_xlat10_2;
					mediump vec2 u_xlat16_3;
					float u_xlat5;
					mediump float u_xlat16_5;
					bool u_xlatb5;
					float u_xlat9;
					mediump float u_xlat16_9;
					bool u_xlatb9;
					float u_xlat13;
					mediump float u_xlat16_13;
					bool u_xlatb13;
					float u_xlat14;
					void main()
					{
					    u_xlat16_0.xy = vs_TEXCOORD0.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat16_1.x = max(abs(u_xlat16_0.y), abs(u_xlat16_0.x));
					    u_xlat16_1.x = float(1.0) / u_xlat16_1.x;
					    u_xlat16_5 = min(abs(u_xlat16_0.y), abs(u_xlat16_0.x));
					    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_5;
					    u_xlat16_5 = u_xlat16_1.x * u_xlat16_1.x;
					    u_xlat16_9 = u_xlat16_5 * 0.0208350997 + -0.0851330012;
					    u_xlat16_9 = u_xlat16_5 * u_xlat16_9 + 0.180141002;
					    u_xlat16_9 = u_xlat16_5 * u_xlat16_9 + -0.330299497;
					    u_xlat16_5 = u_xlat16_5 * u_xlat16_9 + 0.999866009;
					    u_xlat16_9 = u_xlat16_5 * u_xlat16_1.x;
					    u_xlat9 = u_xlat16_9 * -2.0 + 1.57079637;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb13 = !!(abs(u_xlat16_0.y)<abs(u_xlat16_0.x));
					#else
					    u_xlatb13 = abs(u_xlat16_0.y)<abs(u_xlat16_0.x);
					#endif
					    u_xlat9 = u_xlatb13 ? u_xlat9 : float(0.0);
					    u_xlat1.x = u_xlat16_1.x * u_xlat16_5 + u_xlat9;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb5 = !!(u_xlat16_0.y<(-u_xlat16_0.y));
					#else
					    u_xlatb5 = u_xlat16_0.y<(-u_xlat16_0.y);
					#endif
					    u_xlat5 = u_xlatb5 ? -3.14159274 : float(0.0);
					    u_xlat1.x = u_xlat5 + u_xlat1.x;
					    u_xlat5 = min(u_xlat16_0.y, u_xlat16_0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb5 = !!(u_xlat5<(-u_xlat5));
					#else
					    u_xlatb5 = u_xlat5<(-u_xlat5);
					#endif
					    u_xlat9 = max(u_xlat16_0.y, u_xlat16_0.x);
					    u_xlat16_13 = dot(u_xlat16_0.xy, u_xlat16_0.xy);
					    u_xlat16_13 = sqrt(u_xlat16_13);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb9 = !!(u_xlat9>=(-u_xlat9));
					#else
					    u_xlatb9 = u_xlat9>=(-u_xlat9);
					#endif
					    u_xlatb5 = u_xlatb9 && u_xlatb5;
					    u_xlat1.x = (u_xlatb5) ? (-u_xlat1.x) : u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * 0.318309158;
					    u_xlat5 = u_xlat1.x / _Value3;
					    u_xlat5 = floor(u_xlat5);
					    u_xlat1.y = (-_Value3) * u_xlat5 + u_xlat1.x;
					    u_xlat16_9 = 0.100000001 / u_xlat16_13;
					    u_xlat16_13 = u_xlat16_13 + u_xlat16_13;
					    u_xlat16_13 = min(u_xlat16_13, 1.0);
					    u_xlat1.x = (-u_xlat16_9) + 0.800000012;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat16_2 = u_xlat16_13 * -2.0 + 3.0;
					    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
					    u_xlat16_13 = u_xlat16_13 * u_xlat16_2;
					    u_xlat10_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_1.xyz = u_xlat10_1.xyz * vec3(u_xlat16_13) + (-u_xlat10_2.xyz);
					    u_xlat16_3.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
					    u_xlat16_13 = dot(u_xlat16_3.xy, u_xlat16_3.xy);
					    u_xlat16_13 = sqrt(u_xlat16_13);
					    u_xlat13 = u_xlat16_13 + (-_Value);
					    u_xlat14 = _Value + -0.0500000007;
					    u_xlat14 = u_xlat14 + (-_Value2);
					    u_xlat14 = u_xlat14 + (-_Value);
					    u_xlat14 = float(1.0) / u_xlat14;
					    u_xlat13 = u_xlat13 * u_xlat14;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat13 = min(max(u_xlat13, 0.0), 1.0);
					#else
					    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
					#endif
					    u_xlat14 = u_xlat13 * -2.0 + 3.0;
					    u_xlat13 = u_xlat13 * u_xlat13;
					    u_xlat13 = (-u_xlat14) * u_xlat13 + 1.0;
					    SV_Target0.xyz = vec3(u_xlat13) * u_xlat16_1.xyz + u_xlat10_2.xyz;
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump vec2 u_xlat16_0;
					vec2 u_xlat1;
					mediump vec3 u_xlat16_1;
					lowp vec3 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec3 u_xlat10_2;
					mediump vec2 u_xlat16_3;
					float u_xlat5;
					mediump float u_xlat16_5;
					bool u_xlatb5;
					float u_xlat9;
					mediump float u_xlat16_9;
					bool u_xlatb9;
					float u_xlat13;
					mediump float u_xlat16_13;
					bool u_xlatb13;
					float u_xlat14;
					void main()
					{
					    u_xlat16_0.xy = vs_TEXCOORD0.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat16_1.x = max(abs(u_xlat16_0.y), abs(u_xlat16_0.x));
					    u_xlat16_1.x = float(1.0) / u_xlat16_1.x;
					    u_xlat16_5 = min(abs(u_xlat16_0.y), abs(u_xlat16_0.x));
					    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_5;
					    u_xlat16_5 = u_xlat16_1.x * u_xlat16_1.x;
					    u_xlat16_9 = u_xlat16_5 * 0.0208350997 + -0.0851330012;
					    u_xlat16_9 = u_xlat16_5 * u_xlat16_9 + 0.180141002;
					    u_xlat16_9 = u_xlat16_5 * u_xlat16_9 + -0.330299497;
					    u_xlat16_5 = u_xlat16_5 * u_xlat16_9 + 0.999866009;
					    u_xlat16_9 = u_xlat16_5 * u_xlat16_1.x;
					    u_xlat9 = u_xlat16_9 * -2.0 + 1.57079637;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb13 = !!(abs(u_xlat16_0.y)<abs(u_xlat16_0.x));
					#else
					    u_xlatb13 = abs(u_xlat16_0.y)<abs(u_xlat16_0.x);
					#endif
					    u_xlat9 = u_xlatb13 ? u_xlat9 : float(0.0);
					    u_xlat1.x = u_xlat16_1.x * u_xlat16_5 + u_xlat9;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb5 = !!(u_xlat16_0.y<(-u_xlat16_0.y));
					#else
					    u_xlatb5 = u_xlat16_0.y<(-u_xlat16_0.y);
					#endif
					    u_xlat5 = u_xlatb5 ? -3.14159274 : float(0.0);
					    u_xlat1.x = u_xlat5 + u_xlat1.x;
					    u_xlat5 = min(u_xlat16_0.y, u_xlat16_0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb5 = !!(u_xlat5<(-u_xlat5));
					#else
					    u_xlatb5 = u_xlat5<(-u_xlat5);
					#endif
					    u_xlat9 = max(u_xlat16_0.y, u_xlat16_0.x);
					    u_xlat16_13 = dot(u_xlat16_0.xy, u_xlat16_0.xy);
					    u_xlat16_13 = sqrt(u_xlat16_13);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb9 = !!(u_xlat9>=(-u_xlat9));
					#else
					    u_xlatb9 = u_xlat9>=(-u_xlat9);
					#endif
					    u_xlatb5 = u_xlatb9 && u_xlatb5;
					    u_xlat1.x = (u_xlatb5) ? (-u_xlat1.x) : u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * 0.318309158;
					    u_xlat5 = u_xlat1.x / _Value3;
					    u_xlat5 = floor(u_xlat5);
					    u_xlat1.y = (-_Value3) * u_xlat5 + u_xlat1.x;
					    u_xlat16_9 = 0.100000001 / u_xlat16_13;
					    u_xlat16_13 = u_xlat16_13 + u_xlat16_13;
					    u_xlat16_13 = min(u_xlat16_13, 1.0);
					    u_xlat1.x = (-u_xlat16_9) + 0.800000012;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat16_2 = u_xlat16_13 * -2.0 + 3.0;
					    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
					    u_xlat16_13 = u_xlat16_13 * u_xlat16_2;
					    u_xlat10_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_1.xyz = u_xlat10_1.xyz * vec3(u_xlat16_13) + (-u_xlat10_2.xyz);
					    u_xlat16_3.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
					    u_xlat16_13 = dot(u_xlat16_3.xy, u_xlat16_3.xy);
					    u_xlat16_13 = sqrt(u_xlat16_13);
					    u_xlat13 = u_xlat16_13 + (-_Value);
					    u_xlat14 = _Value + -0.0500000007;
					    u_xlat14 = u_xlat14 + (-_Value2);
					    u_xlat14 = u_xlat14 + (-_Value);
					    u_xlat14 = float(1.0) / u_xlat14;
					    u_xlat13 = u_xlat13 * u_xlat14;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat13 = min(max(u_xlat13, 0.0), 1.0);
					#else
					    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
					#endif
					    u_xlat14 = u_xlat13 * -2.0 + 3.0;
					    u_xlat13 = u_xlat13 * u_xlat13;
					    u_xlat13 = (-u_xlat14) * u_xlat13 + 1.0;
					    SV_Target0.xyz = vec3(u_xlat13) * u_xlat16_1.xyz + u_xlat10_2.xyz;
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