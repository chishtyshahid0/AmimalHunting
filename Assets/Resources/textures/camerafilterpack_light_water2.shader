Shader "CameraFilterPack/Light_Water2" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 29197
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
					uniform highp float _Value;
					uniform highp float _Value2;
					uniform highp float _Value3;
					uniform highp float _Value4;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp float alpha_1;
					  highp vec2 c2_2;
					  highp vec2 c1_3;
					  highp vec2 p_4;
					  p_4 = xlv_TEXCOORD0;
					  c1_3 = p_4;
					  c2_2 = p_4;
					  highp vec2 coord_5;
					  coord_5 = p_4;
					  highp float theta_7;
					  highp float col_8;
					  highp float time_9;
					  time_9 = (_TimeX * 1.3);
					  col_8 = 0.0;
					  theta_7 = 0.0;
					  for (highp int i_6 = 0; i_6 < 8; i_6++) {
					    highp vec2 adjc_10;
					    theta_7 = (0.8975979 * float(i_6));
					    adjc_10.x = (coord_5.x + ((
					      (cos(theta_7) * time_9)
					     * _Value) + (time_9 * _Value2)));
					    adjc_10.y = (coord_5.y - ((
					      (sin(theta_7) * time_9)
					     * _Value) - (time_9 * _Value3)));
					    col_8 = (col_8 + (cos(
					      (((adjc_10.x * cos(theta_7)) - (adjc_10.y * sin(theta_7))) * 6.0)
					    ) * _Value4));
					  };
					  highp float tmpvar_11;
					  tmpvar_11 = cos(col_8);
					  c2_2.x = (p_4.x + 8.53);
					  highp vec2 coord_12;
					  coord_12 = c2_2;
					  highp float theta_14;
					  highp float col_15;
					  highp float time_16;
					  time_16 = (_TimeX * 1.3);
					  col_15 = 0.0;
					  theta_14 = 0.0;
					  for (highp int i_13 = 0; i_13 < 8; i_13++) {
					    highp vec2 adjc_17;
					    theta_14 = (0.8975979 * float(i_13));
					    adjc_17.x = (coord_12.x + ((
					      (cos(theta_14) * time_16)
					     * _Value) + (time_16 * _Value2)));
					    adjc_17.y = (coord_12.y - ((
					      (sin(theta_14) * time_16)
					     * _Value) - (time_16 * _Value3)));
					    col_15 = (col_15 + (cos(
					      (((adjc_17.x * cos(theta_14)) - (adjc_17.y * sin(theta_14))) * 6.0)
					    ) * _Value4));
					  };
					  highp float tmpvar_18;
					  tmpvar_18 = ((0.5 * (tmpvar_11 - 
					    cos(col_15)
					  )) / 60.0);
					  c2_2.x = p_4.x;
					  c2_2.y = (p_4.y + 8.53);
					  highp vec2 coord_19;
					  coord_19 = c2_2;
					  highp float theta_21;
					  highp float col_22;
					  highp float time_23;
					  time_23 = (_TimeX * 1.3);
					  col_22 = 0.0;
					  theta_21 = 0.0;
					  for (highp int i_20 = 0; i_20 < 8; i_20++) {
					    highp vec2 adjc_24;
					    theta_21 = (0.8975979 * float(i_20));
					    adjc_24.x = (coord_19.x + ((
					      (cos(theta_21) * time_23)
					     * _Value) + (time_23 * _Value2)));
					    adjc_24.y = (coord_19.y - ((
					      (sin(theta_21) * time_23)
					     * _Value) - (time_23 * _Value3)));
					    col_22 = (col_22 + (cos(
					      (((adjc_24.x * cos(theta_21)) - (adjc_24.y * sin(theta_21))) * 6.0)
					    ) * _Value4));
					  };
					  highp float tmpvar_25;
					  tmpvar_25 = ((0.5 * (tmpvar_11 - 
					    cos(col_22)
					  )) / 60.0);
					  c1_3.x = (p_4.x + (tmpvar_18 * 2.0));
					  c1_3.y = (p_4.y + (tmpvar_25 * 2.0));
					  highp float tmpvar_26;
					  tmpvar_26 = (1.0 + ((tmpvar_18 * tmpvar_25) * 700.0));
					  alpha_1 = tmpvar_26;
					  highp float tmpvar_27;
					  tmpvar_27 = (tmpvar_18 - 0.012);
					  highp float tmpvar_28;
					  tmpvar_28 = (tmpvar_25 - 0.012);
					  if (((tmpvar_27 > 0.0) && (tmpvar_28 > 0.0))) {
					    alpha_1 = pow (tmpvar_26, ((tmpvar_27 * tmpvar_28) * 200000.0));
					  };
					  lowp vec4 tmpvar_29;
					  tmpvar_29 = texture2D (_MainTex, c1_3);
					  highp vec4 tmpvar_30;
					  tmpvar_30 = (tmpvar_29 * alpha_1);
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
					uniform highp float _TimeX;
					uniform highp float _Value;
					uniform highp float _Value2;
					uniform highp float _Value3;
					uniform highp float _Value4;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp float alpha_1;
					  highp vec2 c2_2;
					  highp vec2 c1_3;
					  highp vec2 p_4;
					  p_4 = xlv_TEXCOORD0;
					  c1_3 = p_4;
					  c2_2 = p_4;
					  highp vec2 coord_5;
					  coord_5 = p_4;
					  highp float theta_7;
					  highp float col_8;
					  highp float time_9;
					  time_9 = (_TimeX * 1.3);
					  col_8 = 0.0;
					  theta_7 = 0.0;
					  for (highp int i_6 = 0; i_6 < 8; i_6++) {
					    highp vec2 adjc_10;
					    theta_7 = (0.8975979 * float(i_6));
					    adjc_10.x = (coord_5.x + ((
					      (cos(theta_7) * time_9)
					     * _Value) + (time_9 * _Value2)));
					    adjc_10.y = (coord_5.y - ((
					      (sin(theta_7) * time_9)
					     * _Value) - (time_9 * _Value3)));
					    col_8 = (col_8 + (cos(
					      (((adjc_10.x * cos(theta_7)) - (adjc_10.y * sin(theta_7))) * 6.0)
					    ) * _Value4));
					  };
					  highp float tmpvar_11;
					  tmpvar_11 = cos(col_8);
					  c2_2.x = (p_4.x + 8.53);
					  highp vec2 coord_12;
					  coord_12 = c2_2;
					  highp float theta_14;
					  highp float col_15;
					  highp float time_16;
					  time_16 = (_TimeX * 1.3);
					  col_15 = 0.0;
					  theta_14 = 0.0;
					  for (highp int i_13 = 0; i_13 < 8; i_13++) {
					    highp vec2 adjc_17;
					    theta_14 = (0.8975979 * float(i_13));
					    adjc_17.x = (coord_12.x + ((
					      (cos(theta_14) * time_16)
					     * _Value) + (time_16 * _Value2)));
					    adjc_17.y = (coord_12.y - ((
					      (sin(theta_14) * time_16)
					     * _Value) - (time_16 * _Value3)));
					    col_15 = (col_15 + (cos(
					      (((adjc_17.x * cos(theta_14)) - (adjc_17.y * sin(theta_14))) * 6.0)
					    ) * _Value4));
					  };
					  highp float tmpvar_18;
					  tmpvar_18 = ((0.5 * (tmpvar_11 - 
					    cos(col_15)
					  )) / 60.0);
					  c2_2.x = p_4.x;
					  c2_2.y = (p_4.y + 8.53);
					  highp vec2 coord_19;
					  coord_19 = c2_2;
					  highp float theta_21;
					  highp float col_22;
					  highp float time_23;
					  time_23 = (_TimeX * 1.3);
					  col_22 = 0.0;
					  theta_21 = 0.0;
					  for (highp int i_20 = 0; i_20 < 8; i_20++) {
					    highp vec2 adjc_24;
					    theta_21 = (0.8975979 * float(i_20));
					    adjc_24.x = (coord_19.x + ((
					      (cos(theta_21) * time_23)
					     * _Value) + (time_23 * _Value2)));
					    adjc_24.y = (coord_19.y - ((
					      (sin(theta_21) * time_23)
					     * _Value) - (time_23 * _Value3)));
					    col_22 = (col_22 + (cos(
					      (((adjc_24.x * cos(theta_21)) - (adjc_24.y * sin(theta_21))) * 6.0)
					    ) * _Value4));
					  };
					  highp float tmpvar_25;
					  tmpvar_25 = ((0.5 * (tmpvar_11 - 
					    cos(col_22)
					  )) / 60.0);
					  c1_3.x = (p_4.x + (tmpvar_18 * 2.0));
					  c1_3.y = (p_4.y + (tmpvar_25 * 2.0));
					  highp float tmpvar_26;
					  tmpvar_26 = (1.0 + ((tmpvar_18 * tmpvar_25) * 700.0));
					  alpha_1 = tmpvar_26;
					  highp float tmpvar_27;
					  tmpvar_27 = (tmpvar_18 - 0.012);
					  highp float tmpvar_28;
					  tmpvar_28 = (tmpvar_25 - 0.012);
					  if (((tmpvar_27 > 0.0) && (tmpvar_28 > 0.0))) {
					    alpha_1 = pow (tmpvar_26, ((tmpvar_27 * tmpvar_28) * 200000.0));
					  };
					  lowp vec4 tmpvar_29;
					  tmpvar_29 = texture2D (_MainTex, c1_3);
					  highp vec4 tmpvar_30;
					  tmpvar_30 = (tmpvar_29 * alpha_1);
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
					uniform highp float _TimeX;
					uniform highp float _Value;
					uniform highp float _Value2;
					uniform highp float _Value3;
					uniform highp float _Value4;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp float alpha_1;
					  highp vec2 c2_2;
					  highp vec2 c1_3;
					  highp vec2 p_4;
					  p_4 = xlv_TEXCOORD0;
					  c1_3 = p_4;
					  c2_2 = p_4;
					  highp vec2 coord_5;
					  coord_5 = p_4;
					  highp float theta_7;
					  highp float col_8;
					  highp float time_9;
					  time_9 = (_TimeX * 1.3);
					  col_8 = 0.0;
					  theta_7 = 0.0;
					  for (highp int i_6 = 0; i_6 < 8; i_6++) {
					    highp vec2 adjc_10;
					    theta_7 = (0.8975979 * float(i_6));
					    adjc_10.x = (coord_5.x + ((
					      (cos(theta_7) * time_9)
					     * _Value) + (time_9 * _Value2)));
					    adjc_10.y = (coord_5.y - ((
					      (sin(theta_7) * time_9)
					     * _Value) - (time_9 * _Value3)));
					    col_8 = (col_8 + (cos(
					      (((adjc_10.x * cos(theta_7)) - (adjc_10.y * sin(theta_7))) * 6.0)
					    ) * _Value4));
					  };
					  highp float tmpvar_11;
					  tmpvar_11 = cos(col_8);
					  c2_2.x = (p_4.x + 8.53);
					  highp vec2 coord_12;
					  coord_12 = c2_2;
					  highp float theta_14;
					  highp float col_15;
					  highp float time_16;
					  time_16 = (_TimeX * 1.3);
					  col_15 = 0.0;
					  theta_14 = 0.0;
					  for (highp int i_13 = 0; i_13 < 8; i_13++) {
					    highp vec2 adjc_17;
					    theta_14 = (0.8975979 * float(i_13));
					    adjc_17.x = (coord_12.x + ((
					      (cos(theta_14) * time_16)
					     * _Value) + (time_16 * _Value2)));
					    adjc_17.y = (coord_12.y - ((
					      (sin(theta_14) * time_16)
					     * _Value) - (time_16 * _Value3)));
					    col_15 = (col_15 + (cos(
					      (((adjc_17.x * cos(theta_14)) - (adjc_17.y * sin(theta_14))) * 6.0)
					    ) * _Value4));
					  };
					  highp float tmpvar_18;
					  tmpvar_18 = ((0.5 * (tmpvar_11 - 
					    cos(col_15)
					  )) / 60.0);
					  c2_2.x = p_4.x;
					  c2_2.y = (p_4.y + 8.53);
					  highp vec2 coord_19;
					  coord_19 = c2_2;
					  highp float theta_21;
					  highp float col_22;
					  highp float time_23;
					  time_23 = (_TimeX * 1.3);
					  col_22 = 0.0;
					  theta_21 = 0.0;
					  for (highp int i_20 = 0; i_20 < 8; i_20++) {
					    highp vec2 adjc_24;
					    theta_21 = (0.8975979 * float(i_20));
					    adjc_24.x = (coord_19.x + ((
					      (cos(theta_21) * time_23)
					     * _Value) + (time_23 * _Value2)));
					    adjc_24.y = (coord_19.y - ((
					      (sin(theta_21) * time_23)
					     * _Value) - (time_23 * _Value3)));
					    col_22 = (col_22 + (cos(
					      (((adjc_24.x * cos(theta_21)) - (adjc_24.y * sin(theta_21))) * 6.0)
					    ) * _Value4));
					  };
					  highp float tmpvar_25;
					  tmpvar_25 = ((0.5 * (tmpvar_11 - 
					    cos(col_22)
					  )) / 60.0);
					  c1_3.x = (p_4.x + (tmpvar_18 * 2.0));
					  c1_3.y = (p_4.y + (tmpvar_25 * 2.0));
					  highp float tmpvar_26;
					  tmpvar_26 = (1.0 + ((tmpvar_18 * tmpvar_25) * 700.0));
					  alpha_1 = tmpvar_26;
					  highp float tmpvar_27;
					  tmpvar_27 = (tmpvar_18 - 0.012);
					  highp float tmpvar_28;
					  tmpvar_28 = (tmpvar_25 - 0.012);
					  if (((tmpvar_27 > 0.0) && (tmpvar_28 > 0.0))) {
					    alpha_1 = pow (tmpvar_26, ((tmpvar_27 * tmpvar_28) * 200000.0));
					  };
					  lowp vec4 tmpvar_29;
					  tmpvar_29 = texture2D (_MainTex, c1_3);
					  highp vec4 tmpvar_30;
					  tmpvar_30 = (tmpvar_29 * alpha_1);
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
					uniform 	float _TimeX;
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	float _Value4;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					float u_xlat1;
					mediump vec2 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					int u_xlati1;
					bool u_xlatb1;
					vec2 u_xlat2;
					bool u_xlatb2;
					float u_xlat3;
					vec2 u_xlat4;
					float u_xlat5;
					bool u_xlatb5;
					float u_xlat6;
					float u_xlat8;
					float u_xlat9;
					float u_xlat10;
					float u_xlat12;
					bool u_xlatb12;
					int u_xlati13;
					void main()
					{
					    u_xlat0 = _TimeX * 1.29999995;
					    u_xlat4.xy = vec2(float(u_xlat0) * float(_Value2), float(u_xlat0) * float(_Value3));
					    u_xlat12 = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
					    {
					        u_xlat5 = float(u_xlati_loop_1);
					        u_xlat5 = u_xlat5 * 0.897597909;
					        u_xlat2.x = sin(u_xlat5);
					        u_xlat3 = cos(u_xlat5);
					        u_xlat5 = u_xlat0 * u_xlat3;
					        u_xlat5 = u_xlat5 * _Value + u_xlat4.x;
					        u_xlat5 = u_xlat5 + vs_TEXCOORD0.x;
					        u_xlat9 = u_xlat0 * u_xlat2.x;
					        u_xlat9 = u_xlat9 * _Value + (-u_xlat4.y);
					        u_xlat9 = (-u_xlat9) + vs_TEXCOORD0.y;
					        u_xlat9 = u_xlat2.x * u_xlat9;
					        u_xlat5 = u_xlat5 * u_xlat3 + (-u_xlat9);
					        u_xlat5 = u_xlat5 * 6.0;
					        u_xlat5 = cos(u_xlat5);
					        u_xlat12 = u_xlat5 * _Value4 + u_xlat12;
					    }
					    u_xlat12 = cos(u_xlat12);
					    u_xlat16_1.xy = vs_TEXCOORD0.xy + vec2(8.52999973, 8.52999973);
					    u_xlat9 = float(0.0);
					    for(int u_xlati_loop_2 = int(0) ; u_xlati_loop_2<8 ; u_xlati_loop_2++)
					    {
					        u_xlat2.x = float(u_xlati_loop_2);
					        u_xlat2.x = u_xlat2.x * 0.897597909;
					        u_xlat3 = cos(u_xlat2.x);
					        u_xlat2.x = sin(u_xlat2.x);
					        u_xlat6 = u_xlat0 * u_xlat3;
					        u_xlat6 = u_xlat6 * _Value + u_xlat4.x;
					        u_xlat6 = u_xlat16_1.x + u_xlat6;
					        u_xlat10 = u_xlat0 * u_xlat2.x;
					        u_xlat10 = u_xlat10 * _Value + (-u_xlat4.y);
					        u_xlat10 = (-u_xlat10) + vs_TEXCOORD0.y;
					        u_xlat2.x = u_xlat2.x * u_xlat10;
					        u_xlat2.x = u_xlat6 * u_xlat3 + (-u_xlat2.x);
					        u_xlat2.x = u_xlat2.x * 6.0;
					        u_xlat2.x = cos(u_xlat2.x);
					        u_xlat9 = u_xlat2.x * _Value4 + u_xlat9;
					    }
					    u_xlat1 = cos(u_xlat9);
					    u_xlat1 = u_xlat12 + (-u_xlat1);
					    u_xlat9 = float(0.0);
					    for(int u_xlati_loop_3 = int(0) ; u_xlati_loop_3<8 ; u_xlati_loop_3++)
					    {
					        u_xlat2.x = float(u_xlati_loop_3);
					        u_xlat2.x = u_xlat2.x * 0.897597909;
					        u_xlat3 = cos(u_xlat2.x);
					        u_xlat2.x = sin(u_xlat2.x);
					        u_xlat6 = u_xlat0 * u_xlat3;
					        u_xlat6 = u_xlat6 * _Value + u_xlat4.x;
					        u_xlat6 = u_xlat6 + vs_TEXCOORD0.x;
					        u_xlat10 = u_xlat0 * u_xlat2.x;
					        u_xlat10 = u_xlat10 * _Value + (-u_xlat4.y);
					        u_xlat10 = u_xlat16_1.y + (-u_xlat10);
					        u_xlat2.x = u_xlat2.x * u_xlat10;
					        u_xlat2.x = u_xlat6 * u_xlat3 + (-u_xlat2.x);
					        u_xlat2.x = u_xlat2.x * 6.0;
					        u_xlat2.x = cos(u_xlat2.x);
					        u_xlat9 = u_xlat2.x * _Value4 + u_xlat9;
					    }
					    u_xlat0 = cos(u_xlat9);
					    u_xlat0 = (-u_xlat0) + u_xlat12;
					    u_xlat4.x = u_xlat1 * 0.00833333377;
					    u_xlat2.x = u_xlat1 * 0.0166666675 + vs_TEXCOORD0.x;
					    u_xlat8 = u_xlat0 * 0.00833333377;
					    u_xlat2.y = u_xlat0 * 0.0166666675 + vs_TEXCOORD0.y;
					    u_xlat4.x = u_xlat8 * u_xlat4.x;
					    u_xlat4.x = u_xlat4.x * 700.0 + 1.0;
					    u_xlat8 = u_xlat1 * 0.00833333377 + -0.0120000001;
					    u_xlat0 = u_xlat0 * 0.00833333377 + -0.0120000001;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb12 = !!(0.0<u_xlat8);
					#else
					    u_xlatb12 = 0.0<u_xlat8;
					#endif
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(0.0<u_xlat0);
					#else
					    u_xlatb1 = 0.0<u_xlat0;
					#endif
					    u_xlatb12 = u_xlatb12 && u_xlatb1;
					    u_xlat0 = u_xlat0 * u_xlat8;
					    u_xlat0 = u_xlat0 * 200000.0;
					    u_xlat8 = log2(u_xlat4.x);
					    u_xlat0 = u_xlat8 * u_xlat0;
					    u_xlat0 = exp2(u_xlat0);
					    u_xlat0 = (u_xlatb12) ? u_xlat0 : u_xlat4.x;
					    u_xlat10_1 = texture(_MainTex, u_xlat2.xy);
					    SV_Target0 = vec4(u_xlat0) * u_xlat10_1;
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	float _Value4;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					float u_xlat1;
					mediump vec2 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					int u_xlati1;
					bool u_xlatb1;
					vec2 u_xlat2;
					bool u_xlatb2;
					float u_xlat3;
					vec2 u_xlat4;
					float u_xlat5;
					bool u_xlatb5;
					float u_xlat6;
					float u_xlat8;
					float u_xlat9;
					float u_xlat10;
					float u_xlat12;
					bool u_xlatb12;
					int u_xlati13;
					void main()
					{
					    u_xlat0 = _TimeX * 1.29999995;
					    u_xlat4.xy = vec2(float(u_xlat0) * float(_Value2), float(u_xlat0) * float(_Value3));
					    u_xlat12 = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
					    {
					        u_xlat5 = float(u_xlati_loop_1);
					        u_xlat5 = u_xlat5 * 0.897597909;
					        u_xlat2.x = sin(u_xlat5);
					        u_xlat3 = cos(u_xlat5);
					        u_xlat5 = u_xlat0 * u_xlat3;
					        u_xlat5 = u_xlat5 * _Value + u_xlat4.x;
					        u_xlat5 = u_xlat5 + vs_TEXCOORD0.x;
					        u_xlat9 = u_xlat0 * u_xlat2.x;
					        u_xlat9 = u_xlat9 * _Value + (-u_xlat4.y);
					        u_xlat9 = (-u_xlat9) + vs_TEXCOORD0.y;
					        u_xlat9 = u_xlat2.x * u_xlat9;
					        u_xlat5 = u_xlat5 * u_xlat3 + (-u_xlat9);
					        u_xlat5 = u_xlat5 * 6.0;
					        u_xlat5 = cos(u_xlat5);
					        u_xlat12 = u_xlat5 * _Value4 + u_xlat12;
					    }
					    u_xlat12 = cos(u_xlat12);
					    u_xlat16_1.xy = vs_TEXCOORD0.xy + vec2(8.52999973, 8.52999973);
					    u_xlat9 = float(0.0);
					    for(int u_xlati_loop_2 = int(0) ; u_xlati_loop_2<8 ; u_xlati_loop_2++)
					    {
					        u_xlat2.x = float(u_xlati_loop_2);
					        u_xlat2.x = u_xlat2.x * 0.897597909;
					        u_xlat3 = cos(u_xlat2.x);
					        u_xlat2.x = sin(u_xlat2.x);
					        u_xlat6 = u_xlat0 * u_xlat3;
					        u_xlat6 = u_xlat6 * _Value + u_xlat4.x;
					        u_xlat6 = u_xlat16_1.x + u_xlat6;
					        u_xlat10 = u_xlat0 * u_xlat2.x;
					        u_xlat10 = u_xlat10 * _Value + (-u_xlat4.y);
					        u_xlat10 = (-u_xlat10) + vs_TEXCOORD0.y;
					        u_xlat2.x = u_xlat2.x * u_xlat10;
					        u_xlat2.x = u_xlat6 * u_xlat3 + (-u_xlat2.x);
					        u_xlat2.x = u_xlat2.x * 6.0;
					        u_xlat2.x = cos(u_xlat2.x);
					        u_xlat9 = u_xlat2.x * _Value4 + u_xlat9;
					    }
					    u_xlat1 = cos(u_xlat9);
					    u_xlat1 = u_xlat12 + (-u_xlat1);
					    u_xlat9 = float(0.0);
					    for(int u_xlati_loop_3 = int(0) ; u_xlati_loop_3<8 ; u_xlati_loop_3++)
					    {
					        u_xlat2.x = float(u_xlati_loop_3);
					        u_xlat2.x = u_xlat2.x * 0.897597909;
					        u_xlat3 = cos(u_xlat2.x);
					        u_xlat2.x = sin(u_xlat2.x);
					        u_xlat6 = u_xlat0 * u_xlat3;
					        u_xlat6 = u_xlat6 * _Value + u_xlat4.x;
					        u_xlat6 = u_xlat6 + vs_TEXCOORD0.x;
					        u_xlat10 = u_xlat0 * u_xlat2.x;
					        u_xlat10 = u_xlat10 * _Value + (-u_xlat4.y);
					        u_xlat10 = u_xlat16_1.y + (-u_xlat10);
					        u_xlat2.x = u_xlat2.x * u_xlat10;
					        u_xlat2.x = u_xlat6 * u_xlat3 + (-u_xlat2.x);
					        u_xlat2.x = u_xlat2.x * 6.0;
					        u_xlat2.x = cos(u_xlat2.x);
					        u_xlat9 = u_xlat2.x * _Value4 + u_xlat9;
					    }
					    u_xlat0 = cos(u_xlat9);
					    u_xlat0 = (-u_xlat0) + u_xlat12;
					    u_xlat4.x = u_xlat1 * 0.00833333377;
					    u_xlat2.x = u_xlat1 * 0.0166666675 + vs_TEXCOORD0.x;
					    u_xlat8 = u_xlat0 * 0.00833333377;
					    u_xlat2.y = u_xlat0 * 0.0166666675 + vs_TEXCOORD0.y;
					    u_xlat4.x = u_xlat8 * u_xlat4.x;
					    u_xlat4.x = u_xlat4.x * 700.0 + 1.0;
					    u_xlat8 = u_xlat1 * 0.00833333377 + -0.0120000001;
					    u_xlat0 = u_xlat0 * 0.00833333377 + -0.0120000001;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb12 = !!(0.0<u_xlat8);
					#else
					    u_xlatb12 = 0.0<u_xlat8;
					#endif
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(0.0<u_xlat0);
					#else
					    u_xlatb1 = 0.0<u_xlat0;
					#endif
					    u_xlatb12 = u_xlatb12 && u_xlatb1;
					    u_xlat0 = u_xlat0 * u_xlat8;
					    u_xlat0 = u_xlat0 * 200000.0;
					    u_xlat8 = log2(u_xlat4.x);
					    u_xlat0 = u_xlat8 * u_xlat0;
					    u_xlat0 = exp2(u_xlat0);
					    u_xlat0 = (u_xlatb12) ? u_xlat0 : u_xlat4.x;
					    u_xlat10_1 = texture(_MainTex, u_xlat2.xy);
					    SV_Target0 = vec4(u_xlat0) * u_xlat10_1;
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	float _Value4;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					float u_xlat1;
					mediump vec2 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					int u_xlati1;
					bool u_xlatb1;
					vec2 u_xlat2;
					bool u_xlatb2;
					float u_xlat3;
					vec2 u_xlat4;
					float u_xlat5;
					bool u_xlatb5;
					float u_xlat6;
					float u_xlat8;
					float u_xlat9;
					float u_xlat10;
					float u_xlat12;
					bool u_xlatb12;
					int u_xlati13;
					void main()
					{
					    u_xlat0 = _TimeX * 1.29999995;
					    u_xlat4.xy = vec2(float(u_xlat0) * float(_Value2), float(u_xlat0) * float(_Value3));
					    u_xlat12 = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
					    {
					        u_xlat5 = float(u_xlati_loop_1);
					        u_xlat5 = u_xlat5 * 0.897597909;
					        u_xlat2.x = sin(u_xlat5);
					        u_xlat3 = cos(u_xlat5);
					        u_xlat5 = u_xlat0 * u_xlat3;
					        u_xlat5 = u_xlat5 * _Value + u_xlat4.x;
					        u_xlat5 = u_xlat5 + vs_TEXCOORD0.x;
					        u_xlat9 = u_xlat0 * u_xlat2.x;
					        u_xlat9 = u_xlat9 * _Value + (-u_xlat4.y);
					        u_xlat9 = (-u_xlat9) + vs_TEXCOORD0.y;
					        u_xlat9 = u_xlat2.x * u_xlat9;
					        u_xlat5 = u_xlat5 * u_xlat3 + (-u_xlat9);
					        u_xlat5 = u_xlat5 * 6.0;
					        u_xlat5 = cos(u_xlat5);
					        u_xlat12 = u_xlat5 * _Value4 + u_xlat12;
					    }
					    u_xlat12 = cos(u_xlat12);
					    u_xlat16_1.xy = vs_TEXCOORD0.xy + vec2(8.52999973, 8.52999973);
					    u_xlat9 = float(0.0);
					    for(int u_xlati_loop_2 = int(0) ; u_xlati_loop_2<8 ; u_xlati_loop_2++)
					    {
					        u_xlat2.x = float(u_xlati_loop_2);
					        u_xlat2.x = u_xlat2.x * 0.897597909;
					        u_xlat3 = cos(u_xlat2.x);
					        u_xlat2.x = sin(u_xlat2.x);
					        u_xlat6 = u_xlat0 * u_xlat3;
					        u_xlat6 = u_xlat6 * _Value + u_xlat4.x;
					        u_xlat6 = u_xlat16_1.x + u_xlat6;
					        u_xlat10 = u_xlat0 * u_xlat2.x;
					        u_xlat10 = u_xlat10 * _Value + (-u_xlat4.y);
					        u_xlat10 = (-u_xlat10) + vs_TEXCOORD0.y;
					        u_xlat2.x = u_xlat2.x * u_xlat10;
					        u_xlat2.x = u_xlat6 * u_xlat3 + (-u_xlat2.x);
					        u_xlat2.x = u_xlat2.x * 6.0;
					        u_xlat2.x = cos(u_xlat2.x);
					        u_xlat9 = u_xlat2.x * _Value4 + u_xlat9;
					    }
					    u_xlat1 = cos(u_xlat9);
					    u_xlat1 = u_xlat12 + (-u_xlat1);
					    u_xlat9 = float(0.0);
					    for(int u_xlati_loop_3 = int(0) ; u_xlati_loop_3<8 ; u_xlati_loop_3++)
					    {
					        u_xlat2.x = float(u_xlati_loop_3);
					        u_xlat2.x = u_xlat2.x * 0.897597909;
					        u_xlat3 = cos(u_xlat2.x);
					        u_xlat2.x = sin(u_xlat2.x);
					        u_xlat6 = u_xlat0 * u_xlat3;
					        u_xlat6 = u_xlat6 * _Value + u_xlat4.x;
					        u_xlat6 = u_xlat6 + vs_TEXCOORD0.x;
					        u_xlat10 = u_xlat0 * u_xlat2.x;
					        u_xlat10 = u_xlat10 * _Value + (-u_xlat4.y);
					        u_xlat10 = u_xlat16_1.y + (-u_xlat10);
					        u_xlat2.x = u_xlat2.x * u_xlat10;
					        u_xlat2.x = u_xlat6 * u_xlat3 + (-u_xlat2.x);
					        u_xlat2.x = u_xlat2.x * 6.0;
					        u_xlat2.x = cos(u_xlat2.x);
					        u_xlat9 = u_xlat2.x * _Value4 + u_xlat9;
					    }
					    u_xlat0 = cos(u_xlat9);
					    u_xlat0 = (-u_xlat0) + u_xlat12;
					    u_xlat4.x = u_xlat1 * 0.00833333377;
					    u_xlat2.x = u_xlat1 * 0.0166666675 + vs_TEXCOORD0.x;
					    u_xlat8 = u_xlat0 * 0.00833333377;
					    u_xlat2.y = u_xlat0 * 0.0166666675 + vs_TEXCOORD0.y;
					    u_xlat4.x = u_xlat8 * u_xlat4.x;
					    u_xlat4.x = u_xlat4.x * 700.0 + 1.0;
					    u_xlat8 = u_xlat1 * 0.00833333377 + -0.0120000001;
					    u_xlat0 = u_xlat0 * 0.00833333377 + -0.0120000001;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb12 = !!(0.0<u_xlat8);
					#else
					    u_xlatb12 = 0.0<u_xlat8;
					#endif
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(0.0<u_xlat0);
					#else
					    u_xlatb1 = 0.0<u_xlat0;
					#endif
					    u_xlatb12 = u_xlatb12 && u_xlatb1;
					    u_xlat0 = u_xlat0 * u_xlat8;
					    u_xlat0 = u_xlat0 * 200000.0;
					    u_xlat8 = log2(u_xlat4.x);
					    u_xlat0 = u_xlat8 * u_xlat0;
					    u_xlat0 = exp2(u_xlat0);
					    u_xlat0 = (u_xlatb12) ? u_xlat0 : u_xlat4.x;
					    u_xlat10_1 = texture(_MainTex, u_xlat2.xy);
					    SV_Target0 = vec4(u_xlat0) * u_xlat10_1;
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