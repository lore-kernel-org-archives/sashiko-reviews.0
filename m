Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793976572;
	b=g0EC/53jeueGNpDxb7M1hsN9CZVQ74OF3dy8zcaVDrtan6VIiCIdB+4k3mBzvLghy83l
	 sEyAkl1EJ63eh3bVT2Dlwznpela8WIsak5AK5E1AD/36aiYo7DoE/JmtGaU06t/G5Yjq7
	 VwEMxZz2Ky8RkBx9DC3JtyrNxD0elTx00Bs1LSLMMZMUnmv1S5knaIoLjA0uzxB+YJ+L6
	 XkMVRkTPkk+c+bcWAbP05gGLjh69JvN+jWk2ayT/fj7ragk+SBkufwJI78jbmlRwO5XQx
	 XH/1APszXlygdsB4ny89cCjy7SVuzJU/ZReG3mXG5kXMITcSzEHbhn+YWQiU83yYMaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793976572;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=HhAHRyuzGq2rBJBHoq8/kHZPihd5eQeEZl5k24zy0GI=;
	b=pZ/P8uPjEoql/P7n+KJRrMXmQJfPF3J+Oulh1b2kNekPT4wG8ym0lf5b+B62taiGirZZ
	 EElDPhYh8LQBhE+alExCJEfLikT189ClXSDw4RRDfW/C9ePdEsWTp6W1Wmv7PJSX9xDy5
	 QHljtzWtBh4eF5lBYfzl9/36xD58H/iL3tPcnaDwN9HSTjUvG9wVS9bw9pAkJBUpgXnk7
	 QLS1UKWEbeEzQa4bccwnfsF9NwVEr5iD3MSMgeCn8uTcze1SumAv3edbeG85MI6ZV8WGt
	 CGnZeBx2/5Xb1Gigab/cAgcWGJgLZ+j14OpjXTK83qWjubRDicqbMYxaQVj+43KUfMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.net;
	spf=pass smtp.mailfrom=gmx.net;
	dkim=pass header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=VG2I6wc2;
	arc=none smtp.remote-ip=212.227.15.15
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9B8606A332;
	Fri,  6 Nov 2026 14:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE9B8606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=VG2I6wc2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1793976562; x=1794581362; i=wahrenst@gmx.net;
	bh=HhAHRyuzGq2rBJBHoq8/kHZPihd5eQeEZl5k24zy0GI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=VG2I6wc2hBBqaenGzCgzXf9Qfa0H6ytl4SS7gZJoYQ6y3e2NiQi94SNbY9qTJyxc
	 jcPFsCMGEjQhJJW5bKthvNe1ZXGPRIY4pFDJ06CBhWJwB4STbj5hFTINB6QoFLLBA
	 9Hj5sokRxfB/NpR1b/FO/0mrioyx4ZiImr3Wqdqjyh5LiBRCsjrHoOyKTF6jN3Pcy
	 hn/jQ8YK2VSkpn1TSHI6+0phw/0JiQCkSZa8S2gnJD8Qw5rgYzmB6c+hdEPi6F6mA
	 7zk1DtoxSHse5RDYm95cfn+IyqKcP/jtSLVInhSGBXDd9HyALYKil1zOEgYR79KGZ
	 o9w77hzMTqwDBgDaXg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mg6e4-1wrff52tqw-00hbyR; Fri, 06
 Nov 2026 15:49:21 +0100
Message-ID: <c57714b0-ef74-4af1-b520-f1888b05afd5@gmx.net>
Date: Fri, 6 Nov 2026 15:49:20 +0100
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
Subject: Re: [PATCH 2/3] nvmem: Add driver for i.MX BBNSM GP register
To: Lee Jones <lee@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
 Frank Li <Frank.Li@nxp.com>, Srinivas Kandagatla <srini@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, imx@lists.linux.dev,
 robh@kernel.org, conor+dt@kernel.org, sashiko-reviews@lists.linux.dev
References: <20261101200140.141642-1-wahrenst@gmx.net>
 <20261101200140.141642-3-wahrenst@gmx.net> <sashiko-outbox-192658@kernel.org>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <sashiko-outbox-192658@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SkGVmvYyAQ0MlQXm90AiqP+PJdsk86CHnFvMW12e/iJp9pcKUQK
 Mx8/teveLFRKOYfCyFZ6GrUMWX0ekNuRj0Gue3SxNnPAfGOT2Kv0yZ7pJMdvBewoyaoo23K
 /5lNfIJh36lLzckuVuAJW6rohN1acYSTGos7eVIOdiYLmTnNiwarLkVlx/R/jMLmwCh6AfG
 gO1mJYKPWxzodp5AK0LqQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RNk6GdqVENo=;NlAugKXMPZuqZfvcYx3EnuvxhoM
 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

Hi,

Am 01.11.26 um 21:14 schrieb sashiko-bot@kernel.org:
> Thank you for your contribution! Sashiko AI review found 1 potential iss=
ue(s) to consider:
> - [Low] nvmem: imx-bbnsm: missing MFD_SYSCON dependency in Kconfig
> --
>
> commit 72a81833b2595fcf0c62fe0c32408d53d3b1d63b
> Author: Stefan Wahren <wahrenst@gmx.net>
>
> nvmem: Add driver for i.MX BBNSM GP register
>
> This commit adds an NVMEM provider driver to expose the general purpose
> registers in the Battery-Backed Non-Secure Module (BBNSM) on i.MX9 SoCs.
>
>> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
>> index c36c2a4c2a0b7..8d492d05f1602 100644
>> --- a/drivers/nvmem/Kconfig
>> +++ b/drivers/nvmem/Kconfig
>> @@ -185,6 +185,18 @@ config NVMEM_BRCM_NVRAM
>>   	  This driver provides support for Broadcom's NVRAM that can be acce=
ssed
>>   	  using I/O mapping.
>>  =20
>> +config NVMEM_IMX_BBNSM
>> +	tristate "i.MX BBNSM general purpose register support"
>> +	depends on ARCH_MXC || COMPILE_TEST
>> +	depends on OF
>> +	select REGMAP_MMIO
> [Severity: Low]
> Should NVMEM_IMX_BBNSM depend on or select MFD_SYSCON instead of selecti=
ng
> REGMAP_MMIO?

I would add "depends on HAS_IOMEM", but should I following the=20
suggestion about MFD_SYSCON because the other child driver rtc & input=20
just select REGMAP_MMIO?

Best regards

