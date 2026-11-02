Shader "CameraFilterPack/Blur_Bloom" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_Amount ("_Amount", Range(0, 20)) = 5
		_Glow ("_Glow", Range(0, 20)) = 5
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 25635
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
					uniform highp vec4 _ScreenResolution;
					uniform highp float _Amount;
					uniform highp float _Glow;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 result_1;
					  highp float stepV_2;
					  highp float stepU_3;
					  stepU_3 = ((1.0/(_ScreenResolution.x)) * _Amount);
					  stepV_2 = ((1.0/(_ScreenResolution.y)) * _Amount);
					  lowp vec3 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = -(stepU_3);
					  tmpvar_5.y = -(stepV_2);
					  highp vec2 tmpvar_6;
					  tmpvar_6 = (xlv_TEXCOORD0 + tmpvar_5);
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = texture2D (_MainTex, tmpvar_6);
					  result_1 = tmpvar_7;
					  highp vec2 tmpvar_8;
					  tmpvar_8.x = -(stepU_3);
					  tmpvar_8.y = 0.0;
					  highp vec2 tmpvar_9;
					  tmpvar_9 = (xlv_TEXCOORD0 + tmpvar_8);
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, tmpvar_9);
					  result_1 = (result_1 + (2.0 * tmpvar_10));
					  highp vec2 tmpvar_11;
					  tmpvar_11.x = -(stepU_3);
					  tmpvar_11.y = stepV_2;
					  highp vec2 tmpvar_12;
					  tmpvar_12 = (xlv_TEXCOORD0 + tmpvar_11);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_MainTex, tmpvar_12);
					  result_1 = (result_1 + tmpvar_13);
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = 0.0;
					  tmpvar_14.y = -(stepV_2);
					  highp vec2 tmpvar_15;
					  tmpvar_15 = (xlv_TEXCOORD0 + tmpvar_14);
					  lowp vec4 tmpvar_16;
					  tmpvar_16 = texture2D (_MainTex, tmpvar_15);
					  result_1 = (result_1 + (2.0 * tmpvar_16));
					  highp vec2 tmpvar_17;
					  tmpvar_17 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_18;
					  tmpvar_18 = texture2D (_MainTex, tmpvar_17);
					  result_1 = (result_1 + (4.0 * tmpvar_18));
					  highp vec2 tmpvar_19;
					  tmpvar_19.x = 0.0;
					  tmpvar_19.y = stepV_2;
					  highp vec2 tmpvar_20;
					  tmpvar_20 = (xlv_TEXCOORD0 + tmpvar_19);
					  lowp vec4 tmpvar_21;
					  tmpvar_21 = texture2D (_MainTex, tmpvar_20);
					  result_1 = (result_1 + (2.0 * tmpvar_21));
					  highp vec2 tmpvar_22;
					  tmpvar_22.x = stepU_3;
					  tmpvar_22.y = -(stepV_2);
					  highp vec2 tmpvar_23;
					  tmpvar_23 = (xlv_TEXCOORD0 + tmpvar_22);
					  lowp vec4 tmpvar_24;
					  tmpvar_24 = texture2D (_MainTex, tmpvar_23);
					  result_1 = (result_1 + tmpvar_24);
					  highp vec2 tmpvar_25;
					  tmpvar_25.x = stepU_3;
					  tmpvar_25.y = 0.0;
					  highp vec2 tmpvar_26;
					  tmpvar_26 = (xlv_TEXCOORD0 + tmpvar_25);
					  lowp vec4 tmpvar_27;
					  tmpvar_27 = texture2D (_MainTex, tmpvar_26);
					  result_1 = (result_1 + (2.0 * tmpvar_27));
					  highp vec2 tmpvar_28;
					  tmpvar_28.x = stepU_3;
					  tmpvar_28.y = stepV_2;
					  highp vec2 tmpvar_29;
					  tmpvar_29 = (xlv_TEXCOORD0 + tmpvar_28);
					  lowp vec4 tmpvar_30;
					  tmpvar_30 = texture2D (_MainTex, tmpvar_29);
					  result_1 = (result_1 + tmpvar_30);
					  result_1 = (result_1 / 8.0);
					  result_1.xyz = mix (tmpvar_4, result_1.xyz, vec3(_Glow));
					  gl_FragData[0] = result_1;
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
					uniform highp vec4 _ScreenResolution;
					uniform highp float _Amount;
					uniform highp float _Glow;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 result_1;
					  highp float stepV_2;
					  highp float stepU_3;
					  stepU_3 = ((1.0/(_ScreenResolution.x)) * _Amount);
					  stepV_2 = ((1.0/(_ScreenResolution.y)) * _Amount);
					  lowp vec3 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = -(stepU_3);
					  tmpvar_5.y = -(stepV_2);
					  highp vec2 tmpvar_6;
					  tmpvar_6 = (xlv_TEXCOORD0 + tmpvar_5);
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = texture2D (_MainTex, tmpvar_6);
					  result_1 = tmpvar_7;
					  highp vec2 tmpvar_8;
					  tmpvar_8.x = -(stepU_3);
					  tmpvar_8.y = 0.0;
					  highp vec2 tmpvar_9;
					  tmpvar_9 = (xlv_TEXCOORD0 + tmpvar_8);
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, tmpvar_9);
					  result_1 = (result_1 + (2.0 * tmpvar_10));
					  highp vec2 tmpvar_11;
					  tmpvar_11.x = -(stepU_3);
					  tmpvar_11.y = stepV_2;
					  highp vec2 tmpvar_12;
					  tmpvar_12 = (xlv_TEXCOORD0 + tmpvar_11);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_MainTex, tmpvar_12);
					  result_1 = (result_1 + tmpvar_13);
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = 0.0;
					  tmpvar_14.y = -(stepV_2);
					  highp vec2 tmpvar_15;
					  tmpvar_15 = (xlv_TEXCOORD0 + tmpvar_14);
					  lowp vec4 tmpvar_16;
					  tmpvar_16 = texture2D (_MainTex, tmpvar_15);
					  result_1 = (result_1 + (2.0 * tmpvar_16));
					  highp vec2 tmpvar_17;
					  tmpvar_17 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_18;
					  tmpvar_18 = texture2D (_MainTex, tmpvar_17);
					  result_1 = (result_1 + (4.0 * tmpvar_18));
					  highp vec2 tmpvar_19;
					  tmpvar_19.x = 0.0;
					  tmpvar_19.y = stepV_2;
					  highp vec2 tmpvar_20;
					  tmpvar_20 = (xlv_TEXCOORD0 + tmpvar_19);
					  lowp vec4 tmpvar_21;
					  tmpvar_21 = texture2D (_MainTex, tmpvar_20);
					  result_1 = (result_1 + (2.0 * tmpvar_21));
					  highp vec2 tmpvar_22;
					  tmpvar_22.x = stepU_3;
					  tmpvar_22.y = -(stepV_2);
					  highp vec2 tmpvar_23;
					  tmpvar_23 = (xlv_TEXCOORD0 + tmpvar_22);
					  lowp vec4 tmpvar_24;
					  tmpvar_24 = texture2D (_MainTex, tmpvar_23);
					  result_1 = (result_1 + tmpvar_24);
					  highp vec2 tmpvar_25;
					  tmpvar_25.x = stepU_3;
					  tmpvar_25.y = 0.0;
					  highp vec2 tmpvar_26;
					  tmpvar_26 = (xlv_TEXCOORD0 + tmpvar_25);
					  lowp vec4 tmpvar_27;
					  tmpvar_27 = texture2D (_MainTex, tmpvar_26);
					  result_1 = (result_1 + (2.0 * tmpvar_27));
					  highp vec2 tmpvar_28;
					  tmpvar_28.x = stepU_3;
					  tmpvar_28.y = stepV_2;
					  highp vec2 tmpvar_29;
					  tmpvar_29 = (xlv_TEXCOORD0 + tmpvar_28);
					  lowp vec4 tmpvar_30;
					  tmpvar_30 = texture2D (_MainTex, tmpvar_29);
					  result_1 = (result_1 + tmpvar_30);
					  result_1 = (result_1 / 8.0);
					  result_1.xyz = mix (tmpvar_4, result_1.xyz, vec3(_Glow));
					  gl_FragData[0] = result_1;
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
					uniform highp vec4 _ScreenResolution;
					uniform highp float _Amount;
					uniform highp float _Glow;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 result_1;
					  highp float stepV_2;
					  highp float stepU_3;
					  stepU_3 = ((1.0/(_ScreenResolution.x)) * _Amount);
					  stepV_2 = ((1.0/(_ScreenResolution.y)) * _Amount);
					  lowp vec3 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = -(stepU_3);
					  tmpvar_5.y = -(stepV_2);
					  highp vec2 tmpvar_6;
					  tmpvar_6 = (xlv_TEXCOORD0 + tmpvar_5);
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = texture2D (_MainTex, tmpvar_6);
					  result_1 = tmpvar_7;
					  highp vec2 tmpvar_8;
					  tmpvar_8.x = -(stepU_3);
					  tmpvar_8.y = 0.0;
					  highp vec2 tmpvar_9;
					  tmpvar_9 = (xlv_TEXCOORD0 + tmpvar_8);
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, tmpvar_9);
					  result_1 = (result_1 + (2.0 * tmpvar_10));
					  highp vec2 tmpvar_11;
					  tmpvar_11.x = -(stepU_3);
					  tmpvar_11.y = stepV_2;
					  highp vec2 tmpvar_12;
					  tmpvar_12 = (xlv_TEXCOORD0 + tmpvar_11);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_MainTex, tmpvar_12);
					  result_1 = (result_1 + tmpvar_13);
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = 0.0;
					  tmpvar_14.y = -(stepV_2);
					  highp vec2 tmpvar_15;
					  tmpvar_15 = (xlv_TEXCOORD0 + tmpvar_14);
					  lowp vec4 tmpvar_16;
					  tmpvar_16 = texture2D (_MainTex, tmpvar_15);
					  result_1 = (result_1 + (2.0 * tmpvar_16));
					  highp vec2 tmpvar_17;
					  tmpvar_17 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_18;
					  tmpvar_18 = texture2D (_MainTex, tmpvar_17);
					  result_1 = (result_1 + (4.0 * tmpvar_18));
					  highp vec2 tmpvar_19;
					  tmpvar_19.x = 0.0;
					  tmpvar_19.y = stepV_2;
					  highp vec2 tmpvar_20;
					  tmpvar_20 = (xlv_TEXCOORD0 + tmpvar_19);
					  lowp vec4 tmpvar_21;
					  tmpvar_21 = texture2D (_MainTex, tmpvar_20);
					  result_1 = (result_1 + (2.0 * tmpvar_21));
					  highp vec2 tmpvar_22;
					  tmpvar_22.x = stepU_3;
					  tmpvar_22.y = -(stepV_2);
					  highp vec2 tmpvar_23;
					  tmpvar_23 = (xlv_TEXCOORD0 + tmpvar_22);
					  lowp vec4 tmpvar_24;
					  tmpvar_24 = texture2D (_MainTex, tmpvar_23);
					  result_1 = (result_1 + tmpvar_24);
					  highp vec2 tmpvar_25;
					  tmpvar_25.x = stepU_3;
					  tmpvar_25.y = 0.0;
					  highp vec2 tmpvar_26;
					  tmpvar_26 = (xlv_TEXCOORD0 + tmpvar_25);
					  lowp vec4 tmpvar_27;
					  tmpvar_27 = texture2D (_MainTex, tmpvar_26);
					  result_1 = (result_1 + (2.0 * tmpvar_27));
					  highp vec2 tmpvar_28;
					  tmpvar_28.x = stepU_3;
					  tmpvar_28.y = stepV_2;
					  highp vec2 tmpvar_29;
					  tmpvar_29 = (xlv_TEXCOORD0 + tmpvar_28);
					  lowp vec4 tmpvar_30;
					  tmpvar_30 = texture2D (_MainTex, tmpvar_29);
					  result_1 = (result_1 + tmpvar_30);
					  result_1 = (result_1 / 8.0);
					  result_1.xyz = mix (tmpvar_4, result_1.xyz, vec3(_Glow));
					  gl_FragData[0] = result_1;
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
					vec3 ImmCB_0_0_0[4];
					uniform 	vec4 _ScreenResolution;
					uniform 	float _Amount;
					uniform 	float _Glow;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					lowp vec3 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					ivec3 u_xlati3;
					vec2 u_xlat4;
					lowp vec3 u_xlat10_5;
					vec4 u_xlat6;
					lowp vec4 u_xlat10_7;
					vec3 u_xlat8;
					int u_xlati16;
					float u_xlat24;
					int u_xlati24;
					bool u_xlatb24;
					float u_xlat25;
					bool u_xlatb25;
					lowp float u_xlat10_29;
					void main()
					{
						ImmCB_0_0_0[0] = vec3(1.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec3(0.0, 1.0, 0.0);
						ImmCB_0_0_0[2] = vec3(0.0, 0.0, 1.0);
						ImmCB_0_0_0[3] = vec3(0.0, 0.0, 0.0);
					    u_xlat0.xy = vec2(1.0, 1.0) / _ScreenResolution.xy;
					    u_xlat0.xy = u_xlat0.xy * vec2(_Amount);
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.w = float(0.0);
					    u_xlati16 = 0;
					    while(true){
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb24 = !!(u_xlati16>=3);
					#else
					        u_xlatb24 = u_xlati16>=3;
					#endif
					        if(u_xlatb24){break;}
					        u_xlati3.xy = ivec2(u_xlati16) + ivec2(int(0xFFFFFFFFu), 1);
					        u_xlat24 = float(u_xlati3.x);
					        u_xlat4.x = u_xlat0.x * u_xlat24;
					        u_xlat10_5.x = dot(vec3(1.0, 2.0, 1.0), ImmCB_0_0_0[u_xlati16].xyz);
					        u_xlat10_5.y = dot(vec3(2.0, 4.0, 2.0), ImmCB_0_0_0[u_xlati16].xyz);
					        u_xlat10_5.z = dot(vec3(1.0, 2.0, 1.0), ImmCB_0_0_0[u_xlati16].xyz);
					        u_xlat6 = u_xlat2;
					        u_xlati24 = 0;
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb25 = !!(u_xlati24>=3);
					#else
					            u_xlatb25 = u_xlati24>=3;
					#endif
					            if(u_xlatb25){break;}
					            u_xlati3.xz = ivec2(u_xlati24) + ivec2(int(0xFFFFFFFFu), 1);
					            u_xlat25 = float(u_xlati3.x);
					            u_xlat4.y = u_xlat0.y * u_xlat25;
					            u_xlat3.xw = u_xlat4.xy + vs_TEXCOORD0.xy;
					            u_xlat10_29 = dot(u_xlat10_5.xyz, ImmCB_0_0_0[u_xlati24].xyz);
					            u_xlat10_7 = texture(_MainTex, u_xlat3.xw);
					            u_xlat6 = vec4(u_xlat10_29) * u_xlat10_7 + u_xlat6;
					            u_xlati24 = u_xlati3.z;
					        }
					        u_xlat2 = u_xlat6;
					        u_xlati16 = u_xlati3.y;
					    }
					    u_xlat0.x = u_xlat2.w * 0.125;
					    u_xlat8.xyz = u_xlat2.xyz * vec3(0.125, 0.125, 0.125) + (-u_xlat10_1.xyz);
					    SV_Target0.xyz = vec3(vec3(_Glow, _Glow, _Glow)) * u_xlat8.xyz + u_xlat10_1.xyz;
					    SV_Target0.w = u_xlat0.x;
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
					vec3 ImmCB_0_0_0[4];
					uniform 	vec4 _ScreenResolution;
					uniform 	float _Amount;
					uniform 	float _Glow;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					lowp vec3 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					ivec3 u_xlati3;
					vec2 u_xlat4;
					lowp vec3 u_xlat10_5;
					vec4 u_xlat6;
					lowp vec4 u_xlat10_7;
					vec3 u_xlat8;
					int u_xlati16;
					float u_xlat24;
					int u_xlati24;
					bool u_xlatb24;
					float u_xlat25;
					bool u_xlatb25;
					lowp float u_xlat10_29;
					void main()
					{
						ImmCB_0_0_0[0] = vec3(1.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec3(0.0, 1.0, 0.0);
						ImmCB_0_0_0[2] = vec3(0.0, 0.0, 1.0);
						ImmCB_0_0_0[3] = vec3(0.0, 0.0, 0.0);
					    u_xlat0.xy = vec2(1.0, 1.0) / _ScreenResolution.xy;
					    u_xlat0.xy = u_xlat0.xy * vec2(_Amount);
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.w = float(0.0);
					    u_xlati16 = 0;
					    while(true){
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb24 = !!(u_xlati16>=3);
					#else
					        u_xlatb24 = u_xlati16>=3;
					#endif
					        if(u_xlatb24){break;}
					        u_xlati3.xy = ivec2(u_xlati16) + ivec2(int(0xFFFFFFFFu), 1);
					        u_xlat24 = float(u_xlati3.x);
					        u_xlat4.x = u_xlat0.x * u_xlat24;
					        u_xlat10_5.x = dot(vec3(1.0, 2.0, 1.0), ImmCB_0_0_0[u_xlati16].xyz);
					        u_xlat10_5.y = dot(vec3(2.0, 4.0, 2.0), ImmCB_0_0_0[u_xlati16].xyz);
					        u_xlat10_5.z = dot(vec3(1.0, 2.0, 1.0), ImmCB_0_0_0[u_xlati16].xyz);
					        u_xlat6 = u_xlat2;
					        u_xlati24 = 0;
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb25 = !!(u_xlati24>=3);
					#else
					            u_xlatb25 = u_xlati24>=3;
					#endif
					            if(u_xlatb25){break;}
					            u_xlati3.xz = ivec2(u_xlati24) + ivec2(int(0xFFFFFFFFu), 1);
					            u_xlat25 = float(u_xlati3.x);
					            u_xlat4.y = u_xlat0.y * u_xlat25;
					            u_xlat3.xw = u_xlat4.xy + vs_TEXCOORD0.xy;
					            u_xlat10_29 = dot(u_xlat10_5.xyz, ImmCB_0_0_0[u_xlati24].xyz);
					            u_xlat10_7 = texture(_MainTex, u_xlat3.xw);
					            u_xlat6 = vec4(u_xlat10_29) * u_xlat10_7 + u_xlat6;
					            u_xlati24 = u_xlati3.z;
					        }
					        u_xlat2 = u_xlat6;
					        u_xlati16 = u_xlati3.y;
					    }
					    u_xlat0.x = u_xlat2.w * 0.125;
					    u_xlat8.xyz = u_xlat2.xyz * vec3(0.125, 0.125, 0.125) + (-u_xlat10_1.xyz);
					    SV_Target0.xyz = vec3(vec3(_Glow, _Glow, _Glow)) * u_xlat8.xyz + u_xlat10_1.xyz;
					    SV_Target0.w = u_xlat0.x;
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
					vec3 ImmCB_0_0_0[4];
					uniform 	vec4 _ScreenResolution;
					uniform 	float _Amount;
					uniform 	float _Glow;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					lowp vec3 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					ivec3 u_xlati3;
					vec2 u_xlat4;
					lowp vec3 u_xlat10_5;
					vec4 u_xlat6;
					lowp vec4 u_xlat10_7;
					vec3 u_xlat8;
					int u_xlati16;
					float u_xlat24;
					int u_xlati24;
					bool u_xlatb24;
					float u_xlat25;
					bool u_xlatb25;
					lowp float u_xlat10_29;
					void main()
					{
						ImmCB_0_0_0[0] = vec3(1.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec3(0.0, 1.0, 0.0);
						ImmCB_0_0_0[2] = vec3(0.0, 0.0, 1.0);
						ImmCB_0_0_0[3] = vec3(0.0, 0.0, 0.0);
					    u_xlat0.xy = vec2(1.0, 1.0) / _ScreenResolution.xy;
					    u_xlat0.xy = u_xlat0.xy * vec2(_Amount);
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.w = float(0.0);
					    u_xlati16 = 0;
					    while(true){
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb24 = !!(u_xlati16>=3);
					#else
					        u_xlatb24 = u_xlati16>=3;
					#endif
					        if(u_xlatb24){break;}
					        u_xlati3.xy = ivec2(u_xlati16) + ivec2(int(0xFFFFFFFFu), 1);
					        u_xlat24 = float(u_xlati3.x);
					        u_xlat4.x = u_xlat0.x * u_xlat24;
					        u_xlat10_5.x = dot(vec3(1.0, 2.0, 1.0), ImmCB_0_0_0[u_xlati16].xyz);
					        u_xlat10_5.y = dot(vec3(2.0, 4.0, 2.0), ImmCB_0_0_0[u_xlati16].xyz);
					        u_xlat10_5.z = dot(vec3(1.0, 2.0, 1.0), ImmCB_0_0_0[u_xlati16].xyz);
					        u_xlat6 = u_xlat2;
					        u_xlati24 = 0;
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb25 = !!(u_xlati24>=3);
					#else
					            u_xlatb25 = u_xlati24>=3;
					#endif
					            if(u_xlatb25){break;}
					            u_xlati3.xz = ivec2(u_xlati24) + ivec2(int(0xFFFFFFFFu), 1);
					            u_xlat25 = float(u_xlati3.x);
					            u_xlat4.y = u_xlat0.y * u_xlat25;
					            u_xlat3.xw = u_xlat4.xy + vs_TEXCOORD0.xy;
					            u_xlat10_29 = dot(u_xlat10_5.xyz, ImmCB_0_0_0[u_xlati24].xyz);
					            u_xlat10_7 = texture(_MainTex, u_xlat3.xw);
					            u_xlat6 = vec4(u_xlat10_29) * u_xlat10_7 + u_xlat6;
					            u_xlati24 = u_xlati3.z;
					        }
					        u_xlat2 = u_xlat6;
					        u_xlati16 = u_xlati3.y;
					    }
					    u_xlat0.x = u_xlat2.w * 0.125;
					    u_xlat8.xyz = u_xlat2.xyz * vec3(0.125, 0.125, 0.125) + (-u_xlat10_1.xyz);
					    SV_Target0.xyz = vec3(vec3(_Glow, _Glow, _Glow)) * u_xlat8.xyz + u_xlat10_1.xyz;
					    SV_Target0.w = u_xlat0.x;
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