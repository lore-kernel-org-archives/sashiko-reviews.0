Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793270496;
	b=IcIbWS9s9rDgJFSkYcafTLMiHi8eQcLAsEsYMhX/Tml7JOJJISdjItDL0WoIfWwANKAk
	 lJz7wo5ZPFNsxvia/zxw1hFoq+pUTnXxMT6IugIPUhxjJPdxlaTzp2j0TOeSGspwJkokh
	 fllgD+AHCdC08R8z44UFLu7jO1NGC3LjxLSq//us9fbWxCyHk7uqHYZoDSWJqMG2sj07J
	 hhLzmML0zMwfkgAnVgUE2e8q4L7b6woXcsXIBY9wWMmNJeqMV8/S+/OI2naIvx67YXrLD
	 D1t3AXYHswqowe73SXXj02hcCoH0tlNe2rz02BdzQHsvfUhFEcWPVkIgKov612c0Oeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793270496;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ThaS9L2WxGBV/+v02U6H4IYThEGoc9UFd91/APPVaNw=;
	b=DveghKkWPDJU/6aEM6cMYIbBcOCM+Tw63EiXG2DZpkEHCMwPq10LjLysEZlSXO0Q/bxD
	 WmuDgeDgmvYTSfWdqDMBvPR3dBUU4GR3QHhdDgDF7qF/Vp5XTCIwnAsM0tORZlva2Idb6
	 FTI8+zNGccyhjwRZti0o+eIjjRfudYPiGfLSuhNCiq2IgCGkCdxZMgzXXlPdzEg77F67o
	 bYTVznZ3/vTtLrkFQSYDDmF1Yzb5ME6wTFUQX44rtI373EkljSwkZXLeNYrW7E5ZYxIkE
	 /G7ugVHH/yF7HuJH7JlnXTSflseaM5wi9EEeFJqHIhzIl6ivzmZ6l8eO+bG2dowIWFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Myn2m8EG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="j/DVsgNb";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0046606A31D
	for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 10:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0046606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Myn2m8EG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j/DVsgNb
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vSFb2273523
	for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 10:41:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ThaS9L2WxGBV/+v02U6H4IYThEGoc9UFd91/APPVaNw=; b=Myn2m8EGkFqQlWOl
	ppph9AkV6Uh35kNQRdqtE/fJ8QTBVUJbAvz4OYPS2kDD3D++gWxX9JEjHq5fXTPh
	jt8uDIXrx4TuAUEoMPiIKqmZ7t5ulBGj3lJVPixVKcQ562SIb7ho8bwgGW6Y3PaM
	NcTDR3zApnSCR43vyHFTBN0zg3+KJ8It59TEvMGRNt0nGeE5yK/LqRP6YDrH1xVV
	l/pbMp/ji/sYkeqWkL8WEwU5mes+uQxyOYg0nmM5k4kAD/3yaIDQjwVpGXC60q87
	a3AbyHFd5XOkdqDdniPVTCEUVfwtYBKN7/FjCip6zuvx6wSmKniYAZscdsfl6HlT
	Bl9c+g==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm31b0dx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 10:41:34 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4fb73e868aaso3256322b6e.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 03:41:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793270494; cv=none;
        d=google.com; s=arc-20260327;
        b=in39LTiPIC6hJiinqF/KKDNScL9QllH9pwtmuIrFYA7O+uebcEeQPvtyFFGrLSZrp0
         dNRMrEewqVNuTNbfLCEW/54/Or5kk4gvNRCquOFoI0bdUUz2T0wXZoA4e7ztgBbMz8ZU
         T8a6dE7QN25NptGjgkfvErwPsK2CIimwAYCSEwTkdr2YSnyaGQx4NXZCkQeBIMqLq32B
         UWYBoNDV1LStkZBIjhxjSWeI9QQYwbJHUUdx3uGe4lV24jtZ/h50XKnWrL4Tcd2/W3IC
         lapamSIU2cC8dnUeEftsbUGF3uoUK7+i5zm9+IAm6pgilmp41/IbG+oAIqmHOogwJxFj
         FBeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ThaS9L2WxGBV/+v02U6H4IYThEGoc9UFd91/APPVaNw=;
        fh=TteEYLNWz69Rnwq8zlZOwoS/ljl9yTioyU5s8o5BwCM=;
        b=f9dDpi/OT2+53Uu6DtLqm3Vap+qSdeSWskuC3fKs8ImsyQKCbYY4P/dotRKBrYhZPd
         f8yfSIWyrwRfUOdyKHRAYIhOhHH4kyfFOW6vLPL04oesPSGFpj4p4u+AebGPdhdDxKMw
         8X1w9rAXP8Ynb8X4fJlnz27gVkam6lWl1ld8r4eWPNQMol076/9q42wVtIcoU9NFeU3v
         rtLxcZIBIrVGPT/5ZhncFpoFSXdfIIZg881y9L1XGuYFVGKizSsbcCZVLHVtpwlqnra0
         VIgfTXGejPVKdxDOnVdcix5J77pV10TAdXGY489GZkm8rJBiwJPeYyCHfLHM8lfuyT/F
         IIfA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793270494; x=1793875294; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ThaS9L2WxGBV/+v02U6H4IYThEGoc9UFd91/APPVaNw=;
        b=j/DVsgNb5HaBRIi8+DodZYacAFAyC1WmzkUSMD5yDVh9XKQ9QX6R9DqtQVyhIEROWb
         n3zClMO0Hw/dFFFSvqQV4BEma1uQKFKszsrSO98REEa6Jz4gLhX5aZLbbUes0wRV9Kx3
         C39oAp64xOHCD7StgvSigAw6p5eQAm4H342ymV9z8hpbN6/MwfwgSiaFnwyj4YBvXIqt
         vbb3is/fLW3cPYlqiv9csr0FiQUhWnj3tJMna/sKVNbyyc4h4n+SRYocZ5TFtAoWzzXY
         p9biCON1osORwZoq/CieQK/SS3W6ZVtiFMiR8ejILK+NMYC6TbdC8pgswki3nW4WYOXS
         c84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793270494; x=1793875294;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ThaS9L2WxGBV/+v02U6H4IYThEGoc9UFd91/APPVaNw=;
        b=D+BX/WujP4Ja162ml/HjlalKHQ4qOvPyfOiSQFfKuoPmW4rjru4ACcEtXKKbpZr1wG
         MXWD0dnlrBwBA1TGOCh1d+ram1nWbMRUiVQBmX+xLlg+N+yfBa0fJLf5GdA8i7Xqbd03
         sx7Jq3332aeKMxKfnUTkvLIn9azfYawX0y6heZyuZOW5XlNcHlMmlLLP9nB0ChqeFcdQ
         M5mVGdMsUWRwhtfXfHA6vqde4J3h+zmuAHDjg3DqpnXJH9WTOcmRAWvZGueacDCy8ZcB
         wwEv0i+zwac0nrEy5MYXd17vhI1NtPIhm7XB0QdtGtvG+Dw3cYMZrLfnZQIJtJhRso1i
         mBcA==
X-Gm-Message-State: AFq9FYIeINj9g1gXOxO6tJdWWm+twFNFISNd1gQPDI/MQ4zlOKEMRNXI
	6Z/ixiH3XRHzV96HmaDq/vmQ0LZcpVU7h0AJ0xz/ZX0JlkLOhNPfuQi4CfVTOeeFwj5N0yC5dDR
	9HrTEpBlSA3Wqv0qOf7mM+fzFiIMFs0LXED5WiPrhDsp93N/flaEmB48iJiednV6EfIeujyvinm
	eS/i4rSUIyZvMwQw0BqKdyMYG0Vf5t0EeezIB0EJzmXvwRiw==
X-Gm-Gg: AYBFou0hMFeFIEkyNtrN3BO9Zw1Obi1DyrSsEJV6/HdDvnxmot5NwxMmxXzK6CrKpOR
	MRxho09ATGh3VZXKnGPT9smX+UpQ77114yElK6K/PDk3gC9ccqxX2ElOyG14cZJlejip/GHtcng
	445wGbbxN9ViNUwM6FdwQrNsvE4eA2Lx8hOPbwq8+/nRnNNTt4tb5IK1sOoj0=
X-Received: by 2002:a05:6808:3c47:b0:4e8:d530:daf6 with SMTP id 5614622812f47-563827879ebmr3577171b6e.26.1793270493965;
        Thu, 29 Oct 2026 03:41:33 -0700 (PDT)
X-Received: by 2002:a05:6808:3c47:b0:4e8:d530:daf6 with SMTP id
 5614622812f47-563827879ebmr3577164b6e.26.1793270493505; Thu, 29 Oct 2026
 03:41:33 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261016-pcie-controller-reset-v1-0-51779736cf12@oss.qualcomm.com>
 <20261016-pcie-controller-reset-v1-1-51779736cf12@oss.qualcomm.com>
 <sashiko-outbox-174374@kernel.org> <179311790152.16692.4133912456520918774.b4-reply@b4>
In-Reply-To: <179311790152.16692.4133912456520918774.b4-reply@b4>
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 16:11:20 +0530
X-Gm-Features: AclHuK_wpYH4bUz72glh_V0oi32sEHasbbBJkx6tUqhqw7AanKcWYHCSLl2xaA0
Message-ID: <CAMyL0qMF6Ty0D+cM7Ccb_Nxpg7_vhpTV+xwErii63uOBOhS44A@mail.gmail.com>
Subject: Re: [PATCH 1/2] PCI: qcom: Implement .reset_root_port() for
 firmware-managed controllers
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0MSBTYWx0ZWRfX4J5bMSCxX0pO
 ImlGwrBvwxC/7CXF5JqQ9DaJcBSy3v2+2FU9eMFI9wGtSJLlDuOpLbEalarWgaQO+nOLcP1NkUl
 RF9MAH0e9aInOiE5s4N7lAB8qt3TYIY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0MSBTYWx0ZWRfXzWkEvIQzLCrq
 Bv0fqKIPxsA244j3mQvhtCUzw45TRB9qfDQ6u2M/4yvTEms440BmjtEXKsNWuYVCBgbniCvPRHM
 BenJSsOMn2Xj8DxBmVF4VEl7hUz0bJer4VxnUaljjt2Vs0krMvNhamcEEVICm3+eqWDzo+xoGjI
 lLp/two0VtWpBsm6+gegUNSPzWUh8+lTlUI5kPKqoYk07TlRQEyl4UgBTzXfJM2140CUxM/0Ten
 tk/s//6mWF1WL+pqb9faZ7KQNu9nccfAjDXxVflkSLilzfMA4cQiWC3Bqds3KZs7fpefosVB0BM
 2tD6TtjUMinTk8HGb4rV8NXFOj7ZwvwezCVOqtiW5UzHImYT8EnGfnm1h7eeFWhclgDBaGgXX4Z
 N4b0yEy2cZMtRnLTmFtrgVYBd8/Y+BJbCRclwS85ceW904nUr0HB8ENSfCYkUYZjwl1+cbP4jDU
 E84Ta49dcjPMxYqXOXg==
X-Authority-Analysis: v=2.4 cv=A8T5rKWG c=1 sm=1 tr=0 ts=6ae322de cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=RCz438OWDAAgn383P5EA:9 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-GUID: Fb1w_kh4FCNG_brvgPmTdNqvdE-RuFR4
X-Proofpoint-ORIG-GUID: Fb1w_kh4FCNG_brvgPmTdNqvdE-RuFR4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290041

On Tue, Oct 27, 2026 at 9:48=E2=80=AFPM Manivannan Sadhasivam
<manivannan.sadhasivam@oss.qualcomm.com> wrote:
>
> On 2026-10-16 13:13 +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 5 potential is=
sue(s) to consider:
> > - [High] pci: qcom_pcie_fw_reset_root_port fails unconditionally if CON=
FIG_PM_SLEEP=3Dn
> > - [High] pci: qcom: MMIO crash due to PM state corruption via pm_runtim=
e_force_suspend()
>
> These two seems to be valid.
>
> > - [High] pci/ecam: memory corruption due to cfg->win assignment on 32-b=
it
>
> This is not applicable as all Firmware managed platforms are 64bit.
>
> > - [Medium] pm: async pm_runtime_put() races with pm_runtime_disable() o=
n probe error path
>
> Pre-existing and should be fixed separately.
>
> > - [Medium] pci: dwc: lockless dw_pcie_msi_init() races with IRQ mask up=
dates
>
> Looks like a false positive.
>
> - Mani

Thanks Mani for the review.

For MMIO crash due to PM state corruption via pm_runtime_force_suspend() po=
int:

I agree there is a small window between the suspend and resume calls where
a concurrent config space access could potentially cause an invalid access.

I investigated replacing the force suspend/resume sequence with a normal
runtime PM suspend/resume cycle. However, pm_runtime_put_sync() cannot be
used here because the PCI bus (pci0000:00) remains a child of the controlle=
r,
causing runtime PM to reject the suspend request due to child accounting
(child_count !=3D 0). As a result, the runtime suspend callback is never in=
voked.

For root port recovery, the controller must be power-cycled regardless of t=
he
presence of child devices because the error being recovered is at the contr=
oller
level. Therefore, I think a mechanism that bypasses the normal runtime PM c=
hild
dependency checks appears to be required here.

Could you please suggest a preferred mechanism for triggering the controlle=
r
power-cycle in this scenario?

Thanks,
Mrinmay
>
