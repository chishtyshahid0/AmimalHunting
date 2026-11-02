Shader "Custom/Mobile Mountain Grass Blend"
{
    Properties
    {
        _UpperTex ("Upper Texture", 2D) = "white" {}
        _SidesTex ("Sides Texture", 2D) = "white" {}

        _SidesTilingX ("Sides Tiling X", Range(0.01, 20.0)) = 1.0
        _SidesTilingY ("Sides Tiling Y", Range(0.01, 20.0)) = 1.0
        _SidesOffsetX ("Sides Offset X", Range(-5.0, 5.0)) = 0.0
        _SidesOffsetY ("Sides Offset Y", Range(-5.0, 5.0)) = 0.0
        _SidesTint ("Sides Tint", Color) = (1,1,1,1)

        _UpperTilingX ("Upper Tiling X", Range(0.001, 10.0)) = 0.1
        _UpperTilingY ("Upper Tiling Y", Range(0.001, 10.0)) = 0.1
        _UpperOffsetX ("Upper Offset X", Range(-10.0, 10.0)) = 0.0
        _UpperOffsetY ("Upper Offset Y", Range(-10.0, 10.0)) = 0.0
        _UpperTint ("Upper Tint", Color) = (1,1,1,1)

        _UpperStart ("Upper Start", Range(0.0, 1.0)) = 0.35
        _UpperEnd ("Upper Full", Range(0.0, 1.0)) = 0.70
        _UpperAmount ("Upper Amount", Range(0.0, 1.0)) = 1.0
        _BlendPower ("Blend Sharpness", Range(0.25, 8.0)) = 1.0
    }

    SubShader
    {
        Tags { "RenderType"="Opaque" "Queue"="Geometry" }
        LOD 200

        CGPROGRAM
        // Unity generates ForwardBase / ForwardAdd, shadow and lightmap variants.
        // Surface shaders also integrate scene fog in the Built-in Render Pipeline.
        #pragma surface surf Lambert fullforwardshadows addshadow
        #pragma target 2.0

        #include "UnityCG.cginc"

        sampler2D _UpperTex;
        sampler2D _SidesTex;

        half _SidesTilingX, _SidesTilingY, _SidesOffsetX, _SidesOffsetY;
        fixed4 _SidesTint;
        half _UpperTilingX, _UpperTilingY, _UpperOffsetX, _UpperOffsetY;
        fixed4 _UpperTint;
        half _UpperStart, _UpperEnd, _UpperAmount, _BlendPower;

        struct Input
        {
            float2 uv_SidesTex; // Original mesh UV0, unmodified
            float3 worldPos;    // World XZ for upper texture
            float3 worldNormal; // Normal in world space for slope blending
        };

        void surf(Input IN, inout SurfaceOutput o)
        {
            float2 sidesUV = IN.uv_SidesTex * float2(_SidesTilingX, _SidesTilingY)
                           + float2(_SidesOffsetX, _SidesOffsetY);
            float2 upperUV = IN.worldPos.xz * float2(_UpperTilingX, _UpperTilingY)
                           + float2(_UpperOffsetX, _UpperOffsetY);

            fixed3 sidesColor = tex2D(_SidesTex, sidesUV).rgb * _SidesTint.rgb;
            fixed3 upperColor = tex2D(_UpperTex, upperUV).rgb * _UpperTint.rgb;

            float3 n = normalize(IN.worldNormal);
            half upFacing = saturate(n.y);
            half upperMask = smoothstep(_UpperStart,
                                         max(_UpperEnd, _UpperStart + 0.001),
                                         upFacing);
            upperMask = pow(saturate(upperMask), _BlendPower) * _UpperAmount;

            o.Albedo = lerp(sidesColor, upperColor, upperMask);
            o.Alpha = 1.0;
        }
        ENDCG
    }

    FallBack "Diffuse"
}
