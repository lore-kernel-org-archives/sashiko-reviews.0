Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F0A30F548
	for <sashiko-reviews@lists.linux.dev>; Fri, 21 Aug 2026 00:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787273768; cv=none; b=BF0LmtOfN+OUgbYN4mOnWvjZb9oNFEpAXV8MPcv9Y3JQpiMPK13/ypgFEEWQUqrzZ9f+/OIwJ3qD3TDsuE/snSEQ8PQU9OZlbj2p6bsX+p+G2G7wM3NJ9WXJV0lxqFckM331xJIb1UU5OslcYBptZk0nNKF9tIFA/UubOctXoZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787273768; c=relaxed/simple;
	bh=iRr+T9DT08RWnG9Y3JZPuJ7Q+vmgWgAVpS7v7VBGrfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rivc8I8M37aZPGlTqmZLbknlZ0YWOagcZtGy0CdDG7EUyt0wQGbc6yKMyzjM76m8b8b8uOqzUUyUXlwdKnfs09q2Rbk3pGbyoW9eld/NUA1wkw2F7cXOjgw/s4/VzNBKiKuiAZn7kvfqWqDgpC2o6LG85uGqGGXxC0QdJ9CHEwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r06zVipj; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r06zVipj"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc11a905ba5so367961a12.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 17:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787273766; x=1787878566; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eCBKrA8yYc1VlDezvAZtjK4Y9OSDc+NprzK0Q+M2AM0=;
        b=r06zVipjGGEACRsrQw2IC/VkIcP8kjge0hobcJitq3k5An7H2R3IEGDkFd0xDfSSPB
         USY6Fy7wpymL9qM9FylhcfkbgrZfuAa/ZF9Mw9w4isL/gtvOYWQ+sB3AZzx+sJooQLr/
         ofQIl9h58aTyYV2hZD2qnQUMR/o9fqrH1/N1bfm4LSABvhfd+4SMfXN8x0tWAn0pE1+O
         0uI3tcVjvZtnVjy05K7P8YdB9p44zXpB7AacIeeNhhPPRno5pHJgJ9BMmjt+K59TKv5V
         ahL7O00urYPD41ebLuixf2S9fj/gkqdj0HlFG/VsGczbUbUshi1lP8seRiqEBLprz0RG
         snGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787273766; x=1787878566;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eCBKrA8yYc1VlDezvAZtjK4Y9OSDc+NprzK0Q+M2AM0=;
        b=Oq/DWTj7S3gPdoiUsvZPmRJ3g+o2COwewin6bO5R4lS+k/pQM9smi3st+14dLgDdGa
         XZbU1I0KWDdmAuLs6KWaudKm7t3o+HysB+dRIbKRkBJRwUyNB4c4sVHD5BE6EwevmQ2w
         i98T0K70EDaVk3J2iHBmM6uWp+mIQ0/vBPTS6w4vF3muQE970RyADMmAgb8AserMuroi
         1pjudVbZhhaSvd2m66JzsNEwRriEZyNZq1KLHF8HU7hYYwKnK0nmKpCKuN1B6sejResY
         xyPscvdof/78mk/i9QIx/uYVRe+kjjJdgbw2wlr0mPiLSATN/upABj9GDiIUOKO8AWqA
         sR5Q==
X-Gm-Message-State: AOJu0YzIQBLwex6l/qT4KDU06KbF5UvlswNkKCMiAtw3ZnHvvFkwVVly
	YYcMvh+ehLJHmzy7w4Aqk9A/Ew3+wk6kiI+zKlc0PnkkmD5emJRvDWZg
X-Gm-Gg: AR+sD10wTMIk0VGD3w4mrRCZMB3aKll/8zngkjb9xwEn6XW83qXFzMyiM0koDVRwvIa
	7cY5+DvAcgwE3NycQyh5b+nohFed22AyFo+JTD68cipVHIG75SHoOX5iEtwX28mE5hzgwgVmPJT
	CWR6xxGBcqSfDxhMN6jZIOEg/7RLxoOcQ5ZSC/SKi4wkVxii8tDVY7f68+AKS/R50yLdqT+000d
	ACEroPiq9C6wLJOA8/v5mHVAdJnX5wSZVLCDkZqP1b42xSVF5EL0PlF4r8BwYdhfVGVDWQ6VEb3
	PdrAFOURthrA+55Dnx8N0kmFhN1HIqLumcGHFpT8YEi+Ti+z26lVrmY2sX5nwCHY0ChyC41s/LW
	cZw0DO7MYn1JI7B4PDUaiPbTUfOTDpXyteEXp/z8sXGV1q3RF3pycVAiFmYp6TsMPwE0gdxPlA9
	MAPA6qfF8pQnJujiZrxzx++lKyUWYk8ldNUUrzez4pw/587dcVze08G7SVuoeNMdriEbbw27xSF
	p5SV0vxFrL5pZjzdhnBJ9fwyp6AfZtWaPTl1A==
X-Received: by 2002:a05:6a21:3a83:b0:3cc:b26a:7686 with SMTP id adf61e73a8af0-3cd2fea4c50mr5165807637.6.1787273765850;
        Thu, 20 Aug 2026 17:56:05 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef77be3sm20488962eec.10.2026.08.20.17.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 17:56:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c72dd8c1-187b-4c33-acbc-cf834bbf6222@roeck-us.net>
Date: Thu, 20 Aug 2026 17:56:03 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] watchdog: s3c2410_wdt: Add exynos5515-wdt
 compatible data
To: Aiden Isik <aidenisik@protonmail.com>
Cc: sashiko-reviews@lists.linux.dev, Aiden Isik <aidenisik@member.fsf.org>,
 devicetree@vger.kernel.org, robh@kernel.org, linux-watchdog@vger.kernel.org,
 conor+dt@kernel.org
References: <20260818-for-next-lucky7-watchdog-v3-0-2912bd122c57@member.fsf.org>
 <20260818-for-next-lucky7-watchdog-v3-2-2912bd122c57@member.fsf.org>
 <20260818181349.894171F000E9@smtp.kernel.org>
 <k_6CWq_7vPkV72MkyL0wCdcr9ptTffpGOGc6dBLbXjcHBV4DGRzP-35mxO0tdOBaIEhy4BxByYLCh8T5nidgwaMwGcNYD9KCIpxkeF4RRiE=@protonmail.com>
 <83b5d8e7-9504-41c9-9f24-8fce60641de4@roeck-us.net>
 <-HoGjao7Mdcx5P3JHoh9WjecLbbXBISKawVeEa59KRfhq7rul5NozHGaISvi0T-ZTp2otj7_b5qqb9tQI5XR0Wvp4UzG7crAekiRTXhiOd4=@protonmail.com>
 <d8191041-a4bc-4674-ab9e-7fb56ca2b56f@roeck-us.net>
 <cTie_daC2kaIY2BT6HkyAeivwspRhq3thkrkGDMVdIpF2vF5Vr38HQxPcvKFK6pvWatAFk-CO7XL2uz3OCfDSwI-EOxQqI8hNylXjG1jrQI=@protonmail.com>
 <XNt95pVriUNFbMMYsr5mnQo9LUABboJjUMboxV5mWYj9FQJb6XGjsGkGRre7eSK4bvCG4oOuTg4YNiujCpX7ZlonVgQSHFBEzpFvZLFTXtw=@protonmail.com>
 <01a0682b-b7ec-45f0-a19d-df40ed6366a2@roeck-us.net>
 <s4LZj1kKLrHHKsrkc1s32s4sh7oKzXqEG4hA_W99bG1YTsgnCj-shElNsnI04D-eVsK4Y0tx7ViBSkjy8LZjZmZ8N4D5UEg0bcU16gOXHP0=@protonmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <s4LZj1kKLrHHKsrkc1s32s4sh7oKzXqEG4hA_W99bG1YTsgnCj-shElNsnI04D-eVsK4Y0tx7ViBSkjy8LZjZmZ8N4D5UEg0bcU16gOXHP0=@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/20/26 03:18, Aiden Isik wrote:

> But if it's just a comment like the example you described, I can do that.
> Do you want the source to be "Samsung's downstream code", or a link to
> it?
> 

Links may not be available forever. Just a brief explanation, please.

Thanks,
Guenter

