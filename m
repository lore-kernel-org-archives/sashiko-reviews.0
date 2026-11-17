Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794894075;
	b=a/utQVMbl2XvwfW9J1yxrEaTkFrfxe+FKTJxFyhkFXqwvWCXHFnwYhCimkEJTB8d/K4S
	 GebFLct4OWSJunoFa6E7bgNKkkHad9tfnvczEVBjgvWRIuyZ+uwE57CSEJ+ZkMdnyNcQa
	 ruVwWwGCSeup3AvjwbND3KJbDsdAKb7es6O9uqhKKigQql4VbcTUaH5F9yQw8ziJEkt+4
	 /oRIavBubxZgxDIGPZHJhkCoh4XCvFKGbXXHEjchQtEvp03JyklG9aO/gOrxeZmisF/LK
	 Cako7cxac3h17uts/qSDwA/iK9IQ9y68gTquPxgL7k56GxkDKMKYDD4wlAtp28P2eQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794894075;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CWsw73b2Vq6u6SCVqNGoE54KH8eOIZ27G7///Mxj4FY=;
	b=rX6ioWI9mfxBdqUBQsHYzYHf7y1wpvp8glbyMDpUAD/l1S3AzZLwH11mADT8a/xsqqOt
	 OHgd/H15LyywPQazRMXLcAYZpK3RATpX9qWy2PVnRKrY8zUErjzcXFHP3aMED6SYtSv1B
	 U5aKewRHtSZg5YJikRPlBdo+qR2C5tSxWgEl44NJqYLRTRV9d9df7hZex5Nnll18/BFrR
	 gqu0AudIXHLHgPQ/D/OMybYiv1XJMR2SGapkFN9rkvlcZb7SqdDdp5AIBbJiP5ALHZICN
	 11BfHd59f0HfjJI7JljIM2mqUX7tzZ8RsJDtDfngxJRNU/hiUiopZWt3yCrpcgyvRnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WqCU53mP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yc7l0Gv7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD38606A323
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 05:41:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECD38606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WqCU53mP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yc7l0Gv7
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aB1h3624152
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 05:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CWsw73b2Vq6u6SCVqNGoE54KH8eOIZ27G7///Mxj4FY=; b=WqCU53mPdkkWqhjT
	woI14OTwgjQJhQTcJHcsuuGPif6RHEj6xgCMnbS6Cokmnxk86I2C9chL1EmsZgeR
	CLYtKnNKyfhjCOvdsj0l384aOccYBOhNEj/tY633PxqVM6rAUfj0bXZJVuFZURtQ
	y/FsUutng1h/+eyNTmoDqtzG5Slan6D+ybndsm0QFraFuekIZFFIeN2SW8poF+9q
	yKbXd27+1LabZPl5otUk1XmE+SRihZLyflfmOUDxtZ0oBXT2hxSVWf4jCfpVAsM6
	kWsIt/GhVU0hzvzvG+6pi/Pb3zD2ku77WCL590xu11Etsy/P0iPn3DW6xHLyieZ/
	xXkU+A==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j07rej0cr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 05:41:14 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b0d978e4faso63615687b3.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 21:41:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794894073; cv=none;
        d=google.com; s=arc-20260327;
        b=MmlChU70336fEj/WZq/ZGbKaXwKlil/9bzbxpCA2N4qfeBF3g1wR7gusKtSD7ETSik
         fzZ7Eo04qV/flBylKNkUotzQNB6vVpn5qspXaWOY+2gN0X9Mg5Mkof2wBJQW74U45Y1h
         JcTyZUteretvkVwYIsffjFb+/pLEo6YLELyD3jpu8Mwa2S7PaXBKUd+z0K6t0mdvRAYl
         Vw8kpk92KQGpgaqNzX6oCf2cHX5QJWLs0zr9AONtYgaPuqjuKtjUkV4jvbw2wtQbYa8w
         RkuVW7UIlDLKwbP8HRc8uFkjBGSddsaPYKPKAleMHQKI5pNPEAQQDAwLynhDBDMVA3pW
         Sq5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CWsw73b2Vq6u6SCVqNGoE54KH8eOIZ27G7///Mxj4FY=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=fPkrl0+d3AA50Es0WEZkphnFAOR/6N0RLvpKTrTXrrNG+HilVQBBZ/MKz345HLPwf4
         Bn/Tw3aQT6iP1Pj8TnVTR4M3voCgeEpJwnCJUC/lZgwrI1YWSQMXyuvS4hkDjmUv6KN2
         ZIuBoD/AvH3F/3yOXs7UeUkIO+8DWEz6T91lKK5r1XgFQ+rOJbsk+Yw/dbn8fxbd/nBA
         /6FaLuDejDTql3CbNLeZt6DHXMscpsq5IevBBApjv0sChvZK/FjuTanBwBMgwgbIn4gu
         owSXWz7k5qBrOb3omrJv4tXiujxUYUbgCGLhtI/ZmzJTO0RvY8fvcyquveWcgOrgPJFD
         dJSw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794894073; x=1795498873; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CWsw73b2Vq6u6SCVqNGoE54KH8eOIZ27G7///Mxj4FY=;
        b=Yc7l0Gv7IYG3e9kd3uOTHKditTyLVAtIaOD98s7OVtucgJF+RfR6LxacoIcy+1lf22
         9GbqLzNheGQQNQf7kO/9w1r/Md0HweYMVYbugkZIgjDj2vuaFuX41/RqfjUMf7vvaukA
         ePdT2FD0hVvYsPxiZvMORl22EQTs5e1DN10LkW6PiYsDIvajh+W7jjZ6x+JV2+XKVTuw
         N3TG+CZGJe8gGd1tDo7hnqU3ZLavmyNaSkoM7cHjIEcT13AWJAWO2WJThOH6bFKn8hIv
         u+U7FjuTDEHT9XTDc+aOu2aQ1YMIxwOnHyYW/5K8i7UbS3Bx5IpBQhgme+SrVhVp3g2c
         6Fkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794894073; x=1795498873;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CWsw73b2Vq6u6SCVqNGoE54KH8eOIZ27G7///Mxj4FY=;
        b=jGwnmoAUFZ8V7Qlt9oJVdwj5VJhUh8p+nt+Xy/WUGwgJSNj5uJaOWxxGYanlziyEDk
         KA6fFyU1sjPMJVcld8OYNe9cvDKrEdjG2q81ZFNss/8gnKGtXllUvYIxVnKj74sjyMdh
         xb5IqH+eITO6wAffnr+fArpZnuwksgv822/oi4ml42N/ENcc+jj1Uupt08jM5FpcpxUQ
         D7/bixT5lLjxvBVHzDJwINqqd+LxaE9iPTaxvNacQHDvvxbGJi0xNK6lt6qBxr1uLf9x
         VEEdngkkTl29CZ6Qk7jeGUMvOvayK18pIjVIo42WJLZzDwLpp/OQdQyMe8Pw/UEgvZhi
         H9CQ==
X-Gm-Message-State: APuU4Z/fQxWu+1rzXtpREr1U7kXRHzBZ0S2AofKwDib2MwhQ0Aj4hNR6
	fLcFxVs+XZ+eFzvRJg4kOwvHhB+PedwFTwKuHaup/Fr3kasoNXBbnZAzGs10WUQ9uueMFWH03KZ
	pxWGd9NpBTwcGnolMEjE4XiuRr+9pOMIr0wy4ixd0ZHK+PKmJto1OKE9AUpQyzk1OJE239TcsTk
	5E0Oo6PiRFhMgw9ObMBttcyDbq2pyhSrw02EoIRzAfwiBRfIyNBq+TQg==
X-Gm-Gg: AZFdTZc8qOv5oN+euKfRKrRIxh4Q5ZS1cV84WMoP0ZKh6gRlzLCnCRr1e1C2kpans05
	dGPNbnQLMcNvu9DxERtpcmMTxNcYyjO/JOLNgYxaC8kWtrTOTg4FoHVb2lGHMGTseLs1XuaOkX5
	Zc0F7T/802QIA60JsW1oyro2HkX1VV/T9rkaHeJ6bSpSpDNUD3cfjqMXpwtg==
X-Received: by 2002:a05:690c:e286:10b0:8b1:88ad:1fce with SMTP id 00721157ae682-8b4aa299ee7mr45418347b3.42.1794894073268;
        Mon, 16 Nov 2026 21:41:13 -0800 (PST)
X-Received: by 2002:a05:690c:e286:10b0:8b1:88ad:1fce with SMTP id
 00721157ae682-8b4aa299ee7mr45418327b3.42.1794894072911; Mon, 16 Nov 2026
 21:41:12 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116-nvmem-byte-mask-for-split-macaddr-v2-0-96f4a0c08264@oss.qualcomm.com>
 <20261116-nvmem-byte-mask-for-split-macaddr-v2-2-96f4a0c08264@oss.qualcomm.com>
 <sashiko-outbox-216112@kernel.org>
In-Reply-To: <sashiko-outbox-216112@kernel.org>
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 13:41:01 +0800
X-Gm-Features: Aa3M54rkrvooSZ5Y2vrydJgYIgHCwWEjMMkKuuek57KX8x5EuwkLlmYvXurjn9I
Message-ID: <CAPTcHHQq3X=DcJY_NtABvrw3PUhsps0X_DH4PjfK7Cq9ExcphA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] nvmem: core: add byte-mask support for
 non-contiguous cell bytes
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyMiBTYWx0ZWRfX7odMy/ebRBZl
 NO/GqUM4XFM3fg+uWqYuutfR/xTgu9I/gq8V8DWUpf46q+8U/bG8hBgHSwB7yKjZYn09DF7mnmm
 HHpuGrM5OWHwMQdk5f01+sY2XCP3R08=
X-Proofpoint-ORIG-GUID: 5V1ltqKbkAlguvtpWPMBn6OQRIWdlPlf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyMiBTYWx0ZWRfX5VZAzuVd8a99
 Pk/gRzsJdvVapjgfk5tXCbKFhmXRUgHBVuRFaa5AebG3nJONPzdR7pyC2yllbtSTKnCCPhjVKXt
 ZjwzWkpSYL/5hJ02tTY4nAzwtlWCozA78T8t04hWpee/JrrmBFU9Kv//oFR9wVe1yPABUV5HIX1
 UMsoEeOd3HeMcu+l/cEST+hGw8T3b0cO9jZUUD4OQacPaJ17qUXyCnliy5gNg/8sEFK6WlGaKmE
 F1Qp5qsXuP9LDzX6opqqs6JPfLpWcQy6HklT9Ju26xIirg/CE8VZ2yqyHFh7PFrdhXsVYaHlpz5
 4/7bsXkvg9cTiRFNyLS2WMmutWWQJmNeKKnkUn3HPNmFoNdGLlHntOo7yatjC0DLisDhML4qAsy
 6yJnO0fu/+/xmD+g3GR3VW4uny7GgpK1+VX/yyq37TI8LIK3LDj07uNK2oEnle5lD+uF/ZRrV/n
 OduLyrvCnLOsUuoeuSg==
X-Proofpoint-GUID: 5V1ltqKbkAlguvtpWPMBn6OQRIWdlPlf
X-Authority-Analysis: v=2.4 cv=R9uWitRX c=1 sm=1 tr=0 ts=6afbe8fa cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=-ABapGnYS2MAUWs00tMA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170022

>
> > diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> > index 7d4cce8e27424..7e96b84bc4e28 100644
> > --- a/drivers/nvmem/core.c
> > +++ b/drivers/nvmem/core.c
> [ ... ]
> > @@ -603,12 +645,22 @@ static int nvmem_cell_info_to_nvmem_cell_entry_no=
dup(struct nvmem_device *nvmem,
> >
> >       cell->bit_offset =3D info->bit_offset;
> >       cell->nbits =3D info->nbits;
> > +     cell->byte_mask =3D info->byte_mask;
> >       cell->np =3D info->np;
> >
> > +     if (cell->byte_mask) {
> > +             int rc =3D nvmem_validate_byte_mask(nvmem, info);
> > +
> > +             if (rc)
> > +                     return rc;
> > +     }
> > +
> >       if (cell->nbits) {
> >               cell->bytes =3D DIV_ROUND_UP(cell->nbits + cell->bit_offs=
et,
> >                                          BITS_PER_BYTE);
> >               cell->raw_len =3D ALIGN(cell->bytes, nvmem->word_size);
> > +     } else if (cell->byte_mask) {
> > +             cell->raw_len =3D fls(info->byte_mask);
> >       }
>
> [Severity: Medium]
> Should cell->raw_len be aligned to nvmem->word_size here, as the
> cell->nbits branch and nvmem_validate_byte_mask() do?
>
> Leaving cell->raw_len as fls(info->byte_mask) triggers the
> !IS_ALIGNED(cell->raw_len, nvmem->word_size) check just below whenever
> nvmem->word_size > 1 and fls(info->byte_mask) is not a multiple of
> word_size:
yes, this is a real issue, it will left a misleading log like "cell
eth0-mac raw len 7 unaligned to nvmem word size 4".
And if fixup_dt_cell_info callback set the info->raw_len=EF=BC=8C it will
return EINVAL directly.
Should fix it:  cell->raw_len =3D ALIGN(fls(info->byte_mask), nvmem->word_s=
ize);
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
> }
>
> That logs a false error and, if info->raw_len was set (for example by a
> fixup_dt_cell_info callback), fails cell registration with -EINVAL.
>
yes, this is true, need to apply the above fix.


> [ ... ]
>
> > @@ -829,16 +881,27 @@ int nvmem_add_cells_from_dt(struct nvmem_device *=
nvmem, struct device_node *np)
> [ ... ]
> > +             of_property_read_u32(child, "byte-mask", &info.byte_mask)=
;
> > +
> >               info.np =3D of_node_get(child);
> >
> >               if (nvmem->fixup_dt_cell_info)
> >                       nvmem->fixup_dt_cell_info(nvmem, &info);
> >
> > +             if (info.byte_mask) {
> > +                     ret =3D nvmem_validate_byte_mask(nvmem, &info);
> > +                     if (ret)
> > +                             goto err_free_name;
> > +             }
> > +
> >               ret =3D nvmem_add_one_cell(nvmem, &info);
>
> [Severity: Low]
> This isn't a bug, but nvmem_add_one_cell() ->
> nvmem_cell_info_to_nvmem_cell_entry() ->
> nvmem_cell_info_to_nvmem_cell_entry_nodup() already calls
> nvmem_validate_byte_mask(nvmem, &info), so this check in
> nvmem_add_cells_from_dt() is redundant.
>
Yes, better to delete redundant calling to keep changes clean.

pw-bot: cr

Regards,
Hongmei Xu
