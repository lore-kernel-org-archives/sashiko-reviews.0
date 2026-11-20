Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169535;
	b=sbCF+C2nF9V+BbQG6Pmw+0R4RCuE9rUjNw5YcyAeHzZGqTc5RwNTuviP3n6+NoU6fOdL
	 BsKVhyBiB5c2oV4yT+bCnVAl8E9FAkG0kp6Y1yEsEDqgudpH0UM+5CKe/365E3QmsTcoa
	 OLEPgqsmok6eJVCdOzGhURyuR1MFh2pcX92vQEYpl5VOLZdDz/H2CcQOXzfNlhYmI2W7P
	 orN+AlSm0mFLs4gCIVXf3o4K7cCTt3lEdZUCLtAU+vZ6agqbM2qD9bQduH4aBTu7V+fza
	 yylO5lZC2J5+tvarVRJFwpd+VfCpKH5CAe/BRUFvDT7WrYHgKFYffNuGm+NCwymiL0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=1iioZKyiZ1smpGmNtr7VhCZmPi7MGt2pcm7kels3/ok=;
	b=DS+dyuSadS2sdLqLZ8W73RpiiAvvPiqOuS9+kP6rrSTcM+f5XXfH0/JBa5Oar7N0+qo7
	 Pf/5La2fXsAk5B5qECGK7vb+6QLHy4VUSJeTmLlNxJNXNefb6gTyBaFqoTx2g74enP0nc
	 ivGOhTXVdngfSR2GuFc6XeTMUx96jFlrWNUy3zoDAUK2u7yej83obRJOpxlOAx5gX3xGw
	 OdmHkpMfVQYWjtB/9LWKQkIyHD8Xv8EVPctFv9Hpz/2AiucoOdXbD5JF8AFSpmAn2oT+l
	 P1xMT39ohF1zqrQVTZhSFQJa8kVy3TpgGPjEDGDyScVKWsAccca6Vbv9krWlxz0dzvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=g33zvb0M;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7472606A336
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 10:12:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7472606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=g33zvb0M
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso427732f8f.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 02:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795169533; x=1795774333; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1iioZKyiZ1smpGmNtr7VhCZmPi7MGt2pcm7kels3/ok=;
        b=g33zvb0MepbpL8V6lM1PJ9qcjzjgLpFdW5/rN/CGxKkmxCsYHlOmBpJDCNqmBMDnJB
         6mOTOsxRFfQWQtBKBmIO94Tr3qH0soOfw0+phcvB/rZrf5UvHt2d6LAGBuJ0CQgz4Tmf
         NkdZRVlS6nwY5wmSJgnYcSLNgfuefepohwCdltt7xuEoyqltTnHcwNVo+HrbjHo3lMaB
         Aw9aoO1c75yaN0OK8ChY3l91MHoihjtT9JbplFJtlSdz/jMwW2F47QUPRbE7wtw045/7
         klM+hzGbG2h7RK6vhdx++7+sT5P3pdbrMLyXn3BApDjDuDlw9JQ+hwukvlLMm2FvkKEs
         eO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169533; x=1795774333;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1iioZKyiZ1smpGmNtr7VhCZmPi7MGt2pcm7kels3/ok=;
        b=M06urnkWRcliyPIIv4mitCwXiI0V+TdFX30uikYn+/+mh1aaH1Y47ow3O/oE2amG2V
         RaJl832kdbUTfX8k9YuoAM+4KOYQ17Yb5HfCYZkomARZmEj3AbRrqNjP1bLdxil+qOGM
         IedsLlQvoys/oXYU5umellaigmsocUUr7vdjCfnPwcvZjTugPCv3l8pnLN9WO5waymDE
         K1c2dG6tHNB2Tt2MN1apX5qLDZVcr0xp0YUAQChwRVB0Q6GoRjlWUm+Rvx/YpFnwDV6f
         8Qw7vkjaLmbHw8OCCmVNYNSQqRIZECnC1u5bvtWMwHV8DTOjrO3jmHwlvmjrg6ypgyL2
         ho2Q==
X-Gm-Message-State: APuU4Z99MWXIe4k8wKrcf0YTrB9gs4YA4DKersDQoVrlP8umaMEm8vOI
	mEVyaaohieUS1DQmHQELVhYPF53yCkIxuW3i3cWl7rLSYAdjDMdFUTVBlyb7Duw8bYYjQQBBGCV
	GHrdlptE=
X-Gm-Gg: AZFdTZdqcLNYTi1GAorUkwLmCt71xi5sMH5EXDk3j1OuZuc1eFfEDkrxEkiDP/VlIRV
	r/Cm/ayIfTXh9kXWVo6SYyQCmhpgK/rJJUBWhxNk/7Yc+M3ZLl1/q+Sho7j7PZ1ivRlyRN+1Lr2
	DQlNBHBDK6LS/n52Da1jfYW86OfLcCCIX0o/cAe6G9THpq34O1Q0a42auhqmHhU7rZcg0uUi2kY
	6VI18sNgqrqCS9lE5+q9d4fGLks4qk8wV9V200dgiA3J6RQ2RDQP98aN4t6CRKbLooQfA/scwNf
	ISaROE9AJKf5T91GWQS6wAhTqJxc9tBdTkJFsXuYtUdZmdaIndYa+gS749O44JUvh8WTanypfUQ
	FzpAJfh+4wEkPp9zM/4USvm+svy5O1CvVhObDnU0CziSWvqGE5FbwfGucR9Pu+QoUWsffL/4/RY
	+zEkKHk/4Wxp5BPTKpJUc590q1OCpC6wKvI1/IOZ1ntrp9J50h4gN9oDB59NQs8eB0l+2oLUJat
	eMzI+kYfviKMKVEzlKAm9tVEIY58c2KIaW7rjLDjHyWhnovZoPm193/+wGKHdfVphotuyDNoOzq
	d9BoACBjEo+zW8bMCXAV8rQ6OIRafvdqw9wJgcJ9esg2WrWz9r3LNTuDprH2ckSMmxCBglm1iSd
	s7jleK86pNA==
X-Received: by 2002:a05:6000:40ca:b0:4a3:976e:27a2 with SMTP id ffacd0b85a97d-4abb5146238mr4771515f8f.34.1795169532973;
        Fri, 20 Nov 2026 02:12:12 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:3374:165a:45ca:24fb? ([2a01:e0a:106d:1080:3374:165a:45ca:24fb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf680fsm5235224f8f.14.2026.11.20.02.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 02:12:12 -0800 (PST)
Message-ID: <09c5bd80-763d-4de5-89af-0f5b6350745f@linaro.org>
Date: Fri, 20 Nov 2026 11:12:12 +0100
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
Subject: Re: [PATCH 2/2] usb: typec: tcpm: unregister stale partner sink
 capabilities
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
References: <20261120-topic-tcpm-core-fixes-v1-0-c753d1d286bb@linaro.org>
 <20261120-topic-tcpm-core-fixes-v1-2-c753d1d286bb@linaro.org>
 <sashiko-outbox-224904@kernel.org>
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
In-Reply-To: <sashiko-outbox-224904@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/26 11:03, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] usb: typec: tcpm: unregister after register in
>    tcpm_register_sink_caps()
> --
> 
> commit bce11ccecca861664b61850ba73a6eebf8702e1e
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> usb: typec: tcpm: unregister stale partner sink capabilities
> 
> This commit unregisters existing partner sink capabilities in
> tcpm_register_sink_caps() when new Sink_Capabilities are received.
> 
>> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
>> index 1d007e59a2bf9..c5a4c0b6da16f 100644
>> --- a/drivers/usb/typec/tcpm/tcpm.c
>> +++ b/drivers/usb/typec/tcpm.c
>> @@ -3563,6 +3563,8 @@ static int tcpm_register_sink_caps(struct tcpm_port *port)
>>   	if (IS_ERR(cap))
>>   		return PTR_ERR(cap);
>>   
>> +	if (port->partner_sink_caps)
>> +		usb_power_delivery_unregister_capabilities(port->partner_sink_caps);
>>   	port->partner_sink_caps = cap;
>>   
>>   	return 0;
> 
> [Severity: High]
> Should port->partner_sink_caps be unregistered and cleared to NULL before
> calling usb_power_delivery_register_capabilities(), as in
> tcpm_register_source_caps()?
> 
> Because the old sink-capabilities child device is still registered under
> port->partner_pd when usb_power_delivery_register_capabilities() runs,
> device_register() fails with -EEXIST and tcpm_register_sink_caps() returns
> early at IS_ERR(cap) before reaching the unregistration.
> 

Exact, will move it right before.
