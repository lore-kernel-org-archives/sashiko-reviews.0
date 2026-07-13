Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFE9367B7B;
	Mon, 13 Jul 2026 07:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928196; cv=none; b=m32VHb2+qVbM2bpKVjyy1weMeEggLjdbBBOMGceEPC3JfLAYYdonuCeXnv8YfAWB85qc2iqj9D69tngHQpQXHwzflmJ4ADL2oklvPQCT7W6aq5NzJdTpQEdvS3lm1bdF8NDwJRztnm/t1P6Y0nxtUCQx4F/TxJYv4kspKkr97As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928196; c=relaxed/simple;
	bh=+xwh1bLsQTbStbbo2bW1BoxK6WTRt+1SRdIq3Cn6tLg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=Z8rGVqAX0iIiKcwN9uVMrQrjGsUxCXEWVJOlU/eXKEM02O4EFt95x3D6yZTNLSz/MnMy/VIEBQgHMqxz2O6/9y/gtFLOfazsYJtSNdESvFyqvGV2Az8bQ8bmqWnfA7ecC3zrbrJSRlxUUwcYe9Oz7bhnll9TAmZQEiBC4G3w5Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dGGEsD/S; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dGGEsD/S"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 23DE61A0F8E;
	Mon, 13 Jul 2026 07:36:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E311560341;
	Mon, 13 Jul 2026 07:36:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5DBDA11BD05B6;
	Mon, 13 Jul 2026 09:36:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783928191; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xrtYLNpKgFt+k+yed+P/AI4r+fYgn9QYhB8AabFAesQ=;
	b=dGGEsD/STE+fwBKsByWSWBdV5cdo1K/rWN9MsNYVh9Nhga6tUGN6TzfUn8ReqgMzId/kho
	h9UPdCPBAih/AQm4fJ6ei6pJnbrQstAU5ApbxNe/hAkNrXTeRXlWqqU8FP1V8KM6Oo+UvI
	vVV83vnRhoJZstm5LEhXo8hK0UTO2q1T7JlTcmmGbw7R9wL+gVmzmsJdDPRy/uO8tvXX1O
	4beqSA3xN/r4QZGFrzQ+yrrPFz2iI1i1J9m5xVrCSpFvKOdLNzBQfjREjW6ULsiJDb9BUs
	ILS0O4kw4+tsmH4KKylZQ5EbBqANe0bSS2U96bryTt5U93BGmR5Zlq8bB/nFTA==
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Jul 2026 09:36:29 +0200
Message-Id: <DJX9RKO8ROIP.1JOJVXZ11PANJ@bootlin.com>
Subject: Re: [PATCH 2/5] arm: dts: st: Import optee node from u-boot device
 trees
Cc: <imx@lists.linux.dev>, <robh@kernel.org>, <conor+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <Frank.Li@kernel.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <sashiko-reviews@lists.linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260710-mathieu-uboot-dts-import-v1-0-ffe0210e50c9@bootlin.com> <20260710-mathieu-uboot-dts-import-v1-2-ffe0210e50c9@bootlin.com> <20260710153944.BFC9B1F000E9@smtp.kernel.org>
In-Reply-To: <20260710153944.BFC9B1F000E9@smtp.kernel.org>
X-Last-TLS-Session-Version: TLSv1.3

On Fri Jul 10, 2026 at 5:39 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Missing `bootph-pre-ram` property in the newly added `optee@fe00=
0000` reserved memory node for `stm32mp157c-ed1.dts`, which will cause U-Bo=
ot to strip the reservation during SPL and pre-relocation, leading to memor=
y corruption.
> --
>
> --- Patch [2]: [PATCH 2/5] arm: dts: st: Import optee node from u-boot de=
vice trees ---
> commit e001824900768a597c1390aaf3fe0b9e2c46bdd1
> Author: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
>
> arm: dts: st: Import optee node from u-boot device trees
>
> U-Boot is importing kernel device trees for these platforms, but adding
> a firmware node to enable communication with OP-TEE. Importing
> changes here will allow to remove these additions in U-Boot.
>
> [ ... ]
>
>> diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts b/arch/arm/boot/dt=
s/st/stm32mp157c-ed1.dts
>> index 49dd555cc228c..7da7260350869 100644
>> --- a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
>> +++ b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
>> @@ -70,6 +70,18 @@ retram: retram@38000000 {
>>  			reg =3D <0x38000000 0x10000>;
>>  			no-map;
>>  		};
>> +
>> +		optee@fe000000 {
>> +			reg =3D <0xfe000000 0x02000000>;
>> +			no-map;
>> +		};
>
> [Severity: High]
> Does this optee reserved memory node also need the bootph-pre-ram propert=
y
> like the one added for stm32mp157a-dk1.dts?
>
> Without the bootph-pre-ram property, U-Boot's fdtgrep utility strips the
> optee reserved-memory node from the SPL and pre-relocation device trees.
>
> Because U-Boot typically relocates itself to the top of available RAM (wh=
ich
> on this platform overlaps with 0xfe000000), omitting this reservation cou=
ld
> allow U-Boot to allocate over OP-TEE's secure memory region, potentially
> causing data corruption or TrustZone violations.

I'm a bit torn on this point.

So first, this commit only imports existing code, so I was not planning
to modify the device tree. But looking at the docs, and the
stm32mp157a-dk1.dts file, I suspect bootph-pre-ram is also needed here.

I will probably add a separate commit, adding bootph-pre-ram tag.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

