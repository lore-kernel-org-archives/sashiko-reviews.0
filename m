Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795673222;
	b=4EF/0Q37P24BB3/8oi19QI8U16K4fcTijpGyOfsrTh5s81rsnp7A0wbT3A4g17f0qVle
	 NnjI4eHFQCUwZbjSbWvtOwKYSdSpn2LHXcuVfr6gpepiszXaemm7rnD7UzaMLX9LuOVlQ
	 fo7tim1/THl2eH0rIoDOJ43+9ijdUu1FxtFwL42umFo2Urf1QtAulHD/251HFKhBiVwhl
	 ynXvEJUJp2KnijBTjWvln+ydhxHbx3UzD3tSz5oHLd7g/pNCaYtL0k9WYA7I+rYEmHd+2
	 nyT08nZRTH/0LKBBWFndDraQ240Dj0WonlPUt68yVaczYXxy9694Ehjr1+T+P6etMBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795673222;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4p3UHmuD6i3FHMzkcfROZluK3zJL3qkZsQStVmiHRmg=;
	b=ENAuAU7U2Io3HmfOGSZ87AVPwWrpDs30JaHHUUPVIPh1l68SKzACRLUp2Y0N2RVPUVZK
	 N79Sh81OIg5UcO7WpvXQxdfzFOieLRHRRDUF48YGSLmiy6w5BXZSsPD741VcevTG8FilT
	 gmsIoyLHQvj72OSrzFbDeREvQfx+e4CP2CA87ytA6B7sIq9MmIpTw/xpA0NSYHWbNWUCa
	 q5dEi72tuAeOUAadYNNRCgYDaBOXHsTiZAKOn7n5vRwgnL4Otxk4Upp/K4H9byHO98lml
	 su3j7roWiEw6X0O6S9DEadZNnAC4i7vCBzNKUcD7muRqiA9oHE36UhqDG5MFScruh0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="h+/YFhTb";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bUxUlh2L;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DEE606A31E
	for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 06:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1DEE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h+/YFhTb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bUxUlh2L
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36MRa3022912
	for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 06:07:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4p3UHmuD6i3FHMzkcfROZluK3zJL3qkZsQStVmiHRmg=; b=h+/YFhTbeX1fcdl2
	7toz/08qhrPWD6DYf4DF0WKA7b9UB/Be28Vwp/2eGPaDHIbrIxd+8LlvO60kVT6t
	j+THMnhwAnjoepp2yhd+MPCMz+rsGaF2lxxspA2+NLnNsy3qtaQLkpPhRS7xGpGC
	nDa1IytaNxNt72y9/MUWKiXSiYsYrcDopzp4C3rmEYTeNjRp0iL2l/KIZdz/I/W5
	9iRdRfLjcWiFsmJB6DoLomTlsM5Jn33iRr/uZnYYMWcwDJrmMN1oanFW5C9MVL9P
	lW/Dzc1I9+EXTyc2GEktZJBubh3Raeho4O1fi0caZ8QTw8bjd5n78+9H4pi+5rGk
	mhdeOQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vatgy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 06:07:00 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4ab4f652f9bso4452856b6e.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 22:07:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795673220; cv=none;
        d=google.com; s=arc-20260327;
        b=qI9qDKKqwJskDkidTxDK7SEk1F8BUC7LfwpWljQ7pnwxjI2xcg0r2ujEqgv0hayW+e
         c98JvFAbRycrsQULlAp2zTYskqtQcI58HZsiaCDz91XbhQbk7tKf1ZXXmO4wWr/hwYMA
         VUCxnHJwn4siLpkL6QI6sHhUAaSjM8GwYZ5oeWAc7bdeb7pcLu0I9yigzAwDAuDqIUWq
         a+fbw8ZNUS+EDZWckG0rxHRrZnkTZwzuToqJIVlqpAgbbJxrrIc0hDphkjMUdRCrv/wv
         wbQQW2k9QeoxJmbyRU2oFD0dKmah/ddjOSNGsAbQW1qOohZAiEiC6m1tSEaPe26/SaUH
         omeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4p3UHmuD6i3FHMzkcfROZluK3zJL3qkZsQStVmiHRmg=;
        fh=H+gwCkcjSbequB1Ok3qiGVepWvNJo9Y477mtJdrNMpU=;
        b=kIAGNRONbYHKCmcm/FXXmQVUrnK3A9cAKr/m39Rzx5mCTPyhmxMlBXHOccGkbdjeaF
         gk70ekR3W+zYndUpwf58m2+cUOW4hWrYFxlw9KqzH7hWwf9etXHqxtQnPTqJ+i9lCAIN
         bkNvttRvvxcZa1TvIYVNG+suaZlDd5oWOrAD5SP9xFQxtefaoxCfbThXZkvBtfOkEEcW
         CTWaJvwBa4BKyo11dw+74oYbDmsGu+/cOmZyIwmSzUsubrtdZj0C1iOzb3SXIMWryAL4
         0PxrNEvhwi2A5Wh7c38Ta08+KR4e+VlYx/gQE3IkzU36z+UInXVBsSGWq3MQLvA3dc4/
         l02Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795673220; x=1796278020; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4p3UHmuD6i3FHMzkcfROZluK3zJL3qkZsQStVmiHRmg=;
        b=bUxUlh2LuVZahS9ore5MMaW/HDuBnkIONiKYKmjGOL4yA6DlprlWh01SVWQiQTdW9U
         BSQM3Ps9DX8cxayiQ3Av4DQZ7mF/UF6c3pXPomQsgKOC6pTMBlEA9J2g8zG8UTTh+7WA
         bjKtKDp+s3jjjL8sIPbson5pS+WftMrtEN/U/+DMGEGm7l4MxVzCh5HG3av7EcuRJq/r
         xFxVh4tRStdLDJmmEFTiTeg6rKC+etdmcb6dCpoxwbo1F0rzkrd3UcJuseOfEyjsMrT1
         QispN5YoMHI4M1zcr1rKdyHNG5AJDYJliF0IXcVEj7SeYmyMhWDFVH/b3WjMIyCIRr6n
         KxAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795673220; x=1796278020;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4p3UHmuD6i3FHMzkcfROZluK3zJL3qkZsQStVmiHRmg=;
        b=BC0QVneR3b8sgF5pjTpEBvrELwD1b1T9pUIFYGFqweV/kAJrgF+adxhcSkRwzszWPD
         DcJKBd6T8TAZJvg7s37DryYmx2zUiQ096YvSwIlXfo7TyAOEfqUq9zl1X3nY54/k0S+1
         f+eEUTfQHoePYqHPncvCeERzaE/o2PjbyMv+uYo5w5KXj3uDkixF24vImCfgExg+Q23S
         pHqaXsVCbqL+JTp1E1/kPVk/hYpBZYW2i8/x9acpVP1xKfRRCP9evhAGkQTHuaFLvoiT
         IkqDDoQsZOTl0Dtm7STXW9N8oTDhNpEVY9wrmgPMsDMH12vcNSYLNJaw07lMgg1oN3N7
         8JDA==
X-Gm-Message-State: APuU4Z8qtIpquwCmp/Y49Hh2rhNYF8ROp3WZnRfZmAPEsFXHamWKy64i
	BFt9fhR2bZrGjZaUltNDqWe5nHUxisWqrv296eo5FkldCMPTfXOAEsXnLzFBzbiAqZ+C4czdJ4S
	zwWyKCINnZVV7qlQTrRoN+n8rupj0Vdi1NQ2WEPWgsioAE1AbpWB2lIox+dzH9MZy8J97wNwRlX
	UlpGs6CBrmxaGjhWcUuYaKPbfzppPMOQQ5PZcU/vPjCaMpsQGP84hS6Q==
X-Gm-Gg: AZFdTZfO8aHPyRqY6AUkLgzCIq6MSVU2n5z1pUuWP5A5GwdWe0UFEo46FA4TewRfM34
	nCMWM9YrPyEK09ZEw2YBavmKdsNmV7Gt7iB+qsxFOkmEXPIkkWS5CUYwpqhFNlyyZyr4f57anhx
	4M/i1SWqlQoy49JZ1vDrC3eRxkeRfaZcFi7Yn5zByyk7fOSvIEbkLUBuasCA==
X-Received: by 2002:a05:6808:199d:b0:4fc:248a:de3b with SMTP id 5614622812f47-57a0a212627mr23641736b6e.23.1795673219783;
        Wed, 25 Nov 2026 22:06:59 -0800 (PST)
X-Received: by 2002:a05:6808:199d:b0:4fc:248a:de3b with SMTP id
 5614622812f47-57a0a212627mr23641719b6e.23.1795673219369; Wed, 25 Nov 2026
 22:06:59 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261124131542.613271-1-prajwal.n@oss.qualcomm.com>
 <20261124131542.613271-3-prajwal.n@oss.qualcomm.com> <sashiko-outbox-231227@kernel.org>
 <fa2fe9f8-04be-4692-97be-04e70894ab20@roeck-us.net>
In-Reply-To: <fa2fe9f8-04be-4692-97be-04e70894ab20@roeck-us.net>
From: Prajwal N <prajwal.n@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:36:48 +0530
X-Gm-Features: Aa3M54p49nRwbicntIbUh81KPnbFysaufURBklBNK_PoXr_KQKIKDtEWQlpzqeI
Message-ID: <CACksjdgezmM6DMZJB=5=VSxE3Te4KZROobpdveJPsAZdz-ULkQ@mail.gmail.com>
Subject: Re: [RFC PATCH v4 2/2] drivers/watchdog: Add RISC-V SBI watchdog driver
To: Guenter Roeck <linux@roeck-us.net>
Cc: sashiko-reviews@lists.linux.dev, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyMyBTYWx0ZWRfX3ztJq7W43kQi
 pbKwKvmYlaovTzrQCjkPtu/xP/soQhH98trsepndU088KpKTtqo3V5sAm7klIFlzVxD51ssAFca
 irJX1/R2Q+TfF/RXRWmE/xBz9pn9DSc=
X-Proofpoint-ORIG-GUID: 9LiZoeQ6Kp2uAVOm8WJ4KGoXhG6w6SO0
X-Proofpoint-GUID: 9LiZoeQ6Kp2uAVOm8WJ4KGoXhG6w6SO0
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b07cc84 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=_jlGtV7tAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=tj0QgOCiauEWum_1KWcA:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyMyBTYWx0ZWRfX1sdjZYg/o4zH
 IN0Lk0hNYW2Z5X4kBlvjWDaKxZa/hXtISvDtt0v09cKa9nfIecj3iUoRWds8y5vKMpyRTk1dd3C
 fUed3H6ug69N6q7I0bQsJ324pozOq8u+aQspkPfdv4oGKPyTcgNpuZ0OPGdxwa75MFt+wFTUdbF
 pxI0ufMr3o9voHP/ODcMzsJr6MYpkHT7E6Mhdv1UFw4FDlEzBKhG10zmVZ8U1kg1xHNYROwqiSJ
 Ci9+EMDJZ9Dt5VYfS8+zobI3UR9d3c6F9RGBi4F2ZGf5XTgckuFDu6m0RJJKRUjZIVQleZHS54b
 s7zf9YiYUD1tyJgfy1CUK4GOM+Hqyu4HXmVCeLG6iu1BD1aG2Zj02WJIP09/hSCGfcoAWjRa5mC
 XdplB5mBp/CKgO+++tvA3NegJPmirTUvzi3rDF3rSxjTZn2ewEY7IxDpmxHFJvjr5ab7QBxNfEn
 giseMlD7XQcwZi0rDbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260023

I will add a brief description in the comments wherever necessary and
will send the patches soon.

Regards,
Prajwal N

On Tue, Nov 24, 2026 at 9:42=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 11/24/26 05:37, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 4 potential
> > issues to consider:
> > - [Medium] watchdog: riscv_sbi_wdt: unclamped timeout bounds in
> >    sbiwdt_init_attributes()
> > - [Medium] watchdog: riscv_sbi_wdt: stale firmware pretimeout in
> >    sbiwdt_init_attributes()
> > - [Medium] watchdog: riscv_sbi_wdt: missing running state check in
> >    sbiwdt_probe()
> > - [Medium] watchdog: riscv_sbi_wdt: probe fails in sbiwdt_probe()
> >    without S-mode IMSIC
> > --
> >
> > commit 7154e44eab330baa1ded9a131b702c04ae8a2530
> > Author: Prajwal N <prajwal.n@oss.qualcomm.com>
> >
> > drivers/watchdog: Add RISC-V SBI watchdog driver
> >
> > This commit adds a Linux watchdog driver for the RISC-V SBI watchdog
> > extension, including MSI-based pretimeout notification support.
> >
> >> diff --git a/drivers/watchdog/riscv_sbi_wdt.c b/drivers/watchdog/riscv=
_sbi_wdt.c
> >> new file mode 100644
> >> index 0000000000000..8e3db98547882
> >> --- /dev/null
> >> +++ b/drivers/watchdog/riscv_sbi_wdt.c
> > [ ... ]
> >> +/* Initialize the watchdog attributes */
> >> +static int sbiwdt_init_attributes(struct sbiwdt *wdt)
> >> +{
> >> +    int ret;
> >> +    u32 attr_val;
> >> +    u32 timeout_usec;
> >> +
> >> +    /* Read watchdog capability from firmware */
> >> +    ret =3D sbiwdt_read_attribute(SBI_WATCHDOG_CAPABILITY, &attr_val)=
;
> >> +    if (ret)
> >> +            return ret;
> >> +
> >> +    wdt->attrs.wdt_capability =3D attr_val;
> >
> > [Severity: Medium]
> > As reported by Guenter Roeck on RFC v3 [1], should sbiwdt_init_attribut=
es()
> > check SBI_WATCHDOG_STATE and either stop an active watchdog or set
> > WDOG_HW_RUNNING on wdt->wdd.status?
> >
> > wdt_state is declared in struct sbiwdt_attributes, but SBI_WATCHDOG_STA=
TE is
> > never read.  If the bootloader, firmware, or a pre-kexec kernel leaves =
the
> > watchdog running, writing SBI_WATCHDOG_PERIOD below can fail in firmwar=
e, or
> > watchdog_register_device() will not start the kernel keepalive worker b=
efore
> > userspace opens /dev/watchdog.
> >
>
> If you don't think that is necessary, please add a comment into the code
> explaining the reason.
>
> >> +
> >> +    /*
> >> +     * Read watchdog min period supported in firmware
> >> +     * The firmware ensures the MIN_PERIOD is in valid range
> >> +     */
> >> +    ret =3D sbiwdt_read_attribute(SBI_WATCHDOG_MIN_PERIOD, &attr_val)=
;
> >> +    if (ret)
> >> +            return ret;
> >> +
> >> +    if (!attr_val)
> >> +            attr_val =3D 1;
> >> +
> >> +    wdt->attrs.wdt_min_period =3D attr_val;
> >> +    wdt->wdd.min_timeout =3D usec_to_sec_ceil(wdt->attrs.wdt_min_peri=
od);
> >> +
> >> +    /* Initialize the watchdog timeout to default value */
> >> +    timeout_usec =3D sec_to_usec(SBI_WATCHDOG_DEFAULT_TIMEOUT);
> >> +    ret =3D sbiwdt_write_attribute(SBI_WATCHDOG_PERIOD, timeout_usec)=
;
> >> +    if (ret)
> >> +            return ret;
> >> +
> >> +    wdt->attrs.wdt_period =3D timeout_usec;
> >> +    wdt->wdd.timeout =3D SBI_WATCHDOG_DEFAULT_TIMEOUT;
> >> +    wdt->wdd.max_timeout =3D U32_MAX / USEC_PER_SEC;
> >
> > [Severity: Medium]
> > As reported by Guenter Roeck on RFC v3 [2], what happens if firmware re=
ports
> > SBI_WATCHDOG_MIN_PERIOD greater than 60 seconds, or near U32_MAX?
> >
> > Writing an unclamped 60-second SBI_WATCHDOG_DEFAULT_TIMEOUT to
> > SBI_WATCHDOG_PERIOD will be rejected by firmware when wdt_min_period ex=
ceeds
> > 60,000,000 us, failing probe.  Also, if wdt_min_period is between
> > 4,294,000,001 and U32_MAX, usec_to_sec_ceil() rounds min_timeout up to =
4295
> > seconds while max_timeout is 4294 seconds, causing
> > watchdog_check_min_max_timeout() to reset both bounds to 0 and allowing
> > userspace timeouts that overflow u32 in sec_to_usec().
> >
>
> If you don't think it is necessary to clamp wdt_min_period, please at lea=
st
> add a comment explaining the reason. Note though that "it won't happen" i=
s
> not an argument or reason.
>
> Thanks,
> Guenter
>
