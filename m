Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794563148;
	b=e/H5ikoh6rgjba1KKYEvRPMxp6U77f7fvrSsKuu3wvgCydRxcA6qfTAbHqFwmUTE7+Dy
	 gOmdtUJtdDlaDh4KI7Jnp+fk4V1qI4Nwo0XI0GoEbKzHkXgSAojYP8An7bWkK5uZDjT3W
	 PzB66aNrDl/SkLlnfzAqhbNoUgcwHnc8//266VvjBLk3kHJVoQMfVlVBBVqFohJeobrsP
	 OaeZCSa5ftODSPdLyR7mWc2PxpaGMazmYEk5nYE5BATbkHQQOueY2w4rFrUboZA/NtPhY
	 E3jclzYorEYgkEUJQ3G5OGb9gfF7Q/6Os/gin0iVJ5s70qKXMCpdM/20kTY1oUlaMeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563148;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tSfUT4sU0xnYAx/hf7+EtPWA5MZ+dVpgyqFniBJTRTU=;
	b=y9ZoWHC4tDopisaIsUin+5IkK6QGyjs+L0FNozqaHSTBPoE8BwkYQfPt304WOYPIHnoK
	 JpH9u7IqFJIEPv4x74/CVXnNwo2+aCyGkVhaowoExy+rP6kOM1zKmNCVpN1PBuKiHTMBY
	 WkRAdF1mIOyaZfrUQHxDEchQwtEfWQs8WDjcJc5PGVm/ztL0LETYBqv/h3nBBFM8Wb875
	 gF6R7LZVf9BeRewCmK84kGkJzMdxnl0k8uxuf0US9inzdJK110UXieOvfjpThBDy/BX3T
	 Zfxe6zgaFGpdpk1FXqsXKrRVi9JsrzFti9Lq42djdXdSqp76NeUpj0jl42efA7iZK+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="OkOD/f9z";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gqTWlPJR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6899606A321
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 09:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6899606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OkOD/f9z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gqTWlPJR
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8V1R73826907
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 09:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tSfUT4sU0xnYAx/hf7+EtPWA5MZ+dVpgyqFniBJTRTU=; b=OkOD/f9zdTuGaP7w
	jqtlskGQUwqjU93rE7hmeAZ+xgb3WMSNvnghDBqcU2ZIzDuOYaZyD7eFalKktnZP
	WPSFCsIsnqm9Dt6VO7tRWHfiCDKq/Bn+iVVWGmQJR06UmRgO7xQr1qC2mgheI52u
	rU1r5dqhcGzJkpAmo7hvyCvfOpjjTLbqZsgyPXntwdVS/L86kjNGzduu0U+865am
	K6QdCDLUfVis4CLFbbnzNwT3yP2gyMsB6Pvid+sF5iLJ9+rWKPqm7sSwypoXapeC
	cbKLzYQdqPgKDI/pvTlLSnl7lidNZa/xRtjFILO2HeR5oR2h9hF7VHH7y73gu8ks
	KioDpQ==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37gypf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 09:45:46 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-6790b1d37e7so1038193d50.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 01:45:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794563146; cv=none;
        d=google.com; s=arc-20260327;
        b=qT5dADzBHbhmK1fhYQTIB6S+ObpBlL1OFKVhYOA4Ve2uiJemLVEYRQrskcoOWHeJNo
         MgGIhdfmWxWSYG5RuJcUQddfU0D3ayytM+ywMlGBr4A4GYojp1Q3RU6fvWkgL8ZCOqeZ
         Wr9qwZq84PP04NPVN8Wg/6wvFvyIz3rhkIIKmvpwYkWeGNEAsLz4gsVSAGjOtUeCiYbo
         XqVwoUOiJ8XGKJw9bSHUyyA9r+7b4Z91vgGozebOVH3pZQdSYp3i3mcNJtN+UPh7BX1f
         HHKujDER9GtKFwQaLwgzc+gkrf3gzahYXrjL7mDs/upzXeIwoVEdLVVEOVZSMaZ/LKVQ
         ARzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tSfUT4sU0xnYAx/hf7+EtPWA5MZ+dVpgyqFniBJTRTU=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=sriSPDGGV0OsY9bB4D2fjoVqP3rN11aISL4J2l3Dot/H15eoPFFiFx9aun5vlX4zj9
         xwW/04P5TMBL9Hp6O+KCUuE8e2Puzv+Xtmw5Yg58H47vXcRzTKorQm3rogEsvyuNuoZH
         i1zw0mKKwUT+4PPjyf3w4nc+vA2tGXrn/qB/kEChVNeLv8aCjpMxsI9PbudX7KgaXgHq
         nfxmDuTv80vjcMbUZiAaRJyc/zO3A+4LQ4D2lc9jUxpWjPcngt9tpthFhRWTEdwM+ct/
         cDLyYX4Yjwt3RTb1rcZRYHLj0BPFjGSk6ti+1aglUiOx+p6UmPpkHDcjgBD+CyY0SzFU
         eoLg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794563146; x=1795167946; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tSfUT4sU0xnYAx/hf7+EtPWA5MZ+dVpgyqFniBJTRTU=;
        b=gqTWlPJRENQzJjHETwD/yMCd1V8syI4Sbdnal+WtXbGpa4OFRvQqFS1Ck8a7i+yg2V
         iaPiYc7XpAJK34vd8IyXSKYHm0H1J0vMLt53Dn37CEqkdzeULD2WRSJOBjpg50VFTsfc
         nNanNvDk9ieK+wXH26JdgOpoMuPrtLjo+3vXzmrvqCGKpP+InjiGHL8fxswpCeo/R6em
         VlPpLCB38UBfBn+chGmAmLhuaHn8EMcYT7oqU12G9EwOkpEfgap2Cvtp63e3QdFAP8Tw
         JgsdES4UZ7lT0+MN52udPkEIP2DXB/yFkVJkjyjvfzy8FI0IinlNLqxJFQfC6V8PUFCd
         4l+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794563146; x=1795167946;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSfUT4sU0xnYAx/hf7+EtPWA5MZ+dVpgyqFniBJTRTU=;
        b=uhy/D+kcihQmoOPYa+lailFt0sH+FreaWWki8lx8VWVE/8V5AcTaMWypahoxToBFAE
         lcLoiUyxFoX4QstspCS2V96wAEyPCjeWfS3/NbW0F7eyG3dPLQjFWvkBJe1navDXvb2L
         KPep21camGbWg68eudZBr2o6+ySAbXYGQSMKoqFCR/vpS9e2zRM3k4rsqG6x7CNxjBha
         RazcC9tZvpIjTWer/XxYEpllgjJAR69c1XC+NoZN6rcGvxAdokIriNchKe0dcpweyRTc
         R2747oH65yQi94DbImix6C2EAPACps0pH0QlGVNxCpEDTck84vK5H5ivF4EswPQkXY8M
         OwUA==
X-Gm-Message-State: APuU4Z9SvL35ki9hEXhP3Cnym68e0dyrdMs3gnyP4495ZSSMJmrwEdHk
	+pXYx7T8n8Oe02xTf+CUJ6ELjCmDUK7l8RaS9a7SCFo07Sy7t30SEgvr0ZRWi/AluLUbEQ1Q3l5
	BgdibmjyE8MK/RUzO6b+vhM53nDSdem6pmxOVzJUIGhQDlY0YcJYUw7qFRkJXzjs/uoxEDQtvxu
	ksxseZdIdHoBd1scSFvr3PZxtrHv/LHp0yLgr06qZbXyZ4aO0ggFhgZLam
X-Gm-Gg: AYBFou0Mt1jGrZv6eHOb/j0yqm0RQIU6g1N4J8abExJn89EhDYEA0ks+kD+6fZgV6vX
	hFRbtzc5gav1icS0yrCQnlZdnA0otx3Xpn5iQyXhZnxmJH15sj0oce6p2tr7XZ168jzYVl3/h0j
	uaSAPZrQVolT2x5qS237BYrJSq58cxRodZy3sjKTZsDDpOqHEpl3SiBPd8hg==
X-Received: by 2002:a05:690e:4086:b0:67c:2350:5b81 with SMTP id 956f58d0204a3-67d895a7c43mr1403136d50.30.1794563146088;
        Fri, 13 Nov 2026 01:45:46 -0800 (PST)
X-Received: by 2002:a05:690e:4086:b0:67c:2350:5b81 with SMTP id
 956f58d0204a3-67d895a7c43mr1403125d50.30.1794563145637; Fri, 13 Nov 2026
 01:45:45 -0800 (PST)
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
 <20261113-nvmem-byte-mask-for-split-macaddr-v1-1-138f715f18c1@oss.qualcomm.com>
 <sashiko-outbox-212378@kernel.org>
In-Reply-To: <sashiko-outbox-212378@kernel.org>
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 17:45:34 +0800
X-Gm-Features: AclHuK89gL7kvEUVcuZW_xgjh-GrEr5sPSzlQ_xFuAhZu-sd_zL4bxOwpTgENQg
Message-ID: <CAPTcHHRXttk+sxr4Bevet3kSNZRD3SU3ma0PRFCEsg89aH_53g@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: nvmem: add byte-mask property for
 non-contiguous byte selection
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzOCBTYWx0ZWRfX5/oOFYVMr6TX
 YgSqEFZ/Xq+4SFD/0viCf960o/ts43ZxOXgwDAC1nNBS/mwQ8eHf+9dUp7nd/cRenq1JXCFyJHh
 innhRGXCpiVBQ2fJ1qWfAH78VMY+wTE=
X-Proofpoint-ORIG-GUID: abG2Jj18KZXFDklmGcV3uB8Vj7DyGHK9
X-Proofpoint-GUID: abG2Jj18KZXFDklmGcV3uB8Vj7DyGHK9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzOCBTYWx0ZWRfX+1iesCG9SSuD
 ntc82ziXukGnHlvibivK9nprfE1seNi8vQmbQqXLXr9jLM+N5+IJW4edXGzn8K45IyPaE/yawq9
 V/kXbR2TFgzuX+JoQCILmN9WbQVvT9Q4SOXMpXRV+fGNNfp87G+ct5i4N3ZxpBjCLhJpizB1nRX
 KDYOj6Th/dnwwkiKps2QjVU6xeGHR/kxNPZFIo0tMDNYgiKiLHfc2lkBZUAIAOq4ndU+/7F8rHO
 zUVCHOFAApVgzZqFruXgeJaRD2S/n/ANFdc6DM5iEasZGoxiP+0Ib680PtO6VjeUPynHWqhXYcA
 5U6nij5OwYf3V5+HZXag5zJLu2MK47Zu9fVbffr5kLAjk7U15Zhw9RgGIdQuqd4dPa74b/A+/9U
 DxmDqz42IM88MCO/dHSE/7T7LQ+5yAraRnUL8GRiZULkXBplMOlE6YemtDlJscMHm+pgKWwTjYs
 Ct57Jci8gl9iMSQT3UQ==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af6dc4a cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=-yBQcdRjb_lw1M2xZpIA:9 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130038

On Fri, Nov 13, 2026 at 4:02=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] dt-bindings: nvmem: byte-mask redefines reg size and accesses
>   beyond reg
> - [Low] dt-bindings: nvmem: missing hardware motivation for byte-mask in
>   changelog
> --
>
> commit f8160f5bc1c29ed4ba48f6d458beb8ca96b09427
> Author: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
>
> > dt-bindings: nvmem: add byte-mask property for non-contiguous byte sele=
ction
> >
> > Add the byte-mask property to the fixed-cell binding. This allows
> > selecting non-contiguous physical bytes from an NVMEM region to form
> > a logical cell value.
> >
> > Bit N set in byte-mask means physical byte N relative to the cell's
> > base offset is included in the output; selected bytes are packed into
> > the output buffer in ascending byte order. If fewer bytes are selected
> > than the cell's logical size given by reg, the remaining output bytes
> > are zero-filled. The number of set bits must not exceed the cell's
> > logical size given by reg. byte-mask and bits are mutually exclusive.
> >
> > Signed-off-by: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
>
> [Severity: Low]
> Could the commit message explain the hardware layout that motivates
> byte-mask? It repeats the property rules from the schema, but does not
> describe which SoC or NVMEM layout splits a logical cell across
> non-contiguous physical bytes or why existing mechanisms such as multiple
> reg entries or a device-specific layout are insufficient.
>
Example and explanation shared in the series cover letter already.

> > diff --git a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell=
.yaml b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
> > index 38e3ad50ff4fb..cddda3f706917 100644
> > --- a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
> > +++ b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
> > @@ -34,6 +34,21 @@ properties:
> >          description:
> >            Size in bit within the address range specified by reg.
> >
> > +  byte-mask:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 1
> > +    description: >
> > +      Bitmask selecting which physical bytes within the NVMEM device r=
egion
> > +      contribute to this cell's output. Bit N set means physical byte =
N
> > +      relative to the cell's base offset is included; selected bytes a=
re
> > +      packed into the output buffer in ascending byte order. If fewer =
bytes
> > +      are selected than the cell's logical size given by reg, the rema=
ining
> > +      output bytes are zero-filled. Byte positions are relative to the=
 cell's
> > +      base offset and limited to a 32-byte window. The highest set bit=
 must
> > +      not reference a byte beyond the device size. The number of set b=
its must
> > +      not exceed the cell's logical size given by reg. Cannot be used
> > +      together with bits.
>
> [Severity: Medium]
> Does byte-mask conflict with standard reg semantics by treating the reg
> size as a logical output buffer size while reading physical bytes outside
> the reg range?
>
> Any non-contiguous selection of K bytes spans at least K + 1 physical
> bytes (highest set bit H >=3D K). A Devicetree author must then either se=
t
> the reg size to K and access physical bytes up to offset + H outside the
> declared reg range, hiding overlaps with sibling cells, or set the reg
> size to the physical span M >=3D H + 1, which pads the output to M bytes =
and
> breaks typed consumers like nvmem_cell_read_u32() that require the cell
> size to match sizeof(*val).
>
reg size is the logical output size, physical access is bounded by the
nvmem device size =E2=80=94 not by reg.
The validation in nvmem_validate_byte_mask() explicitly checks:
if (fls(info->byte_mask) > nvmem->size - info->offset)
    return -EINVAL;

> Defining software zero-padding in reg also puts buffer formatting policy
> into the hardware description, and the binding leaves write semantics for
> cells with byte-mask undefined.
>
will fix this.
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-nvmem-by=
te-mask-for-split-macaddr-v1-0-138f715f18c1@oss.qualcomm.com?part=3D1

pw-bot: cr

Regards,
Hongmei Xu
