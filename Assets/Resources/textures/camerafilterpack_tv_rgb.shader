Shader "CameraFilterPack/TV_Rgb" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(1, 10)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 25142
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
					  highp vec3 sum_1;
					  highp vec3 col_2;
					  highp vec2 tmpvar_3;
					  tmpvar_3 = (xlv_TEXCOORD0 * _ScreenResolution.xy);
					  highp vec2 tmpvar_4;
					  tmpvar_4 = (floor((tmpvar_3 / 6.0)) * 6.0);
					  highp vec2 tmpvar_5;
					  tmpvar_5 = (tmpvar_3 / vec2(6.0, 6.0));
					  highp vec2 tmpvar_6;
					  tmpvar_6 = (fract(abs(tmpvar_5)) * vec2(6.0, 6.0));
					  highp float tmpvar_7;
					  if ((tmpvar_5.x >= 0.0)) {
					    tmpvar_7 = tmpvar_6.x;
					  } else {
					    tmpvar_7 = -(tmpvar_6.x);
					  };
					  highp float tmpvar_8;
					  if ((tmpvar_5.y >= 0.0)) {
					    tmpvar_8 = tmpvar_6.y;
					  } else {
					    tmpvar_8 = -(tmpvar_6.y);
					  };
					  col_2 = vec3(0.0, 0.0, 0.0);
					  highp vec2 P_9;
					  P_9 = (tmpvar_4 / _ScreenResolution.xy);
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, P_9).xyz;
					  sum_1 = tmpvar_10;
					  if ((tmpvar_8 < 5.0)) {
					    if ((tmpvar_7 < 2.0)) {
					      col_2.x = sum_1.x;
					    } else {
					      if ((tmpvar_7 < 4.0)) {
					        col_2.y = sum_1.y;
					      } else {
					        col_2.z = sum_1.z;
					      };
					    };
					  };
					  highp vec4 tmpvar_11;
					  tmpvar_11.w = 1.0;
					  tmpvar_11.xyz = col_2;
					  gl_FragData[0] = tmpvar_11;
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
					  highp vec3 sum_1;
					  highp vec3 col_2;
					  highp vec2 tmpvar_3;
					  tmpvar_3 = (xlv_TEXCOORD0 * _ScreenResolution.xy);
					  highp vec2 tmpvar_4;
					  tmpvar_4 = (floor((tmpvar_3 / 6.0)) * 6.0);
					  highp vec2 tmpvar_5;
					  tmpvar_5 = (tmpvar_3 / vec2(6.0, 6.0));
					  highp vec2 tmpvar_6;
					  tmpvar_6 = (fract(abs(tmpvar_5)) * vec2(6.0, 6.0));
					  highp float tmpvar_7;
					  if ((tmpvar_5.x >= 0.0)) {
					    tmpvar_7 = tmpvar_6.x;
					  } else {
					    tmpvar_7 = -(tmpvar_6.x);
					  };
					  highp float tmpvar_8;
					  if ((tmpvar_5.y >= 0.0)) {
					    tmpvar_8 = tmpvar_6.y;
					  } else {
					    tmpvar_8 = -(tmpvar_6.y);
					  };
					  col_2 = vec3(0.0, 0.0, 0.0);
					  highp vec2 P_9;
					  P_9 = (tmpvar_4 / _ScreenResolution.xy);
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, P_9).xyz;
					  sum_1 = tmpvar_10;
					  if ((tmpvar_8 < 5.0)) {
					    if ((tmpvar_7 < 2.0)) {
					      col_2.x = sum_1.x;
					    } else {
					      if ((tmpvar_7 < 4.0)) {
					        col_2.y = sum_1.y;
					      } else {
					        col_2.z = sum_1.z;
					      };
					    };
					  };
					  highp vec4 tmpvar_11;
					  tmpvar_11.w = 1.0;
					  tmpvar_11.xyz = col_2;
					  gl_FragData[0] = tmpvar_11;
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
					  highp vec3 sum_1;
					  highp vec3 col_2;
					  highp vec2 tmpvar_3;
					  tmpvar_3 = (xlv_TEXCOORD0 * _ScreenResolution.xy);
					  highp vec2 tmpvar_4;
					  tmpvar_4 = (floor((tmpvar_3 / 6.0)) * 6.0);
					  highp vec2 tmpvar_5;
					  tmpvar_5 = (tmpvar_3 / vec2(6.0, 6.0));
					  highp vec2 tmpvar_6;
					  tmpvar_6 = (fract(abs(tmpvar_5)) * vec2(6.0, 6.0));
					  highp float tmpvar_7;
					  if ((tmpvar_5.x >= 0.0)) {
					    tmpvar_7 = tmpvar_6.x;
					  } else {
					    tmpvar_7 = -(tmpvar_6.x);
					  };
					  highp float tmpvar_8;
					  if ((tmpvar_5.y >= 0.0)) {
					    tmpvar_8 = tmpvar_6.y;
					  } else {
					    tmpvar_8 = -(tmpvar_6.y);
					  };
					  col_2 = vec3(0.0, 0.0, 0.0);
					  highp vec2 P_9;
					  P_9 = (tmpvar_4 / _ScreenResolution.xy);
					  lowp vec3 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, P_9).xyz;
					  sum_1 = tmpvar_10;
					  if ((tmpvar_8 < 5.0)) {
					    if ((tmpvar_7 < 2.0)) {
					      col_2.x = sum_1.x;
					    } else {
					      if ((tmpvar_7 < 4.0)) {
					        col_2.y = sum_1.y;
					      } else {
					        col_2.z = sum_1.z;
					      };
					    };
					  };
					  highp vec4 tmpvar_11;
					  tmpvar_11.w = 1.0;
					  tmpvar_11.xyz = col_2;
					  gl_FragData[0] = tmpvar_11;
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
					vec3 u_xlat2;
					vec3 u_xlat3;
					bvec3 u_xlatb3;
					vec3 u_xlat4;
					vec2 u_xlat5;
					vec2 u_xlat6;
					void main()
					{
					    u_xlat5.y = 0.0;
					    u_xlat6.x = 0.0;
					    u_xlat2.xyz = vs_TEXCOORD0.yxx * _ScreenResolution.yxx;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.166666672, 0.166666672, 0.166666672);
					    u_xlatb3.xyz = greaterThanEqual(u_xlat2.xyzx, (-u_xlat2.xzzx)).xyz;
					    u_xlat4.xyz = fract(abs(u_xlat2.xzz));
					    u_xlat0.xw = floor(u_xlat2.zx);
					    u_xlat0.xw = u_xlat0.xw * vec2(6.0, 6.0);
					    u_xlat0.xw = u_xlat0.xw / _ScreenResolution.xy;
					    u_xlat2.xyz = texture(_MainTex, u_xlat0.xw).xyz;
					    u_xlat3.x = (u_xlatb3.x) ? u_xlat4.x : (-u_xlat4.x);
					    u_xlat3.y = (u_xlatb3.y) ? u_xlat4.y : (-u_xlat4.z);
					    u_xlat3.z = (u_xlatb3.z) ? u_xlat4.z : (-u_xlat4.z);
					    u_xlatb3.xyz = lessThan(u_xlat3.xyzx, vec4(0.833333313, 0.333333343, 0.666666687, 0.0)).xyz;
					    u_xlat5.x = u_xlat2.y;
					    u_xlat6.y = u_xlat2.z;
					    u_xlat0.yz = (u_xlatb3.z) ? u_xlat5.xy : u_xlat6.xy;
					    u_xlat2.y = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat0.x = 0.0;
					    u_xlat0.xyz = (u_xlatb3.y) ? u_xlat2.xyz : u_xlat0.xyz;
					    SV_Target0.xyz = mix(vec3(0.0, 0.0, 0.0), u_xlat0.xyz, vec3(u_xlatb3.xxx));
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
					vec3 u_xlat2;
					vec3 u_xlat3;
					bvec3 u_xlatb3;
					vec3 u_xlat4;
					vec2 u_xlat5;
					vec2 u_xlat6;
					void main()
					{
					    u_xlat5.y = 0.0;
					    u_xlat6.x = 0.0;
					    u_xlat2.xyz = vs_TEXCOORD0.yxx * _ScreenResolution.yxx;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.166666672, 0.166666672, 0.166666672);
					    u_xlatb3.xyz = greaterThanEqual(u_xlat2.xyzx, (-u_xlat2.xzzx)).xyz;
					    u_xlat4.xyz = fract(abs(u_xlat2.xzz));
					    u_xlat0.xw = floor(u_xlat2.zx);
					    u_xlat0.xw = u_xlat0.xw * vec2(6.0, 6.0);
					    u_xlat0.xw = u_xlat0.xw / _ScreenResolution.xy;
					    u_xlat2.xyz = texture(_MainTex, u_xlat0.xw).xyz;
					    u_xlat3.x = (u_xlatb3.x) ? u_xlat4.x : (-u_xlat4.x);
					    u_xlat3.y = (u_xlatb3.y) ? u_xlat4.y : (-u_xlat4.z);
					    u_xlat3.z = (u_xlatb3.z) ? u_xlat4.z : (-u_xlat4.z);
					    u_xlatb3.xyz = lessThan(u_xlat3.xyzx, vec4(0.833333313, 0.333333343, 0.666666687, 0.0)).xyz;
					    u_xlat5.x = u_xlat2.y;
					    u_xlat6.y = u_xlat2.z;
					    u_xlat0.yz = (u_xlatb3.z) ? u_xlat5.xy : u_xlat6.xy;
					    u_xlat2.y = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat0.x = 0.0;
					    u_xlat0.xyz = (u_xlatb3.y) ? u_xlat2.xyz : u_xlat0.xyz;
					    SV_Target0.xyz = mix(vec3(0.0, 0.0, 0.0), u_xlat0.xyz, vec3(u_xlatb3.xxx));
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
					vec3 u_xlat2;
					vec3 u_xlat3;
					bvec3 u_xlatb3;
					vec3 u_xlat4;
					vec2 u_xlat5;
					vec2 u_xlat6;
					void main()
					{
					    u_xlat5.y = 0.0;
					    u_xlat6.x = 0.0;
					    u_xlat2.xyz = vs_TEXCOORD0.yxx * _ScreenResolution.yxx;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.166666672, 0.166666672, 0.166666672);
					    u_xlatb3.xyz = greaterThanEqual(u_xlat2.xyzx, (-u_xlat2.xzzx)).xyz;
					    u_xlat4.xyz = fract(abs(u_xlat2.xzz));
					    u_xlat0.xw = floor(u_xlat2.zx);
					    u_xlat0.xw = u_xlat0.xw * vec2(6.0, 6.0);
					    u_xlat0.xw = u_xlat0.xw / _ScreenResolution.xy;
					    u_xlat2.xyz = texture(_MainTex, u_xlat0.xw).xyz;
					    u_xlat3.x = (u_xlatb3.x) ? u_xlat4.x : (-u_xlat4.x);
					    u_xlat3.y = (u_xlatb3.y) ? u_xlat4.y : (-u_xlat4.z);
					    u_xlat3.z = (u_xlatb3.z) ? u_xlat4.z : (-u_xlat4.z);
					    u_xlatb3.xyz = lessThan(u_xlat3.xyzx, vec4(0.833333313, 0.333333343, 0.666666687, 0.0)).xyz;
					    u_xlat5.x = u_xlat2.y;
					    u_xlat6.y = u_xlat2.z;
					    u_xlat0.yz = (u_xlatb3.z) ? u_xlat5.xy : u_xlat6.xy;
					    u_xlat2.y = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat0.x = 0.0;
					    u_xlat0.xyz = (u_xlatb3.y) ? u_xlat2.xyz : u_xlat0.xyz;
					    SV_Target0.xyz = mix(vec3(0.0, 0.0, 0.0), u_xlat0.xyz, vec3(u_xlatb3.xxx));
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