Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFA2339B3D
	for <sashiko-reviews@lists.linux.dev>; Sat, 30 May 2026 03:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780110070; cv=pass; b=uOdU/h7xMDOTR88cdMcJ9xGqdbUNgnZW+eTuxN8irPUF/Jh66lvLZTqSRyC0uJPWXWiUdI5TP80x1RxEHNH446A3cTJHm3JhwXSc3OXv+pkQay88savDYBUO8eZzrv+eVY04o6ST95TBh6oMKqCycm88wtgbrusPHV8/HoLout8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780110070; c=relaxed/simple;
	bh=0/Fe2qVwaVDAS/yawKEtBBGMo9kRrZCxGn3LskzENWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IlACrhsGnoF/V4d4lhhgFOGRhpYpBh2iuENvanKdN8hsohRXIYwRd+l9K3eBY3Xr6RFRgoff/XU4jx74aXL70UXOctOEbhz18tg2XNedY1HI/EVHkcUJiuR5uw5qdXgOnaT6JaTbsViyBhHR4gnV+w1wok152CnbBazQX0ymlJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+4U4VWl; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+4U4VWl"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-67c9616b4feso22508623a12.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 20:01:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780110068; cv=none;
        d=google.com; s=arc-20240605;
        b=SAZK4GJnppGiZWxLgvY1oRPXlSw/CURuCRbKHNeMVD3Ye0BybWDGCEGIiQv95ojgG0
         4MtlEsR3BWNhwTgLNiuPs2gakrDkvDO+v1Tq9Is9gA0Clu9oE899b5Is8ee9nGCE+jxZ
         A+tESaa9UNgoSiaF9vHiWD2Yx87K0oE668bEGikPm7euhgA+274VAuyCSt0diaMeyLFH
         hCvYVEkEkg5ZzJfhAzJ1pl1zoJGV3r5xPE0tLy51BsEZXEroFsS4UbuKz1bXlz6knRCJ
         rL7rIDyjkXDAahcDxTzgnL7i9mQhhXcHlnX+zxEP+sYsSZfl8jyG03+lt+HddLSkUJHp
         f0zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KNik6uGAIKHeAdY2s59qweB5n544vrvz8Tr1bg759no=;
        fh=uxg1DeTlxIcX7SJmPf4a6bXzgnn12tX7jZn0ymPupr4=;
        b=hEjTDfe9SBUpOZDC3xGTCRJaYpORzy9WiwyMWLletOtkqPDrqPWpwl4IDziMRfFd/j
         MkbWcVnjS/cg5Qd4eH9GkZsSFSnOZ1mhssdRm/VHcEDLVsBbH4czUSFC2o53TrSsK5t+
         U6X2cPJqB0KQVeXDf61ahiOFPpu61jirKuS81ilgeCmpVmrrKAk+9FR6gCmSkLCS6cSH
         0fViMHyn83AhZZSbPYW+/bH2D9LJc9Dlmfc9zaQ2whULr+jNLBUZXPQA7lW8TV2GY0lz
         wKnOgJHy8ceL6DOvzmr9XDdAgz4i1bVanKjSFAZSkTYI5ekoz85EULJzuB8WcsqMLIP0
         7gvQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780110068; x=1780714868; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNik6uGAIKHeAdY2s59qweB5n544vrvz8Tr1bg759no=;
        b=T+4U4VWl0Z9wh96R2BREcng6MYkME+bgQPwjJOZ+JwCILYncZN7OALL7GU5QaJyt5N
         JVIaiNlMkTl0NS61prOUqY80mEO1u/f/ged769x6JbnwCHGyV0KrF47wQzs77lMZaER/
         DFprpgwoerYamuh2+1UdcwlusuDnN4zwokyHgoWEnwDLmfRqPS8x5WlbH9LWWJ5+LbYD
         aduQOavmq2KArw2HsU6vWEXLz1gvC6NbrXwMJ4ATY5Nrtpy60O+s7Omx3GT3ARnAi2qc
         4CBCMXA2MbplN0oA0qYCjugyLSMyG3Pj/4kXWbDNuWKceQx7iICsdHhmR6nGeC0/6Y9x
         wpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780110068; x=1780714868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KNik6uGAIKHeAdY2s59qweB5n544vrvz8Tr1bg759no=;
        b=RUoyxaPSv/lfbyrE/1arPL1yCfRE/UbBpfcTdE8BUMgMaXppK+XjmPtzUV7lXSQem1
         c6B39ubew3LbFPxgUUCUTyPZmTXCUD0YBHF/14YAOOo2xQgRMKyz4DceWl4Kgk9hVAsb
         q8JcPBJuXbQC0qScEPg04hGJVz0EArj1KvA7LsCSYmYTO4OvQPkPB3P8gDswZ95FI53y
         kzOuNWCvBE5hFtgpnRCyd+nVe5eXhYk4ioDl/yX2bbi4DPR4xp+PTHJZTI3CB0NDKNRy
         3O0iUTQjVm42WgddCigibi3DGoaz2DNQwcEWRmuPo6LmCOrdFJC6PHJXoGjWcPZUeZFq
         KS7A==
X-Gm-Message-State: AOJu0YwgweVFZtmuVAno4eZH4fL3yvMGO1Wt8jM7xhqhtlUgmjjQwWYQ
	R+90bE0IbVihml5k/VNJFUQW55uOLJUxQTxdga6uohOg8ccpgc/SdTt+ZFHY2XSbkv9QwSMkZCH
	w93UbuXRM8SVTRp1igyxQCpbFQOUIGJYDotxK
X-Gm-Gg: Acq92OFWEVUFdE0VduKFrhBoOsMa1G26X/E/XPBrvKFAhTAOUWy7bZA2GgLuV2Z+Meo
	SElrseZiYyEbdDv3JRRRwXxRQ5fzgIDaJTWTGITF4hP/ZHhHu+xtyhQgq6wtYMwA0IEOwciKQI7
	2yPagBxcSDB/uvK5Mke9Hogv2hJizoXSRfp5IIZAxd8+BI5E5wPV/Zhet+j0qC5YFlj97L6N/tA
	nlb9tmA5c0kYF/jnJXjtT8Zc4me7iLZksbbTOCCSR1VNxV1xsjJk9j4dFlnIxmD+RutH0o3rwFr
	P2n4ZlROWfozhoDdWj/sBqf4osKrqLtDdWz5FAFaV+bYKUV03wonbj9tC4QQBE93xrEdsE64817
	6yfU0GQFQGGK2Bhk4Kba7S4dsmHVRU8Mkl8Oe4Rrpp/URmUA0SHupMenWK8A5TfWqZyyA
X-Received: by 2002:a50:8dc6:0:b0:683:5589:4317 with SMTP id
 4fb4d7f45d1cf-68c8ac28472mr904246a12.11.1780110067674; Fri, 29 May 2026
 20:01:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260530012554.68605-1-rosenp@gmail.com> <20260530021906.99C2B1F00893@smtp.kernel.org>
In-Reply-To: <20260530021906.99C2B1F00893@smtp.kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 29 May 2026 20:00:56 -0700
X-Gm-Features: AVHnY4JNVns_ZxjiSOnWuc4Z-pDuYeBnG71JcGa9-SbbhXeIRhWVpkBkr3kz80s
Message-ID: <CAKxU2N_vB9sTyY4dfeA=3TcJcRzskBA=ZcZ1fkP4tE_LQRFC9g@mail.gmail.com>
Subject: Re: [PATCHv2] dma: bestcomm: gen_bd: split struct bcom_psc_params
 from array definition
To: sashiko-reviews@lists.linux.dev
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 7:19=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Inadequate or missing bounds checking on `psc_num` can lead to o=
ut-of-bounds array access in `bcom_psc_params`.
> --
>
> commit c24864efcf21b2526be68d727e70076f6cee258c
> Author: Rosen Penev <rosenp@gmail.com>
>
> dma: bestcomm: gen_bd: split struct bcom_psc_params from array definition
>
> This commit splits the bcom_psc_params struct definition from its array
> declaration to resolve kernel-doc parser warnings. It also adds missing
> members and marks the lookup table as const so it can be moved to read
> only memory.
>
> > diff --git a/drivers/dma/bestcomm/gen_bd.c b/drivers/dma/bestcomm/gen_b=
d.c
> > index 8a24a5cbc2633..61b5746e1a972 100644
> > --- a/drivers/dma/bestcomm/gen_bd.c
> > +++ b/drivers/dma/bestcomm/gen_bd.c
> > @@ -254,17 +254,23 @@ EXPORT_SYMBOL_GPL(bcom_gen_bd_tx_release);
>
> [ ... ]
>
> > -static struct bcom_psc_params {
> > +struct bcom_psc_params {
> >       int rx_initiator;
> >       int rx_ipr;
> >       int tx_initiator;
> >       int tx_ipr;
> > -} bcom_psc_params[] =3D {
> > +};
> > +
> > +static const struct bcom_psc_params bcom_psc_params[] =3D {
>
> [Severity: High]
> This is a pre-existing issue, but does this fixed-size array expose an
> out-of-bounds access?
>
> The array strictly contains 6 elements (indices 0 through 5). However,
> bcom_psc_gen_bd_rx_init() checks the psc_num index against
> MPC52xx_PSC_MAXNUM:
>
> drivers/dma/bestcomm/gen_bd.c:bcom_psc_gen_bd_rx_init() {
>         if (psc_num >=3D MPC52xx_PSC_MAXNUM)
>                 return NULL;
>
>         ...
>         bcom_psc_params[psc_num].rx_initiator,
>         ...
> }
>
> If CONFIG_PPC_MPC512x is enabled, MPC52xx_PSC_MAXNUM can be 12, allowing =
an
> index up to 11 to access the 6-element bcom_psc_params[].
>
> Additionally, bcom_psc_gen_bd_tx_init() appears to perform no bounds chec=
king
> on psc_num at all before indexing this array. Callers like
> mpc5200_audio_dma_create() can pass an unvalidated cell-index from the
> device tree directly into these functions.
>
> Can a malformed device tree trigger out-of-bounds memory reads here, lead=
ing
> to out-of-bounds MMIO writes when using the read garbage as the initiator
> and ipr?
Fixed in different patch.
>
> >       [0] =3D {
> >               .rx_initiator =3D BCOM_INITIATOR_PSC1_RX,
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530012554.68=
605-1-rosenp@gmail.com?part=3D1
