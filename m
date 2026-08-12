Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B329937756A
	for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 15:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786546849; cv=none; b=RUoY7XfB1xXNCKWNZw5KD1Cz6ia9r1OCXbtmOyVBcfrOaZFPkV3ZkNnYPbf0cv/8MYYWYEhMdQEAR5gtQnY3bJFoVmt62HRi5VhDnEkVB5TTT0rDir7RglPsPlpnERA0CzpoZh1cPfCrw2/xAA56qK3necLJh/o2oY7N+OrRDdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786546849; c=relaxed/simple;
	bh=xgk+CgH4afMyfq2ZdDJqEF70UaBNYpLnTTP54DjqXXc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CXNkbxAGvhR5bYxrMumpdqmjdNy2LMNjNtI3Aw4YKtBWgnIZH2vZQmS4Uu1x71jMkRxVputZstLLlADseDotm0xgtURIUKOlkH/omsP0/GJSIHsRMEAsrQHpwrysQfdOPwpcrRwSoNVXRVzLfPerpCcXYCu9nZjXdTn4CVfekkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=okNRH7eb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SdcDIxK9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="okNRH7eb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SdcDIxK9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CDbTi6899527
	for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 15:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q3UDxR7hJxn5EMNRFope/geP9prYSEawi+pNDGzEyCI=; b=okNRH7ebFYBRXZLD
	loYrwvsUBmcRXI/bRlA/UPyZakEV1GuEoQeVbULhxEel2O3KQ7dA0PCHE2pB4qb8
	IQzLXBHTRHsFPaB3Y71nwv1wHo9Mr6ReiUz+uMAbqDg4VlZZxlcPSIGWPVfmlZlr
	9hmFVh+b2orqrGXcHOUXH8El1cVZXD4gqxI11YBRuRp1FPrJKo+GDNO/sMQHAZlt
	n3vwfAysJvcuEsE4Y3O69alI2UwyzV0+3cPWFvTf+riq1PHDK4x5pF5DNxBC2Hce
	L1NeAbpsvb00SG7NBkNIzIHgyDMYfr/36wyAp8lRCD689mmSxXbz5Euv+jE4BvY8
	evDdOQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0nut9f8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 15:00:39 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84f7002f9afso1107305b3a.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 08:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786546838; x=1787151638; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q3UDxR7hJxn5EMNRFope/geP9prYSEawi+pNDGzEyCI=;
        b=SdcDIxK9rsoxKsma8OrjVdAgFClwLIF91FBv4wn3GW1tG1xr+weqAn6P0MXl4yfLvt
         sa6UPM9r4ATWU0yYIW+XtrJQUesTMnKC+F2QzmkjQZgCt6MaACAsgt7wRaG7qOuRFkHW
         z4bbvuyH/lArygzoexrqfuF1pQ/fbnf7KMw2tScmPSUiJ2TEyop+hHIGhxsPuzZSyyYt
         LFeMaPDnMDCHUjjQx+4O9pKKgcf/Jd2TZvoKG9KgaIc7M16+1C3ZvXTMXDJudUEe+wRw
         QlkHPaJ1O11QxkazpPOmfMx3tuIK5F4JXpzQ5xOJm8bkWKp7YUOl+iNXVA5qQ2VQUMuB
         38Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786546838; x=1787151638;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q3UDxR7hJxn5EMNRFope/geP9prYSEawi+pNDGzEyCI=;
        b=S02ksexJxBw6Qv8EQCg0O7trSVsFKkJy62JXoO8av57SStTopTbF8ey2yRbffneLZi
         HeGwEI7EA5jye8dLi6vtQzhaq5SBEPiD02a8ui9mCZ+yHRGgmCUKnrhLOsyV/6+yAwxX
         cpCdGIdFN1o8ij/W1gbxTZaTwmstkYz8PnRYGhL7lRjbhGi53aVHmArQY25+oFUCLq70
         a8QZYmqPnO9eTe2m/qR9JGSPo5pX0LH1a6cjLoKBz4hHsAF8e+xGbtAo4XS2epW/xNHE
         NJ7VgMlMY9jI9TysXlDRHOZJk42abHX6l9DJ4HtMDnHomwDEdFT5Kf0BRtNZfC/FPHDD
         iZpw==
X-Gm-Message-State: AOJu0YyIMWYiiiwRuNvJVTpfu+ZaP45g+oXMPF3MBQlbMPJb9d31HAn1
	pDBuLMPJ7np+5pkhq26Pjj7alSWm8zMdD9f7aSxk66UnZQimbJPIyKMS6oV82+eB0eSysJX8ir5
	aSHi3xPV2JsKuTFutqQW4vqQhEMyV/FNIgIs90J9sEaWV/4Lr+pYxVpW3b9pkSNV0oQZ7C3khST
	TFdPtgGy9V
X-Gm-Gg: AR+sD13ejBJM8cZJk1PxggdAzdpp/KmzVa2rjjudEIK/upbIF5z8bhTtTh47YkdxUTb
	VJHRGa4gTBn5RhJv6ICAvex7PdO2lcQsgmvl9q0IsqDKM5i/0JMxjrSPVkU0Lfve9nYvd28s8rj
	wUQQgmROsTN1eoAOpef5ag7TxpL8UUt5rcXL2AHGnHaTZBkBnpwixgYQoZ7z/8KTRFAK+J2FWLN
	6K6QNh+6LUHjUSPCqCt6mXu+6YIFmpYOcwYB20w7/P2U5H13Rk0fwnD+EiCpkd65FJWf5lTudqX
	/CqO4M6Tv0IYol2fW4MEXN9vIyXTCKzIsahcsFzFU+FkWwBzkBualL2nSQQ=
X-Received: by 2002:a05:6a00:3686:b0:84f:a640:3ed with SMTP id d2e1a72fcca58-84fb55abaebmr6810606b3a.38.1786546838160;
        Wed, 12 Aug 2026 08:00:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:3686:b0:84f:a640:3ed with SMTP id d2e1a72fcca58-84fb55abaebmr6810182b3a.38.1786546836624;
        Wed, 12 Aug 2026 08:00:36 -0700 (PDT)
Received: from localhost ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fb1d492f0sm1191939b3a.23.2026.08.12.08.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 08:00:36 -0700 (PDT)
Date: Wed, 12 Aug 2026 11:00:33 -0400
Message-ID: <536fd5e22856840296db301e99b6fa01.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, kvm@vger.kernel.org, devicetree@vger.kernel.org,
        robh@kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 07/17] riscv: Add B to hwcap and hwprobe
In-Reply-To: <20260701132755.50D5A1F000E9@smtp.kernel.org>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
 <20260701-rva23u64-hwprobe-v2-v5-7-2c61f94a695a@gmail.com>
 <20260701132755.50D5A1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEyMiBTYWx0ZWRfX7dSkl7ZOC7Zl
 V7PjJaoptF/yHxh3wquUUYqEUT1FVmXCxkQreeksGy3INvCFxTW5wNH2fTjuxge3B+tSsiOJitn
 1wRJhJU4SfGeOR62peYixJMKCw78dfs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEyMiBTYWx0ZWRfX+imK4s2zeOPt
 aJNbAqkHwWyCRhN7s4BWq2aSHJXZNjk9MgHKjlz9SzziEPvlAucDHrduEZfCv0UjVDkti7aBEb5
 dR236kho0/bYaWELtpJDR6StaEcsP8P5aLyKXaU7F5B/4qDsvKEqVie4w7CpDNk7I2uzvV04a9T
 jc2zHuXp0jFRUGmTq1Zu7zsn44hPHN9i+6HqFgnxXEaqrzZGgzHi2hKrqk+fwLKfSyYr1YaGa9Z
 oZ7J60oaqb+IyS7eWYGjOIB5s4GRGaE+9m7+8ixtjdd3PmqlhzS96BwB4vDfF1NF7d6h17zwEZl
 cAjXuKndixzYmJhxn4BQXNjWxnXCmx3lY/7Ki/g7DleBRtK+q9AsJL85m0rqzbAnK3Zdqgx61kL
 L8YsEhlNoJYnetsKlc1U5SnAvkQKGdHomB/I6iJuKz2qBy5SvFnsOVWpY/Q1I4cCWkU8xOHO9Fb
 hEZvJx8WG591bm4Tvjg==
X-Proofpoint-ORIG-GUID: WIq21yUuwg0velUxuq690MjD6ZdqwboE
X-Authority-Analysis: v=2.4 cv=POA/P/qC c=1 sm=1 tr=0 ts=6a7c8a97 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=N3_LGyncGubAy_kLYfEA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: WIq21yUuwg0velUxuq690MjD6ZdqwboE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120122

On Wed, 01 Jul 2026 13:27:54 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The new B base extension is added to the host's hwcap and hwprobe, but KVM support was omitted, preventing VMMs from enabling it for guests.
> --
>
> commit 1f4cf004cf603a91f99c0c6776c5ca74728ca05e
> Author: Andrew Jones <andrew.jones@oss.qualcomm.com>
>
> riscv: Add B to hwcap and hwprobe
>
> Add B to hwcap and ensure when B is present that Zba, Zbb, and Zbs
> are all set. Also expose B via hwprobe so that userspace can probe B directly.
>
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > index 0acb7a01ecc0f..58523b3a1998a 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -11,6 +11,7 @@
> >  #include <uapi/asm/hwcap.h>
> >
> >  #define RISCV_ISA_EXT_A		('a' - 'a')
> > +#define RISCV_ISA_EXT_B		('b' - 'a')
>
> [Severity: Medium]
> Since the B extension is now exposed to the host, does this patch also need
> to add KVM support so VMMs can pass the B extension to guests?
>
> Without adding KVM_RISCV_ISA_EXT_B to enum KVM_RISCV_ISA_EXT_ID in
> arch/riscv/include/uapi/asm/kvm.h and the corresponding KVM_ISA_EXT_ARR(B)
> mapping in arch/riscv/kvm/isa.c, KVM's ONE_REG handler will drop the
> configuration request.
>
> When a VMM configures a guest's ISA by writing to KVM_REG_RISCV_CONFIG_REG(isa)
> with the B bit set, kvm_riscv_base2isa_ext() will return KVM_RISCV_ISA_EXT_MAX
> and explicitly clear the bit from the requested register value.

I will send another series to expose extensions to KVM guests.
Let's settle the current series first.

Guodong
