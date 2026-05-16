Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46B237AA9D
	for <sashiko-reviews@lists.linux.dev>; Sat, 16 May 2026 12:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778933931; cv=none; b=q0Bnw0cFl6tzduj5foYEE1P5TVazJ7f867Zh0IDG+bsAyF3yYXTkKClQd8VfyKZ4Gn+POC2IF1SqRQh35KPTkvC8OpX1wV/uFT9Q6M2I8DkJGDULaFVN+LkCTPKuzWipgrY7XLX6rcHH0y7dxebgMUJywhPUx66XSAHFGFgUTQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778933931; c=relaxed/simple;
	bh=uH3tX2aOgeksoZKI5T9mrhYnSwNsOXdomeEkea5UM/U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=pZY2i4lp7ZTIBbOz/xpBpG75QSBzKiWr8x8NhoX63iW7ts1Zyld12pDu5tNMxq/ZGYkh5i/kRe7NrCIFwIqKKw2YpayKIYgXt8w/a7Vv9+I3Hp9tMQgWU6EXJJTvGI6zOuj9CFWBVBrZf8xt4gx1iVJQJ/9M4VXGRUtOCzILY/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=SpMt1Lus; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="SpMt1Lus"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 083F726FA4;
	Sat, 16 May 2026 14:18:47 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rjl6SQpE4vCd; Sat, 16 May 2026 14:18:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1778933926; bh=uH3tX2aOgeksoZKI5T9mrhYnSwNsOXdomeEkea5UM/U=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To;
	b=SpMt1LusNwGnImPND9PuWPtvJEMnuos8nbjBSzLrM2VyWKoidYVbKX57NEW3cBd6I
	 bk0symmi8OQtCjMAz7yXfI+HsFp1ukz7THab9SmTO9z2VJd9EPrt3tVMr5q/7eckKf
	 wTZ8PVDt3AlXTNgCovb42sS02wzaExn48MgpEqNy7lRhEFP2683TRHwswMGqpFDF3D
	 lUyagHUYGUai0JQtTV0ZNq4PPPI/WTD/NdYOGzS7WgabRvjvLyiP+QtDVDI+m/cEUQ
	 wVhGdp9VDzzEFOlkbcjW4W235Olsh5225uduu0F1w3UwHkVeN0KUxyM4IezB5mDYrL
	 4x61b55SMaQsA==
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 16 May 2026 17:48:39 +0530
Message-Id: <DIK3G0RETBVZ.OCTQ0HEYDQYA@disroot.org>
Cc: <krzk+dt@kernel.org>, <devicetree@vger.kernel.org>, <robh@kernel.org>,
 <conor+dt@kernel.org>
Subject: Re: [PATCH v7 05/10] mfd: sec: set DMA coherent mask
From: "Kaustabh Chakraborty" <kauschluss@disroot.org>
To: <sashiko-reviews@lists.linux.dev>, "Kaustabh Chakraborty"
 <kauschluss@disroot.org>
References: <20260516-s2mu005-pmic-v7-5-73f9702fb461@disroot.org>
 <20260515222400.CDDB7C2BCB0@smtp.kernel.org>
In-Reply-To: <20260515222400.CDDB7C2BCB0@smtp.kernel.org>

On 2026-05-15 22:24 +00:00, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Shared dma_mask pointer across MFD child devices causes a data=
 race and violates DMA API contracts.
> --
>
> commit cc615ed9ba9013f030c19361a7a4d79aad2e467d
> Author: Kaustabh Chakraborty <kauschluss@disroot.org>
>
> mfd: sec: set DMA coherent mask
>
> This commit manually sets the coherent DMA mask to 0 and points the devic=
e's
> dma_mask to it. This is intended to suppress "DMA mask not set" warnings
> for sub-devices, as the device does not use DMA for communication.
>
>> diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
>> index 22f6c74eb6c0e..fe92bc4a3dd26 100644
>> --- a/drivers/mfd/sec-common.c
>> +++ b/drivers/mfd/sec-common.c
>> @@ -221,6 +221,9 @@ int sec_pmic_probe(struct device *dev, int device_ty=
pe, unsigned int irq,
>>  	if (IS_ERR(irq_data))
>>  		return PTR_ERR(irq_data);
>> =20
>> +	dev->coherent_dma_mask =3D 0;
>> +	dev->dma_mask =3D &dev->coherent_dma_mask;
>
> When the MFD core adds child devices via mfd_add_device(), it copies the
> parent's dma_mask pointer to the child devices:
>
>     pdev->dev.dma_mask =3D parent->dma_mask;
>
> Because sub-devices for this PMIC probe asynchronously, they can concurre=
ntly
> execute platform_dma_configure(), which eventually calls of_dma_configure=
_id()
> and performs a lockless read-modify-write:
>
>     *dev->dma_mask &=3D mask;
>
> Since all child devices share the same dma_mask pointer referencing the
> parent's coherent_dma_mask, does this cause an unsynchronized data race o=
n
> the parent's memory?
>
> Additionally, sharing a single dma_mask pointer across multiple devices b=
reaks
> the driver model. If any child device were to legitimately call dma_set_m=
ask(),
> wouldn't it silently overwrite the DMA mask for all sibling devices?
>
> Finally, manually modifying device structures to fake an invalid mask of =
0
> bypasses DMA subsystem validation. Helpers like dma_coerce_mask_and_coher=
ent()
> explicitly reject a mask of 0. Is manually assigning 0 here the recommend=
ed way
> to suppress the warning?

Note that change follows the same reasoning as in commit 0b7cbe811ca5
("mfd: cpcap: Fix cpcap dmamask not set warnings").

>> +
>>  	pm_runtime_set_active(sec_pmic->dev);
>> =20
>>  	switch (sec_pmic->device_type) {

