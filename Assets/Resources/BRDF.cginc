#ifndef BRDF_INCLUDE
#define BRDF_INCLUDE


// Physically base shading model
// parameterized with below options


// Microfacet specular = D*G*F / (4 * NdotL * NdotV)  = D * Vis * F
// Vis = G / (4 * NdotL * NdotV)


float3 Diffuse_Lambert(float DiffuseColor)
{

}

//[]
float3 Diffuse_Burley(float3 DiffuseColor, float Roughnesss, float NdotV, float NdotL, float VdotH)
£û


£ý

#endif //BRDF_INCLUDE