Shader "CameraFilterPack/Edge_Sobel" {
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
			GpuProgramID 62920
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp float stepx_1;
					  stepx_1 = (1.0/(_ScreenResolution.x));
					  highp float stepy_2;
					  stepy_2 = (1.0/(_ScreenResolution.y));
					  highp vec2 center_3;
					  center_3 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_4;
					  tmpvar_4.x = -(stepx_1);
					  tmpvar_4.y = stepy_2;
					  lowp vec4 tmpvar_5;
					  highp vec2 P_6;
					  P_6 = (center_3 + tmpvar_4);
					  tmpvar_5 = texture2D (_MainTex, P_6);
					  highp vec4 color_7;
					  color_7 = tmpvar_5;
					  highp float tmpvar_8;
					  tmpvar_8 = sqrt(((
					    (color_7.x * color_7.x)
					   + 
					    (color_7.y * color_7.y)
					  ) + (color_7.z * color_7.z)));
					  highp vec2 tmpvar_9;
					  tmpvar_9.y = 0.0;
					  tmpvar_9.x = -(stepx_1);
					  lowp vec4 tmpvar_10;
					  highp vec2 P_11;
					  P_11 = (center_3 + tmpvar_9);
					  tmpvar_10 = texture2D (_MainTex, P_11);
					  highp vec4 color_12;
					  color_12 = tmpvar_10;
					  highp vec2 tmpvar_13;
					  tmpvar_13.x = -(stepx_1);
					  tmpvar_13.y = -(stepy_2);
					  lowp vec4 tmpvar_14;
					  highp vec2 P_15;
					  P_15 = (center_3 + tmpvar_13);
					  tmpvar_14 = texture2D (_MainTex, P_15);
					  highp vec4 color_16;
					  color_16 = tmpvar_14;
					  highp float tmpvar_17;
					  tmpvar_17 = sqrt(((
					    (color_16.x * color_16.x)
					   + 
					    (color_16.y * color_16.y)
					  ) + (color_16.z * color_16.z)));
					  highp vec2 tmpvar_18;
					  tmpvar_18.x = 0.0;
					  tmpvar_18.y = stepy_2;
					  lowp vec4 tmpvar_19;
					  highp vec2 P_20;
					  P_20 = (center_3 + tmpvar_18);
					  tmpvar_19 = texture2D (_MainTex, P_20);
					  highp vec4 color_21;
					  color_21 = tmpvar_19;
					  highp vec2 tmpvar_22;
					  tmpvar_22.x = 0.0;
					  tmpvar_22.y = -(stepy_2);
					  lowp vec4 tmpvar_23;
					  highp vec2 P_24;
					  P_24 = (center_3 + tmpvar_22);
					  tmpvar_23 = texture2D (_MainTex, P_24);
					  highp vec4 color_25;
					  color_25 = tmpvar_23;
					  highp vec2 tmpvar_26;
					  tmpvar_26.x = stepx_1;
					  tmpvar_26.y = stepy_2;
					  lowp vec4 tmpvar_27;
					  highp vec2 P_28;
					  P_28 = (center_3 + tmpvar_26);
					  tmpvar_27 = texture2D (_MainTex, P_28);
					  highp vec4 color_29;
					  color_29 = tmpvar_27;
					  highp float tmpvar_30;
					  tmpvar_30 = sqrt(((
					    (color_29.x * color_29.x)
					   + 
					    (color_29.y * color_29.y)
					  ) + (color_29.z * color_29.z)));
					  highp vec2 tmpvar_31;
					  tmpvar_31.y = 0.0;
					  tmpvar_31.x = stepx_1;
					  lowp vec4 tmpvar_32;
					  highp vec2 P_33;
					  P_33 = (center_3 + tmpvar_31);
					  tmpvar_32 = texture2D (_MainTex, P_33);
					  highp vec4 color_34;
					  color_34 = tmpvar_32;
					  highp vec2 tmpvar_35;
					  tmpvar_35.x = stepx_1;
					  tmpvar_35.y = -(stepy_2);
					  lowp vec4 tmpvar_36;
					  highp vec2 P_37;
					  P_37 = (center_3 + tmpvar_35);
					  tmpvar_36 = texture2D (_MainTex, P_37);
					  highp vec4 color_38;
					  color_38 = tmpvar_36;
					  highp float tmpvar_39;
					  tmpvar_39 = sqrt(((
					    (color_38.x * color_38.x)
					   + 
					    (color_38.y * color_38.y)
					  ) + (color_38.z * color_38.z)));
					  highp float tmpvar_40;
					  tmpvar_40 = (((
					    ((tmpvar_8 + (2.0 * sqrt(
					      (((color_12.x * color_12.x) + (color_12.y * color_12.y)) + (color_12.z * color_12.z))
					    ))) + tmpvar_17)
					   - tmpvar_30) - (2.0 * 
					    sqrt((((color_34.x * color_34.x) + (color_34.y * color_34.y)) + (color_34.z * color_34.z)))
					  )) - tmpvar_39);
					  highp float tmpvar_41;
					  tmpvar_41 = (((
					    ((-(tmpvar_8) - (2.0 * sqrt(
					      (((color_21.x * color_21.x) + (color_21.y * color_21.y)) + (color_21.z * color_21.z))
					    ))) - tmpvar_30)
					   + tmpvar_17) + (2.0 * 
					    sqrt((((color_25.x * color_25.x) + (color_25.y * color_25.y)) + (color_25.z * color_25.z)))
					  )) + tmpvar_39);
					  highp float tmpvar_42;
					  tmpvar_42 = sqrt(((tmpvar_40 * tmpvar_40) + (tmpvar_41 * tmpvar_41)));
					  highp vec3 tmpvar_43;
					  tmpvar_43.x = tmpvar_42;
					  tmpvar_43.y = tmpvar_42;
					  tmpvar_43.z = tmpvar_42;
					  highp vec4 tmpvar_44;
					  tmpvar_44.w = 1.0;
					  tmpvar_44.xyz = tmpvar_43;
					  gl_FragData[0] = tmpvar_44;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp float stepx_1;
					  stepx_1 = (1.0/(_ScreenResolution.x));
					  highp float stepy_2;
					  stepy_2 = (1.0/(_ScreenResolution.y));
					  highp vec2 center_3;
					  center_3 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_4;
					  tmpvar_4.x = -(stepx_1);
					  tmpvar_4.y = stepy_2;
					  lowp vec4 tmpvar_5;
					  highp vec2 P_6;
					  P_6 = (center_3 + tmpvar_4);
					  tmpvar_5 = texture2D (_MainTex, P_6);
					  highp vec4 color_7;
					  color_7 = tmpvar_5;
					  highp float tmpvar_8;
					  tmpvar_8 = sqrt(((
					    (color_7.x * color_7.x)
					   + 
					    (color_7.y * color_7.y)
					  ) + (color_7.z * color_7.z)));
					  highp vec2 tmpvar_9;
					  tmpvar_9.y = 0.0;
					  tmpvar_9.x = -(stepx_1);
					  lowp vec4 tmpvar_10;
					  highp vec2 P_11;
					  P_11 = (center_3 + tmpvar_9);
					  tmpvar_10 = texture2D (_MainTex, P_11);
					  highp vec4 color_12;
					  color_12 = tmpvar_10;
					  highp vec2 tmpvar_13;
					  tmpvar_13.x = -(stepx_1);
					  tmpvar_13.y = -(stepy_2);
					  lowp vec4 tmpvar_14;
					  highp vec2 P_15;
					  P_15 = (center_3 + tmpvar_13);
					  tmpvar_14 = texture2D (_MainTex, P_15);
					  highp vec4 color_16;
					  color_16 = tmpvar_14;
					  highp float tmpvar_17;
					  tmpvar_17 = sqrt(((
					    (color_16.x * color_16.x)
					   + 
					    (color_16.y * color_16.y)
					  ) + (color_16.z * color_16.z)));
					  highp vec2 tmpvar_18;
					  tmpvar_18.x = 0.0;
					  tmpvar_18.y = stepy_2;
					  lowp vec4 tmpvar_19;
					  highp vec2 P_20;
					  P_20 = (center_3 + tmpvar_18);
					  tmpvar_19 = texture2D (_MainTex, P_20);
					  highp vec4 color_21;
					  color_21 = tmpvar_19;
					  highp vec2 tmpvar_22;
					  tmpvar_22.x = 0.0;
					  tmpvar_22.y = -(stepy_2);
					  lowp vec4 tmpvar_23;
					  highp vec2 P_24;
					  P_24 = (center_3 + tmpvar_22);
					  tmpvar_23 = texture2D (_MainTex, P_24);
					  highp vec4 color_25;
					  color_25 = tmpvar_23;
					  highp vec2 tmpvar_26;
					  tmpvar_26.x = stepx_1;
					  tmpvar_26.y = stepy_2;
					  lowp vec4 tmpvar_27;
					  highp vec2 P_28;
					  P_28 = (center_3 + tmpvar_26);
					  tmpvar_27 = texture2D (_MainTex, P_28);
					  highp vec4 color_29;
					  color_29 = tmpvar_27;
					  highp float tmpvar_30;
					  tmpvar_30 = sqrt(((
					    (color_29.x * color_29.x)
					   + 
					    (color_29.y * color_29.y)
					  ) + (color_29.z * color_29.z)));
					  highp vec2 tmpvar_31;
					  tmpvar_31.y = 0.0;
					  tmpvar_31.x = stepx_1;
					  lowp vec4 tmpvar_32;
					  highp vec2 P_33;
					  P_33 = (center_3 + tmpvar_31);
					  tmpvar_32 = texture2D (_MainTex, P_33);
					  highp vec4 color_34;
					  color_34 = tmpvar_32;
					  highp vec2 tmpvar_35;
					  tmpvar_35.x = stepx_1;
					  tmpvar_35.y = -(stepy_2);
					  lowp vec4 tmpvar_36;
					  highp vec2 P_37;
					  P_37 = (center_3 + tmpvar_35);
					  tmpvar_36 = texture2D (_MainTex, P_37);
					  highp vec4 color_38;
					  color_38 = tmpvar_36;
					  highp float tmpvar_39;
					  tmpvar_39 = sqrt(((
					    (color_38.x * color_38.x)
					   + 
					    (color_38.y * color_38.y)
					  ) + (color_38.z * color_38.z)));
					  highp float tmpvar_40;
					  tmpvar_40 = (((
					    ((tmpvar_8 + (2.0 * sqrt(
					      (((color_12.x * color_12.x) + (color_12.y * color_12.y)) + (color_12.z * color_12.z))
					    ))) + tmpvar_17)
					   - tmpvar_30) - (2.0 * 
					    sqrt((((color_34.x * color_34.x) + (color_34.y * color_34.y)) + (color_34.z * color_34.z)))
					  )) - tmpvar_39);
					  highp float tmpvar_41;
					  tmpvar_41 = (((
					    ((-(tmpvar_8) - (2.0 * sqrt(
					      (((color_21.x * color_21.x) + (color_21.y * color_21.y)) + (color_21.z * color_21.z))
					    ))) - tmpvar_30)
					   + tmpvar_17) + (2.0 * 
					    sqrt((((color_25.x * color_25.x) + (color_25.y * color_25.y)) + (color_25.z * color_25.z)))
					  )) + tmpvar_39);
					  highp float tmpvar_42;
					  tmpvar_42 = sqrt(((tmpvar_40 * tmpvar_40) + (tmpvar_41 * tmpvar_41)));
					  highp vec3 tmpvar_43;
					  tmpvar_43.x = tmpvar_42;
					  tmpvar_43.y = tmpvar_42;
					  tmpvar_43.z = tmpvar_42;
					  highp vec4 tmpvar_44;
					  tmpvar_44.w = 1.0;
					  tmpvar_44.xyz = tmpvar_43;
					  gl_FragData[0] = tmpvar_44;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp float stepx_1;
					  stepx_1 = (1.0/(_ScreenResolution.x));
					  highp float stepy_2;
					  stepy_2 = (1.0/(_ScreenResolution.y));
					  highp vec2 center_3;
					  center_3 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_4;
					  tmpvar_4.x = -(stepx_1);
					  tmpvar_4.y = stepy_2;
					  lowp vec4 tmpvar_5;
					  highp vec2 P_6;
					  P_6 = (center_3 + tmpvar_4);
					  tmpvar_5 = texture2D (_MainTex, P_6);
					  highp vec4 color_7;
					  color_7 = tmpvar_5;
					  highp float tmpvar_8;
					  tmpvar_8 = sqrt(((
					    (color_7.x * color_7.x)
					   + 
					    (color_7.y * color_7.y)
					  ) + (color_7.z * color_7.z)));
					  highp vec2 tmpvar_9;
					  tmpvar_9.y = 0.0;
					  tmpvar_9.x = -(stepx_1);
					  lowp vec4 tmpvar_10;
					  highp vec2 P_11;
					  P_11 = (center_3 + tmpvar_9);
					  tmpvar_10 = texture2D (_MainTex, P_11);
					  highp vec4 color_12;
					  color_12 = tmpvar_10;
					  highp vec2 tmpvar_13;
					  tmpvar_13.x = -(stepx_1);
					  tmpvar_13.y = -(stepy_2);
					  lowp vec4 tmpvar_14;
					  highp vec2 P_15;
					  P_15 = (center_3 + tmpvar_13);
					  tmpvar_14 = texture2D (_MainTex, P_15);
					  highp vec4 color_16;
					  color_16 = tmpvar_14;
					  highp float tmpvar_17;
					  tmpvar_17 = sqrt(((
					    (color_16.x * color_16.x)
					   + 
					    (color_16.y * color_16.y)
					  ) + (color_16.z * color_16.z)));
					  highp vec2 tmpvar_18;
					  tmpvar_18.x = 0.0;
					  tmpvar_18.y = stepy_2;
					  lowp vec4 tmpvar_19;
					  highp vec2 P_20;
					  P_20 = (center_3 + tmpvar_18);
					  tmpvar_19 = texture2D (_MainTex, P_20);
					  highp vec4 color_21;
					  color_21 = tmpvar_19;
					  highp vec2 tmpvar_22;
					  tmpvar_22.x = 0.0;
					  tmpvar_22.y = -(stepy_2);
					  lowp vec4 tmpvar_23;
					  highp vec2 P_24;
					  P_24 = (center_3 + tmpvar_22);
					  tmpvar_23 = texture2D (_MainTex, P_24);
					  highp vec4 color_25;
					  color_25 = tmpvar_23;
					  highp vec2 tmpvar_26;
					  tmpvar_26.x = stepx_1;
					  tmpvar_26.y = stepy_2;
					  lowp vec4 tmpvar_27;
					  highp vec2 P_28;
					  P_28 = (center_3 + tmpvar_26);
					  tmpvar_27 = texture2D (_MainTex, P_28);
					  highp vec4 color_29;
					  color_29 = tmpvar_27;
					  highp float tmpvar_30;
					  tmpvar_30 = sqrt(((
					    (color_29.x * color_29.x)
					   + 
					    (color_29.y * color_29.y)
					  ) + (color_29.z * color_29.z)));
					  highp vec2 tmpvar_31;
					  tmpvar_31.y = 0.0;
					  tmpvar_31.x = stepx_1;
					  lowp vec4 tmpvar_32;
					  highp vec2 P_33;
					  P_33 = (center_3 + tmpvar_31);
					  tmpvar_32 = texture2D (_MainTex, P_33);
					  highp vec4 color_34;
					  color_34 = tmpvar_32;
					  highp vec2 tmpvar_35;
					  tmpvar_35.x = stepx_1;
					  tmpvar_35.y = -(stepy_2);
					  lowp vec4 tmpvar_36;
					  highp vec2 P_37;
					  P_37 = (center_3 + tmpvar_35);
					  tmpvar_36 = texture2D (_MainTex, P_37);
					  highp vec4 color_38;
					  color_38 = tmpvar_36;
					  highp float tmpvar_39;
					  tmpvar_39 = sqrt(((
					    (color_38.x * color_38.x)
					   + 
					    (color_38.y * color_38.y)
					  ) + (color_38.z * color_38.z)));
					  highp float tmpvar_40;
					  tmpvar_40 = (((
					    ((tmpvar_8 + (2.0 * sqrt(
					      (((color_12.x * color_12.x) + (color_12.y * color_12.y)) + (color_12.z * color_12.z))
					    ))) + tmpvar_17)
					   - tmpvar_30) - (2.0 * 
					    sqrt((((color_34.x * color_34.x) + (color_34.y * color_34.y)) + (color_34.z * color_34.z)))
					  )) - tmpvar_39);
					  highp float tmpvar_41;
					  tmpvar_41 = (((
					    ((-(tmpvar_8) - (2.0 * sqrt(
					      (((color_21.x * color_21.x) + (color_21.y * color_21.y)) + (color_21.z * color_21.z))
					    ))) - tmpvar_30)
					   + tmpvar_17) + (2.0 * 
					    sqrt((((color_25.x * color_25.x) + (color_25.y * color_25.y)) + (color_25.z * color_25.z)))
					  )) + tmpvar_39);
					  highp float tmpvar_42;
					  tmpvar_42 = sqrt(((tmpvar_40 * tmpvar_40) + (tmpvar_41 * tmpvar_41)));
					  highp vec3 tmpvar_43;
					  tmpvar_43.x = tmpvar_42;
					  tmpvar_43.y = tmpvar_42;
					  tmpvar_43.z = tmpvar_42;
					  highp vec4 tmpvar_44;
					  tmpvar_44.w = 1.0;
					  tmpvar_44.xyz = tmpvar_43;
					  gl_FragData[0] = tmpvar_44;
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
					uniform 	vec4 _ScreenResolution;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump float u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					mediump float u_xlat16_1;
					lowp vec3 u_xlat10_1;
					vec4 u_xlat2;
					lowp vec3 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					lowp vec3 u_xlat10_4;
					float u_xlat5;
					mediump float u_xlat16_5;
					mediump float u_xlat16_6;
					lowp vec3 u_xlat10_6;
					vec2 u_xlat10;
					mediump float u_xlat16_10;
					mediump float u_xlat16_15;
					void main()
					{
					    u_xlat0.xy = vec2(1.0, 1.0) / _ScreenResolution.xy;
					    u_xlat0.z = (-u_xlat0.x);
					    u_xlat1 = u_xlat0.zyxy + vs_TEXCOORD0.xyxy;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat1.zw).xyz;
					    u_xlat16_10 = dot(u_xlat10_1.xyz, u_xlat10_1.xyz);
					    u_xlat16_10 = sqrt(u_xlat16_10);
					    u_xlat16_1 = dot(u_xlat10_2.xyz, u_xlat10_2.xyz);
					    u_xlat16_1 = sqrt(u_xlat16_1);
					    u_xlat0.w = 0.0;
					    u_xlat2 = u_xlat0.wyxw + vs_TEXCOORD0.xyxy;
					    u_xlat3 = u_xlat0.wyxy * vec4(1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat4.xyz = (-u_xlat0.xyx);
					    u_xlat10_0.xyw = texture(_MainTex, u_xlat2.xy).xyz;
					    u_xlat10_6.xyz = texture(_MainTex, u_xlat2.zw).xyz;
					    u_xlat16_6 = dot(u_xlat10_6.xyz, u_xlat10_6.xyz);
					    u_xlat16_6 = sqrt(u_xlat16_6);
					    u_xlat16_0 = dot(u_xlat10_0.xyw, u_xlat10_0.xyw);
					    u_xlat16_0 = sqrt(u_xlat16_0);
					    u_xlat16_0 = (-u_xlat16_0) * 2.0 + (-u_xlat16_1);
					    u_xlat0.x = (-u_xlat16_10) + u_xlat16_0;
					    u_xlat4.w = 0.0;
					    u_xlat2 = u_xlat4.zwxy + vs_TEXCOORD0.xyxy;
					    u_xlat10_4.xyz = texture(_MainTex, u_xlat2.zw).xyz;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat2.xy).xyz;
					    u_xlat16_5 = dot(u_xlat10_2.xyz, u_xlat10_2.xyz);
					    u_xlat16_5 = sqrt(u_xlat16_5);
					    u_xlat0.y = u_xlat16_5 * 2.0 + u_xlat16_1;
					    u_xlat16_15 = dot(u_xlat10_4.xyz, u_xlat10_4.xyz);
					    u_xlat16_15 = sqrt(u_xlat16_15);
					    u_xlat0.xy = vec2(u_xlat16_15) + u_xlat0.xy;
					    u_xlat5 = (-u_xlat16_10) + u_xlat0.y;
					    u_xlat5 = (-u_xlat16_6) * 2.0 + u_xlat5;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat3.xy).xyz;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat3.zw).xyz;
					    u_xlat10.x = dot(u_xlat10_2.xyz, u_xlat10_2.xyz);
					    u_xlat10.y = dot(u_xlat10_1.xyz, u_xlat10_1.xyz);
					    u_xlat10.xy = sqrt(u_xlat10.xy);
					    u_xlat0.x = u_xlat10.y * 2.0 + u_xlat0.x;
					    u_xlat0.x = u_xlat10.x + u_xlat0.x;
					    u_xlat5 = (-u_xlat10.x) + u_xlat5;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat5 * u_xlat5 + u_xlat0.x;
					    SV_Target0.xyz = sqrt(u_xlat0.xxx);
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
					uniform 	vec4 _ScreenResolution;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump float u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					mediump float u_xlat16_1;
					lowp vec3 u_xlat10_1;
					vec4 u_xlat2;
					lowp vec3 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					lowp vec3 u_xlat10_4;
					float u_xlat5;
					mediump float u_xlat16_5;
					mediump float u_xlat16_6;
					lowp vec3 u_xlat10_6;
					vec2 u_xlat10;
					mediump float u_xlat16_10;
					mediump float u_xlat16_15;
					void main()
					{
					    u_xlat0.xy = vec2(1.0, 1.0) / _ScreenResolution.xy;
					    u_xlat0.z = (-u_xlat0.x);
					    u_xlat1 = u_xlat0.zyxy + vs_TEXCOORD0.xyxy;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat1.zw).xyz;
					    u_xlat16_10 = dot(u_xlat10_1.xyz, u_xlat10_1.xyz);
					    u_xlat16_10 = sqrt(u_xlat16_10);
					    u_xlat16_1 = dot(u_xlat10_2.xyz, u_xlat10_2.xyz);
					    u_xlat16_1 = sqrt(u_xlat16_1);
					    u_xlat0.w = 0.0;
					    u_xlat2 = u_xlat0.wyxw + vs_TEXCOORD0.xyxy;
					    u_xlat3 = u_xlat0.wyxy * vec4(1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat4.xyz = (-u_xlat0.xyx);
					    u_xlat10_0.xyw = texture(_MainTex, u_xlat2.xy).xyz;
					    u_xlat10_6.xyz = texture(_MainTex, u_xlat2.zw).xyz;
					    u_xlat16_6 = dot(u_xlat10_6.xyz, u_xlat10_6.xyz);
					    u_xlat16_6 = sqrt(u_xlat16_6);
					    u_xlat16_0 = dot(u_xlat10_0.xyw, u_xlat10_0.xyw);
					    u_xlat16_0 = sqrt(u_xlat16_0);
					    u_xlat16_0 = (-u_xlat16_0) * 2.0 + (-u_xlat16_1);
					    u_xlat0.x = (-u_xlat16_10) + u_xlat16_0;
					    u_xlat4.w = 0.0;
					    u_xlat2 = u_xlat4.zwxy + vs_TEXCOORD0.xyxy;
					    u_xlat10_4.xyz = texture(_MainTex, u_xlat2.zw).xyz;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat2.xy).xyz;
					    u_xlat16_5 = dot(u_xlat10_2.xyz, u_xlat10_2.xyz);
					    u_xlat16_5 = sqrt(u_xlat16_5);
					    u_xlat0.y = u_xlat16_5 * 2.0 + u_xlat16_1;
					    u_xlat16_15 = dot(u_xlat10_4.xyz, u_xlat10_4.xyz);
					    u_xlat16_15 = sqrt(u_xlat16_15);
					    u_xlat0.xy = vec2(u_xlat16_15) + u_xlat0.xy;
					    u_xlat5 = (-u_xlat16_10) + u_xlat0.y;
					    u_xlat5 = (-u_xlat16_6) * 2.0 + u_xlat5;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat3.xy).xyz;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat3.zw).xyz;
					    u_xlat10.x = dot(u_xlat10_2.xyz, u_xlat10_2.xyz);
					    u_xlat10.y = dot(u_xlat10_1.xyz, u_xlat10_1.xyz);
					    u_xlat10.xy = sqrt(u_xlat10.xy);
					    u_xlat0.x = u_xlat10.y * 2.0 + u_xlat0.x;
					    u_xlat0.x = u_xlat10.x + u_xlat0.x;
					    u_xlat5 = (-u_xlat10.x) + u_xlat5;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat5 * u_xlat5 + u_xlat0.x;
					    SV_Target0.xyz = sqrt(u_xlat0.xxx);
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
					uniform 	vec4 _ScreenResolution;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump float u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					mediump float u_xlat16_1;
					lowp vec3 u_xlat10_1;
					vec4 u_xlat2;
					lowp vec3 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					lowp vec3 u_xlat10_4;
					float u_xlat5;
					mediump float u_xlat16_5;
					mediump float u_xlat16_6;
					lowp vec3 u_xlat10_6;
					vec2 u_xlat10;
					mediump float u_xlat16_10;
					mediump float u_xlat16_15;
					void main()
					{
					    u_xlat0.xy = vec2(1.0, 1.0) / _ScreenResolution.xy;
					    u_xlat0.z = (-u_xlat0.x);
					    u_xlat1 = u_xlat0.zyxy + vs_TEXCOORD0.xyxy;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat1.zw).xyz;
					    u_xlat16_10 = dot(u_xlat10_1.xyz, u_xlat10_1.xyz);
					    u_xlat16_10 = sqrt(u_xlat16_10);
					    u_xlat16_1 = dot(u_xlat10_2.xyz, u_xlat10_2.xyz);
					    u_xlat16_1 = sqrt(u_xlat16_1);
					    u_xlat0.w = 0.0;
					    u_xlat2 = u_xlat0.wyxw + vs_TEXCOORD0.xyxy;
					    u_xlat3 = u_xlat0.wyxy * vec4(1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat4.xyz = (-u_xlat0.xyx);
					    u_xlat10_0.xyw = texture(_MainTex, u_xlat2.xy).xyz;
					    u_xlat10_6.xyz = texture(_MainTex, u_xlat2.zw).xyz;
					    u_xlat16_6 = dot(u_xlat10_6.xyz, u_xlat10_6.xyz);
					    u_xlat16_6 = sqrt(u_xlat16_6);
					    u_xlat16_0 = dot(u_xlat10_0.xyw, u_xlat10_0.xyw);
					    u_xlat16_0 = sqrt(u_xlat16_0);
					    u_xlat16_0 = (-u_xlat16_0) * 2.0 + (-u_xlat16_1);
					    u_xlat0.x = (-u_xlat16_10) + u_xlat16_0;
					    u_xlat4.w = 0.0;
					    u_xlat2 = u_xlat4.zwxy + vs_TEXCOORD0.xyxy;
					    u_xlat10_4.xyz = texture(_MainTex, u_xlat2.zw).xyz;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat2.xy).xyz;
					    u_xlat16_5 = dot(u_xlat10_2.xyz, u_xlat10_2.xyz);
					    u_xlat16_5 = sqrt(u_xlat16_5);
					    u_xlat0.y = u_xlat16_5 * 2.0 + u_xlat16_1;
					    u_xlat16_15 = dot(u_xlat10_4.xyz, u_xlat10_4.xyz);
					    u_xlat16_15 = sqrt(u_xlat16_15);
					    u_xlat0.xy = vec2(u_xlat16_15) + u_xlat0.xy;
					    u_xlat5 = (-u_xlat16_10) + u_xlat0.y;
					    u_xlat5 = (-u_xlat16_6) * 2.0 + u_xlat5;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat3.xy).xyz;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat3.zw).xyz;
					    u_xlat10.x = dot(u_xlat10_2.xyz, u_xlat10_2.xyz);
					    u_xlat10.y = dot(u_xlat10_1.xyz, u_xlat10_1.xyz);
					    u_xlat10.xy = sqrt(u_xlat10.xy);
					    u_xlat0.x = u_xlat10.y * 2.0 + u_xlat0.x;
					    u_xlat0.x = u_xlat10.x + u_xlat0.x;
					    u_xlat5 = (-u_xlat10.x) + u_xlat5;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat5 * u_xlat5 + u_xlat0.x;
					    SV_Target0.xyz = sqrt(u_xlat0.xxx);
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