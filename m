Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794566078;
	b=u4P/i1zfDywdRoo7aqMwWUFKQdHB7p9xhCxzGKJlbl0Rf3h3tvgfRsArQmUmF0PkphN8
	 d+Khni6lXXGhh4KRHad36m6WlKOW8SiENTFQKfSWPNBZWxgALbRzLwwNlL5/irZeOWeoi
	 ICOs0sN3I/DqSdJ5KWuijJWW4ZBk0tn36wHP2ivGWh35puSvIrMmboeedfYXsZEpoYA/v
	 E+wfCVHCZuHFxQsgx3tJZgaid3cbONVqoImab/jE+XbCtT3bbZSKBbUuUpD5LjsSM8nkX
	 GJaEjaDjrGpXF5RYY+Byi4wu+PMlTTW8VKMYtZ0jF8oDRM9lCmfRnPj8wJoxzKvIt4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566078;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=J1gTyXJtgE80nZ1JcIGP2rgD9HntZP2FMN/BXrOJIRU=;
	b=OFpyxSFuQ05Zvr770HDVoOGQM2fP2SjRgOjQNKlP7cHgpPrVgwOsZavH9Aiky8b2V8hY
	 wHn0xTyqne7dDJ4VpHf/oNQm2RKT5ev4y7m3wr0ennvoGMlelx21p4f/nRq3PzPMLK6aA
	 AafjtFbRcMnIiMtoOuEwFXBv2O0SUsgVJLLIOmz2CJsq+ua7kz9fZ5Xoq+QuBcu8KeSKn
	 Ur8F3Y8+dkb3PlngjYnK27hoNqfPvxaJpcgngMBBpqZzxNWbcvC1ybrR/bd/KCPxAGFAd
	 nUV284S0BDk4Sl9BPjrHYPHcTKdf8Vj9QRGlD8YZaXv8mwMDJ8JkUVhQl9jQgV94AmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V7fBciU8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UpDCZSvj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26720606A882
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 10:34:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26720606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V7fBciU8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UpDCZSvj
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VTix1527768
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 10:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J1gTyXJtgE80nZ1JcIGP2rgD9HntZP2FMN/BXrOJIRU=; b=V7fBciU8NnlxCF+X
	SKN9TAddXBWkfxzQKAiPxTb4Y8r5FshZz8q+Tr38nS45C42nIMoy6DjOkKVhyHy4
	DwCjPGIXddh3UShgtB53gesZglaEN8C4cdc4KJmg1KM+YXS71kjXBmGgjujHFfb2
	jKrjQPaYH3f48vzSBirVCKMlbm5rFMKkyjUKWnrmhUvBiTI48jBViLi5+no4Wvkf
	usG/tRkUKpV+VQpTSl+sET6zy6+Y5LGP9ON4hh+2ymF2JstSPbCxT7GOWd6gVbTy
	lvWQwxY3F7gchkLEplB8X8rzidHJ2Eoea4E/rTb4F90dvNCyYedylVlnA4RNhIEX
	dgFeuw==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hww5r8udf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 10:34:36 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b342ff3967so11286167b3.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 02:34:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794566076; cv=none;
        d=google.com; s=arc-20260327;
        b=HqE6lfqStX0suOkFi6rFcr2D08SypCTyMYrU9AeTubv39hN/kCuK0Z0x4HCaBMc1qs
         Hi+T8Mw6r/tmjhDubcBL9dI/f5a4E3GndRAjCwZ+0iXlKxOxxX3sROZ8d4uWqrHw5kdb
         TMOJHQCaaQidXxHzNnRH3VW4UZ4n1cWb0tXpqEcUyeKQ1xBWZeTrDGtHsH6U2y93Gzja
         VBm0AZrqx9sQ1cWcsV22QSNPNcRYLjZRXfegWXTgp5DkiXfjBC6ZWLYBvciP49qEypc9
         j9OeOmF6mUUhIYg5p1IHbAlkl4d4eYpzv7lU42s+O28Kiwu9HzMpnnA0goJuMQ2wvX1m
         +iGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J1gTyXJtgE80nZ1JcIGP2rgD9HntZP2FMN/BXrOJIRU=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=tAyZIFEFNoHQ92FGFxCU382Ldix4EbNNDvezE0NG3Ff7/FJLkx+/3lAaIChBRP5Jew
         LVW9J9D+hqja/4zyuIoxppJJ2FisPzHRiYQGEeTPo4M+cvkvutXbFhqJBQ90QdzVFfAM
         O9CqMNwn6HJQGR+ljrBi/nEClhPDpZlKBS/I3No2K6D617cOZvji8psGf1C92/iJPHwQ
         p3gy9JjPborA9ILu98ePJGHgdE6WNACYVeBOzhc4tRPpQXrqO271ixoeVKl6fNDdkBKs
         l1rTdHtfvPmBjPRwFzFF2fc9p7yBzYqNzgtyhEISPK+tLw6XiWYArLLycd9Xp3QUq9ge
         4kQw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794566076; x=1795170876; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J1gTyXJtgE80nZ1JcIGP2rgD9HntZP2FMN/BXrOJIRU=;
        b=UpDCZSvjAfJC1hM8PvO01lWUoRXfvURMnzCACOOV5ueHJu1mBcA3LBvRswOJKWHhgV
         JDJRLOQiCd+1bOai6hNRSxFDc00twg61MI14DiCpeoRhxu9McVyeh62YvGo+38dfkhjQ
         JVBQRC+zPXoBNmTBObytDENZP3n8AVHCTC7CkgVdi9NEON5rKNbXymp9bPF/J9NZHLAn
         fYp5MVNagraERV5BskUCO59j/2PrN1HJ52c1PzQ7wIx0lM4Ec4GN2gZxgv+qdRhJBcFi
         n5lyVYTJmf5gkrClYIXe4JS182dzP9jPekPsflpRtBahc/z+NlGnlmNv6nw0IKlb6Kcl
         eNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794566076; x=1795170876;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J1gTyXJtgE80nZ1JcIGP2rgD9HntZP2FMN/BXrOJIRU=;
        b=RhIxkofwdFooCR/SoCpCNLZpwWzARXkohVpsKz87nzo5HSRI5vT4Xxk/54QwtZbQ25
         fXpZYQJflcxoJW33I4Qm1bvrDOFcSezDDcJoOue9LsSzIMjJjEvJ6LlpQ0333NiXUoIR
         NqNt/X4Rb09OvbS4m+car3T1u3kmSKM2t8vfFb/ncY+eaR9+7c7Bpyx2i7SSRfMVmchU
         R7reeDzWk1VWIp/EsvQRMEath1SUqARymg11WrjhoEQFHusiYEFFfFiHYvMgnh4AUxtk
         hYxBii+k+AtYhKnIwNP4BByWELiFr4iJjT7n2+LbGODgYRs+rbH+VOn2qb0oq4h74B/d
         5HCA==
X-Gm-Message-State: APuU4Z/mKKRvwIM0M+irOYAkVJFINLAOIuw1f7yiOyhgWZL2rNN2mMhc
	vE6ySKaoPX8y+bsmJzV4nc/l3ybb9aoDmHcjGGGeRtvF7irnQGKp3oujkLi0wUohu0sFLYlV+tP
	DTiuz0Ens2JxmmesiwrZjhLyuzph43X3oSAJGqNtjbWcXSHaVMNvxDETcyXVBsDeu3M/57iunJ/
	ydx6saeEphFOvyZFgVRsVbUhH/rOZ4D5STU7TApzrRvrxlHZ063LbQ+E0L
X-Gm-Gg: AYBFou2NEtwUrCW71WxqsUJLJzqXczjUqnUk8lz4Ievn7yXOyu74YPTnobdhbj+hqcW
	/D9KgTy3iuBIFboBDUqC1agvcli2m5s2YPVb5IYfoS94ImQ9pztRRUaksCt8iFDJUSZGxmqIm7e
	U8TJTTVgPws13+S1+8XaGcquaSmq++au6u2sh765SPchoTILWsB++BqvWorA==
X-Received: by 2002:a05:690c:6987:b0:8b2:91eb:c0e7 with SMTP id 00721157ae682-8b4aa25cb02mr12149287b3.42.1794566076243;
        Fri, 13 Nov 2026 02:34:36 -0800 (PST)
X-Received: by 2002:a05:690c:6987:b0:8b2:91eb:c0e7 with SMTP id
 00721157ae682-8b4aa25cb02mr12149207b3.42.1794566075784; Fri, 13 Nov 2026
 02:34:35 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261113-nvmem-byte-mask-for-split-macaddr-v1-0-138f715f18c1@oss.qualcomm.com>
 <20261113-nvmem-byte-mask-for-split-macaddr-v1-2-138f715f18c1@oss.qualcomm.com>
 <sashiko-outbox-212383@kernel.org>
In-Reply-To: <sashiko-outbox-212383@kernel.org>
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 18:34:24 +0800
X-Gm-Features: AclHuK8mFpE9OCaW70KMGFFEizMFRzOLaVCmTd0ClizTeV0yD4-mHfi3SBi2t38
Message-ID: <CAPTcHHRjTHoBA1OLeDA5qQ_xzeoTEfxFePEUycgk28ch=KUE-w@mail.gmail.com>
Subject: Re: [PATCH 2/2] nvmem: core: add byte-mask support for non-contiguous
 cell bytes
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX/3/4R+kE9flL
 RpiMpHWj7PmCn3F2+zm/Xkk34sOkmc7pQ4AIp5zKSC3BW/Zm8LzKN0y0lNvWK/DXdXe6cRXk/BN
 l9SA30W+HeoVckhhJmLXjWRLvJ9mMXqFadtpffaUWNLMAHjbkcADuriXy3Y3+8dci4su1Td9s8e
 19bvEeVykfHwMLELvMjDoSn/btxiWBMNJSCJO5BVwY9TroqRh4YglaqTPgp7N4mSd2qCQ+5/lvW
 w1ymbPppw7jn7necfNEPCbpp6XWaRMqvDoTCFUBrTvVV5zFzQhaA9ZSfDPgzWZgJmsL5XLAXMqb
 9bPxtFQ6IBdGp3HMOcmmlGtdiOTsoazz5rliLVjzOXTQ44lsSLZCh+KBS6WPSmWl+639Juehtr8
 YZYMyVtHqcIR4ulBpRMIU+wE2EGgutoEqv6UhVM6c4UqsHhqD3mNbdnonUt5ioAMiQcQEjIiUnu
 WbmTpB1trbA5xEAjHYw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX1PISfRTZrfOc
 pEfjW1mx00rwRStY73ajn2vYZYSNMjSqbK45pCeVfMYSUHAI81tSofqUQkz6CWlGIlxlew+4vC6
 5zGm8nH7HjQA2LIrUUF6ZAEObhcHjYg=
X-Proofpoint-ORIG-GUID: BgGB9m-ZYC-zCKi1Xsrpe2sLLoR0ZxxM
X-Authority-Analysis: v=2.4 cv=Vqq2kO2n c=1 sm=1 tr=0 ts=6af6e7bc cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=i8XU8SuXwj2VLj9jS7kA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: BgGB9m-ZYC-zCKi1Xsrpe2sLLoR0ZxxM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130041

On Fri, Nov 13, 2026 at 4:07=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [High] nvmem: core: byte_mask raw_len reads full device and rounds
>   past size
> - [Medium] nvmem: core: byte_mask validation bypassed when nbits is
>   non-zero
> - [Medium] nvmem: core: missing zero-fill of trailing bytes in
>   __nvmem_cell_read()
> --
>
> commit 2da8dac9e0c0313c6b2e42597b707a19ff863b3a
> Author: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
>
> nvmem: core: add byte-mask support for non-contiguous cell bytes
>
> This commit adds support for a byte-mask cell property that selects and p=
acks
> non-contiguous bytes from an NVMEM region into the logical cell value.
>
> > diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> > index 7d4cce8e27424..6c9994abce39f 100644
> > --- a/drivers/nvmem/core.c
> > +++ b/drivers/nvmem/core.c
>
> [ ... ]
>
> > @@ -603,12 +645,19 @@ static int nvmem_cell_info_to_nvmem_cell_entry_no=
dup(struct nvmem_device *nvmem,
> >
> >       cell->bit_offset =3D info->bit_offset;
> >       cell->nbits =3D info->nbits;
> > +     cell->byte_mask =3D info->byte_mask;
> >       cell->np =3D info->np;
> >
> >       if (cell->nbits) {
> >               cell->bytes =3D DIV_ROUND_UP(cell->nbits + cell->bit_offs=
et,
> >                                          BITS_PER_BYTE);
> >               cell->raw_len =3D ALIGN(cell->bytes, nvmem->word_size);
> > +     } else if (cell->byte_mask) {
> > +             int rc =3D nvmem_validate_byte_mask(nvmem, info);
> > +
> > +             if (rc)
> > +                     return rc;
>
> [Severity: Medium]
> Does placing nvmem_validate_byte_mask() in the else-if branch after
> if (cell->nbits) bypass validation when both nbits and byte_mask are set?
>
bits and byte-mask property are mutual-exclusive.

> cell->byte_mask is copied unconditionally above, so if info->nbits is
> non-zero, nvmem_cell_info_to_nvmem_cell_entry_nodup() takes the
> if (cell->nbits) branch and skips nvmem_validate_byte_mask(). In
> nvmem_add_cells_from_dt(), nvmem_validate_byte_mask() runs before
> nvmem->fixup_dt_cell_info(), which can set info.nbits and info.bit_offset=
 and
> adjust info.offset (as qfprom_fixup_dt_cell_info() does when a cell offse=
t is
> not 4-byte aligned) before nvmem_add_one_cell() runs.
>
Will fix this.

> During __nvmem_cell_read(), nvmem_reg_read() then reads into rawbuf while
> nvmem_shift_read_buffer_in_place() shifts the unwritten buf, and the
> byte_mask loop writes hweight32(cell->byte_mask) bytes into buf without
> bounds validation, corrupting the cell data or overflowing buf.
>
> > +             cell->raw_len =3D nvmem->size - cell->offset;
> >       }
>
bits and byte-mask property are mutual-exclusive.

> [Severity: High]
> Can setting cell->raw_len to nvmem->size - cell->offset cause out-of-boun=
ds
> reads past nvmem->size?
>
> Right below this block, nvmem_cell_info_to_nvmem_cell_entry_nodup() align=
s
> cell->raw_len up to nvmem->word_size:
>
> drivers/nvmem/core.c:nvmem_cell_info_to_nvmem_cell_entry_nodup() {
>     ...
>         if (!IS_ALIGNED(cell->raw_len, nvmem->word_size)) {
>                 dev_err(&nvmem->dev,
>                         "cell %s raw len %zd unaligned to nvmem word size=
 %d\n",
>                         cell->name ?: "<unknown>", cell->raw_len,
>                         nvmem->word_size);
>
>                 if (info->raw_len)
>                         return -EINVAL;
>
>                 cell->raw_len =3D ALIGN(cell->raw_len, nvmem->word_size);
>         }
>     ...
> }
>
> When nvmem->size - cell->offset is not a multiple of nvmem->word_size,
> rounding cell->raw_len up makes cell->offset + cell->raw_len exceed
> nvmem->size, causing __nvmem_cell_read() to call nvmem_reg_read() past th=
e
> end of the device.
>
> Even when aligned, setting cell->raw_len to the rest of the device rather
> than the masked span (at most 32 bytes) forces every read to allocate and
> read the entire trailing region, which fails on providers where reading
> protected or unmapped trailing fuse rows returns an error (such as
> sec-qfprom).
>
Will fix this by just read fls(mask) bytes to avoid reading over-bound.

> [ ... ]
>
> > @@ -1648,28 +1708,51 @@ static int __nvmem_cell_read(struct nvmem_devic=
e *nvmem,
> >                            struct nvmem_cell_entry *cell,
> >                            void *buf, size_t *len, const char *id, int =
index)
> >  {
> > +     u8 *rawbuf =3D NULL;
> > +     void *readbuf =3D buf;
> >       int rc;
> >
> > -     rc =3D nvmem_reg_read(nvmem, cell->offset, buf, cell->raw_len);
> > +     if (cell->byte_mask) {
> > +             rawbuf =3D kzalloc(cell->raw_len, GFP_KERNEL);
> > +             if (!rawbuf)
> > +                     return -ENOMEM;
> > +             readbuf =3D rawbuf;
> > +     }
> > +
> > +     rc =3D nvmem_reg_read(nvmem, cell->offset, readbuf, cell->raw_len=
);
> >
> >       if (rc)
> > -             return rc;
> > +             goto err_exit;
> >
> >       /* shift bits in-place */
> >       if (cell->bit_offset || cell->nbits)
> >               nvmem_shift_read_buffer_in_place(cell, buf);
> >
> > +     /* compact non-contiguous bytes selected by byte_mask */
> > +     if (cell->byte_mask) {
> > +             int out_idx =3D 0;
> > +             int i;
> > +
> > +             for (i =3D 0; i < cell->raw_len && i < 32; i++) {
> > +                     if (cell->byte_mask & BIT(i))
> > +                             ((u8 *)buf)[out_idx++] =3D rawbuf[i];
> > +             }
> > +     }
>
> [Severity: Medium]
> When hweight32(cell->byte_mask) is smaller than cell->bytes, does this le=
ave
> the trailing bytes in buf uninitialized instead of zero-filling them?
>
> Because nvmem_reg_read() reads into rawbuf, buf is only written up to
> out_idx. Callers such as nvmem_device_cell_read() pass a caller-supplied
> buffer directly into __nvmem_cell_read() without pre-zeroing it and retur=
n
> cell->bytes, leaving stale or uninitialized memory in
> buf[out_idx .. cell->bytes - 1] for both cell->read_post_process() and th=
e
> caller.
>
Will fix this by memset the [out_idx..cell->bytes-1].

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-nvmem-by=
te-mask-for-split-macaddr-v1-0-138f715f18c1@oss.qualcomm.com?part=3D2

pw-bot: cr

Regards,
Hongmei Xu
