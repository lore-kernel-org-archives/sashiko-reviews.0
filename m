Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9A83F58F5
	for <sashiko-reviews@lists.linux.dev>; Fri,  4 Sep 2026 14:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788530692; cv=none; b=pDDaOHb+v1/xquvQJTpBjpRHJ01kHGiBk99mI06VA6cR+j2CLNR9xijfr8orN3ykigSa7Fpa6iSZaRd3XjJxRMgtq6OAzXo7vndkz9r1BUCZl/5Q5gxBMgpSMpch3+5/X5IBE26jM0lp8/LgKAcAEkbAFWSnXrtb2gv3W2Rjjqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788530692; c=relaxed/simple;
	bh=N0Tq3wBr4CAjFB00AM90m7/84+fWcmZngE4AWv68E3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qU9Aq3yhXgEbNILEPq+XNHX2PqLN2k/IEGKrQK0bNvYbw/dPuZXkjTXPO4nonfBGErgub4pddexnaUnXavd2mRDdzitGbE7mcAv+AEiQDArh/ajHUv/0jDLIaT1XG+XIRESG+6XAmLhOD7RlhJ5J9z19QpGqZopRNMJSigruBDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=HEPzCxUY; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="HEPzCxUY"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-963f63fe025so381299241.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 04 Sep 2026 07:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788530689; x=1789135489; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RgvnR/pqmrGBFs87lYL82eHWSI/zVKIkSdkMcH+Sw9w=;
        b=HEPzCxUYwnFW3oXfENOtgp6jIQtzguv6qlaqJDHYOBOy8rMjfdthemmMb50GaqUddQ
         7ipbddgeLtldc85My4f6AcQv53+2ZP7YTSgQj/W3qRvHgHNeBNgfELSM8hL8NGUorjOR
         r2k8QxhyajK++287BiTrtSGUyzOZi7OByYUglFOW//qpGpstIu4KpBbezQilpvapWo7H
         /HlbvROVpI8qIDCU1LIGrav7yBXUlQrrTihQE8Z+OeUC9nDxY5rKCoqn/cCAfXsP/htd
         LsmS1EZGHc3o4+A7ny7PEOjJqvbEExuQPw7KkEycGtS08prtU49TjpNGOoOWaGmlgW0R
         Mv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788530689; x=1789135489;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RgvnR/pqmrGBFs87lYL82eHWSI/zVKIkSdkMcH+Sw9w=;
        b=US58htxCGmmZ2sQ/qJ9ak6RIJQ2kXCu2u59R246EurMYx8p4d7u+2wwMguWclJ6bRV
         pf2rQyqJtyeIvg0W0D0w1aab8ePcl4fAE9pnIaNTBxYaHzLBSKT9tozVc12aIxmISGsc
         VvwdLzD88o01k1yiGHr9nzxrME+oz8F4qkYKWw21jXEEIuSg+WYcdAOBVfrSc6W0ZViX
         yqNSw6pD3BZxv15lHgvdpZmQW8Z7mMRArpp1X+2aDXFciUsSIOgpUndwMT6HVsEz8frO
         y8im8VVg+aoKeO7CgftkCYoxL8v+yl6FvGFsbm6z0+g0B+6x90HCJy1uViB1ypUXxG95
         VopA==
X-Gm-Message-State: AFuF++mX0KmqQWYrIIoEo06MAYEcLXKG74N10/ZYaSPc+Ll+zaCvjEyv
	m23wg1uGIM/LM5vDgzYvDt7mn74E2rF1mlGXa8EpMnGV87KVItuV67kjo+v31e4ARBJneSFn0fZ
	oyWnRwIo=
X-Gm-Gg: AYBFou049JM3zLCuc2DBBPfm69K1+h1UY3oWatFKnczhNozaJ2bn9gFNF1GQXJA+rYN
	ygs9lkfby4VCBRPSsop2htjx9y9lCNpUS8n8nssQRmUtwigROl/EP1QExVYlAsopWGam3IQ3jJL
	4VA+8wmaac+kjuPP30l9zm1lyIfwnp/EL8lwfF4yXMAIm7ry+K+0JcQalM/mKseDWN8pheR+W0R
	oB3HhqwRwj2uOPzk+RnIAiubipzArl1xqLfMF5JamtZ2eXEgdKEIuQEBH5H82NnNizUe9EgbimV
	mlOFwwuIo7ZB9TAPMwxjwhWw7uHCBG4VUo+TG/4ycchXX+Tb+4gV8l24LqmTpf2jKq2v3kE0D4f
	FtOMnyGLSU0fSUl5dJuvntJNoLEZtdZXzyn+/rHCn72gP5Fm9yLkQPYbAvXAhxGGc0qCgppDQ9B
	H8vWU2Kmg6HzPhcBMKengD9G5fXWaltKju7anF52v6kdYaRxUxYc06PDKpftgk
X-Received: by 2002:a05:6122:f18:b0:5bd:cb34:1b70 with SMTP id 71dfb90a1353d-5c7ed29d58bmr2786695e0c.1.1788530689514;
        Fri, 04 Sep 2026 07:04:49 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb62710sm221647985a.28.2026.09.04.07.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 07:04:48 -0700 (PDT)
Message-ID: <0e0b02be-a438-416e-bb0f-515b7ba80052@riscstar.com>
Date: Fri, 4 Sep 2026 09:04:47 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] PCI: of: avoid allocations in
 of_pci_prop_compatible()
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20260904134607.1856121-1-elder@riscstar.com>
 <20260904134607.1856121-2-elder@riscstar.com>
 <20260904135954.696FA1F00A3D@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260904135954.696FA1F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/26 8:59 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The local variable `bufp` is incorrectly declared as `char` instead of `char *`. This truncates the stack array pointer `buf` to an 8-bit integer, leading to severe memory corruption and an immediate kernel panic during runtime.
> - [Low] The local variable `i` is declared but never used after the patch.

I'm very sorry about this; I'm not sure how it even happened.
I must have included the wrong patch when I prepared the series
(but I normally check builds as part of that process).  This
should not have even compiled...

I will fix this and will send out a new version tonight or
tomorrow.

					-Alex

> --
> 
> commit 0153310b625600febac7ea5aec9fbd9871d0af03
> Author: Alex Elder <elder@riscstar.com>
> 
> PCI: of: avoid allocations in of_pci_prop_compatible()
> 
> This patch replaces dynamic allocations for three compatible strings with a
> single stack-allocated buffer. This avoids subsequent kernel crashes where
> allocation failures would unconditionally trigger strlen() during device tree
> properties initialization.
> 
> Link: https://lore.kernel.org/sashiko-reviews/a647bd56-7dc8-4fec-9d96-834622054cdf@riscstar.com
> 
>> diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
>> --- a/drivers/pci/of_property.c
>> +++ b/drivers/pci/of_property.c
> [ ... ]
>>   static int of_pci_prop_compatible(struct pci_dev *pdev,
>>   				  struct of_changeset *ocs,
>>   				  struct device_node *np)
>>   {
>>   	const char *compat_strs[PROP_COMPAT_NUM] = { 0 };
>> +	char buf[PROP_COMPAT_NUM * PROP_SIZE] = { };
>> +	char bufp = buf;
> 
> [Severity: High]
> Does this incorrectly declare bufp as a single char instead of a pointer?

Yes this will be:

	char *bufp = buf;

> Assigning the array address buf to an 8-bit char truncates the memory address.
> 
>>   	int i, ret;

This will be:

	int ret;

> [Severity: Low]
> Is the variable i still needed here? The loop that used it to free the
> allocated strings was removed by this patch, which will leave this as an
> unused variable and cause a compiler warning.
> 
>> -	compat_strs[PROP_COMPAT_PCI_VVVV_DDDD] =
>> -		kasprintf(GFP_KERNEL, "pci%x,%x", pdev->vendor, pdev->device);
>> -	compat_strs[PROP_COMPAT_PCICLASS_CCSSPP] =
>> -		kasprintf(GFP_KERNEL, "pciclass,%06x", pdev->class);
>> -	compat_strs[PROP_COMPAT_PCICLASS_CCSS] =
>> -		kasprintf(GFP_KERNEL, "pciclass,%04x", pdev->class >> 8);
>> +	ret = snprintf(bufp, PROP_SIZE, "pci%x,%x", pdev->vendor, pdev->device);
> 
> [Severity: High]
> Will this snprintf call trigger a kernel panic upon dereference? Because bufp
> is truncated to an 8-bit integer, passing it as the output buffer pointer to
> snprintf() will result in an out-of-bounds memory access (unmapped low-memory
> dereference) when evaluated during system boot or PCI device enumeration.

This will be fixed by using a proper type for bufp.

> 
> [ ... ]
> 

