Shader "CameraFilterPack/Color_Switching" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 8)) = 8
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 63042
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
					  lowp vec4 col_1;
					  col_1 = vec4(1.0, 1.0, 1.0, 1.0);
					  if ((_Distortion == 0.0)) {
					    col_1.xyz = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
					  };
					  if ((_Distortion == 1.0)) {
					    col_1.xyz = texture2D (_MainTex, xlv_TEXCOORD0).xzy;
					  };
					  if ((_Distortion == 2.0)) {
					    col_1.xyz = texture2D (_MainTex, xlv_TEXCOORD0).yzx;
					  };
					  if ((_Distortion == 3.0)) {
					    col_1.xyz = texture2D (_MainTex, xlv_TEXCOORD0).yxz;
					  };
					  if ((_Distortion == 4.0)) {
					    col_1.xyz = texture2D (_MainTex, xlv_TEXCOORD0).zyx;
					  };
					  if ((_Distortion == 5.0)) {
					    col_1.xyz = texture2D (_MainTex, xlv_TEXCOORD0).zxy;
					  };
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
					uniform highp float _Distortion;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 col_1;
					  col_1 = vec4(1.0, 1.0, 1.0, 1.0);
					  if ((_Distortion == 0.0)) {
					    col_1.xyz = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
					  };
					  if ((_Distortion == 1.0)) {
					    col_1.xyz = texture2D (_MainTex, xlv_TEXCOORD0).xzy;
					  };
					  if ((_Distortion == 2.0)) {
					    col_1.xyz = texture2D (_MainTex, xlv_TEXCOORD0).yzx;
					  };
					  if ((_Distortion == 3.0)) {
					    col_1.xyz = texture2D (_MainTex, xlv_TEXCOORD0).yxz;
					  };
					  if ((_Distortion == 4.0)) {
					    col_1.xyz = texture2D (_MainTex, xlv_TEXCOORD0).zyx;
					  };
					  if ((_Distortion == 5.0)) {
					    col_1.xyz = texture2D (_MainTex, xlv_TEXCOORD0).zxy;
					  };
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
					uniform highp float _Distortion;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 col_1;
					  col_1 = vec4(1.0, 1.0, 1.0, 1.0);
					  if ((_Distortion == 0.0)) {
					    col_1.xyz = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
					  };
					  if ((_Distortion == 1.0)) {
					    col_1.xyz = texture2D (_MainTex, xlv_TEXCOORD0).xzy;
					  };
					  if ((_Distortion == 2.0)) {
					    col_1.xyz = texture2D (_MainTex, xlv_TEXCOORD0).yzx;
					  };
					  if ((_Distortion == 3.0)) {
					    col_1.xyz = texture2D (_MainTex, xlv_TEXCOORD0).yxz;
					  };
					  if ((_Distortion == 4.0)) {
					    col_1.xyz = texture2D (_MainTex, xlv_TEXCOORD0).zyx;
					  };
					  if ((_Distortion == 5.0)) {
					    col_1.xyz = texture2D (_MainTex, xlv_TEXCOORD0).zxy;
					  };
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
					uniform 	float _Distortion;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					lowp vec4 u_xlat10_0;
					bvec4 u_xlatb0;
					lowp vec3 u_xlat10_1;
					lowp vec3 u_xlat10_2;
					void main()
					{
					    u_xlatb0 = equal(vec4(vec4(_Distortion, _Distortion, _Distortion, _Distortion)), vec4(0.0, 1.0, 2.0, 3.0));
					    if(u_xlatb0.x){
					        u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					        u_xlat10_2.xyz = u_xlat10_1.xyz;
					    } else {
					        u_xlat10_2.x = float(1.0);
					        u_xlat10_2.y = float(1.0);
					        u_xlat10_2.z = float(1.0);
					    //ENDIF
					    }
					    if(u_xlatb0.y){
					        u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					        u_xlat10_2.xyz = u_xlat10_1.xzy;
					    //ENDIF
					    }
					    if(u_xlatb0.z){
					        u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					        u_xlat10_2.xyz = u_xlat10_0.yzx;
					    //ENDIF
					    }
					    if(u_xlatb0.w){
					        u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					        u_xlat10_2.xyz = u_xlat10_0.yxz;
					    //ENDIF
					    }
					    u_xlatb0.xy = equal(vec4(vec4(_Distortion, _Distortion, _Distortion, _Distortion)), vec4(4.0, 5.0, 0.0, 0.0)).xy;
					    if(u_xlatb0.x){
					        u_xlat10_0.xzw = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					        u_xlat10_2.xyz = u_xlat10_0.wzx;
					    //ENDIF
					    }
					    if(u_xlatb0.y){
					        u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					        u_xlat10_2.xyz = u_xlat10_0.zxy;
					    //ENDIF
					    }
					    SV_Target0.xyz = u_xlat10_2.xyz;
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
					lowp vec4 u_xlat10_0;
					bvec4 u_xlatb0;
					lowp vec3 u_xlat10_1;
					lowp vec3 u_xlat10_2;
					void main()
					{
					    u_xlatb0 = equal(vec4(vec4(_Distortion, _Distortion, _Distortion, _Distortion)), vec4(0.0, 1.0, 2.0, 3.0));
					    if(u_xlatb0.x){
					        u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					        u_xlat10_2.xyz = u_xlat10_1.xyz;
					    } else {
					        u_xlat10_2.x = float(1.0);
					        u_xlat10_2.y = float(1.0);
					        u_xlat10_2.z = float(1.0);
					    //ENDIF
					    }
					    if(u_xlatb0.y){
					        u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					        u_xlat10_2.xyz = u_xlat10_1.xzy;
					    //ENDIF
					    }
					    if(u_xlatb0.z){
					        u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					        u_xlat10_2.xyz = u_xlat10_0.yzx;
					    //ENDIF
					    }
					    if(u_xlatb0.w){
					        u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					        u_xlat10_2.xyz = u_xlat10_0.yxz;
					    //ENDIF
					    }
					    u_xlatb0.xy = equal(vec4(vec4(_Distortion, _Distortion, _Distortion, _Distortion)), vec4(4.0, 5.0, 0.0, 0.0)).xy;
					    if(u_xlatb0.x){
					        u_xlat10_0.xzw = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					        u_xlat10_2.xyz = u_xlat10_0.wzx;
					    //ENDIF
					    }
					    if(u_xlatb0.y){
					        u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					        u_xlat10_2.xyz = u_xlat10_0.zxy;
					    //ENDIF
					    }
					    SV_Target0.xyz = u_xlat10_2.xyz;
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
					lowp vec4 u_xlat10_0;
					bvec4 u_xlatb0;
					lowp vec3 u_xlat10_1;
					lowp vec3 u_xlat10_2;
					void main()
					{
					    u_xlatb0 = equal(vec4(vec4(_Distortion, _Distortion, _Distortion, _Distortion)), vec4(0.0, 1.0, 2.0, 3.0));
					    if(u_xlatb0.x){
					        u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					        u_xlat10_2.xyz = u_xlat10_1.xyz;
					    } else {
					        u_xlat10_2.x = float(1.0);
					        u_xlat10_2.y = float(1.0);
					        u_xlat10_2.z = float(1.0);
					    //ENDIF
					    }
					    if(u_xlatb0.y){
					        u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					        u_xlat10_2.xyz = u_xlat10_1.xzy;
					    //ENDIF
					    }
					    if(u_xlatb0.z){
					        u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					        u_xlat10_2.xyz = u_xlat10_0.yzx;
					    //ENDIF
					    }
					    if(u_xlatb0.w){
					        u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					        u_xlat10_2.xyz = u_xlat10_0.yxz;
					    //ENDIF
					    }
					    u_xlatb0.xy = equal(vec4(vec4(_Distortion, _Distortion, _Distortion, _Distortion)), vec4(4.0, 5.0, 0.0, 0.0)).xy;
					    if(u_xlatb0.x){
					        u_xlat10_0.xzw = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					        u_xlat10_2.xyz = u_xlat10_0.wzx;
					    //ENDIF
					    }
					    if(u_xlatb0.y){
					        u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					        u_xlat10_2.xyz = u_xlat10_0.zxy;
					    //ENDIF
					    }
					    SV_Target0.xyz = u_xlat10_2.xyz;
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