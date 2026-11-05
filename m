Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793885018;
	b=czSWJUEkILTLARE/Hac6zy033FZFky70C6DehBafcMIW4FzUaaI3jeoeiHSk4nnjl13i
	 To4I7RuQTQleZC+663+Xe9a3SwyMEZper7gyBLpSZHpT9Ggi1KC9yuk4pwDUWiGBeJwjA
	 NXXvnA1aQPcSBopq2cBewUubyNe3RvhbIuZDmuqsIPNU3rsumr0dvlp56KUlZpAGbDUP5
	 7Eu9+J5xCEfRdMwSCuyG55TlZqLK3CZgriGLuAPc7sluPlYy0H9K2e3PpIu3ksHbNVCbk
	 2TYPu6d9JxxQoUvHns3eaLjLFM3cvInXuUubOfc0exbwPMhIdHyyALVRZq+kzrR3Oww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793885018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=tcSgyoXpYpv3jYcleunp4p8dBmT0szPkIR1F6BJiK18=;
	b=MkfIoWLMIu3RBEDTR08702zokyeU5YJedw7qPX+1Iv9rudEwaRDBAUMtAC5aXojKu7T6
	 tR+cvJ3hvVgJk34UVaeKNWN59vh8mM/EWcsa8FfxQSwmG5Yjl5H9/sKvkpkeirvtdnABN
	 oBCL9z16SGgHsAKk928Ast3+ohtFeOv8y40fTMAgjCag9EGeByc6n7yYFZkiCgrn0OVdM
	 TnUdVaGB9kB0HUa90rAQzjkTtD8oa6a5gVAZD3AnV+8gSrX9H9AMYnIWCOJy74Kwzb4Pq
	 qIri4tCoHOHx+YHNAutFK+u6kLZsxNxoh2/FcaK4LwK/6oQ+iMJOUHDTrpUXD7JlJjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OnOuQHee;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F916606D812
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 13:23:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F916606D812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OnOuQHee
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so14747665e9.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 05 Nov 2026 05:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793885016; x=1794489816; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tcSgyoXpYpv3jYcleunp4p8dBmT0szPkIR1F6BJiK18=;
        b=OnOuQHeeNZW3QF1Yz57FTG+QB7SKvDMox5e+ydLyK5RHAgZpYfg4LKx/SzYmhz9MB3
         taMOTqLx2v9n3oTAit3qLuyCMsppbdoPJSLfCd0YucIeE6FG22Xj+iOEGRVNylsDG+an
         PfrujOtuEHy3nY7U/lyGnqEqacpkYLs9NZySKR063tcETqREEF88ENrJQKFcL4tpnvEZ
         ste5St3LhupZzGlTiFW0hdqEzQl0nY+sFDYzxJuKzaYkZxIy/gM47BsbziOUvcPqF9ee
         l5raMBsJzx2Huy/vji48BKjsXLnfqDRc6noFngp7gFt6dPsvuhUVaFhUM+RxvRoYRkp6
         ukuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885016; x=1794489816;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tcSgyoXpYpv3jYcleunp4p8dBmT0szPkIR1F6BJiK18=;
        b=CU9ZIYpw13ubzfsZrOw8TGUKaJm1gMKzVcF/giNodp2BZ/Lv3KLi0+dgW1WByaeikx
         UDEiafBh6wF7r3fHRRTfPSpzKKg4HVhjcuGfvV+U/LXyluToUqDOI3laEkH01FVG5NSA
         Hp164N/vsWqVQLhX0+nr1EWMVHnEmtVkhg96RtruzW8fyHzQP6f44W0MxFIoBcN+/NVb
         XwjBu05B5LhgHb3INwRxlSCuIfoKPDo1Ug0KwH7DP6xm8xDtJkB1euT4ohDpHYCTIEvW
         gekdOA0vuZlsciWxUG+KXkEoGnA5kA2T1qUGMn0I35BHjXkwUWQkClasXYT4tsuHQ8eB
         WD6A==
X-Gm-Message-State: APuU4Z9utDc+uvxEjElBEFbxLvqyGeo5wZBzktKBIYPeqZGkm0g43LJM
	eT1IHFaj6MM0ttHSUdzwrkm93cUwVareg1d0eZAWh6NlO2MfLqyqO32ANnqN0yj5NLtur8UQwOj
	MKljv
X-Gm-Gg: AYBFou0vkTWQipoJwL7yRG6o75NQ/CbAH1a6ICwD+JTOtTEqhNSYkkMF3Cc7JC1umz3
	jBx4HeG4dnvZYoZ7rMqSlKWMFwlIyzvdrBzyZxErLsAmjBQ+ruWaD2JwhUarcVfc4lMqJV9edEU
	s4MTx0ZlSTL2WqAgASXpRJuVh+j8K/5vHtdzQyuF6eC0z/eQZCOE5jcM7/rbPyppbtq5I5ctI98
	Z6D2tDhX4snXdLJTW+mTX48bQ7WLfRTVO83irdJoS9f1IXoBau5zmDvzrvWoyQBr2C6kvXG/7zL
	I8+t97hVt3wot285z9g1RUhFZIEyxPYIYsGwxusJMrnxzLTSt6gNTWSaUfflg/LRiYh1wfjfJk3
	HL+UTuHwA59o9xg6BTs9m29TUKrxMSFgHobaxQ/DCcEzAqVNTSxS0nIi5LDDPy0S8VQFm9OwuVw
	AchXJ6bE/8xDSh/Tc6RS0JWTt9hB2VnKJXa1sRE/O85J4c1Hg0FVp9FN1/9kDatK8GVuGLkCKDH
	xeiHcz9KjoTGeDznFggUrq1oriMjma9qmlivU4FUFSUCi0luUc/0EbRKjzmisGCXNI8dzD5xu/1
	dZKfkRSh2x+jB8FPoDAdPukT5Zc51R4bbABAwN3RqTWUFOu6DEKnw7AJk6A14Le8Hieqn50MQHn
	wmwiR4yg=
X-Received: by 2002:a05:600c:3ba0:b0:4a1:e0db:8cf8 with SMTP id 5b1f17b1804b1-4ac151a84f0mr429524235e9.3.1793885015401;
        Thu, 05 Nov 2026 05:23:35 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9899:e54b:a2f2:3695? ([2a01:e0a:106d:1080:9899:e54b:a2f2:3695])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e2ae73csm68119975e9.1.2026.11.05.05.23.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 05:23:34 -0800 (PST)
Message-ID: <ae1fd659-7d29-4772-b4ee-0e4c821389b9@linaro.org>
Date: Thu, 5 Nov 2026 14:23:33 +0100
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 3/3] iio: adc: add driver for the MAX34417 Four-Channel
 High Dynamic Range Power Accumulator
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261105-topic-sm8x50-iio-max34417-adc-v6-0-63b4e8279633@linaro.org>
 <20261105-topic-sm8x50-iio-max34417-adc-v6-3-63b4e8279633@linaro.org>
 <sashiko-outbox-199091@kernel.org>
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
In-Reply-To: <sashiko-outbox-199091@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/5/26 14:00, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Medium] iio: adc: max34417: energy scale underflows to zero in max34417_read_raw()
> - [Medium] iio: adc: max34417: shared accumulators clobbered on CAM power/energy read
> - [Medium] iio: adc: max34417: missing 1 ms delay and premature UPDATE on read/setup
> --
> 
> commit b2b3b8bbfcafc2973680f358dc7e0d74750a2a05
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> iio: adc: add driver for the MAX34417 Four-Channel High Dynamic Range Power Accumulator
> 
> This commit adds an IIO ADC driver for the Analog Devices MAX34417
> four-channel power accumulator, supporting single-shot voltage and power
> readings as well as continuous accumulation mode for average power and
> energy measurements over I2C/SMBus.
> 
>> diff --git a/drivers/iio/adc/max34417.c b/drivers/iio/adc/max34417.c
>> new file mode 100644
>> index 0000000000000..f12d0e8ef1a68
>> --- /dev/null
>> +++ b/drivers/iio/adc/max34417.c
> 
> [ ... ]
> 
>> +static int max34417_check_ovf(struct max34417_data *max34417)
>> +{
>> +	struct regmap *map = max34417->regmap;
>> +	u32 control;
>> +	int rc;
>> +
>> +	rc = regmap_read(map, MAX34417_CONTROL_REG, &control);
>> +	if (rc)
>> +		return rc;
>> +
>> +	if (!(control & MAX34417_CONTROL_OVF))
>> +		return 0;
>> +
>> +	rc = regmap_clear_bits(map, MAX34417_CONTROL_REG,
>> +			       MAX34417_CONTROL_OVF);
>> +	if (rc)
>> +		return rc;
>> +
>> +	rc = regmap_write(map, MAX34417_UPDATE_REG, 1);
>> +	if (rc)
>> +		return rc;
>> +
>> +	/* Save the timestamp for the next read */
>> +	max34417->last_update = ktime_get();
>> +
>> +	return 0;
>> +}
> 
> [ ... ]
> 
>> +static int max34417_read_voltage(struct max34417_data *max34417,
>> +				 const struct iio_chan_spec *chan, int *val)
>> +{
> 
> [ ... ]
> 
>> +	/*
>> +	 * Move the new UPDATE data into the SMBus read registers.
>> +	 * This will also reset the accumulators, returning the
>> +	 * power accumulated since the last UPDATE.
>> +	 */
>> +	rc = regmap_write(map, MAX34417_UPDATE_REG, 1);
>> +	if (rc)
>> +		return rc;
>> +
>> +	/* Save the timestamp for the next read */
>> +	max34417->last_update = ktime_get();
>> +
>> +	if (max34417->cam_mode) {
>> +
>> +		/* Retrieve all channels to avoid missing data for other channels */
>> +		rc = max34417_save_accumulators(max34417);
>> +		if (rc)
>> +			return rc;
>> +	}
>> +
>> +	rc = regmap_noinc_read(map, chan->address, &buf, sizeof(buf));
>> +	if (rc)
>> +		return rc;
>> +
>> +	/* Ignore first byte which contains the Byte Count & data starts at Bit 2 */
>> +	*val = get_unaligned_be16(&buf[MAX34417_VOLTAGE_READ_OFFSET]) >> 2;
>> +
>> +	return IIO_VAL_INT;
>> +}
> 
> [Severity: Medium]
> As reported by Sashiko on v5 [1], in drivers/iio/adc/max34417.c, can the
> MAX34417_UPDATE_REG sequencing in max34417_check_ovf(),
> max34417_read_voltage(), and max34417_setup_cam_mode() violate the 1 ms
> minimum interval between UPDATE commands or overwrite latched voltage data?
> 
> In max34417_read_voltage(), max34417_read_power(), and
> max34417_read_energy(), the caller writes MAX34417_UPDATE_REG and then
> immediately calls max34417_save_accumulators() -> max34417_check_ovf(). If
> MAX34417_CONTROL_OVF is set, max34417_check_ovf() clears OVF and writes
> MAX34417_UPDATE_REG a second time without waiting 1 ms after the caller's
> UPDATE command.

Yes because the measurement has stalled, so it's ok here.

> 
> Furthermore, in max34417_read_voltage(), max34417_save_accumulators() is
> called before regmap_noinc_read(map, chan->address, &buf, sizeof(buf)). If
> MAX34417_CONTROL_OVF was set because an accumulator saturated and stopped
> measuring, won't the second UPDATE write inside max34417_check_ovf()
> overwrite the latched SMBus registers before the voltage register is read?

No

> 
> Similarly, in max34417_setup_cam_mode():
> 
> 	} else if (!max34417->cam_mode && val) {
> 		rc = regmap_clear_bits(map, MAX34417_CONTROL_REG,
> 				       MAX34417_CONTROL_CAM);
> 		if (rc)
> 			return rc;
> 
> 		rc = regmap_write(map, MAX34417_UPDATE_REG, 1);
> 		if (rc)
> 			return rc;
> 
> 		rc = regmap_set_bits(map, MAX34417_CONTROL_REG, MAX34417_CONTROL_CAM);
> 		if (rc)
> 			return rc;
> 
> 		rc = regmap_write(map, MAX34417_UPDATE_REG, 1);
> 
> the function does not check max34417->last_update before its first write to
> MAX34417_UPDATE_REG, and when enabling CAM mode it writes
> MAX34417_UPDATE_REG twice back-to-back without a 1 ms delay.

No because changing the mode will reset the counters, the 1ms is only
to get valid data between UPDATE commands, not configuration changes.

> 
>> +static int max34417_read_power(struct max34417_data *max34417,
>> +			       const struct iio_chan_spec *chan,
>> +			       int *val, int *val2)
>> +{
> 
> [ ... ]
> 
>> +	if (max34417->cam_mode) {
>> +		s64 acc_count;
>> +		s64 acc_power;
>> +
>> +		/* Retrieve all channels to avoid missing data for other channels */
>> +		rc = max34417_save_accumulators(max34417);
>> +		if (rc)
>> +			return rc;
>> +
>> +		if (max34417->overflow[chan->channel]) {
>> +			max34417->overflow[chan->channel] = false;
>> +			max34417->acc_power[chan->channel] = 0;
>> +			max34417->acc_count[chan->channel] = 0;
>> +			return -EOVERFLOW;
>> +		}
>> +
>> +		/* Get current channel power, counter and reset them */
>> +		acc_power = max34417->acc_power[chan->channel];
>> +		acc_count = max34417->acc_count[chan->channel];
>> +		max34417->acc_power[chan->channel] = 0;
>> +		max34417->acc_count[chan->channel] = 0;
>> +
>> +		if (acc_count == 0) {
>> +			dev_warn_ratelimited(&max34417->indio_dev->dev,
>> +					     "unexpected zero accumulator count\n");
>> +			power = 0;
>> +		} else {
>> +			power = div64_s64(acc_power, acc_count);
>> +		}
>> +	} else {
>> +		rc = max34417_read_acc_power(max34417, chan->address, &power);
>> +		if (rc)
>> +			return rc;
>> +	}
>> +
>> +	iio_val_s64_decompose(power, val, val2);
>> +
>> +	return IIO_VAL_INT_64;
>> +}
>> +
>> +static int max34417_read_energy(struct max34417_data *max34417,
>> +			       const struct iio_chan_spec *chan,
>> +			       int *val, int *val2)
>> +{
>> +	struct regmap *map = max34417->regmap;
>> +	s64 delta_us = ktime_us_delta(ktime_get(), max34417->last_update);
>> +	s64 acc_power;
>> +	int rc;
>> +
>> +	/* Sleep up to 1msec to make sure we have a measurement cycle done */
>> +	if (delta_us >= 0 && delta_us < (1 * USEC_PER_MSEC))
>> +		fsleep((1 * USEC_PER_MSEC) - delta_us);
>> +
>> +	/* Move the data to the SMBus registers */
>> +	rc = regmap_write(map, MAX34417_UPDATE_REG, 1);
>> +	if (rc)
>> +		return rc;
>> +
>> +	/* Save the timestamp for the next read */
>> +	max34417->last_update = ktime_get();
>> +
>> +	/* Retrieve all channels to avoid missing data for other channels */
>> +	rc = max34417_save_accumulators(max34417);
>> +	if (rc)
>> +		return rc;
>> +
>> +	if (max34417->overflow[chan->channel]) {
>> +		max34417->overflow[chan->channel] = false;
>> +		max34417->acc_power[chan->channel] = 0;
>> +		max34417->acc_count[chan->channel] = 0;
>> +		return -EOVERFLOW;
>> +	}
>> +
>> +	/* Get current channel power and reset them */
>> +	acc_power = max34417->acc_power[chan->channel];
>> +	max34417->acc_power[chan->channel] = 0;
>> +	max34417->acc_count[chan->channel] = 0;
>> +
>> +	iio_val_s64_decompose(acc_power, val, val2);
>> +
>> +	return IIO_VAL_INT_64;
>> +}
> 
> [Severity: Medium]
> As reported by Sashiko on v5 [2], when cam_mode is enabled in
> drivers/iio/adc/max34417.c, won't reading average power in
> max34417_read_power() and reading energy in max34417_read_energy() clobber
> each other's state for the same channel?
> 
> Both functions consume and zero the shared per-channel fields
> max34417->acc_power[chan->channel], max34417->acc_count[chan->channel], and
> max34417->overflow[chan->channel]. As a result, reading in_powerX_mean_raw
> discards the energy accumulated in software for channel X since the last
> energy read, and reading in_energyX_raw resets the accumulated power and
> sample counter needed for the next average power calculation (as well as
> resetting the energy reading itself on every read instead of accumulating
> monotonically while CAM mode is enabled).

No, the hardware works like that, when calling UPDATE it resets the accumulators,
so this simply emulates the hardware by accumulating in software for the other
channels to avoid data loss.

> 
> [ ... ]
> 
>> +static int max34417_read_raw(struct iio_dev *indio_dev,
>> +			     struct iio_chan_spec const *chan,
>> +			     int *val, int *val2, long mask)
>> +{
> 
> [ ... ]
> 
>> +		case IIO_ENERGY:
>> +			/*
>> +			 * Scale to Joules
>> +			 * P=((Power Accumulation / Counter) * Correction) / 2^30
>> +			 * t=(Counter / Samples per Second)
>> +			 * E=(P * t)
>> +			 * Can be simplified to:
>> +			 * (Power Accumulation * Correction) / (2^30 * SPS)
>> +			 * But the denominator won't fit in 32bit and is not power of 2.
>> +			 * But we can divide the numerator by SPS and shift both terms
>> +			 * by a large power of two number and still use IIO_VAL_FRACTIONAL_LOG2
>> +			 */
>> +			*val = div_u64(max34417->input_correction[chan->channel] << 19,
>> +				       MAX34417_FAST_SPS_CAM);
>> +			*val2 = MAX34417_PWR_AVG_FULL_SCALE_BITS + 19;
>> +
>> +			return IIO_VAL_FRACTIONAL_LOG2;
>> +		default:
>> +			return -EINVAL;
>> +		}
> 
> [ ... ]
> 
>> +static u32 max34417_calc_input_correction(u32 rsense_uOhm)
>> +{
>> +	/* Derived from Table 14. Correction Factors for Various Current-Sense Resistor Values */
>> +	return (MAX34417_MAX_RSENSE * MAX34417_PWR_CORRECTION_SCALE) / rsense_uOhm;
>> +}
> 
> [Severity: Medium]
> As reported by Sashiko on v5 [3], doesn't the IIO_ENERGY scale calculation in
> max34417_read_raw() underflow to zero in sysfs for almost all supported
> shunt resistor values?
> 
> In max34417_probe_channel_node(), shunt-resistor-micro-ohms is accepted in
> the range 1000 to 100000 micro-Ohms. max34417_calc_input_correction()
> computes 2400000 / rsense_uOhm with integer division (which also truncates
> non-integer correction factors such as 2400000 / 90000 = 26 instead of
> 26.667), yielding input_correction in the range [24, 2400].
> 
> In max34417_read_raw() for IIO_CHAN_INFO_SCALE on IIO_ENERGY, *val is in the
> range [8192, 819200] and *val2 is 49 with IIO_VAL_FRACTIONAL_LOG2. When
> __iio_format_value() in drivers/iio/industrialio-core.c formats
> IIO_VAL_FRACTIONAL_LOG2:
> 
> 	case IIO_VAL_FRACTIONAL_LOG2:
> 		tmp2 = shift_right((s64)vals[0] * 1000000000LL, vals[1]);
> 		tmp0 = (int)div_s64_rem(tmp2, 1000000000LL, &tmp1);
> 
> because 2^49 is 562,949,953,421,312, any rsense_uOhm >= 1456 micro-Ohms
> produces vals[0] <= 562517, so (s64)vals[0] * 1000000000LL < 2^49 and tmp2
> becomes 0, causing in_energyX_scale to read as 0.000000000. Even at 1000
> micro-Ohms, tmp2 truncates to 1 (0.000000001 instead of 0.0000000014551915,
> losing 31.3% precision), and in-kernel consumers such as
> rescale_process_scale() in drivers/iio/afe/iio-rescale.c cast ULL(1) << *val2
> to int, truncating 1ULL << 49 to 0. Would returning a 64-bit decimal scale
> type such as IIO_VAL_DECIMAL64_FEMTO via iio_val_s64_decompose() avoid this
> underflow?

Good point, will return FEMTO based value.

Neil

> 
> [1] https://lore.kernel.org/r/20261102-topic-sm8x50-iio-max34417-adc-v5-3-0ffa5e5f2d5c@linaro.org
> [2] https://lore.kernel.org/r/20261102-topic-sm8x50-iio-max34417-adc-v5-3-0ffa5e5f2d5c@linaro.org
> [3] https://lore.kernel.org/r/20261102-topic-sm8x50-iio-max34417-adc-v5-3-0ffa5e5f2d5c@linaro.org
> 

