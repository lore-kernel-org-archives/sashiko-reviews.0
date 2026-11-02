Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793606313;
	b=it+ociR2U6U3VSTujp0psHXx9uxSu5TzKLyGfG/HF24gYlenT6T56k77m8ZwdXp2uGil
	 2zrL8J5jTAMSfHNt/icw/fP0iUtjCUQyCdDpsTP6g6Po34eI1h7aeeEzb87AbCZHVtUYY
	 6Ej1nkbxnQ1qXuZB+9X+7gzYKrQrhYHV7HAeG7gZdna1pH4RbMpHamTMDS7L6lgUYSazq
	 kHkA7R/spxXrc49B0xnuYjHuDJ6LOFwyfZ857Po9Kh9B4zJCECLLwmEGdsMDZWQ8oVtMt
	 juVrLohuw8RzVP8jJLoK+XLp8b6u7Mage0p4FuO4Zn9vD0AcDWCXjC3PIGhR+ja0PDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606313;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mZtzL6L1EoDOHZONsEcrNhJF6H1SuAxplHE71RmsGpg=;
	b=iQzqkQN2PvHQJ/AxMBoilD0WeNu2LGk8melpFJ0rmU7iCK46uoEsNxswuAbxeL65pHwB
	 t1k28nc2jI+JNZFnqOR/eNvDrJ8wI+wdl9WgcA8Bz8nxfOFgzPDTz0SL72jLrHJxHFO9s
	 5RTq/qxgk0eA7uyVFVtXFwEdbzNSea3kmOMSvZe3x6naD7M/m6mUFS8+cXM70tGs2SARU
	 gCm9xHdAIVPTGNitEBP3DuyvimLbIavBZwOoGjEnZKlzeh6IIuRTJTblyE7NseSkK2rOM
	 ElcaXUd/SgIseAEoKrMD9WoT03dgRxGm4rj15MXSQ2LpOVy2opCrf7cdP1VBrCIvAkw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E4QBBpmt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B5Qf3yi4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C6B606A326
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 07:58:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39C6B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E4QBBpmt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B5Qf3yi4
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vUwP2192519
	for <sashiko-reviews@lists.linux.dev>; Mon, 2 Nov 2026 07:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mZtzL6L1EoDOHZONsEcrNhJF6H1SuAxplHE71RmsGpg=; b=E4QBBpmt2In7Qmu9
	DBr0LE+pGJpfLapynb5jfL99S/lCOktxbQfVyTRn4CSDz1DSmsJ2oBL/NNhP0JHK
	5+veM3/zJq/NFWcFcm5zdZcx7tjnWGiag4D5wcQotc47jlPzAFsMlmZkgovYrpQX
	QeSL1JJXGgaCyIsEEz64gOzS5eDvOeXpRf1k4LYkc3rncdkk41GT0wHASrWqkVid
	RB0TRgXetdcGHgQjW/GEBILPs1TClhdCLieLBtbZuoUWjbjx65YwGJOjQf1LN8km
	RKA28BL/PJS856gBNrF1bk1bDRd1dwr/nJECrhiPFYQyGCE/R8/jTDFCeuGGVBlu
	lI/O3w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn93ennfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 02 Nov 2026 07:58:32 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd61bdc8683so1390884a12.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 01 Nov 2026 23:58:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793606311; cv=none;
        d=google.com; s=arc-20260327;
        b=gQBCSpu3hkU1YBMaVMBF/S+LOPtBYSq0RH3jQ3DLTBladzxZCAXtFn0+tkk//nPKa3
         LJIo58Cw9dc2FmztSJWJX0JC5xcgm4hqGgy0Rnc13sWA0nCgsoDKD22Mxg0MKLIY5yyH
         qlij2AnZOzkpsbzy2X80KcDVEZP3Y+8h8v9eSwTa6Y7HYQj8Y8mQ3boahFRn5mKQLAxb
         6yBwrW8ysR1cQM5ulRZ1MB6V+6OFAgvS2fNH4sT9kBXzmNlEvYzH/dHFVwwBs5Ci8fIT
         VA4Q6zQhG0hXDdkKiXeMWmnaLMKSVc+86VJO0m04PJSbTP6E0nf+EkjIpmdADyE7QmYI
         ZhYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mZtzL6L1EoDOHZONsEcrNhJF6H1SuAxplHE71RmsGpg=;
        fh=H+gwCkcjSbequB1Ok3qiGVepWvNJo9Y477mtJdrNMpU=;
        b=ThEzMbi4AYcqvGYDiks+onD39gat1AThh5d8T0vSScWc628oBpiTskZU+h4EzeFFd9
         WXsO1LAQO+sHXPC+jISvmN6NqPlJh1ka4lZUjbYuCnXk8+gh4Npchicz1aIo54pnBU6w
         1mJt8uJSIID42Wq4SU5ELYWGr4ldHIxkEcdNdLSjHibsQFGr9bl4Bae1azCmBj8qiRzl
         KjwTI+qC1s9McDUIaJWtflBpiisk1Q8f8SxR1VAuwfGrD+zaXMh2pj2KAGNo/k2o6wof
         BVsymSrm1qlB5VkNQ77iVM89OtED1kBXR2tky8Rwg31Y3nwiKZaLrHE5RkVaNc4rVKeh
         80rQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793606311; x=1794211111; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mZtzL6L1EoDOHZONsEcrNhJF6H1SuAxplHE71RmsGpg=;
        b=B5Qf3yi4Q0JEz6s56CZr4b6Icer7yfCn79C5nq7aEQLIyUo4AUB1iFXchmb09QixqI
         81i/CzpsMG2/enWE0UrvOIu62zy1sDfEMw5KcWOXz4caAnQipVgqLuXyM+A4+cngv0rf
         KX4cX6ikoUJ6oI9lK/sJ5WRLwtSgHc7muar1eim2x6EaNhrTx8gSnA/uuB/APJPrsvFU
         Z8QQAWsvG1hufzZt7RUZonR+WfK1qOBoTdRmm+gORICfXA0GmSHYljuM48HR28KjseAv
         WasFVzM4k2HklM3SFB1LPZ80EnenFncSvv3t4cUty1OrVmcJG8NaTw0KxNN3s8MYt45n
         raHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793606311; x=1794211111;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mZtzL6L1EoDOHZONsEcrNhJF6H1SuAxplHE71RmsGpg=;
        b=XCm3m0/BR3h3mkPtTd/HdiGSUGuCnMg2TJYU0iZGjPT1opJp7Zh7Ne2sLF1BGGOi2u
         0ffDhSUYQvEXZNdRSAEB3ASdq2WTmXjroMwSwA7M657arJFrq54bL+iXM6DdP4+rpcrv
         C6vnK07XZuDdryfVFe80pykT3ESLDzxwWjSrhHt2bisyJ/AMk57WrEBGufOYK2KMfg7/
         wD46crplgMA8u3brfOQvS1tkiE/FnL7PmuqVOwZ92oPEQkZ8eAXdpILIgVM6Gv/zpGX4
         TA6M2S9prSIeYRuxsR95gFlWgjtwRqLBEOicL7q7PVCRMFYd66xf8I/9U3SlQtyV1m/l
         CDPQ==
X-Gm-Message-State: AFq9FYIbncB9GS5/sHtjW8Zq/J69oJ9M1+VTJJfEWtjjAZwrdm9j03GV
	cTvBBP6mt7xUH6Uz1pEY6AyFAY0hNsNa62VXetvdIRZzSSER8QlEgizcGqdmzEuDDUUk7KgNEQb
	jux9cUpDLmwaCwaaJUC0RdB/w/oWtD2buqbVIZJRWnxU/51EtUtmBp6isHMPBcAlBju/9NiiDf7
	MkMCIAhKlXHhsDOPS/PQnXqy0fXgiPMNQEogFOIv77RMr/zA==
X-Gm-Gg: AYBFou2A9aQKfnK5ZwGsHknOygIdfOywdvYEd13rsC11Baniu+hLeeiQwbpVdih7/aN
	j+B7/2SKa3R9DHOpthTGzZ4yfI8OjMmeDMACa8vev6r+PfZbc3uE4kHMlnTwSUywf5iwuH5G6TJ
	k70M6limqQgI9zq6XTUVcNm0uTPRVFjrUbGetFT9MsKtPCU51Ch+2uidjhmvQ=
X-Received: by 2002:a05:6a20:a107:b0:3e2:117a:6307 with SMTP id adf61e73a8af0-3e928d4476cmr8481704637.22.1793606311467;
        Sun, 01 Nov 2026 23:58:31 -0800 (PST)
X-Received: by 2002:a05:6a20:a107:b0:3e2:117a:6307 with SMTP id
 adf61e73a8af0-3e928d4476cmr8481692637.22.1793606310865; Sun, 01 Nov 2026
 23:58:30 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261002163758.2919372-1-prajwal.n@oss.qualcomm.com>
 <20261002163758.2919372-3-prajwal.n@oss.qualcomm.com> <20261003013318.E74021F0089A@smtp.kernel.org>
 <67c297cd-eda3-4a01-a2e8-fce6c8993728@roeck-us.net>
In-Reply-To: <67c297cd-eda3-4a01-a2e8-fce6c8993728@roeck-us.net>
From: Prajwal N <prajwal.n@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 13:28:18 +0530
X-Gm-Features: AclHuK-dbBcZ1fvqVNA-El92LPsB_Qon-7NFUwOnbnYEauxMBxxJg7my1dj6rkE
Message-ID: <CACksjdiGfgyNXiSZjNyZ9M+j92HJ1xLKDYgwz2Ymh+6g+ht9FQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] drivers/watchdog: Add RISC-V SBI watchdog driver
To: Guenter Roeck <linux@roeck-us.net>
Cc: sashiko-reviews@lists.linux.dev, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzMSBTYWx0ZWRfXzsX30vedFYAu
 AQCNZrkImQD5AgZHDZBp59YDH47oLNpdQlXP7rsjzclVPh/+T7EAVnDWZd7xqN5Q8mH3/4iKvcj
 F3Bad+PZcFljVQvOB9tq59Wfnf/iy/XBgjwzTO/7IC12Ei0H40aXnh6aWMmeC1OE56iUr9/GiJP
 xUnlxzBtTLcSmOtyVh9kFXqXTyDX15qRTajO3k1Ma1/GeI3npeLmho14hri45sx3XuNFomevI2v
 vnQz7WzRVINDkwgm74XKdZfTSaV1CZyXPo7gbyYzaI9/YabfqDMfUEr2O5hlL+wBqSLNwrn/Cjt
 4L7M53Qn0KHpiQPk7VK9202epxrsvEXNxPwrxdLkchfRmomg5mHXTt2+lK8fAqFSQFKwTpxc6iO
 Ac+zTyNxDKHLK04O3poMQLe5ndY5KpW4BIZXead13J90wiy8Aa9dltG9LFWdO/KzmxmY+527T5+
 5vwnXXQlT+9NQvNRLZQ==
X-Authority-Analysis: v=2.4 cv=FciiV5+6 c=1 sm=1 tr=0 ts=6ae842a8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=_jlGtV7tAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=q2nx9lBKkH7kCXN1Ss8A:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-ORIG-GUID: hRDyVgD83iVhQ3DLn0caM60_YNERWBxd
X-Proofpoint-GUID: hRDyVgD83iVhQ3DLn0caM60_YNERWBxd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzMSBTYWx0ZWRfX3ZMoTGLvwUCc
 JvhSLMwveLPAVapxjcLa6jdU1r++/zgn7h8cZyVXEq5ZlhgXWczniBhXFhXFWrVE53vsS1RaJ50
 NUqeu4stQNyo/BK0WjnR5i/u0J7YKOc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020031

I am working on the issues and will post the next version soon.

Thanks,
Prajwal

On Wed, Oct 28, 2026 at 1:24=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 10/2/26 18:33, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 9 potential is=
sue(s) to consider:
> > - [High] watchdog: riscv_sbi_wdt: Probe returns success on MSI virtual =
IRQ failure
> > - [High] watchdog: riscv_sbi_wdt: Silent u32 overflow in timeout conver=
sion allows premature resets
> > - [High] watchdog: riscv_sbi_wdt: MSI interrupts leak and Use-After-Fre=
e on unbind
> > - [Medium] watchdog: riscv_sbi_wdt: Missing wdt->dev and parent initial=
izations
> > - [Medium] watchdog: riscv_sbi_wdt: WDIOF_PRETIMEOUT exposed without ha=
rdware support
> > - [Medium] watchdog: riscv_sbi_wdt: set_timeout fails to adjust pretime=
out
> > - [Low] watchdog: riscv_sbi_wdt: Build failure due to non-existent fwno=
de member
> > - [Low] watchdog: riscv_sbi_wdt: Missing module_exit() prevents unloadi=
ng
> > - [Low] watchdog: riscv_sbi_wdt: Build failure on configs missing GENER=
IC_MSI_IRQ
> > --
> >
>
> Please address the reported issues or explain why they do not apply.
>
> Thanks,
> Guenter
>
> > commit 5a455815a87582fc7be391ea2d8512e1bd8d0b90
> > Author: Prajwal N <prajwal.n@oss.qualcomm.com>
> >
> > drivers/watchdog: Add RISC-V SBI watchdog driver
> >
> > This commit adds support for the RISC-V SBI watchdog extension, integra=
ting
> > with the Linux watchdog framework. It configures and controls the watch=
dog
> > via standard SBI calls and optionally supports pretimeout MSIs.
> >
> >> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> >> --- a/drivers/watchdog/Kconfig
> >> +++ b/drivers/watchdog/Kconfig
> > [ ... ]
> >> +config RISCV_SBI_WATCHDOG
> >> +    tristate "RISC-V SBI based Watchdog support"
> >> +    depends on RISCV_SBI
> >
> > [Severity: Low]
> > Does this configuration need a dependency on CONFIG_GENERIC_MSI_IRQ?
> >
> > Without it, the unconditional call to
> > platform_device_msi_init_and_alloc_irqs() in probe will cause a build
> > failure when that config is disabled.
> >
> >> diff --git a/drivers/watchdog/riscv_sbi_wdt.c b/drivers/watchdog/riscv=
_sbi_wdt.c
> >> new file mode 100644
> >> --- /dev/null
> >> +++ b/drivers/watchdog/riscv_sbi_wdt.c
> > [ ... ]
> >> +/* Convert second to microsecond */
> >> +static inline u32 sec_to_usec(unsigned int sec)
> >> +{
> >> +    return (u32)(sec * 1000000ULL);
> >> +}
> >
> > [Severity: High]
> > Can this silently overflow if a user with privileges configures a large
> > timeout?
> >
> > For example, setting a timeout greater than 4294 seconds overflows the =
u32
> > calculation, causing the hardware to receive an extremely short timeout
> > instead, potentially triggering an unexpected system reset.
> >
> > [ ... ]
> >> +/* Set the watchdog timeout value */
> >> +static int sbiwdt_set_timeout(struct watchdog_device *wdd, unsigned i=
nt timeout)
> >> +{
> >> +    struct sbiwdt *wdt =3D watchdog_get_drvdata(wdd);
> >> +    u32 period_usec;
> >> +    int ret;
> >> +
> >> +    period_usec =3D sec_to_usec(timeout);
> >> +
> >> +    ret =3D sbiwdt_write_attribute(SBI_WDT_PERIOD, period_usec);
> >> +    if (ret)
> >> +            return ret;
> >> +
> >> +    wdt->attrs.wdt_period =3D period_usec;
> >> +    wdt->wdd.timeout =3D timeout;
> >> +
> >> +    return 0;
> >> +}
> >
> > [Severity: Medium]
> > Does this function need to adjust or validate against wdd->pretimeout?
> >
> > If a user sets a new timeout that is smaller than the current pretimeou=
t,
> > the hardware could be left in an invalid state where the notification t=
ime
> > is greater than the period time.
> >
> > [ ... ]
> >> +/* Get the watchdog timeleft before expiry */
> >> +static unsigned int sbiwdt_get_timeleft(struct watchdog_device *wdd)
> >> +{
> >> +    struct sbiwdt *wdt =3D watchdog_get_drvdata(wdd);
> >> +    unsigned int time_left_usec;
> >> +    int ret;
> >> +
> >> +    ret =3D sbiwdt_read_attribute(SBI_WDT_TIME_LEFT, &time_left_usec)=
;
> >> +    if (ret) {
> >> +            dev_err(wdt->dev, "Failed to read watchdog time left: %d\=
n", ret);
> >
> > [Severity: Medium]
> > Will this dereference an uninitialized wdt->dev pointer?
> >
> > It appears wdt->dev is never assigned during probe, which would lead to
> > obscured error logs displaying "(NULL device *)".
> >
> >> +            return 0;
> >> +    }
> >> +
> >> +    return usec_to_sec(time_left_usec);
> >> +}
> >> +
> >> +static const struct watchdog_info sbiwdt_info =3D {
> >> +    .options        =3D       WDIOF_SETTIMEOUT        |
> >> +                            WDIOF_KEEPALIVEPING     |
> >> +                            WDIOF_PRETIMEOUT        |
> >> +                            WDIOF_MAGICCLOSE,
> >
> > [Severity: Medium]
> > Should WDIOF_PRETIMEOUT only be advertised if the firmware actually
> > supports MSI capabilities?
> >
> > Statically advertising it means userspace could configure a pretimeout =
that
> > will silently never trigger on platforms without MSI support.
> >
> > [ ... ]
> >> +/* Initialize the watchdog attributes */
> >> +static int sbiwdt_init_attributes(struct sbiwdt *wdt)
> >> +{
> > [ ... ]
> >> +    /* Initialize the watchdog timeout to default value */
> >> +    timeout_usec =3D sec_to_usec(SBI_WDT_DEFAULT_TIMEOUT);
> >> +    ret =3D sbiwdt_write_attribute(SBI_WDT_PERIOD, timeout_usec);
> >> +    if (ret)
> >> +            return ret;
> >> +
> >> +    wdt->attrs.wdt_period =3D timeout_usec;
> >> +    wdt->wdd.timeout =3D SBI_WDT_DEFAULT_TIMEOUT;
> >
> > [Severity: High]
> > Should wdt->wdd.max_timeout be explicitly initialized here?
> >
> > Without an upper bound set by the driver, the watchdog core defaults to=
 no
> > hardware limit, allowing large timeouts to be passed to sec_to_usec()
> > which then truncates them via integer overflow.
> >
> > [ ... ]
> >> +static int sbiwdt_probe(struct platform_device *pdev)
> >> +{
> >> +    struct sbiwdt *wdt;
> >> +    struct imsic_global_config *imsic_global;
> >> +    struct irq_domain *msi_domain;
> >> +    struct device *dev =3D &pdev->dev;
> >> +    int rc;
> >> +
> >> +    /* Allocate memory for the global watchdog structure */
> >> +    wdt =3D devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
> >> +    if (!wdt)
> >> +            return -ENOMEM;
> >> +
> >> +    platform_set_drvdata(pdev, wdt);
> >> +    watchdog_set_drvdata(&wdt->wdd, wdt);
> >
> > [Severity: Medium]
> > Are we missing assignments for wdt->dev and wdt->wdd.parent here?
> >
> > Failing to set wdt->wdd.parent =3D dev breaks the sysfs hierarchy for t=
he
> > watchdog device, and missing wdt->dev =3D dev leads to the uninitialize=
d
> > pointer use observed in sbiwdt_get_timeleft().
> >
> > [ ... ]
> >> +    /* Setup MSI if the capability is available */
> >> +    if (wdt->attrs.wdt_capability & SBI_WDT_CAP_MSI_SUPPORT_MASK) {
> >> +            imsic_global =3D imsic_get_global_config();
> >> +            if (!imsic_global) {
> >> +                    dev_err(dev, "IMSIC firmware node is unavailable\=
n");
> >> +                    return -ENODEV;
> >> +            }
> >> +
> >> +            msi_domain =3D irq_find_matching_fwnode(imsic_global->fwn=
ode,
> >> +                                                    DOMAIN_BUS_PLATFO=
RM_MSI);
> >
> > [Severity: Low]
> > Does struct imsic_global_config actually have an fwnode member?
> >
> > It appears this member does not exist in the upstream struct definition=
,
> > which will cause an immediate build failure.
> >
> >> +            if (!msi_domain) {
> >> +                    dev_err(dev, "IMSIC platform MSI domain is unavai=
lable\n");
> >> +                    return -ENODEV;
> >> +            }
> >> +
> >> +            dev_set_msi_domain(&pdev->dev, msi_domain);
> >> +
> >> +            /* MSI setup*/
> >> +            rc =3D platform_device_msi_init_and_alloc_irqs(dev, 1, sb=
iwdt_msi_write);
> >
> > [Severity: High]
> > Are these MSI allocations ever cleaned up if subsequent probe steps fai=
l?
> >
> > Since this is not a device-managed function, error paths that return ea=
rly
> > will leak these interrupts.
> >
> >> +            if (rc) {
> >> +                    dev_err(dev, "Failed to allocate MSIs\n");
> >> +                    return rc;
> >> +            }
> >> +
> >> +            wdt->virq =3D msi_get_virq(dev, 0);
> >> +            if (!wdt->virq) {
> >> +                    dev_err(dev, "Failed to get MSI virtual IRQ: %d\n=
", wdt->virq);
> >> +                    return wdt->virq;
> >> +            }
> >
> > [Severity: High]
> > Will this return 0 (success) when it intends to return a failure?
> >
> > msi_get_virq() returns 0 on failure. Returning wdt->virq here falsely
> > signals a successful probe to the driver core, leaving the system silen=
tly
> > unprotected since the watchdog never fully registers.
> >
> > [ ... ]
> >> +static struct platform_driver sbiwdt_driver =3D {
> >> +    .probe  =3D sbiwdt_probe,
> >> +    .driver =3D {
> >> +                    .name =3D DRV_NAME,
> >> +    },
> >> +};
> >
> > [Severity: High]
> > Does this driver need a .remove callback to properly free the MSIs?
> >
> > Without one, unbinding the driver permanently leaks the interrupts. If =
a
> > leaked MSI triggers later, it could execute sbiwdt_msi_write() causing =
a
> > use-after-free on the released driver data.
> >
> >> +
> >> +static int __init sbiwdt_init(void)
> >> +{
> >> +    int ret;
> >> +    struct platform_device *pdev;
> >> +
> >> +    /* Probe for SBI WDT extension */
> >> +    if (sbi_spec_version < sbi_mk_version(3, 0) ||
> >> +            sbi_probe_extension(SBI_EXT_WDT) <=3D 0) {
> >> +            return -ENODEV;
> >> +    }
> >> +
> >> +    ret =3D platform_driver_register(&sbiwdt_driver);
> >> +    if (ret)
> >> +            return ret;
> >> +
> >> +    pdev =3D platform_device_register_simple(DRV_NAME, -1, NULL, 0);
> >> +    if (IS_ERR(pdev)) {
> >> +            platform_driver_unregister(&sbiwdt_driver);
> >> +            return PTR_ERR(pdev);
> >> +    }
> >> +
> >> +    return 0;
> >> +}
> >> +late_initcall(sbiwdt_init);
> >
> > [Severity: Low]
> > Should a symmetric module_exit() routine be provided here?
> >
> > Since the driver is configured as tristate, omitting an exit function
> > prevents it from ever being unloaded via rmmod.
> >
>
