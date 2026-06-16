Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D373DA7C6
	for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 06:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781590047; cv=none; b=gnevraXtluR/+PYNixFPn070x7a6drY0sTBik+CfqKy/n/jqgvS+qnzG/aQyc1yEMNkOSy6zDj2E5ySjm9OVrp9euqB2rmZjizkMC880I9RS5uRqpFj0gURL8kKa1XayBuDWlm6Mz//tOBxv4jmMvmlsNRNAlby9OHDKBZAoY/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781590047; c=relaxed/simple;
	bh=v1cTzgnR+l9OmcIlPG1/hyZEwlGLH5SEj4x4aVXeQJ4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=aHVr7rD9wQeU6HTv3rFlaDsUY3h0dc6hkiQ2XUl1iAca4jG1tMOpdq4tSNd4kIKvN2lvz9qOCeKo7uSOSjZcQXGNUBwg87puBmXQE4GhZ7/dL8forGokZ8ppKkWIgiKJHXQmCaXNuZMcQSvHI40eQMUxCA++HwsEqq2b5G9O4tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AB7sPPwC; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AB7sPPwC"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso26675475e9.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 23:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781590044; x=1782194844; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xoHHKRKukzaKnREbzwd66CB8l6NREbEWNDgRAiNx0fE=;
        b=AB7sPPwCBkRhkojvWB4UI3vqZuGI8b053cxzQONyRtRw3Zew+vAmtUFFCGnSXvJvDa
         f7i2BiUUowxon/M03sqjzVlAGUO4N7FrIu1yGjL+RxclOZ8DmhNTMA7ikMYvUEjAplX4
         XxfvbdWrQrB2MiOMUFNOGEVEn69TGUWDU88Hszw/Em7rlz2p9MbDFJOGRxe0OC3JeGt6
         PsJBR+R7HQH1aHia83PruC0DblXFisFmF+nb2pa9KLIATeHCFdoFEb+J7WKfu9fs8t+h
         9ccnXu4FYz7x8U+Nct3J1mUFGi4eP+U15pDLKfZ7HfqHx3+aW0pQOqwcD9K5wsi+LeZl
         B1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781590044; x=1782194844;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xoHHKRKukzaKnREbzwd66CB8l6NREbEWNDgRAiNx0fE=;
        b=HNtkM8fgZkZIuWKP8FavweGwL6KOP/wFQGu9AtJ51Np5d7QzXObt3KUU1S+ERFfsO+
         IYOI29sizAxwgupGl670iMpUKejvKysZiU44AQ8iJHBrEL27NnS2ORpHcUrnH3294wH4
         p6qEgwyNzncR+j57rNeosQWtLVezM3SACPyfF45tzYrOpQPEcqnHYdarEwvpQbM+eUCG
         nZ8vQwt/2xV3msMvzLfRYFiWYCBzmJm53ZFQKCJ0dP2UFyN4qG8/BgihkpYeR7yLhOU8
         oFbTBLT1phkkKY96f6QpK/KLO9gv1ncawh4H718jqLWhdKVTcRvpWFeFZw4nkvaSzLL8
         RONQ==
X-Gm-Message-State: AOJu0YzWUF5EVJwPzrHRB4ao2E8RmO/FIbz0JAkviX3rLCJIgMU/sDSt
	xGyMZ9E+JUXmXvJUy+yCf1mR8tX1ETjWb8q9eJln0oPq0fxLNoty0seSBL4OAyYdy1WihFFhgsk
	cky4Q7Ls=
X-Gm-Gg: Acq92OEoEYj/4Z/RYwuACoejDVSFFT3guNi6qBGiCEuVpjbvPQJIHyRgoEZhHH8FJdE
	wE+fBwNcBjCpzcfqaL6J7KRchsyifXZIGQ8E65yU4NfotDGMlOjPSr8GLJkn63KN/BWPd0ahX2t
	2aE4SDKLjjNh/rnPsz9ixdWCMvds6w+nusDj9dE8WKrH2mXrQo29DAsdZeybR/qNaq7VIevHzAe
	Bw8fCodpe5Ol8JXrurjNF9IVtaGR0HzvguhoxPWbLEM2Zn0DfSKwsd8dj0g/dSpKaRoVt3x0yBH
	7gw1FjquIbNK57HjoHLOZngDiys+H08OqhF8+3fXbwOvevwKpOHP8jg+/q6JNdRk/U3ecjvryVF
	HnMvwKgH8g1auS8x2rfYYGj4Lrex6vYLfDLCVd8i0xqbs1caZ+Z5Idz+qsRve6c+bozsnvCY+pj
	mlLjg3pGYOgvRz0N1wPKel9vQIl+eKWEhK2rPVx2YHt44=
X-Received: by 2002:a05:600d:640f:20b0:490:e180:2ed with SMTP id 5b1f17b1804b1-4922ff92614mr21627735e9.4.1781590043973;
        Mon, 15 Jun 2026 23:07:23 -0700 (PDT)
Received: from [172.20.10.3] ([37.167.117.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa96f0esm53085415e9.12.2026.06.15.23.07.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 23:07:23 -0700 (PDT)
Message-ID: <1539e5d5-7c58-4def-ad07-4c29b58ccb62@linaro.org>
Date: Tue, 16 Jun 2026 08:07:22 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] soc: amlogic: meson-clk-measure: remove debugfs tree
To: sashiko-reviews@lists.linux.dev, Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-amlogic@lists.infradead.org
References: <20260615091531.21964-1-pengpeng@iscas.ac.cn>
 <20260615092437.671C31F000E9@smtp.kernel.org>
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
In-Reply-To: <20260615092437.671C31F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/15/26 11:24, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Exposing the `measure_summary` debugfs file before initializing the `priv` pointers in the `msr_table` leads to a potential NULL pointer dereference.
> --
> 
> commit cf66aebca628dec91393028bc843130a21da66ad
> Author: Pengpeng Hou <pengpeng@iscas.ac.cn>
> Subject: soc: amlogic: meson-clk-measure: remove debugfs tree
> 
> This commit adds a remove callback to the driver to properly clean up the
> debugfs tree created during probe. By storing the debugfs root and removing
> it on driver unbind, it prevents leftover entries from referencing freed
> private data.
> 
>> diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
>> index d862e30a244ed..7ca43bcb622a2 100644
>> --- a/drivers/soc/amlogic/meson-clk-measure.c
>> +++ b/drivers/soc/amlogic/meson-clk-measure.c
> [ ... ]
>> @@ -952,6 +954,7 @@ static int meson_msr_probe(struct platform_device *pdev)
>>   	       sizeof(struct msr_reg_offset));
>>   
>>   	root = debugfs_create_dir("meson-clk-msr", NULL);
>> +	priv->debugfs_root = root;
>>   	clks = debugfs_create_dir("clks", root);
>>   
>>   	debugfs_create_file("measure_summary", 0444, root,
>>   			    priv->data.msr_table, &clk_msr_summary_fops);
>>   
>>   	for (i = 0 ; i < priv->data.msr_count ; ++i) {
>>   		if (!priv->data.msr_table[i].name)
>>   			continue;
>>   
>>   		priv->data.msr_table[i].priv = priv;
> 
> [Severity: High]
> This is a pre-existing issue, but does creating the measure_summary debugfs
> file here expose it to userspace before the priv pointers in msr_table are
> initialized?
> 
> If a user-space process reads measure_summary concurrently while the loop
> below is still executing, clk_msr_summary_show() could dereference a NULL
> pointer via msr_table->priv:
> 
> clk_msr_summary_show() {
>      struct meson_msr_id *msr_table = s->private;
>      unsigned int msr_count = msr_table->priv->data.msr_count;
>      ...
> }
> 
> Could the measure_summary debugfs file be created after the priv fields are
> fully initialized in the loop to avoid this race?

Impossible the driver is initialized way before userspace starts.

> 
>>   		debugfs_create_file(priv->data.msr_table[i].name, 0444, clks,
>>   				    &priv->data.msr_table[i], &clk_msr_fops);
>>   	}
>>   
>> +	platform_set_drvdata(pdev, priv);
>> +
>>   	return 0;
>>   }
> 

