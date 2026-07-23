Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A46B4CA278
	for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 14:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784815673; cv=none; b=ly450EF4gBy7ss8AXo/brxKuZYHjo8mQgI1MkEFyatxyt7MAYFvol7DIxECWAuNUfZejIDjWS3HWLoXMKJDhPFvsBAzK2D1bH+kbNQgiMP3kKlyhfIcbSSg6ClYOXQh+PYnv30aYsV263in9CXvVGdMU1glPF8BsNhVuQhkyTVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784815673; c=relaxed/simple;
	bh=spoxKFkJYFtNO9/qiIJmkVDjM3q1Nm82GTeSKSVFves=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=be15klKcTae6F6DATjdn+l/fkTa98sydK+TW4c2BHvQewiHdD5O3UZhWiKJBKDwq1Wh0+xdr93KOrHZZN/alwsT0bpwEhAiZBik11hkkONUMzaRCe4FtT3MFb17KRm60cGmTA8vB9GgtFtRPkpABRpswlCype8av02M6r3bnAFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YTrXlDvy; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YTrXlDvy"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cf50c6f235so9928735ad.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 07:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784815667; x=1785420467; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=spoxKFkJYFtNO9/qiIJmkVDjM3q1Nm82GTeSKSVFves=;
        b=YTrXlDvyAQk01hBUjzuP56AtVpYdZQIOF8FntqJbgopikYjcwpg6MzkO8dVd1RHGfe
         rzWG3kcSbP/B7hKJn8N99ZP/9su/jD0bjy6vrtWqVVBVFi+jFqylW6L5PnrWYUB3tYyi
         9+OgtDRK6S4UfGr4hMLVxd5EzwMfeU7s7TUPoKeZu40K16W35H7i/LAjP/CK5CePP4by
         m3wWYSt6u2kJJKoSa2ND64kLXzLPaMnUeiHEdVagt17qbGAsMMjZ+HW1iiBpBccpBteC
         HoxEdVqw8E/Lny8rgrqXz1aGKoMlduU2WxPt8aIHpELeM9Ch0IXDXvEzypocoYgC7/pn
         HdvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784815667; x=1785420467;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=spoxKFkJYFtNO9/qiIJmkVDjM3q1Nm82GTeSKSVFves=;
        b=PFKa0Y7q+/enbpRyZo/AVKjJ/Lt9Nj/g50B/99CFjau0moqbnfSRfIuiUCTjms/4me
         I235XgRlS/wmvpwgbkZOHHiJNyWlbB6sJVpmCS323DB5Bw1K40gaEBlvjz3CuaL4g+HR
         Ttq1Kxwr1MqQDH23x84Gf9OrCf6mXzGaSmTSYIOhpEZu02ZDpNQEtPs4YE9wu8JHuZby
         8QYZt4eDb06AUnYHVMAhK/o/oGhwEP0IVYOjx7QRWXqssibbsE+QnBRffIfwdx8WjT2m
         fL+V+LfvA8dGOcLkoH73AtbyasXBvu1mnFRON/RlPa+tHhhCpYUZ6rNzcn07X4GAhC2o
         7seg==
X-Gm-Message-State: AOJu0YyRCbhHR2wzJqFKGhGswx4ZR9gz6Lk1bgvf0nW6Xt1gLAownzVp
	OQBYctek567ErO+jhHjHAF1YkgZ13ITPiMM4pbP2yAAYLqVa098j++TaPX9ZMQ==
X-Gm-Gg: AR+sD13nfrp6LjyE8lvhyWFAf1I++riKTHYI0uT/1Hyh0tE9g3G2VmyZh8Vtlds7ABl
	Ks5QNSKb6H42JG4kklUyQPb+k6ecM87IfJNSJvvtjyi+tnBK9iQNIXuMTAsXN7l/2EoorT5jEAA
	faeEM/gPFfE6lp559Kh6p4/zq1Ey9KvtAvxZnVZzACeaQTmwaDNi8x2uv+dVpWwejSmoJ9TMQEU
	XQbcVnfy9bhKR9uJGLu/evuUPucdkm4Q5SWfpW8/7EHnsJPjwyb81pFdsg5PzV3d9qwgZrLmz8f
	JDG518olSXk8CZwPJMvxVGPUB+EnUsURI/rRNOSOrLljk1n00yRqPctoVb5CO5gV7/lWjkU26hk
	pTDj/AGL0msYMih1PhE45IjLscbk9t7zg1T7lMTszu7TgXE9YUGyeeCSFcuJ472RbPrnmdjqzAF
	L8hSt7uZhftrXsDKUKL6pLwneN7RpYM95FNv6EkmkfgHAKtxK4PF4=
X-Received: by 2002:a17:90a:f948:b0:38e:c8bf:f326 with SMTP id 98e67ed59e1d1-38ec8c00218mr1879749a91.9.1784815667274;
        Thu, 23 Jul 2026 07:07:47 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38ecaac5d68sm1117772a91.10.2026.07.23.07.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 07:07:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a04cc256-4c60-4e92-b196-47aeed1d5453@roeck-us.net>
Date: Thu, 23 Jul 2026 07:07:45 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] watchdog: Add Nuvoton MA35D1 watchdog driver support
To: sashiko-reviews@lists.linux.dev, Zi-Yu Chen <zychennvt@gmail.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, robh@kernel.org
References: <20260723060755.1596858-1-zychennvt@gmail.com>
 <20260723060755.1596858-3-zychennvt@gmail.com>
 <20260723062030.B20F41F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260723062030.B20F41F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/22/26 23:20, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 9 potential issue(s) to consider:
> - [High] The `ma35d1_wdt->dev` pointer is never initialized, leading to NULL pointer dereferences in logging functions.
> - [High] Read-modify-write operations on REG_WDT_CTL inadvertently clear W1C (write-one-to-clear) status flags.
> - [High] Missing clock domain synchronization (`ma35d1_wdt_wait_sync`) after writes to `REG_WDT_CTL` can lead to dropped register writes.
> - [High] Driver overwrites `wdt_dev->timeout`, breaking the software heartbeat extension.
> - [High] Missing cleanup for wake IRQ allocated by dev_pm_set_wake_irq(), leading to a memory leak and permanent device unbind/bind failures.
> - [High] The driver fails to check if the watchdog was already enabled by the bootloader, causing unexpected system reboots during boot.
> - [Medium] Unsigned integer comparison against zero renders IRQ error handling dead code.
> - [Medium] Integer overflow in `target_ticks` calculation triggers unexpected system resets for large timeouts.
> - [Low] Unnecessary dependency: selects `MFD_SYSCON` without using it.

Please fix or explain why the issues reported by Sashiko are not real.

Thanks,
Guenter

