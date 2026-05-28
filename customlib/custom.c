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

