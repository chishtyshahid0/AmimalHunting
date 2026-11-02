Shader "CameraFilterPack/Distortion_FishEye" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.87
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 43461
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec2 uv_1;
					  highp float bind_2;
					  highp vec2 p_3;
					  p_3 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_4;
					  tmpvar_4 = (p_3 - vec2(0.5, 0.5));
					  highp float tmpvar_5;
					  tmpvar_5 = sqrt(dot (tmpvar_4, tmpvar_4));
					  highp float tmpvar_6;
					  tmpvar_6 = (4.442894 * (_Distortion - 0.5));
					  bind_2 = 0.5;
					  if ((tmpvar_6 > 0.0)) {
					    bind_2 = 0.7071068;
					  };
					  if ((tmpvar_6 > 0.0)) {
					    highp float theta_7;
					    theta_7 = (tmpvar_5 * tmpvar_6);
					    highp float theta_8;
					    theta_8 = (bind_2 * tmpvar_6);
					    uv_1 = (vec2(0.5, 0.5) + ((
					      (normalize(tmpvar_4) * (sin(theta_7) / cos(theta_7)))
					     * bind_2) / (
					      sin(theta_8)
					     / 
					      cos(theta_8)
					    )));
					  } else {
					    if ((tmpvar_6 < 0.0)) {
					      highp float y_over_x_9;
					      y_over_x_9 = ((tmpvar_5 * -(tmpvar_6)) * 10.0);
					      highp float tmpvar_10;
					      tmpvar_10 = (min (abs(y_over_x_9), 1.0) / max (abs(y_over_x_9), 1.0));
					      highp float tmpvar_11;
					      tmpvar_11 = (tmpvar_10 * tmpvar_10);
					      tmpvar_11 = (((
					        ((((
					          ((((-0.01213232 * tmpvar_11) + 0.05368138) * tmpvar_11) - 0.1173503)
					         * tmpvar_11) + 0.1938925) * tmpvar_11) - 0.3326756)
					       * tmpvar_11) + 0.9999793) * tmpvar_10);
					      tmpvar_11 = (tmpvar_11 + (float(
					        (abs(y_over_x_9) > 1.0)
					      ) * (
					        (tmpvar_11 * -2.0)
					       + 1.570796)));
					      highp float y_over_x_12;
					      y_over_x_12 = ((-(tmpvar_6) * bind_2) * 10.0);
					      highp float tmpvar_13;
					      tmpvar_13 = (min (abs(y_over_x_12), 1.0) / max (abs(y_over_x_12), 1.0));
					      highp float tmpvar_14;
					      tmpvar_14 = (tmpvar_13 * tmpvar_13);
					      tmpvar_14 = (((
					        ((((
					          ((((-0.01213232 * tmpvar_14) + 0.05368138) * tmpvar_14) - 0.1173503)
					         * tmpvar_14) + 0.1938925) * tmpvar_14) - 0.3326756)
					       * tmpvar_14) + 0.9999793) * tmpvar_13);
					      tmpvar_14 = (tmpvar_14 + (float(
					        (abs(y_over_x_12) > 1.0)
					      ) * (
					        (tmpvar_14 * -2.0)
					       + 1.570796)));
					      uv_1 = (vec2(0.5, 0.5) + ((
					        (normalize(tmpvar_4) * (tmpvar_11 * sign(y_over_x_9)))
					       * bind_2) / (tmpvar_14 * 
					        sign(y_over_x_12)
					      )));
					    } else {
					      uv_1 = p_3;
					    };
					  };
					  lowp vec4 tmpvar_15;
					  tmpvar_15.w = 1.0;
					  tmpvar_15.xyz = texture2D (_MainTex, uv_1).xyz;
					  gl_FragData[0] = tmpvar_15;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec2 uv_1;
					  highp float bind_2;
					  highp vec2 p_3;
					  p_3 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_4;
					  tmpvar_4 = (p_3 - vec2(0.5, 0.5));
					  highp float tmpvar_5;
					  tmpvar_5 = sqrt(dot (tmpvar_4, tmpvar_4));
					  highp float tmpvar_6;
					  tmpvar_6 = (4.442894 * (_Distortion - 0.5));
					  bind_2 = 0.5;
					  if ((tmpvar_6 > 0.0)) {
					    bind_2 = 0.7071068;
					  };
					  if ((tmpvar_6 > 0.0)) {
					    highp float theta_7;
					    theta_7 = (tmpvar_5 * tmpvar_6);
					    highp float theta_8;
					    theta_8 = (bind_2 * tmpvar_6);
					    uv_1 = (vec2(0.5, 0.5) + ((
					      (normalize(tmpvar_4) * (sin(theta_7) / cos(theta_7)))
					     * bind_2) / (
					      sin(theta_8)
					     / 
					      cos(theta_8)
					    )));
					  } else {
					    if ((tmpvar_6 < 0.0)) {
					      highp float y_over_x_9;
					      y_over_x_9 = ((tmpvar_5 * -(tmpvar_6)) * 10.0);
					      highp float tmpvar_10;
					      tmpvar_10 = (min (abs(y_over_x_9), 1.0) / max (abs(y_over_x_9), 1.0));
					      highp float tmpvar_11;
					      tmpvar_11 = (tmpvar_10 * tmpvar_10);
					      tmpvar_11 = (((
					        ((((
					          ((((-0.01213232 * tmpvar_11) + 0.05368138) * tmpvar_11) - 0.1173503)
					         * tmpvar_11) + 0.1938925) * tmpvar_11) - 0.3326756)
					       * tmpvar_11) + 0.9999793) * tmpvar_10);
					      tmpvar_11 = (tmpvar_11 + (float(
					        (abs(y_over_x_9) > 1.0)
					      ) * (
					        (tmpvar_11 * -2.0)
					       + 1.570796)));
					      highp float y_over_x_12;
					      y_over_x_12 = ((-(tmpvar_6) * bind_2) * 10.0);
					      highp float tmpvar_13;
					      tmpvar_13 = (min (abs(y_over_x_12), 1.0) / max (abs(y_over_x_12), 1.0));
					      highp float tmpvar_14;
					      tmpvar_14 = (tmpvar_13 * tmpvar_13);
					      tmpvar_14 = (((
					        ((((
					          ((((-0.01213232 * tmpvar_14) + 0.05368138) * tmpvar_14) - 0.1173503)
					         * tmpvar_14) + 0.1938925) * tmpvar_14) - 0.3326756)
					       * tmpvar_14) + 0.9999793) * tmpvar_13);
					      tmpvar_14 = (tmpvar_14 + (float(
					        (abs(y_over_x_12) > 1.0)
					      ) * (
					        (tmpvar_14 * -2.0)
					       + 1.570796)));
					      uv_1 = (vec2(0.5, 0.5) + ((
					        (normalize(tmpvar_4) * (tmpvar_11 * sign(y_over_x_9)))
					       * bind_2) / (tmpvar_14 * 
					        sign(y_over_x_12)
					      )));
					    } else {
					      uv_1 = p_3;
					    };
					  };
					  lowp vec4 tmpvar_15;
					  tmpvar_15.w = 1.0;
					  tmpvar_15.xyz = texture2D (_MainTex, uv_1).xyz;
					  gl_FragData[0] = tmpvar_15;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec2 uv_1;
					  highp float bind_2;
					  highp vec2 p_3;
					  p_3 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_4;
					  tmpvar_4 = (p_3 - vec2(0.5, 0.5));
					  highp float tmpvar_5;
					  tmpvar_5 = sqrt(dot (tmpvar_4, tmpvar_4));
					  highp float tmpvar_6;
					  tmpvar_6 = (4.442894 * (_Distortion - 0.5));
					  bind_2 = 0.5;
					  if ((tmpvar_6 > 0.0)) {
					    bind_2 = 0.7071068;
					  };
					  if ((tmpvar_6 > 0.0)) {
					    highp float theta_7;
					    theta_7 = (tmpvar_5 * tmpvar_6);
					    highp float theta_8;
					    theta_8 = (bind_2 * tmpvar_6);
					    uv_1 = (vec2(0.5, 0.5) + ((
					      (normalize(tmpvar_4) * (sin(theta_7) / cos(theta_7)))
					     * bind_2) / (
					      sin(theta_8)
					     / 
					      cos(theta_8)
					    )));
					  } else {
					    if ((tmpvar_6 < 0.0)) {
					      highp float y_over_x_9;
					      y_over_x_9 = ((tmpvar_5 * -(tmpvar_6)) * 10.0);
					      highp float tmpvar_10;
					      tmpvar_10 = (min (abs(y_over_x_9), 1.0) / max (abs(y_over_x_9), 1.0));
					      highp float tmpvar_11;
					      tmpvar_11 = (tmpvar_10 * tmpvar_10);
					      tmpvar_11 = (((
					        ((((
					          ((((-0.01213232 * tmpvar_11) + 0.05368138) * tmpvar_11) - 0.1173503)
					         * tmpvar_11) + 0.1938925) * tmpvar_11) - 0.3326756)
					       * tmpvar_11) + 0.9999793) * tmpvar_10);
					      tmpvar_11 = (tmpvar_11 + (float(
					        (abs(y_over_x_9) > 1.0)
					      ) * (
					        (tmpvar_11 * -2.0)
					       + 1.570796)));
					      highp float y_over_x_12;
					      y_over_x_12 = ((-(tmpvar_6) * bind_2) * 10.0);
					      highp float tmpvar_13;
					      tmpvar_13 = (min (abs(y_over_x_12), 1.0) / max (abs(y_over_x_12), 1.0));
					      highp float tmpvar_14;
					      tmpvar_14 = (tmpvar_13 * tmpvar_13);
					      tmpvar_14 = (((
					        ((((
					          ((((-0.01213232 * tmpvar_14) + 0.05368138) * tmpvar_14) - 0.1173503)
					         * tmpvar_14) + 0.1938925) * tmpvar_14) - 0.3326756)
					       * tmpvar_14) + 0.9999793) * tmpvar_13);
					      tmpvar_14 = (tmpvar_14 + (float(
					        (abs(y_over_x_12) > 1.0)
					      ) * (
					        (tmpvar_14 * -2.0)
					       + 1.570796)));
					      uv_1 = (vec2(0.5, 0.5) + ((
					        (normalize(tmpvar_4) * (tmpvar_11 * sign(y_over_x_9)))
					       * bind_2) / (tmpvar_14 * 
					        sign(y_over_x_12)
					      )));
					    } else {
					      uv_1 = p_3;
					    };
					  };
					  lowp vec4 tmpvar_15;
					  tmpvar_15.w = 1.0;
					  tmpvar_15.xyz = texture2D (_MainTex, uv_1).xyz;
					  gl_FragData[0] = tmpvar_15;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec2 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					float u_xlat1;
					bool u_xlatb1;
					vec2 u_xlat2;
					mediump vec2 u_xlat16_2;
					float u_xlat3;
					float u_xlat4;
					float u_xlat6;
					float u_xlat10;
					mediump float u_xlat16_10;
					bool u_xlatb10;
					float u_xlat11;
					mediump float u_xlat16_11;
					bool u_xlatb11;
					bool u_xlatb12;
					float u_xlat15;
					mediump float u_xlat16_15;
					float u_xlat16;
					void main()
					{
					    u_xlat16_0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_10 = dot(u_xlat16_0.xy, u_xlat16_0.xy);
					    u_xlat16_15 = sqrt(u_xlat16_10);
					    u_xlat1 = _Distortion + -0.5;
					    u_xlat6 = u_xlat1 * 4.44289351;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb11 = !!(0.0<u_xlat1);
					#else
					    u_xlatb11 = 0.0<u_xlat1;
					#endif
					    u_xlat16 = (u_xlatb11) ? 0.707106769 : 0.5;
					    if(u_xlatb11){
					        u_xlat16_11 = inversesqrt(u_xlat16_10);
					        u_xlat16_2.xy = u_xlat16_0.xy * vec2(u_xlat16_11);
					        u_xlat11 = u_xlat16_15 * u_xlat6;
					        u_xlat3 = sin(u_xlat11);
					        u_xlat4 = cos(u_xlat11);
					        u_xlat11 = u_xlat3 / u_xlat4;
					        u_xlat2.xy = vec2(u_xlat11) * u_xlat16_2.xy;
					        u_xlat2.xy = vec2(u_xlat16) * u_xlat2.xy;
					        u_xlat11 = u_xlat6 * u_xlat16;
					        u_xlat3 = sin(u_xlat11);
					        u_xlat4 = cos(u_xlat11);
					        u_xlat11 = u_xlat3 / u_xlat4;
					        u_xlat2.xy = u_xlat2.xy / vec2(u_xlat11);
					        u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    } else {
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb1 = !!(u_xlat1<0.0);
					#else
					        u_xlatb1 = u_xlat1<0.0;
					#endif
					        if(u_xlatb1){
					            u_xlat16_10 = inversesqrt(u_xlat16_10);
					            u_xlat16_0.xy = vec2(u_xlat16_10) * u_xlat16_0.xy;
					            u_xlat10 = u_xlat16_15 * (-u_xlat6);
					            u_xlat10 = u_xlat10 * 10.0;
					            u_xlat15 = min(abs(u_xlat10), 1.0);
					            u_xlat1 = max(abs(u_xlat10), 1.0);
					            u_xlat1 = float(1.0) / u_xlat1;
					            u_xlat15 = u_xlat15 * u_xlat1;
					            u_xlat1 = u_xlat15 * u_xlat15;
					            u_xlat11 = u_xlat1 * 0.0208350997 + -0.0851330012;
					            u_xlat11 = u_xlat1 * u_xlat11 + 0.180141002;
					            u_xlat11 = u_xlat1 * u_xlat11 + -0.330299497;
					            u_xlat1 = u_xlat1 * u_xlat11 + 0.999866009;
					            u_xlat11 = u_xlat15 * u_xlat1;
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb12 = !!(1.0<abs(u_xlat10));
					#else
					            u_xlatb12 = 1.0<abs(u_xlat10);
					#endif
					            u_xlat11 = u_xlat11 * -2.0 + 1.57079637;
					            u_xlat11 = u_xlatb12 ? u_xlat11 : float(0.0);
					            u_xlat15 = u_xlat15 * u_xlat1 + u_xlat11;
					            u_xlat10 = min(u_xlat10, 1.0);
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb10 = !!(u_xlat10<(-u_xlat10));
					#else
					            u_xlatb10 = u_xlat10<(-u_xlat10);
					#endif
					            u_xlat10 = (u_xlatb10) ? (-u_xlat15) : u_xlat15;
					            u_xlat0.xy = vec2(u_xlat10) * u_xlat16_0.xy;
					            u_xlat0.xy = vec2(u_xlat16) * u_xlat0.xy;
					            u_xlat10 = u_xlat16 * (-u_xlat6);
					            u_xlat10 = u_xlat10 * 10.0;
					            u_xlat15 = min(abs(u_xlat10), 1.0);
					            u_xlat1 = max(abs(u_xlat10), 1.0);
					            u_xlat1 = float(1.0) / u_xlat1;
					            u_xlat15 = u_xlat15 * u_xlat1;
					            u_xlat1 = u_xlat15 * u_xlat15;
					            u_xlat6 = u_xlat1 * 0.0208350997 + -0.0851330012;
					            u_xlat6 = u_xlat1 * u_xlat6 + 0.180141002;
					            u_xlat6 = u_xlat1 * u_xlat6 + -0.330299497;
					            u_xlat1 = u_xlat1 * u_xlat6 + 0.999866009;
					            u_xlat6 = u_xlat15 * u_xlat1;
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb11 = !!(1.0<abs(u_xlat10));
					#else
					            u_xlatb11 = 1.0<abs(u_xlat10);
					#endif
					            u_xlat6 = u_xlat6 * -2.0 + 1.57079637;
					            u_xlat6 = u_xlatb11 ? u_xlat6 : float(0.0);
					            u_xlat15 = u_xlat15 * u_xlat1 + u_xlat6;
					            u_xlat10 = min(u_xlat10, 1.0);
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb10 = !!(u_xlat10<(-u_xlat10));
					#else
					            u_xlatb10 = u_xlat10<(-u_xlat10);
					#endif
					            u_xlat10 = (u_xlatb10) ? (-u_xlat15) : u_xlat15;
					            u_xlat0.xy = u_xlat0.xy / vec2(u_xlat10);
					            u_xlat2.xy = u_xlat0.xy + vec2(0.5, 0.5);
					        } else {
					            u_xlat2.xy = vs_TEXCOORD0.xy;
					        //ENDIF
					        }
					    //ENDIF
					    }
					    u_xlat10_0.xyz = texture(_MainTex, u_xlat2.xy).xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec2 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					float u_xlat1;
					bool u_xlatb1;
					vec2 u_xlat2;
					mediump vec2 u_xlat16_2;
					float u_xlat3;
					float u_xlat4;
					float u_xlat6;
					float u_xlat10;
					mediump float u_xlat16_10;
					bool u_xlatb10;
					float u_xlat11;
					mediump float u_xlat16_11;
					bool u_xlatb11;
					bool u_xlatb12;
					float u_xlat15;
					mediump float u_xlat16_15;
					float u_xlat16;
					void main()
					{
					    u_xlat16_0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_10 = dot(u_xlat16_0.xy, u_xlat16_0.xy);
					    u_xlat16_15 = sqrt(u_xlat16_10);
					    u_xlat1 = _Distortion + -0.5;
					    u_xlat6 = u_xlat1 * 4.44289351;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb11 = !!(0.0<u_xlat1);
					#else
					    u_xlatb11 = 0.0<u_xlat1;
					#endif
					    u_xlat16 = (u_xlatb11) ? 0.707106769 : 0.5;
					    if(u_xlatb11){
					        u_xlat16_11 = inversesqrt(u_xlat16_10);
					        u_xlat16_2.xy = u_xlat16_0.xy * vec2(u_xlat16_11);
					        u_xlat11 = u_xlat16_15 * u_xlat6;
					        u_xlat3 = sin(u_xlat11);
					        u_xlat4 = cos(u_xlat11);
					        u_xlat11 = u_xlat3 / u_xlat4;
					        u_xlat2.xy = vec2(u_xlat11) * u_xlat16_2.xy;
					        u_xlat2.xy = vec2(u_xlat16) * u_xlat2.xy;
					        u_xlat11 = u_xlat6 * u_xlat16;
					        u_xlat3 = sin(u_xlat11);
					        u_xlat4 = cos(u_xlat11);
					        u_xlat11 = u_xlat3 / u_xlat4;
					        u_xlat2.xy = u_xlat2.xy / vec2(u_xlat11);
					        u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    } else {
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb1 = !!(u_xlat1<0.0);
					#else
					        u_xlatb1 = u_xlat1<0.0;
					#endif
					        if(u_xlatb1){
					            u_xlat16_10 = inversesqrt(u_xlat16_10);
					            u_xlat16_0.xy = vec2(u_xlat16_10) * u_xlat16_0.xy;
					            u_xlat10 = u_xlat16_15 * (-u_xlat6);
					            u_xlat10 = u_xlat10 * 10.0;
					            u_xlat15 = min(abs(u_xlat10), 1.0);
					            u_xlat1 = max(abs(u_xlat10), 1.0);
					            u_xlat1 = float(1.0) / u_xlat1;
					            u_xlat15 = u_xlat15 * u_xlat1;
					            u_xlat1 = u_xlat15 * u_xlat15;
					            u_xlat11 = u_xlat1 * 0.0208350997 + -0.0851330012;
					            u_xlat11 = u_xlat1 * u_xlat11 + 0.180141002;
					            u_xlat11 = u_xlat1 * u_xlat11 + -0.330299497;
					            u_xlat1 = u_xlat1 * u_xlat11 + 0.999866009;
					            u_xlat11 = u_xlat15 * u_xlat1;
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb12 = !!(1.0<abs(u_xlat10));
					#else
					            u_xlatb12 = 1.0<abs(u_xlat10);
					#endif
					            u_xlat11 = u_xlat11 * -2.0 + 1.57079637;
					            u_xlat11 = u_xlatb12 ? u_xlat11 : float(0.0);
					            u_xlat15 = u_xlat15 * u_xlat1 + u_xlat11;
					            u_xlat10 = min(u_xlat10, 1.0);
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb10 = !!(u_xlat10<(-u_xlat10));
					#else
					            u_xlatb10 = u_xlat10<(-u_xlat10);
					#endif
					            u_xlat10 = (u_xlatb10) ? (-u_xlat15) : u_xlat15;
					            u_xlat0.xy = vec2(u_xlat10) * u_xlat16_0.xy;
					            u_xlat0.xy = vec2(u_xlat16) * u_xlat0.xy;
					            u_xlat10 = u_xlat16 * (-u_xlat6);
					            u_xlat10 = u_xlat10 * 10.0;
					            u_xlat15 = min(abs(u_xlat10), 1.0);
					            u_xlat1 = max(abs(u_xlat10), 1.0);
					            u_xlat1 = float(1.0) / u_xlat1;
					            u_xlat15 = u_xlat15 * u_xlat1;
					            u_xlat1 = u_xlat15 * u_xlat15;
					            u_xlat6 = u_xlat1 * 0.0208350997 + -0.0851330012;
					            u_xlat6 = u_xlat1 * u_xlat6 + 0.180141002;
					            u_xlat6 = u_xlat1 * u_xlat6 + -0.330299497;
					            u_xlat1 = u_xlat1 * u_xlat6 + 0.999866009;
					            u_xlat6 = u_xlat15 * u_xlat1;
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb11 = !!(1.0<abs(u_xlat10));
					#else
					            u_xlatb11 = 1.0<abs(u_xlat10);
					#endif
					            u_xlat6 = u_xlat6 * -2.0 + 1.57079637;
					            u_xlat6 = u_xlatb11 ? u_xlat6 : float(0.0);
					            u_xlat15 = u_xlat15 * u_xlat1 + u_xlat6;
					            u_xlat10 = min(u_xlat10, 1.0);
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb10 = !!(u_xlat10<(-u_xlat10));
					#else
					            u_xlatb10 = u_xlat10<(-u_xlat10);
					#endif
					            u_xlat10 = (u_xlatb10) ? (-u_xlat15) : u_xlat15;
					            u_xlat0.xy = u_xlat0.xy / vec2(u_xlat10);
					            u_xlat2.xy = u_xlat0.xy + vec2(0.5, 0.5);
					        } else {
					            u_xlat2.xy = vs_TEXCOORD0.xy;
					        //ENDIF
					        }
					    //ENDIF
					    }
					    u_xlat10_0.xyz = texture(_MainTex, u_xlat2.xy).xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec2 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					float u_xlat1;
					bool u_xlatb1;
					vec2 u_xlat2;
					mediump vec2 u_xlat16_2;
					float u_xlat3;
					float u_xlat4;
					float u_xlat6;
					float u_xlat10;
					mediump float u_xlat16_10;
					bool u_xlatb10;
					float u_xlat11;
					mediump float u_xlat16_11;
					bool u_xlatb11;
					bool u_xlatb12;
					float u_xlat15;
					mediump float u_xlat16_15;
					float u_xlat16;
					void main()
					{
					    u_xlat16_0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_10 = dot(u_xlat16_0.xy, u_xlat16_0.xy);
					    u_xlat16_15 = sqrt(u_xlat16_10);
					    u_xlat1 = _Distortion + -0.5;
					    u_xlat6 = u_xlat1 * 4.44289351;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb11 = !!(0.0<u_xlat1);
					#else
					    u_xlatb11 = 0.0<u_xlat1;
					#endif
					    u_xlat16 = (u_xlatb11) ? 0.707106769 : 0.5;
					    if(u_xlatb11){
					        u_xlat16_11 = inversesqrt(u_xlat16_10);
					        u_xlat16_2.xy = u_xlat16_0.xy * vec2(u_xlat16_11);
					        u_xlat11 = u_xlat16_15 * u_xlat6;
					        u_xlat3 = sin(u_xlat11);
					        u_xlat4 = cos(u_xlat11);
					        u_xlat11 = u_xlat3 / u_xlat4;
					        u_xlat2.xy = vec2(u_xlat11) * u_xlat16_2.xy;
					        u_xlat2.xy = vec2(u_xlat16) * u_xlat2.xy;
					        u_xlat11 = u_xlat6 * u_xlat16;
					        u_xlat3 = sin(u_xlat11);
					        u_xlat4 = cos(u_xlat11);
					        u_xlat11 = u_xlat3 / u_xlat4;
					        u_xlat2.xy = u_xlat2.xy / vec2(u_xlat11);
					        u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    } else {
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb1 = !!(u_xlat1<0.0);
					#else
					        u_xlatb1 = u_xlat1<0.0;
					#endif
					        if(u_xlatb1){
					            u_xlat16_10 = inversesqrt(u_xlat16_10);
					            u_xlat16_0.xy = vec2(u_xlat16_10) * u_xlat16_0.xy;
					            u_xlat10 = u_xlat16_15 * (-u_xlat6);
					            u_xlat10 = u_xlat10 * 10.0;
					            u_xlat15 = min(abs(u_xlat10), 1.0);
					            u_xlat1 = max(abs(u_xlat10), 1.0);
					            u_xlat1 = float(1.0) / u_xlat1;
					            u_xlat15 = u_xlat15 * u_xlat1;
					            u_xlat1 = u_xlat15 * u_xlat15;
					            u_xlat11 = u_xlat1 * 0.0208350997 + -0.0851330012;
					            u_xlat11 = u_xlat1 * u_xlat11 + 0.180141002;
					            u_xlat11 = u_xlat1 * u_xlat11 + -0.330299497;
					            u_xlat1 = u_xlat1 * u_xlat11 + 0.999866009;
					            u_xlat11 = u_xlat15 * u_xlat1;
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb12 = !!(1.0<abs(u_xlat10));
					#else
					            u_xlatb12 = 1.0<abs(u_xlat10);
					#endif
					            u_xlat11 = u_xlat11 * -2.0 + 1.57079637;
					            u_xlat11 = u_xlatb12 ? u_xlat11 : float(0.0);
					            u_xlat15 = u_xlat15 * u_xlat1 + u_xlat11;
					            u_xlat10 = min(u_xlat10, 1.0);
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb10 = !!(u_xlat10<(-u_xlat10));
					#else
					            u_xlatb10 = u_xlat10<(-u_xlat10);
					#endif
					            u_xlat10 = (u_xlatb10) ? (-u_xlat15) : u_xlat15;
					            u_xlat0.xy = vec2(u_xlat10) * u_xlat16_0.xy;
					            u_xlat0.xy = vec2(u_xlat16) * u_xlat0.xy;
					            u_xlat10 = u_xlat16 * (-u_xlat6);
					            u_xlat10 = u_xlat10 * 10.0;
					            u_xlat15 = min(abs(u_xlat10), 1.0);
					            u_xlat1 = max(abs(u_xlat10), 1.0);
					            u_xlat1 = float(1.0) / u_xlat1;
					            u_xlat15 = u_xlat15 * u_xlat1;
					            u_xlat1 = u_xlat15 * u_xlat15;
					            u_xlat6 = u_xlat1 * 0.0208350997 + -0.0851330012;
					            u_xlat6 = u_xlat1 * u_xlat6 + 0.180141002;
					            u_xlat6 = u_xlat1 * u_xlat6 + -0.330299497;
					            u_xlat1 = u_xlat1 * u_xlat6 + 0.999866009;
					            u_xlat6 = u_xlat15 * u_xlat1;
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb11 = !!(1.0<abs(u_xlat10));
					#else
					            u_xlatb11 = 1.0<abs(u_xlat10);
					#endif
					            u_xlat6 = u_xlat6 * -2.0 + 1.57079637;
					            u_xlat6 = u_xlatb11 ? u_xlat6 : float(0.0);
					            u_xlat15 = u_xlat15 * u_xlat1 + u_xlat6;
					            u_xlat10 = min(u_xlat10, 1.0);
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb10 = !!(u_xlat10<(-u_xlat10));
					#else
					            u_xlatb10 = u_xlat10<(-u_xlat10);
					#endif
					            u_xlat10 = (u_xlatb10) ? (-u_xlat15) : u_xlat15;
					            u_xlat0.xy = u_xlat0.xy / vec2(u_xlat10);
					            u_xlat2.xy = u_xlat0.xy + vec2(0.5, 0.5);
					        } else {
					            u_xlat2.xy = vs_TEXCOORD0.xy;
					        //ENDIF
					        }
					    //ENDIF
					    }
					    u_xlat10_0.xyz = texture(_MainTex, u_xlat2.xy).xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz;
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