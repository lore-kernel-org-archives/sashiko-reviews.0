Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52C63B895B
	for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 19:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785267376; cv=none; b=XCP41i125MLJ2Oim0WwTIgBK913khysJt8gJczYxXXO1KCPuumy6+cWszZorNnJFL+VGc3xXiuEghBJKWdrd4MD+WXo6y9aMDsVjtGz0hJfUkIo5Ij7A2da3+St0mfue5Xw8ZlrYFrfz5HQ9DiWFkSULyP5pUH7DUnvSWWoixyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785267376; c=relaxed/simple;
	bh=GZ3CDx7InDtszJT7FBxF33rwRxfCvVgboxCsOELiDko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k7HFfJJm2lL9c0is1oPw+Yw1WTB1ZeaiIv6RpanbELtwv/naDav7HHENPJb3kOSyyBW7KvDsMuhUKaThcshmJN9EjeEWYqLX/5ul5bL6qYE1xfyTvU0F0RensT+lJzXTWuxg5dsBgeYfoHIZHKpbNLOR3luXuNPNldBcgbXKiOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=K9wbzP+T; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="K9wbzP+T"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5EC3489303;
	Tue, 28 Jul 2026 21:36:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1785267371; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=txmlt/gC1Lo/xKfFND5RbT2FJMpoytjBZlqHQ1p4H6I=;
	b=K9wbzP+TOgQWgo6a206cF1/b0TAr3sIChiWLi29H7crx5VTTFlWYa6YUitbfAf/SFyPAgV
	1bysiWm2DhvztD2pV7guMeI7YpTE7SWMNAjG6/oia8s2Ck9yXzeSpyzSlL+gsIV9alG9VM
	UX+irtirJQjNe6FMbZ8wBg6gfqevsJj2PxhUvf7H6i+o+AmyCHXPDiPpZ6gRQ1Fzbxbzln
	vwBWQAUOsZUpQX+KZcwBBkN3YPy77oE534VQNy0DXfAyC8OEcJsjssySqLPjbhUC1EgShn
	63diVlabhXLLe24UXZhebGie27tGviVaYKfLyFVzGc2zxGq2wnPAhQ7vqEL15Q==
Message-ID: <ad369df5-3ef4-4b4f-8596-26a6667b8e46@cjdns.fr>
Date: Tue, 28 Jul 2026 21:36:09 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 1/2] mips: econet: add multi-vpe capability to EN751221
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260728184959.102441-1-cjd@cjdns.fr>
 <20260728184959.102441-2-cjd@cjdns.fr>
 <20260728190621.CCD601F000E9@smtp.kernel.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260728190621.CCD601F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 28/07/2026 21:06, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Unconditionally masking hardware interrupts in en751221_init_secondary breaks the secondary CPU's timer if the system boots with VEIC disabled.

I didn't mention it in the commit message because SMP_MT implies _EI and 
_VI, enabling VEIC. But lines 6 and 7 are in fact unconditionally dead 
on the EN751221, the classical MIPS timer is not present.

Thanks,

Caleb

> --
>
> --- Patch [1]: [PATCH 1/2] mips: econet: add multi-vpe capability to EN751221 ---
> commit 29d4bfd90711d72516d1c7a3132dda2ae50742fc
> Author: Caleb James DeLisle <cjd@cjdns.fr>
>
> mips: econet: add multi-vpe capability to EN751221
>
> This commit registers SMP_MT on startup and overrides init_secondary with
> CPU interrupt unmasking required by the EN751221 VEIC intc hardware.
>
>> diff --git a/arch/mips/econet/init.c b/arch/mips/econet/init.c
>> --- a/arch/mips/econet/init.c
>> +++ b/arch/mips/econet/init.c
> [ ... ]
>> +static void en751221_init_secondary(void)
>> +{
>> +	write_c0_status((read_c0_status() & ~ST0_IM) |
>> +		(STATUSF_IP0 | STATUSF_IP1));
>> +}
>> +
>> +static int __init en751221_register_vsmp_smp_ops(void)
>> +{
>> +	if (!cpu_has_mipsmt)
>> +		return -ENODEV;
> [Severity: High]
> If the system boots with VEIC disabled (e.g., falling back to cascading mode),
> will this break the secondary CPU's timer?
>
> By registering these VEIC-specific SMP operations here without checking
> cpu_has_veic, en751221_init_secondary() will execute on the secondary CPU.
>
> Since en751221_init_secondary() clears ST0_IM unconditionally, it masks
> hardware interrupts including the timer interrupt. Could this lead to
> boot stalls or RCU hangs on non-VEIC setups?
>
>> +
>> +	en75_smp_ops = vsmp_smp_ops;
>> +	en75_smp_ops.init_secondary = en751221_init_secondary;
>> +	register_smp_ops(&en75_smp_ops);
>> +	return 0;
>> +}
