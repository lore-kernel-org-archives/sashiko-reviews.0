Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9C9380FCE
	for <sashiko-reviews@lists.linux.dev>; Sat, 16 May 2026 10:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778927846; cv=none; b=Y3vVgO2fMZhIWmq2pVmdVovk4q5AW5gPs5M/aUNjxMnXx5mbP3ZGntcjtpsXBGa+w0YaZ7Bo9veH8PGq4s5BfhflhWuvDbRH/Txq1CaXc2uk0xVf/1wQkrflzNHhqzK12t7J8/mmbnhIw1Q+VfVwEXGMriF2sRjTFHPgKXML4Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778927846; c=relaxed/simple;
	bh=GN8VTVTylq06skIcTqkgY8Pba8oQMATmzxCcqDylYKE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=rkwUZoB+RKquu/aOolqLlD8LXdTCgLgt0MNMIHV8hHJNCMWrHboaiLxmNTwD89kB/aOcUC/aCP6Ddr74IlAOPIoBirUU3Z75pOt/pcCsOuN+lgVc5JdgQL+66UfvA8Kd2fXY4I/VI1dfeVBa8xLSOxF31FpkUMllcSCxoU//z/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=QtSs9YMP; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="QtSs9YMP"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 2EFC226F31;
	Sat, 16 May 2026 12:37:15 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8p_R7JXcycJI; Sat, 16 May 2026 12:37:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1778927834; bh=GN8VTVTylq06skIcTqkgY8Pba8oQMATmzxCcqDylYKE=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To;
	b=QtSs9YMPFG8psIhwuC7/v1S35JSk3OQhJcMXx9dccdtcoAYEEY4Q4ShQWrUQ3sVbO
	 kPfPESjEDHTSq1h2rn5rRImpaNgXvj6CZm1Fl1mGXglR+5or5ff/Jsi89WcgtSlLkM
	 bxsDFkqtvPIA74HBr2KGSkOw7bSenq1lsZdKAqLwcPcpP3/Y8nYi3LdidSM6xIf7q9
	 p8FWwrL/0WhXLgfexL4D7wuUcHZFVB8P5CFzXSTAXgvr+W2JHY2izvzCILHXevS7pk
	 DA3Sgt8mGoe49buUGQpLDILG3O0tnKmnM0pAp9A2EmRB8ueZ2R4tlJAxBzO7sM+e3R
	 8nRFgTgc+74aw==
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 16 May 2026 16:07:05 +0530
Message-Id: <DIK1A93ZZZY5.3HB73O465YR3S@disroot.org>
Cc: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v7 04/10] mfd: sec: add support for S2MU005 PMIC
From: "Kaustabh Chakraborty" <kauschluss@disroot.org>
To: <sashiko-reviews@lists.linux.dev>, "Kaustabh Chakraborty"
 <kauschluss@disroot.org>
References: <20260516-s2mu005-pmic-v7-4-73f9702fb461@disroot.org>
 <20260515222508.BF4ADC2BCB0@smtp.kernel.org>
In-Reply-To: <20260515222508.BF4ADC2BCB0@smtp.kernel.org>

On 2026-05-15 22:25 +00:00, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Missing `.use_ack =3D true` in `s2mu005_irq_chip` causes an infi=
nite interrupt storm.
> --
>
> commit 6e3b1141ae78b94854e84436a682b1574f6933ac
> Author: Kaustabh Chakraborty <kauschluss@disroot.org>
>
> mfd: sec: add support for S2MU005 PMIC
>
> This commit adds support for Samsung's S2MU005 PMIC. It introduces a new
> device type and handles its specific revision register fetching, as well
> as providing its interrupt chips and child cell definitions.
>
>> diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
>> index 133188391f7c2..42862807be1a0 100644
>> --- a/drivers/mfd/sec-irq.c
>> +++ b/drivers/mfd/sec-irq.c
>
> [ ... ]
>
>> @@ -337,6 +397,16 @@ static const struct regmap_irq_chip s2mpu05_irq_chi=
p =3D {
>>  	.ack_base =3D S2MPU05_REG_INT1,
>>  };
>> =20
>> +static const struct regmap_irq_chip s2mu005_irq_chip =3D {
>> +	.name =3D "s2mu005",
>> +	.irqs =3D s2mu005_irqs,
>> +	.num_irqs =3D ARRAY_SIZE(s2mu005_irqs),
>> +	.num_regs =3D 4,
>> +	.status_base =3D S2MU005_REG_CHGR_INT1,
>> +	.mask_base =3D S2MU005_REG_CHGR_INT1M,
>> +	.get_irq_reg =3D s2mu005_irq_get_reg,
>> +};
>
> Does this structure need .use_ack =3D true?
>
> In s2mu005_irq_chip, .ack_base is not explicitly set, so it implicitly
> initializes to 0. The .status_base is set to S2MU005_REG_CHGR_INT1, which=
 is
> the first enumerator in s2mu005_reg and thus equals 0.
>
> The regmap-irq core framework relies on the condition if (chip->ack_base =
||
> chip->use_ack) to determine if it should write back to the hardware regis=
ters
> to acknowledge and clear the interrupts. Because both evaluate to 0 (fals=
e),
> regmap-irq assumes the chip is clear-on-read and completely skips the ACK
> execution.
>
> Since Samsung PMICs require a Write-1-to-Clear sequence to clear interrup=
t
> status registers, without the ACK write, the hardware PMIC continuously
> asserts the physical IRQ line.
>
> As the interrupt uses IRQF_ONESHOT, the moment the threaded handler compl=
etes
> and unmasks the interrupt at the controller, the still-asserted hardware =
line
> will immediately re-trigger the interrupt.
>
> Could this loop cause an infinite interrupt storm, starving the CPU and
> leading to a hard lockup?

This actually does not happen, this PMIC device doesn't require ack.
There's no interrupt storm when testing, and neither does the downstream
driver implement ack-ing code.

