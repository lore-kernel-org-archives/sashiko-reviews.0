Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C24345EC2
	for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 17:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784827061; cv=none; b=LccP57XvmJ0GP1WsK2d4YuXlob0GP90KFBPAqWmmIDjueWdsaC3PGsaWfiKG15m+hnnadmD3w+RdoFmyX1Ab0a7ys0OGAYNlv+3N52IJvNfr4LK3zRdfenjlUsAne0w0/UfmSpmAN8XeJ7nI6eWiIwt4YwROHGX52MjNOizgAwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784827061; c=relaxed/simple;
	bh=o2AeW2w6CMFw9uNL2ohX6TRkCKE4DxRBcs052PwO2MY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=clTKYhhWkyC3uAeHuE8GABY7NCb+TYG8NxL8+kLzMGhshOPlpU4/Wal1k5KMWfGW3747kDxxn0eqed1p5tVir8UW/s++C2LNwTiUHz4EMcg3G+NVvcuqBAHZqRmyR2wYwi0reHsMN9LVN3QPiw1Qf1NtQepLkDU+P43g9R8b+z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sGYk1u2m; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sGYk1u2m"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-382ef647e20so966310a91.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 10:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784827057; x=1785431857; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U76mVY9e9G9Bw943Rujg+Gk/NFJfxfAvuMNNtENYcfk=;
        b=sGYk1u2mLOmvf+v86mB9E+uZbz31n6aq3INTHtnvblzH2kiyfliO7ClCyanylH4NhY
         mnv/vgxGn/y4dqyOzmIPrL+A6bQZQEM/oS/AKcn6W6EI3LsnbwZTiFN+JkUn+4sp8Ou1
         UEFDz+73sRNCxqr6MEn5dBxJ8xm4bEheneUEjeAr1Ek2raR+id7cBIcDy4+OGb7UaIE4
         I8eThDiBZ9uWrExIOOtYfIGDyHi1Jq7EbxRVAx85X5PxKXaUNhvU2eu/aX2+D0/xSGLD
         HNFwgAjkqovUZ3607BTqzb+sfCVGu3Fnz8HDgiL0Hdrjx7iyl0vS7/rYfrRH6OMCvZmm
         icug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784827057; x=1785431857;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U76mVY9e9G9Bw943Rujg+Gk/NFJfxfAvuMNNtENYcfk=;
        b=RAmxRs+Ca7TnmL6k0D7+IrB92i5IRrrDDLbtncIt7kAH1Kw02O2ZzXBZpsyNsPyp3O
         FAT2dN5DSxWpAVvWC4EY36LyjFZ3zpHKtyGPvWj9KhYNXJd4FSBWzsLyy/NMnHBiPOST
         g4sZDXz5bVoudKPFV79r8NWYkpHM2kbSXVFtZn5jRCnxGt/ajybRyv6qHhuvXSF5yygi
         mivKz7FiKQEsZduKUYGMyW65DnxqhJk8nTAGNzzfeHh/T/5gGc/OgbwYtAzQ8sMx5V2Y
         +vrPv83WCnQx38SOy4UDzPKgDXrdRvnpXjsUYlj2RdsvG/ST0mdB0iLjc9sB6ExZMlX+
         63sg==
X-Forwarded-Encrypted: i=1; AHgh+RpO8OscIG61PRTTDMyZ4LX//hiarq9x+M32UeIlrKJGzy9tXkkLiyQx7cUzQ4O2vKrkHDuF/Rdcvw2ovMp/N8U=@lists.linux.dev
X-Gm-Message-State: AOJu0YzPPznskKm/IRKya1zrhQUoUvRvk0z5KoWzwf9osaiXbpS1staF
	BlBTsEnn0RtCwrt7B2xe/efvAniBPdIVHvbF38RV0HCddL+zHAQnp1aV
X-Gm-Gg: AR+sD11gmnIwIIu0gvQCO3TSXWcakRCUYCPPsTKh2sJpAXCQkwJ+2oTs6Jk3Ulgrkug
	ETx2upZ0/uf30dlim8Rmoz33wCS8dbrVhS0KonzWGUBvnzVjmU7KJzfZqpby1WooEqDTBgeFNeE
	3mUuDS5lrKJ9T8NSoqW00komY+e7k7TmEtLFTGU/VCgVgPdCE2Ew/cQA6ygKKo0KZcm+214xjed
	TjOfFlLQxo/xSZkZ/OqFwfLACXhV2QIZX3w0Z6X0HYQ28ta9iadB3llPovjy+nxJUunRMJxjJfG
	NPeTyeLkjr74yrqs/zh91kc0O9c1JpvPgfGTU01C5W84e+LjRtC9jB7kTSZ8TD9v6krAIWHWhno
	Qr0tX4a5nv4S0P3xqGQiWNAOYrxUAQiYh10kGoJlBZJ19u3FWCkzV/MGr3wlE3z303SvsqqtouO
	WYXiXRA7nn6gVaP6R3IsG9ZRIwsPRcoC+He3emLajnXuLfXEcsNhA=
X-Received: by 2002:a17:90b:1d48:b0:387:e0db:3d8e with SMTP id 98e67ed59e1d1-38ec665050cmr4478682a91.41.1784827056822;
        Thu, 23 Jul 2026 10:17:36 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13003f12sm29195486c88.2.2026.07.23.10.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 10:17:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7beade5d-e798-4c83-b62f-49f879e63ae1@roeck-us.net>
Date: Thu, 23 Jul 2026 10:17:35 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (pmbus/core) notify on the hwmon device, not the
 i2c client
To: Vincent Jardin <vjardin@free.fr>, sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
References: <20260723-fix_hwmon_notify_v1-v1-1-5a24c528686d@free.fr>
 <20260723155926.13B771F000E9@smtp.kernel.org> <amI-0KTPoQnjxCYh@L30177.local>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <amI-0KTPoQnjxCYh@L30177.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/23/26 09:18, Vincent Jardin wrote:
> Hi Bot,
> 
>> Pre-existing issues:
>> - [High] Type confusion in pmbus_notify() causes out-of-bounds read and dropped hardware alarms.
>    ...
>> [Severity: High]
>> This isn't a bug introduced by this patch, but I noticed a potential type
>> confusion issue here while reviewing the notification logic.
>>
>> Does the loop in pmbus_notify() safely handle heterogeneous attribute types?
>    ...
>> If so, it seems this could prematurely clear bits from flags via
>> flags &= ~smask and silently drop legitimate hardware alarms before
>> reaching the actual boolean alarm attribute.
> 
> It seems you are right and they are pre-existing behaviours.
> 
> However, this fix is independent of this behaviour. It moves
> the notification target from i2c client kobject to the hwmon
> kobject device.
> 

My conclusion as well. I'll apply your patch and try to find a fix
for the above problem.

Thanks,
Guenter

