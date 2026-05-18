Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6DE478E38
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 12:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779108994; cv=none; b=oOh+XMSnq7C0UcR/iEh/48c7/AOgAmHBYgQe3qCSpl0cC5b8/BY7yMatwPOYGXsF3Bp8xlNaikJc5jXBpbyiGm1Ew98mIOlUoLKBHt4QULX1lvjwib4rHpMD+a1FOM7FJwoF13B65DbMAlah7lIdCiBNwrudP67/YgNVjRlak9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779108994; c=relaxed/simple;
	bh=kco9FgaHAutdRiTPkddUHa9bLHZ0mO6w8WIhDAQ6930=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QcczNyRnTfIG9MNoYxzs7beofEK0FKZk0TklQ+gEjTYpfz/osnwqgeSA3zwiv5GY+p4aMRA+RTCgDWHpejyXgVp/oaTQIh3ulOWYCeyYo0pKcg28V1uoZRdQ8A601lfN1XBZmDM+yXYnguQX4F5XY3gOox8PXs0MLU5v1Jn/U7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RWLyViJc; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RWLyViJc"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44c350a5b87so1277385f8f.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 05:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779108991; x=1779713791; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wG5JigRzl+8hFDlaIdzHX8LNfceobFw3oJ/CoEjhnh4=;
        b=RWLyViJcnBzOi39KUKlkNIoMZVvHkSzhma/Hu9VdoPYH1snYth9i8eDtIJSO0DKAOY
         k3maHgEnpJcNGBfOBNuXT0aAhVtWUc0fkTm/sXaM96KwylMB6urw2skcX9ltVU1CyMRm
         j6p3FW8gr5sltJrY8V7nDV7sJXMyhrfzzE6CsHbG19i+UNzPWyMEnQ/Rf9HnT9MpZzVH
         Uqnid1sKiUyjXAb1v4aL++b/QkUo5TtMxftJX5RFJa3trd5DJeP14fOV41qqqsiB4u63
         pwrXAQY4zrq5OYNa9apgX4i0kMt8SrZVyvc2gG3rYEvLib4GwwFRF9wVegmeu205ZQXq
         0b/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779108991; x=1779713791;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wG5JigRzl+8hFDlaIdzHX8LNfceobFw3oJ/CoEjhnh4=;
        b=AnIN6tmBvtNWiB1mRdg9cGlBS9F3CU0tKRNHYYT36ndwhHy8LWQoWonSZXDiBd/qdW
         I52fBuM7UFnn4vCC9DRND5KXmXelSTNLx+TzDbuA9Fq6/CidmsXByYAWl9nH7UOT0p9u
         C1W4zgBh3zVKbHumPlgma7wghEklKBaTrNrMzKhWQBM/mkYf1oB0VRhWJ4tzZNpEyNtL
         eO4eLxIBGzsyaqbycimnWWfWS+Pr+HNTq+p5ugRTd5Z0DwsGUEI3NJp+joudGJR9V18X
         J2LWezO/04OycIGae3bsBMotOxYMy2J3ZOgtLzbvkZt9xNhWaofBgJlDq+69ovtAwKGD
         nnXg==
X-Gm-Message-State: AOJu0Yya33t5OM9gFqLlE52m1vsd+SEyJK+TGSWYUOB1q4jfTe/WVxLm
	4uHfvFQmv+UXucgrRbT+BEBDE0ov/EAhoWyMwviSMz5frkZSzxp4y7XqIxHTO7q4bZ2L8HFAXvn
	JbdAs
X-Gm-Gg: Acq92OHcAWagMa3PV2dnMef46X4coSdBGmBMSoC+d1i8b9J5NPU+dSM3S04og4qEgio
	D5iTPCeD7A5QPIDPnvip1cAVvPzZ9IJI4KelqOATAu8rDojiY0Y4C0VgkOEkI/PEwbBuN3gLG4Y
	GPB6vC8xIj7ga8o8aDh9Xg+1iqC1fifL6twKaB2n47wnQEYqD+V8RyNMsNQNTuNBcBQDXUwrMOw
	rYl7czibuGobI6QUmFS3/AokmJJQO4+xy/ZNNogqTEQ+P958XWSQ4r4/poaaTaY3P9Xrm+/avpU
	uJT/2mt0YevfT7q2Vhg/USCIeLdx5Rwlwpr4WWGw2AJNiUcQYdB4GEAQ6VKCWIRlUHyN2CrWT1G
	171xwsDZcpa6Vb1qK7ZygTHPhYQAGuM9UD9NJGiDrpBd+Vkht9s5GqmrH9OhH48VeK/LIRsEl4B
	O3B/xs8SMpggDQxai3RJ3+8RvNLB4B3BFCGO1OpFhMzftEz/nHmXf2pk1r6SX80tppZE8HhDOR+
	95u5uU=
X-Received: by 2002:a05:6000:603:b0:45d:3aa3:7f76 with SMTP id ffacd0b85a97d-45e5c5ebd5amr24498434f8f.33.1779108990553;
        Mon, 18 May 2026 05:56:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:1029:e3c5:362e:1250? ([2a01:e0a:106d:1080:1029:e3c5:362e:1250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm38940230f8f.23.2026.05.18.05.56.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 05:56:30 -0700 (PDT)
Message-ID: <940d7714-4303-4e82-a006-3066d2165844@linaro.org>
Date: Mon, 18 May 2026 14:56:29 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] PCI: meson: Propagate devm_add_action_or_reset() failure
To: sashiko-reviews@lists.linux.dev, Shuvam Pandey <shuvampandey1@gmail.com>
Cc: linux-amlogic@lists.infradead.org, linux-pci@vger.kernel.org
References: <177909148011.9588.6639767953842842291@gmail.com>
 <20260518082022.F4229C2BCB7@smtp.kernel.org>
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
In-Reply-To: <20260518082022.F4229C2BCB7@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/18/26 10:20, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Missing `.remove` callback or `.suppress_bind_attrs = true` leaves PCI subsystem and PHY active after driver unbind.
> --
> 
> commit fde9e1cd9d05730f72b074fa8edf3a1233d11384
> Author: Shuvam Pandey <shuvampandey1@gmail.com>
> 
> PCI: meson: Propagate devm_add_action_or_reset() failure
> 
> This commit updates meson_pcie_probe_clock() to check the return value
> of devm_add_action_or_reset(). If it fails, the error is returned so
> that the probe error path can unwind normally.
> 
>> diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
>> index 0694084f612b7..8d495bcc3a41a 100644
>> --- a/drivers/pci/controller/dwc/pci-meson.c
>> +++ b/drivers/pci/controller/dwc/pci-meson.c
>> @@ -204,7 +204,9 @@ static inline struct clk *meson_pcie_probe_clock(struct device *dev,
>>   		return ERR_PTR(ret);
>>   	}
>>   
>> -	devm_add_action_or_reset(dev, meson_pcie_disable_clock, clk);
>> +	ret = devm_add_action_or_reset(dev, meson_pcie_disable_clock, clk);
>> +	if (ret)
>> +		return ERR_PTR(ret);
> 
> This isn't a bug introduced by this patch, but could this driver be unbound
> via sysfs, triggering a use-after-free?
> 
> The meson_pcie_probe() function registers the PCI host controller via
> dw_pcie_host_init(&pci->pp) and powers on the PHY via meson_pcie_power_on().
> 
> However, the driver does not implement a .remove callback to call
> dw_pcie_host_deinit() and meson_pcie_power_off(), nor does it set
> .suppress_bind_attrs = true in its platform_driver struct.
> 
> If the driver is unbound via /sys/bus/platform/drivers/meson-pcie/unbind,
> the device core will trigger devres cleanup. This frees the mp structure,
> unmaps IO memory, disables clocks, and releases resets.
> 
> Because the PCI subsystem is never explicitly unregistered via
> dw_pcie_host_deinit(), the PCI core retains references to the destroyed root
> bus and freed structures.
> 
> Can a subsequent access by the PCI subsystem or userspace cause a
> use-after-free and system crash?

This probably a bug to fix, but totally unrelated to this change

> 
> Additionally, the PHY is left permanently powered on without its required
> clocks. Should the driver either implement a proper teardown in a .remove
> hook or prevent unbinding by setting .suppress_bind_attrs = true?
> 
>>   
>>   	return clk;
>>   }
> 

