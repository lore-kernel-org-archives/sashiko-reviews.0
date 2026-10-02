Received: from mail-wr2-f32.google.com (mail-wr2-f32.google.com [74.125.225.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954CF44CAE4
	for <sashiko-reviews@lists.linux.dev>; Fri,  2 Oct 2026 11:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790942332; cv=none; b=gM7y+Rc4HyQS/IcLvSYjiZulXYGOl+mZ5Ftbb15Uu6WqLAutqMhkZI9FqtZk/40bBl+d2aE+OygPqMcNmkEmeVoOBBnmhq/GJvBekf0VBltlsOyJ+pREbVizfafFoXHeLr1ma3dvbE4nI2ESmJT04dcjIj7FkWJHBjMow4md+8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790942332; c=relaxed/simple;
	bh=LlZxGGTvdojYdT8k3tDVdc8QzvkSYhyl3Z1KAuLonF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cGTrPxzkVeu/YPrMfoBTwtVnlDZdtKOiB3fP4DKUO4gguOqpz2oEBWsca3Hwq0PYAWuln4xuYAhsSIipAS1p2gBNbkqwFAaUvsBuKGVZhcsw+TarqXk6uTdnN2JrfqomZuLgiQuOvTMXfTAko0uOFWv4+Zd8tRUEsaB4cXcBiXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ORPC4Sfs; arc=none smtp.client-ip=74.125.225.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ORPC4Sfs"
Received: by mail-wr2-f32.google.com with SMTP id ffacd0b85a97d-482f6350f91so4402759f8f.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 02 Oct 2026 04:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790942329; x=1791547129; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HuDPir+q4FERrKXQ8zp3kgZyGxkcWGZ+Inj9ACfB8ZM=;
        b=ORPC4SfsEP3bsQ0Z7VVroheqwIwSf7CtWiAhChaXQtBBRe+/+o2l+OcH1k7B5BSzld
         62zJpu7+GHeD9FUvuMl4YhVunXItiYoirfrY5PveeiPIvac1dss+ceB9FGFvkeuexU5W
         7Nb4QpaW97wYJ+8dl3mRMetfjqy6GINMmxjsm/Ql1fSzi7uPaaFXvyqS7veXWQkxLYMH
         QUYWOeSdt7rHZa6GTHND9/lLxHVSO+wt1EkOrQABQ5WVNltgPZlqsZE2z5Yo7e+Zmg1x
         lVDMZ7MsgP2LmuaYBmabr5s6qgdDCXEyUC4csdRbjk1S1UVuj1EG3zaGNtnvc2Nc1FCT
         LG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790942329; x=1791547129;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HuDPir+q4FERrKXQ8zp3kgZyGxkcWGZ+Inj9ACfB8ZM=;
        b=fFKGXuDxnN0IbTgq2Gx18Ecy1QYFHE9NJ8QnDen1/hylApL0wz5ykBMVqOzLqNisPT
         d9JvuTZQIrhcFWUg4F3ik/nzkZNJNIhIFErqvMm4eMbWtEUH4XoGiwDUZz+EvQhCrDcP
         aMkvCYcXPb2j5B3IdO/Fj1w8biVhjk7MlE9ZQo44CgkW5hk0Xf3P04heuxmnzJ19uEV/
         OiUuZ2lzfG2ZwtfuYPHTTxXa06L2+OG7icovtc572cxANOGwCjxJJVfBFSCTWDyE8AcP
         ZxM7XWMM98iZvzYBGamFHRqo6TcacKgZWPWWhcop2RgoJPQIe5SZ+pe8hTvIhh1snpAe
         nGZQ==
X-Gm-Message-State: AFq9FYKkNa9hD0aK0FL+hy7dgZCugMnppGyDcYpq2uo1Zcs7MDKnwd1m
	FpprvokdBTmT1C1hKYw/CNkVvbmVdEuB7y+zXQS/nUZ0jCs7sbjjxsE+YO+a63zGIX0pKSM3UTp
	d8zFAYrY=
X-Gm-Gg: AYBFou0CfBezjhazGEiSGFbcp6lP2rM3roLg5qGvp3WESX2qDkhrfzeTwiJx3ljOKv8
	KX/9Davz6MGIvflZGXveHLR1/ykGTnXOMsZXOzaJh7dHra27AEEkqTWR7JCc04palI1OrWjIk9a
	WJfotOqgAx2ySmE5mRYu9CqwG+tFLGb4zvrgeT0050r73kWAqlEZ2kgspn71lmMGcFhLiRv781l
	bVMgyBa0qDklmgLdDL0tb9ISX15ZgkOuvKYjzEu8dAkLsoN9QVxG/ZU3MKVuFVp2ijso1hx/8pr
	wST2y9Wp/zO2OpoFx7ykfkwKtjvTAtGk6imuSOgoHVRAfKmygfg/b8AEZYAX6LjEoC4bFXTbQnL
	Kr24BncBsPVqxbZPvG4OIPe0mDjwwJV/WHgJdyBcotJMICnwoAx2IvethHoQU+KBY74JTLTgr/u
	f5mmFCug0I2stfVSI/f9f6ZSzEUdpjrWvE93JbCXSx3ANRKlJtp1l2ty94mhqKrUPCoBhr/Q9kX
	mZqfDj3nW4OhPHmn75oKpZ0IMkdMeMtFdI=
X-Received: by 2002:a05:6000:27cd:b0:486:f620:63bd with SMTP id ffacd0b85a97d-48b125a19fcmr3400232f8f.0.1790942328677;
        Fri, 02 Oct 2026 04:58:48 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380faaeesm5023947f8f.18.2026.10.02.04.58.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 04:58:48 -0700 (PDT)
Message-ID: <c166a29c-14f4-44ee-81ac-d79c82175fc8@suse.com>
Date: Fri, 2 Oct 2026 13:58:48 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] module: Add stubs.c for CONFIG_MODULES=n
 module_put_and_kthread_exit()
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org, linux-modules@vger.kernel.org
References: <20261002-module-stubs-v2-1-a0d8c6ad1738@suse.com>
 <20261002091451.D4FBC1F00893@smtp.kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20261002091451.D4FBC1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/2/26 11:14 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] bpf: resolve_btfids build failure with CONFIG_MODULES=n and LTO/GC
> --
> 
> commit caaeb9d0651743944c690c066494bb16509c01e9
> Author: Petr Pavlu <petr.pavlu@suse.com>
> 
> module: Add stubs.c for CONFIG_MODULES=n module_put_and_kthread_exit()
> 
> This commit introduces kernel/module/stubs.c to hold stub functions when
> CONFIG_MODULES is disabled. It moves the stub implementation for
> __module_put_and_kthread_exit() to this new file and removes the
> corresponding #ifdef from the BPF verifier's noreturn list.
> 
>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> index 72a3f5998dd27..be70f10e49682 100644
>> --- a/kernel/bpf/verifier.c
>> +++ b/kernel/bpf/verifier.c
>> @@ -20417,9 +20417,7 @@ BTF_ID(func, __ia32_sys_exit_group)
>>  BTF_ID(func, __kunit_abort)
>>  BTF_ID(func, kunit_try_catch_throw)
>>  #endif
>> -#ifdef CONFIG_MODULES
>>  BTF_ID(func, __module_put_and_kthread_exit)
> 
> [Severity: Low]
> If CONFIG_MODULES=n and dead-code elimination (like CONFIG_LTO_CLANG or
> CONFIG_LD_DEAD_CODE_DATA_ELIMINATION) is enabled, will this cause 
> resolve_btfids to fail?
> 
> Because the #ifdef is removed, this unconditionally requires the function to
> be present in the BTF. If there are no callers in the kernel, the linker 
> might discard the stub function, causing a missing BTF ID and a fatal build 
> error under CONFIG_WERROR.

This is a valid issue. I think a simple solution would be to mark
__module_put_and_kthread_exit() as __retain.

-- Petr
