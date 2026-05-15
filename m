Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908C8413D80
	for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 19:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778874848; cv=none; b=nKyML5L0VQFBAsSWdxF+lG1ISec5LGPnIUJ9551XrZa6LBvIkY1KdzqJTPYCKrgArHsaD9cpUzzn+1Z//mHNpR+lDEFg3PMECcnM3c42BZflyzZMUlle8IxkCtlbJQlqPtDtNgIUzAX71lsxW08TLqz1iXhDcUt5Q/wxI6bGL3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778874848; c=relaxed/simple;
	bh=9z5ofOW3zF4tIwOxw6MLgiE61uAc+fsPZsMYSZAw7cg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ML+xbqicdJDNoEsLtjPj5ZDsoYMO8oruMYBhbVGM4XnlTNBonJcfnwK0c7xbR1U/lm0wqXrN5wzbLOB2uKPC35nb1tsbuU/RIV8IK/gUgLV8df+qsrcsWxdlCM8l9irYpn9tL4Kl5qJu/OnYw7rK2tNMB87YAzujqNHAUjw5lfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jfjLGKN9; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jfjLGKN9"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45297094718so98533f8f.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 12:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778874844; x=1779479644; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U+RFDSNSW3gsfyThVyv4mA2CxoP8ob3lZvZu86McAFU=;
        b=jfjLGKN94+xCOrfv2+GeSuRAEMQRJmkBoG3wOnB8BFTs2GKFFTUXBH7eqAL/dE2tBv
         i93qusO7x6nw7SqeWq31m0yvy+TEkG5DkZYKT2z0BJ0Ks7Efx07V2phvyirjNmnwFaIH
         z9Iyi8XDnW5xmmgR0PJthm11LuMsRhOcO2VIz4vlI3lWWe6QuW6gY/IcHysMS699PYxJ
         y/pWRLFNnrrcEFmXIp0PXfDDQ5wKPhD4F4BAzVoZDZFEnwMIoP/IQopf50KQKwsuNhMd
         gnlQak++vAHJo8bFe7BtAJMC1f8A5QWzyWPyVFNy/3vGY1KxyaWnJtHnxYoc2nEQB5sJ
         mQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778874844; x=1779479644;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U+RFDSNSW3gsfyThVyv4mA2CxoP8ob3lZvZu86McAFU=;
        b=JZUsZq1RieVOc8Sg7VM/4lthVpUMdSImuN/5WvLIKP6VnhsBTkSSw9LXuZ0/G2Rbev
         JGz5Ibc/ne0PdXt3dFtxEZAX3eK8w31/GhI6/DVf5a0pYidgeUeK6ylCyU96cV93o2iA
         kVCJqmtW9K5XCgwyedDI2KneKXbcINRRZ66E90bvWijZC6E3L/yypxMWJa56FVXzIIsw
         9xqjWgP/U7ESE/la1Cx+lims0B23AeL8rA1Suq5XLrmafRqGzLABWy8MjJ4jDFWfTwHP
         dxokf70qOwTzLIE4ccTLkrWWSEJeuYyhuHnbzfh04C94oQfQqlcyR13rVhgVQ4b0ZhqD
         rNlA==
X-Gm-Message-State: AOJu0YyYnfKFkgp7Jm7VcBfoB+qzriqGlsA3Wmy4rDSv1xQ21DmoI1ir
	he6BpWlG99Segquk/L2Ry4eqk4SJtfetMWqnkJCtPG4z570/ibruEVTGrk1PUERN
X-Gm-Gg: Acq92OG2BoTj5i9bH0OLyFK5EMXe/gE8EuJQn5Jg3Dbv0xE3odaNeFfmM1uE/ocZ1m9
	sYNXVpPb0lQAxPCZVc15PJ9XSqlE7NgiU/Tz1SQbI5hdYWxFhLKu8MaGh14c8PudWUFEEu4hQ5r
	3XSxHoSUs5CfZyR32nhMI9A8x3LDpaxgkAFXgDNqeu+8m9+yqBUCmAoMuZL1Btj5B3wiV//xr0V
	uHodEOGTSvYdHrDuzT3YqoR4dnMT/vG8ANzMaQWpaC42SQtayNvIK3JubhSD1yMgH3o/iQd533F
	fHJKOrfMJRn4D53mNewwEWMz8jkuWUcf3YFKfFtE+m+ZPfmvUnJHUXAfpuo+7plwoxFiP+Dc+FV
	9dmvAUIYUFwjObLdjU8h3Ome0sgAnq81JEFePiqidxc0ItYVkDipYY3sWmWUi9k1DUtSbb6yOYX
	OWP1sXQkUhjabbL7CL6kxh1SVNhRdZhS14GMi434F9eSQ+z6qqiyI4n9OBLFd6uZxY+526QfwKy
	MJ8rcxNdol6OT8n4SAYrAFf520xPlmZ
X-Received: by 2002:a05:6000:1ace:b0:45d:3cbf:bdda with SMTP id ffacd0b85a97d-45e5c58d4ccmr7721860f8f.20.1778874843831;
        Fri, 15 May 2026 12:54:03 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd1f:f500:f867:fc8a:5174:5755? ([2a01:4b00:bd1f:f500:f867:fc8a:5174:5755])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm16989475f8f.34.2026.05.15.12.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 12:54:03 -0700 (PDT)
Message-ID: <b158bfbc-dfa7-4e87-bda0-430bab4b7538@gmail.com>
Date: Fri, 15 May 2026 20:54:03 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 1/3] bpf: Export btf_get_module_btf() and
 btf_relocate_id()
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260515-generic_tracepoint-v1-1-aa619fa94132@meta.com>
 <20260515175618.A4059C2BCB0@smtp.kernel.org>
Content-Language: en-US
From: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
In-Reply-To: <20260515175618.A4059C2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/15/26 6:56 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] API Asymmetry and Resource Leak due to unexported btf_put()
> --
> 
> commit 51050bef777abcb3d2969804b1e3693feb10a170
> Author: Mykyta Yatsenko <yatsenko@meta.com>
> 
> bpf: Export btf_get_module_btf() and btf_relocate_id()
> 
> This commit makes btf_get_module_btf() and btf_relocate_id() available outside
> kernel/bpf/btf.c by exporting them. This allows the tracing core to look up
> module BTF and translate split BTF ids.
> 
>> diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
>> index 77af44d8a3ad3..aa88d18247bda 100644
>> --- a/kernel/bpf/btf.c
>> +++ b/kernel/bpf/btf.c
> [ ... ]
>> @@ -8500,7 +8501,7 @@ struct module *btf_try_get_module(const struct btf *btf)
>>  /* Returns struct btf corresponding to the struct module.
>>   * This function can return NULL or ERR_PTR.
>>   */
>> -static struct btf *btf_get_module_btf(const struct module *module)
>> +struct btf *btf_get_module_btf(const struct module *module)
>>  {
> [ ... ]
>> @@ -8529,6 +8530,7 @@ static struct btf *btf_get_module_btf(const struct module *module)
>>  
>>  	return btf;
>>  }
>> +EXPORT_SYMBOL_GPL(btf_get_module_btf);
> 
> Because btf_get_module_btf() increments the reference count on the returned
> struct btf object using btf_get(), callers are required to release this
> reference by calling btf_put().
> 
> Since btf_put() is not exported, won't loadable modules using this new API
> fail to link or be forced to leak the struct btf reference?
> 
> Alternatively, if these functions are only meant for the tracing core, which
> is always built-in, are these EXPORT_SYMBOL_GPL declarations necessary?
> 

yes, I should drop EXPORT_SYMBOL_GPL, and move these function prototypes
to the header.
