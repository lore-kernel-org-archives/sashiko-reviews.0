Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1611C30FF30
	for <sashiko-reviews@lists.linux.dev>; Fri,  5 Jun 2026 02:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780625466; cv=none; b=i+JSuNjBm3jqLtSxdy5t1esJSzI+MOeb14P0jeTnQ5lXl6en3bgJJHT+0M2HTrO4rY61eDTY/q8UDGJx7pEuQiRvg9lkninzKwKaT8zYpdbBpnyyTBpjG2RZxkDa3JPmBLCslecFNrIo6c3mlvX8hCi7NLK7QkQMrd7QsxHIH2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780625466; c=relaxed/simple;
	bh=rt8QiFKCUtKyRyCjlNWltkcE+h7JQzz3Oiq6lIOH/YM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RXvalnys4nVpMg6Wk42MlRc0bUDs1OI14Z/YAlq9NRrXmiEqpXza1Zof7Df6mknvw4weIvPXu3EyF9qirn3FtzHV1rwhO9csZi+cp5HsQMVQ6uvlaGVWgXON5g5+irLNF+GCT203Sz5bFU2uSMiT8VxlwCsJ4yCWmxygd+90WCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nWrjr2zB; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nWrjr2zB"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-84226d0f1d2so965177b3a.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 19:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780625457; x=1781230257; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ULATv2+XYxYgQ4SMTbT2+7ryN++47TE5p2N63JMlAZU=;
        b=nWrjr2zB8mi537SXjiw0wl6s0bEQHuhhQSkZv5fr78WqcvHQRjfYiaC1nRBjgiz5E1
         2xDI7KlqVz/5MVPDbf1xyXkjH1bs5zj8v4IzYaUUtOe4R+WgmHIfJq6K7uRPGriyEnaI
         Florfw9Q8Rpw52IM9RTEQVZE9y7MmVlRSc/4lK4Xte3aWx8QfTgga9fTgxGAJe7f4S27
         eRk6Swz+WgORheJAWOQYKmrM6sqGQfeQLjd4MyoLb3KxsHlRYJLxe5B3F9LB98LRmd6V
         8OFk+86zEjwjk/6gPHGH9jiTYEM664yLKK/wF31BGnmLMbfdlPhTSjPDJEyLTEoNsXwg
         goWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780625457; x=1781230257;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ULATv2+XYxYgQ4SMTbT2+7ryN++47TE5p2N63JMlAZU=;
        b=ifeTtmoXPl+3efsO3jUzjMeOI+TcdNT2Zd20GtAAEkDcL2Y/Cm+uPlTk6XnnoCBw7j
         by7e/KVVGOBwCG7ovuUjrALfcr9uT15SrsqBcAP+YbyujT8JF47rKOtKfljvp+vvN0n+
         8pdzMo7rMQkpPViVkc5a0Mp4DDKbMKLNckwAZiJgxQXMUIKPQHWP/ts7P7wsnoFDJfi8
         JGjLKcTAIpsu3TGY6QaqTxIXMnBR7p4vipqTWVg+j0z0UWgkc3bRcBqhzreNL8fXsrQR
         Ng3hdF5dkPn87vaJQetr6kaDpAYRDxmdBtki+7k3Du0eTD80mTd6mAJ6NlkQvC9fJI9K
         oKuw==
X-Gm-Message-State: AOJu0Yy9BZVd2o8KC4mHU1pYZ7MShSc0b/Mm9Uk694KFw/f5mxOPd61k
	Ln9FtUwXRJczg1QjwUL04ql/5p+gd+9F1DwamGiIsl93onCWvyjPjPoG
X-Gm-Gg: Acq92OFO+WN7rgttW56t1y7qIBR2nO0q/0EWOTLjcy3jm8QeT5JfzlctfFyyO1UWaU/
	S+7LKeyzuwjDvWRYTRA3CtbtshSlSpdu8cxa1QQCTOeLiTiBFckM8iplQ7w2T5w8OU9VxweRp+H
	xLRtw+G1xpCzlPXTS2cIEjOOTtXJDVJ603ZLAqrMzf8aPhCJRcc1EQh3RP3xq6kqPahDjNXf40Y
	rFKsWY2Sg9WgbCAk2q1xxrjhToO031LEKX2KUBixzXqt4VFBKNFibPDft46MEGkyqQIL9Wdcjv8
	Q4SE1hVdPEfUAhqx1gUKPkWO/FhycuJg1uMLbDt7XH14x3tTb7TXlt7+Kh2uR5kY7edX6FOmHTF
	lgn+CRA2YZjTyhZsdY9TCRq6b8my4CLhCw3wDnJ+R/TUmCubGDlE+Ha3xed/S6IZRyCW0CtunDU
	sVNByjvss8PP1tGw3p38WnXwR3SSj0LYf6BrU/0kFAcA==
X-Received: by 2002:a05:6a00:a227:b0:82c:6683:b866 with SMTP id d2e1a72fcca58-842b0c083e3mr1205470b3a.4.1780625457100;
        Thu, 04 Jun 2026 19:10:57 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428288217bsm8833262b3a.37.2026.06.04.19.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 19:10:56 -0700 (PDT)
Message-ID: <b8a5e883-16be-4106-97d3-d4ab69faa8bb@gmail.com>
Date: Fri, 5 Jun 2026 10:10:52 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] of: reserved_mem: avoid stack buffer overflow in
 fdt_scan_reserved_mem()
To: Rob Herring <robh@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
 conor+dt@kernel.org
References: <20260604073611.3954433-2-chenwandun1@gmail.com>
 <20260604074520.D5B181F00893@smtp.kernel.org>
 <757480ae-2d7d-40e9-9900-edd14ed3b3ac@gmail.com>
 <20260604193041.GA1057262-robh@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260604193041.GA1057262-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/5/26 03:30, Rob Herring wrote:
> On Thu, Jun 04, 2026 at 05:18:09PM +0800, Wandun wrote:
>>
>> On 6/4/26 15:45, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>>> - [Medium] The newly added bounds check for `dynamic_nodes_cnt` is placed outside the block that evaluates whether a node is actually a dynamically-placed region, leading to spurious error logs.
>>> --
>>>
>>> commit 6a79f526de5e1185b7c79fb469545f4094fb402f
>>> Author: Wandun Chen <chenwandun@lixiang.com>
>>>
>>> of: reserved_mem: avoid stack buffer overflow in fdt_scan_reserved_mem()
>>>
>>> This commit adds bounds checking on dynamic_nodes_cnt to prevent a
>>> potential stack buffer overflow in fdt_scan_reserved_mem().
>>>
>>> Link: https://sashiko.dev/#/patchset/20260604015332.3669384-1-chenwandun1%40gmail.com?part=1 [1]
>>>
>>>> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
>>>> --- a/drivers/of/of_reserved_mem.c
>>>> +++ b/drivers/of/of_reserved_mem.c
>>> [ ... ]
>>>
>>>> @@ -341,6 +341,12 @@ int __init fdt_scan_reserved_mem(void)
>>>>    		err = __reserved_mem_reserve_reg(child, uname);
>>>>    		if (!err)
>>>>    			count++;
>>>> +
>>>> +		if (dynamic_nodes_cnt >= MAX_RESERVED_REGIONS) {
>>>> +			pr_err_once("Reserved memory: reached MAX_RESERVED_REGIONS(%d)\n",
>>>> +				    MAX_RESERVED_REGIONS);
>>>> +			continue;
>>>> +		}
>>> [Severity: Medium]
>>> Will this bounds check trigger spurious error logs for statically-placed
>>> regions?
>> Yes, it indeed, will fix in v2.
> I now have the same change (and same problems) in another submission:
>
> https://lore.kernel.org/all/20260603152709.941788-1-ekffu200098@gmail.com/
>
> See my comment there.
Thanks for pointing out the other submission. Since the same fix is 
already being worked on, I'll drop this patch. Best regards, Wandun
>
> Rob

