Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984D935CB87
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 20:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780347189; cv=none; b=CGNQRckJRfSBsr1XDALP9NO+DG44qbiBBrfvNi3JlUWbGGyEDAI+h7N1A92e8tcKOuAVVxpg++jlXB+0+LlSnuNa5j7Pk+mg5GiupUHQHzkXp1NgKF09hHmvGM6FjIawO5LU5tYpgouKcYEcObBJ6k1ycDGPttQ4mmDhqWLeqUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780347189; c=relaxed/simple;
	bh=KoP13Y6OZWScbESb/LUoe9UoBT5GkYRp3ikpwv6Ctxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FP+PjenQUHuiTu5zrfzxIeaIpZIs8cXGTb5OqoZ9XiIjnHfG4Qy+BaRquji6hUn/SQYC0k7z/Q0wLhvzH5YiRsspGci+CDNKg9rWpA5kNqQ65k1tDm8+LJ5v2r88YXCYXd1tWSmf+Bq/4UcpA21nbCrGR6AWLky0AMn+bC0gl38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bc2IniGb; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bc2IniGb"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-68c19f1f3ceso5292494a12.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 01 Jun 2026 13:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780347186; x=1780951986; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=foWgpeWyomyZgltEG4IvNdN9+2kLzERIP5xs7MGfKH8=;
        b=Bc2IniGbuv6JGQnZrlOstal2iXuLpiUoFle9s8woNRiZXjJZ6YnCM3im4YypRki+2k
         xCvG4BsuJkoWzijV1rfeK/uCSZP+u7FRrMjEWmfTOxi2teJfG1aMntB4uZLVWXI1AacS
         stk08QmNs2uTOJT7PCUd0q1/ID1ipiCMZNvWjmsefIlkJF3hBuBROh95IXYHcuHRwZg7
         AnyTyuNmT0xaI8AQ92UdsFmsa+Ac1ldlmWtjOtNPjSklU9bW9wyD+C2B7F3D14ilTXnw
         /MCSm/prGvmLylc2GkPBzj4jY7nMbNIB3Q3jzdW7yfiNmlimpyyx446tScJ0wmdVb0BZ
         YVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780347186; x=1780951986;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=foWgpeWyomyZgltEG4IvNdN9+2kLzERIP5xs7MGfKH8=;
        b=NShDCJsdNLYIaQgGQZLgreGPdrxY6JMK32ygDQRZ3irUMP6ePGGzLoHhWQFmkvZdA4
         9Qjf/6Q7b0ZmBxbO5+xEcgXhfy8ppkN8oS0lnLZt8lBK6cBJdGqmTIGnATHCphKqeArr
         penG8VlxSTSMUOHepsDHRFKQVz1sTgs/VRaG+Lsjtm9BY9l7JrlkUWlZK8cjLWUTnqHW
         RFa6n7MOLftIheWR5rEO8YzmwjtkVQwzsRXgp8YHroqxy766ZW0thnEF70mhI+J+f40a
         SZdlEEg0iK7yWsfquCswOZIpQh5n8RHcknMyxMOmnuRgcYJpp1fg2HC43o45oijJTHdn
         fxWg==
X-Gm-Message-State: AOJu0YxysLt32ov6otJbMmD8l5WV5R4+fePhzgA8oEpOsQ82N2LpI3v9
	1KcjSRINtfFmow/RRvuEbRY8d2boaqD3qOpMWV7HLAB3KQnBKjiyiSCBh0Uw5IJJ
X-Gm-Gg: Acq92OHeMc1pb7D0Jb/v8fKQXpoU4jB7MT8g5JFeRyKlcL3XOhO/1GxUOA9kldfM/9p
	xYcp+X8Zv2SKqFCBOnNI0qM8xQ7g9GB5sg04gmDYXNw9qZtGqD3wer6SDJbTQ1pmRvQWHU5NCDC
	wdd9Jkl1UJbjMKk0K/tpVk62iVyypEulATGsegcy1pKN2EvZbs2sdWMy66woO9aV/iJacTwcWSW
	zqjDWCrxxwhARXU67hWHB4vNI3jUfcuJC9HpAfdOMt4A5jq92+8KSx9tvkp2XwyZ9i+V9+8QN+d
	Af43pA8UexdFRmVqWKPeUBcqkpL57Q2uG3E2lzVb1eVRr+Y7Qre8g0wUrfZNruimFYes7nXCa8k
	3k5VPYbRdECWAY2IZZcHc3zT195pnjYz0YRV3XEKumcH0EhxvBC1ygWOZD3CsPC4HhqlWoIrz11
	hx2BIZJtdUsPL/RT9Pgdg77BNAOz0vrkyh9OM1pROcJ82IAA==
X-Received: by 2002:a05:6402:5209:b0:687:7fa4:faa0 with SMTP id 4fb4d7f45d1cf-68c8d5da27amr7167090a12.23.1780347185751;
        Mon, 01 Jun 2026 13:53:05 -0700 (PDT)
Received: from [192.168.10.9] ([39.40.47.211])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68ceb869dfdsm2539335a12.29.2026.06.01.13.53.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 13:53:05 -0700 (PDT)
Message-ID: <71d7060e-6478-4884-94f3-78da4f90d35d@gmail.com>
Date: Tue, 2 Jun 2026 01:53:02 +0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/include/linux/types.h: add ulong typedef for musl
 compatibility
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
References: <20260531144934.403888-3-hisamshar@gmail.com>
 <20260531150112.5084E1F00893@smtp.kernel.org>
Content-Language: en-US
From: Hisam Mehboob <hisamshar@gmail.com>
In-Reply-To: <20260531150112.5084E1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/31/26 20:01, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Adding `ulong` typedef to `tools/include/linux/types.h` causes a `-Werror=redundant-decls` build failure in host tools like `perf`.
> --
> 
> commit 88e8d7a9a4205d14733be0e5978d3a32589a15e0
> Author: Hisam Mehboob <hisamshar@gmail.com>
> 
> tools/include/linux/types.h: add ulong typedef for musl compatibility
> 
> This commit adds a ulong typedef to tools/include/linux/types.h to fix build
> failures in KVM selftests when using the musl libc.
> 
>> diff --git a/tools/include/linux/types.h b/tools/include/linux/types.h
>> index d41f8a261bce8..ccc90dd4baeb2 100644
>> --- a/tools/include/linux/types.h
>> +++ b/tools/include/linux/types.h
>> @@ -42,6 +42,7 @@ typedef __s16 s16;
>>   typedef __u8  u8;
>>   typedef __s8  s8;
>>   
>> +typedef unsigned long		ulong;
> 
> [Severity: Low]
> Will this unconditional typedef cause a build failure in other host tools
> like perf?
> 
> Because glibc and musl <sys/types.h> also provide a ulong typedef, adding
> this here without guards triggers a -Werror=redundant-decls build failure
> in tools like perf, which compile with -Wredundant-decls (via EXTRA_WARNINGS
> in tools/scripts/Makefile.include) alongside -Werror.
> 
>>   typedef unsigned long long	ullong;
>>   
>>   #ifdef __CHECKER__
> 

I couldn't reproduce this. C11 §6.7p3 permits compatible typedef
redeclarations, and -Wredundant-decls targets function/object
redeclarations, not typedefs.

Happy to hear any feedback on this.
