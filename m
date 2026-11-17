Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794905144;
	b=el/RaqtnT7z03ZKBLEXE2zcJ36DiPVNrmWUxuvfKvctYk6E790Ad2LAIfpF8BEIRC1TV
	 t1Ja1jI4ykIlujAu9u3yMfAgRrm/eEt0K5XnnIT9Q8iZvCCPc0CxIB7bwnSQIS2sMWIbb
	 aMHklUFHefHNl5Dy6RkQApOG1luSa+KwHzAkjyj3bNhlyb91E6Z1NvTouOMGwAqzwwzqY
	 3p5TnPk7C6kkSN0V5qCsft/93hL2KSaptG7Eh48XKMU1GaB/jSA+9o0zy/8bRAao4S+Po
	 bPEeATAXo539d4vO+IMh7gzfS8RiTgSVKnocqh+wz8N8AeSN5ImeB3llDB4zrPLVfow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905144;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cpkGlVy+88a+bdtERyVSo17D0wkYNFyDnapta8BFak0=;
	b=GzaO9IOmtorBEzZO4R9eF6UXygKv8AGp7NsKspzJ5nGnRB9IgVu7xYMIEpnCauCTZFXv
	 XMahq28VKhtYjmEd0pvC2X/c3R35Bgu4VT22U33IcFAWnmqMbtmowhI6g0K97U0vtQ+Ri
	 aKfqVUZ84NTYien3UiHL2Xzr2htUa+cvZcvVxN7eRdrmT5FV+4b5vN0PlKRGaaS9J7b37
	 9w6KCP+cZsxcOCr8nZoVHEirHIGaRp/x/wQq4fhecVUThHa6m8O0jQZkhNXIP3vFI0EdQ
	 b3Hvkormjl+VVqaLCR2pqT4xDfPHmvfu64p0CC7Lq4yrEkZklVuvoKtCxAq9eaPG4LQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CmBA61fa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="UlQy1/IB";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE4C606A8A0
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 08:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDE4C606A8A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CmBA61fa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UlQy1/IB
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH441QO1699110
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 08:45:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cpkGlVy+88a+bdtERyVSo17D0wkYNFyDnapta8BFak0=; b=CmBA61fawsfanpiI
	qp30JZ6FCgmIO9y2S8cC516vknjh3jEWeZ0mVF+NIEw4v2BMiGLXQRCoz8OWLB81
	SuUBqan2Mm2Mo0EZN6D0zmonZSCsRktQb/vlgOBWl6mpwBJbqbg+8uZtWjBDyODB
	3PBMnjAmot6NRjb7RAd4KZYp9BR9ZOV6zLRd7ptB73yTFX8k4CEogkWa1xbDwS7I
	AFRdDwcuavGtlFGzy6JFrwAyuewcv+tWmtXW11GZHek+sQd8vEgPD+J7k1lM0Phc
	GhZEiUuXJZ43jjbHg6X69rF2N6yckBpyM2ypT+UCnHIN4Cozi7xQ2fPhISVQK5P+
	8yp6mg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0fjugyh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 08:45:38 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b0d978e4faso65237547b3.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 00:45:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794905138; cv=none;
        d=google.com; s=arc-20260327;
        b=ZtW+1kGw3+6eQ21nXndw7NA6EssqcTG6imFr8cMdWveXhaJ5+cC1iUl+AOB2sstnMi
         MWQTlHNqpCA2QuuU/9DHGtED1Wq026afD/dMd5sFM+xpKpewHPAFVM29RlWiGSPvnmf8
         h91AFYxpSDCFpm0WlvGL2GaoCoAIjVFEOvgaJhlOiE/s+PNwi8ooXDMKTopbt1hLQoda
         rTI2ASleId0v5wtJ5y7/Nd9mUZ32mDc50+0BphAkjNGK28JljXdnkVufXE3VgXfqnU/a
         R1GGcQbThWTHwMlikJtVEmPQphuhW3ZEjcX/cSFdl/3MJxm046jy3ZctYGdRteqc0CEF
         av5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cpkGlVy+88a+bdtERyVSo17D0wkYNFyDnapta8BFak0=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=FmCD4lD9LNyyYXbYa9xmUGtH1k13R2Yxiic3McFlpZSFpI3vIHE6Vd6bkxpsyv4EIq
         3uT8e7ssv0zfM4BUI1GtkThB3an116IYBJUTmJosJA99cygs/qAJ5GrLOklcnYSiZ+/H
         6XWY+zRljWCrN+XNQS/YubHT9tcEEQ4yRlqAU3HWx7fUUMY4eMsjNvDJ5TJgeuckbB6g
         Z6ChDgUCbtdSJWJI8vBXuL4qHmcMhPEWaPXoGU5l3DM5EEGrX6t0JjEb54ozsqRNuMlR
         0YjcafZl5hYKKXh+91IV83yHeLotZFzuqLtEft8+sB1u0+yfFVUrkRJ8diMu1/ughjh/
         1TCw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905138; x=1795509938; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cpkGlVy+88a+bdtERyVSo17D0wkYNFyDnapta8BFak0=;
        b=UlQy1/IBZGAXUjxWuBfDO+ELJV81NG2623VtcEoZDlizeYdvMcJWRzWKp2nAvBso6H
         LCBApq4ma8KfzaCXGq5x1FOvrQ9TrWzhP7W8iLFiRlre4UUpCU6DVnCYJSK+5c1BLyc4
         lH8b5HGpKrVsZYgJzjyRoAX9+vDWP/fIE60oym2YPsheEWKrqCoI074dQpsgi+dGEGTO
         QOD0DCXHHIALoVXI+jl9MOmz27oW80h6YPXkNR3gsAK3cjxtAYb68j3gBBs0bmIg61ld
         BByU7IQtqtbEk+bOPlC2enVxICw8duZDHBkd2EDpG0tGdJnsQehdylil69iUXWRUDhND
         qauQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905138; x=1795509938;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cpkGlVy+88a+bdtERyVSo17D0wkYNFyDnapta8BFak0=;
        b=2qRBIxp88bm2sRhmj3/mcuoCtSVnvFgDlpVPtm3cZ+CnmkT+idIwinKn0d8AGQq833
         qcetLXBothiWG2gIjLRZj8/rL8DfPWRY0c5LySRSs80oewaevhvxud6XSISlv5LBpNUy
         RFbkMMKWcJmkcVNdHQAlPRg5gfOQGio82Fyl4/5D+aDAsQzHTpZhp/aCqghPJAlIEaDF
         /7F6LMHnxm4XatmlJ0qrniXuwiRVs1dYRM9aq5VLh2UphZMYrkZPhR+KANl4WcmUkbN1
         Zf8HkIJs7C2FpFz5bviwygolgT8W6LNwgVe+Dd/GXnDX8jYyWrjqXCqWsAjjXC9NmjwD
         n7zQ==
X-Gm-Message-State: APuU4Z/LSn0b0UpOfygwKYbNNcK33Fh/ET/dIMrovzpuEg/c0BaJtMcd
	UOIzL14K0U9xRUwjANhld9LL/0k7kOqz2npr7VqvRCqPNvv3F1WxmQc5mDQ5YpN5RBIdsnpQref
	dU/+euvv2GTeNze1RXYcMWLKg7yUXrtGfoj1K2HikE5sWYn4+4epHE994jdcRHW4EtZ06FkXRJh
	F81Viiiuvnj+jZihOfvfLz/Fh1ili/951R4joEVRNgy3jycqaQaShGS0Kk
X-Gm-Gg: AZFdTZcUTPU16k+SfsPw98tfyDNhxExFoE6RtCA94qXbPThevMuiQDvrc7R6KmfOsC9
	DJppLGqxJ5rUqDG+ybGqeuHRpDa4fUNSS/2xin004na8+M+VCWuXVUuRC4DodtUAmbJNki5rBXs
	XgTM0uijd19guzT08r+o9iDS+N882iJYRWKyvq5s0vX71RvPUuNsJWyIUFGQ==
X-Received: by 2002:a05:690c:c6c3:b0:8b3:4122:f464 with SMTP id 00721157ae682-8b4aa2e6c45mr55426707b3.55.1794905137990;
        Tue, 17 Nov 2026 00:45:37 -0800 (PST)
X-Received: by 2002:a05:690c:c6c3:b0:8b3:4122:f464 with SMTP id
 00721157ae682-8b4aa2e6c45mr55426647b3.55.1794905137376; Tue, 17 Nov 2026
 00:45:37 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261117-nvmem-byte-mask-for-split-macaddr-v3-0-c02177658f66@oss.qualcomm.com>
 <20261117-nvmem-byte-mask-for-split-macaddr-v3-1-c02177658f66@oss.qualcomm.com>
 <sashiko-outbox-218243@kernel.org>
In-Reply-To: <sashiko-outbox-218243@kernel.org>
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 16:45:26 +0800
X-Gm-Features: AclHuK-BjraxiQizuRyu_wwBk7IPkDy9t9I88yuWDIxIvdsj0i58hOgBrlEV2kQ
Message-ID: <CAPTcHHR5-ByUxRUdifBO37PJTgLPDzeP6gyTbcdgf2k6BJhpOQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: nvmem: add byte-mask property for
 non-contiguous byte selection
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfXxzStq9SjZ3+B
 30ozQkHyDtCQvrtN7vj22CTFOl7g/KXmEFgRv8KujniMRosbyXEc/Tv93SYsIGBnXJgpj0Jd85i
 TGXwKpGei77nA2BUOtGuJEXcMzy7cIkoPvlmmqzS4zZd+guBys6w23M6mcdDxPiGWQS7ofoL2BV
 +cIaAnAKUG5hcHejwcZgJGUOCoWVZ1R8yLeULIxAcXl4uwPewf44QTkB+EJ8HKXuCj4krhr1TF3
 LYHfEl2Vv7CoGwnLHu/fdZDsqrL1dTaEN9Q5KyFCFzUpiT+PsN7Vd7ttxjHhQU6nkaxKqPRrJOi
 CabYq0kdwY0tb2/CtRODIkIdwe2hubIkirkVQEuqNk3MuEFrynjtt/Wn+UfvL6ax20CM1bH3hux
 nCiKtguUeUm6klneyJ3DEsToCfAdj83Qd+/d7U9wTYoIh0ePK39SdLRaghHGHhjkNq3bpS5EIvS
 Psah3+WFGcY7uzMfWxA==
X-Authority-Analysis: v=2.4 cv=JfIpPkKV c=1 sm=1 tr=0 ts=6afc1432 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=PCVpLA2prkgZY9I6f_AA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-ORIG-GUID: mDsL2yMQq-ydTjW7I4TBYfwgPNNpnGGo
X-Proofpoint-GUID: mDsL2yMQq-ydTjW7I4TBYfwgPNNpnGGo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfXyo28AraqlIK6
 6MAx8LBtat191gc2fxOZuuqcU7Ib5tLYgLJI2IMKbg8N3Uo4GDTL1jgNCUZPr2nBee1AXkgEuXo
 ys3mwf4KzUCNBvvXAnZdvYXl5Wq+ygU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170034

On Tue, Nov 17, 2026 at 2:13=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] dt-bindings: nvmem: byte-mask redefines reg size and reads
>   beyond reg
> --
>
> commit c8ae5b67172a64e8cfa54543074f9aaa24c7c23a
> Author: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
>
> dt-bindings: nvmem: add byte-mask property for non-contiguous byte select=
ion
>
> This commit adds the byte-mask property to the fixed-cell NVMEM binding
> to allow selecting non-contiguous physical bytes within a 32-byte window.
>
> > diff --git a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell=
.yaml b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
> > index 38e3ad50ff4fb..46e1101ee98ae 100644
> > --- a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
> > +++ b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
> > @@ -34,6 +34,20 @@ properties:
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
> > +      packed into the output buffer in ascending byte order. Byte posi=
tions
> > +      are relative to the cell's base offset and limited to a 32-byte =
window.
> > +      The highest set bit must not reference a byte beyond the device =
size.
> > +      The number of set bits must not exceed the cell's logical size g=
iven by
> > +      reg. Cannot be used together with bits. Cells using byte-mask ar=
e
> > +      read-only; write operations are not supported.
>
> [Severity: Medium]
> Does byte-mask redefine the size cell of reg as the logical output size
> instead of the physical address range spanned by the cell in the NVMEM
> device?
>
> In fixed-cell.yaml (such as the bits property right above) and nvmem.yaml=
,
> reg =3D <offset size> specifies the physical address range in the parent
> NVMEM device, and sub-range selection operates within that reg range.  Fo=
r
> any non-contiguous selection of K bytes, the highest set bit H in
> byte-mask is at least K, spanning at least K + 1 physical bytes.
>
> If a DT author sets reg =3D <offset K> to match the logical size, byte-ma=
sk
> reads physical bytes beyond the declared [offset, offset + K) reg range,
> hiding physical address overlaps between sibling cells from DT tooling an=
d
> reviewers.  Conversely, if reg =3D <offset M> covers the full physical sp=
an
> (M >=3D K + 1), the number of set bits is smaller than reg, which leaves =
the
> remaining M - K trailing bytes unspecified in the binding and causes
> consumers expecting a K-byte cell (such as nvmem_get_mac_address() or
> nvmem_cell_read_u32()) to fail on the larger cell size.
>
The choice of reg =3D <offset K> where K =3D popcount(byte_mask) is
intentional: it exposes the logical output size directly in the binding,
so that consumers such as nvmem_cell_read_u32() and
nvmem_get_mac_address() see the correct cell size without any
knowledge of byte-mask.

The physical read window (fls(byte_mask) bytes from offset) does
extend past the reg-declared range, and that is by design.
nvmem_validate_byte_mask() ensures the full physical window stays
within device bounds, so no out-of-device-bounds access occurs.
The overlap concern between sibling cells is real, but it is not new:
the existing framework does not enforce exclusivity between sibling
cell reg ranges in general; DT authors are already responsible for the
hardware layout. byte-mask does not introduce a new enforcement gap.

Regards,
Hongmei Xu
