Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6546F3515C3
	for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 03:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784862157; cv=none; b=bVdhneKryjSO7/BlF8h5sph+Ww7GV0Nf1PQjb+Qgizjz8TNnNikdTqdSfoUuSBtwBMizGOL0pAkgsP7dS2JnVTex78xoke/GTGPbX9b89X/b7EPqCJYsjbIpR/kuxKtQAJcc0cONs9WPd3B0mMNTY51w+ixCPJMSoNsJeDVGqUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784862157; c=relaxed/simple;
	bh=smtf8VNOiQMzPOx2DVjKWqX6awaP+z2c9Z6pSOrWk4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HowZoO+ukvkOc3iLV18C9/FpA+T6KvVoAbz1BlAB4LIKBZ6zRo/tnnUUDxE/BHMu3KzRiRfuewgZ1Flb4rkqkY9MQvrzUpImMKoM6nZQhrpBA4fYI3iBuUUAa1hHKwBOVm2eY/uGjGYLOJlAHUKIY1NqThcqvBDq6R0J4k7qAZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EchuSECt; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EchuSECt"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so1346872a91.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 20:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784862156; x=1785466956; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UhdrzuAFVWOLh5OB3PTlI2JCVV55wYF4HPgrAV9GcOo=;
        b=EchuSECtl4eRCLlYj6L/gF+zFv+n8bF+1YrziIoFrzlKme+y3CV4HJdep3rINUJ2wj
         yfSJoHUctsUt1zxk9kxO8zoumpa7Cn6W5sxrBTop6vqAeSi26UDwymNLzZvp0Ozs5NW4
         Y1KdNPKAwpwh8dA9QbABkftVI7s4lEyv5NlFGRQPvivdgrJH/+zWi0v1IwtgMtF5z4fO
         T8jir0JyCCSREiR5ikbInFciOH2ZnZAhxgNi+WY6hyZdmm7pvvnnpPgEL81KBqHYeZjj
         75PaFB7zH6hzG531arwUY5JjxYkJ/NIzYowd6wm0l2tooYWql7tnabruhy0tY4VCgmMr
         65EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784862156; x=1785466956;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UhdrzuAFVWOLh5OB3PTlI2JCVV55wYF4HPgrAV9GcOo=;
        b=fLoST32cIyfZH40o7WTzUgkvzdzDjbWnGi2ZaknrVd5SfjVUzUeI7r+HJj+gCUM8sR
         f2zcwdrMIdIjP2gxbsZRBgtPArOSOiip9Yep2KRcspXZTxpGj5GF3SuM//0W8X3Wp3Pr
         Z4OVH6H4JAsftuQJxeZ4bJC1IlMHoznfWYSzuD89hwKs5VdHw4QQcQShXO96hn8w+vot
         WOB+vlvI0qs8Km5gMsI9g12sXjOaykNSmeFasgxmkBKn3v+OzbtDrc81joB3IjZr9e4e
         CjM8Ct1TW94UrdAm8lUQZnYTdxie3EH4uRjqTI2MH0Jt1cS2X0hYuXxkISZd2fZCmt48
         cWYw==
X-Forwarded-Encrypted: i=1; AHgh+RrzDwNkvuTrkEyqg1IK3Yl9hRjW4HQRfB5fDRkaKvb8xt7hLYMAE3zFBSI90VSl8UDDvdAjRexGLMxzmGdwpYA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxEWWOuPbspU+2xeb4ebe0qED69Is5vpylde9YInSdz+43F3vje
	31EqIA2Ax7ZZNYL+FrUGX7oEUzIGczmboROtgU9LChIvcbvdqTMAnzg2
X-Gm-Gg: AR+sD10bKgKBLeCPm5OBmqR1bBYDqasc3yoPqJXzOtw07OkAy/LuG5cM+j29bqtSnBE
	nVg5g5Szl+y/nsGq5ge2WgLp52J03gWIyxUzM4isl5TdSsNxm2jiTSzH1y6MzPa1woPkfj43txl
	bykW/stLOcYqE3L5GHnPGlCbgTKdrYkZ8S9HrjHhkr7hJESx9Glkj668PT7bI1yauuX9emeSBF1
	rS9IzesHE6yrvJiQYvzYvVcuHuREY2CmFd1GRiBtRX3Dcuv8YNQgq1we2yF3HfB514b+fQGjECS
	2Pn7Zlw5WpdxjsOKIohHkCr2glHJJ05bCcsZN5JW9rQFnWzti3JPhWnqq24SA1DMIanX6/qxLmW
	26mJ03fusRjNudmq6NUU/coT2za5/KCoY0Jag9q+THinTUHT/r5nBgFZ5MoZwqntlEnSe3ERBf8
	CNiBU7vWAAdC2SpCXqVg5En/jvmh9VZdfJ82Mzph//guAEi3gEay/8ZFCrAjaX
X-Received: by 2002:a17:90b:3d43:b0:389:8f6c:4d58 with SMTP id 98e67ed59e1d1-38ec6618585mr6340998a91.34.1784862155701;
        Thu, 23 Jul 2026 20:02:35 -0700 (PDT)
Received: from [172.19.1.48] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03b0f591sm731078a91.7.2026.07.23.20.02.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 20:02:35 -0700 (PDT)
Message-ID: <041218b1-4d7f-4fbe-ba0d-5d97bf0df6b5@gmail.com>
Date: Fri, 24 Jul 2026 11:02:32 +0800
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

Apologies for the broken formatting in my previous email due to a mail client configuration issue. Resending with proper inline formatting:

Guenter Roeck 於 2026/7/23 下午 10:07 寫道:
> On 7/22/26 23:20, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 9 potential issue(s) to consider:
>> - [High] The `ma35d1_wdt->dev` pointer is never initialized, leading to NULL pointer dereferences in logging functions.

Fix in v2. Switched to using wdt_dev->parent and direct device pointers for logging functions.Remove redundant ma35d1_wdt->dev.

>> - [High] Read-modify-write operations on REG_WDT_CTL inadvertently clear W1C (write-one-to-clear) status flags.

Not real.The W1C flags (IF/WKF) are only utilized by PM callbacks during the suspend/resume window for wake-up event handling. During runtime, clearing these flags via RMW in set_timeout causes no functional side-effects. Furthermore, RSTF is already consumed and cleared during probe().

>> - [High] Missing clock domain synchronization (`ma35d1_wdt_wait_sync`) after writes to `REG_WDT_CTL` can lead to dropped register writes.

Fix in v2.Add ma35d1_wdt_wait_sync() after writing WDTEN to REG_WDT_CTL in ma35d1_wdt_start().

>> - [High] Driver overwrites `wdt_dev->timeout`, breaking the software heartbeat extension.

Fix in v2

>> - [High] Missing cleanup for wake IRQ allocated by dev_pm_set_wake_irq(), leading to a memory leak and permanent device unbind/bind failures.

Fix in v2.switch to devm_pm_set_wake_irq() in v2.

>> - [High] The driver fails to check if the watchdog was already enabled by the bootloader, causing unexpected system reboots during boot.

Fix in v2.Added a check to set WDOG_HW_RUNNING when necessary.

>> - [Medium] Unsigned integer comparison against zero renders IRQ error handling dead code.

Fix in v2.Change the IRQ variable type to int in v2 to properly handle negative error codes.

>> - [Medium] Integer overflow in `target_ticks` calculation triggers unexpected system resets for large timeouts.

Fix in v2.Add a check to skip calculation for large timeouts.

>> - [Low] Unnecessary dependency: selects `MFD_SYSCON` without using it.

Fix in v2.remove select MFD_SYSCON.

> 
> Please fix or explain why the issues reported by Sashiko are not real.
> 
> Thanks,
> Guenter
> 

Regards,
Zi-Yu Chen
