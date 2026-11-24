Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529007;
	b=icrtRXznhbXNr0U4rIH/o340twADFfLjqvRGbGl3npskawNGyirHTxoZpEDccHTzkLwY
	 O96+/HQIrZ+Z+mlroJM/5djfFVTTGwj38poQO91ZLpOxycDSs91YPVCxz1NixVGHSa7c4
	 FB4iizVRAsrYY+nBdoHpV4OY88r9welyMUdU9zzDNahfmSpl/s1fQVlK5Q6h01DljgkRL
	 0c45v6dunmYmpGqU+T9DU0bt22SVEHCJTUcl3pU+WxU9gy23vPQBTEvozH0zVvszGjne9
	 zg9nKn7ok9VmFyx4mj63NsKJeFgqQ4SDmKNENd/3DfTBNQ/BRn0HGlGSlqkntLkK3Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=BmiCN77Aw/h7BiprF2ntlBFbL25ugi22XICBugdNRMQ=;
	b=Kyk+CYeg0dUPDTdQXPomW1+Sdnfo1BUqz/pXeY/i+LOTREQv2CN3d/uPVfVheJH+8Gau
	 2hE8OeIRoB/Hec3AbszLzlOZ/K8EFuubLQNNfKrRZC/3thZYIsrUK7C69aJc+uN13js9T
	 jPYBYuPbOkwova4yZZ9DBKAK5nY+ydShhebaev7nD2VsWB5l3N7ECs8ofIhcUtr32T09M
	 2ihjPimFhAWs0R1HLaNifUODxfTGCViA2Qiotuyjl+FVdLK7HjAz6laeA0WjNyKOS1t0V
	 H8vHabq2E4kbmKwtSmRMCNjGbUwb6EvV34UA91y66zlVrC1LiOb1BT3Jke/8ZeEUXRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Q7QQK5wh;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC990606A33B
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 14:03:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC990606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Q7QQK5wh
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c5198302d38so78666866b.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 06:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795529005; x=1796133805; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BmiCN77Aw/h7BiprF2ntlBFbL25ugi22XICBugdNRMQ=;
        b=Q7QQK5whnihvCPXNhkeZVs97GiqcQ3DKGmUZmHdh0QhEKrp4gNhgvo/PeIp69oxbiD
         708DFNAcUHm44+NhOjM1GfDfpUM9e4stdKkGGzGw+ih1wMvsT8rEpzFrcbhty852zkT8
         PPe0FdVbYScyeY2uKhVS8XnLci6XMzy/+SvFc0EGCsJTlv6YNZ8SgYVRiffgeY0hwq5O
         ceJynHGa54znig1SxlPckCFFtS6lPlR84DyLsqugyg8fP8MFT87HoreVbmlVaCFxDviQ
         3EgU6rtJl1CK+cIXmUVeM0Udut41O9Sa4mLZM8lnRKh0bv5Jo2XokCR+nctTob89gQT1
         lJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795529005; x=1796133805;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BmiCN77Aw/h7BiprF2ntlBFbL25ugi22XICBugdNRMQ=;
        b=NbjubHCs1e9C2/t4bUMI8Q+hyveZe7oZ4m5bXdQ3A34RRu6JNbZ45cr4k5LnHpyKy6
         YgDhdF21nxyS/T/PbUNBysvK53CVLrWeT27FayYO1fvjNw8T2sbzUosQCaCnWeZrYHxO
         Ql7KB3USomaU6OtX109L7RdkA0XXV3ojSCrcWSqCfpdDTf/Z6pc3XgyJfy8ol0IuYtxI
         iR7cwybcw+vtFxGdDUVS6GABjHzJlJpQYE25p5CZfPWq4dTSjVmESsCdtONwW9u/wTVJ
         UQXFGhgGSAySyJlVXKIZVTC3nKe3rIi4KI/Q62OHYQvyXu0np7906x6NnhqXcNNbHfS1
         lopA==
X-Gm-Message-State: APuU4Z8Z5Mjqv43o8iHHV/8lTHz1zqOK/Xa3lebQCunQP5WXU42x7CDA
	FyY/tUXiqNueLLBo49dEY5x+5rZdXR7emKV0NHT+a/x2isnzJIksMtm90hW3g0t0tWpl1E2JU/N
	eanBV0oI=
X-Gm-Gg: AZFdTZfxzNtFgE3auu9MZec1kF93PgWtqolR5BND1OZf9RT/J6PBR+P7OgxrSuM/vP6
	m3t0yXW7zoLEgXrYteq9IepxkxvNbtvkAcL0YNLHstNKHhmryOdbSmLXxI1W6flDW4Qohy+TxJe
	zCuhYa43iHfishWaIULXOQshiBpPJfpVn8IVIRwheg1bTKs3v2w0SxORe5VMBTWZbrXkYfkTtH1
	hX8sgEe50Hj5Jwkk9oP5Lr8Q1SHanJS0OpP7K8nj2QfRa8TdjY+Ap8ri7FH3XJt2YzQPXElPFTR
	DwR3Z9tZpfKMqffkoqwJYGapZzqpigccwJpaTigdrzvezvDuwDWMq0WlpQidQTJFAthQ1y4UmGn
	RyEwLfaSRwVr6IJK9dX79ULta/+j3pHlbkQrEEqbRY+fkMKmhiVpukvirRqmtHLJT9754eyR8tc
	5ZSnTH3yaL2e5bMxmwP0FR518EHhNmfaS3l9UM5A+MRNH/i2u77s4GFSvLootIMD0sBAIp0OWRD
	3H/ad00zkWRdkIVkHQrygK+WGTYSEgJaE3B9BcsS1xA/8QVtmS1ubCYNQSCFg2JeZfbD/GC95kt
	Tm1mZEN7U0Y7gihJM1vFzW02KNR+LuElcGp437Dd+B0tc0iW62q7fpLZVstDwwkPZ8RWYf7MMD7
	eL4QBlSrH2IWn3ZkpU1HOONuiUmwcsw==
X-Received: by 2002:a17:906:2db1:b0:c51:691:c76e with SMTP id a640c23a62f3a-c513a9abeffmr853349866b.36.1795529003374;
        Tue, 24 Nov 2026 06:03:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:ac27:24a0:7b1a:dd94? ([2a01:e0a:106d:1080:ac27:24a0:7b1a:dd94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad010a6sm528420066b.7.2026.11.24.06.03.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 06:03:23 -0800 (PST)
Message-ID: <729e2ab7-ebf2-4dd5-8c73-3e9ac1764663@linaro.org>
Date: Tue, 24 Nov 2026 15:03:21 +0100
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
Subject: Re: [PATCH v7 3/3] iio: adc: add driver for the MAX34417 Four-Channel
 High Dynamic Range Power Accumulator
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261123-topic-sm8x50-iio-max34417-adc-v7-0-d8f87edc5086@linaro.org>
 <20261123-topic-sm8x50-iio-max34417-adc-v7-3-d8f87edc5086@linaro.org>
 <sashiko-outbox-229791@kernel.org>
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
In-Reply-To: <sashiko-outbox-229791@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/26 19:02, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] iio: adc: max34417: voltage read fails on power overflow in
>    CAM mode
> - [Medium] iio: adc: max34417: stale OVF and state desync in
>    max34417_setup_cam_mode()
> --
> 
> commit bc8a43ebc9b20a80f36676c2f0db12f5485b7c1d
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> iio: adc: add driver for the MAX34417 Four-Channel High Dynamic Range Power Accumulator
> 
> This commit adds an IIO ADC driver for the MAX34417 four-channel voltage and
> power accumulator over I2C/SMBus, supporting single-shot voltage and power
> measurements as well as continuous energy and average power accumulation.
> 
>> diff --git a/drivers/iio/adc/max34417.c b/drivers/iio/adc/max34417.c
>> new file mode 100644
>> index 0000000000000..241cc9c3c2546
>> --- /dev/null
>> +++ b/drivers/iio/adc/max34417.c
> [ ... ]
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
>> +	rc = regmap_clear_bits(map, MAX34417_CONTROL_REG, MAX34417_CONTROL_OVF);
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
> [ ... ]
>> +static int max34417_save_accumulators(struct max34417_data *max34417)
>> +{
>> +	s64 acc_power;
>> +	s32 acc_count;
>> +	int rc;
>> +
>> +	rc = max34417_read_acc_count(max34417, &acc_count);
>> +	if (rc)
>> +		return rc;
>> +
>> +	if (check_add_overflow(max34417->acc_count, acc_count, &max34417->acc_count)) {
>> +		max34417->overflow = true;
>> +		goto check_ovf;
>> +	}
>> +
>> +	for (int i = 0; i < MAX34417_CHANNEL_COUNT; i++) {
>> +		rc = max34417_read_acc_power(max34417, MAX34417_PWR_ACC_1_REG + i,
>> +					     &acc_power);
>> +		if (rc)
>> +			return rc;
>> +
>> +		/* Check for overflow on local accumulators */
>> +		if (check_add_overflow(max34417->acc_power[i], acc_power,
>> +				       &max34417->acc_power[i])) {
>> +			max34417->overflow = true;
>> +			goto check_ovf;
>> +		}
>> +	}
>> +
>> +check_ovf:
>> +	rc = max34417_check_ovf(max34417);
>> +	if (rc)
>> +		return rc;
>> +
>> +	return max34417->overflow ? -EOVERFLOW : 0;
>> +}
>> +
>> +static int max34417_read_voltage(struct max34417_data *max34417,
>> +				 const struct iio_chan_spec *chan, int *val)
>> +{
> [ ... ]
>> +	rc = regmap_write(map, MAX34417_UPDATE_REG, 1);
>> +	if (rc)
>> +		return rc;
>> +
>> +	/* Save the timestamp for the next read */
>> +	max34417->last_update = ktime_get();
>> +
>> +	if (max34417->cam_mode) {
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
> Should max34417_read_voltage() fail with -EOVERFLOW when a software power
> accumulator overflows in CAM mode?
> 
> Voltage readings from MAX34417_V_CHx_REG are instantaneous 14-bit samples
> that do not depend on max34417->acc_power[] or max34417->acc_count, yet once
> max34417->overflow is set, max34417_save_accumulators() returns -EOVERFLOW
> and aborts every voltage read.
> 
> In addition, because neither max34417_read_voltage() nor
> max34417_save_accumulators() checks max34417->overflow before running
> check_add_overflow(), subsequent voltage reads continue adding into the
> wrapped max34417->acc_count and max34417->acc_power[] values.  And if
> MAX34417_CONTROL_OVF is set in hardware, max34417_check_ovf() clears it and
> writes MAX34417_UPDATE_REG before max34417_read_voltage() has read
> chan->address.

Will address that, and not fail on accumulation overflow.

> 
> [ ... ]
>> +static int max34417_setup_cam_mode(struct max34417_data *max34417, int val)
>> +{
>> +	struct regmap *map = max34417->regmap;
>> +	int rc;
>> +
>> +	if (max34417->cam_mode && !val) {
>> +		/* Reset counters and accumulators */
>> +		for (int i = 0; i < MAX34417_CHANNEL_COUNT; i++)
>> +			max34417->acc_power[i] = 0;
>> +		max34417->acc_count = 0;
>> +		max34417->overflow = false;
>> +
>> +		rc = regmap_clear_bits(map, MAX34417_CONTROL_REG,
>> +				       MAX34417_CONTROL_CAM);
>> +		if (rc)
>> +			return rc;
>> +
>> +		rc = regmap_write(map, MAX34417_UPDATE_REG, 1);
>> +		if (rc)
>> +			return rc;
>> +	} else if (!max34417->cam_mode && val) {
>> +		/*
>> +		 * If CAM mode must be set, the Control byte must be set to desired
>> +		 * values with CAM = 0, then followed by an UPDATE.
>> +		 */
>> +		rc = regmap_clear_bits(map, MAX34417_CONTROL_REG,
>> +				       MAX34417_CONTROL_CAM);
>> +		if (rc)
>> +			return rc;
>> +
>> +		rc = regmap_write(map, MAX34417_UPDATE_REG, 1);
>> +		if (rc)
>> +			return rc;
>> +
>> +		rc = regmap_set_bits(map, MAX34417_CONTROL_REG, MAX34417_CONTROL_CAM);
>> +		if (rc)
>> +			return rc;
>> +
>> +		rc = regmap_write(map, MAX34417_UPDATE_REG, 1);
>> +		if (rc)
>> +			return rc;
>> +	}
>> +
>> +	/* Save the timestamp for the next read */
>> +	max34417->last_update = ktime_get();
>> +
>> +	max34417->cam_mode = val;
>> +
>> +	return 0;
>> +}
> 
> [Severity: Medium]
> Does max34417_setup_cam_mode() leave MAX34417_CONTROL_OVF set in
> MAX34417_CONTROL_REG when toggling CAM mode after an accumulator saturation?
> 
> When a hardware accumulator saturates, the chip sets MAX34417_CONTROL_OVF
> and stops measuring until MAX34417_CONTROL_OVF is cleared followed by an
> UPDATE command.  And once max34417->overflow is set, max34417_read_power()
> and max34417_read_energy() return -EOVERFLOW before reaching
> max34417_check_ovf(), so disabling and re-enabling CAM mode is the way to
> reset accumulation.  Because both branches here only modify
> MAX34417_CONTROL_CAM via regmap_clear_bits() and regmap_set_bits(),
> MAX34417_CONTROL_OVF stays set in hardware across the reset and keeps
> accumulation halted when CAM mode is re-enabled.
> 
> Also, in the disable branch, max34417->acc_power[], max34417->acc_count and
> max34417->overflow are cleared before the I2C writes, so a failed write
> discards the accumulated data while leaving max34417->cam_mode true; in the
> enable branch, if the final regmap_write(map, MAX34417_UPDATE_REG, 1) fails,
> MAX34417_CONTROL_CAM remains set in hardware while max34417->cam_mode stays
> false.
> 

Will clear OVF on disabling and clear the accumulator after the i2c writes.
