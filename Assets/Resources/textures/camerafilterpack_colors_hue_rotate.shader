Shader "CameraFilterPack/Colors_HUE_Rotate" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_Speed ("_Speed", Range(0, 20)) = 10
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 1287
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
					uniform highp float _Speed;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 truepixel_2;
					  lowp vec4 pixel_3;
					  highp mat4 hueRotation_4;
					  highp float tmpvar_5;
					  tmpvar_5 = (_TimeX * _Speed);
					  hueRotation_4 = ((mat4(0.299, 0.299, 0.299, 0.0, 0.587, 0.587, 0.587, 0.0, 0.114, 0.114, 0.114, 0.0, 0.0, 0.0, 0.0, 1.0) + (mat4(0.701, -0.299, -0.3, 0.0, -0.587, 0.413, -0.588, 0.0, -0.114, -0.114, 0.886, 0.0, 0.0, 0.0, 0.0, 0.0) * 
					    cos(tmpvar_5)
					  )) + (mat4(0.168, -0.328, 1.25, 0.0, 0.33, 0.035, -1.05, 0.0, -0.497, 0.292, -0.203, 0.0, 0.0, 0.0, 0.0, 0.0) * sin(tmpvar_5)));
					  pixel_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  highp vec4 tmpvar_6;
					  tmpvar_6.yzw = vec3(0.0, 0.0, 0.0);
					  tmpvar_6.x = (pixel_3.x * hueRotation_4[0].x);
					  truepixel_2 = tmpvar_6;
					  lowp vec4 tmpvar_7;
					  tmpvar_7.yzw = truepixel_2.yzw;
					  tmpvar_7.x = (truepixel_2.x + (pixel_3.y * hueRotation_4[1].x));
					  lowp vec4 tmpvar_8;
					  tmpvar_8.yzw = tmpvar_7.yzw;
					  tmpvar_8.x = (tmpvar_7.x + (pixel_3.z * hueRotation_4[2].x));
					  lowp vec4 tmpvar_9;
					  tmpvar_9.yzw = tmpvar_8.yzw;
					  tmpvar_9.x = (tmpvar_8.x + (pixel_3.w * hueRotation_4[3].x));
					  lowp vec4 tmpvar_10;
					  tmpvar_10.xzw = tmpvar_9.xzw;
					  tmpvar_10.y = (truepixel_2.y + (pixel_3.x * hueRotation_4[0].y));
					  lowp vec4 tmpvar_11;
					  tmpvar_11.xzw = tmpvar_10.xzw;
					  tmpvar_11.y = (tmpvar_10.y + (pixel_3.y * hueRotation_4[1].y));
					  lowp vec4 tmpvar_12;
					  tmpvar_12.xzw = tmpvar_11.xzw;
					  tmpvar_12.y = (tmpvar_11.y + (pixel_3.z * hueRotation_4[2].y));
					  lowp vec4 tmpvar_13;
					  tmpvar_13.xzw = tmpvar_12.xzw;
					  tmpvar_13.y = (tmpvar_12.y + (pixel_3.w * hueRotation_4[3].y));
					  lowp vec4 tmpvar_14;
					  tmpvar_14.xyw = tmpvar_13.xyw;
					  tmpvar_14.z = (truepixel_2.z + (pixel_3.x * hueRotation_4[0].z));
					  lowp vec4 tmpvar_15;
					  tmpvar_15.xyw = tmpvar_14.xyw;
					  tmpvar_15.z = (tmpvar_14.z + (pixel_3.y * hueRotation_4[1].z));
					  lowp vec4 tmpvar_16;
					  tmpvar_16.xyw = tmpvar_15.xyw;
					  tmpvar_16.z = (tmpvar_15.z + (pixel_3.z * hueRotation_4[2].z));
					  lowp vec4 tmpvar_17;
					  tmpvar_17.xyw = tmpvar_16.xyw;
					  tmpvar_17.z = (tmpvar_16.z + (pixel_3.w * hueRotation_4[3].z));
					  lowp vec4 tmpvar_18;
					  tmpvar_18.xyz = tmpvar_17.xyz;
					  tmpvar_18.w = (truepixel_2.w + (pixel_3.x * hueRotation_4[0].w));
					  lowp vec4 tmpvar_19;
					  tmpvar_19.xyz = tmpvar_18.xyz;
					  tmpvar_19.w = (tmpvar_18.w + (pixel_3.y * hueRotation_4[1].w));
					  lowp vec4 tmpvar_20;
					  tmpvar_20.xyz = tmpvar_19.xyz;
					  tmpvar_20.w = (tmpvar_19.w + (pixel_3.z * hueRotation_4[2].w));
					  lowp vec4 tmpvar_21;
					  tmpvar_21.xyz = tmpvar_20.xyz;
					  tmpvar_21.w = (tmpvar_20.w + (pixel_3.w * hueRotation_4[3].w));
					  truepixel_2 = tmpvar_21;
					  tmpvar_1 = tmpvar_21;
					  gl_FragData[0] = tmpvar_1;
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
					uniform highp float _Speed;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 truepixel_2;
					  lowp vec4 pixel_3;
					  highp mat4 hueRotation_4;
					  highp float tmpvar_5;
					  tmpvar_5 = (_TimeX * _Speed);
					  hueRotation_4 = ((mat4(0.299, 0.299, 0.299, 0.0, 0.587, 0.587, 0.587, 0.0, 0.114, 0.114, 0.114, 0.0, 0.0, 0.0, 0.0, 1.0) + (mat4(0.701, -0.299, -0.3, 0.0, -0.587, 0.413, -0.588, 0.0, -0.114, -0.114, 0.886, 0.0, 0.0, 0.0, 0.0, 0.0) * 
					    cos(tmpvar_5)
					  )) + (mat4(0.168, -0.328, 1.25, 0.0, 0.33, 0.035, -1.05, 0.0, -0.497, 0.292, -0.203, 0.0, 0.0, 0.0, 0.0, 0.0) * sin(tmpvar_5)));
					  pixel_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  highp vec4 tmpvar_6;
					  tmpvar_6.yzw = vec3(0.0, 0.0, 0.0);
					  tmpvar_6.x = (pixel_3.x * hueRotation_4[0].x);
					  truepixel_2 = tmpvar_6;
					  lowp vec4 tmpvar_7;
					  tmpvar_7.yzw = truepixel_2.yzw;
					  tmpvar_7.x = (truepixel_2.x + (pixel_3.y * hueRotation_4[1].x));
					  lowp vec4 tmpvar_8;
					  tmpvar_8.yzw = tmpvar_7.yzw;
					  tmpvar_8.x = (tmpvar_7.x + (pixel_3.z * hueRotation_4[2].x));
					  lowp vec4 tmpvar_9;
					  tmpvar_9.yzw = tmpvar_8.yzw;
					  tmpvar_9.x = (tmpvar_8.x + (pixel_3.w * hueRotation_4[3].x));
					  lowp vec4 tmpvar_10;
					  tmpvar_10.xzw = tmpvar_9.xzw;
					  tmpvar_10.y = (truepixel_2.y + (pixel_3.x * hueRotation_4[0].y));
					  lowp vec4 tmpvar_11;
					  tmpvar_11.xzw = tmpvar_10.xzw;
					  tmpvar_11.y = (tmpvar_10.y + (pixel_3.y * hueRotation_4[1].y));
					  lowp vec4 tmpvar_12;
					  tmpvar_12.xzw = tmpvar_11.xzw;
					  tmpvar_12.y = (tmpvar_11.y + (pixel_3.z * hueRotation_4[2].y));
					  lowp vec4 tmpvar_13;
					  tmpvar_13.xzw = tmpvar_12.xzw;
					  tmpvar_13.y = (tmpvar_12.y + (pixel_3.w * hueRotation_4[3].y));
					  lowp vec4 tmpvar_14;
					  tmpvar_14.xyw = tmpvar_13.xyw;
					  tmpvar_14.z = (truepixel_2.z + (pixel_3.x * hueRotation_4[0].z));
					  lowp vec4 tmpvar_15;
					  tmpvar_15.xyw = tmpvar_14.xyw;
					  tmpvar_15.z = (tmpvar_14.z + (pixel_3.y * hueRotation_4[1].z));
					  lowp vec4 tmpvar_16;
					  tmpvar_16.xyw = tmpvar_15.xyw;
					  tmpvar_16.z = (tmpvar_15.z + (pixel_3.z * hueRotation_4[2].z));
					  lowp vec4 tmpvar_17;
					  tmpvar_17.xyw = tmpvar_16.xyw;
					  tmpvar_17.z = (tmpvar_16.z + (pixel_3.w * hueRotation_4[3].z));
					  lowp vec4 tmpvar_18;
					  tmpvar_18.xyz = tmpvar_17.xyz;
					  tmpvar_18.w = (truepixel_2.w + (pixel_3.x * hueRotation_4[0].w));
					  lowp vec4 tmpvar_19;
					  tmpvar_19.xyz = tmpvar_18.xyz;
					  tmpvar_19.w = (tmpvar_18.w + (pixel_3.y * hueRotation_4[1].w));
					  lowp vec4 tmpvar_20;
					  tmpvar_20.xyz = tmpvar_19.xyz;
					  tmpvar_20.w = (tmpvar_19.w + (pixel_3.z * hueRotation_4[2].w));
					  lowp vec4 tmpvar_21;
					  tmpvar_21.xyz = tmpvar_20.xyz;
					  tmpvar_21.w = (tmpvar_20.w + (pixel_3.w * hueRotation_4[3].w));
					  truepixel_2 = tmpvar_21;
					  tmpvar_1 = tmpvar_21;
					  gl_FragData[0] = tmpvar_1;
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
					uniform highp float _Speed;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 truepixel_2;
					  lowp vec4 pixel_3;
					  highp mat4 hueRotation_4;
					  highp float tmpvar_5;
					  tmpvar_5 = (_TimeX * _Speed);
					  hueRotation_4 = ((mat4(0.299, 0.299, 0.299, 0.0, 0.587, 0.587, 0.587, 0.0, 0.114, 0.114, 0.114, 0.0, 0.0, 0.0, 0.0, 1.0) + (mat4(0.701, -0.299, -0.3, 0.0, -0.587, 0.413, -0.588, 0.0, -0.114, -0.114, 0.886, 0.0, 0.0, 0.0, 0.0, 0.0) * 
					    cos(tmpvar_5)
					  )) + (mat4(0.168, -0.328, 1.25, 0.0, 0.33, 0.035, -1.05, 0.0, -0.497, 0.292, -0.203, 0.0, 0.0, 0.0, 0.0, 0.0) * sin(tmpvar_5)));
					  pixel_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  highp vec4 tmpvar_6;
					  tmpvar_6.yzw = vec3(0.0, 0.0, 0.0);
					  tmpvar_6.x = (pixel_3.x * hueRotation_4[0].x);
					  truepixel_2 = tmpvar_6;
					  lowp vec4 tmpvar_7;
					  tmpvar_7.yzw = truepixel_2.yzw;
					  tmpvar_7.x = (truepixel_2.x + (pixel_3.y * hueRotation_4[1].x));
					  lowp vec4 tmpvar_8;
					  tmpvar_8.yzw = tmpvar_7.yzw;
					  tmpvar_8.x = (tmpvar_7.x + (pixel_3.z * hueRotation_4[2].x));
					  lowp vec4 tmpvar_9;
					  tmpvar_9.yzw = tmpvar_8.yzw;
					  tmpvar_9.x = (tmpvar_8.x + (pixel_3.w * hueRotation_4[3].x));
					  lowp vec4 tmpvar_10;
					  tmpvar_10.xzw = tmpvar_9.xzw;
					  tmpvar_10.y = (truepixel_2.y + (pixel_3.x * hueRotation_4[0].y));
					  lowp vec4 tmpvar_11;
					  tmpvar_11.xzw = tmpvar_10.xzw;
					  tmpvar_11.y = (tmpvar_10.y + (pixel_3.y * hueRotation_4[1].y));
					  lowp vec4 tmpvar_12;
					  tmpvar_12.xzw = tmpvar_11.xzw;
					  tmpvar_12.y = (tmpvar_11.y + (pixel_3.z * hueRotation_4[2].y));
					  lowp vec4 tmpvar_13;
					  tmpvar_13.xzw = tmpvar_12.xzw;
					  tmpvar_13.y = (tmpvar_12.y + (pixel_3.w * hueRotation_4[3].y));
					  lowp vec4 tmpvar_14;
					  tmpvar_14.xyw = tmpvar_13.xyw;
					  tmpvar_14.z = (truepixel_2.z + (pixel_3.x * hueRotation_4[0].z));
					  lowp vec4 tmpvar_15;
					  tmpvar_15.xyw = tmpvar_14.xyw;
					  tmpvar_15.z = (tmpvar_14.z + (pixel_3.y * hueRotation_4[1].z));
					  lowp vec4 tmpvar_16;
					  tmpvar_16.xyw = tmpvar_15.xyw;
					  tmpvar_16.z = (tmpvar_15.z + (pixel_3.z * hueRotation_4[2].z));
					  lowp vec4 tmpvar_17;
					  tmpvar_17.xyw = tmpvar_16.xyw;
					  tmpvar_17.z = (tmpvar_16.z + (pixel_3.w * hueRotation_4[3].z));
					  lowp vec4 tmpvar_18;
					  tmpvar_18.xyz = tmpvar_17.xyz;
					  tmpvar_18.w = (truepixel_2.w + (pixel_3.x * hueRotation_4[0].w));
					  lowp vec4 tmpvar_19;
					  tmpvar_19.xyz = tmpvar_18.xyz;
					  tmpvar_19.w = (tmpvar_18.w + (pixel_3.y * hueRotation_4[1].w));
					  lowp vec4 tmpvar_20;
					  tmpvar_20.xyz = tmpvar_19.xyz;
					  tmpvar_20.w = (tmpvar_19.w + (pixel_3.z * hueRotation_4[2].w));
					  lowp vec4 tmpvar_21;
					  tmpvar_21.xyz = tmpvar_20.xyz;
					  tmpvar_21.w = (tmpvar_20.w + (pixel_3.w * hueRotation_4[3].w));
					  truepixel_2 = tmpvar_21;
					  tmpvar_1 = tmpvar_21;
					  gl_FragData[0] = tmpvar_1;
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
					uniform 	float _Speed;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					float u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					lowp vec4 u_xlat10_4;
					float u_xlat5;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = _TimeX * _Speed;
					    u_xlat1 = cos(u_xlat0);
					    u_xlat0 = sin(u_xlat0);
					    u_xlat2 = vec4(u_xlat1) * vec4(0.700999975, -0.587000012, -0.114, -0.298999995) + vec4(0.298999995, 0.587000012, 0.114, 0.298999995);
					    u_xlat2 = vec4(u_xlat0) * vec4(0.167999998, 0.330000013, -0.497000009, -0.328000009) + u_xlat2;
					    u_xlat3 = vec4(u_xlat1) * vec4(0.412999988, -0.114, -0.300000012, -0.588) + vec4(0.587000012, 0.114, 0.298999995, 0.587000012);
					    u_xlat3 = vec4(u_xlat0) * vec4(0.0350000001, 0.291999996, 1.25, -1.04999995) + u_xlat3;
					    u_xlat10_4 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat5 = u_xlat3.x * u_xlat10_4.y;
					    u_xlat5 = u_xlat10_4.x * u_xlat2.w + u_xlat5;
					    SV_Target0.x = dot(u_xlat10_4.xyz, u_xlat2.xyz);
					    SV_Target0.y = u_xlat10_4.z * u_xlat3.y + u_xlat5;
					    u_xlat5 = dot(u_xlat10_4.xy, u_xlat3.zw);
					    u_xlat10 = u_xlat1 * 0.885999978 + 0.114;
					    u_xlat0 = u_xlat0 * -0.202999994 + u_xlat10;
					    SV_Target0.z = u_xlat10_4.z * u_xlat0 + u_xlat5;
					    SV_Target0.w = u_xlat10_4.w;
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
					uniform 	float _Speed;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					float u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					lowp vec4 u_xlat10_4;
					float u_xlat5;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = _TimeX * _Speed;
					    u_xlat1 = cos(u_xlat0);
					    u_xlat0 = sin(u_xlat0);
					    u_xlat2 = vec4(u_xlat1) * vec4(0.700999975, -0.587000012, -0.114, -0.298999995) + vec4(0.298999995, 0.587000012, 0.114, 0.298999995);
					    u_xlat2 = vec4(u_xlat0) * vec4(0.167999998, 0.330000013, -0.497000009, -0.328000009) + u_xlat2;
					    u_xlat3 = vec4(u_xlat1) * vec4(0.412999988, -0.114, -0.300000012, -0.588) + vec4(0.587000012, 0.114, 0.298999995, 0.587000012);
					    u_xlat3 = vec4(u_xlat0) * vec4(0.0350000001, 0.291999996, 1.25, -1.04999995) + u_xlat3;
					    u_xlat10_4 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat5 = u_xlat3.x * u_xlat10_4.y;
					    u_xlat5 = u_xlat10_4.x * u_xlat2.w + u_xlat5;
					    SV_Target0.x = dot(u_xlat10_4.xyz, u_xlat2.xyz);
					    SV_Target0.y = u_xlat10_4.z * u_xlat3.y + u_xlat5;
					    u_xlat5 = dot(u_xlat10_4.xy, u_xlat3.zw);
					    u_xlat10 = u_xlat1 * 0.885999978 + 0.114;
					    u_xlat0 = u_xlat0 * -0.202999994 + u_xlat10;
					    SV_Target0.z = u_xlat10_4.z * u_xlat0 + u_xlat5;
					    SV_Target0.w = u_xlat10_4.w;
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
					uniform 	float _Speed;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					float u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					lowp vec4 u_xlat10_4;
					float u_xlat5;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = _TimeX * _Speed;
					    u_xlat1 = cos(u_xlat0);
					    u_xlat0 = sin(u_xlat0);
					    u_xlat2 = vec4(u_xlat1) * vec4(0.700999975, -0.587000012, -0.114, -0.298999995) + vec4(0.298999995, 0.587000012, 0.114, 0.298999995);
					    u_xlat2 = vec4(u_xlat0) * vec4(0.167999998, 0.330000013, -0.497000009, -0.328000009) + u_xlat2;
					    u_xlat3 = vec4(u_xlat1) * vec4(0.412999988, -0.114, -0.300000012, -0.588) + vec4(0.587000012, 0.114, 0.298999995, 0.587000012);
					    u_xlat3 = vec4(u_xlat0) * vec4(0.0350000001, 0.291999996, 1.25, -1.04999995) + u_xlat3;
					    u_xlat10_4 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat5 = u_xlat3.x * u_xlat10_4.y;
					    u_xlat5 = u_xlat10_4.x * u_xlat2.w + u_xlat5;
					    SV_Target0.x = dot(u_xlat10_4.xyz, u_xlat2.xyz);
					    SV_Target0.y = u_xlat10_4.z * u_xlat3.y + u_xlat5;
					    u_xlat5 = dot(u_xlat10_4.xy, u_xlat3.zw);
					    u_xlat10 = u_xlat1 * 0.885999978 + 0.114;
					    u_xlat0 = u_xlat0 * -0.202999994 + u_xlat10;
					    SV_Target0.z = u_xlat10_4.z * u_xlat0 + u_xlat5;
					    SV_Target0.w = u_xlat10_4.w;
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