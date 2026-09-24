Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115D34156CE
	for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 07:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790234178; cv=none; b=A3ywN7csxkDaKspYbKP4zzTIRjrFOy3q37whfRPDQ8VQDOKHhsdOEoLXQnkHweOs4GOBDGRrsBIDGOaQFV2mfi1DRMB5qYoXZLOLW4Iwp25PfEefiMRVCh546nEZww4ZkxVYkGUWINelTTLYDLKDRHW31tWFIM1n0fkWslfOznU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790234178; c=relaxed/simple;
	bh=JE+LuWu2VjEIedc5LO/XuI/mtuDLvlmB2MpQX6bmLFo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=SReKAmxQv14wF/4CoWOJtYh98R3e6XVqCCZScIHX82lxmGhqtF/5Ji8vLNGD1K/7CZ/e8+dc3OMwqcxcaBXo8ZboDct4Ktmwl5Wf+ETEAerQSp5KGMXTNzN1Tn4aDoLzHq7gyFqkUPbzpXzOLD8a4uX4QtJxBQ6bKNi/BG1AndU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yyok1Qfa; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yyok1Qfa"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso997477f8f.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 00:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790234162; x=1790838962; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eUm9rOg0C984Igen0WAGgmsXt7jw6jEpaEmuMT/U7BQ=;
        b=yyok1QfaWhxUG6IB1dbnEe5uDtYUDg/B/TyTWoblOl30CbO6T/5rfrwnJExdIedv9A
         J2nb/pUsJk1gVpyU5xXLc8KXW548qDLVr9k+T/DrufESxY5erA07gSDhIiWsbNMo6H6O
         49y/m6+OSTj5F0ygnGBDC9Pg45wr9D2H9UZ9K9KkcYpIdv2XbJ3GrIkB+r4nnFdu3ij1
         oIxCrQADc8MeWUyo57YqFSMzs+Y1/JpXIPUkqucWh3zD6RMjzIRKZO6If0UgoVgEwLtG
         lOgpUwN+LmV7c9C4qW/Tc7o2SWmmuPKj1QAAkVCQ3cvXNKf4/xLtK3pZUWAK5ZZR6wMa
         mXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790234162; x=1790838962;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eUm9rOg0C984Igen0WAGgmsXt7jw6jEpaEmuMT/U7BQ=;
        b=meJMwWnS0N60pSHk0BungG9S1Um0iIUqpqlBjNG2xm2T94f02DMWw7eRhTZixW6Kf1
         Zc7XJX0oddcLhw+mI6k64qZ/gzD63ZTinJ90J2Ti32Mz805k3tPXjoxtctiaB3Kz/BWl
         7Iz3qakaWwOP07zmQMPEnA4XCDtqfBaIp+gEO6DOVq76WyDyoGiX55jaUqQrRxRg5NKM
         QMSs9cvU3KXJ4zSZ3zfAYLQ/i2YCYHkwEZXUG6M+R6aIAYsz4iMlaF8X/tksnbG95HFB
         2qLmM9bPBGsOO1FJMYq/z1gAcsJ2m+RJlTMj8gkvCSQ0a4hKnFiJ0s0TZmHEb3n+4Ls1
         8pUA==
X-Gm-Message-State: AFuF++mbXJ0VXPaszWRNQ3fBgZkrHEYO3X+11Zm+HrbPwbUz/Mq69ICi
	3PMUf5jKNbAsCS5cv5EE0DeZFm4jm1PQgx6asi7DyQGMVharhzvuKkCDZbXSY6Kssm/Z/PceF0U
	rXkWZWA0=
X-Gm-Gg: AYBFou2vWihXeJqLZuTo/RzATO+rC+v/wxrSNChnIuzljnJF3d1al8TT1hMzzUhiiok
	DZG1cVbUf4nqmIJvA2PKiwcgIXGz6yuGg5gR4rtGbpHUib4jcq7f5mCqDCzViRMLHNJcK+M7ASB
	wGceoTceYcAjncfRjq+et+z3k7MJaEIKTRrfwho/vguVKaCQ0slwFZuzAwJKnfMSZgB3bZX3inq
	pXnk2Lfjtl/0abHg2VZLswJLTT28ZgDHHFsf1cWtfWxjH+5auogKc/iT65X7MU0i5Xe+QEAcf+b
	XmoY45+ZuLXMcd3xVuCPgK41jaoKCIbt3CUTEfV2sGLcI20qlR0j9mcSbbayrDSErMhHjwIYdBI
	8JR+l9po7vjc0Fm7cwV3r6YzKPb171yTSWo70rfvL8HvXL/8fSSSNHsFkvU8h1L+/hDtw8kHchK
	Pc6WTQlyRFjgKrBEiS8LedO3voR9lN/clEflJjnxBQCwhm6Of634nwNyGXX125APaROKxcOwxEw
	a5Uo9zpuCdSCYQl4XxUAfnttQXv9n4MvXenm3ufVCPY2Q1/AG5Kog==
X-Received: by 2002:a05:600c:3107:b0:49f:cbad:eef7 with SMTP id 5b1f17b1804b1-49fe66fd4ddmr23936085e9.33.1790234162129;
        Thu, 24 Sep 2026 00:16:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5e86:d153:fdb4:61c0? ([2a01:e0a:106d:1080:5e86:d153:fdb4:61c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5bae43dsm44886375e9.5.2026.09.24.00.16.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 00:16:01 -0700 (PDT)
Message-ID: <a0653c34-9d30-4899-9108-ec796e73858b@linaro.org>
Date: Thu, 24 Sep 2026 09:16:00 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] iio: adc: add driver for the MAX34417 Four-Channel
 High Dynamic Range Power Accumulator
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260923-topic-sm8x50-iio-max34417-adc-v1-0-41d4ba1bfc41@linaro.org>
 <20260923-topic-sm8x50-iio-max34417-adc-v1-2-41d4ba1bfc41@linaro.org>
 <20260923191946.857761F000FF@smtp.kernel.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260923191946.857761F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/23/26 21:19, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [High] iio: max34417: division by zero in max34417_read_power() when acc_count is 0
> - [High] iio: max34417: division by zero in max34417_probe() if rsense is 0
> - [High] iio: max34417: build failure on 32-bit architectures due to GENMASK(55, 32)
> - [Medium] iio: max34417: fwnode handle leak on error paths in max34417_probe()
> - [Medium] iio: max34417: undeclared channels have uninitialized scale of 0
> --
> 
> commit 281cd76d0d1a3f010bbf1f4241c438deb9b82192
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
>      iio: adc: add driver for the MAX34417 Four-Channel High Dynamic Range Power Accumulator
>      
>      The MAX34417 is a specialized current and voltage monitor used to
>      determine power consumption of portable systems. The driver support
>      getting the channels voltage and accumulated average power over an
>      I2C/SMBUS serial interface.
> 
>> diff --git a/drivers/iio/adc/max34417.c b/drivers/iio/adc/max34417.c
>> new file mode 100644
>> index 0000000000000..004401de6ce7d
>> --- /dev/null
>> +++ b/drivers/iio/adc/max34417.c
> 
> [ ... ]
> 
>> +static int max34417_read_power(struct max34417_data *max34417,
>> +				 const struct iio_chan_spec *chan, int *val, int *val2)
>> +{
>> +	uint32_t acc_count;
>> +	uint64_t power;
>> +	uint8_t buf[8];
>> +	int rc;
>> +
>> +	guard(mutex)(&max34417->lock);
>> +
>> +	rc = max34417_accumulator_update(max34417);
>> +	if (rc)
>> +		return rc;
>> +
>> +	rc = regmap_noinc_read(max34417->regmap, MAX34417_ACC_COUNT_REG,
>> +			       &buf, 4);
>> +	if (rc)
>> +		return rc;
>> +
>> +	acc_count = buf[3] | ((uint64_t)buf[2] << 8) | ((uint64_t)buf[1] << 16);
>> +
>> +	rc = regmap_noinc_read(max34417->regmap, chan->address, &buf, 8);
>> +	if (rc)
>> +		return rc;
>> +
>> +	power = buf[7];
>> +	power |= ((uint64_t)buf[6] << 8UL);
>> +	power |= ((uint64_t)buf[5] << 16UL);
>> +	power |= ((uint64_t)buf[4] << 24UL);
>> +	power |= ((uint64_t)buf[3] << 32UL);
>> +	power |= ((uint64_t)buf[2] << 40UL);
>> +	power |= ((uint64_t)buf[1] << 48UL);
>> +
>> +	power = div_u64(power, acc_count);
> 
> [Severity: High]
> Is it possible for acc_count to be zero here? If the hardware returns 0 (for
> example, due to an incomplete conversion, I2C read glitch, or uninitialized
> state), wouldn't this div_u64() cause a division by zero panic?

Good point

> 
>> +
>> +	*val = FIELD_GET(GENMASK(31, 0), power);
>> +	*val2 = FIELD_GET(GENMASK(55, 32), power);
> 
> [Severity: High]
> Will this build correctly on 32-bit architectures?
> 
> Since GENMASK() operates on unsigned long, which is 32 bits wide on those
> platforms, attempting to mask bits 55..32 might result in an out-of-bounds
> shift and trigger compiler errors or warnings like BUILD_BUG_ON_ZERO. Should
> GENMASK_ULL(55, 32) be used instead?

Good point

> 
>> +
>> +	return IIO_VAL_INT_64;
>> +}
>> +
>> +static int max34417_read_raw(struct iio_dev *indio_dev,
>> +			     struct iio_chan_spec const *chan,
>> +			     int *val, int *val2, long mask)
>> +{
>> +	struct max34417_data *max34417 = iio_priv(indio_dev);
>> +
>> +	switch (mask) {
>> +	case IIO_CHAN_INFO_RAW:
>> +		if (chan->type == IIO_VOLTAGE)
>> +			return max34417_read_voltage(max34417, chan, val);
>> +		return -EINVAL;
>> +	case IIO_CHAN_INFO_AVERAGE_RAW:
>> +		if (chan->type == IIO_POWER)
>> +			return max34417_read_power(max34417, chan, val, val2);
>> +		return -EINVAL;
>> +	case IIO_CHAN_INFO_SCALE:
>> +		if (chan->type == IIO_VOLTAGE) {
>> +			/* Scale to mA */
>> +			*val = MAX34417_VOLTAGE_CORRECTION_SCALE * MILLI;
>> +			*val2 = MAX34417_VOLTAGE_FULL_SCALE_BITS;
>> +
>> +			return IIO_VAL_FRACTIONAL_LOG2;
>> +		} else if (chan->type == IIO_POWER) {
>> +			/* Scale to mW */
>> +			*val = max34417->input_correction[chan->channel] * MILLI;
> 
> [Severity: Medium]
> Does this expose an uninitialized scale of 0 to userspace for omitted
> channels?
> 
> Since all 4 channels are unconditionally exposed by max34417_channels, but
> input_correction is only populated for channels explicitly defined in the
> device tree during probe, userspace reading the scale for a missing channel
> might get a value of 0.

Good point

> 
>> +			*val2 = MAX34417_PWR_AVG_FULL_SCALE_BITS;
>> +
>> +			return IIO_VAL_FRACTIONAL_LOG2;
>> +		}
>> +		return -EINVAL;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +}
> 
> [ ... ]
> 
>> +static int max34417_probe(struct i2c_client *client)
>> +{
>> +	struct device *dev = &client->dev;
>> +	struct max34417_data *max34417;
>> +	struct fwnode_handle *node;
>> +	struct iio_dev *indio_dev;
>> +	struct regmap *regmap;
>> +	int rc;
> 
> [ ... ]
> 
>> +	device_for_each_child_node(dev, node) {
>> +		unsigned int correction;
>> +		u32 rsense, index;
>> +
>> +		if (fwnode_property_read_u32(node, "reg", &index)) {
>> +			dev_err(dev, "missing reg property of %pfwP\n", node);
>> +			return -EINVAL;
> 
> [Severity: Medium]
> Does this code leak the fwnode reference? Since device_for_each_child_node()
> takes a reference on the node during iteration, shouldn't fwnode_handle_put()
> be called before returning early?


Good point

> 
>> +		} else if (index >= MAX34417_CHANNEL_COUNT) {
>> +			dev_err(dev, "invalid reg %d of %pfwP\n", index, node);
>> +			return -EINVAL;
> 
> [Severity: Medium]
> Could this early return also leak the fwnode reference?
> 
>> +		}
>> +
>> +		fwnode_property_read_string(node, "label", &max34417->input_label[index]);
>> +		if (fwnode_property_read_u32(node, "maxim,rsense-val-micro-ohms", &rsense))
>> +			rsense = MAX34417_DEFAULT_RSENSE;
>> +
>> +		/* (100 milliOhm / rsense) * MAX34417_PWR_CORRECTION_SCALE */
>> +		correction = (100 * MILLI * MAX34417_PWR_CORRECTION_SCALE) / rsense;
> 
> [Severity: High]
> Can rsense be zero here?
> 
> If the device tree explicitly sets "maxim,rsense-val-micro-ohms" to 0,
> fwnode_property_read_u32() will succeed and leave rsense as 0, which would
> cause a division by zero when calculating correction.

Good point

> 
>> +
>> +		max34417->input_correction[index] = correction;
>> +	}
>> +
> 

