Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727632E7F39
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 23:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.145.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781219176; cv=fail; b=jy1udxoKayLDAVw3LBC7wIRcaquHmJBO246ICQTpxQoqWahJMivhA49KT71N1b0epB+V4Yp8lj//MRpq3W0iUvBJI2q3Y/vNr3AT07fEbfja3nEQuQUbOnOxyqPitX+qNMKl6mjYs0F2dCa0ArVRp+a+LZ2Uce2pmuqrTky1Fv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781219176; c=relaxed/simple;
	bh=8tl/mJ3jeelSsPisncFYTPJxxSNwXHFa0O0MaGwSjBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BdNLQDmj2DrRwIaqHZAV+BNg2TLRmpHsLAWtHUdMUZg4G9HMJ5ogpgGTsVaBKjUbFDTIEIFyi63S471lNh67UNR2NlIgumOD5cwAY12fLJboomn0xrrPhP00sz6izhawDwrgevJ9vy3NQ9YJFQ+6D6nylsuOMg9G6winhb/rJe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=aAliD7hP; arc=fail smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="aAliD7hP"
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BETtPs1664485
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 16:06:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=efsnF3+1jWR8pvzMYJfBE7lVlQMbzzxbwMqOReRrznE=; b=aAliD7hP4Pnb
	sDHga9w9vOIaX4gPrLDH9CxWfUDul6tHQH4Xi0x95taVkfEY+GcuJ5llY9o7rdU/
	6IxhrOtNRPf0TZXzirIqsi4bvN0RdnQAebO3TXTwQ1ciy0nZK/Rpu2xM5w244SPJ
	RXgJk7lo9T1WisKqszJAd+5MNgI/KlpyBjNrdHxIF9RMJjY3r8Q959ivZHAEzgoG
	khu0ku8hPaoN7AYRRbn9WFZIlTuHEdyYgbXmb7kn2o0lgBqUwRaYgCIBG8ogF9SH
	Vazr4Xq0IrMxhXUedk59GhVrJIceY2weOoGa+2aM1YsFU9fskt3OQlTECK6T/8pJ
	mXSX9Zuhtw==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4eqe7uhayj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 16:06:13 -0700 (PDT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4856ecace68so484889b6e.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 16:06:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781219173; cv=none;
        d=google.com; s=arc-20240605;
        b=ZDJGDT6Vj84DptBWM53eWMR0WzEHsB7XMBeT+oW14tt6WPj9X4CA6S3bTXaTtPGqT5
         7pCcuHxYx08HvpOSAVP7YI+uPQkPThPIKK0RBNBcIIE/MrEIgzX/X3/VKRm3imKjME/e
         /YdIKelKdKaoS+XbKuyo+9cGWy67+o0qlmi7POV5z9irOdQreXTSSnrDUP1MZDqKvOMu
         1wvV0AOzs51+Bwlz2mBxKYM5UJe0Rq5kUBiDOkfctu3iXJ76RiL2rjPNzkgZckAcSjhI
         p2a6A5DJb2h3alAuroGKrtSYerH5ekDcjoo/XTYIspUROxQmXgIKSOkVVHupj6rgAAXL
         N7sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=5o88lgTdR3UljadKJlYcq0XYptrmydXykEVU7qCr7g8=;
        fh=Y+KYivgtax/z85gVt76uyK1ORwE9fQMGlYAlHdz9B0Y=;
        b=f0aYwXUwrythkRxbEZcR/zs5AlW9eqKLy9T89t5ruUmJfezQRTTYso3h3U23rukrae
         yVwmd/2mpW3zWE6aVkZC4oHVg0HACmhHNavu2XInPz050YWlQsU99dJl4iytquIarqnf
         Ya5vzedlHSbiH2DWs4rpcmctHvJJ+VBGM1MLdnOwEirEO3CIMdZxR6ogVGylv35uj8mU
         9r7ZT54+G5fowLc+cJWrUj6Ch2iL6Iz2noMmt8P8rv3fCOerX/gxFohIEtpt7pD3Xupo
         v9+JtcvOkw57rKaz7Amz5HLBqOZ5k8USloP34R4AacZrdm7+po3UZeFfFty8uecM8bR7
         QZog==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781219173; x=1781823973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5o88lgTdR3UljadKJlYcq0XYptrmydXykEVU7qCr7g8=;
        b=qKkSfSgayOobR8d8kraacoa2b0LrXh6ANnSRZsGbQAf9+0OIo8fxHDCeVKbkKk0VUV
         Az4e+hVtvQ1l7gzjdb1yKm/nvm+XnadvnzWZEr2VaWVNiwdepD4wHG6cWF2cdrRx3oMD
         1tqfxh1bkSjIWqEFfW8SLJZC2QbkLs6IT9UG2YAliQirbqG4i9w2gU/Kjc1QFXCLnomk
         DEOfrZxTqWT11QqBtlymoz4XDz6KGoDvjQS6Ue8KG3i90s1DhyeUsgMjycWytgerN9G0
         TBw7MKgaW5+agAHWzhcdbT/F0ZiaC0bFANCVeBDVOUnmeZ4MJRqcUWkkDUdk7DigDcU6
         0AWQ==
X-Gm-Message-State: AOJu0YzGd3TupttWXfRH/NHD3R1crPEmvyU2pQN7LxmCcrW9gA2dAuzr
	zcKbrloWOdbvHEC+5G16zkVYkEoRK5JVPq3hxOyJcez69CszTMFxuAve4e4P+LHO/WNcHbqNIKQ
	lz33tbDipIUnpdnNvN9SsxI+GYHuUpZNS6CBkgeznCqm0fQHneF60GEXM2qRTVIUld0Vtva8S8U
	Dn5i+pR+bvyEkPKuptK6oPke4AKhxl6xcSiHmOaP8vvKihxYHByEk30g==
X-Gm-Gg: Acq92OGhn/WioqwXLBvaCxxpua/fuh9kkseOS7pS+ELoAP+3jAkIrgSKQbB2ujyYaXt
	xO5Zat6mRzmjjUl3r22rHJIjVaphWnWSq0is1aEmkonYRFAGSCJLO+LrQF8D3KQSxreEd4EH4Ga
	cJvkxEeXlZ/2/m2C0Z7TyznZGZ81b1mYDoI6egqP3nPG0h/j/sJdmF2Crl+YaZtzbF9Eax4i1UP
	EvEA7E5BjnGz7AA+0ccSQ==
X-Received: by 2002:a05:6808:3089:b0:486:3498:d1ae with SMTP id 5614622812f47-4872f397045mr351961b6e.18.1781219173058;
        Thu, 11 Jun 2026 16:06:13 -0700 (PDT)
X-Received: by 2002:a05:6808:3089:b0:486:3498:d1ae with SMTP id
 5614622812f47-4872f397045mr351942b6e.18.1781219172624; Thu, 11 Jun 2026
 16:06:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260610193158.2614209-3-zhipingz@meta.com> <20260611202558.09C691F00A3A@smtp.kernel.org>
In-Reply-To: <20260611202558.09C691F00A3A@smtp.kernel.org>
From: Zhiping Zhang <zhipingz@meta.com>
Date: Thu, 11 Jun 2026 16:06:01 -0700
X-Gm-Features: AVVi8CeJj9q0ez37YfrPTO2KXyhyeT-bv8zCIdToMWZsgp_4cN-UqKdyKzNGj7A
Message-ID: <CAH3zFs24Gs6MSccrNoP-UmowvpcV8PmweegczKU7Ymq+kMtdxw@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] PCI/TPH: Add requester/completer type helpers
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org, linux-pci@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIzMSBTYWx0ZWRfX1PjdFICMEPFd
 d2TwXqKDfJWqmVEO1UxfWC+aBJRq4TK5E5nVdGOhT7wBZRinVNcmsGBtkGZ8t3BEa0NbO+UeWuW
 lCqvRmzkzNZJHMfmaLh9Quo380H7ZR4=
X-Authority-Analysis: v=2.4 cv=UK/t2ify c=1 sm=1 tr=0 ts=6a2b3f65 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=crHB47gyY4rKiduisYu9:22
 a=VwQbUJbxAAAA:8 a=4OgE2WNpP8yww339eGMA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-GUID: pc3jgdZIOnUwigv_xiRO5l0rxBLfAxiB
X-Proofpoint-ORIG-GUID: pc3jgdZIOnUwigv_xiRO5l0rxBLfAxiB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIzMSBTYWx0ZWRfX3oKV6lSlvoo+
 Mwkj/Bot5+4wTG6iQCTJMPWplFNA201iMjZLDWmpV2J2pP1YPOFsl4rD/99diY6nTba6LiVjPEo
 SCN3wd15qRQ8nL098VpTE+XSn7v0pVKjjQmbo5xnC41YmcqjBZelhR2tBw0xwHg1zUHpX7zhZlC
 vk8zV9RKtFt4jEdCDKVKSGHsoAhDqoi5ybrnhtvjd6wdfkv6UOFOzEWe89M3x1ZSXch8Kmlyryk
 4+a2HUpVyuKNrKdUrIEjA6Ihth3l+S9hbu8OS6EGmMC+3xVdrIeJIpkTIdcwWESG+uzBvVlCnma
 yNzcSB956sukBYdHltyxDTg4jxQZVgpwiByQNL2elGAjoekBfp/9AtcZTOClJM72IJX//p7nyCE
 wJO3710Xq+MG4RqmR1Us9yneYWS/SzvEXAL9mwShIPrTXo0Ow6j6Ngl63QCaPlEwC6bxie+JITd
 ga0CQEmxd/ty7n5pvTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_05,2026-06-11_01,2025-10-01_01

On Thu, Jun 11, 2026 at 1:26=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> >

> > diff --git a/drivers/pci/tph.c b/drivers/pci/tph.c
> > index 91145e8d9d951..4fe076bba953a 100644
> > --- a/drivers/pci/tph.c
> > +++ b/drivers/pci/tph.c
> [ ... ]
> > +u8 pcie_tph_completer_type(struct pci_dev *pdev)
> > +{
> > +     u32 reg;
> > +
> > +     if (pcie_capability_read_dword(pdev, PCI_EXP_DEVCAP2, &reg))
> > +             return PCI_EXP_DEVCAP2_TPH_COMP_NONE;
> > +
> > +     switch (FIELD_GET(PCI_EXP_DEVCAP2_TPH_COMP_MASK, reg)) {
>
> [Severity: Medium]
> If the device is hot-removed, pcie_capability_read_dword() returns succes=
s (0)
> but can leave reg as 0xFFFFFFFF (PCI_ERROR_RESPONSE due to master abort).
>

will fix this one with check like below before the switch statement:
 +     if (PCI_POSSIBLE_ERROR(reg))
 +             return PCI_EXP_DEVCAP2_TPH_COMP_NONE;
