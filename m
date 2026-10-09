Received: from mail-qv2-f11.google.com (mail-qv2-f11.google.com [74.125.230.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9853B4F7CC1
	for <sashiko-reviews@lists.linux.dev>; Fri,  9 Oct 2026 19:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791574975; cv=none; b=P3NhmsTbZJDWsQ7WCa9VGQ6sQyzckRALqqXtEdY5fTdAFaqrgDyuAUm3A8sKLhVoP/t0uK42qcZWeCDhUw3Uf0TD4vdr7V/xieUkXDw+YlPbK9V9CLw6gCiClvjguLCEJqPmjWSAkN3cDyAKzVA5un1tYjGI2Dk8Y5fw+r7r9WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791574975; c=relaxed/simple;
	bh=IOvCS9B6HTUPKUbqR2Bvag9xuozFR6okYx5eHaJqL6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fHGCJoBOSm1Rx5lhjfj5SUIXjKaG3UYfOWY1b5mkg+3nYEme9+vxByVTwRDiNhbBnWX08zK/T2SY0rPX+mQ2cmInPy/x0PQV8QeMl2HypulfHom42mOmd9EzLDhBvJMJ6DLQPXHdm+tPWfDZM+jNa6XYfCEeUrqdNX+2yv8XL68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ntDg2oUB; arc=none smtp.client-ip=74.125.230.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ntDg2oUB"
Received: by mail-qv2-f11.google.com with SMTP id 6a1803df08f44-919a9517c28so1187116d6.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 09 Oct 2026 12:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791574965; x=1792179765; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HDkiqvSrkNQFvOOPqzjFj/I8n5Yim+RqXLVpjkE+gSI=;
        b=ntDg2oUB4Gerz3MaC17Mw9OsfDQIT3+kmG7tl8SriM0dU0FxseGi3G78Oj4B90c3/B
         P3Co3kax17duB35SFwAxgOlJwM72lyssQiCW0zofr0Djt7woa156ZX1vC8Gu1b4qE3cY
         nyqkDZwdcnPCgsJPHib4FWQJOPenKwetU1OY745nSBh/itKKIkNe+3xAiV0+fMuezXGO
         oCDSW/2c3DtOxCqEtAv/Zxq4wJ7ZgqO6zemn+wVK4od61XRvutNdNPST4mLnAmK1Fizl
         mcO3iLSuHrQO4Y5Pbj3rw7rxatU7OMV4wRiAkB1xNHYNflT3i0FIyGOMTuG9ymuIdkk+
         yhOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791574965; x=1792179765;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HDkiqvSrkNQFvOOPqzjFj/I8n5Yim+RqXLVpjkE+gSI=;
        b=SY7CfrqKYWbWV2oj+WG7ER1zxfQZ7ef+bu3GM395iN5tGmOZFC/lUlHBIEZnp+6G6J
         BpAJt0VF1G9Dr9f76+Cj0ZrwbmfJaN3JzDUSho45kkrJO7iG/R/8HW5ACuoBs4RvJ/np
         zs7IJJ2HteH2M2OhTgzoQnI139BmXNmRBZwE7XiKwONVUEMR9dEiGHHhHrWyOF/NwtMq
         9CHmfryE1tsYUA1uVX0ZbGAqf++Ws+JIclldzbSBzXYA1f4CPhCBGGPucJ0ichH2FKzL
         MEsdM4hpuTbaOeSDZwkCuGah1oEmaUkTKFBZWAeiua1gw5WARBG/S0Yrv9PymQYaW89T
         CSng==
X-Gm-Message-State: AFq9FYL+fZmdLonncJ36PYnXR9Lh8OWBzsdWacBKo0BTexceqBSCgxbn
	vuPzRMVtFhIF9rTSIpEcSck/L/RuHEHwzFF7X+YzBSkHzOm3Qo+F/pHa+eFtZgCL404=
X-Gm-Gg: AYBFou3lVa2972AZoIInGwMWsunu8EkRBptOWpeH7BWsdq4E3gwy95wNydbsO0IK/WO
	Fgrb+N7Xt+vUbkzm6CCURPamsKRdciiW4twH10oDIFp+0yhak8oaEygGUAzq8GuqeE3+S4jYtps
	8cVM7C+MUhxCBsN0ynTG0/G0r10KLiQo8AgZorBDYbI6c0C6wagEqt9Gh2jeEy5DWnvJC6lhqeX
	JdQx/fW2lhdu7VoooKSdfeZDaR8LLW+UkAxf2/IRQbDOAmmZrVZf6HASLmrd3jp8v5JwgPbaBlS
	cJfs305xpmM1SteD9KVDyNO+A4TdXkWVRBco4McaYNZ0CHbyg/Sslw1Ma8W8qA0V4NabJrF57hM
	g0N4o1h2LwnB6icqtbH+fYajnwUfQSR0IrZw/FtLXgSeArMKl8ok+/A28c3RcjhuiaH7/6QIyN6
	0EU9uhflPH1l3Hw+p6KCMRHV3IBoJCnugrV3VSXr4n9RGM3F5LyZAMpjyrOIRquNjGjXb8NKXsK
	jNUcJMs4WXaBN7PzbP+9TS5nq6HlBNxyUo7V2tWnyX8CY26ak1jTcB66PZMn9VY
X-Received: by 2002:a05:620a:6e86:10b0:93e:c12c:4412 with SMTP id af79cd13be357-93ec12c49fdmr261201685a.78.1791574965179;
        Fri, 09 Oct 2026 12:42:45 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb986c0c4sm262383285a.18.2026.10.09.12.42.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 12:42:44 -0700 (PDT)
Message-ID: <d5dc6491-ace6-414e-8c1b-577f9b253bd2@gmail.com>
Date: Fri, 9 Oct 2026 14:42:43 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] cpufreq: mediatek: Enter system sleep at the suspend
 OPP
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v1-0-9100f79b4080@gmail.com>
 <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v1-1-9100f79b4080@gmail.com>
 <sashiko-outbox-165965@kernel.org>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <sashiko-outbox-165965@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/26 1:43 PM, sashiko-bot@kernel.org wrote:
> [Severity: High]
> Is it safe to call dev_pm_opp_get_suspend_opp_freq() here?
>
> In drivers/opp/core.c, dev_pm_opp_get_suspend_opp_freq() locklessly
> dereferences opp_table->suspend_opp:
>
> 	if (opp_table->suspend_opp && opp_table->suspend_opp->available)
> 		freq = dev_pm_opp_get_freq(opp_table->suspend_opp);
>
> However, in drivers/opp/of.c, _opp_add_static_v2() modifies
> opp_table->suspend_opp dynamically without holding opp_table->lock, creating a
> data race:
>
> 				opp_table->suspend_opp->suspend = false;
> 				new_opp->suspend = true;
> 				opp_table->suspend_opp = new_opp;
>
> Furthermore, when an OPP is removed, _opp_kref_release() in drivers/opp/core.c
> frees the dev_pm_opp object without checking or clearing
> opp_table->suspend_opp:
>
> 	_of_clear_opp(opp_table, opp);
> 	opp_debug_remove_one(opp);
> 	kfree(opp);
>
> This leaves a permanent dangling pointer if opp_table->suspend_opp pointed to
> the dying OPP. Any subsequent call to dev_pm_opp_get_suspend_opp_freq()
> will locklessly dereference the now-dangling pointer, potentially causing a
> use-after-free.
The suspend OPP is read once, from ->init, into policy->suspend_freq. 
mediatek-cpufreq adds the whole OPP table in probe before 
cpufreq_register_driver(), and never adds, removes, or disables 
individual OPPs, and has no .remove, so the table can't change or go 
away while ->init can run. cpufreq-dt makes the same call.

I also realized that I forgot my sign-off on the commits. I will send 
out a v2 that has the sign-off. My apologies.

Best regards,
Ryan Brue
