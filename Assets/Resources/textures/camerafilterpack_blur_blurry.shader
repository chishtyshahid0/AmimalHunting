Shader "CameraFilterPack/Blur_Blurry" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_Amount ("_Amount", Range(0, 20)) = 5
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 50287
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 result_1;
					  highp float stepV_2;
					  highp float stepU_3;
					  stepU_3 = ((1.0/(_ScreenResolution.x)) * _Amount);
					  stepV_2 = ((1.0/(_ScreenResolution.y)) * _Amount);
					  highp vec2 tmpvar_4;
					  tmpvar_4.x = -(stepU_3);
					  tmpvar_4.y = -(stepV_2);
					  highp vec2 tmpvar_5;
					  tmpvar_5 = (xlv_TEXCOORD0 + tmpvar_4);
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex, tmpvar_5).xyz;
					  result_1 = tmpvar_6;
					  highp vec2 tmpvar_7;
					  tmpvar_7.x = -(stepU_3);
					  tmpvar_7.y = 0.0;
					  highp vec2 tmpvar_8;
					  tmpvar_8 = (xlv_TEXCOORD0 + tmpvar_7);
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = (2.0 * texture2D (_MainTex, tmpvar_8)).xyz;
					  result_1 = (result_1 + tmpvar_9);
					  highp vec2 tmpvar_10;
					  tmpvar_10.x = -(stepU_3);
					  tmpvar_10.y = stepV_2;
					  highp vec2 tmpvar_11;
					  tmpvar_11 = (xlv_TEXCOORD0 + tmpvar_10);
					  lowp vec3 tmpvar_12;
					  tmpvar_12 = texture2D (_MainTex, tmpvar_11).xyz;
					  result_1 = (result_1 + tmpvar_12);
					  highp vec2 tmpvar_13;
					  tmpvar_13.x = 0.0;
					  tmpvar_13.y = -(stepV_2);
					  highp vec2 tmpvar_14;
					  tmpvar_14 = (xlv_TEXCOORD0 + tmpvar_13);
					  lowp vec3 tmpvar_15;
					  tmpvar_15 = (2.0 * texture2D (_MainTex, tmpvar_14)).xyz;
					  result_1 = (result_1 + tmpvar_15);
					  highp vec2 tmpvar_16;
					  tmpvar_16 = xlv_TEXCOORD0;
					  lowp vec3 tmpvar_17;
					  tmpvar_17 = (4.0 * texture2D (_MainTex, tmpvar_16)).xyz;
					  result_1 = (result_1 + tmpvar_17);
					  highp vec2 tmpvar_18;
					  tmpvar_18.x = 0.0;
					  tmpvar_18.y = stepV_2;
					  highp vec2 tmpvar_19;
					  tmpvar_19 = (xlv_TEXCOORD0 + tmpvar_18);
					  lowp vec3 tmpvar_20;
					  tmpvar_20 = (2.0 * texture2D (_MainTex, tmpvar_19)).xyz;
					  result_1 = (result_1 + tmpvar_20);
					  highp vec2 tmpvar_21;
					  tmpvar_21.x = stepU_3;
					  tmpvar_21.y = -(stepV_2);
					  highp vec2 tmpvar_22;
					  tmpvar_22 = (xlv_TEXCOORD0 + tmpvar_21);
					  lowp vec3 tmpvar_23;
					  tmpvar_23 = texture2D (_MainTex, tmpvar_22).xyz;
					  result_1 = (result_1 + tmpvar_23);
					  highp vec2 tmpvar_24;
					  tmpvar_24.x = stepU_3;
					  tmpvar_24.y = 0.0;
					  highp vec2 tmpvar_25;
					  tmpvar_25 = (xlv_TEXCOORD0 + tmpvar_24);
					  lowp vec3 tmpvar_26;
					  tmpvar_26 = (2.0 * texture2D (_MainTex, tmpvar_25)).xyz;
					  result_1 = (result_1 + tmpvar_26);
					  highp vec2 tmpvar_27;
					  tmpvar_27.x = stepU_3;
					  tmpvar_27.y = stepV_2;
					  highp vec2 tmpvar_28;
					  tmpvar_28 = (xlv_TEXCOORD0 + tmpvar_27);
					  lowp vec3 tmpvar_29;
					  tmpvar_29 = texture2D (_MainTex, tmpvar_28).xyz;
					  result_1 = (result_1 + tmpvar_29);
					  highp vec4 tmpvar_30;
					  tmpvar_30.w = 1.0;
					  tmpvar_30.xyz = (result_1 / 16.0);
					  gl_FragData[0] = tmpvar_30;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 result_1;
					  highp float stepV_2;
					  highp float stepU_3;
					  stepU_3 = ((1.0/(_ScreenResolution.x)) * _Amount);
					  stepV_2 = ((1.0/(_ScreenResolution.y)) * _Amount);
					  highp vec2 tmpvar_4;
					  tmpvar_4.x = -(stepU_3);
					  tmpvar_4.y = -(stepV_2);
					  highp vec2 tmpvar_5;
					  tmpvar_5 = (xlv_TEXCOORD0 + tmpvar_4);
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex, tmpvar_5).xyz;
					  result_1 = tmpvar_6;
					  highp vec2 tmpvar_7;
					  tmpvar_7.x = -(stepU_3);
					  tmpvar_7.y = 0.0;
					  highp vec2 tmpvar_8;
					  tmpvar_8 = (xlv_TEXCOORD0 + tmpvar_7);
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = (2.0 * texture2D (_MainTex, tmpvar_8)).xyz;
					  result_1 = (result_1 + tmpvar_9);
					  highp vec2 tmpvar_10;
					  tmpvar_10.x = -(stepU_3);
					  tmpvar_10.y = stepV_2;
					  highp vec2 tmpvar_11;
					  tmpvar_11 = (xlv_TEXCOORD0 + tmpvar_10);
					  lowp vec3 tmpvar_12;
					  tmpvar_12 = texture2D (_MainTex, tmpvar_11).xyz;
					  result_1 = (result_1 + tmpvar_12);
					  highp vec2 tmpvar_13;
					  tmpvar_13.x = 0.0;
					  tmpvar_13.y = -(stepV_2);
					  highp vec2 tmpvar_14;
					  tmpvar_14 = (xlv_TEXCOORD0 + tmpvar_13);
					  lowp vec3 tmpvar_15;
					  tmpvar_15 = (2.0 * texture2D (_MainTex, tmpvar_14)).xyz;
					  result_1 = (result_1 + tmpvar_15);
					  highp vec2 tmpvar_16;
					  tmpvar_16 = xlv_TEXCOORD0;
					  lowp vec3 tmpvar_17;
					  tmpvar_17 = (4.0 * texture2D (_MainTex, tmpvar_16)).xyz;
					  result_1 = (result_1 + tmpvar_17);
					  highp vec2 tmpvar_18;
					  tmpvar_18.x = 0.0;
					  tmpvar_18.y = stepV_2;
					  highp vec2 tmpvar_19;
					  tmpvar_19 = (xlv_TEXCOORD0 + tmpvar_18);
					  lowp vec3 tmpvar_20;
					  tmpvar_20 = (2.0 * texture2D (_MainTex, tmpvar_19)).xyz;
					  result_1 = (result_1 + tmpvar_20);
					  highp vec2 tmpvar_21;
					  tmpvar_21.x = stepU_3;
					  tmpvar_21.y = -(stepV_2);
					  highp vec2 tmpvar_22;
					  tmpvar_22 = (xlv_TEXCOORD0 + tmpvar_21);
					  lowp vec3 tmpvar_23;
					  tmpvar_23 = texture2D (_MainTex, tmpvar_22).xyz;
					  result_1 = (result_1 + tmpvar_23);
					  highp vec2 tmpvar_24;
					  tmpvar_24.x = stepU_3;
					  tmpvar_24.y = 0.0;
					  highp vec2 tmpvar_25;
					  tmpvar_25 = (xlv_TEXCOORD0 + tmpvar_24);
					  lowp vec3 tmpvar_26;
					  tmpvar_26 = (2.0 * texture2D (_MainTex, tmpvar_25)).xyz;
					  result_1 = (result_1 + tmpvar_26);
					  highp vec2 tmpvar_27;
					  tmpvar_27.x = stepU_3;
					  tmpvar_27.y = stepV_2;
					  highp vec2 tmpvar_28;
					  tmpvar_28 = (xlv_TEXCOORD0 + tmpvar_27);
					  lowp vec3 tmpvar_29;
					  tmpvar_29 = texture2D (_MainTex, tmpvar_28).xyz;
					  result_1 = (result_1 + tmpvar_29);
					  highp vec4 tmpvar_30;
					  tmpvar_30.w = 1.0;
					  tmpvar_30.xyz = (result_1 / 16.0);
					  gl_FragData[0] = tmpvar_30;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 result_1;
					  highp float stepV_2;
					  highp float stepU_3;
					  stepU_3 = ((1.0/(_ScreenResolution.x)) * _Amount);
					  stepV_2 = ((1.0/(_ScreenResolution.y)) * _Amount);
					  highp vec2 tmpvar_4;
					  tmpvar_4.x = -(stepU_3);
					  tmpvar_4.y = -(stepV_2);
					  highp vec2 tmpvar_5;
					  tmpvar_5 = (xlv_TEXCOORD0 + tmpvar_4);
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex, tmpvar_5).xyz;
					  result_1 = tmpvar_6;
					  highp vec2 tmpvar_7;
					  tmpvar_7.x = -(stepU_3);
					  tmpvar_7.y = 0.0;
					  highp vec2 tmpvar_8;
					  tmpvar_8 = (xlv_TEXCOORD0 + tmpvar_7);
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = (2.0 * texture2D (_MainTex, tmpvar_8)).xyz;
					  result_1 = (result_1 + tmpvar_9);
					  highp vec2 tmpvar_10;
					  tmpvar_10.x = -(stepU_3);
					  tmpvar_10.y = stepV_2;
					  highp vec2 tmpvar_11;
					  tmpvar_11 = (xlv_TEXCOORD0 + tmpvar_10);
					  lowp vec3 tmpvar_12;
					  tmpvar_12 = texture2D (_MainTex, tmpvar_11).xyz;
					  result_1 = (result_1 + tmpvar_12);
					  highp vec2 tmpvar_13;
					  tmpvar_13.x = 0.0;
					  tmpvar_13.y = -(stepV_2);
					  highp vec2 tmpvar_14;
					  tmpvar_14 = (xlv_TEXCOORD0 + tmpvar_13);
					  lowp vec3 tmpvar_15;
					  tmpvar_15 = (2.0 * texture2D (_MainTex, tmpvar_14)).xyz;
					  result_1 = (result_1 + tmpvar_15);
					  highp vec2 tmpvar_16;
					  tmpvar_16 = xlv_TEXCOORD0;
					  lowp vec3 tmpvar_17;
					  tmpvar_17 = (4.0 * texture2D (_MainTex, tmpvar_16)).xyz;
					  result_1 = (result_1 + tmpvar_17);
					  highp vec2 tmpvar_18;
					  tmpvar_18.x = 0.0;
					  tmpvar_18.y = stepV_2;
					  highp vec2 tmpvar_19;
					  tmpvar_19 = (xlv_TEXCOORD0 + tmpvar_18);
					  lowp vec3 tmpvar_20;
					  tmpvar_20 = (2.0 * texture2D (_MainTex, tmpvar_19)).xyz;
					  result_1 = (result_1 + tmpvar_20);
					  highp vec2 tmpvar_21;
					  tmpvar_21.x = stepU_3;
					  tmpvar_21.y = -(stepV_2);
					  highp vec2 tmpvar_22;
					  tmpvar_22 = (xlv_TEXCOORD0 + tmpvar_21);
					  lowp vec3 tmpvar_23;
					  tmpvar_23 = texture2D (_MainTex, tmpvar_22).xyz;
					  result_1 = (result_1 + tmpvar_23);
					  highp vec2 tmpvar_24;
					  tmpvar_24.x = stepU_3;
					  tmpvar_24.y = 0.0;
					  highp vec2 tmpvar_25;
					  tmpvar_25 = (xlv_TEXCOORD0 + tmpvar_24);
					  lowp vec3 tmpvar_26;
					  tmpvar_26 = (2.0 * texture2D (_MainTex, tmpvar_25)).xyz;
					  result_1 = (result_1 + tmpvar_26);
					  highp vec2 tmpvar_27;
					  tmpvar_27.x = stepU_3;
					  tmpvar_27.y = stepV_2;
					  highp vec2 tmpvar_28;
					  tmpvar_28 = (xlv_TEXCOORD0 + tmpvar_27);
					  lowp vec3 tmpvar_29;
					  tmpvar_29 = texture2D (_MainTex, tmpvar_28).xyz;
					  result_1 = (result_1 + tmpvar_29);
					  highp vec4 tmpvar_30;
					  tmpvar_30.w = 1.0;
					  tmpvar_30.xyz = (result_1 / 16.0);
					  gl_FragData[0] = tmpvar_30;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					ivec2 u_xlati2;
					vec2 u_xlat3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec2 u_xlat9;
					int u_xlati12;
					ivec2 u_xlati15;
					float u_xlat18;
					int u_xlati18;
					bool u_xlatb18;
					float u_xlat19;
					bool u_xlatb19;
					lowp float u_xlat10_22;
					void main()
					{
						ImmCB_0_0_0[0] = vec3(1.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec3(0.0, 1.0, 0.0);
						ImmCB_0_0_0[2] = vec3(0.0, 0.0, 1.0);
						ImmCB_0_0_0[3] = vec3(0.0, 0.0, 0.0);
					    u_xlat0.xy = vec2(1.0, 1.0) / _ScreenResolution.xy;
					    u_xlat0.xy = u_xlat0.xy * vec2(_Amount);
					    u_xlat1.x = float(0.0);
					    u_xlat1.y = float(0.0);
					    u_xlat1.z = float(0.0);
					    u_xlati12 = 0;
					    while(true){
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb18 = !!(u_xlati12>=3);
					#else
					        u_xlatb18 = u_xlati12>=3;
					#endif
					        if(u_xlatb18){break;}
					        u_xlati2.xy = ivec2(u_xlati12) + ivec2(int(0xFFFFFFFFu), 1);
					        u_xlat18 = float(u_xlati2.x);
					        u_xlat3.x = u_xlat0.x * u_xlat18;
					        u_xlat10_4.x = dot(vec3(1.0, 2.0, 1.0), ImmCB_0_0_0[u_xlati12].xyz);
					        u_xlat10_4.y = dot(vec3(2.0, 4.0, 2.0), ImmCB_0_0_0[u_xlati12].xyz);
					        u_xlat10_4.z = dot(vec3(1.0, 2.0, 1.0), ImmCB_0_0_0[u_xlati12].xyz);
					        u_xlat2.xzw = u_xlat1.xyz;
					        u_xlati18 = 0;
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb19 = !!(u_xlati18>=3);
					#else
					            u_xlatb19 = u_xlati18>=3;
					#endif
					            if(u_xlatb19){break;}
					            u_xlati15.xy = ivec2(u_xlati18) + ivec2(int(0xFFFFFFFFu), 1);
					            u_xlat19 = float(u_xlati15.x);
					            u_xlat3.y = u_xlat0.y * u_xlat19;
					            u_xlat9.xy = u_xlat3.xy + vs_TEXCOORD0.xy;
					            u_xlat10_22 = dot(u_xlat10_4.xyz, ImmCB_0_0_0[u_xlati18].xyz);
					            u_xlat10_5.xyz = texture(_MainTex, u_xlat9.xy).xyz;
					            u_xlat2.xzw = vec3(u_xlat10_22) * u_xlat10_5.xyz + u_xlat2.xzw;
					            u_xlati18 = u_xlati15.y;
					        }
					        u_xlat1.xyz = u_xlat2.xzw;
					        u_xlati12 = u_xlati2.y;
					    }
					    SV_Target0.xyz = u_xlat1.xyz * vec3(0.0625, 0.0625, 0.0625);
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
					vec3 ImmCB_0_0_0[4];
					uniform 	vec4 _ScreenResolution;
					uniform 	float _Amount;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					ivec2 u_xlati2;
					vec2 u_xlat3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec2 u_xlat9;
					int u_xlati12;
					ivec2 u_xlati15;
					float u_xlat18;
					int u_xlati18;
					bool u_xlatb18;
					float u_xlat19;
					bool u_xlatb19;
					lowp float u_xlat10_22;
					void main()
					{
						ImmCB_0_0_0[0] = vec3(1.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec3(0.0, 1.0, 0.0);
						ImmCB_0_0_0[2] = vec3(0.0, 0.0, 1.0);
						ImmCB_0_0_0[3] = vec3(0.0, 0.0, 0.0);
					    u_xlat0.xy = vec2(1.0, 1.0) / _ScreenResolution.xy;
					    u_xlat0.xy = u_xlat0.xy * vec2(_Amount);
					    u_xlat1.x = float(0.0);
					    u_xlat1.y = float(0.0);
					    u_xlat1.z = float(0.0);
					    u_xlati12 = 0;
					    while(true){
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb18 = !!(u_xlati12>=3);
					#else
					        u_xlatb18 = u_xlati12>=3;
					#endif
					        if(u_xlatb18){break;}
					        u_xlati2.xy = ivec2(u_xlati12) + ivec2(int(0xFFFFFFFFu), 1);
					        u_xlat18 = float(u_xlati2.x);
					        u_xlat3.x = u_xlat0.x * u_xlat18;
					        u_xlat10_4.x = dot(vec3(1.0, 2.0, 1.0), ImmCB_0_0_0[u_xlati12].xyz);
					        u_xlat10_4.y = dot(vec3(2.0, 4.0, 2.0), ImmCB_0_0_0[u_xlati12].xyz);
					        u_xlat10_4.z = dot(vec3(1.0, 2.0, 1.0), ImmCB_0_0_0[u_xlati12].xyz);
					        u_xlat2.xzw = u_xlat1.xyz;
					        u_xlati18 = 0;
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb19 = !!(u_xlati18>=3);
					#else
					            u_xlatb19 = u_xlati18>=3;
					#endif
					            if(u_xlatb19){break;}
					            u_xlati15.xy = ivec2(u_xlati18) + ivec2(int(0xFFFFFFFFu), 1);
					            u_xlat19 = float(u_xlati15.x);
					            u_xlat3.y = u_xlat0.y * u_xlat19;
					            u_xlat9.xy = u_xlat3.xy + vs_TEXCOORD0.xy;
					            u_xlat10_22 = dot(u_xlat10_4.xyz, ImmCB_0_0_0[u_xlati18].xyz);
					            u_xlat10_5.xyz = texture(_MainTex, u_xlat9.xy).xyz;
					            u_xlat2.xzw = vec3(u_xlat10_22) * u_xlat10_5.xyz + u_xlat2.xzw;
					            u_xlati18 = u_xlati15.y;
					        }
					        u_xlat1.xyz = u_xlat2.xzw;
					        u_xlati12 = u_xlati2.y;
					    }
					    SV_Target0.xyz = u_xlat1.xyz * vec3(0.0625, 0.0625, 0.0625);
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
					vec3 ImmCB_0_0_0[4];
					uniform 	vec4 _ScreenResolution;
					uniform 	float _Amount;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					ivec2 u_xlati2;
					vec2 u_xlat3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec2 u_xlat9;
					int u_xlati12;
					ivec2 u_xlati15;
					float u_xlat18;
					int u_xlati18;
					bool u_xlatb18;
					float u_xlat19;
					bool u_xlatb19;
					lowp float u_xlat10_22;
					void main()
					{
						ImmCB_0_0_0[0] = vec3(1.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec3(0.0, 1.0, 0.0);
						ImmCB_0_0_0[2] = vec3(0.0, 0.0, 1.0);
						ImmCB_0_0_0[3] = vec3(0.0, 0.0, 0.0);
					    u_xlat0.xy = vec2(1.0, 1.0) / _ScreenResolution.xy;
					    u_xlat0.xy = u_xlat0.xy * vec2(_Amount);
					    u_xlat1.x = float(0.0);
					    u_xlat1.y = float(0.0);
					    u_xlat1.z = float(0.0);
					    u_xlati12 = 0;
					    while(true){
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb18 = !!(u_xlati12>=3);
					#else
					        u_xlatb18 = u_xlati12>=3;
					#endif
					        if(u_xlatb18){break;}
					        u_xlati2.xy = ivec2(u_xlati12) + ivec2(int(0xFFFFFFFFu), 1);
					        u_xlat18 = float(u_xlati2.x);
					        u_xlat3.x = u_xlat0.x * u_xlat18;
					        u_xlat10_4.x = dot(vec3(1.0, 2.0, 1.0), ImmCB_0_0_0[u_xlati12].xyz);
					        u_xlat10_4.y = dot(vec3(2.0, 4.0, 2.0), ImmCB_0_0_0[u_xlati12].xyz);
					        u_xlat10_4.z = dot(vec3(1.0, 2.0, 1.0), ImmCB_0_0_0[u_xlati12].xyz);
					        u_xlat2.xzw = u_xlat1.xyz;
					        u_xlati18 = 0;
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb19 = !!(u_xlati18>=3);
					#else
					            u_xlatb19 = u_xlati18>=3;
					#endif
					            if(u_xlatb19){break;}
					            u_xlati15.xy = ivec2(u_xlati18) + ivec2(int(0xFFFFFFFFu), 1);
					            u_xlat19 = float(u_xlati15.x);
					            u_xlat3.y = u_xlat0.y * u_xlat19;
					            u_xlat9.xy = u_xlat3.xy + vs_TEXCOORD0.xy;
					            u_xlat10_22 = dot(u_xlat10_4.xyz, ImmCB_0_0_0[u_xlati18].xyz);
					            u_xlat10_5.xyz = texture(_MainTex, u_xlat9.xy).xyz;
					            u_xlat2.xzw = vec3(u_xlat10_22) * u_xlat10_5.xyz + u_xlat2.xzw;
					            u_xlati18 = u_xlati15.y;
					        }
					        u_xlat1.xyz = u_xlat2.xzw;
					        u_xlati12 = u_xlati2.y;
					    }
					    SV_Target0.xyz = u_xlat1.xyz * vec3(0.0625, 0.0625, 0.0625);
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