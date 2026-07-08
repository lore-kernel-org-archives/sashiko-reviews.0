Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB6338B148
	for <sashiko-reviews@lists.linux.dev>; Wed,  8 Jul 2026 10:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783505452; cv=none; b=rGYw6zBA/s6pmBVmZSLrMHuPweBiYKiEOOu2RURw9VpYADehya1knPxY+fo8JIhMyrA9f+yxZyxGOYTM54pO+UPdoUxPMClskoTFNaErqntWedu+iuJA5i3VoUcKD/lhvoXefE+c1GHyRUREWjksQrNZEk2wZpfrORo126cPilA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783505452; c=relaxed/simple;
	bh=ecF2cTn5AYhAAM68s9B/PAUIJM5SNBc7WXxDZmZ73mo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MBjuJMq30fgvHJPySkdKfHDGOznUKK98PfEC6bup2QgHul8MHluDz7YeR57vQ84UuqXR4E8bbKDqYNVy7HK1yP2tEGiJiEj/ulNMVnisWx98UZh7j25Wys9Q2pAEGrh8+tQ4EJt+IICJPI5PkiYCAS427kB7IIuiwmgzeZLMS20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KB/waLCe; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KB/waLCe"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so2748885e9.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 08 Jul 2026 03:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783505449; x=1784110249; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JNhfZKXmPDIRApTD3u3cceCo1e7KoMWEMGSpd5WD324=;
        b=KB/waLCeCrJmU8wAebFD+q4h9U94rMHgvLIeNiZIV6hcFxOcpiX+9eMwdnJ5YMupC5
         zgggsoxYnAgk5u4QdPgbFAPtA8RVTNe/5XqyiAK9cSYRe3+ZNylGIX8ZOsROHvkon0SI
         DlVKigj0OoeG7nEuQfkgLubk/ZCoy0zQuBI36rKBk9PbMK3Euk6w2WSUKE4wJ3IhvZ67
         7kIFtxQ0SST9bRYXLDgHi7cu91mE3df/bklM+kkrqGrtc5/FyM6rYQfBkQ+DGP99vFp4
         b/ndrkA+AwdWXm4a+CcVRtl1qhBklsq484M3sTP11OqYVVP6AsproqiOITIRc6R1bXGI
         PYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783505449; x=1784110249;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JNhfZKXmPDIRApTD3u3cceCo1e7KoMWEMGSpd5WD324=;
        b=WfUZfw2/uDsZq0LUQzpv6khtkBrc5MxznH9sM5avTGKSfxqyrsiw8b2KlXO2VWObqc
         GieYBfH+8k1x7G86nrsYwUMPZRAhEUcF6t9B2xhjAu80yiM5Btl22mmSlCvGEuwaXZHf
         v0A5L1kWZeFJil76cz8ryWjSu1vMB4e7jS1HQH8IAS0bUZYZSfUPrBE8Al0iDl/+SHOZ
         bOQbV+BLsGXs49F0ArZ3hlhWzjJsT13LsFd3eZ1iew4pQ7MbP9xDoYYPbojpcPimw+u2
         vOn5+b/4vcQ8RyE3+Yl+jfknmeWNuHDyUD1mnYHsLjh7jRETCGKvCzQUHuNPRZjPlpHa
         xObg==
X-Gm-Message-State: AOJu0Yz1KY97Exy0i4UJn3QNsPB5VjPeonqiHHI3hxB1OcyQWtETansl
	XUbiZ6/bjxtw9a5VClJf9bwZzRtePwG+LDojP0f0LG3ky0o/lwCiMtLno0B2nikLTWinoa1iry7
	ZKFiNV9c=
X-Gm-Gg: AfdE7clSxeD1UO3JB+qqlAhGIAAawrc/Q/SCLkO9P7bY3HElcs0erHK4a81kTHp5Cz0
	Ut8ru8zcCC4Ig41YW10k3gEjPft9U+6/Pe56Q2ywGDDRSgvY8lB1oMpd1Yk087WC37o5H8b26Dm
	6GlzEcc6hsvsFayxc32ONWZnK2F492HZZHVg3NEft1sCCGeuZoQTjbaruT+uIka1KAo8DzVX+Rx
	HsDyQfv9hb/myGblxhpSnX4TYXNVfRioUtFlDIWkNC9Md0q7DqTTfS1Dk6vRCokvvWFNYwWQuXI
	nmseFCLdVxMJQ5Mc2wLM0JOkqlv5qn2NH0LzlI6onTLzjuw5hbQ187Hlt1cFU7NUdzCzrz6WmFD
	ux2huSzN134cTaWwBhnoUSsnFHKWvRVWjOOM9viPjGp99JHv13K/2qmInOf+2KIoqt2D8evctK3
	/j1i0GPZ+N1paBbxet1Gvp5wMucqdmSU+GIg==
X-Received: by 2002:a05:600c:4f91:b0:490:be14:bfda with SMTP id 5b1f17b1804b1-493e6859a48mr17703585e9.6.1783505448853;
        Wed, 08 Jul 2026 03:10:48 -0700 (PDT)
Received: from [192.168.42.79] (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0fbb410sm130766595e9.12.2026.07.08.03.10.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 03:10:48 -0700 (PDT)
Message-ID: <883098de-dc3c-4c72-abf4-75b67c0c3351@suse.com>
Date: Wed, 8 Jul 2026 12:10:47 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] tpm_crb_ffa: Include linux/slab.h for kzalloc_obj()
 and kfree()
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-modules@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>
References: <20260707153819.4172541-1-petr.pavlu@suse.com>
 <20260707153819.4172541-4-petr.pavlu@suse.com>
 <20260707154337.CE2901F000E9@smtp.kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260707154337.CE2901F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/7/26 5:43 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The commit message incorrectly claims that the file uses `kzalloc_obj()` instead of `kzalloc()`.
> --
> 
> --- Patch [3]: [PATCH 3/4] tpm_crb_ffa: Include linux/slab.h for kzalloc_obj() and kfree() ---
> commit a56e4cf89267d12126bd70f7981a05c846959016
> Author: Petr Pavlu <petr.pavlu@suse.com>
> 
> tpm_crb_ffa: Include linux/slab.h for kzalloc_obj() and kfree()
> 
> This commit adds the missing linux/slab.h inclusion to tpm_crb_ffa.c.
> It removes the reliance on indirect inclusion through linux/module.h.
> This prepares for the eventual removal of linux/elf.h from linux/module.h.
> 
>> tpm_crb_ffa: Include linux/slab.h for kzalloc_obj() and kfree()
> 
> [Severity: Low]
> This isn't a bug, but there appears to be a typo in the commit subject.
> Did you mean kzalloc() instead of kzalloc_obj()? Looking at
> tpm_crb_ffa_probe() in the driver, it correctly calls kzalloc().
> 
>> The drivers/char/tpm/tpm_crb_ffa.c file uses kzalloc_obj() and kfree(),
> 
> [Severity: Low]
> This isn't a bug, but the same typo is also present here in the commit
> description.
> 

I don't see a typo here. The code uses the kzalloc_obj() macro:

https://github.com/torvalds/linux/blob/v7.2-rc2/drivers/char/tpm/tpm_crb_ffa.c#L339
