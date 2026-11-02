Shader "CameraFilterPack/Edge_BlackLine" {
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
			GpuProgramID 59371
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 color_3;
					  highp float xlat_varfilter_5[25];
					  highp vec2 uv_6;
					  uv_6 = xlv_TEXCOORD0;
					  for (highp int a_4 = 0; a_4 < 25; a_4++) {
					    xlat_varfilter_5[a_4] = -1.0;
					  };
					  xlat_varfilter_5[12] = 24.0;
					  color_3 = vec4(0.0, 0.0, 0.0, 0.0);
					  for (highp int a_1_2 = 0; a_1_2 < 5; a_1_2++) {
					    highp vec2 tmpvar_7;
					    tmpvar_7.x = float((a_1_2 - 2));
					    tmpvar_7.y = -2.0;
					    highp vec2 P_8;
					    P_8 = (uv_6 + (tmpvar_7 / 100.0));
					    color_3 = (color_3 + (xlat_varfilter_5[(a_1_2 * 5)] * texture2D (_MainTex, P_8)));
					    highp vec2 tmpvar_9;
					    tmpvar_9.x = float((a_1_2 - 2));
					    tmpvar_9.y = -1.0;
					    highp vec2 P_10;
					    P_10 = (uv_6 + (tmpvar_9 / 100.0));
					    color_3 = (color_3 + (xlat_varfilter_5[(
					      (a_1_2 * 5)
					     + 1)] * texture2D (_MainTex, P_10)));
					    highp vec2 tmpvar_11;
					    tmpvar_11.x = float((a_1_2 - 2));
					    tmpvar_11.y = 0.0;
					    highp vec2 P_12;
					    P_12 = (uv_6 + (tmpvar_11 / 100.0));
					    color_3 = (color_3 + (xlat_varfilter_5[(
					      (a_1_2 * 5)
					     + 2)] * texture2D (_MainTex, P_12)));
					    highp vec2 tmpvar_13;
					    tmpvar_13.x = float((a_1_2 - 2));
					    tmpvar_13.y = 1.0;
					    highp vec2 P_14;
					    P_14 = (uv_6 + (tmpvar_13 / 100.0));
					    color_3 = (color_3 + (xlat_varfilter_5[(
					      (a_1_2 * 5)
					     + 3)] * texture2D (_MainTex, P_14)));
					    highp vec2 tmpvar_15;
					    tmpvar_15.x = float((a_1_2 - 2));
					    tmpvar_15.y = 2.0;
					    highp vec2 P_16;
					    P_16 = (uv_6 + (tmpvar_15 / 100.0));
					    color_3 = (color_3 + (xlat_varfilter_5[(
					      (a_1_2 * 5)
					     + 4)] * texture2D (_MainTex, P_16)));
					  };
					  if ((((
					    (color_3.x + color_3.y)
					   + color_3.z) / 3.0) < 0.8)) {
					    color_3 = vec4(0.0, 0.0, 0.0, 0.0);
					  };
					  tmpvar_1 = color_3;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 color_3;
					  highp float xlat_varfilter_5[25];
					  highp vec2 uv_6;
					  uv_6 = xlv_TEXCOORD0;
					  for (highp int a_4 = 0; a_4 < 25; a_4++) {
					    xlat_varfilter_5[a_4] = -1.0;
					  };
					  xlat_varfilter_5[12] = 24.0;
					  color_3 = vec4(0.0, 0.0, 0.0, 0.0);
					  for (highp int a_1_2 = 0; a_1_2 < 5; a_1_2++) {
					    highp vec2 tmpvar_7;
					    tmpvar_7.x = float((a_1_2 - 2));
					    tmpvar_7.y = -2.0;
					    highp vec2 P_8;
					    P_8 = (uv_6 + (tmpvar_7 / 100.0));
					    color_3 = (color_3 + (xlat_varfilter_5[(a_1_2 * 5)] * texture2D (_MainTex, P_8)));
					    highp vec2 tmpvar_9;
					    tmpvar_9.x = float((a_1_2 - 2));
					    tmpvar_9.y = -1.0;
					    highp vec2 P_10;
					    P_10 = (uv_6 + (tmpvar_9 / 100.0));
					    color_3 = (color_3 + (xlat_varfilter_5[(
					      (a_1_2 * 5)
					     + 1)] * texture2D (_MainTex, P_10)));
					    highp vec2 tmpvar_11;
					    tmpvar_11.x = float((a_1_2 - 2));
					    tmpvar_11.y = 0.0;
					    highp vec2 P_12;
					    P_12 = (uv_6 + (tmpvar_11 / 100.0));
					    color_3 = (color_3 + (xlat_varfilter_5[(
					      (a_1_2 * 5)
					     + 2)] * texture2D (_MainTex, P_12)));
					    highp vec2 tmpvar_13;
					    tmpvar_13.x = float((a_1_2 - 2));
					    tmpvar_13.y = 1.0;
					    highp vec2 P_14;
					    P_14 = (uv_6 + (tmpvar_13 / 100.0));
					    color_3 = (color_3 + (xlat_varfilter_5[(
					      (a_1_2 * 5)
					     + 3)] * texture2D (_MainTex, P_14)));
					    highp vec2 tmpvar_15;
					    tmpvar_15.x = float((a_1_2 - 2));
					    tmpvar_15.y = 2.0;
					    highp vec2 P_16;
					    P_16 = (uv_6 + (tmpvar_15 / 100.0));
					    color_3 = (color_3 + (xlat_varfilter_5[(
					      (a_1_2 * 5)
					     + 4)] * texture2D (_MainTex, P_16)));
					  };
					  if ((((
					    (color_3.x + color_3.y)
					   + color_3.z) / 3.0) < 0.8)) {
					    color_3 = vec4(0.0, 0.0, 0.0, 0.0);
					  };
					  tmpvar_1 = color_3;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 color_3;
					  highp float xlat_varfilter_5[25];
					  highp vec2 uv_6;
					  uv_6 = xlv_TEXCOORD0;
					  for (highp int a_4 = 0; a_4 < 25; a_4++) {
					    xlat_varfilter_5[a_4] = -1.0;
					  };
					  xlat_varfilter_5[12] = 24.0;
					  color_3 = vec4(0.0, 0.0, 0.0, 0.0);
					  for (highp int a_1_2 = 0; a_1_2 < 5; a_1_2++) {
					    highp vec2 tmpvar_7;
					    tmpvar_7.x = float((a_1_2 - 2));
					    tmpvar_7.y = -2.0;
					    highp vec2 P_8;
					    P_8 = (uv_6 + (tmpvar_7 / 100.0));
					    color_3 = (color_3 + (xlat_varfilter_5[(a_1_2 * 5)] * texture2D (_MainTex, P_8)));
					    highp vec2 tmpvar_9;
					    tmpvar_9.x = float((a_1_2 - 2));
					    tmpvar_9.y = -1.0;
					    highp vec2 P_10;
					    P_10 = (uv_6 + (tmpvar_9 / 100.0));
					    color_3 = (color_3 + (xlat_varfilter_5[(
					      (a_1_2 * 5)
					     + 1)] * texture2D (_MainTex, P_10)));
					    highp vec2 tmpvar_11;
					    tmpvar_11.x = float((a_1_2 - 2));
					    tmpvar_11.y = 0.0;
					    highp vec2 P_12;
					    P_12 = (uv_6 + (tmpvar_11 / 100.0));
					    color_3 = (color_3 + (xlat_varfilter_5[(
					      (a_1_2 * 5)
					     + 2)] * texture2D (_MainTex, P_12)));
					    highp vec2 tmpvar_13;
					    tmpvar_13.x = float((a_1_2 - 2));
					    tmpvar_13.y = 1.0;
					    highp vec2 P_14;
					    P_14 = (uv_6 + (tmpvar_13 / 100.0));
					    color_3 = (color_3 + (xlat_varfilter_5[(
					      (a_1_2 * 5)
					     + 3)] * texture2D (_MainTex, P_14)));
					    highp vec2 tmpvar_15;
					    tmpvar_15.x = float((a_1_2 - 2));
					    tmpvar_15.y = 2.0;
					    highp vec2 P_16;
					    P_16 = (uv_6 + (tmpvar_15 / 100.0));
					    color_3 = (color_3 + (xlat_varfilter_5[(
					      (a_1_2 * 5)
					     + 4)] * texture2D (_MainTex, P_16)));
					  };
					  if ((((
					    (color_3.x + color_3.y)
					   + color_3.z) / 3.0) < 0.8)) {
					    color_3 = vec4(0.0, 0.0, 0.0, 0.0);
					  };
					  tmpvar_1 = color_3;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					lowp vec4 u_xlat10_0;
					int u_xlati1;
					bool u_xlatb1;
					vec2 u_xlat2;
					lowp vec4 u_xlat10_3;
					vec4 u_xlat4;
					lowp vec4 u_xlat10_4;
					ivec3 u_xlati6;
					bool u_xlatb6;
					vec3 u_xlat7;
					float u_xlat12;
					int u_xlati12;
					bool u_xlatb12;
					vec4 TempArray0[25];
					void main()
					{
					    TempArray0[0].x = -1.0;
					    TempArray0[1].x = -1.0;
					    TempArray0[2].x = -1.0;
					    TempArray0[3].x = -1.0;
					    TempArray0[4].x = -1.0;
					    TempArray0[5].x = -1.0;
					    TempArray0[6].x = -1.0;
					    TempArray0[7].x = -1.0;
					    TempArray0[8].x = -1.0;
					    TempArray0[9].x = -1.0;
					    TempArray0[10].x = -1.0;
					    TempArray0[11].x = -1.0;
					    TempArray0[13].x = -1.0;
					    TempArray0[14].x = -1.0;
					    TempArray0[15].x = -1.0;
					    TempArray0[16].x = -1.0;
					    TempArray0[17].x = -1.0;
					    TempArray0[18].x = -1.0;
					    TempArray0[19].x = -1.0;
					    TempArray0[20].x = -1.0;
					    TempArray0[21].x = -1.0;
					    TempArray0[22].x = -1.0;
					    TempArray0[23].x = -1.0;
					    TempArray0[24].x = -1.0;
					    TempArray0[12].x = 24.0;
					    u_xlat10_0.x = float(0.0);
					    u_xlat10_0.y = float(0.0);
					    u_xlat10_0.z = float(0.0);
					    u_xlat10_0.w = float(0.0);
					    u_xlati1 = 0;
					    while(true){
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb6 = !!(u_xlati1>=5);
					#else
					        u_xlatb6 = u_xlati1>=5;
					#endif
					        if(u_xlatb6){break;}
					        u_xlati6.xy = ivec2(u_xlati1) + ivec2(int(0xFFFFFFFEu), 1);
					        u_xlat2.x = float(u_xlati6.x);
					        u_xlat10_3 = u_xlat10_0;
					        u_xlati6.x = 0;
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb12 = !!(u_xlati6.x>=5);
					#else
					            u_xlatb12 = u_xlati6.x>=5;
					#endif
					            if(u_xlatb12){break;}
					            u_xlati12 = u_xlati1 * 5 + u_xlati6.x;
					            u_xlat12 = TempArray0[u_xlati12].x;
					            u_xlati6.xz = u_xlati6.xx + ivec2(1, int(0xFFFFFFFEu));
					            u_xlat2.y = float(u_xlati6.z);
					            u_xlat7.xz = u_xlat2.xy * vec2(0.00999999978, 0.00999999978) + vs_TEXCOORD0.xy;
					            u_xlat10_4 = texture(_MainTex, u_xlat7.xz);
					            u_xlat4 = vec4(u_xlat12) * u_xlat10_4 + u_xlat10_3;
					            u_xlat10_3 = u_xlat4;
					        }
					        u_xlat10_0 = u_xlat10_3;
					        u_xlati1 = u_xlati6.y;
					    }
					    u_xlat10_3.x = u_xlat10_0.y + u_xlat10_0.x;
					    u_xlat10_3.x = u_xlat10_0.z + u_xlat10_3.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(u_xlat10_3.x<2.39999986);
					#else
					    u_xlatb1 = u_xlat10_3.x<2.39999986;
					#endif
					    u_xlat10_0 = (bool(u_xlatb1)) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat10_0;
					    SV_Target0 = u_xlat10_0;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					lowp vec4 u_xlat10_0;
					int u_xlati1;
					bool u_xlatb1;
					vec2 u_xlat2;
					lowp vec4 u_xlat10_3;
					vec4 u_xlat4;
					lowp vec4 u_xlat10_4;
					ivec3 u_xlati6;
					bool u_xlatb6;
					vec3 u_xlat7;
					float u_xlat12;
					int u_xlati12;
					bool u_xlatb12;
					vec4 TempArray0[25];
					void main()
					{
					    TempArray0[0].x = -1.0;
					    TempArray0[1].x = -1.0;
					    TempArray0[2].x = -1.0;
					    TempArray0[3].x = -1.0;
					    TempArray0[4].x = -1.0;
					    TempArray0[5].x = -1.0;
					    TempArray0[6].x = -1.0;
					    TempArray0[7].x = -1.0;
					    TempArray0[8].x = -1.0;
					    TempArray0[9].x = -1.0;
					    TempArray0[10].x = -1.0;
					    TempArray0[11].x = -1.0;
					    TempArray0[13].x = -1.0;
					    TempArray0[14].x = -1.0;
					    TempArray0[15].x = -1.0;
					    TempArray0[16].x = -1.0;
					    TempArray0[17].x = -1.0;
					    TempArray0[18].x = -1.0;
					    TempArray0[19].x = -1.0;
					    TempArray0[20].x = -1.0;
					    TempArray0[21].x = -1.0;
					    TempArray0[22].x = -1.0;
					    TempArray0[23].x = -1.0;
					    TempArray0[24].x = -1.0;
					    TempArray0[12].x = 24.0;
					    u_xlat10_0.x = float(0.0);
					    u_xlat10_0.y = float(0.0);
					    u_xlat10_0.z = float(0.0);
					    u_xlat10_0.w = float(0.0);
					    u_xlati1 = 0;
					    while(true){
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb6 = !!(u_xlati1>=5);
					#else
					        u_xlatb6 = u_xlati1>=5;
					#endif
					        if(u_xlatb6){break;}
					        u_xlati6.xy = ivec2(u_xlati1) + ivec2(int(0xFFFFFFFEu), 1);
					        u_xlat2.x = float(u_xlati6.x);
					        u_xlat10_3 = u_xlat10_0;
					        u_xlati6.x = 0;
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb12 = !!(u_xlati6.x>=5);
					#else
					            u_xlatb12 = u_xlati6.x>=5;
					#endif
					            if(u_xlatb12){break;}
					            u_xlati12 = u_xlati1 * 5 + u_xlati6.x;
					            u_xlat12 = TempArray0[u_xlati12].x;
					            u_xlati6.xz = u_xlati6.xx + ivec2(1, int(0xFFFFFFFEu));
					            u_xlat2.y = float(u_xlati6.z);
					            u_xlat7.xz = u_xlat2.xy * vec2(0.00999999978, 0.00999999978) + vs_TEXCOORD0.xy;
					            u_xlat10_4 = texture(_MainTex, u_xlat7.xz);
					            u_xlat4 = vec4(u_xlat12) * u_xlat10_4 + u_xlat10_3;
					            u_xlat10_3 = u_xlat4;
					        }
					        u_xlat10_0 = u_xlat10_3;
					        u_xlati1 = u_xlati6.y;
					    }
					    u_xlat10_3.x = u_xlat10_0.y + u_xlat10_0.x;
					    u_xlat10_3.x = u_xlat10_0.z + u_xlat10_3.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(u_xlat10_3.x<2.39999986);
					#else
					    u_xlatb1 = u_xlat10_3.x<2.39999986;
					#endif
					    u_xlat10_0 = (bool(u_xlatb1)) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat10_0;
					    SV_Target0 = u_xlat10_0;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					lowp vec4 u_xlat10_0;
					int u_xlati1;
					bool u_xlatb1;
					vec2 u_xlat2;
					lowp vec4 u_xlat10_3;
					vec4 u_xlat4;
					lowp vec4 u_xlat10_4;
					ivec3 u_xlati6;
					bool u_xlatb6;
					vec3 u_xlat7;
					float u_xlat12;
					int u_xlati12;
					bool u_xlatb12;
					vec4 TempArray0[25];
					void main()
					{
					    TempArray0[0].x = -1.0;
					    TempArray0[1].x = -1.0;
					    TempArray0[2].x = -1.0;
					    TempArray0[3].x = -1.0;
					    TempArray0[4].x = -1.0;
					    TempArray0[5].x = -1.0;
					    TempArray0[6].x = -1.0;
					    TempArray0[7].x = -1.0;
					    TempArray0[8].x = -1.0;
					    TempArray0[9].x = -1.0;
					    TempArray0[10].x = -1.0;
					    TempArray0[11].x = -1.0;
					    TempArray0[13].x = -1.0;
					    TempArray0[14].x = -1.0;
					    TempArray0[15].x = -1.0;
					    TempArray0[16].x = -1.0;
					    TempArray0[17].x = -1.0;
					    TempArray0[18].x = -1.0;
					    TempArray0[19].x = -1.0;
					    TempArray0[20].x = -1.0;
					    TempArray0[21].x = -1.0;
					    TempArray0[22].x = -1.0;
					    TempArray0[23].x = -1.0;
					    TempArray0[24].x = -1.0;
					    TempArray0[12].x = 24.0;
					    u_xlat10_0.x = float(0.0);
					    u_xlat10_0.y = float(0.0);
					    u_xlat10_0.z = float(0.0);
					    u_xlat10_0.w = float(0.0);
					    u_xlati1 = 0;
					    while(true){
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb6 = !!(u_xlati1>=5);
					#else
					        u_xlatb6 = u_xlati1>=5;
					#endif
					        if(u_xlatb6){break;}
					        u_xlati6.xy = ivec2(u_xlati1) + ivec2(int(0xFFFFFFFEu), 1);
					        u_xlat2.x = float(u_xlati6.x);
					        u_xlat10_3 = u_xlat10_0;
					        u_xlati6.x = 0;
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb12 = !!(u_xlati6.x>=5);
					#else
					            u_xlatb12 = u_xlati6.x>=5;
					#endif
					            if(u_xlatb12){break;}
					            u_xlati12 = u_xlati1 * 5 + u_xlati6.x;
					            u_xlat12 = TempArray0[u_xlati12].x;
					            u_xlati6.xz = u_xlati6.xx + ivec2(1, int(0xFFFFFFFEu));
					            u_xlat2.y = float(u_xlati6.z);
					            u_xlat7.xz = u_xlat2.xy * vec2(0.00999999978, 0.00999999978) + vs_TEXCOORD0.xy;
					            u_xlat10_4 = texture(_MainTex, u_xlat7.xz);
					            u_xlat4 = vec4(u_xlat12) * u_xlat10_4 + u_xlat10_3;
					            u_xlat10_3 = u_xlat4;
					        }
					        u_xlat10_0 = u_xlat10_3;
					        u_xlati1 = u_xlati6.y;
					    }
					    u_xlat10_3.x = u_xlat10_0.y + u_xlat10_0.x;
					    u_xlat10_3.x = u_xlat10_0.z + u_xlat10_3.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(u_xlat10_3.x<2.39999986);
					#else
					    u_xlatb1 = u_xlat10_3.x<2.39999986;
					#endif
					    u_xlat10_0 = (bool(u_xlatb1)) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat10_0;
					    SV_Target0 = u_xlat10_0;
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