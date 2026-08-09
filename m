Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E7A344D8C
	for <sashiko-reviews@lists.linux.dev>; Sun,  9 Aug 2026 21:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786310599; cv=none; b=S979DrmUybHyufudvlM8/MNn67pl0nucWPvesyQz6lytEg59lAqrvseU/ea370eo96DG6A26frZtxw+1Vp8UlAbE6AYgzhgX8lRh4DvB3PVqzidVtnJLHJVN8qeNlEDJ/9z+V1orNTBHUK4AeiGPYTf7B33lrzRepGo1o7U7HSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786310599; c=relaxed/simple;
	bh=RqpQaa21xUJ9X8rmu2mSi3T38qCljqJmr+gjRxEpVho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IDmKWM6mDzp5yI3YR6FQ0oDxB9s8dvSc/lDqrgcgAe1G0vpj8rEUv2/pIEubQ1MBbJnoD3WXKN5X3KikiTfdFoVHolfPxYhFZwCy/OWmb+/J+rdvDUKGAnzGQCw3a37IZ6fthKvQP06qZTEf7jCeJEZ/rngWvD0pEoNKXYUZmpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AzfUggNV; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AzfUggNV"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2caed617615so14646175ad.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 09 Aug 2026 14:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786310597; x=1786915397; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zLEK77DdTeHXi1E4N/DkMsIC2IpbbV6MxQC6FvjWAmM=;
        b=AzfUggNVTF9dJN75r+RvUAOiA+Vv+bvWXTGFWlHB94BHxjqTRC7dMqTSBsX7OUuEUm
         87c4XuD1HaL0tAigBoCbXpXEvxJhZpRWnujaDmRim/REl082EmetF+4Bp8kPuy42lVF8
         7tle2M7O7/L7S5ZDUzGgwqykNJhAcdFdegSfu8HHUAavXs8fw2ImMf4VFQRJeYL8kIFa
         AgM2tbk6vfaRCFgmeAhFDgjiPJeyWkH5QnMPO3kaQx/gIEz1RNMt4kvsV0AeTXUnRqNW
         xUqNF4j55QSVc7Xq8k0+KwzffZWJO+v/WsZDCaQ4Oj6d84QxzitRak1viADFB2DEtaMF
         4cxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786310597; x=1786915397;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zLEK77DdTeHXi1E4N/DkMsIC2IpbbV6MxQC6FvjWAmM=;
        b=iXEEfTQhBfjKgZZ5gzr/fCgJjKr1PhLm4OmF5W/K7/oEIZypK2095LlEHuaBw40WMh
         XcSEOEMyUE/AKFK8xg8Z2nQ5HM7n5mKiGO8Z3190Ap+ph8VK3mctnWex53K+bXl8t/Gz
         FNfNB1a1cy7tNCL7yfnLrUsuZiKbBJlNhYtZg4YQ5RuNDG+R5WVTCgTnxuw5XdtTegzv
         u1a/tbbaV8GU3uuPKidEbvkL2/zIF5kEabiV6o+VOZRSNvFWy6M6hlQ6bPVBzEDUGKB+
         kjaVAqoQ7M9op+hDP69IuurJbGf87WFPvE3jwbgz6rZSMCo4Pn7OVReUPwq5EthLFfOp
         Lj6g==
X-Gm-Message-State: AOJu0Yznsc/ph8Yw0W3zXPmKunwFM5IaZsiZWL6bWZe3Zou209M9OsWh
	rbIKfC4Vr81R8fYIbStRQuC7h/USoWdgvEtW+HzbNhidik1nCyfmQsk2
X-Gm-Gg: AR+sD11pmT6+lJq7ZIIB9uJZscDa16zry3vE/FCT0903QfO/15+y6rstDC0MMvp4+xb
	Ok9UDhqZM44I39aFMs6wLiXIqDL4hjSzK85ajrIajT8OgS/yEos8b65kU+bGACSdoxr2enhLHeg
	CeyxSo44gVVQjtE3Lb86LECa4wVNDgL45noUzVF2WuTVW+xz5CoQo9a59byZWgBsrwCt0K2bdu6
	AI/wh05lGdoIcoaoyeohLa757KnY7h3QnigbXylvca96nddu1CHswhu++c/zP2Nbm/qca4qHKeC
	vY4hrxmA/RVtFSADWG9foXd3/UeDE2qBkMOZY9UpLtnWwwkYGxSLy+KNBq51Ck25a9oY4v+xZmG
	bUcKH2S583MRzQbwJaFLlrlW1VXoqCZrz57/jNDKACpn4CFD5jKsVH3rsMp5iBGK7SAKAxXmts7
	stOC+Z7t1VAoe+lp/qPxyg8WI+6/Xw0Zg8nLUGK7HeqS4PnuXqy7JYcHJyYIyNIP3h1Qk67W1CK
	Isy1AO+pd7Prn00jYswR9ipbFpC+cqE5Tu1HQ==
X-Received: by 2002:a17:902:e783:b0:2c9:aae1:a611 with SMTP id d9443c01a7336-2d0ca961afamr515140555ad.23.1786310597256;
        Sun, 09 Aug 2026 14:23:17 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be8a6809sm35916975eec.10.2026.08.09.14.23.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 14:23:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d7bdb634-6fce-4bfe-a24f-864d20e46d92@roeck-us.net>
Date: Sun, 9 Aug 2026 14:23:15 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hwmon: (asus_rog_ryujin) Add per-device configuration
To: Arimil <renari@arimil.com>
Cc: sashiko-reviews@lists.linux.dev, linux-hwmon@vger.kernel.org
References: <20260807000107.1786892-1-renari@arimil.com>
 <20260807000107.1786892-2-renari@arimil.com>
 <20260807001412.B61901F000E9@smtp.kernel.org>
 <5a817284-a9f4-48b2-9f0f-802c5dc6963c@roeck-us.net>
 <CADBHdQ3x4bFe518q2PjZvGJ2=qP45+5Cmm8f99J9gRZCJun0aQ@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CADBHdQ3x4bFe518q2PjZvGJ2=qP45+5Cmm8f99J9gRZCJun0aQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/9/26 13:23, Arimil wrote:
> Sounds good, I'm very inexperienced with the kernel workflow (I didn't even know you could e-mail patches directly from git). All of the ids passed into this should have that data, but a sanity check for an invalid id definitely can't hurt. I'll make a new series and open a PR to the drivers github repo with this change sometime this week.
> 

What github repo ? The Linux kernel is not hosted at github.
It is hosted at git.kernel.org.

The workflow is described in Documentation/process/submitting-patches.rst
I would suggest to look it up.

Thanks,
Guenter

> On Sun, Aug 9, 2026 at 12:37 PM Guenter Roeck <linux@roeck-us.net <mailto:linux@roeck-us.net>> wrote:
> 
>     On 8/6/26 17:14, sashiko-bot@kernel.org <mailto:sashiko-bot@kernel.org> wrote:
>      > Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
>      >
>      > New issues:
>      > - [High] Dynamic sysfs IDs (new_id) binding will cause a NULL pointer dereference because `id->driver_data` is unchecked.
>      >
> 
>     Looking at other drivers, this seems to be real. See wacom_probe().
>     Please add that check.
> 
>      > Pre-existing issues:
>      > - [High] Missing bounds check on HID report size before accessing payload offsets in `rog_ryujin_raw_event`, leading to an out-of-bounds read and information leak.
>      > - [High] The `status_report_request_lock` fails to protect `reinit_completion()` from concurrent `complete_all()` calls in `rog_ryujin_raw_event`.
>      > - [High] The device is exposed to HID raw events before its completions and locks are initialized, risking a NULL pointer dereference and kernel crash.
>      > - [High] The driver allocates a DMA buffer using `devm_kzalloc()`, which breaks cacheline alignment and causes memory corruption on non-coherent DMA architectures.
>      > --
>      >
> 
>     No need to fix as part of this series, though of course patches would be appreciated.
> 
>     Thanks,
>     Guenter
> 

