Shader "T4MShaders/ShaderModel2/Specular/T4M 3 Textures Spec" {
	Properties {
		_SpecColor ("Specular Color", Vector) = (1,1,1,1)
		_ShininessL0 ("Layer1Shininess", Range(0.03, 1)) = 0.078125
		_Splat0 ("Layer 1", 2D) = "white" {}
		_ShininessL1 ("Layer2Shininess", Range(0.03, 1)) = 0.078125
		_Splat1 ("Layer 2", 2D) = "white" {}
		_ShininessL2 ("Layer3Shininess", Range(0.03, 1)) = 0.078125
		_Splat2 ("Layer 3", 2D) = "white" {}
		_Control ("Control (RGBA)", 2D) = "" {}
		_MainTex ("Never Used", 2D) = "" {}
	}
	SubShader {
		Tags { "RenderType" = "Opaque" "SplatCount" = "3" }
		Pass {
			Name "FORWARD"
			Tags { "LIGHTMODE" = "ForwardBase" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" "SplatCount" = "3" }
			ZClip Off
			GpuProgramID 59401
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					void main ()
					{
					  highp vec3 shlight_1;
					  lowp vec3 worldNormal_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  mediump vec3 tmpvar_5;
					  lowp vec3 tmpvar_6;
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = _glesVertex.xyz;
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
					  worldNormal_2 = tmpvar_9;
					  tmpvar_5 = worldNormal_2;
					  lowp vec4 tmpvar_10;
					  tmpvar_10.w = 1.0;
					  tmpvar_10.xyz = worldNormal_2;
					  mediump vec4 normal_11;
					  normal_11 = tmpvar_10;
					  mediump vec3 res_12;
					  mediump vec3 x_13;
					  x_13.x = dot (unity_SHAr, normal_11);
					  x_13.y = dot (unity_SHAg, normal_11);
					  x_13.z = dot (unity_SHAb, normal_11);
					  mediump vec3 x1_14;
					  mediump vec4 tmpvar_15;
					  tmpvar_15 = (normal_11.xyzz * normal_11.yzzx);
					  x1_14.x = dot (unity_SHBr, tmpvar_15);
					  x1_14.y = dot (unity_SHBg, tmpvar_15);
					  x1_14.z = dot (unity_SHBb, tmpvar_15);
					  res_12 = (x_13 + (x1_14 + (unity_SHC.xyz * 
					    ((normal_11.x * normal_11.x) - (normal_11.y * normal_11.y))
					  )));
					  mediump vec3 tmpvar_16;
					  tmpvar_16 = max (((1.055 * 
					    pow (max (res_12, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  res_12 = tmpvar_16;
					  shlight_1 = tmpvar_16;
					  tmpvar_6 = shlight_1;
					  gl_Position = (glstate_matrix_mvp * tmpvar_7);
					  xlv_TEXCOORD0 = tmpvar_3;
					  xlv_TEXCOORD1 = tmpvar_4;
					  xlv_TEXCOORD2 = tmpvar_5;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  xlv_TEXCOORD4 = tmpvar_6;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = _WorldSpaceLightPos0.xyz;
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  lowp vec3 tmpvar_7;
					  mediump float tmpvar_8;
					  lowp float tmpvar_9;
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_7 = (((tmpvar_11 * tmpvar_10.x) + (tmpvar_12 * tmpvar_10.y)) + (tmpvar_13 * tmpvar_10.z)).xyz;
					  tmpvar_9 = (((tmpvar_11.w * tmpvar_10.x) + (tmpvar_12.w * tmpvar_10.y)) + (tmpvar_13.w * tmpvar_10.z));
					  tmpvar_8 = (((_ShininessL0 * tmpvar_10.x) + (_ShininessL1 * tmpvar_10.y)) + (_ShininessL2 * tmpvar_10.z));
					  c_1.w = 0.0;
					  c_1.xyz = (tmpvar_7 * xlv_TEXCOORD4);
					  lowp vec4 c_14;
					  lowp float spec_15;
					  lowp float tmpvar_16;
					  tmpvar_16 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_17;
					  tmpvar_17 = (pow (tmpvar_16, (tmpvar_8 * 128.0)) * tmpvar_9);
					  spec_15 = tmpvar_17;
					  c_14.xyz = (((
					    (tmpvar_7 * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_15)) * 2.0);
					  c_14.w = 0.0;
					  c_1.xyz = (c_1 + c_14).xyz;
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					void main ()
					{
					  highp vec3 shlight_1;
					  lowp vec3 worldNormal_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  mediump vec3 tmpvar_5;
					  lowp vec3 tmpvar_6;
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = _glesVertex.xyz;
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
					  worldNormal_2 = tmpvar_9;
					  tmpvar_5 = worldNormal_2;
					  lowp vec4 tmpvar_10;
					  tmpvar_10.w = 1.0;
					  tmpvar_10.xyz = worldNormal_2;
					  mediump vec4 normal_11;
					  normal_11 = tmpvar_10;
					  mediump vec3 res_12;
					  mediump vec3 x_13;
					  x_13.x = dot (unity_SHAr, normal_11);
					  x_13.y = dot (unity_SHAg, normal_11);
					  x_13.z = dot (unity_SHAb, normal_11);
					  mediump vec3 x1_14;
					  mediump vec4 tmpvar_15;
					  tmpvar_15 = (normal_11.xyzz * normal_11.yzzx);
					  x1_14.x = dot (unity_SHBr, tmpvar_15);
					  x1_14.y = dot (unity_SHBg, tmpvar_15);
					  x1_14.z = dot (unity_SHBb, tmpvar_15);
					  res_12 = (x_13 + (x1_14 + (unity_SHC.xyz * 
					    ((normal_11.x * normal_11.x) - (normal_11.y * normal_11.y))
					  )));
					  mediump vec3 tmpvar_16;
					  tmpvar_16 = max (((1.055 * 
					    pow (max (res_12, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  res_12 = tmpvar_16;
					  shlight_1 = tmpvar_16;
					  tmpvar_6 = shlight_1;
					  gl_Position = (glstate_matrix_mvp * tmpvar_7);
					  xlv_TEXCOORD0 = tmpvar_3;
					  xlv_TEXCOORD1 = tmpvar_4;
					  xlv_TEXCOORD2 = tmpvar_5;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  xlv_TEXCOORD4 = tmpvar_6;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = _WorldSpaceLightPos0.xyz;
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  lowp vec3 tmpvar_7;
					  mediump float tmpvar_8;
					  lowp float tmpvar_9;
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_7 = (((tmpvar_11 * tmpvar_10.x) + (tmpvar_12 * tmpvar_10.y)) + (tmpvar_13 * tmpvar_10.z)).xyz;
					  tmpvar_9 = (((tmpvar_11.w * tmpvar_10.x) + (tmpvar_12.w * tmpvar_10.y)) + (tmpvar_13.w * tmpvar_10.z));
					  tmpvar_8 = (((_ShininessL0 * tmpvar_10.x) + (_ShininessL1 * tmpvar_10.y)) + (_ShininessL2 * tmpvar_10.z));
					  c_1.w = 0.0;
					  c_1.xyz = (tmpvar_7 * xlv_TEXCOORD4);
					  lowp vec4 c_14;
					  lowp float spec_15;
					  lowp float tmpvar_16;
					  tmpvar_16 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_17;
					  tmpvar_17 = (pow (tmpvar_16, (tmpvar_8 * 128.0)) * tmpvar_9);
					  spec_15 = tmpvar_17;
					  c_14.xyz = (((
					    (tmpvar_7 * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_15)) * 2.0);
					  c_14.w = 0.0;
					  c_1.xyz = (c_1 + c_14).xyz;
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					void main ()
					{
					  highp vec3 shlight_1;
					  lowp vec3 worldNormal_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  mediump vec3 tmpvar_5;
					  lowp vec3 tmpvar_6;
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = _glesVertex.xyz;
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
					  worldNormal_2 = tmpvar_9;
					  tmpvar_5 = worldNormal_2;
					  lowp vec4 tmpvar_10;
					  tmpvar_10.w = 1.0;
					  tmpvar_10.xyz = worldNormal_2;
					  mediump vec4 normal_11;
					  normal_11 = tmpvar_10;
					  mediump vec3 res_12;
					  mediump vec3 x_13;
					  x_13.x = dot (unity_SHAr, normal_11);
					  x_13.y = dot (unity_SHAg, normal_11);
					  x_13.z = dot (unity_SHAb, normal_11);
					  mediump vec3 x1_14;
					  mediump vec4 tmpvar_15;
					  tmpvar_15 = (normal_11.xyzz * normal_11.yzzx);
					  x1_14.x = dot (unity_SHBr, tmpvar_15);
					  x1_14.y = dot (unity_SHBg, tmpvar_15);
					  x1_14.z = dot (unity_SHBb, tmpvar_15);
					  res_12 = (x_13 + (x1_14 + (unity_SHC.xyz * 
					    ((normal_11.x * normal_11.x) - (normal_11.y * normal_11.y))
					  )));
					  mediump vec3 tmpvar_16;
					  tmpvar_16 = max (((1.055 * 
					    pow (max (res_12, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  res_12 = tmpvar_16;
					  shlight_1 = tmpvar_16;
					  tmpvar_6 = shlight_1;
					  gl_Position = (glstate_matrix_mvp * tmpvar_7);
					  xlv_TEXCOORD0 = tmpvar_3;
					  xlv_TEXCOORD1 = tmpvar_4;
					  xlv_TEXCOORD2 = tmpvar_5;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  xlv_TEXCOORD4 = tmpvar_6;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = _WorldSpaceLightPos0.xyz;
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  lowp vec3 tmpvar_7;
					  mediump float tmpvar_8;
					  lowp float tmpvar_9;
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_7 = (((tmpvar_11 * tmpvar_10.x) + (tmpvar_12 * tmpvar_10.y)) + (tmpvar_13 * tmpvar_10.z)).xyz;
					  tmpvar_9 = (((tmpvar_11.w * tmpvar_10.x) + (tmpvar_12.w * tmpvar_10.y)) + (tmpvar_13.w * tmpvar_10.z));
					  tmpvar_8 = (((_ShininessL0 * tmpvar_10.x) + (_ShininessL1 * tmpvar_10.y)) + (_ShininessL2 * tmpvar_10.z));
					  c_1.w = 0.0;
					  c_1.xyz = (tmpvar_7 * xlv_TEXCOORD4);
					  lowp vec4 c_14;
					  lowp float spec_15;
					  lowp float tmpvar_16;
					  tmpvar_16 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_17;
					  tmpvar_17 = (pow (tmpvar_16, (tmpvar_8 * 128.0)) * tmpvar_9);
					  spec_15 = tmpvar_17;
					  c_14.xyz = (((
					    (tmpvar_7 * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_15)) * 2.0);
					  c_14.w = 0.0;
					  c_1.xyz = (c_1 + c_14).xyz;
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					out lowp vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec3 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD4.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					in lowp vec3 vs_TEXCOORD4;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					mediump float u_xlat16_8;
					float u_xlat18;
					lowp float u_xlat10_22;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_8 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_8;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat10_22 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat10_22 = max(u_xlat10_22, 0.0);
					    u_xlat10_5.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_4.xyz = u_xlat10_5.xyz * vec3(u_xlat10_22) + u_xlat10_4.xyz;
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0);
					    SV_Target0.xyz = u_xlat10_0.xyz * vs_TEXCOORD4.xyz + u_xlat10_4.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					out lowp vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec3 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD4.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					in lowp vec3 vs_TEXCOORD4;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					mediump float u_xlat16_8;
					float u_xlat18;
					lowp float u_xlat10_22;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_8 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_8;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat10_22 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat10_22 = max(u_xlat10_22, 0.0);
					    u_xlat10_5.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_4.xyz = u_xlat10_5.xyz * vec3(u_xlat10_22) + u_xlat10_4.xyz;
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0);
					    SV_Target0.xyz = u_xlat10_0.xyz * vs_TEXCOORD4.xyz + u_xlat10_4.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					out lowp vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec3 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD4.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					in lowp vec3 vs_TEXCOORD4;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					mediump float u_xlat16_8;
					float u_xlat18;
					lowp float u_xlat10_22;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_8 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_8;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat10_22 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat10_22 = max(u_xlat10_22, 0.0);
					    u_xlat10_5.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_4.xyz = u_xlat10_5.xyz * vec3(u_xlat10_22) + u_xlat10_4.xyz;
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0);
					    SV_Target0.xyz = u_xlat10_0.xyz * vs_TEXCOORD4.xyz + u_xlat10_4.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp vec4 xlv_TEXCOORD4;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = _glesVertex.xyz;
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_7;
					  tmpvar_7[0] = unity_WorldToObject[0].xyz;
					  tmpvar_7[1] = unity_WorldToObject[1].xyz;
					  tmpvar_7[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_8;
					  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
					  worldNormal_1 = tmpvar_8;
					  tmpvar_4 = worldNormal_1;
					  tmpvar_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  gl_Position = (glstate_matrix_mvp * tmpvar_6);
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  xlv_TEXCOORD4 = tmpvar_5;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D unity_Lightmap;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec4 xlv_TEXCOORD4;
					void main ()
					{
					  lowp vec3 lm_1;
					  lowp vec4 c_2;
					  lowp vec3 tmpvar_3;
					  tmpvar_3 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = (2.0 * tmpvar_4.xyz);
					  lm_1 = tmpvar_5;
					  c_2.xyz = (((
					    (texture2D (_Splat0, xlv_TEXCOORD0.zw) * tmpvar_3.x)
					   + 
					    (texture2D (_Splat1, xlv_TEXCOORD1.xy) * tmpvar_3.y)
					  ) + (texture2D (_Splat2, xlv_TEXCOORD1.zw) * tmpvar_3.z)).xyz * lm_1);
					  c_2.w = 1.0;
					  gl_FragData[0] = c_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp vec4 xlv_TEXCOORD4;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = _glesVertex.xyz;
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_7;
					  tmpvar_7[0] = unity_WorldToObject[0].xyz;
					  tmpvar_7[1] = unity_WorldToObject[1].xyz;
					  tmpvar_7[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_8;
					  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
					  worldNormal_1 = tmpvar_8;
					  tmpvar_4 = worldNormal_1;
					  tmpvar_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  gl_Position = (glstate_matrix_mvp * tmpvar_6);
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  xlv_TEXCOORD4 = tmpvar_5;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D unity_Lightmap;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec4 xlv_TEXCOORD4;
					void main ()
					{
					  lowp vec3 lm_1;
					  lowp vec4 c_2;
					  lowp vec3 tmpvar_3;
					  tmpvar_3 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = (2.0 * tmpvar_4.xyz);
					  lm_1 = tmpvar_5;
					  c_2.xyz = (((
					    (texture2D (_Splat0, xlv_TEXCOORD0.zw) * tmpvar_3.x)
					   + 
					    (texture2D (_Splat1, xlv_TEXCOORD1.xy) * tmpvar_3.y)
					  ) + (texture2D (_Splat2, xlv_TEXCOORD1.zw) * tmpvar_3.z)).xyz * lm_1);
					  c_2.w = 1.0;
					  gl_FragData[0] = c_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp vec4 xlv_TEXCOORD4;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = _glesVertex.xyz;
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_7;
					  tmpvar_7[0] = unity_WorldToObject[0].xyz;
					  tmpvar_7[1] = unity_WorldToObject[1].xyz;
					  tmpvar_7[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_8;
					  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
					  worldNormal_1 = tmpvar_8;
					  tmpvar_4 = worldNormal_1;
					  tmpvar_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  gl_Position = (glstate_matrix_mvp * tmpvar_6);
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  xlv_TEXCOORD4 = tmpvar_5;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D unity_Lightmap;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec4 xlv_TEXCOORD4;
					void main ()
					{
					  lowp vec3 lm_1;
					  lowp vec4 c_2;
					  lowp vec3 tmpvar_3;
					  tmpvar_3 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = (2.0 * tmpvar_4.xyz);
					  lm_1 = tmpvar_5;
					  c_2.xyz = (((
					    (texture2D (_Splat0, xlv_TEXCOORD0.zw) * tmpvar_3.x)
					   + 
					    (texture2D (_Splat1, xlv_TEXCOORD1.xy) * tmpvar_3.y)
					  ) + (texture2D (_Splat2, xlv_TEXCOORD1.zw) * tmpvar_3.z)).xyz * lm_1);
					  c_2.w = 1.0;
					  gl_FragData[0] = c_2;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_LightmapST;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					in highp vec4 in_TEXCOORD1;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD4;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2D unity_Lightmap;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp vec4 vs_TEXCOORD4;
					layout(location = 0) out lowp vec4 SV_Target0;
					lowp vec3 u_xlat10_0;
					lowp vec3 u_xlat10_1;
					lowp vec3 u_xlat10_2;
					lowp vec3 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					void main()
					{
					    u_xlat10_0.xyz = texture(_Splat0, vs_TEXCOORD0.zw).xyz;
					    u_xlat10_1.xyz = texture(_Splat1, vs_TEXCOORD1.xy).xyz;
					    u_xlat10_2.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_3.xyz = u_xlat10_1.xyz * u_xlat10_2.yyy;
					    u_xlat10_3.xyz = u_xlat10_0.xyz * u_xlat10_2.xxx + u_xlat10_3.xyz;
					    u_xlat10_0.xyz = texture(_Splat2, vs_TEXCOORD1.zw).xyz;
					    u_xlat10_3.xyz = u_xlat10_0.xyz * u_xlat10_2.zzz + u_xlat10_3.xyz;
					    u_xlat10_0.xyz = texture(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0);
					    SV_Target0.xyz = u_xlat10_3.xyz * u_xlat10_4.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_LightmapST;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					in highp vec4 in_TEXCOORD1;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD4;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2D unity_Lightmap;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp vec4 vs_TEXCOORD4;
					layout(location = 0) out lowp vec4 SV_Target0;
					lowp vec3 u_xlat10_0;
					lowp vec3 u_xlat10_1;
					lowp vec3 u_xlat10_2;
					lowp vec3 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					void main()
					{
					    u_xlat10_0.xyz = texture(_Splat0, vs_TEXCOORD0.zw).xyz;
					    u_xlat10_1.xyz = texture(_Splat1, vs_TEXCOORD1.xy).xyz;
					    u_xlat10_2.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_3.xyz = u_xlat10_1.xyz * u_xlat10_2.yyy;
					    u_xlat10_3.xyz = u_xlat10_0.xyz * u_xlat10_2.xxx + u_xlat10_3.xyz;
					    u_xlat10_0.xyz = texture(_Splat2, vs_TEXCOORD1.zw).xyz;
					    u_xlat10_3.xyz = u_xlat10_0.xyz * u_xlat10_2.zzz + u_xlat10_3.xyz;
					    u_xlat10_0.xyz = texture(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0);
					    SV_Target0.xyz = u_xlat10_3.xyz * u_xlat10_4.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_LightmapST;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					in highp vec4 in_TEXCOORD1;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD4;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2D unity_Lightmap;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp vec4 vs_TEXCOORD4;
					layout(location = 0) out lowp vec4 SV_Target0;
					lowp vec3 u_xlat10_0;
					lowp vec3 u_xlat10_1;
					lowp vec3 u_xlat10_2;
					lowp vec3 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					void main()
					{
					    u_xlat10_0.xyz = texture(_Splat0, vs_TEXCOORD0.zw).xyz;
					    u_xlat10_1.xyz = texture(_Splat1, vs_TEXCOORD1.xy).xyz;
					    u_xlat10_2.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_3.xyz = u_xlat10_1.xyz * u_xlat10_2.yyy;
					    u_xlat10_3.xyz = u_xlat10_0.xyz * u_xlat10_2.xxx + u_xlat10_3.xyz;
					    u_xlat10_0.xyz = texture(_Splat2, vs_TEXCOORD1.zw).xyz;
					    u_xlat10_3.xyz = u_xlat10_0.xyz * u_xlat10_2.zzz + u_xlat10_3.xyz;
					    u_xlat10_0.xyz = texture(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0);
					    SV_Target0.xyz = u_xlat10_3.xyz * u_xlat10_4.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_WorldToShadow[4];
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					varying highp vec4 xlv_TEXCOORD5;
					void main ()
					{
					  highp vec3 shlight_1;
					  lowp vec3 worldNormal_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  mediump vec3 tmpvar_5;
					  lowp vec3 tmpvar_6;
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = _glesVertex.xyz;
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
					  worldNormal_2 = tmpvar_9;
					  tmpvar_5 = worldNormal_2;
					  lowp vec4 tmpvar_10;
					  tmpvar_10.w = 1.0;
					  tmpvar_10.xyz = worldNormal_2;
					  mediump vec4 normal_11;
					  normal_11 = tmpvar_10;
					  mediump vec3 res_12;
					  mediump vec3 x_13;
					  x_13.x = dot (unity_SHAr, normal_11);
					  x_13.y = dot (unity_SHAg, normal_11);
					  x_13.z = dot (unity_SHAb, normal_11);
					  mediump vec3 x1_14;
					  mediump vec4 tmpvar_15;
					  tmpvar_15 = (normal_11.xyzz * normal_11.yzzx);
					  x1_14.x = dot (unity_SHBr, tmpvar_15);
					  x1_14.y = dot (unity_SHBg, tmpvar_15);
					  x1_14.z = dot (unity_SHBb, tmpvar_15);
					  res_12 = (x_13 + (x1_14 + (unity_SHC.xyz * 
					    ((normal_11.x * normal_11.x) - (normal_11.y * normal_11.y))
					  )));
					  mediump vec3 tmpvar_16;
					  tmpvar_16 = max (((1.055 * 
					    pow (max (res_12, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  res_12 = tmpvar_16;
					  shlight_1 = tmpvar_16;
					  tmpvar_6 = shlight_1;
					  gl_Position = (glstate_matrix_mvp * tmpvar_7);
					  xlv_TEXCOORD0 = tmpvar_3;
					  xlv_TEXCOORD1 = tmpvar_4;
					  xlv_TEXCOORD2 = tmpvar_5;
					  highp vec4 tmpvar_17;
					  tmpvar_17 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD3 = tmpvar_17.xyz;
					  xlv_TEXCOORD4 = tmpvar_6;
					  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_17);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform mediump vec4 _LightShadowData;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform highp sampler2D _ShadowMapTexture;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					varying highp vec4 xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = _WorldSpaceLightPos0.xyz;
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  lowp vec3 tmpvar_7;
					  mediump float tmpvar_8;
					  lowp float tmpvar_9;
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_7 = (((tmpvar_11 * tmpvar_10.x) + (tmpvar_12 * tmpvar_10.y)) + (tmpvar_13 * tmpvar_10.z)).xyz;
					  tmpvar_9 = (((tmpvar_11.w * tmpvar_10.x) + (tmpvar_12.w * tmpvar_10.y)) + (tmpvar_13.w * tmpvar_10.z));
					  tmpvar_8 = (((_ShininessL0 * tmpvar_10.x) + (_ShininessL1 * tmpvar_10.y)) + (_ShininessL2 * tmpvar_10.z));
					  lowp float tmpvar_14;
					  highp float lightShadowDataX_15;
					  mediump float tmpvar_16;
					  tmpvar_16 = _LightShadowData.x;
					  lightShadowDataX_15 = tmpvar_16;
					  highp float tmpvar_17;
					  tmpvar_17 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_15);
					  tmpvar_14 = tmpvar_17;
					  c_1.w = 0.0;
					  c_1.xyz = (tmpvar_7 * xlv_TEXCOORD4);
					  lowp vec4 c_18;
					  lowp float spec_19;
					  lowp float tmpvar_20;
					  tmpvar_20 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_21;
					  tmpvar_21 = (pow (tmpvar_20, (tmpvar_8 * 128.0)) * tmpvar_9);
					  spec_19 = tmpvar_21;
					  c_18.xyz = (((
					    (tmpvar_7 * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_19)) * (tmpvar_14 * 2.0));
					  c_18.w = 0.0;
					  c_1.xyz = (c_1 + c_18).xyz;
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_WorldToShadow[4];
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					varying highp vec4 xlv_TEXCOORD5;
					void main ()
					{
					  highp vec3 shlight_1;
					  lowp vec3 worldNormal_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  mediump vec3 tmpvar_5;
					  lowp vec3 tmpvar_6;
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = _glesVertex.xyz;
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
					  worldNormal_2 = tmpvar_9;
					  tmpvar_5 = worldNormal_2;
					  lowp vec4 tmpvar_10;
					  tmpvar_10.w = 1.0;
					  tmpvar_10.xyz = worldNormal_2;
					  mediump vec4 normal_11;
					  normal_11 = tmpvar_10;
					  mediump vec3 res_12;
					  mediump vec3 x_13;
					  x_13.x = dot (unity_SHAr, normal_11);
					  x_13.y = dot (unity_SHAg, normal_11);
					  x_13.z = dot (unity_SHAb, normal_11);
					  mediump vec3 x1_14;
					  mediump vec4 tmpvar_15;
					  tmpvar_15 = (normal_11.xyzz * normal_11.yzzx);
					  x1_14.x = dot (unity_SHBr, tmpvar_15);
					  x1_14.y = dot (unity_SHBg, tmpvar_15);
					  x1_14.z = dot (unity_SHBb, tmpvar_15);
					  res_12 = (x_13 + (x1_14 + (unity_SHC.xyz * 
					    ((normal_11.x * normal_11.x) - (normal_11.y * normal_11.y))
					  )));
					  mediump vec3 tmpvar_16;
					  tmpvar_16 = max (((1.055 * 
					    pow (max (res_12, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  res_12 = tmpvar_16;
					  shlight_1 = tmpvar_16;
					  tmpvar_6 = shlight_1;
					  gl_Position = (glstate_matrix_mvp * tmpvar_7);
					  xlv_TEXCOORD0 = tmpvar_3;
					  xlv_TEXCOORD1 = tmpvar_4;
					  xlv_TEXCOORD2 = tmpvar_5;
					  highp vec4 tmpvar_17;
					  tmpvar_17 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD3 = tmpvar_17.xyz;
					  xlv_TEXCOORD4 = tmpvar_6;
					  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_17);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform mediump vec4 _LightShadowData;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform highp sampler2D _ShadowMapTexture;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					varying highp vec4 xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = _WorldSpaceLightPos0.xyz;
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  lowp vec3 tmpvar_7;
					  mediump float tmpvar_8;
					  lowp float tmpvar_9;
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_7 = (((tmpvar_11 * tmpvar_10.x) + (tmpvar_12 * tmpvar_10.y)) + (tmpvar_13 * tmpvar_10.z)).xyz;
					  tmpvar_9 = (((tmpvar_11.w * tmpvar_10.x) + (tmpvar_12.w * tmpvar_10.y)) + (tmpvar_13.w * tmpvar_10.z));
					  tmpvar_8 = (((_ShininessL0 * tmpvar_10.x) + (_ShininessL1 * tmpvar_10.y)) + (_ShininessL2 * tmpvar_10.z));
					  lowp float tmpvar_14;
					  highp float lightShadowDataX_15;
					  mediump float tmpvar_16;
					  tmpvar_16 = _LightShadowData.x;
					  lightShadowDataX_15 = tmpvar_16;
					  highp float tmpvar_17;
					  tmpvar_17 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_15);
					  tmpvar_14 = tmpvar_17;
					  c_1.w = 0.0;
					  c_1.xyz = (tmpvar_7 * xlv_TEXCOORD4);
					  lowp vec4 c_18;
					  lowp float spec_19;
					  lowp float tmpvar_20;
					  tmpvar_20 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_21;
					  tmpvar_21 = (pow (tmpvar_20, (tmpvar_8 * 128.0)) * tmpvar_9);
					  spec_19 = tmpvar_21;
					  c_18.xyz = (((
					    (tmpvar_7 * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_19)) * (tmpvar_14 * 2.0));
					  c_18.w = 0.0;
					  c_1.xyz = (c_1 + c_18).xyz;
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_WorldToShadow[4];
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					varying highp vec4 xlv_TEXCOORD5;
					void main ()
					{
					  highp vec3 shlight_1;
					  lowp vec3 worldNormal_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  mediump vec3 tmpvar_5;
					  lowp vec3 tmpvar_6;
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = _glesVertex.xyz;
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
					  worldNormal_2 = tmpvar_9;
					  tmpvar_5 = worldNormal_2;
					  lowp vec4 tmpvar_10;
					  tmpvar_10.w = 1.0;
					  tmpvar_10.xyz = worldNormal_2;
					  mediump vec4 normal_11;
					  normal_11 = tmpvar_10;
					  mediump vec3 res_12;
					  mediump vec3 x_13;
					  x_13.x = dot (unity_SHAr, normal_11);
					  x_13.y = dot (unity_SHAg, normal_11);
					  x_13.z = dot (unity_SHAb, normal_11);
					  mediump vec3 x1_14;
					  mediump vec4 tmpvar_15;
					  tmpvar_15 = (normal_11.xyzz * normal_11.yzzx);
					  x1_14.x = dot (unity_SHBr, tmpvar_15);
					  x1_14.y = dot (unity_SHBg, tmpvar_15);
					  x1_14.z = dot (unity_SHBb, tmpvar_15);
					  res_12 = (x_13 + (x1_14 + (unity_SHC.xyz * 
					    ((normal_11.x * normal_11.x) - (normal_11.y * normal_11.y))
					  )));
					  mediump vec3 tmpvar_16;
					  tmpvar_16 = max (((1.055 * 
					    pow (max (res_12, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  res_12 = tmpvar_16;
					  shlight_1 = tmpvar_16;
					  tmpvar_6 = shlight_1;
					  gl_Position = (glstate_matrix_mvp * tmpvar_7);
					  xlv_TEXCOORD0 = tmpvar_3;
					  xlv_TEXCOORD1 = tmpvar_4;
					  xlv_TEXCOORD2 = tmpvar_5;
					  highp vec4 tmpvar_17;
					  tmpvar_17 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD3 = tmpvar_17.xyz;
					  xlv_TEXCOORD4 = tmpvar_6;
					  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_17);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform mediump vec4 _LightShadowData;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform highp sampler2D _ShadowMapTexture;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					varying highp vec4 xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = _WorldSpaceLightPos0.xyz;
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  lowp vec3 tmpvar_7;
					  mediump float tmpvar_8;
					  lowp float tmpvar_9;
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_7 = (((tmpvar_11 * tmpvar_10.x) + (tmpvar_12 * tmpvar_10.y)) + (tmpvar_13 * tmpvar_10.z)).xyz;
					  tmpvar_9 = (((tmpvar_11.w * tmpvar_10.x) + (tmpvar_12.w * tmpvar_10.y)) + (tmpvar_13.w * tmpvar_10.z));
					  tmpvar_8 = (((_ShininessL0 * tmpvar_10.x) + (_ShininessL1 * tmpvar_10.y)) + (_ShininessL2 * tmpvar_10.z));
					  lowp float tmpvar_14;
					  highp float lightShadowDataX_15;
					  mediump float tmpvar_16;
					  tmpvar_16 = _LightShadowData.x;
					  lightShadowDataX_15 = tmpvar_16;
					  highp float tmpvar_17;
					  tmpvar_17 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_15);
					  tmpvar_14 = tmpvar_17;
					  c_1.w = 0.0;
					  c_1.xyz = (tmpvar_7 * xlv_TEXCOORD4);
					  lowp vec4 c_18;
					  lowp float spec_19;
					  lowp float tmpvar_20;
					  tmpvar_20 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_21;
					  tmpvar_21 = (pow (tmpvar_20, (tmpvar_8 * 128.0)) * tmpvar_9);
					  spec_19 = tmpvar_21;
					  c_18.xyz = (((
					    (tmpvar_7 * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_19)) * (tmpvar_14 * 2.0));
					  c_18.w = 0.0;
					  c_1.xyz = (c_1 + c_18).xyz;
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					out lowp vec3 vs_TEXCOORD4;
					out highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD4.xyz = u_xlat0.xyz;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightShadowData;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					uniform lowp sampler2D _ShadowMapTexture;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					in lowp vec3 vs_TEXCOORD4;
					in highp vec4 vs_TEXCOORD5;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					lowp float u_xlat10_6;
					mediump float u_xlat16_9;
					float u_xlat21;
					lowp float u_xlat10_25;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_5.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_4.xyz = u_xlat10_5.xyz * vec3(u_xlat10_25) + u_xlat10_4.xyz;
					    vec3 txVec0 = vec3(vs_TEXCOORD5.xy,vs_TEXCOORD5.z);
					    u_xlat10_6 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_2 = (-_LightShadowData.x) + 1.0;
					    u_xlat16_2 = u_xlat10_6 * u_xlat16_2 + _LightShadowData.x;
					    u_xlat10_25 = u_xlat16_2 * 2.0;
					    u_xlat10_4.xyz = vec3(u_xlat10_25) * u_xlat10_4.xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz * vs_TEXCOORD4.xyz + u_xlat10_4.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					out lowp vec3 vs_TEXCOORD4;
					out highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD4.xyz = u_xlat0.xyz;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightShadowData;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					uniform lowp sampler2D _ShadowMapTexture;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					in lowp vec3 vs_TEXCOORD4;
					in highp vec4 vs_TEXCOORD5;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					lowp float u_xlat10_6;
					mediump float u_xlat16_9;
					float u_xlat21;
					lowp float u_xlat10_25;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_5.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_4.xyz = u_xlat10_5.xyz * vec3(u_xlat10_25) + u_xlat10_4.xyz;
					    vec3 txVec0 = vec3(vs_TEXCOORD5.xy,vs_TEXCOORD5.z);
					    u_xlat10_6 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_2 = (-_LightShadowData.x) + 1.0;
					    u_xlat16_2 = u_xlat10_6 * u_xlat16_2 + _LightShadowData.x;
					    u_xlat10_25 = u_xlat16_2 * 2.0;
					    u_xlat10_4.xyz = vec3(u_xlat10_25) * u_xlat10_4.xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz * vs_TEXCOORD4.xyz + u_xlat10_4.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					out lowp vec3 vs_TEXCOORD4;
					out highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD4.xyz = u_xlat0.xyz;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightShadowData;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					uniform lowp sampler2D _ShadowMapTexture;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					in lowp vec3 vs_TEXCOORD4;
					in highp vec4 vs_TEXCOORD5;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					lowp float u_xlat10_6;
					mediump float u_xlat16_9;
					float u_xlat21;
					lowp float u_xlat10_25;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_5.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_4.xyz = u_xlat10_5.xyz * vec3(u_xlat10_25) + u_xlat10_4.xyz;
					    vec3 txVec0 = vec3(vs_TEXCOORD5.xy,vs_TEXCOORD5.z);
					    u_xlat10_6 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_2 = (-_LightShadowData.x) + 1.0;
					    u_xlat16_2 = u_xlat10_6 * u_xlat16_2 + _LightShadowData.x;
					    u_xlat10_25 = u_xlat16_2 * 2.0;
					    u_xlat10_4.xyz = vec3(u_xlat10_25) * u_xlat10_4.xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz * vs_TEXCOORD4.xyz + u_xlat10_4.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_WorldToShadow[4];
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp vec4 xlv_TEXCOORD4;
					varying highp vec4 xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = _glesVertex.xyz;
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_7;
					  tmpvar_7[0] = unity_WorldToObject[0].xyz;
					  tmpvar_7[1] = unity_WorldToObject[1].xyz;
					  tmpvar_7[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_8;
					  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
					  worldNormal_1 = tmpvar_8;
					  tmpvar_4 = worldNormal_1;
					  tmpvar_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  gl_Position = (glstate_matrix_mvp * tmpvar_6);
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  highp vec4 tmpvar_9;
					  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD3 = tmpvar_9.xyz;
					  xlv_TEXCOORD4 = tmpvar_5;
					  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_9);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump vec4 _LightShadowData;
					uniform sampler2D unity_Lightmap;
					uniform highp sampler2D _ShadowMapTexture;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec4 xlv_TEXCOORD4;
					varying highp vec4 xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec3 lm_1;
					  lowp vec4 c_2;
					  lowp vec3 tmpvar_3;
					  tmpvar_3 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp float tmpvar_4;
					  highp float lightShadowDataX_5;
					  mediump float tmpvar_6;
					  tmpvar_6 = _LightShadowData.x;
					  lightShadowDataX_5 = tmpvar_6;
					  highp float tmpvar_7;
					  tmpvar_7 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_5);
					  tmpvar_4 = tmpvar_7;
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
					  mediump vec3 tmpvar_9;
					  tmpvar_9 = (2.0 * tmpvar_8.xyz);
					  lm_1 = tmpvar_9;
					  c_2.xyz = (((
					    (texture2D (_Splat0, xlv_TEXCOORD0.zw) * tmpvar_3.x)
					   + 
					    (texture2D (_Splat1, xlv_TEXCOORD1.xy) * tmpvar_3.y)
					  ) + (texture2D (_Splat2, xlv_TEXCOORD1.zw) * tmpvar_3.z)).xyz * min (lm_1, vec3((tmpvar_4 * 2.0))));
					  c_2.w = 1.0;
					  gl_FragData[0] = c_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_WorldToShadow[4];
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp vec4 xlv_TEXCOORD4;
					varying highp vec4 xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = _glesVertex.xyz;
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_7;
					  tmpvar_7[0] = unity_WorldToObject[0].xyz;
					  tmpvar_7[1] = unity_WorldToObject[1].xyz;
					  tmpvar_7[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_8;
					  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
					  worldNormal_1 = tmpvar_8;
					  tmpvar_4 = worldNormal_1;
					  tmpvar_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  gl_Position = (glstate_matrix_mvp * tmpvar_6);
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  highp vec4 tmpvar_9;
					  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD3 = tmpvar_9.xyz;
					  xlv_TEXCOORD4 = tmpvar_5;
					  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_9);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump vec4 _LightShadowData;
					uniform sampler2D unity_Lightmap;
					uniform highp sampler2D _ShadowMapTexture;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec4 xlv_TEXCOORD4;
					varying highp vec4 xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec3 lm_1;
					  lowp vec4 c_2;
					  lowp vec3 tmpvar_3;
					  tmpvar_3 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp float tmpvar_4;
					  highp float lightShadowDataX_5;
					  mediump float tmpvar_6;
					  tmpvar_6 = _LightShadowData.x;
					  lightShadowDataX_5 = tmpvar_6;
					  highp float tmpvar_7;
					  tmpvar_7 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_5);
					  tmpvar_4 = tmpvar_7;
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
					  mediump vec3 tmpvar_9;
					  tmpvar_9 = (2.0 * tmpvar_8.xyz);
					  lm_1 = tmpvar_9;
					  c_2.xyz = (((
					    (texture2D (_Splat0, xlv_TEXCOORD0.zw) * tmpvar_3.x)
					   + 
					    (texture2D (_Splat1, xlv_TEXCOORD1.xy) * tmpvar_3.y)
					  ) + (texture2D (_Splat2, xlv_TEXCOORD1.zw) * tmpvar_3.z)).xyz * min (lm_1, vec3((tmpvar_4 * 2.0))));
					  c_2.w = 1.0;
					  gl_FragData[0] = c_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_WorldToShadow[4];
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp vec4 xlv_TEXCOORD4;
					varying highp vec4 xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = _glesVertex.xyz;
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_7;
					  tmpvar_7[0] = unity_WorldToObject[0].xyz;
					  tmpvar_7[1] = unity_WorldToObject[1].xyz;
					  tmpvar_7[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_8;
					  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
					  worldNormal_1 = tmpvar_8;
					  tmpvar_4 = worldNormal_1;
					  tmpvar_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  gl_Position = (glstate_matrix_mvp * tmpvar_6);
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  highp vec4 tmpvar_9;
					  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD3 = tmpvar_9.xyz;
					  xlv_TEXCOORD4 = tmpvar_5;
					  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_9);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump vec4 _LightShadowData;
					uniform sampler2D unity_Lightmap;
					uniform highp sampler2D _ShadowMapTexture;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec4 xlv_TEXCOORD4;
					varying highp vec4 xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec3 lm_1;
					  lowp vec4 c_2;
					  lowp vec3 tmpvar_3;
					  tmpvar_3 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp float tmpvar_4;
					  highp float lightShadowDataX_5;
					  mediump float tmpvar_6;
					  tmpvar_6 = _LightShadowData.x;
					  lightShadowDataX_5 = tmpvar_6;
					  highp float tmpvar_7;
					  tmpvar_7 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_5);
					  tmpvar_4 = tmpvar_7;
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
					  mediump vec3 tmpvar_9;
					  tmpvar_9 = (2.0 * tmpvar_8.xyz);
					  lm_1 = tmpvar_9;
					  c_2.xyz = (((
					    (texture2D (_Splat0, xlv_TEXCOORD0.zw) * tmpvar_3.x)
					   + 
					    (texture2D (_Splat1, xlv_TEXCOORD1.xy) * tmpvar_3.y)
					  ) + (texture2D (_Splat2, xlv_TEXCOORD1.zw) * tmpvar_3.z)).xyz * min (lm_1, vec3((tmpvar_4 * 2.0))));
					  c_2.w = 1.0;
					  gl_FragData[0] = c_2;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_LightmapST;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					in highp vec4 in_TEXCOORD1;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD4;
					out highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump vec4 _LightShadowData;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2D unity_Lightmap;
					uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					uniform lowp sampler2D _ShadowMapTexture;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp vec4 vs_TEXCOORD4;
					in highp vec4 vs_TEXCOORD5;
					layout(location = 0) out lowp vec4 SV_Target0;
					lowp vec3 u_xlat10_0;
					lowp vec3 u_xlat10_1;
					lowp vec3 u_xlat10_2;
					lowp vec3 u_xlat10_3;
					mediump float u_xlat16_4;
					lowp vec3 u_xlat10_5;
					lowp float u_xlat10_21;
					void main()
					{
					    u_xlat10_0.xyz = texture(_Splat0, vs_TEXCOORD0.zw).xyz;
					    u_xlat10_1.xyz = texture(_Splat1, vs_TEXCOORD1.xy).xyz;
					    u_xlat10_2.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_3.xyz = u_xlat10_1.xyz * u_xlat10_2.yyy;
					    u_xlat10_3.xyz = u_xlat10_0.xyz * u_xlat10_2.xxx + u_xlat10_3.xyz;
					    u_xlat10_0.xyz = texture(_Splat2, vs_TEXCOORD1.zw).xyz;
					    u_xlat10_3.xyz = u_xlat10_0.xyz * u_xlat10_2.zzz + u_xlat10_3.xyz;
					    vec3 txVec0 = vec3(vs_TEXCOORD5.xy,vs_TEXCOORD5.z);
					    u_xlat10_0.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_4 = (-_LightShadowData.x) + 1.0;
					    u_xlat16_4 = u_xlat10_0.x * u_xlat16_4 + _LightShadowData.x;
					    u_xlat10_21 = u_xlat16_4 * 2.0;
					    u_xlat10_0.xyz = texture(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
					    u_xlat10_5.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0);
					    u_xlat10_5.xyz = min(vec3(u_xlat10_21), u_xlat10_5.xyz);
					    SV_Target0.xyz = u_xlat10_3.xyz * u_xlat10_5.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_LightmapST;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					in highp vec4 in_TEXCOORD1;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD4;
					out highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump vec4 _LightShadowData;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2D unity_Lightmap;
					uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					uniform lowp sampler2D _ShadowMapTexture;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp vec4 vs_TEXCOORD4;
					in highp vec4 vs_TEXCOORD5;
					layout(location = 0) out lowp vec4 SV_Target0;
					lowp vec3 u_xlat10_0;
					lowp vec3 u_xlat10_1;
					lowp vec3 u_xlat10_2;
					lowp vec3 u_xlat10_3;
					mediump float u_xlat16_4;
					lowp vec3 u_xlat10_5;
					lowp float u_xlat10_21;
					void main()
					{
					    u_xlat10_0.xyz = texture(_Splat0, vs_TEXCOORD0.zw).xyz;
					    u_xlat10_1.xyz = texture(_Splat1, vs_TEXCOORD1.xy).xyz;
					    u_xlat10_2.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_3.xyz = u_xlat10_1.xyz * u_xlat10_2.yyy;
					    u_xlat10_3.xyz = u_xlat10_0.xyz * u_xlat10_2.xxx + u_xlat10_3.xyz;
					    u_xlat10_0.xyz = texture(_Splat2, vs_TEXCOORD1.zw).xyz;
					    u_xlat10_3.xyz = u_xlat10_0.xyz * u_xlat10_2.zzz + u_xlat10_3.xyz;
					    vec3 txVec0 = vec3(vs_TEXCOORD5.xy,vs_TEXCOORD5.z);
					    u_xlat10_0.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_4 = (-_LightShadowData.x) + 1.0;
					    u_xlat16_4 = u_xlat10_0.x * u_xlat16_4 + _LightShadowData.x;
					    u_xlat10_21 = u_xlat16_4 * 2.0;
					    u_xlat10_0.xyz = texture(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
					    u_xlat10_5.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0);
					    u_xlat10_5.xyz = min(vec3(u_xlat10_21), u_xlat10_5.xyz);
					    SV_Target0.xyz = u_xlat10_3.xyz * u_xlat10_5.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_LightmapST;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					in highp vec4 in_TEXCOORD1;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD4;
					out highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump vec4 _LightShadowData;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2D unity_Lightmap;
					uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					uniform lowp sampler2D _ShadowMapTexture;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp vec4 vs_TEXCOORD4;
					in highp vec4 vs_TEXCOORD5;
					layout(location = 0) out lowp vec4 SV_Target0;
					lowp vec3 u_xlat10_0;
					lowp vec3 u_xlat10_1;
					lowp vec3 u_xlat10_2;
					lowp vec3 u_xlat10_3;
					mediump float u_xlat16_4;
					lowp vec3 u_xlat10_5;
					lowp float u_xlat10_21;
					void main()
					{
					    u_xlat10_0.xyz = texture(_Splat0, vs_TEXCOORD0.zw).xyz;
					    u_xlat10_1.xyz = texture(_Splat1, vs_TEXCOORD1.xy).xyz;
					    u_xlat10_2.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_3.xyz = u_xlat10_1.xyz * u_xlat10_2.yyy;
					    u_xlat10_3.xyz = u_xlat10_0.xyz * u_xlat10_2.xxx + u_xlat10_3.xyz;
					    u_xlat10_0.xyz = texture(_Splat2, vs_TEXCOORD1.zw).xyz;
					    u_xlat10_3.xyz = u_xlat10_0.xyz * u_xlat10_2.zzz + u_xlat10_3.xyz;
					    vec3 txVec0 = vec3(vs_TEXCOORD5.xy,vs_TEXCOORD5.z);
					    u_xlat10_0.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_4 = (-_LightShadowData.x) + 1.0;
					    u_xlat16_4 = u_xlat10_0.x * u_xlat16_4 + _LightShadowData.x;
					    u_xlat10_21 = u_xlat16_4 * 2.0;
					    u_xlat10_0.xyz = texture(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
					    u_xlat10_5.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0);
					    u_xlat10_5.xyz = min(vec3(u_xlat10_21), u_xlat10_5.xyz);
					    SV_Target0.xyz = u_xlat10_3.xyz * u_xlat10_5.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 unity_4LightPosX0;
					uniform highp vec4 unity_4LightPosY0;
					uniform highp vec4 unity_4LightPosZ0;
					uniform mediump vec4 unity_4LightAtten0;
					uniform mediump vec4 unity_LightColor[8];
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					void main ()
					{
					  highp vec3 shlight_1;
					  lowp vec3 worldNormal_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  mediump vec3 tmpvar_5;
					  lowp vec3 tmpvar_6;
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = _glesVertex.xyz;
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp vec3 tmpvar_8;
					  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
					  highp mat3 tmpvar_9;
					  tmpvar_9[0] = unity_WorldToObject[0].xyz;
					  tmpvar_9[1] = unity_WorldToObject[1].xyz;
					  tmpvar_9[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_10;
					  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
					  worldNormal_2 = tmpvar_10;
					  tmpvar_5 = worldNormal_2;
					  lowp vec4 tmpvar_11;
					  tmpvar_11.w = 1.0;
					  tmpvar_11.xyz = worldNormal_2;
					  mediump vec4 normal_12;
					  normal_12 = tmpvar_11;
					  mediump vec3 res_13;
					  mediump vec3 x_14;
					  x_14.x = dot (unity_SHAr, normal_12);
					  x_14.y = dot (unity_SHAg, normal_12);
					  x_14.z = dot (unity_SHAb, normal_12);
					  mediump vec3 x1_15;
					  mediump vec4 tmpvar_16;
					  tmpvar_16 = (normal_12.xyzz * normal_12.yzzx);
					  x1_15.x = dot (unity_SHBr, tmpvar_16);
					  x1_15.y = dot (unity_SHBg, tmpvar_16);
					  x1_15.z = dot (unity_SHBb, tmpvar_16);
					  res_13 = (x_14 + (x1_15 + (unity_SHC.xyz * 
					    ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y))
					  )));
					  mediump vec3 tmpvar_17;
					  tmpvar_17 = max (((1.055 * 
					    pow (max (res_13, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  res_13 = tmpvar_17;
					  shlight_1 = tmpvar_17;
					  tmpvar_6 = shlight_1;
					  highp vec3 lightColor0_18;
					  lightColor0_18 = unity_LightColor[0].xyz;
					  highp vec3 lightColor1_19;
					  lightColor1_19 = unity_LightColor[1].xyz;
					  highp vec3 lightColor2_20;
					  lightColor2_20 = unity_LightColor[2].xyz;
					  highp vec3 lightColor3_21;
					  lightColor3_21 = unity_LightColor[3].xyz;
					  highp vec4 lightAttenSq_22;
					  lightAttenSq_22 = unity_4LightAtten0;
					  highp vec3 normal_23;
					  normal_23 = worldNormal_2;
					  highp vec3 col_24;
					  highp vec4 ndotl_25;
					  highp vec4 lengthSq_26;
					  highp vec4 tmpvar_27;
					  tmpvar_27 = (unity_4LightPosX0 - tmpvar_8.x);
					  highp vec4 tmpvar_28;
					  tmpvar_28 = (unity_4LightPosY0 - tmpvar_8.y);
					  highp vec4 tmpvar_29;
					  tmpvar_29 = (unity_4LightPosZ0 - tmpvar_8.z);
					  lengthSq_26 = (tmpvar_27 * tmpvar_27);
					  lengthSq_26 = (lengthSq_26 + (tmpvar_28 * tmpvar_28));
					  lengthSq_26 = (lengthSq_26 + (tmpvar_29 * tmpvar_29));
					  highp vec4 tmpvar_30;
					  tmpvar_30 = max (lengthSq_26, vec4(1e-06, 1e-06, 1e-06, 1e-06));
					  lengthSq_26 = tmpvar_30;
					  ndotl_25 = (tmpvar_27 * normal_23.x);
					  ndotl_25 = (ndotl_25 + (tmpvar_28 * normal_23.y));
					  ndotl_25 = (ndotl_25 + (tmpvar_29 * normal_23.z));
					  highp vec4 tmpvar_31;
					  tmpvar_31 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_25 * inversesqrt(tmpvar_30)));
					  ndotl_25 = tmpvar_31;
					  highp vec4 tmpvar_32;
					  tmpvar_32 = (tmpvar_31 * (1.0/((1.0 + 
					    (tmpvar_30 * lightAttenSq_22)
					  ))));
					  col_24 = (lightColor0_18 * tmpvar_32.x);
					  col_24 = (col_24 + (lightColor1_19 * tmpvar_32.y));
					  col_24 = (col_24 + (lightColor2_20 * tmpvar_32.z));
					  col_24 = (col_24 + (lightColor3_21 * tmpvar_32.w));
					  tmpvar_6 = (tmpvar_6 + col_24);
					  gl_Position = (glstate_matrix_mvp * tmpvar_7);
					  xlv_TEXCOORD0 = tmpvar_3;
					  xlv_TEXCOORD1 = tmpvar_4;
					  xlv_TEXCOORD2 = tmpvar_5;
					  xlv_TEXCOORD3 = tmpvar_8;
					  xlv_TEXCOORD4 = tmpvar_6;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = _WorldSpaceLightPos0.xyz;
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  lowp vec3 tmpvar_7;
					  mediump float tmpvar_8;
					  lowp float tmpvar_9;
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_7 = (((tmpvar_11 * tmpvar_10.x) + (tmpvar_12 * tmpvar_10.y)) + (tmpvar_13 * tmpvar_10.z)).xyz;
					  tmpvar_9 = (((tmpvar_11.w * tmpvar_10.x) + (tmpvar_12.w * tmpvar_10.y)) + (tmpvar_13.w * tmpvar_10.z));
					  tmpvar_8 = (((_ShininessL0 * tmpvar_10.x) + (_ShininessL1 * tmpvar_10.y)) + (_ShininessL2 * tmpvar_10.z));
					  c_1.w = 0.0;
					  c_1.xyz = (tmpvar_7 * xlv_TEXCOORD4);
					  lowp vec4 c_14;
					  lowp float spec_15;
					  lowp float tmpvar_16;
					  tmpvar_16 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_17;
					  tmpvar_17 = (pow (tmpvar_16, (tmpvar_8 * 128.0)) * tmpvar_9);
					  spec_15 = tmpvar_17;
					  c_14.xyz = (((
					    (tmpvar_7 * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_15)) * 2.0);
					  c_14.w = 0.0;
					  c_1.xyz = (c_1 + c_14).xyz;
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 unity_4LightPosX0;
					uniform highp vec4 unity_4LightPosY0;
					uniform highp vec4 unity_4LightPosZ0;
					uniform mediump vec4 unity_4LightAtten0;
					uniform mediump vec4 unity_LightColor[8];
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					void main ()
					{
					  highp vec3 shlight_1;
					  lowp vec3 worldNormal_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  mediump vec3 tmpvar_5;
					  lowp vec3 tmpvar_6;
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = _glesVertex.xyz;
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp vec3 tmpvar_8;
					  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
					  highp mat3 tmpvar_9;
					  tmpvar_9[0] = unity_WorldToObject[0].xyz;
					  tmpvar_9[1] = unity_WorldToObject[1].xyz;
					  tmpvar_9[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_10;
					  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
					  worldNormal_2 = tmpvar_10;
					  tmpvar_5 = worldNormal_2;
					  lowp vec4 tmpvar_11;
					  tmpvar_11.w = 1.0;
					  tmpvar_11.xyz = worldNormal_2;
					  mediump vec4 normal_12;
					  normal_12 = tmpvar_11;
					  mediump vec3 res_13;
					  mediump vec3 x_14;
					  x_14.x = dot (unity_SHAr, normal_12);
					  x_14.y = dot (unity_SHAg, normal_12);
					  x_14.z = dot (unity_SHAb, normal_12);
					  mediump vec3 x1_15;
					  mediump vec4 tmpvar_16;
					  tmpvar_16 = (normal_12.xyzz * normal_12.yzzx);
					  x1_15.x = dot (unity_SHBr, tmpvar_16);
					  x1_15.y = dot (unity_SHBg, tmpvar_16);
					  x1_15.z = dot (unity_SHBb, tmpvar_16);
					  res_13 = (x_14 + (x1_15 + (unity_SHC.xyz * 
					    ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y))
					  )));
					  mediump vec3 tmpvar_17;
					  tmpvar_17 = max (((1.055 * 
					    pow (max (res_13, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  res_13 = tmpvar_17;
					  shlight_1 = tmpvar_17;
					  tmpvar_6 = shlight_1;
					  highp vec3 lightColor0_18;
					  lightColor0_18 = unity_LightColor[0].xyz;
					  highp vec3 lightColor1_19;
					  lightColor1_19 = unity_LightColor[1].xyz;
					  highp vec3 lightColor2_20;
					  lightColor2_20 = unity_LightColor[2].xyz;
					  highp vec3 lightColor3_21;
					  lightColor3_21 = unity_LightColor[3].xyz;
					  highp vec4 lightAttenSq_22;
					  lightAttenSq_22 = unity_4LightAtten0;
					  highp vec3 normal_23;
					  normal_23 = worldNormal_2;
					  highp vec3 col_24;
					  highp vec4 ndotl_25;
					  highp vec4 lengthSq_26;
					  highp vec4 tmpvar_27;
					  tmpvar_27 = (unity_4LightPosX0 - tmpvar_8.x);
					  highp vec4 tmpvar_28;
					  tmpvar_28 = (unity_4LightPosY0 - tmpvar_8.y);
					  highp vec4 tmpvar_29;
					  tmpvar_29 = (unity_4LightPosZ0 - tmpvar_8.z);
					  lengthSq_26 = (tmpvar_27 * tmpvar_27);
					  lengthSq_26 = (lengthSq_26 + (tmpvar_28 * tmpvar_28));
					  lengthSq_26 = (lengthSq_26 + (tmpvar_29 * tmpvar_29));
					  highp vec4 tmpvar_30;
					  tmpvar_30 = max (lengthSq_26, vec4(1e-06, 1e-06, 1e-06, 1e-06));
					  lengthSq_26 = tmpvar_30;
					  ndotl_25 = (tmpvar_27 * normal_23.x);
					  ndotl_25 = (ndotl_25 + (tmpvar_28 * normal_23.y));
					  ndotl_25 = (ndotl_25 + (tmpvar_29 * normal_23.z));
					  highp vec4 tmpvar_31;
					  tmpvar_31 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_25 * inversesqrt(tmpvar_30)));
					  ndotl_25 = tmpvar_31;
					  highp vec4 tmpvar_32;
					  tmpvar_32 = (tmpvar_31 * (1.0/((1.0 + 
					    (tmpvar_30 * lightAttenSq_22)
					  ))));
					  col_24 = (lightColor0_18 * tmpvar_32.x);
					  col_24 = (col_24 + (lightColor1_19 * tmpvar_32.y));
					  col_24 = (col_24 + (lightColor2_20 * tmpvar_32.z));
					  col_24 = (col_24 + (lightColor3_21 * tmpvar_32.w));
					  tmpvar_6 = (tmpvar_6 + col_24);
					  gl_Position = (glstate_matrix_mvp * tmpvar_7);
					  xlv_TEXCOORD0 = tmpvar_3;
					  xlv_TEXCOORD1 = tmpvar_4;
					  xlv_TEXCOORD2 = tmpvar_5;
					  xlv_TEXCOORD3 = tmpvar_8;
					  xlv_TEXCOORD4 = tmpvar_6;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = _WorldSpaceLightPos0.xyz;
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  lowp vec3 tmpvar_7;
					  mediump float tmpvar_8;
					  lowp float tmpvar_9;
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_7 = (((tmpvar_11 * tmpvar_10.x) + (tmpvar_12 * tmpvar_10.y)) + (tmpvar_13 * tmpvar_10.z)).xyz;
					  tmpvar_9 = (((tmpvar_11.w * tmpvar_10.x) + (tmpvar_12.w * tmpvar_10.y)) + (tmpvar_13.w * tmpvar_10.z));
					  tmpvar_8 = (((_ShininessL0 * tmpvar_10.x) + (_ShininessL1 * tmpvar_10.y)) + (_ShininessL2 * tmpvar_10.z));
					  c_1.w = 0.0;
					  c_1.xyz = (tmpvar_7 * xlv_TEXCOORD4);
					  lowp vec4 c_14;
					  lowp float spec_15;
					  lowp float tmpvar_16;
					  tmpvar_16 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_17;
					  tmpvar_17 = (pow (tmpvar_16, (tmpvar_8 * 128.0)) * tmpvar_9);
					  spec_15 = tmpvar_17;
					  c_14.xyz = (((
					    (tmpvar_7 * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_15)) * 2.0);
					  c_14.w = 0.0;
					  c_1.xyz = (c_1 + c_14).xyz;
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 unity_4LightPosX0;
					uniform highp vec4 unity_4LightPosY0;
					uniform highp vec4 unity_4LightPosZ0;
					uniform mediump vec4 unity_4LightAtten0;
					uniform mediump vec4 unity_LightColor[8];
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					void main ()
					{
					  highp vec3 shlight_1;
					  lowp vec3 worldNormal_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  mediump vec3 tmpvar_5;
					  lowp vec3 tmpvar_6;
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = _glesVertex.xyz;
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp vec3 tmpvar_8;
					  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
					  highp mat3 tmpvar_9;
					  tmpvar_9[0] = unity_WorldToObject[0].xyz;
					  tmpvar_9[1] = unity_WorldToObject[1].xyz;
					  tmpvar_9[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_10;
					  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
					  worldNormal_2 = tmpvar_10;
					  tmpvar_5 = worldNormal_2;
					  lowp vec4 tmpvar_11;
					  tmpvar_11.w = 1.0;
					  tmpvar_11.xyz = worldNormal_2;
					  mediump vec4 normal_12;
					  normal_12 = tmpvar_11;
					  mediump vec3 res_13;
					  mediump vec3 x_14;
					  x_14.x = dot (unity_SHAr, normal_12);
					  x_14.y = dot (unity_SHAg, normal_12);
					  x_14.z = dot (unity_SHAb, normal_12);
					  mediump vec3 x1_15;
					  mediump vec4 tmpvar_16;
					  tmpvar_16 = (normal_12.xyzz * normal_12.yzzx);
					  x1_15.x = dot (unity_SHBr, tmpvar_16);
					  x1_15.y = dot (unity_SHBg, tmpvar_16);
					  x1_15.z = dot (unity_SHBb, tmpvar_16);
					  res_13 = (x_14 + (x1_15 + (unity_SHC.xyz * 
					    ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y))
					  )));
					  mediump vec3 tmpvar_17;
					  tmpvar_17 = max (((1.055 * 
					    pow (max (res_13, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  res_13 = tmpvar_17;
					  shlight_1 = tmpvar_17;
					  tmpvar_6 = shlight_1;
					  highp vec3 lightColor0_18;
					  lightColor0_18 = unity_LightColor[0].xyz;
					  highp vec3 lightColor1_19;
					  lightColor1_19 = unity_LightColor[1].xyz;
					  highp vec3 lightColor2_20;
					  lightColor2_20 = unity_LightColor[2].xyz;
					  highp vec3 lightColor3_21;
					  lightColor3_21 = unity_LightColor[3].xyz;
					  highp vec4 lightAttenSq_22;
					  lightAttenSq_22 = unity_4LightAtten0;
					  highp vec3 normal_23;
					  normal_23 = worldNormal_2;
					  highp vec3 col_24;
					  highp vec4 ndotl_25;
					  highp vec4 lengthSq_26;
					  highp vec4 tmpvar_27;
					  tmpvar_27 = (unity_4LightPosX0 - tmpvar_8.x);
					  highp vec4 tmpvar_28;
					  tmpvar_28 = (unity_4LightPosY0 - tmpvar_8.y);
					  highp vec4 tmpvar_29;
					  tmpvar_29 = (unity_4LightPosZ0 - tmpvar_8.z);
					  lengthSq_26 = (tmpvar_27 * tmpvar_27);
					  lengthSq_26 = (lengthSq_26 + (tmpvar_28 * tmpvar_28));
					  lengthSq_26 = (lengthSq_26 + (tmpvar_29 * tmpvar_29));
					  highp vec4 tmpvar_30;
					  tmpvar_30 = max (lengthSq_26, vec4(1e-06, 1e-06, 1e-06, 1e-06));
					  lengthSq_26 = tmpvar_30;
					  ndotl_25 = (tmpvar_27 * normal_23.x);
					  ndotl_25 = (ndotl_25 + (tmpvar_28 * normal_23.y));
					  ndotl_25 = (ndotl_25 + (tmpvar_29 * normal_23.z));
					  highp vec4 tmpvar_31;
					  tmpvar_31 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_25 * inversesqrt(tmpvar_30)));
					  ndotl_25 = tmpvar_31;
					  highp vec4 tmpvar_32;
					  tmpvar_32 = (tmpvar_31 * (1.0/((1.0 + 
					    (tmpvar_30 * lightAttenSq_22)
					  ))));
					  col_24 = (lightColor0_18 * tmpvar_32.x);
					  col_24 = (col_24 + (lightColor1_19 * tmpvar_32.y));
					  col_24 = (col_24 + (lightColor2_20 * tmpvar_32.z));
					  col_24 = (col_24 + (lightColor3_21 * tmpvar_32.w));
					  tmpvar_6 = (tmpvar_6 + col_24);
					  gl_Position = (glstate_matrix_mvp * tmpvar_7);
					  xlv_TEXCOORD0 = tmpvar_3;
					  xlv_TEXCOORD1 = tmpvar_4;
					  xlv_TEXCOORD2 = tmpvar_5;
					  xlv_TEXCOORD3 = tmpvar_8;
					  xlv_TEXCOORD4 = tmpvar_6;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = _WorldSpaceLightPos0.xyz;
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  lowp vec3 tmpvar_7;
					  mediump float tmpvar_8;
					  lowp float tmpvar_9;
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_7 = (((tmpvar_11 * tmpvar_10.x) + (tmpvar_12 * tmpvar_10.y)) + (tmpvar_13 * tmpvar_10.z)).xyz;
					  tmpvar_9 = (((tmpvar_11.w * tmpvar_10.x) + (tmpvar_12.w * tmpvar_10.y)) + (tmpvar_13.w * tmpvar_10.z));
					  tmpvar_8 = (((_ShininessL0 * tmpvar_10.x) + (_ShininessL1 * tmpvar_10.y)) + (_ShininessL2 * tmpvar_10.z));
					  c_1.w = 0.0;
					  c_1.xyz = (tmpvar_7 * xlv_TEXCOORD4);
					  lowp vec4 c_14;
					  lowp float spec_15;
					  lowp float tmpvar_16;
					  tmpvar_16 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_17;
					  tmpvar_17 = (pow (tmpvar_16, (tmpvar_8 * 128.0)) * tmpvar_9);
					  spec_15 = tmpvar_17;
					  c_14.xyz = (((
					    (tmpvar_7 * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_15)) * 2.0);
					  c_14.w = 0.0;
					  c_1.xyz = (c_1 + c_14).xyz;
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 unity_4LightPosX0;
					uniform 	vec4 unity_4LightPosY0;
					uniform 	vec4 unity_4LightPosZ0;
					uniform 	mediump vec4 unity_4LightAtten0;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					out lowp vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump vec3 u_xlat16_2;
					vec4 u_xlat3;
					mediump vec4 u_xlat16_3;
					vec4 u_xlat4;
					mediump vec3 u_xlat16_4;
					vec3 u_xlat5;
					float u_xlat18;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_3 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_3);
					    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_3);
					    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_3);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_4.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat16_2.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat2 = (-u_xlat1.yyyy) + unity_4LightPosY0;
					    u_xlat3 = u_xlat0.yyyy * u_xlat2;
					    u_xlat2 = u_xlat2 * u_xlat2;
					    u_xlat4 = (-u_xlat1.xxxx) + unity_4LightPosX0;
					    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
					    u_xlat3 = u_xlat4 * u_xlat0.xxxx + u_xlat3;
					    u_xlat0 = u_xlat1 * u_xlat0.zzzz + u_xlat3;
					    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
					    u_xlat1 = u_xlat1 * u_xlat1 + u_xlat2;
					    u_xlat1 = max(u_xlat1, vec4(9.99999997e-007, 9.99999997e-007, 9.99999997e-007, 9.99999997e-007));
					    u_xlat2 = inversesqrt(u_xlat1);
					    u_xlat1 = u_xlat1 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat0 = max(u_xlat0, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat0 = u_xlat1 * u_xlat0;
					    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
					    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat5.xyz;
					    vs_TEXCOORD4.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					in lowp vec3 vs_TEXCOORD4;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					mediump float u_xlat16_8;
					float u_xlat18;
					lowp float u_xlat10_22;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_8 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_8;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat10_22 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat10_22 = max(u_xlat10_22, 0.0);
					    u_xlat10_5.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_4.xyz = u_xlat10_5.xyz * vec3(u_xlat10_22) + u_xlat10_4.xyz;
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0);
					    SV_Target0.xyz = u_xlat10_0.xyz * vs_TEXCOORD4.xyz + u_xlat10_4.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 unity_4LightPosX0;
					uniform 	vec4 unity_4LightPosY0;
					uniform 	vec4 unity_4LightPosZ0;
					uniform 	mediump vec4 unity_4LightAtten0;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					out lowp vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump vec3 u_xlat16_2;
					vec4 u_xlat3;
					mediump vec4 u_xlat16_3;
					vec4 u_xlat4;
					mediump vec3 u_xlat16_4;
					vec3 u_xlat5;
					float u_xlat18;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_3 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_3);
					    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_3);
					    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_3);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_4.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat16_2.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat2 = (-u_xlat1.yyyy) + unity_4LightPosY0;
					    u_xlat3 = u_xlat0.yyyy * u_xlat2;
					    u_xlat2 = u_xlat2 * u_xlat2;
					    u_xlat4 = (-u_xlat1.xxxx) + unity_4LightPosX0;
					    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
					    u_xlat3 = u_xlat4 * u_xlat0.xxxx + u_xlat3;
					    u_xlat0 = u_xlat1 * u_xlat0.zzzz + u_xlat3;
					    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
					    u_xlat1 = u_xlat1 * u_xlat1 + u_xlat2;
					    u_xlat1 = max(u_xlat1, vec4(9.99999997e-007, 9.99999997e-007, 9.99999997e-007, 9.99999997e-007));
					    u_xlat2 = inversesqrt(u_xlat1);
					    u_xlat1 = u_xlat1 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat0 = max(u_xlat0, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat0 = u_xlat1 * u_xlat0;
					    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
					    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat5.xyz;
					    vs_TEXCOORD4.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					in lowp vec3 vs_TEXCOORD4;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					mediump float u_xlat16_8;
					float u_xlat18;
					lowp float u_xlat10_22;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_8 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_8;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat10_22 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat10_22 = max(u_xlat10_22, 0.0);
					    u_xlat10_5.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_4.xyz = u_xlat10_5.xyz * vec3(u_xlat10_22) + u_xlat10_4.xyz;
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0);
					    SV_Target0.xyz = u_xlat10_0.xyz * vs_TEXCOORD4.xyz + u_xlat10_4.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 unity_4LightPosX0;
					uniform 	vec4 unity_4LightPosY0;
					uniform 	vec4 unity_4LightPosZ0;
					uniform 	mediump vec4 unity_4LightAtten0;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					out lowp vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump vec3 u_xlat16_2;
					vec4 u_xlat3;
					mediump vec4 u_xlat16_3;
					vec4 u_xlat4;
					mediump vec3 u_xlat16_4;
					vec3 u_xlat5;
					float u_xlat18;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_3 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_3);
					    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_3);
					    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_3);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_4.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat16_2.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat2 = (-u_xlat1.yyyy) + unity_4LightPosY0;
					    u_xlat3 = u_xlat0.yyyy * u_xlat2;
					    u_xlat2 = u_xlat2 * u_xlat2;
					    u_xlat4 = (-u_xlat1.xxxx) + unity_4LightPosX0;
					    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
					    u_xlat3 = u_xlat4 * u_xlat0.xxxx + u_xlat3;
					    u_xlat0 = u_xlat1 * u_xlat0.zzzz + u_xlat3;
					    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
					    u_xlat1 = u_xlat1 * u_xlat1 + u_xlat2;
					    u_xlat1 = max(u_xlat1, vec4(9.99999997e-007, 9.99999997e-007, 9.99999997e-007, 9.99999997e-007));
					    u_xlat2 = inversesqrt(u_xlat1);
					    u_xlat1 = u_xlat1 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat0 = max(u_xlat0, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat0 = u_xlat1 * u_xlat0;
					    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
					    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat5.xyz;
					    vs_TEXCOORD4.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					in lowp vec3 vs_TEXCOORD4;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					mediump float u_xlat16_8;
					float u_xlat18;
					lowp float u_xlat10_22;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_8 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_8;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat10_22 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat10_22 = max(u_xlat10_22, 0.0);
					    u_xlat10_5.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_4.xyz = u_xlat10_5.xyz * vec3(u_xlat10_22) + u_xlat10_4.xyz;
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0);
					    SV_Target0.xyz = u_xlat10_0.xyz * vs_TEXCOORD4.xyz + u_xlat10_4.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 unity_4LightPosX0;
					uniform highp vec4 unity_4LightPosY0;
					uniform highp vec4 unity_4LightPosZ0;
					uniform mediump vec4 unity_4LightAtten0;
					uniform mediump vec4 unity_LightColor[8];
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_WorldToShadow[4];
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					varying highp vec4 xlv_TEXCOORD5;
					void main ()
					{
					  highp vec3 shlight_1;
					  lowp vec3 worldNormal_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  mediump vec3 tmpvar_5;
					  lowp vec3 tmpvar_6;
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = _glesVertex.xyz;
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp vec4 tmpvar_8;
					  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
					  highp mat3 tmpvar_9;
					  tmpvar_9[0] = unity_WorldToObject[0].xyz;
					  tmpvar_9[1] = unity_WorldToObject[1].xyz;
					  tmpvar_9[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_10;
					  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
					  worldNormal_2 = tmpvar_10;
					  tmpvar_5 = worldNormal_2;
					  lowp vec4 tmpvar_11;
					  tmpvar_11.w = 1.0;
					  tmpvar_11.xyz = worldNormal_2;
					  mediump vec4 normal_12;
					  normal_12 = tmpvar_11;
					  mediump vec3 res_13;
					  mediump vec3 x_14;
					  x_14.x = dot (unity_SHAr, normal_12);
					  x_14.y = dot (unity_SHAg, normal_12);
					  x_14.z = dot (unity_SHAb, normal_12);
					  mediump vec3 x1_15;
					  mediump vec4 tmpvar_16;
					  tmpvar_16 = (normal_12.xyzz * normal_12.yzzx);
					  x1_15.x = dot (unity_SHBr, tmpvar_16);
					  x1_15.y = dot (unity_SHBg, tmpvar_16);
					  x1_15.z = dot (unity_SHBb, tmpvar_16);
					  res_13 = (x_14 + (x1_15 + (unity_SHC.xyz * 
					    ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y))
					  )));
					  mediump vec3 tmpvar_17;
					  tmpvar_17 = max (((1.055 * 
					    pow (max (res_13, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  res_13 = tmpvar_17;
					  shlight_1 = tmpvar_17;
					  tmpvar_6 = shlight_1;
					  highp vec3 lightColor0_18;
					  lightColor0_18 = unity_LightColor[0].xyz;
					  highp vec3 lightColor1_19;
					  lightColor1_19 = unity_LightColor[1].xyz;
					  highp vec3 lightColor2_20;
					  lightColor2_20 = unity_LightColor[2].xyz;
					  highp vec3 lightColor3_21;
					  lightColor3_21 = unity_LightColor[3].xyz;
					  highp vec4 lightAttenSq_22;
					  lightAttenSq_22 = unity_4LightAtten0;
					  highp vec3 normal_23;
					  normal_23 = worldNormal_2;
					  highp vec3 col_24;
					  highp vec4 ndotl_25;
					  highp vec4 lengthSq_26;
					  highp vec4 tmpvar_27;
					  tmpvar_27 = (unity_4LightPosX0 - tmpvar_8.x);
					  highp vec4 tmpvar_28;
					  tmpvar_28 = (unity_4LightPosY0 - tmpvar_8.y);
					  highp vec4 tmpvar_29;
					  tmpvar_29 = (unity_4LightPosZ0 - tmpvar_8.z);
					  lengthSq_26 = (tmpvar_27 * tmpvar_27);
					  lengthSq_26 = (lengthSq_26 + (tmpvar_28 * tmpvar_28));
					  lengthSq_26 = (lengthSq_26 + (tmpvar_29 * tmpvar_29));
					  highp vec4 tmpvar_30;
					  tmpvar_30 = max (lengthSq_26, vec4(1e-06, 1e-06, 1e-06, 1e-06));
					  lengthSq_26 = tmpvar_30;
					  ndotl_25 = (tmpvar_27 * normal_23.x);
					  ndotl_25 = (ndotl_25 + (tmpvar_28 * normal_23.y));
					  ndotl_25 = (ndotl_25 + (tmpvar_29 * normal_23.z));
					  highp vec4 tmpvar_31;
					  tmpvar_31 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_25 * inversesqrt(tmpvar_30)));
					  ndotl_25 = tmpvar_31;
					  highp vec4 tmpvar_32;
					  tmpvar_32 = (tmpvar_31 * (1.0/((1.0 + 
					    (tmpvar_30 * lightAttenSq_22)
					  ))));
					  col_24 = (lightColor0_18 * tmpvar_32.x);
					  col_24 = (col_24 + (lightColor1_19 * tmpvar_32.y));
					  col_24 = (col_24 + (lightColor2_20 * tmpvar_32.z));
					  col_24 = (col_24 + (lightColor3_21 * tmpvar_32.w));
					  tmpvar_6 = (tmpvar_6 + col_24);
					  gl_Position = (glstate_matrix_mvp * tmpvar_7);
					  xlv_TEXCOORD0 = tmpvar_3;
					  xlv_TEXCOORD1 = tmpvar_4;
					  xlv_TEXCOORD2 = tmpvar_5;
					  xlv_TEXCOORD3 = tmpvar_8.xyz;
					  xlv_TEXCOORD4 = tmpvar_6;
					  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_8);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform mediump vec4 _LightShadowData;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform highp sampler2D _ShadowMapTexture;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					varying highp vec4 xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = _WorldSpaceLightPos0.xyz;
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  lowp vec3 tmpvar_7;
					  mediump float tmpvar_8;
					  lowp float tmpvar_9;
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_7 = (((tmpvar_11 * tmpvar_10.x) + (tmpvar_12 * tmpvar_10.y)) + (tmpvar_13 * tmpvar_10.z)).xyz;
					  tmpvar_9 = (((tmpvar_11.w * tmpvar_10.x) + (tmpvar_12.w * tmpvar_10.y)) + (tmpvar_13.w * tmpvar_10.z));
					  tmpvar_8 = (((_ShininessL0 * tmpvar_10.x) + (_ShininessL1 * tmpvar_10.y)) + (_ShininessL2 * tmpvar_10.z));
					  lowp float tmpvar_14;
					  highp float lightShadowDataX_15;
					  mediump float tmpvar_16;
					  tmpvar_16 = _LightShadowData.x;
					  lightShadowDataX_15 = tmpvar_16;
					  highp float tmpvar_17;
					  tmpvar_17 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_15);
					  tmpvar_14 = tmpvar_17;
					  c_1.w = 0.0;
					  c_1.xyz = (tmpvar_7 * xlv_TEXCOORD4);
					  lowp vec4 c_18;
					  lowp float spec_19;
					  lowp float tmpvar_20;
					  tmpvar_20 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_21;
					  tmpvar_21 = (pow (tmpvar_20, (tmpvar_8 * 128.0)) * tmpvar_9);
					  spec_19 = tmpvar_21;
					  c_18.xyz = (((
					    (tmpvar_7 * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_19)) * (tmpvar_14 * 2.0));
					  c_18.w = 0.0;
					  c_1.xyz = (c_1 + c_18).xyz;
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 unity_4LightPosX0;
					uniform highp vec4 unity_4LightPosY0;
					uniform highp vec4 unity_4LightPosZ0;
					uniform mediump vec4 unity_4LightAtten0;
					uniform mediump vec4 unity_LightColor[8];
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_WorldToShadow[4];
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					varying highp vec4 xlv_TEXCOORD5;
					void main ()
					{
					  highp vec3 shlight_1;
					  lowp vec3 worldNormal_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  mediump vec3 tmpvar_5;
					  lowp vec3 tmpvar_6;
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = _glesVertex.xyz;
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp vec4 tmpvar_8;
					  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
					  highp mat3 tmpvar_9;
					  tmpvar_9[0] = unity_WorldToObject[0].xyz;
					  tmpvar_9[1] = unity_WorldToObject[1].xyz;
					  tmpvar_9[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_10;
					  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
					  worldNormal_2 = tmpvar_10;
					  tmpvar_5 = worldNormal_2;
					  lowp vec4 tmpvar_11;
					  tmpvar_11.w = 1.0;
					  tmpvar_11.xyz = worldNormal_2;
					  mediump vec4 normal_12;
					  normal_12 = tmpvar_11;
					  mediump vec3 res_13;
					  mediump vec3 x_14;
					  x_14.x = dot (unity_SHAr, normal_12);
					  x_14.y = dot (unity_SHAg, normal_12);
					  x_14.z = dot (unity_SHAb, normal_12);
					  mediump vec3 x1_15;
					  mediump vec4 tmpvar_16;
					  tmpvar_16 = (normal_12.xyzz * normal_12.yzzx);
					  x1_15.x = dot (unity_SHBr, tmpvar_16);
					  x1_15.y = dot (unity_SHBg, tmpvar_16);
					  x1_15.z = dot (unity_SHBb, tmpvar_16);
					  res_13 = (x_14 + (x1_15 + (unity_SHC.xyz * 
					    ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y))
					  )));
					  mediump vec3 tmpvar_17;
					  tmpvar_17 = max (((1.055 * 
					    pow (max (res_13, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  res_13 = tmpvar_17;
					  shlight_1 = tmpvar_17;
					  tmpvar_6 = shlight_1;
					  highp vec3 lightColor0_18;
					  lightColor0_18 = unity_LightColor[0].xyz;
					  highp vec3 lightColor1_19;
					  lightColor1_19 = unity_LightColor[1].xyz;
					  highp vec3 lightColor2_20;
					  lightColor2_20 = unity_LightColor[2].xyz;
					  highp vec3 lightColor3_21;
					  lightColor3_21 = unity_LightColor[3].xyz;
					  highp vec4 lightAttenSq_22;
					  lightAttenSq_22 = unity_4LightAtten0;
					  highp vec3 normal_23;
					  normal_23 = worldNormal_2;
					  highp vec3 col_24;
					  highp vec4 ndotl_25;
					  highp vec4 lengthSq_26;
					  highp vec4 tmpvar_27;
					  tmpvar_27 = (unity_4LightPosX0 - tmpvar_8.x);
					  highp vec4 tmpvar_28;
					  tmpvar_28 = (unity_4LightPosY0 - tmpvar_8.y);
					  highp vec4 tmpvar_29;
					  tmpvar_29 = (unity_4LightPosZ0 - tmpvar_8.z);
					  lengthSq_26 = (tmpvar_27 * tmpvar_27);
					  lengthSq_26 = (lengthSq_26 + (tmpvar_28 * tmpvar_28));
					  lengthSq_26 = (lengthSq_26 + (tmpvar_29 * tmpvar_29));
					  highp vec4 tmpvar_30;
					  tmpvar_30 = max (lengthSq_26, vec4(1e-06, 1e-06, 1e-06, 1e-06));
					  lengthSq_26 = tmpvar_30;
					  ndotl_25 = (tmpvar_27 * normal_23.x);
					  ndotl_25 = (ndotl_25 + (tmpvar_28 * normal_23.y));
					  ndotl_25 = (ndotl_25 + (tmpvar_29 * normal_23.z));
					  highp vec4 tmpvar_31;
					  tmpvar_31 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_25 * inversesqrt(tmpvar_30)));
					  ndotl_25 = tmpvar_31;
					  highp vec4 tmpvar_32;
					  tmpvar_32 = (tmpvar_31 * (1.0/((1.0 + 
					    (tmpvar_30 * lightAttenSq_22)
					  ))));
					  col_24 = (lightColor0_18 * tmpvar_32.x);
					  col_24 = (col_24 + (lightColor1_19 * tmpvar_32.y));
					  col_24 = (col_24 + (lightColor2_20 * tmpvar_32.z));
					  col_24 = (col_24 + (lightColor3_21 * tmpvar_32.w));
					  tmpvar_6 = (tmpvar_6 + col_24);
					  gl_Position = (glstate_matrix_mvp * tmpvar_7);
					  xlv_TEXCOORD0 = tmpvar_3;
					  xlv_TEXCOORD1 = tmpvar_4;
					  xlv_TEXCOORD2 = tmpvar_5;
					  xlv_TEXCOORD3 = tmpvar_8.xyz;
					  xlv_TEXCOORD4 = tmpvar_6;
					  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_8);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform mediump vec4 _LightShadowData;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform highp sampler2D _ShadowMapTexture;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					varying highp vec4 xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = _WorldSpaceLightPos0.xyz;
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  lowp vec3 tmpvar_7;
					  mediump float tmpvar_8;
					  lowp float tmpvar_9;
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_7 = (((tmpvar_11 * tmpvar_10.x) + (tmpvar_12 * tmpvar_10.y)) + (tmpvar_13 * tmpvar_10.z)).xyz;
					  tmpvar_9 = (((tmpvar_11.w * tmpvar_10.x) + (tmpvar_12.w * tmpvar_10.y)) + (tmpvar_13.w * tmpvar_10.z));
					  tmpvar_8 = (((_ShininessL0 * tmpvar_10.x) + (_ShininessL1 * tmpvar_10.y)) + (_ShininessL2 * tmpvar_10.z));
					  lowp float tmpvar_14;
					  highp float lightShadowDataX_15;
					  mediump float tmpvar_16;
					  tmpvar_16 = _LightShadowData.x;
					  lightShadowDataX_15 = tmpvar_16;
					  highp float tmpvar_17;
					  tmpvar_17 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_15);
					  tmpvar_14 = tmpvar_17;
					  c_1.w = 0.0;
					  c_1.xyz = (tmpvar_7 * xlv_TEXCOORD4);
					  lowp vec4 c_18;
					  lowp float spec_19;
					  lowp float tmpvar_20;
					  tmpvar_20 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_21;
					  tmpvar_21 = (pow (tmpvar_20, (tmpvar_8 * 128.0)) * tmpvar_9);
					  spec_19 = tmpvar_21;
					  c_18.xyz = (((
					    (tmpvar_7 * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_19)) * (tmpvar_14 * 2.0));
					  c_18.w = 0.0;
					  c_1.xyz = (c_1 + c_18).xyz;
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 unity_4LightPosX0;
					uniform highp vec4 unity_4LightPosY0;
					uniform highp vec4 unity_4LightPosZ0;
					uniform mediump vec4 unity_4LightAtten0;
					uniform mediump vec4 unity_LightColor[8];
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_WorldToShadow[4];
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					varying highp vec4 xlv_TEXCOORD5;
					void main ()
					{
					  highp vec3 shlight_1;
					  lowp vec3 worldNormal_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  mediump vec3 tmpvar_5;
					  lowp vec3 tmpvar_6;
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = _glesVertex.xyz;
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp vec4 tmpvar_8;
					  tmpvar_8 = (unity_ObjectToWorld * _glesVertex);
					  highp mat3 tmpvar_9;
					  tmpvar_9[0] = unity_WorldToObject[0].xyz;
					  tmpvar_9[1] = unity_WorldToObject[1].xyz;
					  tmpvar_9[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_10;
					  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
					  worldNormal_2 = tmpvar_10;
					  tmpvar_5 = worldNormal_2;
					  lowp vec4 tmpvar_11;
					  tmpvar_11.w = 1.0;
					  tmpvar_11.xyz = worldNormal_2;
					  mediump vec4 normal_12;
					  normal_12 = tmpvar_11;
					  mediump vec3 res_13;
					  mediump vec3 x_14;
					  x_14.x = dot (unity_SHAr, normal_12);
					  x_14.y = dot (unity_SHAg, normal_12);
					  x_14.z = dot (unity_SHAb, normal_12);
					  mediump vec3 x1_15;
					  mediump vec4 tmpvar_16;
					  tmpvar_16 = (normal_12.xyzz * normal_12.yzzx);
					  x1_15.x = dot (unity_SHBr, tmpvar_16);
					  x1_15.y = dot (unity_SHBg, tmpvar_16);
					  x1_15.z = dot (unity_SHBb, tmpvar_16);
					  res_13 = (x_14 + (x1_15 + (unity_SHC.xyz * 
					    ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y))
					  )));
					  mediump vec3 tmpvar_17;
					  tmpvar_17 = max (((1.055 * 
					    pow (max (res_13, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  res_13 = tmpvar_17;
					  shlight_1 = tmpvar_17;
					  tmpvar_6 = shlight_1;
					  highp vec3 lightColor0_18;
					  lightColor0_18 = unity_LightColor[0].xyz;
					  highp vec3 lightColor1_19;
					  lightColor1_19 = unity_LightColor[1].xyz;
					  highp vec3 lightColor2_20;
					  lightColor2_20 = unity_LightColor[2].xyz;
					  highp vec3 lightColor3_21;
					  lightColor3_21 = unity_LightColor[3].xyz;
					  highp vec4 lightAttenSq_22;
					  lightAttenSq_22 = unity_4LightAtten0;
					  highp vec3 normal_23;
					  normal_23 = worldNormal_2;
					  highp vec3 col_24;
					  highp vec4 ndotl_25;
					  highp vec4 lengthSq_26;
					  highp vec4 tmpvar_27;
					  tmpvar_27 = (unity_4LightPosX0 - tmpvar_8.x);
					  highp vec4 tmpvar_28;
					  tmpvar_28 = (unity_4LightPosY0 - tmpvar_8.y);
					  highp vec4 tmpvar_29;
					  tmpvar_29 = (unity_4LightPosZ0 - tmpvar_8.z);
					  lengthSq_26 = (tmpvar_27 * tmpvar_27);
					  lengthSq_26 = (lengthSq_26 + (tmpvar_28 * tmpvar_28));
					  lengthSq_26 = (lengthSq_26 + (tmpvar_29 * tmpvar_29));
					  highp vec4 tmpvar_30;
					  tmpvar_30 = max (lengthSq_26, vec4(1e-06, 1e-06, 1e-06, 1e-06));
					  lengthSq_26 = tmpvar_30;
					  ndotl_25 = (tmpvar_27 * normal_23.x);
					  ndotl_25 = (ndotl_25 + (tmpvar_28 * normal_23.y));
					  ndotl_25 = (ndotl_25 + (tmpvar_29 * normal_23.z));
					  highp vec4 tmpvar_31;
					  tmpvar_31 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_25 * inversesqrt(tmpvar_30)));
					  ndotl_25 = tmpvar_31;
					  highp vec4 tmpvar_32;
					  tmpvar_32 = (tmpvar_31 * (1.0/((1.0 + 
					    (tmpvar_30 * lightAttenSq_22)
					  ))));
					  col_24 = (lightColor0_18 * tmpvar_32.x);
					  col_24 = (col_24 + (lightColor1_19 * tmpvar_32.y));
					  col_24 = (col_24 + (lightColor2_20 * tmpvar_32.z));
					  col_24 = (col_24 + (lightColor3_21 * tmpvar_32.w));
					  tmpvar_6 = (tmpvar_6 + col_24);
					  gl_Position = (glstate_matrix_mvp * tmpvar_7);
					  xlv_TEXCOORD0 = tmpvar_3;
					  xlv_TEXCOORD1 = tmpvar_4;
					  xlv_TEXCOORD2 = tmpvar_5;
					  xlv_TEXCOORD3 = tmpvar_8.xyz;
					  xlv_TEXCOORD4 = tmpvar_6;
					  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_8);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform mediump vec4 _LightShadowData;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform highp sampler2D _ShadowMapTexture;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					varying highp vec4 xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = _WorldSpaceLightPos0.xyz;
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  lowp vec3 tmpvar_7;
					  mediump float tmpvar_8;
					  lowp float tmpvar_9;
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_7 = (((tmpvar_11 * tmpvar_10.x) + (tmpvar_12 * tmpvar_10.y)) + (tmpvar_13 * tmpvar_10.z)).xyz;
					  tmpvar_9 = (((tmpvar_11.w * tmpvar_10.x) + (tmpvar_12.w * tmpvar_10.y)) + (tmpvar_13.w * tmpvar_10.z));
					  tmpvar_8 = (((_ShininessL0 * tmpvar_10.x) + (_ShininessL1 * tmpvar_10.y)) + (_ShininessL2 * tmpvar_10.z));
					  lowp float tmpvar_14;
					  highp float lightShadowDataX_15;
					  mediump float tmpvar_16;
					  tmpvar_16 = _LightShadowData.x;
					  lightShadowDataX_15 = tmpvar_16;
					  highp float tmpvar_17;
					  tmpvar_17 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_15);
					  tmpvar_14 = tmpvar_17;
					  c_1.w = 0.0;
					  c_1.xyz = (tmpvar_7 * xlv_TEXCOORD4);
					  lowp vec4 c_18;
					  lowp float spec_19;
					  lowp float tmpvar_20;
					  tmpvar_20 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_21;
					  tmpvar_21 = (pow (tmpvar_20, (tmpvar_8 * 128.0)) * tmpvar_9);
					  spec_19 = tmpvar_21;
					  c_18.xyz = (((
					    (tmpvar_7 * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_19)) * (tmpvar_14 * 2.0));
					  c_18.w = 0.0;
					  c_1.xyz = (c_1 + c_18).xyz;
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 unity_4LightPosX0;
					uniform 	vec4 unity_4LightPosY0;
					uniform 	vec4 unity_4LightPosZ0;
					uniform 	mediump vec4 unity_4LightAtten0;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					out lowp vec3 vs_TEXCOORD4;
					out highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump vec3 u_xlat16_2;
					vec4 u_xlat3;
					mediump vec4 u_xlat16_3;
					vec4 u_xlat4;
					mediump vec3 u_xlat16_4;
					vec3 u_xlat5;
					float u_xlat18;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_3 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_3);
					    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_3);
					    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_3);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_4.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat16_2.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat2 = (-u_xlat1.yyyy) + unity_4LightPosY0;
					    u_xlat3 = u_xlat0.yyyy * u_xlat2;
					    u_xlat2 = u_xlat2 * u_xlat2;
					    u_xlat4 = (-u_xlat1.xxxx) + unity_4LightPosX0;
					    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
					    u_xlat3 = u_xlat4 * u_xlat0.xxxx + u_xlat3;
					    u_xlat0 = u_xlat1 * u_xlat0.zzzz + u_xlat3;
					    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
					    u_xlat1 = u_xlat1 * u_xlat1 + u_xlat2;
					    u_xlat1 = max(u_xlat1, vec4(9.99999997e-007, 9.99999997e-007, 9.99999997e-007, 9.99999997e-007));
					    u_xlat2 = inversesqrt(u_xlat1);
					    u_xlat1 = u_xlat1 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat0 = max(u_xlat0, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat0 = u_xlat1 * u_xlat0;
					    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
					    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat5.xyz;
					    vs_TEXCOORD4.xyz = u_xlat0.xyz;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightShadowData;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					uniform lowp sampler2D _ShadowMapTexture;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					in lowp vec3 vs_TEXCOORD4;
					in highp vec4 vs_TEXCOORD5;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					lowp float u_xlat10_6;
					mediump float u_xlat16_9;
					float u_xlat21;
					lowp float u_xlat10_25;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_5.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_4.xyz = u_xlat10_5.xyz * vec3(u_xlat10_25) + u_xlat10_4.xyz;
					    vec3 txVec0 = vec3(vs_TEXCOORD5.xy,vs_TEXCOORD5.z);
					    u_xlat10_6 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_2 = (-_LightShadowData.x) + 1.0;
					    u_xlat16_2 = u_xlat10_6 * u_xlat16_2 + _LightShadowData.x;
					    u_xlat10_25 = u_xlat16_2 * 2.0;
					    u_xlat10_4.xyz = vec3(u_xlat10_25) * u_xlat10_4.xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz * vs_TEXCOORD4.xyz + u_xlat10_4.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 unity_4LightPosX0;
					uniform 	vec4 unity_4LightPosY0;
					uniform 	vec4 unity_4LightPosZ0;
					uniform 	mediump vec4 unity_4LightAtten0;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					out lowp vec3 vs_TEXCOORD4;
					out highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump vec3 u_xlat16_2;
					vec4 u_xlat3;
					mediump vec4 u_xlat16_3;
					vec4 u_xlat4;
					mediump vec3 u_xlat16_4;
					vec3 u_xlat5;
					float u_xlat18;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_3 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_3);
					    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_3);
					    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_3);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_4.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat16_2.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat2 = (-u_xlat1.yyyy) + unity_4LightPosY0;
					    u_xlat3 = u_xlat0.yyyy * u_xlat2;
					    u_xlat2 = u_xlat2 * u_xlat2;
					    u_xlat4 = (-u_xlat1.xxxx) + unity_4LightPosX0;
					    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
					    u_xlat3 = u_xlat4 * u_xlat0.xxxx + u_xlat3;
					    u_xlat0 = u_xlat1 * u_xlat0.zzzz + u_xlat3;
					    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
					    u_xlat1 = u_xlat1 * u_xlat1 + u_xlat2;
					    u_xlat1 = max(u_xlat1, vec4(9.99999997e-007, 9.99999997e-007, 9.99999997e-007, 9.99999997e-007));
					    u_xlat2 = inversesqrt(u_xlat1);
					    u_xlat1 = u_xlat1 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat0 = max(u_xlat0, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat0 = u_xlat1 * u_xlat0;
					    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
					    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat5.xyz;
					    vs_TEXCOORD4.xyz = u_xlat0.xyz;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightShadowData;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					uniform lowp sampler2D _ShadowMapTexture;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					in lowp vec3 vs_TEXCOORD4;
					in highp vec4 vs_TEXCOORD5;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					lowp float u_xlat10_6;
					mediump float u_xlat16_9;
					float u_xlat21;
					lowp float u_xlat10_25;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_5.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_4.xyz = u_xlat10_5.xyz * vec3(u_xlat10_25) + u_xlat10_4.xyz;
					    vec3 txVec0 = vec3(vs_TEXCOORD5.xy,vs_TEXCOORD5.z);
					    u_xlat10_6 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_2 = (-_LightShadowData.x) + 1.0;
					    u_xlat16_2 = u_xlat10_6 * u_xlat16_2 + _LightShadowData.x;
					    u_xlat10_25 = u_xlat16_2 * 2.0;
					    u_xlat10_4.xyz = vec3(u_xlat10_25) * u_xlat10_4.xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz * vs_TEXCOORD4.xyz + u_xlat10_4.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 unity_4LightPosX0;
					uniform 	vec4 unity_4LightPosY0;
					uniform 	vec4 unity_4LightPosZ0;
					uniform 	mediump vec4 unity_4LightAtten0;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					out lowp vec3 vs_TEXCOORD4;
					out highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump vec3 u_xlat16_2;
					vec4 u_xlat3;
					mediump vec4 u_xlat16_3;
					vec4 u_xlat4;
					mediump vec3 u_xlat16_4;
					vec3 u_xlat5;
					float u_xlat18;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_3 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_3);
					    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_3);
					    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_3);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_4.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat16_2.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat2 = (-u_xlat1.yyyy) + unity_4LightPosY0;
					    u_xlat3 = u_xlat0.yyyy * u_xlat2;
					    u_xlat2 = u_xlat2 * u_xlat2;
					    u_xlat4 = (-u_xlat1.xxxx) + unity_4LightPosX0;
					    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
					    u_xlat3 = u_xlat4 * u_xlat0.xxxx + u_xlat3;
					    u_xlat0 = u_xlat1 * u_xlat0.zzzz + u_xlat3;
					    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
					    u_xlat1 = u_xlat1 * u_xlat1 + u_xlat2;
					    u_xlat1 = max(u_xlat1, vec4(9.99999997e-007, 9.99999997e-007, 9.99999997e-007, 9.99999997e-007));
					    u_xlat2 = inversesqrt(u_xlat1);
					    u_xlat1 = u_xlat1 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat0 = max(u_xlat0, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat0 = u_xlat1 * u_xlat0;
					    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
					    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat5.xyz;
					    vs_TEXCOORD4.xyz = u_xlat0.xyz;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightShadowData;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					uniform lowp sampler2D _ShadowMapTexture;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					in lowp vec3 vs_TEXCOORD4;
					in highp vec4 vs_TEXCOORD5;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					lowp float u_xlat10_6;
					mediump float u_xlat16_9;
					float u_xlat21;
					lowp float u_xlat10_25;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_5.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_4.xyz = u_xlat10_5.xyz * vec3(u_xlat10_25) + u_xlat10_4.xyz;
					    vec3 txVec0 = vec3(vs_TEXCOORD5.xy,vs_TEXCOORD5.z);
					    u_xlat10_6 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_2 = (-_LightShadowData.x) + 1.0;
					    u_xlat16_2 = u_xlat10_6 * u_xlat16_2 + _LightShadowData.x;
					    u_xlat10_25 = u_xlat16_2 * 2.0;
					    u_xlat10_4.xyz = vec3(u_xlat10_25) * u_xlat10_4.xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz * vs_TEXCOORD4.xyz + u_xlat10_4.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					varying highp float xlv_TEXCOORD6;
					void main ()
					{
					  highp vec3 shlight_1;
					  lowp vec3 worldNormal_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  mediump vec3 tmpvar_5;
					  lowp vec3 tmpvar_6;
					  highp vec4 tmpvar_7;
					  highp vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = _glesVertex.xyz;
					  tmpvar_7 = (glstate_matrix_mvp * tmpvar_8);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_9;
					  tmpvar_9[0] = unity_WorldToObject[0].xyz;
					  tmpvar_9[1] = unity_WorldToObject[1].xyz;
					  tmpvar_9[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_10;
					  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
					  worldNormal_2 = tmpvar_10;
					  tmpvar_5 = worldNormal_2;
					  lowp vec4 tmpvar_11;
					  tmpvar_11.w = 1.0;
					  tmpvar_11.xyz = worldNormal_2;
					  mediump vec4 normal_12;
					  normal_12 = tmpvar_11;
					  mediump vec3 res_13;
					  mediump vec3 x_14;
					  x_14.x = dot (unity_SHAr, normal_12);
					  x_14.y = dot (unity_SHAg, normal_12);
					  x_14.z = dot (unity_SHAb, normal_12);
					  mediump vec3 x1_15;
					  mediump vec4 tmpvar_16;
					  tmpvar_16 = (normal_12.xyzz * normal_12.yzzx);
					  x1_15.x = dot (unity_SHBr, tmpvar_16);
					  x1_15.y = dot (unity_SHBg, tmpvar_16);
					  x1_15.z = dot (unity_SHBb, tmpvar_16);
					  res_13 = (x_14 + (x1_15 + (unity_SHC.xyz * 
					    ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y))
					  )));
					  mediump vec3 tmpvar_17;
					  tmpvar_17 = max (((1.055 * 
					    pow (max (res_13, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  res_13 = tmpvar_17;
					  shlight_1 = tmpvar_17;
					  tmpvar_6 = shlight_1;
					  highp float tmpvar_18;
					  tmpvar_18 = (unity_FogParams.x * tmpvar_7.z);
					  gl_Position = tmpvar_7;
					  xlv_TEXCOORD0 = tmpvar_3;
					  xlv_TEXCOORD1 = tmpvar_4;
					  xlv_TEXCOORD2 = tmpvar_5;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  xlv_TEXCOORD4 = tmpvar_6;
					  xlv_TEXCOORD6 = exp2((-(tmpvar_18) * tmpvar_18));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 unity_FogColor;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					varying highp float xlv_TEXCOORD6;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = _WorldSpaceLightPos0.xyz;
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  lowp vec3 tmpvar_7;
					  mediump float tmpvar_8;
					  lowp float tmpvar_9;
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_7 = (((tmpvar_11 * tmpvar_10.x) + (tmpvar_12 * tmpvar_10.y)) + (tmpvar_13 * tmpvar_10.z)).xyz;
					  tmpvar_9 = (((tmpvar_11.w * tmpvar_10.x) + (tmpvar_12.w * tmpvar_10.y)) + (tmpvar_13.w * tmpvar_10.z));
					  tmpvar_8 = (((_ShininessL0 * tmpvar_10.x) + (_ShininessL1 * tmpvar_10.y)) + (_ShininessL2 * tmpvar_10.z));
					  c_1.w = 0.0;
					  c_1.xyz = (tmpvar_7 * xlv_TEXCOORD4);
					  lowp vec4 c_14;
					  lowp float spec_15;
					  lowp float tmpvar_16;
					  tmpvar_16 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_17;
					  tmpvar_17 = (pow (tmpvar_16, (tmpvar_8 * 128.0)) * tmpvar_9);
					  spec_15 = tmpvar_17;
					  c_14.xyz = (((
					    (tmpvar_7 * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_15)) * 2.0);
					  c_14.w = 0.0;
					  c_1 = (c_1 + c_14);
					  highp float tmpvar_18;
					  tmpvar_18 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
					  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_18));
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					varying highp float xlv_TEXCOORD6;
					void main ()
					{
					  highp vec3 shlight_1;
					  lowp vec3 worldNormal_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  mediump vec3 tmpvar_5;
					  lowp vec3 tmpvar_6;
					  highp vec4 tmpvar_7;
					  highp vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = _glesVertex.xyz;
					  tmpvar_7 = (glstate_matrix_mvp * tmpvar_8);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_9;
					  tmpvar_9[0] = unity_WorldToObject[0].xyz;
					  tmpvar_9[1] = unity_WorldToObject[1].xyz;
					  tmpvar_9[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_10;
					  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
					  worldNormal_2 = tmpvar_10;
					  tmpvar_5 = worldNormal_2;
					  lowp vec4 tmpvar_11;
					  tmpvar_11.w = 1.0;
					  tmpvar_11.xyz = worldNormal_2;
					  mediump vec4 normal_12;
					  normal_12 = tmpvar_11;
					  mediump vec3 res_13;
					  mediump vec3 x_14;
					  x_14.x = dot (unity_SHAr, normal_12);
					  x_14.y = dot (unity_SHAg, normal_12);
					  x_14.z = dot (unity_SHAb, normal_12);
					  mediump vec3 x1_15;
					  mediump vec4 tmpvar_16;
					  tmpvar_16 = (normal_12.xyzz * normal_12.yzzx);
					  x1_15.x = dot (unity_SHBr, tmpvar_16);
					  x1_15.y = dot (unity_SHBg, tmpvar_16);
					  x1_15.z = dot (unity_SHBb, tmpvar_16);
					  res_13 = (x_14 + (x1_15 + (unity_SHC.xyz * 
					    ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y))
					  )));
					  mediump vec3 tmpvar_17;
					  tmpvar_17 = max (((1.055 * 
					    pow (max (res_13, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  res_13 = tmpvar_17;
					  shlight_1 = tmpvar_17;
					  tmpvar_6 = shlight_1;
					  highp float tmpvar_18;
					  tmpvar_18 = (unity_FogParams.x * tmpvar_7.z);
					  gl_Position = tmpvar_7;
					  xlv_TEXCOORD0 = tmpvar_3;
					  xlv_TEXCOORD1 = tmpvar_4;
					  xlv_TEXCOORD2 = tmpvar_5;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  xlv_TEXCOORD4 = tmpvar_6;
					  xlv_TEXCOORD6 = exp2((-(tmpvar_18) * tmpvar_18));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 unity_FogColor;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					varying highp float xlv_TEXCOORD6;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = _WorldSpaceLightPos0.xyz;
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  lowp vec3 tmpvar_7;
					  mediump float tmpvar_8;
					  lowp float tmpvar_9;
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_7 = (((tmpvar_11 * tmpvar_10.x) + (tmpvar_12 * tmpvar_10.y)) + (tmpvar_13 * tmpvar_10.z)).xyz;
					  tmpvar_9 = (((tmpvar_11.w * tmpvar_10.x) + (tmpvar_12.w * tmpvar_10.y)) + (tmpvar_13.w * tmpvar_10.z));
					  tmpvar_8 = (((_ShininessL0 * tmpvar_10.x) + (_ShininessL1 * tmpvar_10.y)) + (_ShininessL2 * tmpvar_10.z));
					  c_1.w = 0.0;
					  c_1.xyz = (tmpvar_7 * xlv_TEXCOORD4);
					  lowp vec4 c_14;
					  lowp float spec_15;
					  lowp float tmpvar_16;
					  tmpvar_16 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_17;
					  tmpvar_17 = (pow (tmpvar_16, (tmpvar_8 * 128.0)) * tmpvar_9);
					  spec_15 = tmpvar_17;
					  c_14.xyz = (((
					    (tmpvar_7 * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_15)) * 2.0);
					  c_14.w = 0.0;
					  c_1 = (c_1 + c_14);
					  highp float tmpvar_18;
					  tmpvar_18 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
					  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_18));
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					varying highp float xlv_TEXCOORD6;
					void main ()
					{
					  highp vec3 shlight_1;
					  lowp vec3 worldNormal_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  mediump vec3 tmpvar_5;
					  lowp vec3 tmpvar_6;
					  highp vec4 tmpvar_7;
					  highp vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = _glesVertex.xyz;
					  tmpvar_7 = (glstate_matrix_mvp * tmpvar_8);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_9;
					  tmpvar_9[0] = unity_WorldToObject[0].xyz;
					  tmpvar_9[1] = unity_WorldToObject[1].xyz;
					  tmpvar_9[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_10;
					  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
					  worldNormal_2 = tmpvar_10;
					  tmpvar_5 = worldNormal_2;
					  lowp vec4 tmpvar_11;
					  tmpvar_11.w = 1.0;
					  tmpvar_11.xyz = worldNormal_2;
					  mediump vec4 normal_12;
					  normal_12 = tmpvar_11;
					  mediump vec3 res_13;
					  mediump vec3 x_14;
					  x_14.x = dot (unity_SHAr, normal_12);
					  x_14.y = dot (unity_SHAg, normal_12);
					  x_14.z = dot (unity_SHAb, normal_12);
					  mediump vec3 x1_15;
					  mediump vec4 tmpvar_16;
					  tmpvar_16 = (normal_12.xyzz * normal_12.yzzx);
					  x1_15.x = dot (unity_SHBr, tmpvar_16);
					  x1_15.y = dot (unity_SHBg, tmpvar_16);
					  x1_15.z = dot (unity_SHBb, tmpvar_16);
					  res_13 = (x_14 + (x1_15 + (unity_SHC.xyz * 
					    ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y))
					  )));
					  mediump vec3 tmpvar_17;
					  tmpvar_17 = max (((1.055 * 
					    pow (max (res_13, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  res_13 = tmpvar_17;
					  shlight_1 = tmpvar_17;
					  tmpvar_6 = shlight_1;
					  highp float tmpvar_18;
					  tmpvar_18 = (unity_FogParams.x * tmpvar_7.z);
					  gl_Position = tmpvar_7;
					  xlv_TEXCOORD0 = tmpvar_3;
					  xlv_TEXCOORD1 = tmpvar_4;
					  xlv_TEXCOORD2 = tmpvar_5;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  xlv_TEXCOORD4 = tmpvar_6;
					  xlv_TEXCOORD6 = exp2((-(tmpvar_18) * tmpvar_18));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 unity_FogColor;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					varying highp float xlv_TEXCOORD6;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = _WorldSpaceLightPos0.xyz;
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  lowp vec3 tmpvar_7;
					  mediump float tmpvar_8;
					  lowp float tmpvar_9;
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_7 = (((tmpvar_11 * tmpvar_10.x) + (tmpvar_12 * tmpvar_10.y)) + (tmpvar_13 * tmpvar_10.z)).xyz;
					  tmpvar_9 = (((tmpvar_11.w * tmpvar_10.x) + (tmpvar_12.w * tmpvar_10.y)) + (tmpvar_13.w * tmpvar_10.z));
					  tmpvar_8 = (((_ShininessL0 * tmpvar_10.x) + (_ShininessL1 * tmpvar_10.y)) + (_ShininessL2 * tmpvar_10.z));
					  c_1.w = 0.0;
					  c_1.xyz = (tmpvar_7 * xlv_TEXCOORD4);
					  lowp vec4 c_14;
					  lowp float spec_15;
					  lowp float tmpvar_16;
					  tmpvar_16 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_17;
					  tmpvar_17 = (pow (tmpvar_16, (tmpvar_8 * 128.0)) * tmpvar_9);
					  spec_15 = tmpvar_17;
					  c_14.xyz = (((
					    (tmpvar_7 * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_15)) * 2.0);
					  c_14.w = 0.0;
					  c_1 = (c_1 + c_14);
					  highp float tmpvar_18;
					  tmpvar_18 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
					  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_18));
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp float vs_TEXCOORD6;
					out highp vec3 vs_TEXCOORD3;
					out lowp vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec3 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD6 = exp2(u_xlat0.x);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD4.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 unity_FogColor;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp float vs_TEXCOORD6;
					in highp vec3 vs_TEXCOORD3;
					in lowp vec3 vs_TEXCOORD4;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec3 u_xlat6;
					mediump vec3 u_xlat16_6;
					mediump float u_xlat16_9;
					float u_xlat21;
					lowp float u_xlat10_25;
					float u_xlat27;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_5.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_4.xyz = u_xlat10_5.xyz * vec3(u_xlat10_25) + u_xlat10_4.xyz;
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0);
					    u_xlat10_4.xyz = u_xlat10_0.xyz * vs_TEXCOORD4.xyz + u_xlat10_4.xyz;
					    u_xlat16_6.xyz = u_xlat10_4.xyz + (-unity_FogColor.xyz);
					    u_xlat27 = vs_TEXCOORD6;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
					#else
					    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
					#endif
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat16_6.xyz + unity_FogColor.xyz;
					    SV_Target0.xyz = u_xlat6.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp float vs_TEXCOORD6;
					out highp vec3 vs_TEXCOORD3;
					out lowp vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec3 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD6 = exp2(u_xlat0.x);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD4.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 unity_FogColor;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp float vs_TEXCOORD6;
					in highp vec3 vs_TEXCOORD3;
					in lowp vec3 vs_TEXCOORD4;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec3 u_xlat6;
					mediump vec3 u_xlat16_6;
					mediump float u_xlat16_9;
					float u_xlat21;
					lowp float u_xlat10_25;
					float u_xlat27;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_5.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_4.xyz = u_xlat10_5.xyz * vec3(u_xlat10_25) + u_xlat10_4.xyz;
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0);
					    u_xlat10_4.xyz = u_xlat10_0.xyz * vs_TEXCOORD4.xyz + u_xlat10_4.xyz;
					    u_xlat16_6.xyz = u_xlat10_4.xyz + (-unity_FogColor.xyz);
					    u_xlat27 = vs_TEXCOORD6;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
					#else
					    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
					#endif
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat16_6.xyz + unity_FogColor.xyz;
					    SV_Target0.xyz = u_xlat6.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp float vs_TEXCOORD6;
					out highp vec3 vs_TEXCOORD3;
					out lowp vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec3 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD6 = exp2(u_xlat0.x);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD4.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 unity_FogColor;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp float vs_TEXCOORD6;
					in highp vec3 vs_TEXCOORD3;
					in lowp vec3 vs_TEXCOORD4;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec3 u_xlat6;
					mediump vec3 u_xlat16_6;
					mediump float u_xlat16_9;
					float u_xlat21;
					lowp float u_xlat10_25;
					float u_xlat27;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_5.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_4.xyz = u_xlat10_5.xyz * vec3(u_xlat10_25) + u_xlat10_4.xyz;
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0);
					    u_xlat10_4.xyz = u_xlat10_0.xyz * vs_TEXCOORD4.xyz + u_xlat10_4.xyz;
					    u_xlat16_6.xyz = u_xlat10_4.xyz + (-unity_FogColor.xyz);
					    u_xlat27 = vs_TEXCOORD6;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
					#else
					    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
					#endif
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat16_6.xyz + unity_FogColor.xyz;
					    SV_Target0.xyz = u_xlat6.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp vec4 xlv_TEXCOORD4;
					varying highp float xlv_TEXCOORD6;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  highp vec4 tmpvar_6;
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = _glesVertex.xyz;
					  tmpvar_6 = (glstate_matrix_mvp * tmpvar_7);
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
					  worldNormal_1 = tmpvar_9;
					  tmpvar_4 = worldNormal_1;
					  tmpvar_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  highp float tmpvar_10;
					  tmpvar_10 = (unity_FogParams.x * tmpvar_6.z);
					  gl_Position = tmpvar_6;
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  xlv_TEXCOORD4 = tmpvar_5;
					  xlv_TEXCOORD6 = exp2((-(tmpvar_10) * tmpvar_10));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D unity_Lightmap;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec4 xlv_TEXCOORD4;
					varying highp float xlv_TEXCOORD6;
					void main ()
					{
					  lowp vec3 lm_1;
					  lowp vec4 c_2;
					  lowp vec3 tmpvar_3;
					  tmpvar_3 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = (2.0 * tmpvar_4.xyz);
					  lm_1 = tmpvar_5;
					  c_2.w = 0.0;
					  c_2.xyz = (((
					    (texture2D (_Splat0, xlv_TEXCOORD0.zw) * tmpvar_3.x)
					   + 
					    (texture2D (_Splat1, xlv_TEXCOORD1.xy) * tmpvar_3.y)
					  ) + (texture2D (_Splat2, xlv_TEXCOORD1.zw) * tmpvar_3.z)).xyz * lm_1);
					  highp float tmpvar_6;
					  tmpvar_6 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
					  c_2.xyz = mix (unity_FogColor.xyz, c_2.xyz, vec3(tmpvar_6));
					  c_2.w = 1.0;
					  gl_FragData[0] = c_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp vec4 xlv_TEXCOORD4;
					varying highp float xlv_TEXCOORD6;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  highp vec4 tmpvar_6;
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = _glesVertex.xyz;
					  tmpvar_6 = (glstate_matrix_mvp * tmpvar_7);
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
					  worldNormal_1 = tmpvar_9;
					  tmpvar_4 = worldNormal_1;
					  tmpvar_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  highp float tmpvar_10;
					  tmpvar_10 = (unity_FogParams.x * tmpvar_6.z);
					  gl_Position = tmpvar_6;
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  xlv_TEXCOORD4 = tmpvar_5;
					  xlv_TEXCOORD6 = exp2((-(tmpvar_10) * tmpvar_10));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D unity_Lightmap;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec4 xlv_TEXCOORD4;
					varying highp float xlv_TEXCOORD6;
					void main ()
					{
					  lowp vec3 lm_1;
					  lowp vec4 c_2;
					  lowp vec3 tmpvar_3;
					  tmpvar_3 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = (2.0 * tmpvar_4.xyz);
					  lm_1 = tmpvar_5;
					  c_2.w = 0.0;
					  c_2.xyz = (((
					    (texture2D (_Splat0, xlv_TEXCOORD0.zw) * tmpvar_3.x)
					   + 
					    (texture2D (_Splat1, xlv_TEXCOORD1.xy) * tmpvar_3.y)
					  ) + (texture2D (_Splat2, xlv_TEXCOORD1.zw) * tmpvar_3.z)).xyz * lm_1);
					  highp float tmpvar_6;
					  tmpvar_6 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
					  c_2.xyz = mix (unity_FogColor.xyz, c_2.xyz, vec3(tmpvar_6));
					  c_2.w = 1.0;
					  gl_FragData[0] = c_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp vec4 xlv_TEXCOORD4;
					varying highp float xlv_TEXCOORD6;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  highp vec4 tmpvar_6;
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = _glesVertex.xyz;
					  tmpvar_6 = (glstate_matrix_mvp * tmpvar_7);
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
					  worldNormal_1 = tmpvar_9;
					  tmpvar_4 = worldNormal_1;
					  tmpvar_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  highp float tmpvar_10;
					  tmpvar_10 = (unity_FogParams.x * tmpvar_6.z);
					  gl_Position = tmpvar_6;
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  xlv_TEXCOORD4 = tmpvar_5;
					  xlv_TEXCOORD6 = exp2((-(tmpvar_10) * tmpvar_10));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D unity_Lightmap;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec4 xlv_TEXCOORD4;
					varying highp float xlv_TEXCOORD6;
					void main ()
					{
					  lowp vec3 lm_1;
					  lowp vec4 c_2;
					  lowp vec3 tmpvar_3;
					  tmpvar_3 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = (2.0 * tmpvar_4.xyz);
					  lm_1 = tmpvar_5;
					  c_2.w = 0.0;
					  c_2.xyz = (((
					    (texture2D (_Splat0, xlv_TEXCOORD0.zw) * tmpvar_3.x)
					   + 
					    (texture2D (_Splat1, xlv_TEXCOORD1.xy) * tmpvar_3.y)
					  ) + (texture2D (_Splat2, xlv_TEXCOORD1.zw) * tmpvar_3.z)).xyz * lm_1);
					  highp float tmpvar_6;
					  tmpvar_6 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
					  c_2.xyz = mix (unity_FogColor.xyz, c_2.xyz, vec3(tmpvar_6));
					  c_2.w = 1.0;
					  gl_FragData[0] = c_2;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_EXP2" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 unity_LightmapST;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					in highp vec4 in_TEXCOORD1;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp float vs_TEXCOORD6;
					out highp vec3 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD4;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD6 = exp2(u_xlat0.x);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	lowp vec4 unity_FogColor;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2D unity_Lightmap;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp float vs_TEXCOORD6;
					in highp vec4 vs_TEXCOORD4;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					lowp vec3 u_xlat10_1;
					lowp vec3 u_xlat10_2;
					lowp vec3 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					float u_xlat15;
					void main()
					{
					    u_xlat10_0.xyz = texture(_Splat0, vs_TEXCOORD0.zw).xyz;
					    u_xlat10_1.xyz = texture(_Splat1, vs_TEXCOORD1.xy).xyz;
					    u_xlat10_2.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_3.xyz = u_xlat10_1.xyz * u_xlat10_2.yyy;
					    u_xlat10_3.xyz = u_xlat10_0.xyz * u_xlat10_2.xxx + u_xlat10_3.xyz;
					    u_xlat10_0.xyz = texture(_Splat2, vs_TEXCOORD1.zw).xyz;
					    u_xlat10_3.xyz = u_xlat10_0.xyz * u_xlat10_2.zzz + u_xlat10_3.xyz;
					    u_xlat10_0.xyz = texture(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0);
					    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat10_4.xyz + (-unity_FogColor.xyz);
					    u_xlat15 = vs_TEXCOORD6;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
					#else
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					#endif
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat16_0.xyz + unity_FogColor.xyz;
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_EXP2" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 unity_LightmapST;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					in highp vec4 in_TEXCOORD1;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp float vs_TEXCOORD6;
					out highp vec3 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD4;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD6 = exp2(u_xlat0.x);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	lowp vec4 unity_FogColor;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2D unity_Lightmap;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp float vs_TEXCOORD6;
					in highp vec4 vs_TEXCOORD4;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					lowp vec3 u_xlat10_1;
					lowp vec3 u_xlat10_2;
					lowp vec3 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					float u_xlat15;
					void main()
					{
					    u_xlat10_0.xyz = texture(_Splat0, vs_TEXCOORD0.zw).xyz;
					    u_xlat10_1.xyz = texture(_Splat1, vs_TEXCOORD1.xy).xyz;
					    u_xlat10_2.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_3.xyz = u_xlat10_1.xyz * u_xlat10_2.yyy;
					    u_xlat10_3.xyz = u_xlat10_0.xyz * u_xlat10_2.xxx + u_xlat10_3.xyz;
					    u_xlat10_0.xyz = texture(_Splat2, vs_TEXCOORD1.zw).xyz;
					    u_xlat10_3.xyz = u_xlat10_0.xyz * u_xlat10_2.zzz + u_xlat10_3.xyz;
					    u_xlat10_0.xyz = texture(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0);
					    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat10_4.xyz + (-unity_FogColor.xyz);
					    u_xlat15 = vs_TEXCOORD6;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
					#else
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					#endif
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat16_0.xyz + unity_FogColor.xyz;
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_EXP2" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 unity_LightmapST;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					in highp vec4 in_TEXCOORD1;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp float vs_TEXCOORD6;
					out highp vec3 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD4;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD6 = exp2(u_xlat0.x);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	lowp vec4 unity_FogColor;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2D unity_Lightmap;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp float vs_TEXCOORD6;
					in highp vec4 vs_TEXCOORD4;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					lowp vec3 u_xlat10_1;
					lowp vec3 u_xlat10_2;
					lowp vec3 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					float u_xlat15;
					void main()
					{
					    u_xlat10_0.xyz = texture(_Splat0, vs_TEXCOORD0.zw).xyz;
					    u_xlat10_1.xyz = texture(_Splat1, vs_TEXCOORD1.xy).xyz;
					    u_xlat10_2.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_3.xyz = u_xlat10_1.xyz * u_xlat10_2.yyy;
					    u_xlat10_3.xyz = u_xlat10_0.xyz * u_xlat10_2.xxx + u_xlat10_3.xyz;
					    u_xlat10_0.xyz = texture(_Splat2, vs_TEXCOORD1.zw).xyz;
					    u_xlat10_3.xyz = u_xlat10_0.xyz * u_xlat10_2.zzz + u_xlat10_3.xyz;
					    u_xlat10_0.xyz = texture(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0);
					    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat10_4.xyz + (-unity_FogColor.xyz);
					    u_xlat15 = vs_TEXCOORD6;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
					#else
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					#endif
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat16_0.xyz + unity_FogColor.xyz;
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_WorldToShadow[4];
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					varying highp vec4 xlv_TEXCOORD5;
					varying highp float xlv_TEXCOORD6;
					void main ()
					{
					  highp vec3 shlight_1;
					  lowp vec3 worldNormal_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  mediump vec3 tmpvar_5;
					  lowp vec3 tmpvar_6;
					  highp vec4 tmpvar_7;
					  highp vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = _glesVertex.xyz;
					  tmpvar_7 = (glstate_matrix_mvp * tmpvar_8);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_9;
					  tmpvar_9[0] = unity_WorldToObject[0].xyz;
					  tmpvar_9[1] = unity_WorldToObject[1].xyz;
					  tmpvar_9[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_10;
					  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
					  worldNormal_2 = tmpvar_10;
					  tmpvar_5 = worldNormal_2;
					  lowp vec4 tmpvar_11;
					  tmpvar_11.w = 1.0;
					  tmpvar_11.xyz = worldNormal_2;
					  mediump vec4 normal_12;
					  normal_12 = tmpvar_11;
					  mediump vec3 res_13;
					  mediump vec3 x_14;
					  x_14.x = dot (unity_SHAr, normal_12);
					  x_14.y = dot (unity_SHAg, normal_12);
					  x_14.z = dot (unity_SHAb, normal_12);
					  mediump vec3 x1_15;
					  mediump vec4 tmpvar_16;
					  tmpvar_16 = (normal_12.xyzz * normal_12.yzzx);
					  x1_15.x = dot (unity_SHBr, tmpvar_16);
					  x1_15.y = dot (unity_SHBg, tmpvar_16);
					  x1_15.z = dot (unity_SHBb, tmpvar_16);
					  res_13 = (x_14 + (x1_15 + (unity_SHC.xyz * 
					    ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y))
					  )));
					  mediump vec3 tmpvar_17;
					  tmpvar_17 = max (((1.055 * 
					    pow (max (res_13, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  res_13 = tmpvar_17;
					  shlight_1 = tmpvar_17;
					  tmpvar_6 = shlight_1;
					  highp float tmpvar_18;
					  tmpvar_18 = (unity_FogParams.x * tmpvar_7.z);
					  gl_Position = tmpvar_7;
					  xlv_TEXCOORD0 = tmpvar_3;
					  xlv_TEXCOORD1 = tmpvar_4;
					  xlv_TEXCOORD2 = tmpvar_5;
					  highp vec4 tmpvar_19;
					  tmpvar_19 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD3 = tmpvar_19.xyz;
					  xlv_TEXCOORD4 = tmpvar_6;
					  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_19);
					  xlv_TEXCOORD6 = exp2((-(tmpvar_18) * tmpvar_18));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform mediump vec4 _LightShadowData;
					uniform lowp vec4 unity_FogColor;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform highp sampler2D _ShadowMapTexture;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					varying highp vec4 xlv_TEXCOORD5;
					varying highp float xlv_TEXCOORD6;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = _WorldSpaceLightPos0.xyz;
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  lowp vec3 tmpvar_7;
					  mediump float tmpvar_8;
					  lowp float tmpvar_9;
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_7 = (((tmpvar_11 * tmpvar_10.x) + (tmpvar_12 * tmpvar_10.y)) + (tmpvar_13 * tmpvar_10.z)).xyz;
					  tmpvar_9 = (((tmpvar_11.w * tmpvar_10.x) + (tmpvar_12.w * tmpvar_10.y)) + (tmpvar_13.w * tmpvar_10.z));
					  tmpvar_8 = (((_ShininessL0 * tmpvar_10.x) + (_ShininessL1 * tmpvar_10.y)) + (_ShininessL2 * tmpvar_10.z));
					  lowp float tmpvar_14;
					  highp float lightShadowDataX_15;
					  mediump float tmpvar_16;
					  tmpvar_16 = _LightShadowData.x;
					  lightShadowDataX_15 = tmpvar_16;
					  highp float tmpvar_17;
					  tmpvar_17 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_15);
					  tmpvar_14 = tmpvar_17;
					  c_1.w = 0.0;
					  c_1.xyz = (tmpvar_7 * xlv_TEXCOORD4);
					  lowp vec4 c_18;
					  lowp float spec_19;
					  lowp float tmpvar_20;
					  tmpvar_20 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_21;
					  tmpvar_21 = (pow (tmpvar_20, (tmpvar_8 * 128.0)) * tmpvar_9);
					  spec_19 = tmpvar_21;
					  c_18.xyz = (((
					    (tmpvar_7 * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_19)) * (tmpvar_14 * 2.0));
					  c_18.w = 0.0;
					  c_1 = (c_1 + c_18);
					  highp float tmpvar_22;
					  tmpvar_22 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
					  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_22));
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_WorldToShadow[4];
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					varying highp vec4 xlv_TEXCOORD5;
					varying highp float xlv_TEXCOORD6;
					void main ()
					{
					  highp vec3 shlight_1;
					  lowp vec3 worldNormal_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  mediump vec3 tmpvar_5;
					  lowp vec3 tmpvar_6;
					  highp vec4 tmpvar_7;
					  highp vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = _glesVertex.xyz;
					  tmpvar_7 = (glstate_matrix_mvp * tmpvar_8);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_9;
					  tmpvar_9[0] = unity_WorldToObject[0].xyz;
					  tmpvar_9[1] = unity_WorldToObject[1].xyz;
					  tmpvar_9[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_10;
					  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
					  worldNormal_2 = tmpvar_10;
					  tmpvar_5 = worldNormal_2;
					  lowp vec4 tmpvar_11;
					  tmpvar_11.w = 1.0;
					  tmpvar_11.xyz = worldNormal_2;
					  mediump vec4 normal_12;
					  normal_12 = tmpvar_11;
					  mediump vec3 res_13;
					  mediump vec3 x_14;
					  x_14.x = dot (unity_SHAr, normal_12);
					  x_14.y = dot (unity_SHAg, normal_12);
					  x_14.z = dot (unity_SHAb, normal_12);
					  mediump vec3 x1_15;
					  mediump vec4 tmpvar_16;
					  tmpvar_16 = (normal_12.xyzz * normal_12.yzzx);
					  x1_15.x = dot (unity_SHBr, tmpvar_16);
					  x1_15.y = dot (unity_SHBg, tmpvar_16);
					  x1_15.z = dot (unity_SHBb, tmpvar_16);
					  res_13 = (x_14 + (x1_15 + (unity_SHC.xyz * 
					    ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y))
					  )));
					  mediump vec3 tmpvar_17;
					  tmpvar_17 = max (((1.055 * 
					    pow (max (res_13, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  res_13 = tmpvar_17;
					  shlight_1 = tmpvar_17;
					  tmpvar_6 = shlight_1;
					  highp float tmpvar_18;
					  tmpvar_18 = (unity_FogParams.x * tmpvar_7.z);
					  gl_Position = tmpvar_7;
					  xlv_TEXCOORD0 = tmpvar_3;
					  xlv_TEXCOORD1 = tmpvar_4;
					  xlv_TEXCOORD2 = tmpvar_5;
					  highp vec4 tmpvar_19;
					  tmpvar_19 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD3 = tmpvar_19.xyz;
					  xlv_TEXCOORD4 = tmpvar_6;
					  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_19);
					  xlv_TEXCOORD6 = exp2((-(tmpvar_18) * tmpvar_18));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform mediump vec4 _LightShadowData;
					uniform lowp vec4 unity_FogColor;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform highp sampler2D _ShadowMapTexture;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					varying highp vec4 xlv_TEXCOORD5;
					varying highp float xlv_TEXCOORD6;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = _WorldSpaceLightPos0.xyz;
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  lowp vec3 tmpvar_7;
					  mediump float tmpvar_8;
					  lowp float tmpvar_9;
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_7 = (((tmpvar_11 * tmpvar_10.x) + (tmpvar_12 * tmpvar_10.y)) + (tmpvar_13 * tmpvar_10.z)).xyz;
					  tmpvar_9 = (((tmpvar_11.w * tmpvar_10.x) + (tmpvar_12.w * tmpvar_10.y)) + (tmpvar_13.w * tmpvar_10.z));
					  tmpvar_8 = (((_ShininessL0 * tmpvar_10.x) + (_ShininessL1 * tmpvar_10.y)) + (_ShininessL2 * tmpvar_10.z));
					  lowp float tmpvar_14;
					  highp float lightShadowDataX_15;
					  mediump float tmpvar_16;
					  tmpvar_16 = _LightShadowData.x;
					  lightShadowDataX_15 = tmpvar_16;
					  highp float tmpvar_17;
					  tmpvar_17 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_15);
					  tmpvar_14 = tmpvar_17;
					  c_1.w = 0.0;
					  c_1.xyz = (tmpvar_7 * xlv_TEXCOORD4);
					  lowp vec4 c_18;
					  lowp float spec_19;
					  lowp float tmpvar_20;
					  tmpvar_20 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_21;
					  tmpvar_21 = (pow (tmpvar_20, (tmpvar_8 * 128.0)) * tmpvar_9);
					  spec_19 = tmpvar_21;
					  c_18.xyz = (((
					    (tmpvar_7 * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_19)) * (tmpvar_14 * 2.0));
					  c_18.w = 0.0;
					  c_1 = (c_1 + c_18);
					  highp float tmpvar_22;
					  tmpvar_22 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
					  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_22));
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_WorldToShadow[4];
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					varying highp vec4 xlv_TEXCOORD5;
					varying highp float xlv_TEXCOORD6;
					void main ()
					{
					  highp vec3 shlight_1;
					  lowp vec3 worldNormal_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  mediump vec3 tmpvar_5;
					  lowp vec3 tmpvar_6;
					  highp vec4 tmpvar_7;
					  highp vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = _glesVertex.xyz;
					  tmpvar_7 = (glstate_matrix_mvp * tmpvar_8);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_9;
					  tmpvar_9[0] = unity_WorldToObject[0].xyz;
					  tmpvar_9[1] = unity_WorldToObject[1].xyz;
					  tmpvar_9[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_10;
					  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
					  worldNormal_2 = tmpvar_10;
					  tmpvar_5 = worldNormal_2;
					  lowp vec4 tmpvar_11;
					  tmpvar_11.w = 1.0;
					  tmpvar_11.xyz = worldNormal_2;
					  mediump vec4 normal_12;
					  normal_12 = tmpvar_11;
					  mediump vec3 res_13;
					  mediump vec3 x_14;
					  x_14.x = dot (unity_SHAr, normal_12);
					  x_14.y = dot (unity_SHAg, normal_12);
					  x_14.z = dot (unity_SHAb, normal_12);
					  mediump vec3 x1_15;
					  mediump vec4 tmpvar_16;
					  tmpvar_16 = (normal_12.xyzz * normal_12.yzzx);
					  x1_15.x = dot (unity_SHBr, tmpvar_16);
					  x1_15.y = dot (unity_SHBg, tmpvar_16);
					  x1_15.z = dot (unity_SHBb, tmpvar_16);
					  res_13 = (x_14 + (x1_15 + (unity_SHC.xyz * 
					    ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y))
					  )));
					  mediump vec3 tmpvar_17;
					  tmpvar_17 = max (((1.055 * 
					    pow (max (res_13, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  res_13 = tmpvar_17;
					  shlight_1 = tmpvar_17;
					  tmpvar_6 = shlight_1;
					  highp float tmpvar_18;
					  tmpvar_18 = (unity_FogParams.x * tmpvar_7.z);
					  gl_Position = tmpvar_7;
					  xlv_TEXCOORD0 = tmpvar_3;
					  xlv_TEXCOORD1 = tmpvar_4;
					  xlv_TEXCOORD2 = tmpvar_5;
					  highp vec4 tmpvar_19;
					  tmpvar_19 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD3 = tmpvar_19.xyz;
					  xlv_TEXCOORD4 = tmpvar_6;
					  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_19);
					  xlv_TEXCOORD6 = exp2((-(tmpvar_18) * tmpvar_18));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform mediump vec4 _LightShadowData;
					uniform lowp vec4 unity_FogColor;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform highp sampler2D _ShadowMapTexture;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					varying highp vec4 xlv_TEXCOORD5;
					varying highp float xlv_TEXCOORD6;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = _WorldSpaceLightPos0.xyz;
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  lowp vec3 tmpvar_7;
					  mediump float tmpvar_8;
					  lowp float tmpvar_9;
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_7 = (((tmpvar_11 * tmpvar_10.x) + (tmpvar_12 * tmpvar_10.y)) + (tmpvar_13 * tmpvar_10.z)).xyz;
					  tmpvar_9 = (((tmpvar_11.w * tmpvar_10.x) + (tmpvar_12.w * tmpvar_10.y)) + (tmpvar_13.w * tmpvar_10.z));
					  tmpvar_8 = (((_ShininessL0 * tmpvar_10.x) + (_ShininessL1 * tmpvar_10.y)) + (_ShininessL2 * tmpvar_10.z));
					  lowp float tmpvar_14;
					  highp float lightShadowDataX_15;
					  mediump float tmpvar_16;
					  tmpvar_16 = _LightShadowData.x;
					  lightShadowDataX_15 = tmpvar_16;
					  highp float tmpvar_17;
					  tmpvar_17 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_15);
					  tmpvar_14 = tmpvar_17;
					  c_1.w = 0.0;
					  c_1.xyz = (tmpvar_7 * xlv_TEXCOORD4);
					  lowp vec4 c_18;
					  lowp float spec_19;
					  lowp float tmpvar_20;
					  tmpvar_20 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_21;
					  tmpvar_21 = (pow (tmpvar_20, (tmpvar_8 * 128.0)) * tmpvar_9);
					  spec_19 = tmpvar_21;
					  c_18.xyz = (((
					    (tmpvar_7 * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_19)) * (tmpvar_14 * 2.0));
					  c_18.w = 0.0;
					  c_1 = (c_1 + c_18);
					  highp float tmpvar_22;
					  tmpvar_22 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
					  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_22));
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_EXP2" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp float vs_TEXCOORD6;
					out highp vec3 vs_TEXCOORD3;
					out lowp vec3 vs_TEXCOORD4;
					out highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD6 = exp2(u_xlat0.x);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD4.xyz = u_xlat0.xyz;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightShadowData;
					uniform 	lowp vec4 unity_FogColor;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					uniform lowp sampler2D _ShadowMapTexture;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp float vs_TEXCOORD6;
					in highp vec3 vs_TEXCOORD3;
					in lowp vec3 vs_TEXCOORD4;
					in highp vec4 vs_TEXCOORD5;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec3 u_xlat6;
					mediump vec3 u_xlat16_6;
					lowp float u_xlat10_6;
					mediump float u_xlat16_9;
					float u_xlat21;
					lowp float u_xlat10_25;
					float u_xlat27;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_5.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_4.xyz = u_xlat10_5.xyz * vec3(u_xlat10_25) + u_xlat10_4.xyz;
					    vec3 txVec0 = vec3(vs_TEXCOORD5.xy,vs_TEXCOORD5.z);
					    u_xlat10_6 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_2 = (-_LightShadowData.x) + 1.0;
					    u_xlat16_2 = u_xlat10_6 * u_xlat16_2 + _LightShadowData.x;
					    u_xlat10_25 = u_xlat16_2 * 2.0;
					    u_xlat10_4.xyz = vec3(u_xlat10_25) * u_xlat10_4.xyz;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * vs_TEXCOORD4.xyz + u_xlat10_4.xyz;
					    u_xlat16_6.xyz = u_xlat10_4.xyz + (-unity_FogColor.xyz);
					    u_xlat27 = vs_TEXCOORD6;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
					#else
					    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
					#endif
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat16_6.xyz + unity_FogColor.xyz;
					    SV_Target0.xyz = u_xlat6.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_EXP2" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp float vs_TEXCOORD6;
					out highp vec3 vs_TEXCOORD3;
					out lowp vec3 vs_TEXCOORD4;
					out highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD6 = exp2(u_xlat0.x);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD4.xyz = u_xlat0.xyz;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightShadowData;
					uniform 	lowp vec4 unity_FogColor;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					uniform lowp sampler2D _ShadowMapTexture;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp float vs_TEXCOORD6;
					in highp vec3 vs_TEXCOORD3;
					in lowp vec3 vs_TEXCOORD4;
					in highp vec4 vs_TEXCOORD5;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec3 u_xlat6;
					mediump vec3 u_xlat16_6;
					lowp float u_xlat10_6;
					mediump float u_xlat16_9;
					float u_xlat21;
					lowp float u_xlat10_25;
					float u_xlat27;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_5.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_4.xyz = u_xlat10_5.xyz * vec3(u_xlat10_25) + u_xlat10_4.xyz;
					    vec3 txVec0 = vec3(vs_TEXCOORD5.xy,vs_TEXCOORD5.z);
					    u_xlat10_6 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_2 = (-_LightShadowData.x) + 1.0;
					    u_xlat16_2 = u_xlat10_6 * u_xlat16_2 + _LightShadowData.x;
					    u_xlat10_25 = u_xlat16_2 * 2.0;
					    u_xlat10_4.xyz = vec3(u_xlat10_25) * u_xlat10_4.xyz;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * vs_TEXCOORD4.xyz + u_xlat10_4.xyz;
					    u_xlat16_6.xyz = u_xlat10_4.xyz + (-unity_FogColor.xyz);
					    u_xlat27 = vs_TEXCOORD6;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
					#else
					    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
					#endif
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat16_6.xyz + unity_FogColor.xyz;
					    SV_Target0.xyz = u_xlat6.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_EXP2" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp float vs_TEXCOORD6;
					out highp vec3 vs_TEXCOORD3;
					out lowp vec3 vs_TEXCOORD4;
					out highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD6 = exp2(u_xlat0.x);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD4.xyz = u_xlat0.xyz;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightShadowData;
					uniform 	lowp vec4 unity_FogColor;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					uniform lowp sampler2D _ShadowMapTexture;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp float vs_TEXCOORD6;
					in highp vec3 vs_TEXCOORD3;
					in lowp vec3 vs_TEXCOORD4;
					in highp vec4 vs_TEXCOORD5;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec3 u_xlat6;
					mediump vec3 u_xlat16_6;
					lowp float u_xlat10_6;
					mediump float u_xlat16_9;
					float u_xlat21;
					lowp float u_xlat10_25;
					float u_xlat27;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_5.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_4.xyz = u_xlat10_5.xyz * vec3(u_xlat10_25) + u_xlat10_4.xyz;
					    vec3 txVec0 = vec3(vs_TEXCOORD5.xy,vs_TEXCOORD5.z);
					    u_xlat10_6 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_2 = (-_LightShadowData.x) + 1.0;
					    u_xlat16_2 = u_xlat10_6 * u_xlat16_2 + _LightShadowData.x;
					    u_xlat10_25 = u_xlat16_2 * 2.0;
					    u_xlat10_4.xyz = vec3(u_xlat10_25) * u_xlat10_4.xyz;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * vs_TEXCOORD4.xyz + u_xlat10_4.xyz;
					    u_xlat16_6.xyz = u_xlat10_4.xyz + (-unity_FogColor.xyz);
					    u_xlat27 = vs_TEXCOORD6;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
					#else
					    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
					#endif
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat16_6.xyz + unity_FogColor.xyz;
					    SV_Target0.xyz = u_xlat6.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_WorldToShadow[4];
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp vec4 xlv_TEXCOORD4;
					varying highp vec4 xlv_TEXCOORD5;
					varying highp float xlv_TEXCOORD6;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  highp vec4 tmpvar_6;
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = _glesVertex.xyz;
					  tmpvar_6 = (glstate_matrix_mvp * tmpvar_7);
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
					  worldNormal_1 = tmpvar_9;
					  tmpvar_4 = worldNormal_1;
					  tmpvar_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  highp float tmpvar_10;
					  tmpvar_10 = (unity_FogParams.x * tmpvar_6.z);
					  gl_Position = tmpvar_6;
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  highp vec4 tmpvar_11;
					  tmpvar_11 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD3 = tmpvar_11.xyz;
					  xlv_TEXCOORD4 = tmpvar_5;
					  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_11);
					  xlv_TEXCOORD6 = exp2((-(tmpvar_10) * tmpvar_10));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump vec4 _LightShadowData;
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D unity_Lightmap;
					uniform highp sampler2D _ShadowMapTexture;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec4 xlv_TEXCOORD4;
					varying highp vec4 xlv_TEXCOORD5;
					varying highp float xlv_TEXCOORD6;
					void main ()
					{
					  lowp vec3 lm_1;
					  lowp vec4 c_2;
					  lowp vec3 tmpvar_3;
					  tmpvar_3 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp float tmpvar_4;
					  highp float lightShadowDataX_5;
					  mediump float tmpvar_6;
					  tmpvar_6 = _LightShadowData.x;
					  lightShadowDataX_5 = tmpvar_6;
					  highp float tmpvar_7;
					  tmpvar_7 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_5);
					  tmpvar_4 = tmpvar_7;
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
					  mediump vec3 tmpvar_9;
					  tmpvar_9 = (2.0 * tmpvar_8.xyz);
					  lm_1 = tmpvar_9;
					  c_2.w = 0.0;
					  c_2.xyz = (((
					    (texture2D (_Splat0, xlv_TEXCOORD0.zw) * tmpvar_3.x)
					   + 
					    (texture2D (_Splat1, xlv_TEXCOORD1.xy) * tmpvar_3.y)
					  ) + (texture2D (_Splat2, xlv_TEXCOORD1.zw) * tmpvar_3.z)).xyz * min (lm_1, vec3((tmpvar_4 * 2.0))));
					  highp float tmpvar_10;
					  tmpvar_10 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
					  c_2.xyz = mix (unity_FogColor.xyz, c_2.xyz, vec3(tmpvar_10));
					  c_2.w = 1.0;
					  gl_FragData[0] = c_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_WorldToShadow[4];
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp vec4 xlv_TEXCOORD4;
					varying highp vec4 xlv_TEXCOORD5;
					varying highp float xlv_TEXCOORD6;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  highp vec4 tmpvar_6;
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = _glesVertex.xyz;
					  tmpvar_6 = (glstate_matrix_mvp * tmpvar_7);
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
					  worldNormal_1 = tmpvar_9;
					  tmpvar_4 = worldNormal_1;
					  tmpvar_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  highp float tmpvar_10;
					  tmpvar_10 = (unity_FogParams.x * tmpvar_6.z);
					  gl_Position = tmpvar_6;
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  highp vec4 tmpvar_11;
					  tmpvar_11 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD3 = tmpvar_11.xyz;
					  xlv_TEXCOORD4 = tmpvar_5;
					  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_11);
					  xlv_TEXCOORD6 = exp2((-(tmpvar_10) * tmpvar_10));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump vec4 _LightShadowData;
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D unity_Lightmap;
					uniform highp sampler2D _ShadowMapTexture;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec4 xlv_TEXCOORD4;
					varying highp vec4 xlv_TEXCOORD5;
					varying highp float xlv_TEXCOORD6;
					void main ()
					{
					  lowp vec3 lm_1;
					  lowp vec4 c_2;
					  lowp vec3 tmpvar_3;
					  tmpvar_3 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp float tmpvar_4;
					  highp float lightShadowDataX_5;
					  mediump float tmpvar_6;
					  tmpvar_6 = _LightShadowData.x;
					  lightShadowDataX_5 = tmpvar_6;
					  highp float tmpvar_7;
					  tmpvar_7 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_5);
					  tmpvar_4 = tmpvar_7;
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
					  mediump vec3 tmpvar_9;
					  tmpvar_9 = (2.0 * tmpvar_8.xyz);
					  lm_1 = tmpvar_9;
					  c_2.w = 0.0;
					  c_2.xyz = (((
					    (texture2D (_Splat0, xlv_TEXCOORD0.zw) * tmpvar_3.x)
					   + 
					    (texture2D (_Splat1, xlv_TEXCOORD1.xy) * tmpvar_3.y)
					  ) + (texture2D (_Splat2, xlv_TEXCOORD1.zw) * tmpvar_3.z)).xyz * min (lm_1, vec3((tmpvar_4 * 2.0))));
					  highp float tmpvar_10;
					  tmpvar_10 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
					  c_2.xyz = mix (unity_FogColor.xyz, c_2.xyz, vec3(tmpvar_10));
					  c_2.w = 1.0;
					  gl_FragData[0] = c_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp mat4 unity_WorldToShadow[4];
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp vec4 xlv_TEXCOORD4;
					varying highp vec4 xlv_TEXCOORD5;
					varying highp float xlv_TEXCOORD6;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  highp vec4 tmpvar_6;
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = _glesVertex.xyz;
					  tmpvar_6 = (glstate_matrix_mvp * tmpvar_7);
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_9;
					  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
					  worldNormal_1 = tmpvar_9;
					  tmpvar_4 = worldNormal_1;
					  tmpvar_5.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					  highp float tmpvar_10;
					  tmpvar_10 = (unity_FogParams.x * tmpvar_6.z);
					  gl_Position = tmpvar_6;
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  highp vec4 tmpvar_11;
					  tmpvar_11 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD3 = tmpvar_11.xyz;
					  xlv_TEXCOORD4 = tmpvar_5;
					  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_11);
					  xlv_TEXCOORD6 = exp2((-(tmpvar_10) * tmpvar_10));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump vec4 _LightShadowData;
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D unity_Lightmap;
					uniform highp sampler2D _ShadowMapTexture;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec4 xlv_TEXCOORD4;
					varying highp vec4 xlv_TEXCOORD5;
					varying highp float xlv_TEXCOORD6;
					void main ()
					{
					  lowp vec3 lm_1;
					  lowp vec4 c_2;
					  lowp vec3 tmpvar_3;
					  tmpvar_3 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp float tmpvar_4;
					  highp float lightShadowDataX_5;
					  mediump float tmpvar_6;
					  tmpvar_6 = _LightShadowData.x;
					  lightShadowDataX_5 = tmpvar_6;
					  highp float tmpvar_7;
					  tmpvar_7 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_5);
					  tmpvar_4 = tmpvar_7;
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (unity_Lightmap, xlv_TEXCOORD4.xy);
					  mediump vec3 tmpvar_9;
					  tmpvar_9 = (2.0 * tmpvar_8.xyz);
					  lm_1 = tmpvar_9;
					  c_2.w = 0.0;
					  c_2.xyz = (((
					    (texture2D (_Splat0, xlv_TEXCOORD0.zw) * tmpvar_3.x)
					   + 
					    (texture2D (_Splat1, xlv_TEXCOORD1.xy) * tmpvar_3.y)
					  ) + (texture2D (_Splat2, xlv_TEXCOORD1.zw) * tmpvar_3.z)).xyz * min (lm_1, vec3((tmpvar_4 * 2.0))));
					  highp float tmpvar_10;
					  tmpvar_10 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
					  c_2.xyz = mix (unity_FogColor.xyz, c_2.xyz, vec3(tmpvar_10));
					  c_2.w = 1.0;
					  gl_FragData[0] = c_2;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "FOG_EXP2" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 unity_LightmapST;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					in highp vec4 in_TEXCOORD1;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp float vs_TEXCOORD6;
					out highp vec3 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD4;
					out highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD6 = exp2(u_xlat0.x);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump vec4 _LightShadowData;
					uniform 	lowp vec4 unity_FogColor;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2D unity_Lightmap;
					uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					uniform lowp sampler2D _ShadowMapTexture;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp float vs_TEXCOORD6;
					in highp vec4 vs_TEXCOORD4;
					in highp vec4 vs_TEXCOORD5;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					lowp vec3 u_xlat10_1;
					lowp vec3 u_xlat10_2;
					lowp vec3 u_xlat10_3;
					mediump float u_xlat16_4;
					lowp vec3 u_xlat10_5;
					float u_xlat18;
					lowp float u_xlat10_21;
					void main()
					{
					    u_xlat10_0.xyz = texture(_Splat0, vs_TEXCOORD0.zw).xyz;
					    u_xlat10_1.xyz = texture(_Splat1, vs_TEXCOORD1.xy).xyz;
					    u_xlat10_2.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_3.xyz = u_xlat10_1.xyz * u_xlat10_2.yyy;
					    u_xlat10_3.xyz = u_xlat10_0.xyz * u_xlat10_2.xxx + u_xlat10_3.xyz;
					    u_xlat10_0.xyz = texture(_Splat2, vs_TEXCOORD1.zw).xyz;
					    u_xlat10_3.xyz = u_xlat10_0.xyz * u_xlat10_2.zzz + u_xlat10_3.xyz;
					    vec3 txVec0 = vec3(vs_TEXCOORD5.xy,vs_TEXCOORD5.z);
					    u_xlat10_0.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_4 = (-_LightShadowData.x) + 1.0;
					    u_xlat16_4 = u_xlat10_0.x * u_xlat16_4 + _LightShadowData.x;
					    u_xlat10_21 = u_xlat16_4 * 2.0;
					    u_xlat10_0.xyz = texture(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
					    u_xlat10_5.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0);
					    u_xlat10_5.xyz = min(vec3(u_xlat10_21), u_xlat10_5.xyz);
					    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat10_5.xyz + (-unity_FogColor.xyz);
					    u_xlat18 = vs_TEXCOORD6;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
					#else
					    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
					#endif
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat16_0.xyz + unity_FogColor.xyz;
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "FOG_EXP2" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 unity_LightmapST;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					in highp vec4 in_TEXCOORD1;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp float vs_TEXCOORD6;
					out highp vec3 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD4;
					out highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD6 = exp2(u_xlat0.x);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump vec4 _LightShadowData;
					uniform 	lowp vec4 unity_FogColor;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2D unity_Lightmap;
					uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					uniform lowp sampler2D _ShadowMapTexture;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp float vs_TEXCOORD6;
					in highp vec4 vs_TEXCOORD4;
					in highp vec4 vs_TEXCOORD5;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					lowp vec3 u_xlat10_1;
					lowp vec3 u_xlat10_2;
					lowp vec3 u_xlat10_3;
					mediump float u_xlat16_4;
					lowp vec3 u_xlat10_5;
					float u_xlat18;
					lowp float u_xlat10_21;
					void main()
					{
					    u_xlat10_0.xyz = texture(_Splat0, vs_TEXCOORD0.zw).xyz;
					    u_xlat10_1.xyz = texture(_Splat1, vs_TEXCOORD1.xy).xyz;
					    u_xlat10_2.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_3.xyz = u_xlat10_1.xyz * u_xlat10_2.yyy;
					    u_xlat10_3.xyz = u_xlat10_0.xyz * u_xlat10_2.xxx + u_xlat10_3.xyz;
					    u_xlat10_0.xyz = texture(_Splat2, vs_TEXCOORD1.zw).xyz;
					    u_xlat10_3.xyz = u_xlat10_0.xyz * u_xlat10_2.zzz + u_xlat10_3.xyz;
					    vec3 txVec0 = vec3(vs_TEXCOORD5.xy,vs_TEXCOORD5.z);
					    u_xlat10_0.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_4 = (-_LightShadowData.x) + 1.0;
					    u_xlat16_4 = u_xlat10_0.x * u_xlat16_4 + _LightShadowData.x;
					    u_xlat10_21 = u_xlat16_4 * 2.0;
					    u_xlat10_0.xyz = texture(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
					    u_xlat10_5.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0);
					    u_xlat10_5.xyz = min(vec3(u_xlat10_21), u_xlat10_5.xyz);
					    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat10_5.xyz + (-unity_FogColor.xyz);
					    u_xlat18 = vs_TEXCOORD6;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
					#else
					    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
					#endif
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat16_0.xyz + unity_FogColor.xyz;
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "FOG_EXP2" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 unity_LightmapST;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					in highp vec4 in_TEXCOORD1;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp float vs_TEXCOORD6;
					out highp vec3 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD4;
					out highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD6 = exp2(u_xlat0.x);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump vec4 _LightShadowData;
					uniform 	lowp vec4 unity_FogColor;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2D unity_Lightmap;
					uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					uniform lowp sampler2D _ShadowMapTexture;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp float vs_TEXCOORD6;
					in highp vec4 vs_TEXCOORD4;
					in highp vec4 vs_TEXCOORD5;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					lowp vec3 u_xlat10_1;
					lowp vec3 u_xlat10_2;
					lowp vec3 u_xlat10_3;
					mediump float u_xlat16_4;
					lowp vec3 u_xlat10_5;
					float u_xlat18;
					lowp float u_xlat10_21;
					void main()
					{
					    u_xlat10_0.xyz = texture(_Splat0, vs_TEXCOORD0.zw).xyz;
					    u_xlat10_1.xyz = texture(_Splat1, vs_TEXCOORD1.xy).xyz;
					    u_xlat10_2.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_3.xyz = u_xlat10_1.xyz * u_xlat10_2.yyy;
					    u_xlat10_3.xyz = u_xlat10_0.xyz * u_xlat10_2.xxx + u_xlat10_3.xyz;
					    u_xlat10_0.xyz = texture(_Splat2, vs_TEXCOORD1.zw).xyz;
					    u_xlat10_3.xyz = u_xlat10_0.xyz * u_xlat10_2.zzz + u_xlat10_3.xyz;
					    vec3 txVec0 = vec3(vs_TEXCOORD5.xy,vs_TEXCOORD5.z);
					    u_xlat10_0.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_4 = (-_LightShadowData.x) + 1.0;
					    u_xlat16_4 = u_xlat10_0.x * u_xlat16_4 + _LightShadowData.x;
					    u_xlat10_21 = u_xlat16_4 * 2.0;
					    u_xlat10_0.xyz = texture(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
					    u_xlat10_5.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0);
					    u_xlat10_5.xyz = min(vec3(u_xlat10_21), u_xlat10_5.xyz);
					    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat10_5.xyz + (-unity_FogColor.xyz);
					    u_xlat18 = vs_TEXCOORD6;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
					#else
					    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
					#endif
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat16_0.xyz + unity_FogColor.xyz;
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 unity_4LightPosX0;
					uniform highp vec4 unity_4LightPosY0;
					uniform highp vec4 unity_4LightPosZ0;
					uniform mediump vec4 unity_4LightAtten0;
					uniform mediump vec4 unity_LightColor[8];
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					varying highp float xlv_TEXCOORD6;
					void main ()
					{
					  highp vec3 shlight_1;
					  lowp vec3 worldNormal_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  mediump vec3 tmpvar_5;
					  lowp vec3 tmpvar_6;
					  highp vec4 tmpvar_7;
					  highp vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = _glesVertex.xyz;
					  tmpvar_7 = (glstate_matrix_mvp * tmpvar_8);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp vec3 tmpvar_9;
					  tmpvar_9 = (unity_ObjectToWorld * _glesVertex).xyz;
					  highp mat3 tmpvar_10;
					  tmpvar_10[0] = unity_WorldToObject[0].xyz;
					  tmpvar_10[1] = unity_WorldToObject[1].xyz;
					  tmpvar_10[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_11;
					  tmpvar_11 = normalize((_glesNormal * tmpvar_10));
					  worldNormal_2 = tmpvar_11;
					  tmpvar_5 = worldNormal_2;
					  lowp vec4 tmpvar_12;
					  tmpvar_12.w = 1.0;
					  tmpvar_12.xyz = worldNormal_2;
					  mediump vec4 normal_13;
					  normal_13 = tmpvar_12;
					  mediump vec3 res_14;
					  mediump vec3 x_15;
					  x_15.x = dot (unity_SHAr, normal_13);
					  x_15.y = dot (unity_SHAg, normal_13);
					  x_15.z = dot (unity_SHAb, normal_13);
					  mediump vec3 x1_16;
					  mediump vec4 tmpvar_17;
					  tmpvar_17 = (normal_13.xyzz * normal_13.yzzx);
					  x1_16.x = dot (unity_SHBr, tmpvar_17);
					  x1_16.y = dot (unity_SHBg, tmpvar_17);
					  x1_16.z = dot (unity_SHBb, tmpvar_17);
					  res_14 = (x_15 + (x1_16 + (unity_SHC.xyz * 
					    ((normal_13.x * normal_13.x) - (normal_13.y * normal_13.y))
					  )));
					  mediump vec3 tmpvar_18;
					  tmpvar_18 = max (((1.055 * 
					    pow (max (res_14, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  res_14 = tmpvar_18;
					  shlight_1 = tmpvar_18;
					  tmpvar_6 = shlight_1;
					  highp vec3 lightColor0_19;
					  lightColor0_19 = unity_LightColor[0].xyz;
					  highp vec3 lightColor1_20;
					  lightColor1_20 = unity_LightColor[1].xyz;
					  highp vec3 lightColor2_21;
					  lightColor2_21 = unity_LightColor[2].xyz;
					  highp vec3 lightColor3_22;
					  lightColor3_22 = unity_LightColor[3].xyz;
					  highp vec4 lightAttenSq_23;
					  lightAttenSq_23 = unity_4LightAtten0;
					  highp vec3 normal_24;
					  normal_24 = worldNormal_2;
					  highp vec3 col_25;
					  highp vec4 ndotl_26;
					  highp vec4 lengthSq_27;
					  highp vec4 tmpvar_28;
					  tmpvar_28 = (unity_4LightPosX0 - tmpvar_9.x);
					  highp vec4 tmpvar_29;
					  tmpvar_29 = (unity_4LightPosY0 - tmpvar_9.y);
					  highp vec4 tmpvar_30;
					  tmpvar_30 = (unity_4LightPosZ0 - tmpvar_9.z);
					  lengthSq_27 = (tmpvar_28 * tmpvar_28);
					  lengthSq_27 = (lengthSq_27 + (tmpvar_29 * tmpvar_29));
					  lengthSq_27 = (lengthSq_27 + (tmpvar_30 * tmpvar_30));
					  highp vec4 tmpvar_31;
					  tmpvar_31 = max (lengthSq_27, vec4(1e-06, 1e-06, 1e-06, 1e-06));
					  lengthSq_27 = tmpvar_31;
					  ndotl_26 = (tmpvar_28 * normal_24.x);
					  ndotl_26 = (ndotl_26 + (tmpvar_29 * normal_24.y));
					  ndotl_26 = (ndotl_26 + (tmpvar_30 * normal_24.z));
					  highp vec4 tmpvar_32;
					  tmpvar_32 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_26 * inversesqrt(tmpvar_31)));
					  ndotl_26 = tmpvar_32;
					  highp vec4 tmpvar_33;
					  tmpvar_33 = (tmpvar_32 * (1.0/((1.0 + 
					    (tmpvar_31 * lightAttenSq_23)
					  ))));
					  col_25 = (lightColor0_19 * tmpvar_33.x);
					  col_25 = (col_25 + (lightColor1_20 * tmpvar_33.y));
					  col_25 = (col_25 + (lightColor2_21 * tmpvar_33.z));
					  col_25 = (col_25 + (lightColor3_22 * tmpvar_33.w));
					  tmpvar_6 = (tmpvar_6 + col_25);
					  highp float tmpvar_34;
					  tmpvar_34 = (unity_FogParams.x * tmpvar_7.z);
					  gl_Position = tmpvar_7;
					  xlv_TEXCOORD0 = tmpvar_3;
					  xlv_TEXCOORD1 = tmpvar_4;
					  xlv_TEXCOORD2 = tmpvar_5;
					  xlv_TEXCOORD3 = tmpvar_9;
					  xlv_TEXCOORD4 = tmpvar_6;
					  xlv_TEXCOORD6 = exp2((-(tmpvar_34) * tmpvar_34));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 unity_FogColor;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					varying highp float xlv_TEXCOORD6;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = _WorldSpaceLightPos0.xyz;
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  lowp vec3 tmpvar_7;
					  mediump float tmpvar_8;
					  lowp float tmpvar_9;
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_7 = (((tmpvar_11 * tmpvar_10.x) + (tmpvar_12 * tmpvar_10.y)) + (tmpvar_13 * tmpvar_10.z)).xyz;
					  tmpvar_9 = (((tmpvar_11.w * tmpvar_10.x) + (tmpvar_12.w * tmpvar_10.y)) + (tmpvar_13.w * tmpvar_10.z));
					  tmpvar_8 = (((_ShininessL0 * tmpvar_10.x) + (_ShininessL1 * tmpvar_10.y)) + (_ShininessL2 * tmpvar_10.z));
					  c_1.w = 0.0;
					  c_1.xyz = (tmpvar_7 * xlv_TEXCOORD4);
					  lowp vec4 c_14;
					  lowp float spec_15;
					  lowp float tmpvar_16;
					  tmpvar_16 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_17;
					  tmpvar_17 = (pow (tmpvar_16, (tmpvar_8 * 128.0)) * tmpvar_9);
					  spec_15 = tmpvar_17;
					  c_14.xyz = (((
					    (tmpvar_7 * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_15)) * 2.0);
					  c_14.w = 0.0;
					  c_1 = (c_1 + c_14);
					  highp float tmpvar_18;
					  tmpvar_18 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
					  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_18));
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 unity_4LightPosX0;
					uniform highp vec4 unity_4LightPosY0;
					uniform highp vec4 unity_4LightPosZ0;
					uniform mediump vec4 unity_4LightAtten0;
					uniform mediump vec4 unity_LightColor[8];
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					varying highp float xlv_TEXCOORD6;
					void main ()
					{
					  highp vec3 shlight_1;
					  lowp vec3 worldNormal_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  mediump vec3 tmpvar_5;
					  lowp vec3 tmpvar_6;
					  highp vec4 tmpvar_7;
					  highp vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = _glesVertex.xyz;
					  tmpvar_7 = (glstate_matrix_mvp * tmpvar_8);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp vec3 tmpvar_9;
					  tmpvar_9 = (unity_ObjectToWorld * _glesVertex).xyz;
					  highp mat3 tmpvar_10;
					  tmpvar_10[0] = unity_WorldToObject[0].xyz;
					  tmpvar_10[1] = unity_WorldToObject[1].xyz;
					  tmpvar_10[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_11;
					  tmpvar_11 = normalize((_glesNormal * tmpvar_10));
					  worldNormal_2 = tmpvar_11;
					  tmpvar_5 = worldNormal_2;
					  lowp vec4 tmpvar_12;
					  tmpvar_12.w = 1.0;
					  tmpvar_12.xyz = worldNormal_2;
					  mediump vec4 normal_13;
					  normal_13 = tmpvar_12;
					  mediump vec3 res_14;
					  mediump vec3 x_15;
					  x_15.x = dot (unity_SHAr, normal_13);
					  x_15.y = dot (unity_SHAg, normal_13);
					  x_15.z = dot (unity_SHAb, normal_13);
					  mediump vec3 x1_16;
					  mediump vec4 tmpvar_17;
					  tmpvar_17 = (normal_13.xyzz * normal_13.yzzx);
					  x1_16.x = dot (unity_SHBr, tmpvar_17);
					  x1_16.y = dot (unity_SHBg, tmpvar_17);
					  x1_16.z = dot (unity_SHBb, tmpvar_17);
					  res_14 = (x_15 + (x1_16 + (unity_SHC.xyz * 
					    ((normal_13.x * normal_13.x) - (normal_13.y * normal_13.y))
					  )));
					  mediump vec3 tmpvar_18;
					  tmpvar_18 = max (((1.055 * 
					    pow (max (res_14, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  res_14 = tmpvar_18;
					  shlight_1 = tmpvar_18;
					  tmpvar_6 = shlight_1;
					  highp vec3 lightColor0_19;
					  lightColor0_19 = unity_LightColor[0].xyz;
					  highp vec3 lightColor1_20;
					  lightColor1_20 = unity_LightColor[1].xyz;
					  highp vec3 lightColor2_21;
					  lightColor2_21 = unity_LightColor[2].xyz;
					  highp vec3 lightColor3_22;
					  lightColor3_22 = unity_LightColor[3].xyz;
					  highp vec4 lightAttenSq_23;
					  lightAttenSq_23 = unity_4LightAtten0;
					  highp vec3 normal_24;
					  normal_24 = worldNormal_2;
					  highp vec3 col_25;
					  highp vec4 ndotl_26;
					  highp vec4 lengthSq_27;
					  highp vec4 tmpvar_28;
					  tmpvar_28 = (unity_4LightPosX0 - tmpvar_9.x);
					  highp vec4 tmpvar_29;
					  tmpvar_29 = (unity_4LightPosY0 - tmpvar_9.y);
					  highp vec4 tmpvar_30;
					  tmpvar_30 = (unity_4LightPosZ0 - tmpvar_9.z);
					  lengthSq_27 = (tmpvar_28 * tmpvar_28);
					  lengthSq_27 = (lengthSq_27 + (tmpvar_29 * tmpvar_29));
					  lengthSq_27 = (lengthSq_27 + (tmpvar_30 * tmpvar_30));
					  highp vec4 tmpvar_31;
					  tmpvar_31 = max (lengthSq_27, vec4(1e-06, 1e-06, 1e-06, 1e-06));
					  lengthSq_27 = tmpvar_31;
					  ndotl_26 = (tmpvar_28 * normal_24.x);
					  ndotl_26 = (ndotl_26 + (tmpvar_29 * normal_24.y));
					  ndotl_26 = (ndotl_26 + (tmpvar_30 * normal_24.z));
					  highp vec4 tmpvar_32;
					  tmpvar_32 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_26 * inversesqrt(tmpvar_31)));
					  ndotl_26 = tmpvar_32;
					  highp vec4 tmpvar_33;
					  tmpvar_33 = (tmpvar_32 * (1.0/((1.0 + 
					    (tmpvar_31 * lightAttenSq_23)
					  ))));
					  col_25 = (lightColor0_19 * tmpvar_33.x);
					  col_25 = (col_25 + (lightColor1_20 * tmpvar_33.y));
					  col_25 = (col_25 + (lightColor2_21 * tmpvar_33.z));
					  col_25 = (col_25 + (lightColor3_22 * tmpvar_33.w));
					  tmpvar_6 = (tmpvar_6 + col_25);
					  highp float tmpvar_34;
					  tmpvar_34 = (unity_FogParams.x * tmpvar_7.z);
					  gl_Position = tmpvar_7;
					  xlv_TEXCOORD0 = tmpvar_3;
					  xlv_TEXCOORD1 = tmpvar_4;
					  xlv_TEXCOORD2 = tmpvar_5;
					  xlv_TEXCOORD3 = tmpvar_9;
					  xlv_TEXCOORD4 = tmpvar_6;
					  xlv_TEXCOORD6 = exp2((-(tmpvar_34) * tmpvar_34));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 unity_FogColor;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					varying highp float xlv_TEXCOORD6;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = _WorldSpaceLightPos0.xyz;
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  lowp vec3 tmpvar_7;
					  mediump float tmpvar_8;
					  lowp float tmpvar_9;
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_7 = (((tmpvar_11 * tmpvar_10.x) + (tmpvar_12 * tmpvar_10.y)) + (tmpvar_13 * tmpvar_10.z)).xyz;
					  tmpvar_9 = (((tmpvar_11.w * tmpvar_10.x) + (tmpvar_12.w * tmpvar_10.y)) + (tmpvar_13.w * tmpvar_10.z));
					  tmpvar_8 = (((_ShininessL0 * tmpvar_10.x) + (_ShininessL1 * tmpvar_10.y)) + (_ShininessL2 * tmpvar_10.z));
					  c_1.w = 0.0;
					  c_1.xyz = (tmpvar_7 * xlv_TEXCOORD4);
					  lowp vec4 c_14;
					  lowp float spec_15;
					  lowp float tmpvar_16;
					  tmpvar_16 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_17;
					  tmpvar_17 = (pow (tmpvar_16, (tmpvar_8 * 128.0)) * tmpvar_9);
					  spec_15 = tmpvar_17;
					  c_14.xyz = (((
					    (tmpvar_7 * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_15)) * 2.0);
					  c_14.w = 0.0;
					  c_1 = (c_1 + c_14);
					  highp float tmpvar_18;
					  tmpvar_18 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
					  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_18));
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 unity_4LightPosX0;
					uniform highp vec4 unity_4LightPosY0;
					uniform highp vec4 unity_4LightPosZ0;
					uniform mediump vec4 unity_4LightAtten0;
					uniform mediump vec4 unity_LightColor[8];
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					varying highp float xlv_TEXCOORD6;
					void main ()
					{
					  highp vec3 shlight_1;
					  lowp vec3 worldNormal_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  mediump vec3 tmpvar_5;
					  lowp vec3 tmpvar_6;
					  highp vec4 tmpvar_7;
					  highp vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = _glesVertex.xyz;
					  tmpvar_7 = (glstate_matrix_mvp * tmpvar_8);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp vec3 tmpvar_9;
					  tmpvar_9 = (unity_ObjectToWorld * _glesVertex).xyz;
					  highp mat3 tmpvar_10;
					  tmpvar_10[0] = unity_WorldToObject[0].xyz;
					  tmpvar_10[1] = unity_WorldToObject[1].xyz;
					  tmpvar_10[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_11;
					  tmpvar_11 = normalize((_glesNormal * tmpvar_10));
					  worldNormal_2 = tmpvar_11;
					  tmpvar_5 = worldNormal_2;
					  lowp vec4 tmpvar_12;
					  tmpvar_12.w = 1.0;
					  tmpvar_12.xyz = worldNormal_2;
					  mediump vec4 normal_13;
					  normal_13 = tmpvar_12;
					  mediump vec3 res_14;
					  mediump vec3 x_15;
					  x_15.x = dot (unity_SHAr, normal_13);
					  x_15.y = dot (unity_SHAg, normal_13);
					  x_15.z = dot (unity_SHAb, normal_13);
					  mediump vec3 x1_16;
					  mediump vec4 tmpvar_17;
					  tmpvar_17 = (normal_13.xyzz * normal_13.yzzx);
					  x1_16.x = dot (unity_SHBr, tmpvar_17);
					  x1_16.y = dot (unity_SHBg, tmpvar_17);
					  x1_16.z = dot (unity_SHBb, tmpvar_17);
					  res_14 = (x_15 + (x1_16 + (unity_SHC.xyz * 
					    ((normal_13.x * normal_13.x) - (normal_13.y * normal_13.y))
					  )));
					  mediump vec3 tmpvar_18;
					  tmpvar_18 = max (((1.055 * 
					    pow (max (res_14, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  res_14 = tmpvar_18;
					  shlight_1 = tmpvar_18;
					  tmpvar_6 = shlight_1;
					  highp vec3 lightColor0_19;
					  lightColor0_19 = unity_LightColor[0].xyz;
					  highp vec3 lightColor1_20;
					  lightColor1_20 = unity_LightColor[1].xyz;
					  highp vec3 lightColor2_21;
					  lightColor2_21 = unity_LightColor[2].xyz;
					  highp vec3 lightColor3_22;
					  lightColor3_22 = unity_LightColor[3].xyz;
					  highp vec4 lightAttenSq_23;
					  lightAttenSq_23 = unity_4LightAtten0;
					  highp vec3 normal_24;
					  normal_24 = worldNormal_2;
					  highp vec3 col_25;
					  highp vec4 ndotl_26;
					  highp vec4 lengthSq_27;
					  highp vec4 tmpvar_28;
					  tmpvar_28 = (unity_4LightPosX0 - tmpvar_9.x);
					  highp vec4 tmpvar_29;
					  tmpvar_29 = (unity_4LightPosY0 - tmpvar_9.y);
					  highp vec4 tmpvar_30;
					  tmpvar_30 = (unity_4LightPosZ0 - tmpvar_9.z);
					  lengthSq_27 = (tmpvar_28 * tmpvar_28);
					  lengthSq_27 = (lengthSq_27 + (tmpvar_29 * tmpvar_29));
					  lengthSq_27 = (lengthSq_27 + (tmpvar_30 * tmpvar_30));
					  highp vec4 tmpvar_31;
					  tmpvar_31 = max (lengthSq_27, vec4(1e-06, 1e-06, 1e-06, 1e-06));
					  lengthSq_27 = tmpvar_31;
					  ndotl_26 = (tmpvar_28 * normal_24.x);
					  ndotl_26 = (ndotl_26 + (tmpvar_29 * normal_24.y));
					  ndotl_26 = (ndotl_26 + (tmpvar_30 * normal_24.z));
					  highp vec4 tmpvar_32;
					  tmpvar_32 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_26 * inversesqrt(tmpvar_31)));
					  ndotl_26 = tmpvar_32;
					  highp vec4 tmpvar_33;
					  tmpvar_33 = (tmpvar_32 * (1.0/((1.0 + 
					    (tmpvar_31 * lightAttenSq_23)
					  ))));
					  col_25 = (lightColor0_19 * tmpvar_33.x);
					  col_25 = (col_25 + (lightColor1_20 * tmpvar_33.y));
					  col_25 = (col_25 + (lightColor2_21 * tmpvar_33.z));
					  col_25 = (col_25 + (lightColor3_22 * tmpvar_33.w));
					  tmpvar_6 = (tmpvar_6 + col_25);
					  highp float tmpvar_34;
					  tmpvar_34 = (unity_FogParams.x * tmpvar_7.z);
					  gl_Position = tmpvar_7;
					  xlv_TEXCOORD0 = tmpvar_3;
					  xlv_TEXCOORD1 = tmpvar_4;
					  xlv_TEXCOORD2 = tmpvar_5;
					  xlv_TEXCOORD3 = tmpvar_9;
					  xlv_TEXCOORD4 = tmpvar_6;
					  xlv_TEXCOORD6 = exp2((-(tmpvar_34) * tmpvar_34));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 unity_FogColor;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					varying highp float xlv_TEXCOORD6;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = _WorldSpaceLightPos0.xyz;
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  lowp vec3 tmpvar_7;
					  mediump float tmpvar_8;
					  lowp float tmpvar_9;
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_7 = (((tmpvar_11 * tmpvar_10.x) + (tmpvar_12 * tmpvar_10.y)) + (tmpvar_13 * tmpvar_10.z)).xyz;
					  tmpvar_9 = (((tmpvar_11.w * tmpvar_10.x) + (tmpvar_12.w * tmpvar_10.y)) + (tmpvar_13.w * tmpvar_10.z));
					  tmpvar_8 = (((_ShininessL0 * tmpvar_10.x) + (_ShininessL1 * tmpvar_10.y)) + (_ShininessL2 * tmpvar_10.z));
					  c_1.w = 0.0;
					  c_1.xyz = (tmpvar_7 * xlv_TEXCOORD4);
					  lowp vec4 c_14;
					  lowp float spec_15;
					  lowp float tmpvar_16;
					  tmpvar_16 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_17;
					  tmpvar_17 = (pow (tmpvar_16, (tmpvar_8 * 128.0)) * tmpvar_9);
					  spec_15 = tmpvar_17;
					  c_14.xyz = (((
					    (tmpvar_7 * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_15)) * 2.0);
					  c_14.w = 0.0;
					  c_1 = (c_1 + c_14);
					  highp float tmpvar_18;
					  tmpvar_18 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
					  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_18));
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" "VERTEXLIGHT_ON" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 unity_4LightPosX0;
					uniform 	vec4 unity_4LightPosY0;
					uniform 	vec4 unity_4LightPosZ0;
					uniform 	mediump vec4 unity_4LightAtten0;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp float vs_TEXCOORD6;
					out highp vec3 vs_TEXCOORD3;
					out lowp vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump vec3 u_xlat16_2;
					vec4 u_xlat3;
					mediump vec4 u_xlat16_3;
					vec4 u_xlat4;
					mediump vec3 u_xlat16_4;
					vec3 u_xlat5;
					float u_xlat18;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD6 = exp2(u_xlat0.x);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_3 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_3);
					    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_3);
					    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_3);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_4.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat16_2.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat2 = (-u_xlat1.yyyy) + unity_4LightPosY0;
					    u_xlat3 = u_xlat0.yyyy * u_xlat2;
					    u_xlat2 = u_xlat2 * u_xlat2;
					    u_xlat4 = (-u_xlat1.xxxx) + unity_4LightPosX0;
					    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
					    u_xlat3 = u_xlat4 * u_xlat0.xxxx + u_xlat3;
					    u_xlat0 = u_xlat1 * u_xlat0.zzzz + u_xlat3;
					    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
					    u_xlat1 = u_xlat1 * u_xlat1 + u_xlat2;
					    u_xlat1 = max(u_xlat1, vec4(9.99999997e-007, 9.99999997e-007, 9.99999997e-007, 9.99999997e-007));
					    u_xlat2 = inversesqrt(u_xlat1);
					    u_xlat1 = u_xlat1 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat0 = max(u_xlat0, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat0 = u_xlat1 * u_xlat0;
					    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
					    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat5.xyz;
					    vs_TEXCOORD4.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 unity_FogColor;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp float vs_TEXCOORD6;
					in highp vec3 vs_TEXCOORD3;
					in lowp vec3 vs_TEXCOORD4;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec3 u_xlat6;
					mediump vec3 u_xlat16_6;
					mediump float u_xlat16_9;
					float u_xlat21;
					lowp float u_xlat10_25;
					float u_xlat27;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_5.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_4.xyz = u_xlat10_5.xyz * vec3(u_xlat10_25) + u_xlat10_4.xyz;
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0);
					    u_xlat10_4.xyz = u_xlat10_0.xyz * vs_TEXCOORD4.xyz + u_xlat10_4.xyz;
					    u_xlat16_6.xyz = u_xlat10_4.xyz + (-unity_FogColor.xyz);
					    u_xlat27 = vs_TEXCOORD6;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
					#else
					    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
					#endif
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat16_6.xyz + unity_FogColor.xyz;
					    SV_Target0.xyz = u_xlat6.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" "VERTEXLIGHT_ON" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 unity_4LightPosX0;
					uniform 	vec4 unity_4LightPosY0;
					uniform 	vec4 unity_4LightPosZ0;
					uniform 	mediump vec4 unity_4LightAtten0;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp float vs_TEXCOORD6;
					out highp vec3 vs_TEXCOORD3;
					out lowp vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump vec3 u_xlat16_2;
					vec4 u_xlat3;
					mediump vec4 u_xlat16_3;
					vec4 u_xlat4;
					mediump vec3 u_xlat16_4;
					vec3 u_xlat5;
					float u_xlat18;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD6 = exp2(u_xlat0.x);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_3 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_3);
					    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_3);
					    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_3);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_4.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat16_2.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat2 = (-u_xlat1.yyyy) + unity_4LightPosY0;
					    u_xlat3 = u_xlat0.yyyy * u_xlat2;
					    u_xlat2 = u_xlat2 * u_xlat2;
					    u_xlat4 = (-u_xlat1.xxxx) + unity_4LightPosX0;
					    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
					    u_xlat3 = u_xlat4 * u_xlat0.xxxx + u_xlat3;
					    u_xlat0 = u_xlat1 * u_xlat0.zzzz + u_xlat3;
					    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
					    u_xlat1 = u_xlat1 * u_xlat1 + u_xlat2;
					    u_xlat1 = max(u_xlat1, vec4(9.99999997e-007, 9.99999997e-007, 9.99999997e-007, 9.99999997e-007));
					    u_xlat2 = inversesqrt(u_xlat1);
					    u_xlat1 = u_xlat1 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat0 = max(u_xlat0, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat0 = u_xlat1 * u_xlat0;
					    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
					    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat5.xyz;
					    vs_TEXCOORD4.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 unity_FogColor;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp float vs_TEXCOORD6;
					in highp vec3 vs_TEXCOORD3;
					in lowp vec3 vs_TEXCOORD4;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec3 u_xlat6;
					mediump vec3 u_xlat16_6;
					mediump float u_xlat16_9;
					float u_xlat21;
					lowp float u_xlat10_25;
					float u_xlat27;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_5.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_4.xyz = u_xlat10_5.xyz * vec3(u_xlat10_25) + u_xlat10_4.xyz;
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0);
					    u_xlat10_4.xyz = u_xlat10_0.xyz * vs_TEXCOORD4.xyz + u_xlat10_4.xyz;
					    u_xlat16_6.xyz = u_xlat10_4.xyz + (-unity_FogColor.xyz);
					    u_xlat27 = vs_TEXCOORD6;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
					#else
					    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
					#endif
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat16_6.xyz + unity_FogColor.xyz;
					    SV_Target0.xyz = u_xlat6.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" "VERTEXLIGHT_ON" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 unity_4LightPosX0;
					uniform 	vec4 unity_4LightPosY0;
					uniform 	vec4 unity_4LightPosZ0;
					uniform 	mediump vec4 unity_4LightAtten0;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp float vs_TEXCOORD6;
					out highp vec3 vs_TEXCOORD3;
					out lowp vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump vec3 u_xlat16_2;
					vec4 u_xlat3;
					mediump vec4 u_xlat16_3;
					vec4 u_xlat4;
					mediump vec3 u_xlat16_4;
					vec3 u_xlat5;
					float u_xlat18;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD6 = exp2(u_xlat0.x);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_3 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_3);
					    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_3);
					    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_3);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_4.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat16_2.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat2 = (-u_xlat1.yyyy) + unity_4LightPosY0;
					    u_xlat3 = u_xlat0.yyyy * u_xlat2;
					    u_xlat2 = u_xlat2 * u_xlat2;
					    u_xlat4 = (-u_xlat1.xxxx) + unity_4LightPosX0;
					    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
					    u_xlat3 = u_xlat4 * u_xlat0.xxxx + u_xlat3;
					    u_xlat0 = u_xlat1 * u_xlat0.zzzz + u_xlat3;
					    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
					    u_xlat1 = u_xlat1 * u_xlat1 + u_xlat2;
					    u_xlat1 = max(u_xlat1, vec4(9.99999997e-007, 9.99999997e-007, 9.99999997e-007, 9.99999997e-007));
					    u_xlat2 = inversesqrt(u_xlat1);
					    u_xlat1 = u_xlat1 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat0 = max(u_xlat0, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat0 = u_xlat1 * u_xlat0;
					    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
					    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat5.xyz;
					    vs_TEXCOORD4.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 unity_FogColor;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp float vs_TEXCOORD6;
					in highp vec3 vs_TEXCOORD3;
					in lowp vec3 vs_TEXCOORD4;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec3 u_xlat6;
					mediump vec3 u_xlat16_6;
					mediump float u_xlat16_9;
					float u_xlat21;
					lowp float u_xlat10_25;
					float u_xlat27;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_5.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_4.xyz = u_xlat10_5.xyz * vec3(u_xlat10_25) + u_xlat10_4.xyz;
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0);
					    u_xlat10_4.xyz = u_xlat10_0.xyz * vs_TEXCOORD4.xyz + u_xlat10_4.xyz;
					    u_xlat16_6.xyz = u_xlat10_4.xyz + (-unity_FogColor.xyz);
					    u_xlat27 = vs_TEXCOORD6;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
					#else
					    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
					#endif
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat16_6.xyz + unity_FogColor.xyz;
					    SV_Target0.xyz = u_xlat6.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_EXP2" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 unity_4LightPosX0;
					uniform highp vec4 unity_4LightPosY0;
					uniform highp vec4 unity_4LightPosZ0;
					uniform mediump vec4 unity_4LightAtten0;
					uniform mediump vec4 unity_LightColor[8];
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_WorldToShadow[4];
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					varying highp vec4 xlv_TEXCOORD5;
					varying highp float xlv_TEXCOORD6;
					void main ()
					{
					  highp vec3 shlight_1;
					  lowp vec3 worldNormal_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  mediump vec3 tmpvar_5;
					  lowp vec3 tmpvar_6;
					  highp vec4 tmpvar_7;
					  highp vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = _glesVertex.xyz;
					  tmpvar_7 = (glstate_matrix_mvp * tmpvar_8);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp vec4 tmpvar_9;
					  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
					  highp mat3 tmpvar_10;
					  tmpvar_10[0] = unity_WorldToObject[0].xyz;
					  tmpvar_10[1] = unity_WorldToObject[1].xyz;
					  tmpvar_10[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_11;
					  tmpvar_11 = normalize((_glesNormal * tmpvar_10));
					  worldNormal_2 = tmpvar_11;
					  tmpvar_5 = worldNormal_2;
					  lowp vec4 tmpvar_12;
					  tmpvar_12.w = 1.0;
					  tmpvar_12.xyz = worldNormal_2;
					  mediump vec4 normal_13;
					  normal_13 = tmpvar_12;
					  mediump vec3 res_14;
					  mediump vec3 x_15;
					  x_15.x = dot (unity_SHAr, normal_13);
					  x_15.y = dot (unity_SHAg, normal_13);
					  x_15.z = dot (unity_SHAb, normal_13);
					  mediump vec3 x1_16;
					  mediump vec4 tmpvar_17;
					  tmpvar_17 = (normal_13.xyzz * normal_13.yzzx);
					  x1_16.x = dot (unity_SHBr, tmpvar_17);
					  x1_16.y = dot (unity_SHBg, tmpvar_17);
					  x1_16.z = dot (unity_SHBb, tmpvar_17);
					  res_14 = (x_15 + (x1_16 + (unity_SHC.xyz * 
					    ((normal_13.x * normal_13.x) - (normal_13.y * normal_13.y))
					  )));
					  mediump vec3 tmpvar_18;
					  tmpvar_18 = max (((1.055 * 
					    pow (max (res_14, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  res_14 = tmpvar_18;
					  shlight_1 = tmpvar_18;
					  tmpvar_6 = shlight_1;
					  highp vec3 lightColor0_19;
					  lightColor0_19 = unity_LightColor[0].xyz;
					  highp vec3 lightColor1_20;
					  lightColor1_20 = unity_LightColor[1].xyz;
					  highp vec3 lightColor2_21;
					  lightColor2_21 = unity_LightColor[2].xyz;
					  highp vec3 lightColor3_22;
					  lightColor3_22 = unity_LightColor[3].xyz;
					  highp vec4 lightAttenSq_23;
					  lightAttenSq_23 = unity_4LightAtten0;
					  highp vec3 normal_24;
					  normal_24 = worldNormal_2;
					  highp vec3 col_25;
					  highp vec4 ndotl_26;
					  highp vec4 lengthSq_27;
					  highp vec4 tmpvar_28;
					  tmpvar_28 = (unity_4LightPosX0 - tmpvar_9.x);
					  highp vec4 tmpvar_29;
					  tmpvar_29 = (unity_4LightPosY0 - tmpvar_9.y);
					  highp vec4 tmpvar_30;
					  tmpvar_30 = (unity_4LightPosZ0 - tmpvar_9.z);
					  lengthSq_27 = (tmpvar_28 * tmpvar_28);
					  lengthSq_27 = (lengthSq_27 + (tmpvar_29 * tmpvar_29));
					  lengthSq_27 = (lengthSq_27 + (tmpvar_30 * tmpvar_30));
					  highp vec4 tmpvar_31;
					  tmpvar_31 = max (lengthSq_27, vec4(1e-06, 1e-06, 1e-06, 1e-06));
					  lengthSq_27 = tmpvar_31;
					  ndotl_26 = (tmpvar_28 * normal_24.x);
					  ndotl_26 = (ndotl_26 + (tmpvar_29 * normal_24.y));
					  ndotl_26 = (ndotl_26 + (tmpvar_30 * normal_24.z));
					  highp vec4 tmpvar_32;
					  tmpvar_32 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_26 * inversesqrt(tmpvar_31)));
					  ndotl_26 = tmpvar_32;
					  highp vec4 tmpvar_33;
					  tmpvar_33 = (tmpvar_32 * (1.0/((1.0 + 
					    (tmpvar_31 * lightAttenSq_23)
					  ))));
					  col_25 = (lightColor0_19 * tmpvar_33.x);
					  col_25 = (col_25 + (lightColor1_20 * tmpvar_33.y));
					  col_25 = (col_25 + (lightColor2_21 * tmpvar_33.z));
					  col_25 = (col_25 + (lightColor3_22 * tmpvar_33.w));
					  tmpvar_6 = (tmpvar_6 + col_25);
					  highp float tmpvar_34;
					  tmpvar_34 = (unity_FogParams.x * tmpvar_7.z);
					  gl_Position = tmpvar_7;
					  xlv_TEXCOORD0 = tmpvar_3;
					  xlv_TEXCOORD1 = tmpvar_4;
					  xlv_TEXCOORD2 = tmpvar_5;
					  xlv_TEXCOORD3 = tmpvar_9.xyz;
					  xlv_TEXCOORD4 = tmpvar_6;
					  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_9);
					  xlv_TEXCOORD6 = exp2((-(tmpvar_34) * tmpvar_34));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform mediump vec4 _LightShadowData;
					uniform lowp vec4 unity_FogColor;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform highp sampler2D _ShadowMapTexture;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					varying highp vec4 xlv_TEXCOORD5;
					varying highp float xlv_TEXCOORD6;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = _WorldSpaceLightPos0.xyz;
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  lowp vec3 tmpvar_7;
					  mediump float tmpvar_8;
					  lowp float tmpvar_9;
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_7 = (((tmpvar_11 * tmpvar_10.x) + (tmpvar_12 * tmpvar_10.y)) + (tmpvar_13 * tmpvar_10.z)).xyz;
					  tmpvar_9 = (((tmpvar_11.w * tmpvar_10.x) + (tmpvar_12.w * tmpvar_10.y)) + (tmpvar_13.w * tmpvar_10.z));
					  tmpvar_8 = (((_ShininessL0 * tmpvar_10.x) + (_ShininessL1 * tmpvar_10.y)) + (_ShininessL2 * tmpvar_10.z));
					  lowp float tmpvar_14;
					  highp float lightShadowDataX_15;
					  mediump float tmpvar_16;
					  tmpvar_16 = _LightShadowData.x;
					  lightShadowDataX_15 = tmpvar_16;
					  highp float tmpvar_17;
					  tmpvar_17 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_15);
					  tmpvar_14 = tmpvar_17;
					  c_1.w = 0.0;
					  c_1.xyz = (tmpvar_7 * xlv_TEXCOORD4);
					  lowp vec4 c_18;
					  lowp float spec_19;
					  lowp float tmpvar_20;
					  tmpvar_20 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_21;
					  tmpvar_21 = (pow (tmpvar_20, (tmpvar_8 * 128.0)) * tmpvar_9);
					  spec_19 = tmpvar_21;
					  c_18.xyz = (((
					    (tmpvar_7 * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_19)) * (tmpvar_14 * 2.0));
					  c_18.w = 0.0;
					  c_1 = (c_1 + c_18);
					  highp float tmpvar_22;
					  tmpvar_22 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
					  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_22));
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_EXP2" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 unity_4LightPosX0;
					uniform highp vec4 unity_4LightPosY0;
					uniform highp vec4 unity_4LightPosZ0;
					uniform mediump vec4 unity_4LightAtten0;
					uniform mediump vec4 unity_LightColor[8];
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_WorldToShadow[4];
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					varying highp vec4 xlv_TEXCOORD5;
					varying highp float xlv_TEXCOORD6;
					void main ()
					{
					  highp vec3 shlight_1;
					  lowp vec3 worldNormal_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  mediump vec3 tmpvar_5;
					  lowp vec3 tmpvar_6;
					  highp vec4 tmpvar_7;
					  highp vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = _glesVertex.xyz;
					  tmpvar_7 = (glstate_matrix_mvp * tmpvar_8);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp vec4 tmpvar_9;
					  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
					  highp mat3 tmpvar_10;
					  tmpvar_10[0] = unity_WorldToObject[0].xyz;
					  tmpvar_10[1] = unity_WorldToObject[1].xyz;
					  tmpvar_10[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_11;
					  tmpvar_11 = normalize((_glesNormal * tmpvar_10));
					  worldNormal_2 = tmpvar_11;
					  tmpvar_5 = worldNormal_2;
					  lowp vec4 tmpvar_12;
					  tmpvar_12.w = 1.0;
					  tmpvar_12.xyz = worldNormal_2;
					  mediump vec4 normal_13;
					  normal_13 = tmpvar_12;
					  mediump vec3 res_14;
					  mediump vec3 x_15;
					  x_15.x = dot (unity_SHAr, normal_13);
					  x_15.y = dot (unity_SHAg, normal_13);
					  x_15.z = dot (unity_SHAb, normal_13);
					  mediump vec3 x1_16;
					  mediump vec4 tmpvar_17;
					  tmpvar_17 = (normal_13.xyzz * normal_13.yzzx);
					  x1_16.x = dot (unity_SHBr, tmpvar_17);
					  x1_16.y = dot (unity_SHBg, tmpvar_17);
					  x1_16.z = dot (unity_SHBb, tmpvar_17);
					  res_14 = (x_15 + (x1_16 + (unity_SHC.xyz * 
					    ((normal_13.x * normal_13.x) - (normal_13.y * normal_13.y))
					  )));
					  mediump vec3 tmpvar_18;
					  tmpvar_18 = max (((1.055 * 
					    pow (max (res_14, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  res_14 = tmpvar_18;
					  shlight_1 = tmpvar_18;
					  tmpvar_6 = shlight_1;
					  highp vec3 lightColor0_19;
					  lightColor0_19 = unity_LightColor[0].xyz;
					  highp vec3 lightColor1_20;
					  lightColor1_20 = unity_LightColor[1].xyz;
					  highp vec3 lightColor2_21;
					  lightColor2_21 = unity_LightColor[2].xyz;
					  highp vec3 lightColor3_22;
					  lightColor3_22 = unity_LightColor[3].xyz;
					  highp vec4 lightAttenSq_23;
					  lightAttenSq_23 = unity_4LightAtten0;
					  highp vec3 normal_24;
					  normal_24 = worldNormal_2;
					  highp vec3 col_25;
					  highp vec4 ndotl_26;
					  highp vec4 lengthSq_27;
					  highp vec4 tmpvar_28;
					  tmpvar_28 = (unity_4LightPosX0 - tmpvar_9.x);
					  highp vec4 tmpvar_29;
					  tmpvar_29 = (unity_4LightPosY0 - tmpvar_9.y);
					  highp vec4 tmpvar_30;
					  tmpvar_30 = (unity_4LightPosZ0 - tmpvar_9.z);
					  lengthSq_27 = (tmpvar_28 * tmpvar_28);
					  lengthSq_27 = (lengthSq_27 + (tmpvar_29 * tmpvar_29));
					  lengthSq_27 = (lengthSq_27 + (tmpvar_30 * tmpvar_30));
					  highp vec4 tmpvar_31;
					  tmpvar_31 = max (lengthSq_27, vec4(1e-06, 1e-06, 1e-06, 1e-06));
					  lengthSq_27 = tmpvar_31;
					  ndotl_26 = (tmpvar_28 * normal_24.x);
					  ndotl_26 = (ndotl_26 + (tmpvar_29 * normal_24.y));
					  ndotl_26 = (ndotl_26 + (tmpvar_30 * normal_24.z));
					  highp vec4 tmpvar_32;
					  tmpvar_32 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_26 * inversesqrt(tmpvar_31)));
					  ndotl_26 = tmpvar_32;
					  highp vec4 tmpvar_33;
					  tmpvar_33 = (tmpvar_32 * (1.0/((1.0 + 
					    (tmpvar_31 * lightAttenSq_23)
					  ))));
					  col_25 = (lightColor0_19 * tmpvar_33.x);
					  col_25 = (col_25 + (lightColor1_20 * tmpvar_33.y));
					  col_25 = (col_25 + (lightColor2_21 * tmpvar_33.z));
					  col_25 = (col_25 + (lightColor3_22 * tmpvar_33.w));
					  tmpvar_6 = (tmpvar_6 + col_25);
					  highp float tmpvar_34;
					  tmpvar_34 = (unity_FogParams.x * tmpvar_7.z);
					  gl_Position = tmpvar_7;
					  xlv_TEXCOORD0 = tmpvar_3;
					  xlv_TEXCOORD1 = tmpvar_4;
					  xlv_TEXCOORD2 = tmpvar_5;
					  xlv_TEXCOORD3 = tmpvar_9.xyz;
					  xlv_TEXCOORD4 = tmpvar_6;
					  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_9);
					  xlv_TEXCOORD6 = exp2((-(tmpvar_34) * tmpvar_34));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform mediump vec4 _LightShadowData;
					uniform lowp vec4 unity_FogColor;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform highp sampler2D _ShadowMapTexture;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					varying highp vec4 xlv_TEXCOORD5;
					varying highp float xlv_TEXCOORD6;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = _WorldSpaceLightPos0.xyz;
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  lowp vec3 tmpvar_7;
					  mediump float tmpvar_8;
					  lowp float tmpvar_9;
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_7 = (((tmpvar_11 * tmpvar_10.x) + (tmpvar_12 * tmpvar_10.y)) + (tmpvar_13 * tmpvar_10.z)).xyz;
					  tmpvar_9 = (((tmpvar_11.w * tmpvar_10.x) + (tmpvar_12.w * tmpvar_10.y)) + (tmpvar_13.w * tmpvar_10.z));
					  tmpvar_8 = (((_ShininessL0 * tmpvar_10.x) + (_ShininessL1 * tmpvar_10.y)) + (_ShininessL2 * tmpvar_10.z));
					  lowp float tmpvar_14;
					  highp float lightShadowDataX_15;
					  mediump float tmpvar_16;
					  tmpvar_16 = _LightShadowData.x;
					  lightShadowDataX_15 = tmpvar_16;
					  highp float tmpvar_17;
					  tmpvar_17 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_15);
					  tmpvar_14 = tmpvar_17;
					  c_1.w = 0.0;
					  c_1.xyz = (tmpvar_7 * xlv_TEXCOORD4);
					  lowp vec4 c_18;
					  lowp float spec_19;
					  lowp float tmpvar_20;
					  tmpvar_20 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_21;
					  tmpvar_21 = (pow (tmpvar_20, (tmpvar_8 * 128.0)) * tmpvar_9);
					  spec_19 = tmpvar_21;
					  c_18.xyz = (((
					    (tmpvar_7 * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_19)) * (tmpvar_14 * 2.0));
					  c_18.w = 0.0;
					  c_1 = (c_1 + c_18);
					  highp float tmpvar_22;
					  tmpvar_22 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
					  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_22));
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_EXP2" "VERTEXLIGHT_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 unity_4LightPosX0;
					uniform highp vec4 unity_4LightPosY0;
					uniform highp vec4 unity_4LightPosZ0;
					uniform mediump vec4 unity_4LightAtten0;
					uniform mediump vec4 unity_LightColor[8];
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					uniform highp mat4 unity_WorldToShadow[4];
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					varying highp vec4 xlv_TEXCOORD5;
					varying highp float xlv_TEXCOORD6;
					void main ()
					{
					  highp vec3 shlight_1;
					  lowp vec3 worldNormal_2;
					  highp vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  mediump vec3 tmpvar_5;
					  lowp vec3 tmpvar_6;
					  highp vec4 tmpvar_7;
					  highp vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = _glesVertex.xyz;
					  tmpvar_7 = (glstate_matrix_mvp * tmpvar_8);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp vec4 tmpvar_9;
					  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
					  highp mat3 tmpvar_10;
					  tmpvar_10[0] = unity_WorldToObject[0].xyz;
					  tmpvar_10[1] = unity_WorldToObject[1].xyz;
					  tmpvar_10[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_11;
					  tmpvar_11 = normalize((_glesNormal * tmpvar_10));
					  worldNormal_2 = tmpvar_11;
					  tmpvar_5 = worldNormal_2;
					  lowp vec4 tmpvar_12;
					  tmpvar_12.w = 1.0;
					  tmpvar_12.xyz = worldNormal_2;
					  mediump vec4 normal_13;
					  normal_13 = tmpvar_12;
					  mediump vec3 res_14;
					  mediump vec3 x_15;
					  x_15.x = dot (unity_SHAr, normal_13);
					  x_15.y = dot (unity_SHAg, normal_13);
					  x_15.z = dot (unity_SHAb, normal_13);
					  mediump vec3 x1_16;
					  mediump vec4 tmpvar_17;
					  tmpvar_17 = (normal_13.xyzz * normal_13.yzzx);
					  x1_16.x = dot (unity_SHBr, tmpvar_17);
					  x1_16.y = dot (unity_SHBg, tmpvar_17);
					  x1_16.z = dot (unity_SHBb, tmpvar_17);
					  res_14 = (x_15 + (x1_16 + (unity_SHC.xyz * 
					    ((normal_13.x * normal_13.x) - (normal_13.y * normal_13.y))
					  )));
					  mediump vec3 tmpvar_18;
					  tmpvar_18 = max (((1.055 * 
					    pow (max (res_14, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
					  ) - 0.055), vec3(0.0, 0.0, 0.0));
					  res_14 = tmpvar_18;
					  shlight_1 = tmpvar_18;
					  tmpvar_6 = shlight_1;
					  highp vec3 lightColor0_19;
					  lightColor0_19 = unity_LightColor[0].xyz;
					  highp vec3 lightColor1_20;
					  lightColor1_20 = unity_LightColor[1].xyz;
					  highp vec3 lightColor2_21;
					  lightColor2_21 = unity_LightColor[2].xyz;
					  highp vec3 lightColor3_22;
					  lightColor3_22 = unity_LightColor[3].xyz;
					  highp vec4 lightAttenSq_23;
					  lightAttenSq_23 = unity_4LightAtten0;
					  highp vec3 normal_24;
					  normal_24 = worldNormal_2;
					  highp vec3 col_25;
					  highp vec4 ndotl_26;
					  highp vec4 lengthSq_27;
					  highp vec4 tmpvar_28;
					  tmpvar_28 = (unity_4LightPosX0 - tmpvar_9.x);
					  highp vec4 tmpvar_29;
					  tmpvar_29 = (unity_4LightPosY0 - tmpvar_9.y);
					  highp vec4 tmpvar_30;
					  tmpvar_30 = (unity_4LightPosZ0 - tmpvar_9.z);
					  lengthSq_27 = (tmpvar_28 * tmpvar_28);
					  lengthSq_27 = (lengthSq_27 + (tmpvar_29 * tmpvar_29));
					  lengthSq_27 = (lengthSq_27 + (tmpvar_30 * tmpvar_30));
					  highp vec4 tmpvar_31;
					  tmpvar_31 = max (lengthSq_27, vec4(1e-06, 1e-06, 1e-06, 1e-06));
					  lengthSq_27 = tmpvar_31;
					  ndotl_26 = (tmpvar_28 * normal_24.x);
					  ndotl_26 = (ndotl_26 + (tmpvar_29 * normal_24.y));
					  ndotl_26 = (ndotl_26 + (tmpvar_30 * normal_24.z));
					  highp vec4 tmpvar_32;
					  tmpvar_32 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_26 * inversesqrt(tmpvar_31)));
					  ndotl_26 = tmpvar_32;
					  highp vec4 tmpvar_33;
					  tmpvar_33 = (tmpvar_32 * (1.0/((1.0 + 
					    (tmpvar_31 * lightAttenSq_23)
					  ))));
					  col_25 = (lightColor0_19 * tmpvar_33.x);
					  col_25 = (col_25 + (lightColor1_20 * tmpvar_33.y));
					  col_25 = (col_25 + (lightColor2_21 * tmpvar_33.z));
					  col_25 = (col_25 + (lightColor3_22 * tmpvar_33.w));
					  tmpvar_6 = (tmpvar_6 + col_25);
					  highp float tmpvar_34;
					  tmpvar_34 = (unity_FogParams.x * tmpvar_7.z);
					  gl_Position = tmpvar_7;
					  xlv_TEXCOORD0 = tmpvar_3;
					  xlv_TEXCOORD1 = tmpvar_4;
					  xlv_TEXCOORD2 = tmpvar_5;
					  xlv_TEXCOORD3 = tmpvar_9.xyz;
					  xlv_TEXCOORD4 = tmpvar_6;
					  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_9);
					  xlv_TEXCOORD6 = exp2((-(tmpvar_34) * tmpvar_34));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform mediump vec4 _LightShadowData;
					uniform lowp vec4 unity_FogColor;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform highp sampler2D _ShadowMapTexture;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying lowp vec3 xlv_TEXCOORD4;
					varying highp vec4 xlv_TEXCOORD5;
					varying highp float xlv_TEXCOORD6;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = _WorldSpaceLightPos0.xyz;
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  lowp vec3 tmpvar_7;
					  mediump float tmpvar_8;
					  lowp float tmpvar_9;
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_7 = (((tmpvar_11 * tmpvar_10.x) + (tmpvar_12 * tmpvar_10.y)) + (tmpvar_13 * tmpvar_10.z)).xyz;
					  tmpvar_9 = (((tmpvar_11.w * tmpvar_10.x) + (tmpvar_12.w * tmpvar_10.y)) + (tmpvar_13.w * tmpvar_10.z));
					  tmpvar_8 = (((_ShininessL0 * tmpvar_10.x) + (_ShininessL1 * tmpvar_10.y)) + (_ShininessL2 * tmpvar_10.z));
					  lowp float tmpvar_14;
					  highp float lightShadowDataX_15;
					  mediump float tmpvar_16;
					  tmpvar_16 = _LightShadowData.x;
					  lightShadowDataX_15 = tmpvar_16;
					  highp float tmpvar_17;
					  tmpvar_17 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_15);
					  tmpvar_14 = tmpvar_17;
					  c_1.w = 0.0;
					  c_1.xyz = (tmpvar_7 * xlv_TEXCOORD4);
					  lowp vec4 c_18;
					  lowp float spec_19;
					  lowp float tmpvar_20;
					  tmpvar_20 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_21;
					  tmpvar_21 = (pow (tmpvar_20, (tmpvar_8 * 128.0)) * tmpvar_9);
					  spec_19 = tmpvar_21;
					  c_18.xyz = (((
					    (tmpvar_7 * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_19)) * (tmpvar_14 * 2.0));
					  c_18.w = 0.0;
					  c_1 = (c_1 + c_18);
					  highp float tmpvar_22;
					  tmpvar_22 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
					  c_1.xyz = mix (unity_FogColor.xyz, c_1.xyz, vec3(tmpvar_22));
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_EXP2" "VERTEXLIGHT_ON" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 unity_4LightPosX0;
					uniform 	vec4 unity_4LightPosY0;
					uniform 	vec4 unity_4LightPosZ0;
					uniform 	mediump vec4 unity_4LightAtten0;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp float vs_TEXCOORD6;
					out highp vec3 vs_TEXCOORD3;
					out lowp vec3 vs_TEXCOORD4;
					out highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump vec3 u_xlat16_2;
					vec4 u_xlat3;
					mediump vec4 u_xlat16_3;
					vec4 u_xlat4;
					mediump vec3 u_xlat16_4;
					vec3 u_xlat5;
					float u_xlat18;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD6 = exp2(u_xlat0.x);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_3 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_3);
					    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_3);
					    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_3);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_4.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat16_2.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat2 = (-u_xlat1.yyyy) + unity_4LightPosY0;
					    u_xlat3 = u_xlat0.yyyy * u_xlat2;
					    u_xlat2 = u_xlat2 * u_xlat2;
					    u_xlat4 = (-u_xlat1.xxxx) + unity_4LightPosX0;
					    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
					    u_xlat3 = u_xlat4 * u_xlat0.xxxx + u_xlat3;
					    u_xlat0 = u_xlat1 * u_xlat0.zzzz + u_xlat3;
					    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
					    u_xlat1 = u_xlat1 * u_xlat1 + u_xlat2;
					    u_xlat1 = max(u_xlat1, vec4(9.99999997e-007, 9.99999997e-007, 9.99999997e-007, 9.99999997e-007));
					    u_xlat2 = inversesqrt(u_xlat1);
					    u_xlat1 = u_xlat1 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat0 = max(u_xlat0, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat0 = u_xlat1 * u_xlat0;
					    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
					    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat5.xyz;
					    vs_TEXCOORD4.xyz = u_xlat0.xyz;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightShadowData;
					uniform 	lowp vec4 unity_FogColor;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					uniform lowp sampler2D _ShadowMapTexture;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp float vs_TEXCOORD6;
					in highp vec3 vs_TEXCOORD3;
					in lowp vec3 vs_TEXCOORD4;
					in highp vec4 vs_TEXCOORD5;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec3 u_xlat6;
					mediump vec3 u_xlat16_6;
					lowp float u_xlat10_6;
					mediump float u_xlat16_9;
					float u_xlat21;
					lowp float u_xlat10_25;
					float u_xlat27;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_5.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_4.xyz = u_xlat10_5.xyz * vec3(u_xlat10_25) + u_xlat10_4.xyz;
					    vec3 txVec0 = vec3(vs_TEXCOORD5.xy,vs_TEXCOORD5.z);
					    u_xlat10_6 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_2 = (-_LightShadowData.x) + 1.0;
					    u_xlat16_2 = u_xlat10_6 * u_xlat16_2 + _LightShadowData.x;
					    u_xlat10_25 = u_xlat16_2 * 2.0;
					    u_xlat10_4.xyz = vec3(u_xlat10_25) * u_xlat10_4.xyz;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * vs_TEXCOORD4.xyz + u_xlat10_4.xyz;
					    u_xlat16_6.xyz = u_xlat10_4.xyz + (-unity_FogColor.xyz);
					    u_xlat27 = vs_TEXCOORD6;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
					#else
					    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
					#endif
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat16_6.xyz + unity_FogColor.xyz;
					    SV_Target0.xyz = u_xlat6.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_EXP2" "VERTEXLIGHT_ON" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 unity_4LightPosX0;
					uniform 	vec4 unity_4LightPosY0;
					uniform 	vec4 unity_4LightPosZ0;
					uniform 	mediump vec4 unity_4LightAtten0;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp float vs_TEXCOORD6;
					out highp vec3 vs_TEXCOORD3;
					out lowp vec3 vs_TEXCOORD4;
					out highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump vec3 u_xlat16_2;
					vec4 u_xlat3;
					mediump vec4 u_xlat16_3;
					vec4 u_xlat4;
					mediump vec3 u_xlat16_4;
					vec3 u_xlat5;
					float u_xlat18;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD6 = exp2(u_xlat0.x);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_3 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_3);
					    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_3);
					    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_3);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_4.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat16_2.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat2 = (-u_xlat1.yyyy) + unity_4LightPosY0;
					    u_xlat3 = u_xlat0.yyyy * u_xlat2;
					    u_xlat2 = u_xlat2 * u_xlat2;
					    u_xlat4 = (-u_xlat1.xxxx) + unity_4LightPosX0;
					    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
					    u_xlat3 = u_xlat4 * u_xlat0.xxxx + u_xlat3;
					    u_xlat0 = u_xlat1 * u_xlat0.zzzz + u_xlat3;
					    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
					    u_xlat1 = u_xlat1 * u_xlat1 + u_xlat2;
					    u_xlat1 = max(u_xlat1, vec4(9.99999997e-007, 9.99999997e-007, 9.99999997e-007, 9.99999997e-007));
					    u_xlat2 = inversesqrt(u_xlat1);
					    u_xlat1 = u_xlat1 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat0 = max(u_xlat0, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat0 = u_xlat1 * u_xlat0;
					    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
					    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat5.xyz;
					    vs_TEXCOORD4.xyz = u_xlat0.xyz;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightShadowData;
					uniform 	lowp vec4 unity_FogColor;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					uniform lowp sampler2D _ShadowMapTexture;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp float vs_TEXCOORD6;
					in highp vec3 vs_TEXCOORD3;
					in lowp vec3 vs_TEXCOORD4;
					in highp vec4 vs_TEXCOORD5;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec3 u_xlat6;
					mediump vec3 u_xlat16_6;
					lowp float u_xlat10_6;
					mediump float u_xlat16_9;
					float u_xlat21;
					lowp float u_xlat10_25;
					float u_xlat27;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_5.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_4.xyz = u_xlat10_5.xyz * vec3(u_xlat10_25) + u_xlat10_4.xyz;
					    vec3 txVec0 = vec3(vs_TEXCOORD5.xy,vs_TEXCOORD5.z);
					    u_xlat10_6 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_2 = (-_LightShadowData.x) + 1.0;
					    u_xlat16_2 = u_xlat10_6 * u_xlat16_2 + _LightShadowData.x;
					    u_xlat10_25 = u_xlat16_2 * 2.0;
					    u_xlat10_4.xyz = vec3(u_xlat10_25) * u_xlat10_4.xyz;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * vs_TEXCOORD4.xyz + u_xlat10_4.xyz;
					    u_xlat16_6.xyz = u_xlat10_4.xyz + (-unity_FogColor.xyz);
					    u_xlat27 = vs_TEXCOORD6;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
					#else
					    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
					#endif
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat16_6.xyz + unity_FogColor.xyz;
					    SV_Target0.xyz = u_xlat6.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_EXP2" "VERTEXLIGHT_ON" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 unity_4LightPosX0;
					uniform 	vec4 unity_4LightPosY0;
					uniform 	vec4 unity_4LightPosZ0;
					uniform 	mediump vec4 unity_4LightAtten0;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp float vs_TEXCOORD6;
					out highp vec3 vs_TEXCOORD3;
					out lowp vec3 vs_TEXCOORD4;
					out highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump vec3 u_xlat16_2;
					vec4 u_xlat3;
					mediump vec4 u_xlat16_3;
					vec4 u_xlat4;
					mediump vec3 u_xlat16_4;
					vec3 u_xlat5;
					float u_xlat18;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD6 = exp2(u_xlat0.x);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_3 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_3);
					    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_3);
					    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_3);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_4.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat16_2.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat2 = (-u_xlat1.yyyy) + unity_4LightPosY0;
					    u_xlat3 = u_xlat0.yyyy * u_xlat2;
					    u_xlat2 = u_xlat2 * u_xlat2;
					    u_xlat4 = (-u_xlat1.xxxx) + unity_4LightPosX0;
					    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
					    u_xlat3 = u_xlat4 * u_xlat0.xxxx + u_xlat3;
					    u_xlat0 = u_xlat1 * u_xlat0.zzzz + u_xlat3;
					    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
					    u_xlat1 = u_xlat1 * u_xlat1 + u_xlat2;
					    u_xlat1 = max(u_xlat1, vec4(9.99999997e-007, 9.99999997e-007, 9.99999997e-007, 9.99999997e-007));
					    u_xlat2 = inversesqrt(u_xlat1);
					    u_xlat1 = u_xlat1 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat0 = max(u_xlat0, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat0 = u_xlat1 * u_xlat0;
					    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
					    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat5.xyz;
					    vs_TEXCOORD4.xyz = u_xlat0.xyz;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightShadowData;
					uniform 	lowp vec4 unity_FogColor;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					uniform lowp sampler2D _ShadowMapTexture;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp float vs_TEXCOORD6;
					in highp vec3 vs_TEXCOORD3;
					in lowp vec3 vs_TEXCOORD4;
					in highp vec4 vs_TEXCOORD5;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec3 u_xlat6;
					mediump vec3 u_xlat16_6;
					lowp float u_xlat10_6;
					mediump float u_xlat16_9;
					float u_xlat21;
					lowp float u_xlat10_25;
					float u_xlat27;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_5.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_4.xyz = u_xlat10_5.xyz * vec3(u_xlat10_25) + u_xlat10_4.xyz;
					    vec3 txVec0 = vec3(vs_TEXCOORD5.xy,vs_TEXCOORD5.z);
					    u_xlat10_6 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_2 = (-_LightShadowData.x) + 1.0;
					    u_xlat16_2 = u_xlat10_6 * u_xlat16_2 + _LightShadowData.x;
					    u_xlat10_25 = u_xlat16_2 * 2.0;
					    u_xlat10_4.xyz = vec3(u_xlat10_25) * u_xlat10_4.xyz;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * vs_TEXCOORD4.xyz + u_xlat10_4.xyz;
					    u_xlat16_6.xyz = u_xlat10_4.xyz + (-unity_FogColor.xyz);
					    u_xlat27 = vs_TEXCOORD6;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
					#else
					    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
					#endif
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat16_6.xyz + unity_FogColor.xyz;
					    SV_Target0.xyz = u_xlat6.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_EXP2" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_EXP2" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_EXP2" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_EXP2" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_EXP2" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_EXP2" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "FOG_EXP2" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "FOG_EXP2" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "FOG_EXP2" }
					"!!GLES3"
				}
			}
		}
		Pass {
			Name "FORWARD"
			Tags { "LIGHTMODE" = "ForwardAdd" "RenderType" = "Opaque" "SplatCount" = "3" }
			Blend One One, One One
			ZClip Off
			ZWrite Off
			GpuProgramID 98160
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					Keywords { "POINT" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5.w = 1.0;
					  tmpvar_5.xyz = _glesVertex.xyz;
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_6;
					  tmpvar_6[0] = unity_WorldToObject[0].xyz;
					  tmpvar_6[1] = unity_WorldToObject[1].xyz;
					  tmpvar_6[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
					  worldNormal_1 = tmpvar_7;
					  tmpvar_4 = worldNormal_1;
					  gl_Position = (glstate_matrix_mvp * tmpvar_5);
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform sampler2D _LightTexture0;
					uniform highp mat4 unity_WorldToLight;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD3));
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  mediump float tmpvar_7;
					  lowp float tmpvar_8;
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_8 = (((tmpvar_10.w * tmpvar_9.x) + (tmpvar_11.w * tmpvar_9.y)) + (tmpvar_12.w * tmpvar_9.z));
					  tmpvar_7 = (((_ShininessL0 * tmpvar_9.x) + (_ShininessL1 * tmpvar_9.y)) + (_ShininessL2 * tmpvar_9.z));
					  highp vec4 tmpvar_13;
					  tmpvar_13.w = 1.0;
					  tmpvar_13.xyz = xlv_TEXCOORD3;
					  highp vec3 tmpvar_14;
					  tmpvar_14 = (unity_WorldToLight * tmpvar_13).xyz;
					  highp float tmpvar_15;
					  tmpvar_15 = dot (tmpvar_14, tmpvar_14);
					  lowp vec4 c_16;
					  lowp float spec_17;
					  lowp float tmpvar_18;
					  tmpvar_18 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_19;
					  tmpvar_19 = (pow (tmpvar_18, (tmpvar_7 * 128.0)) * tmpvar_8);
					  spec_17 = tmpvar_19;
					  c_16.xyz = (((
					    ((((tmpvar_10 * tmpvar_9.x) + (tmpvar_11 * tmpvar_9.y)) + (tmpvar_12 * tmpvar_9.z)).xyz * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_17)) * (texture2D (_LightTexture0, vec2(tmpvar_15)).w * 2.0));
					  c_16.w = 0.0;
					  c_1.xyz = c_16.xyz;
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "POINT" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5.w = 1.0;
					  tmpvar_5.xyz = _glesVertex.xyz;
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_6;
					  tmpvar_6[0] = unity_WorldToObject[0].xyz;
					  tmpvar_6[1] = unity_WorldToObject[1].xyz;
					  tmpvar_6[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
					  worldNormal_1 = tmpvar_7;
					  tmpvar_4 = worldNormal_1;
					  gl_Position = (glstate_matrix_mvp * tmpvar_5);
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform sampler2D _LightTexture0;
					uniform highp mat4 unity_WorldToLight;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD3));
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  mediump float tmpvar_7;
					  lowp float tmpvar_8;
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_8 = (((tmpvar_10.w * tmpvar_9.x) + (tmpvar_11.w * tmpvar_9.y)) + (tmpvar_12.w * tmpvar_9.z));
					  tmpvar_7 = (((_ShininessL0 * tmpvar_9.x) + (_ShininessL1 * tmpvar_9.y)) + (_ShininessL2 * tmpvar_9.z));
					  highp vec4 tmpvar_13;
					  tmpvar_13.w = 1.0;
					  tmpvar_13.xyz = xlv_TEXCOORD3;
					  highp vec3 tmpvar_14;
					  tmpvar_14 = (unity_WorldToLight * tmpvar_13).xyz;
					  highp float tmpvar_15;
					  tmpvar_15 = dot (tmpvar_14, tmpvar_14);
					  lowp vec4 c_16;
					  lowp float spec_17;
					  lowp float tmpvar_18;
					  tmpvar_18 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_19;
					  tmpvar_19 = (pow (tmpvar_18, (tmpvar_7 * 128.0)) * tmpvar_8);
					  spec_17 = tmpvar_19;
					  c_16.xyz = (((
					    ((((tmpvar_10 * tmpvar_9.x) + (tmpvar_11 * tmpvar_9.y)) + (tmpvar_12 * tmpvar_9.z)).xyz * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_17)) * (texture2D (_LightTexture0, vec2(tmpvar_15)).w * 2.0));
					  c_16.w = 0.0;
					  c_1.xyz = c_16.xyz;
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "POINT" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5.w = 1.0;
					  tmpvar_5.xyz = _glesVertex.xyz;
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_6;
					  tmpvar_6[0] = unity_WorldToObject[0].xyz;
					  tmpvar_6[1] = unity_WorldToObject[1].xyz;
					  tmpvar_6[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
					  worldNormal_1 = tmpvar_7;
					  tmpvar_4 = worldNormal_1;
					  gl_Position = (glstate_matrix_mvp * tmpvar_5);
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform sampler2D _LightTexture0;
					uniform highp mat4 unity_WorldToLight;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD3));
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  mediump float tmpvar_7;
					  lowp float tmpvar_8;
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_8 = (((tmpvar_10.w * tmpvar_9.x) + (tmpvar_11.w * tmpvar_9.y)) + (tmpvar_12.w * tmpvar_9.z));
					  tmpvar_7 = (((_ShininessL0 * tmpvar_9.x) + (_ShininessL1 * tmpvar_9.y)) + (_ShininessL2 * tmpvar_9.z));
					  highp vec4 tmpvar_13;
					  tmpvar_13.w = 1.0;
					  tmpvar_13.xyz = xlv_TEXCOORD3;
					  highp vec3 tmpvar_14;
					  tmpvar_14 = (unity_WorldToLight * tmpvar_13).xyz;
					  highp float tmpvar_15;
					  tmpvar_15 = dot (tmpvar_14, tmpvar_14);
					  lowp vec4 c_16;
					  lowp float spec_17;
					  lowp float tmpvar_18;
					  tmpvar_18 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_19;
					  tmpvar_19 = (pow (tmpvar_18, (tmpvar_7 * 128.0)) * tmpvar_8);
					  spec_17 = tmpvar_19;
					  c_16.xyz = (((
					    ((((tmpvar_10 * tmpvar_9.x) + (tmpvar_11 * tmpvar_9.y)) + (tmpvar_12 * tmpvar_9.z)).xyz * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_17)) * (texture2D (_LightTexture0, vec2(tmpvar_15)).w * 2.0));
					  c_16.w = 0.0;
					  c_1.xyz = c_16.xyz;
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "POINT" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2D _LightTexture0;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec3 u_xlat6;
					lowp float u_xlat10_6;
					mediump float u_xlat16_9;
					float u_xlat21;
					lowp float u_xlat10_25;
					float u_xlat27;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_5.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat6.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, u_xlat6.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(u_xlat10_25) + u_xlat10_5.xyz;
					    u_xlat6.xyz = vs_TEXCOORD3.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD3.xxx + u_xlat6.xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD3.zzz + u_xlat6.xyz;
					    u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
					    u_xlat6.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat10_6 = texture(_LightTexture0, u_xlat6.xx).w;
					    u_xlat10_25 = u_xlat10_6 * 2.0;
					    SV_Target0.xyz = vec3(u_xlat10_25) * u_xlat10_4.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "POINT" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2D _LightTexture0;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec3 u_xlat6;
					lowp float u_xlat10_6;
					mediump float u_xlat16_9;
					float u_xlat21;
					lowp float u_xlat10_25;
					float u_xlat27;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_5.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat6.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, u_xlat6.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(u_xlat10_25) + u_xlat10_5.xyz;
					    u_xlat6.xyz = vs_TEXCOORD3.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD3.xxx + u_xlat6.xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD3.zzz + u_xlat6.xyz;
					    u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
					    u_xlat6.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat10_6 = texture(_LightTexture0, u_xlat6.xx).w;
					    u_xlat10_25 = u_xlat10_6 * 2.0;
					    SV_Target0.xyz = vec3(u_xlat10_25) * u_xlat10_4.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "POINT" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2D _LightTexture0;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec3 u_xlat6;
					lowp float u_xlat10_6;
					mediump float u_xlat16_9;
					float u_xlat21;
					lowp float u_xlat10_25;
					float u_xlat27;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_5.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat6.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, u_xlat6.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(u_xlat10_25) + u_xlat10_5.xyz;
					    u_xlat6.xyz = vs_TEXCOORD3.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD3.xxx + u_xlat6.xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD3.zzz + u_xlat6.xyz;
					    u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
					    u_xlat6.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat10_6 = texture(_LightTexture0, u_xlat6.xx).w;
					    u_xlat10_25 = u_xlat10_6 * 2.0;
					    SV_Target0.xyz = vec3(u_xlat10_25) * u_xlat10_4.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5.w = 1.0;
					  tmpvar_5.xyz = _glesVertex.xyz;
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_6;
					  tmpvar_6[0] = unity_WorldToObject[0].xyz;
					  tmpvar_6[1] = unity_WorldToObject[1].xyz;
					  tmpvar_6[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
					  worldNormal_1 = tmpvar_7;
					  tmpvar_4 = worldNormal_1;
					  gl_Position = (glstate_matrix_mvp * tmpvar_5);
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = _WorldSpaceLightPos0.xyz;
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  mediump float tmpvar_7;
					  lowp float tmpvar_8;
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_8 = (((tmpvar_10.w * tmpvar_9.x) + (tmpvar_11.w * tmpvar_9.y)) + (tmpvar_12.w * tmpvar_9.z));
					  tmpvar_7 = (((_ShininessL0 * tmpvar_9.x) + (_ShininessL1 * tmpvar_9.y)) + (_ShininessL2 * tmpvar_9.z));
					  lowp vec4 c_13;
					  lowp float spec_14;
					  lowp float tmpvar_15;
					  tmpvar_15 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_16;
					  tmpvar_16 = (pow (tmpvar_15, (tmpvar_7 * 128.0)) * tmpvar_8);
					  spec_14 = tmpvar_16;
					  c_13.xyz = (((
					    ((((tmpvar_10 * tmpvar_9.x) + (tmpvar_11 * tmpvar_9.y)) + (tmpvar_12 * tmpvar_9.z)).xyz * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_14)) * 2.0);
					  c_13.w = 0.0;
					  c_1.xyz = c_13.xyz;
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5.w = 1.0;
					  tmpvar_5.xyz = _glesVertex.xyz;
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_6;
					  tmpvar_6[0] = unity_WorldToObject[0].xyz;
					  tmpvar_6[1] = unity_WorldToObject[1].xyz;
					  tmpvar_6[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
					  worldNormal_1 = tmpvar_7;
					  tmpvar_4 = worldNormal_1;
					  gl_Position = (glstate_matrix_mvp * tmpvar_5);
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = _WorldSpaceLightPos0.xyz;
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  mediump float tmpvar_7;
					  lowp float tmpvar_8;
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_8 = (((tmpvar_10.w * tmpvar_9.x) + (tmpvar_11.w * tmpvar_9.y)) + (tmpvar_12.w * tmpvar_9.z));
					  tmpvar_7 = (((_ShininessL0 * tmpvar_9.x) + (_ShininessL1 * tmpvar_9.y)) + (_ShininessL2 * tmpvar_9.z));
					  lowp vec4 c_13;
					  lowp float spec_14;
					  lowp float tmpvar_15;
					  tmpvar_15 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_16;
					  tmpvar_16 = (pow (tmpvar_15, (tmpvar_7 * 128.0)) * tmpvar_8);
					  spec_14 = tmpvar_16;
					  c_13.xyz = (((
					    ((((tmpvar_10 * tmpvar_9.x) + (tmpvar_11 * tmpvar_9.y)) + (tmpvar_12 * tmpvar_9.z)).xyz * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_14)) * 2.0);
					  c_13.w = 0.0;
					  c_1.xyz = c_13.xyz;
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5.w = 1.0;
					  tmpvar_5.xyz = _glesVertex.xyz;
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_6;
					  tmpvar_6[0] = unity_WorldToObject[0].xyz;
					  tmpvar_6[1] = unity_WorldToObject[1].xyz;
					  tmpvar_6[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
					  worldNormal_1 = tmpvar_7;
					  tmpvar_4 = worldNormal_1;
					  gl_Position = (glstate_matrix_mvp * tmpvar_5);
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = _WorldSpaceLightPos0.xyz;
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  mediump float tmpvar_7;
					  lowp float tmpvar_8;
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_8 = (((tmpvar_10.w * tmpvar_9.x) + (tmpvar_11.w * tmpvar_9.y)) + (tmpvar_12.w * tmpvar_9.z));
					  tmpvar_7 = (((_ShininessL0 * tmpvar_9.x) + (_ShininessL1 * tmpvar_9.y)) + (_ShininessL2 * tmpvar_9.z));
					  lowp vec4 c_13;
					  lowp float spec_14;
					  lowp float tmpvar_15;
					  tmpvar_15 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_16;
					  tmpvar_16 = (pow (tmpvar_15, (tmpvar_7 * 128.0)) * tmpvar_8);
					  spec_14 = tmpvar_16;
					  c_13.xyz = (((
					    ((((tmpvar_10 * tmpvar_9.x) + (tmpvar_11 * tmpvar_9.y)) + (tmpvar_12 * tmpvar_9.z)).xyz * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_14)) * 2.0);
					  c_13.w = 0.0;
					  c_1.xyz = c_13.xyz;
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					mediump float u_xlat16_8;
					float u_xlat18;
					lowp float u_xlat10_22;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_8 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_8;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_5.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat10_22 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat10_22 = max(u_xlat10_22, 0.0);
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(u_xlat10_22) + u_xlat10_5.xyz;
					    SV_Target0.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0);
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					mediump float u_xlat16_8;
					float u_xlat18;
					lowp float u_xlat10_22;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_8 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_8;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_5.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat10_22 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat10_22 = max(u_xlat10_22, 0.0);
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(u_xlat10_22) + u_xlat10_5.xyz;
					    SV_Target0.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0);
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					mediump float u_xlat16_8;
					float u_xlat18;
					lowp float u_xlat10_22;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_8 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_8;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_5.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat10_22 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat10_22 = max(u_xlat10_22, 0.0);
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(u_xlat10_22) + u_xlat10_5.xyz;
					    SV_Target0.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0);
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "SPOT" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5.w = 1.0;
					  tmpvar_5.xyz = _glesVertex.xyz;
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_6;
					  tmpvar_6[0] = unity_WorldToObject[0].xyz;
					  tmpvar_6[1] = unity_WorldToObject[1].xyz;
					  tmpvar_6[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
					  worldNormal_1 = tmpvar_7;
					  tmpvar_4 = worldNormal_1;
					  gl_Position = (glstate_matrix_mvp * tmpvar_5);
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform sampler2D _LightTexture0;
					uniform highp mat4 unity_WorldToLight;
					uniform sampler2D _LightTextureB0;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp float atten_2;
					  lowp vec3 tmpvar_3;
					  lowp vec3 worldViewDir_4;
					  lowp vec3 lightDir_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD3));
					  lightDir_5 = tmpvar_6;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_4 = tmpvar_7;
					  tmpvar_3 = xlv_TEXCOORD2;
					  mediump float tmpvar_8;
					  lowp float tmpvar_9;
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_9 = (((tmpvar_11.w * tmpvar_10.x) + (tmpvar_12.w * tmpvar_10.y)) + (tmpvar_13.w * tmpvar_10.z));
					  tmpvar_8 = (((_ShininessL0 * tmpvar_10.x) + (_ShininessL1 * tmpvar_10.y)) + (_ShininessL2 * tmpvar_10.z));
					  highp vec4 tmpvar_14;
					  tmpvar_14.w = 1.0;
					  tmpvar_14.xyz = xlv_TEXCOORD3;
					  highp vec4 tmpvar_15;
					  tmpvar_15 = (unity_WorldToLight * tmpvar_14);
					  lowp vec4 tmpvar_16;
					  highp vec2 P_17;
					  P_17 = ((tmpvar_15.xy / tmpvar_15.w) + 0.5);
					  tmpvar_16 = texture2D (_LightTexture0, P_17);
					  highp float tmpvar_18;
					  tmpvar_18 = dot (tmpvar_15.xyz, tmpvar_15.xyz);
					  lowp vec4 tmpvar_19;
					  tmpvar_19 = texture2D (_LightTextureB0, vec2(tmpvar_18));
					  highp float tmpvar_20;
					  tmpvar_20 = ((float(
					    (tmpvar_15.z > 0.0)
					  ) * tmpvar_16.w) * tmpvar_19.w);
					  atten_2 = tmpvar_20;
					  lowp vec4 c_21;
					  lowp float spec_22;
					  lowp float tmpvar_23;
					  tmpvar_23 = max (0.0, dot (tmpvar_3, worldViewDir_4));
					  mediump float tmpvar_24;
					  tmpvar_24 = (pow (tmpvar_23, (tmpvar_8 * 128.0)) * tmpvar_9);
					  spec_22 = tmpvar_24;
					  c_21.xyz = (((
					    ((((tmpvar_11 * tmpvar_10.x) + (tmpvar_12 * tmpvar_10.y)) + (tmpvar_13 * tmpvar_10.z)).xyz * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_3, lightDir_5))
					  ) + (_SpecColor.xyz * spec_22)) * (atten_2 * 2.0));
					  c_21.w = 0.0;
					  c_1.xyz = c_21.xyz;
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "SPOT" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5.w = 1.0;
					  tmpvar_5.xyz = _glesVertex.xyz;
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_6;
					  tmpvar_6[0] = unity_WorldToObject[0].xyz;
					  tmpvar_6[1] = unity_WorldToObject[1].xyz;
					  tmpvar_6[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
					  worldNormal_1 = tmpvar_7;
					  tmpvar_4 = worldNormal_1;
					  gl_Position = (glstate_matrix_mvp * tmpvar_5);
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform sampler2D _LightTexture0;
					uniform highp mat4 unity_WorldToLight;
					uniform sampler2D _LightTextureB0;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp float atten_2;
					  lowp vec3 tmpvar_3;
					  lowp vec3 worldViewDir_4;
					  lowp vec3 lightDir_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD3));
					  lightDir_5 = tmpvar_6;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_4 = tmpvar_7;
					  tmpvar_3 = xlv_TEXCOORD2;
					  mediump float tmpvar_8;
					  lowp float tmpvar_9;
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_9 = (((tmpvar_11.w * tmpvar_10.x) + (tmpvar_12.w * tmpvar_10.y)) + (tmpvar_13.w * tmpvar_10.z));
					  tmpvar_8 = (((_ShininessL0 * tmpvar_10.x) + (_ShininessL1 * tmpvar_10.y)) + (_ShininessL2 * tmpvar_10.z));
					  highp vec4 tmpvar_14;
					  tmpvar_14.w = 1.0;
					  tmpvar_14.xyz = xlv_TEXCOORD3;
					  highp vec4 tmpvar_15;
					  tmpvar_15 = (unity_WorldToLight * tmpvar_14);
					  lowp vec4 tmpvar_16;
					  highp vec2 P_17;
					  P_17 = ((tmpvar_15.xy / tmpvar_15.w) + 0.5);
					  tmpvar_16 = texture2D (_LightTexture0, P_17);
					  highp float tmpvar_18;
					  tmpvar_18 = dot (tmpvar_15.xyz, tmpvar_15.xyz);
					  lowp vec4 tmpvar_19;
					  tmpvar_19 = texture2D (_LightTextureB0, vec2(tmpvar_18));
					  highp float tmpvar_20;
					  tmpvar_20 = ((float(
					    (tmpvar_15.z > 0.0)
					  ) * tmpvar_16.w) * tmpvar_19.w);
					  atten_2 = tmpvar_20;
					  lowp vec4 c_21;
					  lowp float spec_22;
					  lowp float tmpvar_23;
					  tmpvar_23 = max (0.0, dot (tmpvar_3, worldViewDir_4));
					  mediump float tmpvar_24;
					  tmpvar_24 = (pow (tmpvar_23, (tmpvar_8 * 128.0)) * tmpvar_9);
					  spec_22 = tmpvar_24;
					  c_21.xyz = (((
					    ((((tmpvar_11 * tmpvar_10.x) + (tmpvar_12 * tmpvar_10.y)) + (tmpvar_13 * tmpvar_10.z)).xyz * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_3, lightDir_5))
					  ) + (_SpecColor.xyz * spec_22)) * (atten_2 * 2.0));
					  c_21.w = 0.0;
					  c_1.xyz = c_21.xyz;
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "SPOT" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5.w = 1.0;
					  tmpvar_5.xyz = _glesVertex.xyz;
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_6;
					  tmpvar_6[0] = unity_WorldToObject[0].xyz;
					  tmpvar_6[1] = unity_WorldToObject[1].xyz;
					  tmpvar_6[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
					  worldNormal_1 = tmpvar_7;
					  tmpvar_4 = worldNormal_1;
					  gl_Position = (glstate_matrix_mvp * tmpvar_5);
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform sampler2D _LightTexture0;
					uniform highp mat4 unity_WorldToLight;
					uniform sampler2D _LightTextureB0;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp float atten_2;
					  lowp vec3 tmpvar_3;
					  lowp vec3 worldViewDir_4;
					  lowp vec3 lightDir_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD3));
					  lightDir_5 = tmpvar_6;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_4 = tmpvar_7;
					  tmpvar_3 = xlv_TEXCOORD2;
					  mediump float tmpvar_8;
					  lowp float tmpvar_9;
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_9 = (((tmpvar_11.w * tmpvar_10.x) + (tmpvar_12.w * tmpvar_10.y)) + (tmpvar_13.w * tmpvar_10.z));
					  tmpvar_8 = (((_ShininessL0 * tmpvar_10.x) + (_ShininessL1 * tmpvar_10.y)) + (_ShininessL2 * tmpvar_10.z));
					  highp vec4 tmpvar_14;
					  tmpvar_14.w = 1.0;
					  tmpvar_14.xyz = xlv_TEXCOORD3;
					  highp vec4 tmpvar_15;
					  tmpvar_15 = (unity_WorldToLight * tmpvar_14);
					  lowp vec4 tmpvar_16;
					  highp vec2 P_17;
					  P_17 = ((tmpvar_15.xy / tmpvar_15.w) + 0.5);
					  tmpvar_16 = texture2D (_LightTexture0, P_17);
					  highp float tmpvar_18;
					  tmpvar_18 = dot (tmpvar_15.xyz, tmpvar_15.xyz);
					  lowp vec4 tmpvar_19;
					  tmpvar_19 = texture2D (_LightTextureB0, vec2(tmpvar_18));
					  highp float tmpvar_20;
					  tmpvar_20 = ((float(
					    (tmpvar_15.z > 0.0)
					  ) * tmpvar_16.w) * tmpvar_19.w);
					  atten_2 = tmpvar_20;
					  lowp vec4 c_21;
					  lowp float spec_22;
					  lowp float tmpvar_23;
					  tmpvar_23 = max (0.0, dot (tmpvar_3, worldViewDir_4));
					  mediump float tmpvar_24;
					  tmpvar_24 = (pow (tmpvar_23, (tmpvar_8 * 128.0)) * tmpvar_9);
					  spec_22 = tmpvar_24;
					  c_21.xyz = (((
					    ((((tmpvar_11 * tmpvar_10.x) + (tmpvar_12 * tmpvar_10.y)) + (tmpvar_13 * tmpvar_10.z)).xyz * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_3, lightDir_5))
					  ) + (_SpecColor.xyz * spec_22)) * (atten_2 * 2.0));
					  c_21.w = 0.0;
					  c_1.xyz = c_21.xyz;
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "SPOT" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2D _LightTexture0;
					uniform lowp sampler2D _LightTextureB0;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec3 u_xlat6;
					lowp float u_xlat10_6;
					mediump float u_xlat16_9;
					bool u_xlatb13;
					float u_xlat20;
					lowp float u_xlat10_20;
					float u_xlat21;
					lowp float u_xlat10_25;
					float u_xlat27;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_5.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat6.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, u_xlat6.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(u_xlat10_25) + u_xlat10_5.xyz;
					    u_xlat0 = vs_TEXCOORD3.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
					    u_xlat0 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD3.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD3.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_WorldToLight[3];
					    u_xlat6.xy = u_xlat0.xy / u_xlat0.ww;
					    u_xlat6.xy = u_xlat6.xy + vec2(0.5, 0.5);
					    u_xlat10_6 = texture(_LightTexture0, u_xlat6.xy).w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb13 = !!(0.0<u_xlat0.z);
					#else
					    u_xlatb13 = 0.0<u_xlat0.z;
					#endif
					    u_xlat20 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat10_20 = texture(_LightTextureB0, vec2(u_xlat20)).w;
					    u_xlat10_25 = (u_xlatb13) ? 1.0 : 0.0;
					    u_xlat10_25 = u_xlat10_6 * u_xlat10_25;
					    u_xlat10_25 = u_xlat10_20 * u_xlat10_25;
					    u_xlat10_25 = u_xlat10_25 * 2.0;
					    SV_Target0.xyz = vec3(u_xlat10_25) * u_xlat10_4.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "SPOT" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2D _LightTexture0;
					uniform lowp sampler2D _LightTextureB0;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec3 u_xlat6;
					lowp float u_xlat10_6;
					mediump float u_xlat16_9;
					bool u_xlatb13;
					float u_xlat20;
					lowp float u_xlat10_20;
					float u_xlat21;
					lowp float u_xlat10_25;
					float u_xlat27;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_5.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat6.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, u_xlat6.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(u_xlat10_25) + u_xlat10_5.xyz;
					    u_xlat0 = vs_TEXCOORD3.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
					    u_xlat0 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD3.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD3.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_WorldToLight[3];
					    u_xlat6.xy = u_xlat0.xy / u_xlat0.ww;
					    u_xlat6.xy = u_xlat6.xy + vec2(0.5, 0.5);
					    u_xlat10_6 = texture(_LightTexture0, u_xlat6.xy).w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb13 = !!(0.0<u_xlat0.z);
					#else
					    u_xlatb13 = 0.0<u_xlat0.z;
					#endif
					    u_xlat20 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat10_20 = texture(_LightTextureB0, vec2(u_xlat20)).w;
					    u_xlat10_25 = (u_xlatb13) ? 1.0 : 0.0;
					    u_xlat10_25 = u_xlat10_6 * u_xlat10_25;
					    u_xlat10_25 = u_xlat10_20 * u_xlat10_25;
					    u_xlat10_25 = u_xlat10_25 * 2.0;
					    SV_Target0.xyz = vec3(u_xlat10_25) * u_xlat10_4.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "SPOT" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2D _LightTexture0;
					uniform lowp sampler2D _LightTextureB0;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec3 u_xlat6;
					lowp float u_xlat10_6;
					mediump float u_xlat16_9;
					bool u_xlatb13;
					float u_xlat20;
					lowp float u_xlat10_20;
					float u_xlat21;
					lowp float u_xlat10_25;
					float u_xlat27;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_5.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat6.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, u_xlat6.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(u_xlat10_25) + u_xlat10_5.xyz;
					    u_xlat0 = vs_TEXCOORD3.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
					    u_xlat0 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD3.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD3.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_WorldToLight[3];
					    u_xlat6.xy = u_xlat0.xy / u_xlat0.ww;
					    u_xlat6.xy = u_xlat6.xy + vec2(0.5, 0.5);
					    u_xlat10_6 = texture(_LightTexture0, u_xlat6.xy).w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb13 = !!(0.0<u_xlat0.z);
					#else
					    u_xlatb13 = 0.0<u_xlat0.z;
					#endif
					    u_xlat20 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat10_20 = texture(_LightTextureB0, vec2(u_xlat20)).w;
					    u_xlat10_25 = (u_xlatb13) ? 1.0 : 0.0;
					    u_xlat10_25 = u_xlat10_6 * u_xlat10_25;
					    u_xlat10_25 = u_xlat10_20 * u_xlat10_25;
					    u_xlat10_25 = u_xlat10_25 * 2.0;
					    SV_Target0.xyz = vec3(u_xlat10_25) * u_xlat10_4.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "POINT_COOKIE" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5.w = 1.0;
					  tmpvar_5.xyz = _glesVertex.xyz;
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_6;
					  tmpvar_6[0] = unity_WorldToObject[0].xyz;
					  tmpvar_6[1] = unity_WorldToObject[1].xyz;
					  tmpvar_6[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
					  worldNormal_1 = tmpvar_7;
					  tmpvar_4 = worldNormal_1;
					  gl_Position = (glstate_matrix_mvp * tmpvar_5);
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform lowp samplerCube _LightTexture0;
					uniform highp mat4 unity_WorldToLight;
					uniform sampler2D _LightTextureB0;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD3));
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  mediump float tmpvar_7;
					  lowp float tmpvar_8;
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_8 = (((tmpvar_10.w * tmpvar_9.x) + (tmpvar_11.w * tmpvar_9.y)) + (tmpvar_12.w * tmpvar_9.z));
					  tmpvar_7 = (((_ShininessL0 * tmpvar_9.x) + (_ShininessL1 * tmpvar_9.y)) + (_ShininessL2 * tmpvar_9.z));
					  highp vec4 tmpvar_13;
					  tmpvar_13.w = 1.0;
					  tmpvar_13.xyz = xlv_TEXCOORD3;
					  highp vec3 tmpvar_14;
					  tmpvar_14 = (unity_WorldToLight * tmpvar_13).xyz;
					  highp float tmpvar_15;
					  tmpvar_15 = dot (tmpvar_14, tmpvar_14);
					  lowp vec4 c_16;
					  lowp float spec_17;
					  lowp float tmpvar_18;
					  tmpvar_18 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_19;
					  tmpvar_19 = (pow (tmpvar_18, (tmpvar_7 * 128.0)) * tmpvar_8);
					  spec_17 = tmpvar_19;
					  c_16.xyz = (((
					    ((((tmpvar_10 * tmpvar_9.x) + (tmpvar_11 * tmpvar_9.y)) + (tmpvar_12 * tmpvar_9.z)).xyz * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_17)) * ((texture2D (_LightTextureB0, vec2(tmpvar_15)).w * textureCube (_LightTexture0, tmpvar_14).w) * 2.0));
					  c_16.w = 0.0;
					  c_1.xyz = c_16.xyz;
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "POINT_COOKIE" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5.w = 1.0;
					  tmpvar_5.xyz = _glesVertex.xyz;
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_6;
					  tmpvar_6[0] = unity_WorldToObject[0].xyz;
					  tmpvar_6[1] = unity_WorldToObject[1].xyz;
					  tmpvar_6[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
					  worldNormal_1 = tmpvar_7;
					  tmpvar_4 = worldNormal_1;
					  gl_Position = (glstate_matrix_mvp * tmpvar_5);
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform lowp samplerCube _LightTexture0;
					uniform highp mat4 unity_WorldToLight;
					uniform sampler2D _LightTextureB0;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD3));
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  mediump float tmpvar_7;
					  lowp float tmpvar_8;
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_8 = (((tmpvar_10.w * tmpvar_9.x) + (tmpvar_11.w * tmpvar_9.y)) + (tmpvar_12.w * tmpvar_9.z));
					  tmpvar_7 = (((_ShininessL0 * tmpvar_9.x) + (_ShininessL1 * tmpvar_9.y)) + (_ShininessL2 * tmpvar_9.z));
					  highp vec4 tmpvar_13;
					  tmpvar_13.w = 1.0;
					  tmpvar_13.xyz = xlv_TEXCOORD3;
					  highp vec3 tmpvar_14;
					  tmpvar_14 = (unity_WorldToLight * tmpvar_13).xyz;
					  highp float tmpvar_15;
					  tmpvar_15 = dot (tmpvar_14, tmpvar_14);
					  lowp vec4 c_16;
					  lowp float spec_17;
					  lowp float tmpvar_18;
					  tmpvar_18 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_19;
					  tmpvar_19 = (pow (tmpvar_18, (tmpvar_7 * 128.0)) * tmpvar_8);
					  spec_17 = tmpvar_19;
					  c_16.xyz = (((
					    ((((tmpvar_10 * tmpvar_9.x) + (tmpvar_11 * tmpvar_9.y)) + (tmpvar_12 * tmpvar_9.z)).xyz * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_17)) * ((texture2D (_LightTextureB0, vec2(tmpvar_15)).w * textureCube (_LightTexture0, tmpvar_14).w) * 2.0));
					  c_16.w = 0.0;
					  c_1.xyz = c_16.xyz;
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "POINT_COOKIE" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5.w = 1.0;
					  tmpvar_5.xyz = _glesVertex.xyz;
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_6;
					  tmpvar_6[0] = unity_WorldToObject[0].xyz;
					  tmpvar_6[1] = unity_WorldToObject[1].xyz;
					  tmpvar_6[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
					  worldNormal_1 = tmpvar_7;
					  tmpvar_4 = worldNormal_1;
					  gl_Position = (glstate_matrix_mvp * tmpvar_5);
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform lowp samplerCube _LightTexture0;
					uniform highp mat4 unity_WorldToLight;
					uniform sampler2D _LightTextureB0;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD3));
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  mediump float tmpvar_7;
					  lowp float tmpvar_8;
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_8 = (((tmpvar_10.w * tmpvar_9.x) + (tmpvar_11.w * tmpvar_9.y)) + (tmpvar_12.w * tmpvar_9.z));
					  tmpvar_7 = (((_ShininessL0 * tmpvar_9.x) + (_ShininessL1 * tmpvar_9.y)) + (_ShininessL2 * tmpvar_9.z));
					  highp vec4 tmpvar_13;
					  tmpvar_13.w = 1.0;
					  tmpvar_13.xyz = xlv_TEXCOORD3;
					  highp vec3 tmpvar_14;
					  tmpvar_14 = (unity_WorldToLight * tmpvar_13).xyz;
					  highp float tmpvar_15;
					  tmpvar_15 = dot (tmpvar_14, tmpvar_14);
					  lowp vec4 c_16;
					  lowp float spec_17;
					  lowp float tmpvar_18;
					  tmpvar_18 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_19;
					  tmpvar_19 = (pow (tmpvar_18, (tmpvar_7 * 128.0)) * tmpvar_8);
					  spec_17 = tmpvar_19;
					  c_16.xyz = (((
					    ((((tmpvar_10 * tmpvar_9.x) + (tmpvar_11 * tmpvar_9.y)) + (tmpvar_12 * tmpvar_9.z)).xyz * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_17)) * ((texture2D (_LightTextureB0, vec2(tmpvar_15)).w * textureCube (_LightTexture0, tmpvar_14).w) * 2.0));
					  c_16.w = 0.0;
					  c_1.xyz = c_16.xyz;
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "POINT_COOKIE" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2D _LightTextureB0;
					uniform lowp samplerCube _LightTexture0;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec3 u_xlat6;
					mediump float u_xlat16_6;
					lowp float u_xlat10_6;
					mediump float u_xlat16_9;
					lowp float u_xlat10_13;
					float u_xlat21;
					lowp float u_xlat10_25;
					float u_xlat27;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_5.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat6.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, u_xlat6.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(u_xlat10_25) + u_xlat10_5.xyz;
					    u_xlat6.xyz = vs_TEXCOORD3.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD3.xxx + u_xlat6.xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD3.zzz + u_xlat6.xyz;
					    u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
					    u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat10_6 = texture(_LightTexture0, u_xlat6.xyz).w;
					    u_xlat10_13 = texture(_LightTextureB0, vec2(u_xlat27)).w;
					    u_xlat16_6 = u_xlat10_6 * u_xlat10_13;
					    u_xlat10_25 = u_xlat16_6 * 2.0;
					    SV_Target0.xyz = vec3(u_xlat10_25) * u_xlat10_4.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "POINT_COOKIE" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2D _LightTextureB0;
					uniform lowp samplerCube _LightTexture0;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec3 u_xlat6;
					mediump float u_xlat16_6;
					lowp float u_xlat10_6;
					mediump float u_xlat16_9;
					lowp float u_xlat10_13;
					float u_xlat21;
					lowp float u_xlat10_25;
					float u_xlat27;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_5.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat6.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, u_xlat6.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(u_xlat10_25) + u_xlat10_5.xyz;
					    u_xlat6.xyz = vs_TEXCOORD3.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD3.xxx + u_xlat6.xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD3.zzz + u_xlat6.xyz;
					    u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
					    u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat10_6 = texture(_LightTexture0, u_xlat6.xyz).w;
					    u_xlat10_13 = texture(_LightTextureB0, vec2(u_xlat27)).w;
					    u_xlat16_6 = u_xlat10_6 * u_xlat10_13;
					    u_xlat10_25 = u_xlat16_6 * 2.0;
					    SV_Target0.xyz = vec3(u_xlat10_25) * u_xlat10_4.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "POINT_COOKIE" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2D _LightTextureB0;
					uniform lowp samplerCube _LightTexture0;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec3 u_xlat6;
					mediump float u_xlat16_6;
					lowp float u_xlat10_6;
					mediump float u_xlat16_9;
					lowp float u_xlat10_13;
					float u_xlat21;
					lowp float u_xlat10_25;
					float u_xlat27;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_5.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat6.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, u_xlat6.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(u_xlat10_25) + u_xlat10_5.xyz;
					    u_xlat6.xyz = vs_TEXCOORD3.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD3.xxx + u_xlat6.xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD3.zzz + u_xlat6.xyz;
					    u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
					    u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat10_6 = texture(_LightTexture0, u_xlat6.xyz).w;
					    u_xlat10_13 = texture(_LightTextureB0, vec2(u_xlat27)).w;
					    u_xlat16_6 = u_xlat10_6 * u_xlat10_13;
					    u_xlat10_25 = u_xlat16_6 * 2.0;
					    SV_Target0.xyz = vec3(u_xlat10_25) * u_xlat10_4.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL_COOKIE" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5.w = 1.0;
					  tmpvar_5.xyz = _glesVertex.xyz;
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_6;
					  tmpvar_6[0] = unity_WorldToObject[0].xyz;
					  tmpvar_6[1] = unity_WorldToObject[1].xyz;
					  tmpvar_6[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
					  worldNormal_1 = tmpvar_7;
					  tmpvar_4 = worldNormal_1;
					  gl_Position = (glstate_matrix_mvp * tmpvar_5);
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform sampler2D _LightTexture0;
					uniform highp mat4 unity_WorldToLight;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = _WorldSpaceLightPos0.xyz;
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  mediump float tmpvar_7;
					  lowp float tmpvar_8;
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_8 = (((tmpvar_10.w * tmpvar_9.x) + (tmpvar_11.w * tmpvar_9.y)) + (tmpvar_12.w * tmpvar_9.z));
					  tmpvar_7 = (((_ShininessL0 * tmpvar_9.x) + (_ShininessL1 * tmpvar_9.y)) + (_ShininessL2 * tmpvar_9.z));
					  highp vec4 tmpvar_13;
					  tmpvar_13.w = 1.0;
					  tmpvar_13.xyz = xlv_TEXCOORD3;
					  highp vec2 tmpvar_14;
					  tmpvar_14 = (unity_WorldToLight * tmpvar_13).xy;
					  lowp vec4 c_15;
					  lowp float spec_16;
					  lowp float tmpvar_17;
					  tmpvar_17 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_18;
					  tmpvar_18 = (pow (tmpvar_17, (tmpvar_7 * 128.0)) * tmpvar_8);
					  spec_16 = tmpvar_18;
					  c_15.xyz = (((
					    ((((tmpvar_10 * tmpvar_9.x) + (tmpvar_11 * tmpvar_9.y)) + (tmpvar_12 * tmpvar_9.z)).xyz * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_16)) * (texture2D (_LightTexture0, tmpvar_14).w * 2.0));
					  c_15.w = 0.0;
					  c_1.xyz = c_15.xyz;
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL_COOKIE" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5.w = 1.0;
					  tmpvar_5.xyz = _glesVertex.xyz;
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_6;
					  tmpvar_6[0] = unity_WorldToObject[0].xyz;
					  tmpvar_6[1] = unity_WorldToObject[1].xyz;
					  tmpvar_6[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
					  worldNormal_1 = tmpvar_7;
					  tmpvar_4 = worldNormal_1;
					  gl_Position = (glstate_matrix_mvp * tmpvar_5);
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform sampler2D _LightTexture0;
					uniform highp mat4 unity_WorldToLight;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = _WorldSpaceLightPos0.xyz;
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  mediump float tmpvar_7;
					  lowp float tmpvar_8;
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_8 = (((tmpvar_10.w * tmpvar_9.x) + (tmpvar_11.w * tmpvar_9.y)) + (tmpvar_12.w * tmpvar_9.z));
					  tmpvar_7 = (((_ShininessL0 * tmpvar_9.x) + (_ShininessL1 * tmpvar_9.y)) + (_ShininessL2 * tmpvar_9.z));
					  highp vec4 tmpvar_13;
					  tmpvar_13.w = 1.0;
					  tmpvar_13.xyz = xlv_TEXCOORD3;
					  highp vec2 tmpvar_14;
					  tmpvar_14 = (unity_WorldToLight * tmpvar_13).xy;
					  lowp vec4 c_15;
					  lowp float spec_16;
					  lowp float tmpvar_17;
					  tmpvar_17 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_18;
					  tmpvar_18 = (pow (tmpvar_17, (tmpvar_7 * 128.0)) * tmpvar_8);
					  spec_16 = tmpvar_18;
					  c_15.xyz = (((
					    ((((tmpvar_10 * tmpvar_9.x) + (tmpvar_11 * tmpvar_9.y)) + (tmpvar_12 * tmpvar_9.z)).xyz * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_16)) * (texture2D (_LightTexture0, tmpvar_14).w * 2.0));
					  c_15.w = 0.0;
					  c_1.xyz = c_15.xyz;
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL_COOKIE" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5.w = 1.0;
					  tmpvar_5.xyz = _glesVertex.xyz;
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_6;
					  tmpvar_6[0] = unity_WorldToObject[0].xyz;
					  tmpvar_6[1] = unity_WorldToObject[1].xyz;
					  tmpvar_6[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
					  worldNormal_1 = tmpvar_7;
					  tmpvar_4 = worldNormal_1;
					  gl_Position = (glstate_matrix_mvp * tmpvar_5);
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform sampler2D _LightTexture0;
					uniform highp mat4 unity_WorldToLight;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = _WorldSpaceLightPos0.xyz;
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  mediump float tmpvar_7;
					  lowp float tmpvar_8;
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_8 = (((tmpvar_10.w * tmpvar_9.x) + (tmpvar_11.w * tmpvar_9.y)) + (tmpvar_12.w * tmpvar_9.z));
					  tmpvar_7 = (((_ShininessL0 * tmpvar_9.x) + (_ShininessL1 * tmpvar_9.y)) + (_ShininessL2 * tmpvar_9.z));
					  highp vec4 tmpvar_13;
					  tmpvar_13.w = 1.0;
					  tmpvar_13.xyz = xlv_TEXCOORD3;
					  highp vec2 tmpvar_14;
					  tmpvar_14 = (unity_WorldToLight * tmpvar_13).xy;
					  lowp vec4 c_15;
					  lowp float spec_16;
					  lowp float tmpvar_17;
					  tmpvar_17 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_18;
					  tmpvar_18 = (pow (tmpvar_17, (tmpvar_7 * 128.0)) * tmpvar_8);
					  spec_16 = tmpvar_18;
					  c_15.xyz = (((
					    ((((tmpvar_10 * tmpvar_9.x) + (tmpvar_11 * tmpvar_9.y)) + (tmpvar_12 * tmpvar_9.z)).xyz * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_16)) * (texture2D (_LightTexture0, tmpvar_14).w * 2.0));
					  c_15.w = 0.0;
					  c_1.xyz = c_15.xyz;
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL_COOKIE" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2D _LightTexture0;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec2 u_xlat6;
					lowp float u_xlat10_6;
					mediump float u_xlat16_9;
					float u_xlat21;
					lowp float u_xlat10_25;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_5.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(u_xlat10_25) + u_xlat10_5.xyz;
					    u_xlat6.xy = vs_TEXCOORD3.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD3.xx + u_xlat6.xy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD3.zz + u_xlat6.xy;
					    u_xlat6.xy = u_xlat6.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
					    u_xlat10_6 = texture(_LightTexture0, u_xlat6.xy).w;
					    u_xlat10_25 = u_xlat10_6 * 2.0;
					    SV_Target0.xyz = vec3(u_xlat10_25) * u_xlat10_4.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL_COOKIE" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2D _LightTexture0;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec2 u_xlat6;
					lowp float u_xlat10_6;
					mediump float u_xlat16_9;
					float u_xlat21;
					lowp float u_xlat10_25;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_5.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(u_xlat10_25) + u_xlat10_5.xyz;
					    u_xlat6.xy = vs_TEXCOORD3.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD3.xx + u_xlat6.xy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD3.zz + u_xlat6.xy;
					    u_xlat6.xy = u_xlat6.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
					    u_xlat10_6 = texture(_LightTexture0, u_xlat6.xy).w;
					    u_xlat10_25 = u_xlat10_6 * 2.0;
					    SV_Target0.xyz = vec3(u_xlat10_25) * u_xlat10_4.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL_COOKIE" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2D _LightTexture0;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec2 u_xlat6;
					lowp float u_xlat10_6;
					mediump float u_xlat16_9;
					float u_xlat21;
					lowp float u_xlat10_25;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_5.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(u_xlat10_25) + u_xlat10_5.xyz;
					    u_xlat6.xy = vs_TEXCOORD3.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD3.xx + u_xlat6.xy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD3.zz + u_xlat6.xy;
					    u_xlat6.xy = u_xlat6.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
					    u_xlat10_6 = texture(_LightTexture0, u_xlat6.xy).w;
					    u_xlat10_25 = u_xlat10_6 * 2.0;
					    SV_Target0.xyz = vec3(u_xlat10_25) * u_xlat10_4.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "POINT" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = _glesVertex.xyz;
					  tmpvar_5 = (glstate_matrix_mvp * tmpvar_6);
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_7;
					  tmpvar_7[0] = unity_WorldToObject[0].xyz;
					  tmpvar_7[1] = unity_WorldToObject[1].xyz;
					  tmpvar_7[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_8;
					  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
					  worldNormal_1 = tmpvar_8;
					  tmpvar_4 = worldNormal_1;
					  highp float tmpvar_9;
					  tmpvar_9 = (unity_FogParams.x * tmpvar_5.z);
					  gl_Position = tmpvar_5;
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  xlv_TEXCOORD5 = exp2((-(tmpvar_9) * tmpvar_9));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform sampler2D _LightTexture0;
					uniform highp mat4 unity_WorldToLight;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD3));
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  mediump float tmpvar_7;
					  lowp float tmpvar_8;
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_8 = (((tmpvar_10.w * tmpvar_9.x) + (tmpvar_11.w * tmpvar_9.y)) + (tmpvar_12.w * tmpvar_9.z));
					  tmpvar_7 = (((_ShininessL0 * tmpvar_9.x) + (_ShininessL1 * tmpvar_9.y)) + (_ShininessL2 * tmpvar_9.z));
					  highp vec4 tmpvar_13;
					  tmpvar_13.w = 1.0;
					  tmpvar_13.xyz = xlv_TEXCOORD3;
					  highp vec3 tmpvar_14;
					  tmpvar_14 = (unity_WorldToLight * tmpvar_13).xyz;
					  highp float tmpvar_15;
					  tmpvar_15 = dot (tmpvar_14, tmpvar_14);
					  lowp vec4 c_16;
					  lowp float spec_17;
					  lowp float tmpvar_18;
					  tmpvar_18 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_19;
					  tmpvar_19 = (pow (tmpvar_18, (tmpvar_7 * 128.0)) * tmpvar_8);
					  spec_17 = tmpvar_19;
					  c_16.xyz = (((
					    ((((tmpvar_10 * tmpvar_9.x) + (tmpvar_11 * tmpvar_9.y)) + (tmpvar_12 * tmpvar_9.z)).xyz * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_17)) * (texture2D (_LightTexture0, vec2(tmpvar_15)).w * 2.0));
					  c_16.w = 0.0;
					  highp float tmpvar_20;
					  tmpvar_20 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
					  c_1.xyz = (c_16.xyz * vec3(tmpvar_20));
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "POINT" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = _glesVertex.xyz;
					  tmpvar_5 = (glstate_matrix_mvp * tmpvar_6);
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_7;
					  tmpvar_7[0] = unity_WorldToObject[0].xyz;
					  tmpvar_7[1] = unity_WorldToObject[1].xyz;
					  tmpvar_7[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_8;
					  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
					  worldNormal_1 = tmpvar_8;
					  tmpvar_4 = worldNormal_1;
					  highp float tmpvar_9;
					  tmpvar_9 = (unity_FogParams.x * tmpvar_5.z);
					  gl_Position = tmpvar_5;
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  xlv_TEXCOORD5 = exp2((-(tmpvar_9) * tmpvar_9));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform sampler2D _LightTexture0;
					uniform highp mat4 unity_WorldToLight;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD3));
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  mediump float tmpvar_7;
					  lowp float tmpvar_8;
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_8 = (((tmpvar_10.w * tmpvar_9.x) + (tmpvar_11.w * tmpvar_9.y)) + (tmpvar_12.w * tmpvar_9.z));
					  tmpvar_7 = (((_ShininessL0 * tmpvar_9.x) + (_ShininessL1 * tmpvar_9.y)) + (_ShininessL2 * tmpvar_9.z));
					  highp vec4 tmpvar_13;
					  tmpvar_13.w = 1.0;
					  tmpvar_13.xyz = xlv_TEXCOORD3;
					  highp vec3 tmpvar_14;
					  tmpvar_14 = (unity_WorldToLight * tmpvar_13).xyz;
					  highp float tmpvar_15;
					  tmpvar_15 = dot (tmpvar_14, tmpvar_14);
					  lowp vec4 c_16;
					  lowp float spec_17;
					  lowp float tmpvar_18;
					  tmpvar_18 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_19;
					  tmpvar_19 = (pow (tmpvar_18, (tmpvar_7 * 128.0)) * tmpvar_8);
					  spec_17 = tmpvar_19;
					  c_16.xyz = (((
					    ((((tmpvar_10 * tmpvar_9.x) + (tmpvar_11 * tmpvar_9.y)) + (tmpvar_12 * tmpvar_9.z)).xyz * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_17)) * (texture2D (_LightTexture0, vec2(tmpvar_15)).w * 2.0));
					  c_16.w = 0.0;
					  highp float tmpvar_20;
					  tmpvar_20 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
					  c_1.xyz = (c_16.xyz * vec3(tmpvar_20));
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "POINT" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = _glesVertex.xyz;
					  tmpvar_5 = (glstate_matrix_mvp * tmpvar_6);
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_7;
					  tmpvar_7[0] = unity_WorldToObject[0].xyz;
					  tmpvar_7[1] = unity_WorldToObject[1].xyz;
					  tmpvar_7[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_8;
					  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
					  worldNormal_1 = tmpvar_8;
					  tmpvar_4 = worldNormal_1;
					  highp float tmpvar_9;
					  tmpvar_9 = (unity_FogParams.x * tmpvar_5.z);
					  gl_Position = tmpvar_5;
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  xlv_TEXCOORD5 = exp2((-(tmpvar_9) * tmpvar_9));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform sampler2D _LightTexture0;
					uniform highp mat4 unity_WorldToLight;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD3));
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  mediump float tmpvar_7;
					  lowp float tmpvar_8;
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_8 = (((tmpvar_10.w * tmpvar_9.x) + (tmpvar_11.w * tmpvar_9.y)) + (tmpvar_12.w * tmpvar_9.z));
					  tmpvar_7 = (((_ShininessL0 * tmpvar_9.x) + (_ShininessL1 * tmpvar_9.y)) + (_ShininessL2 * tmpvar_9.z));
					  highp vec4 tmpvar_13;
					  tmpvar_13.w = 1.0;
					  tmpvar_13.xyz = xlv_TEXCOORD3;
					  highp vec3 tmpvar_14;
					  tmpvar_14 = (unity_WorldToLight * tmpvar_13).xyz;
					  highp float tmpvar_15;
					  tmpvar_15 = dot (tmpvar_14, tmpvar_14);
					  lowp vec4 c_16;
					  lowp float spec_17;
					  lowp float tmpvar_18;
					  tmpvar_18 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_19;
					  tmpvar_19 = (pow (tmpvar_18, (tmpvar_7 * 128.0)) * tmpvar_8);
					  spec_17 = tmpvar_19;
					  c_16.xyz = (((
					    ((((tmpvar_10 * tmpvar_9.x) + (tmpvar_11 * tmpvar_9.y)) + (tmpvar_12 * tmpvar_9.z)).xyz * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_17)) * (texture2D (_LightTexture0, vec2(tmpvar_15)).w * 2.0));
					  c_16.w = 0.0;
					  highp float tmpvar_20;
					  tmpvar_20 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
					  c_1.xyz = (c_16.xyz * vec3(tmpvar_20));
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "POINT" "FOG_EXP2" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp float vs_TEXCOORD5;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD5 = exp2(u_xlat0.x);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2D _LightTexture0;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp float vs_TEXCOORD5;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec3 u_xlat6;
					lowp float u_xlat10_6;
					mediump float u_xlat16_9;
					float u_xlat21;
					lowp float u_xlat10_25;
					float u_xlat27;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_5.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat6.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, u_xlat6.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(u_xlat10_25) + u_xlat10_5.xyz;
					    u_xlat6.xyz = vs_TEXCOORD3.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD3.xxx + u_xlat6.xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD3.zzz + u_xlat6.xyz;
					    u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
					    u_xlat6.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat10_6 = texture(_LightTexture0, u_xlat6.xx).w;
					    u_xlat10_25 = u_xlat10_6 * 2.0;
					    u_xlat10_4.xyz = vec3(u_xlat10_25) * u_xlat10_4.xyz;
					    u_xlat6.x = vs_TEXCOORD5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
					#else
					    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					#endif
					    u_xlat6.xyz = u_xlat10_4.xyz * u_xlat6.xxx;
					    SV_Target0.xyz = u_xlat6.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "POINT" "FOG_EXP2" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp float vs_TEXCOORD5;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD5 = exp2(u_xlat0.x);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2D _LightTexture0;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp float vs_TEXCOORD5;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec3 u_xlat6;
					lowp float u_xlat10_6;
					mediump float u_xlat16_9;
					float u_xlat21;
					lowp float u_xlat10_25;
					float u_xlat27;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_5.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat6.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, u_xlat6.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(u_xlat10_25) + u_xlat10_5.xyz;
					    u_xlat6.xyz = vs_TEXCOORD3.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD3.xxx + u_xlat6.xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD3.zzz + u_xlat6.xyz;
					    u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
					    u_xlat6.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat10_6 = texture(_LightTexture0, u_xlat6.xx).w;
					    u_xlat10_25 = u_xlat10_6 * 2.0;
					    u_xlat10_4.xyz = vec3(u_xlat10_25) * u_xlat10_4.xyz;
					    u_xlat6.x = vs_TEXCOORD5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
					#else
					    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					#endif
					    u_xlat6.xyz = u_xlat10_4.xyz * u_xlat6.xxx;
					    SV_Target0.xyz = u_xlat6.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "POINT" "FOG_EXP2" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp float vs_TEXCOORD5;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD5 = exp2(u_xlat0.x);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2D _LightTexture0;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp float vs_TEXCOORD5;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec3 u_xlat6;
					lowp float u_xlat10_6;
					mediump float u_xlat16_9;
					float u_xlat21;
					lowp float u_xlat10_25;
					float u_xlat27;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_5.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat6.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, u_xlat6.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(u_xlat10_25) + u_xlat10_5.xyz;
					    u_xlat6.xyz = vs_TEXCOORD3.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD3.xxx + u_xlat6.xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD3.zzz + u_xlat6.xyz;
					    u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
					    u_xlat6.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat10_6 = texture(_LightTexture0, u_xlat6.xx).w;
					    u_xlat10_25 = u_xlat10_6 * 2.0;
					    u_xlat10_4.xyz = vec3(u_xlat10_25) * u_xlat10_4.xyz;
					    u_xlat6.x = vs_TEXCOORD5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
					#else
					    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					#endif
					    u_xlat6.xyz = u_xlat10_4.xyz * u_xlat6.xxx;
					    SV_Target0.xyz = u_xlat6.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = _glesVertex.xyz;
					  tmpvar_5 = (glstate_matrix_mvp * tmpvar_6);
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_7;
					  tmpvar_7[0] = unity_WorldToObject[0].xyz;
					  tmpvar_7[1] = unity_WorldToObject[1].xyz;
					  tmpvar_7[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_8;
					  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
					  worldNormal_1 = tmpvar_8;
					  tmpvar_4 = worldNormal_1;
					  highp float tmpvar_9;
					  tmpvar_9 = (unity_FogParams.x * tmpvar_5.z);
					  gl_Position = tmpvar_5;
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  xlv_TEXCOORD5 = exp2((-(tmpvar_9) * tmpvar_9));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = _WorldSpaceLightPos0.xyz;
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  mediump float tmpvar_7;
					  lowp float tmpvar_8;
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_8 = (((tmpvar_10.w * tmpvar_9.x) + (tmpvar_11.w * tmpvar_9.y)) + (tmpvar_12.w * tmpvar_9.z));
					  tmpvar_7 = (((_ShininessL0 * tmpvar_9.x) + (_ShininessL1 * tmpvar_9.y)) + (_ShininessL2 * tmpvar_9.z));
					  lowp vec4 c_13;
					  lowp float spec_14;
					  lowp float tmpvar_15;
					  tmpvar_15 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_16;
					  tmpvar_16 = (pow (tmpvar_15, (tmpvar_7 * 128.0)) * tmpvar_8);
					  spec_14 = tmpvar_16;
					  c_13.xyz = (((
					    ((((tmpvar_10 * tmpvar_9.x) + (tmpvar_11 * tmpvar_9.y)) + (tmpvar_12 * tmpvar_9.z)).xyz * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_14)) * 2.0);
					  c_13.w = 0.0;
					  highp float tmpvar_17;
					  tmpvar_17 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
					  c_1.xyz = (c_13.xyz * vec3(tmpvar_17));
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = _glesVertex.xyz;
					  tmpvar_5 = (glstate_matrix_mvp * tmpvar_6);
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_7;
					  tmpvar_7[0] = unity_WorldToObject[0].xyz;
					  tmpvar_7[1] = unity_WorldToObject[1].xyz;
					  tmpvar_7[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_8;
					  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
					  worldNormal_1 = tmpvar_8;
					  tmpvar_4 = worldNormal_1;
					  highp float tmpvar_9;
					  tmpvar_9 = (unity_FogParams.x * tmpvar_5.z);
					  gl_Position = tmpvar_5;
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  xlv_TEXCOORD5 = exp2((-(tmpvar_9) * tmpvar_9));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = _WorldSpaceLightPos0.xyz;
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  mediump float tmpvar_7;
					  lowp float tmpvar_8;
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_8 = (((tmpvar_10.w * tmpvar_9.x) + (tmpvar_11.w * tmpvar_9.y)) + (tmpvar_12.w * tmpvar_9.z));
					  tmpvar_7 = (((_ShininessL0 * tmpvar_9.x) + (_ShininessL1 * tmpvar_9.y)) + (_ShininessL2 * tmpvar_9.z));
					  lowp vec4 c_13;
					  lowp float spec_14;
					  lowp float tmpvar_15;
					  tmpvar_15 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_16;
					  tmpvar_16 = (pow (tmpvar_15, (tmpvar_7 * 128.0)) * tmpvar_8);
					  spec_14 = tmpvar_16;
					  c_13.xyz = (((
					    ((((tmpvar_10 * tmpvar_9.x) + (tmpvar_11 * tmpvar_9.y)) + (tmpvar_12 * tmpvar_9.z)).xyz * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_14)) * 2.0);
					  c_13.w = 0.0;
					  highp float tmpvar_17;
					  tmpvar_17 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
					  c_1.xyz = (c_13.xyz * vec3(tmpvar_17));
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = _glesVertex.xyz;
					  tmpvar_5 = (glstate_matrix_mvp * tmpvar_6);
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_7;
					  tmpvar_7[0] = unity_WorldToObject[0].xyz;
					  tmpvar_7[1] = unity_WorldToObject[1].xyz;
					  tmpvar_7[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_8;
					  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
					  worldNormal_1 = tmpvar_8;
					  tmpvar_4 = worldNormal_1;
					  highp float tmpvar_9;
					  tmpvar_9 = (unity_FogParams.x * tmpvar_5.z);
					  gl_Position = tmpvar_5;
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  xlv_TEXCOORD5 = exp2((-(tmpvar_9) * tmpvar_9));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = _WorldSpaceLightPos0.xyz;
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  mediump float tmpvar_7;
					  lowp float tmpvar_8;
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_8 = (((tmpvar_10.w * tmpvar_9.x) + (tmpvar_11.w * tmpvar_9.y)) + (tmpvar_12.w * tmpvar_9.z));
					  tmpvar_7 = (((_ShininessL0 * tmpvar_9.x) + (_ShininessL1 * tmpvar_9.y)) + (_ShininessL2 * tmpvar_9.z));
					  lowp vec4 c_13;
					  lowp float spec_14;
					  lowp float tmpvar_15;
					  tmpvar_15 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_16;
					  tmpvar_16 = (pow (tmpvar_15, (tmpvar_7 * 128.0)) * tmpvar_8);
					  spec_14 = tmpvar_16;
					  c_13.xyz = (((
					    ((((tmpvar_10 * tmpvar_9.x) + (tmpvar_11 * tmpvar_9.y)) + (tmpvar_12 * tmpvar_9.z)).xyz * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_14)) * 2.0);
					  c_13.w = 0.0;
					  highp float tmpvar_17;
					  tmpvar_17 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
					  c_1.xyz = (c_13.xyz * vec3(tmpvar_17));
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp float vs_TEXCOORD5;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD5 = exp2(u_xlat0.x);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp float vs_TEXCOORD5;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec3 u_xlat6;
					mediump float u_xlat16_9;
					float u_xlat21;
					lowp float u_xlat10_25;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_5.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(u_xlat10_25) + u_xlat10_5.xyz;
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0);
					    u_xlat6.x = vs_TEXCOORD5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
					#else
					    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					#endif
					    u_xlat6.xyz = u_xlat10_4.xyz * u_xlat6.xxx;
					    SV_Target0.xyz = u_xlat6.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp float vs_TEXCOORD5;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD5 = exp2(u_xlat0.x);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp float vs_TEXCOORD5;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec3 u_xlat6;
					mediump float u_xlat16_9;
					float u_xlat21;
					lowp float u_xlat10_25;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_5.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(u_xlat10_25) + u_xlat10_5.xyz;
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0);
					    u_xlat6.x = vs_TEXCOORD5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
					#else
					    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					#endif
					    u_xlat6.xyz = u_xlat10_4.xyz * u_xlat6.xxx;
					    SV_Target0.xyz = u_xlat6.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp float vs_TEXCOORD5;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD5 = exp2(u_xlat0.x);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp float vs_TEXCOORD5;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec3 u_xlat6;
					mediump float u_xlat16_9;
					float u_xlat21;
					lowp float u_xlat10_25;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_5.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(u_xlat10_25) + u_xlat10_5.xyz;
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0);
					    u_xlat6.x = vs_TEXCOORD5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
					#else
					    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					#endif
					    u_xlat6.xyz = u_xlat10_4.xyz * u_xlat6.xxx;
					    SV_Target0.xyz = u_xlat6.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "SPOT" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = _glesVertex.xyz;
					  tmpvar_5 = (glstate_matrix_mvp * tmpvar_6);
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_7;
					  tmpvar_7[0] = unity_WorldToObject[0].xyz;
					  tmpvar_7[1] = unity_WorldToObject[1].xyz;
					  tmpvar_7[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_8;
					  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
					  worldNormal_1 = tmpvar_8;
					  tmpvar_4 = worldNormal_1;
					  highp float tmpvar_9;
					  tmpvar_9 = (unity_FogParams.x * tmpvar_5.z);
					  gl_Position = tmpvar_5;
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  xlv_TEXCOORD5 = exp2((-(tmpvar_9) * tmpvar_9));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform sampler2D _LightTexture0;
					uniform highp mat4 unity_WorldToLight;
					uniform sampler2D _LightTextureB0;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp float atten_2;
					  lowp vec3 tmpvar_3;
					  lowp vec3 worldViewDir_4;
					  lowp vec3 lightDir_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD3));
					  lightDir_5 = tmpvar_6;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_4 = tmpvar_7;
					  tmpvar_3 = xlv_TEXCOORD2;
					  mediump float tmpvar_8;
					  lowp float tmpvar_9;
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_9 = (((tmpvar_11.w * tmpvar_10.x) + (tmpvar_12.w * tmpvar_10.y)) + (tmpvar_13.w * tmpvar_10.z));
					  tmpvar_8 = (((_ShininessL0 * tmpvar_10.x) + (_ShininessL1 * tmpvar_10.y)) + (_ShininessL2 * tmpvar_10.z));
					  highp vec4 tmpvar_14;
					  tmpvar_14.w = 1.0;
					  tmpvar_14.xyz = xlv_TEXCOORD3;
					  highp vec4 tmpvar_15;
					  tmpvar_15 = (unity_WorldToLight * tmpvar_14);
					  lowp vec4 tmpvar_16;
					  highp vec2 P_17;
					  P_17 = ((tmpvar_15.xy / tmpvar_15.w) + 0.5);
					  tmpvar_16 = texture2D (_LightTexture0, P_17);
					  highp float tmpvar_18;
					  tmpvar_18 = dot (tmpvar_15.xyz, tmpvar_15.xyz);
					  lowp vec4 tmpvar_19;
					  tmpvar_19 = texture2D (_LightTextureB0, vec2(tmpvar_18));
					  highp float tmpvar_20;
					  tmpvar_20 = ((float(
					    (tmpvar_15.z > 0.0)
					  ) * tmpvar_16.w) * tmpvar_19.w);
					  atten_2 = tmpvar_20;
					  lowp vec4 c_21;
					  lowp float spec_22;
					  lowp float tmpvar_23;
					  tmpvar_23 = max (0.0, dot (tmpvar_3, worldViewDir_4));
					  mediump float tmpvar_24;
					  tmpvar_24 = (pow (tmpvar_23, (tmpvar_8 * 128.0)) * tmpvar_9);
					  spec_22 = tmpvar_24;
					  c_21.xyz = (((
					    ((((tmpvar_11 * tmpvar_10.x) + (tmpvar_12 * tmpvar_10.y)) + (tmpvar_13 * tmpvar_10.z)).xyz * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_3, lightDir_5))
					  ) + (_SpecColor.xyz * spec_22)) * (atten_2 * 2.0));
					  c_21.w = 0.0;
					  highp float tmpvar_25;
					  tmpvar_25 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
					  c_1.xyz = (c_21.xyz * vec3(tmpvar_25));
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "SPOT" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = _glesVertex.xyz;
					  tmpvar_5 = (glstate_matrix_mvp * tmpvar_6);
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_7;
					  tmpvar_7[0] = unity_WorldToObject[0].xyz;
					  tmpvar_7[1] = unity_WorldToObject[1].xyz;
					  tmpvar_7[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_8;
					  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
					  worldNormal_1 = tmpvar_8;
					  tmpvar_4 = worldNormal_1;
					  highp float tmpvar_9;
					  tmpvar_9 = (unity_FogParams.x * tmpvar_5.z);
					  gl_Position = tmpvar_5;
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  xlv_TEXCOORD5 = exp2((-(tmpvar_9) * tmpvar_9));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform sampler2D _LightTexture0;
					uniform highp mat4 unity_WorldToLight;
					uniform sampler2D _LightTextureB0;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp float atten_2;
					  lowp vec3 tmpvar_3;
					  lowp vec3 worldViewDir_4;
					  lowp vec3 lightDir_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD3));
					  lightDir_5 = tmpvar_6;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_4 = tmpvar_7;
					  tmpvar_3 = xlv_TEXCOORD2;
					  mediump float tmpvar_8;
					  lowp float tmpvar_9;
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_9 = (((tmpvar_11.w * tmpvar_10.x) + (tmpvar_12.w * tmpvar_10.y)) + (tmpvar_13.w * tmpvar_10.z));
					  tmpvar_8 = (((_ShininessL0 * tmpvar_10.x) + (_ShininessL1 * tmpvar_10.y)) + (_ShininessL2 * tmpvar_10.z));
					  highp vec4 tmpvar_14;
					  tmpvar_14.w = 1.0;
					  tmpvar_14.xyz = xlv_TEXCOORD3;
					  highp vec4 tmpvar_15;
					  tmpvar_15 = (unity_WorldToLight * tmpvar_14);
					  lowp vec4 tmpvar_16;
					  highp vec2 P_17;
					  P_17 = ((tmpvar_15.xy / tmpvar_15.w) + 0.5);
					  tmpvar_16 = texture2D (_LightTexture0, P_17);
					  highp float tmpvar_18;
					  tmpvar_18 = dot (tmpvar_15.xyz, tmpvar_15.xyz);
					  lowp vec4 tmpvar_19;
					  tmpvar_19 = texture2D (_LightTextureB0, vec2(tmpvar_18));
					  highp float tmpvar_20;
					  tmpvar_20 = ((float(
					    (tmpvar_15.z > 0.0)
					  ) * tmpvar_16.w) * tmpvar_19.w);
					  atten_2 = tmpvar_20;
					  lowp vec4 c_21;
					  lowp float spec_22;
					  lowp float tmpvar_23;
					  tmpvar_23 = max (0.0, dot (tmpvar_3, worldViewDir_4));
					  mediump float tmpvar_24;
					  tmpvar_24 = (pow (tmpvar_23, (tmpvar_8 * 128.0)) * tmpvar_9);
					  spec_22 = tmpvar_24;
					  c_21.xyz = (((
					    ((((tmpvar_11 * tmpvar_10.x) + (tmpvar_12 * tmpvar_10.y)) + (tmpvar_13 * tmpvar_10.z)).xyz * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_3, lightDir_5))
					  ) + (_SpecColor.xyz * spec_22)) * (atten_2 * 2.0));
					  c_21.w = 0.0;
					  highp float tmpvar_25;
					  tmpvar_25 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
					  c_1.xyz = (c_21.xyz * vec3(tmpvar_25));
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "SPOT" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = _glesVertex.xyz;
					  tmpvar_5 = (glstate_matrix_mvp * tmpvar_6);
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_7;
					  tmpvar_7[0] = unity_WorldToObject[0].xyz;
					  tmpvar_7[1] = unity_WorldToObject[1].xyz;
					  tmpvar_7[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_8;
					  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
					  worldNormal_1 = tmpvar_8;
					  tmpvar_4 = worldNormal_1;
					  highp float tmpvar_9;
					  tmpvar_9 = (unity_FogParams.x * tmpvar_5.z);
					  gl_Position = tmpvar_5;
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  xlv_TEXCOORD5 = exp2((-(tmpvar_9) * tmpvar_9));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform sampler2D _LightTexture0;
					uniform highp mat4 unity_WorldToLight;
					uniform sampler2D _LightTextureB0;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp float atten_2;
					  lowp vec3 tmpvar_3;
					  lowp vec3 worldViewDir_4;
					  lowp vec3 lightDir_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD3));
					  lightDir_5 = tmpvar_6;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_4 = tmpvar_7;
					  tmpvar_3 = xlv_TEXCOORD2;
					  mediump float tmpvar_8;
					  lowp float tmpvar_9;
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_9 = (((tmpvar_11.w * tmpvar_10.x) + (tmpvar_12.w * tmpvar_10.y)) + (tmpvar_13.w * tmpvar_10.z));
					  tmpvar_8 = (((_ShininessL0 * tmpvar_10.x) + (_ShininessL1 * tmpvar_10.y)) + (_ShininessL2 * tmpvar_10.z));
					  highp vec4 tmpvar_14;
					  tmpvar_14.w = 1.0;
					  tmpvar_14.xyz = xlv_TEXCOORD3;
					  highp vec4 tmpvar_15;
					  tmpvar_15 = (unity_WorldToLight * tmpvar_14);
					  lowp vec4 tmpvar_16;
					  highp vec2 P_17;
					  P_17 = ((tmpvar_15.xy / tmpvar_15.w) + 0.5);
					  tmpvar_16 = texture2D (_LightTexture0, P_17);
					  highp float tmpvar_18;
					  tmpvar_18 = dot (tmpvar_15.xyz, tmpvar_15.xyz);
					  lowp vec4 tmpvar_19;
					  tmpvar_19 = texture2D (_LightTextureB0, vec2(tmpvar_18));
					  highp float tmpvar_20;
					  tmpvar_20 = ((float(
					    (tmpvar_15.z > 0.0)
					  ) * tmpvar_16.w) * tmpvar_19.w);
					  atten_2 = tmpvar_20;
					  lowp vec4 c_21;
					  lowp float spec_22;
					  lowp float tmpvar_23;
					  tmpvar_23 = max (0.0, dot (tmpvar_3, worldViewDir_4));
					  mediump float tmpvar_24;
					  tmpvar_24 = (pow (tmpvar_23, (tmpvar_8 * 128.0)) * tmpvar_9);
					  spec_22 = tmpvar_24;
					  c_21.xyz = (((
					    ((((tmpvar_11 * tmpvar_10.x) + (tmpvar_12 * tmpvar_10.y)) + (tmpvar_13 * tmpvar_10.z)).xyz * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_3, lightDir_5))
					  ) + (_SpecColor.xyz * spec_22)) * (atten_2 * 2.0));
					  c_21.w = 0.0;
					  highp float tmpvar_25;
					  tmpvar_25 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
					  c_1.xyz = (c_21.xyz * vec3(tmpvar_25));
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "SPOT" "FOG_EXP2" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp float vs_TEXCOORD5;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD5 = exp2(u_xlat0.x);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2D _LightTexture0;
					uniform lowp sampler2D _LightTextureB0;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp float vs_TEXCOORD5;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec3 u_xlat6;
					lowp float u_xlat10_6;
					mediump float u_xlat16_9;
					bool u_xlatb13;
					float u_xlat20;
					lowp float u_xlat10_20;
					float u_xlat21;
					lowp float u_xlat10_25;
					float u_xlat27;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_5.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat6.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, u_xlat6.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(u_xlat10_25) + u_xlat10_5.xyz;
					    u_xlat0 = vs_TEXCOORD3.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
					    u_xlat0 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD3.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD3.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_WorldToLight[3];
					    u_xlat6.xy = u_xlat0.xy / u_xlat0.ww;
					    u_xlat6.xy = u_xlat6.xy + vec2(0.5, 0.5);
					    u_xlat10_6 = texture(_LightTexture0, u_xlat6.xy).w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb13 = !!(0.0<u_xlat0.z);
					#else
					    u_xlatb13 = 0.0<u_xlat0.z;
					#endif
					    u_xlat20 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat10_20 = texture(_LightTextureB0, vec2(u_xlat20)).w;
					    u_xlat10_25 = (u_xlatb13) ? 1.0 : 0.0;
					    u_xlat10_25 = u_xlat10_6 * u_xlat10_25;
					    u_xlat10_25 = u_xlat10_20 * u_xlat10_25;
					    u_xlat10_25 = u_xlat10_25 * 2.0;
					    u_xlat10_4.xyz = vec3(u_xlat10_25) * u_xlat10_4.xyz;
					    u_xlat6.x = vs_TEXCOORD5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
					#else
					    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					#endif
					    u_xlat6.xyz = u_xlat10_4.xyz * u_xlat6.xxx;
					    SV_Target0.xyz = u_xlat6.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "SPOT" "FOG_EXP2" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp float vs_TEXCOORD5;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD5 = exp2(u_xlat0.x);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2D _LightTexture0;
					uniform lowp sampler2D _LightTextureB0;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp float vs_TEXCOORD5;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec3 u_xlat6;
					lowp float u_xlat10_6;
					mediump float u_xlat16_9;
					bool u_xlatb13;
					float u_xlat20;
					lowp float u_xlat10_20;
					float u_xlat21;
					lowp float u_xlat10_25;
					float u_xlat27;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_5.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat6.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, u_xlat6.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(u_xlat10_25) + u_xlat10_5.xyz;
					    u_xlat0 = vs_TEXCOORD3.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
					    u_xlat0 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD3.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD3.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_WorldToLight[3];
					    u_xlat6.xy = u_xlat0.xy / u_xlat0.ww;
					    u_xlat6.xy = u_xlat6.xy + vec2(0.5, 0.5);
					    u_xlat10_6 = texture(_LightTexture0, u_xlat6.xy).w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb13 = !!(0.0<u_xlat0.z);
					#else
					    u_xlatb13 = 0.0<u_xlat0.z;
					#endif
					    u_xlat20 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat10_20 = texture(_LightTextureB0, vec2(u_xlat20)).w;
					    u_xlat10_25 = (u_xlatb13) ? 1.0 : 0.0;
					    u_xlat10_25 = u_xlat10_6 * u_xlat10_25;
					    u_xlat10_25 = u_xlat10_20 * u_xlat10_25;
					    u_xlat10_25 = u_xlat10_25 * 2.0;
					    u_xlat10_4.xyz = vec3(u_xlat10_25) * u_xlat10_4.xyz;
					    u_xlat6.x = vs_TEXCOORD5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
					#else
					    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					#endif
					    u_xlat6.xyz = u_xlat10_4.xyz * u_xlat6.xxx;
					    SV_Target0.xyz = u_xlat6.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "SPOT" "FOG_EXP2" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp float vs_TEXCOORD5;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD5 = exp2(u_xlat0.x);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2D _LightTexture0;
					uniform lowp sampler2D _LightTextureB0;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp float vs_TEXCOORD5;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec3 u_xlat6;
					lowp float u_xlat10_6;
					mediump float u_xlat16_9;
					bool u_xlatb13;
					float u_xlat20;
					lowp float u_xlat10_20;
					float u_xlat21;
					lowp float u_xlat10_25;
					float u_xlat27;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_5.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat6.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, u_xlat6.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(u_xlat10_25) + u_xlat10_5.xyz;
					    u_xlat0 = vs_TEXCOORD3.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
					    u_xlat0 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD3.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD3.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_WorldToLight[3];
					    u_xlat6.xy = u_xlat0.xy / u_xlat0.ww;
					    u_xlat6.xy = u_xlat6.xy + vec2(0.5, 0.5);
					    u_xlat10_6 = texture(_LightTexture0, u_xlat6.xy).w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb13 = !!(0.0<u_xlat0.z);
					#else
					    u_xlatb13 = 0.0<u_xlat0.z;
					#endif
					    u_xlat20 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat10_20 = texture(_LightTextureB0, vec2(u_xlat20)).w;
					    u_xlat10_25 = (u_xlatb13) ? 1.0 : 0.0;
					    u_xlat10_25 = u_xlat10_6 * u_xlat10_25;
					    u_xlat10_25 = u_xlat10_20 * u_xlat10_25;
					    u_xlat10_25 = u_xlat10_25 * 2.0;
					    u_xlat10_4.xyz = vec3(u_xlat10_25) * u_xlat10_4.xyz;
					    u_xlat6.x = vs_TEXCOORD5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
					#else
					    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					#endif
					    u_xlat6.xyz = u_xlat10_4.xyz * u_xlat6.xxx;
					    SV_Target0.xyz = u_xlat6.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "POINT_COOKIE" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = _glesVertex.xyz;
					  tmpvar_5 = (glstate_matrix_mvp * tmpvar_6);
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_7;
					  tmpvar_7[0] = unity_WorldToObject[0].xyz;
					  tmpvar_7[1] = unity_WorldToObject[1].xyz;
					  tmpvar_7[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_8;
					  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
					  worldNormal_1 = tmpvar_8;
					  tmpvar_4 = worldNormal_1;
					  highp float tmpvar_9;
					  tmpvar_9 = (unity_FogParams.x * tmpvar_5.z);
					  gl_Position = tmpvar_5;
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  xlv_TEXCOORD5 = exp2((-(tmpvar_9) * tmpvar_9));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform lowp samplerCube _LightTexture0;
					uniform highp mat4 unity_WorldToLight;
					uniform sampler2D _LightTextureB0;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD3));
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  mediump float tmpvar_7;
					  lowp float tmpvar_8;
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_8 = (((tmpvar_10.w * tmpvar_9.x) + (tmpvar_11.w * tmpvar_9.y)) + (tmpvar_12.w * tmpvar_9.z));
					  tmpvar_7 = (((_ShininessL0 * tmpvar_9.x) + (_ShininessL1 * tmpvar_9.y)) + (_ShininessL2 * tmpvar_9.z));
					  highp vec4 tmpvar_13;
					  tmpvar_13.w = 1.0;
					  tmpvar_13.xyz = xlv_TEXCOORD3;
					  highp vec3 tmpvar_14;
					  tmpvar_14 = (unity_WorldToLight * tmpvar_13).xyz;
					  highp float tmpvar_15;
					  tmpvar_15 = dot (tmpvar_14, tmpvar_14);
					  lowp vec4 c_16;
					  lowp float spec_17;
					  lowp float tmpvar_18;
					  tmpvar_18 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_19;
					  tmpvar_19 = (pow (tmpvar_18, (tmpvar_7 * 128.0)) * tmpvar_8);
					  spec_17 = tmpvar_19;
					  c_16.xyz = (((
					    ((((tmpvar_10 * tmpvar_9.x) + (tmpvar_11 * tmpvar_9.y)) + (tmpvar_12 * tmpvar_9.z)).xyz * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_17)) * ((texture2D (_LightTextureB0, vec2(tmpvar_15)).w * textureCube (_LightTexture0, tmpvar_14).w) * 2.0));
					  c_16.w = 0.0;
					  highp float tmpvar_20;
					  tmpvar_20 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
					  c_1.xyz = (c_16.xyz * vec3(tmpvar_20));
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "POINT_COOKIE" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = _glesVertex.xyz;
					  tmpvar_5 = (glstate_matrix_mvp * tmpvar_6);
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_7;
					  tmpvar_7[0] = unity_WorldToObject[0].xyz;
					  tmpvar_7[1] = unity_WorldToObject[1].xyz;
					  tmpvar_7[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_8;
					  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
					  worldNormal_1 = tmpvar_8;
					  tmpvar_4 = worldNormal_1;
					  highp float tmpvar_9;
					  tmpvar_9 = (unity_FogParams.x * tmpvar_5.z);
					  gl_Position = tmpvar_5;
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  xlv_TEXCOORD5 = exp2((-(tmpvar_9) * tmpvar_9));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform lowp samplerCube _LightTexture0;
					uniform highp mat4 unity_WorldToLight;
					uniform sampler2D _LightTextureB0;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD3));
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  mediump float tmpvar_7;
					  lowp float tmpvar_8;
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_8 = (((tmpvar_10.w * tmpvar_9.x) + (tmpvar_11.w * tmpvar_9.y)) + (tmpvar_12.w * tmpvar_9.z));
					  tmpvar_7 = (((_ShininessL0 * tmpvar_9.x) + (_ShininessL1 * tmpvar_9.y)) + (_ShininessL2 * tmpvar_9.z));
					  highp vec4 tmpvar_13;
					  tmpvar_13.w = 1.0;
					  tmpvar_13.xyz = xlv_TEXCOORD3;
					  highp vec3 tmpvar_14;
					  tmpvar_14 = (unity_WorldToLight * tmpvar_13).xyz;
					  highp float tmpvar_15;
					  tmpvar_15 = dot (tmpvar_14, tmpvar_14);
					  lowp vec4 c_16;
					  lowp float spec_17;
					  lowp float tmpvar_18;
					  tmpvar_18 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_19;
					  tmpvar_19 = (pow (tmpvar_18, (tmpvar_7 * 128.0)) * tmpvar_8);
					  spec_17 = tmpvar_19;
					  c_16.xyz = (((
					    ((((tmpvar_10 * tmpvar_9.x) + (tmpvar_11 * tmpvar_9.y)) + (tmpvar_12 * tmpvar_9.z)).xyz * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_17)) * ((texture2D (_LightTextureB0, vec2(tmpvar_15)).w * textureCube (_LightTexture0, tmpvar_14).w) * 2.0));
					  c_16.w = 0.0;
					  highp float tmpvar_20;
					  tmpvar_20 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
					  c_1.xyz = (c_16.xyz * vec3(tmpvar_20));
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "POINT_COOKIE" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = _glesVertex.xyz;
					  tmpvar_5 = (glstate_matrix_mvp * tmpvar_6);
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_7;
					  tmpvar_7[0] = unity_WorldToObject[0].xyz;
					  tmpvar_7[1] = unity_WorldToObject[1].xyz;
					  tmpvar_7[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_8;
					  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
					  worldNormal_1 = tmpvar_8;
					  tmpvar_4 = worldNormal_1;
					  highp float tmpvar_9;
					  tmpvar_9 = (unity_FogParams.x * tmpvar_5.z);
					  gl_Position = tmpvar_5;
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  xlv_TEXCOORD5 = exp2((-(tmpvar_9) * tmpvar_9));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform lowp samplerCube _LightTexture0;
					uniform highp mat4 unity_WorldToLight;
					uniform sampler2D _LightTextureB0;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  highp vec3 tmpvar_5;
					  tmpvar_5 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD3));
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  mediump float tmpvar_7;
					  lowp float tmpvar_8;
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_8 = (((tmpvar_10.w * tmpvar_9.x) + (tmpvar_11.w * tmpvar_9.y)) + (tmpvar_12.w * tmpvar_9.z));
					  tmpvar_7 = (((_ShininessL0 * tmpvar_9.x) + (_ShininessL1 * tmpvar_9.y)) + (_ShininessL2 * tmpvar_9.z));
					  highp vec4 tmpvar_13;
					  tmpvar_13.w = 1.0;
					  tmpvar_13.xyz = xlv_TEXCOORD3;
					  highp vec3 tmpvar_14;
					  tmpvar_14 = (unity_WorldToLight * tmpvar_13).xyz;
					  highp float tmpvar_15;
					  tmpvar_15 = dot (tmpvar_14, tmpvar_14);
					  lowp vec4 c_16;
					  lowp float spec_17;
					  lowp float tmpvar_18;
					  tmpvar_18 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_19;
					  tmpvar_19 = (pow (tmpvar_18, (tmpvar_7 * 128.0)) * tmpvar_8);
					  spec_17 = tmpvar_19;
					  c_16.xyz = (((
					    ((((tmpvar_10 * tmpvar_9.x) + (tmpvar_11 * tmpvar_9.y)) + (tmpvar_12 * tmpvar_9.z)).xyz * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_17)) * ((texture2D (_LightTextureB0, vec2(tmpvar_15)).w * textureCube (_LightTexture0, tmpvar_14).w) * 2.0));
					  c_16.w = 0.0;
					  highp float tmpvar_20;
					  tmpvar_20 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
					  c_1.xyz = (c_16.xyz * vec3(tmpvar_20));
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "POINT_COOKIE" "FOG_EXP2" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp float vs_TEXCOORD5;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD5 = exp2(u_xlat0.x);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2D _LightTextureB0;
					uniform lowp samplerCube _LightTexture0;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp float vs_TEXCOORD5;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec3 u_xlat6;
					mediump float u_xlat16_6;
					lowp float u_xlat10_6;
					mediump float u_xlat16_9;
					lowp float u_xlat10_13;
					float u_xlat21;
					lowp float u_xlat10_25;
					float u_xlat27;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_5.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat6.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, u_xlat6.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(u_xlat10_25) + u_xlat10_5.xyz;
					    u_xlat6.xyz = vs_TEXCOORD3.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD3.xxx + u_xlat6.xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD3.zzz + u_xlat6.xyz;
					    u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
					    u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat10_6 = texture(_LightTexture0, u_xlat6.xyz).w;
					    u_xlat10_13 = texture(_LightTextureB0, vec2(u_xlat27)).w;
					    u_xlat16_6 = u_xlat10_6 * u_xlat10_13;
					    u_xlat10_25 = u_xlat16_6 * 2.0;
					    u_xlat10_4.xyz = vec3(u_xlat10_25) * u_xlat10_4.xyz;
					    u_xlat6.x = vs_TEXCOORD5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
					#else
					    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					#endif
					    u_xlat6.xyz = u_xlat10_4.xyz * u_xlat6.xxx;
					    SV_Target0.xyz = u_xlat6.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "POINT_COOKIE" "FOG_EXP2" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp float vs_TEXCOORD5;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD5 = exp2(u_xlat0.x);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2D _LightTextureB0;
					uniform lowp samplerCube _LightTexture0;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp float vs_TEXCOORD5;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec3 u_xlat6;
					mediump float u_xlat16_6;
					lowp float u_xlat10_6;
					mediump float u_xlat16_9;
					lowp float u_xlat10_13;
					float u_xlat21;
					lowp float u_xlat10_25;
					float u_xlat27;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_5.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat6.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, u_xlat6.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(u_xlat10_25) + u_xlat10_5.xyz;
					    u_xlat6.xyz = vs_TEXCOORD3.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD3.xxx + u_xlat6.xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD3.zzz + u_xlat6.xyz;
					    u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
					    u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat10_6 = texture(_LightTexture0, u_xlat6.xyz).w;
					    u_xlat10_13 = texture(_LightTextureB0, vec2(u_xlat27)).w;
					    u_xlat16_6 = u_xlat10_6 * u_xlat10_13;
					    u_xlat10_25 = u_xlat16_6 * 2.0;
					    u_xlat10_4.xyz = vec3(u_xlat10_25) * u_xlat10_4.xyz;
					    u_xlat6.x = vs_TEXCOORD5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
					#else
					    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					#endif
					    u_xlat6.xyz = u_xlat10_4.xyz * u_xlat6.xxx;
					    SV_Target0.xyz = u_xlat6.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "POINT_COOKIE" "FOG_EXP2" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp float vs_TEXCOORD5;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD5 = exp2(u_xlat0.x);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2D _LightTextureB0;
					uniform lowp samplerCube _LightTexture0;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp float vs_TEXCOORD5;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec3 u_xlat6;
					mediump float u_xlat16_6;
					lowp float u_xlat10_6;
					mediump float u_xlat16_9;
					lowp float u_xlat10_13;
					float u_xlat21;
					lowp float u_xlat10_25;
					float u_xlat27;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_5.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat27 = inversesqrt(u_xlat27);
					    u_xlat6.xyz = vec3(u_xlat27) * u_xlat6.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, u_xlat6.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(u_xlat10_25) + u_xlat10_5.xyz;
					    u_xlat6.xyz = vs_TEXCOORD3.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD3.xxx + u_xlat6.xyz;
					    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD3.zzz + u_xlat6.xyz;
					    u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
					    u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat10_6 = texture(_LightTexture0, u_xlat6.xyz).w;
					    u_xlat10_13 = texture(_LightTextureB0, vec2(u_xlat27)).w;
					    u_xlat16_6 = u_xlat10_6 * u_xlat10_13;
					    u_xlat10_25 = u_xlat16_6 * 2.0;
					    u_xlat10_4.xyz = vec3(u_xlat10_25) * u_xlat10_4.xyz;
					    u_xlat6.x = vs_TEXCOORD5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
					#else
					    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					#endif
					    u_xlat6.xyz = u_xlat10_4.xyz * u_xlat6.xxx;
					    SV_Target0.xyz = u_xlat6.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL_COOKIE" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = _glesVertex.xyz;
					  tmpvar_5 = (glstate_matrix_mvp * tmpvar_6);
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_7;
					  tmpvar_7[0] = unity_WorldToObject[0].xyz;
					  tmpvar_7[1] = unity_WorldToObject[1].xyz;
					  tmpvar_7[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_8;
					  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
					  worldNormal_1 = tmpvar_8;
					  tmpvar_4 = worldNormal_1;
					  highp float tmpvar_9;
					  tmpvar_9 = (unity_FogParams.x * tmpvar_5.z);
					  gl_Position = tmpvar_5;
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  xlv_TEXCOORD5 = exp2((-(tmpvar_9) * tmpvar_9));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform sampler2D _LightTexture0;
					uniform highp mat4 unity_WorldToLight;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = _WorldSpaceLightPos0.xyz;
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  mediump float tmpvar_7;
					  lowp float tmpvar_8;
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_8 = (((tmpvar_10.w * tmpvar_9.x) + (tmpvar_11.w * tmpvar_9.y)) + (tmpvar_12.w * tmpvar_9.z));
					  tmpvar_7 = (((_ShininessL0 * tmpvar_9.x) + (_ShininessL1 * tmpvar_9.y)) + (_ShininessL2 * tmpvar_9.z));
					  highp vec4 tmpvar_13;
					  tmpvar_13.w = 1.0;
					  tmpvar_13.xyz = xlv_TEXCOORD3;
					  highp vec2 tmpvar_14;
					  tmpvar_14 = (unity_WorldToLight * tmpvar_13).xy;
					  lowp vec4 c_15;
					  lowp float spec_16;
					  lowp float tmpvar_17;
					  tmpvar_17 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_18;
					  tmpvar_18 = (pow (tmpvar_17, (tmpvar_7 * 128.0)) * tmpvar_8);
					  spec_16 = tmpvar_18;
					  c_15.xyz = (((
					    ((((tmpvar_10 * tmpvar_9.x) + (tmpvar_11 * tmpvar_9.y)) + (tmpvar_12 * tmpvar_9.z)).xyz * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_16)) * (texture2D (_LightTexture0, tmpvar_14).w * 2.0));
					  c_15.w = 0.0;
					  highp float tmpvar_19;
					  tmpvar_19 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
					  c_1.xyz = (c_15.xyz * vec3(tmpvar_19));
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL_COOKIE" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = _glesVertex.xyz;
					  tmpvar_5 = (glstate_matrix_mvp * tmpvar_6);
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_7;
					  tmpvar_7[0] = unity_WorldToObject[0].xyz;
					  tmpvar_7[1] = unity_WorldToObject[1].xyz;
					  tmpvar_7[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_8;
					  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
					  worldNormal_1 = tmpvar_8;
					  tmpvar_4 = worldNormal_1;
					  highp float tmpvar_9;
					  tmpvar_9 = (unity_FogParams.x * tmpvar_5.z);
					  gl_Position = tmpvar_5;
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  xlv_TEXCOORD5 = exp2((-(tmpvar_9) * tmpvar_9));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform sampler2D _LightTexture0;
					uniform highp mat4 unity_WorldToLight;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = _WorldSpaceLightPos0.xyz;
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  mediump float tmpvar_7;
					  lowp float tmpvar_8;
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_8 = (((tmpvar_10.w * tmpvar_9.x) + (tmpvar_11.w * tmpvar_9.y)) + (tmpvar_12.w * tmpvar_9.z));
					  tmpvar_7 = (((_ShininessL0 * tmpvar_9.x) + (_ShininessL1 * tmpvar_9.y)) + (_ShininessL2 * tmpvar_9.z));
					  highp vec4 tmpvar_13;
					  tmpvar_13.w = 1.0;
					  tmpvar_13.xyz = xlv_TEXCOORD3;
					  highp vec2 tmpvar_14;
					  tmpvar_14 = (unity_WorldToLight * tmpvar_13).xy;
					  lowp vec4 c_15;
					  lowp float spec_16;
					  lowp float tmpvar_17;
					  tmpvar_17 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_18;
					  tmpvar_18 = (pow (tmpvar_17, (tmpvar_7 * 128.0)) * tmpvar_8);
					  spec_16 = tmpvar_18;
					  c_15.xyz = (((
					    ((((tmpvar_10 * tmpvar_9.x) + (tmpvar_11 * tmpvar_9.y)) + (tmpvar_12 * tmpvar_9.z)).xyz * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_16)) * (texture2D (_LightTexture0, tmpvar_14).w * 2.0));
					  c_15.w = 0.0;
					  highp float tmpvar_19;
					  tmpvar_19 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
					  c_1.xyz = (c_15.xyz * vec3(tmpvar_19));
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL_COOKIE" "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec3 worldNormal_1;
					  highp vec4 tmpvar_2;
					  highp vec4 tmpvar_3;
					  mediump vec3 tmpvar_4;
					  highp vec4 tmpvar_5;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = _glesVertex.xyz;
					  tmpvar_5 = (glstate_matrix_mvp * tmpvar_6);
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  highp mat3 tmpvar_7;
					  tmpvar_7[0] = unity_WorldToObject[0].xyz;
					  tmpvar_7[1] = unity_WorldToObject[1].xyz;
					  tmpvar_7[2] = unity_WorldToObject[2].xyz;
					  highp vec3 tmpvar_8;
					  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
					  worldNormal_1 = tmpvar_8;
					  tmpvar_4 = worldNormal_1;
					  highp float tmpvar_9;
					  tmpvar_9 = (unity_FogParams.x * tmpvar_5.z);
					  gl_Position = tmpvar_5;
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = tmpvar_4;
					  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  xlv_TEXCOORD5 = exp2((-(tmpvar_9) * tmpvar_9));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 _LightColor0;
					uniform lowp vec4 _SpecColor;
					uniform sampler2D _LightTexture0;
					uniform highp mat4 unity_WorldToLight;
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform lowp float _ShininessL0;
					uniform lowp float _ShininessL1;
					uniform lowp float _ShininessL2;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying mediump vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					varying highp float xlv_TEXCOORD5;
					void main ()
					{
					  lowp vec4 c_1;
					  lowp vec3 tmpvar_2;
					  lowp vec3 worldViewDir_3;
					  lowp vec3 lightDir_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = _WorldSpaceLightPos0.xyz;
					  lightDir_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3));
					  worldViewDir_3 = tmpvar_6;
					  tmpvar_2 = xlv_TEXCOORD2;
					  mediump float tmpvar_7;
					  lowp float tmpvar_8;
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_Splat0, xlv_TEXCOORD0.zw);
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_Splat1, xlv_TEXCOORD1.xy);
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_Splat2, xlv_TEXCOORD1.zw);
					  tmpvar_8 = (((tmpvar_10.w * tmpvar_9.x) + (tmpvar_11.w * tmpvar_9.y)) + (tmpvar_12.w * tmpvar_9.z));
					  tmpvar_7 = (((_ShininessL0 * tmpvar_9.x) + (_ShininessL1 * tmpvar_9.y)) + (_ShininessL2 * tmpvar_9.z));
					  highp vec4 tmpvar_13;
					  tmpvar_13.w = 1.0;
					  tmpvar_13.xyz = xlv_TEXCOORD3;
					  highp vec2 tmpvar_14;
					  tmpvar_14 = (unity_WorldToLight * tmpvar_13).xy;
					  lowp vec4 c_15;
					  lowp float spec_16;
					  lowp float tmpvar_17;
					  tmpvar_17 = max (0.0, dot (tmpvar_2, worldViewDir_3));
					  mediump float tmpvar_18;
					  tmpvar_18 = (pow (tmpvar_17, (tmpvar_7 * 128.0)) * tmpvar_8);
					  spec_16 = tmpvar_18;
					  c_15.xyz = (((
					    ((((tmpvar_10 * tmpvar_9.x) + (tmpvar_11 * tmpvar_9.y)) + (tmpvar_12 * tmpvar_9.z)).xyz * _LightColor0.xyz)
					   * 
					    max (0.0, dot (tmpvar_2, lightDir_4))
					  ) + (_SpecColor.xyz * spec_16)) * (texture2D (_LightTexture0, tmpvar_14).w * 2.0));
					  c_15.w = 0.0;
					  highp float tmpvar_19;
					  tmpvar_19 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
					  c_1.xyz = (c_15.xyz * vec3(tmpvar_19));
					  c_1.w = 1.0;
					  gl_FragData[0] = c_1;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL_COOKIE" "FOG_EXP2" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp float vs_TEXCOORD5;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD5 = exp2(u_xlat0.x);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2D _LightTexture0;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp float vs_TEXCOORD5;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec3 u_xlat6;
					lowp float u_xlat10_6;
					mediump float u_xlat16_9;
					float u_xlat21;
					lowp float u_xlat10_25;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_5.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(u_xlat10_25) + u_xlat10_5.xyz;
					    u_xlat6.xy = vs_TEXCOORD3.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD3.xx + u_xlat6.xy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD3.zz + u_xlat6.xy;
					    u_xlat6.xy = u_xlat6.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
					    u_xlat10_6 = texture(_LightTexture0, u_xlat6.xy).w;
					    u_xlat10_25 = u_xlat10_6 * 2.0;
					    u_xlat10_4.xyz = vec3(u_xlat10_25) * u_xlat10_4.xyz;
					    u_xlat6.x = vs_TEXCOORD5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
					#else
					    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					#endif
					    u_xlat6.xyz = u_xlat10_4.xyz * u_xlat6.xxx;
					    SV_Target0.xyz = u_xlat6.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL_COOKIE" "FOG_EXP2" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp float vs_TEXCOORD5;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD5 = exp2(u_xlat0.x);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2D _LightTexture0;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp float vs_TEXCOORD5;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec3 u_xlat6;
					lowp float u_xlat10_6;
					mediump float u_xlat16_9;
					float u_xlat21;
					lowp float u_xlat10_25;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_5.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(u_xlat10_25) + u_xlat10_5.xyz;
					    u_xlat6.xy = vs_TEXCOORD3.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD3.xx + u_xlat6.xy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD3.zz + u_xlat6.xy;
					    u_xlat6.xy = u_xlat6.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
					    u_xlat10_6 = texture(_LightTexture0, u_xlat6.xy).w;
					    u_xlat10_25 = u_xlat10_6 * 2.0;
					    u_xlat10_4.xyz = vec3(u_xlat10_25) * u_xlat10_4.xyz;
					    u_xlat6.x = vs_TEXCOORD5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
					#else
					    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					#endif
					    u_xlat6.xyz = u_xlat10_4.xyz * u_xlat6.xxx;
					    SV_Target0.xyz = u_xlat6.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL_COOKIE" "FOG_EXP2" }
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 unity_FogParams;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out mediump vec3 vs_TEXCOORD2;
					out highp float vs_TEXCOORD5;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z * unity_FogParams.x;
					    u_xlat0.x = u_xlat0.x * (-u_xlat0.x);
					    vs_TEXCOORD5 = exp2(u_xlat0.x);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	lowp vec4 _LightColor0;
					uniform 	lowp vec4 _SpecColor;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
					uniform 	lowp float _ShininessL0;
					uniform 	lowp float _ShininessL1;
					uniform 	lowp float _ShininessL2;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					uniform lowp sampler2D _LightTexture0;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD2;
					in highp float vs_TEXCOORD5;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					lowp vec4 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					lowp vec3 u_xlat10_5;
					vec3 u_xlat6;
					lowp float u_xlat10_6;
					mediump float u_xlat16_9;
					float u_xlat21;
					lowp float u_xlat10_25;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat10_1.x = dot(vs_TEXCOORD2.xyz, u_xlat0.xyz);
					    u_xlat10_1.x = max(u_xlat10_1.x, 0.0);
					    u_xlat16_2 = log2(u_xlat10_1.x);
					    u_xlat10_0.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_1.x = dot(vec3(_ShininessL0, _ShininessL1, _ShininessL2), u_xlat10_0.xyz);
					    u_xlat16_9 = u_xlat10_1.x * 128.0;
					    u_xlat16_2 = u_xlat16_2 * u_xlat16_9;
					    u_xlat16_2 = exp2(u_xlat16_2);
					    u_xlat10_1 = texture(_Splat0, vs_TEXCOORD0.zw);
					    u_xlat10_3 = texture(_Splat1, vs_TEXCOORD1.xy);
					    u_xlat10_3 = u_xlat10_0.yyyy * u_xlat10_3;
					    u_xlat10_1 = u_xlat10_1 * u_xlat10_0.xxxx + u_xlat10_3;
					    u_xlat10_3 = texture(_Splat2, vs_TEXCOORD1.zw);
					    u_xlat10_0 = u_xlat10_3 * u_xlat10_0.zzzz + u_xlat10_1;
					    u_xlat16_2 = u_xlat10_0.w * u_xlat16_2;
					    u_xlat10_4.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
					    u_xlat10_5.xyz = vec3(u_xlat16_2) * _SpecColor.xyz;
					    u_xlat10_25 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat10_25 = max(u_xlat10_25, 0.0);
					    u_xlat10_4.xyz = u_xlat10_4.xyz * vec3(u_xlat10_25) + u_xlat10_5.xyz;
					    u_xlat6.xy = vs_TEXCOORD3.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD3.xx + u_xlat6.xy;
					    u_xlat6.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD3.zz + u_xlat6.xy;
					    u_xlat6.xy = u_xlat6.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
					    u_xlat10_6 = texture(_LightTexture0, u_xlat6.xy).w;
					    u_xlat10_25 = u_xlat10_6 * 2.0;
					    u_xlat10_4.xyz = vec3(u_xlat10_25) * u_xlat10_4.xyz;
					    u_xlat6.x = vs_TEXCOORD5;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
					#else
					    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					#endif
					    u_xlat6.xyz = u_xlat10_4.xyz * u_xlat6.xxx;
					    SV_Target0.xyz = u_xlat6.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles hw_tier00 " {
					Keywords { "POINT" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "POINT" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "POINT" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "POINT" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "POINT" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "POINT" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "SPOT" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "SPOT" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "SPOT" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "SPOT" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "SPOT" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "SPOT" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "POINT_COOKIE" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "POINT_COOKIE" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "POINT_COOKIE" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "POINT_COOKIE" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "POINT_COOKIE" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "POINT_COOKIE" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL_COOKIE" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL_COOKIE" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL_COOKIE" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL_COOKIE" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL_COOKIE" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL_COOKIE" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "POINT" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "POINT" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "POINT" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "POINT" "FOG_EXP2" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "POINT" "FOG_EXP2" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "POINT" "FOG_EXP2" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "SPOT" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "SPOT" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "SPOT" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "SPOT" "FOG_EXP2" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "SPOT" "FOG_EXP2" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "SPOT" "FOG_EXP2" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "POINT_COOKIE" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "POINT_COOKIE" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "POINT_COOKIE" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "POINT_COOKIE" "FOG_EXP2" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "POINT_COOKIE" "FOG_EXP2" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "POINT_COOKIE" "FOG_EXP2" }
					"!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL_COOKIE" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL_COOKIE" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL_COOKIE" "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL_COOKIE" "FOG_EXP2" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL_COOKIE" "FOG_EXP2" }
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL_COOKIE" "FOG_EXP2" }
					"!!GLES3"
				}
			}
		}
		Pass {
			Name "META"
			Tags { "LIGHTMODE" = "Meta" "RenderType" = "Opaque" "SplatCount" = "3" }
			ZClip Off
			Cull Off
			GpuProgramID 192207
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					attribute vec4 _glesMultiTexCoord2;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 unity_DynamicLightmapST;
					uniform bvec4 unity_MetaVertexControl;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec4 tmpvar_2;
					  highp vec4 vertex_3;
					  vertex_3 = _glesVertex;
					  if (unity_MetaVertexControl.x) {
					    vertex_3.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					    highp float tmpvar_4;
					    if ((_glesVertex.z > 0.0)) {
					      tmpvar_4 = 0.0001;
					    } else {
					      tmpvar_4 = 0.0;
					    };
					    vertex_3.z = tmpvar_4;
					  };
					  if (unity_MetaVertexControl.y) {
					    vertex_3.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
					    highp float tmpvar_5;
					    if ((vertex_3.z > 0.0)) {
					      tmpvar_5 = 0.0001;
					    } else {
					      tmpvar_5 = 0.0;
					    };
					    vertex_3.z = tmpvar_5;
					  };
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = vertex_3.xyz;
					  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  gl_Position = (glstate_matrix_mvp * tmpvar_6);
					  xlv_TEXCOORD0 = tmpvar_1;
					  xlv_TEXCOORD1 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform bvec4 unity_MetaFragmentControl;
					uniform highp float unity_OneOverOutputBoost;
					uniform highp float unity_MaxOutputValue;
					uniform highp float unity_UseLinearSpace;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  mediump vec3 tmpvar_2;
					  lowp vec3 tmpvar_3;
					  lowp vec3 tmpvar_4;
					  tmpvar_4 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  tmpvar_3 = (((texture2D (_Splat0, xlv_TEXCOORD0.zw) * tmpvar_4.x) + (texture2D (_Splat1, xlv_TEXCOORD1.xy) * tmpvar_4.y)) + (texture2D (_Splat2, xlv_TEXCOORD1.zw) * tmpvar_4.z)).xyz;
					  tmpvar_2 = tmpvar_3;
					  mediump vec4 res_5;
					  res_5 = vec4(0.0, 0.0, 0.0, 0.0);
					  if (unity_MetaFragmentControl.x) {
					    mediump vec4 tmpvar_6;
					    tmpvar_6.w = 1.0;
					    tmpvar_6.xyz = tmpvar_2;
					    res_5.w = tmpvar_6.w;
					    highp vec3 tmpvar_7;
					    tmpvar_7 = clamp (pow (tmpvar_2, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
					    res_5.xyz = tmpvar_7;
					  };
					  if (unity_MetaFragmentControl.y) {
					    mediump vec3 emission_8;
					    if (bool(unity_UseLinearSpace)) {
					      emission_8 = vec3(0.0, 0.0, 0.0);
					    } else {
					      emission_8 = vec3(0.0, 0.0, 0.0);
					    };
					    mediump vec4 tmpvar_9;
					    highp vec4 rgbm_10;
					    highp vec4 tmpvar_11;
					    tmpvar_11.w = 1.0;
					    tmpvar_11.xyz = (emission_8 * 0.01030928);
					    rgbm_10.xyz = tmpvar_11.xyz;
					    rgbm_10.w = max (max (tmpvar_11.x, tmpvar_11.y), max (tmpvar_11.z, 0.02));
					    rgbm_10.w = (ceil((rgbm_10.w * 255.0)) / 255.0);
					    rgbm_10.w = max (rgbm_10.w, 0.02);
					    rgbm_10.xyz = (tmpvar_11.xyz / rgbm_10.w);
					    tmpvar_9 = rgbm_10;
					    res_5 = tmpvar_9;
					  };
					  tmpvar_1 = res_5;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					attribute vec4 _glesMultiTexCoord2;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 unity_DynamicLightmapST;
					uniform bvec4 unity_MetaVertexControl;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec4 tmpvar_2;
					  highp vec4 vertex_3;
					  vertex_3 = _glesVertex;
					  if (unity_MetaVertexControl.x) {
					    vertex_3.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					    highp float tmpvar_4;
					    if ((_glesVertex.z > 0.0)) {
					      tmpvar_4 = 0.0001;
					    } else {
					      tmpvar_4 = 0.0;
					    };
					    vertex_3.z = tmpvar_4;
					  };
					  if (unity_MetaVertexControl.y) {
					    vertex_3.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
					    highp float tmpvar_5;
					    if ((vertex_3.z > 0.0)) {
					      tmpvar_5 = 0.0001;
					    } else {
					      tmpvar_5 = 0.0;
					    };
					    vertex_3.z = tmpvar_5;
					  };
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = vertex_3.xyz;
					  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  gl_Position = (glstate_matrix_mvp * tmpvar_6);
					  xlv_TEXCOORD0 = tmpvar_1;
					  xlv_TEXCOORD1 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform bvec4 unity_MetaFragmentControl;
					uniform highp float unity_OneOverOutputBoost;
					uniform highp float unity_MaxOutputValue;
					uniform highp float unity_UseLinearSpace;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  mediump vec3 tmpvar_2;
					  lowp vec3 tmpvar_3;
					  lowp vec3 tmpvar_4;
					  tmpvar_4 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  tmpvar_3 = (((texture2D (_Splat0, xlv_TEXCOORD0.zw) * tmpvar_4.x) + (texture2D (_Splat1, xlv_TEXCOORD1.xy) * tmpvar_4.y)) + (texture2D (_Splat2, xlv_TEXCOORD1.zw) * tmpvar_4.z)).xyz;
					  tmpvar_2 = tmpvar_3;
					  mediump vec4 res_5;
					  res_5 = vec4(0.0, 0.0, 0.0, 0.0);
					  if (unity_MetaFragmentControl.x) {
					    mediump vec4 tmpvar_6;
					    tmpvar_6.w = 1.0;
					    tmpvar_6.xyz = tmpvar_2;
					    res_5.w = tmpvar_6.w;
					    highp vec3 tmpvar_7;
					    tmpvar_7 = clamp (pow (tmpvar_2, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
					    res_5.xyz = tmpvar_7;
					  };
					  if (unity_MetaFragmentControl.y) {
					    mediump vec3 emission_8;
					    if (bool(unity_UseLinearSpace)) {
					      emission_8 = vec3(0.0, 0.0, 0.0);
					    } else {
					      emission_8 = vec3(0.0, 0.0, 0.0);
					    };
					    mediump vec4 tmpvar_9;
					    highp vec4 rgbm_10;
					    highp vec4 tmpvar_11;
					    tmpvar_11.w = 1.0;
					    tmpvar_11.xyz = (emission_8 * 0.01030928);
					    rgbm_10.xyz = tmpvar_11.xyz;
					    rgbm_10.w = max (max (tmpvar_11.x, tmpvar_11.y), max (tmpvar_11.z, 0.02));
					    rgbm_10.w = (ceil((rgbm_10.w * 255.0)) / 255.0);
					    rgbm_10.w = max (rgbm_10.w, 0.02);
					    rgbm_10.xyz = (tmpvar_11.xyz / rgbm_10.w);
					    tmpvar_9 = rgbm_10;
					    res_5 = tmpvar_9;
					  };
					  tmpvar_1 = res_5;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					attribute vec4 _glesMultiTexCoord2;
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 unity_DynamicLightmapST;
					uniform bvec4 unity_MetaVertexControl;
					uniform highp vec4 _Control_ST;
					uniform highp vec4 _Splat0_ST;
					uniform highp vec4 _Splat1_ST;
					uniform highp vec4 _Splat2_ST;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec4 tmpvar_2;
					  highp vec4 vertex_3;
					  vertex_3 = _glesVertex;
					  if (unity_MetaVertexControl.x) {
					    vertex_3.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					    highp float tmpvar_4;
					    if ((_glesVertex.z > 0.0)) {
					      tmpvar_4 = 0.0001;
					    } else {
					      tmpvar_4 = 0.0;
					    };
					    vertex_3.z = tmpvar_4;
					  };
					  if (unity_MetaVertexControl.y) {
					    vertex_3.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
					    highp float tmpvar_5;
					    if ((vertex_3.z > 0.0)) {
					      tmpvar_5 = 0.0001;
					    } else {
					      tmpvar_5 = 0.0;
					    };
					    vertex_3.z = tmpvar_5;
					  };
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 1.0;
					  tmpvar_6.xyz = vertex_3.xyz;
					  tmpvar_1.xy = ((_glesMultiTexCoord0.xy * _Control_ST.xy) + _Control_ST.zw);
					  tmpvar_1.zw = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _Splat1_ST.xy) + _Splat1_ST.zw);
					  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _Splat2_ST.xy) + _Splat2_ST.zw);
					  gl_Position = (glstate_matrix_mvp * tmpvar_6);
					  xlv_TEXCOORD0 = tmpvar_1;
					  xlv_TEXCOORD1 = tmpvar_2;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _Control;
					uniform sampler2D _Splat0;
					uniform sampler2D _Splat1;
					uniform sampler2D _Splat2;
					uniform bvec4 unity_MetaFragmentControl;
					uniform highp float unity_OneOverOutputBoost;
					uniform highp float unity_MaxOutputValue;
					uniform highp float unity_UseLinearSpace;
					varying highp vec4 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  mediump vec3 tmpvar_2;
					  lowp vec3 tmpvar_3;
					  lowp vec3 tmpvar_4;
					  tmpvar_4 = texture2D (_Control, xlv_TEXCOORD0.xy).xyz;
					  tmpvar_3 = (((texture2D (_Splat0, xlv_TEXCOORD0.zw) * tmpvar_4.x) + (texture2D (_Splat1, xlv_TEXCOORD1.xy) * tmpvar_4.y)) + (texture2D (_Splat2, xlv_TEXCOORD1.zw) * tmpvar_4.z)).xyz;
					  tmpvar_2 = tmpvar_3;
					  mediump vec4 res_5;
					  res_5 = vec4(0.0, 0.0, 0.0, 0.0);
					  if (unity_MetaFragmentControl.x) {
					    mediump vec4 tmpvar_6;
					    tmpvar_6.w = 1.0;
					    tmpvar_6.xyz = tmpvar_2;
					    res_5.w = tmpvar_6.w;
					    highp vec3 tmpvar_7;
					    tmpvar_7 = clamp (pow (tmpvar_2, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
					    res_5.xyz = tmpvar_7;
					  };
					  if (unity_MetaFragmentControl.y) {
					    mediump vec3 emission_8;
					    if (bool(unity_UseLinearSpace)) {
					      emission_8 = vec3(0.0, 0.0, 0.0);
					    } else {
					      emission_8 = vec3(0.0, 0.0, 0.0);
					    };
					    mediump vec4 tmpvar_9;
					    highp vec4 rgbm_10;
					    highp vec4 tmpvar_11;
					    tmpvar_11.w = 1.0;
					    tmpvar_11.xyz = (emission_8 * 0.01030928);
					    rgbm_10.xyz = tmpvar_11.xyz;
					    rgbm_10.w = max (max (tmpvar_11.x, tmpvar_11.y), max (tmpvar_11.z, 0.02));
					    rgbm_10.w = (ceil((rgbm_10.w * 255.0)) / 255.0);
					    rgbm_10.w = max (rgbm_10.w, 0.02);
					    rgbm_10.xyz = (tmpvar_11.xyz / rgbm_10.w);
					    tmpvar_9 = rgbm_10;
					    res_5 = tmpvar_9;
					  };
					  tmpvar_1 = res_5;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 unity_LightmapST;
					uniform 	vec4 unity_DynamicLightmapST;
					uniform 	bvec4 unity_MetaVertexControl;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec4 in_TEXCOORD0;
					in highp vec4 in_TEXCOORD1;
					in highp vec4 in_TEXCOORD2;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					bool u_xlatb6;
					void main()
					{
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(0.0<in_POSITION0.z);
					#else
					    u_xlatb0 = 0.0<in_POSITION0.z;
					#endif
					    u_xlat0.z = u_xlatb0 ? 9.99999975e-005 : float(0.0);
					    u_xlat0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    u_xlat0.xyz = (unity_MetaVertexControl.x) ? u_xlat0.xyz : in_POSITION0.xyz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb6 = !!(0.0<u_xlat0.z);
					#else
					    u_xlatb6 = 0.0<u_xlat0.z;
					#endif
					    u_xlat1.z = u_xlatb6 ? 9.99999975e-005 : float(0.0);
					    u_xlat1.xy = in_TEXCOORD2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
					    u_xlat0.xyz = (unity_MetaVertexControl.y) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat1 = hlslcc_mtx4x4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	bvec4 unity_MetaFragmentControl;
					uniform 	float unity_OneOverOutputBoost;
					uniform 	float unity_MaxOutputValue;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					lowp vec3 u_xlat10_1;
					lowp vec3 u_xlat10_2;
					lowp vec3 u_xlat10_3;
					float u_xlat12;
					void main()
					{
					    u_xlat10_0.xyz = texture(_Splat0, vs_TEXCOORD0.zw).xyz;
					    u_xlat10_1.xyz = texture(_Splat1, vs_TEXCOORD1.xy).xyz;
					    u_xlat10_2.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_3.xyz = u_xlat10_1.xyz * u_xlat10_2.yyy;
					    u_xlat10_3.xyz = u_xlat10_0.xyz * u_xlat10_2.xxx + u_xlat10_3.xyz;
					    u_xlat10_0.xyz = texture(_Splat2, vs_TEXCOORD1.zw).xyz;
					    u_xlat10_3.xyz = u_xlat10_0.xyz * u_xlat10_2.zzz + u_xlat10_3.xyz;
					    u_xlat16_0.xyz = log2(u_xlat10_3.xyz);
					    u_xlat12 = unity_OneOverOutputBoost;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					    u_xlat0.xyz = u_xlat16_0.xyz * vec3(u_xlat12);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = min(u_xlat0.xyz, vec3(vec3(unity_MaxOutputValue, unity_MaxOutputValue, unity_MaxOutputValue)));
					    u_xlat16_0.xyz = (unity_MetaFragmentControl.x) ? u_xlat0.xyz : vec3(0.0, 0.0, 0.0);
					    u_xlat16_0.w = (unity_MetaFragmentControl.x) ? 1.0 : 0.0;
					    u_xlat16_0 = (unity_MetaFragmentControl.y) ? vec4(0.0, 0.0, 0.0, 0.0235294122) : u_xlat16_0;
					    SV_Target0 = u_xlat16_0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 unity_LightmapST;
					uniform 	vec4 unity_DynamicLightmapST;
					uniform 	bvec4 unity_MetaVertexControl;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec4 in_TEXCOORD0;
					in highp vec4 in_TEXCOORD1;
					in highp vec4 in_TEXCOORD2;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					bool u_xlatb6;
					void main()
					{
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(0.0<in_POSITION0.z);
					#else
					    u_xlatb0 = 0.0<in_POSITION0.z;
					#endif
					    u_xlat0.z = u_xlatb0 ? 9.99999975e-005 : float(0.0);
					    u_xlat0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    u_xlat0.xyz = (unity_MetaVertexControl.x) ? u_xlat0.xyz : in_POSITION0.xyz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb6 = !!(0.0<u_xlat0.z);
					#else
					    u_xlatb6 = 0.0<u_xlat0.z;
					#endif
					    u_xlat1.z = u_xlatb6 ? 9.99999975e-005 : float(0.0);
					    u_xlat1.xy = in_TEXCOORD2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
					    u_xlat0.xyz = (unity_MetaVertexControl.y) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat1 = hlslcc_mtx4x4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	bvec4 unity_MetaFragmentControl;
					uniform 	float unity_OneOverOutputBoost;
					uniform 	float unity_MaxOutputValue;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					lowp vec3 u_xlat10_1;
					lowp vec3 u_xlat10_2;
					lowp vec3 u_xlat10_3;
					float u_xlat12;
					void main()
					{
					    u_xlat10_0.xyz = texture(_Splat0, vs_TEXCOORD0.zw).xyz;
					    u_xlat10_1.xyz = texture(_Splat1, vs_TEXCOORD1.xy).xyz;
					    u_xlat10_2.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_3.xyz = u_xlat10_1.xyz * u_xlat10_2.yyy;
					    u_xlat10_3.xyz = u_xlat10_0.xyz * u_xlat10_2.xxx + u_xlat10_3.xyz;
					    u_xlat10_0.xyz = texture(_Splat2, vs_TEXCOORD1.zw).xyz;
					    u_xlat10_3.xyz = u_xlat10_0.xyz * u_xlat10_2.zzz + u_xlat10_3.xyz;
					    u_xlat16_0.xyz = log2(u_xlat10_3.xyz);
					    u_xlat12 = unity_OneOverOutputBoost;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					    u_xlat0.xyz = u_xlat16_0.xyz * vec3(u_xlat12);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = min(u_xlat0.xyz, vec3(vec3(unity_MaxOutputValue, unity_MaxOutputValue, unity_MaxOutputValue)));
					    u_xlat16_0.xyz = (unity_MetaFragmentControl.x) ? u_xlat0.xyz : vec3(0.0, 0.0, 0.0);
					    u_xlat16_0.w = (unity_MetaFragmentControl.x) ? 1.0 : 0.0;
					    u_xlat16_0 = (unity_MetaFragmentControl.y) ? vec4(0.0, 0.0, 0.0, 0.0235294122) : u_xlat16_0;
					    SV_Target0 = u_xlat16_0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					uniform 	vec4 unity_LightmapST;
					uniform 	vec4 unity_DynamicLightmapST;
					uniform 	bvec4 unity_MetaVertexControl;
					uniform 	vec4 _Control_ST;
					uniform 	vec4 _Splat0_ST;
					uniform 	vec4 _Splat1_ST;
					uniform 	vec4 _Splat2_ST;
					in highp vec4 in_POSITION0;
					in highp vec4 in_TEXCOORD0;
					in highp vec4 in_TEXCOORD1;
					in highp vec4 in_TEXCOORD2;
					out highp vec4 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					bool u_xlatb6;
					void main()
					{
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(0.0<in_POSITION0.z);
					#else
					    u_xlatb0 = 0.0<in_POSITION0.z;
					#endif
					    u_xlat0.z = u_xlatb0 ? 9.99999975e-005 : float(0.0);
					    u_xlat0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    u_xlat0.xyz = (unity_MetaVertexControl.x) ? u_xlat0.xyz : in_POSITION0.xyz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb6 = !!(0.0<u_xlat0.z);
					#else
					    u_xlatb6 = 0.0<u_xlat0.z;
					#endif
					    u_xlat1.z = u_xlatb6 ? 9.99999975e-005 : float(0.0);
					    u_xlat1.xy = in_TEXCOORD2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
					    u_xlat0.xyz = (unity_MetaVertexControl.y) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat1 = hlslcc_mtx4x4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Control_ST.xy + _Control_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Splat0_ST.xy + _Splat0_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _Splat1_ST.xy + _Splat1_ST.zw;
					    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _Splat2_ST.xy + _Splat2_ST.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	bvec4 unity_MetaFragmentControl;
					uniform 	float unity_OneOverOutputBoost;
					uniform 	float unity_MaxOutputValue;
					uniform lowp sampler2D _Control;
					uniform lowp sampler2D _Splat0;
					uniform lowp sampler2D _Splat1;
					uniform lowp sampler2D _Splat2;
					in highp vec4 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					lowp vec3 u_xlat10_1;
					lowp vec3 u_xlat10_2;
					lowp vec3 u_xlat10_3;
					float u_xlat12;
					void main()
					{
					    u_xlat10_0.xyz = texture(_Splat0, vs_TEXCOORD0.zw).xyz;
					    u_xlat10_1.xyz = texture(_Splat1, vs_TEXCOORD1.xy).xyz;
					    u_xlat10_2.xyz = texture(_Control, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_3.xyz = u_xlat10_1.xyz * u_xlat10_2.yyy;
					    u_xlat10_3.xyz = u_xlat10_0.xyz * u_xlat10_2.xxx + u_xlat10_3.xyz;
					    u_xlat10_0.xyz = texture(_Splat2, vs_TEXCOORD1.zw).xyz;
					    u_xlat10_3.xyz = u_xlat10_0.xyz * u_xlat10_2.zzz + u_xlat10_3.xyz;
					    u_xlat16_0.xyz = log2(u_xlat10_3.xyz);
					    u_xlat12 = unity_OneOverOutputBoost;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					    u_xlat0.xyz = u_xlat16_0.xyz * vec3(u_xlat12);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = min(u_xlat0.xyz, vec3(vec3(unity_MaxOutputValue, unity_MaxOutputValue, unity_MaxOutputValue)));
					    u_xlat16_0.xyz = (unity_MetaFragmentControl.x) ? u_xlat0.xyz : vec3(0.0, 0.0, 0.0);
					    u_xlat16_0.w = (unity_MetaFragmentControl.x) ? 1.0 : 0.0;
					    u_xlat16_0 = (unity_MetaFragmentControl.y) ? vec4(0.0, 0.0, 0.0, 0.0235294122) : u_xlat16_0;
					    SV_Target0 = u_xlat16_0;
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
	Fallback "Specular"
}