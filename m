Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AAE33262B
	for <sashiko-reviews@lists.linux.dev>; Wed, 20 May 2026 16:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779293190; cv=none; b=BBWG3EgRCyj4G9T4rlexkvNZcnQPVhUljTcBefh3aAgsHeqS5b8UjViahDTVH7PdM5+5u2rTWIDfNpYny5KHME3AoSUx6BHze6wOl1/zjlxr5S+nvFxh6clGyY9D0vmWLSFhM/DPfQeHJ5x0N+b66eqnARtJ9HH3+fle0G9MLyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779293190; c=relaxed/simple;
	bh=m6JPhIJbQ0gEyv8AT7Djg+r0/yXuFuEOF6/cwQNjcNQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=gaKXRAr/vyoC+E9niRM1atT6J9TCKt6Ei1E15cl86bh0hubIe6IitdLEr2Rk8Mrpt6OaRk5tNgWqcDlmht9HJ406A2iqf3ylQ79bhTQgssI6nKJfaXXQLS1dCVfkHtd838QoQ4C6wl0+l/2hQ3Knelr6PREhlTt5UM7Wfgt7mYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kRPWGdtH; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kRPWGdtH"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bcc9fdc959cso980740466b.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 20 May 2026 09:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779293187; x=1779897987; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgkFusfrsQUtnPD0k3UI2UziIOgmFiUaBBrm2kUxAis=;
        b=kRPWGdtHU2fqfhUugT9Nnaf1WSSUM+uuAc6ooBiIIXqjCzfi1TlOELztVv2OZmwf3R
         dSDmZtGMf4qaZxLaWzRSfwOBoDMHU9NzVYf+JLvjXbzOVHwLOMWwvsrLxszj+ZaSQF9o
         VxXKP3SDIVnkbKbO9wGOct5FsCs1+kuyuFbBwPwq+7JyyW33+oVxguyLs48Vqw5+K2tz
         FUeJC8Hdpa9YagKfYiyg7zqdCcOQrpzWAmUVs0hSj0G/OT/2qwatbTiiLQKaANI9lS/5
         uhBROM0pL1T3jBvecCem0YVlH5g/P4Ycs/re3w9CM3C6ZrhjqjnY2VB4Gdh3AOHY6TKn
         8exg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779293187; x=1779897987;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TgkFusfrsQUtnPD0k3UI2UziIOgmFiUaBBrm2kUxAis=;
        b=dHcFNCs47AwCT3+KglcCHzHnyhmxpXxdU2dKuDnMyjkc5T1MkQPeNPNxOXx9Pdh9RR
         XZ6oNIV8KBIk2JpDacEW3FR0Mtg7+WBYqFFdPY1LBDmL0mMGs86zxmXq7sagqAeh3a9E
         JO/Qzpy8XylQlqKufquzVk4hqm0oGjkxmfoK0yCr105R5w1ID7A+tW7QXMbco2al2rVi
         kGZXJGTu4zx/hjiCVZBmkK39D6j9lsSimU+xjg6yzAmr1scPrXksyxNByZI876W6ppmJ
         Y1Y9QFo1D+bIA35RGbqYV369w+XH8YuzmFVa3e/JSDBAcQ9pEEUAeyk6xiWXSHTIqSS2
         cnUw==
X-Forwarded-Encrypted: i=1; AFNElJ9cbnI6efSYLWZdba7NpiC60bNCPJ9SkfBVYZ7jUzc9rPP1r87hYnSmPeqgCMf9HJfzEoMngVxOD6IdPC86Nmc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwpvTVNBvvJ/mLeaGwZEB/zMhWmVZMH4I/iJNSphLzvtBGQbt/T
	IlHvSTdoS5ij+wT3aViMhC3HasDnLV6YNqNnBOyAuy5u6A+DiqGkTXR6sTTmH0S0A2A=
X-Gm-Gg: Acq92OEy8pq15OhrUWFfP2uu6kyTS/OIbPRTTD3C0H7E95gzcG2kD2O9wXrRvtNWtfG
	nbdCRSL3LJz2INGVJI+WWf6mov6eEbJKZvbRxjHMWxK4vjxwh4czPw3kDhFB2rgMvKmbqJwqA4c
	cox1PhBi5eSpG3IImupSGYjif4/Y6/CoYljidayRPOQ3qheJmzzY4Xii5VIhRALea1o15Jc1PVo
	WsTH4aazOXfrmqPtyLHaQNQYc8VA7Fyhkz9iI82kxcGb4+2hPpEvZb36haRRkBqqGjFtuTmBlAu
	iAAkKHpi0eH6K7Sa6/9qFYtXQv3FxlgfVOBSs8C2RIhacKaOjAfNPCQtL3N0H8miyhYe3mPt6m4
	I7Fr2wsGiQnDBqDlpp9+1IHQG6xRGxHKBynwqTeTCXW7xSInCllh9kH/oGwMcNdR2seMJAuwLIt
	vZEDF9Z4yqsc2+vtdOGlHGqd6CtNO99MKIg4Lj/8wfy09ayCYPdOKeSulu+miwFuBrB4c6NWoXO
	AQ80sHNbr3p8YNoF4wAGS/K
X-Received: by 2002:a17:907:e104:b0:bd2:c919:22c9 with SMTP id a640c23a62f3a-bd5179311e1mr921917166b.35.1779293186834;
        Wed, 20 May 2026 09:06:26 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e21235sm868671666b.43.2026.05.20.09.06.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 09:06:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 May 2026 17:06:25 +0100
Message-Id: <DINMSL1LPPCF.1U0AO6MYUFTN2@linaro.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <sashiko-reviews@lists.linux.dev>,
 <conor+dt@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 3/6] soc: samsung: exynos-pmu: generalise
 gs101-specific cpu{idle,hotplug} for Exynos SoCs
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: <krzk@kernel.org>, <alim.akhtar@samsung.com>, <peter.griffin@linaro.org>
X-Mailer: aerc 0.21.0
References: <20260513-exynos850-cpuhotplug-v4-3-54fec5f65362@linaro.org>
 <20260514053037.BB9A1C2BCB7@smtp.kernel.org>
In-Reply-To: <20260514053037.BB9A1C2BCB7@smtp.kernel.org>

(adding samsung list and other folks back in c/c)

On Thu May 14, 2026 at 6:30 AM BST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [High] Hardware register misprogramming due to incorrect CPU index from=
 smp_processor_id().
> - [High] Use-After-Free of device node intr_gen_node.
> - [High] Missing teardown of global notifiers on probe failure causes Use=
-After-Free.
> - [Medium] Missing of_node_put() on error path causes a device node refer=
ence leak.
> --

Sashiko reported quite good findings. I'd say that most of them were
present in the code one way or another before my series.
They look fixable.
I'd rather need then two series: first one with fixes and then
generalisation of cpuhp for Exynos but first one will be listed as a
dependency (but dependency will indicate order of how series should
be applied). Is that okay with you to proceed this way?

Best regards,
Alexey


> commit 00ecbc34b3961a015d2064ffdbd5f20fb602ef73
> Author: Alexey Klimov <alexey.klimov@linaro.org>
>
> soc: samsung: exynos-pmu: generalise gs101-specific cpu{idle,hotplug} for=
 Exynos SoCs
>
> This patch generalises cpuhotplug and cpuidle support for GS101-based SoC=
s
> to be reused for other Exynos-based SoCs. It introduces cpu_pmu_offline a=
nd
> cpu_pmu_online callbacks in exynos_pmu_data and updates gs101 platform da=
ta
> to use them.
>> diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exyn=
os-pmu.c
>> index d58376c38179b..660416c0db432 100644
>> --- a/drivers/soc/samsung/exynos-pmu.c
>> +++ b/drivers/soc/samsung/exynos-pmu.c
> [ ... ]
>> @@ -425,6 +346,11 @@ static int setup_cpuhp_and_cpuidle(struct device *d=
ev)
>>  		return 0;
>>  	}
>> =20
>> +	if (!pmu_context->pmu_data->cpu_pmu_offline || !pmu_context->pmu_data-=
>cpu_pmu_online) {
>> +		dev_err(dev, "PMU write/read sequence is not present for cpuhotplug a=
nd cpuidle\n");
>> +		return -ENODEV;
>> +	}
>> +
>
> Does this return path leak the intr_gen_node device node reference?
> of_parse_phandle() acquires a reference to it earlier in this function,
> which needs to be released via of_node_put() before returning.
>
> [ ... ]
>> @@ -458,17 +384,17 @@ static int setup_cpuhp_and_cpuidle(struct device *=
dev)
>> =20
>>  	/* set PMU to power on */
>>  	for_each_online_cpu(cpu)
>> -		gs101_cpuhp_pmu_online(cpu);
>> +		exynos_cpuhp_pmu_online(cpu);
>> =20
>>  	/* register CPU hotplug callbacks */
>>  	cpuhp_setup_state(CPUHP_BP_PREPARE_DYN,	"soc/exynos-pmu:prepare",
>> -			  gs101_cpuhp_pmu_online, NULL);
>> +			  exynos_cpuhp_pmu_online, NULL);
>> =20
>>  	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "soc/exynos-pmu:online",
>> -			  NULL, gs101_cpuhp_pmu_offline);
>> +			  NULL, exynos_cpuhp_pmu_offline);
>> =20
>>  	/* register CPU PM notifiers for cpuidle */
>> -	cpu_pm_register_notifier(&gs101_cpu_pm_notifier);
>> +	cpu_pm_register_notifier(&exynos_cpu_pm_notifier);
>>  	register_reboot_notifier(&exynos_cpupm_reboot_nb);
>>  	return 0;
>>  }
>
> This problem wasn't introduced by this patch, but is there a use-after-fr=
ee
> of intr_gen_node in setup_cpuhp_and_cpuidle()?
>
> of_node_put(intr_gen_node) is called immediately after of_address_to_reso=
urce(),
> but later the node pointer is passed to of_syscon_register_regmap():
>
> 	ret =3D of_address_to_resource(intr_gen_node, 0, &intrgen_res);
> 	of_node_put(intr_gen_node);
> 	...
> 	ret =3D of_syscon_register_regmap(intr_gen_node,
> 					pmu_context->pmuintrgen);
>
> Also, this problem wasn't introduced by this patch, but does this functio=
n
> need to provide a teardown mechanism for these global notifiers?
>
> If exynos_pmu_probe() fails after this point, the devres-managed pmu_cont=
ext
> will be freed.
>
> Since cpuhp_setup_state() and cpu_pm_register_notifier() don't use devm_
> variants, subsequent CPU hotplug or idle events could invoke the dangling
> callbacks and access the freed pmu_context, potentially causing a
> use-after-free.
>
>> diff --git a/drivers/soc/samsung/gs101-pmu.c b/drivers/soc/samsung/gs101=
-pmu.c
>> index 17dadc1b9c6ec..5f2a599241447 100644
>> --- a/drivers/soc/samsung/gs101-pmu.c
>> +++ b/drivers/soc/samsung/gs101-pmu.c
> [ ... ]
>> @@ -322,11 +322,68 @@ static const struct regmap_access_table gs101_pmu_=
wr_table =3D {
>>  	.n_no_ranges =3D ARRAY_SIZE(gs101_pmu_ro_registers),
>>  };
>> =20
>> +/*
>> + * gs101_cpu_pmu_ prefix functions are common code shared by CPU PM not=
ifiers
>> + * (CPUIdle) and CPU hotplug callbacks. Functions should be called with=
 IRQs
>> + * disabled and cpupm_lock held.
>> + */
>> +static int gs101_cpu_pmu_online(struct exynos_pmu_context *pmu_context,=
 unsigned int cpu)
>> +	__must_hold(&pmu_context->cpupm_lock)
>> +{
>> +	unsigned int cpuhint =3D smp_processor_id();
>
> This problem wasn't introduced by this patch, but will smp_processor_id()
> return the correct CPU index during hotplug startup?
>
> During CPU hotplug startup, exynos_cpuhp_pmu_online() is called via
> CPUHP_BP_PREPARE_DYN, which executes on the Boot Processor.
>
> As a result, smp_processor_id() returns the Boot Processor's ID instead o=
f the
> target CPU's ID, which could misconfigure the Boot Processor's register w=
hile
> leaving the target CPU uninitialized.

