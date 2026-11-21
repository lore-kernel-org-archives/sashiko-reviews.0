Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.21.61.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795287506;
	b=3SHxG0iFQG2w6zCrloCFzze7xSjnErtDbKV50/B3Yzmip5S4BdBcnCylk5fNmfHyDish
	 kgvNclhlfLOfT9+t/wznYSmvLAk9V1yx5/0C1Qx7nWAzBRXVXhh7gSkkiiChrKhcU+cLF
	 xBvTEUujt3i6b/RztCCYk66C0tSWk0XV/OqHZFm1TgX2vQdihtnf/y9MIMav/U/fSW4V1
	 DFa8l/lUNfQXaa3DW2L05vPVpGRw1pFwX0GPhBKjgW+yGO61XcVRY7XMNi/ziAbcMrvmG
	 46bC/qvdnigke5jDqx2QlYsx+58IBJC6l+25WPXgASUW8yvQCGnd8veXRfYK+hvhvPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795287506;
	h=DMARC-Filter:Message-ID:DKIM-Signature:Date:MIME-Version:User-Agent:
	 From:Subject:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=S3VtayUDchs/Rs5JuNrw3Yu75eBW6T5yU3o6tGYKeFk=;
	b=k4FE4cCcWZI97UHZED9gpwiB9IKAUaQucrWRHSIk8XzYcjDXUIq1Qef+Zxmnr5G1uf6E
	 oxAPq4D0jugNyWQOpBEM+bPgP1vzU23eK0qCNjFp8Cr/Y15Yg2zXmrgxSEHldaFunFfWA
	 dIPU6eT+IlH6DqhpSWfQMCvKFnIBE02Pm2i7GLEBn1zSiq5hEItr7uNLocUKM+LU/Hv7w
	 B7RMM6t0ykLPWbZ+sGoCMmk0MuNvOT1YMcD97xt/kDX6tb0VBn0KGRcx1DjfFdWY97/4N
	 FF6XBSee+tejg7oKEx+Dj6WZUm1OVSAndWbA+cVrhiJzJgvJyCYUQ4E23iylM03Vs4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aliel.fr;
	spf=pass smtp.mailfrom=aliel.fr;
	dkim=pass header.d=aliel.fr header.i=@aliel.fr header.a=rsa-sha256 header.s=courrier-s1 header.b=g2ei063E;
	arc=none smtp.remote-ip=65.21.61.41
Received: from courrier.aliel.fr (courrier.aliel.fr [65.21.61.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B29606A338
	for <sashiko-reviews@lists.linux.dev>; Sat, 21 Nov 2026 18:58:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07B29606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.a=rsa-sha256 header.s=courrier-s1 header.b=g2ei063E
Message-ID: <e92bbf55-08f2-4cc0-ad08-cbbcde9f93ac@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1795287497;
	bh=fJNClJvE09AeKF+kIGp46dIINijEJgt3u/BcL85nr4g=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=g2ei063Ermv4QMnmqaxKqlXwFWh1s/DyCoZOALwFIUNumGUw9wEey3LbLDBjZnrEa
	 e87I+pwMEwkN1gXZTogR/+UMKirzaK3a54ggbNq2WMfYPhqvMaJ9Gh1UekMXtaaF9k
	 838bMrmXKJGwx2pjG4I6atDtPsMzWwRx3rerShHA=
Date: Sat, 21 Nov 2026 19:57:45 +0100
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v2 06/11] pmdomain: amlogic: meson-ee-pwrc: power up
 memories for boot-enabled domains
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org,
 robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 vkoul@kernel.org, olteanv@gmail.com
References: <20261120-meson-drm-create-hdmitx-phy-v2-0-93d622d9bb07@aliel.fr>
 <20261120-meson-drm-create-hdmitx-phy-v2-6-93d622d9bb07@aliel.fr>
 <sashiko-outbox-225878@kernel.org>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-225878@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/20/26 19:58, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] pmdomain: amlogic: duplicated memory power-up loop in
>   meson_ee_pwrc_on()
> --
> 
> commit a69a64ee3e13ba7f9072dbadb0f25ec3e146c336
> Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> pmdomain: amlogic: meson-ee-pwrc: power up memories for boot-enabled domains
> 
> This commit introduces a helper to clear the HHI memory power-down bits
> for power domains that are found already enabled at probe time.
> 
>> diff --git a/drivers/pmdomain/amlogic/meson-ee-pwrc.c b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
>> index 338f70d77bf03..404af46192562 100644
>> --- a/drivers/pmdomain/amlogic/meson-ee-pwrc.c
>> +++ b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
>> @@ -428,6 +428,16 @@ static int meson_ee_pwrc_on(struct generic_pm_domain *domain)
>>  				       pwrc_domain->clks);
>>  }
>>  
>> +static void meson_ee_pwrc_mem_power_up(struct meson_ee_pwrc_domain *dom)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < dom->desc.mem_pd_count; i++)
>> +		regmap_update_bits(dom->pwrc->regmap_hhi,
>> +				   dom->desc.mem_pd[i].reg,
>> +				   dom->desc.mem_pd[i].mask, 0);
>> +}
> 
> [Severity: Low]
> This isn't a bug, but meson_ee_pwrc_on() right above has the same loop:
> 
> drivers/pmdomain/amlogic/meson-ee-pwrc.c:meson_ee_pwrc_on() {
>     ...
> 	for (i = 0 ; i < pwrc_domain->desc.mem_pd_count ; ++i)
> 		regmap_update_bits(pwrc_domain->pwrc->regmap_hhi,
> 				   pwrc_domain->desc.mem_pd[i].reg,
> 				   pwrc_domain->desc.mem_pd[i].mask, 0);
>     ...
> }
> 
> Could meson_ee_pwrc_mem_power_up() be defined above meson_ee_pwrc_on()
> and reused there as well?
> 

Good reminder, will do it in v3.

-- 
Best regards,
Ronald
