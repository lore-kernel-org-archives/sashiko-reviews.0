Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D41B238C36
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 09:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780564698; cv=none; b=ECkv2e93w9YR7sDNHN/jmPKdlGA1kjUseFsChZS93dMngKWvmZat147MoTWoNwIsmb70BqmW1yknoRD2HoCHNI0KaGDIM1AzaWII+Zw4/1KFuYya6oQ/AAMi+rsWltU8BBFSW4WbWFE7tdoOlOjdeULR1m6rT4JQFWhfaaus7R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780564698; c=relaxed/simple;
	bh=Mpu1O4t7OQcsTOr5C8ljDCMbWiLVCF2byHGao00K5Kg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MOGGYr5/HNuNUfG5jLmI0aXlhqLbPIT2wZcti5PMKMXDWLBr4MXK9V0PlXeiLTGMr1+wegfrEXiyqbdlc3UinbnPd0+IfzBtBE8FnEjjpzQXJQzeX/Pu81EKPn2qMTslxvTX9ZSgQnYRMN9hyHFW9FnZ7Kan2xTz+Bt/H0eBKgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J0LeenhL; arc=none smtp.client-ip=209.85.215.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J0LeenhL"
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-c85d8615b09so306945a12.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 02:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780564695; x=1781169495; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9dTSEEZGMHnZUETkD5f3nrjeQdILJk7hEEyXeY0PvtM=;
        b=J0LeenhLnMP6MkNYXc42NcAeOcq9lx/TvXWoDirio5DvIKnkXO3+IWX4035ggcnAfJ
         vtPm71wUFTrEMTg64zNlGHKfbPqqfZoIVXJIAvnV3r1lMWSedzm3pzCvR7dGdUCoqq2h
         OBhNECcZlZdI6navfCo9FDf0ob+H5a2gHQK3q9AeyIusWbBR7VNvYULZbDdLIPKrK018
         jPHNCKUzsQF7thd0OQs9ucRIFgVegAZS1rof+HWdJMfqG1v7SXevz6zKlfdG56y+oGrv
         nmYSX3deClI3yvCvuHhYBN61svSJmwIw5Lr8oh+Luh8Gpp18fA6w2Q5s3VsQxAsrRjd9
         9JuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780564695; x=1781169495;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9dTSEEZGMHnZUETkD5f3nrjeQdILJk7hEEyXeY0PvtM=;
        b=opMUH/czZ5a7bSs+TWpJrsV4z4Q92eDDaZWZb9W2ZJ6sWqEXqYVkbwvy+qzeXbX6y1
         Abe1sTFxbHQYO35WHJz0qSUqBV8BDpaH+JkQc5P0XPc1zYI3gFushiLirRYvKABl+pSz
         /umVx5TmevOOtIUv5ZFAn4Y4L7zGU0eUiortIqgZD5EjMLqPQwf1I+aNhr7Sj/R1WcrQ
         bCA7OKmWl5EN/7VvgTfKN63v7+Ct4eJ8SQXhDFYmcrghl2xXwqRWKCd3frJwACfZUMP3
         PyerMJcuHtdEm51UT2JOcSFMAygzrzckkirvyUSIudIcAL0zONWd23WbPddzppz4fTWr
         C/ZQ==
X-Gm-Message-State: AOJu0YyqnLayYHg58bAW2sAb5GA36OFuHH0qOu8tqkpDjTHHcE+GidaG
	OAmsyYqUxCaxWphvdC8z7Z2A0nWQglYw3miw2WAAIUisyubof22tETstXfOROdMbps33QQ==
X-Gm-Gg: Acq92OFeV9vQ5yuCYCO/DqtpluScxQoB1/V7sq6fYCT6JrX15jPjZ2R6xhIWCkp9+As
	Nw10X3+0HsSaTxhW1oHOiBG824hZYMVz37SjP31Q6g2csvqihYpQAc/9X6YAYYSSXSW5PY+IhOM
	9J/+VSttSpoKXi5sVHOReMOgkNJNXQlxWq18x1fdjCo92yN/Hd62cYsr5ceM8DpeVbYDGS24JIq
	zMzWvKMXlcyNpED2+eT179R6T9udJPifxeeNQOQjWeTgoS43I+ToYoPiTqq9cPeU+MqU/HhcK2h
	3bZCZd+GxY2/bgAZe5eIaC70tSHA9lJa6hqoY6BJzJxSJQeEU0bbc5Jx1VJxVn1TJbTeQjS+Kd9
	XRf/fjRFtrdQj0pWN+3vTw/PAkxtau60CSxH1OE/G/b4Eb9x3QIU557Adnwd2oDkTW/mLKVH4LT
	EQdFDGPuwN5AzoU/cZ9AV4HYUgxOOdEQpK2+YpmIRsJv+nXtNI+ffc
X-Received: by 2002:a05:6300:228c:b0:3b3:1c7b:ff0 with SMTP id adf61e73a8af0-3b497884d60mr8050475637.32.1780564694812;
        Thu, 04 Jun 2026 02:18:14 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0b315esm4353216a12.26.2026.06.04.02.18.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 02:18:14 -0700 (PDT)
Message-ID: <757480ae-2d7d-40e9-9900-edd14ed3b3ac@gmail.com>
Date: Thu, 4 Jun 2026 17:18:09 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] of: reserved_mem: avoid stack buffer overflow in
 fdt_scan_reserved_mem()
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260604073611.3954433-2-chenwandun1@gmail.com>
 <20260604074520.D5B181F00893@smtp.kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260604074520.D5B181F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/4/26 15:45, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The newly added bounds check for `dynamic_nodes_cnt` is placed outside the block that evaluates whether a node is actually a dynamically-placed region, leading to spurious error logs.
> --
>
> commit 6a79f526de5e1185b7c79fb469545f4094fb402f
> Author: Wandun Chen <chenwandun@lixiang.com>
>
> of: reserved_mem: avoid stack buffer overflow in fdt_scan_reserved_mem()
>
> This commit adds bounds checking on dynamic_nodes_cnt to prevent a
> potential stack buffer overflow in fdt_scan_reserved_mem().
>
> Link: https://sashiko.dev/#/patchset/20260604015332.3669384-1-chenwandun1%40gmail.com?part=1 [1]
>
>> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
>> --- a/drivers/of/of_reserved_mem.c
>> +++ b/drivers/of/of_reserved_mem.c
> [ ... ]
>
>> @@ -341,6 +341,12 @@ int __init fdt_scan_reserved_mem(void)
>>   		err = __reserved_mem_reserve_reg(child, uname);
>>   		if (!err)
>>   			count++;
>> +
>> +		if (dynamic_nodes_cnt >= MAX_RESERVED_REGIONS) {
>> +			pr_err_once("Reserved memory: reached MAX_RESERVED_REGIONS(%d)\n",
>> +				    MAX_RESERVED_REGIONS);
>> +			continue;
>> +		}
> [Severity: Medium]
> Will this bounds check trigger spurious error logs for statically-placed
> regions?
Yes, it indeed, will fix in v2.
>
> Because the check is placed outside the block that evaluates whether a node
> is actually a dynamically-placed region, it evaluates for all subsequent nodes
> once the limit is reached.
>
> If the number of dynamically-placed regions exactly reaches
> MAX_RESERVED_REGIONS, and a statically-placed region is processed
> afterwards, won't it incorrectly trigger the warning claiming the dynamic
> nodes limit was exceeded?
>
>>   		/*
>>   		 * Save the nodes for the dynamically-placed regions
>>   		 * into an array which will be used for allocation right
>>   		 * after all the statically-placed regions are reserved
>>   		 * or marked as no-map. This is done to avoid dynamically
>>   		 * allocating from one of the statically-placed regions.
>>   		 */
>>   		if (err == -ENOENT && of_get_flat_dt_prop(child, "size", NULL)) {
>>   			dynamic_nodes[dynamic_nodes_cnt] = child;
>>   			dynamic_nodes_cnt++;
>>   		}

