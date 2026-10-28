Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793157954;
	b=Y6ppU+tFFQnZv+RDoa9yqi+as2t/59T/VU+Nmjik7tlWf3zFVcAioir6JDdBeykBzLBS
	 Psa1ImLFypkjjPHJJQS4ja5pkYtN4Bo38a5vmuAirIkVLuTblFmohx4hFN0Y8TxWUk+4T
	 vNmIjNdIO1CcR4bn9vzwa9msYfpJQ9zEX+2B5e4XTrjWc29rd/to959wOwNvNWItgam5K
	 CPbFthq6/1XtCtXLJp/3ZDmKDbhZwJ5Noaaa+D5rKzc5KAxdUmIyuuH5K8yjFhBPCmBty
	 ItKeRXC/aYukQFBt56VBeu8f5kvH+hq6wGus4EOZJl+u0+oCI1hUMJe/9rsRNWd9zlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793157954;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ik1wtcr+NKJTmFtuJsEiILJ0oVc4nKpEh2rBWEmU/Fw=;
	b=h5bQ2Hpfn6E2MJixCEK5enJPr/0+I5S4dAhIb5cZZfHHBerdeUnBFQ1VseXtG9p0ZOzp
	 VJa3Mx9Yina7Z5QyKvXDgcsmzKRMkmD6As1ba65ksNTk6akv8QVIHsE4WloY1qPmq8XRm
	 ujOgjs9dTKa3JEJZ48bogIxfLyaIwMSzqOl3CsODUqaFHaqEZIwCdtQ1qBRP+uya1+Ifv
	 3ClQC8Eo2pP0yqlPbI5enk3E17TYleAwFGAjukTgoBqNrccslFkY4vLt6DMx+ZOldpa8O
	 8HXSoX2wRv+9dTNT0rWPSaOTQFMqeJw0R8flUNvKRooNCHvpzOvnKxbtNKrIjEbCaXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CRMyVG8n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dl4SQ+jN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D5A606A31D
	for <sashiko-reviews@lists.linux.dev>; Wed, 28 Oct 2026 03:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41D5A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CRMyVG8n;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dl4SQ+jN
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S0j9QH3459222
	for <sashiko-reviews@lists.linux.dev>; Wed, 28 Oct 2026 03:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ik1wtcr+NKJTmFtuJsEiILJ0oVc4nKpEh2rBWEmU/Fw=; b=CRMyVG8nypcOcvFB
	Ub5r8YSDqCYRKSiPMdEbe/vgfSqdADOpyJINnjrJ57SIZf27qGMrm6UqaCM2JVRe
	QwiJ7UQAYA/CrYSAc6A+ol1JbxUU2q4om2aCa6temfKnz9uJj2u/Ix/8nTU8TgDO
	wfPzM69mgb1mLmPZu4m2lgpprc5T5nEbmAeAgqmz1GkVDlEgfE2QHjEDz02aNlU4
	dwokAFZnqUtjlAGNLrba2HSW2hQYsxuHbeUr+tWD4Ay5YHXxRDrAquSjQ5rPEsvx
	wm66AtoAQG09bTSljoOMdscwc4k9zdkwwiHiAsOHImAR1pV8PPetQDVV5I+YXeEU
	eCZr6A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be0hv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 28 Oct 2026 03:25:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad98380ccfso987910a91.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 20:25:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793157952; cv=none;
        d=google.com; s=arc-20260327;
        b=k8/nSUdm14b8EKwGg3EdYbSgS0+LW+7kLe/ThLqygPzvLuTRxhpGNn9St2gnkrduO2
         p8F1KFi/iwdQ9oEuQTNfPVHTzhQHaDIox4GAmKSUCmlZm9C0ohMg9GIMhwZCFfXyGep3
         h1uaB7eBhiOs3OzNqdYNoFxQ5cptc7hOUxZYceX+ABK5rQ7IPl/QP/AArnKK9GpABlfV
         LR73h2KdJQ1Pqr4LcjjTRSN5MXdTowjT97IMt8xxsDaXJg+zefE/PS7T6vFq+7+nwEky
         LCzngFuWpDUxDOfYjri57802Md0SQhfm9z7ZdiSQWJHC1y04lhZWDIf1xJWouSDpts8+
         sH5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ik1wtcr+NKJTmFtuJsEiILJ0oVc4nKpEh2rBWEmU/Fw=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=O2J/AGL8dspcOOn+VYuGABoEz0Vosmbqmu1r/M+WMTSKao/UbJeUYmXgPPzVFnJ58Z
         Mgr78hhn0CsCGki/h+snyo8j1VuOwwZfX5J4er4MOHAdSQ8LzYp5dDMT02fQq6iiZV6u
         RYCjZoNf6nb1TRPfw10j6D9alf+OCM0yTs+1iy9OwpAuAQcWE/mIqzXPUMVIGxNzyZRf
         BhcSWKx8THc5Y5PDdMUh9l8mzWZsEWdSeAXF40q5ZNOOmpi+JhT0akb4HTtq9DZWIriZ
         /6LDOlI05Bu2bv8AHC56f5P5GIgVAldd19UjSc0w+G8R23I34FnpiXQ2oIhjJPb9eM+A
         JRGw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793157952; x=1793762752; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ik1wtcr+NKJTmFtuJsEiILJ0oVc4nKpEh2rBWEmU/Fw=;
        b=Dl4SQ+jNHobEJBRT6vBWVspHaW84JLJMmkifB8z47qaa8sQwCf6T9Md8bzsx3PAm5P
         Yy9TJDiuuEloMyD13Hjm3zaXTedWU6nXhtgCUE+7JKT1hnNz4J9DlBEGzzxhkoVzfTcF
         byOTGDUkYjtVoURaewTggjgo4N8JXKRmvFMA2uW77BlP6m4MBMUBOWJ4idW9caaRKMur
         3QEAmKQCgpzi8goK5mQ0GI08TwNcihhw57b9oggGct7UDLcoe1G26pqA9PV9i+5GecTB
         hY68u2+AffJyUNFyh3A015CENJc4VTwI4UVn9gpDk3JJHlXlBd5H8/N+fgOgtlumkT4w
         YgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793157952; x=1793762752;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ik1wtcr+NKJTmFtuJsEiILJ0oVc4nKpEh2rBWEmU/Fw=;
        b=bqkVMQADCFchmddZyEvf4LOsjLoGgr99fDnVhGZ1nIYjBuednP7xK6VEbgejeZ4jy8
         Yq5ABhw4bXKM6tIzgDwkfU2ImVRSusfcKHaxEFiRFXGMGpeN8zUK/z0mBOjhtK6a4HUG
         IkOVf+QIEFtZfSCd4cfBWnE63xuS+vRYrro3gFT16lYtWqsmsFDrWCTYxZeSs/l+7p5w
         Ud+0Hk5OAXsIWATpmb4F0eg2vtTQgMdEFQWBpGzy/3LzFOhb4P/RWU42qUReAmiDVYbe
         ysFOVGI8RCYL0Y983MZWCGOPJ+U34VSiEC3lBLecmnmMSYvSYD8plejR0ZSzR6TRTJvm
         2v3g==
X-Gm-Message-State: AFq9FYIMCUGqFRnITQ55YUhDJFGUVxlsEX2IDyby9DAe+FmgTqjPoNwj
	pSeNbRoHApWbnNpWwVdq6W/7YAykugj9gvE+0QEc1+drRKRooYlCqMqD7p0NfHfIf87jVCBn28d
	3nAAA/mb3d83BGV4rm8VqnefSiovXI8lNPJzbS37iQIVVPtAEg/HndgLpz64NFs0wMACp0ALfDI
	E/FzMKWS2ey3XxbX/0nz28ocKAmE6VyENkpM2PDr5YQu25Bv2CV4LawsUr
X-Gm-Gg: AYBFou0Euwl5sq40YXOdqK3JdGyWtR1y0c0k+EK5LUY8Hiej+Fz0ktDTjFXutqJ8D6i
	+YlpBtJrhr7cV5iwdjdjs8brO8zzLr3pPdB6k8F8eqENz+HMvRTOxrDD7v/hmNW/diQTy+K1UbO
	rX0vE1knxQS+HW31/12jPCxviaXiWUDPJTWsh7Cq9aE3bOnK3JgilVxk4v9Q==
X-Received: by 2002:a17:90b:4f49:b0:39e:6d82:dca with SMTP id 98e67ed59e1d1-3ae580a0249mr776239a91.30.1793157951935;
        Tue, 27 Oct 2026 20:25:51 -0700 (PDT)
X-Received: by 2002:a17:90b:4f49:b0:39e:6d82:dca with SMTP id
 98e67ed59e1d1-3ae580a0249mr776231a91.30.1793157951452; Tue, 27 Oct 2026
 20:25:51 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261026082534.986449-1-zhangfei.gao@oss.qualcomm.com>
 <20261028024720.981971-1-zhangfei.gao@oss.qualcomm.com> <sashiko-outbox-187372@kernel.org>
In-Reply-To: <sashiko-outbox-187372@kernel.org>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 11:25:40 +0800
X-Gm-Features: AclHuK-X1worEDE-LrizB5KJOhDEFNbcQ4ChFZVOZ7LKlvmZyY-ar17uwMFvve0
Message-ID: <CAFkd8htETPX10Ohkff_e245jzd-JizQMc6nZTpxPwPO51stsbg@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: qcom: audioreach: support multichannel PCM formats
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: yubgPaKkvX6UAKb54xfW4d9RAIIJFQB8
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae16b40 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=KEe7bkdQAAAA:20 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=W4RJyTomHAAiTDpn_5IA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAxMyBTYWx0ZWRfXwF5QdYoEsQ/Z
 jsTKvox0Ewxmk0N+syjNgGhQ3W13CgWmH+WLF+AV65X2UrIfGzWnhWIO2DzcolnMlU3G7r5ergQ
 l8eI+XgnIWFY2UAHKbRefqQA58ZafSM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAxMyBTYWx0ZWRfXySNCXcr0pp9P
 BsTUgCC26QItnBg5vJT7APHzdM3jC4866K99MLSSbHw/TjbP0G5hAkBAvnywVVh42fZzu/ba9hD
 YGIt7yXbMaW0y64THFSokoaVXS3fH9OHcJj1mzMYKyrrOq/Dk5hBDYLXIXi0nLQbFbaN6tRxa86
 SJeL3TxAfife4fJQ0fPRVJKwT98I1r16nnAakTt4hAU2XnvHg5/bciZ8rKL38aYKrsNR4BcXTF7
 rU1kGW05ztbgCxQIOxXEKTXCejm5xCxFaSJs4P4761bqIOA0iqYbDKeEBuEVZ75ntn8no6ENNnS
 O2b3vAMMrH9wAZzOmKFbFvyvOUAngLxaftfbfQIsH3nYPnf04UFi5+WJGIvJrSXVeIAcwCsDazW
 k+GF0Dzd4SEKoCZiXpvygOUrp3eTWD4lP1udoaRS3yw7zkSbjQ/XiJDPP7RmKL7iODxlTOlg0Gx
 K64aY9NEM4bQDDYMSrw==
X-Proofpoint-GUID: yubgPaKkvX6UAKb54xfW4d9RAIIJFQB8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280013

On Wed, Oct 28, 2026 at 11:05=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] ASoC: qcom: audioreach: 1-channel mapping changed from FL to F=
C by q6dsp_map_channels()
> --
>
> commit ec2c026fe429a34883e53d19ea1d90d34c838cea
> Author: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
>
> ASoC: qcom: audioreach: support multichannel PCM formats
>
> This commit removes the 4-channel limit in the AudioReach PCM and shared
> memory media format paths and replaces audioreach_set_default_channel_map=
ping()
> with q6dsp_map_channels() and PCM_MAX_NUM_CHANNEL.
>
> > diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/a=
udioreach.c
> > index d2dc5d37bccf8..e6f077a5b750f 100644
> > --- a/sound/soc/qcom/qdsp6/audioreach.c
> > +++ b/sound/soc/qcom/qdsp6/audioreach.c
> > @@ -306,22 +306,6 @@ void *audioreach_alloc_apm_cmd_pkt(int pkt_size, u=
int32_t opcode, uint32_t token
> >  }
> >  EXPORT_SYMBOL_GPL(audioreach_alloc_apm_cmd_pkt);
> >
> > -void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channe=
ls)
> > -{
> > -     if (num_channels =3D=3D 1) {
> > -             ch_map[0] =3D  PCM_CHANNEL_FL;
> > -     } else if (num_channels =3D=3D 2) {
> > -             ch_map[0] =3D  PCM_CHANNEL_FL;
> > -             ch_map[1] =3D  PCM_CHANNEL_FR;
> > -     } else if (num_channels =3D=3D 4) {
> > -             ch_map[0] =3D  PCM_CHANNEL_FL;
> > -             ch_map[1] =3D  PCM_CHANNEL_FR;
> > -             ch_map[2] =3D  PCM_CHANNEL_LS;
> > -             ch_map[3] =3D  PCM_CHANNEL_RS;
> > -     }
> > -}
> > -EXPORT_SYMBOL_GPL(audioreach_set_default_channel_mapping);
> > -
>
> [ ... ]
>
> > @@ -1436,7 +1410,7 @@ static int audioreach_speaker_protection_vi(struc=
t q6apm_graph *graph,
> >
> >       cm_cfg->cfg.num_channels =3D num_channels * 2;
> >       /* Convert the physical mapping to a logical mapping of the chann=
els */
> > -     for (i =3D 0, j =3D 0; i < AR_PCM_MAX_NUM_CHANNEL && j < num_chan=
nels; i++) {
> > +     for (i =3D 0, j =3D 0; i < PCM_MAX_NUM_CHANNEL && j < num_channel=
s; i++) {
> >               if (!mcfg->channel_map[i])
> >                       continue;
> >               /*
>
> [Severity: Medium]
> Does replacing audioreach_set_default_channel_mapping() with
> q6dsp_map_channels() cause a regression for 1-channel streams?
>
> Previously, audioreach_set_default_channel_mapping() mapped num_channels =
=3D=3D 1
> to PCM_CHANNEL_FL (1). In sound/soc/qcom/qdsp6/q6dsp-common.c,
> q6dsp_map_channels() instead maps 1 channel to PCM_CHANNEL_FC (3):
>
>         switch (ch) {
>         case 1:
>                 ch_map[0] =3D PCM_CHANNEL_FC;
>                 break;
>
> When a 1-channel stream is configured through q6dma_hw_params() in
> sound/soc/qcom/qdsp6/q6apm-lpass-dais.c or q6apm_dai_prepare() in
> sound/soc/qcom/qdsp6/q6apm-dai.c, cfg->channel_map[0] is now set to
> PCM_CHANNEL_FC (3) instead of PCM_CHANNEL_FL (1) for
> audioreach_mfc_set_media_format(), audioreach_pcm_set_media_format(), and
> audioreach_shmem_set_media_format().
>
> In addition, audioreach_speaker_protection_vi() in
> sound/soc/qcom/qdsp6/audioreach.c computes the Vsense and Isense channel
> mapping as:
>
>                 /*
>                  * Map speakers into Vsense and then Isense of each chann=
el.
>                  * E.g. for PCM_CHANNEL_FL and PCM_CHANNEL_FR to:
>                  * [1, 2, 3, 4]
>                  */
>                 cm_cfg->cfg.channel_mapping[2 * j] =3D (mcfg->channel_map=
[i] - 1) * 2 + 1;
>                 cm_cfg->cfg.channel_mapping[2 * j + 1] =3D (mcfg->channel=
_map[i] - 1) * 2 + 2;
>
> With mcfg->channel_map[0] set to PCM_CHANNEL_FC (3) on a 1-channel stream=
,
> this produces [5, 6] instead of [1, 2]. Is PCM_CHANNEL_FC intentional for
> mono AudioReach streams and speaker protection VI?

Yes, PCM_CHANNEL_FC is expected and audioreach_speaker_protection_vi()
should not be an issue here. It derives the VI channel mapping from
the PCM channel id.

Have checked with Rafi, mono should use PCM_CHANNEL_FC.

Also confirmed from audioreach-engine
https://github.com/AudioReach/audioreach-engine/blob/master/modules/process=
ing/bassboost/capi/src/capi_bassboost_utils.cpp
  case 1:
         if (PCM_CHANNEL_C !=3D format_ptr->format.channel_type[0])

https://github.com/AudioReach/audioreach-engine/blob/master/modules/process=
ing/Virtualizer/api/Virtualizer_api.h
  uint16_t channel_map[0];
  /**< @h2xmle_description  { Payload consisting of channel mapping
information for all the channels. \n
                              The channel mapping is specific for
specific number of channels \n
                              for 1 : [PCM_CHANNEL_C] \n
                              for 2 : [PCM_CHANNEL_L, PCM_CHANNEL_R] \n }

Thanks
