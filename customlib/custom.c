#include <stddef.h>
#include <math.h>

float fvec_L2sqr_ref(const float* x, const float* y, size_t d) {
  size_t i;
  float res = 0;
  for (i = 0; i < d; i++) {
    const float tmp = x[i] - y[i];
    res += tmp * tmp;
  }
  return res;
}

float fvec_L1_ref(const float* x, const float* y, size_t d) {
    size_t i;
    float res = 0;
    for (i = 0; i < d; i++) {
        const float tmp = x[i] - y[i];
        res += fabs(tmp);
    }
    return res;
 }

float fvec_inner_product_ref(const float* x, const float* y, size_t d) {
    size_t i;
    float res = 0;
    for (i = 0; i < d; i++) {
        res += x[i] * y[i];
    }
    return res;
}


float cosine_distance_ref (const float* x, const float* y, size_t d)
{
    float res = 0.0, dotpdt = 0.0, mag_vx = 0.0, mag_vy=0.0;
    for (size_t i = 0; i < d; i++)
        {
            dotpdt += x[i] * y[i];
            mag_vx += x[i] * x[i];
            mag_vy += y[i] * y[i];
        }
    res = 1.0f - (dotpdt/(sqrt(mag_vx * mag_vy)));
    return res;
}

float angular_distance_c(const float* x, const float* y, int f, float x_norm, float y_norm) {
    // Always recompute norms and dot product in a single fused loop
    // Returns: 2 - 2*cos(theta), which is the squared Euclidean distance between unit vectors
    // This matches the original C++ implementation
    float pq = 0.0f;  // x·y
    float pp = 0.0f;  // x·x
    float qq = 0.0f;  // y·y
    
    // Compute all three dot products in one pass
    for (int i = 0; i < f; i++) {
        float xi = x[i];
        float yi = y[i];
        pq += xi * yi;
        pp += xi * xi;
        qq += yi * yi;
    }
    
    // Calculate: 2 - 2*cos(theta) = 2 - 2*(x·y)/(|x||y|)
    float ppqq = pp * qq;
    if (ppqq > 0.0f) {
        return 2.0f - 2.0f * pq / sqrtf(ppqq);
    } else {
        return 2.0f; // cos is 0
    }
}
