Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794207404;
	b=oO4sss/uIMIg/JB4x6/91/KRsm310jtSfJo1Q2pE5G3CMOezxf3PbKgynRPThSSHlteR
	 tYS2L68qEPxNsZwfOa4vR8pGSvRmmgno5Z+wL6Xjz+ONEiEh8TMe8goMj4Qz5yJNLs671
	 FhICyXz7xtv841ukxc/OI24cN9A9xpeWImqaiWUjfFdzFhEazITXyRbj+PAZHpH/GQ6At
	 ojJcGbbPiapojK/wpYm+B2rDEvzQtxLU4WMcioUHwx21knd36ZbuP6M7AgdEnsPEy45NJ
	 RtObQEuy49M9OBtFrs0wW58jpkrliLLlMuLoT0P/rVxXZ1rNDMHYk6v1Y88fH0uIOiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794207404;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FVlDQiYAzlUAps92afrUdozgba47YEFEtD8mmVPgag0=;
	b=axxLd2eatSv9qASiOIWnKXY+73bv8K45n9A1GMklR0g/9TY42vWM/+OmRbl34wXWI3QW
	 KSKUEgW+YzbtQ+Ms/1ZA8F9Hs/refHSv/WkccyUkciLticqwD992pu87fvCcf2b/SMaM8
	 ojec/+smzw81MaGdDK7SMi2OFacNdeT65YV12+jd8RlQ9kdyemLSTt6vpH9yKAuqhkuM3
	 +1MQc//OLaO9ZNJLca0xH55Gk1JVTCeAgK+PMkWD7kQujOwzET8D/WUSUF2A7zonVIiZU
	 EWGWtpYFndLm/bNNyQlQnlr2o0j/wXorJGLIORjozIzvchuuNPeRmsgT+j6upxuzbbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eoZA0Z9m;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=arUlK2RB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B653606A322
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 06:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B653606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eoZA0Z9m;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=arUlK2RB
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96AArT2540203
	for <sashiko-reviews@lists.linux.dev>; Mon, 9 Nov 2026 06:56:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FVlDQiYAzlUAps92afrUdozgba47YEFEtD8mmVPgag0=; b=eoZA0Z9mheajML8c
	OWEajKXiEV+AQjOhs8OFtNJNeGki5ZXbZB/K0isIwyx8TAzttBJh7TOJtZOlq6nn
	0wu0y1yOva7pMY5admj3Pazk2oc8AboY6dNkQGwYS7I11kQfYnbx8zTBtNXmq7/o
	9RwmAbiCvupZtikLPFft6T4xhnH/d/QrHKzgMj23HxL/a9H8/WbvniTHPkBXc1bz
	rWYVFKLIgB3RnL3pQ7jCcluRe47T3otlQBMmQKLYYhcN6HtRDzJwfxqidhnfOBmC
	6gvGfjGrOR0PRvbHRl7Jr8SNtlk6zLBsxBrFmbiABl+zRI3tFf6bBY0bX6OcWaDI
	2usPPw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsvc6n33s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 09 Nov 2026 06:56:42 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d2c415bb8fso71992137.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 08 Nov 2026 22:56:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794207402; cv=none;
        d=google.com; s=arc-20260327;
        b=Zf+uza0SdQgqD/B2drN4AgSbSZU7k9US0+MWeSS8hKq/es64Z930r4YElzhtAEMn4Y
         /kLxsZHyj44zUnUBdtHgFwp/MrPrE6D1xCtGPgVEnr/lwMT4wrvOEXGA3rwxfUD6PEHC
         Pz/DAf0qgYCiVsHRSlHAg+ZgFrIkQ7e+LzvJRwTxhMyrMjCiAPgFPetB0GXMlJtMErS+
         UM553tx3scFCU8I6ePeKoCO/f53F11MXG6S7L8OA57eHV+GPh/Y3fkLWstSLL/hLVZ+s
         rI6NdtWao2WLtn6HUgpVznzYSYakTkFY6iVNcGI1iS/yomt91gffa/ZXnN8WGIYvGXvt
         k1qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FVlDQiYAzlUAps92afrUdozgba47YEFEtD8mmVPgag0=;
        fh=3vDz9lJKnlW6QSf3l3esPevghRQpR60SnpfUFqiNchs=;
        b=qCoe6NHa/54lTh/ccLmBv2CM9/j42mxpTPQw0WWKLrq/7y/PA1Krr0G1HT3yzXBmDy
         r7CCXiIbbKvPaSc79J9IM8BR6IfWVNPvpWMhgof8j0wvUadptZRPrNWu2ui8++oQUkK+
         B2OjoCaqF9OC3tQr540dfbt73GhiRbbGtu58cgscQRWbXy/TbYojOJEtl25EjN/fuJhK
         k6KYxONgtZ+s1H1lRgmba9GwqwNcDx6uU+KBYfb28TIpKWC9AB/h0f8rof8SlatO7CA7
         pAklHGi/3KvFVjzgXQTIVxkzULt9AhedmWEN4qml+L15RE2K7rKbhz767yMo+rqPQUpP
         FYfg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794207402; x=1794812202; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FVlDQiYAzlUAps92afrUdozgba47YEFEtD8mmVPgag0=;
        b=arUlK2RBXGF3Hn3dE05jbRnideISy84K0379iGu8iuOJZDz+P7q54HPpxxUBAySCqW
         KWp/naccnaiW7Jaop099vsWdyKl0I/KtNqL95g2K4His2frQDO1q1JGxy3LGEShXvi+9
         U9HYwJ68lBhGpDjzYupH+X7oni81wnokj4xLYPHlHA7udwb+yHWmREBekygybuEreeKZ
         w9kfZfIN1T4MGUNgFC88P7iHNp1yMWMjwzZ0igQTpLjFE0UPOUG0DTD7IlavIEeKjl2c
         i4cBxTrdTlcdUBlhGHvmhF/ltZgKGG9mWa8bV8hf3SQK1XNrBeiQdSmMWLIXaGDm6eEG
         XLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794207402; x=1794812202;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FVlDQiYAzlUAps92afrUdozgba47YEFEtD8mmVPgag0=;
        b=LCuy15/qWD2IJrAMf2g930aOA8yWBArb1ZmMH7FGF9MkWt5kw1toJ0ikPfv4b4x6FO
         X+qT1R0rxcR1K2Vd623o3VnUNf+vOPA6LfI18lPaZZebiXTEjEK2NohcWLIHhkeP2JpA
         xY72Cj4gGuomXc3O1KabeE7I8XDsUVUlp2GTclZpT2Faz86hRx3g7z1TB+AAFjlLxtck
         XfFODnHEbSoF6gHZZJAT0XhO4q7juDOXTidBZVWb+5vZ8kHuKtawJw0GxwQsy7dfxQbl
         ul9z7q7s06dRCaA/MkzmXz8nGZ37oUsaAizt2X7NLibou1FWpQ0xfXAZ7aGrrXyoUcjT
         KQEw==
X-Forwarded-Encrypted: i=1; AL+hErE57YqE8S4JXIJsrwVZzJSJs+fihsh1Ze4cRy7FZaleAkVPDtKT7+cxLFu33qhPV5nKJDUm2FF0qKtCa2Wk/F4=@lists.linux.dev
X-Gm-Message-State: APuU4Z8zJwxUmL+amNkv1r8dnet+kBuVbUEy+iF5eLstdiWfwPxS3x/9
	nr4SzTIvMZS0jDr1CgXy31tS5S2xd29FxncTfbiApbDAnZWRAmRY1FZj7C+cAp3iYQAGAxNW5Xt
	vgzwxFvLR+naoQxKXq9PbjzQPxxIm8E3PEEul+Qdzy6y0gI6hqAUwmEbw4nY4Yjcf2L/Su9kv95
	3E/37OhX0gk2YFW2WHRaxFYLTbIOEm7pTxsPNzoG8DfoWUNg==
X-Gm-Gg: AYBFou1okZQJIjKrVuWTNx/WMbLCjor1DfqLEGQndWiSl3rFpXNy4BboShx6MDoGF/5
	I2bQu4lEgxrRvm9Ol7UVP8G01hqB3Ynn2EHazHh7iUzfohjBHnFLbftZi4B7bOWDtCe2pvBT553
	w6u2k9LA73uRI4aZqa6l1Fbq/ZqsLflRYRLBFok9MQDb6PvCm4+tKAzeuyV2YdRbd8wK3wmMsUs
	t+BbWbOFqJSTYGJnw==
X-Received: by 2002:a05:6102:4243:b0:7c2:5692:1917 with SMTP id ada2fe7eead31-7d2daf18c15mr600764137.10.1794207402089;
        Sun, 08 Nov 2026 22:56:42 -0800 (PST)
X-Received: by 2002:a05:6102:4243:b0:7c2:5692:1917 with SMTP id
 ada2fe7eead31-7d2daf18c15mr600761137.10.1794207401488; Sun, 08 Nov 2026
 22:56:41 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
 <20261102-kaanapali-camss-v24-11-d6b8f3f6f66f@oss.qualcomm.com>
 <sashiko-outbox-193294@kernel.org> <179406416444.650304.12581893664974319470.b4-reply@b4>
 <f5a3fbf4-a7fe-429a-89d2-7334a2375da4@oss.qualcomm.com>
In-Reply-To: <f5a3fbf4-a7fe-429a-89d2-7334a2375da4@oss.qualcomm.com>
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 14:56:29 +0800
X-Gm-Features: AclHuK95DxYwRvpsPwMVKIuYT0DRO5_ENKOlA-PzH3xTxewQROtpJ-Vu871iDJ8
Message-ID: <CACbMrho82SOj5QKJVQQP6W_jcN8U3h3c2X9q1DTvfgbK+J03_Q@mail.gmail.com>
Subject: Re: [PATCH v24 11/15] media: qcom: camss: tpg: Add support for v2.4.0 TPG
To: bod@kernel.org, sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAyNyBTYWx0ZWRfX3WEuQ559WOCL
 IkdQNZv4Wu1RqyG3gspS/1Y9rg7FVnfJewCFnBGPZ62+JuMK7pYJIAoIvv7/2WDzZeZQ0Qw1quH
 is9pTFOY3BgfC5zwK5RrRyFmHZbUhQrWpJzEzUlxQY49hGPO88zp/ZH6wh0E2sGHb/8TJ73fOy+
 qIwTnml8VFq33dNDssQPyksPvqIR1VB539TEQ1kKbuueSxQzPdp8MHic+FdOU3PmOIGdixEan2Y
 9bnLn0+sbkZSJL5y22fN2xoyvxvC7ItUIe+Wz8QQhhU1vGLISOg3joR0OOf7TwsJoeTD/9BcDVC
 yn4tGKiNiIi1vya2gJ8NnUdgnrnLlSdzlYU/VvmApn+ct3Wiw0ta9mfqeH9mP++lDYR/4Dw3niJ
 Xq96c5i9J9PZnPSLo/Y6OZ1KYh5FG6RzqGLaXXJO3VJB4JcZAxFAWmnpL8CyxBchjirCZUZgCL7
 66ZxtqF+Wdz2lpuU/+w==
X-Authority-Analysis: v=2.4 cv=WOjqzXsR c=1 sm=1 tr=0 ts=6af16eaa cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8
 a=izRyMduNiCiu3tceXd4A:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAyNyBTYWx0ZWRfX9EAjpcyP49DW
 TK+UENpFL2j0S7xEm1gzGasYTVnQC4RCMGS6uy+3MxD+kNsgvTsAF5Hx/EhS5P1T/hwYHr4mP4K
 5ZAQ3rh/THoEtkMW6CaTeTqqn6cL81c=
X-Proofpoint-ORIG-GUID: HN9SddjSq5kOVaf5wlT8WGAh1KlYrzII
X-Proofpoint-GUID: HN9SddjSq5kOVaf5wlT8WGAh1KlYrzII
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090027

Hi Bryan,

I think it is safe to move the hw_version() call before reset() in
tpg_set_power().

I have tested this initialization sequence locally, and it passes TPG
E2E validation on both 1180 and 680 platforms.

As for why the issue went unnoticed, on legacy hardware, writing 0 to
TPG_CTRL acts as a switch that disables the TPG before the reset. On
Kaanapali (v2.4.0), TEST_EN has been moved into the TPG_CTRL_CMD
register alongside the HW_RESET bit, so disabling and resetting the
hardware is done in a single write. Our earlier testing on 680 already
showed that the disable step does not interfere with the reset, so the
extra TPG_CTRL write on v2.4.0 is harmless. That is why the tests on
both 1180 and 680 passed and this subtle ordering problem was not
caught.

The reg_update issue will be addressed in a separate series. With that
aside, would it be possible to pick up the v24 Kaanapali series with
this initialization-sequence fix folded in? Thanks a lot.

---
Best Regards,
Hangxiang

On Mon, Nov 9, 2026 at 10:20=E2=80=AFAM Hangxiang Ma
<hangxiang.ma@oss.qualcomm.com> wrote:
>
> On 11/7/2026 11:09 PM, bod@kernel.org wrote:
> > On 2026-11-02 10:52 +0000, sashiko-bot@kernel.org wrote:
> >> Thank you for your contribution! Sashiko AI review found 1 potential i=
ssue(s) to consider:
> >> - [Medium] media: qcom: camss: uninitialized hw_version check in tpg_r=
eset()
> >> --
> >>
> >> commit ea18d39e5144ca1e8d628aa5ab708e84983e10a3
> >> Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> >>
> >> media: qcom: camss: tpg: Add support for v2.4.0 TPG
> >>
> >> This commit adds support for TPG hardware version 2.4.0 on Kaanapali,
> >> controlling test-enable and hardware reset via the TPG_CTRL_CMD regist=
er and
> >> routing the TPG output into CSID 1080 RX through the CSI2 TPG mux.
> >>
> >>> diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/dri=
vers/media/platform/qcom/camss/camss-tpg-gen1.c
> >>> index d29de5f93c18e..cabbb2638cf38 100644
> >>> --- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
> >>> +++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
> >>
> >> [ ... ]
> >>
> >>> @@ -164,18 +167,26 @@ static int tpg_stream_on(struct tpg_device *tpg=
)
> >>
> >> [ ... ]
> >>
> >>>   static int tpg_reset(struct tpg_device *tpg)
> >>>   {
> >>> -   writel(0, tpg->base + TPG_CTRL);
> >>> -   writel(1, tpg->base + TPG_CLEAR);
> >>> +   if (tpg->hw_version < TPG_HW_VER_2_4_0)
> >>> +           writel(0, tpg->base + TPG_CTRL);
> >>
> >> [Severity: Medium]
> >> As reported by Sashiko on v17 [1], is tpg->hw_version initialized when
> >> tpg_reset() is called for the first time from tpg_set_power()?
> >>
> >> In drivers/media/platform/qcom/camss/camss-tpg.c, tpg_set_power() call=
s
> >> reset() before hw_version() populates tpg->hw_version from the
> >> TPG_HW_VERSION register:
> >>
> >> drivers/media/platform/qcom/camss/camss-tpg.c:tpg_set_power() {
> >>      ...
> >>              tpg->res->hw_ops->reset(tpg);
> >>
> >>              tpg->res->hw_ops->hw_version(tpg);
> >>      ...
> >> }
> >>
> >> On the first power-on after probe, tpg->hw_version is still 0, so
> >> tpg->hw_version < TPG_HW_VER_2_4_0 evaluates to true and tpg_reset() w=
rites
> >> 0 to TPG_CTRL even on v2.4.0 hardware. Should tpg_set_power() call
> >> hw_version(tpg) before reset(tpg), or should tpg_reset() read the vers=
ion if
> >> needed?
> >
> > Hangxiang can you have a look at this, seems credible to me.
> >
> >> [1] https://lore.kernel.org/r/20260929061248.E035C1F000FF@smtp.kernel.=
org
> >>
> >> --
> >> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-kaana=
pali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com?part=3D11
> >>
> >
> Hi Bryan, You're right. I had previously argued that the TPG_HW_VERSION
> register always resets to 0x20040000, but that doesn't help here.
> tpg->hw_version is only populated by hw_version(), which tpg_set_power()
> calls after reset(). So on the first power-on after probe, tpg_reset()
> still sees hw_version =3D=3D 0 and takes the legacy path.
>
> This went unnoticed in my local and E2E testing because the extra write
> to TPG_CTRL happens to be harmless on v2.4.0, but the logic is wrong
> regardless.
>
> ---
> Best Regards,
> Hangxiang
