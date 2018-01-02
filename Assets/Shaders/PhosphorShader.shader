Shader "Custom/PhosphorShader" {
Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
                                _Tex("InputTex", 2D) = "white" {}
     }

     SubShader
     {
        Lighting Off
        Blend One Zero

        Pass
        {
            CGPROGRAM
            #include "UnityCustomRenderTexture.cginc"
            #pragma vertex CustomRenderTextureVertexShader
            #pragma fragment frag
             #pragma target 3.0

            
            float4      _Color;
            sampler2D   _Tex;

            static const float  PI = 3.14159;
            float sinM(float t)
            {
                return (1.0f+sin(t))/2.0f;
            }

            float4 frag(v2f_customrendertexture IN) : COLOR
            {
                float t1 = _Time[1] + 5*IN.globalTexcoord.x*PI*2;
                float t2 = 1+_Time[1] + 3*(IN.globalTexcoord.x+IN.globalTexcoord.y)*PI*2;

                float2 sinxy = .1*sin(20*IN.globalTexcoord + _Time[1]);
                float2 cosxy = .1*cos(20*IN.globalTexcoord + _Time[1]);
                int bint = (_Time[1] +(IN.globalTexcoord.x+cosxy[0])*20)%2;
                bint *= (_Time[1] +(IN.globalTexcoord.y+sinxy[0])*20)%2;

                float b = (IN.globalTexcoord.x*5)%1;
                    return float4(sinM(t1)*bint,bint*sinM(t2),bint,0);
            }
            ENDCG
        }
    }
	
	FallBack "Diffuse"
}
