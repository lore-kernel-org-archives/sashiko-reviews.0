Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4793D3803C1
	for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 20:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782765722; cv=none; b=Krq0iFqNCK/c2xS9Y3l0/jUHCypcGFeVtf3GlTsx0BljqgQr4f8VN9Ehiq9zQ8gE14zaPDGKZPVAjzxjnSxxStyb6897JMsU4KuUCDASMFYh8UfzU+g9WPbJlgvxvR+/HMOB8JTX5m9W3pIqS3of92FJJ7PMi4VAheoregyq1/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782765722; c=relaxed/simple;
	bh=3W6m2W56Pc4MQqTL9khWXC22Mxn0+KEbIbk0FfGBo6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GY1abnuiXMnFF7pjpaV+v4qMGxVIaiqNoeLVQL0c7mvSF6IFDtB7+G3RzlDNAzNGL69OclR8UHsdMfhOJGauS3g3yG34mq7Hzd84L9n4saOICqXw1MJAZy4Lj6SuHuxNV4292Rs+epcz0aoLyGJnAv/dnapFRMztzTycQ4ZvD+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mzBrPP+T; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mzBrPP+T"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-30edfd9cff9so541893eec.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 13:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782765720; x=1783370520; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=geN/BbPdcW+Cts3PZsYZqanllkuBCZlJY/mSbP3HT1s=;
        b=mzBrPP+TwFTmIfTO3tZhSJ2AMt9gI7AcbGN4Zn0KexgKNUg9RjKkrbKvq6wEHXGmf2
         DXtAmyYv0GF5Vu70F2xUAsUqUup/om0yYJKT+YFz8kScJtnJ1a5QeLZ2yfyUgyVIjbxl
         ivWBPmoqOc/KJ41jzhCDP+kQN6/+oJqQWtEDgRNzhjyqK+mSBWz1i6/hMD0u35MKrmCX
         J6tYGhUixDjK1SG8gZBJf7CU/A8R8p/4GCgMnWTNdPtgynAio6cgzUwpon48/1XZ/ICN
         DU7ax/lG4N9r2IAbkm39Qz60HTTjV0DaPixqOyHIYzUSxHDwrvjkjJ9Di4ktZnHd+5do
         fQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782765720; x=1783370520;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=geN/BbPdcW+Cts3PZsYZqanllkuBCZlJY/mSbP3HT1s=;
        b=CD0pbphZGfLFVR/ZhEMdGJHqw196evqGPJPOuS0JF2TecuOaM9fe1BsGF55cEp19Qc
         j74hHVSXoRSUNZDxPGYURS38mGzfSMnC9o7xCJJ0WMeDl6P8ZltGpEWC39rWp1UDUBSW
         otM5i1f1CL3pV1GqONvbC77NdILVbV56dwYLBc26/AGWqe+/h6/f7wGHPDyWPkU1hNwL
         l4J628WwYmtwy75z7ETvBX2/2npjd9I4fBy1yIwwBXhghhmO3tvl+T67oSsBMx1hO7Jy
         3HCY00yF3INOal2GNDxDK2PrWTe9wX6EkB6zY79VjtPQPJS5J7/6bWsV1qOlL84+CygJ
         O+WQ==
X-Gm-Message-State: AOJu0Yxqcn4/EoMSmc7LWg2lgjNxN6W/Mzcsj9M/kxTat+a1ORncfc6n
	dOxoP+kzUELbtugJdKYuTcUV45Mf6CEawAIwTuj/bTjIuFFM/KPUETvBuvxM+Q==
X-Gm-Gg: AfdE7cmj2EROjlGx+U2qxiy9AXruqtE1VvSzQX/dTulp1QTfy5+5vaVhafA7JcCApOx
	2MNUxyXDqiXHnEsG68hLFolAyw8aTOmZzTf+Ah6L0LRfhZLI3Gs3k+ihnpP2RZHJjknWsvIVF+B
	TULQX19e4a+L5RXBF3f2eqvdFl3PS2QfUJk5w5t1wV/mroDm1MuovzRK5GeV4+p95PVTYZIj0oT
	16k/xPfzrJZsGvTv0BD3VQAY5ZFddMomX/xARNJ7GSJfWnRzRpHtL4BBcngBIIHjE9a6vYyRHTY
	RhhAmLWo+IUl0PDCIcms1GZ9D8IEDMtMRg3lxogRL3N2i0LdEAqNoF4284WiPn/DoEnTDDOE4ks
	eE4a5JAngQGgp4FrsgQpP7pixjVbHAhnmrLVdEzyffkzYApGeaR6RLzQUHjeff6y1dpFd7NG4vO
	cD6wDuvqs4mOcPVuH0/w9LDrxQQIqh+k83Zlz5lZyTpgE1OgTRPauiC3haJKG+3ioCSQUP6pzm
X-Received: by 2002:a05:7301:100d:b0:30c:1739:67f7 with SMTP id 5a478bee46e88-30ee1472600mr617951eec.35.1782765720285;
        Mon, 29 Jun 2026 13:42:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2f5aeb0sm915454eec.3.2026.06.29.13.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 13:41:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a9ab619a-263e-4131-aca1-26de74045562@roeck-us.net>
Date: Mon, 29 Jun 2026 13:41:58 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] hwmon: Add Eswin EIC7700 PVT sensor driver
To: sashiko-reviews@lists.linux.dev, hehuan1@eswincomputing.com
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20260625061049.1614-1-hehuan1@eswincomputing.com>
 <20260625061214.1648-1-hehuan1@eswincomputing.com>
 <20260625062201.5FCA61F00A3D@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260625062201.5FCA61F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/24/26 23:22, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Missing Hardware State Restoration after System Sleep / Runtime PM
> --
> 
> commit 90e30b4d9c6082a265da7f7091bf9e2cd31aec81
> Author: Huan He <hehuan1@eswincomputing.com>
> 
> hwmon: Add Eswin EIC7700 PVT sensor driver
> 
> This commit introduces support for the ESWIN EIC7700 Voltage and
> Temperature (PVT) sensor. The driver implements temperature and voltage
> monitoring using polynomial conversion and provides a sysfs interface
> for accessing the sensor data.
> 
>> diff --git a/drivers/hwmon/eic7700-pvt.c b/drivers/hwmon/eic7700-pvt.c
>> new file mode 100644
>> --- /dev/null
>> +++ b/drivers/hwmon/eic7700-pvt.c
> 
> [ ... ]
> 
>> +static int __maybe_unused eic7700_pvt_runtime_resume(struct device *dev)
>> +{
>> +	struct pvt_hwmon *pvt = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	ret = clk_bulk_prepare_enable(PVT_CLK_NUM, pvt->clks);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to enable clocks: %d\n", ret);
>> +		return ret;
>> +	}
>> +
> 
> [Severity: Medium]
> Does this code need to restore the hardware trim value after resuming?
> 
> The driver initializes the sensor mode and trim configuration via
> eic7700_pvt_init_iface() during probe.
> 
> If the device enters system suspend or runtime suspend and the power domain
> is disabled, the hardware configuration could be lost. Since the driver
> utilizes pm_runtime_force_resume() for system suspend paths, should this
> callback re-apply the trim values to prevent incorrect sensor readings
> upon wake?
> 

Huan He - Please take a look and fix if necessary.

Thanks,
Guenter
