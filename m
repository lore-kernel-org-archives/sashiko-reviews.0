Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8825835B634
	for <sashiko-reviews@lists.linux.dev>; Sun,  9 Aug 2026 16:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786293454; cv=none; b=de7zTaMBoTjyKfUwCbSGnik+0ZxVoBip7L2+MeuwQYbNhCAGGqg3v+/ObtNRltUv4PwI7usD+VPgXggq/YB1JIuke7qd1be1VD5p+qVFuM9joIVNNtyWz2ugTl/5T52ewcu3XcU894Zx73dgNOFzQIp4Y6NR8mkpnh/2QuI4Vdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786293454; c=relaxed/simple;
	bh=U4Dfe6LulmlhLMcYznjgZFjzZyuRSYX5gvNnyR9maJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nqZGgY+9dgaJr2mDUW16aVk+7FiA2yrYlU0/jtpqm4hgjTMIjYFdPxhUVedywFvCaX11chseiLe15u6SIAfkn+aRLjAmSOo2poNxk66SLGJCnzARQ314wA++F/BLbVlHKJqLrXJ2AWjF0ZDRfiqCM5GcODH0XZRn00HzaWEATF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JR0f7idl; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JR0f7idl"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so905342a91.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 09 Aug 2026 09:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786293453; x=1786898253; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xJ3QfR4JcC6xq8/4tTFJy7W7B/sPjOiUwEAwX2O+GS8=;
        b=JR0f7idlUiPl7QLpfkeCUo3CLDNRvZY+ZCakX6XNNRZh7PFqZfC+gPEcLQ163JS9wr
         KEBS+0a8MPu6gaqAoBP4d1azIxBAbpWnEKT078OLFjPn2L9cV6ZpG5B5Y046ezKleBek
         jTh5UGfnK+L5Ox0jFpnQsiROCHGi/s0UtoeYYqlkJO/lmw27VsBPCdg1TQ89GDdyGAr+
         wuoJwmDUkKTqQhuVXQe3QTfytssFyrY30lP55LEGW+2SX4fVc0ooemhlS/wifcBkUVxN
         cHpzNVOHhH30RqsuLGm78sL18NyDWnLQUuZMUJjVyGZbYV516ptHnQfimxvxepq7UUrS
         MyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786293453; x=1786898253;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xJ3QfR4JcC6xq8/4tTFJy7W7B/sPjOiUwEAwX2O+GS8=;
        b=ll0gb9XcY7TA/hGViY1rzwDMzxowEuzvNaoPB8ye+Cl5b/yTV3ayR4f64FUAB53xyw
         cpIft8q99WEWZMHdO2sKy3DKT6t84z546YTNauQF2xDSlQ+lCZ4Ouoo0mufhjb7ImpkS
         7iZCBlcJVJaLYUIiTDhaQtWHesPJQFZi9qghjb6W3RY7ssd3l1gZ9w2MVDxLHaMII6nS
         n7hoEFVlI7Qt6uDSCXRCfJoyqa5c4yoonYa308PCswl2Bram5ZeiHJEdoc5dMZm90Dgi
         8hfgAjJS5hUMyZC4iNwJ4Cqad55IK9pVvAWAf6/G07sllEZpGfcavSKkqsUVqfF8Wr2R
         Xy3Q==
X-Gm-Message-State: AOJu0YyNpbsrY82LwFVQV7p3Rl4c3ySsDcp5iqdQgQLqRfXg2ko6e2wO
	C0t8Xg3Pk7s4Yf0Si5zA5monIgBLvl1u6T8qM2FkE5SukqMvmYf11PT2Luo9Ww==
X-Gm-Gg: AR+sD10Vp6k5+sPBGpO78jvKz1u+MAez9CS7YwpsG9HSAYouAmakTHg6b6gyY26qBl+
	uzr7zl3w6GxindgIvLn/ppqwZ3aT88Q3FPFK/pIKYORay6qUAi55KbHZVxSGbA6nH071QowSOSe
	edCyTxR/dsnlINxstJwzJK8gj2y/8mhcEjOlh7DGjM5VQBJRg7h15kL/DePGV8/cXS6qfWYZobG
	kurggeMqOaB24MaMgAXA4nuQO4mcnlGUU7Vph62eNe2ZoTMqTRRV/IqJ3yuAGvbFsq2TNoootWx
	Y7I20VtqGyFbV1C1mSfSaAELyJO9BPTfV+TsXeNN2tIuZHBlq8+/s2VjOk1DWkTmiwSoWoRmZOf
	zLEpjR0nWOxptwCzqwIz0gF8T6OxQEX2TMrUbtIoVWrHVY219MHiquxrACKEKHOAcRK9v+YKSsZ
	R5WvTaKVRu09itsA7FPr8RiaziYvy1e6ZAtHlK1oh4fp5v55DQlGjd/J0FvWtFBDLaODRl2/1mw
	KUnYCF2PeOYg83pOZOXa9qnbHValLU3U6JDX6GH30/PBrGM
X-Received: by 2002:a17:90b:4a09:b0:37f:df85:272f with SMTP id 98e67ed59e1d1-3928242e8e4mr10270250a91.19.1786293452653;
        Sun, 09 Aug 2026 09:37:32 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1410199cf49sm27094551c88.3.2026.08.09.09.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 09:37:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5a817284-a9f4-48b2-9f0f-802c5dc6963c@roeck-us.net>
Date: Sun, 9 Aug 2026 09:37:25 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hwmon: (asus_rog_ryujin) Add per-device configuration
To: sashiko-reviews@lists.linux.dev, Arie Miller <renari@arimil.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260807000107.1786892-1-renari@arimil.com>
 <20260807000107.1786892-2-renari@arimil.com>
 <20260807001412.B61901F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260807001412.B61901F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/6/26 17:14, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> 
> New issues:
> - [High] Dynamic sysfs IDs (new_id) binding will cause a NULL pointer dereference because `id->driver_data` is unchecked.
> 

Looking at other drivers, this seems to be real. See wacom_probe().
Please add that check.

> Pre-existing issues:
> - [High] Missing bounds check on HID report size before accessing payload offsets in `rog_ryujin_raw_event`, leading to an out-of-bounds read and information leak.
> - [High] The `status_report_request_lock` fails to protect `reinit_completion()` from concurrent `complete_all()` calls in `rog_ryujin_raw_event`.
> - [High] The device is exposed to HID raw events before its completions and locks are initialized, risking a NULL pointer dereference and kernel crash.
> - [High] The driver allocates a DMA buffer using `devm_kzalloc()`, which breaks cacheline alignment and causes memory corruption on non-coherent DMA architectures.
> --
> 

No need to fix as part of this series, though of course patches would be appreciated.

Thanks,
Guenter

