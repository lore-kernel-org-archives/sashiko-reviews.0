Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79D442089D
	for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 10:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785234116; cv=none; b=MVf5HQUD9mQfZPT/4k1qthVFMipSehmzBAd6beGizMa7hYivw3tnTbTY3xZe34rrasSFLkSB5u2QrtunbhPR9HyCuqxj0kjvpvv4i6ObjP7qEPxdVrZT9XISk+t+EIcEArPW7D8H6aWsDikSNd4mm/wKQuc0sahVBNCSWXscT6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785234116; c=relaxed/simple;
	bh=Z140N4DvbE9EARvKoaKN/y8p/SDNEcqELF71ArNYrwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aq7NlVQuZ+9dRsUPLXX3lWIFOuJ69attu9wWCmI9FVpy48bcAqpkM0UACcWD4Hnv221cN0mY2t5T6EcmLE260ZS8sPFu6WNrvlZdV4PCoSkQn4+vQVnBTdM3OXLNSqKdjj8YaOWc7PtBK+5rNvDLaCufl8JbhnUR1vS6lSN4X0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IGdgGSGM; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IGdgGSGM"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-69fec980a30so2426376a12.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 03:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785234113; x=1785838913; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YVzux6UVfcA+2FPkP8ofIMape/wgcKMMpR+shB5OFes=;
        b=IGdgGSGMZlPLmM2jAkK+36K1xsCMImz+ED1AxG6b3FXKdM4MUmp7wUpMcNaZBlRj4V
         ig6dW8weR5Pg8Vo1OSeOPft1GgzO+EsihXN6JhjstAYcbkzIJq6I23O8xeheOY66hVwy
         GcLoHxETfRBTjOTz9cDx2xd4L1Owr49RNkRL2PlH2p2i9hB64l7koXlChSGBCpv8bslj
         ni/gXyOKwMReVqc67JPuZmKSyoCCFoQz1JwUvpZ02CzokaNGeQvGbuRFhd7s+IgBE+lA
         tSJsMCobIEQlKs/BYZb+HUgl6QQV/+05C1MEn8VJNHqSJmTvzxrLhHY9I3ru8C/sbk9h
         xbrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785234113; x=1785838913;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YVzux6UVfcA+2FPkP8ofIMape/wgcKMMpR+shB5OFes=;
        b=dbzwc98R2+eo45kU2oidUtOq2g284wQEMzPpAH7QEtCfnuQE7+310SHwr7weEc68/7
         KYxeOEyTIPzscfX9e6zxpSXeQlitS8kJcCuYi7VLbj4sBxZTIwnSenoPPND9kVO5D4l3
         xIBV194iBQO8zeaNywNexGCyRr05iZDvwVtUdCXooYBHFkalYDjulIMRXLVGv5f/0H/Y
         KaU3wNwVlXQXJsOvYJFxrIhlCGeVrpdo1qRLWB3kaNq5mHpnvDykz6Rayvm4IhqtiRq7
         u45kqyNsPk3XmnVCf5o32w/WYA7UzNBh1YPnQxx4IbxM361Hgjmlxfkljce3U0iaPIl/
         hsmg==
X-Gm-Message-State: AOJu0Yzrc3MkT9B3FBihwmDD5B5CXZGZ1KWgIBvGSS1mjyqzkfg7aLhD
	krHAbzwVrlnRaUuMHWj3vz5Qkytjy200b0RrYfHqeG0HEZ8Kc9zyoNPNYMO6lYHs7HQLuc/L9pN
	igHqqBmk=
X-Gm-Gg: AR+sD11DRKlUKVk/Dtasmc+pXzncr/msiiLq4i5xLioFXwV352vbcwCV2i/bFI6hh3t
	MfDNA7z1jwgCoIql5ZAnID0FI3BlhDAmxuRuW+qtg/TLMWC2jFuS/oxXSnlpEHGaHc1G2D5S/AU
	UBxDVv28WT0bLcx5LAZiijb/YiS8zsl27xyCh+WPL3wi6Jd9v+JmNGm2HWuCSzOsFEsrfFnhJgR
	XHQbU5cYjoXhoBzkYYNLboYTIwSOI9KGda7FwXiFV8lgeJG0rWGusXZvTVyBk2sTM7rQvOfCL7x
	+LPIe3NEZuRqECEcYET4rR+9hNPU0dOuwAyAnDoWvZXL7y4fKWX2c5zJnunyyEJF65tVFGM+a48
	aA63c9K2sWA/ZDENFhlrrm3SZ7YwAdGgmdwzZtrmLIEpnE/2k/3tmgefwWZdXFC8b7Qwi82zTFI
	ixxtRZP5NzlDNN/w==
X-Received: by 2002:a17:907:ea6:b0:c16:1901:6ba1 with SMTP id a640c23a62f3a-c1f720f92f1mr101362666b.34.1785234112728;
        Tue, 28 Jul 2026 03:21:52 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.204.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ac7eacsm751144366b.17.2026.07.28.03.21.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 03:21:52 -0700 (PDT)
Message-ID: <4dcc3b8c-8702-4d23-91f2-e3f84567dee4@linaro.org>
Date: Tue, 28 Jul 2026 11:21:50 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 2/5] phy: core: Add devm_phy_get_by_of_node()
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, robh@kernel.org, devicetree@vger.kernel.org,
 vkoul@kernel.org, olteanv@gmail.com, conor+dt@kernel.org,
 media-ci@linuxtv.org, linux-phy@lists.infradead.org
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
 <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-2-ae811e2f0799@linaro.org>
 <20260728094717.DD9A61F000E9@smtp.kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260728094717.DD9A61F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/07/2026 10:47, sashiko-bot@kernel.org wrote:
>> +struct phy *devm_phy_get_by_of_node(struct device *dev, struct device_node *np)
>> +{
>> +	struct phy **ptr, *phy;
>> +	struct device_link *link;
>> +
>> +	ptr = devres_alloc(devm_phy_release, sizeof(*ptr), GFP_KERNEL);
>> +	if (!ptr)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	phy = phy_get_by_of_node(np);
> [Severity: High]
> This is a pre-existing issue, but does a TOCTOU race condition exist in the
> underlying phy_get_by_of_node() that could lead to a use-after-free here?
> 
> Looking at phy_get_by_of_node(), it calls _of_phy_get_with_args() to look up
> the PHY. Inside _of_phy_get_with_args(), the function temporarily elevates the
> provider's module refcount, calls of_xlate() (which returns a bare phy
> pointer without incrementing the device refcount), and then drops the module
> refcount and unlocks phy_provider_mutex before returning the raw phy pointer.

This is an interesting idea.

Sounds not implausible and I haven't taken the mutex given in this file 
which is used for adding.

Yes taking the phy_provider mutex seems warranted until the get_device() 
completes.

Actually this is a result of functional decomposition so, I think I 
should add a patch prior here to take the mutex and hold until the 
get_device() in the existing code, then decompose that.

thx

---
bod
