Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A8C34D382
	for <sashiko-reviews@lists.linux.dev>; Thu,  3 Sep 2026 07:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422148; cv=none; b=ZWuI8Newc+m8ztnZKbeeqpknWYfdoeZ8BJdYk+YM0GTSqMSQWJp1wTpVJLd+6MQM7fBnorA81TbBdvLBJbxmWZ24Iy8g09Yh7iJ+LPxC6IEbDodig7fiJ0TogWR359HXOkp3+n7YBNh2lXwNffjcveL89rh7oVCMX2zvDXesEzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422148; c=relaxed/simple;
	bh=mnbqzb9ERA4GK8igaOI5fTC4Jv9DAlzqXWZI0hGg53s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gRE+7x/0bHf5ScBxdepkk0VOGFiHxlzfeuHDipjdLjMNgtcojhsif/9DmdXmF+WwQU847P7tUkYpkObxqPveVfw8YQW3bDLgkCcHIeaTZ4QtgBB9VODy3vEQ1FNdXczvVSZsAl0jtF1Y+me9RC5k068RrjuxBF5LG6Uembtgc4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t99v9MAa; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t99v9MAa"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c169ae1cb26so128666266b.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 03 Sep 2026 00:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788422145; x=1789026945; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xj0hdLwrmyHL6c7YnPWMjD7qJG9gRauJwyChCEWJXc=;
        b=t99v9MAa81U2UD2D9Qr498471ZLvJxtiCG/tgyXPrX8UxWUfS1XvdcZiLrbmyVHsc/
         0rcFsNBYcSKVgjgJ0HUsbY+A5nzAMsN7Wuicg9yJo5Rlu5/JdEFNe4ruPZwCzDF517+N
         uE+F6q4MFAa5eAxI+tnJwbXhJfx77yzKxXvEpcy68VIL5JF/xqRrOznuejoQw+iHpZjk
         DUb/e2Lhb19bU2JwnzxMNXCqx6rH9z1Y4/Ojr2j9lM/syeUOYI2mvQMCwkRwZkJ6S67M
         w1yiPOrsOOPVVtj5FKwW/xb0SWbsIbmWz/GQFteYWnLQS8nbyBNHqAjB86zk2x1K88vj
         biug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422145; x=1789026945;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6xj0hdLwrmyHL6c7YnPWMjD7qJG9gRauJwyChCEWJXc=;
        b=Y/Ok+pRkRbcHrakmq73lZsJdC2cI58XjVEI5nim+Kl2g3hUEerWPE1q86sfqGFq3Zn
         eA1JIsvW5ZT1YNgkb5TUNREOreNZHqt6pkP8GTQzdpfUTgEPvz37RULZxfhkyrHS7n2f
         KCthwGlqdifcajZBGXSGtSizz8CfhbHFhfW9Rf1CcG+mTFiaXuj87c2dKtdk/5uGITMj
         /YsiULQr1DGvRDzE6dzRwEueFEffthG/do5/uiF2/vG4XrofLONm3jIssvay+KM1MUro
         eKuKQNgpFLRt1BPqRfq2msawHsmBVsX+41wMeNgT1+nEU87QhEpQdp0fUfTLwFBYZdpi
         YBrw==
X-Forwarded-Encrypted: i=1; AKwUvBw7G5Y9eADpE0NSSLq06S8C4/kzWst2hQrKtYxn3ef3rkBCy6e4ppyy2Es5xFaOxQBZgw89mx0hoSLk2E1ljjY=@lists.linux.dev
X-Gm-Message-State: AFuF++nNgemlY29JAc2Qjt0t2AVYCv1ofh1yPdWGeeJYvKJT8G2PGl52
	kp9znJqZfnNF15IPmPWD4jb7CauLV04nLz7qnIILq2TG2ckbw88JnAZatxiOiDtzrio=
X-Gm-Gg: AYBFou3TBViPlfyOi8eeXoGzXCrgEXd6Z62/PePo2t3SUZTHmZav1jHipacnl/7ZqPn
	I9Wa7itVe5jGoDJY3Lbs9KIHhdL6x2uQg8yVI8A5VcdueOk80/8hKyPSkGVo9FY9UpSlK5Ry8/3
	UhWXDgmEQDSCHGVuhjuUOS5IktA83OjfuVYyGvV6LZgbZkWukYk+IFasSviTRQei6xI3S0pVMhG
	UKpWis82J280ihCqo9lT+WNMIf1+GtRoNDpgCEJ2VFKHX4gXaTUc3iQbk1XuOa8QLOny9po9xnP
	FN4VnKapfdQz5FkwJzktdurZEhjy2bjjj4l/ER/kN9Ph4WuSLxlAtNs29SNb91RxxHYIXmEoObE
	Kpg62bIoCy75vR/5WP/1xEZm2RKFMU10yKXl1DFAOGURn9aKPLuMqr/Tz7NJSjs56qa5S7Y7bfg
	f0W1y9pQjHdcirNbRKRetcvzKz+mREMzF+/5+cTv63tCLLJpPVZ7axO+Zi/x6Z2Z1isHpEkDIBy
	DpueJjOj2QWrK2EAtFDMPIQotEpk3FQqebf0iJKW3rg
X-Received: by 2002:a17:907:8323:b0:c25:f7dc:2e0 with SMTP id a640c23a62f3a-c25f7dc0985mr48592366b.33.1788422144446;
        Thu, 03 Sep 2026 00:55:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:bc03:561f:5dac:f48f? ([2a01:e0a:106d:1080:bc03:561f:5dac:f48f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f3eed0a9sm61359166b.1.2026.09.03.00.55.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 00:55:43 -0700 (PDT)
Message-ID: <3fc38e1c-d9cc-493c-a25a-61a8a173d987@linaro.org>
Date: Thu, 3 Sep 2026 09:55:43 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: add Xiaomi Mi Box 4 support
To: Raspberry Kan <raspberrykan@stu.hqu.edu.cn>,
 sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org,
 linux-amlogic@lists.infradead.org, conor+dt@kernel.org
References: <20260903-mibox4-dt-v1-0-f29f1e828ca3@stu.hqu.edu.cn>
 <20260903-mibox4-dt-v1-2-f29f1e828ca3@stu.hqu.edu.cn>
 <20260903073643.B92A71F000E9@smtp.kernel.org>
 <ff197003-be1d-4934-bf33-9337bc833168@stu.hqu.edu.cn>
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
In-Reply-To: <ff197003-be1d-4934-bf33-9337bc833168@stu.hqu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/26 09:49, Raspberry Kan wrote:
> First of all, I checked the device tree extracted from the stock firmware, and it explicitly describes a third pixel processor (|pp2|).
> 
> The original vendor DTS can be found here:
> https://github.com/Raspberry-Monster/MiBox4-LibreELEC/blob/misc/mibox4_gxl_tf_2g.dts#L10
> 
> It specifies three pixel processors and includes interrupts for |IRQPP2| and |IRQPPMMU2|.
> 
> I also verified this on the actual Xiaomi Mi Box 4 hardware. Lima successfully detects three pixel processors:
> 
> |lima d00c0000.gpu: pp0 - mali450 version major 0 minor 0 lima d00c0000.gpu: pp1 - mali450 version major 0 minor 0 lima d00c0000.gpu: pp2 - mali450 version major 0 minor 0 |
> 
> The corresponding |pp2| and |ppmmu2| interrupts are also registered:
> 
> |GICv2 200 Level pp2 GICv2 201 Level ppmmu2 |
> 
> The driver then initializes successfully:
> 
> |[drm] Initialized lima 1.1.0 for d00c0000.gpu on minor 1 |
> 
> So this particular S905L-based Mi Box 4 appears to use a Mali-450 MP3 configuration rather than MP2. I have not observed any initialization timeouts, reset errors, or SError failures with the third PP enabled.
> 
> As Neil mentioned above, the Mali GPU is already defined in |meson-gx-mali450.dtsi|, so this redundant definition will be removed in v2.
> 
> Thanks for the review.
> 

Sashiko is right, is it _really_ a GXLX you're running ? The S905L/GXLX does not have the PP2

could you dump the soc info ?

run:
grep ^ /sys/bus/soc/devices/soc*/*

on the device running mainline linux.

Neil
