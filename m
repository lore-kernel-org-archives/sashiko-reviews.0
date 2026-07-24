Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B371B372ECE
	for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 02:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784861649; cv=none; b=JA9Nc53N2cDC9PZRIhmbcZisiOo7pCgQpFxyK5e4qNZ41cA2zbfhrgXTS0jrnRgDR2dyK5M2OuL33zCVoxb5NoSdEaluDmTAbkASibp7VPM5xKD1GjQVU4uN0pURB+UuV3JqoEkVTEmfrLvWBY23ut8UJk7BCY1Z75jD9qdEmPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784861649; c=relaxed/simple;
	bh=3YNhJa3B7BJ+5/hGFL9dz3h9OwH3cAo/rRkf4mBqYck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JGkPycoN1aLlv4CBM368DPWjYWTBPidP2DTQPxHWM8nAVRCSEaSb6YjDUpQTZjqplZ2HpzWi35V7sesAi1HGa2/amEKLaaGDFy4OVs523k79kRUT6vB1aRmpI75pMG7TQe3iecrCrMx75ZNZca+z8SgV+gJKb2Ep7NJ3hWwytUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MDb+aGVz; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MDb+aGVz"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso1414646b3a.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 19:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784861646; x=1785466446; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lPCe44TL9Lu4Q6XqOnCQ1df/GtP84+ufX9r8RseyaR4=;
        b=MDb+aGVzb1BKTjx5loKaWTLpKznyrNrgVdNJBRTdcv9Fd6mqAmR4usDPAi2KdAZgo7
         08EEl1MFo8cUPFyzAGtR//1VWKHHpjiCxFAQaTtAWRcl4cJteM23aylow4P2QrvfE8Pp
         y3lmJA4BEKcW+IYtTZxDmpjvu0a4ZNbNKN2j2AqBQ2w+9K9+Ie/Lxx65jXSjFS2F47EM
         PmXTxbkDX0tScO5OBWeKYObKRABjt41FRk5J0P74s/nt4ycQBDLytxTFyaKFCvxDDtES
         gRupgAL/lW4jBhl7zJ4j1E/JJ0hiKiY8RRG4gNsr1fCp1XN8iuEPjputB0x9zTy3Zpsp
         Vx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784861646; x=1785466446;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lPCe44TL9Lu4Q6XqOnCQ1df/GtP84+ufX9r8RseyaR4=;
        b=WtizHrbw97/tsQyFp9ZJqRAEDngIDvG/ynZWrijroOTBPNGZPRTO0mrkByZ5U7VSy6
         YjTPiEZ+0Ck0zPBosJn6jaF7ruYIdmyZTEu0NyiOuVPa4HxvwMB/6tatd3VglzVf1jKc
         dpWWnJeuPbnxXugfkiVUCjoYaWmMCTqGno6kU2gev9WsQCf7SCJyo92BdV9F2TtqvYZP
         o5+Miwf691ofGw2hrRt2D+FurLUmKVX8AiH6zsl6fR4nh9bsisJns1mFyhYN36heId4n
         sbroAEpFrixE+44nihLm6AIPIhb/ZZv/403IoyFN8z26x6kc/25im+bLyRtZbWD/gm18
         MmCw==
X-Forwarded-Encrypted: i=1; AHgh+RpJvfeE7hfQjgqvu1WtrJ/1b15vNC5odvIVmQ8surGo3Tm3MZUyVCqpdHKcw59Eh93u5wG+8STA48qK2L04Qo8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzcZW9iZvKuZF5erdhoUq8fHV4kuq5tdZ2EuR7UQ+qeUwU6/uEG
	Lup/Q2e+Nhmmeevzff+0Yh1S/O5ZZrg+R+PIIiHjwfxgx3iUNmwSvtI3
X-Gm-Gg: AR+sD12gSq881fesCCW0e5aXXdUkH4gK2ZpJKeMva6gHn2VmZeW6wp++jJYlCDx80Pp
	QAayKjDBwYxr+yUKoVbPmRY74hpAV7n5BEoIMNCr903EPvH3tntPEF+tBcTb2Hdnj7GreSWlI0N
	D/28xGlTQp0MVv2G0KuZ4bOkpEOMLi8cv/uTw2a58MOXQs5ChD25zhIvGEV734e4az3OQKOzeJt
	46b5rR3D7FWHtzpk/UAG5/OBPFzc83xHi0PVBU13mWTahygY/PzVmGEok++ed5pQJh3lt63YfbQ
	cabQCc8zpsm+clZq4b1rHJUgTMmxPAdyhv4Nh/XqYGS5ujviNm7dev5cTREi+1e6ruR/SnlMpKU
	CRvMRUCxfbdGBTsuhSAo/SJY6pCb28wuVM/5wWYgkd4xUfSnk5iV2xQFkomDxHsElMg6TPHIXmA
	vUA+FaQ/JIFntLBYveWLIb/1ZALJxStK4+vYREcw4RqItDQNWH6g==
X-Received: by 2002:a05:6a00:230a:b0:845:4928:8655 with SMTP id d2e1a72fcca58-84e2bb3733cmr6297375b3a.39.1784861645606;
        Thu, 23 Jul 2026 19:54:05 -0700 (PDT)
Received: from [172.19.1.48] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e1757852dsm3919741b3a.28.2026.07.23.19.54.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 19:54:05 -0700 (PDT)
Message-ID: <1c930200-11b1-451d-a7a7-170b42aa30fa@gmail.com>
Date: Fri, 24 Jul 2026 10:54:01 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] watchdog: Add Nuvoton MA35D1 watchdog driver support
To: Guenter Roeck <linux@roeck-us.net>, sashiko-reviews@lists.linux.dev
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, robh@kernel.org
References: <20260723060755.1596858-1-zychennvt@gmail.com>
 <20260723060755.1596858-3-zychennvt@gmail.com>
 <20260723062030.B20F41F000E9@smtp.kernel.org>
 <a04cc256-4c60-4e92-b196-47aeed1d5453@roeck-us.net>
Content-Language: en-US
From: zychen <zychennvt@gmail.com>
In-Reply-To: <a04cc256-4c60-4e92-b196-47aeed1d5453@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Guenter,

Guenter Roeck 於 2026/7/23 下午 10:07 寫道:
> On 7/22/26 23:20, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 9 potential issue(s) to consider:
>> - [High] The `ma35d1_wdt->dev` pointer is never initialized, leading to NULL pointer dereferences in logging functions.
Fix in v2. Switched to using wdt_dev->parent and direct device pointers for logging functions.Remove redundant ma35d1_wdt->dev>> - [High] Read-modify-write operations on REG_WDT_CTL inadvertently clear W1C (write-one-to-clear) status flags.
Not real.The W1C flags (IF/WKF) are only utilized by PM callbacks during the suspend/resume window for wake-up event handling. During runtime, clearing these flags via RMW in set_timeout causes no functional side-effects. Furthermore, RSTF is already consumed and cleared during probe().>> - [High] Missing clock domain synchronization (`ma35d1_wdt_wait_sync`) after writes to `REG_WDT_CTL` can lead to dropped register writes.
Fix in v2.Add ma35d1_wdt_wait_sync() after writing WDTEN to REG_WDT_CTL in ma35d1_wdt_start().>> - [High] Driver overwrites `wdt_dev->timeout`, breaking the software heartbeat extension.
Fix in v2>> - [High] Missing cleanup for wake IRQ allocated by dev_pm_set_wake_irq(), leading to a memory leak and permanent device unbind/bind failures.
Fix in v2.switch to devm_pm_set_wake_irq() in v2.>> - [High] The driver fails to check if the watchdog was already enabled by the bootloader, causing unexpected system reboots during boot.
Fix in v2.Added a check to set WDOG_HW_RUNNING when necessary.>> - [Medium] Unsigned integer comparison against zero renders IRQ error handling dead code.
Fix in v2.Change the IRQ variable type to int in v2 to properly handle negative error codes.>> - [Medium] Integer overflow in `target_ticks` calculation triggers unexpected system resets for large timeouts.
Fix in v2.Add a check to skip calculation for large timeouts.>> - [Low] Unnecessary dependency: selects `MFD_SYSCON` without using it.
Fix in v2.remove select MFD_SYSCON.
> 
> Please fix or explain why the issues reported by Sashiko are not real.
> 
> Thanks,
> Guenter
> 
Regards,
Zi-Yu Chen
